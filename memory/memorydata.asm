;Graphics
Scroll0BackG0 = 0x900000
Scroll1BackG0 = 0x904000
Scroll2BackG0 = 0x908000
MainpaletteDirect = 0x90c000
Scroll0PaletteDirect = 0x90c400
Scroll1PaletteDirect = 0x90c800
Scroll2PaletteDirect = 0x90cc00
; = 0x90d000



RasterBankDirect = 0x90e000
Scroll0BackG1Direct = 0x910000
Scroll1BackG1Direct = 0x914000
Scroll2BackG1Direct = 0x918000
; 0x91c000
; 0x920000
; 0x924000
WhiteFlashDirect = 0x928000
Palettebank3 = 0x92c000

gl_scroll00_pnt = 0x9000
gl_scroll10_pnt = 0x9040
gl_scroll20_pnt = 0x9080
gl_plbk0_pnt = 0x90c0
gl_rstrb_pnt = 0x90e0
gl_scroll01_pnt = 0x9100
gl_scroll11_pnt = 0x9140
gl_scroll21_pnt = 0x9180

gl_flash_pnt = 0x9280
gl_plbk3_pnt = 0x92c0


;==============================================
;A5 Offsets
;==============================================
Main_state_0 = 0x00
;0x02
Main_state_1 = 0x04
;0x06
Main_state_2 = 0x08
;0x0a
Main_state_3 = 0x0C
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

;0x32 ;BG layer
;0x34
;0x38
;0x3a

sub_palram = 0x48
;0x4a
;0x4c
;0x4e
;0x50
;0x52
;0x54
;0x56

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
;0x60
;0x61
;0x62
;0x63
;0x64

;0x65
;0x66
;0x67

;0x68
;0x6a
;0x6c
;0x6d unused
;0x6e 
;0x6f


;0x70
;0x72
;0x73

frame_count_const = 0x80
frame_count_game = 0x81

;==============================================
;
;==============================================
;0x82
;0x83
;0x84
Dip_Debug_mode = 0x85
NetworkEnabled = 0x86
;0x87 Epprom write status
;0x88
Dip_SFAlpha = 0x89; sets names and voices to sf alpha and a-ism
;0x8a
;0x8b

;0x8f

Region = 0x90

;0x93
;= 0x95

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
;0xa9
;0xaa
;0xab
Active_Player_01 = 0xac;after selecting ism
; = 0xad
RngByte0 = 0xae
RngByte1 = 0xaf

; = 0xb0
; = 0xb4
; = 0xb5

Active_Player_02 = 0xb9;during stage presentation
; = 0xba
Dip_Regulation = 0xbb
; = 0xbc
; = 0xbd
; = 0xbe

; = 0xbf

; = 0xc0
; = 0xc4
; = 0xc8

;0xd0
;0xd1
;0xd2
;0xd3
;0xd4
;0xd5
;0xd6
;0xd7
;0xd8;long 6c


;0xdc

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

;0x105

;0x107
;0x108
clock_counter = 0x109
clock_frames = 0x10a
;0x10b
;0x10d
;0x10e
M_Pause_Battle = 0x10f

Arcade_Match_Var = 0x114
Dev_Turbo = 0x116
; = 0x118
;unused 0x119
; = 0x11a
; = 0x11c
; = 0x11d
; = 0x11e
; = 0x11f
; = 0x120
Arc_Rng_Chr_Offset = 0x121
Arc_Rng_Ism_Offset = 0x122
; = 0x123
Set_GC_Flash_BG = 0x124
; = 0x125
; = 0x126
; = 0x127 ;unused
; = 0x128 ;word
; = 0x12a

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

; = 0x13a
; = 0x13c
; = 0x13e
; = 0x13f
; = 0x140
; = 0x141

; = 0x143

; = 0x146
; = 0x149

left_hud_pointer = 0x156
right_hud_pointer = 0x158
m_unk15c = 0x15c
; = 0x15d event mode gameover?

; = 0x162
; = 0x163
Dramatic_Mode_flag = 0x168
;unused 0x169

; = 0x16a

Reset_GaurdTag = 0x170
GCrush_Timer = 0x171
StageID_01 = 0x172
StageId_02 = 0x174

Char_Sel_PalID = 0x176
; = 0x178

;==============================================
;
;==============================================
;0x182 ; byte
;0x183 ; byte
;0x184 ; long


;==============================================
;Debug Dips
;==============================================
GDebugAll = 0x1c0
G_DebugDip_A = 0x1c0
G_DebugDip_B = 0x1c1
G_DebugDip_C = 0x1c2
;unuseddebig = 0x1c3

;===============================================
;Debug A
;0x80 Slow Mode 2
;0x40 Slow Mode 1
;0x20 Limit Off
;0x10  8x8  grid
;0x08 16x16 grid
;0x04 32x32 grid
;0x02 add 1 to p2 character id when reseting fight
;0x01 Tracking Display 

;----------------------------------------------
;Debug B
;0x80 Disable Timer
;0x40 No Damage
;0x20 Auto Block

;Force Stage
;0x1f

;----------------------------------------------
;Debug C
;0x80 show collision and axis
;0x40 Performance display
;0x20 Player location data and more
;0x10 Graphic Data
;0x08 Audio Log
;0x04 Disable Hud
;0x02 infinite meter
;0x01 Debug Mode


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

;==============================================
;0x0400 ff8400 Player 1
;0x0800 ff8800 Player 2
;0x0c00 ff8c00 Player 3
;0x1000 ff9000 Player 4

;==============================================
;0x1400 ff9400 Projectile

;==============================================
;Hud stuff
;==============================================
Hud_start = 0x5000 ;ffd000
;active = 0x0
;render = 0x1
;uknown = 0x9

Hud_offset = 0x200

;ffd000
;ffd200
;ffd400
;ffd600 Meter
;ffd800 Lifebar Back
;ffda00 Gaurd Bar
;ffdc00 Lifebar Front

;==============================================
Sound_Buffer_Start = 0x5e80; ffde80
;0x6e82

;PSHL = 0x6eb6
;ESHL = 0x6eb7
;SIGN = 0x6eb8
;SET = 0x6eb9
;SOBJ = 0x6eba
;EFCT = 0x6ebb
;VRAM = 0x6ebc


;==============================================
;Negative A5 offsets
;==============================================
;-0x43ea
;-0x43ec
;-0x50ce

;-0x5126

;-0x5162


Arcade_Opp_List0 = -0x707e
Arcade_Opp_List1 = -0x707a
Arcade_Opp_List2 = -0x7076

Arcade_Ism_List0 = -0x705e
Arcade_Ism_List1 = -0x705a
Arcade_ism_List2 = -0x7056

;-0x7ba0
;-0x7da4

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

