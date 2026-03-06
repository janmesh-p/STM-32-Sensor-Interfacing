/*
 * mq2.c
 *
 *  Created on: Oct 22, 2025
 *      Author: janme
 */

#include "mq2.h"
#include <stdlib.h>  // For averaging

// External ADC handle (from main.c or stm32f1xx_hal_msp.c)
extern ADC_HandleTypeDef hadc1;

// Internal globals
static float MQ2_Rl_Value = 10.0f;  // Load resistor (kOhm) - check your MQ-2 module
static float MQ2_Ro_Clean_Air_Factor = 9.83f;  // From datasheet
static float MQ2_LPGCurve[3] = {2.3f, 0.20f, -0.45f};  // a, b, c for LPG: PPM = 10^( (log10(Rs/Ro)-b)/c + a )
static float MQ2_SmokeCurve[3] = {2.3f, 0.53f, -0.43f};  // For Smoke

// Global for external access
float MQ2_Ro = 10.0f;  // Default; calibrated value
uint16_t MQ2_ADC_Raw = 0;

// Calculate Rs from raw ADC (avoids div-by-zero)
static float MQ2_ResistanceFromADC(uint16_t adc_val) {
    if (adc_val <= 3) {  // Noise floor
        return MQ2_Rl_Value * 10000.0f;  // Max resistance (clean air)
    }
    // Rs = (Rl * (4095 - ADC)) / ADC  (for 12-bit, 3.3V ref; adjust Vref if 5V)
    return (MQ2_Rl_Value * (4095.0f - (float)adc_val)) / (float)adc_val;
}

// Average ADC reads
static float MQ2_AverageRead(void) {
    uint32_t sum = 0;
    uint16_t val;
    uint32_t i;
    for (i = 0; i < MQ2_SAMPLE_COUNT; i++) {
        if (HAL_ADC_Start(&hadc1) != HAL_OK) return 0;  // Error handling
        if (HAL_ADC_PollForConversion(&hadc1, 10) != HAL_OK) continue;  // 10ms timeout
        val = HAL_ADC_GetValue(&hadc1);
        sum += val;
        HAL_Delay(MQ2_SAMPLE_PAUSE_MS);
    }
    MQ2_ADC_Raw = (uint16_t)(sum / MQ2_SAMPLE_COUNT);  // Update global
    return MQ2_ResistanceFromADC(MQ2_ADC_Raw);
}


float MQ2_Calibrate(void) {
    float rs_clean = MQ2_AverageRead();
    MQ2_Ro = rs_clean / MQ2_Ro_Clean_Air_Factor;
    return MQ2_Ro;
}

float MQ2_ReadRaw(void) {
   // HAL_Delay(MQ2_PREHEAT_MS / 10);  // Short preheat check if needed
    return MQ2_AverageRead();
}

float MQ2_GetRatio(void) {
    if (MQ2_Ro <= 0.0f) return 0.0f;  // Not calibrated
    float rs = MQ2_ReadRaw();
    return rs / MQ2_Ro;
}

static int MQ2_CurveFit(float ratio, float *curve) {
    if (ratio <= 0.0f) return 0;
    float log_ratio = log10f(ratio);
    float exponent = (log_ratio - curve[1]) / curve[2] + curve[0];
    return (int)powf(10.0f, exponent);
}

int MQ2_GetPPM(int gas_type) {
    float ratio = MQ2_GetRatio();
    if (gas_type == MQ2_LPG) {
        return MQ2_CurveFit(ratio, MQ2_LPGCurve);
    } else if (gas_type == MQ2_SMOKE) {
        return MQ2_CurveFit(ratio, MQ2_SmokeCurve);
    }
    return 0;
}
