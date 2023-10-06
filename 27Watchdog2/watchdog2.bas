'''''''''''''''''''''''''''''''''''''
'
'  Watchdog2.bas
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64
$initmicro

Config Watchdog = 2048                                      'reset za 2048 milisekund
Start Watchdog                                              'zapni watchdog

Config Lcd = 16 * 2
Config Lcdpin = Pin , Db4 = Portb.4 , Db5 = Portb.5 , Db6 = Portb.6 , Db7 = Portb.7 , E = Portb.3 , Rs = Portb.2

Dim I As Byte
Cursor Off
'''''''''''''''''''''''''' MAIN PROGRAM '''''''''''''''''' ''''''''''''''''
'If we don't use the Reset Watchdog command, the program will never count to 20 because
'watchdog resets the processor before the seventh cycle (7x300 = 2100 ms)
Do
  For I = 1 To 30
  Print I
  Waitms 500
  'Reset Watchdog                         'here the watchdog has been reset, try uncommenting
  Next I
  'Reset Watchdog                         It's late here, the watchdog has run out

Loop
'''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''' '''''''
 end

'Subroutine _init_micro will be executed immediately after reset
_init_micro:
Config Watchdog = 2048                                      'reset in 2048 milliseconds
Start Watchdog                                              'turn on watchdog
Return

'Note:

'Though we put the Config Watchdog and Start Watchdog commands in this program
'at the beginning, after the $crystal directive, the program stops working after a reset from the watchdog.

'This is because the compiler places the initialization of the display at the beginning of the resulting code,
'which lasts about 250 ms. But the watchdog has a basic interval set after the reset
'16ms so it still resets.

'With the $INITMICRO directive, we force the compiler to place the code at the very beginning
'subroutine _init_micro (must be named exactly like this). We will set the partition in it
'Watchdog and everything is fine.

'This behavior may vary by processor type.
'Try with _init_micro and without it.

