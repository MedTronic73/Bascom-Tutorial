'''''''''''''''''''''''''''''''''''''
'
' Watchdog1.bas
' Na PB1 je Led dioda
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"
$baud = 9600
$crystal = 8000000
$hwstack = 100
$swstack = 64
$framesize = 64

Config Watchdog = 2048                  'reset za 2048 ms
Start Watchdog                          'zapni watchdog

   Print "Start"
Do
   'Reset Watchdog                      'zkuste s tímto pøíkazem a bez nìho
   Print "main"
   Waitms 500
Loop

End

'Povolené hodnoty Config Watchdog v ms:
'Atmega8: 16 , 32, 64 , 128 , 256 , 512 , 1024 , 2048.
'Atmega48,88,168 kromì toho ještì 4096, 8192.

'Vypnutí: Stop Watchdog

'Když nastavíme reset na 2048 ms, musí být pøíkaz Reset Watchdog proveden
'èastìji než je tato doba.
'Když program zatuhne, pøíkazy se neprovádí, watchdog pøeteèe a resetuje procesor.
'Pøíkazù Reset Watchdog mùže být v programu více na rùzných místech.   