'------------------------------------------------- -------------
'
'Timer1_Oscilator.bas
'
'
'A program for a flashing saltpeter, the interesting thing is that it has no code
'in the main loop.
'Uses that Timer1 changes the level on pin PB1 when the comparison matches.
'
'The LED is connected between PB1 and ground.
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Counter settings:
Config Timer1 = Timer, Prescale = 256, Compare A = Toggle, Clear Timer = 1
'Prescale = 256 counter with 256 pre-divider
'Compare A = Toggle pin OC1A (PB1) changes level when matching
'Clear Timer = 1 counter is reset on match

'Timer 1 counts and compares its value with the value we entered
'to the comparison register Compare1a.
'As soon as both values are the same, the level on pin OC1A (PB1) changes,
'the counter is reset and counts again from zero.

Dim Frequency As Byte                                       '[Hz]
Dim Compare As Long
Frequency = 5                                               ' Set Frequancy as you wish

Config Portb.3 = Output
'Const Xtal = 8000000

'set comparison register Compare1a = (_xtal / 2/256 / Frequency) -1
Compare = _xtal / 2                                         'match must occur twice per period
Compare = Compare / 256                                     'divider
Compare = Compare / Frequency
Compare = Compare - 1
Compare1a = Compare
'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '

'

'' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' ' '' '' '' '
 End

'_xtal is an internal compiler constant that has the same value as $ crystal
'And note that we did't define the _xtal value the compiler take it