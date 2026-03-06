################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/portasm.s 

C_SRCS += \
../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/mpu_wrappers_v2_asm.S 

OBJS += \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/mpu_wrappers_v2_asm.o \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.o \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/portasm.o 

S_DEPS += \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/portasm.d 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/mpu_wrappers_v2_asm.d 

C_DEPS += \
./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.o: ../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.S Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"
Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.o Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.su Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.cyclo: ../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.c Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.o: ../Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/%.s Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-ARM_CM85-2f-non_secure

clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-ARM_CM85-2f-non_secure:
	-$(RM) ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/mpu_wrappers_v2_asm.d ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/mpu_wrappers_v2_asm.o ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.cyclo ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.d ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.o ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/port.su ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/portasm.d ./Core/FreeRTOS/portable/IAR/ARM_CM85/non_secure/portasm.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-IAR-2f-ARM_CM85-2f-non_secure

