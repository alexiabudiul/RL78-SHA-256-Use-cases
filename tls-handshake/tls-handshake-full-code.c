/*
 * SHA-256 implementation for experimentation on RL78 with LLVM.
 *
 * Features:
 * - SHA state stored as global bytes: g_sha_state[32].
 * - Bit operations on that state expressed as:
 * g_sha_state[idx] |= (1u << bit);
 * g_sha_state[idx] &= ~(1u << bit);
 * so that RL78 backend can turn them into SET1 / CLR1 at -O3.
 * - No memcpy/memset; uses simple byte loops.
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

#define SHA_STATE_SET_BIT(byte_index, bit)   sha_state_set_bit_raw((byte_index), (bit))
#define SHA_STATE_CLEAR_BIT(byte_index, bit) sha_state_clear_bit_raw((byte_index), (bit))

/* Mapping helper: 32-bit word index + bit -> byte index */
static inline size_t sha_state_byte_index(unsigned word_index, uint8_t bit)
{
    uint8_t byte_in_word = (uint8_t)((31u - bit) >> 3);   /* 0..3 */
    return (size_t)(word_index * 4u + byte_in_word);
}

/* Mapping helper: bit 0..31 -> bit 0..7 in byte */
static inline uint8_t sha_state_bit_in_byte(uint8_t bit)
{
    uint8_t pos_in_word = (uint8_t)(bit & 7u); /* 0..7 */
    return (uint8_t)(pos_in_word);             
}

/* Probe function to force patterns in assembly (optional) */
static void sha256_bitop_probe(void)
{
    uint8_t saved = g_sha_state[0];
    SHA_STATE_SET_BIT(0u, 4u);
    SHA_STATE_CLEAR_BIT(0u, 4u);
    g_sha_state[0] = saved;
}

/* ============================================================
 * Endian helpers
 * ============================================================ */

static uint32_t load32_be(volatile const uint8_t *p)
{
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8)  | ((uint32_t)p[3]);
}

static void store32_be(uint32_t x, volatile uint8_t *p)
{
    p[0] = (uint8_t)(x >> 24); p[1] = (uint8_t)(x >> 16);
    p[2] = (uint8_t)(x >> 8);  p[3] = (uint8_t)(x);
}

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
 * SHA-256 Core
 * ============================================================ */

static const uint32_t sha256_initial_state[8] = {
    0x6a09e667u, 0xbb67ae85u, 0x3c6ef372u, 0xa54ff53au,
    0x510e527fu, 0x9b05688cu, 0x1f83d9abu, 0x5be0cd19u
};

static const uint32_t K[64] = {
    /* ... Constants omitted for brevity (same as before) ... */
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

static uint32_t rotr32(uint32_t x, uint8_t n) { return (x >> n) | (x << (32u - n)); }
static uint32_t shr32(uint32_t x, uint8_t n)  { return x >> n; }
static uint32_t Ch(uint32_t x, uint32_t y, uint32_t z) { return (x & y) ^ (~x & z); }
static uint32_t Maj(uint32_t x, uint32_t y, uint32_t z) { return (x & y) ^ (x & z) ^ (y & z); }
static uint32_t big_sigma0(uint32_t x) { return rotr32(x, 2) ^ rotr32(x, 13) ^ rotr32(x, 22); }
static uint32_t big_sigma1(uint32_t x) { return rotr32(x, 6) ^ rotr32(x, 11) ^ rotr32(x, 25); }
static uint32_t small_sigma0(uint32_t x) { return rotr32(x, 7) ^ rotr32(x, 18) ^ shr32(x, 3); }
static uint32_t small_sigma1(uint32_t x) { return rotr32(x, 17) ^ rotr32(x, 19) ^ shr32(x, 10); }

static void sha256_transform(const uint8_t block[64])
{
    uint32_t W[64];
    uint32_t a, b, c, d, e, f, g, h, T1, T2;
    int t;

    for (t = 0; t < 16; t++) W[t] = load32_be(block + (t * 4));
    for (t = 16; t < 64; t++) W[t] = small_sigma1(W[t - 2]) + W[t - 7] + small_sigma0(W[t - 15]) + W[t - 16];

    a = sha_state_get_word(0); b = sha_state_get_word(1); c = sha_state_get_word(2); d = sha_state_get_word(3);
    e = sha_state_get_word(4); f = sha_state_get_word(5); g = sha_state_get_word(6); h = sha_state_get_word(7);

    for (t = 0; t < 64; t++) {
        T1 = h + big_sigma1(e) + Ch(e, f, g) + K[t] + W[t];
        T2 = big_sigma0(a) + Maj(a, b, c);
        h = g; g = f; f = e; e = d + T1; d = c; c = b; b = a; a = T1 + T2;
    }

    sha_state_set_word(0, sha_state_get_word(0) + a);
    sha_state_set_word(1, sha_state_get_word(1) + b);
    sha_state_set_word(2, sha_state_get_word(2) + c);
    sha_state_set_word(3, sha_state_get_word(3) + d);
    sha_state_set_word(4, sha_state_get_word(4) + e);
    sha_state_set_word(5, sha_state_get_word(5) + f);
    sha_state_set_word(6, sha_state_get_word(6) + g);
    sha_state_set_word(7, sha_state_get_word(7) + h);
}

void sha256_init(void)
{
    unsigned i;
    for (i = 0; i < 8; i++) sha_state_set_word(i, sha256_initial_state[i]);
    g_sha_bitcount = 0;
    memzero_u8(g_sha_buffer, 64);
    sha256_bitop_probe();
}

void sha256_update(const uint8_t *data, size_t len)
{
    size_t buffer_bytes = (size_t)((g_sha_bitcount >> 3) & 0x3Fu);
    size_t i = 0, space;
    g_sha_bitcount += (uint64_t)len * 8u;

    if (buffer_bytes > 0) {
        space = 64u - buffer_bytes;
        if (len < space) { memcpy_u8(g_sha_buffer + buffer_bytes, data, len); return; }
        else { memcpy_u8(g_sha_buffer + buffer_bytes, data, space); sha256_transform(g_sha_buffer); i += space; }
    }
    while (i + 63u < len) { sha256_transform(data + i); i += 64u; }
    if (i < len) memcpy_u8(g_sha_buffer, data + i, len - i);
}

void sha256_final(uint8_t digest[32])
{
    uint8_t pad[64], lenbuf[8];
    size_t buffer_bytes, pad_len, i;
    uint64_t bits = g_sha_bitcount;

    memzero_u8(pad, 64); pad[0] = 0x80u;
    lenbuf[0] = (uint8_t)(bits >> 56); lenbuf[1] = (uint8_t)(bits >> 48);
    lenbuf[2] = (uint8_t)(bits >> 40); lenbuf[3] = (uint8_t)(bits >> 32);
    lenbuf[4] = (uint8_t)(bits >> 24); lenbuf[5] = (uint8_t)(bits >> 16);
    lenbuf[6] = (uint8_t)(bits >> 8);  lenbuf[7] = (uint8_t)(bits);

    buffer_bytes = (size_t)((g_sha_bitcount >> 3) & 0x3Fu);
    pad_len = (buffer_bytes < 56u) ? (56u - buffer_bytes) : (64u - buffer_bytes + 56u);

    sha256_update(pad, pad_len);
    sha256_update(lenbuf, 8u);

    for (i = 0; i < 8; i++) store32_be(sha_state_get_word((unsigned)i), &digest[i * 4u]);
    memzero_u8(g_sha_state, 32); g_sha_bitcount = 0; memzero_u8(g_sha_buffer, 64);
}

/* ============================================================
 * HMAC IMPLEMENTATION (REQUIRED for WiFi & TLS)
 * ============================================================ */
#define HMAC_BLOCK_SIZE 64
uint8_t k_ipad[HMAC_BLOCK_SIZE];
uint8_t k_opad[HMAC_BLOCK_SIZE];

void hmac_sha256(const uint8_t *key, size_t key_len,
                 const uint8_t *data, size_t data_len,
                 uint8_t output[32])
{
    uint8_t i;
    uint8_t inner_hash[32];

    memzero_u8(k_ipad, HMAC_BLOCK_SIZE);
    memzero_u8(k_opad, HMAC_BLOCK_SIZE);

    /* Key copy */
    for(i = 0; i < key_len && i < HMAC_BLOCK_SIZE; i++) {
        k_ipad[i] = key[i];
        k_opad[i] = key[i];
    }

    /* Padding XOR */
    for (i = 0; i < HMAC_BLOCK_SIZE; i++) {
        k_ipad[i] ^= 0x36;
        k_opad[i] ^= 0x5C;
    }

    /* Inner Hash */
    sha256_init();
    sha256_update(k_ipad, HMAC_BLOCK_SIZE);
    sha256_update(data, data_len);
    sha256_final(inner_hash);

    /* Outer Hash */
    sha256_init();
    sha256_update(k_opad, HMAC_BLOCK_SIZE);
    sha256_update(inner_hash, 32);
    sha256_final(output);
}

/* ============================================================
 * TLS BENCHMARK CONFIGURATION
 * ============================================================ */

/* * TLS Handshake 
 * Simulating an average handshake (approx 30 hash calls).
 * We hash the message transcript (ClientHello, ServerHello, Cert, etc.)
 */
#define TLS_OPS_COUNT       30      // Between 10 and 50
#define TLS_MSG_SIZE        100     // Average size of a handshake message

uint8_t g_tls_buffer[TLS_MSG_SIZE];
uint8_t g_temp_digest[32]; // Temporary result

/* ============================================================
 * HELPER: Generare date pseudo-random (Deterministic)
 * Umple complet bufferul cu valori care par aleatoare.
 * ============================================================ */
void generate_tls_message(uint8_t *buf, size_t len, uint32_t seed) {
    size_t k;
    for(k = 0; k < len; k++) {
        /* Formula simplă pentru a genera "zgomot" diferit 
         * în funcție de 'seed' (care va fi indexul buclei 'i') */
        buf[k] = (uint8_t)((k ^ seed) + (k << 2)); 
    }
}

/* ============================================================
 * TLS HANDSHAKE SIMULATION (FULL REGENERATION)
 * ============================================================ */
void run_tls_handshake_benchmark(void) {
    uint8_t session_key[32]; 
    uint32_t i;
    uint32_t k;

    /* 1. Inițializăm cheia o singură dată cu date non-zero */
    for(k = 0; k < 32; k++) {
        session_key[k] = (uint8_t)(k ^ 0xCC); 
    }

    /* 2. Bucla de măsurare */
    for(i = 0; i < TLS_OPS_COUNT; i++) {
        
        /* PAS CRITIC: Regenerăm COMPLET mesajul de 100 bytes.
         * Niciun byte nu rămâne "vechi". Totul e nou.
         */
        generate_tls_message(g_tls_buffer, TLS_MSG_SIZE, i);
        
        /* Calculăm HMAC pe datele proaspăt generate */
        hmac_sha256(session_key, 32, 
                    g_tls_buffer, TLS_MSG_SIZE, 
                    g_temp_digest);
    }
}

/* ============================================================
 * MAIN DRIVER
 * ============================================================ */
int main(void) {
    /* Ensure SHA/HMAC functions are defined above this! */
    run_tls_handshake_benchmark();
    return 0;
}