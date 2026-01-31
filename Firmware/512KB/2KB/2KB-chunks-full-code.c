/*
 * SHA-256 implementation for experimentation on RL78 with LLVM.
 *
 * Features:
 *  - SHA state stored as global bytes: g_sha_state[32].
 *  - Bit operations on that state expressed as:
 *        g_sha_state[idx] |= (1u << bit);
 *        g_sha_state[idx] &= ~(1u << bit);
 *    so that RL78 backend can turn them into SET1 / CLR1 at -O3.
 *  - No memcpy/memset; uses simple byte loops.
 *
 * This is NOT re-entrant (uses global context), which is fine for
 * experimentation and cycle counting on RL78.
 */

#include <stdint.h>
#include <stddef.h>

/* ============================================================
 * Global SHA-256 "context" stored explicitly
 * ============================================================ */

volatile uint8_t  g_sha_state[32];  /* 8 × 32-bit words = 32 bytes (big-endian) */
uint64_t g_sha_bitcount = 0;
uint8_t  g_sha_buffer[64]; /* 512-bit block buffer */

/* ============================================================
 * Local "mem" helpers (no libc dependency)
 * ============================================================ */

static void memzero_u8(volatile uint8_t *dst, size_t len)
{
    size_t i;
    for (i = 0; i < len; i++) {
        dst[i] = 0;
    }
}

static void memcpy_u8(volatile uint8_t *dst, const uint8_t *src, size_t len)
{
    size_t i;
    for (i = 0; i < len; i++) {
        dst[i] = src[i];
    }
}

/* ============================================================
 * Bit helpers on GLOBAL SHA STATE bytes (SET1/CLR1 candidates)
 * ============================================================ */

/* Pure C version that should generate LOAD/OR/STORE or LOAD/AND/STORE on g_sha_state[] */

static inline void sha_state_set_bit_raw(size_t byte_index, uint8_t bit)
{
    uint8_t mask = (uint8_t)(1u << bit);
    g_sha_state[byte_index] |= mask;             /* pattern: should be SET1 candidate */
}

static inline void sha_state_clear_bit_raw(size_t byte_index, uint8_t bit)
{
    uint8_t mask = (uint8_t)(1u << bit);
    g_sha_state[byte_index] &= (uint8_t)~mask;   /* pattern: should be CLR1 candidate */
}

/* Optional: if your RL78 toolchain supports __builtin_rl78_set1/cls1, you can force them:

static inline void sha_state_set_bit(size_t byte_index, uint8_t bit)
{
#if defined(__RL78__) || defined(__GNURL78__) || defined(__llvm_rl78__)
    __builtin_rl78_set1((char *)&g_sha_state[byte_index], (char)bit);
#else
    sha_state_set_bit_raw(byte_index, bit);
#endif
}

static inline void sha_state_clear_bit(size_t byte_index, uint8_t bit)
{
#if defined(__RL78__) || defined(__GNURL78__) || defined(__llvm_rl78__)
    __builtin_rl78_clr1((char *)&g_sha_state[byte_index], (char)bit);
#else
    sha_state_clear_bit_raw(byte_index, bit);
#endif
}

*/

#define SHA_STATE_SET_BIT(byte_index, bit)   sha_state_set_bit_raw((byte_index), (bit))
#define SHA_STATE_CLEAR_BIT(byte_index, bit) sha_state_clear_bit_raw((byte_index), (bit))

/* For convenience: map (word_index, bit_in_word 0..31) -> (byte_index, bit_in_byte 0..7)
 * Here we store words big-endian in g_sha_state, like SHA-256 spec.
 *  word_index ∈ [0,7]
 *  within each 32-bit word, bytes are [0..3]: state[4*word + 0] .. [4*word + 3].
 *  For bit k (0..31), bit 31 is MSB of byte 0, bit 0 is LSB of byte 3.
 */

static inline size_t sha_state_byte_index(unsigned word_index, uint8_t bit)
{
    /* bit 31..24 -> byte 0, bit 23..16 -> byte 1, bit 15..8 -> byte 2, bit 7..0 -> byte 3 */
    uint8_t byte_in_word = (uint8_t)((31u - bit) >> 3);   /* 0..3 */
    return (size_t)(word_index * 4u + byte_in_word);
}

static inline uint8_t sha_state_bit_in_byte(uint8_t bit)
{
    /* map bit 31..0 to bit position 7..0 in the selected byte */
    uint8_t pos_in_word = (uint8_t)(bit & 7u); /* 0..7 */
    return (uint8_t)(pos_in_word);             /* still 0..7; MSB->bit7, LSB->bit0 */
}

/* Optional "probe" function: uses SET+CLEAR on a state bit but restores original value.
 * Called from sha256_init() so it won't be optimized away easily and gives you a place
 * you can inspect assembly for SET1/CLR1 generation.
 */
static void sha256_bitop_probe(void)
{
    uint8_t saved = g_sha_state[0];

    /* Example: set and clear bit 4 of first state byte.
       Net effect is no change (we restore 'saved'), but ensures bit patterns exist. */
    SHA_STATE_SET_BIT(0u, 4u);
    SHA_STATE_CLEAR_BIT(0u, 4u);

    g_sha_state[0] = saved;
}

/* ============================================================
 * Endian helpers for SHA-256 (big-endian words)
 * ============================================================ */

static uint32_t load32_be(volatile const uint8_t *p)
{
    return ((uint32_t)p[0] << 24) |
           ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8)  |
           ((uint32_t)p[3]);
}

static void store32_be(uint32_t x, volatile uint8_t *p)
{
    p[0] = (uint8_t)(x >> 24);
    p[1] = (uint8_t)(x >> 16);
    p[2] = (uint8_t)(x >> 8);
    p[3] = (uint8_t)(x);
}

/* Access words in g_sha_state as big-endian 32-bit values */

static uint32_t sha_state_get_word(unsigned idx)
{
    const volatile uint8_t *p = &g_sha_state[idx * 4u];
    return load32_be(p);
}

static void sha_state_set_word(unsigned idx, uint32_t v)
{
    volatile uint8_t *p = &g_sha_state[idx * 4u];
    store32_be(v, p);
}

/* ============================================================
 * SHA-256 core functions and constants
 * ============================================================ */

static const uint32_t sha256_initial_state[8] = {
    0x6a09e667u, 0xbb67ae85u, 0x3c6ef372u, 0xa54ff53au,
    0x510e527fu, 0x9b05688cu, 0x1f83d9abu, 0x5be0cd19u
};

static const uint32_t K[64] = {
    0x428a2f98u, 0x71374491u, 0xb5c0fbcfu, 0xe9b5dba5u,
    0x3956c25bu, 0x59f111f1u, 0x923f82a4u, 0xab1c5ed5u,
    0xd807aa98u, 0x12835b01u, 0x243185beu, 0x550c7dc3u,
    0x72be5d74u, 0x80deb1feu, 0x9bdc06a7u, 0xc19bf174u,
    0xe49b69c1u, 0xefbe4786u, 0x0fc19dc6u, 0x240ca1ccu,
    0x2de92c6fu, 0x4a7484aau, 0x5cb0a9dcu, 0x76f988dau,
    0x983e5152u, 0xa831c66du, 0xb00327c8u, 0xbf597fc7u,
    0xc6e00bf3u, 0xd5a79147u, 0x06ca6351u, 0x14292967u,
    0x27b70a85u, 0x2e1b2138u, 0x4d2c6dfcu, 0x53380d13u,
    0x650a7354u, 0x766a0abbu, 0x81c2c92eu, 0x92722c85u,
    0xa2bfe8a1u, 0xa81a664bu, 0xc24b8b70u, 0xc76c51a3u,
    0xd192e819u, 0xd6990624u, 0xf40e3585u, 0x106aa070u,
    0x19a4c116u, 0x1e376c08u, 0x2748774cu, 0x34b0bcb5u,
    0x391c0cb3u, 0x4ed8aa4au, 0x5b9cca4fu, 0x682e6ff3u,
    0x748f82eeu, 0x78a5636fu, 0x84c87814u, 0x8cc70208u,
    0x90befffau, 0xa4506cebu, 0xbef9a3f7u, 0xc67178f2u
};

static uint32_t rotr32(uint32_t x, uint8_t n)
{
    return (x >> n) | (x << (32u - n));
}

static uint32_t shr32(uint32_t x, uint8_t n)
{
    return x >> n;
}

static uint32_t Ch(uint32_t x, uint32_t y, uint32_t z)
{
    return (x & y) ^ (~x & z);
}

static uint32_t Maj(uint32_t x, uint32_t y, uint32_t z)
{
    return (x & y) ^ (x & z) ^ (y & z);
}

static uint32_t big_sigma0(uint32_t x)
{
    return rotr32(x, 2) ^ rotr32(x, 13) ^ rotr32(x, 22);
}

static uint32_t big_sigma1(uint32_t x)
{
    return rotr32(x, 6) ^ rotr32(x, 11) ^ rotr32(x, 25);
}

static uint32_t small_sigma0(uint32_t x)
{
    return rotr32(x, 7) ^ rotr32(x, 18) ^ shr32(x, 3);
}

static uint32_t small_sigma1(uint32_t x)
{
    return rotr32(x, 17) ^ rotr32(x, 19) ^ shr32(x, 10);
}

/* Core compression of one 512-bit block */
static void sha256_transform(const uint8_t block[64])
{
    uint32_t W[64];
    uint32_t a, b, c, d, e, f, g, h;
    uint32_t T1, T2;
    int t;

    /* Prepare message schedule */
    for (t = 0; t < 16; t++) {
        W[t] = load32_be(block + (t * 4));
    }

    for (t = 16; t < 64; t++) {
        W[t] = small_sigma1(W[t - 2]) +
               W[t - 7] +
               small_sigma0(W[t - 15]) +
               W[t - 16];
    }

    /* Load current hash state from global bytes */
    a = sha_state_get_word(0);
    b = sha_state_get_word(1);
    c = sha_state_get_word(2);
    d = sha_state_get_word(3);
    e = sha_state_get_word(4);
    f = sha_state_get_word(5);
    g = sha_state_get_word(6);
    h = sha_state_get_word(7);

    /* Main loop */
    for (t = 0; t < 64; t++) {
        T1 = h + big_sigma1(e) + Ch(e, f, g) + K[t] + W[t];
        T2 = big_sigma0(a) + Maj(a, b, c);

        h = g;
        g = f;
        f = e;
        e = d + T1;
        d = c;
        c = b;
        b = a;
        a = T1 + T2;
    }

    /* Add back into global state (word-wise) */
    sha_state_set_word(0, sha_state_get_word(0) + a);
    sha_state_set_word(1, sha_state_get_word(1) + b);
    sha_state_set_word(2, sha_state_get_word(2) + c);
    sha_state_set_word(3, sha_state_get_word(3) + d);
    sha_state_set_word(4, sha_state_get_word(4) + e);
    sha_state_set_word(5, sha_state_get_word(5) + f);
    sha_state_set_word(6, sha_state_get_word(6) + g);
    sha_state_set_word(7, sha_state_get_word(7) + h);
}

/* ============================================================
 * Public API built on the global context
 * ============================================================ */

void sha256_init(void)
{
    unsigned i;

    for (i = 0; i < 8; i++) {
        sha_state_set_word(i, sha256_initial_state[i]);
    }
    g_sha_bitcount = 0;
    memzero_u8(g_sha_buffer, 64);

    /* Ensure at least one SET1/CLR1-like pattern on g_sha_state */
    sha256_bitop_probe();
}

void sha256_update(const uint8_t *data, size_t len)
{
    size_t buffer_bytes = (size_t)((g_sha_bitcount >> 3) & 0x3Fu);
    size_t i = 0;
    size_t space;

    g_sha_bitcount += (uint64_t)len * 8u;

    if (buffer_bytes > 0) {
        space = 64u - buffer_bytes;
        if (len < space) {
            memcpy_u8(g_sha_buffer + buffer_bytes, data, len);
            return;
        } else {
            memcpy_u8(g_sha_buffer + buffer_bytes, data, space);
            sha256_transform(g_sha_buffer);
            i += space;
        }
    }

    while (i + 63u < len) {
        sha256_transform(data + i);
        i += 64u;
    }

    if (i < len) {
        memcpy_u8(g_sha_buffer, data + i, len - i);
    }
}

void sha256_final(uint8_t digest[32])
{
    uint8_t pad[64];
    uint8_t lenbuf[8];
    size_t buffer_bytes;
    size_t pad_len;
    size_t i;
    uint64_t bits = g_sha_bitcount;

    /* Prepare padding: 0x80 followed by zeros */
    for (i = 0; i < 64; i++) {
        pad[i] = 0;
    }
    pad[0] = 0x80u;

    /* Length in bits, big-endian */
    lenbuf[0] = (uint8_t)(bits >> 56);
    lenbuf[1] = (uint8_t)(bits >> 48);
    lenbuf[2] = (uint8_t)(bits >> 40);
    lenbuf[3] = (uint8_t)(bits >> 32);
    lenbuf[4] = (uint8_t)(bits >> 24);
    lenbuf[5] = (uint8_t)(bits >> 16);
    lenbuf[6] = (uint8_t)(bits >> 8);
    lenbuf[7] = (uint8_t)(bits);

    buffer_bytes = (size_t)((g_sha_bitcount >> 3) & 0x3Fu);

    if (buffer_bytes < 56u) {
        pad_len = 56u - buffer_bytes;
    } else {
        pad_len = 64u - buffer_bytes + 56u;
    }

    sha256_update(pad, pad_len);
    sha256_update(lenbuf, 8u);

    /* Output current state as 32-byte digest */
    for (i = 0; i < 8; i++) {
        store32_be(sha_state_get_word((unsigned)i), &digest[i * 4u]);
    }

    /* Clear global state (optional) */
    memzero_u8(g_sha_state, 32);
    g_sha_bitcount = 0;
    memzero_u8(g_sha_buffer, 64);
}

/* One-shot helper */
void sha256_compute(const uint8_t *data, size_t len, uint8_t digest[32])
{
    sha256_init();
    sha256_update(data, len);
    sha256_final(digest);
}

// Below, we will simulate using 64 vectors of 8KB, because we 


#include <stdio.h>

#define TOTAL_CHUNKS_COUNT   64          
#define CHUNK_SIZE_8KB       (8192UL)    // 8 KB
#define BLOCK_SIZE_2KB       (2048UL)    // 2 KB

volatile uint8_t current_vector_8k[CHUNK_SIZE_8KB];
volatile uint8_t g_dummy_sink;  // Added here to ensure consistency between this code and the one from 4KB-chunks-only-vector-generation.c

void generate_random_data_for_chunk(uint8_t chunk_index) {
    uint8_t pattern = (uint8_t)(chunk_index ^ 0x55); 
    
    for(uint32_t i = 0; i < CHUNK_SIZE_8KB; i++) {
        current_vector_8k[i] = (uint8_t)(i ^ pattern);
    }
}

void process_current_8kb_vector(void) {
    uint8_t digest[32];
    
    for(uint32_t offset = 0; offset < CHUNK_SIZE_8KB; offset += BLOCK_SIZE_2KB) {
        volatile uint8_t *current_2kb_ptr = &current_vector_8k[offset];
        sha256_compute((const uint8_t*)current_2kb_ptr, BLOCK_SIZE_2KB, digest);
    }
}

int main(void) {
    for(int i = 0; i < TOTAL_CHUNKS_COUNT; i++) {
        generate_random_data_for_chunk((uint8_t)i);
        process_current_8kb_vector();
    }

    return 0;
}