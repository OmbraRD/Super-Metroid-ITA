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
    dw $0008,#Frame7
    dw $002d,#Frame8

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
    db $18,$00,$00,$77,$33 ; A
    db $18,$00,$f8,$67,$33 ; A
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
    ; If char value is over tile $2030, it may be intro and accented.
    cmp #$2080
    bcs MayBeAccented
    jmp Continue
    
    ; If char value is less than $209f, it is the intro and accented.
    MayBeAccented:
    cmp #$209f
    bmi IsAccented
    jmp Continue

    IsAccented:
    pha ; Save char value
    lda #$2c2b ; Load accent value
    sta $7e2fc0,x ; Store char to tilemap on top of char
    pla ; Restore char value
    sec
    sbc #$0080 ; Subtract $80 to get the actual char

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
    %introText(4, 'I','L',' ','P','R','I','M','O',' ','S','C','O','N','T','R','O',' ','C','O','N',' ','I',' ','M','E','T','R','O','I','D')
    %introText(6, 'F','U',' ','S','U','L',' ','P','I','A','N','E','T','A',' ','Z','E','B','E','S','.')
    %introText(8, 'L','i',' ','S','V','E','N','T','A','I',' ','I',' ','P','I','A','N','I',' ','D','I',' ','M','O','T','H','E','R')
    %introText(10, 'B','R','A','I','N',',',' ','L','E','A','D','E','R',' ','D','E','I',' ','P','I','R','A','T','I')
    %introText(12, 'S','P','A','Z','I','A','L','I',',',' ','I','N','T','E','N','T','A',' ','A',' ','S','F','R','U','T','T','A','R','E')
    %introText(14, 'L','E',' ','C','R','E','A','T','U','R','E',' ','C','O','N','T','R','O',' ','A','L','T','R','E')
    %introText(16, 'C','I','V','I','L','T','a',' ','G','A','L','A','T','T','I','C','H','E','.','.','.')
    dw $ae5b
    dw $9698

IntroText2:
    dw $ae79 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'S','U','C','C','E','S','S','I','V','A','M','E','N','T','E',' ','L','E',' ','C','O','M','B','A','T','T','E','I')
    %introText(6, 'S','U',' ','S','R','3','8','8',',',' ','L','O','R','O',' ','P','I','A','N','E','T','A',' ','N','A','T','A','L','E','.')
    %introText(8, 'L','E',' ','S','T','E','R','M','I','N','A','I',' ','A','D',' ','E','C','C','E','Z','I','O','N','E',' ','D','I')
    %introText(10, 'U','N','A',' ','L','A','R','V','A',' ','C','H','E',',',' ','D','O','P','O',' ','L','A')
    %introText(12, 'S','C','H','I','U','S','A',',',' ','M','I',' ','S','E','G','U','i',' ','C','O','M','E',' ','U','N')
    %introText(14, 'B','I','M','B','O',' ','C','O','N','F','U','S','O','.','.','.')
    dw $ae91
    dw $9698

IntroText3:
    dw $b074 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'L','O',' ','C','O','N','S','E','G','N','A','I',' ','P','E','R','S','O','N','A','L','M','E','N','T','E')
    %introText(6, 'A','G','L','I',' ','S','C','I','E','N','Z','I','A','T','I',' ','D','E','L')
    %introText(8, 'L','A','B','O','R','A','T','O','R','I','O',' ','D','I',' ','R','I','C','E','R','C','A')
    %introText(10, 'G','A','L','A','T','T','I','C','A',' ','S','U',' ','C','E','R','E','S',',',' ','P','E','R',' ','F','A','R')
    %introText(12, 'S','T','U','D','I','A','R','E',' ','L','E',' ','S','U','E',' ','C','A','P','A','C','I','T','a',' ','D','I')
	%introText(14, 'P','R','O','D','U','R','R','E',' ','E','N','E','R','G','I','A','.','.','.')
    dw $b08c
    dw $9698

IntroText4:
    dw $b0b3 ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'L','A',' ','S','C','O','P','E','R','T','A',' ','F','U',' ','S','C','O','N','V','O','L','G','E','N','T','E','!')
    %introText(6, 'I','L',' ','S','U','O',' ','P','O','T','E','R','E',' ','P','O','T','E','V','A',' ','E','S','S','E','R','E')
    %introText(8, 'I','M','B','R','I','G','L','I','A','T','O',' ','P','E','R',' ','I','L',' ','B','E','N','E',' ','D','I')
    %introText(10, 'T','U','T','T','I','!')
    dw $b0cb
    dw $9698

IntroText5:
    dw $b19b ; Function Pointer
    dw $0001,$0101,$d683
    %introText(4, 'L','A','S','C','I','A','I',' ','L','A',' ','S','T','A','Z','I','O','N','E')
    %introText(6, 'S','O','D','D','I','S','F','A','T','T','A',' ','C','H','E',' ','T','U','T','T','O',' ','F','O','S','S','E')
    %introText(8, 'A','N','D','A','T','O',' ','P','E','R',' ','I','L',' ','M','E','G','L','I','O',',',' ','P','R','O','N','T','A')
    %introText(10, 'P','E','R',' ','U','N','A',' ','N','U','O','V','A',' ','C','A','C','C','I','A','.','.','.',' ','M','A')
    %introText(12, 'A','P','P','E','N','A',' ','S','U','P','E','R','A','T','A',' ','L','A',' ','C','I','N','T','U','R','A',' ','D','I')
    %introText(14, 'A','S','T','E','R','O','I','D','I',' ','H','O',' ','R','A','C','C','O','L','T','O',' ','U','N') 
	%introText(16, 'S','E','G','N','A','L','E',' ','A','N','G','O','S','C','I','A','N','T','E','!')
    dw $b1b3
    dw $9698

IntroText6:
    dw $b228
    dw $0001,$0101,$d683
    %introText(4, 'C','E','R','E','S',' ','E','R','A',' ','S','O','T','T','O',' ','A','T','T','A','C','C','O','!')
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
;; BANK $8C - FREE SPACE - 1552 bytes
;;------------------------------------------------------------------------------

; Letters with accents for intro font
; WARNING: Moving this will require fixing intro.tbl entries
org $8cf3f0
    LetterA:
    dw $884d,$0101,$2080 ; À
    LetterE:
    dw $884d,$0101,$2084 ; È
    LetterI:
    dw $884d,$0101,$2088 ; Ì
    LetterO:
    dw $884d,$0101,$208e ; Ò
    LetterU:
    dw $884d,$0101,$2094 ; Ù

SpaceColony:
    dw $0010,$1808,#C
    dw $0010,$1809,#O
    dw $0010,$180a,#L
    dw $0010,$180b,#O
    dw $0010,$180c,#N
    dw $0010,$180d,#I
    dw $0010,$180e,#A
    dw $0010,$1810,#S
    dw $0010,$1811,#P
    dw $0010,$1812,#A
    dw $0010,$1813,#Z
    dw $0010,$1814,#I
    dw $0010,$1815,#A
    dw $0010,$1816,#L
    dw $0010,$1817,#E
    dw $c096 ; Subroutine

    ; This needs to be added because the routine does ADC #$0006
    dw $0000,$0000,$0000
    
    dw $0080,$0101,#PointerSub1
    dw $c0a2,$9698
PointerSub1:
    dw $8849 ; Subroutine

;org $8cd7c1
S:
    db $b7,$88,$01,$01,$ed,$21
P:
    db $b7,$88,$01,$01,$ee,$21
A:
    db $b7,$88,$01,$01,$ef,$21
C:
    db $b7,$88,$01,$01,$f7,$21
E:
    db $b7,$88,$01,$01,$f8,$21
O:
    db $b7,$88,$01,$01,$f9,$21
L:
    db $b7,$88,$01,$01,$fa,$21
N:
    db $b7,$88,$01,$01,$fb,$21
I:
    db $b7,$88,$01,$01,$b9,$21
Z:
    db $b7,$88,$01,$01,$fc,$21

PlanetZebes:
    dw $000d ; Length
    db $28,$00,$f8,$9e,$00 ; S
    db $20,$00,$f8,$9a,$00 ; E
    db $18,$00,$f8,$9d,$00 ; B
    db $10,$00,$f8,$9a,$00 ; E
    db $08,$00,$f8,$9C,$00 ; Z
    db $f8,$01,$f8,$98,$00 ; A
    db $f0,$01,$f8,$9b,$00 ; T
    db $e8,$01,$f8,$9a,$00 ; E
    db $e0,$01,$f8,$99,$00 ; N
    db $d8,$01,$f8,$98,$00 ; A
    db $d0,$01,$f8,$9f,$00 ; I
    db $c8,$01,$f8,$8f,$00 ; P

warnpc $8cfa00
