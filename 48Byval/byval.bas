'------------------------------------------------ -------------
'
' Byval.bas
'
' Two ways of passing arguments to procedures and functions:
' By reference (Byref)
' By value (Has been)
'------------------------------------------------ -------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


'There are two ways to pass arguments to procedures and functions:
'------------------------------------------------ -----------------------------
'Passing by reference, the address of the variable is passed
'we don't need to specify the Byref keyword,this method is preset in Bascom.
'For strings and fields, the address of the first character or value is passed.
'The function works directly with the passed variables.
'If we change the passed variable in the function, the original variable will change.

   'Function increase(x as byte)
   'x = x + 1
   'increase = x
   'End func

   'byte_prom = 1
   'byte_prom1 = increase(byte_prom)
   'byte_prom is now 2, byte_prom1 is now 2

'------------------------------------------------ -----------------------------
'Passing by value, a copy of the value of a variable or constant is passed (keyword Byval).
'The function works with copies of passed variables.
'If we change the passed variable in the function, the original variable will not change.

   'Function increase (used to be x as byte)
   'x = x + 1
   'increase = x
   'End func

   'byte_prom = 1
   'byte_prom1 = increase(byte_prom)
   'byte_prom is still 1, byte_prom1 is now 2

'------------------------------------------------ -----------------------------

'Declaration of functions:
Declare Function Secti(x As Byte , Byref Y As Byte) As Byte 'passing arguments by reference (address)
Declare Function Sectib(byval X As Byte , Byval Y As Byte) As Byte       'passing arguments by value

Function Secti(x As Byte , Y As Byte) As Byte               'the address x , y is passed
   Secti = X + Y
End Function

Function Sectib(byval X As Byte , Byval Y As Byte) As Byte  'value x , y is passed (by value=value)
   Sectib = X + Y
End Function


Dim Number1 As Byte At &H110 , Number2 As Byte At &H111     'address of variable number1 is &h110, number2 &h111
Dim Result As Byte

Number1 = 5
Number2 = 7

'Submission by link (address):
Result = Secti(number1 , Number2)                           'passed arguments are &h110 and &h111 (addresses number1, number2)
'This is fine, the function sums the values ??at addresses &h110 and &h111.

'Result = Secti(number1 , 10)                                'add 10 to number1
'But what now? The function adds the number at address &h110 with the number at address 10 (there is register R10).
'This is not what we want. We need to tell the function that 10 is not an address but a direct value.
'We will therefore use the Sectib function, which passes arguments by value.

'Passing by value:
Result = Sectib(number1 , 10)                               'passed arguments are 5 and 10
'Everything is fine now.

'We can pass each argument differently:
'Declare Function Secti(x As Byte , Byval Y As Byte) As Byte

'Someone may wonder why it is not always sold by value. Arguments are passed through
'area in RAM and large variables would not fit there (eg large fields, strings, etc.)

'The simple rule is that we use Byval when we want to pass constants.
'Besides, the translator himself will inform us where Byval is supposed to be.

 ''''''''''''''''''''''''''' MAIN PROGRAM '''''''''''''''''''''''''''''''''''

Do

Loop

 ''''''''''''''''''''''''''' END OF MAIN PROGRAM  ''''''''''''''''''''''''''
End