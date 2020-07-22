1 REM Output decending tones on channel A
10 R=&hA0
20 D=&hA1
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


