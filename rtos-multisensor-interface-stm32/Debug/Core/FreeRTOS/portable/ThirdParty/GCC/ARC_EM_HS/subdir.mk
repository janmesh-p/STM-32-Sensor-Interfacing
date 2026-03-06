################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_support.s 

C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.c 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_support.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.o 

S_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_support.d 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.o Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.su Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.c Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.o: ../Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/%.s Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_EM_HS

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_EM_HS:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.d ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.o ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_freertos_exceptions.su ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_support.d ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/arc_support.o ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.d ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.o ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/freertos_tls.su ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.d ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.o ./Core/FreeRTOS/portable/ThirdParty/GCC/ARC_EM_HS/port.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_EM_HS

