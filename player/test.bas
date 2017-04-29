1 REM Jumper ps
2 REM JP1 - 2-3 Use A4 line for chip enable
3 REM JP2 - 1-2 USe JP1 andf JP4 setting
4 REM JP3 - 3-4 A3 for address mode selection
5 REM JP4 7&8 D0

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
