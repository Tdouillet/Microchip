#include <xc.h>
#include "uart.h"
#include "ISR.h"

#define BAUD_230400 25
#define BAUD_57600 103
#define PINB1 0b001001
#define PINC4 0b010100
#define U1TX  0x20
#define U2TX  0x23

//Counter to increment buffers
uint16_t count = 0;

//Used to check that the data size can be calculated
uint8_t data_ready = 0;

//Used buffers
uint8_t rx_buffer[1000];
uint8_t tmp_buffer[1000];

//Size of useful data in bytes
uint16_t data_size = 0;

//Allows the read function to be called
uint8_t clear_to_read = 0;

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
    
    U1CON1bits.ON = 1;
    U2CON1bits.ON = 1;
    
}

void UART_Disable(void){
    
    U1CON1bits.ON = 0;
    U2CON1bits.ON = 0;
    
}



void UART_WriteByte(uint8_t port, uint8_t byte){
    
    if (port == 1){
        
        while ((U1FIFO & 0x20)== 0){
            //Do nothing
        }
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
        
        UART_WriteByte(port, *(buf + index));
        
    }
    
}

void UART_Rx_Callback_Function(void){
   
    if (!data_ready){
            
            if (count == 3){
                tmp_buffer[3] = U1RXB;
                data_ready = 1;
            } else {
                tmp_buffer[count] = U1RXB;
                count++;
            }
            
        } else {
            
            if (count == 4){
                data_size = tmp_buffer[3]*4 + 10;
            }
            if (count == data_size){
                for (uint16_t index; index < data_size; index++){
                    rx_buffer[index] = tmp_buffer[index];
                }
                data_ready = 0;
                count = 0;
                if (clear_to_read == 0){
                    clear_to_read = 1;
                }
            } else {
                tmp_buffer[count] = U1RXB;
                count++;
            }
        }
}

void UART_Init(void){
    
    //Disable UART
    UART_Disable();
    
    UART_Rx_SetInterruptHandler(UART_Rx_Callback_Function);
    
    //Configure UART1
    U1CON0bits.MODE = 0;
    U1CON0bits.TXEN = 1;
    U1CON0bits.RXEN = 1;
    U1CON0bits.ABDEN = 0;
    
    //Configure UART2
    U2CON0bits.MODE = 0;
    U2CON0bits.TXEN = 1;
    U2CON0bits.RXEN = 1;
    U2CON0bits.ABDEN = 0;
    
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
    RB2PPS=U2TX;
    
    //Configure Uart2 RX on RB1
    ANSELBbits.ANSELB1=0;
    TRISBbits.TRISB1=1;
    U1RXPPS=PINB1;
    
    //Set baudrate
    UART_SetBaudrate(1,BAUD_230400);
    UART_SetBaudrate(1,BAUD_230400);
    
    // Disable interrupts before changing states
    INTCON0bits.GIEH = 1; // Enables global interrupts
    PIE4bits.U1IE = 1;    // Enables UART interruptions
    PIE4bits.U1RXIE = 1;  // Enables interrupts on RX
    
    //Enable both UART
    UART_Enable();
    
}

void UART_Read(uint8_t * buffer){
    
    if (clear_to_read == 1){
        
        uint16_t bsize = rx_buffer[3]*4 + 10;
        for (uint16_t index = 0; index<bsize; index ++){
            
            *(buffer + index) = rx_buffer[index];
            
        }
        
    }
    
}