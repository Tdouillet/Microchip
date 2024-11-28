#ifndef __ISR_
#define __ISR_


#include <xc.h>
#include "LED.h"
#include "device_config.h"

typedef void(*UART_Rx_Callback)(void);

uint8_t UART_Rx_SetInterruptHandler(UART_Rx_Callback Callback_function);

void Interrupts_Init(void);

#endif