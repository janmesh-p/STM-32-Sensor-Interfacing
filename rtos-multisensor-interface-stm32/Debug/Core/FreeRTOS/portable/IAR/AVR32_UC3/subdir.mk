################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/IAR/AVR32_UC3/port.c \
../Core/FreeRTOS/portable/IAR/AVR32_UC3/read.c \
../Core/FreeRTOS/portable/IAR/AVR32_UC3/write.c 

OBJS += \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.o \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.o \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.o 

C_DEPS += \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.d \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.d \
./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/IAR/AVR32_UC3/%.o Core/FreeRTOS/portable/IAR/AVR32_UC3/%.su Core/FreeRTOS/portable/IAR/AVR32_UC3/%.cyclo: ../Core/FreeRTOS/portable/IAR/AVR32_UC3/%.c Core/FreeRTOS/portable/IAR/AVR32_UC3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-AVR32_UC3

clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-AVR32_UC3:
	-$(RM) ./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.cyclo ./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.d ./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.o ./Core/FreeRTOS/portable/IAR/AVR32_UC3/port.su ./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.cyclo ./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.d ./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.o ./Core/FreeRTOS/portable/IAR/AVR32_UC3/read.su ./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.cyclo ./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.d ./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.o ./Core/FreeRTOS/portable/IAR/AVR32_UC3/write.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-AVR32_UC3

