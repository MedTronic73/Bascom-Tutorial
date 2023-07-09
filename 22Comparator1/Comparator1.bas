' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
'
'Komp1.bas
'analog comparator
'
'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''


'The chip has a built-in analog comparator. It is involved as follows:

'non-inverting input (+) - Pin Ain0 (PD6)
'inverting input (-) - pin AIN1 (PD7)
'output - bit ACSR.ACO in IO registers

'We can compare two voltages connected from the outside to the inputs.

'If we set the ACSR.ACBG bit (ACSR.ACBG = 1), the "+" comparator input will be disconnected from the PD6 pin
'and is connected to an internal reference voltage source (approx. 40% Vcc).
'Then the voltage at input "-" (PD7) is compared with this voltage.

'Both comparator inputs must be set as inputs.
'If the voltage at the "+" input is higher than at the "-" input, the output is set (1).
'Otherwise, the output level is 0.
'To detect a comparator flip, test the ACSR.ACO bit or use an interrupt.

'Important!! The inputs must not receive a voltage greater than Vcc + 0.5 V.

'After reset, the comparator is switched on.
'Commands for turning the comparator power on and off:
'Start Adc
'Stop Adc

'$ sim
$regfile = "m8def.dat"                                      'Soubor s deklaracemi
$crystal = 8000000                                          'Kmitoèet krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64



Config Timer1 = Timer , Prescale = 1024

'comparator settings: (see ACSR register below)

Acsr.acbg = 1                                               'internal reference to AIN0
Acsr.acis0 = 0                                              'interrupt when changing the output level
Acsr.acis1 = 0

Config Portd.7 = Input                                      'AIN1
Portd.7 = 1
'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
'Timer1 has a divisor of 1024.
'When the comparator is tilted, the display shows the counter status.
'Flip the comparator with the button on PD7.

Do
   If Acsr.aci = 1 Then                                     'test the interrupt flag
     Print Timer1
     Waitms 250
     Acsr.aci = 1                                           'reset the interrupt flag
   End If
Loop
 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
 End

'ACSR Register:

'bit7 ACD - 0: comparator power on (ACSR.3 = 0 must be changed when changing this bit)
'1: comparator power off
'
'bit6 ACBG-0: normal function
'1: there is an internal reference voltage at the + input (AIN0)
'
'bit5 ACO - comparator output
'
'bit4 ACI - interrupt flag (resets with "1")
'
'bit3 ACIE-0: interrupt disabled
'1: interrupt enabled
'
'bit2 ACIC-0: normal function
'1: when flipping, the value of counter1 is captured
'
'bits 1.0 ACIS1, ACIS0 - 00: output level change interrupt (ACSR.5)
'01: reserved
'10: interruption during falling edge on output
'11: interruption during rising edge play
'

