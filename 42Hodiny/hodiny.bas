'--------------------------------------------------------------
'  Hodiny.bas
'
'  Po zapnut� za�ne zobrazovat hodiny : minuty : vte�iny (od 0:00:00)
'  K PD5 a PD6 p�ipojte tla��tka pro nastaven�
'--------------------------------------------------------------
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                     ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


'Timer1 = �asova�, bez p�edd�li�e, odpojen� od pinu OC1A, p�i shod� vynuluj ��ta�
Config Timer1 = Timer , Prescale = 1 , Compare A = Disconnect , Clear Timer = 1
Compare1a = 40000                       'porovn�vac� hodnota (5 ms)

Enable Interrupts                       'povol p�eru�en�
Enable Compare1a                        'povol p�eru�en� COMPARE1A
On Compare1a Tim                        'p�i p�eru�en� jdi na Tim

Declare Sub Zobraz                      'deklarace procedury
Dim Flag As Bit
Dim Pocet_preruseni As Word             'po�et p�eru�en�
Dim Vterin As Byte , Minut As Byte , Hodin As Byte

Tlac_hod Alias Pind.5                   'tla��tko nastaven� hodin
Tlac_min Alias Pind.6                   'tla��tko nastaven� minut
Config Portd = Input                    'cel� portD vstupn�
Portd = 255                             'pull-up


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Pocet_preruseni = 0                     'vynuluj prom�nn�
Vterin = 0
Minut = 0
Hodin = 0


 Do

'Test tla��tek:
     If Tlac_hod = 0 Then
         Incr Hodin                     'p�i�ti 1
         Vterin = 0
         Call Zobraz
         Waitms 200                     'rychlost p�i��t�n�
     End If

     If Tlac_min = 0 Then
         Incr Minut
         Vterin = 0
         Call Zobraz
         Waitms 200
     End If

'Zobrazen� na displeji:
      If Flag = 1 Then
         Call Zobraz
         Waitms 50
         Flag = 0
      End If
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Sub Zobraz
    Printbin 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8       '8= backspace
    Print Hodin ; ":";

    If Minut < 10 Then                  'pokud minut je 0 - 9
    Print "0" ; Minut ; ":";            'p�id�me �vodn� nulu, aby v�sledek byl v�dy dvojm�stn�
    Else
    Print Minut ; ":" ;
    End If

    If Vterin < 10 Then
    Print "0" ; Vterin ;
    Else
    Print Vterin ;
    End If
End Sub


Tim:                                    'obsluha p�eru�en�

    Incr Pocet_preruseni                'ka�d�ch 5 milisec vznikne p�eru�en� (p�i 10 MHz)

    If Pocet_preruseni > 199 Then       '200 x 5 ms = 1 sec
       Incr Vterin                      'zv�t�i o 1
       Pocet_preruseni = 0              'vynuluj po��tadlo
       Flag = 1
       End If

    If Vterin > 59 Then
       Vterin = 0
       Incr Minut                       'ka�dou minutu
       End If

    If Minut > 59 Then
       Minut = 0
       Incr Hodin                       'ka�dou hodinu
       End If

    If Hodin > 23 Then                  'ka�d� den
       Hodin = 0
       End If
 Return
' Pozn�mky:
'
' V tomto programu jsme povolili p�eru�en� Compare1a a do kompara�n�ho registru
' zapsali hodnotu 50 000.
'
' Timer1 po��t� od nuly a porovn�v� sv�j stav s kompara�n�m registrem. A� dos�hne
' hodnoty 50 000 vyvol� p�eru�en�. ��ta� se vynuluje (nastavili jsme Clear timer = 1)
' a po��t� d�l, zat�mco program sko�� na obsluhu p�eru�en�.
'
' 50 000 krok� ��ta�e jsme zvolili proto, �e to odpov�d� p�kn� zaokrouhlen� dob� 5 milisekund.
' Tedy ka�d�ch 5 ms p�ijde p�eru�en�, celkem 200x za vte�inu.
'
' V obsluze p�eru�en� po 200 p�eru�en�ch p�i�teme vte�inu, po 60 vte�in�ch
' minutu atd.
'
' V hlavn�m programu st�le dokola testujeme tla��tka a zobrazujeme �as.
' P�i kr�tk�m stisknut� tla��tka se hodnota hodin nebo minut zv�t�� o 1.
' Kdy� dr��me tla��tko trvale, zv�t�� se ka�d�ch 200 ms.
'
' T�m, �e �as jde nastavit jen dop�edu, u�et��me dv� tla��tka.
'
' P�esnost z�vis� na krystalu. Krystal v�t�inou kmit� o n�co v��, tak�e zv�t��me
' kompara�n� hodnotu. M�j vzorek �el dost p�esn� s hodnotou 50 005.

' Kdy� zvol�me p�edd�li� ��ta�e "Prescale = 8"
' a ��dek v obsluze p�eru�en� uprav�me na  "If Pocet_preruseni > 24 Then"
' tak hodiny p�jdou stejn�, jen po�et p�eru�en� za vte�inu bude men��.




