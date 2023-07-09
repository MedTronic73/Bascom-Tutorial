'------------------------------------------------- -------------
'
'Buttons.bas
'
'------------------------------------------------- -------------
'There are two buttons on the test board. One button terminal is grounded.
'Connect one button to terminal PB1.

'PB1 will be configured as a pull-up input, so level 1 will be at rest on it.
'This is very important if we leave the high impedance input pin unconnected,
'acts as an antenna for interference that randomly changes its value.
'' (pull-up means that the input pin inside the microprocessor is connected at about 50 kOhm to a positive voltage)

'The value of the key is read from PINB.1, when the key is pressed it will be 0, otherwise 1.
'Connect the LED to PB0.

'We will create a program:
'The LED flashes 1x per second, while pressing the button 4x per second.


'$ sim'    !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m88def.dat"                                     'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$hwstack = 100
$swstack = 64
$framesize = 64

Config Portb.0 = Output                                     'PB0 output (LED)
Config Portb.1 = Input                                      'PB1 input (Button)
Portb.1 = 1                                                 'pull up


 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' ''

 Do
    Portb.0 = Not Portb.0                                   'change level to PB0. Works the same: Toggle Portb.0

    If Pinb.1 = 1 Then                                      'if the key is not pressed, then
         Waitms 500                                         'wait 500 ms

    Else                                                    'otherwise (Pinb.1 = 0, button pressed)
         Waitms 125                                         'wait 125 ms
    End If

 Loop                                                       'Go to Do

 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' ''

End


'Note:
'When testing any bit, we can only use

'If pinb.1 = 0 or
'If pinb.1 = 1

'No If pinb.1> 0 If pinb.1 <> 0 etc.