#define AVRPORTB *((volatile char*) 0x25)
#define AVRDDRB *((volatile char*) 0x24)

void led_init(void);
void led_toggle(void);
