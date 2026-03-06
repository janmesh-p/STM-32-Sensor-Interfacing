################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/MemMang/heap_1.c \
../Core/FreeRTOS/portable/MemMang/heap_2.c \
../Core/FreeRTOS/portable/MemMang/heap_3.c \
../Core/FreeRTOS/portable/MemMang/heap_4.c \
../Core/FreeRTOS/portable/MemMang/heap_5.c 

OBJS += \
./Core/FreeRTOS/portable/MemMang/heap_1.o \
./Core/FreeRTOS/portable/MemMang/heap_2.o \
./Core/FreeRTOS/portable/MemMang/heap_3.o \
./Core/FreeRTOS/portable/MemMang/heap_4.o \
./Core/FreeRTOS/portable/MemMang/heap_5.o 

C_DEPS += \
./Core/FreeRTOS/portable/MemMang/heap_1.d \
./Core/FreeRTOS/portable/MemMang/heap_2.d \
./Core/FreeRTOS/portable/MemMang/heap_3.d \
./Core/FreeRTOS/portable/MemMang/heap_4.d \
./Core/FreeRTOS/portable/MemMang/heap_5.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/MemMang/%.o Core/FreeRTOS/portable/MemMang/%.su Core/FreeRTOS/portable/MemMang/%.cyclo: ../Core/FreeRTOS/portable/MemMang/%.c Core/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-MemMang

clean-Core-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./Core/FreeRTOS/portable/MemMang/heap_1.cyclo ./Core/FreeRTOS/portable/MemMang/heap_1.d ./Core/FreeRTOS/portable/MemMang/heap_1.o ./Core/FreeRTOS/portable/MemMang/heap_1.su ./Core/FreeRTOS/portable/MemMang/heap_2.cyclo ./Core/FreeRTOS/portable/MemMang/heap_2.d ./Core/FreeRTOS/portable/MemMang/heap_2.o ./Core/FreeRTOS/portable/MemMang/heap_2.su ./Core/FreeRTOS/portable/MemMang/heap_3.cyclo ./Core/FreeRTOS/portable/MemMang/heap_3.d ./Core/FreeRTOS/portable/MemMang/heap_3.o ./Core/FreeRTOS/portable/MemMang/heap_3.su ./Core/FreeRTOS/portable/MemMang/heap_4.cyclo ./Core/FreeRTOS/portable/MemMang/heap_4.d ./Core/FreeRTOS/portable/MemMang/heap_4.o ./Core/FreeRTOS/portable/MemMang/heap_4.su ./Core/FreeRTOS/portable/MemMang/heap_5.cyclo ./Core/FreeRTOS/portable/MemMang/heap_5.d ./Core/FreeRTOS/portable/MemMang/heap_5.o ./Core/FreeRTOS/portable/MemMang/heap_5.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-MemMang

