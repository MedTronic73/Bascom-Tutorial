'------------------------------------------------ -------------
'
' Lookdown.bas
' Search for the position where the value is entered.
'------------------------------------------------ -------------
'$sim                                        '!!!Remove when programming - acceleration of simulation (removal of time delay)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim Position As Integer , Value As Byte
''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Try this example in the simulator. Use the "Run program" button.
Do

'save the input from the keyboard into the "Value" variable:
    Input "Zadej hodnotu do 241 [Enter] : " , Value

'search 15 positions in the table "My_table" and return the position where the number is "value" (if the number is not in the table, it returns -1)

    Position = Lookdown(Value , Moje_tabulka , 15)

      If Position > 0 Then                                  'found the number
        Print "Position = " ; Position
        Print                                               'blank line

      Else                                                  'Position = -1, no number found
        Print "Value není v tabulce"
        Print
      End If
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'Value
'    1    2    3    4    5    6     7     8     9    10    11    12    13    14    15       'Position
'When we need a lot of constants in the program, we create a table with the Data command.
'It will be stored in the program memory, so it can be quite large.

'In the table, we have to specify the type of number with the ending. The endings are:

'byte - none
'word - %
'integer - %
'long - &
'single - !

'We write the table at the very end of the code.

'When we want to sequentially read values ??from the table, we use the RESTORE and READ commands. (see data.bass)
'When we want to find out what value is at a certain position, we use LOOKUP. (see Lookup.bas)
'When we want to find out in which position a certain value is, we use LOOKDOWN.
'Positions start with zero for the LOOKUP command, and one for the LOOKDOWN command.
'The variable we read into must be of the same type as the read value.