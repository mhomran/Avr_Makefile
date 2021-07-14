#define __AVR_ATmega328P__
#include <avr/io.h>

#define ON_BOARD_LED_PIN  5
#define ON_BOARD_LED_DDR  DDRB
#define ON_BOARD_LED_PORT PORTB

int 
main () 
{
  ON_BOARD_LED_DDR |= 1 << ON_BOARD_LED_PIN;
  ON_BOARD_LED_PORT &= ~(1 << ON_BOARD_LED_PIN);

  while(1);

  return 0;
}