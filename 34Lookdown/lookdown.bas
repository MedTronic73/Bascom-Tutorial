'--------------------------------------------------------------
'
'  Lookdown.bas
'  Vyhledání pozice na které je zadaná hodnota.
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

'vstup z klávesnice ulož do promìnné "Hodnota":
    Input "Zadej hodnotu do 241 [Enter] : " , Hodnota

'prohledej 15 pozic v tabulce "Moje_tabulka" a vra pozici, na které je èíslo "hodnota" (když èíslo v tabulce není, vrátí -1)
    Pozice = Lookdown(hodnota , Moje_tabulka , 15)

      If Pozice > 0 Then                'našel èíslo
        Print "Pozice = " ; Pozice
        Print                           'prázdný øádek

      Else                              'Pozice = -1, nenašel èíslo
        Print "Hodnota není v tabulce"
        Print
      End If
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'hodnota
'    1    2    3    4    5    6     7     8     9    10    11    12    13    14    15       'pozice

'Když v programu potøebujeme hodnì konstant, vytvoøíme tabulku pøíkazem Data.
'Bude uložena v pamìti programu, takže mùže být i dost velká.

'V tabulce musíme koncovkou urèit typ èísla. Koncovky jsou:

'byte    - žádná
'word    - %
'integer - %
'long    - &
'single  - !

'Tabulku píšeme na úplný konec kódu.

'Když chceme postupnì èíst hodnoty z tabulky, použijeme pøíkazy RESTORE a READ. (viz data.bas)
'Když chceme zjistit jaká hodnota je na urèité pozici, použijeme LOOKUP.        (viz Lookup.bas)
'Když chceme zjistit na které pozici je urèitá hodnota, použijeme LOOKDOWN.
'U pøíkazu LOOKUP zaèínají pozice nulou, u pøíkazu LOOKDOWN jednièkou.
'Promìnná, do které èteme, musí být stejného typu jako ètená hodnota.