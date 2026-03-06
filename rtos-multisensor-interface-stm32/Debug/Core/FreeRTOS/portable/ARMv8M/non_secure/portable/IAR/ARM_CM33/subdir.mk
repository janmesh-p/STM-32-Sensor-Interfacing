################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/portasm.s 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/mpu_wrappers_v2_asm.S 

OBJS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/mpu_wrappers_v2_asm.o \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/portasm.o 

S_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/portasm.d 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/mpu_wrappers_v2_asm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/%.o: ../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/%.S Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"
Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/%.o: ../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/%.s Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33

clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33:
	-$(RM) ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/mpu_wrappers_v2_asm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/mpu_wrappers_v2_asm.o ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/portasm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33/portasm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33

