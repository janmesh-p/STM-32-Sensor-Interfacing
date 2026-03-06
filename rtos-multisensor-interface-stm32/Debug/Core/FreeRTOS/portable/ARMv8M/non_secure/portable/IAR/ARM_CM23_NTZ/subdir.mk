################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/portasm.s 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/mpu_wrappers_v2_asm.S 

OBJS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/mpu_wrappers_v2_asm.o \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/portasm.o 

S_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/portasm.d 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/mpu_wrappers_v2_asm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/%.o: ../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/%.S Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"
Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/%.o: ../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/%.s Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM23_NTZ

clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM23_NTZ:
	-$(RM) ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/mpu_wrappers_v2_asm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/mpu_wrappers_v2_asm.o ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/portasm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/IAR/ARM_CM23_NTZ/portasm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM23_NTZ

