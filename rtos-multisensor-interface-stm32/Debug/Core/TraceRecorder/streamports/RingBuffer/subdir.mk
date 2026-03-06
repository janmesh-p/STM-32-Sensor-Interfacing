################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.c 

OBJS += \
./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.o 

C_DEPS += \
./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.d 


# Each subdirectory must supply rules for building sources it contributes
Core/TraceRecorder/streamports/RingBuffer/%.o Core/TraceRecorder/streamports/RingBuffer/%.su Core/TraceRecorder/streamports/RingBuffer/%.cyclo: ../Core/TraceRecorder/streamports/RingBuffer/%.c Core/TraceRecorder/streamports/RingBuffer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/TraceRecorder/streamports/UART -I../Core/TraceRecorder/config -I../Core/TraceRecorder -I../Core/TraceRecorder/include -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-TraceRecorder-2f-streamports-2f-RingBuffer

clean-Core-2f-TraceRecorder-2f-streamports-2f-RingBuffer:
	-$(RM) ./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.cyclo ./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.d ./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.o ./Core/TraceRecorder/streamports/RingBuffer/trcStreamPort.su

.PHONY: clean-Core-2f-TraceRecorder-2f-streamports-2f-RingBuffer

