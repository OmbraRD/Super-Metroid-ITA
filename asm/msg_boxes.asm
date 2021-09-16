arch 65816
lorom

org $9ab200
    incbin "../gfx/0D3200_msg_boxes.bin"
    
;;------------------------------------------------------------------------------
;; WOULD YOU LIKE TO SAVE? YES/NO SWITCH
;;------------------------------------------------------------------------------

; YES/NO Highlight
org $858510
    ;ldy #$0040 ; YES Selected
    ldy.w #SelYes2-SelYes1
org $858518
    ;ldy #$0080 ; NO Selected
    ldy.w #SelNo-SelYes1
org $85851b
    ldx #$00c0 ; Screen Position
    lda #$40 ; Amount of tiles
    ;sta $7e0034
org $858523
    lda.w SelYes1,y
    sta $7e3200,x ; Screen Position
    ;inx
    ;inx
    ;iny
    ;iny
    ;dec $7e0034

;;------------------------------------------------------------------------------
;; MESSAGE BOXES LETTER POINTERS
;;------------------------------------------------------------------------------

; MISSILE 
org $85874b
    dw $012a ; screen position

; SUPER MISSILE 
org $85874d
    dw $012a

;POWER BOMB
org $85874f
    dw $012c

; GRAPPLING BEAM
org $858751
    dw $012c

; X-RAY SCOPE 
org $858753
    dw $012c

; SPEED BOOSTER 
org $858761
    dw $0120

; BOMB
org $85876d
    dw $012e

       
;;------------------------------------------------------------------------------
;; MESSAGE BOXES POINTERS
;;------------------------------------------------------------------------------

org $85869b
    dw $8436
    dw $8289
    dw #EnergyTank
    dw $83c5
    dw $825a
    dw #Missile
    dw $83c5
    dw $825a
    dw #SuperMissile
    dw $83c5
    dw $825a
    dw #PowerBomb
    dw $83c5
    dw $825a
    dw #GrapplingBeam
    dw $83cc
    dw $825a
    dw #XRayScope
    dw $8436
    dw $8289
    dw #VariaSuit
    dw $8436
    dw $8289
    dw #SpringBall
    dw $8436
    dw $8289
    dw #MorphingBall
    dw $8436
    dw $8289
    dw #ScrewAttack
    dw $8436
    dw $8289
    dw #HiJumpBoots
    dw $8436
    dw $8289
    dw #SpaceJump
    dw $83cc
    dw $825a
    dw #SpeedBooster
    dw $8436
    dw $8289
    dw #ChargeBeam
    dw $8436
    dw $8289
    dw #IceBeam
    dw $8436
    dw $8289
    dw #WaveBeam
    dw $8436
    dw $8289
    dw #Spazer
    dw $8436
    dw $8289
    dw #PlasmaBeam
    dw $83c5
    dw $825a
    dw #Bomb
    dw $8436
    dw $8289
    dw #MapDataAccess
    dw $8436
    dw $8289
    dw #EnergyRecharge
    dw $8436
    dw $8289
    dw #MissileReload
    dw $8441
    dw $8289
    dw #WouldYouLikeToSave
    dw $8436
    dw $8289
    dw #SaveCompleted
    dw $8436
    dw $8289
    dw #ReserveTankFirst
    dw $8436
    dw $8289
    dw #GravitySuit
    dw $8436
    dw $8289
    dw #Empty
    dw $8441
    dw $8289
    dw #WouldYouLikeToSave
    dw $8436
    dw $8289
    dw #SaveCompleted

;;------------------------------------------------------------------------------
;; MESSAGE BOXES TILEMAPS
;;------------------------------------------------------------------------------

org $85877f
EnergyTank:
    incbin "../tilemaps/0287FF_msg_boxes.tilemap"

org $8587bf
Missile:

org $8588bf
SuperMissile:

org $8589bf
PowerBomb:

org $858abf
GrapplingBeam:

org $858bbf
XRayScope:

org $858cbf
VariaSuit:

org $858cff
SpringBall:

org $858d3f
MorphingBall:

org $858d7f
ScrewAttack:

org $858dbf
HiJumpBoots:

org $858dff
SpaceJump:

org $858e3f
SpeedBooster:

org $858f3f
ChargeBeam:

org $858f7f
IceBeam:

org $858fbf
WaveBeam:

org $858fff
Spazer:

org $85903f
PlasmaBeam:

org $85907f
Bomb:

org $85917f
MapDataAccess:

org $85923f
EnergyRecharge:

org $8592ff
MissileReload:

org $8593bf
WouldYouLikeToSave:

org $8594bf
SaveCompleted:

org $8594ff
ReserveTankFirst:

org $85953f
GravitySuit:

org $85957f
Empty:
    dw $0000

;;------------------------------------------------------------------------------
;; WOULD YOU LIKE TO SAVE? YES/NO SWITCH TILEMAPS
;;------------------------------------------------------------------------------

org $859581
SelYes1:
    incbin "../tilemaps/029581_msg_boxes_save_yes1.tilemap"
;org $8595c1
SelYes2:
    incbin "../tilemaps/0295C1_msg_boxes_save_yes2.tilemap"
;org $859601
SelNo:
    incbin "../tilemaps/029601_msg_boxes_save_no.tilemap"
