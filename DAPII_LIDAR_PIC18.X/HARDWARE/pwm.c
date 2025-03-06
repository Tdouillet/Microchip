/*
 * File:   pwm.c
 * Author: thiba
 *
 * Created on 24 f�vrier 2025, 11:25
 */


#include <xc.h>
#include "pwm.h"

#define RC2 0b010010
#define RC3 0b010011
#define RB3 0b001011
#define CCP1 0x15
#define CCP2 0x16
#define CCP3 0x17
#define TIMER_PR 155


uint16_t PWM_calc_from_duty_cycle(uint32_t percentage){
    
    uint32_t ccpr_reg = percentage * 4 * (TIMER_PR + 1 );
    return (uint16_t)(ccpr_reg/10000);
    
}

PWM_status PWM_set_ccpr_reg(uint8_t pwm, uint16_t ccpr_reg){
    
    if (pwm < 1 || pwm > 3){
        return PWM_status_INVALID_CCP;
    }
    
    switch (pwm) {
        case 1:
            CCPR1L = (uint8_t)ccpr_reg;
            CCPR1H = (uint8_t)(ccpr_reg >> 8);
            break;
        case 2:
            CCPR2L = (uint8_t)ccpr_reg;
            CCPR2H = (uint8_t)(ccpr_reg >> 8);
            break;
        case 3:
            CCPR3L = (uint8_t)ccpr_reg;
            CCPR3H = (uint8_t)(ccpr_reg >> 8);
            break;
    }
    
    return PWM_status_OK;
    
}

void PWM_Activate(void){
    
    CCP1CONbits.CCP1EN = 1; // Enable CCP1
    CCP2CONbits.CCP2EN = 1; // Enable CCP2
    CCP3CONbits.CCP3EN = 1; // Enable CCP2
    
}

void PWM_Stop(void){
    CCP1CONbits.CCP1EN = 0; // Disable CCP1
    CCP2CONbits.CCP2EN = 0; // Disable CCP2
    CCP3CONbits.CCP3EN = 0; // Disable CCP2
}

void PWM_Init(void) {
        
    ANSELCbits.ANSELC2 = 1;
    TRISCbits.TRISC2 = 0;
    
    ANSELCbits.ANSELC3 = 1;
    TRISCbits.TRISC3 = 0;
    
    ANSELBbits.ANSELB3 = 1;
    TRISBbits.TRISB3 = 0;
    
    RC2PPS = CCP1;
    RC3PPS = CCP2;
//    RB3PPS = CCP3;
    CCP3PPS = RB3;
    
    CCPTMRS0bits.C1TSEL = 0b01;
    CCPTMRS0bits.C2TSEL = 0b01;
    CCPTMRS0bits.C3TSEL = 0b01;
          
    T2PR = TIMER_PR; 
//    T4PR = TIMER_PR;
//    T6PR = TIMER_PR;
        
    CCP1CON = 0x0C;     // PWM Mode for CCP1
    CCP1CONbits.FMT =0; // Right aligned
    CCPR1L = 47;        // For a 1ms duty cycle
    CCPR1H = 0;
    
    CCP2CON = 0x0C;     // PWM Mode for CCP2
    CCP2CONbits.FMT =0; // Right aligned
    CCPR2L = 47;        // For a 1ms duty cycle
    CCPR2H = 0; 
       
    CCP3CON = 0x0C;     // PWM Mode for CCP2
    CCP3CONbits.FMT =0; // Right aligned
    CCPR3L = 47;        // For a 1ms duty cycle
    CCPR3H = 0; 
    
    // Timer configuration
    T2CLKCONbits.CS = 4; // LFINTOSC
    T2CONbits.CKPS = 2;  // Prescaler 1:4
    T2CONbits.ON=1;      // Enables read/write on 16 bits
    T2HLTbits.PSYNC = 1; // Prescaler output synchronized to Fosc/4 
    TMR2 = 0;  // Reset Timer2

//    T4CLKCONbits.CS = 1;    // LFINTOSC
//    T4CONbits.CKPS = 2;     // Prescaler 1:4
//    T4CONbits.ON=1;         // Enables read/write on 16 bits
//    T4HLTbits.PSYNC = 1;    // Prescaler output synchronized to Fosc/4 
//    TMR4 = 0;               // Reset Timer4
//    
//    T6CLKCONbits.CS = 1;    // LFINTOSC
//    T6CONbits.CKPS = 2;     // Prescaler 1:4
//    T6CONbits.ON=1;         // Enables read/write on 16 bits
//    T6HLTbits.PSYNC = 1;    // Prescaler output synchronized to Fosc/4 
//    TMR6 = 0;               // Reset Timer6
    
    T2CONbits.TMR2ON = 1; // Turn Timer2 on
//    T4CONbits.TMR4ON = 1; // Turn Timer4 on
//    T6CONbits.TMR6ON = 1; // Turn Timer6 on
}


