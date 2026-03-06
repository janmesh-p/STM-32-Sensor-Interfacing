################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/MPLAB/PIC32MX/port.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/MPLAB/PIC32MX/port_asm.S 

OBJS += \
./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.o \
./Core/FreeRTOS/portable/MPLAB/PIC32MX/port_asm.o 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/MPLAB/PIC32MX/port_asm.d 

C_DEPS += \
./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/MPLAB/PIC32MX/%.o Core/FreeRTOS/portable/MPLAB/PIC32MX/%.su Core/FreeRTOS/portable/MPLAB/PIC32MX/%.cyclo: ../Core/FreeRTOS/portable/MPLAB/PIC32MX/%.c Core/FreeRTOS/portable/MPLAB/PIC32MX/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/MPLAB/PIC32MX/%.o: ../Core/FreeRTOS/portable/MPLAB/PIC32MX/%.S Core/FreeRTOS/portable/MPLAB/PIC32MX/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC32MX

clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC32MX:
	-$(RM) ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.cyclo ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.d ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.o ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port.su ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port_asm.d ./Core/FreeRTOS/portable/MPLAB/PIC32MX/port_asm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC32MX

