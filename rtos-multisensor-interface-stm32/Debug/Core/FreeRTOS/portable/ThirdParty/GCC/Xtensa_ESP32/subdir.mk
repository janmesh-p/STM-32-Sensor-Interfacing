################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.c \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.c 

S_UPPER_SRCS += \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.S \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.S \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.S \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.S \
../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.S 

OBJS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o 

S_UPPER_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d 

C_DEPS += \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d \
./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.o Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.su Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.cyclo: ../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.c Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Core/FreeRTOS/portable/GCC/ARM_CM3 -I../Core/FreeRTOS/include -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Core/FreeRTOS -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.o: ../Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/%.S Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32:
	-$(RM) ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.cyclo ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.su ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d ./Core/FreeRTOS/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o

.PHONY: clean-Core-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

