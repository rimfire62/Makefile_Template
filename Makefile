ROOT_DIR =  /usr/lib/avr
BIN_DIR = $(ROOT_DIR)/bin
INCLUDE_DIR = $(ROOT_DIR)/include
INCLUDE_DIRS = $(INCLUDE_DIR)
LIB_DIRS = $(INCLUDE_DIR)
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin

# Toolchain
CC = /usr/bin/avr-gcc
RM = rm
FREQ = 16000000UL

# Files
TARGET = $(BIN_DIR)/blink

SOURCES = main.c \
		  led.c

OBJECT_NAMES = $(SOURCES:.c=.o)
OBJECTS = $(patsubst %,$(OBJ_DIR)/%,$(OBJECT_NAMES))

# Flags
DEVICE =  atmega328p
WFLAGS = -Wall -Wextra -Werror -Wshadow
CFLAGS = -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $(WFLAGS) $(addprefix -I,$(INCLUDE_DIRS)) -Og -g
LDFLAGS = -mmcu=$(DEVICE) $(addprefix -L,$(LIB_DIRS))

# Build
## Linking
$(TARGET): $(OBJECTS)
	@mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ -o $@.elf

## Compiling
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $^

# Phonies
.PHONY: all clean 

all: $(TARGET)

flash:
	avr-objcopy -O ihex $(TARGET).elf $(TARGET).hex
	avr-size --formnat=avr --mcu=$(DEVICE) $(TARGET).elf
	sudo avrdude -V -F -c usbasp -p m328p -U flash:w:$(TARGET).hex

clean:
	$(RM) -r $(BUILD_DIR)

