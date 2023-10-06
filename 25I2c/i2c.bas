'------------------------------------------------ -------------
' I2C.bas
'
' Writing and reading over the I2C bus.
' Serial EEprom 24c01 (02, 04) is connected according to Fig. I2c.jpg
'------------------------------------------------ -------------
'$sim
$regfile = "m8def.dat"                                      'Soubor s deklaracemi
$crystal = 8000000                                          'Kmitoèet krystalu v Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64


'Sbìrnice i2c:
Config Scl = Portd.2                                        'i2c Clock
Config Sda = Portd.3                                        'i2c data

Declare Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)       'write one byte to eeprom
Declare Sub Read_eeprom(byval Adresa As Byte , Value As Byte)       'reading one byte from eeprom

Dim Adresa As Byte , Value As Byte

''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Registration:
'We Write The Value 100 To Address 1:

Call Write_eeprom(1 , 100)

'Reading:
'From address 1, we read the value into the variable Value:

Call Read_eeprom(1 , Value)



'At addresses 60 to 80 we write the values 120 to 160:
   For Adresa = 60 To 80
      Value = Adresa * 2
      Call Write_eeprom(adresa , Value)                     'in the address "address" write the value "value")
   Next

'We read the written values and display:
   Do
      For Adresa = 60 To 80
          Call Read_eeprom(adresa , Value)                  'èti na adrese a ulož do promìnné value
          Print "Adr " ; Adresa ; "  " ; Value              'napiš adresu a hodnotu
          Waitms 1000                                       'èekej 1 sec
      Next
   Loop

 ''''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''''''''''''
End

'Procedures for writing and reading. The chip address applies to 24c01-04 with grounded
'terminals A0, A1, A2. Procedures must be modified for other circuits.

'writing to Eeprom

Sub Write_eeprom(byval Adresa As Byte , Byval Value As Byte)
    I2cstart                                                'start
    I2cwbyte &HA0                                           'chip address, bit0=0 means writing
    I2cwbyte Adresa                                         'address in the EEPROM to which we will write
    I2cwbyte Value                                          'write the value Value
    I2cstop                                                 'stop
    Waitms 10                                               'writing takes a few milliseconds, let's wait
End Sub


'Reading From Eeprom
Sub Read_eeprom(byval Adresa As Byte , Value As Byte)
   I2cstart                                                 'start
   I2cwbyte &HA0                                            'chip address, bit0=0 means writing
   I2cwbyte Adresa                                          'address in EEPROM from which we will read
   I2cstart                                                 'a new start
   I2cwbyte &HA1                                            'chip address, bit0=1 means read
   I2crbyte Value , Nack                                    'read a byte into the Value variable, do not send an ack
   I2cstop                                                  'stop
End Sub



'Each component that has built-in i2c communication has a designated four-bit
'component code. For memory 24c02 it is 1010.

'Furthermore, the 24c02 has three address pins A0 A1 A2. We connect them at level 0 or 1
'and thus we set the address of a specific component. We have 8 options, so we can
'Connect up to 8 memories to one bus.

'We construct the chip address as follows:

' 1010,000 0

'The first four bits are the part code. We can find it in the datasheet.

'The next three bits are the component address (A2 A1 A0). We are all address outlets
'grounded, so the component address is 000.

'The last bit indicates whether we want to write (0) or read (1) to the chip.

'For 24c04 memory, bit A0 selects the upper or lower half of the memory.
'The address of the component is determined by bits A2 A1, so there are only 4 options.
