################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.c \
../Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.c \
../Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.c \
../Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.c 

OBJS += \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.o \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.o \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.o \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.o 

C_DEPS += \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.d \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.d \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.d \
./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/GCC/ARM_CM23/secure/%.o Core/FreeRTOS/portable/GCC/ARM_CM23/secure/%.su Core/FreeRTOS/portable/GCC/ARM_CM23/secure/%.cyclo: ../Core/FreeRTOS/portable/GCC/ARM_CM23/secure/%.c Core/FreeRTOS/portable/GCC/ARM_CM23/secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure

clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure:
	-$(RM) ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.cyclo ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.d ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.o ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context.su ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.cyclo ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.d ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.o ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_context_port.su ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.cyclo ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.d ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.o ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_heap.su ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.cyclo ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.d ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.o ./Core/FreeRTOS/portable/GCC/ARM_CM23/secure/secure_init.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure

