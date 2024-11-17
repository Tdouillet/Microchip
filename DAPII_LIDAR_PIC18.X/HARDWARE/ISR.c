/*
 * File:   ISR.c
 * Author: thiba
 *
 * Created on 11 novembre 2024, 22:55
 */
#include "ISR.h"
#include <xc.h>

static UART_Rx_Callback UART_Rx_Callback_Function = NULL;

void __interrupt(high_priority) high_isr(void) 
{
    // interrupt handler
    if(PIR4bits.U1RXIF == 1)
    {
        UART_Rx_Callback_Function();
        PIR4bits.U1RXIF = 0;
    }
}

uint8_t UART_Rx_SetInterruptHandler(UART_Rx_Callback Callback_function){
    
    uint8_t handlerSet = 0;
    // On vérifie toujours les paramètres en entrée d'une fonction publique:
    if(Callback_function != NULL)
    {
        UART_Rx_Callback_Function = (UART_Rx_Callback)Callback_function;
        handlerSet = 1;
    }
    return handlerSet;
    
}