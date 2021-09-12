arch 65816
lorom

;;------------------------------------------------------------------------------
;; THE OPERATION WAS - POINTERS
;;
;; NOTES:
;; $0008 = Sequential Chars
;; $000F = Space after Char
;;
;; Last pointer of line is repeated
;;------------------------------------------------------------------------------

org $8beecb
    dw #OperationSuccesful

org $8beb91
OperationSuccesful:
    dw $0008,#Data01
    dw $0008,#Data02
    dw $000f,#Data03
    
    dw $0008,#Data04
    dw $0008,#Data05
    dw $0008,#Data06
    dw $0008,#Data07
    dw $0008,#Data08
    dw $0008,#Data09
    dw $0008,#Data10
    dw $0008,#Data11
    dw $000f,#Data12
    
    dw $0008,#Data13
    dw $0008,#Data14
    dw $000f,#Data15
    
    dw $f3b0
    dw $000f,#Data15

    dw $94bc
    dw $ebcf

;;------------------------------------------------------------------------------
;; COMPLETED SUCCESFULLY - POINTERS
;;------------------------------------------------------------------------------

    dw $0008,#Data16
    dw $0008,#Data17
    dw $0008,#Data18
    dw $0008,#Data19
    dw $0008,#Data20
    dw $0008,#Data21
    dw $0008,#Data22
    dw $0008,#Data23
    dw $000f,#Data24
    
    dw $0008,#Data25
    dw $0008,#Data26
    dw $0008,#Data27
    dw $0008,#Data28
    dw $0008,#Data29
    dw $0008,#Data30
    dw $0008,#Data31
    dw $0008,#Data32
    dw $0008,#Data33
    dw $0008,#Data34
    dw $0008,#Data35
    dw $000f,#Data36
    
    dw $f3ce
    dw $0008,#Data36

    dw $94bc
    dw $ec2d

;;------------------------------------------------------------------------------
;; CLEAR TIME - POINTERS
;;------------------------------------------------------------------------------

    dw $0008,#Data37
    dw $0008,#Data38
    dw $0008,#Data39
    dw $0008,#Data40
    dw $000f,#Data41
    
    dw $0008,#Data42
    dw $0008,#Data43
    dw $0008,#Data44
    dw $000f,#Data45
    
    dw $f41b
    dw $0008,#Data45

;;------------------------------------------------------------------------------
;; SPRITE DATA
;;
;; NOTES:
;; org $8bf02b
;;     lda #$0080 ; sta $14 - This gets added to the first 2 bytes
;;     sta $1a7d,y
;;     lda #$0060 ; sta $12 - This gets added to byte 3
;;     sta $1a9d,y
;;     lda #$0400 ; sta $16 - char byte & #$f1ff then ora $16
;;     sta $1abd,y
;;------------------------------------------------------------------------------

;;------------------------------------------------------------------------------
;; BANK $8B FREE SPACE - 2208 bytes
;;------------------------------------------------------------------------------
org $8bf760

warnpc $8c0000

;;------------------------------------------------------------------------------
;; THE OPERATION WAS - SPRITE DATA
;;------------------------------------------------------------------------------

org $8ca69d
Data01:
    %endText($01b8,$f8,'T')
Data02:
    %endText($01b8,$f8,'T','H')
Data03:
    %endText($01b8,$f8,'T','H','E')
Data04:
    %endText($01b8,$f8,'T','H','E',' ','O')
Data05:
    %endText($01b8,$f8,'T','H','E',' ','O','P')
Data06:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E')
Data07:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R')
Data08:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A')
Data09:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T')
Data10:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I')
Data11:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I','O')
Data12:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I','O','N')
Data13:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I','O','N',' ','W')
Data14:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I','O','N',' ','W','A')
Data15:
    %endText($01b8,$f8,'T','H','E',' ','O','P','E','R','A','T','I','O','N',' ','W','A','S')

;;------------------------------------------------------------------------------
;; COMPLETED SUCCESFULLY - SPRITE DATA
;;------------------------------------------------------------------------------
Data16:
    %endText($01a8,$10,'C')
Data17:
    %endText($01a8,$10,'C','O')
Data18:
    %endText($01a8,$10,'C','O','M')
Data19:
    %endText($01a8,$10,'C','O','M','P')
Data20:
    %endText($01a8,$10,'C','O','M','P','L')
Data21:
    %endText($01a8,$10,'C','O','M','P','L','E')
Data22:
    %endText($01a8,$10,'C','O','M','P','L','E','T')
Data23:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E')
Data24:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D')
Data25:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S')
Data26:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U')
Data27:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C')
Data28:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C')
Data29:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E')
Data30:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S')
Data31:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S')
Data32:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S','F')
Data33:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S','F','U')
Data34:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S','F','U','L')
Data35:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S','F','U','L','L')
Data36:
    %endText($01a8,$10,'C','O','M','P','L','E','T','E','D',' ','S','U','C','C','E','S','S','F','U','L','L','Y')

;;------------------------------------------------------------------------------
;; CLEAR TIME - SPRITE DATA
;;------------------------------------------------------------------------------
Data37:
    %endText($01c0,$f8,'C')
Data38:
    %endText($01c0,$f8,'C','L')
Data39:
    %endText($01c0,$f8,'C','L','E')
Data40:
    %endText($01c0,$f8,'C','L','E','A')
Data41:
    %endText($01c0,$f8,'C','L','E','A','R')
Data42:
    %endText($01c0,$f8,'C','L','E','A','R',' ','T')
Data43:
    %endText($01c0,$f8,'C','L','E','A','R',' ','T','I')
Data44:
    %endText($01c0,$f8,'C','L','E','A','R',' ','T','I','M')
Data45:
    %endText($01c0,$f8,'C','L','E','A','R',' ','T','I','M','E')

warnpc $8CB66F

;;------------------------------------------------------------------------------
;; CREDITS
;;------------------------------------------------------------------------------

;; CREDITS TILEMAP POINTER
org $8be0bd
    lda.w #Credits>>8&$FF00 ; Bank
    sta $48
    lda.w #Credits ; Pointer

;; PRODUCED BY TILEMAP POINTER
org $8be19f
    ldx #$0000
    lda.l CreditsProducedBy,x ; Pointer
    sta $7e3240,x
    inx
    inx
    cpx #$0240 ; Size

org $97eeff
Credits:
    incbin "tilemaps/compressed/credits.bin"

warnpc $97f987

org $8cdc9b
CreditsProducedBy:
    incbin "tilemaps/ending/065C9B_produced_by.tilemap"

;;------------------------------------------------------------------------------
;; YOUR RATE FOR COLLECTING ITEMS IS
;;------------------------------------------------------------------------------

org $8bf752
    dw $ItemsRate

org $8cdfdb
ItemsRate:
    dw $0040,$0000,$e12f

    dw $0004,$0a09,$e1dd ; Y
    dw $0004,$0a0a,$e1bf ; O
    dw $0004,$0a0b,$e1d7 ; U
    dw $0004,$0a0c,$e1c5 ; R
    dw $0004,$0a0d,$e1e3 ;
    dw $0004,$0a0e,$e1c5 ; R
    dw $0004,$0a0f,$e189 ; A
    dw $0004,$0a10,$e1d1 ; T
    dw $0004,$0a11,$e195 ; E
    dw $0004,$0a12,$e1e3 ;
    dw $0004,$0a13,$e19b ; F
    dw $0004,$0a14,$e1bf ; O
    dw $0004,$0a15,$e1c5 ; R

    dw $0004,$0c06,$e18f ; C
    dw $0004,$0c07,$e1bf ; O
    dw $0004,$0c08,$e1ad ; L
    dw $0004,$0c09,$e1ad ; L
    dw $0004,$0c0a,$e195 ; E
    dw $0004,$0c0b,$e18f ; C
    dw $0004,$0c0c,$e1d1 ; T
    dw $0004,$0c0d,$e1a7 ; I
    dw $0004,$0c0e,$e1b9 ; N
    dw $0004,$0c0f,$e1a1 ; G
    dw $0004,$0c10,$e1e3 ;
    dw $0004,$0c11,$e1a7 ; I
    dw $0004,$0c12,$e1d1 ; T
    dw $0004,$0c13,$e195 ; E
    dw $0004,$0c14,$e1b3 ; M
    dw $0004,$0c15,$e1cb ; S
    dw $0004,$0c16,$e1e3 ;
    dw $0004,$0c17,$e1a7 ; I
    dw $0004,$0c18,$e1cb ; S

    dw $27e6
    dw $69e7

    dw $0080,$0000,$e12f

;org $8ce0ab

    dw $e780
    dw $9698

    dw $0040,$0000,$e12f
    
    dw $0004,$0206,$e139 ; S
    dw $0004,$0207,$e141 ; E
    dw $0004,$0208,$e141 ; E
    dw $0004,$0209,$e131 ; 
    dw $0004,$020a,$e149 ; Y
    dw $0004,$020b,$e151 ; O
    dw $0004,$020c,$e159 ; U
    dw $0004,$020d,$e131 ; 
    dw $0004,$020e,$e161 ; N
    dw $0004,$020f,$e141 ; E
    dw $0004,$0210,$e169 ; X
    dw $0004,$0211,$e171 ; T
    dw $0004,$0212,$e131 ; 
    dw $0004,$0213,$e179 ; M
    dw $0004,$0214,$e181 ; I
    dw $0004,$0215,$e139 ; S
    dw $0004,$0216,$e139 ; S
    dw $0004,$0217,$e181 ; I
    dw $0004,$0218,$e151 ; O
    dw $0004,$0219,$e161 ; N

    dw $9698

warnpc $8ce12f