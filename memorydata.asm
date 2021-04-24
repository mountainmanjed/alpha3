;Graphics
Cps0BackG0 = 0x900000
Cps1BackG0 = 0x904000
Cps2BackG0 = 0x908000
MainpaletteDirect = 0x90c000
Cps0PaletteDirect = 0x90c400
Cps1PaletteDirect = 0x90c800
Cps2PaletteDirect = 0x90cc00
; = 0x90d000

RasterBankDirect = 0x90e000
Cps0BackG1Direct = 0x910000
Cps1BackG1Direct = 0x914000
Cps2BackG1Direct = 0x918000
; 0x91c000
; 0x920000
; 0x924000
WhiteFlashDirect = 0x928000
Palettebank3 = 0x92c000


;A5 Offsets
;0x2
;0x4
;0x6
;0x8
;0xa
;0xc
;0xe
;0x10
;0x12

gfxram8x8 = 0x18
gfxram16x16 = 0x1a
gfxram32x32 = 0x1c
rasterram = 0x1e
palrampointer = 0x20
;0x22
;0x24
;0x26
;0x28
;0x2a
;0x2c

;0x4e

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

;0xb4
;0xb5
Dip_Regulation = 0xbb

;==============================================
;Game Dips Extra
;==============================================
Dip_1PRounds = 0xde
Dip_2PRounds = 0xdf

;0xe6
;0xe7
;0xe8

game_unlock = 0xee

;==============================================
;Game Data
;==============================================
stageid = 0x100
;0x107
;0x109
clock_frames = 0x10a
Dev_Turbo = 0x116
;0x125
;0x12b
;0x134
;0x13c

;0x182
;0x1c8

;0x214

;0x250

;Camera Stuff
;0x288
;0x28c
camera_x = 0x290
;0x292
camera_y = 0x294
;0x296
;0x2a0
;0x2a4
;0x310
;0x312
;0x314
;0x316
;0x398

;==============================================
;PlayerData
;==============================================
p1memory = 0x400
; 0x500
p1_charid = 0x502
; = 0x51a


;==============================================
p2memory = 0x800
p2_charid = 0x902

;==============================================
p3memory = 0xc00
p3_charid = 0xd02

;==============================================
p4memory = 0x1000
p4_charid = 0x1102

;Reminder that chardata.asm is for a4/a6 offsets

;==============================================
;
;==============================================
;-0x43ea
;-0x43ec
;-0x50ce
;-0x5162


;unknown

;0xff0fca,0xff13ca,0xff17ca,0xff1bca
unk_ff3554 = 0xff3554
unk_ff3622 = 0xff3622

unk_ff3c0c = 0xff3c0c
;ff3c16
;unk_ff3c14 = 0xff3c14
;unk_ff3c18 = 0xff3c18
;ff3d18