
'--------------------------------------------------------------
' Blik.bas
'
' Klasický úvodní program, nìco jako "Hello world" u PC programování.
' K vývodu PB0 pøipojte diodu LED.
' Dioda bliká asi 2x za vteøinu.
'--------------------------------------------------------------

 ''''''''''''''' DIREKTIVY PØEKLADAÈE ''''''''''''''''''''''''''''''''''''''''
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace
$regfile = "m8def.dat"                                     'Soubor s deklaracemi
$crystal = 8000000                                          'Kmitoèet oscilátoru v Hz
$hwstack = 100
$swstack = 64
$framesize = 64

 '''''''''''''' INITIALIZATION '''''''''''''''''''''''''''''' ''''''''''''''

'Dim Temp as byte                ' variable declaration example
'Declare Sub Myproc(x as word)   'example procedure declaration
 Config Portb.0 = Output                                    'PB0 set as output

 ''''''''''''''' MAIN PROGRAM '''''''''''''''''''''''''''''' ''''''''''''''


 Do                                                         'the beginning of the main Do-Loop
   Set Portb.0                                              'Portb.0=1(+5V), the diode lights up
   Waitms 250                                               'wait 250 milliseconds
   Reset Portb.0                                            'Portd.0=0(ground), the diode is not lit
   Waitms 250                                               'wait 250 milliseconds
 Loop                                                       'end of main loop - go to Do

 ''''''''''''''' END OF MAIN PROGRAM '''''''''''''''''''''''''''''' ''''''
 end

 ''''''''''''''' CODE OF SUBROUTINES, PROCEDURES AND FUNCTIONS ''''''''''''''''''''''''




'(
 ''''''''''''''''''''''''
 Program description
''''''''''''''''''''''''
 A typical program has four parts:

 1. TRANSLATOR'S DIRECTIVES

 We will use the $sim directive during the simulation. Before writing the code into the processor
 we remove (we write an apostrophe before it).

 $regfile - tells the compiler what type of microprocessor we will use
 $crystal - informs the compiler about the oscillator frequency in the microprocessor

 $hwstack = 100
 $swstack = 64
 $framesize = 64

 These directives define the space in data memory for storing return addresses
 from subroutines, for passing variables to functions and for storing local variables.

-------------------------------------------------- ----------------------------

 2. INITIALIZATION

 This is where we declare variables, procedures and functions.
 Next, here we set the configuration of ports, counters and other peripherals,
 in general, we write commands here that need to be executed once, which do not need to be repeated
 at each passage through the main loop.

 Config Portb.0 = Output
 we have to set the terminal on which the diode is as output,
 otherwise the SET and RESET commands will have no effect.

-------------------------------------------------- ----------------------------

 3. MAIN PROGRAM

 In the main program there is an infinite Do-Loop loop. It is also called the Main Lake.
 In it, the level at the PB0 terminal changes every 250 ms.
 The SET command sets the bit (to 1).
 The RESET command resets the bit (to the value 0).
 The End command marks the end of the main program.
 The Waitms 250 command means that the processor waits for 250 milliseconds.


 There is only one main loop DO - LOOP in each program.
 Once the program executes the commands in the INITIALIZATION section,
 enters this loop in which it then runs round and round. From this smile
 cannot (and must not) exit.
 This is the typical way a microprocessor works.

-------------------------------------------------- ----------------------------

 4. SUBROUTINES

 Here we write the code of subroutines, procedures and functions.
')