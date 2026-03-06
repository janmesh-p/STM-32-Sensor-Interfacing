/*
 * mq2.h
 *
 *  Created on: Oct 22, 2025
 *      Author: janme
 */

#ifndef MQ2_H
#define MQ2_H

#include "main.h"  // HAL includes
#include <math.h>  // For log10, pow

// Function prototypes
void MQ2_Init(void);  // Initialize ADC (calls MX_ADC1_Init)
float MQ2_Calibrate(void);  // Calibrate Ro in clean air (call once after preheat)
float MQ2_ReadRaw(void);  // Read averaged ADC and return Rs (sensor resistance)
float MQ2_GetRatio(void);  // Get Rs/Ro ratio (use after calibration)
int MQ2_GetPPM(int gas_type);  // Get PPM for gas (0=LPG, 1=Smoke)

// Defines
#define MQ2_SAMPLE_COUNT 5  // Number of ADC samples for averaging
#define MQ2_SAMPLE_PAUSE_MS 10  // Delay between samples (ms)
#define MQ2_PREHEAT_MS 60000  // 1 min preheat
#define MQ2_LPG 0
#define MQ2_SMOKE 1

// Globals (external for main.c access)
extern float MQ2_Ro;  // Calibrated Ro value
extern uint16_t MQ2_ADC_Raw;  // Last raw ADC value

#endif /* MQ2_H */
