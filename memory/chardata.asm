PL_Enable = 0x00 ;byte
PL_Render = 0x01 ;byte

;= 0x06 ;byte
PL_Move_state = 0x07 ;byte
;= 0x08

;= 0x0a ;byte
PL_Flip = 0x0b ;byte
;= 0x0c ;word
;= 0x0e

PL_X = 0x10
PL_Y = 0x14

PL_spritebank = 0x1a ;word
PL_Anim_Pnt = 0x1c

;= 0x30
;= 0x31
pl_cell_frame_count = 0x32
pl_anim_flags = 0x33
pl_renda_flag = 0x34 ;?
;= 0x36
;= 0x37
;= 0x38
;= 0x39
;= 0x3a
;= 0x3b
;= 0x3c
;= 0x3d
;= 0x3e
;= 0x3f

pl_x_velocity = 0x40
pl_y_velocity = 0x44
pl_x_drag = 0x48
pl_y_drag = 0x4c

PL_HP = 0x50;word
PL_HP_copy = 0x52;word

; = 0x64
; = 0x68
;NeutralState? = 0x80
PL_Attacktype = 0x81 ;0 = Punches , 2 = Kicks
PL_ButtonStrength = 0x82 ;0 = L,2 = M,4 = H
PL_Directioninput = 0x83 ;1 = Back, 2 = Forward , 4 = Down , 8 = up
; = 0x84
; = 0x85

pl_col_head_pnt = 0x90
pl_col_body_pnt = 0x94
pl_col_legs_pnt = 0x98
pl_col_push_pnt = 0x9c
pl_col_attk_pnt = 0xa0
; = 0xa4
; = 0xa8 ; byte
; = 0xa9 ; byte
pl_move_id = 0xaa ; byte
; = 0xab ; byte
; = 0xac

;= 0xb9 ;byte
;= 0xba ;word
pl_taunt_count = 0xbc

pl_sakiyo_game = 0xeb
pl_serious_game = 0xec
pl_classic_game = 0xf0
;= = 0xf1


; = 0x100
; = 0x101
PL_charid = 0x102
; = 0x103
; = 0x104
; = 0x105
; = 0x107
; = 0x114
PL_Buttons = 0x11a
PL_meter = 0x11e

; = 0x123 ;byte
;0x124 ;byte
PL_cpucontrol = 0x125
; = 0x126
; = 0x127

PL_Palnum = 0x128
; = 0x12a;long
; = 0x12e
; = 0x130
Pl_Sakiyo_mode = 0x131
PL_ism_choice = 0x132
pl_arcade_progress = 0x140

PL_PalRam_pnt = 0x150

; = 0x158
; = 0x159
pl_serious_mode = 0x15a
; = 0x15b
; = 0x15c
; = 0x15d
pl_classic_mode = 0x15e
; = 0x15f

; = 0x160
; = 0x161
; = 0x162

; = 0x167
; = 0x168
; = 0x169

pl_inp_slot_0 = 0x180
pl_inp_slot_1 = 0x188
pl_inp_slot_2 = 0x190
pl_inp_slot_3 = 0x198
pl_inp_slot_4 = 0x1a0
pl_inp_slot_5 = 0x1a8
pl_inp_slot_6 = 0x1b0
pl_inp_slot_7 = 0x1b8
pl_inp_slot_8 = 0x1c0
pl_inp_slot_9 = 0x1c8

;0x1d0
;0x1d1
;0x1d2

rolentowire = 0x1e4 ;word
codyknife = 0x1e4 ;byte needs to be negative
rosegthrow = 0x1e4 ; addr.w
;>> 0x1fd
;??= 0x214

pl_dist_away = 0x21c

pl_gaurd_bar_max = 0x24c
pl_gaurd_bar = 0x24d

PL_Reversal_Window = 0x256

pl_crushed_gaurd = 0x26e
;0x27a


pl_collsion_counter = 0x280
pl_blockstring_counter = 0x297

pl_sidecheck = 0x2c9
PL_Stun = 0x2cc
pl_stun_max = 0x2cd

Pl_WalkSpeed_pnt = 0x2d0
Pl_JumpData_pnt = 0x2d4

pl_inp_slot_a = 0x300
pl_inp_slot_b = 0x308

; = 0x32c ;byte

; = 0x371
; = 0x378
; = 0x379
; = 0x37a
;==============================================
;IDs
;==============================================
Ryu_id = 0x00
Ken_id = 0x01
Akuma_id = 0x02
Nash_id = 0x03
Chun_id = 0x04
Adon_id = 0x05
Sodom_id = 0x06
Guy_id = 0x07

Birdie_id = 0x08
Rose_id = 0x09
Dictator_id = 0x0a
Sagat_id = 0x0b
Dan_id = 0x0c
Sakura_id = 0x0d
Rolento_id = 0x0e
Dhalsim_id = 0x0f

Zangief_id = 0x10
Gen_id = 0x11
GenStance_id = 0x13
Boxer_id = 0x15
Cammy_id = 0x16

Ehonda_id = 0x18
Blanka_id = 0x19
RMika_id = 0x1a
Cody_id = 0x1b
Claw_id = 0x1c
Karin_id = 0x1d
Juli_id = 0x1e
Juni_id = 0x1f

;Unused
;sf2_chun_id = 0x12;from sample rom
;sword_sodom_id = 0x14 ;from sample rom
;evilryu_id = 0x17 ;from later ports

;==============================================
;Ism Ids
;==============================================
Xism_ID = -1
Aism_ID = 0
Vism_ID = 1
Sism_ID = 2

;==============================================
;Stage IDs
;==============================================
Ryu_Stage  = 0x00; Japan (Sunset)
Ken_Stage  = 0x02; USA (Hotel)
Akm_Stage  = 0x04; Japan (Cave)
Nsh_Stage  = 0x06; USA (Hangar)
Chn_Stage  = 0x08; China
Adn_Stage  = 0x0A; Thailand (Temple)
Sdm_Stage  = 0x0C; USA (Japanese)
Guy_Stage  = 0x0E; USA (Metro City)
Brd_Stage  = 0x10; England
Rse_Stage  = 0x12; Italy
Boss_Stage = 0x14; Point 48106 (Night)
Sgt_Stage  = 0x16; Thailand (Statue)
Dan_Stage  = 0x18; Japan (Swings)
Sakr_Stage = 0x1A; Japan (Market at Day)
Rol_Stage  = 0x1C; USA (Military)
Sim_Stage  = 0x1E; India
Zan_Stage  = 0x20; Russia
Gen_Stage  = 0x22; Hong Kong
Hid_Stage  = 0x2A; Point 48106 (Day)
Cmy_Stage  = 0x2C; Greece
EHd_Stage  = 0x30; Japan (Sumo Ring)
Blk_Stage  = 0x32; Brazil
Rmka_Stage = 0x34; Japan (Seaside)
Cdy_Stage  = 0x36; USA (Prison)
Claw_Stage = 0x38; Spain
Kar_Stage  = 0x3A; Japan (Market at Night)