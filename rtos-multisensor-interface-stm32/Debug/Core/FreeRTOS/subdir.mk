################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/croutine.c \
../Core/FreeRTOS/event_groups.c \
../Core/FreeRTOS/list.c \
../Core/FreeRTOS/queue.c \
../Core/FreeRTOS/stream_buffer.c \
../Core/FreeRTOS/tasks.c 

OBJS += \
./Core/FreeRTOS/croutine.o \
./Core/FreeRTOS/event_groups.o \
./Core/FreeRTOS/list.o \
./Core/FreeRTOS/queue.o \
./Core/FreeRTOS/stream_buffer.o \
./Core/FreeRTOS/tasks.o 

C_DEPS += \
./Core/FreeRTOS/croutine.d \
./Core/FreeRTOS/event_groups.d \
./Core/FreeRTOS/list.d \
./Core/FreeRTOS/queue.d \
./Core/FreeRTOS/stream_buffer.d \
./Core/FreeRTOS/tasks.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/%.o Core/FreeRTOS/%.su Core/FreeRTOS/%.cyclo: ../Core/FreeRTOS/%.c Core/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/TraceRecorder/streamports/UART -I../Core/TraceRecorder/config -I../Core/TraceRecorder -I../Core/TraceRecorder/include -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS

clean-Core-2f-FreeRTOS:
	-$(RM) ./Core/FreeRTOS/croutine.cyclo ./Core/FreeRTOS/croutine.d ./Core/FreeRTOS/croutine.o ./Core/FreeRTOS/croutine.su ./Core/FreeRTOS/event_groups.cyclo ./Core/FreeRTOS/event_groups.d ./Core/FreeRTOS/event_groups.o ./Core/FreeRTOS/event_groups.su ./Core/FreeRTOS/list.cyclo ./Core/FreeRTOS/list.d ./Core/FreeRTOS/list.o ./Core/FreeRTOS/list.su ./Core/FreeRTOS/queue.cyclo ./Core/FreeRTOS/queue.d ./Core/FreeRTOS/queue.o ./Core/FreeRTOS/queue.su ./Core/FreeRTOS/stream_buffer.cyclo ./Core/FreeRTOS/stream_buffer.d ./Core/FreeRTOS/stream_buffer.o ./Core/FreeRTOS/stream_buffer.su ./Core/FreeRTOS/tasks.cyclo ./Core/FreeRTOS/tasks.d ./Core/FreeRTOS/tasks.o ./Core/FreeRTOS/tasks.su

.PHONY: clean-Core-2f-FreeRTOS

