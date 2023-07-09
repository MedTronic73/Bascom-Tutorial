
'--------------------------------------------------------------
' Citac.bas
'
' Èítaè do 65 kHz s rozlišením 1 Hz
' Mìøený signál má být digitální, max 5V
' Je pøipojen na PD5
' Když se dotkneme pinu PD5, mìl by ukázat 50 Hz
'--------------------------------------------------------------

'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

'Timer1 = èítaè, poèítá sestupné hrany na pinu T1
Config Timer1 = Counter , Edge = Falling


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do
    Timer1 = 0                          'vynuluj èítaè
    Start Timer1                        'zapni èítaè
    Waitms 999                          'odmìø èas 1 vteøina
    Waitus 373                          'nastavit v simulátoru

    Stop Timer1                         'vypni èítaè
    Printbin 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8       '8= backspace
    Print Timer1 ; " Hz " ;
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'Princip je jednoduchý:
'Po dobu 1 vteøiny poèítá Timer1 impulsy na portd.5.
'Poèet impulsù pak odpovídá kmitoètu v Hz.

'K odmìøení èasu nepoužijeme pøíkaz "Wait 1".
'Protože potøebujeme odmìøit èas co nejpøesnìji, složíme èas z pøíkazù waitms a waitus.
'Pro nastavení použijeme poèitadlo cyklù v simulátoru.

'Maximální mìøená hodnota je 65 535, pak èítaè pøeteèe. Napø pøi kmitoètu 65 546
'ukáže 10 Hz. (a také pøi kmitoètech 2 x 65536 + 10, 3 x 65536 + 10 atd...)

'Jsou dva zpùsoby, jak zvìtšit rozsah mìøení.
'1. Zkrácením doby mìøení za cenu menšího rozlišení.
'2. Poèítáním pøeteèení (rozlišení se nezmìní).

'Vùbec nejvìtší kmitoèet, který jsou èítaèe Timer0 a Timer1 schopny zpracovat, je asi polovina
'hodinové frekvence, tedy 4 MHz (pøi krystalu 8 MHz).

'Pokud je mìøení kmitoètu souèástí vìtšího programu, použijeme k odmìøování èasu
'Timer1, protože smyèky Wait zamìstnávají neúmìrnì procesor. K poèítání impulsù
'pak použijeme Timer0 a pøi jeho pøeteèení zvýšíme hodnotu nìjaké promìnné.
'Kmitoèet pak vypoèítáme z hodnoty Timer0 a poètu pøeteèení.