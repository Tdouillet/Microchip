/*
 * File:   motors.c
 * Author: thiba
 *
 * Created on 25 février 2025, 09:24
 */


#include <xc.h>
#include "motors.h"
#include "../APPLICATION/timer.h"
#include "../HARDWARE/ISR.h"
#include "../HARDWARE/pwm.h"

#define THROTTLE 1
#define YAW 2
#define PITCH 3
#define ROLL 4

#define THROTTLE_MIN 500

#define THROTTLE_MID_PERCENTAGE 750

#define PITCH_RESET_PERCENTAGE 750
#define ROLL_RESET_PERCENTAGE 693
#define YAW_RESET_PERCENTAGE 700
#define THROTTLE_STABILIZE_PERCENTAGE 1

#define LIFTOFF_FIRST_SIGNAL 1
#define LIFTOFF_SECOND_SIGNAL 1

TEST_SEQUENCE_STATE sequence_state = FIRST_STATE;
bool gpio_on = false;
bool timer_ticked = false;

LIFTOFF_SEQUENCE_STATE liftoff_state = INIT_STATE;

static void TIMER_Callback_Function(void);

void GPIO_Toggle(void){
    if(gpio_on){
        LATAbits.LATA0 = 0;
        gpio_on = false;
    } else {
        LATAbits.LATA0 = 1;
        gpio_on = true;
    }
}

void State_Toggle(void){
    if(sequence_state == FIRST_STATE){
        sequence_state = SECOND_STATE;
    } else {
        sequence_state = FIRST_STATE;
    }
}

static void TIMER_Callback_Function(void){
    timer_ticked = true;
    GPIO_Toggle();
}



void MOTORS_reset_throttle(void){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(THROTTLE_MIN);
    PWM_set_ccpr_reg(THROTTLE, ccpr_value);
    
}

void MOTORS_reset_yaw(void){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(YAW_RESET_PERCENTAGE);
    PWM_set_ccpr_reg(YAW, ccpr_value);
    
}

void MOTORS_reset_pitch(void){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(ROLL_RESET_PERCENTAGE);
    PWM_set_ccpr_reg(PITCH, ccpr_value);
    
}

void MOTORS_reset_roll(void){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(ROLL_RESET_PERCENTAGE);
    PWM_set_ccpr_reg(ROLL, ccpr_value);
    
}

void MOTORS_mid_throttle(void){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(THROTTLE_MID_PERCENTAGE);
    PWM_set_ccpr_reg(THROTTLE, ccpr_value);
    
}

void MOTORS_change_value(uint8_t motor, uint16_t percentage){
    
    uint16_t ccpr_value = PWM_calc_from_duty_cycle(percentage);
    PWM_set_ccpr_reg(motor, ccpr_value);
    
}

void MOTORS_change_throttle(uint16_t percentage){
    
    MOTORS_change_value(THROTTLE, percentage);
    
}

void MOTORS_change_yaw(uint16_t percentage){
    
    MOTORS_change_value(YAW, percentage);
    
}

void MOTORS_change_pitch(uint16_t percentage){
    
    MOTORS_change_value(PITCH, percentage);
    
}

void MOTORS_change_roll(uint16_t percentage){
    
    MOTORS_change_value(ROLL, percentage);
    
}

void MOTORS_Activate(void){
    PWM_Activate();
}

void MOTORS_Stop(void){
    PWM_Stop();
}

void MOTORS_Init(void){
    
    MOTORS_reset_throttle();
    MOTORS_reset_roll();
    MOTORS_reset_pitch();
    MOTORS_reset_yaw();
    MOTORS_Activate();
    (void)TIMER_SetInterruptHandler(TIMER_Callback_Function);
}

void MOTORS_Sequence1(void){
    if(timer_ticked == true){
        switch(sequence_state){
        case FIRST_STATE:
            TMR0_SetPeriod(1500);
            break;
        case SECOND_STATE:
            TMR0_SetPeriod(150);
            break;
        }
        timer_ticked = false;
    }
    
}

void MOTORS_Stabilize(void){
    MOTORS_change_throttle(THROTTLE_STABILIZE_PERCENTAGE);
    MOTORS_change_pitch(PITCH_RESET_PERCENTAGE);
    MOTORS_change_yaw(YAW_RESET_PERCENTAGE);
    MOTORS_change_roll(ROLL_RESET_PERCENTAGE);
}

bool MOTORS_Liftoff(void){
    bool liftoff_ok = false;
    if(timer_ticked){
        switch(liftoff_state){
            case INIT_STATE:
                MOTORS_change_throttle(LIFTOFF_FIRST_SIGNAL);
                TMR0_SetPeriod(200);
                liftoff_state = FIRST_SIGNAL;
                break;
            case FIRST_SIGNAL:
                MOTORS_change_throttle(LIFTOFF_SECOND_SIGNAL);
                TMR0_SetPeriod(100);
                liftoff_state = SECOND_SIGNAL;
                break;
            case SECOND_SIGNAL:
                MOTORS_change_throttle(THROTTLE_STABILIZE_PERCENTAGE);
                TMR0_SetPeriod(50);
                liftoff_state = STABILIZE_SIGNAL;
                break;
            case STABILIZE_SIGNAL:
                liftoff_ok = true;
                break;
        }
        
    }
    return liftoff_ok;
    timer_ticked = false;
}

