'--------------------------------------------------------------
'
'  Lookup.bas
'  Vyhled�n� hodnoty na dan� pozici v tabulce
'--------------------------------------------------------------
'$sim                                   '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim Pozice As Integer , Hodnota As Byte

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Tento p��klad zkou�ejte v simul�toru. Pou�ijte tla��tko "Run program".

Do

'vstup z kl�vesnice ulo� do prom�nn� "Pozice":
    Input "Zadej pozici 0 a� 15 [Enter] : " , Pozice

'najdi hodnotu na zadan� pozici v tabulce "Moje_tabulka" :
    Hodnota = Lookup(pozice , Moje_tabulka)

'a vypi�
    Print "Na pozici " ; Pozice ; " je hodnota " ; Hodnota
    Print                               'pr�zdn� ��dek

Loop
 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:                           'n�v�t�
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'hodnota
'    0    1    2    3    4    5    6     7     8     9    10    11    12    13    14        'pozice

'Kdy� v programu pot�ebujeme hodn� konstant, vytvo��me tabulku p��kazem Data.
'Bude ulo�ena v pam�ti programu, tak�e m��e b�t i dost velk�.
'V tabulce m� zpravidla ka�d� hodnota n�jak� vztah ke sv� pozici (ale nen� to nutn�).
'V t�to tabulce je sin 0�=0 , sin 1�=0.017 sin 2�=0.034 atd.

'V tabulce mus�me koncovkou ur�it typ ��sla. Koncovky jsou:

'byte    - ��dn�   50
'word    - %     1000%
'integer - %      -12%
'long    - &  1000000&
'single  - !     3.14!

'Tabulku p�eme na �pln� konec k�du.

'Kdy� chceme postupn� ��st hodnoty z tabulky, pou�ijeme p��kaz RESTORE a READ.(viz Data.bas)
'Kdy� chceme zjistit jak� hodnota je na ur�it� pozici, pou�ijeme LOOKUP.
'Kdy� chceme zjistit na kter� pozici je ur�it� hodnota, pou�ijeme LOOKDOWN.   (viz Lookdown.bas)
'U p��kazu LOOKUP za��naj� pozice nulou, u p��kazu LOOKDOWN jedni�kou.
'Prom�nn�, do kter� �teme, mus� b�t stejn�ho typu jako �ten� hodnota.
