# To make visual studio code recognize avr-lib

1. press <code>ctrl+p</code>
1. search for <code>c_cpp_properties</code>
1. edit the the include path
    ```
    "includePath": [
                    "C:\\WinAVR-20100110\\avr\\include"
                ],
    ```
1. define your own microcontroller 'C' micro
    ```
    "defines": [
                    "__AVR_ATmega32__"
                ],
    ```