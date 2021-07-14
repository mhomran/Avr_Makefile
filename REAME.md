# Why Makefile ?
- Easiness: developers in embedded systems field prefer using visual studio code. They can use VSCode with a Makefile to compile all the project with just one command <code>make</code>. They can also upload the the code to the target board with just a command. Once the Makefile is written, it rarely changes.

- Pure: developers can see how their programs are compiled and this avoids any ambiguity from the perspective of the build process.

- To avoid the IDE problems (GUI problem, compatibility problem, etc.)

- Full customization: developers have full control of the build process (compiler and linker flags, what to link and what not to, etc).

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