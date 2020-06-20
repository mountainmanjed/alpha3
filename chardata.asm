;= $00 ;byte
;= $01 ;byte

;= $06 ;byte
plmovestate = $07 ;byte
;= $08

;= $0a ;byte
plflip = $0b ;byte
;= $0c ;word
;= $0e

;= $10
;= $14

spritebank = $1a ;word

;= $30
;= $31
;= $32
;= $33
;= $34
;= $35 cancels?
;= $36
;= $37
;= $38
;= $39
;= $3a
;= $3b
;= $3c
;= $3d
;= $3e
;= $3f

plxvelocity = $40
plyvelocity = $44
plxdrag = $48
plydrag = $4c

plhlth = $50;word

plhlthcpy = $52;word

; $64

;NeutralState? = $80
Attacktype = $81 ;0 = Punches , 2 = Kicks
ButtonStrength = $82 ;0 = L,2 = M,4 = H
Directioninput = $83 ;1 = Back, 2 = Forward , 4 = Down , 8 = up
; = $84
; = $85

; = $a8 ; byte
; = $a9 ; byte
plmoveid = $aa ; byte
; = $ab ; byte
; = $ac

;= $b9 ;byte
;= $ba ;word
pltaunt = $bc

charid = $102

; = $11a
plmeter = $11e

;$123 ;byte
;$124 ;byte
cpucontrol = $125

ism_choice = $132

moveinpslot0 = $180
moveinpslot1 = $188
moveinpslot2 = $190
moveinpslot3 = $198
moveinpslot4 = $1a0
moveinpslot5 = $1a8
moveinpslot6 = $1b0
moveinpslot7 = $1b8
moveinpslot8 = $1c0
moveinpslot9 = $1c8

;$1d0
;$1d1
;$1d2

rolentowire = $1e4 ;word
codyknife = $1e4 ;byte needs to be negative
rosegthrow = $1e4 ; addr.w

;??= $214

distanceaway = $21c

reversalwindow = $256

sidecheck = $2c9
plstun = $2cc

WalkSpeedPNT = $2d0
JumpDataPNT = $2d4

moveinpslota = $300
moveinpslotb = $308

;= $32c ;byte

;371
;378
