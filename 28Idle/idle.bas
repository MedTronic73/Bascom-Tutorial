'''''''''''''''''''''''''''''''''''''
'
'  Idle.bas
'
'  Uvedeme procesor do stavu Idle a probud�me ho p�eru�en�m od p�ete�en� Timer1
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Timer , Prescale = 1024 'p�ete�e asi za 8s
Config Aci = Off                        'vypni kompar�tor (dal�� zmen�en� spot�eby)

Enable Interrupts                       'povol p�eru�en�
Enable Timer1                           'povol p�eru�en� p�i p�ete�en� Timer1
On Timer1 Timer1_isr                    'p�i p�eru�en� jdi na
Cursor Off                              'vypni LCD kurzor

Print "reset"
Wait 1

'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''

Do
    Print "spim"
    Wait 1
    Idle                                'tady usne

    Print "bdim"                        'tady pokra�uje po probuzen�
    Wait 1
Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Timer1_isr:

      Cls
      Lcd "prerus"
      Waitms 500

Return
'p��kaz Idle nem��e b�t pou�it v obsluze p�eru�en� !!!

'V hlavn�m programu usp�me procesor p��kazem Idle.
'Po asi 8 vte�in�ch p�ete�e Timer1 a vyvol� p�eru�en�, kter� probud� procesor.

'Ve stavu Idle je odb�r proudu asi polovi�n� proti aktivn�mu stavu.
'Probud� se p�eru�en�m, nap� od ��ta��, vn�j��m atd.

