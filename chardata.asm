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

; 0x64

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

PL_charid = 0x102

; = 0x11a
PL_meter = 0x11e

;0x123 ;byte
;0x124 ;byte
PL_cpucontrol = 0x125

PL_Palnum = 0x128

PL_ism_choice = 0x132
pl_arcade_progress = 0x140

PL_PalRam_pnt = 0x150
; = 0x15c

; = 0x160
; = 0x161

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

;??= 0x214

pl_dist_away = 0x21c

PL_Reversal_Window = 0x256

pl_collsion_counter = 0x280
pl_blockstring_counter = 0x297

pl_sidecheck = 0x2c9
PL_Stun = 0x2cc

Pl_WalkSpeed_pnt = 0x2d0
Pl_JumpData_pnt = 0x2d4

pl_inp_slot_a = 0x300
pl_inp_slot_b = 0x308

;= 0x32c ;byte

;371
;378
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

;Alpha 2
Sakura_id = 0x0d
Rolento_id = 0x0e
Dhalsim_id = 0x0f
Zangief_id = 0x10
Gen_id = 0x11
GenStance_id = 0x13

;Alpha 3
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

;Ism Ids
Xism_ID = -1
Aism_ID = 0
Vism_ID = 1
Sism_ID = 2