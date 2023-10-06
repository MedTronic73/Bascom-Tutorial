'''''''''''''''''''''''''''''''''''''
'
' Watchdog1.bas
' There is a Led diode on PB1...
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m8def.dat"
$baud = 9600
$crystal = 8000000
$hwstack = 100
$swstack = 64
$framesize = 64

Config Watchdog = 2048                                      'reset for 2048 ms
Start Watchdog                                              'Start watchdog

   Print "Start"
Do
   'Reset Watchdog                      'try with and without this command
   Print "main"
   Waitms 500
Loop

End

'Config Watchdog allowed values ??in ms:
'Atmega8: 16 , 32 , 64 , 128 , 256 , 512 , 1024 , 2048.
'Atmega48,88,168 plus 4096, 8192.

'Shutdown: Stop Watchdog
