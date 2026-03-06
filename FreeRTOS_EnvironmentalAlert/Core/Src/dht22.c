/*
 * dht22.c
 *
 *  Created on: Oct 21, 2025
 *      Author: janme
 */
#include "dht22.h"
#include <stdio.h>
/* Private variables */
static uint8_t TOUT = 0, CheckSum, i;

/* Private Functions */
static void Set_Pin_Output(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin) {
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}

static void Set_Pin_Input(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin) {
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}

static void delay_us(uint16_t us) {
  __HAL_TIM_SET_COUNTER(&htim3, 0);
  while (__HAL_TIM_GET_COUNTER(&htim3) < us);
}

static void start_signal(void) {
  Set_Pin_Output(DHT22_PORT, DHT22_PIN);

  HAL_GPIO_WritePin(DHT22_PORT, DHT22_PIN, GPIO_PIN_RESET);
  HAL_Delay(2);  // Reduced for efficiency
  HAL_GPIO_WritePin(DHT22_PORT, DHT22_PIN, GPIO_PIN_SET);
  delay_us(30);

  Set_Pin_Input(DHT22_PORT, DHT22_PIN);
}

static uint8_t check_response(void) {
  TOUT = 0;
  __HAL_TIM_SET_COUNTER(&htim3, 0);
  while (!HAL_GPIO_ReadPin(DHT22_PORT, DHT22_PIN) && (__HAL_TIM_GET_COUNTER(&htim3) < 150)) {}  // Increased timeout
  if (__HAL_TIM_GET_COUNTER(&htim3) >= 150) return 0;

  __HAL_TIM_SET_COUNTER(&htim3, 0);
  while (HAL_GPIO_ReadPin(DHT22_PORT, DHT22_PIN) && (__HAL_TIM_GET_COUNTER(&htim3) < 150)) {}
  if (__HAL_TIM_GET_COUNTER(&htim3) >= 150) return 0;

  return 1;
}

static uint8_t read_byte(void) {
  uint8_t num = 0;
  uint32_t tickstart;
  for (i = 0; i < 8; i++) {
    // Wait for high edge with timeout
    tickstart = HAL_GetTick();
    while (!HAL_GPIO_ReadPin(DHT22_PORT, DHT22_PIN)) {
      if ((HAL_GetTick() - tickstart) > 2) return 0xFF;  // 2ms per bit max
    }
    __HAL_TIM_SET_COUNTER(&htim3, 0);
    // Time high duration
    tickstart = HAL_GetTick();
    while (HAL_GPIO_ReadPin(DHT22_PORT, DHT22_PIN)) {
      if ((HAL_GetTick() - tickstart) > 2) return 0xFF;  // Prevent hang
    }
    if (__HAL_TIM_GET_COUNTER(&htim3) > 50)  // Increased to 50μs for jitter tolerance
      num |= (1 << (7 - i));
  }
  return num;
}

/* Public Functions */
void DHT22_Init(void) {
  HAL_TIM_Base_Start(&htim3);
}

uint8_t DHT22_Read(float *temperature, float *humidity) {
  uint8_t T_Byte1, T_Byte2, RH_Byte1, RH_Byte2;

  start_signal();
  uint8_t check = check_response();
  if (!check) {
    return 0;
  }

  RH_Byte1 = read_byte();
  if (RH_Byte1 == 0xFF) return 0;
  RH_Byte2 = read_byte();
  if (RH_Byte2 == 0xFF) return 0;
  T_Byte1 = read_byte();
  if (T_Byte1 == 0xFF) return 0;
  T_Byte2 = read_byte();
  if (T_Byte2 == 0xFF) return 0;
  CheckSum = read_byte();
  if (CheckSum == 0xFF) return 0;

  // Debug raw bytes
  printf("[DEBUG] Raw bytes: RH1=0x%02X, RH2=0x%02X, T1=0x%02X, T2=0x%02X ACTUAL CHK=0x%02X\n",
         RH_Byte1, RH_Byte2, T_Byte1, T_Byte2, CheckSum);

  // Fixed checksum calc (uint8_t with explicit mod 256)
  uint8_t calc_checksum = ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF);
  printf("CALC CHK= 0x%02X\n", calc_checksum);

  if (CheckSum != calc_checksum) {
    printf("[DEBUG] Checksum mismatch!\n");
    return 0;
  }

  // Parse
  uint16_t rh = (RH_Byte1 << 8) | RH_Byte2;
  uint16_t temp_raw = (T_Byte1 << 8) | T_Byte2;
  uint8_t sign = 0;
  if (temp_raw > 0x8000) {
    temp_raw &= 0x7FFF;
    sign = 1;
  }
  *humidity = (float)rh / 10.0f;
  *temperature = (float)((sign ? -1 : 1) * temp_raw) / 10.0f;

  printf("[DEBUG] Parsed: Temp=%.1f C, Humidity=%.1f %%\n", *temperature, *humidity);
  return 1;
}
