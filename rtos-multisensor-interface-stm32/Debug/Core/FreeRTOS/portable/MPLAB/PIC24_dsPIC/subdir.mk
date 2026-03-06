################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S \
../Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S 

OBJS += \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.d \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.d 

C_DEPS += \
./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.o Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.su Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.cyclo: ../Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.c Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.o: ../Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/%.S Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC24_dsPIC

clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC24_dsPIC:
	-$(RM) ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.cyclo ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.d ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.su ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.d ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.d ./Core/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-MPLAB-2f-PIC24_dsPIC

