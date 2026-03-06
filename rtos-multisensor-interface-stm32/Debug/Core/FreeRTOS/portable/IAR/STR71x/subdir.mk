################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/IAR/STR71x/port.c 

OBJS += \
./Core/FreeRTOS/portable/IAR/STR71x/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/IAR/STR71x/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/IAR/STR71x/%.o Core/FreeRTOS/portable/IAR/STR71x/%.su Core/FreeRTOS/portable/IAR/STR71x/%.cyclo: ../Core/FreeRTOS/portable/IAR/STR71x/%.c Core/FreeRTOS/portable/IAR/STR71x/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-STR71x

clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-STR71x:
	-$(RM) ./Core/FreeRTOS/portable/IAR/STR71x/port.cyclo ./Core/FreeRTOS/portable/IAR/STR71x/port.d ./Core/FreeRTOS/portable/IAR/STR71x/port.o ./Core/FreeRTOS/portable/IAR/STR71x/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-STR71x

