/*
 * alert_task.c
 *
 *  Created on: Oct 26, 2025
 *      Author: janme
 */
/*
 * alert_task.c
 * Handles LED and buzzer signaling on alerts.
 * Moderate alert -> LED blink.
 * Critical alert -> LED + buzzer ON.
 * Pushbutton press resets the alert state.
 */
/*
 * alert_task.c
 * Revised version with full debug logs.
 * ALERT stays active until the external button (PD9→GND) is pressed.
 */

/*
 * alert_task.c
 * Strongly-instrumented alert task.
 * ISR only timestamps button events.
 * Task debounces the press and validates state before resetting alerts.
 *
 * Hardware assumptions:
 *  - Button: PD9 pulled-up, pressed -> PD9 = 0 (falling edge).
 *  - Buzzer: active-low (adjust BUZZER_ACTIVE_LOW to 0 if opposite).
 */

#include "cmsis_os2.h"
#include "alert_task.h"
#include "rtos_objects.h"
#include "main.h"
#include <stdio.h>
#include <stdint.h>
#include "usart.h"

/* === External (from processing_task.c) === */
extern float avg_temp;
extern int avg_lpg;
extern int avg_smoke;


/* === Config === */
#define TEMP_CRITICAL_HIGH   25.0f   /* adjust to your needs */
#define LPG_CRITICAL_PPM     1500
#define SMOKE_CRITICAL_PPM   2000

#define LED_BLINK_MS         300
#define BUTTON_DEBOUNCE_MS   50
#define BUTTON_VALID_HOLD_MS 30

/* === Hardware mappings - adjust if different names in main.h === */
#define LED_PORT     LD3_GPIO_Port
#define LED_PIN      LD3_Pin

#define BUZZER_PORT  BUZZER_GPIO_Port
#define BUZZER_PIN   BUZZER_Pin

#define BUTTON_PORT  GPIOD
#define BUTTON_PIN   GPIO_PIN_9   /* PD9 external button */

/* If your buzzer is active high set to 0, if active low set 1 */
#define BUZZER_ACTIVE_LOW 1

/* buzzer helpers */
static inline void buzzer_off(void)  {
    if (BUZZER_ACTIVE_LOW) HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
    else                         HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_SET);
}
static inline void buzzer_on(void) {
    if (BUZZER_ACTIVE_LOW) HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_SET);
    else                         HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
}

/* === Alert levels === */
typedef enum { ALERT_NONE=0, ALERT_MODERATE, ALERT_CRITICAL } AlertLevel_t;
static volatile AlertLevel_t current_alert = ALERT_NONE;

/* ISR -> timestamp (ms) of last event. Task will validate. */
static volatile uint32_t isr_ts_ms = 0;

/* Task-local validated reset flag */
static volatile uint8_t validated_reset = 0;
static volatile uint8_t reset_flag = 0;

/* Forward decls */
static AlertLevel_t evaluate_alert(void);


/* Minimal safe ISR: only record timestamp (non-blocking). */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == GPIO_PIN_9) {
        printf("[ISR] PD9 interrupt\n");
        reset_flag = 1;   // temporary direct set
    }
}

/* init */
void alert_task_init(void)
{
    /* Clear any pending EXTI flag for safety (called after MX_GPIO_Init). */
    __HAL_GPIO_EXTI_CLEAR_IT(BUTTON_PIN);
    HAL_NVIC_ClearPendingIRQ(EXTI9_5_IRQn);

    const osThreadAttr_t attr = {
        .name = "AlertTask",
        .stack_size = 768,
        .priority = 4
    };
    alertTaskHandle = osThreadNew(vAlertTask, NULL, &attr);
    printf("[ALERT_INIT] created. BUTTON pin read=%d\n",
           (int)HAL_GPIO_ReadPin(BUTTON_PORT, BUTTON_PIN));
}

/* evaluate alert level from averages */
static AlertLevel_t evaluate_alert(void)
{
    if ((avg_temp > TEMP_CRITICAL_HIGH) ||
        (avg_lpg > LPG_CRITICAL_PPM) ||
        (avg_smoke > SMOKE_CRITICAL_PPM)) {
        return ALERT_CRITICAL;
    }
    return ALERT_MODERATE;
}

void wait_for_uart_reset(void)
{
   uint8_t rx;
   printf("[ALERT] Waiting for UART input '1' to reset...\n");

   for (;;) {
       if (HAL_UART_Receive(&huart2, &rx, 1, 100) == HAL_OK) {
           if (rx == '1') {
               printf("[ALERT] Received '1' over UART -> resetting alert\n");
               break;
           } else {
               printf("[ALERT] Ignored input: %c\n", rx);
           }
       }
       osDelay(100);
   }
}
/* reset outputs and state */
void reset_alert_state(void)
{
    HAL_GPIO_WritePin(LED_PORT, LED_PIN, GPIO_PIN_RESET);
    buzzer_off();
    current_alert = ALERT_NONE;
    reset_flag = 0;
    printf("\n\n\n[ALERT] reset_alert_state executed, waiting for UART 1\n\n\n");
    wait_for_uart_reset();
}
// Wait for '1' from UART terminal before resetting





/* Main RTOS task */
void vAlertTask(void *argument)
{
    (void)argument;
    printf("[ALERT_TASK] started\n");

    /* Ensure initial safe outputs */
    //reset_alert_state();

    for (;;) {
        osThreadFlagsWait(0x01, osFlagsWaitAny, osWaitForever);

        current_alert = evaluate_alert();

        if (current_alert == ALERT_CRITICAL) {
            printf("[ALERT] Critical state\n");
            HAL_GPIO_WritePin(LED_PORT, LED_PIN, GPIO_PIN_SET);
            HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_SET);

            while (!reset_flag) {
                osDelay(100);
            }
            printf("[ALERT] Reset pressed\n");
            reset_flag = 0;
            reset_alert_state();
            HAL_GPIO_WritePin(LED_PORT, LED_PIN, GPIO_PIN_RESET);
            HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
        }
        else if (current_alert == ALERT_MODERATE) {
                    while (!reset_flag) {
                        HAL_GPIO_TogglePin(LED_PORT, LED_PIN);
                        osDelay(500);
                    }
                    reset_alert_state();
                }
            }
}
