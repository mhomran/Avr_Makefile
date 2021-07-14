DEVICE      := atmega32

BUILD_DIR   := build
SRC_DIR     := src

SRCS        := $(shell find $(SRC_DIR) -name "*.c")
OBJS        := $(SRCS:%=$(BUILD_DIR)/%.o)
INC_DIRS    := $(shell find $(SRC_DIR) -type d)
INC_FLAGS   := $(addprefix -I,$(INC_DIRS))

TARGET      := output
CC          := avr-gcc
OBJCOPY     := avr-objcopy
SIZE        := avr-size
CFLAGS      := -Wall -Os -mmcu=${DEVICE} -std=c99 ${INC_FLAGS}
LFLAGS      := -nostdlib -Wl,-Map=$(BUILD_DIR)/$(TARGET).map


$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LFLAGS) -o $@.elf
	avr-objcopy -j .text -j .data -O ihex $@.elf $@.hex
	avr-size --format=avr --mcu=${DEVICE} $@.elf

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: upload_usbasp
upload_usbasp:
	avrdude -v -p ${DEVICE} -c usbasp -U flash:w:$(BUILD_DIR)/${TARGET}.hex:i

.PHONY: upload_uno
upload_uno:
	avrdude -v -p ${DEVICE} -c arduino -P ${PORT} -b 115200 -U flash:w:$(BUILD_DIR)/${TARGET}.hex:i
