'''''''''''''''''''''''''''''''''
'
'25PowerDown.bass
'
'We put the processor in the Power down state and wake it up with an external interrupt.
'Interruption Int0 is triggered by pressing the button on PD2.
'
''''''''''''''''''''''''''''''''''$sim
$regfile = "m8def.dat"                                      ' specify the used micro
$baud = 9600
$crystal = 8000000                                          ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Config Int0 = Low Level                                     'ext.pøerušení0 nízkou úrovní


Enable Int0                                                 'povol pøerušení Int0
On Int0 Int0_isr                                            'pøi pøerušení jdi na



'''''''''''''''''''''''''' MAIN PROGRAM '''''''''''''''''' ''''''''''''''''
Ddrd.2 = 0
Portd.2 = 1
Print "reset"
Wait 1
Enable Interrupts                                           'enable all interrupts

Do
    Print "spim"
    Wait 1

    Powerdown                                               'he falls asleep here
    Print "bdim"                                            'here he continues after waking up

    Wait 1

Loop
'''''''''''''''''''''''''' END OF MAIN PROGRAM ''''''''''''''''' '''''''
End

Int0_isr:
    Print "break"
    Waitms 500
    GIFR.intf0 = 1                                          'clear the break flag
Return

'In the Power down state, consumption drops to a few microamps.

'The external oscillator is switched off, the counters are not working.
'The processor only wakes up:
'-external reset (log0 pulse on the RESET pin)
'-watchdog reset
'-external interrupt INT0 low level (not edge).

'A typical example of the use of powerdown can be a heating thermostat with battery power.
'Just wake up the processor, for example. every minute, we don't need to measure the temperature continuously.
'The average consumption will drop significantly.

