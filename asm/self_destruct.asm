arch 65816
lorom

;;------------------------------------------------------------------------------
;; COLONY SELF DESTRUCT TEXT
;;------------------------------------------------------------------------------

;; Emergency Text
org $a6c136
    ldx #$c15d ; Pointer
    
org $a6c15d
    dW $0016 ; Length
    dw #Emergency ; Pointer
    db $a6 ; Bank
    dw $50cb

;org $a6c164


;; Text
org $a6c0c3
    lda.w #SelfDestructMessage

;; Original Data
;org $a6c450

;;------------------------------------------------------------------------------
;; BANK $A6 - FREE SPACE - 320 bytes
;;------------------------------------------------------------------------------
org $a6fec0
    Emergency:
    dw $3982 ; A
    dw $3995 ; T
    dw $3995 ; T
    dw $3986 ; E
    dw $398f ; N
    dw $399b ; Z
    dw $398a ; I
    dw $3990 ; O
    dw $398f ; N
    dw $3986 ; E
    dw $399d ; !
    
    SelfDestructMessage:
    dw $0001,$0002
    dw $000d,$5105 : db "AUTODISTRUZIONE ATTIVATA"
    dw $000d,$5145 : db "EVACUARE IMMEDIATAMENTE"
    dw $000d,$5185 : db "LA COLONIA"
    dw $0000

warnpc $a70000

org $b7da00
    incbin "../gfx/1BDA00_self_destruct_font.bin"

;;------------------------------------------------------------------------------
;; COLONY SELF DESTRUCT TIMER
;;------------------------------------------------------------------------------

org $b0c000
    incbin "../gfx/184000_self_destruct_timer.bin"

;; Timer
org $809f6f
    ldy #CountDownTimer

;; Original Data
;org $80a060

;;------------------------------------------------------------------------------
;; BANK $80 - FREE SPACE - 12848 bytes
;;------------------------------------------------------------------------------

org $80cd90
CountDownTimer:
    dw $0005
    db $00,$02,$f0 : dw $3b9f ; O
    db $f8,$01,$f0 : dw $3b9e ; PO
    db $f0,$01,$f0 : dw $3bf8 ; MP
    db $e8,$01,$f0 : dw $3bf7 ; EM
    db $e0,$01,$f0 : dw $3bf6 ; T
    db $08,$00,$f8 : dw $3bf5 ; "
    db $f0,$01,$f8 : dw $3bf4 ; '

warnpc $80ffc0
