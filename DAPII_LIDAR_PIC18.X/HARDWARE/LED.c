#include "LED.h"

void LED_On(void){
    
    LATFbits.LATF2 = 1;
    
}

void LED_Off(void){
    
    LATFbits.LATF2 = 0;
    
}

void LED_Init(void){
    
    ANSELFbits.ANSELF2 = 0;
    TRISFbits.TRISF2 = 0;
    
    LED_Off();
    
}

