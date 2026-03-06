################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/GCC/TriCore_1782/port.c \
../Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.c 

OBJS += \
./Core/FreeRTOS/portable/GCC/TriCore_1782/port.o \
./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.o 

C_DEPS += \
./Core/FreeRTOS/portable/GCC/TriCore_1782/port.d \
./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/GCC/TriCore_1782/%.o Core/FreeRTOS/portable/GCC/TriCore_1782/%.su Core/FreeRTOS/portable/GCC/TriCore_1782/%.cyclo: ../Core/FreeRTOS/portable/GCC/TriCore_1782/%.c Core/FreeRTOS/portable/GCC/TriCore_1782/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-TriCore_1782

clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-TriCore_1782:
	-$(RM) ./Core/FreeRTOS/portable/GCC/TriCore_1782/port.cyclo ./Core/FreeRTOS/portable/GCC/TriCore_1782/port.d ./Core/FreeRTOS/portable/GCC/TriCore_1782/port.o ./Core/FreeRTOS/portable/GCC/TriCore_1782/port.su ./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.cyclo ./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.d ./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.o ./Core/FreeRTOS/portable/GCC/TriCore_1782/porttrap.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-TriCore_1782

