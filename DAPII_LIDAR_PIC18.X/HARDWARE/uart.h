#ifndef __UART_
#define __UART_

#include <xc.h>
#include <stdbool.h>
#include "isr.h"

typedef void(*Init_Function)(void);

void (*UART_RxInterruptHandler)(void);

void UART_SetBaudRate(uint8_t port, uint8_t value);

void UART_Enable(void);

void UART_Disable(void);

void UART_WriteByte(uint8_t port, uint8_t byte);

void UART_Write(uint8_t port, uint8_t * buf, uint8_t buf_size);

void UART_Init(void);

void UART_Read(uint8_t * buffer);

uint8_t DEVICE_Set_Init(Init_Function Function);

#endif