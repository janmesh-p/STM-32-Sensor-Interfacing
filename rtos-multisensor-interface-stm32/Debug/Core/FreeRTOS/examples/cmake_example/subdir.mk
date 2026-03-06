################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/examples/cmake_example/main.c 

OBJS += \
./Core/FreeRTOS/examples/cmake_example/main.o 

C_DEPS += \
./Core/FreeRTOS/examples/cmake_example/main.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/examples/cmake_example/%.o Core/FreeRTOS/examples/cmake_example/%.su Core/FreeRTOS/examples/cmake_example/%.cyclo: ../Core/FreeRTOS/examples/cmake_example/%.c Core/FreeRTOS/examples/cmake_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-examples-2f-cmake_example

clean-Core-2f-FreeRTOS-2f-examples-2f-cmake_example:
	-$(RM) ./Core/FreeRTOS/examples/cmake_example/main.cyclo ./Core/FreeRTOS/examples/cmake_example/main.d ./Core/FreeRTOS/examples/cmake_example/main.o ./Core/FreeRTOS/examples/cmake_example/main.su

.PHONY: clean-Core-2f-FreeRTOS-2f-examples-2f-cmake_example

