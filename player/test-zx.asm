        OUTPUT zxtest.com
BDOS EQU 5
PRINT EQU 9
register_port equ #fffd
data_port equ #bffd

        org #0100

setup:
  LD C, PRINT
  LD DE, startm
  CALL BDOS
  ld a, 7
  ld bc, register_port
  out (c), a ;select the mixer register
  ld a, 62
  ld bc, data_port
  out (c), a ; enable channel A only
  ld a, 8
  ld bc, register_port
  out (c), a ; channel A volume
  ld a, 15
  ld bc, data_port
  out (c), a ; set it to maximum
  ld a, 0
  ld bc, register_port
  out (c), a; select channel A pitch
reset:
  ld d, 255
loop:
  ld a, d
  ld bc, data_port
  out (c), a; set it
  call pause
  dec d
  jp nz, loop
  jp reset
pause:
  push bc
  push de
  push af

  LD BC, $1500            ;Loads BC with hex 1000
delay_loop:
  DEC BC                  ;Decrements BC
  LD A, B                 ;Copies B into A
  OR C                    ;Bitwise OR of C with A (now, A = B | C)
  JP NZ, delay_loop            ;Jumps back to Outer: label if A is not zero

  pop af
  pop de
  pop bc
  RET                     ;Return from call to this subroutine
startm DB "Testing AY on ZX Spectrum ports", #0D, #0A, '$'