'''''''''''''''''''''''''''''''''
'PWM.bas
'
'Eight-bit pulse-width modulation
'The voltage on pin PB1 varies smoothly between 0 - 5V - 0 - 5V ... etc
'Ice on PB1
'''''''''''''''''''''''''''''''''
'$sim
$regfile = "m8def.dat"                                     'Soubor s deklaracemi
$crystal = 8000000                                          'Kmitoèet krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up
Config Portb.1 = Output                                     'width modulated signal output

'''''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''''''''''''''''''''
Defbyte B

 Do
   For B = 20 To 255                                        'in this for-next loop will change within 5 seconds
   Pwm1a = B                                                'impulse/gap ratio smoothly from 20/255 to 255/20
   Waitms 10
   Next

   For B = 255 To 20 Step -1                                'in this for-next loop will change within 5 seconds
   Pwm1a = B                                                'impulse/gap ratio smoothly from 255/20 to 20/255
   Waitms 10
   Next
 Loop

'''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''' '''''''
 end

'Controlling the width modulation is simple - changing the variable Pwm1a changes the ratio
'impulse/gap. The maximum value of Pwm1a is 255.
'When Pwma1 = 1, the ratio is 1/255
'When Pwma1 = 2, the ratio is 2/254
'When Pwma1 = 10, the ratio is 10/246, etc

'Setting Timer1 for PWM:
'Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up

'Pwm = 8 - eight-bit PWM (Pwm1a = 1 to 255)
'Prescale = 1 - repetition rate = 16 kHz (with an 8MHz oscillator)
''(Prescale = 8 - op.oscillation = 16/8 kHz) etc
'Compare A Pwm = Clear Down - the polarity of the output pulses is opposite to Clear Up

