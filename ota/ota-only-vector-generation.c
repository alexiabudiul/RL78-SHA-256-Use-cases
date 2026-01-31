#include <stdint.h>
#include <stddef.h>

/* ============================================================ 
 * MOCK SHA-256 (Empty Function)
 * We declare it to ensure the compiler performs a real 
 * function call, just like in the original code, to measure 
 * the call overhead.
 * ============================================================ */
void sha256_compute_dummy(const uint8_t *data, size_t len, uint8_t digest[32]) {
    /* Do nothing - this simulates the call without the algorithm's execution */
    (void)data;
    (void)len;
    (void)digest;
}

/* ============================================================ 
 * SAME CONFIGURATION AS THE ORIGINAL BENCHMARK
 * ============================================================ */
#define OTA_BATCH_SIZE    512               
#define TOTAL_BATCHES     2048              

uint8_t ota_buffer[OTA_BATCH_SIZE];

/* Keep the generation function identical to maintain the same overhead */
void generate_unique_batch(uint32_t batch_index) {
    for (uint16_t j = 0; j < OTA_BATCH_SIZE; j++) {
        /* Xor the batch index with the byte index to create unique data per batch */
        ota_buffer[j] = (uint8_t)((batch_index ^ j) & 0xFF);
    }
}

void run_ota_overhead_benchmark(void) {
    uint8_t digest[32];
    uint32_t i;

    for (i = 0; i < TOTAL_BATCHES; i++) {
        /* Measure the data generation overhead */
        generate_unique_batch(i);

        /* Measure the function call overhead (without SHA-256 logic) */
        sha256_compute_dummy(ota_buffer, OTA_BATCH_SIZE, digest);
    }
}

int main(void) {
    run_ota_overhead_benchmark();
    return 0;
}