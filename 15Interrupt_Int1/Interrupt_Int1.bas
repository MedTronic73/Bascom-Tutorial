'------------------------------------------------- -------------
'
'Interrupt_Int1.bas
'
'Similar to Interrupt_Int0.bas
'------------------------------------------------- -------------
'Button on port.D
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Settings to trigger the interrupt:
'Config Int1 = Low Level                                     ' interrupt is triggered by a low level on pin INT1 (PD3)
'Config Int1 = Rising                                        ' rising edge on pin INT1
'Config Int1 = Falling                                       ' falling edge on pin INT1
'Config Int1 = Chang                                         ' by changing the level on pin INT1

Mcucr.isc10 = 1                                             'This command replace Config Int1 = Chang


Enable Int1                                                 'enable external interrupt 1
On Int1 Ext_int1                                            'on interruption (change to Int1) jump to subroutine external1


'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
   Ddrd.3 = 0                                               'pin INT1
   Portd.3 = 1                                              'pull-up
   Enable Interrupts                                        ' enable all interrupts

   Do                                                       'main loop
      Cls                                                   ' clear the display
      Print "PD3 =" ; Pind.3                                'shows the status of pin PD3
      Waitms 1000                                           'wait 300 ms
   Loop                                                     'end of main loop
'' '' '' '' '' '' '' '' '' '' '' '' '' '' 'END OF MAIN PROGRAM' '' '' '' '' '' '' '' '' '' '' '' '' '
End

Ext_int1:
   Print "INTERRUPTED"
   Print "PD3 =" ; Pind.3
   Gifr.intf1 = 1                                           'clear the interrupt flag
Return                                                      'at the end must be RETURN !!!

'To trigger an interruption, simply briefly touch the grounded cord of the PD3 pin.