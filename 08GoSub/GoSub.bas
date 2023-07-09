'------------------------------------------------- -------------
'
'Subprogram1.bas
'
'GOSUB command - jumps to the subroutine and after its execution with the RETURN command
'returns and continues with the main program.
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m88def.dat"                                     'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$hwstack = 100
$swstack = 64
$framesize = 64
$baud = 19200

'Connect some button to terminal PD6.
'Connect the ice to PD0.

'We will create a program:
'The LED flashes 1x per second, while pressing the button 4x per second.

Const Swclosed = 0
Const Swopen = 1

Led1 Alias Portd.0                                          'is called Portd.0 (output)
Button Alias Pind.7                                         'is named Pind.6 (input)
Portd.7 = 1                                                 'pull up

Config Led1 = Output 'same as Portd.0 = Output
Config Button = Input

 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '
 Do
    If Button = Swopen Then                                 'if the button is not pressed, then
    Gosub Slowly                                            'Go to Slowly:
    End If

    If Button = Swclosed Then                               'if the button is pressed, then
    Gosub Fast                                              'go to Rychle:
    End If
 Loop

 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
End

'We always write subroutines after the end

Slowly:
Reset Led1                                                  'zero Led1
Waitms 500                                                  'wait 500 ms
Set Led1                                                    'set Led1
Waitms 500
Return                                                      'vra se

Fast:
Reset Led1                                                  'zero Led1
Waitms 125
Set Led1                                                    'set Led1
Waitms 125
Return                                                      'vra se