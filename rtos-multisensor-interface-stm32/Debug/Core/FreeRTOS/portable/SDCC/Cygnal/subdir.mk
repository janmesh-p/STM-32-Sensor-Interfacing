################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/SDCC/Cygnal/port.c 

OBJS += \
./Core/FreeRTOS/portable/SDCC/Cygnal/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/SDCC/Cygnal/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/SDCC/Cygnal/%.o Core/FreeRTOS/portable/SDCC/Cygnal/%.su Core/FreeRTOS/portable/SDCC/Cygnal/%.cyclo: ../Core/FreeRTOS/portable/SDCC/Cygnal/%.c Core/FreeRTOS/portable/SDCC/Cygnal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-SDCC-2f-Cygnal

clean-Core-2f-FreeRTOS-2f-portable-2f-SDCC-2f-Cygnal:
	-$(RM) ./Core/FreeRTOS/portable/SDCC/Cygnal/port.cyclo ./Core/FreeRTOS/portable/SDCC/Cygnal/port.d ./Core/FreeRTOS/portable/SDCC/Cygnal/port.o ./Core/FreeRTOS/portable/SDCC/Cygnal/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-SDCC-2f-Cygnal

