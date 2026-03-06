################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/TraceRecorder/extras/RunnableExample/source/main.c 

OBJS += \
./Core/TraceRecorder/extras/RunnableExample/source/main.o 

C_DEPS += \
./Core/TraceRecorder/extras/RunnableExample/source/main.d 


# Each subdirectory must supply rules for building sources it contributes
Core/TraceRecorder/extras/RunnableExample/source/%.o Core/TraceRecorder/extras/RunnableExample/source/%.su Core/TraceRecorder/extras/RunnableExample/source/%.cyclo: ../Core/TraceRecorder/extras/RunnableExample/source/%.c Core/TraceRecorder/extras/RunnableExample/source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/TraceRecorder/streamports/UART -I../Core/TraceRecorder/config -I../Core/TraceRecorder -I../Core/TraceRecorder/include -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-TraceRecorder-2f-extras-2f-RunnableExample-2f-source

clean-Core-2f-TraceRecorder-2f-extras-2f-RunnableExample-2f-source:
	-$(RM) ./Core/TraceRecorder/extras/RunnableExample/source/main.cyclo ./Core/TraceRecorder/extras/RunnableExample/source/main.d ./Core/TraceRecorder/extras/RunnableExample/source/main.o ./Core/TraceRecorder/extras/RunnableExample/source/main.su

.PHONY: clean-Core-2f-TraceRecorder-2f-extras-2f-RunnableExample-2f-source

