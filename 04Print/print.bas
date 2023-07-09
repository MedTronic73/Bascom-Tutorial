'------------------------------------------------- -------------
'
'Print.bas
'
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

Const Text = "test"
Dim B As Byte
Dim B1 As Byte
Dim B2 As Byte
Dim L As Long
Dim Txt1 As String * 15                                     'text string max. 15 characters long

'Use the Print command to display on the terminal.
'To do this, we must have a microprocessor connected via a max232 (or similar) circuit to a PC serial port.

'Write the program to the chip and start the terminal in Bascom (menu-tools-terminal emulator).
'Set the port number and baud in Terminal settings.
'If you use another terminal and the communication does not work properly, try uncommenting the following line
'Config Input = Crlf, Echo = Crlf


 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '
Txt1 = "abcd"

Do
   Print                                                    'omit the line

   Print "Atmel"                                            'write the text
   Wait 1                                                   'wait 1 second
   Print "Mega8"
   Waitms 1000                                              'wait 1000 milliseconds

   Print                                                    'omit the line
   Print Txt1                                               'write a constant
   Print Txt1 ; "E" ; "F" ; "G"                             'write multiple values ??on one line
   Wait 1

   Print
   B = 97
   Print B ; "kHz"                                          'write value of variable B, space, "kHz"
   Wait 1

   Print
   L = 12345678
   Print L                                                  'write the value of a variable of type Long
   Wait 1

   Dim A As Byte: A = 100

   Print
   Print "A"                                                'type the character A

   Print "ascii A = " ; Asc( "A")                           'type the ascii value of the character A

   Print "variable value A = " ; A                          'write the value of the variable A

   Print "&H" ; Hex(a)                                      'writes the variable A in hexadecadic

   Print "&B_" ; Bin(a)                                     'writes the variable A in binary

   Wait 1


'bidirectional communication PC - microprocessor
   Dim W1 As Word
   Print
   Input "enter number 0-65500 [Enter]:  " , W1             'the entered number is stored in variable W1
   Print "the number entered is  " ; W1

   Print
   Dim Str1 As String * 16
   Input "enter text [Enter]: " , Str1                      'the entered text is stored in the variable Str1
   Print "you entered  :" ; Str1
 Loop
 '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' ''
End

