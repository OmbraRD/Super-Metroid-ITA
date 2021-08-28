arch 65816
lorom

;;------------------------------------------------------------------------------
;; SAMUS MENU
;;------------------------------------------------------------------------------

; Pointers
org $82c088
    dw #Mode
    dw #ReserveTank
    dw #Beam
    dw #Beam+12
    dw #Beam+24
    dw #Beam+36
    dw #Beam+48
    dw #Suit
    dw #Suit+18
    dw #Misc
    dw #Misc+18
    dw #Misc+36
    dw #Misc+56 ; 2 extra bytes before the tilemap
    dw #Boots
    dw #Boots+18
    dw #Boots+36

;;------------------------------------------------------------------------------
;; SAMUS MENU - SUPPLY TYPE - AUTO/MANUAL
;;------------------------------------------------------------------------------

;; MODE [MANUAL]

; Screen Position
org $82c068
    db $48

; Length
org $82a146
    lda #$000e

;; [AUTO] / [MANUAL]

; Pointer
org $82ab60
    ldx.w #SupplyAuto

org $82ab6b
    ldx.w #SupplyManual

; Length
org $82ab75
    lda.w #0005

org $82ab80
    lda $7e3a8c,x ; Screen Position
    and #$fc00
    ora [$00],y
    sta $7e3a8c,x ; Screen Position

; Original Tilemap Offset
;org $82bf2a

org $82bf14
    ReserveTank:
    incbin "../tilemaps/suit/013F14_suit_reserve_tank.tilemap"
    
;;------------------------------------------------------------------------------
;; SAMUS MENU - BEAM
;;------------------------------------------------------------------------------

; Fix for when no power is unlocked to
; clear last tile of the expanded menu.
org $82a188
    ldx #$c01a ; Pointer
    lda #$000c ; Length

; Selection Sprite
org $82c593
    dw #BeamSelectionBox

org $82afce
    lda #$000c ; Tiles to gray out/color

org $82a1ad
    lda #$000c ; Tiles to gray out/color spazer/plasma menu loading

org $82b0b8
    lda #$000c ; Tiles to gray out/color spazer/plasma selection

; Original Sprite Offset
;org $82c2b7


;;------------------------------------------------------------------------------
;; SAMUS MENU - SUIT-MISC-BOOTS TILEMAPS
;;------------------------------------------------------------------------------
org $82bf64
    Suit:
    incbin "../tilemaps/suit/013F64_suit_suit.tilemap"

org $82bf88
    Misc:
    incbin "../tilemaps/suit/013F88_suit_misc.tilemap"

org $82bfd2
    Boots:
    incbin "../tilemaps/suit/013FD2_suit_boots.tilemap"
    
;;------------------------------------------------------------------------------
;; BANK $82 - FREE SPACE - 256 bytes
;;------------------------------------------------------------------------------

org $82ff00 ; menu.asm adds data before this address
    Mode:
    incbin "../tilemaps/suit/013F06_suit_mode.tilemap"
    SupplyManual:
    incbin "../tilemaps/suit/013F22_suit_manual.tilemap"
    SupplyAuto:
    incbin "../tilemaps/suit/013F2A_suit_auto.tilemap"
    Beam:
    ; Expanded to 6 tiles per line
    incbin "../tilemaps/suit/013F32_suit_beam.tilemap"

; Beam Selection Box Sprite Data
BeamSelectionBox:
    db $0c,$00
    db $10,$00,$04,$5c,$34
    db $10,$00,$fc,$5c,$34
    db $f0,$01,$04,$5c,$34
    db $f8,$01,$04,$5c,$34
    db $00,$00,$04,$5c,$34
    db $08,$00,$04,$5c,$34
    db $18,$00,$04,$5e,$34
    db $18,$00,$fc,$5d,$34
    db $08,$00,$fc,$5c,$34
    db $00,$00,$fc,$5c,$34
    db $f8,$01,$fc,$5c,$34
    db $f0,$01,$fc,$5b,$34

warnpc $830000