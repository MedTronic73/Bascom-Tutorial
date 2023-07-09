'------------------------------------------------- -------------
'
'PORTS.bas
'
'------------------------------------------------- -------------

'The ports are used to communicate the processor with the environment.

'The maximum current of one pin is 40 mA.
'The maximum current of the whole chip is 200 mA.
'The decision level when reading from the port is about half the supply voltage.
'We must not connect a voltage higher than Ucc + 0.5 V to the port.

'Atmega8 has 3 ports:
'PortB - 8 - bit - PB0 to PB7
'PortC - 7 - bit - PC0 to PC6
'PortD - 8 - bit - PD0 to PD7

'We will not use PC6 because we use the pin for RESET.
'Terminals PB6 and PB7 can only be used if we select the internal oscillator.
'Otherwise they are used to connect the crystal.

'Each port has 3 registers for control:
'' (eg for portB they are registers DDRB, PORTB, PINB)

'DDRx  - port direction, determines whether the port will be input (0) or output (1).
'PORTx - here we set the pin level for the output port
'PINx  - and here we read at the input port the level fed to the pins from the outside.

'Before using the port, we must determine whether it will be input or output.
'We write values ??to the output port, we read values ??connected from the outside from the input port.
'' (the word port refers to the whole port or one of its bits)
'After power on (reset), all ports are configured as input.

'Port configuration examples:

'Config Portb = Output' Entire port B output (compiler writes DDRB = 0b11111111)
'Config Portb.2 = Output' Portb.2 (pin PD2) will be output, the direction of the others will not change
'Config Portb = & B_0000_1111' PB7-PB4 input, PB3-PB0 output (0 is input, 1 is output)

'Config Portd = Input' Entire port D input (compiler writes DDRB = 0b00000000)
'Config Portd.2 = Input' Portd.2 input
'Config Portd = & B_0000_1100' PD2 and PD3 output, other input


'For input ports, we can further select two options by setting the PORTx register

'1. input has high impedance: (Portx = 0)
'Config Portb.1 = Input' pin PB1 is the input
'Portb.1 = 0' and has a high impedance

'2. the input is connected to the power supply via about 50 kOhm (pull-up): (Portx = 1)
'Config Portb.4 = Input' pin PB4 is the input
'Portb.4 = 1' and thus enable pull-up
'This setting is mainly used for the buttons. (so that the pin does not remain "in the air" when the button is disconnected).
'THE INPUT PIN MUST ALWAYS BE CONNECTED TO A DEFINED LOGIC LEVEL !!!.
'Otherwise, the value we read from it changes randomly.

'Write to the whole port:' Write to PORTx
'Portd = 255                ' All outputs will have 1
'Portd = & B_1111_1111      ' same
'Portb = & B_0000_1111      ' on PD0 to PD3 will be 1, on others zero

'Write to one pin:
'Portd.0 = 1' PD0 = 1
'Set Portd.0' set Portd.0 (PD0 = 1)
'Reset Portd.0' reset portd.0 (PD0 = 0)
'Portd.0 = Not Portd.0' negation, portd.0 changes level (from 0 to 1 or vice versa)
'Toggle Portd.0' same, negation (toggle)

'Read the whole port:        ' Read from PINx to the variable
'Dim Byt1 As Byte            ' We introduce the variable Byt1 of type Byte
'Byt1 = Pinb                 ' Read the entire port B into the variable Byt1

'Read one pin:
'Dim Bit1 As Bit
'Bit1 = Pinb.3' Convert the level on pin PB3 to the bit variable Bit1


'Simple program for flashing LED:
'Connect the LED to terminal PB0.
'The LED flashes about 4 times per second.
'-------------------------------------------------------------------------------
'$ sim                 ' !!! Remove during programming - simulation acceleration
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Oscillator frequency in Hz
$hwstack = 100
$swstack = 64
$framesize = 64

Config Portb.0 = Output                                     'pin PD0 is output

 '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '

 Do                                                         'start of the Do-Loop
   Portb.0 = 1                                              'Portb.0 = 1 (+ 5V), LED is on
   Waitms 125                                               'wait 125 milliseconds
   Portb.0 = 0                                              'Portb.0 = 0 (ground), LED is off
   Waitms 125                                               'wait 125 milliseconds
 Loop                                                       'Go to Do

 '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' ''
 End