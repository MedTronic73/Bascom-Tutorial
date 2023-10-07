'------------------------------------------------ -------------
'
' Uart.bass
' To test serial communication between microprocessor and PC
' we will use the interface that is in the image UART.jpg.
'
' I tried with AccessPort and Hercules terminals.
'------------------------------------------------ -------------

'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Dim Byt As Byte , Temp As Long
Dim Mystr As String * 10

''''''''''''''''''''''''''' MAIN PROGRAM '''''''''''''''''''''''''''''''''''

Do

   Print
   Print "Hello"
   Print

   Temp = 270001
   Print "Temp = " ; Temp
   Print                                                    'blank line
   Waitms 500

   Input "Write a text [Enter]: " , Mystr                     'Enter is required here
   Print Mystr
   Print
   Waitms 500

   Print "I'm waiting for a sign"
     For Temp = 1 To 1000000                                'No need to enter here
     Byt = Inkey()                                          'has the sign come?

     If Byt > 0 Then                                        '0 = ne
     Print "Recived " ; Chr(byt)                            'Yes
     End If

     Next
Loop

 ''''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''''''''''''
End