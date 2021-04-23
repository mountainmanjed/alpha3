;Graphics
Cps0BackG0 = 0x900000
Cps1BackG0 = 0x904000
Cps2BackG0 = 0x908000
MainpaletteDirect = 0x90c000
Cps0PaletteDirect = 0x90c400
Cps1PaletteDirect = 0x90c800
Cps2PaletteDirect = 0x90cc00
; = $90d000

RasterBankDirect = 0x90e000
Cps0BackG1Direct = 0x910000
Cps1BackG1Direct = 0x914000
Cps2BackG1Direct = 0x918000
; $91c000
; $920000
; $924000
WhiteFlashDirect = 0x928000
Palettebank3 = 0x92c000


;A5 Offsets
;2
;4
;6
;8
;$a
;$c
;$e
;$10
;$12

gfxram8x8 = $18
gfxram16x16 = $1a
gfxram32x32 = $1c
rasterram = $1e
palrampointer = $20
;$22
;$24
;$26
;$28
;$2a
;$2c

;$4e

;==============================================
;Main Control Inputs
;==============================================
INP_P1 = 0x58
INP_P1_repeat = 0x5a
INP_P2 = 0x5c
INP_P2_repeat = 0x5e

;==============================================
;
;==============================================
;0x86 ;deals with linking
Region = 0x90


;==============================================
;Game Dips
;==============================================
Dip_Monitor_Flip = 0x96
Dip_Coin_Mode = 0x97
Dip_Continue = 0x98
Dip_Demo_Sound = 0x99
Dip_Sound_Mode = 0x9a
Dip_Chutes= 0x9b

Dip_Difficulty = 0xa0
Dip_Damage = 0xa1
Dip_Timer_Speed = 0xa2
Dip_Game_Turbo = 0xa3
Dip_Join_in = 0xa4
Dip_EventMode = 0xa5

;==============================================
;
;==============================================
Active_Player = 0xa8
RngByte0 = 0xae
RngByte1 = 0xaf

;$b4
;$b5
Dip_Regulation = 0xbb

;==============================================
;Game Dips Extra
;==============================================
Dip_1PRounds = 0xde
Dip_2PRounds = 0xdf

game_unlock = 0xee

;==============================================
;Game Data
;==============================================
stageid = 0x100
;$107
;$109
clock_frames = 0x10a
Dev_Turbo = 0x116
;$125
;$12b
;$134
;$13c

;$182
;$1c8

;$214

;$250

;Camera Stuff
;$288
;$28c
;$290
;$292
;$294
;$296
;$2a0
;$2a4
;$310
;$312
;$314
;$316
;$398

;PlayerData
p1memory = $400
p1charid = $502
; = $51a

p2memory = $800
p2charid = $902

p3memory = $c00
p3charid = $d02

p4memory = $1000
p4charid = $1102

;-$43ea
;-$43ec
;-$50ce
;-$5162


;unknown

;$ff0fca,$ff13ca,$ff17ca,$ff1bca
unk_ff3554 = $ff3554
unk_ff3622 = $ff3622

unk_ff3c0c = $ff3c0c
;ff3c16
;unk_ff3c14 = $ff3c14
;unk_ff3c18 = $ff3c18
;ff3d18

;==============================================
;Player Memory Offset
;==============================================
PL_Enable = 0x00
PL_Render = 0x01
PL_Flip = 0x0b
PL_X = 0x10
PL_Y = 0x14
PL_charid = 0x102
;PL_Anim_Pnt =
;
;
;
