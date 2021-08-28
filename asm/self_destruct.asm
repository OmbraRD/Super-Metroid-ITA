arch 65816
lorom

;;------------------------------------------------------------------------------
;; COLONY SELF DESTRUCT TEXT
;;------------------------------------------------------------------------------

;; Emergency Text
org $a6c136
    ldx #$c15d ; Pointer
    
org $a6c15d
    dW $0012 ; Length
    dw #Emergency ; Pointer
    db $a6 ; Bank
    dw $50cb

;org $a6c164


;; Text
org $a6c0c3
    lda #SelfDestructMessage

;; Original Data
;org $a6c450

;;------------------------------------------------------------------------------
;; BANK $A6 - FREE SPACE - 320 bytes
;;------------------------------------------------------------------------------
org $a6fec0
    Emergency:
    dw $3986 ; E
    dw $398e ; M
    dw $3986 ; E
    dw $3993 ; R
    dw $3988 ; G
    dw $3986 ; E
    dw $398f ; N
    dw $3984 ; C
    dw $399a ; Y
    
    SelfDestructMessage:
    dw $0001,$0002
    dw $000d,$5105 : db "SELF DESTRUCT SEQUENCE"
    dw $000d,$5145 : db "ACTIVATED EVACUATE"
    dw $000d,$5185 : db "COLONY IMMEDIATELY"
    dw $0000

warnpc $a70000

;;------------------------------------------------------------------------------
;; COLONY SELF DESTRUCT TIMER
;;------------------------------------------------------------------------------

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
    db $f0,$01,$f0 : dw $3bf8 ; TI
    db $e8,$01,$f0 : dw $3bf7 ; IM
    db $e0,$01,$f0 : dw $3bf6 ; E
    db $08,$00,$f8 : dw $3bf5 ; "
    db $f0,$01,$f8 : dw $3bf4 ; '

warnpc $80ffc0
