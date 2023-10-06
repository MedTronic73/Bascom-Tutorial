'''''''''''''''''''''''''''''''''''''
'
' Array.bas
'
'''''''''''''''''''''''''''''''''''''

'$sim                                    '!!!Remove when programming
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64



'array declaration
Dim Moje_pole(20) As Word                                   'my_field has 20 members of type word
Dim I As Byte


'''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

   For I = 1 To 20                                          'fill the field with values
   Moje_pole(i) = I * I
   Next

Do                                                          'main Loop
   Print
   For I = 1 To 20
      Print "Moje_pole(" ; I ; ") = " ; Moje_pole(i) ; "    " ; I ; "^2 = " ; Moje_pole(i)
      Wait 2
   Next
Loop                                                        'end of the main loop


'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
 End

' An Array Is A Series Of Values Print Print Of The Same Type(eg Byte). Each Value In The Field Has Its Own Sequence
'number (index). Indexes always start with one. (my_array(0) does not work)
'In our example we created a field of squares.
'The Value Of Each Member Is The Square Of Its Index.

'Example of writing in the field:
'my_field(1)=10' we insert the value 10 into the 1st member of the field "my_field"
'my_array(2)=20

'Reading from array:
'dim w as word
'w = my_field(3) 'however, we read into a variable of the same type as the members of the field

'"My_field" actually replaces a series of variables
'prom1=1
'prom2=4
'prom3=9
'prom4=16 ...etc

'What is the advantage of using an array?

'Easier entry
'Let's imagine that we want to store the contents of our microprocessor's program memory, 2048 bytes.
'The variant "dim field(2048) as byte" is certainly simpler than
'dim byte1
'dim byte2
'dim byte3
'dim byte4
'...
'dim byte2048

'Another advantage is that with the help of indexes we can manipulate the field in loops,
'For example, in this program we fill the entire array with values ??in one for-next loop.

'Using an array makes sense mainly (or only?) when the member values ??have
'some relation to its indexes.
'In our example, the value is the square of the index,
'in the memory example, the index indicates the address in memory.



