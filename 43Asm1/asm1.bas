
'--------------------------------------------------------------
' Asm1.bas
'
' Pou�it� asembleru v Bascomu.
'
' Mezi v�vod PD0 a +5V p�ipojte diodu LED v s�rii s odporem.
' Dioda blik� asi 2x za vte�inu.
'--------------------------------------------------------------

'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Portd.0 = Output                 'PD0 nastav jako v�stupn�

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
  Do                                    'za��tek smy�ky Do-Loop
   sbi portd,0                          'Portd.0=1(+5V), dioda nesv�t�
   Waitms 250                           '�ekej 250 milisekund
   cbi Portd,0                          'Portd.0=0(zem), dioda sv�t�
   Waitms 250                           '�ekej 250 milisekund
Loop                                    'jdi na Do

 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
 End

'Prvn� mo�nost je kombinovat p��kazy Bascomu a asembleru, jako v tomto k�du.
'Bascom s�m rozezn� instrukce asembleru.

'Vyj�mkou jsou instrukce SUB, SWAP, CALL, OUT, kter� pou��vaj� oba jazyky.
'Proto pokud maj� b�t br�ny jako asemblerov�, nap�eme p�ed n� vyk�i�n�k.

'P��klad:
'dim a as byte, b as byte   'p�eho� obsah prom�nn�ch (a=b  b=a)
'swap a,b

'push r16                   ' p�eho� nibly v prom�nn� a
'lds r16,{a}
'!swap r16
'sts {a},r16
'pop r16
'...............................................................................

'Pokud v asemblerov� ��sti pou�ijeme pracovn� registry , mus�me je ulo�it(push - pop).




