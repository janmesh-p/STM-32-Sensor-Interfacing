################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.c \
../Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.c 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.o \
./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.o 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.d \
./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/%.o Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/%.su Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/%.c Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-GCC-2f-TriCore_38xa

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-GCC-2f-TriCore_38xa:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.cyclo ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.d ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.o ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/port.su ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.cyclo ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.d ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.o ./Core/FreeRTOS/portable/ThirdParty/Community-Supported-Ports/GCC/TriCore_38xa/porttrap.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-GCC-2f-TriCore_38xa

