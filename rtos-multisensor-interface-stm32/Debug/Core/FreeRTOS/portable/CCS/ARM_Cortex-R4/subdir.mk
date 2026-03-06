################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.c 

OBJS += \
./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/%.o Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/%.su Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/%.cyclo: ../Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/%.c Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4

clean-Core-2f-FreeRTOS-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4:
	-$(RM) ./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.cyclo ./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.d ./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.o ./Core/FreeRTOS/portable/CCS/ARM_Cortex-R4/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4

