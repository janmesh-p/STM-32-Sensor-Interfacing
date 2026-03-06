################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.c 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.o Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.su Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.c Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d ./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o ./Core/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

