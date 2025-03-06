#ifndef __APPMANAGER_
#define __APPMANAGER_

typedef enum APP_STATE {
    AWAITING_INIT = 0,
    AUTO_ON,
    AUTO_OFF,
}APP_STATE;

typedef enum MOTOR_STATE {
    MOTORS_ON = 0,
    MOTORS_OFF,
}MOTOR_STATE;

void APP_Init(void);

void APP_Run(void);

#endif

