arch 65816
lorom

;;------------------------------------------------------------------------------
;; SAMUS MENU
;;------------------------------------------------------------------------------

org $b68000
    incbin "../gfx/1B0000_suit_menu.bin"

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

;; RESERVE

; Length
org $82ab75
    lda.w #0007

org $82ab80
    lda $7e3a88,x ; Screen Position
    and #$fc00
    ora [$00],y
    sta $7e3a88,x ; Screen Position

;; MODE [MANUAL]

; Screen Position
org $82c068
    db $48

; Length
org $82a146
    lda #$000e

;; [AUTO] / [MANUAL]

; Pointers
org $82ab60
    ldx.w #SupplyAuto

org $82ab6b
    ldx.w #SupplyManual

; Supply Auto
org $82aeb5
    ldy #$000e ; Length
    ldx #$0000
    lda $7e3a88,x ; Screen Position 
    and #$fc00
    ora.l SupplyManual,x 
    sta $7e3a88,x ; Screen Position

; Supply Manual
org $82aedf
    ldy #$000e ; Length
    ldx #$0000
    lda $7e3a88,x ; Screen Position 
    and #$fc00
    ora.l SupplyAuto,x 
    sta $7e3a88,x ; Screen Position

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

org $82a1c8
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
;; SAMUS MENU - FULL-SUIT-MISC-BOOTS TILEMAPS
;;------------------------------------------------------------------------------
org $b6e900
    incbin "../tilemaps/suit/1B6900_suit_menu.tilemap"

org $82bf64
    Suit:
    incbin "../tilemaps/suit/013F64_suit_suit.tilemap"

org $82bf88
    Misc:
    incbin "../tilemaps/suit/013F88_suit_misc.tilemap"

org $82bfd2
    Boots:
    incbin "../tilemaps/suit/013FD2_suit_boots.tilemap"

org $82c008
    incbin "../tilemaps/suit/014008_suit_hyperbeam.tilemap"
    
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
    dw $000e
    db $18,$00,$04,$5c,$34
    db $18,$00,$fc,$5c,$34
    db $10,$00,$04,$5c,$34
    db $10,$00,$fc,$5c,$34
    db $f0,$01,$04,$5c,$34
    db $f8,$01,$04,$5c,$34
    db $00,$00,$04,$5c,$34
    db $08,$00,$04,$5c,$34
    db $20,$00,$04,$5e,$34
    db $20,$00,$fc,$5d,$34
    db $08,$00,$fc,$5c,$34
    db $00,$00,$fc,$5c,$34
    db $f8,$01,$fc,$5c,$34
    db $f0,$01,$fc,$5b,$34

warnpc $830000