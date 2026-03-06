/*
 * processing_task.h
 *
 *  Created on: Oct 26, 2025
 *      Author: janme
 */

#ifndef INC_PROCESSING_TASK_H_
#define INC_PROCESSING_TASK_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "cmsis_os2.h"
#include "sensor_task.h"

/* Function prototypes */
void processing_task_init(void);
void vProcessingTask(void *argument);

#ifdef __cplusplus
}
#endif

#endif /* INC_PROCESSING_TASK_H_ */
