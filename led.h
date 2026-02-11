#define AVRPORTB *((volatile byte*) 0x25)
#define AVRDDRB *((volatile byte*) 0x24)

void led_init(void);
void led_toggle(void);
