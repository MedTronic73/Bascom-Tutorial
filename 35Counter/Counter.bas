
'------------------------------------------------ -------------
' Counter.bas
'
' Counter up to 65 kHz with 1 Hz resolution
' The measured signal should be digital, max 5V
' It is connected to PD5
' When we touch the PD5 pin, it should show 50 Hz
'------------------------------------------------ -------------
'$sim
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

'Timer1 = counter, counts falling edges on pin T1

Config Timer1 = Counter , Edge = Falling


 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''

Do
    Timer1 = 0                                              'reset the counter
    Start Timer1                                            'turn on the counter
    Waitms 999                                              'measure time 1 second

    Waitus 373                                              'set in the simulator

    Stop Timer1                                             'turn off the counter
    Printbin 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8 ; 8          '8= backspace
    Print Timer1 ; " Hz " ;
Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

'The principle is simple:
'Timer1 counts pulses on portd.5 for 1 second.
'The number of pulses then corresponds to the frequency in Hz.

'We will not use the "Wait 1" command to measure time.
'Since we need to measure the time as accurately as possible, we will compose the time from the waitms and waitus commands.
'We will use the cycle counter in the simulator for setting.

'The maximum measured value is 65,535, then the counter will overflow. For example, at a frequency of 65,546
'will show 10 Hz. (and also at frequencies 2 x 65536 + 10, 3 x 65536 + 10, etc...)

'There are two ways to increase the measurement range.
'1. By shortening the measurement time at the cost of a smaller resolution.
'2. Counting overflow (resolution does not change).

'The highest frequency that Timer0 and Timer1 can handle is about half
'clock frequency, i.e. 4 MHz (with a crystal of 8 MHz).

'If the frequency measurement is part of a larger program, we use to measure the time
'Timer1, because the Wait loops occupy the processor excessively. For counting impulses
'then we use Timer0 and when it overflows, we increase the value of some variable.
'We then calculate the frequency from the Timer0 value and the number of overflows.

