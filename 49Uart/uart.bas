'--------------------------------------------------------------
'
'  Uart.bas
' K vyzkoušení seriové komunikace mezi mikroprocesorem a PC
' použijeme rozhraní, které je na obrázku UART.jpg.
'
' Zkoušel jsem s terminály AccessPort a Hercules.
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
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
   Print                                'prázdný øádek
   Waitms 500

   Input "Napis text [Enter]: " , Str   'tady je nutný Enter
   Print Str
   Print
   Waitms 500

   Print "cekam na znak"
     For Temp = 1 To 1000000            'tady není tøeba Enter
     Byt = Inkey()                      'pøišel znak?

     If Byt > 0 Then                    '0 = ne
     Print "prisel znak " ; Chr(byt)    'ano
     End If

     Next
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End