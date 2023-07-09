'------------------------------------------------- -------------
'
'TimeDivision.bas
'
'Create multiple timers in one program
'Connect the LED to terminal PB0.

'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Counter settings:
Config Timer0 = Timer , Prescale = 64                       'Prescale = 1 | 8 | 64 | 256 | 1024 We put a divider 64 in front of the counter.

Dim Pocet_preteceni As Byte

Enable Timer0                                               'Enable Timer0
On Timer0 Int_t0                                            'when interrupted from overflow Timer0 jump to subroutine Pretec0

Led0 Alias Portb.0                                          'LED on PB.0 is an LED
Config Led0 = Output                                        'portB.0 = output

Dim Five_second_flag As Bit                                 'Of The Five -second Flag
Dim Milisec As Word, Wtemp As Word
Dim Temp As Byte                                            'number on the display

'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
'The LED flashes every 500 ms, the number on the display increases every 5 seconds.

Enable Interrupts                                           ' enable all interrupts

Do                                                          'main loop
  Bitwait Five_second_flag , Set                            'wait for flag
  Print Temp                                                'write the value of the variable
  Incr Temp                                                 'Temp = Temp + 1
  Reset Five_second_flag                                    'Reset the flag
Loop                                                        'end of the main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' ' '' '' '' '
 End

'Counter 0 is 8-bit. One cycle lasts 0.125 microseconds (with an 8 MHz crystal).
'The divider is 64, so the counter step takes 8 microseconds. In 1 ms it does 1000/8 = 125 steps.
'To overflow in 1 millisecond, we need to preset it to 256-125.

Int_t0:                                                     'interrupt handling
Timer0 = 256 - 125                                          'to overflow in about 1 msec
Incr Milisec                                                'increases Milisec by 1
'
'Here's what to do every millisecond
'
Wtemp = Milisec Mod 5                                       'Wtemp = remainder after dividing Milisec / 5
If Wtemp = 0 Then                                           'If Milisec is divisible by 5 without remainder
'
'Here will be what is to be done every 5 milliseconds
'
End If

Wtemp = Milisec Mod 250
If Wtemp = 0 Then
'Here will be what is to be done every 250 milliseconds
Toggle Led0                                                 'simple operation is performed directly in the interrupt subroutine
End If

Wtemp = Milisec Mod 5000
If Wtemp = 0 Then
'every 5 seconds
Set Five_second_flag                                        'for a complex activity set the flag
End If

'etc

Return                                                      'at the end of the interrupt handler must be RETURN !!!








