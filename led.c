#include "led.h"


void led_init(void)
{
    AVRDDRB=32; // 00010000 sets PB5 aus Output
}

void led_toggle()
{
    AVRPORTB ^= 0x01; // Toggle PB5 using exclusive-OR
}
