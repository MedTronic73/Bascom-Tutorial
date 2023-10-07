
'------------------------------------------------ -------------
' Asm2.bas
'
' Using assembler in Bascom.
'
' Connect an LED to the PD0 terminal.
' The diode flashes about 2x per second.
' We will write the waiting loop in assembler
'------------------------------------------------ -------------
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

 ''''''''''''''' MAIN PROGRAM  '''''''''''''''''''''''''''''''''''''''''''''''
   Set Ddrd.0                                               'Set PD0 as output
Do                                                          'Main Loop
   Portd.0 = 1                                              'Portd.0=1(+5V), the diode is on
   Gosub Waitms_250                                         'wait 250 milliseconds
   Portd.0 = 0                                              'Portd.0=0(earth), the diode is off
   Gosub Waitms_250                                         'wait 250 milliseconds
Loop                                                        'end of the main loop

 ''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''''''''''''''''''''''''
End                                                         'Bascom's order

Waitms_250:                                                 'wait 250 ms
$asm
   push  r17                                                'We will keep all used registers
   push  r18                                                '
   push  r19                                                '

   ldi   R17,$E5
W0:
   Ldi   R18,$11
W1:
   Ldi   R19,$d5
W2:
   Dec   R19
   brne  W2
   dec   R18
   brne  W1
   dec   R17
   brne  W0

   pop   r19                                                'restore the used registries
   pop   r18                                                '
   pop   r17                                                '
   ret
$end Asm


'Assembler commands can be written in blocks delimited by $asm, $end asm commands.
'If we use working registers in the assembler part, we have to save them (push - pop).






