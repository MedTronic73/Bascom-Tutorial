'''''''''''''''''''''''''''''''''''''
'PWM.bas
'
'Osmibitová pulsnì šíøková modulace
'Napìtí na pinu PB1 se plynule mìní mezi 0 - 5V - 0 - 5V ... atd
'Led na PB1
'''''''''''''''''''''''''''''''''''''

'$sim
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmitoèet krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up
Config Portb.1 = Output                 'výstup šíøkovì modulovaného signálu

'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''
Defbyte B

 Do
   For B = 20 To 255                    'v tomto cyklu for-next se bìhem 5 vteøin zmìní
   Pwm1a = B                            'pomìr impuls/mezera plynule z 20/255 na 255/20
   Waitms 10
   Next

   For B = 255 To 20 Step -1            'v tomto cyklu for-next se bìhem 5 vteøin zmìní
   Pwm1a = B                            'pomìr impuls/mezera plynule z 255/20 na 20/255
   Waitms 10
   Next
 Loop

'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

'Øízení šíøkové modulace je jednoduché - zmìnou promìnné Pwm1a se mìní pomìr
'impuls/mezera. Maximální hodnota Pwm1a je 255.
'Pøi Pwma1 = 1 je pomìr 1/255
'Pøi Pwma1 = 2 je pomìr 2/254
'Pøi Pwma1 = 10 je pomìr 10/246 atd

'Nastavení Timer1 pro PWM:
'Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up

'Pwm = 8                    - osmibitová PWM (Pwm1a = 1 až 255)
'Prescale = 1               - opak.kmit = 16 kHz (pøi oscilátoru 8MHz)
''(Prescale = 8             - opak.kmit = 16/8 kHz) atd
'Compare A Pwm = Clear Down - polarita výstupních impulsù je opaèná než pøi Clear Up