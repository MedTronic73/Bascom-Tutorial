'------------------------------------------------- -------------
'
'Procedure.bas
'
'Example of a procedure
'------------------------------------------------- -------------
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 19200
$hwstack = 100
$swstack = 64
$framesize = 64


'Procedure declaration:
Declare Sub Turn(source_string As String)                   'when we pass the type string as an argument,
                                                              'so we do not state the length of the string
Dim My_string As String * 10
Dim Target_strings As String * 10
Dim I As Byte

 '' '' '' '' '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' ' '' '' '' '' '' '' '
Do

 My_string = "abcd123"

 Call Turn(my_string)                                       'procedure call
 Print Target_strings
 Waitms 200
Loop

 '' '' '' '' '' '' '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' '' ''
End

'Body of the procedure (we always write after the end End)
'The procedure copies the characters from the passed string to Target_strings
'in reverse order.

Sub Turn(Source_String As String)                                  'The Body Of The Procedure Is Between Sub And End Sub
   Local Temp_str As String * 1                             'declaration of a local variable
   Local Length_string As Byte                              'declaration of the local variable

   Length_string = Len(Source_String)                              'we find the string length (here 7 characters)
   Target_strings = ""                                      'we reset the target string

   For I = Length_string To 1 Step -1                       'at the beginning will be I = 7, then 6.5, ... etc
   Temp_str = Mid(Source_String , I , 1)                           'from the string "Source_String" take one character from position I
   Target_strings = Target_strings + Temp_str               'and add to  "Target_Strings"
   Next

End Sub

'A procedure is a subroutine to which we can (but do not have to) pass some values.
'Passed values which are called arguments or parameters. They must also be listed with the type.
'We must first declare the procedure:

'Declare Sub Turnover (Source_String As String)
'This is what we call the translator: I'm going to use a procedure I named' Turnover '.
'and I will pass one String argument to it. We name the argument arbitrarily (here "Source_String").

'If we pass more than one argument, we separate them with a comma.

'In the code (body) of the procedure, we work with the passed value using the name of the argument (here "Source_String").

'If we need some auxiliary variables in the procedure that we will not use elsewhere,
'we declare them as Local. Local variables are valid only in the procedure in which
'have been declared. This saves space in RAM, because once the procedure is over,
'The space occupied by the local variables is freed.

'Local variables are stored in an area called FRAME. The size of this area
'is set by the $ Framesize directive.
'Directives always take precedence over settings in Options.

'When counting the space occupied by variables, keep in mind that a string takes up 1 byte
'in addition for the terminating zero. For example, String * 3 takes 4 bytes.

'There is a Locals tab in the simulator where we can monitor local variables.