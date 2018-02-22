1 REM Set IOA0 high
10 LET R=216
20 LET D=208
30 OUT R, 7: REM select the mixer register
40 OUT D, 64: REM set the IOA port to be an output
50 OUT R, 14: REM select the IOA register
60 OUT D, 1: REM set bit 0 to high
