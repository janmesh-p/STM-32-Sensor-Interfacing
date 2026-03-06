################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/GCC/MicroBlaze/portasm.s 

C_SRCS += \
../Core/FreeRTOS/portable/GCC/MicroBlaze/port.c 

OBJS += \
./Core/FreeRTOS/portable/GCC/MicroBlaze/port.o \
./Core/FreeRTOS/portable/GCC/MicroBlaze/portasm.o 

S_DEPS += \
./Core/FreeRTOS/portable/GCC/MicroBlaze/portasm.d 

C_DEPS += \
./Core/FreeRTOS/portable/GCC/MicroBlaze/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/GCC/MicroBlaze/%.o Core/FreeRTOS/portable/GCC/MicroBlaze/%.su Core/FreeRTOS/portable/GCC/MicroBlaze/%.cyclo: ../Core/FreeRTOS/portable/GCC/MicroBlaze/%.c Core/FreeRTOS/portable/GCC/MicroBlaze/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/GCC/MicroBlaze/%.o: ../Core/FreeRTOS/portable/GCC/MicroBlaze/%.s Core/FreeRTOS/portable/GCC/MicroBlaze/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-MicroBlaze

clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-MicroBlaze:
	-$(RM) ./Core/FreeRTOS/portable/GCC/MicroBlaze/port.cyclo ./Core/FreeRTOS/portable/GCC/MicroBlaze/port.d ./Core/FreeRTOS/portable/GCC/MicroBlaze/port.o ./Core/FreeRTOS/portable/GCC/MicroBlaze/port.su ./Core/FreeRTOS/portable/GCC/MicroBlaze/portasm.d ./Core/FreeRTOS/portable/GCC/MicroBlaze/portasm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-MicroBlaze

