
'------------------------------------------------- -------------
'Blink.bas
'
'A classic introductory program, something like "Hello world" in PC programming.
'Connect the LED to terminal PB0.
'The LED flashes about 2 times per second.
'------------------------------------------------- -------------
'' '' '' '' '' '' '' '' TRANSLATION DIRECTIVES '' '' '' '' '' '' '' '' '' '' '''
'$ sim' !!! Remove during programming - simulation acceleration
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Oscillator frequency in Hz
$hwstack = 100
$swstack = 64
$framesize = 64


'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''

'Dim Temp as byte                 ' example of a variable declaration
'Declare Sub Myproc (x as word)   ' example of a procedure declaration

 Config Portb.0 = Output                                    'Set PB0 as output

 '' '' '' '' '' '' '' 'MAIN PROGRAM' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '

 Do                                                         'start of the Do-Loop main loop
   Set Portb.0                                              'Portb.0 = 1 (+ 5V), LED is lit.
   Waitms 250                                               'wait 250 milliseconds
   Reset Portb.0                                            'Portd.0 = 0 (ground), LED is off
   Waitms 250                                               'wait 250 milliseconds
 Loop                                                       'end of main loop - go to Do

 '' '' '' '' '' '' '' '' END OF MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '' ''
 End

 '' '' '' '' '' '' '' '' CODE OF SUBPROGRAMS, PROCEDURES AND FUNCTIONS '' '' ''


'(
 '' '' '' '' '' '' '' '' '' '' '' '' ''
 Program description
'' '' '' '' '' '' '' '' '' '' '' '' ''
 A typical program has four parts:

 1. TRANSLATOR DIRECTIVES

 We will use the $ sim directive in the simulation. Before writing the code to the processor
 remove (write an apostrophe in front of it).

 $ regfile - tells the compiler what type of microprocessor to use
 $ crystal - tells the compiler what the frequency of the oscillator in the microprocessor is

 $ hwstack = 100
 $ swstack = 64
 $ framesize = 64

 These directives define space in the data memory for storing return addresses
 from subroutines, for passing variables to functions and for storing local variables.

-------------------------------------------------- ----------------------------

 2. INITIALIZATION

 Here we declare variables, procedures and functions.
 Next, we will set the configuration of ports, counters and other peripherals,
 In general, we write commands here that you only need to execute once, which do not need to be repeated
 each time it passes through the main loop.

 Config Portb.0 = Output
 the terminal on which the diode is located must be set as an output,
 otherwise, the SET and RESET commands will have no effect.

-------------------------------------------------- ----------------------------

 3. MAIN PROGRAM

 There is an infinite Do-Loop in the main program. It is also called the Main Loop.
 In it, the level on terminal PB0 changes every 250 ms.
 The SET command sets the bit (to 1).
 The RESET command clears the bit (to a value of 0).
 The End command indicates the end of the main program.
 The Waitms 250 command means that the processor is waiting for 250 milliseconds.


 There is only one DO-LOOP main loop in each program.
 Once the program executes the commands in the INITIALIZATION section,
 enters this loop in which it then runs all the time. From this loop
 he cannot (and must not) speak.
 This is a typical way of a microprocessor.

-------------------------------------------------- ----------------------------

 4. SUBPROGRAMS

 Here we write the code of subroutines, procedures and functions.
')