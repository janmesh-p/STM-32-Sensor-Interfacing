################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/GCC/H8S2329/port.c 

OBJS += \
./Core/FreeRTOS/portable/GCC/H8S2329/port.o 

C_DEPS += \
./Core/FreeRTOS/portable/GCC/H8S2329/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/GCC/H8S2329/%.o Core/FreeRTOS/portable/GCC/H8S2329/%.su Core/FreeRTOS/portable/GCC/H8S2329/%.cyclo: ../Core/FreeRTOS/portable/GCC/H8S2329/%.c Core/FreeRTOS/portable/GCC/H8S2329/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-H8S2329

clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-H8S2329:
	-$(RM) ./Core/FreeRTOS/portable/GCC/H8S2329/port.cyclo ./Core/FreeRTOS/portable/GCC/H8S2329/port.d ./Core/FreeRTOS/portable/GCC/H8S2329/port.o ./Core/FreeRTOS/portable/GCC/H8S2329/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-H8S2329

