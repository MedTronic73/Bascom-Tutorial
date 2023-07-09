'''''''''''''''''''''''''''''''''''''
'
'25PowerDown.bas
'
'Procesor uvedeme do stavu Power down a probudíme externím pøerušením.
'Pøerušení Int0 vyvoláme tlaèítkem na PD2.
'
'''''''''''''''''''''''''''''''''''''
'$sim
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64


Config Int0 = Low Level                 'ext.pøerušení0 nízkou úrovní


Enable Int0                             'povol pøerušení Int0
On Int0 Int0_isr                        'pøi pøerušení jdi na



'''''''''''''''''''''''''''' HLAVNI PROGRAM ''''''''''''''''''''''''''''''''''''

Ddrd.2 = 0
Portd.2 = 1
Print "reset"
Wait 1
Enable Interrupts                       'povol všechna pøerušení

Do
    Print "spim"
    Wait 1

    Powerdown                           'tady usne
    Print "bdim"                        'tady pokraèuje po probuzení

    Wait 1

Loop
'''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Int0_isr:
    Print "prerus"
    Waitms 500
    Eifr.intf0 = 1                      'vymaž pøíznak pøerušení
Return

'Ve stavu Power down klesne odbìr na nìkolik mikroampér.

'Externí oscilátor je vypnut, nejdou èítaèe.
'Procesor se probudí pouze:
'-externím resetem (impuls log0 na pinu RESET)
'-watchdog resetem
'-externím pøerušením INT0 nízkou úrovní (ne hranou).

'Typickým pøíkladem použití powerdown mùže být termostat topení s bateriovým napájením.
'Staèí procesor probudit napø. každou minutu, teplotu nemusíme mìøit nepøetržitì.
'Prùmìrný odbìr tím markantnì klesne.