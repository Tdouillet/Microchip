#include "uart.h"

#define BAUD_230400 67
#define BAUD_57600 103
#define PINB1 0b001001
#define PINC4 0b010100
#define U1TX  0x20
#define U2TX  0x23

#define INIT_LENGTH 7

//Counter to increment buffers
uint16_t count = 0;

//Used to check that the data size can be calculated
bool data_ready = false;

//Used buffers
uint8_t rx_buffer[1000];
uint8_t tmp_buffer[1000];

//Size of useful data in bytes
uint16_t data_size = 0;

//Allows the read function to be called
bool clear_to_read = false;

//Checks if the initialization answer has been sent from the LIDAR
bool init_ok = false;

static Init_Function Device_Init_Function = NULL;

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
   
    static uint8_t receive_state, checksum;
    uint8_t tmp = U2RXB;
    tmp_buffer[count] = tmp;
    
    if (init_ok == false){ //If the initialization of the LIDAR hasn't been done yet
        
        switch(receive_state){
            case 0:
                if(tmp_buffer[0] == 0xA5 && tmp_buffer[1] == 0x5A){
                    receive_state++;
                }
                count++;
                break;
                
            case 1:
                //Check that the init was done properly
                if(count == INIT_LENGTH && tmp_buffer[INIT_LENGTH - 1] == 0x81){
                    init_ok = true;
                    count = 0;
                } else if (count == INIT_LENGTH){
                    Device_Init_Function();
                    count = 0;
                } else {
                    count++;
                }
                break;
        }   
        
    } else {
        
        
        
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
    U2RXPPS=PINB1;
    
    //Set baudrate
    UART_SetBaudrate(1,BAUD_230400);
    UART_SetBaudrate(2,BAUD_230400);
    
    // Disable interrupts before changing states
    INTCON0bits.GIEH = 1; // Enables global interrupts
    PIE8bits.U2IE = 1;    // Enables UART interruptions
    PIE8bits.U2RXIE = 1;  // Enables interrupts on RX
    
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

uint8_t DEVICE_Set_Init(const Init_Function Function){
    
    uint8_t handlerSet = 0;
    // On vérifie toujours les paramètres en entrée d'une fonction publique:
    if(Function != NULL)
    {
        Device_Init_Function = (Init_Function)Function;
        handlerSet = 1;
    }
    return handlerSet;
    
}