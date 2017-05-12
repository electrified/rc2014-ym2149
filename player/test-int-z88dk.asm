;build with z80asm -b test-z88dk.asm
org 0x0100
CNTRL EQU $A5
COUNT EQU $C0
PORT0 EQU $40

interrupt_routine
	DI
	CALL START+5
	; CALL pause
	EI
	RETI

ctc_setup
	; set up ctc channel one to be a timer with interrupt
	; switch interrupt mode to Mode 2
	DI
	;Disable the 68B50
	; LD A, $03
	; OUT ($80), A
	; LD A, 0
	; OUT ($80), A
	IM 2
	LD A, $01
	LD I, A
	LD A, CNTRL
	OUT (PORT0), A
	LD A, COUNT
	OUT (PORT0), A
	LD A, $03
	OUT (PORT0), A
	; EI
	RET
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
