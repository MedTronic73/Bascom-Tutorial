
'--------------------------------------------------------------
' Citac.bas
'
' ��ta� do 65 kHz s rozli�en�m 1 Hz
' M��en� sign�l m� b�t digit�ln�, max 5V
' Je p�ipojen na PD5
' Kdy� se dotkneme pinu PD5, m�l by uk�zat 50 Hz
'--------------------------------------------------------------

'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

'Timer1 = ��ta�, po��t� sestupn� hrany na pinu T1
Config Timer1 = Counter , Edge = Falling


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do
    Timer1 = 0                          'vynuluj ��ta�
    Start Timer1                        'zapni ��ta�
    Waitms 999                          'odm�� �as 1 vte�ina
    Waitus 373                          'nastavit v simul�toru

    Stop Timer1                         'vypni ��ta�
    Printbin 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8       '8= backspace
    Print Timer1 ; " Hz " ;
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'Princip je jednoduch�:
'Po dobu 1 vte�iny po��t� Timer1 impulsy na portd.5.
'Po�et impuls� pak odpov�d� kmito�tu v Hz.

'K odm��en� �asu nepou�ijeme p��kaz "Wait 1".
'Proto�e pot�ebujeme odm��it �as co nejp�esn�ji, slo��me �as z p��kaz� waitms a waitus.
'Pro nastaven� pou�ijeme po�itadlo cykl� v simul�toru.

'Maxim�ln� m��en� hodnota je 65 535, pak ��ta� p�ete�e. Nap� p�i kmito�tu 65 546
'uk�e 10 Hz. (a tak� p�i kmito�tech 2 x 65536 + 10, 3 x 65536 + 10 atd...)

'Jsou dva zp�soby, jak zv�t�it rozsah m��en�.
'1. Zkr�cen�m doby m��en� za cenu men��ho rozli�en�.
'2. Po��t�n�m p�ete�en� (rozli�en� se nezm�n�).

'V�bec nejv�t�� kmito�et, kter� jsou ��ta�e Timer0 a Timer1 schopny zpracovat, je asi polovina
'hodinov� frekvence, tedy 4 MHz (p�i krystalu 8 MHz).

'Pokud je m��en� kmito�tu sou��st� v�t��ho programu, pou�ijeme k odm��ov�n� �asu
'Timer1, proto�e smy�ky Wait zam�stn�vaj� ne�m�rn� procesor. K po��t�n� impuls�
'pak pou�ijeme Timer0 a p�i jeho p�ete�en� zv���me hodnotu n�jak� prom�nn�.
'Kmito�et pak vypo��t�me z hodnoty Timer0 a po�tu p�ete�en�.