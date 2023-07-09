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
'Pokud nepou�ijeme p��kaz Reset Watchdog, nenapo��t� program nikdy do 20, proto�e
'watchdog resetuje procesor p�ed sedm�m cyklem (7x300 = 2100 ms)
Do
  For I = 1 To 30
  Print I
  Waitms 500
  'Reset Watchdog   'tady je watchdog v�as resetov�n, zkuste odkomentovat
  Next I
  'Reset Watchdog   'tady je pozd�, watchdog p�etekl

Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

'Podprogram _init_micro bude proveden hned po resetu
_init_micro:
Config Watchdog = 2048                  'reset za 2048 milisekund
Start Watchdog                          'zapni watchdog
Return

'Pozn�mka:

'I kdy� v tomto programu um�st�me p��kazy Config Watchdog a Start Watchdog
'na za��tek, za direktivu $crystal, program po resetu od watchdog p�estane fungovat.

'P�eklada� toti� um�st� na za��tek v�sledn�ho k�du inicializaci displeje,
'kter� trv� asi 250 ms. Watchdog m� ale po resetu nastaven z�kladn� interval
'16 ms, tak�e st�le resetuje.

'Direktivou $INITMICRO donut�me p�eklada� aby na �pln� za��tek k�du um�stil
'podprogram _init_micro (mus� se jmenovat pr�v� takto). V n�m nastav�me p�edd�li�
'Watchdogu a v�e je v po��dku.

'Toto chov�n� se m��e li�it podle typu procesoru.
'Zkuste s _init_micro i bez n�ho.