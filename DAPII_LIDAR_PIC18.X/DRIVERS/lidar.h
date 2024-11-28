#ifndef __LIDAR_
#define __LIDAR_

#include <xc.h>
#include "../HARDWARE/uart.h"
#include "../HARDWARE/device_config.h"

void LIDAR_StartScan(void);

void LIDAR_StopScan(void);

void LIDAR_GetInfo(void);

void LIDAR_GetStatus(void);

void LIDAR_Increase100mHz(void);

void LIDAR_Decrease100mHz(void);

void LIDAR_Increase1Hz(void);

void LIDAR_Decrease1Hz(void);

void LIDAR_GetFrequency(void);

void LIDAR_Restart(void);

void LIDAR_Init(void);

#endif