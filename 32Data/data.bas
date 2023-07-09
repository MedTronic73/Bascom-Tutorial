'--------------------------------------------------------------
'
'  Data.bas
'  Vytvoøení a ètení tabulek
'--------------------------------------------------------------
'$sim                                    '!!!Odstranit pøi programování - zrychlení simulace (odstraní èasové prodlevy)
$regfile = "m88def.dat"                 ' specify the used micro
$baud = 9600
$crystal = 8000000                      ' used crystal frequency
$hwstack = 100
$swstack = 64
$framesize = 64

Defbyte B                               'všechny promìnné, zaèínající na B budou typu byte
Defword W                               'všechny promìnné, zaèínající na W budou typu word
Defint I                                'podobnì integer
Deflng L                                'long
Defsng F                                'single

 ''''''''''''''''''''''''''' HLAVNI PROGRAM '''''''''''''''''''''''''''''''''''
'Tento pøíklad zkoušejte v simulátoru.

Do

   Restore Tabulka_1                    'postavíme se na zaèátek Tabulka_1
   Read B_byte                          'pøeèteme první hodnotu z tabulky do promìnné b_byte
   Print B_byte
   Read B_byte                          'po každém ètení se posuneme na další hodnotu
   Print B_byte                         'takže mùžeme èíst jenom postupnì, ne v libovolném poøadí
   Read B_byte
   Print B_byte


   Restore Novak                        'postavíme se na zaèátek tabulky Novak
   Dim Jmeno As String * 10
   Dim Prijmeni As String * 10

   Read Jmeno                           'první hodnota je typu string, èteme do promìnné typu string
   Read Prijmeni                        'druhá hodnota je typu string, èteme do promìnné typu string
   Read W_narozen                       'tøetí hodnota je typu word, èteme do promìnné typu word
   Read L_telefon                       'ètvrtá hodnota je typu long, èteme do promìnné typu long
   Read F_promile                       'pátá hodnota je typu single, èteme do promìnné typu single

   Print _
   Jmeno ; " , " ; _
   Prijmeni ; " , " ; _
   W_narozen ; _
    " , tel. " ; L_telefon ; " , " ; _
   Fusing(f_promile , "#.##") ; " promile "

Loop

 ''''''''''''''''''''''''''' KONEC HLAVNIHO PROGRAMU ''''''''''''''''''''''''''
End

Tabulka_1:                              'návìští
Data 0 , 170 , 4 , 52 , 9 , 87 , 204 , 121 , 239 , 56       'tabulka hodnot typu byte

Novak:
Data "Josef" , "Novák" , 1890% , 753898& , 2.4!       'smíšená tabulka


'Další pøíklady tabulek:

'Tabulka_2:
'Data 1234% , &H7BF% , 40000% , -2000% , 90% , 870% , 2040%       'tabulka hodnot typu word a integer

'Tabulka_3:
'Data 270000& , &H17EA10& , 10000000&                             'tabulka hodnot typu long

'Tabulka_4:
'Data "Jmeno" , "prijmeni" , "adresa"                             'tabulka hodnot typu string

'------------------------------------------------------------------------------------

'Když v programu potøebujeme hodnì konstant, vytvoøíme tabulku pøíkazem Data.
'Bude uložena v pamìti programu, takže mùže být i dost velká.

'V tabulce musíme koncovkou urèit typ èísla. Koncovky jsou:
'byte    - žádná
'word    - %
'integer - %
'long    - &
'single  - !

'Tabulky píšeme na úplný konec kódu.

'Když chceme postupnì èíst hodnoty z tabulky, použijeme pøíkazy RESTORE a READ.
'Když chceme zjistit jaká hodnota je na urèité pozici, použijeme LOOKUP.    (viz lookup.bas)
'Když chceme zjistit na které pozici je urèitá hodnota, použijeme LOOKDOWN. (viz lookdown.bas)
'U pøíkazu LOOKUP zaèínají pozice nulou, u pøíkazu LOOKDOWN jednièkou.
'Promìnná, do které èteme, musí být stejného typu jako ètená hodnota.