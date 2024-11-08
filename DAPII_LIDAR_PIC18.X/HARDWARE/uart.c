#include <xc.h>
#include "uart.h"

#define BAUD_230400 25
#define PINB1 0b001001
#define PINC4 0b010100
#define U1TX  0x20
#define U2TX  0x23


void UART_SetBaudrate(uint8_t port, uint8_t value){
    
    //Set precision
    U1CON0bits.BRGS = 1;
    U2CON0bits.BRGS = 1;
    
    if (port == 1){
        
        U1BRG = value;
        
    } else if (port == 2){
     
        U2BRG = value;
        
    }
    
}

void UART_Enable(void){
    
    U1CON0bits.ON = 1;
    U2CON0bits.ON = 1;
    
}

void UART_Enable(void){
    
    U1CON0bits.ON = 0;
    U2CON0bits.ON = 0;
    
}

void UART_Init(void){
    
    //Disable UART
    UART_Disable();
    
    //Configure UART1
    U1CON0bits.MODE = 0;
    U1CON0bits.TXEN = 1;
    U1CON0bits.RXEN = 1;
    
    //Configure UART2
    U2CON0bits.MODE = 0;
    U2CON0bits.TXEN = 1;
    U2CON0bits.RXEN = 1;
    
    //Configure Uart1 TX on RC5
    ANSELCbits.ANSELC5 = 0;
    TRISCbits.TRISC5= 0;
    RC5PPS=U1TX;
    
    //Configure Uart1 RX on RC4
    ANSELCbits.ANSELC4=0;
    TRISCbits.TRISC4=1;
    U1RXPPS=PINC4;
    
    //Configure Uart2 TX on RB2
    ANSELBbits.ANSELB2 = 0;
    TRISBbits.TRISB2= 0;
    RC5PPS=U2TX;
    
    //Configure Uart2 RX on RB1
    ANSELBbits.ANSELB1=0;
    TRISBbits.TRISB1=1;
    U1RXPPS=PINB1;
    
    //Enable both UART
    UART_Enable();
    
}

void UART_WriteByte(uint8_t port, uint8_t byte){
    
    if (port == 1){
        
        while ((U1FIFO & 0x20) == 0){
            //Do nothing
        }*
        U1TXB = byte;
        
    } else if (port == 2 ){
        
        while ((U2FIFO & 0x20) == 0){
            //Do nothing
        }
        U2TXB = byte;
        
    }
    
}

void UART_Write(uint8_t port, uint8_t * buf, uint8_t buf_size){
    
    for (uint8_t index = 0; index < buf_size; index++){
        
        UART_WriteByte(uint8_t port, *(buf + index));
        
    }
    
}

