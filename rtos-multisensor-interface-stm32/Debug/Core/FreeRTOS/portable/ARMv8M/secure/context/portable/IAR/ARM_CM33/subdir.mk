################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.s 

OBJS += \
./Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.o 

S_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/%.o: ../Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/%.s Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33

clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33:
	-$(RM) ./Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.d ./Core/FreeRTOS/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33

