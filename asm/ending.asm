arch 65816
lorom

;;------------------------------------------------------------------------------
;; THE OPERATION WAS - POINTERS
;;
;; NOTES:
;; $0008 = Sequential Chars
;; $000F = Space after Char
;; $0001-00FF = Time code befere new char print

;; Last pointer of line is repeated
;;------------------------------------------------------------------------------

org $8beecb
    dw #OperationSuccesful

org $8beb91
OperationSuccesful:
    dw $0008,#Data02
    dw $0008,#Data03
    dw $0008,#Data04
    dw $0008,#Data05
    dw $0008,#Data06
    dw $0008,#Data07
    dw $0008,#Data08
    dw $0008,#Data09
    dw $0008,#Data10
    dw $0008,#Data11
    dw $0008,#Data12
	dw $0008,#Data13
	
    dw $0008,#Data14
	
    dw $000f,#Data15

    dw $f3b0
    dw $0008,#Data15

    dw $94bc
    dw $ebcb ; Data15 pointer after $f3b0

;;------------------------------------------------------------------------------
;; COMPLETED SUCCESFULLY - POINTERS
;;------------------------------------------------------------------------------

;org $8bebd7
    dw $0008,#Data20
    dw $0008,#Data21
    dw $0008,#Data22
    dw $0008,#Data23
    dw $000e,#Data24

    dw $0001,#Data25
	
    dw $0008,#Data26
    dw $000e,#Data27
	
    dw $0001,#Data28
	
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
    dw $ec13 ; Data36 pointer after $f3ce

;;------------------------------------------------------------------------------
;; CLEAR TIME - POINTERS
;; NOTES:
;; org $8bec35 ; CLEAR TIME Data POINTERS - Manual input 
;;------------------------------------------------------------------------------
org $8bef01
	dw #ClearTime
	
org $8bec41 ; Set Input
ClearTime:
    dw $0008,#Data40 
    dw $0008,#Data41 
    dw $0008,#Data42 
    dw $0008,#Data43 
    dw $0008,#Data44 
    dw $000c,#Data45 
	
warnpc $8bec60

;;------------------------------------------------------------------------------
;; TIMER - POINTERS
;;------------------------------------------------------------------------------

org $8bec81

	dw $0008,#Timer0,$94bc,$ec81
	dw $0008,#Timer1,$94bc,$ec89
	dw $0008,#Timer2,$94bc,$ec91
	dw $0008,#Timer3,$94bc,$ec99
	dw $0008,#Timer4,$94bc,$eca1
	dw $0008,#Timer5,$94bc,$eca9
	dw $0008,#Timer6,$94bc,$ecb1
	dw $0008,#Timer7,$94bc,$ecb9
	dw $0008,#Timer8,$94bc,$ecc1
	dw $0008,#Timer9,$94bc,$ecc9
	dw $0008,#TimerColon,$94bc,$ecd1
	
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

Data02:
    %endText($01c8,$f8,'L')
Data03:
    %endText($01c8,$f8,'L','^')
Data04:
    %endText($01c8,$f8,'L','^','O')
Data05:
    %endText($01c8,$f8,'L','^','O','P')
Data06:
    %endText($01c8,$f8,'L','^','O','P','E')
Data07:
    %endText($01c8,$f8,'L','^','O','P','E','R')
Data08:
    %endText($01c8,$f8,'L','^','O','P','E','R','A')
Data09:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z')
Data10:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I')
Data11:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I','O')
Data12:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I','O','N')
Data13:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E')
Data14:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ')
Data15:
    %endText($01c8,$f8,'L','^','O','P','E','R','A','Z','I','O','N','E',' ','e')

;;------------------------------------------------------------------------------
;; COMPLETED SUCCESFULLY - SPRITE DATA
;;------------------------------------------------------------------------------

Data20:
    %endText($01b8,$10,'S')
Data21:
    %endText($01b8,$10,'S','T')
Data22:
    %endText($01b8,$10,'S','T','A')
Data23:
    %endText($01b8,$10,'S','T','A','T')
Data24:
    %endText($01b8,$10,'S','T','A','T','A')
Data25:
    %endText($01b8,$10,'S','T','A','T','A',' ')
Data26:
    %endText($01b8,$10,'S','T','A','T','A',' ','U')
Data27:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N')
Data28:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ')
Data29:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S')
Data30:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U')
Data31:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C')
Data32:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C')
Data33:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E')
Data34:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S')
Data35:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S')
Data36:
    %endText($01b8,$10,'S','T','A','T','A',' ','U','N',' ','S','U','C','C','E','S','S','O')

;;------------------------------------------------------------------------------
;; CLEAR TIME - SPRITE DATA
;; 
;; NOTES:
;; org $8cb613 ; last CLEAR TIME POINTER
;;------------------------------------------------------------------------------

Data40:
    %endText($01d0,$f8,'D')
Data41:
    %endText($01d0,$f8,'D','U')
Data42:
    %endText($01d0,$f8,'D','U','R')
Data43:
    %endText($01d0,$f8,'D','U','R','A')
Data44:
    %endText($01d0,$f8,'D','U','R','A','T')
Data45:
    %endText($01d0,$f8,'D','U','R','A','T','A')
	
org $8cb613
    %endText($01d0,$f8,'D','U','R','A','T','A')
	
warnpc $8CB66f

;;------------------------------------------------------------------------------
;; TIMER - SPRITE DATA
;;------------------------------------------------------------------------------

org $8CB66f

TimerColon:
	%endText($01ec,$f8,':')
Timer0:
	%endText($01ec,$f8,'0')
Timer1:
	%endText($01ec,$f8,'1')
Timer2:
	%endText($01ec,$f8,'2')
Timer3:
	%endText($01ec,$f8,'3')
Timer4:
	%endText($01ec,$f8,'4')
Timer5:
	%endText($01ec,$f8,'5')
Timer6:
	%endText($01ec,$f8,'6')
Timer7:
	%endText($01ec,$f8,'7')
Timer8:
	%endText($01ec,$f8,'8')
Timer9:
	%endText($01ec,$f8,'9')



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
ItemsZ:
    dw $88b7,$0101,$3c19
ItemsI:
    dw $88b7,$0101,$3c08
ItemsL:
    dw $88b7,$0101,$3c0b
ItemsB:
    dw $88b7,$0101,$3c01
ItemsColon:
	dw $88b7,$0101,$3c1e
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
	
    dw $0004,$0a09,#ItemsP
    dw $0004,$0a0a,#ItemsE
    dw $0004,$0a0b,#ItemsR
    dw $0004,$0a0c,#ItemsC
    dw $0004,$0a0d,#ItemsE
    dw $0004,$0a0e,#ItemsN
    dw $0004,$0a0f,#ItemsT
    dw $0004,$0a10,#ItemsU
    dw $0004,$0a11,#ItemsA
    dw $0004,$0a12,#ItemsL
    dw $0004,$0a13,#ItemsE
	
    dw $0004,$0a15,#ItemsD
    dw $0004,$0a16,#ItemsI

    dw $0004,$0c04,#ItemsC
    dw $0004,$0c05,#ItemsO
    dw $0004,$0c06,#ItemsL    
    dw $0004,$0c07,#ItemsL
    dw $0004,$0c08,#ItemsE
    dw $0004,$0c09,#ItemsZ
    dw $0004,$0c0a,#ItemsI
    dw $0004,$0c0b,#ItemsO
    dw $0004,$0c0c,#ItemsN
    dw $0004,$0c0d,#ItemsA
    dw $0004,$0c0e,#ItemsB
    dw $0004,$0c0f,#ItemsI
    dw $0004,$0c10,#ItemsL
    dw $0004,$0c11,#ItemsI
	
    dw $0004,$0c13,#ItemsR
    dw $0004,$0c14,#ItemsA
    dw $0004,$0c15,#ItemsC
    dw $0004,$0c16,#ItemsC
    dw $0004,$0c17,#ItemsO
    dw $0004,$0c18,#ItemsL
    dw $0004,$0c19,#ItemsT
    dw $0004,$0c1a,#ItemsI
    dw $0004,$0c1b,#ItemsColon

    dw $e627
    dw $e769

    dw $0080,$0000,$e12f
    dw $e780,$9698

;org $8ce0af
NextMission:
    dw $0040,$0000,$e12f

    dw $0004,$0205,#MissionA
    dw $0004,$0206,#MissionL
    dw $0004,$0207,#MissionL
    dw $0004,$0208,#MissionA
	
    dw $0004,$020a,#MissionP
    dw $0004,$020b,#MissionR
    dw $0004,$020c,#MissionO
    dw $0004,$020d,#MissionS
    dw $0004,$020e,#MissionS
    dw $0004,$020f,#MissionI
    dw $0004,$0210,#MissionM
    dw $0004,$0211,#MissionA
	
    dw $0004,$0213,#MissionM
    dw $0004,$0214,#MissionI
    dw $0004,$0215,#MissionS
    dw $0004,$0216,#MissionS
    dw $0004,$0217,#MissionI
    dw $0004,$0218,#MissionO
    dw $0004,$0219,#MissionN
    dw $0004,$021a,#MissionE

    dw $9698
