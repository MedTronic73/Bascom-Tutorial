'------------------------------
'
'Format.bas
'
'------------------------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 19200
$hwstack = 100
$swstack = 64
$framesize = 64

'Use the "Format" command to specify how integers are displayed.
'Syntax:
'target = FORMAT (source, "mask")

'target is the target string
'source is a displayed number in the form of a string (a numeric variable must first be converted to a string)
'mask specifies the display method

'The command works only for integer variables (not for the single type, use the FUSING command there).

Dim Itemp As Integer
Dim Target As String * 8

'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '

Do


Itemp = 113
Target = Str (itemp)
Target = Format(target , "0000")                            'the number will be aligned to 4 places with leading zeros ("0113")
Print Target

Itemp = 113
Target = Str (itemp)
Target = Format(target , "")                                'the number will be aligned to 4 places without leading zeros (there are 4 spaces in the mask)
Print Target

Itemp = 113
Target = Str (itemp)
Print Format(target , "00.00")                              'number will be displayed as "01.13"

Itemp = 13
Target = Str (itemp)
Print Format(target , "0.00")                               'number will be displayed as "0.13" (5 digits)

Itemp = 113
Target = Str (itemp)
Print Format(target , "+")                                  'number will be displayed with a sign ("+113")

Target = "12345"
Print Format(target , "0.000")                              '"12.345"
'Print Target

'The characters in the mask can be combined in different ways, but their order must be:
'Spaces, zeros, +, decimal point and zeros.
'Try stepping in the simulator.

 Loop

'' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '''
End