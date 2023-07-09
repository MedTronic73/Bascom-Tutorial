'--------------------------------------------------------------
'
'  Uart.bas
' K vyzkou�en� seriov� komunikace mezi mikroprocesorem a PC
' pou�ijeme rozhran�, kter� je na obr�zku UART.jpg.
'
' Zkou�el jsem s termin�ly AccessPort a Hercules.
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace (odstran� �asov� prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Dim Byt As Byte , Temp As Long
Dim Str As String * 10
 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do

   Print
   Print "Ahoj"
   Print

   Temp = 270001
   Print "Temp = " ; Temp
   Print                                'pr�zdn� ��dek
   Waitms 500

   Input "Napis text [Enter]: " , Str   'tady je nutn� Enter
   Print Str
   Print
   Waitms 500

   Print "cekam na znak"
     For Temp = 1 To 1000000            'tady nen� t�eba Enter
     Byt = Inkey()                      'p�i�el znak?

     If Byt > 0 Then                    '0 = ne
     Print "prisel znak " ; Chr(byt)    'ano
     End If

     Next
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End