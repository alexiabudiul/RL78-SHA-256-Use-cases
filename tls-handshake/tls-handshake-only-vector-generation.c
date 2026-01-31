#include <stdint.h>
#include <stddef.h>

/* ============================================================
 * MOCK HMAC FUNCTION (Empty)
 * ============================================================ */
void hmac_sha256_dummy(const uint8_t *key, size_t key_len,
                       const uint8_t *data, size_t data_len,
                       uint8_t output[32])
{
    (void)key; (void)key_len; (void)data; (void)data_len; (void)output;
    /* Return imediat */
}

/* ============================================================
 * CONFIGURATION 
 * ============================================================ */
#define TLS_OPS_COUNT       30     
#define TLS_MSG_SIZE        100    

uint8_t g_tls_buffer[TLS_MSG_SIZE];
uint8_t g_temp_digest[32]; 

/* ============================================================
 * HELPER: EXACT ACEEAȘI FUNCȚIE CA ÎN CODUL COMPLET
 * ============================================================ */
void generate_tls_message(uint8_t *buf, size_t len, uint32_t seed) {
    size_t k;
    for(k = 0; k < len; k++) {
        buf[k] = (uint8_t)((k ^ seed) + (k << 2)); 
    }
}

/* ============================================================
 * OVERHEAD BENCHMARK DRIVER (FULL REGENERATION)
 * ============================================================ */
void run_tls_handshake_overhead_benchmark(void) {
    
    uint8_t session_key[32];
    uint32_t i;
    uint32_t k;

    /* Inițializare cheie (overhead constant) */
    for(k = 0; k < 32; k++) {
        session_key[k] = (uint8_t)(k ^ 0xCC); 
    }

    /* Bucla de măsurare a overhead-ului */
    for(i = 0; i < TLS_OPS_COUNT; i++) {
        
        /* 1. Măsurăm timpul de generare a datelor 
         * (Ca să îl putem scădea din total) */
        generate_tls_message(g_tls_buffer, TLS_MSG_SIZE, i);
        
        /* 2. Apelăm funcția goală */
        hmac_sha256_dummy(session_key, 32, 
                          g_tls_buffer, TLS_MSG_SIZE, 
                          g_temp_digest);
    }
}

int main(void) {
    run_tls_handshake_overhead_benchmark();
    return 0;
}