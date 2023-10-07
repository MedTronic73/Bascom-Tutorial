'--------------------------------------------------------------
'
'  Voltmetr.bas
'
'--------------------------------------------------------------

$sim
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim I As Byte
Dim Adc_value As Word
Dim Average As Single
Dim Suma As Word
Dim Lcd_string As String * 10
Const Ref = 5.000                                           'reference = 5 V (pøesnì zmìøit)

''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''

' LCD configuration (long lines of code are separated by underscores)

Config Lcd = 16 * 2                                         'Typ displeje
Config Lcdpin = Pin , Db4 = Portb.4 , Db5 = Portb.5 , Db6 = Portb.6 , _
       Db7 = Portb.7 , E = Portb.3 , Rs = Portb.2

' AD converter configuration

Config Adc = Single , Prescaler = Auto , Reference = Avcc

   Cls
   Do                                                       ' Main Loop
      Suma = 0

      'mean of eight measurements
      For I = 1 To 8
      Adc_value = Getadc(5)                                 ' read adc value, channel 5 (pin ADC5)
      Suma = Suma + Adc_value
      Next
      Average = Suma / 8

      Average = Average * Ref
      Average = Average / 1024
      Lcd_string = Fusing(Average , "#.###")

      Locate 1 , 5
      Lcd Lcd_string ; " V"

    Loop

 ''''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''''''''''''
End






