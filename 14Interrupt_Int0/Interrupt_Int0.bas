'------------------------------------------------- -----------------------------
'
'Interrupt_Int0.bas
'
'An external interrupt INT0 occurs when changing to pin PD2.
'The type of change can be set with the Config Int0 command.

'When an interruption occurs:
'the processor completes the executed instruction
'disables all interrupts
'resets the interrupt flag
'jumps to the interrupt handler subroutine and executes it
'allows all interrupts
'returns to where it was before the interruption
'------------------------------------------------- -------------

'The program runs in the Do-Loop main loop. When an interrupt occurs, jumps to the Outer0 subroutine
'and after its execution it continues in the main program.

'Settings to trigger the interrupt:
'Config Int0 = Low Level' interrupt is triggered by a low level on pin INT0 (PD2)
'Config Int0 = Rising' rising edge on pin INT0
'Config Int0 = Falling' falling edge on pin INT0
'Eicra.isc00 = 1 ' by changing the level on pin INT0

'------------------------------------------------- -----------------------------
'Connect button to PD2 (INT0)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                         'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

   Enable Int0                                              'enable external interrupt 0
   MCUCR.isc00 = 1                                          'occurs when changing the level on pin INT0
   On Int0 External0                                        'When interrupted, jump to the external0 subroutine

'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
   Ddrd.2 = 0                                               'pin INT0 input
   Portd.2 = 1                                              's pull-up
   Enable Interrupts                                        ' enable all interrupts

   Do                                                       'main loop
      Print "PD2 =" ; Pind.2                                'displays the status of pin PD2
      Waitms 500                                            'wait 300 ms
   Loop                                                     'end of main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' ''
End

External0:                                                  'interrupt handling
'   Waitms 50                                                'wait
   Print "INTERRUPTED"
   Print "PD2 =" ; Pind.2                                   'displays the level on PD2
   GIFR.intf0 = 1                                           'clear the interrupt flag
Return                                                      'at the end must be RETURN !!!

'Press the button to call up the interruption. If we have set an interruption by changing the level,
'also occurs when the button is released.

'If you choose to run at a low level, then at level 0 on PD2
'the interrupt will be triggered over and over again.

