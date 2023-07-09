'--------------------------------------------------------------
'
'  Fusing.bas
'  Form�tov�n� desetinn�ch ��sel (typ Single)
'  Krokujte v simul�toru
'--------------------------------------------------------------
'$sim                                   '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
Dim S As Single , Z As String * 10

Do

'm�jme ��slo
   S = 12.36789
   Print S

'form�tujeme na 1 desetinn� m�sto se zaokrouhlen�m:
   Z = Fusing(s , "#.#")
   Print Z

'form�tujeme na 2 desetinn� m�sta se zaokrouhlen�m:
   Z = Fusing(s , "#.##")
   Print Z

'form�tujeme na 3 desetinn� m�sta se zaokrouhlen�m:
   Z = Fusing(s , "#.###")
   Print Z

'form�tujeme na 1 desetinn� m�sto bez zaokrouhlen�:
   Z = Fusing(s , "#.&")
   Print Z

'form�tujeme na 2 desetinn� m�sta bez zaokrouhlen�:
   Z = Fusing(s , "#.&&")
   Print Z

'form�tujeme na 3 desetinn� m�sta bez zaokrouhlen�:
   Z = Fusing(s , "#.&&&")
   Print Z

 Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'P��kaz FUSING konvertuje ��slo typu single na string se zadan�m po�tem
'desetinn�ch m�st. Ur�ujeme t�m zp�sob zobrazen� ��sla na displeji.
'Pou�it� je z�ejm� z p��klad�.





