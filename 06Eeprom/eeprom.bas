'------------------------------------------------- -------------
'
'Eeprom.bas
'
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 19200
$hwstack = 100
$swstack = 64
$framesize = 64

'The processor has 512 bytes of internal Eeprom memory. Data remains in this memory even when the power is turned off.
'When deleting the chip, they are deleted (unless the fuse bit EESAVE is set).
'There are two ways to access Eeprom:
'Either we declare the variables as type Eram (they will be stored in Eeprom)
'Or use the Writeeeprom and Readeeprom commands.
'Assume that writing to Eeprom takes a relatively long time (approx. 4 ms = over 40,000 clock cycles).

'Declaration of variables in EEPROM:
Dim Ebyt As Eram Byte                                       'variable in Eeprom (will be at the first free address - here 0)
Dim Epole(10) As Eram Byte                                  'field of ten bytes in Eeprom (starts at the first free address - 1)
Dim Ex As Eram Byte At 15                                   'variable in Eeprom (will be at 15)
Dim Estr As Eram String * 5                                 'string in Eeprom

'Declaration of variables in RAM: (RAM and SRAM are the same)
Dim Ramstr As String * 5                                    'string in SRAM
Dim Rambyt As Byte                                          'byte in SRAM
Dim I As Byte

'' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' ' '' '' '' '' '' ''
Cursor Off

 Do


'access to Eeprom:
   Ebyt = 10                                                'save to EEPROM
   Rambyt = Ebyt                                            'read from EEPROM
   Rambyt = Rambyt + 17
   Ex = Rambyt
'or:
   Rambyt = 10
   Writeeeprom Rambyt , 20                                  'save Rambyt to address 20
   Readeeprom Rambyt , 20                                   'read from address 20 to Rambyt
   'Writeeeprom 10, 20' store 10 at address 20 - no, 10 is not a variable

 'display of values ??from Eeprom:
 'Print Ebyt this is not possible, Print expects a variable in RAM
 Rambyt = Ebyt                                              'Therefore we copy the byte from Eeprom to RAM
 Print Rambyt                                               'and then we will display
 Wait 1

 Estr = "abcde"
 'Print Estr this does not work, Print expects a string in RAM
 Ramstr = Estr                                              'we copy the string from Eeprom to RAM
 Print Ramstr                                               'and we'll display
 Wait 1

 Epole(3) = 68                                              'third value in Epole
 'Print Epole (3)' cannot
 Rambyt = Epole (3)
 Print Rambyt
 Wait 1

 Loop

 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
 End

 'Note: according to Atmel's recommendation, the zero EEPROM address should not be used,
 'because it can be overwritten during a reset.