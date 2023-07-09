'------------------------------------------------- -------------
'
'Goto.bas
'
'Example of inappropriate use of the GOTO command
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m88def.dat"                                     'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 19200
$hwstack = 100
$swstack = 64
$framesize = 64


'Connect some button to terminal PD6.
'Connect the LED to PD0.

'We will create a program:
'The LED flashes 1x per second, while pressing the button 4x per second.

Const Swclose = 0
Const Swopen = 1

Led1 Alias Portb.0                                          'is called Portd.0 (output)
Button Alias Pind.7                                         'is named Pind.6 (input)
Portd.7 = 1                                                 'pull up due to button

Config Led1 = Output                                       'same as Portd.0 = Output
Config Button = Input

 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '

L1:                                                         'there must be no space between the label and the colon ("L1:" - error)
   If Button = Swopen Then                                  'if the button is not pressed, thenGoto L3                                                     'go to L3:
      Goto L3                                               'go to L4:
   End If
L2:
   If Button = Swclose Then                                'if the button is pressed, then
      Goto L4                                               'go to L4:
   End If
      Goto L1:
L3:
   Reset Led1                                              'zero Led1
   Waitms 500                                               'wait 500 ms
   Set Led1                                                'set Led1
   Waitms 500
   Goto L1                                                  'go to L1:
L4:
   Reset Led1                                              'zero Led1
   Waitms 125
   Set Led1                                                'set Led1
   Waitms 125
   Goto L1                                                  'go to L1:
 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
End

'This is the original way of writing a program in Basic.
'Even at such a small scale, it is quite confusing.
'Therefore, in every higher language textbook we find a warning before using GOTO.

