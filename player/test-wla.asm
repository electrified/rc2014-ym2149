;build with z80asm -b test-z88dk.asm
.org 0x0100

setup:
  defc register_port = 0xd8
  defc data_port = 0xd0
  ld a, 7
  out (register_port), a ;select the mixer register
  ld a, 62
  out (data_port),a ; enable channel A only
  ld a, 8
  out (register_port),a ; channel A volume
  ld a, 15
  out (data_port),a ; set it to maximum
  ld a, 0
  out (register_port),a; select channel A pitch
reset:
  ld b, 255
loop:
  ld a, b
  out (data_port),a; set it
  call pause
  dec b
  jp nz, loop
  jp reset
pause:
  push bc
  push de
  push af

  LD BC, $1500            ;Loads BC with hex 1000
  ; outer: LD DE, $1000            ;Loads DE with hex 1000
  ; inner: DEC DE                  ;Decrements DE
  ; LD A, D                 ;Copies D into A
  ; OR E                    ;Bitwise OR of E with A (now, A = D | E)
  ; JP NZ, inner            ;Jumps back to Inner: label if A is not zero
outer:
  DEC BC                  ;Decrements BC
  LD A, B                 ;Copies B into A
  OR C                    ;Bitwise OR of C with A (now, A = B | C)
  JP NZ, outer            ;Jumps back to Outer: label if A is not zero

  pop af
  pop de
  pop bc
  RET                     ;Return from call to this subroutine
