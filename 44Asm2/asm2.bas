
'--------------------------------------------------------------
' Asm2.bas
'
' Pou�it� asembleru v Bascomu.
'
' K v�vodu PD0 p�ipojte diodu LED.
' Dioda blik� asi 2x za vte�inu.
' �ekac� smy�ku nap�eme v asembleru
'--------------------------------------------------------------

$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
   Set Ddrd.0                           'PD0 nastav jako v�stupn�
Do                                      'hlavn� smy�ka
   Portd.0 = 1                          'Portd.0=1(+5V), dioda sv�t�
   Gosub Waitms_250                     '�ekej 250 milisekund
   Portd.0 = 0                          'Portd.0=0(zem), dioda nesv�t�
   Gosub Waitms_250                     '�ekej 250 milisekund
Loop                                    'konec hlavn� smy�ky
 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
End                                     'p��kaz Bascomu

Waitms_250:                             '�ekej 250 ms
$asm
   push  r17                            'v�echny pou�it� registry uschov�me
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

   pop   r19                            'obnov�me pou�it� registry
   pop   r18                            '
   pop   r17                            '
   ret
$end Asm


'P��kazy asembleru m��eme ps�t do blok� ohrani�en�ch p��kazy $asm , $end asm.
'Pokud v asemblerov� ��sti pou�ijeme pracovn� registry , mus�me je ulo�it(push - pop).







