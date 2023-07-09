'--------------------------------------------------------------
'
'  Data.bas
'  Vytvo�en� a �ten� tabulek
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B                               'v�echny prom�nn�, za��naj�c� na B budou typu byte
Defword W                               'v�echny prom�nn�, za��naj�c� na W budou typu word
Defint I                                'podobn� integer
Deflng L                                'long
Defsng F                                'single

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Tento p��klad zkou�ejte v simul�toru.

Do

   Restore Tabulka_1                    'postav�me se na za��tek Tabulka_1
   Read B_byte                          'p�e�teme prvn� hodnotu z tabulky do prom�nn� b_byte
   Print B_byte
   Read B_byte                          'po ka�d�m �ten� se posuneme na dal�� hodnotu
   Print B_byte                         'tak�e m��eme ��st jenom postupn�, ne v libovoln�m po�ad�
   Read B_byte
   Print B_byte


   Restore Novak                        'postav�me se na za��tek tabulky Novak
   Dim Jmeno As String * 10
   Dim Prijmeni As String * 10

   Read Jmeno                           'prvn� hodnota je typu string, �teme do prom�nn� typu string
   Read Prijmeni                        'druh� hodnota je typu string, �teme do prom�nn� typu string
   Read W_narozen                       't�et� hodnota je typu word, �teme do prom�nn� typu word
   Read L_telefon                       '�tvrt� hodnota je typu long, �teme do prom�nn� typu long
   Read F_promile                       'p�t� hodnota je typu single, �teme do prom�nn� typu single

   Print _
   Jmeno ; " , " ; _
   Prijmeni ; " , " ; _
   W_narozen ; _
    " , tel. " ; L_telefon ; " , " ; _
   Fusing(f_promile , "#.##") ; " promile "

Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Tabulka_1:                              'n�v�t�
Data 0 , 170 , 4 , 52 , 9 , 87 , 204 , 121 , 239 , 56       'tabulka hodnot typu byte

Novak:
Data "Josef" , "Nov�k" , 1890% , 753898& , 2.4!       'sm�en� tabulka


'Dal�� p��klady tabulek:

'Tabulka_2:
'Data 1234% , &H7BF% , 40000% , -2000% , 90% , 870% , 2040%       'tabulka hodnot typu word a integer

'Tabulka_3:
'Data 270000& , &H17EA10& , 10000000&                             'tabulka hodnot typu long

'Tabulka_4:
'Data "Jmeno" , "prijmeni" , "adresa"                             'tabulka hodnot typu string

'------------------------------------------------------------------------------------

'Kdy� v programu pot�ebujeme hodn� konstant, vytvo��me tabulku p��kazem Data.
'Bude ulo�ena v pam�ti programu, tak�e m��e b�t i dost velk�.

'V tabulce mus�me koncovkou ur�it typ ��sla. Koncovky jsou:
'byte    - ��dn�
'word    - %
'integer - %
'long    - &
'single  - !

'Tabulky p�eme na �pln� konec k�du.

'Kdy� chceme postupn� ��st hodnoty z tabulky, pou�ijeme p��kazy RESTORE a READ.
'Kdy� chceme zjistit jak� hodnota je na ur�it� pozici, pou�ijeme LOOKUP.    (viz lookup.bas)
'Kdy� chceme zjistit na kter� pozici je ur�it� hodnota, pou�ijeme LOOKDOWN. (viz lookdown.bas)
'U p��kazu LOOKUP za��naj� pozice nulou, u p��kazu LOOKDOWN jedni�kou.
'Prom�nn�, do kter� �teme, mus� b�t stejn�ho typu jako �ten� hodnota.