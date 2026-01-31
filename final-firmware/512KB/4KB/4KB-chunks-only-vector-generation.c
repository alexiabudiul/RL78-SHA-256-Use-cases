#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#define TOTAL_CHUNKS_COUNT   64          
#define CHUNK_SIZE_8KB       (8192UL)    // 8 KB
#define BLOCK_SIZE_4KB       (4096UL)    // 4 KB

volatile uint8_t current_vector_8k[CHUNK_SIZE_8KB];
volatile uint8_t g_dummy_sink; // Used to make sure the compiler doesn't ignore simulate_process_current_8kb_vector() 

void generate_random_data_for_chunk(uint8_t chunk_index) {
    uint8_t pattern = (uint8_t)(chunk_index ^ 0x55); 
    
    for(uint32_t i = 0; i < CHUNK_SIZE_8KB; i++) {
        current_vector_8k[i] = (uint8_t)(i ^ pattern);
    }
}

void simulate_process_current_8kb_vector(void) {
    uint8_t digest[32];
    
    for(uint32_t offset = 0; offset < CHUNK_SIZE_8KB; offset += BLOCK_SIZE_4KB) {
        volatile uint8_t *current_4kb_ptr = &current_vector_8k[offset];
        // The line that calls sha_compute() is deleted
        g_dummy_sink = *current_4kb_ptr;
    }
}

int main(void) {
    for(int i = 0; i < TOTAL_CHUNKS_COUNT; i++) {
        generate_random_data_for_chunk((uint8_t)i);
        simulate_process_current_8kb_vector();
    }

    return 0;
}