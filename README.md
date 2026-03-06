# STM-32-Sensor-Interfacing
I built a real-time data logger using an STM32 and FreeRTOS to handle a bunch of environmental sensors all at once. Instead of the typical "super-loop" that gets bogged down, this system treats every sensor as its own independent worker, keeping everything fast and predictable.

How It Works
The brain of the operation is the FreeRTOS scheduler. I’m using it to juggle data from a DHT22 (temp/humidity), a BMP180 (pressure), and an MQ-2 (gas). To keep these "workers" from stepping on each other's toes, I implemented several RTOS features:

Queues & Semaphores: These act like the "inbox" for the system, passing sensor data between tasks without crashing.

Mutexes: Think of this as a "talking stick" for the UART port; it makes sure only one task prints debug info at a time so the text doesn't turn into gibberish.

DMA & Circular Buffers: To keep things efficient, I used Direct Memory Access (DMA) to offload the heavy lifting of writing data to an SD card. This means the CPU can keep processing while the hardware handles the data transfer in the background.

Connectivity & Reliability
Wireless: I hooked up an HC-05 Bluetooth module, so you can watch the live sensor feed on a phone or laptop.

Failsafes: Sensors are notoriously finicky, so I added error-handling and retry logic. If a sensor drops out, the system doesn't just hang—it tries to recover gracefully.

Performance: I used trace tools to monitor task timing, ensuring the system hits its "real-time" targets without any lag.
