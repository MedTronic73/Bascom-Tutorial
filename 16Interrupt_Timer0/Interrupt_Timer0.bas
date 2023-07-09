'------------------------------------------------- -------------
'
'' Intrrupt_Timer0.bas
'Interruption when counter 0 is overflowed.
'The program counts seconds (not very accurate).
'
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Counter settings:
Config Timer0 = Timer , Prescale = 1024                     'Prescale = 1 | 8 | 64 | 256 | 1024 We put a pre-divider 1024 in front of the counter.

'Counter 0 is 8-bit. One hour cycle lasts 0.125 microseconds (with a 8 MHz crystal).
'The divider is 1024, so the counter step takes 102.4 microseconds.
'Overflow counter in 256 * 128 microseconds, ie 32768 us ie 32.768 ms.
'In 1 second it is 1000 ms / 26.2144 ms ie 30.5176 overflows.
'We take a value of 30. Our clock will have an error of about 1.58%.

Dim Overflow_count As Byte
Dim Seconds As Word
Dim Seconds_old As Word

Enable Interrupts                                           ' enable all interrupts
Enable Timer0                                               'Enables interrupts from Timer0 overflows
On Timer0 Int_t0                                            'jumps to the Int_t0 subroutine when Timer0 is overflowed

Cursor Off                                                  'turns off the cursor
Start Timer0
'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
'In the main program we only display the variable "Seconds".

Do                                                          'main loop
   If Seconds_old <> Seconds Then
   Print Chr(8) ; Chr(8) ; Chr(8) ; Chr(8);                 'Chr (8) = Backspace
   Print Seconds;                                           'show seconds
   Seconds_old = Seconds
   End If
Loop                                                        'end of main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' 'END OF MAIN PROGRAM' '' '' '' '' '' '' '' '' '' '' '' '' '
 End

'In the interrupt handler, we will count the number of interrupts.
'We know that there will be 38 interrupts in 1 second.

Int_t0:                                                     'interrupt handling
Incr Overflow_count                                         'increases the Overflow Count by 1 for each interrupt.
   If Overflow_count > 30 Then                              'if Overtime = 30, second elapsed
   Incr Seconds                                             ' therefore we add a second
   Overflow_count = 0                                       'and reset the overflow counter
   End If
Return                                                      'at the end must be RETURN !!!