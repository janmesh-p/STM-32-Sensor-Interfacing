################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/TraceRecorder/trcAssert.c \
../Core/TraceRecorder/trcCounter.c \
../Core/TraceRecorder/trcDependency.c \
../Core/TraceRecorder/trcDiagnostics.c \
../Core/TraceRecorder/trcEntryTable.c \
../Core/TraceRecorder/trcError.c \
../Core/TraceRecorder/trcEvent.c \
../Core/TraceRecorder/trcEventBuffer.c \
../Core/TraceRecorder/trcExtension.c \
../Core/TraceRecorder/trcHardwarePort.c \
../Core/TraceRecorder/trcHeap.c \
../Core/TraceRecorder/trcISR.c \
../Core/TraceRecorder/trcInternalEventBuffer.c \
../Core/TraceRecorder/trcInterval.c \
../Core/TraceRecorder/trcKernelPort.c \
../Core/TraceRecorder/trcMultiCoreEventBuffer.c \
../Core/TraceRecorder/trcObject.c \
../Core/TraceRecorder/trcPrint.c \
../Core/TraceRecorder/trcRunnable.c \
../Core/TraceRecorder/trcSnapshotRecorder.c \
../Core/TraceRecorder/trcStackMonitor.c \
../Core/TraceRecorder/trcStateMachine.c \
../Core/TraceRecorder/trcStaticBuffer.c \
../Core/TraceRecorder/trcStreamingRecorder.c \
../Core/TraceRecorder/trcString.c \
../Core/TraceRecorder/trcTask.c \
../Core/TraceRecorder/trcTimestamp.c 

OBJS += \
./Core/TraceRecorder/trcAssert.o \
./Core/TraceRecorder/trcCounter.o \
./Core/TraceRecorder/trcDependency.o \
./Core/TraceRecorder/trcDiagnostics.o \
./Core/TraceRecorder/trcEntryTable.o \
./Core/TraceRecorder/trcError.o \
./Core/TraceRecorder/trcEvent.o \
./Core/TraceRecorder/trcEventBuffer.o \
./Core/TraceRecorder/trcExtension.o \
./Core/TraceRecorder/trcHardwarePort.o \
./Core/TraceRecorder/trcHeap.o \
./Core/TraceRecorder/trcISR.o \
./Core/TraceRecorder/trcInternalEventBuffer.o \
./Core/TraceRecorder/trcInterval.o \
./Core/TraceRecorder/trcKernelPort.o \
./Core/TraceRecorder/trcMultiCoreEventBuffer.o \
./Core/TraceRecorder/trcObject.o \
./Core/TraceRecorder/trcPrint.o \
./Core/TraceRecorder/trcRunnable.o \
./Core/TraceRecorder/trcSnapshotRecorder.o \
./Core/TraceRecorder/trcStackMonitor.o \
./Core/TraceRecorder/trcStateMachine.o \
./Core/TraceRecorder/trcStaticBuffer.o \
./Core/TraceRecorder/trcStreamingRecorder.o \
./Core/TraceRecorder/trcString.o \
./Core/TraceRecorder/trcTask.o \
./Core/TraceRecorder/trcTimestamp.o 

C_DEPS += \
./Core/TraceRecorder/trcAssert.d \
./Core/TraceRecorder/trcCounter.d \
./Core/TraceRecorder/trcDependency.d \
./Core/TraceRecorder/trcDiagnostics.d \
./Core/TraceRecorder/trcEntryTable.d \
./Core/TraceRecorder/trcError.d \
./Core/TraceRecorder/trcEvent.d \
./Core/TraceRecorder/trcEventBuffer.d \
./Core/TraceRecorder/trcExtension.d \
./Core/TraceRecorder/trcHardwarePort.d \
./Core/TraceRecorder/trcHeap.d \
./Core/TraceRecorder/trcISR.d \
./Core/TraceRecorder/trcInternalEventBuffer.d \
./Core/TraceRecorder/trcInterval.d \
./Core/TraceRecorder/trcKernelPort.d \
./Core/TraceRecorder/trcMultiCoreEventBuffer.d \
./Core/TraceRecorder/trcObject.d \
./Core/TraceRecorder/trcPrint.d \
./Core/TraceRecorder/trcRunnable.d \
./Core/TraceRecorder/trcSnapshotRecorder.d \
./Core/TraceRecorder/trcStackMonitor.d \
./Core/TraceRecorder/trcStateMachine.d \
./Core/TraceRecorder/trcStaticBuffer.d \
./Core/TraceRecorder/trcStreamingRecorder.d \
./Core/TraceRecorder/trcString.d \
./Core/TraceRecorder/trcTask.d \
./Core/TraceRecorder/trcTimestamp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/TraceRecorder/%.o Core/TraceRecorder/%.su Core/TraceRecorder/%.cyclo: ../Core/TraceRecorder/%.c Core/TraceRecorder/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/TraceRecorder/streamports/UART -I../Core/TraceRecorder/config -I../Core/TraceRecorder -I../Core/TraceRecorder/include -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-TraceRecorder

clean-Core-2f-TraceRecorder:
	-$(RM) ./Core/TraceRecorder/trcAssert.cyclo ./Core/TraceRecorder/trcAssert.d ./Core/TraceRecorder/trcAssert.o ./Core/TraceRecorder/trcAssert.su ./Core/TraceRecorder/trcCounter.cyclo ./Core/TraceRecorder/trcCounter.d ./Core/TraceRecorder/trcCounter.o ./Core/TraceRecorder/trcCounter.su ./Core/TraceRecorder/trcDependency.cyclo ./Core/TraceRecorder/trcDependency.d ./Core/TraceRecorder/trcDependency.o ./Core/TraceRecorder/trcDependency.su ./Core/TraceRecorder/trcDiagnostics.cyclo ./Core/TraceRecorder/trcDiagnostics.d ./Core/TraceRecorder/trcDiagnostics.o ./Core/TraceRecorder/trcDiagnostics.su ./Core/TraceRecorder/trcEntryTable.cyclo ./Core/TraceRecorder/trcEntryTable.d ./Core/TraceRecorder/trcEntryTable.o ./Core/TraceRecorder/trcEntryTable.su ./Core/TraceRecorder/trcError.cyclo ./Core/TraceRecorder/trcError.d ./Core/TraceRecorder/trcError.o ./Core/TraceRecorder/trcError.su ./Core/TraceRecorder/trcEvent.cyclo ./Core/TraceRecorder/trcEvent.d ./Core/TraceRecorder/trcEvent.o ./Core/TraceRecorder/trcEvent.su ./Core/TraceRecorder/trcEventBuffer.cyclo ./Core/TraceRecorder/trcEventBuffer.d ./Core/TraceRecorder/trcEventBuffer.o ./Core/TraceRecorder/trcEventBuffer.su ./Core/TraceRecorder/trcExtension.cyclo ./Core/TraceRecorder/trcExtension.d ./Core/TraceRecorder/trcExtension.o ./Core/TraceRecorder/trcExtension.su ./Core/TraceRecorder/trcHardwarePort.cyclo ./Core/TraceRecorder/trcHardwarePort.d ./Core/TraceRecorder/trcHardwarePort.o ./Core/TraceRecorder/trcHardwarePort.su ./Core/TraceRecorder/trcHeap.cyclo ./Core/TraceRecorder/trcHeap.d ./Core/TraceRecorder/trcHeap.o ./Core/TraceRecorder/trcHeap.su ./Core/TraceRecorder/trcISR.cyclo ./Core/TraceRecorder/trcISR.d ./Core/TraceRecorder/trcISR.o ./Core/TraceRecorder/trcISR.su ./Core/TraceRecorder/trcInternalEventBuffer.cyclo ./Core/TraceRecorder/trcInternalEventBuffer.d ./Core/TraceRecorder/trcInternalEventBuffer.o ./Core/TraceRecorder/trcInternalEventBuffer.su ./Core/TraceRecorder/trcInterval.cyclo ./Core/TraceRecorder/trcInterval.d ./Core/TraceRecorder/trcInterval.o ./Core/TraceRecorder/trcInterval.su ./Core/TraceRecorder/trcKernelPort.cyclo ./Core/TraceRecorder/trcKernelPort.d ./Core/TraceRecorder/trcKernelPort.o ./Core/TraceRecorder/trcKernelPort.su ./Core/TraceRecorder/trcMultiCoreEventBuffer.cyclo ./Core/TraceRecorder/trcMultiCoreEventBuffer.d ./Core/TraceRecorder/trcMultiCoreEventBuffer.o ./Core/TraceRecorder/trcMultiCoreEventBuffer.su ./Core/TraceRecorder/trcObject.cyclo ./Core/TraceRecorder/trcObject.d ./Core/TraceRecorder/trcObject.o ./Core/TraceRecorder/trcObject.su ./Core/TraceRecorder/trcPrint.cyclo ./Core/TraceRecorder/trcPrint.d ./Core/TraceRecorder/trcPrint.o ./Core/TraceRecorder/trcPrint.su ./Core/TraceRecorder/trcRunnable.cyclo ./Core/TraceRecorder/trcRunnable.d ./Core/TraceRecorder/trcRunnable.o ./Core/TraceRecorder/trcRunnable.su ./Core/TraceRecorder/trcSnapshotRecorder.cyclo ./Core/TraceRecorder/trcSnapshotRecorder.d ./Core/TraceRecorder/trcSnapshotRecorder.o ./Core/TraceRecorder/trcSnapshotRecorder.su ./Core/TraceRecorder/trcStackMonitor.cyclo ./Core/TraceRecorder/trcStackMonitor.d ./Core/TraceRecorder/trcStackMonitor.o ./Core/TraceRecorder/trcStackMonitor.su ./Core/TraceRecorder/trcStateMachine.cyclo ./Core/TraceRecorder/trcStateMachine.d ./Core/TraceRecorder/trcStateMachine.o ./Core/TraceRecorder/trcStateMachine.su ./Core/TraceRecorder/trcStaticBuffer.cyclo ./Core/TraceRecorder/trcStaticBuffer.d ./Core/TraceRecorder/trcStaticBuffer.o ./Core/TraceRecorder/trcStaticBuffer.su ./Core/TraceRecorder/trcStreamingRecorder.cyclo ./Core/TraceRecorder/trcStreamingRecorder.d ./Core/TraceRecorder/trcStreamingRecorder.o ./Core/TraceRecorder/trcStreamingRecorder.su ./Core/TraceRecorder/trcString.cyclo ./Core/TraceRecorder/trcString.d ./Core/TraceRecorder/trcString.o ./Core/TraceRecorder/trcString.su ./Core/TraceRecorder/trcTask.cyclo ./Core/TraceRecorder/trcTask.d ./Core/TraceRecorder/trcTask.o ./Core/TraceRecorder/trcTask.su ./Core/TraceRecorder/trcTimestamp.cyclo ./Core/TraceRecorder/trcTimestamp.d ./Core/TraceRecorder/trcTimestamp.o ./Core/TraceRecorder/trcTimestamp.su

.PHONY: clean-Core-2f-TraceRecorder

