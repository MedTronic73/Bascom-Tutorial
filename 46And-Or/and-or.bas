'--------------------------------------------------------------
'
'  And-or.bas
'
'  Logick� oper�tory
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

B = 7
If B > 4 And B < 11 Then                'jestli�e B je v�t�� ne� 4 a z�rove� B je men�� ne� 11
Print "pravda"                          'ob� podm�nky jsou spln�ny
Else
Print "nepravda"                        'nejsou spln�ny ob� podm�nky
End If

B = 10
B1 = 10
If B <= 5 Or B1 >= 10 Then              'jestli�e B je men�� nebo rovno 5 nebo B1 je v�t�� nebo rovno 10
Print "true"                            'alespo� jedna podm�nka je spln�na
Else
Print "false"                           'ani jedna podm�nka nen� spln�na
End If

B = 0
B1 = 1
B2 = 2
If B > 1 And B1 > 1 And B2 > 1 Then     'jestli�e v�echny prom�nn� jsou v�t�� ne� 1
Print "pravda"
Else
Print "nepravda"
End If

I = 0
I1 = 1
I2 = 2
If I < 0 Or I1 < 0 Or I2 < 0 Then       'jestli�e alespo� jedna prom�nn� je z�porn�
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