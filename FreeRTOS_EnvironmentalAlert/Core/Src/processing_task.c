/*
 * processing_task.c
 *
 *  Created on: Oct 26, 2025
 *      Author: janme
 */
/*
 * processing_task.c
 * Handles incoming sensor data, computes rolling averages,
 * detects alerts, and forwards formatted data to Comm and Alert tasks.
 */

#include "cmsis_os2.h"
#include "processing_task.h"
#include "rtos_objects.h"
#include "main.h"
#include <stdio.h>
#include <string.h>

/* External objects from other modules */
extern osMessageQueueId_t sensorQueueHandle;
extern osMessageQueueId_t commQueueHandle;
extern osThreadId_t alertTaskHandle;

/* ==== Config ==== */
#define AVG_WINDOW          5
#define TEMP_ALERT_HIGH     22.0
#define LPG_ALERT_PPM       800
#define SMOKE_ALERT_PPM     1000

/* ==== Static variables ==== */
 SensorSample_t window[AVG_WINDOW];
 int w_index = 0;
 int count = 0;

/* Filtered averages */
 float avg_temp = 0;
 float avg_hum = 0;
 float avg_press = 0;
 int avg_lpg = 0;
 int avg_smoke = 0;

/* ==== Local functions ==== */
static void update_rolling_average(const SensorSample_t *s)
{
    window[w_index] = *s;
    w_index = (w_index + 1) % AVG_WINDOW;
    if (count < AVG_WINDOW) count++;

    float sum_temp = 0, sum_hum = 0, sum_press = 0;
    int sum_lpg = 0, sum_smoke = 0;

    for (int i = 0; i < count; i++) {
        sum_temp  += window[i].temp_c;
        sum_hum   += window[i].humidity_pct;
        sum_press += window[i].pressure_hpa;
        sum_lpg   += window[i].mq2_lpg_ppm;
        sum_smoke += window[i].mq2_smoke_ppm;
    }

    avg_temp  = sum_temp  / count;
    avg_hum   = sum_hum   / count;
    avg_press = sum_press / count;
    avg_lpg   = sum_lpg   / count;
    avg_smoke = sum_smoke / count;

    printf("\n\n\n [PROCESSSING DEBUG]\n Avg_temp=%f, Avg_hum=%f, Avg_Press= %f AVg_lpg=%d AVg_smoke=%d",
    		avg_temp,avg_hum,avg_press,avg_lpg,avg_smoke);
}

static int detect_alert(void)
{
    if ((avg_temp > TEMP_ALERT_HIGH) ||
           (avg_lpg > LPG_ALERT_PPM) ||
           (avg_smoke > SMOKE_ALERT_PPM))
    {
    	printf("\n High temp\n");
    	return (avg_temp > TEMP_ALERT_HIGH) ||
    			(avg_lpg > LPG_ALERT_PPM) ||
				(avg_smoke > SMOKE_ALERT_PPM);
    }

}

/* ==== Public task init ==== */
void processing_task_init(void)
{
    const osThreadAttr_t attr = {
        .name = "ProcessingTask",
        .stack_size = 1024,
        .priority = 2
    };
    processTaskHandle = osThreadNew(vProcessingTask, NULL, &attr);
}

/* ==== Main task ==== */
void vProcessingTask(void *argument)
{
    (void)argument;
    SensorSample_t s;
    char msg[128];

    for (;;) {
        if (osMessageQueueGet(sensorQueueHandle, &s, NULL, osWaitForever) == osOK) {
            update_rolling_average(&s);

            if (detect_alert()) {
                osThreadFlagsSet(alertTaskHandle, 0x01); // notify Alert task
            }

            int len = snprintf(msg, sizeof(msg),
                               "{\"t\":%.1f,\"h\":%.1f,\"p\":%.1f,\"lpg\":%d,\"smk\":%d}\n",
                               avg_temp, avg_hum, avg_press, avg_lpg, avg_smoke);
            osMessageQueuePut(commQueueHandle, msg, 0, 10);
        }
    }
}


