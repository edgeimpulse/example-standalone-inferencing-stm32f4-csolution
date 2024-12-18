#include "stm32f4xx_hal.h"
#include <stdint.h>

extern UART_HandleTypeDef huart2;

int _write(int file,char *ptr, int len)
{
    if ( HAL_UART_Transmit(&huart2, (uint8_t *) ptr, len, HAL_MAX_DELAY) != HAL_OK) {
        return -1;
    }

    return len;
}
