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

;org $8bebd7

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

;org $8bec35

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
    dw $0008,#Data45,$f424
    dw $0008,#Data45,$f42d
	dw $0008,#Data45,$f436
	dw $0008,#Data45,$f43f
	dw $0008,#Data45,$f448
	dw $000f,#Data45
	
	dw $94bc
	dw $ec79
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
    %endText($01b8,$f8,'L')
Data02:
    %endText($01b8,$f8,'L','^')
Data03:
    %endText($01b8,$f8,'L','^','O')
Data04:
    %endText($01b8,$f8,'L','^','O','P',' ')
Data05:
    %endText($01b8,$f8,'L','^','O','P','E',' ')
Data06:
    %endText($01b8,$f8,'L','^','O','P','E','R',' ')
Data07:
    %endText($01b8,$f8,'L','^','O','P','E','R','A',' ')
Data08:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z',' ')
Data09:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I',' ')
Data10:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O',' ')
Data11:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O','N',' ')
Data12:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ')
Data13:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ','e',' ')
Data14:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ','e',' ',' ')
Data15:
    %endText($01b8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ','e',' ',' ',' ')

;;------------------------------------------------------------------------------
;; COMPLETED SUCCESFULLY - SPRITE DATA
;;------------------------------------------------------------------------------
Data16:
    %endText($01a8,$10,'S')
Data17:
    %endText($01a8,$10,'S','T')
Data18:
    %endText($01a8,$10,'S','T','A')
Data19:
    %endText($01a8,$10,'S','T','A','T')
Data20:
    %endText($01a8,$10,'S','T','A','T','A')
Data21:
    %endText($01a8,$10,'S','T','A','T','A',' ')
Data22:
    %endText($01a8,$10,'S','T','A','T','A',' ','U')
Data23:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N')
Data24:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ')
Data25:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S',' ')
Data26:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U',' ')
Data27:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C',' ')
Data28:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C',' ')
Data29:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E',' ')
Data30:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S',' ')
Data31:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S',' ')
Data32:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O',' ')
Data33:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O',' ',' ')
Data34:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O',' ',' ',' ')
Data35:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O',' ',' ',' ',' ')
Data36:
    %endText($01a8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O',' ',' ',' ',' ',' ')

;;------------------------------------------------------------------------------
;; CLEAR TIME - SPRITE DATA
;;------------------------------------------------------------------------------
Data37:
    %endText($01c0,$f8,' ')
Data38:
    %endText($01c0,$f8,' ',' ')
Data39:
    %endText($01c0,$f8,' ',' ','D')
Data40:
    %endText($01c0,$f8,' ',' ','D','U')
Data41:
    %endText($01c0,$f8,' ',' ','D','U','R')
Data42:
    %endText($01c0,$f8,' ',' ','D','U','R','A',' ')
Data43:
    %endText($01c0,$f8,' ',' ','D','U','R','A','T',' ')
Data44:
    %endText($01c0,$f8,' ',' ','D','U','R','A','T','A',' ')
Data45:
    %endText($01c0,$f8,' ',' ','D','U','R','A','T','A',' ',' ')

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
    dw #ItemsRate

org $8cf500 ; original org $8cdfdb
ItemsRate:
    dw $0040,$0000,$e12f

    dw $0004,$0a07,#.P
    dw $0004,$0a08,#.E
    dw $0004,$0a09,#.R
    dw $0004,$0a0a,#.C
    dw $0004,$0a0b,#.E
    dw $0004,$0a0c,#.N
    dw $0004,$0a0d,#.T
    dw $0004,$0a0e,#.U
    dw $0004,$0a0f,#.A
    dw $0004,$0a10,#.L
    dw $0004,$0a11,#.E
    dw $0004,$0a13,#.D
    dw $0004,$0a14,#.E
    dw $0004,$0a15,#.G
    dw $0004,$0a16,#.L
    dw $0004,$0a17,#.I
    
	dw $0004,$0c08,#.O
    dw $0004,$0c09,#.G
    dw $0004,$0c0a,#.G
    dw $0004,$0c0b,#.E
    dw $0004,$0c0c,#.T
    dw $0004,$0c0d,#.T
    dw $0004,$0c0e,#.I
    dw $0004,$0c10,#.R
    dw $0004,$0c11,#.A
    dw $0004,$0c12,#.C
    dw $0004,$0c13,#.C
    dw $0004,$0c14,#.O
    dw $0004,$0c15,#.L
    dw $0004,$0c16,#.T
    dw $0004,$0c17,#.I
    dw $0004,$0b17,#.e

    dw $e627
    dw $e769

    dw $0080,$0000,$e12f
	dw $e780,$9698
	
org $8ce189 ;ITEMS LETTER VALUE

.A:
    dw $88b7,$0101,$3c00
.C:
    dw $88b7,$0101,$3c02
.E:
    dw $88b7,$0101,$3c04
.P:
    dw $88b7,$0101,$3c0f
.G:
    dw $88b7,$0101,$3c06
.I:
    dw $88b7,$0101,$3c08
.L:
    dw $88b7,$0101,$3c0b
.e:
    dw $88b7,$0101,$3c5d ; accent
.N:
    dw $88b7,$0101,$3c0d
.O:
    dw $88b7,$0101,$3c0e
.R:
    dw $88b7,$0101,$3c11
.S:
    dw $88b7,$0101,$3c12
.T:
    dw $88b7,$0101,$3c13
.U:
    dw $88b7,$0101,$3c14
.D:
    dw $88b7,$0101,$3c03
._:
    dw $88b7,$0101,$207f
	

;;------------------------------------------------------------------------------
;; SEE YOU NEXT MISSION
;;------------------------------------------------------------------------------	
org $8bf74c
    dw #NextMission
	
org $8cf5d4 ; original org $8ce0af
NextMission:	
    dw $0040,$0000,$e12f
    
    dw $0004,$0204,#A.
    dw $0004,$0205,#L.
    dw $0004,$0206,#L.
    dw $0004,$0207,#A.
    dw $0004,$0209,#P.
    dw $0004,$020a,#R.
    dw $0004,$020b,#O.
    dw $0004,$020c,#S.
    dw $0004,$020d,#S.
    dw $0004,$020e,#I.
    dw $0004,$020f,#M.
    dw $0004,$0210,#A.
    dw $0004,$0212,#M.
    dw $0004,$0213,#I.
    dw $0004,$0214,#S.
    dw $0004,$0215,#S.
    dw $0004,$0216,#I.
    dw $0004,$0217,#O.
    dw $0004,$0218,#N.
    dw $0004,$0219,#E.

    dw $9698
	


	
org $8ce131 ; SEE YOU LETTER VALUE

_.:
   dw $88b7,$0201,$207f,$207f
A.:   
   dw $88b7,$0201,$2020,$2030
L.:
   dw $88b7,$0201,$202b,$203b
P.:   
   dw $88b7,$0201,$202f,$203f
O.:
   dw $88b7,$0201,$202e,$203e
R.:  
   dw $88b7,$0201,$2041,$2051
N.:  
   dw $88b7,$0201,$202d,$203d
S.:  
   dw $88b7,$0201,$2042,$2052
E.:   
   dw $88b7,$0201,$2024,$2034
M.:   
   dw $88b7,$0201,$202c,$203c
I.:   
   dw $88b7,$0201,$2028,$2038

