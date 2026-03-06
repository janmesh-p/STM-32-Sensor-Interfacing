/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "queue.h"
#include"timers.h"
#include "semphr.h"
#include "task.h"
#include "event_groups.h"

#include <stdio.h>
#include <string.h>
#include <stdint.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
struct AInfo
{
	uint8_t sizeString;
	uint8_t dataString[255];
};
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define BIT_0 (1<<0)
#define BIT_1 (1<<1)
#define BIT_2 (1<<2)
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart1;
DMA_HandleTypeDef hdma_usart1_rx;

/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};
/* USER CODE BEGIN PV */
#define DWT_CTRL (*(volatile uint32_t*)0xE0001000) //DWT_CYCLE COUNT REGISTER
#define ISR_POOL_SIZE 5  // Pre-alloc 5 structs for ISR
static struct AInfo isrPool[ISR_POOL_SIZE];
static uint8_t poolIndex = 0;
static uint8_t poolUsed = 0;
QueueHandle_t XQueue;
QueueHandle_t XQueueUart;
QueueHandle_t XQueueUartDMA;
uint8_t bufferRx[255];
TimerHandle_t xTimerAutoReload,xTimerOneShot;
SemaphoreHandle_t xSemaphoreBin_1=NULL;
SemaphoreHandle_t xSemaphoreBin_2=NULL;
SemaphoreHandle_t xSemaphoreCnt_1=NULL;
SemaphoreHandle_t xSemaphoreCnt_2=NULL;
SemaphoreHandle_t xMutex = NULL;

static TaskHandle_t xTaskNotifyHandle_1;
static TaskHandle_t xTaskNotifyHandle_2;

static EventGroupHandle_t xEventGroupHandle;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_USART1_UART_Init(void);
void StartDefaultTask(void *argument);

static void MX_NVIC_Init(void);
/* USER CODE BEGIN PFP */
void vTaskLed(void *pvParameters);
void vTaskLed_out(void *pvParameters);
void vTaskSendQueue(void *pvParameters);
void vTaskReceiveQueue(void *pvParameters);
void vTaskReceiveQueueUart(void *pvParameters);
void vTaskReceiveQueueUartDMA(void *pvParameters);
void vTaskDebug(void *pvParameters);

static void prvTimerOneShotCallback( TimerHandle_t xTimer);
static void prvTimerAutoReloadCallback( TimerHandle_t xTimer);
static void prvTimerCallback( TimerHandle_t xTimer);

void vTaskSemaphore_1 (void *pvParameters);
void vTaskSemaphore_2 (void *pvParameters);

void vTaskNotification_1(void *pvParameters);
void vTaskNotification_2(void *pvParameters);

void vTaskEvent_1 (void *pvpParameters);
void vTaskEvent_2 (void *pvpParameters);
void vTaskEventCheck (void *pvpParameters);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_USART1_UART_Init();

  /* Initialize interrupts */
  MX_NVIC_Init();
  /* USER CODE BEGIN 2 */
  HAL_UART_Receive_DMA(&huart1,bufferRx,255); //store data received into buffer array
  /* USER CODE END 2 */

  /* Init scheduler */
  osKernelInitialize();

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  xMutex= xSemaphoreCreateMutex();
   if(xMutex ==NULL)
   {
 	  HAL_UART_Transmit(&huart1, "Error while creating mutex", 26, 1000);
   }
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */

  /*xSemaphoreBin_1= xSemaphoreCreateBinary();
  xSemaphoreBin_2= xSemaphoreCreateBinary();

  if(xSemaphoreBin_1== NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating Semaphore 1",32,1000);
  }
  if(xSemaphoreBin_2==NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating Semaphore 2",32,1000);
  }*/
 /* xSemaphoreCnt_1= xSemaphoreCreateCounting(5,0);
  xSemaphoreCnt_2= xSemaphoreCreateCounting(5,0);

  if(xSemaphoreCnt_1== NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating Semaphore 1",32,1000);
  }
  if(xSemaphoreCnt_2==NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating Semaphore 2",32,1000);
  }*/


  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  //creating on-shot

  if((xTimerOneShot= xTimerCreate("Oneshot",pdMS_TO_TICKS(355),pdFALSE, 0, prvTimerCallback))==NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating ONE_SHOT Timer",35,1000);
  }
  else
  {
	  if(xTimerStart(xTimerOneShot,0)==pdFAIL)
	  {
		  HAL_UART_Transmit(&huart1,"Error during ONE_SHOT Timer start",33,1000);
	  }
  }

  //creating AUTORELOAD

  if((xTimerAutoReload= xTimerCreate("Auto Reload",pdMS_TO_TICKS(50),pdTRUE, 0, prvTimerCallback))==NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error While Creating AUTO_RELOAD Timer",35,1000);
  }
  else
  {
	  if(xTimerStart(xTimerAutoReload,0)==pdFAIL)
	  {
		  HAL_UART_Transmit(&huart1,"Error during AUTO_RELOAD Timer start",33,1000);
	  }
  }
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  //create 10 elements 30 bit queue
  if ((XQueue= xQueueCreate(10,sizeof(uint32_t)))== NULL)
  {
	  HAL_UART_Transmit(&huart1,"Error while Creating Queue",26,1000);
  }
  /*//50 elemetn 8 bit
  if ((XQueueUart= xQueueCreate(10,sizeof(uint8_t)))== NULL)
   {
 	  HAL_UART_Transmit(&huart1,"Error while Creating Queue UART",31,1000);
   }*/
  //5 element unsigned 32 bit
  if ((XQueueUartDMA= xQueueCreate(10,sizeof(struct AInfo *)))== NULL)
     {
   	  HAL_UART_Transmit(&huart1,"Error while Creating Queue UART DMA \n",31,1000);
     }
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  //Enable cycle counter
  DWT_CTRL |= (1<<0);
  SEGGER_SYSVIEW_Conf();
  SEGGER_SYSVIEW_Start();


  if((xTaskCreate(vTaskLed,"TASK LED", configMINIMAL_STACK_SIZE, NULL, 1, NULL))!=pdTRUE)
  {
	  HAL_UART_Transmit(&huart1,"Error while Creating TASK LED",29,1000);
  }
  if((xTaskCreate(vTaskLed_out,"TASK LED_OUT", configMINIMAL_STACK_SIZE, NULL, 1, NULL))!=pdTRUE)
    {
	  HAL_UART_Transmit(&huart1,"Error while Creating TASK LED_OUT",33,1000);
    }

  //Task to send Queue
 /* if((xTaskCreate(vTaskSendQueue,"TASK SEND QUEUE", configMINIMAL_STACK_SIZE, NULL, 1, NULL))!=pdTRUE)
      {
  	  HAL_UART_Transmit(&huart1,"Error while Creating TASK SEND QUEUE",37,1000);
      }
  if((xTaskCreate(vTaskReceiveQueue,"TASK RECEIVE QUEUE", configMINIMAL_STACK_SIZE, NULL, 1, NULL))!=pdTRUE)
        {
    	  HAL_UART_Transmit(&huart1,"Error while Creating TASK RECEIVE QUEUE",39,1000);
        }*/
 /* if((xTaskCreate(vTaskReceiveQueueUart,"TASK RECEIVE QUEUE UART", configMINIMAL_STACK_SIZE, NULL, 2, NULL))!=pdTRUE)
          {
      	  HAL_UART_Transmit(&huart1,"Error while Creating TASK RECEIVE QUEUE UART",44,1000);
         }*/
   /*if((xTaskCreate(vTaskReceiveQueueUartDMA,"TASK RECEIVE QUEUE UART DMA", configMINIMAL_STACK_SIZE*2, NULL, 2, NULL))!=pdTRUE)
           {
       	  HAL_UART_Transmit(&huart1,"Error while Creating TASK RECEIVE QUEUE UARTDMA\n",47,1000);
           }*/
//    if((xTaskCreate(vTaskDebug,"TASK Debug", configMINIMAL_STACK_SIZE*2, NULL, 1, NULL))!=pdTRUE)
//              {
//           	  HAL_UART_Transmit(&huart1,"Error while Creating Debug TASK",31,1000);
//               }
    //create task to receive semaphore 1- pushbtn input
    /*if((xTaskCreate(vTaskSemaphore_1,"TASK SEMAPHORE 1", configMINIMAL_STACK_SIZE*2, NULL, 2, NULL))!=pdTRUE)
    {
    	HAL_UART_Transmit(&huart1,"Error while Creating Semaphore 1",32,1000);
    }
    if((xTaskCreate(vTaskSemaphore_2,"TASK SEMAPHORE 2", configMINIMAL_STACK_SIZE*2, NULL, 2, NULL))!=pdTRUE)
        {
        	HAL_UART_Transmit(&huart1,"Error while Creating Semaphore 2",32,1000);
        }*/

  if((xTaskCreate(vTaskNotification_1, "TASK NOTIFY 1", configMINIMAL_STACK_SIZE*2, NULL, 1, &xTaskNotifyHandle_1))!= pdTRUE)
		{
			HAL_UART_Transmit(&huart1,"Error while Creating TASK NOTIFICATION 1",40,1000);
		}
  if((xTaskCreate(vTaskNotification_2, "TASK NOTIFY 2", configMINIMAL_STACK_SIZE*2, NULL, 1, &xTaskNotifyHandle_2))!= pdTRUE)
		{
			HAL_UART_Transmit(&huart1,"Error while Creating TASK NOTIFICATION 2",40,1000);
		}


  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
	xEventGroupHandle = xEventGroupCreate();

	//create task to set bit 0
	if((xTaskCreate(vTaskEvent_1, "TASK Event 1", configMINIMAL_STACK_SIZE*2, NULL, 1, &xTaskNotifyHandle_2))!= pdTRUE)
	{
		HAL_UART_Transmit(&huart1,"Error while Creating TASK Event 1",33,1000);
	}

	//create task to set bit 1
	if((xTaskCreate(vTaskEvent_2, "TASK Event 2", configMINIMAL_STACK_SIZE*2, NULL, 1, &xTaskNotifyHandle_2))!= pdTRUE)
	{
		HAL_UART_Transmit(&huart1,"Error while Creating TASK Event 2",33,1000);
	}

	//create task to set check event
	if((xTaskCreate(vTaskEventCheck, "TASK Event check", configMINIMAL_STACK_SIZE*2, NULL, 1, &xTaskNotifyHandle_2))!= pdTRUE)
	{
		HAL_UART_Transmit(&huart1,"Error while Creating TASK Event check",37,1000);
	}


  /* add events, ... */
  /* USER CODE END RTOS_EVENTS */

  /* Start scheduler */
  osKernelStart();

  /* We should never get here as control is now taken by the scheduler */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief NVIC Configuration.
  * @retval None
  */
static void MX_NVIC_Init(void)
{
  /* USART1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(USART1_IRQn, 5, 0);
  HAL_NVIC_EnableIRQ(USART1_IRQn);
}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */
  //__HAL_UART_ENABLE_IT(&huart1,UART_IT_RXNE);
  //__HAL_UART_ENABLE_IT(&huart1, UART_IT_IDLE);
  /* USER CODE END USART1_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel5_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel5_IRQn, 5, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel5_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED_IO_GPIO_Port, LED_IO_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED_OUT_GPIO_Port, LED_OUT_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : LED_IO_Pin */
  GPIO_InitStruct.Pin = LED_IO_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED_IO_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : BTN_K1_Pin BTN_K2_Pin */
  GPIO_InitStruct.Pin = BTN_K1_Pin|BTN_K2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : LED_OUT_Pin */
  GPIO_InitStruct.Pin = LED_OUT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED_OUT_GPIO_Port, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI15_10_IRQn, 5, 0);
  HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void vTaskLed(void *pvParameters)
{
	//variable decleration
	for(;;)
	{
		HAL_GPIO_TogglePin(LED_IO_GPIO_Port,LED_IO_Pin);
		vTaskDelay(50/portTICK_PERIOD_MS);
	}
	//Delete this task if loop is breaked
	vTaskDelete(NULL);
}
void vTaskLed_out(void *pvParameters)
{
	//variable decleration
	for(;;)
	{
		HAL_GPIO_TogglePin(LED_OUT_GPIO_Port,LED_OUT_Pin);
		vTaskDelay(50/portTICK_PERIOD_MS);
	}
	//Delete this task if loop is breaked
	vTaskDelete(NULL);
}

void vTaskSendQueue(void *pvParameters)
{
	uint32_t CounterSend=0;
	char txText[50];
	//vTaskSuspendAll();
	xSemaphoreTake(xMutex, portMAX_DELAY);
	HAL_UART_Transmit(&huart1,"\nStart Send Queue",16,1000);
	xSemaphoreGive(xMutex);
	//taskEXIT_CRITICAL();
	//xTaskResumeAll();
	for(;;)
	{
		//IF queue if full, wait until it is free
		//BE CAREFUL!!!! if queue never free the task will wait forever
		if((xQueueSend(XQueue, &CounterSend, 10/portTICK_PERIOD_MS ))==pdPASS)
		{
			sprintf(txText,"QUEUE SEND, Value:%ld (Spaces avail:%lu)\r\n", CounterSend,uxQueueSpacesAvailable(XQueue));
			//taskENTER_CRITICAL();
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
			//taskEXIT_CRITICAL();
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
			CounterSend++;
		}
		else
		{
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1,"QUEUE IS FULL! \t ",14,1000);
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
		}
		vTaskDelay(100/portTICK_PERIOD_MS);
	}
	vTaskDelete(NULL);
}
void vTaskReceiveQueue(void *pvParameters)
{
	uint32_t CounterReceive=0;
	char txText[50];
	//vTaskSuspendAll();
	xSemaphoreTake(xMutex, portMAX_DELAY);
	HAL_UART_Transmit(&huart1,"\nStart Receive Queue",19,1000);
	//taskEXIT_CRITICAL();
	xSemaphoreGive(xMutex);
	//xTaskResumeAll();
	for(;;)
	{
		//wait until queue receive value
		if((xQueueReceive(XQueue, &CounterReceive, 10/portTICK_PERIOD_MS ))==pdPASS)
		{
			sprintf(txText,"QUEUE RECEIVE, Value:%ld \n", CounterReceive);
			//taskENTER_CRITICAL();
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
			//taskEXIT_CRITICAL();
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
		}
		vTaskDelay(100/portTICK_PERIOD_MS);
	}
	vTaskDelete(NULL);
}

/*
void vTaskReceiveQueueUart(void *pvParameters)
{
	uint8_t txText;
	for(;;)
	{
		//wait until queue receive value
		if((xQueueReceive(XQueueUart, &txText, portMAX_DELAY ))==pdPASS)
		{
			//sprintf(txText,"QUEUE RECEIVE, Value:%ld \n", CounterReceive);
			//taskENTER_CRITICAL();
			vTaskSuspendAll();
			HAL_UART_Transmit(&huart1,txText,1,1000);
			//taskEXIT_CRITICAL();
			xTaskResumeAll();
		}
		vTaskDelay(100/portTICK_PERIOD_MS);
	}
	vTaskDelete(NULL);
}
*/

void vTaskReceiveQueueUartDMA(void *pvParameters)
{
	struct AInfo * pxInfoTx;
	for(;;)
	{
		//wait until queue receive value
		if((xQueueReceive(XQueueUart, &pxInfoTx, portMAX_DELAY ))==pdPASS)
		{
			//sprintf(txText,"QUEUE RECEIVE, Value:%ld \n", CounterReceive);
			//taskENTER_CRITICAL();
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1,pxInfoTx->dataString,pxInfoTx->sizeString,1000);
			//taskEXIT_CRITICAL();
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
		}
		vTaskDelay(100/portTICK_PERIOD_MS);
	}
	vTaskDelete(NULL);
}

/*void USART_UserInt(UART_HandleTypeDef* huart)
{
	uint8_t rxChar;
	static portBASE_TYPE XHigherPriorityTaskWoken;

	XHigherPriorityTaskWoken = pdFALSE;

	HAL_UART_Receive(&huart1, &rxChar,1,10);
	xQueueSendFromISR(XQueueUart, &rxChar, &XHigherPriorityTaskWoken);

	//insert token at end of isr
	portYEILD_FROM_ISR(XHigherPriorityTaskWoken);
}*/
void USART_UserInt(UART_HandleTypeDef* huart) {
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    uint8_t dataLength;

    if (huart->Instance == USART1 && __HAL_UART_GET_FLAG(huart, UART_FLAG_IDLE) != RESET) {
        __HAL_UART_CLEAR_IDLEFLAG(huart);
        HAL_UART_DMAStop(huart);

        dataLength = 255 - __HAL_DMA_GET_COUNTER(&hdma_usart1_rx);
        if (dataLength > 0 && poolUsed < ISR_POOL_SIZE) {  // Only if data & pool avail
            struct AInfo *pxInfoRx = &isrPool[poolIndex];
            pxInfoRx->sizeString = dataLength;
            memcpy(pxInfoRx->dataString, bufferRx, dataLength);
            xQueueSendFromISR(XQueueUartDMA, &pxInfoRx, &xHigherPriorityTaskWoken);  // Send ptr to pool slot
            poolIndex = (poolIndex + 1) % ISR_POOL_SIZE;
            poolUsed++;
        }
        HAL_UART_Receive_DMA(huart, bufferRx, 255);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}

void vTaskDebug(void *pvParameters)
{
	//variable decleration
	uint8_t txText[512];
	for(;;)
	{

		vTaskList(txText);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		HAL_UART_Transmit(&huart1,"\n\n",2,1000);
		HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
		HAL_UART_Transmit(&huart1,"\n\n",2,1000);
		memset(txText,0,sizeof(txText));
		sprintf(txText,"TOTAL FREE HEAP SIZE: %d bytes \n\n",xPortGetMinimumEverFreeHeapSize());
		HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();
		vTaskDelay(5000/portTICK_PERIOD_MS);
	}
	//Delete this task if loop is breaked
	vTaskDelete(NULL);
}

static void prvTimerOneShotCallback(TimerHandle_t xTimer)
{
	TickType_t xTimeNow;
	uint8_t txText[200];

	xTimeNow=xTaskGetTickCount();

	//vTaskSuspendAll();
	xSemaphoreTake(xMutex, portMAX_DELAY);
	sprintf(txText,"Timer Oneshot callback, timestamp: %ld\r\n",xTimeNow);
	HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
	xSemaphoreGive(xMutex);
	//xTaskResumeAll();

}
static void prvTimerAutoReloadCallback(TimerHandle_t xTimer)
{
	TickType_t xTimeNow;
	uint8_t txText[200];

	xTimeNow=xTaskGetTickCount();

	//vTaskSuspendAll();
	xSemaphoreTake(xMutex, portMAX_DELAY);
	sprintf(txText,"Timer Auto Reload callback, timestamp: %ld\r\n",xTimeNow);
	HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
	xSemaphoreGive(xMutex);
	//xTaskResumeAll();

}

static void prvTimerCallback(TimerHandle_t xTimer)
{
	TickType_t xTimeNow;
	uint8_t txText[200];
	static uint32_t Count_AutoReload;

	xTimeNow=xTaskGetTickCount();

	//vTaskSuspendAll();
	xSemaphoreTake(xMutex, portMAX_DELAY);
	if (xTimer == xTimerOneShot)
	{
		sprintf(txText,"Oneshot Execution, timestamp: %ld\r\n",xTimeNow);
	}
	else
	{
		Count_AutoReload++;
		if(Count_AutoReload==10)
		{
			xTimerChangePeriod(xTimer,pdMS_TO_TICKS(300),0);

		}
		sprintf(txText,"AutoReload Execution, timestamp: %ld\r\n",xTimeNow);

	}

	HAL_UART_Transmit(&huart1,txText,strlen(txText),1000);
	xSemaphoreGive(xMutex);
	//xTaskResumeAll();

}


void vTaskSemaphore_1 ( void *pvParameters)
{
	//infinte loop
	for(;;)
	{
//		xSemaphoreTake(xSemaphoreBin_1,portMAX_DELAY);
		xSemaphoreTake(xSemaphoreCnt_1,portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		HAL_UART_Transmit(&huart1, "BTN k1 pressed", 14, 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();
	}
	vTaskDelete(NULL);
}

void vTaskSemaphore_2 ( void *pvParameters)
{
	//infinte loop
	for(;;)
	{
//		xSemaphoreTake(xSemaphoreBin_2,portMAX_DELAY);
		xSemaphoreTake(xSemaphoreCnt_2,portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		HAL_UART_Transmit(&huart1, "BTN k2 pressed", 14, 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();
	}
	vTaskDelete(NULL);
}


void vTaskNotification_1 (void *pvParameters)
{
	uint32_t ulnotificvalue;
	uint8_t txText[100];
	for(;;)
	{

		ulnotificvalue=ulTaskNotifyTake(pdFALSE, portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		sprintf(txText,"Button K1 pressed:%ld \r\n",ulnotificvalue);
		HAL_UART_Transmit(&huart1, txText, strlen(txText), 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();

	}
	vTaskDelete(NULL);
}
void vTaskNotification_2 (void *pvParameters)
{
	uint32_t ulnotificvalue;
	uint8_t txText[100];
	for(;;)
	{

		ulnotificvalue=ulTaskNotifyTake(pdFALSE, portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		sprintf(txText,"Button K2 pressed:%ld \r\n",ulnotificvalue);
		HAL_UART_Transmit(&huart1, txText, strlen(txText), 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();

	}
	vTaskDelete(NULL);
}

void vTaskEvent_1 (void *pvParameters)
{

	for(;;)
	{
		//xEventGroupSync(xEventGroupHandle, BIT_0, BIT_0 | BIT_1 | BIT_2, portMAX_DELAY);
		xEventGroupWaitBits(xEventGroupHandle, BIT_0, pdTRUE,pdTRUE, portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		HAL_UART_Transmit(&huart1, "BIT 0 SET and synced\r\n", 22, 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();
		//xEventGroupSetBits(xEventGroupHandle, BIT_0);
		//vTaskDelay(3000 /portTICK_PERIOD_MS);

	}
	vTaskDelete(NULL);
}
void vTaskEvent_2 (void *pvParameters)
{

	for(;;)
	{
		//xEventGroupSync(xEventGroupHandle, BIT_1, BIT_0 | BIT_1 | BIT_2, portMAX_DELAY);
		xEventGroupWaitBits(xEventGroupHandle, BIT_0, pdTRUE,pdTRUE, portMAX_DELAY);
		//vTaskSuspendAll();
		xSemaphoreTake(xMutex, portMAX_DELAY);
		HAL_UART_Transmit(&huart1, "BIT 0 SET and synced\r\n", 22, 1000);
		xSemaphoreGive(xMutex);
		//xTaskResumeAll();
		//xEventGroupSetBits(xEventGroupHandle, BIT_1);
		//vTaskDelay(10000 /portTICK_PERIOD_MS);

	}
	vTaskDelete(NULL);
}

void vTaskEventCheck (void *pvParameters)
{
	EventBits_t getBits;

	for(;;)
	{
		/*getBits = xEventGroupWaitBits(xEventGroupHandle, BIT_0 | BIT_1, pdTRUE, pdTRUE, portMAX_DELAY);
		if((getBits &(BIT_0 | BIT_1))==(BIT_0 | BIT_1))
		{
			vTaskSuspendAll();
			HAL_UART_Transmit(&huart1, "Both bits were set\r\n", 20, 1000);
			xTaskResumeAll();
		}
		else if((getBits & BIT_0)!=0)
		{
			vTaskSuspendAll();
			HAL_UART_Transmit(&huart1, "EVent group BIT_0 was set\r\n", 27, 1000);
			xTaskResumeAll();
		}
		else if((getBits & BIT_1)!=0)
		{
			vTaskSuspendAll();
			HAL_UART_Transmit(&huart1, "EVent group BIT_1 was set\r\n", 27, 1000);
			xTaskResumeAll();
		}*/
		getBits = xEventGroupSync(xEventGroupHandle, BIT_2, BIT_0 | BIT_1 | BIT_2, 5000/portTICK_PERIOD_MS);
		if((getBits & (BIT_0|BIT_1|BIT_2))== (BIT_0|BIT_1|BIT_2))
		{
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1, "All events synced\r\n", 19, 1000);
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
		}
		else
		{
			//vTaskSuspendAll();
			xSemaphoreTake(xMutex, portMAX_DELAY);
			HAL_UART_Transmit(&huart1, "All events synced failed!! TIMEOUT\r\n", 36, 1000);
			xSemaphoreGive(xMutex);
			//xTaskResumeAll();
		}
		xEventGroupSetBits(xEventGroupHandle, BIT_0);

	}
	vTaskDelete(NULL);
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	BaseType_t xHigherPriorityTaskWoken;
	static uint32_t cnt_1=0;
	static uint32_t cnt_2=0;
	uint32_t ulPreviousValue_1;
	uint32_t ulPreviousValue_2;

	xHigherPriorityTaskWoken=pdFALSE;
	if(GPIO_Pin == BTN_K2_Pin)
	{
//		xSemaphoreGiveFromISR(xSemaphoreBin_2,&xHigherPriorityTaskWoken);
		/*xSemaphoreGiveFromISR(xSemaphoreCnt_2,&xHigherPriorityTaskWoken);
		xSemaphoreGiveFromISR(xSemaphoreCnt_2,&xHigherPriorityTaskWoken);
		xSemaphoreGiveFromISR(xSemaphoreCnt_2,&xHigherPriorityTaskWoken);*/
		/*vTaskNotifyGiveFromISR(xTaskNotifyHandle_2, &xHigherPriorityTaskWoken);
		vTaskNotifyGiveFromISR(xTaskNotifyHandle_2, &xHigherPriorityTaskWoken);
		vTaskNotifyGiveFromISR(xTaskNotifyHandle_2, &xHigherPriorityTaskWoken);*/
		cnt_2++;
		xTaskNotifyAndQueryFromISR(xTaskNotifyHandle_2,cnt_2,eSetValueWithoutOverwrite,&ulPreviousValue_2,&xHigherPriorityTaskWoken);
	}
	if(GPIO_Pin == BTN_K1_Pin)
	{
//		xSemaphoreGiveFromISR(xSemaphoreBin_1,&xHigherPriorityTaskWoken);
		/*xSemaphoreGiveFromISR(xSemaphoreCnt_1,&xHigherPriorityTaskWoken);
		xSemaphoreGiveFromISR(xSemaphoreCnt_1,&xHigherPriorityTaskWoken);
		xSemaphoreGiveFromISR(xSemaphoreCnt_1,&xHigherPriorityTaskWoken);*/
		/*vTaskNotifyGiveFromISR(xTaskNotifyHandle_1, &xHigherPriorityTaskWoken);
		vTaskNotifyGiveFromISR(xTaskNotifyHandle_1, &xHigherPriorityTaskWoken);
		vTaskNotifyGiveFromISR(xTaskNotifyHandle_1, &xHigherPriorityTaskWoken);*/
		cnt_1++;
		xTaskNotifyAndQueryFromISR(xTaskNotifyHandle_1,cnt_1,eSetValueWithoutOverwrite,&ulPreviousValue_1,&xHigherPriorityTaskWoken);
	}
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
/* USER CODE END 4 */

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN 5 */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END 5 */
}

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM4 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM4)
  {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
