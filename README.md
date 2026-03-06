# STM-32-Sensor-Interfacing
My STM32 logger uses FreeRTOS to turn sensors into independent workers. Queues, Semaphores, and Mutexes ensure thread-safe data flow and UART access. To maximize efficiency, DMA with Circular Buffers handles SD card writes, freeing the CPU. With HC-05 Bluetooth and robust error-handling, it's a fast, reliable real-time system.
