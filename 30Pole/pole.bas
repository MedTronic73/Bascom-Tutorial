'''''''''''''''''''''''''''''''''''''
'
' Pole.bas
'
'''''''''''''''''''''''''''''''''''''

'$sim                                    '!!!Odstranit pøi programování
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64



'deklarace pole:
Dim Moje_pole(20) As Word               'moje_pole má 20 èlenù typu word
Dim I As Byte


'''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

   For I = 1 To 20                      'naplníme pole hodnotami
   Moje_pole(i) = I * I
   Next

Do                                      'hlavní smyèka
   Print
   For I = 1 To 20
      Print "Moje_pole(" ; I ; ") = " ; Moje_pole(i) ; "    " ; I ; "^2 = " ; Moje_pole(i)
      Wait 2
   Next
Loop                                    'konec hlavní smyèky

'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

 'Pole je øada hodnot stejného typu (napø byte). Každá hodnota v poli má své poøadové
 'èíslo (index). Indexy zaèínají vždy jednièkou. (moje_pole(0) nejde)
 'V našem pøíkladu jsme vytvoøili pole druhých mocnin.
 'Hodnota každého èlenu je druhou mocninou jeho indexu.

'Pøíklad zápisu do pole:
'moje_pole(1)=10     'do 1. èlenu pole "moje_pole" vložíme hodnotu 10
'moje_pole(2)=20

'Ètení z pole:
'dim w as word
'w = moje_pole(3)        'èteme ovšem do promìnné stejného typu jako mají èleny pole

'"Moje_pole" vlastnì nahrazuje øadu promìnných
'prom1=1
'prom2=4
'prom3=9
'prom4=16 ...atd

'Jaká je výhoda použití pole?

'Jednodušší zápis
'Pøedstavme si, že chceme uložit obsah pamìti programu našeho mikroprocesoru, 2048 bajtù.
'Varianta  "dim pole(2048) as byte" je jistì jednodušší než
'dim bajt1
'dim bajt2
'dim bajt3
'dim bajt4
'....
'dim bajt2048

'Další výhoda je, že pomocí indexù mùžeme s polem manipulovat ve smyèkách,
'napø v tomto programu naplníme celé pole hodnotami v jedné smyèce for-next.

'Použití pole má smysl hlavnì (nebo jenom?) tehdy, když hodnoty èlenù mají
'nìjaký vztah ke svým indexùm.
'V našem pøíkladì je hodnota druhou mocninou indexu,
'v pøíkladu s pamìtí index oznaèuje adresu v pamìti.





