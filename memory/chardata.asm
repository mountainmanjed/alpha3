PL_Enable = 0x00 ;byte
PL_Render = 0x01 ;byte

pl_overall_state = 0x04
; = 0x04 ;byte
; = 0x05 ;byte
; = 0x06 ;byte
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
pl_in_air = 0x31
pl_cell_frame_count = 0x32
pl_anim_flags = 0x33
pl_renda_flag = 0x34 ;?
;= 0x35
;= 0x36
;= 0x37
pl_enemy = 0x38
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

;= 0x55; byte

;= 0x59
;= 0x5a

;unk = 0x5b;

pl_combo = 0x5e; getting comboed
pl_hitfreeze = 0x5f

; = 0x64 ;Deals with Y Word
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
; = 0xa4 ; word

; = 0xa6 ; word

; = 0xa8 ; byte
pl_attk_active = 0xa9 ; byte attk_active
pl_move_id = 0xaa ; byte
; = 0xab ; byte
; = 0xac
; = ae

; = 0xb8

;byte activates the cancel mechanics and hurtstun
pl_cc_cancelflag = 0xb9; side note it's 142 in sfa2

;= 0xba ;word
pl_taunt_count = 0xbc

;0xcc
;0xcd
;0xce special

;0xe4

pl_sakiyo_game = 0xeb
pl_serious_game = 0xec
;unk = 0xee
;unk = 0xef
pl_classic_game = 0xf0
; = 0xf1 ;copy of $15f


; = 0x100
; = 0x101
PL_charid = 0x102
; = 0x103
; = 0x104
; = 0x105
; = 0x106
; = 0x107

;unused = 0x108
;unused = 0x109

; = 0x10a
; 0x10b

; = 0x110
; = 0x114
PL_Buttons = 0x11a
; = 0x11b

PL_meter = 0x11e

; = 0x123 ;
; = 0x124 ;byte
PL_cpucontrol = 0x125
; = 0x126
; = 0x127

PL_Palnum = 0x128
; = 0x12a;long
; = 0x12e
; = 0x130
Pl_Sakiyo_mode = 0x131
PL_ism_choice = 0x132

;134
; 0x13c ; Long

pl_arcade_progress = 0x140

; = 0x149

;pl_survival_mode = 0x149
;pl_survival_mode = 0x14b
;0x14c ;deals with character palette data

PL_PalRam_pnt = 0x150

; = 0x158
; = 0x159
pl_serious_mode = 0x15a
; = 0x15b
; = 0x15c
; = 0x15d
pl_classic_mode = 0x15e
; = 0x15f ; doll battle?

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

;----------------------------------------------
;Char specific
;0x1e4
PL_rolentowire = 0x1e4 ;

PL_codyknife_eq = 0x1e4 ;byte if negative you have knife
PL_codyover_knf = 0x1e5;

PL_rose_groundthrow = 0x1e4 ;word extra sprite for the throw


;----------------------------------------------
;= 0x1fd


;==============================================
;AI Scripting Data
;==============================================
;= 0x200
;= 0x201
;= 0x202
;= 0x203
;= 0x204
;= 0x205
;= 0x206
;= 0x207
;= 0x208
;= 0x209
;= 0x20a
;= 0x20b 
;= 0x20c
;= 0x20d
;= 0x20e
;= 0x20f
;= 0x210 ; 20d manip
;= 0x211 ; 20c manip
;= 0x212
;= 0x213
;= 0x214
;= 0x215

;= 0x216
;= 0x217
;= 0x218 ; copy word at 0x206
;= 0x21a ; word

pl_dist_away = 0x21c

;21f

;0x238
;0x80
PL_Special_Cancel_Timer = 0x23e

;0x246
;0x248
;0x249
;0x24a

pl_guard_bar_max = 0x24c
pl_guard_bar = 0x24d

;PL_ = 0x254
PL_byte255 = 0x255
PL_Reversal_Window = 0x256

pl_invinciblity_timer = 0x25d

pl_crushed_guard = 0x26e
;0x27a


pl_collsion_counter = 0x280

;= 0x28a;

; = 0x28d;
; = 0x28e;

PL_Super_Cancel_Timer = 0x293

pl_blockstring_counter = 0x297

;0x2a6

plflash_timer = 0x2ad
plflash_status = 0x2ae

;_PNT = 0x2bc
;0x2c0

pl_crouching = 0x2c8
pl_sidecheck = 0x2c9
PL_Stun = 0x2cc
pl_stun_max = 0x2cd
; = 0x2ce; check

;stunflag = 0x2cf;  

Pl_WalkSpeed_pnt = 0x2d0
Pl_JumpData_pnt = 0x2d4;0x28692,0x2a98c

pl_inp_slot_a = 0x300
pl_inp_slot_b = 0x308

pl_combo_copy = 0x329; you're comboing

; = 0x32c ;byte
pl_throw_id = 0x32f

;0x330;word
;0x332;byte
;0x333;byte
;0x334;byte


; = 0x371
;PL_Input_Button_Press = 0x378
; = 0x379
;PL_Input_ = 0x37a

;==============================================
;Direct calls
;==============================================
PNT_P1_Memory = 0xff8400

p1memory = 0x400

p1_render = PL_Render+p1memory

p1_x = PL_X+p1memory

p1_combo = pl_combo+p1memory
p1_charid = PL_charid+p1memory
P1_Palnum = PL_Palnum+p1memory
p1_ism_choice = PL_ism_choice+p1memory
p1_arcade_progress = pl_arcade_progress+p1memory
p1_crushed_guard = pl_crushed_guard+p1memory

;==============================================
PNT_P2_Memory = 0xff8800

p2memory = 0x800

p2_render = PL_Render+p2memory

p2_x = PL_X+p2memory

p2_combo = pl_combo+p2memory
p2_charid = PL_charid+p2memory
P2_Palnum = PL_Palnum+p2memory
p2_ism_choice = PL_ism_choice+p2memory
p2_arcade_progress = pl_arcade_progress+p2memory
p2_crushed_guard = pl_crushed_guard+p2memory

;==============================================
PNT_P3_Memory = 0xff8C00

p3memory = 0xc00

p3_render = PL_Render+p3memory

p3_x = PL_X+p3memory

p3_combo = pl_combo+p3memory
p3_charid = PL_charid+p3memory
P3_Palnum = PL_Palnum+p3memory
p3_ism_choice = PL_ism_choice+p3memory
p3_arcade_progress = pl_arcade_progress+p3memory
p3_crushed_guard = pl_crushed_guard+p3memory

;==============================================
PNT_P4_Memory = 0xff9000

p4memory = 0x1000
p4_render = PL_Render+p4memory
p4_x = PL_X+p4memory

p4_combo = pl_combo+p4memory
p4_charid = PL_charid+p4memory
P4_Palnum = PL_Palnum+p4memory
p4_ism_choice = PL_ism_choice+p4memory
p4_arcade_progress = pl_arcade_progress+p4memory
p4_crushed_guard = pl_crushed_guard+p4memory

;==============================================
;Projectile Memory
;memory 0xff9400 ~ 0xffacff
;size 0x100
;slots 0x14
;==============================================


;==============================================
;Animation
;==============================================
;FrameCount = 0x00
;0x01
;0x02
;0x03
;SpriteTileMap = 0x04
;0x08
;0x09
;0x0a
;0x0b
;0x0c
;0x0d
;0x0e
;0x0f
;0x10
;0x11
;0x12
;0x13
;0x14
;0x15
;0x16
;0x17
;0x18
;0x19
;0x1a
;0x1b
;0x1c
;0x1d
;0x1e
;0x1f