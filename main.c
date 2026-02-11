
#include "led.h"

int main(void)
{
   
   
    led_init();

    while(1)
    {
        led_toggle();
        for (long i=0; i<100000; i++) {
            
        }
    }
}
