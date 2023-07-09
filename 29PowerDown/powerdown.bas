'''''''''''''''''''''''''''''''''''''
'
'25PowerDown.bas
'
'Procesor uvedeme do stavu Power down a probud�me extern�m p�eru�en�m.
'P�eru�en� Int0 vyvol�me tla��tkem na PD2.
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Config Int0 = Low Level                 'ext.p�eru�en�0 n�zkou �rovn�


Enable Int0                             'povol p�eru�en� Int0
On Int0 Int0_isr                        'p�i p�eru�en� jdi na



'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''

Ddrd.2 = 0
Portd.2 = 1
Print "reset"
Wait 1
Enable Interrupts                       'povol v�echna p�eru�en�

Do
    Print "spim"
    Wait 1

    Powerdown                           'tady usne
    Print "bdim"                        'tady pokra�uje po probuzen�

    Wait 1

Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Int0_isr:
    Print "prerus"
    Waitms 500
    Eifr.intf0 = 1                      'vyma� p��znak p�eru�en�
Return

'Ve stavu Power down klesne odb�r na n�kolik mikroamp�r.

'Extern� oscil�tor je vypnut, nejdou ��ta�e.
'Procesor se probud� pouze:
'-extern�m resetem (impuls log0 na pinu RESET)
'-watchdog resetem
'-extern�m p�eru�en�m INT0 n�zkou �rovn� (ne hranou).

'Typick�m p��kladem pou�it� powerdown m��e b�t termostat topen� s bateriov�m nap�jen�m.
'Sta�� procesor probudit nap�. ka�dou minutu, teplotu nemus�me m��it nep�etr�it�.
'Pr�m�rn� odb�r t�m markantn� klesne.