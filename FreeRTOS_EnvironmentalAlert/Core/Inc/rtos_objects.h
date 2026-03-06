/*
 * rtos_objects.h
 *
 *  Created on: Oct 24, 2025
 *      Author: janme
 */

#ifndef RTOS_OBJECTS_H
#define RTOS_OBJECTS_H

#include "cmsis_os2.h"
#include <stdint.h>



/* === Sensor sample struct === */
typedef struct {
  uint32_t timestamp_ms;
  float temp_c;
  float humidity_pct;
  float pressure_hpa;
  uint16_t mq2_adc_raw;
  uint16_t mq2_lpg_ppm;
  uint16_t mq2_smoke_ppm;
} SensorSample_t;

/* === OS objects === */
extern osMutexId_t       i2c_mutex;
extern osSemaphoreId_t   adc_done_sem;
extern osThreadId_t      sensorTaskHandle;
extern osMessageQueueId_t sensorQueueHandle;
extern osMessageQueueId_t commQueueHandle;
extern osThreadId_t processTaskHandle;
extern osThreadId_t alertTaskHandle;


void rtos_objects_init(void);
void MX_FREERTOS_Init(void);

#endif

