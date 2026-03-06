################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/Common/mpu_wrappers.c \
../Core/FreeRTOS/portable/Common/mpu_wrappers_v2.c 

OBJS += \
./Core/FreeRTOS/portable/Common/mpu_wrappers.o \
./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.o 

C_DEPS += \
./Core/FreeRTOS/portable/Common/mpu_wrappers.d \
./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/Common/%.o Core/FreeRTOS/portable/Common/%.su Core/FreeRTOS/portable/Common/%.cyclo: ../Core/FreeRTOS/portable/Common/%.c Core/FreeRTOS/portable/Common/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-Common

clean-Core-2f-FreeRTOS-2f-portable-2f-Common:
	-$(RM) ./Core/FreeRTOS/portable/Common/mpu_wrappers.cyclo ./Core/FreeRTOS/portable/Common/mpu_wrappers.d ./Core/FreeRTOS/portable/Common/mpu_wrappers.o ./Core/FreeRTOS/portable/Common/mpu_wrappers.su ./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.cyclo ./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.d ./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.o ./Core/FreeRTOS/portable/Common/mpu_wrappers_v2.su

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-Common

