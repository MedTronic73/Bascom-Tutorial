'--------------------------------------------------------------
'
'  Byval.bas
'
'  Dva zpùsoby pøedávání argumentù procedurám a funkcím:
'  Odkazem  (Byref)
'  Hodnotou (Byval)
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


'Jsou dvì možnosti jak pøedávat argumenty procedurám a funkcím:

'------------------------------------------------------------------------------
'--Pøedání odkazem (referencí), pøedává se adresa promìnné (klíèové slovo Byref nemusíme uvádìt, tento zpùsob je v Bascomu pøednastaven).
'U stringù a polí se pøedává adresa prvního znaku nebo hodnoty.
'Ve funkci se pracuje pøímo s pøedávanými promìnnými.
'Pokud ve funkci zmìníme pøedanou promìnnou, zmìní se pùvodní promìnná.

   'Function zvetsi(x as byte)
   'x = x + 1
   'zvetsi = x
   'End func

   'byte_prom = 1
   'byte_prom1 = zvetsi(byte_prom)
   '((byte_prom je teï 2, byte_prom1 je teï 2)

'------------------------------------------------------------------------------
'--Pøedání hodnotou, pøedává se kopie hodnoty promìnné nebo konstanty (klíèové slovo Byval).
'Ve funkci se pracuje s kopiemi pøedávaných promìnných.
'Pokud ve funkci zmìníme pøedanou promìnnou, pùvodní promìnná se nezmìní.

   'Function zvetsi(byval x as byte)
   'x = x + 1
   'zvetsi = x
   'End func

   'byte_prom = 1
   'byte_prom1 = zvetsi(byte_prom)
   '((byte_prom je stále 1, byte_prom1 je teï 2)

'------------------------------------------------------------------------------
'Deklarace funkcí:
Declare Function Secti(x As Byte , Byref Y As Byte) As Byte       'pøedání argumentù odkazem (adresou)
Declare Function Sectib(byval X As Byte , Byval Y As Byte) As Byte       'pøedání argumentù hodnotou

Function Secti(x As Byte , Y As Byte) As Byte       'pøedává se adresa x , y
Secti = X + Y
End Function

Function Sectib(byval X As Byte , Byval Y As Byte) As Byte       'pøedává se hodnota x , y  (by value=hodnotou)
Sectib = X + Y
End Function


Dim Cislo1 As Byte At &H110 , Cislo2 As Byte At &H111       'adresa promìnné cislo1 je &h110, cislo2 &h111
Dim Vysledek As Byte

Cislo1 = 5
Cislo2 = 7

'Pøedání odkazem (adresou):
Vysledek = Secti(cislo1 , Cislo2)       'pøedávané argumenty jsou &h110 a &h111 (adresy cislo1, cislo2)
'Toto je v poøádku, funkce seète hodnoty na adresách &h110 a &h111.

Vysledek = Secti(cislo1 , 10)           'pøièti 10 k cislo1
'Ale co teï? Funkce seète èíslo na adrese &h110 s èíslem na adrese 10 (tam je registr R10).
'To není to co chceme. Potøebujeme øíci funkci, že 10 není adresa ale pøímo hodnota.
'Použijeme proto funkci Sectib, která pøedává argumenty hodnotou.

'Pøedání hodnotou:
Vysledek = Sectib(cislo1 , 10)          'pøedávané argumenty jsou 5 a 10
'Teï je všechno v poøádku.

'Mùžeme pøedat každý argument jinak:
'Declare Function Secti(x As Byte , Byval Y As Byte) As Byte

'Nìkoho možná napadne, proè se nepøedává vždy hodnotou. Argumenty se pøedávají pøes
'oblast v RAM a tam by se rozsáhlé promìnné nevešly (napø velká pole, stringy apod.)

'Jednoduché pravidlo je že Byval použijeme, když chceme pøedávat konstanty.
'Ostatnì pøekladaè nás sám upozorní, kde má být Byval.


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do

Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End