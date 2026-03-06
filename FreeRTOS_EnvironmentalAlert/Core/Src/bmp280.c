/*
 * bmp280.c
 *
 *  Created on: Oct 21, 2025
 *      Author: janme
 */
#include "bmp280.h"
#include <stdio.h>

/* Private variables (calibration coefficients) */
static uint16_t dig_T1;
static int16_t dig_T2, dig_T3;
static uint16_t dig_P1;
static int16_t dig_P2, dig_P3, dig_P4, dig_P5, dig_P6, dig_P7, dig_P8, dig_P9;
static int32_t t_fine;  // Shared for temp/pressure compensation

/* Private Functions */
static void i2c_ensure_ready(void) {
    if (hi2c1.State != 0x20U) {  // HAL_I2C_STATE_READY
        printf("[DEBUG] I2C State not READY (0x%02X)—resetting...\n", hi2c1.State);
        HAL_I2C_DeInit(&hi2c1);
        HAL_Delay(10);
        if (HAL_I2C_Init(&hi2c1) != HAL_OK) {
            printf("[ERROR] I2C reinit failed!\n");
        }
    }
}

static HAL_StatusTypeDef i2c_scan(void) {
    printf("[DEBUG] Scanning I2C1 for devices...\n");
    uint8_t found = 0;
    for (uint8_t addr = 1; addr < 128; addr++) {
        i2c_ensure_ready();
        if (HAL_I2C_IsDeviceReady(&hi2c1, (uint16_t)(addr << 1), 1, 100) == HAL_OK) {
            printf("[DEBUG] Found I2C device at 0x%02X\n", addr);
            if (addr == 0x76 || addr == 0x77) found = 1;
        }
    }
    if (!found) {
        printf("[ERROR] No BMP280 (0x76/0x77) found on I2C1!\n");
        return HAL_ERROR;
    }
    return HAL_OK;
}

static HAL_StatusTypeDef read_chip_id(void) {
    i2c_ensure_ready();
    uint8_t chip_id = 0;
    HAL_StatusTypeDef status = HAL_I2C_Mem_Read(&hi2c1, BMP280_ADDRESS, BMP280_CHIP_ID_REG, I2C_MEMADD_SIZE_8BIT, &chip_id, 1, 1000);
    printf("[TEST] BMP Chip ID (exp 0x58): 0x%02X, Status: %d, ErrorCode: 0x%lX\n", chip_id, status, hi2c1.ErrorCode);
    if (status != HAL_OK || chip_id != 0x58) {
        printf("[ERROR] Invalid BMP280 ID (0x%02X)—check wiring/sensor!\n", chip_id);
        return HAL_ERROR;
    }
    return HAL_OK;
}

static HAL_StatusTypeDef write_reg(uint8_t reg, uint8_t data) {
    i2c_ensure_ready();
    uint8_t buf[2] = {reg, data};
    HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(&hi2c1, BMP280_ADDRESS, buf, 2, 1000);
    if (status != HAL_OK) {
        printf("[DEBUG] Reg 0x%02X write failed! Status: %d, ErrorCode: 0x%lX\n", reg, status, hi2c1.ErrorCode);
        return status;
    }
    return HAL_OK;
}

static HAL_StatusTypeDef read_regs(uint8_t reg, uint8_t *data, uint16_t len) {
    i2c_ensure_ready();
    HAL_StatusTypeDef status = HAL_I2C_Mem_Read(&hi2c1, BMP280_ADDRESS, reg, I2C_MEMADD_SIZE_8BIT, data, len, 1000);
    if (status != HAL_OK) {
        printf("[DEBUG] Regs 0x%02X read failed! Status: %d, ErrorCode: 0x%lX\n", reg, status, hi2c1.ErrorCode);
        return status;
    }
    return HAL_OK;
}

static void compensation_params(void) {
    uint8_t calib[24];
    if (read_regs(0x88, calib, 24) != HAL_OK) {
        printf("[ERROR] Calib read failed!\n");
        return;
    }
    // Parse calibration (per datasheet 8.1)
    dig_T1 = (uint16_t)((calib[1] << 8) | calib[0]);
    dig_T2 = (int16_t)((calib[3] << 8) | calib[2]);
    dig_T3 = (int16_t)((calib[5] << 8) | calib[4]);
    dig_P1 = (uint16_t)((calib[7] << 8) | calib[6]);
    dig_P2 = (int16_t)((calib[9] << 8) | calib[8]);
    dig_P3 = (int16_t)((calib[11] << 8) | calib[10]);
    dig_P4 = (int16_t)((calib[13] << 8) | calib[12]);
    dig_P5 = (int16_t)((calib[15] << 8) | calib[14]);
    dig_P6 = (int16_t)((calib[17] << 8) | calib[16]);
    dig_P7 = (int16_t)((calib[19] << 8) | calib[18]);
    dig_P8 = (int16_t)((calib[21] << 8) | calib[20]);
    dig_P9 = (int16_t)((calib[23] << 8) | calib[22]);
    // Debug all for verification
    printf("[DEBUG] Calib: T1=%u T2=%d T3=%d | P1=%u P2=%d P3=%d P4=%d P5=%d P6=%d P7=%d P8=%d P9=%d\n",
           dig_T1, dig_T2, dig_T3, dig_P1, dig_P2, dig_P3, dig_P4, dig_P5, dig_P6, dig_P7, dig_P8, dig_P9);
}

static int32_t compensate_temp(int32_t adc_T) {
    int64_t var1, var2;
    var1 = ((((int64_t)adc_T >> 3) - ((int64_t)dig_T1 << 1)) * (int64_t)dig_T2) >> 11;
    var2 = (((((int64_t)adc_T >> 4) - (int64_t)dig_T1) * (((int64_t)adc_T >> 4) - (int64_t)dig_T1)) >> 12 * (int64_t)dig_T3) >> 14;
    t_fine = (int32_t)(var1 + var2);
    int32_t T = (t_fine * 5 + 128) >> 8;  // 0.01 °C resolution
    return T;
}

static uint32_t compensate_press(int32_t adc_P) {
    int64_t var1, var2;
    int32_t p;  // Intermediate as int32_t, final uint32_t
    var1 = ((int64_t)t_fine >> 1) - 64000;
    var2 = (((var1 >> 2) * (var1 >> 2)) >> 11) * (int64_t)dig_P6;
    var2 = var2 + ((var1 * (int64_t)dig_P5) << 1);
    var2 = (var2 >> 2) + ((int64_t)dig_P4 << 16);
    var1 = (dig_P3 * (((var1 >> 2) * (var1 >> 2)) >> 13)) >> 3;
    var1 = var1 + ((dig_P2 * var1) >> 1);
    var1 = var1 >> 18;
    var1 = ((((32768 + var1)) * dig_P1) >> 15);
    if (var1 == 0) return 0;  // Avoid div/0
    p = (uint32_t)(((int32_t)1048576 - adc_P) - (var2 >> 12)) * 3125;
    if (p < 0x80000000) {
        p = ((p << 1) / (uint32_t)var1);
    } else {
        p = (p / (uint32_t)var1) * 2;
    }
    var1 = ((int64_t)dig_P9 * ((int64_t)(((p >> 3) * (p >> 3)) >> 13))) >> 12;
    var2 = (((int64_t)(p >> 2)) * (int64_t)dig_P8) >> 13;
    p = (uint32_t)((int32_t)p + ((var1 + var2 + dig_P7) >> 4));
    return (uint32_t)p;  // Pa
}

/* Public Functions */
void BMP280_Init(void) {
    HAL_Delay(100);
    if (i2c_scan() != HAL_OK) return;
    if (read_chip_id() != HAL_OK) return;
    // Soft reset
    if (write_reg(BMP280_RESET_REG, 0xB6) != HAL_OK) {
        printf("[ERROR] Reset failed!\n");
        return;
    }
    HAL_Delay(10);
    // Config: standby=62.5ms, filter=off
    if (write_reg(BMP280_CONFIG_REG, 0x00) != HAL_OK) return;
    // Ctrl: osrs_t=1, osrs_p=1, mode=normal
    if (write_reg(BMP280_CTRL_MEAS_REG, 0x27) != HAL_OK) return;
    compensation_params();
    printf("[DEBUG] BMP280 initialized successfully\n");
}

uint8_t BMP280_Read(float *temperature, float *pressure) {
    uint8_t data[6];
    if (read_regs(BMP280_PRESS_MSB_REG, data, 6) != HAL_OK) {
        printf("[DEBUG] Data read failed!\n");
        return 0;
    }
    // Parse 20-bit signed ADC
    int32_t adc_P = (int32_t)(((uint32_t)data[0] << 12) | ((uint32_t)data[1] << 4) | ((uint32_t)data[2] >> 4));
    int32_t adc_T = (int32_t)(((uint32_t)data[3] << 12) | ((uint32_t)data[4] << 4) | ((uint32_t)data[5] >> 4));

    int32_t temp = compensate_temp(adc_T);  // 0.01 °C
    uint32_t press_pa = compensate_press(adc_P);  // Pa

    *temperature = (float)temp / 100.0f;
    *pressure = (float)press_pa / 100.0f;  // hPa

    printf("[DEBUG] BMP: Temp=%.2f°C, Press=%.2f hPa (adc_T=0x%06lX, adc_P=0x%06lX)\n", *temperature, *pressure, adc_T, adc_P);
    return 1;
}
