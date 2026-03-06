################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.c 

OBJS += \
./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o 

C_DEPS += \
./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
USB_HOST/SEGGER/Config/%.o USB_HOST/SEGGER/Config/%.su USB_HOST/SEGGER/Config/%.cyclo: ../USB_HOST/SEGGER/Config/%.c USB_HOST/SEGGER/Config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32/newproject/Middlewares/Third_Party/SEGGER" -I"D:/stm32/newproject/Middlewares/Third_Party/SEGGER/Config" -I"D:/stm32/newproject/Middlewares/Third_Party/SEGGER/OS" -I"D:/stm32/newproject/Middlewares/Third_Party/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-USB_HOST-2f-SEGGER-2f-Config

clean-USB_HOST-2f-SEGGER-2f-Config:
	-$(RM) ./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.cyclo ./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d ./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o ./USB_HOST/SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.su

.PHONY: clean-USB_HOST-2f-SEGGER-2f-Config

