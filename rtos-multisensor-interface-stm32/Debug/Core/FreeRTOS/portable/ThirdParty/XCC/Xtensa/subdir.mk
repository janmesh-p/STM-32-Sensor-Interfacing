################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.c \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.c \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.c \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.c \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.S \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.S \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.S \
../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.S 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.o \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.o 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.d 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.d \
./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.o Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.su Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.c Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.o: ../Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.S Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.cyclo ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.su ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.cyclo ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.su ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.cyclo ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.su ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.cyclo ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.su ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.cyclo ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.o ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.su ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.d ./Core/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa

