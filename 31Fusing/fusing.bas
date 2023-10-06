'------------------------------------------------ -------------
'
' Fusing.bass
' Formatting decimal numbers (Type Single)
' Step in the simulator
'------------------------------------------------
'$sim                                   '!!!Remove when programming - acceleration of simulation (removal of time delay)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


 ''''''''''''''''''''''''''' MAIN PROGRAM '''''''''''''''''''''''''''''''''''
Dim S As Single , Z As String * 10

Do

'let's have a number
   S = 12.36789
   Print S

'format to 1 decimal place with rounding:
   Z = Fusing(s , "#.#")
   Print Z

'format to 2 decimal places with rounding:
   Z = Fusing(s , "#.##")
   Print Z

'format to 3 decimal places with rounding:
   Z = Fusing(s , "#.###")
   Print Z

'format to 1 decimal place without rounding:
   Z = Fusing(s , "#.&")
   Print Z

'format to 2 decimal places without rounding:
   Z = Fusing(s , "#.&&")
   Print Z

'format to 3 decimal places without rounding:
   Z = Fusing(s , "#.&&&")
   Print Z

 Loop

''''''''''''''''''''''''' END OF MAIN PROGRAM '''''''''''''''''' ''''''
end

'The FUSING command converts a number of type single to a string with the specified number
'decimal places. This determines the way the number is displayed on the display.
'The usage is obvious from the examples.




