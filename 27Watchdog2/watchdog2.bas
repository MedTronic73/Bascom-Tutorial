'''''''''''''''''''''''''''''''''''''
'
'  Watchdog2.bas
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64
$initmicro

Config Watchdog = 2048                  'reset za 2048 milisekund
Start Watchdog                          'zapni watchdog

Config Lcd = 16 * 2
Config Lcdpin = Pin , Db4 = Portb.4 , Db5 = Portb.5 , Db6 = Portb.6 , Db7 = Portb.7 , E = Portb.3 , Rs = Portb.2

Dim I As Byte
Cursor Off
'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''
'Pokud nepoužijeme pøíkaz Reset Watchdog, nenapoèítá program nikdy do 20, protože
'watchdog resetuje procesor pøed sedmým cyklem (7x300 = 2100 ms)
Do
  For I = 1 To 30
  Print I
  Waitms 500
  'Reset Watchdog   'tady je watchdog vèas resetován, zkuste odkomentovat
  Next I
  'Reset Watchdog   'tady je pozdì, watchdog pøetekl

Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

'Podprogram _init_micro bude proveden hned po resetu
_init_micro:
Config Watchdog = 2048                  'reset za 2048 milisekund
Start Watchdog                          'zapni watchdog
Return

'Poznámka:

'I když v tomto programu umístíme pøíkazy Config Watchdog a Start Watchdog
'na zaèátek, za direktivu $crystal, program po resetu od watchdog pøestane fungovat.

'Pøekladaè totiž umístí na zaèátek výsledného kódu inicializaci displeje,
'která trvá asi 250 ms. Watchdog má ale po resetu nastaven základní interval
'16 ms, takže stále resetuje.

'Direktivou $INITMICRO donutíme pøekladaè aby na úplný zaèátek kódu umístil
'podprogram _init_micro (musí se jmenovat právì takto). V nìm nastavíme pøeddìliè
'Watchdogu a vše je v poøádku.

'Toto chování se mùže lišit podle typu procesoru.
'Zkuste s _init_micro i bez nìho.