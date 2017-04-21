10 LET ayctrl=&hc8
20 LET ayd=&hc0
30 OUT ayctrl,7 : REM select the mixer register
40 OUT ayd,62 : REM enable channel A only
50 OUT ayctrl,1 : REM channel A course pitch
60 OUT ayd,50 : REM set it
70 OUT ayctrl,8 : REM channel A volume
80 OUT ayd,15 : REM set it to maximum
90 goto 30
