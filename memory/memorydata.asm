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

gl_cps00_pnt = 0x9000
gl_cps10_pnt = 0x9040
gl_cps20_pnt = 0x9080
gl_plbk0_pnt = 0x90c0
gl_rstrb_pnt = 0x90e0
gl_cps01_pnt = 0x9100
gl_cps11_pnt = 0x9140
gl_cps21_pnt = 0x9180

gl_flash_pnt = 0x9280
gl_plbk3_pnt = 0x92c0


;==============================================
;A5 Offsets
;==============================================
;0x00
;0x02
;0x04
;0x06
;0x08
;0x0a
;0x0c
;0x0e
;0x10
;0x12
;0x13
;0x14
;0x15
;0x16
;0x17
gfxram8x8 = 0x18
gfxram16x16 = 0x1a
gfxram32x32 = 0x1c
rasterram = 0x1e
palrampointer = 0x20
;0x22
;0x23
;0x24
;0x26
;0x28
;0x2a
;0x2c

;0x32
;0x38
;0x3a

sub_palram = 0x48
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
;0x62
;0x63
;0x64


;0x72
;0x73

frame_count_const = 0x80
frame_count_game = 0x81

;==============================================
;
;==============================================
;0x82
;0x83
Dip_Debug_mode = 0x85
NetworkEnabled = 0x86
;0x87 Epprom write status
;0x88
Dip_SFAlpha = 0x89; sets names and voices to sf alpha and a-ism
;0x8a
;0x8b

Region = 0x90

;0x93

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
Dip_BGM = 0xa6

;==============================================
;
;==============================================
Active_Player = 0xa8;during character select
Active_Player_01 = 0xac;after selecting ism
; = 0xad
RngByte0 = 0xae
RngByte1 = 0xaf

; = 0xb4
; = 0xb5

Active_Player_02 = 0xb9;during stage presentation

Dip_Regulation = 0xbb
; = 0xbd
; = 0xbe
; = 0xbf
; = 0xc0
; = 0xc4
; = 0xc8

;0xd3
;0xd4
;0xd5
;0xd6

;0xd8
;==============================================
;Game Dips Extra
;==============================================
Dip_1PRounds = 0xde
Dip_2PRounds = 0xdf

; = 0xe6
; = 0xe7
; = 0xe8
;0xea
game_unlock = 0xee

;==============================================
;Game Data
;==============================================
Main_stageid = 0x100
;0x101

;0x107
;0x108
clock_counter = 0x109
clock_frames = 0x10a

;0x10d
;0x10e

Arcade_Match = 0x114
Dev_Turbo = 0x116
; = 0x118
;unused 0x119
; = 0x11a
; = 0x11c
; = 0x11d
; = 0x11e
; = 0x11f
; = 0x120
; = 0x121
; = 0x122
; = 0x123
; = 0x124
; = 0x125

; = 0x12b
; = 0x12c
; = 0x12d
; = 0x12e
; = 0x130
; = 0x133
; = 0x134
; = 0x137

Dramatic_Mode_Type = 0x138 ; word
    ;00 Regular Match
    ;02 p1 vs p3&p4
    ;04 p2 vs p3&p4
    ;06 p1&p2 vs p3

; = 0x13c

; = 0x141

; = 0x143

; = 0x146
left_hud_pointer = 0x156
right_hud_pointer = 0x158
pause_flag = 0x15c
; = 0x15d event mode gameover?

; = 0x163
Dramatic_Mode_flag = 0x168
;unused 0x169

; = 0x16a

GCrush_Timer = 0x171
StageID_01 = 0x172
StageId_02 = 0x174
; = 0x178

;==============================================
;
;==============================================
;0x182 ; byte
;0x183 ; byte
;0x184 ; long

GDebugAll = 0x1c0
G_DebugDip_A = 0x1c0
G_DebugDip_B = 0x1c1
G_DebugDip_C = 0x1c2
;unuseddebig = 0x1c3

;input01 1c4
;input01 1c5


;0x1c8 ; word copy of -$5126,a5

;0x1f6 ; long
;0x1fa ; word
;0x1fc ; byte

;unused
;0x1fd~0x1ff

;==============================================
;0x398





Sound_Buffer_Start = 0x5e80
;0x6e82

;==============================================
;Negative A5 offsets
;==============================================
;-0x43ea
;-0x43ec
;-0x50ce

;-0x5126

;-0x5162

;Arcade Progression?
;-0x707e

;==============================================
;Player Data
;==============================================

;==============================================
;unknown direct
;==============================================
;0xff0fca,0xff13ca,0xff17ca,0xff1bca
unk_ff3554 = 0xff3554
unk_ff3622 = 0xff3622

unk_ff3c0c = 0xff3c0c
;ff3c16
;unk_ff3c14 = 0xff3c14
;unk_ff3c18 = 0xff3c18
;ff3d18
