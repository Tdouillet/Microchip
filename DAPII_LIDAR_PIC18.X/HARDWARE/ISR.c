#include "ISR.h"

#define PINA6 0b00000110

static UART_Rx_Callback UART_Rx_Callback_Function = NULL;
static IOC_Neg_Callback IOC_Neg_Callback_Function = NULL;
static IOC_Pos_Callback IOC_Pos_Callback_Function = NULL;
static TIMER_Callback TIMER_Callback_Function = NULL;


void __interrupt(high_priority) high_isr(void) 
{
    Nop();
    // UART interrupt
    if(PIR8bits.U2RXIF == 1)
    {
        UART_Rx_Callback_Function();
        PIR8bits.U2RXIF = 0;
    }
    
    //GPIO interrupt rising edge
    if (PIR0bits.IOCIF == 1 && PORTAbits.RA6 == 1){
        IOC_Pos_Callback_Function();
        IOCAFbits.IOCAF6 = 0;
        PIR0bits.IOCIF = 0;
    }
    
    //GPIO interrupt falling edge
    if (PIR0bits.IOCIF == 1 && PORTAbits.RA6 == 0){
        IOC_Neg_Callback_Function();
        IOCAFbits.IOCAF6 = 0;
        PIR0bits.IOCIF = 0;
    }
    
    if (PIR3bits.TMR0IF == 1){
        TIMER_Callback_Function();
        PIR3bits.TMR0IF = 0;
    }
    
}

uint8_t UART_Rx_SetInterruptHandler(const UART_Rx_Callback Callback_function){
    
    uint8_t handlerSet = 0;
    // On vérifie toujours les paramètres en entrée d'une fonction publique:
    if(Callback_function != NULL)
    {
        UART_Rx_Callback_Function = (UART_Rx_Callback)Callback_function;
        handlerSet = 1;
    }
    return handlerSet;
    
}

void IOC_Neg_SetInterruptHandler(const IOC_Neg_Callback Callback_function){
    
    if(Callback_function != NULL){
        IOC_Neg_Callback_Function = (IOC_Neg_Callback)Callback_function;
    }
    
}

void IOC_Pos_SetInterruptHandler(const IOC_Pos_Callback Callback_function){
    
    if(Callback_function != NULL){
        IOC_Pos_Callback_Function = (IOC_Pos_Callback)Callback_function;
    }
    
}

void TIMER_SetInterruptHandler(const TIMER_Callback Callback_function){
    
    if(Callback_function != NULL){
        TIMER_Callback_Function = (TIMER_Callback)Callback_function;
    }
    
}

void Interrupts_Init(void){
    
    ANSELAbits.ANSELA6 = 1;
    TRISAbits.TRISA6 = 1;
    
    INTCON0bits.GIE = 1;
    INTCON0bits.IPEN = 0;
    PIR8bits.U2RXIF = 0;
    
    //IOC
    INT1PPS = PINA6;
    IOCANbits.IOCAN6 = 1;
    IOCAPbits.IOCAP6 = 1;
    
    PIE3bits.TMR0IE = 1;
    
}