################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.c \
../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.c 

OBJS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.o \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.o 

C_DEPS += \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.d \
./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/%.o Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/%.su Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/%.cyclo: ../Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/%.c Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-GCC-2f-ARM_CM23

clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-GCC-2f-ARM_CM23:
	-$(RM) ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.cyclo ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.o ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/mpu_wrappers_v2_asm.su ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.cyclo ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.d ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.o ./Core/FreeRTOS/portable/ARMv8M/non_secure/portable/GCC/ARM_CM23/portasm.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-GCC-2f-ARM_CM23

