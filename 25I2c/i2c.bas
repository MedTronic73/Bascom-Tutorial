'--------------------------------------------------------------
'  I2C.bas
'
'  Z�pis a �ten� po sb�rnici I2C.
'  Seriov� EEprom 24c01 (02, 04) je p�ipojena podle obr. I2c.jpg
'--------------------------------------------------------------
'$sim
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmito�et krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64


'Sb�rnice i2c:
Config Scl = Portd.2                    'i2c hodiny
Config Sda = Portd.3                    'i2c data

Declare Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)       'z�pis jednoho bajtu do eeprom
Declare Sub Read_eeprom(byval Adresa As Byte , Value As Byte)       '�ten� jednoho bajtu z eeprom

Dim Adresa As Byte , Value As Byte

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Z�pis:
'Na adresu 1 zap�eme hodnotu 100:
   Call Write_eeprom(1 , 100)

'�ten�:
'Z adresy 1 p�e�teme hodnotu do prom�nn� Value:
  Call Read_eeprom(1 , Value)



'Na adresy 60 a� 80 zap�eme hodnoty 120 a� 160:
   For Adresa = 60 To 80
   Value = Adresa * 2
   Call Write_eeprom(adresa , Value)    'na adresu "adresa" zapi� hodnotu "value")
   Next

'Zapsan� hodnoty p�e�teme a zobraz�me:
   Do
      For Adresa = 60 To 80
          Call Read_eeprom(adresa , Value)       '�ti na adrese a ulo� do prom�nn� value
          Print "Adr " ; Adresa ; "  " ; Value       'napi� adresu a hodnotu
          Waitms 1000                   '�ekej 1 sec
      Next
   Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'Procedury pro z�pis a �ten�. Adresa �ipu plat� pro 24c01-04 s uzemn�n�mi
'v�vody A0,A1,A2. Pro j�n� obvod je nutno procedury upravit.

'z�pis do Eeprom
Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)
    I2cstart                            'start
    I2cwbyte &HA0                       'adresa �ipu, bit0=0 znamen� z�pis
    I2cwbyte Adresa                     'adresa v EEPROM, na kterou budeme zapisovat
    I2cwbyte Value                      'zapi� hodnotu Value
    I2cstop                             'stop
    Waitms 10                           'z�pis trv� p�r milisekund, po�k�me
End Sub


'�ten� z Eeprom
Sub Read_eeprom(byval Adresa As Byte , Value As Byte)
   I2cstart                             'start
   I2cwbyte &HA0                        'adresa �ipu, bit0=0 znamen� z�pis
   I2cwbyte Adresa                      'adresa v EEPROM, ze kter� budeme ��st
   I2cstart                             'nov� start
   I2cwbyte &HA1                        'adresa �ipu, bit0=1 znamen� �ten�
   I2crbyte Value , Nack                '�ti bajt do prom�nn� Value, nepos�lej ack
   I2cstop                              'stop
End Sub



'Ka�d� sou��stka, kter� m� zabudovanou komunikaci i2c, m� ur�en� �ty�bitov�
'k�d sou��stky. U pam�ti 24c02 je to 1010.

'D�le m� 24c02 t�i adresov� v�vody A0 A1 A2. Ty p�ipojujeme na �rovn� 0 nebo 1
'a t�m nastav�me adresu konkr�tn� sou��stky. M�me 8 mo�nost�, tak�e m��eme
'na jednu sb�rnici p�ipojit a� 8 pam�t�.

'Adresu �ipu sestav�me takto:

' 1010 000 0

'Prvn� �ty�i bity je k�d sou��stky. Najdeme ho v datasheetu.

'Dal�� t�i bity je adresa sou��stky (A2 A1 A0). My jsme v�echny adresov� v�vody
'uzemnili, tak�e adresa sou��stky je 000.

'Posledn� bit zna��, jestli chceme do �ipu zapisovat (0), nebo ��st (1).

'U pam�ti 24c04 bit A0 vyb�r� horn� nebo doln� polovinu pam�ti.
'Adresu sou��stky ur�uj� bity A2 A1 tak�e jsou jen 4 mo�nosti.
