'--------------------------------------------------------------
'
'  Fusing.bas
'  Formátování desetinných èísel (typ Single)
'  Krokujte v simulátoru
'--------------------------------------------------------------
'$sim                                   '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
Dim S As Single , Z As String * 10

Do

'mìjme èíslo
   S = 12.36789
   Print S

'formátujeme na 1 desetinné místo se zaokrouhlením:
   Z = Fusing(s , "#.#")
   Print Z

'formátujeme na 2 desetinná místa se zaokrouhlením:
   Z = Fusing(s , "#.##")
   Print Z

'formátujeme na 3 desetinná místa se zaokrouhlením:
   Z = Fusing(s , "#.###")
   Print Z

'formátujeme na 1 desetinné místo bez zaokrouhlení:
   Z = Fusing(s , "#.&")
   Print Z

'formátujeme na 2 desetinná místa bez zaokrouhlení:
   Z = Fusing(s , "#.&&")
   Print Z

'formátujeme na 3 desetinná místa bez zaokrouhlení:
   Z = Fusing(s , "#.&&&")
   Print Z

 Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'Pøíkaz FUSING konvertuje èíslo typu single na string se zadaným poètem
'desetinných míst. Urèujeme tím zpùsob zobrazení èísla na displeji.
'Použití je zøejmé z pøíkladù.





