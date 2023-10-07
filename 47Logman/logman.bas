'------------------------------------------------ -------------
'
' Logman.bass
'
' Bit manipulations
'------------------------------------------------ -------------
'$sim                         '!!!Remove when programming - acceleration of simulation (removal of time delay)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B
Defint I
''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Try it in the simulator

'Bitwise AND
'We need to reset some bits:

B_number = &B_1010_0101                                     'we want to reset bits 0,1,2,3
B_mask = &B_1111_0000                                       'where there is a 0 in the mask, it will be 0 in the result, the other bits will not change
'  vysl =    1010_0000
B_vysl = B_Number And B_Mask
Print Bin(b_vysl)

'Bitwise OR
'We need to set some bits:
B_number = &B_1010_0101                                     'we want to set bits 0,1,2,3
B_mask = &B_0000_1111                                       'where there is a 1 in the mask, there will be a 1 in the result, the other bits will not change
'  vysl =    1010_1111
B_vysl = B_Number Or B_Mask
Print Bin(b_vysl)

'Bitwise XOR
'We need to negate some bits:
B_number = &B_1110_0101                                     'we want to negate bits 0,1,6
B_Mask = &B_0100_0011                                      'where there is a 1 in the mask, the result will be negation, the other bits will not change
'  vysl =    1010_0110
B_vysl = B_Number Xor B_Mask
Print Bin(b_vysl)

'Bit shift
''''''''''''''
'command
'shift number, LEFT, 1
'shifts all bits of variable number 1 place to the left. Right complement zero, bit
'which was completely to the left will be lost.

'command
'shift number, LEFT, 2
'shifts the bits similarly by two places, etc.

'example:

B_byte = &B_0001_1111
Print Bin(B_Byte)                                             '31
Shift B_Byte , Left , 1
Print Bin(B_Byte)                                             '62
Shift B_Byte , Left , 1
Print Bin(B_Byte)                                             '124
Shift B_Byte , Left , 1
Print Bin(B_Byte)                                             '248
'Shifting one bit to the left multiplies the number by two,
'shifting by two bits multiplies by four, etc.

'command
'shift digit , RIGHT , 1
'shifts all bits of the variable number 1 place to the right. Left complement zero, bit
'which was far right will be lost.

'Shifting one bit to the right divides the number by two,
'shifting by two bits divides by four, etc.



'Bit rotation
'''''''''''''''''
'command
'ROTATE number , LEFT , 1
'shifts all bits of variable number 1 place to the left.
'The bit that was at the far left will come to the place at the far right.

'Example:
'byte = &b_0111_1000
'Rotate byte,Left,1 'byte= &b_1111_0000
'Rotate byte,Left,1 'byte= &b_1110_0001
'Rotate byte,Left,1 'byte= &b_1100_0011


B_Byte = 22
Rotate B_Byte , Left , 8
'how big is Byte now?
Print B_Byte

'command
'ROTATE number , RIGHT , 1
'works analogously in the opposite direction

 ''''''''''''''''''''''''' END OF MAIN PROGRAM '''''''''''''''''' ''''''

End








