################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/Renesas/RX600/port.c 

OBJS += \
./Core/FreeRTOS/portable/Renesas/RX600/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/Renesas/RX600/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/Renesas/RX600/%.o Core/FreeRTOS/portable/Renesas/RX600/%.su Core/FreeRTOS/portable/Renesas/RX600/%.cyclo: ../Core/FreeRTOS/portable/Renesas/RX600/%.c Core/FreeRTOS/portable/Renesas/RX600/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-Renesas-2f-RX600

clean-Core-2f-FreeRTOS-2f-portable-2f-Renesas-2f-RX600:
	-$(RM) ./Core/FreeRTOS/portable/Renesas/RX600/port.cyclo ./Core/FreeRTOS/portable/Renesas/RX600/port.d ./Core/FreeRTOS/portable/Renesas/RX600/port.o ./Core/FreeRTOS/portable/Renesas/RX600/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-Renesas-2f-RX600

