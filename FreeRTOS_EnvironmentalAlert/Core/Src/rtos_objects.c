/*
 * rtos_objects.c
 *
 *  Created on: Oct 24, 2025
 *      Author: janme
 */

#include "rtos_objects.h"
#include "sensor_task.h"
#include "processing_task.h"
#include "alert_task.h"

osMutexId_t       i2c_mutex;
osSemaphoreId_t   adc_done_sem;
osThreadId_t      sensorTaskHandle;
osMessageQueueId_t sensorQueueHandle;
osMessageQueueId_t commQueueHandle;
osThreadId_t processTaskHandle;
osThreadId_t alertTaskHandle;


void MX_FREERTOS_Init(void)
{
    // Queues
    sensorQueueHandle = osMessageQueueNew(8, sizeof(SensorSample_t), NULL);
    commQueueHandle   = osMessageQueueNew(8, sizeof(char[128]), NULL);

    // Create tasks
    sensor_task_init();
    processing_task_init();
    alert_task_init(); // when added later
    // comm_task_init();  // when added later
}
