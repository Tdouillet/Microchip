/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef MOTORS_H
#define	MOTORS_H

#include <xc.h> // include processor files - each processor file is guarded.  

typedef enum TEST_SEQUENCE_STATE {
    FIRST_STATE = 0,
    SECOND_STATE
}TEST_SEQUENCE_STATE;

typedef enum LIFTOFF_SEQUENCE_STATE{
    INIT_STATE       = 0,
    FIRST_SIGNAL,
    SECOND_SIGNAL,
    STABILIZE_SIGNAL
}LIFTOFF_SEQUENCE_STATE;

void MOTORS_reset_throttle(void);

void MOTORS_reset_yaw(void);

void MOTORS_reset_pitch(void);

void MOTORS_reset_roll(void);

void MOTORS_mid_throttle(void);

void MOTORS_change_throttle(uint16_t percentage);

void MOTORS_change_yaw(uint16_t percentage);

void MOTORS_change_pitch(uint16_t percentage);

void MOTORS_change_roll(uint16_t percentage);

void MOTORS_Activate(void);

void MOTORS_Stop(void);

void MOTORS_Init(void);

void MOTORS_Sequence1(void);

void MOTORS_Stabilize(void);

void MOTORS_Liftoff(void);

#endif	/* MOTORS_H */

