SECTION INIT
ORG     $C000 ; 0xFFFF - 2048

DEFC ayctrl = 65533 ; FFFD
DEFC aydata = 49149 ; BFFD

start:  ld hl, startupstr
        call print
        ld      d,7             ; select the mixer register
        ld      e,62            ; enable channel A only
        call    outer           ; send it to PSG
        ld      d,1             ; channel A course pitch
        ld      e,50            ; pitch value
        call    outer           ; send it to PSG
        ld      d,8             ; channel A volume
        ld      e,15            ; maximumd
        call    outer           ; send it to PSG
        ret

outer:  ld      bc,ayctrl       ; select control port
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

startupstr:            DEFM "Megabanghra 3000.",10,13,0
