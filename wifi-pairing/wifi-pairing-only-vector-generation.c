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

    /* No cryptographic logic here. Just immediate return. */
}

/* ============================================================
 * CONFIGURATION (Must match the main benchmark exactly)
 * ============================================================ */
#define PBKDF2_ITERATIONS   4096
#define WIFI_SSID_SIZE      32
#define WIFI_PASS_SIZE      16

/* Global buffers (Same layout as original to preserve RAM usage) */
uint8_t g_wifi_ssid[WIFI_SSID_SIZE];
uint8_t g_temp_digest[32]; 

/* ============================================================
 * OVERHEAD BENCHMARK DRIVER
 * ============================================================ */
void run_wifi_pairing_overhead_benchmark(void) {
    
    uint8_t password[WIFI_PASS_SIZE] = "MySecretWiFiPass";
    uint8_t current_digest[32];
    uint32_t i;
    uint8_t k;
    
    /* 1. Measure Overhead of Initialization loop */
    for(i=0; i<WIFI_SSID_SIZE; i++) g_wifi_ssid[i] = (uint8_t)i;

    /* 2. Measure Overhead of the first function call */
    hmac_sha256_dummy(password, WIFI_PASS_SIZE, 
                      g_wifi_ssid, WIFI_SSID_SIZE, 
                      current_digest);

    /* 3. Measure Overhead of the main loop logic (4095 iterations) */
    for(i = 1; i < PBKDF2_ITERATIONS; i++) {
        
        /* Call dummy function to measure argument passing cost */
        hmac_sha256_dummy(password, WIFI_PASS_SIZE, 
                          current_digest, 32, 
                          g_temp_digest);
        
        /* IMPORTANT: We KEEP the copy loop here.
         * Copying bytes is data management overhead, not encryption.
         * We want to subtract this time from the total result.
         */
        for(k=0; k<32; k++) current_digest[k] = g_temp_digest[k];
    }
}

/* ============================================================
 * MAIN DRIVER
 * ============================================================ */
int main(void) {
    run_wifi_pairing_overhead_benchmark();
    return 0;
}