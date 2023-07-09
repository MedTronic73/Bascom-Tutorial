'''''''''''''''''''''''''''''''''''''
'PWM.bas
'
'Osmibitov� pulsn� ���kov� modulace
'Nap�t� na pinu PB1 se plynule m�n� mezi 0 - 5V - 0 - 5V ... atd
'Led na PB1
'''''''''''''''''''''''''''''''''''''

'$sim
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmito�et krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up
Config Portb.1 = Output                 'v�stup ���kov� modulovan�ho sign�lu

'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''
Defbyte B

 Do
   For B = 20 To 255                    'v tomto cyklu for-next se b�hem 5 vte�in zm�n�
   Pwm1a = B                            'pom�r impuls/mezera plynule z 20/255 na 255/20
   Waitms 10
   Next

   For B = 255 To 20 Step -1            'v tomto cyklu for-next se b�hem 5 vte�in zm�n�
   Pwm1a = B                            'pom�r impuls/mezera plynule z 255/20 na 20/255
   Waitms 10
   Next
 Loop

'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

'��zen� ���kov� modulace je jednoduch� - zm�nou prom�nn� Pwm1a se m�n� pom�r
'impuls/mezera. Maxim�ln� hodnota Pwm1a je 255.
'P�i Pwma1 = 1 je pom�r 1/255
'P�i Pwma1 = 2 je pom�r 2/254
'P�i Pwma1 = 10 je pom�r 10/246 atd

'Nastaven� Timer1 pro PWM:
'Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up

'Pwm = 8                    - osmibitov� PWM (Pwm1a = 1 a� 255)
'Prescale = 1               - opak.kmit = 16 kHz (p�i oscil�toru 8MHz)
''(Prescale = 8             - opak.kmit = 16/8 kHz) atd
'Compare A Pwm = Clear Down - polarita v�stupn�ch impuls� je opa�n� ne� p�i Clear Up