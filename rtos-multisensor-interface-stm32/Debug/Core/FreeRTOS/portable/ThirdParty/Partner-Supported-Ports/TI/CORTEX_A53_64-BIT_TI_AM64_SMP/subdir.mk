################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/portASM.S 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.o \
./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/portASM.o 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/portASM.d 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.o Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.su Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.c Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.o: ../Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/%.S Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Partner-2d-Supported-2d-Ports-2f-TI-2f-CORTEX_A53_64-2d-BIT_TI_AM64_SMP

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Partner-2d-Supported-2d-Ports-2f-TI-2f-CORTEX_A53_64-2d-BIT_TI_AM64_SMP:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.cyclo ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.d ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.o ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/port.su ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/portASM.d ./Core/FreeRTOS/portable/ThirdParty/Partner-Supported-Ports/TI/CORTEX_A53_64-BIT_TI_AM64_SMP/portASM.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-Partner-2d-Supported-2d-Ports-2f-TI-2f-CORTEX_A53_64-2d-BIT_TI_AM64_SMP

