/*
 * dht22.h
 *
 *  Created on: Oct 21, 2025
 *      Author: janme
 */

#ifndef DHT22_H
#define DHT22_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32f4xx_hal.h"
#include "main.h"
extern TIM_HandleTypeDef htim3;
/* Defines */
#define DHT22_PORT               DHT22_GPIO_Port
#define DHT22_PIN                DHT22_Pin  // Matches your PA0

/* Function Prototypes */
void DHT22_Init(void);  // Call once after MX_TIM3_Init() and MX_GPIO_Init()
uint8_t DHT22_Read(float *temperature, float *humidity);  // Returns 1 on success, 0 on error

#ifdef __cplusplus
}
#endif



#endif /* INC_DHT22_H_ */
