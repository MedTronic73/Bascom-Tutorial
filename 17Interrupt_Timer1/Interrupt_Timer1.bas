'------------------------------------------------- -------------
'
'Interrupt_Timer1.bas
'
'Interruption when Timer1 is overflow1
'------------------------------------------------- -------------
'sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Timer1 settings:
Config Timer1 = Timer , Prescale = 1024                     'Prescale = 1 | 8 | 64 | 256 | 1024 We put a pre-divider 1024 in front of the counter.

On Timer1 Int_t1                                            'jumps to the Int_t1 subroutine when Timer1 is overflowed

Enable Timer1                                               'Enable interrupt when Timer1 is overflowed


'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '
   Enable Interrupts                                        ' enable all interrupts

   Do                                                       'main loop
   Loop                                                     'end of main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' 'END OF MAIN PROGRAM' '' '' '' '' '' '
 End

Int_t1:                                                     'interrupt handling
   Print "Timer1 OVERFLOW"
   Wait 1                                                   'wait 1 second
Return                                                      'at the end must be RETURN !!!


'Note:
'Overflow counter per 65536 * 1024 * 0.125 microseconds = 8.39 seconds