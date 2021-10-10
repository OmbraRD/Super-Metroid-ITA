arch 65816
lorom

;;------------------------------------------------------------------------------
;; MAIN MENU
;;------------------------------------------------------------------------------

;; Graphics
org $8e8000
    incbin "../gfx/070000_menu_font.bin"

org $8ed600
    incbin "../gfx/075600_header.bin"

org $b6c000
    incbin "../gfx/1B4000_map.bin"

;org $8193fd
;    phb ; Push Data Bank Register to Stack
;    phk ; Push Program Bank Register to Stack
;    plb ; Pull Stack to Data Bank Register

;; Pointers

org $819f07
    ldy.w #SamusData ; SAMUS DATA Pointer
    ldx #$0052 ; Screen Position
    
org $819f13
    ldy.w #SamusA ; SAMUS A Pointer
    ldx #$0146 ; Screen Position
org $819636
    ldy.w #SamusA ; SAMUS A (DATA COPY/DATA CLEAR SCREENS) Pointer
    ldx #$0208 ; Screen Position

org $819f46
    ldy.w #SamusB ; SAMUS B Pointer
    ldx #$0286 ; Screen Position
org $819666
    ldy.w #SamusB ; SAMUS B (DATA COPY/DATA CLEAR SCREENS) Pointer
    ldx #$0308 ; Screen Position
    
org $819f7c
    ldy.w #SamusC ; SAMUS C Pointer
    ldx #$03c6 ; Screen Position  
org $819696
    ldy.w #SamusC ; SAMUS C (DATA COPY/DATA CLEAR SCREENS) Pointer
    ldx #$0408 ; Screen Position 


org $819f3d
    ldy.w #Time ; TIME 1 Pointer
    ldx #$0176 ; Screen Position
org $819f73
    ldy.w #Time ; TIME 2 Pointer
    ldx #$02b6 ; Screen Position
org $819fa9
    ldy.w #Time ; TIME 3 Pointer
    ldx #$03f6 ; Screen Position

org $81a18a
    ldy.w #Colon ; : Pointer
org $819f31
    ldx #$01b4 ; XX:XX 1 Screen Position
org $819f67
    ldx #$02f4 ; XX:XX 2 Screen Position
org $819f9d
    ldx #$0434 ; XX:XX 2 Screen Position


org $81a093
    ldy.w #NoData ; NO DATA Pointer

org $81a09b
    ldy.w #Energy ; ENERGY Pointer

org $819f25
    ldx #$015c ; NO DATA/ENERGY 1 Screen Position
org $819f5b
    ldx #$029c ; NO DATA/ENERGY 1 Screen Position
org $819f91
    ldx #$03dc ; NO DATA/ENERGY 1 Screen Position


org $819fc6
    ldy.w #DataCopy ; DATA COPY Pointer
    ldx #$0508 ; Screen Position

org $819fd2
    ldy.w #DataClear ; DATA CLEAR Pointer
    ldx #$05c8 ; Screen Position

org $819fde
    ldy.w #Exit ; EXIT (SAMUS DATA) Pointer
    ldx #$0688 ; Screen Position
org $8195b5
    ldy.w #Exit ; EXIT (DATA COPY/DATA CLEAR SCREENS) Pointer
    ldx #$0688 ; Screen Position

org $819569
    ldy.w #DataCopyMode ; DATA COPY MODE Pointer
    ldx #$0056 ; Screen Position
org $81979c
    ldy.w #DataCopyMode ; DATA COPY MODE Pointer
    ldx #$0056 ; Screen Position 

org $819b3f
    ldy.w #DataClearMode ; "DATA CLEAR MODE" Pointer
    ldx #$0054 ; Screen Position

org $819575
    ldy.w #CopyWhichData ; COPY WHICH DATA? Pointer
    ldx #$0148 ; Screen Position

org $8197a8
    ldy.w #CopyXtoWhere ; "COPY (SAMUS X) TO WHERE?" Pointer
    ldx #$0144 ; Screen Position

org $8198bb
    ldy.w #CopyXtoX ; "COPY (SAMUS X) TO (SAMUS X)." Pointer
    ldx #$0144 ; Screen Position

org $8198ed
    ldy.w #IsThisOk ; "IS THIS OK?" Pointer
    ldx #$0516 ; Screen Position

org $8198f9
    ldy.w #Yes; "YES" Pointer
    ldx #$059c ; Screen Position

org $819916
    ldy.w #No ; "N O" Pointer
    ldx #$065c ; Screen Position

org $819ae5
    ldy.w #CopyCompleted ; "COPY COMPLETED." Pointer
    ldx #$0510 ; Screen Position

org $819b4b
    ldy.w #ClearWhichData ; "       CLEAR WHICH DATA?       "
    ldx #$0136 ; Screen Position

org $819c0f
    ldy.w #ClearX ; "        CLEAR (SAMUS X).       "
    ldx #$0144 ; Screen Position

org $819d11
    ldy.w #DataCleared ; "        DATA CLEARED...        "
    ldx #$04fa ; Screen Position


;;------------------------------------------------------------------------------
;; VARIABLES OF SAMUS A/B/C POSITION
;;------------------------------------------------------------------------------

; COPY (SAMUS X) TO WHERE?
org $8197b8
    adc #$206a
    sta $7e3776 ; Position

; COPY (SAMUS X) TO (SAMUS X)
org $8198cb
    adc #$206a
    sta $7e375e ; Position

org $8198d6
    adc #$206a
    sta $7e3778 ; Position

; CLEAR (SAMUS X)
org $819c1f
    adc #$206a
    sta $7e376e ; Position

;; Data
;; ORIGINAL SIZE: 784 bytes

org $81b40a
    fillbyte $ff
    fill 784

warnpc $81b71a

;;------------------------------------------------------------------------------
;; GAME OVER
;;------------------------------------------------------------------------------

org $819206
    ldy #GameOver ; GAME OVER Pointer
    ldx #$0156 ; GAME OVER Screen Position

org $81920f
    ldy #FindTheMetroidLarva ; FIND THE METROID LARVA! Pointer
    ldx #$0386 ; FIND THE METROID LARVA! Screen Position

org $819218
    ldy #TryAgain ; TRY AGAIN? Pointer
    ldx #$0412 ; TRY AGAIN? Screen Position

org $819221
    ldy #YesReturnToGame ; YES (RETURN TO GAME) Pointer
    ldx #$04ce ; YES (RETURN TO GAME) Screen Position

org $81922a
    ldy #NoGoToTitle ; NO (GO TO TITLE) Pointer
    ldx #$05ce ; NO (GO TO TITLE) Screen Position


; GAME OVER
; Original Data
;org $8192dc

warnpc $8193e8

org $81b14d
    incbin "../tilemaps/menu/00B14D_menu_map.tilemap"

;;------------------------------------------------------------------------------
;;------------------------------------------------------------------------------
;; BANK $81 - FREE SPACE - 4319 bytes
;;------------------------------------------------------------------------------
;;------------------------------------------------------------------------------

org $81ef20
SamusData:
    incbin "../tilemaps/menu/00B40A_menu_SAMUS_DATA.tilemap"
SamusA:
    incbin "../tilemaps/menu/00B436_menu_SAMUS_A.tilemap"
SamusB:
    incbin "../tilemaps/menu/00B456_menu_SAMUS_B.tilemap"
SamusC:
    incbin "../tilemaps/menu/00B476_menu_SAMUS_C.tilemap"
Energy:
    incbin "../tilemaps/menu/00B496_menu_ENERGY.tilemap"
Time:
    incbin "../tilemaps/menu/00B4A0_menu_TIME.tilemap"
Colon:
    incbin "../tilemaps/menu/00B4A8_menu_COLON.tilemap"
NoData:
    incbin "../tilemaps/menu/00B4AC_menu_NO_DATA.tilemap"
DataCopy:
    incbin "../tilemaps/menu/00B4C4_menu_DATA_COPY.tilemap"
DataClear:
    incbin "../tilemaps/menu/00B4D8_menu_DATA_CLEAR.tilemap"
Exit:
    incbin "../tilemaps/menu/00B4EE_menu_EXIT.tilemap"
DataCopyMode:
    incbin "../tilemaps/menu/00B4F8_menu_DATA_COPY_MODE.tilemap"
DataClearMode:
    incbin "../tilemaps/menu/00B534_menu_DATA_CLEAR_MODE.tilemap"
CopyWhichData:
    incbin "../tilemaps/menu/00B574_menu_COPY_WHICH_DATA.tilemap"
CopyXtoWhere:
    incbin "../tilemaps/menu/00B596_menu_COPY_SAMUS_TO_WHERE.tilemap"
CopyXtoX:
    incbin "../tilemaps/menu/00B5C8_menu_COPY_SAMUS_TO_SAMUS.tilemap"
IsThisOk:
    incbin "../tilemaps/menu/00B602_menu_IS_THIS_OK.tilemap"
Yes:
    incbin "../tilemaps/menu/00B61A_menu_YES.tilemap"
No:
    incbin "../tilemaps/menu/00B62A_menu_NO.tilemap"
CopyCompleted:
    incbin "../tilemaps/menu/00B63A_menu_COPY_COMPLETED.tilemap"
ClearWhichData:
    incbin "../tilemaps/menu/00B65A_menu_CLEAR_WHICH_DATA.tilemap"
ClearX:
    incbin "../tilemaps/menu/00B69A_menu_CLEAR_SAMUS_A.tilemap"
DataCleared:
    incbin "../tilemaps/menu/00B6DA_menu_DATA_CLEARED.tilemap"

;-------------------------------------------------------------------------------

GameOver:
    incbin "../tilemaps/gameover/0092DC_gameover_GAME_OVER.tilemap"
FindTheMetroidLarva:
    incbin "../tilemaps/gameover/009304_gameover_FIND_THE_METROID_LARVA.tilemap"
TryAgain:
    incbin "../tilemaps/gameover/009334_gameover_TRY_AGAIN.tilemap"
YesReturnToGame:
    incbin "../tilemaps/gameover/00934C_gameover_YES_RETURN_TO_GAME.tilemap"
NoGoToTitle:
    incbin "../tilemaps/gameover/0093A0_gameover_NO_GO_TO_TITLE.tilemap"

warnpc $820000

;;------------------------------------------------------------------------------
;; OPTION MODE - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------
org $82ec66
    lda.w #OptionModeTilemap>>8&$FF00 ; Bank
    sta $48
    lda.w #OptionModeTilemap ; Pointer
    sta $47
    jsl $80b0ff

org $82ed75
    cmp #03 ; Number of menu items +1
    
org $82ed58
    lda #$0002 ; Number of menu items

org $82ef48
    bit #$0002 ; Check against Submenu option 3 or 4

org $82eda7
    dw $edb1 ; 0 - Start Game Routine
    dw $ee55 ; 1 - Submenu Subroutine
    dw $ee55 ; 2 - Submenu Subroutine

org $82f307
    dw $0018 ; Start Game Cursor X
    dw $0038 ; Start Game Cursor Y
    dw $0018 ; English Text Cursor X
    dw $0058 ; English Text Cursor Y
    dw $0018 ; Japanese Text Cursor X
    dw $0078 ; Japanese Text Cursor Y
    dw $0018 ; Controller Setting Menu Cursor X
    dw $0090 ; Controller Setting Menu Cursor Y
    dw $0018 ; Special Setting Menu Cursor X
    dw $00b0 ; Special Setting Menu Cursor Y
    
org $82ee10
    lda #$0000 ; Do not grey out text

org $82ee1c
    lda #$0000 ; Do not grey out text

;;------------------------------------------------------------------------------
;; CONTROLLER SETTING MODE ENG - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------
org $82ec77
    lda.w #ControllerSettingTilemapENG>>8&$FF00 ; Bank
    sta $48
    lda.w #ControllerSettingTilemapENG ; Pointer
    sta $47
    jsl $80b0ff

;;------------------------------------------------------------------------------
;; CONTROLLER SETTING MODE JAP - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------
org $82ec88
    lda.w #ControllerSettingTilemapJAP>>8&$FF00 ; Bank
    sta $48
    lda.w #ControllerSettingTilemapJAP ; Pointer
    sta $47
    jsl $80b0ff
    
;;------------------------------------------------------------------------------
;; SPECIAL SETTING MODE ENG - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------
org $82ec99
    lda.w #SpecialSettingTilemapENG>>8&$FF00 ; Bank
    sta $48
    lda.w #SpecialSettingTilemapENG ; Pointer
    sta $47
    jsl $80b0ff

org $82f131 ; MANUAL Tiles to gray out top
   ldy #$000e
org $82f13f ; MANUAL Tiles to gray out bottom
   ldy #$000e

org $82f0f0 ; MANUAL Tiles to color top
   ldy #$000e
org $82f0fe ; MANUAL Tiles to color bottom
   ldy #$000e

;;------------------------------------------------------------------------------
;; SPECIAL SETTING MODE JAP - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------
org $82ecaa
    lda.w #SpecialSettingTilemapJAP>>8&$FF00 ; Bank
    sta $48
    lda.w #SpecialSettingTilemapJAP ; Pointer
    sta $47
    jsl $80b0ff

;;------------------------------------------------------------------------------
;; MENU TITLE BORDER
;;------------------------------------------------------------------------------

;org $81891f
;    phb ; Push Data Bank Register to Stack
;    pea $8200 ; Push Address to the Stack
;    plb ; Pull Stack to Data Bank Register
;    plb ; Pull Stack to Data Bank Register

org $82c5f9
    dw #SamusDataBorder ; Pointer SAMUS DATA Border Sprites Data
    dw #DataCopyModeBorder ; Pointer DATA COPY MODE Border Sprites Data
    dw #DataClearModeBorder ; Pointer DATA CLEAR MODE Border Sprites Data
    
org $82f480
    dw #OptionModeBorder ; Pointer OPTION MODE Border Sprites Data
org $82f488
    dw #OptionModeBorder ; Pointer OPTION MODE Border Sprites Data

org $82f490
    dw #ControllerSettingModeBorder ; Pointer CONTROLLER SETTING MODE Border Sprite Data
org $82f498
    dw #ControllerSettingModeBorder ; Pointer CONTROLLER SETTING MODE Border Sprite Data
    
org $82f4a0
    dw #SpecialSettingModeBorder ; Pointer SPECIAL SETTING MODE Border Sprite Data
org $82f4a8
    dw #SpecialSettingModeBorder ; Pointer SPECIAL SETTING MODE Border Sprite Data

;;------------------------------------------------------------------------------
;; SPRITE DATA - 1302 bytes
;;------------------------------------------------------------------------------

;; SAMUS DATA Border Sprites Data
org $82d00b
    fillbyte $ff
    fill 1302

org $82d00b
SamusDataBorder:
    ;  X, Y, TILE
    db $26,$00 ; Length
    db $b8,$01,$00,$ed,$3e ; 0 - Side
    db $b8,$01,$f8,$ed,$3e ; 1 - Side
    db $38,$00,$00,$ed,$3e ; 2 - Side
    db $38,$00,$f8,$ed,$3e ; 3 - Side
    db $38,$00,$08,$fd,$3e ; 4 - Bottom Right Corner
    db $b8,$01,$08,$fc,$3e ; 5 - Bottom Left Corner
    db $38,$00,$f0,$fb,$3e ; 6 - Upper Right Corner
    db $b8,$01,$f0,$f9,$3e ; 7 - Upper Left Corner
    db $f8,$01,$08,$fa,$3e
    db $f0,$01,$08,$fa,$3e
    db $e8,$01,$08,$fa,$3e
    db $e0,$01,$08,$fa,$3e
    db $d8,$01,$08,$fa,$3e
    db $d0,$01,$08,$fa,$3e
    db $c8,$01,$08,$fa,$3e
    db $c0,$01,$08,$fa,$3e
    db $30,$00,$08,$fa,$3e
    db $28,$00,$08,$fa,$3e
    db $20,$00,$08,$fa,$3e
    db $18,$00,$08,$fa,$3e
    db $10,$00,$08,$fa,$3e
    db $08,$00,$08,$fa,$3e
    db $00,$00,$08,$fa,$3e
    db $28,$00,$f0,$fa,$3e
    db $20,$00,$f0,$fa,$3e
    db $18,$00,$f0,$fa,$3e
    db $10,$00,$f0,$fa,$3e
    db $08,$00,$f0,$fa,$3e
    db $00,$00,$f0,$fa,$3e
    db $f8,$01,$f0,$fa,$3e
    db $f0,$01,$f0,$fa,$3e
    db $e8,$01,$f0,$fa,$3e
    db $e0,$01,$f0,$fa,$3e
    db $d8,$01,$f0,$fa,$3e
    db $d0,$01,$f0,$fa,$3e
    db $c8,$01,$f0,$fa,$3e
    db $c0,$01,$f0,$fa,$3e
    db $30,$00,$f0,$fa,$3e
   
;; DATA COPY MODE Border Sprites Data
DataCopyModeBorder:
    db $20,$00
    db $00,$00,$08,$fa,$3e
    db $08,$00,$08,$fa,$3e
    db $f0,$01,$08,$fa,$3e
    db $f8,$01,$08,$fa,$3e
    db $00,$00,$f0,$fa,$3e
    db $08,$00,$f0,$fa,$3e
    db $f0,$01,$f0,$fa,$3e
    db $f8,$01,$f0,$fa,$3e
    db $c8,$01,$00,$ed,$3e
    db $c8,$01,$f8,$ed,$3e
    db $30,$00,$00,$ed,$3e
    db $30,$00,$f8,$ed,$3e
    db $30,$00,$08,$fd,$3e
    db $c8,$01,$08,$fc,$3e
    db $30,$00,$f0,$fb,$3e
    db $c8,$01,$f0,$f9,$3e
    db $e8,$01,$08,$fa,$3e
    db $e0,$01,$08,$fa,$3e
    db $d8,$01,$08,$fa,$3e
    db $d0,$01,$08,$fa,$3e
    db $d0,$01,$f0,$fa,$3e
    db $20,$00,$08,$fa,$3e
    db $28,$00,$08,$fa,$3e
    db $18,$00,$08,$fa,$3e
    db $10,$00,$f0,$fa,$3e
    db $10,$00,$08,$fa,$3e
    db $20,$00,$f0,$fa,$3e
    db $28,$00,$f0,$fa,$3e
    db $18,$00,$f0,$fa,$3e
    db $e8,$01,$f0,$fa,$3e
    db $e0,$01,$f0,$fa,$3e
    db $d8,$01,$f0,$fa,$3e
    ;db $d0,$01,$f0,$fa,$3e

;; DATA CLEAR MODE Border Sprites Data
DataClearModeBorder:
    db $26,$00
    db $ec,$01,$f0,$fa,$3e
    db $ec,$01,$08,$fa,$3e
    db $04,$00,$08,$fa,$3e
    db $0c,$00,$08,$fa,$3e
    db $f4,$01,$08,$fa,$3e
    db $fc,$01,$08,$fa,$3e
    db $04,$00,$f0,$fa,$3e
    db $0c,$00,$f0,$fa,$3e
    db $f4,$01,$f0,$fa,$3e
    db $fc,$01,$f0,$fa,$3e
    db $c4,$01,$00,$ed,$3e
    db $c4,$01,$f8,$ed,$3e
    db $44,$00,$00,$ed,$3e
    db $44,$00,$f8,$ed,$3e
    db $44,$00,$08,$fd,$3e
    db $c4,$01,$08,$fc,$3e
    db $44,$00,$f0,$fb,$3e
    db $c4,$01,$f0,$f9,$3e
    db $e4,$01,$08,$fa,$3e
    db $dc,$01,$08,$fa,$3e
    db $d4,$01,$08,$fa,$3e
    db $cc,$01,$08,$fa,$3e
    db $cc,$01,$f0,$fa,$3e
    db $3c,$00,$08,$fa,$3e
    db $34,$00,$08,$fa,$3e
    db $2c,$00,$08,$fa,$3e
    db $24,$00,$08,$fa,$3e
    db $1c,$00,$08,$fa,$3e
    db $14,$00,$08,$fa,$3e
    db $3c,$00,$f0,$fa,$3e
    db $34,$00,$f0,$fa,$3e
    db $2c,$00,$f0,$fa,$3e
    db $24,$00,$f0,$fa,$3e
    db $1c,$00,$f0,$fa,$3e
    db $14,$00,$f0,$fa,$3e
    db $e4,$01,$f0,$fa,$3e
    db $dc,$01,$f0,$fa,$3e
    db $d4,$01,$f0,$fa,$3e

;;OPTION MODE Border Sprites Data
OptionModeBorder:
    db $1a,$00
    db $fc,$01,$08,$fa,$3e
    db $fc,$01,$f0,$fa,$3e
    db $f4,$01,$08,$fa,$3e
    db $f4,$01,$f0,$fa,$3e
    db $d4,$01,$00,$ed,$3e
    db $d4,$01,$f8,$ed,$3e
    db $24,$00,$00,$ed,$3e
    db $24,$00,$f8,$ed,$3e
    db $24,$00,$08,$fd,$3e
    db $d4,$01,$08,$fc,$3e
    db $24,$00,$f0,$fb,$3e
    db $d4,$01,$f0,$f9,$3e
    db $ec,$01,$08,$fa,$3e
    db $e4,$01,$08,$fa,$3e
    db $dc,$01,$08,$fa,$3e
    db $1c,$00,$08,$fa,$3e
    db $14,$00,$08,$fa,$3e
    db $0c,$00,$08,$fa,$3e
    db $04,$00,$08,$fa,$3e
    db $1c,$00,$f0,$fa,$3e
    db $14,$00,$f0,$fa,$3e
    db $0c,$00,$f0,$fa,$3e
    db $04,$00,$f0,$fa,$3e
    db $ec,$01,$f0,$fa,$3e
    db $e4,$01,$f0,$fa,$3e
    db $dc,$01,$f0,$fa,$3e

;; CONTROLLER SETTING MODE Border Sprites Data
ControllerSettingModeBorder:
    db $35,$00
    db $dc,$01,$08,$fa,$3e   
    db $e4,$01,$08,$fa,$3e
    db $14,$00,$08,$fa,$3e
    db $0c,$00,$08,$fa,$3e
    db $04,$00,$08,$fa,$3e
    db $ec,$01,$08,$fa,$3e
    db $fc,$01,$08,$fa,$3e
    db $f4,$01,$08,$fa,$3e
    db $dc,$01,$f0,$fa,$3e
    db $e4,$01,$f0,$fa,$3e
    db $14,$00,$f0,$fa,$3e
    db $0c,$00,$f0,$fa,$3e
    db $04,$00,$f0,$fa,$3e
    db $ec,$01,$f0,$fa,$3e
    db $fc,$01,$f0,$fa,$3e
    db $f4,$01,$f0,$fa,$3e
    db $cc,$01,$f0,$fa,$3e
    db $cc,$01,$08,$fa,$3e
    db $24,$00,$08,$fa,$3e
    db $2c,$00,$08,$fa,$3e
    db $34,$00,$08,$fa,$3e
    db $d4,$01,$08,$fa,$3e
    db $1c,$00,$08,$fa,$3e
    db $24,$00,$f0,$fa,$3e
    db $2c,$00,$f0,$fa,$3e
    db $d4,$01,$f0,$fa,$3e
    db $1c,$00,$f0,$fa,$3e
    db $9d,$01,$00,$ed,$3e
    db $9d,$01,$f8,$ed,$3e
    db $54,$00,$00,$ed,$3e
    db $54,$00,$f8,$ed,$3e
    db $54,$00,$08,$fd,$3e
    db $9d,$01,$08,$fc,$3e
    db $54,$00,$f0,$fb,$3e
    db $9d,$01,$f0,$f9,$3e
    db $c4,$01,$08,$fa,$3e
    db $bc,$01,$08,$fa,$3e
    db $b4,$01,$08,$fa,$3e
    db $ac,$01,$08,$fa,$3e
    db $3c,$00,$08,$fa,$3e
    db $44,$00,$08,$fa,$3e
    db $4c,$00,$08,$fa,$3e
    db $40,$00,$f0,$fa,$3e
    db $4c,$00,$f0,$fa,$3e
    db $44,$00,$f0,$fa,$3e
    db $3c,$00,$f0,$fa,$3e
    db $34,$00,$f0,$fa,$3e
    db $c4,$01,$f0,$fa,$3e
    db $bc,$01,$f0,$fa,$3e
    db $b4,$01,$f0,$fa,$3e
    db $ac,$01,$f0,$fa,$3e
    db $a4,$01,$f0,$fa,$3e
    db $a4,$01,$08,$fa,$3e
    
; SPECIAL SETTING MODE Border Sprite Data
SpecialSettingModeBorder:
    db $2c,$00
    db $e8,$01,$08,$fa,$3e
    db $f0,$01,$08,$fa,$3e
    db $08,$00,$08,$fa,$3e
    db $00,$00,$08,$fa,$3e
    db $f8,$01,$08,$fa,$3e
    db $e8,$01,$f0,$fa,$3e
    db $f0,$01,$f0,$fa,$3e
    db $08,$00,$f0,$fa,$3e
    db $00,$00,$f0,$fa,$3e
    db $f8,$01,$f0,$fa,$3e
    db $d8,$01,$f0,$fa,$3e
    db $d8,$01,$08,$fa,$3e
    db $18,$00,$08,$fa,$3e
    db $20,$00,$08,$fa,$3e
    db $e0,$01,$08,$fa,$3e
    db $10,$00,$08,$fa,$3e
    db $18,$00,$f0,$fa,$3e
    db $20,$00,$f0,$fa,$3e
    db $e0,$01,$f0,$fa,$3e
    db $10,$00,$f0,$fa,$3e
    db $b0,$01,$00,$ed,$3e
    db $b0,$01,$f8,$ed,$3e
    db $46,$00,$00,$ed,$3e
    db $46,$00,$f8,$ed,$3e
    db $46,$00,$08,$fd,$3e
    db $b0,$01,$08,$fc,$3e
    db $46,$00,$f0,$fb,$3e
    db $b0,$01,$f0,$f9,$3e
    db $d0,$01,$08,$fa,$3e
    db $c8,$01,$08,$fa,$3e
    db $c0,$01,$08,$fa,$3e
    db $b8,$01,$08,$fa,$3e
    db $40,$00,$08,$fa,$3e
    db $38,$00,$08,$fa,$3e
    db $30,$00,$08,$fa,$3e
    db $28,$00,$08,$fa,$3e
    db $40,$00,$f0,$fa,$3e
    db $38,$00,$f0,$fa,$3e
    db $30,$00,$f0,$fa,$3e
    db $28,$00,$f0,$fa,$3e
    db $d0,$01,$f0,$fa,$3e
    db $c8,$01,$f0,$fa,$3e
    db $c0,$01,$f0,$fa,$3e
    db $b8,$01,$f0,$fa,$3e
    
warnpc $82d521

org $82c5d9
    dw #PlanetZebes1

;;------------------------------------------------------------------------------
;; BANK $82 - FREE SPACE - 2032 bytes
;;------------------------------------------------------------------------------

org $82f710

;;------------------------------------------------------------------------------
;; PLANET ZEBES
;;------------------------------------------------------------------------------

;org $82cbfb
PlanetZebes1:
    dw $0018
    db $28,$00,$00 : dw $303b
    db $28,$00,$f8 : dw $302b
    db $20,$00,$00 : dw $301e
    db $20,$00,$f8 : dw $300e
    db $18,$00,$00 : dw $301b
    db $18,$00,$f8 : dw $300b
    db $10,$00,$00 : dw $301e
    db $10,$00,$f8 : dw $300e
    db $08,$00,$00 : dw $3052
    db $08,$00,$f8 : dw $3042
    db $f8,$01,$00 : dw $301a
    db $f8,$01,$f8 : dw $300a
    db $f0,$01,$00 : dw $3011
    db $f0,$01,$f8 : dw $302c
    db $e8,$01,$00 : dw $301e
    db $e8,$01,$f8 : dw $300e
    db $e0,$01,$00 : dw $3037
    db $e0,$01,$f8 : dw $3027
    db $d8,$01,$00 : dw $301a
    db $d8,$01,$f8 : dw $300a
    db $d0,$01,$00 : dw $3011
    db $d0,$01,$f8 : dw $3022
    db $c8,$01,$f8 : dw $300d
    db $c8,$01,$00 : dw $3038


warnpc $82ff00 ; suit_menu.asm adds data after this address

;;------------------------------------------------------------------------------
;; INTRO AUDIO
;;
;; Notes:
;; Files are split into sections:
;; 1. 20 bytes header
;; 2. -2 bytes: size
;;    -2 bytes: address
;;    -Data in BRR format multiple of 9
;;    -FF padded
;; 3. SPC program data?
;;------------------------------------------------------------------------------

; Pointers
org $8fe820
;    dl #$dcaf6c ; BRR Header
;    dl #$dcfac7 ; BRR Header

check bankcross off

; SPC "The Last Metroid" | 1076 BRR blocks
org $dcaf84
    incbin "../audio_ita/2E2F84_intro_1a_ITA.brr"
;warnpc $dcd558

; SPC "Is In Captivity" | 1052 BRR blocks
org $dcd558
    incbin "../audio_ita/2E5558_intro_1b_ITA.brr"
warnpc $dcfa54

; SPC "The Galaxy" | 718 BRR blocks
org $dcfadf
    incbin "../audio_ita/2E7ADF_intro_2a_ITA.brr"
;warnpc $dd941d

; SPC "Is At Peace..." | 810 BRR blocks
org $dd941d
    incbin "../audio_ita/2E941D_intro_2b_ITA.brr"
warnpc $ddb097

check bankcross on
    
;;------------------------------------------------------------------------------
;; INTRO TEXT - TILEMAP (COMPRESSED)
;;------------------------------------------------------------------------------

org $8ba443
    lda.w #IntroTextTilemap>>8&$FF00
    sta $48
    lda.w #IntroTextTilemap
    sta $47

;;------------------------------------------------------------------------------
;; TILEMAPS (COMPRESSED)
;;------------------------------------------------------------------------------

; Clear original tilemaps
org $978d12
    fillbyte $ff
    fill 2530
    
org $978d12
IntroTextTilemap:
    incbin "../tilemaps/compressed/intro_text.bin"
OptionModeTilemap:
    incbin "../tilemaps/compressed/option_mode.bin"
ControllerSettingTilemapENG:
    incbin "../tilemaps/compressed/controller_setting_ENG.bin"
ControllerSettingTilemapJAP:
    incbin "../tilemaps/compressed/controller_setting_JAP.bin"
SpecialSettingTilemapENG:
    incbin "../tilemaps/compressed/special_setting_ENG.bin"
SpecialSettingTilemapJAP:
    incbin "../tilemaps/compressed/special_setting_JAP.bin"

warnpc $97b242
