################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/portASM.s 

C_SRCS += \
../Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.c 

OBJS += \
./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.o \
./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/portASM.o 

S_DEPS += \
./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/portASM.d 

C_DEPS += \
./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.o Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.su Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.cyclo: ../Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.c Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.o: ../Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/%.s Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-RVDS-2f-ARM7_LPC21xx

clean-Core-2f-FreeRTOS-2f-portable-2f-RVDS-2f-ARM7_LPC21xx:
	-$(RM) ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.cyclo ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.d ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.o ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/port.su ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/portASM.d ./Core/FreeRTOS/portable/RVDS/ARM7_LPC21xx/portASM.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-RVDS-2f-ARM7_LPC21xx

