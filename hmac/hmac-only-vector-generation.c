#include <stdint.h>
#include <stddef.h>

/* ============================================================
 * MOCK HMAC FUNCTION (Empty)
 * ============================================================ */

void hmac_sha256_dummy(const uint8_t *key, size_t key_len,
                       const uint8_t *data, size_t data_len,
                       uint8_t output[32])
{
    /* Prevent compiler warnings about unused variables */
    (void)key;
    (void)key_len;
    (void)data;
    (void)data_len;
    (void)output;

    /* No SHA-256 logic here. Just immediate return. */
}

/* ============================================================
 * CONFIGURATION (Must match the main benchmark exactly)
 * ============================================================ */
#define HMAC_KEY_SIZE     32                
#define HMAC_BLOCK_SIZE   64                
#define SENSOR_DATA_SIZE  64                
#define BENCHMARK_ITERS   172800            // Simulating a full day of activity

/* Buffers and Keys (Same as original to occupy same RAM) */
static const uint8_t secret_key[HMAC_KEY_SIZE] = {
    0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
    0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
    0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
    0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b
};

uint8_t sensor_buffer[SENSOR_DATA_SIZE];

/* We keep these to maintain memory layout similarity */
uint8_t k_ipad[HMAC_BLOCK_SIZE];
uint8_t k_opad[HMAC_BLOCK_SIZE];

/* ============================================================
 * OVERHEAD BENCHMARK DRIVER
 * ============================================================ */
void run_hmac_overhead_benchmark(void) {
    uint8_t mac_result[32];
    uint32_t i;
    uint8_t j;

    /* Loop corresponding to the daily traffic simulation */
    for (i = 0; i < BENCHMARK_ITERS; i++) {
        
        /* A. Data Generation Overhead
         * We execute this loop to measure the time taken to prepare data 
         */
        for(j = 0; j < SENSOR_DATA_SIZE; j++) {
            sensor_buffer[j] = (uint8_t)((i + j) & 0xFF);
        }

        /* B. Function Call Overhead
         * We call the dummy function to measure the cost of passing arguments
         * and jumping to the routine.
         */
        hmac_sha256_dummy(secret_key, HMAC_KEY_SIZE, 
                          sensor_buffer, SENSOR_DATA_SIZE, 
                          mac_result);
    }
}

int main(void) {
    run_hmac_overhead_benchmark();
    return 0;
}