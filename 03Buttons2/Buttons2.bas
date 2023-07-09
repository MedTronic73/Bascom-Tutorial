'------------------------------------------------- -------------
'
'Buttons2.bas
'
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$hwstack = 100
$swstack = 64
$framesize = 64


'Connect some button to terminal PD6.
'Connect the LED to PD0.

'We will create a program:
'The LED flashes 1x per second, while pressing the button 4x per second.

Const SwClose = 0
Const Swopen = 1

Led1 Alias Portb.0                                          'is called Portd.0
Button Alias Pind.7                                         'button is named Pind.6
Portd.7 = 1                                                 'pull up

Config Led1 = Output                                        'same as Portd.0 = Output
Config Button = Input

 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '
 Do
  Toggle Led1                                               'change level to LED
    If Button = Swopen Then                                 'if the button is not pressed, then
      Waitms 500                                            'wait 500 ms
    End If

    If Button = Swclose Then
      Waitms 125                                            'wait 125 ms
    End If
 Loop

 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
End








