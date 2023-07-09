'--------------------------------------------------------------
'
'  Logman.bas
'
'  Bitov� manipulace
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B
Defint I
 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Zkuste v simul�toru

'Bitov� AND
'Po�ebujeme vynulovat n�kter� bity:
B_cislo = &B_1010_0101                  'chceme vynulovat bity 0,1,2,3
B_maska = &B_1111_0000                  'kde je v masce 0, bude ve v�sledku 0, ostatn� bity se nezm�n�
'  vysl =    1010_0000
B_vysl = B_cislo And B_maska
Print Bin(b_vysl)

'Bitov� OR
'Po�ebujeme nastavit n�kter� bity:
B_cislo = &B_1010_0101                  'chceme nastavit bity 0,1,2,3
B_maska = &B_0000_1111                  'kde je v masce 1, bude ve v�sledku 1, ostatn� bity se nezm�n�
'  vysl =    1010_1111
B_vysl = B_cislo Or B_maska
Print Bin(b_vysl)

'Bitov� XOR
'Pot�ebujeme negovat n�kter� bity:
B_cislo = &B_1110_0101                  'chceme negovat bity 0,1,6
B_maska = &B_0100_0011                  'kde je v masce 1, bude ve v�sledku negace, ostatn� bity se nezm�n�
'  vysl =    1010_0110
B_vysl = B_cislo Xor B_maska
Print Bin(b_vysl)

'Bitov� posun
''''''''''''''
'p��kaz
'shift cislo , LEFT , 1
'posune v�echny bity prom�nn� cislo o 1 m�sto doleva. Zprava dopln� nulu, bit
'kter� byl �pln� vlevo se ztrat�.

'p��kaz
'shift cislo , LEFT , 2
'posune bity podobn� o dv� m�sta atd.

'p��klad:
Bajt = &B_0001_1111
Print Bin(bajt)                         '31
Shift Bajt , Left , 1
Print Bin(bajt)                         '62
Shift Bajt , Left , 1
Print Bin(bajt)                         '124
Shift Bajt , Left , 1
Print Bin(bajt)                         '248

'Posunem o jeden bit doleva se ��slo vyn�sob� dv�ma,
'posunem o dva bity se vyn�sob� �ty�mi atd.

'p��kaz
'shift cislo , RIGHT , 1
'posune v�echny bity prom�nn� cislo o 1 m�sto doprava. Zleva dopln� nulu, bit
'kter� byl �pln� vpravo se ztrat�.

'Posunem o jeden bit doprava se ��slo vyd�l� dv�ma,
'posunem o dva bity se vyd�l� �ty�mi atd.



'Bitov� rotace
'''''''''''''''''
'p��kaz
'ROTATE  cislo , LEFT , 1
'posune v�echny bity prom�nn� cislo o 1 m�sto doleva.
'Bit kter� byl �pln� vlevo p�ijde na m�sto �pln� vpravo.

'P��klad:
'bajt = &b_0111_1000
'Rotate bajt,Left,1    'bajt= &b_1111_0000
'Rotate bajt,Left,1    'bajt= &b_1110_0001
'Rotate bajt,Left,1    'bajt= &b_1100_0011

Bajt = 22
Rotate Bajt , Left , 8
'jak velk� je te� Bajt?
Print Bajt

'p��kaz
'ROTATE  cislo , RIGHT , 1
'pracuje analogicky v opa�n�m sm�ru

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End









