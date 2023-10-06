'''''''''''''''''''''''''''''''''
'
' Idle.bass
'
' We put the processor in the Idle state and wake it up with an interrupt from the Timer1 overflow
'
'''''''''''''''''''''''''''''''''
'$sim
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Timer , Prescale = 1024                     'will flow in about 8 seconds
Config Aci = Off                                            'turn off the comparator (further reduction of consumption)

Enable Interrupts                                           'enable interrupts
Enable Timer1                                               'enable interrupt on Timer1 overflow
On Timer1 Timer1_isr                                        'when interrupted go to
Cursor Off                                                  'turn off the LCD cursor

Print "reset"
Wait 1

'''''''''''''''''''''''''''' MAIN PROGRAM ''''''''''''''''''''''''''''''''''''

Do
    Print "spim"
    Wait 1
    Idle                                                    'he falls asleep here

    Print "bdim"                                            'here he continues after waking up
    Wait 1
Loop
'''''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''''''''''''
End

Timer1_isr:

      Cls
      Lcd "break sleep"
      Waitms 500

Return
'command Idle cannot be used in interrupt handler !!!

'In the main program, we put the processor to sleep with the Idle command.
'After about 8 seconds, Timer1 overflows and raises an interrupt that wakes up the processor.

'In the Idle state, the current consumption is about half that of the active state.
'Woke up by interruption, eg from readers, external etc.

