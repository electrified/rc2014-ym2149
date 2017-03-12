SECTION INIT
ORG     $C000 ; 0xFFFF - 2048

DEFC ayctrl = 65533 ; FFFD
DEFC aydata = 49149 ; BFFD

start:  ld hl, startupstr
        call print
        ld      d,7             ; select the mixer register
        ld      e,62            ; enable channel A only
        call    output           ; send it to PSG
        ld      d,8             ; channel A volume
        ld      e,15            ; maximumd
        call    output           ; send it to PSG
        ld      e,50            ; pitch value
        ld      d,1             ; channel A course pitch
note:   call    output           ; send it to PSG
        ld hl, downstr
        call print
        call pause
        dec e
        jp note

output:  ld      bc,ayctrl       ; select control port
        out     (c),d           ; send specified value
        ld      bc,aydata       ; select data port
        out     (c),e           ; send specified value
        ret

TX:         push af
        txbusy:     in a,($80)          ; read serial status
                    bit 1,a             ; check status bit 1
                    jr z, txbusy        ; loop if zero (serial is busy)
                    pop af
                    out ($81), a        ; transmit the character
                    ret

print:
            ld a, (hl)
            or a
            ret z
            call TX
            inc hl
            jp print

pause:
  push bc
  push de
  push af

  LD BC, $2000            ;Loads BC with hex 1000
  ; outer: LD DE, $1000            ;Loads DE with hex 1000
  ; inner: DEC DE                  ;Decrements DE
  ; LD A, D                 ;Copies D into A
  ; OR E                    ;Bitwise OR of E with A (now, A = D | E)
  ; JP NZ, inner            ;Jumps back to Inner: label if A is not zero
  outer: DEC BC                  ;Decrements BC
  LD A, B                 ;Copies B into A
  OR C                    ;Bitwise OR of C with A (now, A = B | C)
  JP NZ, outer            ;Jumps back to Outer: label if A is not zero

  pop af
  pop de
  pop bc
  RET                     ;Return from call to this subroutine


startupstr:            DEFM "Megabanghra 3000.",10,13,0
downstr:  DEFM "Down "
