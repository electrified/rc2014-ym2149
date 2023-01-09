1 REM read and print the value from IOB
10 R=&hA0
20 D=&hA1
30 OUT R,7: REM select mixer register
40 OUT D,0: REM ensure IOB is set to be an input
50 OUT R,15: REM select IOB register
60 PRINT INP(R): REM read IOB value
70 GOTO 60