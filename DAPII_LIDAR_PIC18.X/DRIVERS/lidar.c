/*
 * File:   lidar.c
 * Author: thiba
 *
 * Created on 23 octobre 2024, 14:57
 */


#include <xc.h>
#include "../HARDWARE/uart.h"
#include "../HARDWARE/device_config.h"

#define LIDAR_PORT 1
#define BUFFER_SIZE 2

#define MAX_RX_SIZE 1000

static const uint8_t init_buf[]         = {0xA5,0x00};
static const uint8_t start_scan_buf[]   = {0xA5,0x60};
static const uint8_t stop_scan_buf[]    = {0xA5,0x65};
static const uint8_t get_info_buf[]     = {0xA5,0x90};
static const uint8_t get_status_buf[]   = {0xA5,0x92};
static const uint8_t inc_100mHz_buf[]   = {0xA5,0x09};
static const uint8_t dec_100mHz_buf[]   = {0xA5,0x0A};
static const uint8_t inc_1Hz_buf[]      = {0xA5,0x0B};
static const uint8_t dec_1Hz_buf[]      = {0xA5,0x0C};
static const uint8_t get_freq_buf[]     = {0xA5,0x0D};
static const uint8_t soft_restart_buf[] = {0xA5,0x40};

uint8_t data_buffer[MAX_RX_SIZE];

void LIDAR_StartScan(void){
    
    uint8_t * pointeur = start_scan_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Init(void){
    
    uint8_t * start_ptr = start_scan_buf;
    uint8_t * init_ptr = init_buf;
    uint8_t * stop_ptr = stop_scan_buf;
    
    UART_Write(LIDAR_PORT, init_ptr, BUFFER_SIZE);
    __delay_ms(6);
    UART_Write(LIDAR_PORT, stop_ptr, BUFFER_SIZE);
    __delay_ms(500);
    UART_Write(LIDAR_PORT, init_ptr, BUFFER_SIZE);
    __delay_ms(6);
    UART_Write(LIDAR_PORT, stop_ptr, BUFFER_SIZE);
    __delay_ms(500);
    UART_Write(LIDAR_PORT, start_ptr, BUFFER_SIZE);
    
}

void LIDAR_StopScan(void){
    
    uint8_t * pointeur = stop_scan_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_GetInfo(void){
    
    uint8_t * pointeur = get_info_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_GetStatus(void){
    
    uint8_t * pointeur = get_status_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Increase100mHz(void){
    
    uint8_t * pointeur = inc_100mHz_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Decrease100mHz(void){
    
    uint8_t * pointeur = dec_100mHz_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Increase1Hz(void){
    
    uint8_t * pointeur = inc_1Hz_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Decrease1Hz(void){
    
    uint8_t * pointeur = dec_1Hz_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_GetFrequency(void){
    
    uint8_t * pointeur = get_freq_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}

void LIDAR_Restart(void){
    
    uint8_t * pointeur = soft_restart_buf;
    UART_Write(LIDAR_PORT, pointeur, BUFFER_SIZE);
    
}
