'------------------------------------------------ -------------
'
' Data.bass
' Creating and reading tables
'------------------------------------------------ -------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m8def.dat"                                     ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B                                                   'all variables starting with B will be of type byte
Defword W                                                   'all variables starting with W will be of word type
Defint I                                                    'similarly integer
Deflng L                                                    'long
Defsng F                                                    'single

''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''' ''''''''''''''
'Try this example in the simulator.
Do

   Restore Table_1                                          'we will stand at the beginning of Table_1

   Read B_byte                                              'pøeèteme první hodnotu z tabulky do promìnné b_byte
   Print B_byte
   Read B_byte                                              'po každém ètení se posuneme na další hodnotu
   Print B_byte                                             'takže mùžeme èíst jenom postupnì, ne v libovolném poøadí
   Read B_byte
   Print B_byte


   Restore Mixed                                            'we will stand at the beginning of the Novak table
   Dim Jmeno As String * 10
   Dim Prijmeni As String * 10

   Read Jmeno                                               'the first value is of type string, we read into a variable of type string
   Read Prijmeni                                            'the second value is of type string, we read into a variable of type string


   Read W_narozen                                           'the third value is of type word, we read into a variable of type word
   Read L_telefon                                           'The fourth value is of type long, we read into a variable of type long
   Read F_promile                                           'the fifth value is of type single, we read into a variable of type single

   Print _
   Jmeno ; " , " ; _
   Prijmeni ; " , " ; _
   W_narozen ; _
     " , tel. " ; L_telefon ; " , " ; _
   Fusing(f_promile , "#.##") ; " promile "

Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Table_1:                                                    'návìští
Data 0 , 170 , 4 , 52 , 9 , 87 , 204 , 121 , 239 , 56       'tabulka hodnot typu byte

Mixed:
Data "Josef" , "Mixed" , 1890% , 753898& , 2.4!             'mixed table


'Other examples of tables:

'Table_2:
'Data 1234% , &H7BF% , 40000% , -2000% , 90% , 870% , 2040% 'table of word and integer values

'Table_3:
'Data 270000& , &H17EA10& , 10000000& 'table of values ??of type long

'Table_4:
'Data "Name" , "surname" , "address" 'table of string type values

'------------------------------------------------ -----------------------------------

'When we need a lot of constants in the program, we create a table with the Data command.
'It will be stored in the program memory, so it can be quite large.

'In the table, we have to specify the type of number with the ending. The endings are:
'byte - none
'word - %
'integer - %
'long - &
'single - !

'We write the tables at the very end of the code.

'When we want to sequentially read values ??from the table, we use the RESTORE and READ commands.
'When we want to find out what value is at a certain position, we use LOOKUP. (see lookup.bass)
'When we want to find out in which position a certain value is, we use LOOKDOWN. (see lookdown.bas)
'Positions start with zero for the LOOKUP command, and one for the LOOKDOWN command.
'The variable we read into must be of the same type as the read value.

