################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.c 

OBJS += \
./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/BCC/16BitDOS/PC/%.o Core/FreeRTOS/portable/BCC/16BitDOS/PC/%.su Core/FreeRTOS/portable/BCC/16BitDOS/PC/%.cyclo: ../Core/FreeRTOS/portable/BCC/16BitDOS/PC/%.c Core/FreeRTOS/portable/BCC/16BitDOS/PC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-BCC-2f-16BitDOS-2f-PC

clean-Core-2f-FreeRTOS-2f-portable-2f-BCC-2f-16BitDOS-2f-PC:
	-$(RM) ./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.cyclo ./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.d ./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.o ./Core/FreeRTOS/portable/BCC/16BitDOS/PC/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-BCC-2f-16BitDOS-2f-PC

