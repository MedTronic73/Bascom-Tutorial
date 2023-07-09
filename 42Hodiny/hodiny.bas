'--------------------------------------------------------------
'  Hodiny.bas
'
'  Po zapnutí zaène zobrazovat hodiny : minuty : vteøiny (od 0:00:00)
'  K PD5 a PD6 pøipojte tlaèítka pro nastavení
'--------------------------------------------------------------
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


'Timer1 = èasovaè, bez pøeddìlièe, odpojený od pinu OC1A, pøi shodì vynuluj èítaè
Config Timer1 = Timer , Prescale = 1 , Compare A = Disconnect , Clear Timer = 1
Compare1a = 40000                       'porovnávací hodnota (5 ms)

Enable Interrupts                       'povol pøerušení
Enable Compare1a                        'povol pøerušení COMPARE1A
On Compare1a Tim                        'pøi pøerušení jdi na Tim

Declare Sub Zobraz                      'deklarace procedury
Dim Flag As Bit
Dim Pocet_preruseni As Word             'poèet pøerušení
Dim Vterin As Byte , Minut As Byte , Hodin As Byte

Tlac_hod Alias Pind.5                   'tlaèítko nastavení hodin
Tlac_min Alias Pind.6                   'tlaèítko nastavení minut
Config Portd = Input                    'celý portD vstupní
Portd = 255                             'pull-up


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Pocet_preruseni = 0                     'vynuluj promìnné
Vterin = 0
Minut = 0
Hodin = 0


 Do

'Test tlaèítek:
     If Tlac_hod = 0 Then
         Incr Hodin                     'pøièti 1
         Vterin = 0
         Call Zobraz
         Waitms 200                     'rychlost pøièítání
     End If

     If Tlac_min = 0 Then
         Incr Minut
         Vterin = 0
         Call Zobraz
         Waitms 200
     End If

'Zobrazení na displeji:
      If Flag = 1 Then
         Call Zobraz
         Waitms 50
         Flag = 0
      End If
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Sub Zobraz
    Printbin 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8       '8= backspace
    Print Hodin ; ":";

    If Minut < 10 Then                  'pokud minut je 0 - 9
    Print "0" ; Minut ; ":";            'pøidáme úvodní nulu, aby výsledek byl vždy dvojmístný
    Else
    Print Minut ; ":" ;
    End If

    If Vterin < 10 Then
    Print "0" ; Vterin ;
    Else
    Print Vterin ;
    End If
End Sub


Tim:                                    'obsluha pøerušení

    Incr Pocet_preruseni                'každých 5 milisec vznikne pøerušení (pøi 10 MHz)

    If Pocet_preruseni > 199 Then       '200 x 5 ms = 1 sec
       Incr Vterin                      'zvìtši o 1
       Pocet_preruseni = 0              'vynuluj poèítadlo
       Flag = 1
       End If

    If Vterin > 59 Then
       Vterin = 0
       Incr Minut                       'každou minutu
       End If

    If Minut > 59 Then
       Minut = 0
       Incr Hodin                       'každou hodinu
       End If

    If Hodin > 23 Then                  'každý den
       Hodin = 0
       End If
 Return
' Poznámky:
'
' V tomto programu jsme povolili pøerušení Compare1a a do komparaèního registru
' zapsali hodnotu 50 000.
'
' Timer1 poèítá od nuly a porovnává svùj stav s komparaèním registrem. Až dosáhne
' hodnoty 50 000 vyvolá pøerušení. Èítaè se vynuluje (nastavili jsme Clear timer = 1)
' a poèítá dál, zatímco program skoèí na obsluhu pøerušení.
'
' 50 000 krokù èítaèe jsme zvolili proto, že to odpovídá pìknì zaokrouhlené dobì 5 milisekund.
' Tedy každých 5 ms pøijde pøerušení, celkem 200x za vteøinu.
'
' V obsluze pøerušení po 200 pøerušeních pøièteme vteøinu, po 60 vteøinách
' minutu atd.
'
' V hlavním programu stále dokola testujeme tlaèítka a zobrazujeme èas.
' Pøi krátkém stisknutí tlaèítka se hodnota hodin nebo minut zvìtší o 1.
' Když držíme tlaèítko trvale, zvìtší se každých 200 ms.
'
' Tím, že èas jde nastavit jen dopøedu, ušetøíme dvì tlaèítka.
'
' Pøesnost závisí na krystalu. Krystal vìtšinou kmitá o nìco výš, takže zvìtšíme
' komparaèní hodnotu. Mùj vzorek šel dost pøesnì s hodnotou 50 005.

' Když zvolíme pøeddìliè èítaèe "Prescale = 8"
' a øádek v obsluze pøerušení upravíme na  "If Pocet_preruseni > 24 Then"
' tak hodiny pùjdou stejnì, jen poèet pøerušení za vteøinu bude menší.




