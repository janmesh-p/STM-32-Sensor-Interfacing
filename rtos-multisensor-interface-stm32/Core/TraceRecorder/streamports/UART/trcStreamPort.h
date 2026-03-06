#ifndef TRC_STREAM_PORT_H
#define TRC_STREAM_PORT_H

#include "trcPortDefines.h"
#include "stm32f1xx_hal.h"  // For HAL_UART_Transmit

// Disable internal buffer for direct UART write (low latency)
#define TRC_STREAM_PORT_USE_INTERNAL_BUFFER 0

// Write data to UART (blocking, adjust timeout as needed)
traceResult xTraceStreamPortPutChar(traceChar ch) {
    uint8_t byte = (uint8_t)ch;
    HAL_UART_Transmit(&huart3, &byte, 1, 100);  // 100ms timeout
    return TRC_SUCCESS;
}

// Optional: Non-blocking version if using DMA/IT
traceResult xTraceStreamPortPutArray(const traceChar* pBuffer, uint32_t size) {
    HAL_UART_Transmit(&huart3, (uint8_t*)pBuffer, size, 1000);
    return TRC_SUCCESS;
}

// Init UART for tracing (call in main after MX_USART3_UART_Init)
void xTraceStreamPortInit(void) {
    // huart3 already init from CubeMX
}

#endif