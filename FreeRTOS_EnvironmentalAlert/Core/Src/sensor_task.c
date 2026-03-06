#include "cmsis_os2.h"
#include "sensor_task.h"
#include "rtos_objects.h"

#include "main.h"
#include "dht22.h"
#include "bmp280.h"
#include "mq2.h"
#include "stdio.h"
#include "string.h"

/* External handles */
extern I2C_HandleTypeDef hi2c1;
extern ADC_HandleTypeDef hadc1;
extern UART_HandleTypeDef huart2;

/* Forward declaration for ADC start */
static void start_adc_conversion(void);
volatile uint16_t last_adc_value = 0;

/* === Task init === */
void sensor_task_init(void)
{
  const osThreadAttr_t attr = {
    .name = "SensorTask",
    .stack_size = 1024,
    .priority = 1
  };
  sensorTaskHandle = osThreadNew(vSensorTask, NULL, &attr);
}

/* === ADC helper === */
static void start_adc_conversion(void)
{
  HAL_ADC_Start_IT(&hadc1);  // interrupt mode; on complete HAL_ADC_ConvCpltCallback releases semaphore
}

/* === Main task === */
void vSensorTask(void *argument)
{
  (void) argument;

  SensorSample_t s;
  char buffer[128];
  osDelay(100);
  for (;;)
  {

	  HAL_UART_Transmit(&huart2, (uint8_t*)"LOOP_START\n", 11, 100);
	      HAL_GPIO_TogglePin(LD4_GPIO_Port, LD4_Pin);  // Heartbeat

	      float temp_c = -100.0f, hum = -1.0f, bmp_temp = 0.0f, bmp_press = 0.0f;  // Defaults
	      char buffer[128];

	      // DHT22
	      HAL_UART_Transmit(&huart2, (uint8_t*)"Before DHT\n", 11, 100);
	      if (DHT22_Read(&temp_c, &hum)) {
	          //s.temp_c = temp_c;
	          s.humidity_pct = hum;
	      } else {
	          //s.temp_c = 0.0f;
	          s.humidity_pct = 0.0f;
	      }
	      HAL_UART_Transmit(&huart2, (uint8_t*)"After DHT\n", 10, 100);

	      // BMP280
	      HAL_UART_Transmit(&huart2, (uint8_t*)"Before BMP\n", 11, 100);
	      if (BMP280_Read(&bmp_temp, &bmp_press)) {
	          s.pressure_hpa = bmp_press;
	          s.temp_c = bmp_temp;
	      } else {
	          s.pressure_hpa = 0.0f;
	          s.temp_c=0.0f;
	      }
	      HAL_UART_Transmit(&huart2, (uint8_t*)"After BMP\n", 10, 100);

	      // MQ2 LPG
	      HAL_UART_Transmit(&huart2, (uint8_t*)"Before MQ2_LPG\n", 14, 100);
	      int lpg_ppm = MQ2_GetPPM(MQ2_LPG);
	      HAL_UART_Transmit(&huart2, (uint8_t*)"After MQ2_LPG\n", 13, 100);
	      s.mq2_lpg_ppm=lpg_ppm;

	      // MQ2 Smoke
	      HAL_UART_Transmit(&huart2, (uint8_t*)"Before MQ2_SMOKE\n", 15, 100);
	      int smoke_ppm = MQ2_GetPPM(MQ2_SMOKE);
	      HAL_UART_Transmit(&huart2, (uint8_t*)"After MQ2_SMOKE\n", 14, 100);
	      s.mq2_smoke_ppm=smoke_ppm;
	      s.mq2_adc_raw = MQ2_ADC_Raw;

	      // LD3 control (unchanged)
	      if (smoke_ppm > 1000) {
	          HAL_GPIO_WritePin(LD3_GPIO_Port, LD3_Pin, GPIO_PIN_SET);
	      } else {
	          HAL_GPIO_WritePin(LD3_GPIO_Port, LD3_Pin, GPIO_PIN_RESET);
	      }

	      // Format & transmit (use snprintf for safety; remove printf debug line)
	      int len = snprintf(buffer, sizeof(buffer),
	                         "\nTemp=%.1fC RH=%.1f%% \nBMP_T=%.1fC P=%.1f hPa\n LPG=%d Smoke=%d PPM\n",
	                         s.temp_c, s.humidity_pct, bmp_temp, s.pressure_hpa, s.mq2_lpg_ppm, s.mq2_smoke_ppm);
	      osMessageQueuePut(sensorQueueHandle, &s, 0, 10); // pushing sample to queue before UART transmission
	      HAL_UART_Transmit(&huart2, (uint8_t*)buffer, len, 500);  // Shorter timeout

	      HAL_UART_Transmit(&huart2, (uint8_t*)"LOOP_END\n", 9, 100);
	      //osDelay(2000);

	  // -----------------------------TEST------------------------------
	/*  HAL_UART_Transmit(&huart2, (uint8_t*)"IN\n", 4, 100);
	  HAL_GPIO_TogglePin(LD4_GPIO_Port, LD4_Pin);  // heartbeat LED
	  float temp_c, hum,bmp_temp,bmp_press;
	 	  char buffer[128];
	 	  if (DHT22_Read(&temp_c, &hum)) {
	 		  //printf("Temp = %.1f C, RH = %.1f %%\r\n", temp_c, hum);
	 		  s.temp_c=temp_c;
	 		  s.humidity_pct=hum;
	 	  } else {

	 		  printf("Error Reading!\n");
	 	  }
	 	  if (BMP280_Read(&bmp_temp, &bmp_press)) {
	 	      //printf("BMP Temp = %.1f C, Press = %.1f hPa\r\n", bmp_temp, bmp_press);
	 		  s.pressure_hpa=bmp_press;
	 	  } else {
	 	      printf("BMP Error Reading!\n");
	 	  }
	 	  int lpg_ppm = MQ2_GetPPM(MQ2_LPG);
	 	  int smoke_ppm = MQ2_GetPPM(MQ2_SMOKE);

	 	  // Use results (example: LED on PA5 if smoke >1000 PPM)
	 	  if (smoke_ppm > 1000) {
	 	      HAL_GPIO_WritePin(LD3_GPIO_Port, LD3_Pin, GPIO_PIN_SET);  // LED on
	 	  } else {
	 	      HAL_GPIO_WritePin(LD3_GPIO_Port, LD3_Pin, GPIO_PIN_RESET);
	 	  }
	 	  //printf("ADC:%hu LPG:%d Smoke:%d PPM\r\n", MQ2_ADC_Raw, lpg_ppm, smoke_ppm);
	 	  s.mq2_adc_raw=MQ2_ADC_Raw;
	 	  sprintf(buffer,"\nTemp = %.1f C, RH = %.1f %%,\nBMP Temp = %.1f C, Press = %.1f hPa, \nLPG:%d Smoke:%d PPM \n",
	 			  temp_c,hum,bmp_temp,bmp_press,lpg_ppm,smoke_ppm);
	 	  printf("\n-----------%s     %d-------------",buffer,strlen(buffer));
	 	  HAL_UART_Transmit(&huart2, (uint8_t *)buffer, strlen(buffer), 2000);*/

	  //-------------------------------------ORIGINAL------------------------------------------
    /* === DHT22 === */
	 /* HAL_UART_Transmit(&huart2,(uint8_t*) "DHT22_in\n", 10, 100);
    if (DHT22_Read(&s.temp_c, &s.humidity_pct) == 0) {
      s.temp_c = -100.0f;  // signal error
      s.humidity_pct = -1.0f;
    }
    HAL_UART_Transmit(&huart2,(uint8_t*) "DHT22_out\n", 11, 100);

     === BMP280 ===
    HAL_UART_Transmit(&huart2, (uint8_t*)"BMp280_in\n", 11, 100);
    if (osMutexAcquire(i2c_mutex, 10) == osOK) {
      float bmp_t, bmp_p;
      if (BMP280_Read(&bmp_t, &bmp_p)) {
        s.pressure_hpa = bmp_p;
      } else {
        s.pressure_hpa = 0.0f;
      }
      osMutexRelease(i2c_mutex);
    }
    HAL_UART_Transmit(&huart2, (uint8_t*)"BMP280_out\n", 12, 100);

     === MQ-2 ===
    HAL_UART_Transmit(&huart2,(uint8_t*) "mq2-in\n", 8, 100);
    start_adc_conversion();
    if (osSemaphoreAcquire(adc_done_sem, 100) == osOK) {
      s.mq2_adc_raw = last_adc_value;
    } else {
      s.mq2_adc_raw = 0xFFFF;
    }

    //s.timestamp_ms = osKernelGetTickCount();
    HAL_UART_Transmit(&huart2, (uint8_t*)"uart\2", 6, 100);
     === Send via UART for debug ===
    int len = snprintf(buffer, sizeof(buffer),
                       "DHT: %.1fC %.1f%% | BMP: %.1f hPa | MQ2: %u\r\n",
                       s.temp_c, s.humidity_pct, s.pressure_hpa, s.mq2_adc_raw);

    HAL_UART_Transmit(&huart2, (uint8_t*)buffer, len, 1000);

    HAL_UART_Transmit(&huart2, (uint8_t*)"last\n", 6, 100);*/
    osDelay(2000);
  }
  vTaskDelete(NULL);
}
