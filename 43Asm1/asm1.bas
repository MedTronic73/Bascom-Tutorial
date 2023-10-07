
'------------------------------------------------ -------------
' Asm1.bas
'
' Using assembler in Bascom.
'
' Connect an LED in series with a resistor between the PD0 and +5V terminals.
' The diode flashes about 2x per second.
'------------------------------------------------ -------------


'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Portd.0 = Output                                     'PD0 nastav jako výstupní

 ''''''''''''''' MAIN PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
  Do                                                        'zaèátek smyèky Do-Loop
   sbi portd,0                                              'Portd.0=1(+5V), dioda nesvítí
   Waitms 250                                               'èekej 250 milisekund
   cbi Portd,0                                              'Portd.0=0(zem), dioda svítí
   Waitms 250                                               'èekej 250 milisekund
Loop                                                        'jdi na Do

''''''''''''''' END OF MAIN PROGRAM '''''''''''''''''''''''''''''' ''''''
 end

'The first option is to combine Bascom and assembler commands, as in this code.
'Bascom itself recognizes assembler instructions.

'Exceptions are the instructions SUB, SWAP, CALL, OUT, which are used by both languages.
'Therefore, if they are to be taken as assemblers, we will write an exclamation point before them.

'Example:
'dim a as byte, b as byte 'overwrite the contents of the variables (a=b b=a)
'swap a, b

'push r16 ' convert nibles into variable a
'lds r16,{a}
'!swap r16
'sts {a},r16
'pop r16
'................................................ ..............................

'If we use working registers in the assembler part, we have to save them (push - pop).



