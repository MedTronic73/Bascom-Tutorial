'------------------------------------------------- -------------
'
'Interrupt_Timer1_Capture.bas
'
'Example of capturing the value of counter 1
'Connect the button to the PD6.
'------------------------------------------------- -------------
'$ sim' !!! Remove during programming - simulation acceleration (removes time delays)
$regfile = "m8def.dat"                                      'Declaration file
$crystal = 8000000                                          'Crystal frequency in Hz
$baud = 9600
$hwstack = 100
$swstack = 64
$framesize = 64

'Counter settings:
Config Timer1 = Timer, Prescale = 1024 Capture Edge = Falling
'downlink capture on ICP pin (PB.0)

Enable Capture1
On Capture1 Captured

Dim Capture As Word
Dim Capture_old As Word


'' '' '' '' '' '' '' '' '' '' '' '' MAIN PROGRAM '' '' '' '' '' '' '' '' '' '' '
'Counter 1 runs continuously.
'Press the key to capture its value in the Capture1 variable. (More precisely to the register
'ICR1H AND ICR1L.)
'The display shows the counter status and the captured value.

Config Portb.0 = Input
Portb.0 = 1                                                 'pull-up
Enable Interrupts

Do                                                          'main loop
   If Capture <> Capture_old Then
   Print "captured value" ; Capture                         ' Capture the counter status
   Capture_old = Capture
   End If
Loop                                                        'end of main loop

'' '' '' '' '' '' '' '' '' '' '' '' '' '' 'END OF MAIN PROGRAM' '' '' '' '' '' '
End

Captured:
Capture = Capture1                                          'store the captured value in the variable "Capture"
Return





