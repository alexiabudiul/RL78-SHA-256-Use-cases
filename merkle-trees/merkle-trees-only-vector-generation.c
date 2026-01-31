#include <stdint.h>
#include <stddef.h>

/* ============================================================
 * MOCK SHA-256 FUNCTION (Empty)
 * ============================================================ */
void sha256_compute_dummy(const uint8_t *data, size_t len, uint8_t digest[32])
{
    /* Prevent compiler warnings about unused variables */
    (void)data;
    (void)len;
    (void)digest;
    
    /* Return imediat, fără calcule */
}

/* ============================================================
 * MEMORY HELPER (Overhead)
 * We must keep this because copying memory takes CPU cycles
 * and is part of the tree management overhead.
 * ============================================================ */
static void memcpy_u8(volatile uint8_t *dst, const uint8_t *src, size_t len)
{
    size_t i;
    for (i = 0; i < len; i++) {
        dst[i] = src[i];
    }
}

/* ============================================================
 * MERKLE TREE CONFIGURATION (Must match FULL code exactly)
 * ============================================================ */
#define TREE_HEIGHT      23          // Change this to match your test (20, 21, 22)
#define TOTAL_LEAVES     (1UL << TREE_HEIGHT)

#define HASH_SIZE        32
#define NODE_INPUT_SIZE  64

/* Global buffers (Same layout as original) */
volatile uint8_t merkle_stack[TREE_HEIGHT + 1][HASH_SIZE];
volatile uint8_t level_occupied[TREE_HEIGHT + 1];
uint8_t combine_buffer[NODE_INPUT_SIZE];
uint8_t leaf_buffer[64];

/* ============================================================
 * MERKLE LOGIC
 * ============================================================ */

void init_merkle_system(void) {
    uint8_t i;
    for(i = 0; i <= TREE_HEIGHT; i++) {
        level_occupied[i] = 0;
    }
}

/* Generates overhead (same as original) */
void generate_leaf_data(uint32_t index) {
    uint8_t i;
    for(i = 0; i < 64; i++) {
        leaf_buffer[i] = (uint8_t)((index >> (i % 8)) ^ 0xAA);
    }
}

/* * Core function modified for Overhead:
 * Maintains logic and memory copies, but uses DUMMY hash.
 */
void add_leaf_to_tree_overhead(const uint8_t* leaf_hash) {
    uint8_t current_hash[HASH_SIZE];
    uint8_t level = 0;

    // 1. Copy leaf hash (Overhead)
    memcpy_u8(current_hash, leaf_hash, HASH_SIZE);

    // 2. Attempt to ascend the tree
    while (level < TREE_HEIGHT) {
        
        if (level_occupied[level] == 0) {
            // Park the hash (Memory Overhead)
            memcpy_u8((uint8_t*)merkle_stack[level], current_hash, HASH_SIZE);
            level_occupied[level] = 1;
            return; 
        } 
        else {
            // Combine Logic (Overhead)
            
            // a) Copy Left
            memcpy_u8(combine_buffer, (uint8_t*)merkle_stack[level], HASH_SIZE);
            
            // b) Copy Right
            memcpy_u8(combine_buffer + HASH_SIZE, current_hash, HASH_SIZE);
            
            // c) Calculate Parent Hash -> DUMMY CALL
            // We measure the cost of calling the function, but not the math inside.
            sha256_compute_dummy(combine_buffer, NODE_INPUT_SIZE, current_hash);
            
            // d) Logic update
            level_occupied[level] = 0;
            level++;
        }
    }
    
    // Store root (Overhead)
    memcpy_u8((uint8_t*)merkle_stack[TREE_HEIGHT], current_hash, HASH_SIZE);
}

/* ============================================================
 * OVERHEAD BENCHMARK DRIVER
 * ============================================================ */
void run_merkle_overhead_benchmark(void) {
    uint8_t leaf_hash[HASH_SIZE];
    uint32_t i;

    init_merkle_system();

    /* Iterate through all leaves */
    for(i = 0; i < TOTAL_LEAVES; i++) {
        
        // 1. Measure Overhead of Data Generation
        generate_leaf_data(i);

        // 2. Measure Overhead of First Function Call (Leaf Hash)
        sha256_compute_dummy(leaf_buffer, 64, leaf_hash);

        // 3. Measure Overhead of Tree Logic (Stack ops + Dummy Internal Hashes)
        add_leaf_to_tree_overhead(leaf_hash);
    }
}

int main(void) {
    run_merkle_overhead_benchmark();
    return 0;
}