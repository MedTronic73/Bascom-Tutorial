
'--------------------------------------------------------------
' Asm1.bas
'
' Použití asembleru v Bascomu.
'
' Mezi vývod PD0 a +5V pøipojte diodu LED v sérii s odporem.
' Dioda bliká asi 2x za vteøinu.
'--------------------------------------------------------------

'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Portd.0 = Output                 'PD0 nastav jako výstupní

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
  Do                                    'zaèátek smyèky Do-Loop
   sbi portd,0                          'Portd.0=1(+5V), dioda nesvítí
   Waitms 250                           'èekej 250 milisekund
   cbi Portd,0                          'Portd.0=0(zem), dioda svítí
   Waitms 250                           'èekej 250 milisekund
Loop                                    'jdi na Do

 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
 End

'První možnost je kombinovat pøíkazy Bascomu a asembleru, jako v tomto kódu.
'Bascom sám rozezná instrukce asembleru.

'Vyjímkou jsou instrukce SUB, SWAP, CALL, OUT, které používají oba jazyky.
'Proto pokud mají být brány jako asemblerové, napíšeme pøed nì vykøièník.

'Pøíklad:
'dim a as byte, b as byte   'pøehoï obsah promìnných (a=b  b=a)
'swap a,b

'push r16                   ' pøehoï nibly v promìnné a
'lds r16,{a}
'!swap r16
'sts {a},r16
'pop r16
'...............................................................................

'Pokud v asemblerové èásti použijeme pracovní registry , musíme je uložit(push - pop).




