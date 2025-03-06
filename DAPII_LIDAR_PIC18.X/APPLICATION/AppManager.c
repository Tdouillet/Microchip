#include "../APPLICATION/AppManager.h"
#include "../DRIVERS/motors.h"
#include "../HARDWARE/uart.h"
#include "../APPLICATION/timer.h"
#include "../HARDWARE/ISR.h"

APP_STATE app_state = AWAITING_INIT;
MOTOR_STATE motor_state = MOTORS_OFF;
    
//static IOC_Pos_Function IOC_Pos_Callback_Function(void);
//static IOC_Pos_Function IOC_Neg_Callback_Function(void);

bool gpio_on = false;

static void IOC_Neg_Callback_Function(void);
static void IOC_Pos_Callback_Function(void);


static void IOC_Pos_Callback_Function(void){
    MOTORS_Stop();
    LATAbits.LATA7 = 1;
    app_state = AUTO_OFF;
}
    
static void IOC_Neg_Callback_Function(void){
    if(app_state == AWAITING_INIT){
            app_state = AUTO_ON;
            LATAbits.LATA7 = 0;
    }
}

void APP_Init(void){
    
    (void)IOC_Neg_SetInterruptHandler(IOC_Neg_Callback_Function);
    (void)IOC_Pos_SetInterruptHandler(IOC_Pos_Callback_Function);
            
    ANSELAbits.ANSELA0 = 1;
    TRISAbits.TRISA0 = 0;
    LATAbits.LATA0 = 0;
//    
//    ANSELAbits.ANSELA7 = 1;
//    TRISAbits.TRISA7 = 0;
//    LATAbits.LATA7 = 1;
    
    Interrupts_Init();
    MOTORS_Init();
    
    TMR0_StartTimer();
   
}

void APP_Run(void){
    
    MOTORS_Sequence1();
    
}
