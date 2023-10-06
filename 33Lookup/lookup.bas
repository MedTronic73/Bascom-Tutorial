' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
'
' Lookup.bas
' Search for the value at the given position in the table
'------------------------------------------------ -------------
'$sim '           !!!Remove when programming - acceleration of simulation (removal of time delay)

$regfile = "m8def.dat"                                     ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Dim Position As Integer , Value As Byte

''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Try this example in the simulator. Use the "Run program" button.

Do

'save the input from the keyboard to the "Position" variable:
    Input "Enter position 0 to 15 [Enter] : " , Position

'najdi hodnotu na zadané pozici v tabulce "Moje_tabulka" :
    Value = Lookup(Position , Moje_tabulka)

'a vypiš
    Print "Na pozici " ; Position ; " je Value " ; Value
    Print                                                   'blank line

Loop
 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Moje_tabulka:                                               'visits
Data 0 , 17 , 34 , 52 , 69 , 87 , 104 , 121 , 139 , 156 , 173 , 190 , 207 , 224 , 241       'values
' 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 'position

'When we need a lot of constants in the program, we create a table with the Data command.
'It will be stored in the program memory, so it can be quite large.
'In the table, as a rule, each value has some relation to its position (but it is not necessary).
'In this table, sin 0°=0, sin 1°=0.017, sin 2°=0.034, etc.

'In the table, we have to specify the type of number with the ending. The endings are:

'byte - none 50
'word - % 1000%
'integer - % -12%
'long - & 1000000&
'single - ! 3.14!

'We write the table at the very end of the code.

'When we want to read values ??from the table sequentially, we use the command RESTORE and READ. (see Data.bas)
'When we want to find out what value is at a certain position, we use LOOKUP.
'When we want to find out in which position a certain value is, we use LOOKDOWN. (see Lookdown.bas)
'Positions start with zero for the LOOKUP command, and one for the LOOKDOWN command.
'The variable we read into must be of the same type as the read value.

