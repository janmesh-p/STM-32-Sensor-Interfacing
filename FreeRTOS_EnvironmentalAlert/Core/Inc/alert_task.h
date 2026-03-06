/*
 * alert_task.h
 *
 *  Created on: Oct 26, 2025
 *      Author: janme
 */

#ifndef INC_ALERT_TASK_H_
#define INC_ALERT_TASK_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "cmsis_os2.h"
#include "main.h"

void alert_task_init(void);
void reset_alert_state(void);
void wait_for_uart_reset(void);
void vAlertTask(void *argument);

#ifdef __cplusplus
}
#endif

#endif /* INC_ALERT_TASK_H_ */

