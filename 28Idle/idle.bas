'''''''''''''''''''''''''''''''''''''
'
'  Idle.bas
'
'  Uvedeme procesor do stavu Idle a probudíme ho pøerušením od pøeteèení Timer1
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Config Timer1 = Timer , Prescale = 1024 'pøeteèe asi za 8s
Config Aci = Off                        'vypni komparátor (další zmenšení spotøeby)

Enable Interrupts                       'povol pøerušení
Enable Timer1                           'povol pøerušení pøi pøeteèení Timer1
On Timer1 Timer1_isr                    'pøi pøerušení jdi na
Cursor Off                              'vypni LCD kurzor

Print "reset"
Wait 1

'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''

Do
    Print "spim"
    Wait 1
    Idle                                'tady usne

    Print "bdim"                        'tady pokraèuje po probuzení
    Wait 1
Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Timer1_isr:

      Cls
      Lcd "prerus"
      Waitms 500

Return
'pøíkaz Idle nemùže být použit v obsluze pøerušení !!!

'V hlavním programu uspíme procesor pøíkazem Idle.
'Po asi 8 vteøinách pøeteèe Timer1 a vyvolá pøerušení, které probudí procesor.

'Ve stavu Idle je odbìr proudu asi polovièní proti aktivnímu stavu.
'Probudí se pøerušením, napø od èítaèù, vnìjším atd.

