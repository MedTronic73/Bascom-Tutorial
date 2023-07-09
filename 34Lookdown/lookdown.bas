'--------------------------------------------------------------
'
'  Lookdown.bas
'  Vyhled�n� pozice na kter� je zadan� hodnota.
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

'vstup z kl�vesnice ulo� do prom�nn� "Hodnota":
    Input "Zadej hodnotu do 241 [Enter] : " , Hodnota

'prohledej 15 pozic v tabulce "Moje_tabulka" a vra� pozici, na kter� je ��slo "hodnota" (kdy� ��slo v tabulce nen�, vr�t� -1)
    Pozice = Lookdown(hodnota , Moje_tabulka , 15)

      If Pozice > 0 Then                'na�el ��slo
        Print "Pozice = " ; Pozice
        Print                           'pr�zdn� ��dek

      Else                              'Pozice = -1, nena�el ��slo
        Print "Hodnota nen� v tabulce"
        Print
      End If
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'hodnota
'    1    2    3    4    5    6     7     8     9    10    11    12    13    14    15       'pozice

'Kdy� v programu pot�ebujeme hodn� konstant, vytvo��me tabulku p��kazem Data.
'Bude ulo�ena v pam�ti programu, tak�e m��e b�t i dost velk�.

'V tabulce mus�me koncovkou ur�it typ ��sla. Koncovky jsou:

'byte    - ��dn�
'word    - %
'integer - %
'long    - &
'single  - !

'Tabulku p�eme na �pln� konec k�du.

'Kdy� chceme postupn� ��st hodnoty z tabulky, pou�ijeme p��kazy RESTORE a READ. (viz data.bas)
'Kdy� chceme zjistit jak� hodnota je na ur�it� pozici, pou�ijeme LOOKUP.        (viz Lookup.bas)
'Kdy� chceme zjistit na kter� pozici je ur�it� hodnota, pou�ijeme LOOKDOWN.
'U p��kazu LOOKUP za��naj� pozice nulou, u p��kazu LOOKDOWN jedni�kou.
'Prom�nn�, do kter� �teme, mus� b�t stejn�ho typu jako �ten� hodnota.