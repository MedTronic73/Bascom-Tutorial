'--------------------------------------------------------------
'
'  Voltmetr.bas
'
'--------------------------------------------------------------

$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim I As Byte
Dim Adc_value As Word
Dim Napeti As Single
Dim Suma As Word
Dim Lcd_string As String * 10
Const Ref = 5.000             'reference = 5 V (pøesnì zmìøit)

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

' Konfigurace LCD (dlouhý øádek kódu rozdìlíme podtržítkem)
Config Lcd = 16 * 2           'Typ displeje
Config Lcdpin = Pin , Db4 = Portb.4 , Db5 = Portb.5 , Db6 = Portb.6 , _
       Db7 = Portb.7 , E = Portb.3 , Rs = Portb.2

' Konfigurace AD pøevodníku
Config Adc = Single , Prescaler = Auto , Reference = Avcc

   Cls
   Do                         ' hlavní smyèka
      Suma = 0

      'prùmìr z osmi mìøení
      For I = 1 To 8
      Adc_value = Getadc(5)   ' èti adc hodnotu, kanál 5 (pin ADC5)
      Suma = Suma + Adc_value
      Next
      Napeti = Suma / 8

      Napeti = Napeti * Ref
      Napeti = Napeti / 1024
      Lcd_string = Fusing(napeti , "#.###")

      Locate 1 , 5
      Lcd Lcd_string ; " V"

    Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End







