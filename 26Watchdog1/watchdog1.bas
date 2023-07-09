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
   'Reset Watchdog                      'zkuste s t�mto p��kazem a bez n�ho
   Print "main"
   Waitms 500
Loop

End

'Povolen� hodnoty Config Watchdog v ms:
'Atmega8: 16 , 32, 64 , 128 , 256 , 512 , 1024 , 2048.
'Atmega48,88,168 krom� toho je�t� 4096, 8192.

'Vypnut�: Stop Watchdog

'Kdy� nastav�me reset na 2048 ms, mus� b�t p��kaz Reset Watchdog proveden
'�ast�ji ne� je tato doba.
'Kdy� program zatuhne, p��kazy se neprov�d�, watchdog p�ete�e a resetuje procesor.
'P��kaz� Reset Watchdog m��e b�t v programu v�ce na r�zn�ch m�stech.   