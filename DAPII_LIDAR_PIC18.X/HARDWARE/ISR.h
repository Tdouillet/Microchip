#ifndef __ISR_
#define __ISR_


#include <xc.h>
#include "LED.h"
#include "device_config.h"

typedef void(*UART_Rx_Callback)(void);
typedef void(*IOC_Neg_Callback)(void);
typedef void(*IOC_Pos_Callback)(void);
typedef void(*TIMER_Callback)(void);

uint8_t UART_Rx_SetInterruptHandler(UART_Rx_Callback Callback_function);

void IOC_Neg_SetInterruptHandler(IOC_Neg_Callback Callback_function);

void IOC_Pos_SetInterruptHandler(IOC_Pos_Callback Callback_function);

void TIMER_SetInterruptHandler(TIMER_Callback Callback_Function);

void Interrupts_Init(void);
 
#endif