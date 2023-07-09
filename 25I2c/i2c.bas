'--------------------------------------------------------------
'  I2C.bas
'
'  Zápis a ètení po sbìrnici I2C.
'  Seriová EEprom 24c01 (02, 04) je pøipojena podle obr. I2c.jpg
'--------------------------------------------------------------
'$sim
$regfile = "m88def.dat"                 'Soubor s deklaracemi
$crystal = 8000000                      'Kmitoèet krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64


'Sbìrnice i2c:
Config Scl = Portd.2                    'i2c hodiny
Config Sda = Portd.3                    'i2c data

Declare Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)       'zápis jednoho bajtu do eeprom
Declare Sub Read_eeprom(byval Adresa As Byte , Value As Byte)       'ètení jednoho bajtu z eeprom

Dim Adresa As Byte , Value As Byte

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Zápis:
'Na adresu 1 zapíšeme hodnotu 100:
   Call Write_eeprom(1 , 100)

'Ètení:
'Z adresy 1 pøeèteme hodnotu do promìnné Value:
  Call Read_eeprom(1 , Value)



'Na adresy 60 až 80 zapíšeme hodnoty 120 až 160:
   For Adresa = 60 To 80
   Value = Adresa * 2
   Call Write_eeprom(adresa , Value)    'na adresu "adresa" zapiš hodnotu "value")
   Next

'Zapsané hodnoty pøeèteme a zobrazíme:
   Do
      For Adresa = 60 To 80
          Call Read_eeprom(adresa , Value)       'èti na adrese a ulož do promìnné value
          Print "Adr " ; Adresa ; "  " ; Value       'napiš adresu a hodnotu
          Waitms 1000                   'èekej 1 sec
      Next
   Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'Procedury pro zápis a ètení. Adresa èipu platí pro 24c01-04 s uzemnìnými
'vývody A0,A1,A2. Pro jíný obvod je nutno procedury upravit.

'zápis do Eeprom
Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)
    I2cstart                            'start
    I2cwbyte &HA0                       'adresa èipu, bit0=0 znamená zápis
    I2cwbyte Adresa                     'adresa v EEPROM, na kterou budeme zapisovat
    I2cwbyte Value                      'zapiš hodnotu Value
    I2cstop                             'stop
    Waitms 10                           'zápis trvá pár milisekund, poèkáme
End Sub


'ètení z Eeprom
Sub Read_eeprom(byval Adresa As Byte , Value As Byte)
   I2cstart                             'start
   I2cwbyte &HA0                        'adresa èipu, bit0=0 znamená zápis
   I2cwbyte Adresa                      'adresa v EEPROM, ze které budeme èíst
   I2cstart                             'nový start
   I2cwbyte &HA1                        'adresa èipu, bit0=1 znamená ètení
   I2crbyte Value , Nack                'èti bajt do promìnné Value, neposílej ack
   I2cstop                              'stop
End Sub



'Každá souèástka, která má zabudovanou komunikaci i2c, má urèený ètyøbitový
'kód souèástky. U pamìti 24c02 je to 1010.

'Dále má 24c02 tøi adresové vývody A0 A1 A2. Ty pøipojujeme na úrovnì 0 nebo 1
'a tím nastavíme adresu konkrétní souèástky. Máme 8 možností, takže mùžeme
'na jednu sbìrnici pøipojit až 8 pamìtí.

'Adresu èipu sestavíme takto:

' 1010 000 0

'První ètyøi bity je kód souèástky. Najdeme ho v datasheetu.

'Další tøi bity je adresa souèástky (A2 A1 A0). My jsme všechny adresové vývody
'uzemnili, takže adresa souèástky je 000.

'Poslední bit znaèí, jestli chceme do èipu zapisovat (0), nebo èíst (1).

'U pamìti 24c04 bit A0 vybírá horní nebo dolní polovinu pamìti.
'Adresu souèástky urèují bity A2 A1 takže jsou jen 4 možnosti.
