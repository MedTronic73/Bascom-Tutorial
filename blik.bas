
'--------------------------------------------------------------
' Blik.bas
'
' Klasick� �vodn� program, n�co jako "Hello world" u PC programov�n�.
' K v�vodu PB0 p�ipojte diodu LED.
' Dioda blik� asi 2x za vte�inu.
'--------------------------------------------------------------

 ''''''''''''''' DIREKTIVY P�EKLADA�E ''''''''''''''''''''''''''''''''''''''''
'$sim                                    '!!!Odstranit p�i programov�n� - zrychlen� simulace
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmito�et oscil�toru v Hz
$hwstack = 100
$swstack = 64
$framesize = 64

 ''''''''''''''' INICIALIZACE ''''''''''''''''''''''''''''''''''''''''''''''''

'Dim Temp as byte                       'p��klad deklarace prom�nn�
'Declare Sub Myproc(x as word)          'p��klad deklarace procedury  
 Config Portb.0 = Output                'PB0 nastav jako v�stupn�

 ''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''''''''''''''
 
 Do                                      'za��tek hlavn� smy�ky Do-Loop
   Set Portb.0                          'Portb.0=1(+5V), dioda sv�t�
   Waitms 250                           '�ekej 250 milisekund
   Reset Portb.0                        'Portd.0=0(zem), dioda nesv�t�
   Waitms 250                           '�ekej 250 milisekund
 Loop                                   'konec hlavn� smy�ky - jdi na Do

 ''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''''''''''''''
 End

 ''''''''''''''' K�D PODPROGRAM�, PROCEDUR A FUNKC�  ''''''''''''''''''''''''''
  


'(
 '''''''''''''''''''''''''''
 Popis programu
'''''''''''''''''''''''''''
 Typick� program m� �ty�i ��sti:
 
 1. DIREKTIVY P�EKLADA�E
 
 Direktivu $sim pou�ijeme p�i simulaci. P�ed zaps�n�m k�du do procesoru ji
 odstran�me (nap�eme p�ed ni apostrof).

 $regfile - ��k� p�eklada�i jak� typ mikroprocesoru pou�ijeme
 $crystal - informuje p�eklada� o tom, jak� je frekvence oscil�toru v mikroprocesoru

 $hwstack = 100
 $swstack = 64
 $framesize = 64

 Tyto direktivy vymezuj� v pam�ti dat prostor pro ukl�d�n� n�vratov�ch adres
 z podprogram�, pro p�ed�v�n� prom�nn�ch funkc�m a pro ukl�d�n� lok�ln�ch prom�nn�ch.

------------------------------------------------------------------------------

 2. INICIALIZACE

 Tady deklarujeme prom�nn�, procedury a funkce. 
 D�le zde nastav�me konfiguraci port�, ��ta�� a jin�ch perif�ri�,
 obecn� zde p�eme p��kazy, kter� sta�� prov�st jednou, kter� se nemus� opakovat 
 p�i ka�d�m pr�chodu hlavn� smy�kou.
  
 Config Portb.0 = Output
 v�vod, na kter�m je dioda, mus�me nastavit jako v�stup,
 jinak p��kazy SET a RESET nebudou m�t ��dn� efekt.

------------------------------------------------------------------------------

 3. HLAVN� PROGRAM

 V hlavn�m programu je nekone�n� smy�ka Do-Loop. ��k� se j� tak� Hlavn� smy�ka. 
 V n� se ka�d�ch 250 ms zm�n� �rove� na v�vodu PB0.
 P��kaz SET nastav� bit  (na hodnotu 1).
 P��kaz RESET nuluje bit (na hodnotu 0).
 P��kaz End ozna�uje konec hlavn�ho programu.
 P��kaz Waitms 250 znamen�, �e procesor �ek� 250 milisekund.

 
 V ka�d�m programu je jen jedna hlavn� smy�ka DO - LOOP.
 Jakmile program provede p��kazy v ��sti INICIALIZACE,  
 vstoup� do t�to smy�ky ve kter� pak b�h� st�le dokola. Z t�to smy�ky
 nem��e (a nesm�) vystoupit.
 To je typick� zp�sob pr�ce mikroprocesoru.

------------------------------------------------------------------------------

 4. PODPROGRAMY

 Tady p�eme k�d podprogram�, procedur a funkc�. 
')
