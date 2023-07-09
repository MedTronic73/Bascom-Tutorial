'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
'
'komp2.bas
'analog comparator - capacity measurement
'
'Connect a 1nF precision capacitor between PD7 and ground
'connect a trimmer of approx. 400 kOhm between PD7 and Vcc
'
'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'$ sim

Config Timer1 = Timer, Prescale = 1

Config Portd.7 = Input
Portd.7 = 0                                                 'high impedance

'comparator settings:
Acsr.acbg = 1                                               'connects the internal reference voltage to AIN0

'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
'Timer1 measures the charging time of the capacitor until the comparator flips.
'This time is directly proportional to capacity.
'Use the resistance trimmer to set the displayed value to 1000.
'Then, instead of the 1nF capacitor, connect the measured capacitor.
'The display shows its value in pF.

Do
    'turn off and reset the counter
    Stop Timer1
    Timer1 = 0

    'discharge the capacitor
    Ddrd.7 = 1                                              'portd.7 = output, level 0
    Waitms 500

    'turn on the counter and charge
    Start Timer1
    Ddrd.7 = 0                                              'portd.7 = input, high impedance

    'Wait for the comparator to flip over, then turn off the counter
    Bitwait Acsr.aco , Reset                                'Acsr.5 - comparator output
    Stop Timer1

    'display counter value
    Print Timer1

 Loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' 'END OF MAIN PROGRAM' '' '' '' '' '' '' '' '' '' '' '' '' '
 End

'ACSR register - comparator settings:

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

