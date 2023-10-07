'------------------------------------------------ -------------
'
' And-or.bas
'
' Logical operators
'------------------------------------------------ -------------'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Defbyte B
Defint I
''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Try it in the simulator

B = 7
If B > 4 And B < 11 Then                                    'jestliže B je vìtší než 4 a zároveò B je menší než 11
Print "True"                                                'obì podmínky jsou splnìny
Else
Print "False"                                               'nejsou splnìny obì podmínky
End If

B = 10
B1 = 10
If B <= 5 Or B1 >= 10 Then                                  'jestliže B je menší nebo rovno 5 nebo B1 je vìtší nebo rovno 10
Print "true"                                                'alespoò jedna podmínka je splnìna
Else
Print "false"                                               'ani jedna podmínka není splnìna
End If

B = 0
B1 = 1
B2 = 2
If B > 1 And B1 > 1 And B2 > 1 Then                         'jestliže všechny promìnné jsou vìtší než 1
Print "True"
Else
Print "False"
End If

I = 0
I1 = 1
I2 = 2
If I < 0 Or I1 < 0 Or I2 < 0 Then                           'jestliže alespoò jedna promìnná je záporná
Print "True"
Else
Print "False"
End If

B = 6
B1 = 3
If B > 4 And B < 11 Or B1 <= 2 Then                         'vyhodnocuje zleva - pravda OR nepravda = pravda
Print "True"
Else
Print "False"
End If

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End