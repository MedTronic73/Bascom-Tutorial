'--------------------------------------------------------------
'
'  Lookup.bas
'  Vyhledání hodnoty na dané pozici v tabulce
'--------------------------------------------------------------
'$sim                                   '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim Pozice As Integer , Hodnota As Byte

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Tento pøíklad zkoušejte v simulátoru. Použijte tlaèítko "Run program".

Do

'vstup z klávesnice ulož do promìnné "Pozice":
    Input "Zadej pozici 0 až 15 [Enter] : " , Pozice

'najdi hodnotu na zadané pozici v tabulce "Moje_tabulka" :
    Hodnota = Lookup(pozice , Moje_tabulka)

'a vypiš
    Print "Na pozici " ; Pozice ; " je hodnota " ; Hodnota
    Print                               'prázdný øádek

Loop
 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:                           'návìští
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'hodnota
'    0    1    2    3    4    5    6     7     8     9    10    11    12    13    14        'pozice

'Když v programu potøebujeme hodnì konstant, vytvoøíme tabulku pøíkazem Data.
'Bude uložena v pamìti programu, takže mùže být i dost velká.
'V tabulce má zpravidla každá hodnota nìjaký vztah ke své pozici (ale není to nutné).
'V této tabulce je sin 0°=0 , sin 1°=0.017 sin 2°=0.034 atd.

'V tabulce musíme koncovkou urèit typ èísla. Koncovky jsou:

'byte    - žádná   50
'word    - %     1000%
'integer - %      -12%
'long    - &  1000000&
'single  - !     3.14!

'Tabulku píšeme na úplný konec kódu.

'Když chceme postupnì èíst hodnoty z tabulky, použijeme pøíkaz RESTORE a READ.(viz Data.bas)
'Když chceme zjistit jaká hodnota je na urèité pozici, použijeme LOOKUP.
'Když chceme zjistit na které pozici je urèitá hodnota, použijeme LOOKDOWN.   (viz Lookdown.bas)
'U pøíkazu LOOKUP zaèínají pozice nulou, u pøíkazu LOOKDOWN jednièkou.
'Promìnná, do které èteme, musí být stejného typu jako ètená hodnota.
