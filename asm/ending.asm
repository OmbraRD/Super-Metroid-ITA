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

org $8ce189 ;ITEMS LETTER VALUE

ItemsA:
    dw $88b7,$0101,$3c00
ItemsC:
    dw $88b7,$0101,$3c02
ItemsE:
    dw $88b7,$0101,$3c04
ItemsP:
    dw $88b7,$0101,$3c0f
ItemsG:
    dw $88b7,$0101,$3c06
ItemsI:
    dw $88b7,$0101,$3c08
ItemsL:
    dw $88b7,$0101,$3c0b
Itemse:
    dw $88b7,$0101,$3c5d ; accent
ItemsN:
    dw $88b7,$0101,$3c0d
ItemsO:
    dw $88b7,$0101,$3c0e
ItemsR:
    dw $88b7,$0101,$3c11
ItemsS:
    dw $88b7,$0101,$3c12
ItemsT:
    dw $88b7,$0101,$3c13
ItemsU:
    dw $88b7,$0101,$3c14
ItemsD:
    dw $88b7,$0101,$3c03
Items_:
    dw $88b7,$0101,$207f

;;------------------------------------------------------------------------------
;; SEE YOU NEXT MISSION
;;------------------------------------------------------------------------------

org $8bf74c
    dw #NextMission

org $8ce131 ; SEE YOU LETTER VALUE

Mission_:
   dw $88b7,$0201,$207f,$207f
MissionA:
   dw $88b7,$0201,$2020,$2030
MissionL:
   dw $88b7,$0201,$202b,$203b
MissionP:
   dw $88b7,$0201,$202f,$203f
MissionO:
   dw $88b7,$0201,$202e,$203e
MissionR:
   dw $88b7,$0201,$2041,$2051
MissionN:
   dw $88b7,$0201,$202d,$203d
MissionS:
   dw $88b7,$0201,$2042,$2052
MissionE:
   dw $88b7,$0201,$2024,$2034
MissionM:
   dw $88b7,$0201,$202c,$203c
MissionI:
   dw $88b7,$0201,$2028,$2038

;;------------------------------------------------------------------------------
;; BANK $8C - FREE SPACE - 1536 bytes
;;------------------------------------------------------------------------------

org $8cfa00

;org $8cdfdb
ItemsRate:
    dw $0040,$0000,$e12f

    dw $0004,$0a07,#ItemsP
    dw $0004,$0a08,#ItemsE
    dw $0004,$0a09,#ItemsR
    dw $0004,$0a0a,#ItemsC
    dw $0004,$0a0b,#ItemsE
    dw $0004,$0a0c,#ItemsN
    dw $0004,$0a0d,#ItemsT
    dw $0004,$0a0e,#ItemsU
    dw $0004,$0a0f,#ItemsA
    dw $0004,$0a10,#ItemsL
    dw $0004,$0a11,#ItemsE
    dw $0004,$0a13,#ItemsD
    dw $0004,$0a14,#ItemsE
    dw $0004,$0a15,#ItemsG
    dw $0004,$0a16,#ItemsL
    dw $0004,$0a17,#ItemsI
    
    dw $0004,$0c08,#ItemsO
    dw $0004,$0c09,#ItemsG
    dw $0004,$0c0a,#ItemsG
    dw $0004,$0c0b,#ItemsE
    dw $0004,$0c0c,#ItemsT
    dw $0004,$0c0d,#ItemsT
    dw $0004,$0c0e,#ItemsI
    dw $0004,$0c10,#ItemsR
    dw $0004,$0c11,#ItemsA
    dw $0004,$0c12,#ItemsC
    dw $0004,$0c13,#ItemsC
    dw $0004,$0c14,#ItemsO
    dw $0004,$0c15,#ItemsL
    dw $0004,$0c16,#ItemsT
    dw $0004,$0c17,#ItemsI
    dw $0004,$0b17,#Itemse

    dw $e627
    dw $e769

    dw $0080,$0000,$e12f
    dw $e780,$9698

;org $8ce0af
NextMission:
    dw $0040,$0000,$e12f

    dw $0004,$0204,#MissionA
    dw $0004,$0205,#MissionL
    dw $0004,$0206,#MissionL
    dw $0004,$0207,#MissionA
    dw $0004,$0209,#MissionP
    dw $0004,$020a,#MissionR
    dw $0004,$020b,#MissionO
    dw $0004,$020c,#MissionS
    dw $0004,$020d,#MissionS
    dw $0004,$020e,#MissionI
    dw $0004,$020f,#MissionM
    dw $0004,$0210,#MissionA
    dw $0004,$0212,#MissionM
    dw $0004,$0213,#MissionI
    dw $0004,$0214,#MissionS
    dw $0004,$0215,#MissionS
    dw $0004,$0216,#MissionI
    dw $0004,$0217,#MissionO
    dw $0004,$0218,#MissionN
    dw $0004,$0219,#MissionE

    dw $9698
