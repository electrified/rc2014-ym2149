1 REM Jumper ps
2 REM JP1 - 2-3 Use A4 line for chip enable
3 REM JP2 - 1-2 USe JP1 andf JP4 setting
4 REM JP3 - 3-4 A3 for address mode selection
5 REM JP4 7&8 D0

1 REM Output decending tones on channel A
10 R=216 : REM &hd8
20 D=208: REM &hd0
30 OUT R,7 : REM select the mixer register
40 OUT D,62 : REM enable channel A only
41 OUT R,8 : REM channel A volume
42 OUT D,15 : REM set it to maximum
50 OUT R,0 : REM select channel A pitch
55 FOR N=1 TO 255
60 OUT D,N : REM set it
63 GOSUB 100
65 NEXT
90 GOTO 30
100 FOR X=1 TO 64
110 NEXT
120 RETURN

1 REM Set IOA0 high
10 LET R=216
20 LET D=208
30 OUT R, 7: REM select the mixer register
40 OUT D, 64: REM set the IOA port to be an output
50 OUT R, 14: REM select the IOA register
60 OUT D, 1: REM set bit 0 to high

1 REM read and print the value from IOB
10 LET R=216
20 LET D=208
30 OUT R,7: REM select mixer register
40 OUT D,0: REM ensure IOB is set to be an input
50 OUT R,15: REM select IOB register
60 PRINT INP(R): REM read IOB value
70 GOTO 60
