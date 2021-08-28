arch 65816
lorom

;;------------------------------------------------------------------------------
;; PRESENTS
;;------------------------------------------------------------------------------

org $8ba0ff
    dw #PresentsPointers
    
; Pointers
org $8ba079
    PresentsPointers:
    dw $0008,#Frame1
    dw $0008,#Frame2
    dw $0008,#Frame3
    dw $0008,#Frame4
    dw $0008,#Frame5
    dw $0008,#Frame6
    dw $002d,#Frame7
    dw $9dd6,#Frame8

; Sprite Data
org $8c8a46
    Frame1:
    dw $0002
    db $18,$00,$00,$9d,$33 ; P
    db $18,$00,$f8,$8d,$33 ; P

;org $8c8a52
    Frame2:
    db $04,$00
    db $18,$00,$00,$9f,$33 ; R
    db $18,$00,$f8,$8f,$33 ; R
    db $10,$00,$00,$9d,$33 ; P
    db $10,$00,$f8,$8d,$33 ; P

;org $8c8a68
    Frame3:
    db $06,$00
    db $18,$00,$00,$7b,$33 ; E
    db $18,$00,$f8,$6b,$33 ; E
    db $10,$00,$00,$9f,$33 ; R
    db $10,$00,$f8,$8f,$33 ; R
    db $08,$00,$00,$9d,$33 ; P
    db $08,$00,$f8,$8d,$33 ; P

;org $8c8a88
    Frame4:
    db $08,$00
    db $18,$00,$00,$b7,$33 ; S
    db $18,$00,$f8,$a7,$33 ; S
    db $10,$00,$00,$7b,$33 ; E
    db $10,$00,$f8,$6b,$33 ; E
    db $08,$00,$00,$9f,$33 ; R
    db $08,$00,$f8,$8f,$33 ; R
    db $00,$00,$00,$9d,$33 ; P
    db $00,$00,$f8,$8d,$33 ; P

;org $8c8ab2
    Frame5:
    db $0a,$00
    db $18,$00,$00,$7b,$33 ; E
    db $18,$00,$f8,$6b,$33 ; E
    db $10,$00,$00,$b7,$33 ; S
    db $10,$00,$f8,$a7,$33 ; S
    db $08,$00,$00,$7b,$33 ; E
    db $08,$00,$f8,$6b,$33 ; E
    db $00,$00,$00,$9f,$33 ; R
    db $00,$00,$f8,$8f,$33 ; R
    db $f8,$01,$00,$9d,$33 ; P
    db $f8,$01,$f8,$8d,$33 ; P

;org $8c8ae6
    Frame6:
    db $0c,$00
    db $18,$00,$00,$9b,$33 ; N
    db $18,$00,$f8,$8b,$33 ; N
    db $10,$00,$00,$7b,$33 ; E
    db $10,$00,$f8,$6b,$33 ; E
    db $08,$00,$00,$b7,$33 ; S
    db $08,$00,$f8,$a7,$33 ; S
    db $00,$00,$00,$7b,$33 ; E
    db $00,$00,$f8,$6b,$33 ; E
    db $f8,$01,$00,$9f,$33 ; R
    db $f8,$01,$f8,$8f,$33 ; R
    db $f0,$01,$00,$9d,$33 ; P
    db $f0,$01,$f8,$8d,$33 ; P

;org $8c8b24
    Frame7:
    db $0e,$00
    db $18,$00,$00,$b8,$33 ; T
    db $18,$00,$f8,$a8,$33 ; T
    db $10,$00,$00,$9b,$33 ; N
    db $10,$00,$f8,$8b,$33 ; N
    db $08,$00,$00,$7b,$33 ; E
    db $08,$00,$f8,$6b,$33 ; E
    db $00,$00,$00,$b7,$33 ; S
    db $00,$00,$f8,$a7,$33 ; S
    db $f8,$01,$00,$7b,$33 ; E
    db $f8,$01,$f8,$6b,$33 ; E
    db $f0,$01,$00,$9f,$33 ; R
    db $f0,$01,$f8,$8f,$33 ; R
    db $e8,$01,$00,$9d,$33 ; P
    db $e8,$01,$f8,$8d,$33 ; P

;org $8c8b6c
    Frame8:
    db $10,$00
    db $18,$00,$00,$b7,$33 ; S
    db $18,$00,$f8,$a7,$33 ; S
    db $10,$00,$00,$b8,$33 ; T
    db $10,$00,$f8,$a8,$33 ; T
    db $08,$00,$00,$9b,$33 ; N
    db $08,$00,$f8,$8b,$33 ; N
    db $00,$00,$00,$7b,$33 ; E
    db $00,$00,$f8,$6b,$33 ; E
    db $f8,$01,$00,$b7,$33 ; S
    db $f8,$01,$f8,$a7,$33 ; S
    db $f0,$01,$00,$7b,$33 ; E
    db $f0,$01,$f8,$6b,$33 ; E
    db $e8,$01,$00,$9f,$33 ; R
    db $e8,$01,$f8,$8f,$33 ; R
    db $e0,$01,$00,$9d,$33 ; P
    db $e0,$01,$f8,$8d,$33 ; P

warnpc $8c8bbe


;;------------------------------------------------------------------------------
;; ORIGINAL ROUTINES HOOKS
;;------------------------------------------------------------------------------

;; Routine that writes the char to the tilemap
org $8b88d2
    ;sta $7e3000,x
    jsr CheckAccentedChar
    nop

;; Routine that clears ram before writing new tilemap
;; NOTE:
;; -OPTION 1: Move all text down 1 tile in intro.asm and leave this commented
;; -OPTION 2: Keep text in the original lines in intro.asm and uncomment to
;;            clear top line on page change

org $8bb2bc
    ;jsr $8ba86a
    jsr ClearTop

;; Routine that fades out the shading of the letters
org $8b98a3
    ;iny
    ;iny
    ;inx
    ;inx
    jsr FadeOutAccentsShade
    nop

;;------------------------------------------------------------------------------
;; BANK $8B - FREE SPACE - 2208 bytes
;;------------------------------------------------------------------------------

org $8bf760
;; Check and replace char for accented ones
CheckAccentedChar:
    ; If char value is over tile $30, it is accented.
    cmp #$2030
    bcs IsAccented
    jmp Continue

    IsAccented:
    pha ; Save char value
    lda #$2c2b ; Load accent value
    sta $7e2fc0,x ; Store char to tilemap on top of char
    pla ; Restore char value
    sec
    sbc #$0030 ; Subtract $30 to get the actual char

    Continue:
    ; ORIGINAL CODE
    sta $7e3000,x ; Store char to tilemap
    rts ; Return to original routine

;; Clear top line on screen change
ClearTop:
    ldx #$00c0 ; Start clearing from previous line
    lda #$3c29 ; Load empty tile value
    ClearTopLoop:
    sta $7e3000,x ; Store empty tile to tilemap
    inx
    inx
    cpx #$0100
    bmi ClearTopLoop ; Loop until beginning of text tiles

    ; ORIGINAL CODE
    jsr $a86a
    rts ; Return to original routine

FadeOutAccentsShade:
    lda $7e2fc0,x ; Load Tile from previous row
    cmp #$3c29 ; Check if it is an empty tile on the top row
    beq NotAnAccent
    and #$e3ff
    ora $1c
    sta $7e2fc0,x
    NotAnAccent:
    ; ORIGINAL CODE
    iny
    iny
    inx
    inx
    rts ; Return to original routine

warnpc $8c0000

;;------------------------------------------------------------------------------
;; PRELUDE TEXT
;;------------------------------------------------------------------------------

;org $8b965c
;    phb
;    pea $8c00 ; Bank
;    plb
;    plb 

org $8bcf43
    dw #IntroText1 ; Pointer
org $8bcf49
    dw #IntroText2 ; Pointer
org $8bcf4f
    dw #IntroText3 ; Pointer
org $8bcf55
    dw #IntroText4 ; Pointer
org $8bcf5b
    dw #IntroText5 ; Pointer
org $8bcf61
    dw #IntroText6 ; Pointer

;; Original Size 4700 bytes
org $8cc383
IntroText1:
    dw $ae43 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'I',' ','F','I','R','S','T',' ','B','A','T','T','L','E','D',' ','T','H','E',' ','M','E','T','R','O','I','D','S')
    %introText(6, 'O','N',' ','P','L','A','N','E','T',' ','Z','E','B','E','S','.',' ','I','T',' ','W','A','S',' ','T','H','E','R','E')
    %introText(8, 'T','H','A','T',' ','I',' ','F','O','I','L','E','D',' ','T','H','E',' ','P','L','A','N','S',' ','O','F')
    %introText(10, 'T','H','E',' ','S','P','A','C','E',' ','P','I','R','A','T','E',' ','L','E','A','D','E','R')
    %introText(12, 'M','O','T','H','E','R',' ','B','R','A','I','N',' ','T','O',' ','U','S','E',' ','T','H','E')
    %introText(14, 'C','R','E','A','T','U','R','E','S',' ','T','O',' ','A','T','T','A','C','K')
    %introText(16, 'G','A','L','A','C','T','I','C',' ','C','I','V','I','L','I','Z','A','T','I','O','N','.','.','.')
    dw $ae5b
    dw $9698

IntroText2:
    dw $ae79 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'I',' ','N','E','X','T',' ','F','O','U','G','H','T',' ','T','H','E',' ','M','E','T','R','O','I','D','S',' ','O','N')
    %introText(6, 'T','H','E','I','R',' ','H','O','M','E','W','O','R','L','D',',',' ','S','R','3','8','8','.',' ','I')
    %introText(8, 'C','O','M','P','L','E','T','E','L','Y',' ','E','R','A','D','I','C','A','T','E','D',' ','T','H','E','M')
    %introText(10, 'E','X','C','E','P','T',' ','F','O','R',' ','A',' ','L','A','R','V','A',',',' ','W','H','I','C','H')
    %introText(12, 'A','F','T','E','R',' ','H','A','T','C','H','I','N','G',' ','F','O','L','L','O','W','E','D',' ','M','E')
    %introText(14, 'L','I','K','E',' ','A',' ','C','O','N','F','U','S','E','D',' ','C','H','I','L','D','.','.','.')
    dw $ae91
    dw $9698

IntroText3:
    dw $b074 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'I',' ','P','E','R','S','O','N','A','L','L','Y',' ','D','E','L','I','V','E','R','E','D',' ','I','T',' ','T','O')
    %introText(6, 'T','H','E',' ','G','A','L','A','C','T','I','C',' ','R','E','S','E','A','R','C','H',' ','S','T','A','T','I','O','N')
    %introText(8, 'A','T',' ','C','E','R','E','S',' ','S','O',' ','S','C','I','E','N','T','I','S','T','S',' ','C','O','U','L','D')
    %introText(10, 'S','T','U','D','Y',' ','I','T','S',' ','E','N','E','R','G','Y',' ','P','R','O','D','U','C','I','N','G')
    %introText(12, 'Q','U','A','L','I','T','I','E','S','.','.','.')
    dw $b08c
    dw $9698

IntroText4:
    dw $b0b3 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'T','H','E',' ','S','C','I','E','N','T','I','S','T','S','`',' ','F','I','N','D','I','N','G','S',' ','W','E','R','E')
    %introText(6, 'A','S','T','O','U','N','D','I','N','G','!',' ','T','H','E','Y',' ','D','I','S','C','O','V','E','R','E','D')
    %introText(8, 'T','H','A','T',' ','T','H','E',' ','P','O','W','E','R','S',' ','O','F',' ','T','H','E')
    %introText(10, 'M','E','T','R','O','I','D',' ','M','I','G','H','T',' ','B','E',' ','H','A','R','N','E','S','S','E','D')
    %introText(12, 'F','O','R',' ','T','H','E',' ','G','O','O','D',' ','O','F',' ','C','I','V','I','L','I','Z','A','T','I','O','N','!')
    dw $b0cb
    dw $9698

IntroText5:
    dw $b19b ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'S','A','T','I','S','F','I','E','D',' ','T','H','A','T',' ','A','L','L',' ','W','A','S',' ','W','E','L','L',',')
    %introText(6, 'I',' ','L','E','F','T',' ','T','H','E',' ','S','T','A','T','I','O','N',' ','T','O',' ','S','E','E','K',' ','A')
    %introText(8, 'N','E','W',' ','B','O','U','N','T','Y',' ','T','O',' ','H','U','N','T','.',' ','B','U','T',',',' ','I')
    %introText(10, 'H','A','D',' ','H','A','R','D','L','Y',' ','G','O','N','E',' ','B','E','Y','O','N','D',' ','T','H','E')
    %introText(12, 'A','S','T','E','R','O','I','D',' ','B','E','L','T',' ','W','H','E','N',' ','I',' ','P','I','C','K','E','D')
    %introText(14, 'U','P',' ','A',' ','D','I','S','T','R','E','S','S',' ','S','I','G','N','A','L','!')
    dw $b1b3
    dw $9698

IntroText6:
    dw $b228
    dw $0001,$0101,$d683
    %introText(4, 'C','E','R','E','S',' ','S','T','A','T','I','O','N',' ','W','A','S',' ','U','N','D','E','R')
    %introText(6, 'A','T','T','A','C','K','!','!')
    dw $add4
    dw $0080,$0101,$d683
    dw $b240
    dw $9698

warnpc $8cd5df

;;------------------------------------------------------------------------------
;; SPACE COLONY
;;------------------------------------------------------------------------------

; Compressed graphics bank and offset
org $8bbcde
    lda #$9600
    sta $48
    lda #$d10a
    sta $47

; Text data bank and offset
org $8b965d
    pea $8c00
    plb
    plb

org $8bcf6d
    dw #SpaceColony

; Original Data
;org $8cd629

;;------------------------------------------------------------------------------
;; PLANET ZEBES
;;------------------------------------------------------------------------------

; Compressed graphics bank and offset
org $8bc6be
    lda #$9600
    sta $48
    lda #$ec76
    sta $47 

; Text data bank and offset
org $8bccc3
    dw #PlanetZebes
org $8bccc9
    dw #PlanetZebes
org $8bcccf
    dw #PlanetZebes
    
; Original Data
;org $8c9654


;;------------------------------------------------------------------------------
;; BANK $8C - FREE SPACE - 3088 bytes
;;------------------------------------------------------------------------------

; Letters with accents for intro font
; WARNING: Moving this will require fixing intro.tbl entries
org $8cf3f0
    LetterA:
    dw $884d,$0101,$2030 ; À
    LetterE:
    dw $884d,$0101,$2034 ; È
    LetterI:
    dw $884d,$0101,$2038 ; Ì
    LetterO:
    dw $884d,$0101,$203e ; Ò
    LetterU:
    dw $884d,$0101,$2044 ; Ù

SpaceColony:
    dw $0010,$180a,#S
    dw $0010,$180b,#P
    dw $0010,$180c,#A
    dw $0010,$180d,#C
    dw $0010,$180e,#E
    dw $0010,$1810,#C
    dw $0010,$1811,#O
    dw $0010,$1812,#L
    dw $0010,$1813,#O
    dw $0010,$1814,#N
    dw $0010,$1815,#Y
    dw $c096 ; Subroutine

    ; This needs to be added because the routine does ADC #$0006
    dw $0000,$0000,$0000
    
    dw $0080,$0101,#PointerSub1
    dw $0ca2,$9698
PointerSub1:
    dw $8849 ; Subroutine

;org $8cd7c1
S:
    dw $88b7,$0101,$21ed
P:
    dw $88b7,$0101,$21ee
A:
    dw $88b7,$0101,$21ef
C:
    dw $88b7,$0101,$21f7
E:
    dw $88b7,$0101,$21f8
O:
    dw $88b7,$0101,$21f9
L:
    dw $88b7,$0101,$21fa
N:
    dw $88b7,$0101,$21fb
Y:
    dw $88b7,$0101,$21b9

PlanetZebes:
    dw $000b ; Length
    db $28,$00,$f8,$9e,$00 ; S
    db $20,$00,$f8,$9a,$00 ; E
    db $18,$00,$f8,$9d,$00 ; B
    db $10,$00,$f8,$9a,$00 ; E
    db $08,$00,$f8,$9c,$00 ; Z
    db $f8,$01,$f8,$9b,$00 ; T
    db $f0,$01,$f8,$9a,$00 ; E
    db $e8,$01,$f8,$99,$00 ; N
    db $e0,$01,$f8,$98,$00 ; A
    db $d8,$01,$f8,$97,$00 ; L
    db $d0,$01,$f8,$8f,$00 ; P

warnpc $8d0000
