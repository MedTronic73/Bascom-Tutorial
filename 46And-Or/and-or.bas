'--------------------------------------------------------------
'
'  And-or.bas
'
'  Logické operátory
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

B = 7
If B > 4 And B < 11 Then                'jestliže B je vìtší než 4 a zároveò B je menší než 11
Print "pravda"                          'obì podmínky jsou splnìny
Else
Print "nepravda"                        'nejsou splnìny obì podmínky
End If

B = 10
B1 = 10
If B <= 5 Or B1 >= 10 Then              'jestliže B je menší nebo rovno 5 nebo B1 je vìtší nebo rovno 10
Print "true"                            'alespoò jedna podmínka je splnìna
Else
Print "false"                           'ani jedna podmínka není splnìna
End If

B = 0
B1 = 1
B2 = 2
If B > 1 And B1 > 1 And B2 > 1 Then     'jestliže všechny promìnné jsou vìtší než 1
Print "pravda"
Else
Print "nepravda"
End If

I = 0
I1 = 1
I2 = 2
If I < 0 Or I1 < 0 Or I2 < 0 Then       'jestliže alespoò jedna promìnná je záporná
Print "pravda"
Else
Print "nepravda"
End If

B = 6
B1 = 3
If B > 4 And B < 11 Or B1 <= 2 Then     'vyhodnocuje zleva - pravda OR nepravda = pravda
Print "pravda"
Else
Print "nepravda"
End If

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End