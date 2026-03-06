/*
 * bmp280.h
 *
 *  Created on: Oct 21, 2025
 *      Author: janme
 */

#ifndef BMP280_H
#define BMP280_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32f4xx_hal.h"
#include "main.h"
extern I2C_HandleTypeDef hi2c1;

/* Defines */
#define BMP280_ADDRESS            0xEC  // 0x76 << 1 (write; detected variant)
#define BMP280_CHIP_ID_REG        0xD0
#define BMP280_RESET_REG          0xE0
#define BMP280_CTRL_MEAS_REG      0xF4
#define BMP280_CONFIG_REG         0xF5
#define BMP280_PRESS_MSB_REG      0xF7
#define BMP280_TEMP_MSB_REG       0xFA

/* Function Prototypes */
void BMP280_Init(void);  // Call once after MX_I2C1_Init()
uint8_t BMP280_Read(float *temperature, float *pressure);  // Returns 1 on success, 0 on error (pressure in hPa)

#ifdef __cplusplus
}
#endif

#endif /* INC_BMP280_H_ */
