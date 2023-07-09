'''''''''''''''''''''''''''''''''''''
'
' Pole.bas
'
'''''''''''''''''''''''''''''''''''''

'$sim                                    '!!!Odstranit p�i programov�n�
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64



'deklarace pole:
Dim Moje_pole(20) As Word               'moje_pole m� 20 �len� typu word
Dim I As Byte


'''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

   For I = 1 To 20                      'napln�me pole hodnotami
   Moje_pole(i) = I * I
   Next

Do                                      'hlavn� smy�ka
   Print
   For I = 1 To 20
      Print "Moje_pole(" ; I ; ") = " ; Moje_pole(i) ; "    " ; I ; "^2 = " ; Moje_pole(i)
      Wait 2
   Next
Loop                                    'konec hlavn� smy�ky

'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

 'Pole je �ada hodnot stejn�ho typu (nap� byte). Ka�d� hodnota v poli m� sv� po�adov�
 '��slo (index). Indexy za��naj� v�dy jedni�kou. (moje_pole(0) nejde)
 'V na�em p��kladu jsme vytvo�ili pole druh�ch mocnin.
 'Hodnota ka�d�ho �lenu je druhou mocninou jeho indexu.

'P��klad z�pisu do pole:
'moje_pole(1)=10     'do 1. �lenu pole "moje_pole" vlo��me hodnotu 10
'moje_pole(2)=20

'�ten� z pole:
'dim w as word
'w = moje_pole(3)        '�teme ov�em do prom�nn� stejn�ho typu jako maj� �leny pole

'"Moje_pole" vlastn� nahrazuje �adu prom�nn�ch
'prom1=1
'prom2=4
'prom3=9
'prom4=16 ...atd

'Jak� je v�hoda pou�it� pole?

'Jednodu��� z�pis
'P�edstavme si, �e chceme ulo�it obsah pam�ti programu na�eho mikroprocesoru, 2048 bajt�.
'Varianta  "dim pole(2048) as byte" je jist� jednodu��� ne�
'dim bajt1
'dim bajt2
'dim bajt3
'dim bajt4
'....
'dim bajt2048

'Dal�� v�hoda je, �e pomoc� index� m��eme s polem manipulovat ve smy�k�ch,
'nap� v tomto programu napln�me cel� pole hodnotami v jedn� smy�ce for-next.

'Pou�it� pole m� smysl hlavn� (nebo jenom?) tehdy, kdy� hodnoty �len� maj�
'n�jak� vztah ke sv�m index�m.
'V na�em p��klad� je hodnota druhou mocninou indexu,
'v p��kladu s pam�t� index ozna�uje adresu v pam�ti.





