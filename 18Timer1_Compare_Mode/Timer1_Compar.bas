'------------------------------------------------- -------------
'
'18 Timer1_Compar.bas
'
'Counts seconds
'Example of an interrupt when a comparison of counter 1 matches
'------------------------------------------------- -------------

$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64


'Timer1 setting: (with the Config Timer command the counter is set and starts immediately)
Config Timer1 = Timer, Prescale = 1, Compare A = Disconnect, Clear Timer = 1
'Prescale = 1 counter without pre-divider. 1 counter step = 0.125 microsec.

'What happens when Timer1 and Compare1a match:
'Compare A = Set pin OC1A will be set if matched
'Compare A = Reset pin OC1A will be reset if matched
'Compare A = Toggle pin OC1A changes level when matching
'Compare A = Disconnect pin OC1A is not affected
'Clear Timer = 1 Timer1 is reset on match
'Clear Timer = 0 the Timer1 continues to count

Dim Overflow_counter As Byte
Dim Secound As Word
Dim Secound_old As Word

Enable Compare1a                                            'Enable interrupts when Timer1 and Compare1a match
On Compare1a Int_compare1a                                  'jump to the Int_compare1a subroutine when interrupted

Compare1a = 40000                                           'insert the value into the compare register


'Timer 1 counts and compares its value with the value we entered
'to the comparison register Compare1a.
'Once both values are the same, an interrupt Compare1a is created
'and the counter counts again from zero. (If Clear Timer = 1)

'We have written a value of 40,000 in Compare1a, which corresponds to a time of 5 ms.
'Therefore, an interrupt occurs every 5 ms.

'The accuracy of the calculation depends on the accuracy of the oscillator.
'We can fine-tune by changing Compare1a (increasing by 1 will delay by about 1.7 seconds per day)

'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
   Enable Interrupts                                        ' enable all interrupts

   Do                                                       'main loop
      If Secound <> Secound_old Then
      Print Secound
      Secound_old = Secound
      End If
   Loop                                                     'end of main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' ' '' '' '' '
 End

Int_compare1a:                                              'interrupt handler

   Incr Overflow_counter                                    'Number of overflows every 5 milliseconds (8 MHz)

   If Overflow_counter > 199 Then                           'every second
   Overflow_counter = 0
   Incr Secound                                             'Very accurate 1 sec
   End If

Return                                                      'at the end must be RETURN !!!


'Note:

'The Compare1b interrupt is similar to:

'Config Timer1 = Timer, Prescale = 1, Compare B = Disconnect, Clear Timer = 1


'Enable Compare1b' enables interrupts when Timer1 and Compare1b match
'On Compare1b Tim1_compb' jump to Tim_comp subroutine if Timer1 and Compare1b match
'Compare1b = 50000
'Enable Interrupts' allow all interrupts
'Code

'End

'Tim1_compb:
'...
'...
'Return