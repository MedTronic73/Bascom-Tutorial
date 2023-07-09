
'--------------------------------------------------------------
' Asm2.bas
'
' Použití asembleru v Bascomu.
'
' K vývodu PD0 pøipojte diodu LED.
' Dioda bliká asi 2x za vteøinu.
' Èekací smyèku napíšeme v asembleru
'--------------------------------------------------------------

$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
   Set Ddrd.0                           'PD0 nastav jako výstupní
Do                                      'hlavní smyèka
   Portd.0 = 1                          'Portd.0=1(+5V), dioda svítí
   Gosub Waitms_250                     'èekej 250 milisekund
   Portd.0 = 0                          'Portd.0=0(zem), dioda nesvítí
   Gosub Waitms_250                     'èekej 250 milisekund
Loop                                    'konec hlavní smyèky
 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
End                                     'pøíkaz Bascomu

Waitms_250:                             'èekej 250 ms
$asm
   push  r17                            'všechny použité registry uschováme
   push  r18                            '
   push  r19                            '

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

   pop   r19                            'obnovíme použité registry
   pop   r18                            '
   pop   r17                            '
   ret
$end Asm


'Pøíkazy asembleru mùžeme psát do blokù ohranièených pøíkazy $asm , $end asm.
'Pokud v asemblerové èásti použijeme pracovní registry , musíme je uložit(push - pop).







