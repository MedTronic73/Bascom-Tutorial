'--------------------------------------------------------------
'
'  Function.bas
'
'--------------------------------------------------------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64



Const Pi = 3.1415926
'Function declaration:
Declare Function Thearea(radius As Single) As Single
'We declare a function we named "Thearea",
'we will pass it one argument of type Single (in parentheses)
'and it returns a single value

Dim Radius As Single , Temp As Single
Dim B As Byte
 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '
'Test in the simulator, start with the "Run program" key and in the terminal window
'enter values.


   Print
   Do
      Input "enter My_Circle [Enter]:" , Radius
      Temp = Thearea(radius)                                'function returns type single, therefore Temp must also be single
      Print "Area =  " ; Temp
      Print                                                 'omit the line
  Loop



 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
End

'Body function
'We pass the circumference of the My_Circle to the function and it calculates and returns the area.
Function Thearea(radius As Single) As Single                'body of the function is between Function and End Function
Local S As Single                                           'declaration of a local variable

S = Radius * Radius                                         'not possible S = Radius * Radius / 12.56 - max 2 members can be on the right side of the assignment
S = Pi * S
Thearea = S                                                 'to determine what the function should return (function_name = return_value)
End Function


'A function is a subroutine to which we pass an argument (or multiple arguments, separated by commas)
'similar to the procedure.
'But the function also returns some value. The type of return value is specified in the declaration after the parentheses.
'The function can be used on the right side of the assignment (variable = function (x)).

