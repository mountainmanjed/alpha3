	include "char/Ryu/Varibles.68K"

;##############################################
;Winpose
;##############################################
loc_033fea:
	move.b ($6,a6),d0
	move.w loc_033ff6(pc,d0.w),d1
	jmp loc_033ff6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033ff6:
	dc.w loc_033ffe-loc_033ff6
	dc.w loc_034010-loc_033ff6
	dc.w loc_034026-loc_033ff6
	dc.w loc_03412e-loc_033ff6

;----------------------------------------------
loc_033ffe:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_034010:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_034020
	tst.b ($11c,a5)
	bne.b loc_034020
	addq.b #2,(6,a6)

loc_034020:
	jmp loc_02a7ea

;----------------------------------------------
loc_034026:
	addq.b #2,(6,a6)
	movea.w (pl_enemy,a6),a4
	move.b #$3c,($3a,a6)
	cmpi.b #$a,($2c4,a6)
	beq.w loc_034056
	tst.b ($2c4,a6)
	bne.w loc_0340f6
	tst.b ($1fd,a6)
	bne.w loc_034120
	tst.b ($125,a4)
	bne.w loc_0340e0

loc_034056:
	tst.b ($10d,a5)
	bne.w loc_0340e0
	cmpi.b #Ken_id,(PL_charid,a4)
	bne.w loc_0340e0
	tst.b ($105,a5)
	beq.w loc_0340e0
	tst.w (PL_meter,a6)
	bne.w loc_0340e0
	moveq #0,d0
	move.b (PL_Flip,a6),d0
	move.b ($b,a4),d1
	cmp.b d0,d1
	beq.w loc_0340e0
	move.w (PL_X,a6),d0
	move.w ($10,a4),d1
	sub.w d0,d1
	addi.w #$70,d1
	move.w #$e0,d0
	cmp.w d1,d0
	bcc.w loc_0340e0
	move.b #$e,($2c4,a6)
	moveq #0,d0
	move.b d0,(PL_Flip,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	move.l d0,(pl_y_drag,a6)
	move.l #$fffd0000,d0
	move.w (PL_X,a6),d1
	move.w ($10,a4),d2
	cmp.w d1,d2
	bcs.w loc_0340d4
	move.b #1,(PL_Flip,a6)
	neg.l d0

loc_0340d4:
	move.l d0,(pl_x_velocity,a6)
	moveq #2,d0
	jmp loc_02a708

loc_0340e0:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_034108(pc,d0.w),d0
	addq.b #1,d0
	add.w d0,d0
	move.b d0,($2c4,a6)

loc_0340f6:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	ext.w d0
	move.b loc_034118(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034108:
	dc.b $00,$04,$03,$02
	dc.b $01,$00,$04,$03
	dc.b $02,$01,$00,$04
	dc.b $03,$02,$01,$00

loc_034118:
	dc.b $23,$23,$24,$25
	dc.b $23,$24,$25,$23

;----------------------------------------------
loc_034120:
	move.b #$10,($2c4,a6)
	moveq #$26,d0
	jmp loc_02a708

;----------------------------------------------
loc_03412e:
	move.b ($2c4,a6),d0
	move.w loc_03413a(pc,d0.w),d1
	jmp loc_03413a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03413a:
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_03414c-loc_03413a
	dc.w loc_034166-loc_03413a;2c

	dc.w loc_03414c-loc_03413a

;==============================================
loc_03414c:
	tst.b ($3a,a6)
	beq.b loc_034160
	subq.b #1,($3a,a6)
	bne.b loc_034160
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_034160:
	jmp loc_02a7ea

;==============================================
loc_034166:
	move.b (PL_Move_state,a6),d0
	move.w loc_034172(pc,d0.w),d1
	jmp loc_034172(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034172:
	dc.w loc_034176-loc_034172
	dc.w loc_0341cc-loc_034172

;----------------------------------------------
loc_034176:
	movea.w (pl_enemy,a6),a4
	move.w (PL_X,a6),d0
	move.w ($10,a4),d1
	sub.w d0,d1
	addi.w #$50,d1
	move.w #$a0,d0
	cmp.w d1,d0
	bcs.w loc_0341be
	move.w ($10,a4),d0
	addi.w #$50,d0
	tst.b (PL_Flip,a6)
	beq.b loc_0341a4
	subi.w #$a0,d0

loc_0341a4:
	move.w d0,(PL_X,a6)
	addq.b #2,(PL_Move_state,a6)
	moveq #$31,d0
	jsr loc_02a708
	moveq #0,d1
	moveq #$32,d0
	jmp loc_02a838

loc_0341be:
	move.l (pl_x_velocity,a6),d0
	add.l d0,(PL_X,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0341cc:
	tst.b ($3a,a6)
	beq.b loc_0341e0
	subq.b #1,($3a,a6)
	bne.b loc_0341e0
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0341e0:
	jsr loc_02a7ea
	jmp loc_02a8c6

;==============================================
;
;==============================================
loc_0341ec:
	move.b (6,a6),d0
	move.w loc_0341f8(pc,d0.w),d1
	jmp loc_0341f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0341f8:
	dc.w loc_034202-loc_0341f8
	dc.w loc_03425a-loc_0341f8
	dc.w loc_034272-loc_0341f8
	dc.w loc_0342be-loc_0341f8
	dc.w loc_034324-loc_0341f8

;----------------------------------------------
loc_034202:
	addq.b #2,(6,a6)
	moveq #0,d0
	movea.w (pl_enemy,a6),a4
	cmpi.b #Sagat_id,(PL_charid,a4)
	bne.b loc_03421a
	tst.b ($125,a4)
	bne.b loc_034254

loc_03421a:
	moveq #$22,d0
	cmpi.b #Ken_id,(PL_charid,a4)
	bne.b loc_034254
	move.b #4,(6,a6)
	move.b #2,($3a,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	moveq #1,d1
	tst.b ($101,a6)
	beq.b loc_034246
	move.w #$120,d0
	moveq #0,d1

loc_034246:
	add.w ($10,a3),d0
	move.w d0,(PL_X,a6)
	move.b d1,(PL_Flip,a6)
	moveq #$30,d0

loc_034254
	jmp loc_02a708

;----------------------------------------------
loc_03425a:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	move.l #$2000000,(pl_overall_state,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_034272:
	movea.w (pl_enemy,a6),a4
	move.w (PL_X,a6),($10,a4)
	move.b (PL_Flip,a6),($b,a4)
	tst.b (pl_anim_flags,a6)
	bpl.b loc_0342b2
	subq.b #1,($3a,a6)
	bpl.b loc_0342b2
	addq.b #2,(6,a6)
	eori.b #1,(PL_Flip,a6)
	move.b #1,($67,a6)
	move.b #1,($67,a4)
	moveq #0,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_0342b2:
	jsr loc_02a7ea
	jmp loc_02a8c6

;----------------------------------------------
loc_0342be:
	movea.w (pl_enemy,a6),a4
	tst.b ($35,a6)
	beq.b loc_034318
	addq.b #2,(6,a6)
	move.b #7,($3a,a6)
	eori.b #1,($b,a4)
	clr.b ($67,a6)
	clr.b ($67,a4)
	move.l #$20000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffffc000,(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_03430e
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_03430e:
	moveq #$18,d0
	moveq #4,d1
	jmp loc_02a838

loc_034318:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_034324:
	movea.w (pl_enemy,a6),a4
	move.l (pl_x_velocity,a6),d0
	add.l d0,($10,a4)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	move.l (pl_y_velocity,a6),d0
	add.l d0,($14,a4)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a4),d0
	bcs.b loc_034382
	move.w d0,($14,a4)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w d0,($16,a4)
	move.w ($40,a4),($10,a4)
	clr.b ($3c,a4)
	move.b #2,(6,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$22,d0
	jmp loc_02a708

loc_034382:
	subq.b #1,($3a,a6)
	bpl.b loc_03438e
	jsr loc_02a8c6

loc_03438e:
	jmp loc_02a7ea


;##############################################
;Normal Programming
;##############################################
loc_034394:
	tst.b ($80,a6)
	bne.w loc_03460c
	clr.b (pl_crouching,a6)
	tst.b (PL_Attacktype,a6)
	bne.w loc_0344c4
	move.b (PL_Move_state,a6),d0
	move.w loc_0343b4(pc,d0.w),d1
	jmp loc_0343b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0343b4:
	dc.w loc_0343bc-loc_0343b4
	dc.w loc_034472-loc_0343b4
	dc.w loc_034478-loc_0343b4
	dc.w loc_03449e-loc_0343b4

;----------------------------------------------
loc_0343bc:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	btst.b #1,(PL_Directioninput,a6)
	beq.b loc_03441c
	cmpi.b #2,(PL_ButtonStrength,a6)
	beq.b loc_034406
	tst.b (PL_ism_choice,a6)
	beq.b loc_03441c
	cmpi.b #4,(PL_ButtonStrength,a6)
	bne.b loc_03441c
	move.b #6,(PL_Move_state,a6)
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$21,d0
	jmp Set_Spec_Cancel_Timers

loc_034406:
	move.b #4,(PL_Move_state,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_03441c:
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03444c
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03444c
	btst.b #0,(PL_Directioninput,a6)
	bne.b loc_034466
	bra.b loc_034464

loc_03444c:
	move.w loc_03446c(pc,d1.w),d3
	cmpi.b #-1,(PL_ism_choice,a6)
	bne.b loc_03445c
	move.w loc_03446c(pc,d1.w),d3

loc_03445c:
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d3
	bcc.b loc_034466

loc_034464:
	addq.b #1,d0

loc_034466:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03446c:
	dc.w $0018,$0038,$003a

;----------------------------------------------
loc_034472:
	jmp loc_02f5ac

;----------------------------------------------
;6+MP Movement
;----------------------------------------------
loc_034478:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	tst.b ($35,a6)
	beq.b loc_034498
	move.l #$20000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_034494
	neg.l d0

loc_034494:
	add.l d0,(PL_X,a6)

loc_034498
	jmp loc_02a7ea

;----------------------------------------------
;6+HP Movement
;----------------------------------------------
loc_03449e:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	tst.b ($35,a6)
	beq.b loc_0344be
	move.l #$38000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0344ba
	neg.l d0

loc_0344ba:
	add.l d0,(PL_X,a6)

loc_0344be:
	jmp loc_02a7ea

;==============================================
;Kick Programming
;==============================================
loc_0344c4:
	move.b (PL_Move_state,a6),d0
	move.w loc_0344d0(pc,d0.w),d1
	jmp loc_0344d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0344d0:
	dc.w loc_0344d8-loc_0344d0
	dc.w loc_03458e-loc_0344d0
	dc.w loc_034594-loc_0344d0
	dc.w loc_0345f8-loc_0344d0

;----------------------------------------------
loc_0344d8:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.w loc_034544
	cmpi.b #2,(PL_ButtonStrength,a6)
	bne.b loc_034544
	btst.b #1,(PL_Directioninput,a6)
	beq.b loc_034544
	move.b #4,(PL_Move_state,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.l #$36000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_034524
	neg.l d1

loc_034524:
	move.l d1,(pl_x_velocity,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	clr.b ($5b,a6)
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

loc_034544:
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	moveq #6,d0
	move.b (PL_ButtonStrength,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_034574
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_034574
	btst.b #0,(PL_Directioninput,a6)
	bne.b loc_034582
	bra.b loc_034580

loc_034574:
	move.w loc_034588(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_034582

loc_034580:
	addq.b #1,d0

loc_034582:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034588:
	dc.w $0030,$0030,$0030

;----------------------------------------------
loc_03458e:
	jmp loc_02f5ac

;----------------------------------------------
loc_034594:
	tst.b ($5b,a6)
	beq.b loc_0345a6
	clr.b ($5b,a6)
	moveq #$d,d0
	jsr loc_0038e4

loc_0345a6:
	tst.b ($35,a6)
	bne.w loc_035986
	move.b #1,(pl_in_air,a6)
	move.l (pl_x_velocity,a6),d0
	add.l d0,(PL_X,a6)
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	move.w ($64,a6),d0
	cmp.w (PL_Y,a6),d0
	bcs.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	move.w ($64,a6),(PL_Y,a6)
	clr.b (pl_in_air,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_0345f8:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================
loc_03460c:
	move.b #1,(pl_crouching,a6)
	move.b (PL_Move_state,a6),d0
	move.w loc_03461e(pc,d0.w),d1
	jmp loc_03461e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03461e:
	dc.w loc_034622-loc_03461e
	dc.w loc_03465e-loc_03461e

;----------------------------------------------
loc_034622:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	tst.b (PL_Attacktype,a6)
	beq.b loc_034654
	addq.b #3,d1

loc_034654:
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03465e:
	jmp loc_02f5ac

;##############################################
;Air Normals 
;##############################################
loc_034664:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_034672
	btst.b #3,($20a,a6)
	bne.b loc_0346b4

loc_034672:
	move.b #6,(PL_Move_state,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_03469c
	moveq #$18,d0

loc_03469c:
	tst.b (PL_Attacktype,a6)
	beq.b loc_0346a4
	addq.w #3,d0

loc_0346a4:
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

loc_0346b4:
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_AirTatsu_ID,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_034b52

;##############################################
;Special Move Inputs and ID Writes
;loc 346cc
;##############################################
loc_0346cc:
	jsr SPButton_Vism_code
	bne.w loc_034792

loc_0346d6:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_21421K_code
	bne.w loc_0349f6

loc_0346e4:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_0349ba

loc_0346f2:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_034a6a

loc_034700:
	tst.b (pl_cc_cancelflag,a6)
	bne.b Ryu_CC_Priority_Shuffle

	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623P_code
	bne.w loc_0348aa

loc_034714:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_41236P_code
	bne.w Ryu_RedFireball_Write

loc_034722:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_236P_code
	bne.w loc_0348dc

loc_034730:
	bra.b loc_03475c

Ryu_CC_Priority_Shuffle:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_41236P_code
	bne.w Ryu_RedFireball_Write

loc_034740:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_236P_code
	bne.w loc_0348dc

loc_03474e:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623P_code
	bne.w loc_0348aa

loc_03475c:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_214K_code
	bne.w loc_034a28

loc_03476a:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_236_code
	bne.w loc_03498c

loc_034778:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_034820

loc_034786:
	jsr SPButton_Taunt_code
	bne.w loc_0347f6

loc_034790:
	rts

;==============================================
;Vism Activate ID Write
;loc 34792
;==============================================
loc_034792:
	tst.b ($28a,a6)
	bne.w loc_0346d6
	tst.b (pl_in_air,a6)
	bne.w Ryu_AirVism_activate
	jsr loc_02ef54
	beq.w loc_0346d6
	jsr loc_02ecd8
	beq.w loc_0346d6
	move.l #$2001000,(pl_overall_state,a6)
	move.b #Ryu_Vism_Val,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

Ryu_AirVism_activate:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_0346d6
	jsr loc_02ed28
	beq.w loc_0346d6
	move.l #$2001000,(pl_overall_state,a6)
	move.b #Ryu_Vism_Val,(pl_move_id,a6)
	jmp loc_02f980

;==============================================
loc_0347f6:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_034802
	tst.b (pl_taunt_count,a6)
	beq.b loc_034790

loc_034802:
	jsr loc_02ed00
	beq.b loc_034790
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_Taunt_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
;Alpha Counter Writes
;loc 34820
;==============================================
loc_034820:
	jsr loc_02edf8
	beq.w loc_034786

loc_03482a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_034870
	move.l #$2000e0a,(pl_overall_state,a6)
	clr.b (pl_move_id,a6);Dragon punch
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,(PL_ButtonStrength,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w (pl_enemy,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,(pl_invinciblity_timer,a6)
	moveq #$16,d0
	jmp Set_Char_Special_Ani

loc_034870:
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_AC_Sweep_ID,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w (pl_enemy,a6),a4
	move.b #$16,(pl_hitfreeze,a4)
	move.b #$1a,(pl_invinciblity_timer,a6)
	moveq #$16,d0
	jmp Set_Char_Special_Ani

;==============================================
;Shoryken Write
;loc 348aa
;==============================================
loc_0348aa:
	jsr loc_02ed00
	bne.b loc_0348be
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_034714
	bra.w loc_03475c

loc_0348be:
	move.l #$2000e00,(pl_overall_state,a6)
	clr.b (pl_move_id,a6);Write Shoryuken
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;==============================================
;Hadouken Write 
;loc 348dc
;==============================================
loc_0348dc:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0348f6
	tst.b ($238,a6)
	bne.w loc_034730
	jsr loc_02ed00
	bne.b loc_034912
	bra.w loc_034730

loc_0348f6:
	cmpi.b #2,($238,a6)
	bcc.b loc_034906
	jsr loc_02ed00
	bne.b loc_034912

loc_034906:
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_034730
	bra.w loc_03474e

loc_034912:
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_Hadou_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
;Red Fireball
;loc 34932
;==============================================
Ryu_RedFireball_Write:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03494e
	tst.b ($238,a6)
	bne.w loc_034722
	jsr loc_02ed00
	bne.w loc_03496c
	bra.w loc_034722

loc_03494e:
	cmpi.b #2,($238,a6)
	bcc.w loc_034960
	jsr loc_02ed00
	bne.b loc_03496c

loc_034960:
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_034722
	bra.w loc_034740

loc_03496c:
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_Hadou2_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728


;==============================================
;
;loc 3498c
;==============================================
loc_03498c:
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.w loc_034778
	jsr loc_02ed00
	beq.w loc_034778
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #Ryu_Fake_Hadou_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_attk_active,a6)
	rts

;==============================================
;
;loc 349ba
;==============================================
loc_0349ba:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_0346f2
	tst.b ($238,a6)
	bne.w loc_0346f2
	jsr loc_02ecd8
	beq.w loc_0346f2
	move.l #$2001000,(pl_overall_state,a6)
	move.b #Ryu_Shin_Hadou_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
;
;loc 349f6
;==============================================
loc_0349f6:
	tst.b (PL_ism_choice,a6)
	bne.w loc_0346e4
	jsr loc_02ecd8
	beq.w loc_0346e4
	move.l #$2001000,(pl_overall_state,a6)
	move.b #Ryu_Shin_Tatsu_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
;
;loc 34a28
;==============================================
loc_034a28:
	tst.b (pl_in_air,a6)
	beq.b loc_034a40
	jsr loc_02ed28
	beq.w loc_03476a
	move.b #Ryu_AirTatsu_ID,(pl_move_id,a6)
	bra.b loc_034a56

loc_034a40:
	jsr loc_02ed00
	beq.w loc_03476a
	move.b #Ryu_Tastu_ID,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_034a56:
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
;
;loc 34a6a
;==============================================
loc_034a6a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_034700
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_034700
	jsr loc_02ecd8
	beq.w loc_034700
	move.l #$2001000,(pl_overall_state,a6)
	move.b #Ryu_Shin_Shoryu_id,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,(PL_ButtonStrength,a6)
	move.b #4,($248,a6)
	rts

;==============================================
;Ism and meter checks
;==============================================
loc_034aae:
	move.b (pl_move_id,a6),d0
	move.w loc_034aba(pc,d0.w),d1
	jmp loc_034aba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034aba:
	dc.w loc_034ad2-loc_034aba;00 Dragon Punch
	dc.w loc_034ae4-loc_034aba;02 Hadouken
	dc.w loc_034ad2-loc_034aba;04 Tatsu
	dc.w loc_034af0-loc_034aba;06 Air Tatsu
	dc.w loc_034afc-loc_034aba;08 Shinku Hadou
	dc.w loc_034b12-loc_034aba;0a Shinku Tatsu
	dc.w loc_034b3e-loc_034aba;0c Taunt
	dc.w loc_034ad2-loc_034aba;0e Alpha Counter Sweep

	dc.w loc_034ad2-loc_034aba;10 Vism Activate
	dc.w loc_034ad6-loc_034aba;12 Fake Hadouken
	dc.w loc_034ae4-loc_034aba;14 Hadouken 2
	dc.w loc_034b28-loc_034aba;16 Shinku Shoryu

;----------------------------------------------
loc_034ad2:
	bra.w loc_034b4a

;----------------------------------------------
loc_034ad6:
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034ae4:
	tst.b ($238,a6)
	bne.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034af0:
	tst.b (pl_in_air,a6)
	beq.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034afc:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_034b4e
	tst.b ($238,a6)
	bne.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034b12:
	tst.b (PL_ism_choice,a6)
	bne.w loc_034b4e
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034b28:
	tst.b (PL_ism_choice,a6)
	bne.w loc_034b4e
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_034b4e
	bra.w loc_034b4a

;----------------------------------------------
loc_034b3e:
	tst.b (pl_taunt_count,a6)
	beq.w loc_034b4e
	bra.w loc_034b4a

;==============================================
loc_034b4a:
	moveq #1,d0
	rts

loc_034b4e:
	moveq #0,d0
	rts

;==============================================
;Special Move Programming
;==============================================
loc_034b52:
	move.b (pl_move_id,a6),d0
	move.w loc_034b5e(pc,d0.w),d1
	jmp loc_034b5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034b5e:
	dc.w loc_034b76-loc_034b5e;00 Dragon Punch
	dc.w loc_034cf2-loc_034b5e;02 Hadouken
	dc.w loc_034eb2-loc_034b5e;04 Tatsu
	dc.w loc_034fc6-loc_034b5e;06 Air Tatsu
	dc.w loc_03513a-loc_034b5e;08 Shinku Hadou
	dc.w loc_035282-loc_034b5e;0a Shinku Tatsu
	dc.w loc_0353d8-loc_034b5e;0c Taunt
	dc.w loc_035424-loc_034b5e;0e Alpha Counter Sweep

	dc.w loc_03546a-loc_034b5e;10 Vism Activate
	dc.w loc_0354ec-loc_034b5e;12 Fake Hadouke
	dc.w loc_034cf2-loc_034b5e;14 Hadouken 2
	dc.w loc_035522-loc_034b5e;16 Shinku Shoryu

;==============================================
;00 Dragon Punch Programming
;==============================================
loc_034b76:
	move.b (PL_Move_state,a6),d0
	move.w loc_034b82(pc,d0.w),d1
	jmp loc_034b82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034b82:
	dc.w loc_034b8e-loc_034b82
	dc.w loc_034bfa-loc_034b82
	dc.w loc_034c10-loc_034b82
	dc.w loc_034c42-loc_034b82
	dc.w loc_034c7a-loc_034b82
	dc.w loc_034c96-loc_034b82

;----------------------------------------------
loc_034b8e:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addq.b #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,(pl_x_drag,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	move.b (PL_ButtonStrength,a6),d1
	ext.w d1
	lsl.w #2,d1
	move.l loc_034be2(pc,d1.w),(pl_x_velocity,a6)
	move.l loc_034be2+4(pc,d1.w),(pl_y_velocity,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addq.b #4,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034be2:
	dc.l $00040000,$00050000
	dc.l $00060000,$00070000
	dc.l $00080000,$00090000
;			  xmov,ymov
;----------------------------------------------
loc_034bfa:
	tst.b ($35,a6)
	bne.b loc_034c0a
	addq.b #2,(PL_Move_state,a6)
	move.b #1,(pl_in_air,a6)

loc_034c0a:
	jmp loc_02a7ea

;----------------------------------------------
loc_034c10:
	bsr.w loc_034ce0
	move.w ($64,a6),d0
	cmp.w (PL_Y,a6),d0
	bcc.b loc_034c5a
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_034c2a
	neg.l d0

loc_034c2a:
	add.l d0,(PL_X,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.b loc_034c3c
	addq.b #2,(PL_Move_state,a6)

loc_034c3c:
	jmp loc_02a7ea

;----------------------------------------------
loc_034c42:
	bsr.w loc_034ce0
	move.w ($64,a6),d0
	cmp.w (PL_Y,a6),d0
	bcc.b loc_034c5a
	tst.b ($35,a6)
	beq.w loc_034cda
	rts

loc_034c5a:
	addq.b #2,(PL_Move_state,a6)
	clr.b (pl_in_air,a6)
	move.w d0,(PL_Y,a6)
	clr.b (pl_attk_active,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	jmp loc_02a7ea

;----------------------------------------------
loc_034c7a:
	tst.b (pl_anim_flags,a6)
	bpl.b loc_034c8a
	jsr loc_02e35a
	bra.w loc_03597a

loc_034c8a:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_034c96:
	tst.b (pl_anim_flags,a6)
	bpl.b loc_034cca
	move.b #2,(PL_Move_state,a6)
	move.l #$80000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	move.l #$90000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #$17,d0
	jmp Set_Char_Special_Ani

loc_034cca:
	tst.b ($35,a6)
	beq.b loc_034cda
	clr.b ($35,a6)
	jsr loc_080e8e

loc_034cda:
	jmp loc_02a7ea

;==============================================
loc_034ce0:
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	rts

;==============================================
;02 Hadouken
;==============================================
loc_034cf2:
	move.b (PL_Move_state,a6),d0
	move.w loc_034cfe(pc,d0.w),d1
	jmp loc_034cfe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034cfe:
	dc.w loc_034d04-loc_034cfe
	dc.w loc_034d40-loc_034cfe
	dc.w loc_034e8e-loc_034cfe

;----------------------------------------------
loc_034d04:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$11,d0
	cmpi.b #Ryu_Hadou2_ID,(pl_move_id,a6)
	beq.b loc_034d30
	moveq #$10,d0

loc_034d30:
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_034d40:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_034e6c
	addq.b #2,(PL_Move_state,a6)
	move.b #3,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_034e6c
	addq.b #1,(a4)
	move.w #0,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b (PL_ButtonStrength,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w (PL_X,a6),($10,a4)
	move.w (PL_Y,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	bsr.w loc_034e6e
	cmpi.b #Ryu_Hadou2_ID,(pl_move_id,a6)
	bne.b loc_034dce
	addi.b #$16,($72,a4)

loc_034dce:
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_034e6c

;Custom Combo
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_034e6c
	jsr loc_01c1c8
	beq.b loc_034e6c
	addq.b #1,(a4)
	move.w #0,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b (PL_ButtonStrength,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w (PL_X,a6),($10,a4)
	move.w (PL_Y,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	bsr.w loc_034e6e
	move.b ($2a7,a6),($dc,a4)
	cmpi.b #Ryu_Hadou2_ID,(pl_move_id,a6)
	bne.b loc_034e64
	addi.b #$16,($72,a4)

loc_034e64:
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_034e6c:
	rts

;==============================================
loc_034e6e:
	moveq #$c,d0
	cmpi.b #$14,(PL_Move_state,a6)
	bne.w loc_034e7c
	moveq #$e,d0

loc_034e7c:
	move.b d0,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_034e8e:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	tst.b ($3a,a6)
	beq.b loc_034ea6
	subq.b #1,($3a,a6)
	bne.b loc_034eac
	clr.b ($ce,a6)

loc_034ea6:
	jsr loc_02f6f8

loc_034eac:
	jmp loc_02a7ea

;==============================================
;Special Move 04
;==============================================
loc_034eb2:
	move.b (PL_Move_state,a6),d0
	move.w loc_034ebe(pc,d0.w),d1
	jmp loc_034ebe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034ebe:
	dc.w loc_034ec8-loc_034ebe
	dc.w loc_034f2e-loc_034ebe
	dc.w loc_034f64-loc_034ebe
	dc.w loc_034f8a-loc_034ebe
	dc.w loc_034fb2-loc_034ebe

;----------------------------------------------
loc_034ec8:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.w ($16,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.b #1,(pl_in_air,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	move.l loc_034f22(pc,d0.w),d0
	tst.b (PL_Flip,a6)
	bne.b loc_034f16
	neg.l d0

loc_034f16:
	move.l d0,(pl_x_velocity,a6)
	moveq #7,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034f22:
	dc.l $00028000,$00032000,$0003c000

;----------------------------------------------
loc_034f2e:
	move.l (pl_x_velocity,a6),d0
	add.l d0,(PL_X,a6)
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	bpl.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	lsr.w #1,d1
	move.b d1,($1fe,a6)
	moveq #9,d0
	add.b d1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_034f64:
	tst.b (pl_anim_flags,a6)
	bpl.b loc_034f7c
	subq.b #1,($1fe,a6)
	bpl.b loc_034f7c
	addq.b #2,(PL_Move_state,a6)
	moveq #8,d0
	jmp Set_Char_Special_Ani

loc_034f7c:
	move.l (pl_x_velocity,a6),d0
	add.l d0,(PL_X,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_034f8a:
	bsr.w loc_035118
	bcs.w loc_035986
	jsr loc_00369c
	move.w ($64,a6),(PL_Y,a6)
	clr.w ($16,a6)
	clr.b (pl_in_air,a6)
	addq.b #2,(PL_Move_state,a6)
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_034fb2:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================
;Special Move 06
;==============================================
loc_034fc6:
	move.b (PL_Move_state,a6),d0
	move.w loc_034ff2(pc,d0.w),d1
	jsr loc_034ff2(pc,d1.w)
	tst.b ($1ff,a6)
	beq.b loc_034ff0
	tst.w (pl_y_velocity,a6)
	bpl.b loc_034ff0
	move.w (PL_Y,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$10,d0
	bcc.b loc_034ff0
	clr.b ($1ff,a6)

loc_034ff0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_034ff2:
	dc.w loc_034ffc-loc_034ff2
	dc.w loc_03509a-loc_034ff2
	dc.w loc_0350bc-loc_034ff2
	dc.w loc_0350d6-loc_034ff2
	dc.w loc_035104-loc_034ff2

;----------------------------------------------
loc_034ffc:
	addq.b #2,(PL_Move_state,a6)
	clr.b ($1ff,a6)
	move.b #1,($ce,a6)
	tst.w (pl_y_velocity,a6)
	bpl.b loc_035024
	move.w (PL_Y,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$30,d0
	bcs.b loc_03502c
	move.b #1,($1ff,a6)

loc_035024:
	moveq #9,d0
	jsr loc_0038e4

loc_03502c:
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_035068(pc,d0.w),d1
	move.l loc_035068+4(pc,d0.w),(pl_y_drag,a6)
	tst.b ($3c,a6)
	bpl.b loc_03505c
	move.l (pl_x_velocity,a6),d0
	asr.l #1,d0
	move.l d0,(pl_x_velocity,a6)

loc_03505c:
	tst.l (pl_x_velocity,a6)
	beq.b loc_035080
	bpl.b loc_035088
	neg.l d1
	bra.b loc_035088

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_035068:
	dc.l $00010000,$ffffb000
	dc.l $00018000,$ffffc000
	dc.l $00020000,$ffffd000

;##############################################
loc_035080:
	tst.b (PL_Flip,a6)
	bne.b loc_035088
	neg.l d1

loc_035088:
	add.l d1,(pl_x_velocity,a6)
	move.b #2,($1fe,a6)
	moveq #$d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03509a:
	bsr.w loc_035118
	bcc.b loc_0350de
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	subq.b #1,($1fe,a6)
	bne.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	moveq #$f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0350bc:
	bsr.w loc_035118
	bcc.b loc_0350de
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	moveq #$21,d0
	jmp loc_02a708

;----------------------------------------------
loc_0350d6:
	bsr.w loc_035118
	bcs.w loc_035986

loc_0350de:
	move.b #8,(PL_Move_state,a6)
	move.w ($64,a6),(PL_Y,a6)
	clr.w ($16,a6)
	clr.b (pl_in_air,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_035104:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	jsr loc_02e35a
	jmp loc_02baf2

;##############################################
loc_035118:
	move.l (pl_x_velocity,a6),d0
	add.l d0,(PL_X,a6)
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	move.w ($64,a6),d0
	cmp.w (PL_Y,a6),d0
	rts

;==============================================
;Special Move 08
;==============================================
loc_03513a:
	move.b (PL_Move_state,a6),d0
	move.w loc_035146(pc,d0.w),d1
	jmp loc_035146(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_035146:
	dc.w loc_03514e-loc_035146
	dc.w loc_035176-loc_035146
	dc.w loc_03519e-loc_035146
	dc.w loc_0351cc-loc_035146

;----------------------------------------------
loc_03514e:
	addq.b #2,(PL_Move_state,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$27,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035176:
	tst.b ($34,a6)
	beq.b loc_035198
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03518a
	moveq #1,d0

loc_03518a:
	move.b d0,($ab,a6)
	moveq #$19,d0
	moveq #$3e,d1
	jsr loc_082f74

loc_035198
	jmp loc_02a7ea

;----------------------------------------------
loc_03519e:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_0351c6
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_0351c0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_0351c0:
	move.b loc_0351c8(pc,d0.w),(pl_invinciblity_timer,a6)

loc_0351c6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0351c8:
	dc.b $02,$04,$06
	even

;----------------------------------------------
loc_0351cc:
	jsr loc_02a7ea
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	bne.w loc_03527a
	tst.b ($35,a6)
	beq.w loc_03527a
	clr.w ($34,a6)
	jsr loc_01c1c8
	beq.w loc_03527a
	addq.b #1,(a4)
	move.w #2,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($59,a6),($59,a4)
	moveq #6,d0
	add.b (PL_ButtonStrength,a6),d0
	move.b d0,($72,a4)
	move.b (PL_ButtonStrength,a6),d0
	lsr.w #1,d0
	addq.w #2,d0
	move.w d0,($50,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w (PL_X,a6),($10,a4)
	move.w (PL_Y,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_03527c(pc,d0.w),d0
	move.b d0,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)

loc_03527a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03527c:
	dc.w $000c,$000e,$0010

;==============================================
;Special Move 0a
;==============================================
loc_035282:
	move.b (PL_Move_state,a6),d0
	move.w loc_03528e(pc,d0.w),d1
	jmp loc_03528e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03528e:
	dc.w loc_03529c-loc_03528e
	dc.w loc_0352ce-loc_03528e
	dc.w loc_0352fc-loc_03528e
	dc.w loc_03532e-loc_03528e
	dc.w loc_035370-loc_03528e
	dc.w loc_0353a0-loc_03528e
	dc.w loc_0353c4-loc_03528e

;----------------------------------------------
loc_03529c:
	addq.b #2,(PL_Move_state,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	clr.l (pl_x_velocity,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$1c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0352ce:
	tst.b ($35,a6)
	beq.b loc_0352f6
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0352e2
	moveq #1,d0

loc_0352e2:
	move.b d0,($ab,a6)
	jsr loc_083428
	moveq #$28,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_0352f6
	jmp loc_02a7ea

;----------------------------------------------
loc_0352fc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_035328
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_035322
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_035322:
	move.b loc_03532a(pc,d0.w),(pl_invinciblity_timer,a6)

loc_035328:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03532a:
	dc.b $0b,$0f,$13
	even

;----------------------------------------------
loc_03532e:
	tst.b ($35,a6)
	bne.w loc_035986
	move.b #1,(pl_in_air,a6)
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	bpl.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($1fe,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	add.b d0,($1fe,a6)
	lsr.b #1,d0
	addi.w #$1d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035370:
	tst.b (pl_anim_flags,a6)
	bpl.b loc_035392
	subq.b #1,($1fe,a6)
	bne.b loc_035392
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$20,d0
	jmp Set_Char_Special_Ani

loc_035392:
	addi.l #$ffffe000,(PL_Y,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0353a0:
	bsr.w loc_035118
	bcs.w loc_035986
	addq.b #2,(PL_Move_state,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0353c4:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================
;Special Move 0c
;==============================================
loc_0353d8:
	move.b (PL_Move_state,a6),d0
	move.w loc_0353e4(pc,d0.w),d1
	jmp loc_0353e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0353e4:
	dc.w loc_0353e8-loc_0353e4
	dc.w loc_035416-loc_0353e4

;----------------------------------------------
loc_0353e8:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_0353fc
	subq.b #1,(pl_taunt_count,a6)

loc_0353fc:
	clr.b (pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #$24,d0
	btst.b #1,(PL_Directioninput,a6)
	beq.b loc_035410
	addq.b #1,d0

loc_035410:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035416:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	jmp loc_02a7ea

;==============================================
;Special Move 0e
;==============================================
loc_035424:
	move.b (PL_Move_state,a6),d0
	move.w loc_035430(pc,d0.w),d1
	jmp loc_035430(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_035430:
	dc.w loc_035434-loc_035430
	dc.w loc_03545c-loc_035430

;----------------------------------------------
loc_035434:
	tst.b (pl_anim_flags,a6)
	bpl.b loc_035446
	addq.b #2,(PL_Move_state,a6)
	moveq #$18,d0
	jmp Set_Char_Special_Ani

loc_035446:
	tst.b ($35,a6)
	beq.b loc_035456
	clr.b ($35,a6)
	jsr loc_080e8e

loc_035456:
	jmp loc_02a7ea

;----------------------------------------------
loc_03545c:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	jmp loc_02a7ea

;==============================================
;Special Move 10
;==============================================
loc_03546a:
	move.b (PL_Move_state,a6),d0
	move.w loc_035476(pc,d0.w),d1
	jmp loc_035476(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_035476:
	dc.w loc_03547c-loc_035476
	dc.w loc_03549c-loc_035476
	dc.w loc_0354d0-loc_035476

;----------------------------------------------
loc_03547c:
	addq.b #2,(PL_Move_state,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b (pl_in_air,a6)
	beq.b loc_035496
	moveq #$2f,d0

loc_035496:
	jmp loc_02a708

;----------------------------------------------
loc_03549c:
	tst.b ($34,a6)
	beq.b loc_0354ca
	addq.b #2,(PL_Move_state,a6)
	move.b #-1,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b (pl_in_air,a6)
	beq.b loc_0354c0
	moveq #-3,d0
	moveq #$41,d1

loc_0354c0:
	jsr loc_097cd6
	bsr.w loc_0359b6

loc_0354ca:
	jmp loc_02a7ea

;----------------------------------------------
loc_0354d0:
	subq.b #1,($3a,a6)
	bne.w loc_035986
	tst.b (pl_in_air,a6)
	beq.b loc_0354e6
	move.l #$2000602,(pl_overall_state,a6)

loc_0354e6:
	jmp loc_02f796

;==============================================
;Special Move 12
;==============================================
loc_0354ec:
	move.b (PL_Move_state,a6),d0
	move.w loc_0354f8(pc,d0.w),d1
	jmp loc_0354f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0354f8:
	dc.w loc_0354fc-loc_0354f8
	dc.w loc_035514-loc_0354f8

;----------------------------------------------
loc_0354fc:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	moveq #$26,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035514:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	jmp loc_02a7ea

;==============================================
;Special Move 16
;==============================================
loc_035522:
	move.b (PL_Move_state,a6),d0
	move.w loc_03552e(pc,d0.w),d1
	jmp loc_03552e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03552e:
	dc.w loc_035540-loc_03552e
	dc.w loc_035562-loc_03552e
	dc.w loc_035582-loc_03552e
	dc.w loc_0355ba-loc_03552e
	dc.w loc_0356aa-loc_03552e
	dc.w loc_0356fe-loc_03552e
	dc.w loc_035756-loc_03552e
	dc.w loc_035776-loc_03552e

	dc.w loc_0357aa-loc_03552e


;----------------------------------------------
loc_035540:
	addq.b #2,(PL_Move_state,a6)
	move.w #$ff70,d0
	jsr loc_02ef6c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$2a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035562:
	tst.b ($35,a6)
	beq.b loc_03557c
	addq.b #2,(PL_Move_state,a6)
	move.b #$ff,($ab,a6)
	moveq #$13,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_03557c:
	jmp loc_02a7ea

;----------------------------------------------
loc_035582:
	tst.b ($35,a6)
	bne.b loc_0355b4
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	clr.b ($5b,a6)
	clr.b ($3a,a6)
	move.b #6,($cc,a6)
	move.l #$80000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	jsr loc_02fcd4

loc_0355b4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0355ba:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	tst.b ($35,a6)
	bpl.w loc_035656
	clr.b ($35,a6)
	move.b #$e,(PL_Move_state,a6)
	tst.b ($5b,a6)
	beq.w loc_035678
	
	move.b #8,(PL_Move_state,a6)
	cmpi.b #$30,($cc,a6)
	bne.b loc_035636
	clr.b ($cc,a6)
	cmpi.w #$60,(pl_dist_away,a6)
	bcc.b loc_035636
	tst.b (pl_in_air,a6)
	bne.b loc_035636
	
;Strong Version here
	movea.w (pl_enemy,a6),a4
	movea.l ($1c,a4),a0
	tst.b ($d,a0)
	bne.w loc_035636
	tst.w ($50,a4)
	bmi.w loc_035636
	move.b #$10,(PL_Move_state,a6)
	moveq #$20,d0
	tst.b (PL_Flip,a6)
	bne.b loc_035624
	neg.w d0

loc_035624:
	add.w d0,(PL_X,a6)
	jsr loc_0834a2
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

loc_035636:
	clr.b ($cc,a6)
	moveq #$20,d0
	tst.b (PL_Flip,a6)
	bne.b loc_035644
	neg.w d0

loc_035644:
	add.w d0,(PL_X,a6)
	jsr loc_0834a2
	moveq #$2b,d0
	jmp Set_Char_Special_Ani

loc_035656:
	movea.l (PL_Anim_Pnt,a6),a0
	tst.b (9,a0)
	beq.b loc_035678
	tst.b ($5b,a6)
	bne.w loc_035678
	moveq #0,d0
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	move.b loc_0356a2(pc,d0.w),($cc,a6)

loc_035678:
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_035684
	neg.l d0

loc_035684:
	add.l d0,(PL_X,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.w loc_035986
	clr.l (pl_x_velocity,a6)
	clr.l (pl_x_drag,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0356a2:
	dc.b $06,$08,$0c,$10
	dc.b $14,$18,$20,$30

;----------------------------------------------
loc_0356aa:
	tst.b ($35,a6)
	bmi.w loc_0356f8
	bne.w loc_0356e6
	addq.b #2,(PL_Move_state,a6)
	move.b #1,(pl_in_air,a6)
	move.l #$40000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	move.l #$a0000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	jmp loc_02a7ea

loc_0356e6:
	move.l #$30000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0356f4
	neg.l d0

loc_0356f4:
	add.l d0,(PL_X,a6)

loc_0356f8:
	jmp loc_02a7ea

;----------------------------------------------
loc_0356fe:
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03570a
	neg.l d0

loc_03570a:
	add.l d0,(PL_X,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.b loc_035720
	clr.l (pl_x_velocity,a6)
	clr.l (pl_x_drag,a6)

loc_035720:
	move.l (pl_y_velocity,a6),d0
	add.l d0,(PL_Y,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	move.w (PL_Y,a6),d0
	cmp.w ($64,a6),d0
	bcc.b loc_03574c
	addq.b #2,(PL_Move_state,a6)
	clr.b (pl_in_air,a6)
	move.w ($64,a6),(PL_Y,a6)
	clr.w ($16,a6)

loc_03574c:
	tst.b ($35,a6)
	beq.w loc_035986
	rts

;----------------------------------------------
loc_035756:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	movea.w (pl_enemy,a6),a4
	tst.w (PL_HP,a4)
	bpl.w loc_035770
	move.b #1,($1fd,a6)

loc_035770:
	jmp loc_02baf2

;----------------------------------------------
loc_035776:
	tst.b (pl_anim_flags,a6)
	bmi.w loc_03597a
	tst.w (pl_x_velocity,a6)
	beq.w loc_035986
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_035792
	neg.l d0

loc_035792:
	add.l d0,(PL_X,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.b loc_0357a8
	clr.l (pl_x_velocity,a6)
	clr.l (pl_x_drag,a6)

loc_0357a8:
	rts

;----------------------------------------------
loc_0357aa:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.w loc_03580a
	bne.w loc_0357f8
	move.b #$a,(PL_Move_state,a6)
	move.b #1,(pl_in_air,a6)
	move.l #0,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$a0000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #$18,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0357f2
	neg.w d0

loc_0357f2:
	add.w d0,(PL_X,a6)
	rts

loc_0357f8:
	move.l #$30000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_035806
	neg.l d0

loc_035806:
	add.l d0,(PL_X,a6)

loc_03580a:
	rts

;##############################################
;Throw PRG start
;##############################################
loc_03580c:
	cmpi.b #4,($80,a6)
	beq.w loc_0358fc
	move.b (PL_Move_state,a6),d0
	move.w loc_035828(pc,d0.w),d1
	jsr loc_035828(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_035828:
	dc.w loc_035832-loc_035828
	dc.w loc_035846-loc_035828
	dc.w loc_0358ba-loc_035828
	dc.w loc_0358c8-loc_035828
	dc.w loc_0358e8-loc_035828

;----------------------------------------------
loc_035832:
	addq.b #2,(PL_Move_state,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #2,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035846:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	moveq #$4d,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_035858
	moveq #$4e,d0

loc_035858:
	jsr loc_02e3fe
	beq.b loc_0358ae
	move.b #6,(PL_Move_state,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_035886
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w (PL_X,a6),d0
	bcs.b loc_03589a
	bra.b loc_03589e

loc_035886:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_03589e
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_03589e

loc_03589a:
	addq.b #1,(PL_Flip,a6)

loc_03589e:
	moveq #0,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_0358a8
	moveq #1,d0

loc_0358a8:
	jmp Set_Char_Special_Ani

loc_0358ae:
	addq.b #2,(PL_Move_state,a6)
	moveq #3,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0358ba:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	jmp loc_02baf2

;----------------------------------------------
loc_0358c8:
	tst.b ($35,a6)
	beq.b loc_0358e2
	addq.b #2,(PL_Move_state,a6)
	moveq #$4d,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_0358dc
	moveq #$4e,d0

loc_0358dc:
	jsr loc_02e7f2

loc_0358e2:
	jmp loc_02a7ea

;----------------------------------------------
loc_0358e8:
	tst.b (pl_anim_flags,a6)
	bpl.w loc_035986
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_0358fc:
	move.b (PL_Move_state,a6),d0
	move.w loc_03590e(pc,d0.w),d1
	jsr loc_03590e(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03590e:
	dc.w loc_035914-loc_03590e
	dc.w loc_035940-loc_03590e
	dc.w loc_03595e-loc_03590e

;----------------------------------------------
loc_035914:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$50,d0
	jsr loc_02e636
	beq.b loc_035934
	move.b #4,(PL_Move_state,a6)
	moveq #0,d0
	jmp Set_Char_Special_Ani

loc_035934:
	addq.b #2,(PL_Move_state,a6)
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_035940:
	jsr loc_02aa08
	bcc.w loc_035986
	clr.b (pl_in_air,a6)
	move.w ($64,a6),(PL_Y,a6)
	clr.w ($16,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_03595e:
	tst.b ($35,a6)
	beq.w loc_035986
	move.b #2,(PL_Move_state,a6)
	moveq #$50,d0
	jsr loc_02e7f2
	jmp loc_02a7ea


;##############################################
loc_03597a:
	jmp loc_02baf2

;##############################################
loc_035980:
	jmp loc_02bb26

;##############################################
loc_035986:
	jmp loc_02a7ea

;##############################################
loc_03598c:
	clr.b ($1fd,a6)
	jsr loc_01c368
	beq.b loc_0359b4
	addq.b #1,(a4)
	move.b #0,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_0359b4:
	rts

loc_0359b6:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Cancel Timers
loc_0359e6:
	dc.w loc_035a30-loc_0359e6;X Ism
	dc.w loc_035a30-loc_0359e6;A Ism
	dc.w loc_0359ec-loc_0359e6;V Ism

loc_0359ec:
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $02,$02
	dc.b $09,$0b
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $09,$0b
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02

loc_035a30:
	dc.b $08,$0a
	dc.b $08,$0a
	dc.b $08,$0a
	dc.b $02,$02
	dc.b $07,$09
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $08,$0a
	dc.b $08,$0a
	dc.b $07,$09
	dc.b $08,$0a
	dc.b $08,$0a
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02
	dc.b $02,$02

;Ryu Programming end
