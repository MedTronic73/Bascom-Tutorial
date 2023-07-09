'--------------------------------------------------------------
'
'  Byval.bas
'
'  Dva zp�soby p�ed�v�n� argument� procedur�m a funkc�m:
'  Odkazem  (Byref)
'  Hodnotou (Byval)
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


'Jsou dv� mo�nosti jak p�ed�vat argumenty procedur�m a funkc�m:

'------------------------------------------------------------------------------
'--P�ed�n� odkazem (referenc�), p�ed�v� se adresa prom�nn� (kl��ov� slovo Byref nemus�me uv�d�t, tento zp�sob je v Bascomu p�ednastaven).
'U string� a pol� se p�ed�v� adresa prvn�ho znaku nebo hodnoty.
'Ve funkci se pracuje p��mo s p�ed�van�mi prom�nn�mi.
'Pokud ve funkci zm�n�me p�edanou prom�nnou, zm�n� se p�vodn� prom�nn�.

   'Function zvetsi(x as byte)
   'x = x + 1
   'zvetsi = x
   'End func

   'byte_prom = 1
   'byte_prom1 = zvetsi(byte_prom)
   '((byte_prom je te� 2, byte_prom1 je te� 2)

'------------------------------------------------------------------------------
'--P�ed�n� hodnotou, p�ed�v� se kopie hodnoty prom�nn� nebo konstanty (kl��ov� slovo Byval).
'Ve funkci se pracuje s kopiemi p�ed�van�ch prom�nn�ch.
'Pokud ve funkci zm�n�me p�edanou prom�nnou, p�vodn� prom�nn� se nezm�n�.

   'Function zvetsi(byval x as byte)
   'x = x + 1
   'zvetsi = x
   'End func

   'byte_prom = 1
   'byte_prom1 = zvetsi(byte_prom)
   '((byte_prom je st�le 1, byte_prom1 je te� 2)

'------------------------------------------------------------------------------
'Deklarace funkc�:
Declare Function Secti(x As Byte , Byref Y As Byte) As Byte       'p�ed�n� argument� odkazem (adresou)
Declare Function Sectib(byval X As Byte , Byval Y As Byte) As Byte       'p�ed�n� argument� hodnotou

Function Secti(x As Byte , Y As Byte) As Byte       'p�ed�v� se adresa x , y
Secti = X + Y
End Function

Function Sectib(byval X As Byte , Byval Y As Byte) As Byte       'p�ed�v� se hodnota x , y  (by value=hodnotou)
Sectib = X + Y
End Function


Dim Cislo1 As Byte At &H110 , Cislo2 As Byte At &H111       'adresa prom�nn� cislo1 je &h110, cislo2 &h111
Dim Vysledek As Byte

Cislo1 = 5
Cislo2 = 7

'P�ed�n� odkazem (adresou):
Vysledek = Secti(cislo1 , Cislo2)       'p�ed�van� argumenty jsou &h110 a &h111 (adresy cislo1, cislo2)
'Toto je v po��dku, funkce se�te hodnoty na adres�ch &h110 a &h111.

Vysledek = Secti(cislo1 , 10)           'p�i�ti 10 k cislo1
'Ale co te�? Funkce se�te ��slo na adrese &h110 s ��slem na adrese 10 (tam je registr R10).
'To nen� to co chceme. Pot�ebujeme ��ci funkci, �e 10 nen� adresa ale p��mo hodnota.
'Pou�ijeme proto funkci Sectib, kter� p�ed�v� argumenty hodnotou.

'P�ed�n� hodnotou:
Vysledek = Sectib(cislo1 , 10)          'p�ed�van� argumenty jsou 5 a 10
'Te� je v�echno v po��dku.

'M��eme p�edat ka�d� argument jinak:
'Declare Function Secti(x As Byte , Byval Y As Byte) As Byte

'N�koho mo�n� napadne, pro� se nep�ed�v� v�dy hodnotou. Argumenty se p�ed�vaj� p�es
'oblast v RAM a tam by se rozs�hl� prom�nn� neve�ly (nap� velk� pole, stringy apod.)

'Jednoduch� pravidlo je �e Byval pou�ijeme, kdy� chceme p�ed�vat konstanty.
'Ostatn� p�eklada� n�s s�m upozorn�, kde m� b�t Byval.


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do

Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End