
'--------------------------------------------------------------
' Blik.bas
'
' Klasický úvodní program, nìco jako "Hello world" u PC programování.
' K vývodu PB0 pøipojte diodu LED.
' Dioda bliká asi 2x za vteøinu.
'--------------------------------------------------------------

 ''''''''''''''' DIREKTIVY PØEKLADAÈE ''''''''''''''''''''''''''''''''''''''''
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmitoèet oscilátoru v Hz
$hwstack = 100
$swstack = 64
$framesize = 64

 ''''''''''''''' INICIALIZACE ''''''''''''''''''''''''''''''''''''''''''''''''

'Dim Temp as byte                       'pøíklad deklarace promìnné
'Declare Sub Myproc(x as word)          'pøíklad deklarace procedury  
 Config Portb.0 = Output                'PB0 nastav jako výstupní

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
 
 Do                                      'zaèátek hlavní smyèky Do-Loop
   Set Portb.0                          'Portb.0=1(+5V), dioda svítí
   Waitms 250                           'èekej 250 milisekund
   Reset Portb.0                        'Portd.0=0(zem), dioda nesvítí
   Waitms 250                           'èekej 250 milisekund
 Loop                                   'konec hlavní smyèky - jdi na Do

 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
 End

 ''''''''''''''' KÓD PODPROGRAMÙ, PROCEDUR A FUNKCÍ  ''''''''''''''''''''''''''
  


'(
 '''''''''''''''''''''''''''
 Popis programu
'''''''''''''''''''''''''''
 Typický program má ètyøi èásti:
 
 1. DIREKTIVY PØEKLADAÈE
 
 Direktivu $sim použijeme pøi simulaci. Pøed zapsáním kódu do procesoru ji
 odstraníme (napíšeme pøed ni apostrof).

 $regfile - øíká pøekladaèi jaký typ mikroprocesoru použijeme
 $crystal - informuje pøekladaè o tom, jaká je frekvence oscilátoru v mikroprocesoru

 $hwstack = 100
 $swstack = 64
 $framesize = 64

 Tyto direktivy vymezují v pamìti dat prostor pro ukládání návratových adres
 z podprogramù, pro pøedávání promìnných funkcím a pro ukládání lokálních promìnných.

------------------------------------------------------------------------------

 2. INICIALIZACE

 Tady deklarujeme promìnné, procedury a funkce. 
 Dále zde nastavíme konfiguraci portù, èítaèù a jiných periférií,
 obecnì zde píšeme pøíkazy, které staèí provést jednou, které se nemusí opakovat 
 pøi každém prùchodu hlavní smyèkou.
  
 Config Portb.0 = Output
 vývod, na kterém je dioda, musíme nastavit jako výstup,
 jinak pøíkazy SET a RESET nebudou mít žádný efekt.

------------------------------------------------------------------------------

 3. HLAVNÍ PROGRAM

 V hlavním programu je nekoneèná smyèka Do-Loop. Øíká se jí také Hlavní smyèka. 
 V ní se každých 250 ms zmìní úroveò na vývodu PB0.
 Pøíkaz SET nastaví bit  (na hodnotu 1).
 Pøíkaz RESET nuluje bit (na hodnotu 0).
 Pøíkaz End oznaèuje konec hlavního programu.
 Pøíkaz Waitms 250 znamená, že procesor èeká 250 milisekund.

 
 V každém programu je jen jedna hlavní smyèka DO - LOOP.
 Jakmile program provede pøíkazy v èásti INICIALIZACE,  
 vstoupí do této smyèky ve které pak bìhá stále dokola. Z této smyèky
 nemùže (a nesmí) vystoupit.
 To je typický zpùsob práce mikroprocesoru.

------------------------------------------------------------------------------

 4. PODPROGRAMY

 Tady píšeme kód podprogramù, procedur a funkcí. 
')
