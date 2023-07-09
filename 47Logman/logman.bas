'--------------------------------------------------------------
'
'  Logman.bas
'
'  Bitové manipulace
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B
Defint I
 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Zkuste v simulátoru

'Bitové AND
'Poøebujeme vynulovat nìkteré bity:
B_cislo = &B_1010_0101                  'chceme vynulovat bity 0,1,2,3
B_maska = &B_1111_0000                  'kde je v masce 0, bude ve výsledku 0, ostatní bity se nezmìní
'  vysl =    1010_0000
B_vysl = B_cislo And B_maska
Print Bin(b_vysl)

'Bitové OR
'Poøebujeme nastavit nìkteré bity:
B_cislo = &B_1010_0101                  'chceme nastavit bity 0,1,2,3
B_maska = &B_0000_1111                  'kde je v masce 1, bude ve výsledku 1, ostatní bity se nezmìní
'  vysl =    1010_1111
B_vysl = B_cislo Or B_maska
Print Bin(b_vysl)

'Bitové XOR
'Potøebujeme negovat nìkteré bity:
B_cislo = &B_1110_0101                  'chceme negovat bity 0,1,6
B_maska = &B_0100_0011                  'kde je v masce 1, bude ve výsledku negace, ostatní bity se nezmìní
'  vysl =    1010_0110
B_vysl = B_cislo Xor B_maska
Print Bin(b_vysl)

'Bitový posun
''''''''''''''
'pøíkaz
'shift cislo , LEFT , 1
'posune všechny bity promìnné cislo o 1 místo doleva. Zprava doplní nulu, bit
'který byl úplnì vlevo se ztratí.

'pøíkaz
'shift cislo , LEFT , 2
'posune bity podobnì o dvì místa atd.

'pøíklad:
Bajt = &B_0001_1111
Print Bin(bajt)                         '31
Shift Bajt , Left , 1
Print Bin(bajt)                         '62
Shift Bajt , Left , 1
Print Bin(bajt)                         '124
Shift Bajt , Left , 1
Print Bin(bajt)                         '248

'Posunem o jeden bit doleva se èíslo vynásobí dvìma,
'posunem o dva bity se vynásobí ètyømi atd.

'pøíkaz
'shift cislo , RIGHT , 1
'posune všechny bity promìnné cislo o 1 místo doprava. Zleva doplní nulu, bit
'který byl úplnì vpravo se ztratí.

'Posunem o jeden bit doprava se èíslo vydìlí dvìma,
'posunem o dva bity se vydìlí ètyømi atd.



'Bitová rotace
'''''''''''''''''
'pøíkaz
'ROTATE  cislo , LEFT , 1
'posune všechny bity promìnné cislo o 1 místo doleva.
'Bit který byl úplnì vlevo pøijde na místo úplnì vpravo.

'Pøíklad:
'bajt = &b_0111_1000
'Rotate bajt,Left,1    'bajt= &b_1111_0000
'Rotate bajt,Left,1    'bajt= &b_1110_0001
'Rotate bajt,Left,1    'bajt= &b_1100_0011

Bajt = 22
Rotate Bajt , Left , 8
'jak velký je teï Bajt?
Print Bajt

'pøíkaz
'ROTATE  cislo , RIGHT , 1
'pracuje analogicky v opaèném smìru

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End









