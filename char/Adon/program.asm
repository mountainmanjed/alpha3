;==============================================
loc_03dad6:
	rts

;##############################################
;
;##############################################
loc_03dad8:
	jsr loc_01c368
	beq.b loc_03db1a
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.b ($e,a6),($e,a4)
	move.b ($c,a6),($c,a4)
	move.b ($d,a6),($d,a4)
	move.b ($102,a6),($3,a4)

loc_03db1a:
	rts

;##############################################
;
;##############################################
loc_03db1c:
	move.b (PL_Move_state,a6),d0
	move.w loc_03db28(pc,d0.w),d1
	jmp loc_03db28(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03db28:
	dc.w loc_03db48-loc_03db28
	dc.w loc_03db66-loc_03db28
	dc.w loc_03db74-loc_03db28
	dc.w loc_03db8c-loc_03db28
	dc.w loc_03dba8-loc_03db28
	dc.w loc_03dc48-loc_03db28
	dc.w loc_03dc8c-loc_03db28
	dc.w loc_03dbd8-loc_03db28

	dc.w loc_03dc48-loc_03db28
	dc.w loc_03dc8c-loc_03db28
	dc.w loc_03dc08-loc_03db28
	dc.w loc_03dc48-loc_03db28
	dc.w loc_03dc8c-loc_03db28
	dc.w loc_03dca4-loc_03db28
	dc.w loc_03dcb8-loc_03db28
	dc.w loc_03dce6-loc_03db28

;==============================================
loc_03db48:
	movea.w ($38,a6),a4
	cmpi.b #$b,($102,a4)
	bne.b loc_03db66
	tst.b (PL_cpucontrol,a6)
	sne.b d0
	tst.b ($125,a4)
	sne.b d1
	eor.b d0,d1
	bmi.w loc_03db8c

;==============================================
loc_03db66:
	move.b #4,(PL_Move_state,a6)
	moveq #$22,d0
	jmp loc_02a708

;==============================================
loc_03db74:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_03db8c:
	move.b #8,(PL_Move_state,a6)
	moveq #$14,d0
	tst.b ($101,a6)
	beq.b loc_03db9c
	neg.w d0

loc_03db9c:
	add.w d0,($10,a6)
	moveq #$38,d0
	jmp loc_02a708

;==============================================
loc_03dba8:
	tst.b ($35,a6)
	ble.b loc_03dbd2
	addq.b #2,(PL_Move_state,a6)
	move.w #$10,($3a,a6)
	move.w ($10,a6),($4e,a6)
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	jsr loc_080b70
	move.w #$9280,(sub_palram,a5)

loc_03dbd2:
	jmp loc_02a7ea

;==============================================
loc_03dbd8:
	tst.b ($35,a6)
	ble.b loc_03dc02
	addq.b #2,(PL_Move_state,a6)
	move.w #$20,($3a,a6)
	move.w ($10,a6),($4e,a6)
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	jsr loc_080b70
	move.w #$9280,(sub_palram,a5)

loc_03dc02:
	jmp loc_02a7ea

;==============================================
loc_03dc08:
	tst.b ($35,a6)
	ble.b loc_03dc42
	addq.b #2,(PL_Move_state,a6)
	move.w #$30,($3a,a6)
	move.w ($10,a6),($4e,a6)
	moveq #$38,d0
	tst.b ($101,a6)
	beq.b loc_03dc28
	neg.w d0

loc_03dc28:
	moveq #0,d1
	jsr loc_080c2c
	move.w #$200,($3a,a4)
	eori.b #1,($b,a4)
	jsr loc_0035ca

loc_03dc42:
	jmp loc_02a7ea

;==============================================
loc_03dc48:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w d0,($3a,a6)
	andi.w #6,d0
	move.w loc_03dc84(pc,d0.w),d0
	add.w ($4e,a6),d0
	move.w d0,($10,a6)
	tst.w ($3a,a6)
	bne.b loc_03dc82
	addq.b #2,(PL_Move_state,a6)
	move.w ($4e,a6),($10,a6)
	move.l #$fffe0000,(pl_x_velocity,a6)
	move.l #$5c00,(pl_x_drag,a6)

loc_03dc82:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03dc84:
	dc.w $0000,$0002,$0000,$fffe

;==============================================
loc_03dc8c:
	bsr.w loc_03f1be
	bmi.b loc_03dc9a
	addq.b #2,(PL_Move_state,a6)
	clr.b ($35,a6)

loc_03dc9a:
	tst.b ($35,a6)
	bpl.w loc_03f18a
	rts

;==============================================
loc_03dca4:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	moveq #$39,d0
	jmp loc_02a708

;==============================================
loc_03dcb8:
	tst.b ($35,a6)
	beq.b loc_03dce0
	addq.b #2,(PL_Move_state,a6)
	jsr loc_01c2c8
	beq.b loc_03dce0
	move.l #$1001c0c,(a4)
	move.w a6,($36,a4)
	move.w #$ffef,($44,a4)
	move.w #$67,($4c,a4)

loc_03dce0:
	jmp loc_02a7ea

;==============================================
loc_03dce6:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	move.l #$2000000,(4,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_03dd08
	move.w #$120,d0

loc_03dd08:
	swap d0
	add.l ($10,a3),d0
	move.l d0,($10,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_03dd1a:
	move.b ($80,a6),d0
	move.w loc_03dd26(pc,d0.w),d1
	jmp loc_03dd26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03dd26:
	dc.w loc_03dd2c-loc_03dd26
	dc.w loc_03de56-loc_03dd26
	dc.w loc_03df28-loc_03dd26

;==============================================
loc_03dd2c:
	clr.b (pl_crouching,a6)
	tst.b (PL_Attacktype,a6)
	bne.w loc_03dde2
	move.b (PL_Move_state,a6),d0
	move.w loc_03dd44(pc,d0.w),d1
	jmp loc_03dd44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03dd44:
	dc.w loc_03dd4a-loc_03dd44
	dc.w loc_03dda0-loc_03dd44
	dc.w loc_03dda6-loc_03dd44

;----------------------------------------------
loc_03dd4a:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	cmpi.b #2,(PL_ButtonStrength,a6)
	bne.b loc_03dd9a
	btst.b #1,(PL_Directioninput,a6)
	beq.b loc_03dd9a
	move.b #4,(PL_Move_state,a6)
	move.l #$68000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	moveq #$1e,d0

loc_03dd9a:
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03dda0:
	jmp loc_02f5ac

;----------------------------------------------
loc_03dda6:
	tst.b ($33,a6)
	bmi.w loc_03f184
	tst.b ($35,a6)
	bne.w loc_03f18a
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03ddc2
	neg.l d0

loc_03ddc2:
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.w loc_03f18a
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03dde2:
	move.b (PL_Move_state,a6),d0
	move.w loc_03ddee(pc,d0.w),d1
	jmp loc_03ddee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ddee:
	dc.w loc_03ddf2-loc_03ddee
	dc.w loc_03de50-loc_03ddee

;----------------------------------------------
loc_03ddf2:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03de2e
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03de2e
	btst.b #0,(PL_Directioninput,a6)
	bne.b loc_03de40
	bra.b loc_03de3e

loc_03de2e:
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	move.w loc_03de4a(pc,d1.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_03de40

loc_03de3e:
	addq.b #1,d0

loc_03de40:
	add.b (PL_ButtonStrength,a6),d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03de4a:
	dc.w $0028,$0028,$002c

;----------------------------------------------
loc_03de50:
	jmp loc_02f5ac

;==============================================
loc_03de56:
	move.b #1,(pl_crouching,a6)
	move.b (PL_Move_state,a6),d0
	move.w loc_03de68(pc,d0.w),d1
	jmp loc_03de68(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03de68:
	dc.w loc_03de6e-loc_03de68
	dc.w loc_03dea4-loc_03de68
	dc.w loc_03deaa-loc_03de68

;----------------------------------------------
loc_03de6e:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	moveq #$c,d0
	add.b d1,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_03de9e
	addq.b #3,d0

loc_03de9e:
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03dea4:
	jmp loc_02f5ac

;----------------------------------------------
loc_03deaa:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02bb26

;##############################################
;
;##############################################
loc_03deb8:
	move.b #6,(PL_Move_state,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_03dee8
	moveq #$18,d0

loc_03dee8:
	tst.b (PL_Attacktype,a6)
	beq.b loc_03def0
	addq.w #3,d0

loc_03def0:
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr Set_Spec_Cancel_Timers
	tst.b (PL_ism_choice,a6)
	bpl.b loc_03df26
	tst.b (PL_Attacktype,a6)
	beq.b loc_03df26
	move.l #$2000a00,(4,a6)
	moveq #$24,d0
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

loc_03df26:
	rts

;==============================================
loc_03df28:
	move.b (PL_Move_state,a6),d0
	move.w loc_03df34(pc,d0.w),d1
	jmp loc_03df34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03df34:
	dc.w loc_03df3c-loc_03df34
	dc.w loc_03dfa2-loc_03df34
	dc.w loc_03dfb8-loc_03df34
	dc.w loc_03dff2-loc_03df34

;----------------------------------------------
loc_03df3c:
	addq.b #2,(PL_Move_state,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_03df72(pc,d0.w),d1
	move.l loc_03df72+4(pc,d0.w),d2
	move.l loc_03df72+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_03df72+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_03df64
	neg.l d1
	neg.l d2

loc_03df64:
	add.l d1,(pl_x_velocity,a6)
	add.l d2,(pl_x_drag,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03df72:
	dc.l $00008000,$fffffa00,$00048000,$ffffb000
	dc.l $00010000,$fffffa00,$00048000,$ffffb000
	dc.l $00018000,$fffffa00,$00048000,$ffffb000

;----------------------------------------------
loc_03dfa2:
	jsr loc_02aa08
	tst.w (pl_y_velocity,a6)
	bpl.b loc_03dfb2
	addq.b #2,(PL_Move_state,a6)

loc_03dfb2:
	jmp loc_02a7ea

;----------------------------------------------
loc_03dfb8:
	addi.l #$ffffe000,(pl_y_drag,a6)
	jsr loc_02aa08
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03dfe8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c

loc_03dfe8:
	tst.b ($35,a6)
	bpl.w loc_03f18a
	rts

;----------------------------------------------
loc_03dff2:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jsr loc_02e35a
	jmp loc_02baf2

;##############################################
;Special Move Inputs
;##############################################
loc_03e006:
	jsr SPButton_Vism_code
	bne.w loc_03e228

loc_03e010:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_23623P_Code
	bne.w loc_03e156

loc_03e01e:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_03e11a

loc_03e02c:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623K_code
	bne.w loc_03e09a

loc_03e03a:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_421K_code
	bne.w loc_03e0c2

loc_03e048:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_63214K_Code
	bne.w loc_03e0f0

loc_03e056:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_03e1d6

loc_03e064:
	jsr SPButton_Taunt_code
	bne.w loc_03e070

loc_03e06e:
	rts

;----------------------------------------------
;Special Move Writes
;----------------------------------------------
loc_03e070:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03e07c
	tst.b (pl_taunt_count,a6)
	beq.b loc_03e06e

loc_03e07c:
	jsr loc_02ed00
	beq.b loc_03e06e
	move.l #$2000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

loc_03e09a:
	jsr loc_02ed00
	beq.b loc_03e03a
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_03e0c2:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_03e048
	jsr loc_02ed00
	beq.w loc_03e048
	move.l #$2000e00,(4,a6)
	clr.b (pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_03e0f0:
	jsr loc_02ed00
	beq.w loc_03e056
	move.l #$2000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_03e11a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03e02c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03e02c
	jsr loc_02ecd8
	beq.w loc_03e02c
	move.l #$2001000,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

loc_03e156:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_03e01e
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03e01e
	jsr loc_02ecd8
	beq.w loc_03e01e
	move.l #$2001000,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4bc

;##############################################
;
;##############################################
loc_03e194:
	moveq #0,d0
	move.l #$2000e0a,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,(PL_ButtonStrength,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b d0,(pl_crouching,a6)
	movea.w ($38,a6),a4
	move.b d0,(pl_hitfreeze,a6)
	move.b #$1b,($5f,a4)
	move.b #$1f,(pl_invinciblity_timer,a6)
	moveq #1,d0
	jmp loc_02a758

;==============================================
loc_03e1d6:
	jsr loc_02edf8
	beq.w loc_03e064

;##############################################
;
;##############################################
loc_03e1e0:
	tst.b (PL_ism_choice,a6)
	beq.b loc_03e194
	moveq #0,d0
	move.l #$2000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,(PL_ButtonStrength,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b d0,(pl_crouching,a6)
	movea.w ($38,a6),a4
	move.b d0,(pl_hitfreeze,a6)
	move.b #$11,($5f,a4)
	move.b #$15,(pl_invinciblity_timer,a6)
	moveq #0,d0
	jmp loc_02a758

;==============================================
loc_03e228:
	tst.b ($28a,a6)
	bne.w loc_03e010
	tst.b ($31,a6)
	bne.w loc_03e266
	jsr loc_02ef54
	beq.w loc_03e010
	jsr loc_02ecd8
	beq.w loc_03e010
	move.l #$2001000,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_03e266:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_03e010
	jsr loc_02ed28
	beq.w loc_03e010
	move.l #$2001000,(4,a6)
	move.b #$12,(pl_move_id,a6)
	jmp loc_02f980

;##############################################
;AI Checks
;##############################################
loc_03e28c:
	move.b (pl_move_id,a6),d0
	move.w loc_03e298(pc,d0.w),d1
	jmp loc_03e298(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e298:
	dc.w loc_03e2ac-loc_03e298
	dc.w loc_03e2b8-loc_03e298
	dc.w loc_03e2b8-loc_03e298
	dc.w loc_03e2b8-loc_03e298
	dc.w loc_03e2bc-loc_03e298
	dc.w loc_03e2d2-loc_03e298
	dc.w loc_03e2d2-loc_03e298
	dc.w loc_03e2e6-loc_03e298

	dc.w loc_03e2b8-loc_03e298
	dc.w loc_03e2f2-loc_03e298

;==============================================
loc_03e2ac:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_03e300
	bra.w loc_03e2fc

;==============================================
loc_03e2b8:
	bra.w loc_03e2fc

;==============================================
loc_03e2bc:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03e300
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03e300
	bra.w loc_03e2fc

;==============================================
loc_03e2d2:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03e300
	move.b (PL_Directioninput,a6),(PL_Attacktype,a6)
	bra.w loc_03e2fc

;==============================================
loc_03e2e6:
	tst.b (pl_taunt_count,a6)
	beq.w loc_03e300
	bra.w loc_03e2fc

;==============================================
loc_03e2f2:
	cmpi.w #$48,(PL_meter,a6)
	bcs.w loc_03e300

;----------------------------------------------
loc_03e2fc:
	moveq #1,d0
	rts

;----------------------------------------------
loc_03e300:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_03e304:
	move.b (pl_move_id,a6),d0
	move.w loc_03e310(pc,d0.w),d1
	jmp loc_03e310(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e310:
	dc.w loc_03e324-loc_03e310;JKick
	dc.w loc_03e430-loc_03e310;JRising
	dc.w loc_03e572-loc_03e310;JTooth
	dc.w loc_03e430-loc_03e310;JRising ?
	dc.w loc_03e71e-loc_03e310;JRevolver
	dc.w loc_03e89e-loc_03e310;JVAssualt
	dc.w loc_03e89e-loc_03e310;
	dc.w AdonTaunt-loc_03e310;Taunt

	dc.w loc_03eb64-loc_03e310;Vism Alpha Counter
	dc.w AdonVismActivate-loc_03e310;Vism Activate

;==============================================
;
;==============================================
loc_03e324:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e330(pc,d0.w),d1
	jmp loc_03e330(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e330:
	dc.w loc_03e33a-loc_03e330
	dc.w loc_03e3ae-loc_03e330
	dc.w loc_03e3c6-loc_03e330
	dc.w loc_03e3d6-loc_03e330
	dc.w loc_03e412-loc_03e330


;----------------------------------------------
loc_03e33a:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_03e37e(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_03e37e+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_03e37e+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_03e37e+$c(pc,d0.w),(pl_y_drag,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #4,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e37e:
	dc.l $00080000,$00000000,$00060000,$ffff7000
	dc.l $00060000,$00000000,$00080000,$ffff7000
	dc.l $00028000,$00000000,$000a0000,$ffff7000

;----------------------------------------------
loc_03e3ae:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03e3c4
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)

loc_03e3c4:
	rts

;----------------------------------------------
loc_03e3c6:
	bsr.w loc_03f1d8
	bpl.b loc_03e3d0
	addq.b #2,(PL_Move_state,a6)

loc_03e3d0:
	jmp loc_02a7ea

;----------------------------------------------
loc_03e3d6:
	addi.l #$ffffe000,(pl_y_drag,a6)
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03e408
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c

loc_03e408:
	tst.b ($35,a6)
	bpl.w loc_03f18a
	rts

;----------------------------------------------
loc_03e412:
	tst.b ($33,a6)
	bpl.b loc_03e424
	jsr loc_02e35a
	jmp loc_02baf2

loc_03e424
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03e430:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e43c(pc,d0.w),d1
	jmp loc_03e43c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e43c:
	dc.w loc_03e448-loc_03e43c
	dc.w loc_03e4bc-loc_03e43c
	dc.w loc_03e4d4-loc_03e43c
	dc.w loc_03e4e8-loc_03e43c
	dc.w loc_03e51c-loc_03e43c
	dc.w loc_03e53a-loc_03e43c

;----------------------------------------------
loc_03e448:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_03e48c(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_03e48c+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_03e48c+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_03e48c+$c(pc,d0.w),(pl_y_drag,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$18,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e48c:
	dc.l $00080000,$ffff8000,$00060000,$ffffa000
	dc.l $00090000,$ffff8000,$00070000,$ffffa000
	dc.l $000a0000,$ffff8000,$00080000,$ffffa000

;----------------------------------------------
loc_03e4bc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_03e4d2
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)

loc_03e4d2:
	rts

;----------------------------------------------
loc_03e4d4:
	bsr.w loc_03f1da
	bsr.w loc_03f1be
	bpl.b loc_03e4e2
	addq.b #2,(PL_Move_state,a6)

loc_03e4e2:
	jmp loc_02a7ea

;----------------------------------------------
loc_03e4e8:
	bsr.w loc_03f1da
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03e512
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c

loc_03e512:
	tst.b ($35,a6)
	beq.w loc_03f18a
	rts

;----------------------------------------------
loc_03e51c:
	tst.b ($33,a6)
	bpl.b loc_03e52e
	jsr loc_02e35a
	jmp loc_02baf2

loc_03e52e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_03e53a:
	tst.b ($35,a6)
	bpl.b loc_03e56c
	move.b #2,(PL_Move_state,a6)
	jsr loc_080e8e
	move.l #$a0000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)

loc_03e56c:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03e572:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e57e(pc,d0.w),d1
	jmp loc_03e57e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e57e:
	dc.w loc_03e58a-loc_03e57e
	dc.w loc_03e5e4-loc_03e57e
	dc.w loc_03e60e-loc_03e57e
	dc.w loc_03e662-loc_03e57e
	dc.w loc_03e6c8-loc_03e57e
	dc.w loc_03e700-loc_03e57e

;----------------------------------------------
loc_03e58a:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	jsr loc_01bd5c
	move.l ($10,a3),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03e5b8
	addi.l #$1800000,d0

loc_03e5b8:
	sub.l ($10,a6),d0
	asr.l #5,d0
	move.l d0,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$90000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #5,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_03e5e4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.w loc_03f19c
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	st.b ($3c,a6)
	jsr loc_01bd5c
	move.l ($10,a3),($1f0,a6)
	rts

;----------------------------------------------
loc_03e60e:
	jsr loc_01bd5c
	move.l ($10,a3),d1
	move.l d1,d0
	sub.l ($1f0,a6),d1
	add.l d1,($10,a6)
	move.l d0,($1f0,a6)
	jsr loc_02aa08
	bcs.w loc_03e6d8
	tst.w (pl_y_velocity,a6)
	bmi.b loc_03e63e
	cmpi.w #$90,($14,a6)
	bls.b loc_03e654

loc_03e63e:
	tst.b ($ac,a6)
	beq.b loc_03e654
	addq.b #2,(PL_Move_state,a6)
	moveq #6,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

loc_03e654:
	tst.b ($35,a6)
	bne.w loc_03f19c
	jmp loc_02a7ea

;----------------------------------------------
loc_03e662:
	jsr loc_01bd5c
	move.l ($10,a3),($10,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_03e67c
	addi.l #$1800000,($10,a6)

loc_03e67c:
	tst.b ($35,a6)
	bne.b loc_03e6aa
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($3c,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l d0,(pl_y_drag,a6)
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	add.w d0,d0
	move.l loc_03e6b0(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_03e6b0+4(pc,d0.w),(pl_y_velocity,a6)

loc_03e6aa:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e6b0:
	dc.l $000a0000,$fff60000
	dc.l $000c0000,$fff80000
	dc.l $000e0000,$fffa0000

;----------------------------------------------
loc_03e6c8:
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03f18a

loc_03e6d8:
	move.b #$a,(PL_Move_state,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_03e700:
	tst.b ($33,a6)
	beq.b loc_03e712
	jsr loc_02e35a
	jmp loc_02bb26

loc_03e712:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Jag Revolver
;==============================================
loc_03e71e:
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_03e72a(pc,d0.w),d1
	jmp loc_03e72a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e72a:
	dc.w loc_03e730-loc_03e72a
	dc.w loc_03e74c-loc_03e72a
	dc.w loc_03e768-loc_03e72a

;==============================================
;LP Revolver
;==============================================
loc_03e730:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e73c(pc,d0.w),d1
	jmp loc_03e73c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e73c:
	dc.w loc_03e788-loc_03e73c
	dc.w loc_03e7d2-loc_03e73c
	dc.w loc_03e7fa-loc_03e73c
	dc.w loc_03e82c-loc_03e73c
	dc.w loc_03e846-loc_03e73c
	dc.w loc_03e82c-loc_03e73c
	dc.w loc_03e846-loc_03e73c
	dc.w loc_03eb1a-loc_03e73c

;==============================================
;MP Revolver
;==============================================
loc_03e74c:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e758(pc,d0.w),d1
	jmp loc_03e758(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e758:
	dc.w loc_03e788-loc_03e758
	dc.w loc_03e7d2-loc_03e758
	dc.w loc_03e7fa-loc_03e758
	dc.w loc_03e82c-loc_03e758
	dc.w loc_03e846-loc_03e758
	dc.w loc_03e82c-loc_03e758
	dc.w loc_03e846-loc_03e758
	dc.w loc_03eb1a-loc_03e758

;==============================================
;Hp Revolver
;==============================================
loc_03e768:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e774(pc,d0.w),d1
	jmp loc_03e774(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e774:
	dc.w loc_03e788-loc_03e774
	dc.w loc_03e7d2-loc_03e774
	dc.w loc_03e7fa-loc_03e774
	dc.w loc_03e82c-loc_03e774
	dc.w loc_03e846-loc_03e774
	dc.w loc_03e82c-loc_03e774
	dc.w loc_03e846-loc_03e774
	dc.w loc_03e82c-loc_03e774

	dc.w loc_03e846-loc_03e774
	dc.w loc_03eb1a-loc_03e774

;----------------------------------------------
loc_03e788:
	addq.b #2,(PL_Move_state,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.l #$50000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$88000,(pl_y_velocity,a6)
	move.l #$ffff7000,(pl_y_drag,a6)
	move.l #$ffffe000,($1f0,a6)
	moveq #$1e,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_03e7d2:
	tst.b ($35,a6)
	beq.b loc_03e7f4
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03e7e6
	moveq #1,d0

loc_03e7e6:
	move.b d0,($ab,a6)
	moveq #-$10,d0
	moveq #$43,d1
	jsr loc_082e36

loc_03e7f4:
	jmp loc_02a7ea

;----------------------------------------------
loc_03e7fa:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_03e826
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03e820
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_03e820:
	move.b loc_03e828(pc,d0.w),(pl_invinciblity_timer,a6)

loc_03e826:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e828:
	dc.b $0e,$15,$1c,$00

;----------------------------------------------
loc_03e82c:
	cmpi.b #1,($35,a6)
	bne.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_03e846:
	bsr.w loc_03f1d8
	bpl.b loc_03e854
	move.l ($1f0,a6),d0
	add.l d0,(pl_y_drag,a6)

loc_03e854:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03f1b4
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l #$70000,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	move.l #$30000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	move.l #$ffffd000,($1f0,a6)
	jsr loc_00369c
	rts

;==============================================
;Jaguar Varied Assualt
;==============================================
loc_03e89e:
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_03e8aa(pc,d0.w),d1
	jmp loc_03e8aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e8aa:
	dc.w loc_03e8b0-loc_03e8aa
	dc.w loc_03e8c8-loc_03e8aa
	dc.w loc_03e8e0-loc_03e8aa

;==============================================
;LK Assault
;==============================================
loc_03e8b0:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e8bc(pc,d0.w),d1
	jmp loc_03e8bc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e8bc:
	dc.w loc_03e8fe-loc_03e8bc
	dc.w loc_03e952-loc_03e8bc
	dc.w loc_03e97c-loc_03e8bc
	dc.w loc_03e9ae-loc_03e8bc
	dc.w loc_03ea0e-loc_03e8bc
	dc.w loc_03eb1a-loc_03e8bc

;==============================================
;MK Assault
;==============================================
loc_03e8c8:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e8d4(pc,d0.w),d1
	jmp loc_03e8d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e8d4:
	dc.w loc_03e8fe-loc_03e8d4
	dc.w loc_03e952-loc_03e8d4
	dc.w loc_03e97c-loc_03e8d4
	dc.w loc_03e9ae-loc_03e8d4
	dc.w loc_03ea0e-loc_03e8d4
	dc.w loc_03eb1a-loc_03e8d4

;==============================================
;HK Assault
;==============================================
loc_03e8e0:
	move.b (PL_Move_state,a6),d0
	move.w loc_03e8ec(pc,d0.w),d1
	jmp loc_03e8ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e8ec:
	dc.w loc_03e8fe-loc_03e8ec
	dc.w loc_03e952-loc_03e8ec
	dc.w loc_03e97c-loc_03e8ec
	dc.w loc_03e9ae-loc_03e8ec
	dc.w loc_03ea0e-loc_03e8ec
	dc.w loc_03eb1a-loc_03e8ec
	dc.w loc_03ea38-loc_03e8ec
	dc.w loc_03ea4e-loc_03e8ec

	dc.w loc_03ea66-loc_03e8ec

;----------------------------------------------
loc_03e8fe:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($216,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_03e93a(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_03e93a+4(pc,d0.w),(pl_x_drag,a6)
	moveq #$12,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e93a:
	dc.l $00040000,$ffff0000
	dc.l $00050000,$ffff8000
	dc.l $00060000,$00000000

;----------------------------------------------
loc_03e952:
	tst.b ($35,a6)
	beq.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03e968
	moveq #1,d0

loc_03e968:
	move.b d0,($ab,a6)
	moveq #-$10,d0
	moveq #$43,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_03e97c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_03e9a8
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03e9a2
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_03e9a2:
	move.b loc_03e9aa(pc,d0.w),(pl_invinciblity_timer,a6)

loc_03e9a8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e9aa:
	dc.b $04,$0f,$14,$00

;----------------------------------------------
loc_03e9ae:
	tst.b ($33,a6)
	bmi.w loc_03ea74
	tst.b ($34,a6)
	bmi.w loc_03eaa8

loc_03e9be:
	tst.b ($35,a6)
	beq.b loc_03e9f0
	cmpi.b #3,($35,a6)
	bne.b loc_03e9e0
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_03e9f6(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_03ea02(pc,d0.w),(pl_x_drag,a6)

loc_03e9e0:
	bsr.w loc_03f1be
	bpl.b loc_03e9f0
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)

loc_03e9f0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03e9f6:
	dc.l $00040000,$00050000,$00060000

loc_03ea02:
	dc.l $ffff0000,$ffff8000,$00000000

;----------------------------------------------
loc_03ea0e:
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03f1b4
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	rts

;----------------------------------------------
loc_03ea38:
	tst.b ($35,a6)
	beq.b loc_03ea48
	addq.b #2,(PL_Move_state,a6)
	move.b #$1e,($3a,a6)

loc_03ea48:
	jmp loc_02a7ea

;----------------------------------------------
loc_03ea4e:
	bsr.w loc_03f19e
	subq.b #1,($3a,a6)
	bne.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_03ea66:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02baf2

loc_03ea74:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$40000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$90000,(pl_y_velocity,a6)
	move.l #$ffff9000,(pl_y_drag,a6)
	moveq #$13,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

loc_03eaa8:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03eac2
	move.b ($378,a6),d0
	andi.b #$77,d0
	beq.w loc_03e9be
	andi.b #7,d0
	bne.b loc_03ead0
	bra.b loc_03eade

loc_03eac2:
	move.b (PL_Attacktype,a6),d0
	beq.w loc_03e9be
	cmpi.b #2,d0
	beq.b loc_03eade

loc_03ead0:
	move.b #$c,(PL_Move_state,a6)
	moveq #$18,d0
	jmp loc_02a758

loc_03eade:
	move.l #$2001002,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #1,($31,a6)
	move.l #$c0000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #$1a,d0
	jmp loc_02a758

;----------------------------------------------
;Super Ending
;----------------------------------------------
loc_03eb1a:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================
;Taunt
;==============================================
AdonTaunt:
	move.b (PL_Move_state,a6),d0
	move.w loc_03eb3a(pc,d0.w),d0
	jmp loc_03eb3a(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03eb3a:
	dc.w loc_03eb3e-loc_03eb3a
	dc.w loc_03eb1a-loc_03eb3a

;----------------------------------------------
loc_03eb3e:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_03eb52
	subq.b #1,(pl_taunt_count,a6)

loc_03eb52:
	moveq #0,d0
	move.b d0,(pl_attk_active,a6)
	move.b d0,(pl_crouching,a6)
	moveq #$1b,d0
	jmp loc_02a758

;==============================================
;Alpha Counter Kick
;==============================================
loc_03eb64:
	move.b (PL_Move_state,a6),d0
	move.w loc_03eb70(pc,d0.w),d1
	jmp loc_03eb70(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03eb70:
	dc.w loc_03eb74-loc_03eb70
	dc.w loc_03eb1a-loc_03eb70

;----------------------------------------------
loc_03eb74:
	tst.b ($35,a6)
	beq.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	clr.b ($35,a6)
	jsr loc_080e8e
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
AdonVismActivate:
	move.b (PL_Move_state,a6),d0
	move.w loc_03eb9c(pc,d0.w),d1
	jmp loc_03eb9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03eb9c:
	dc.w AdonVstate0-loc_03eb9c
	dc.w AdonVstate1-loc_03eb9c
	dc.w AdonVstate2-loc_03eb9c

;----------------------------------------------
AdonVstate0:
	addq.b #2,(PL_Move_state,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_03ebbc
	moveq #$2f,d0

loc_03ebbc:
	jmp loc_02a708

;----------------------------------------------
AdonVstate1:
	tst.b ($34,a6)
	beq.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #2,d0
	moveq #$50,d1
	tst.b ($31,a6)
	beq.b loc_03ebe8
	moveq #-1,d0
	moveq #$50,d1

loc_03ebe8:
	jsr loc_097cd6
	bsr.w loc_03f20a
	jmp loc_02a7ea

;----------------------------------------------
AdonVstate2:
	subq.b #1,($3a,a6)
	bne.w loc_03f18a
	tst.b ($31,a6)
	beq.b loc_03ec0e
	move.l #$2000602,(4,a6)

loc_03ec0e:
	jmp loc_02f796

;##############################################
;
;##############################################
loc_03ec14:
	cmpi.b #4,($80,a6)
	beq.w loc_03ee3e
	move.b (PL_Move_state,a6),d0
	move.w loc_03ec2a(pc,d0.w),d1
	jmp loc_03ec2a(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ec2a:
	dc.w loc_03ec40-loc_03ec2a
	dc.w loc_03ec54-loc_03ec2a
	dc.w loc_03ecf0-loc_03ec2a
	dc.w loc_03ecfe-loc_03ec2a
	dc.w loc_03ed42-loc_03ec2a
	dc.w loc_03ed74-loc_03ec2a
	dc.w loc_03ed82-loc_03ec2a
	dc.w loc_03ed98-loc_03ec2a

	dc.w loc_03edd4-loc_03ec2a
	dc.w loc_03ee08-loc_03ec2a
	dc.w loc_03ee2a-loc_03ec2a

;==============================================
loc_03ec40:
	addq.b #2,(PL_Move_state,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp loc_02a758

;==============================================
loc_03ec54:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	moveq #$5b,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_03ec66
	moveq #$5c,d0

loc_03ec66:
	jsr loc_02e3fe
	beq.w loc_03ece4
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03ec9a
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_03ec92
	addq.b #1,(PL_Flip,a6)

loc_03ec92:
	tst.b (PL_Attacktype,a6)
	beq.b loc_03ecae
	bra.b loc_03ecd0

loc_03ec9a:
	tst.b (PL_Attacktype,a6)
	bne.b loc_03ecc2
	btst.b #0,($371,a6)
	beq.b loc_03ecae
	eori.b #1,(PL_Flip,a6)

loc_03ecae:
	move.b #6,(PL_Move_state,a6)
	moveq #$1c,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_03ecc2:
	btst.b #0,($371,a6)
	bne.b loc_03ecd0
	eori.b #1,(PL_Flip,a6)

loc_03ecd0:
	move.b #$c,(PL_Move_state,a6)
	moveq #$1d,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_03ece4:
	addq.b #2,(PL_Move_state,a6)
	moveq #$1f,d0
	jmp loc_02a758

;==============================================
loc_03ecf0:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02baf2

;==============================================
loc_03ecfe:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_03f196
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$fffe0000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$60000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	jsr loc_02f9be
	moveq #$5b,d0
	jmp loc_02e7f2

;==============================================
loc_03ed42:
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03ed68
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c

loc_03ed68:
	cmpi.b #2,($35,a6)
	bne.w loc_03f18a
	rts

;==============================================
loc_03ed74:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02baf2

;==============================================
loc_03ed82:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03ed92
	addq.b #2,(PL_Move_state,a6)

loc_03ed92:
	jmp loc_02f9be

;==============================================
loc_03ed98:
	cmpi.b #2,($35,a6)
	bne.b loc_03edc8
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$fffd0000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffff2000,(pl_y_drag,a6)

loc_03edc8:
	jsr loc_02a7ea
	jmp loc_02f9be

;==============================================
loc_03edd4:
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03edf4
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_03edf4:
	cmpi.b #3,($35,a6)
	beq.b loc_03ee02
	jsr loc_02a7ea

loc_03ee02:
	jmp loc_02f9be

;==============================================
loc_03ee08:
	jsr loc_02a7ea
	cmpi.b #4,($35,a6)
	bne.w loc_03f190
	addq.b #2,(PL_Move_state,a6)
	jsr loc_02f9be
	moveq #$5c,d0
	jmp loc_02e7f2

;==============================================
loc_03ee2a:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_03ee3e:
	move.b (PL_Move_state,a6),d0
	move.w loc_03ee4a(pc,d0.w),d1
	jmp loc_03ee4a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ee4a:
	dc.w loc_03ee5c-loc_03ee4a
	dc.w loc_03eee8-loc_03ee4a
	dc.w loc_03eefe-loc_03ee4a
	dc.w loc_03ef20-loc_03ee4a
	dc.w loc_03ef4e-loc_03ee4a
	dc.w loc_03ef68-loc_03ee4a
	dc.w loc_03ef76-loc_03ee4a
	dc.w loc_03efba-loc_03ee4a

	dc.w loc_03efec-loc_03ee4a

;==============================================
loc_03ee5c:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$5d,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_03ee6e
	moveq #$5f,d0

loc_03ee6e:
	jsr loc_02e636
	beq.b loc_03eedc
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03ee96
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_03eeaa
	bra.b loc_03eeae

loc_03ee96:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_03eeae
	clr.b (PL_Flip,a6)
	btst #1,d0
	bne.b loc_03eeae

loc_03eeaa:
	addq.b #1,(PL_Flip,a6)

loc_03eeae:
	tst.b (PL_Attacktype,a6)
	bne.b loc_03eec8
	move.b #4,(PL_Move_state,a6)
	moveq #$22,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_03eec8:
	move.b #$c,(PL_Move_state,a6)
	moveq #$23,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_03eedc:
	addq.b #2,(PL_Move_state,a6)
	moveq #$21,d0
	jmp loc_02a758

;==============================================
loc_03eee8:
	jsr loc_02aa08
	bcc.w loc_03f18a
	jsr loc_00369c
	jmp loc_02baf2

;==============================================
loc_03eefe:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03ef1a
	addq.b #2,(PL_Move_state,a6)
	tst.w (pl_y_velocity,a6)
	bmi.b loc_03ef1a
	moveq #0,d0
	move.l d0,(pl_y_velocity,a6)

loc_03ef1a:
	jmp loc_02f9be

;==============================================
loc_03ef20:
	bsr.w loc_03f1da
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03ef48
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$5e,d0
	jsr loc_02e970

loc_03ef48:
	jmp loc_02f9be

;==============================================
loc_03ef4e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_03f190
	addq.b #2,(PL_Move_state,a6)
	moveq #$5d,d0
	jmp loc_02e7f2

;==============================================
loc_03ef68:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02baf2

;==============================================
loc_03ef76:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_03f196
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$fffe0000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l #$60000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	jsr loc_02f9be
	moveq #$5f,d0
	jmp loc_02e7f2

;==============================================
loc_03efba:
	bsr.w loc_03f1d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03efe0
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c

loc_03efe0:
	cmpi.b #2,($35,a6)
	bne.w loc_03f18a
	rts

;==============================================
loc_03efec:
	tst.b ($33,a6)
	bpl.w loc_03f18a
	jmp loc_02baf2

;##############################################
;
;##############################################
loc_03effa:
	move.b ($2c4,a6),d0
	move.w loc_03f006(pc,d0.w),d1
	jmp loc_03f006(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f006:
	dc.w loc_03f014-loc_03f006
	dc.w loc_03f036-loc_03f006
	dc.w loc_03f0ae-loc_03f006
	dc.w loc_03f036-loc_03f006
	dc.w loc_03f120-loc_03f006
	dc.w loc_03f036-loc_03f006
	dc.w loc_03f036-loc_03f006

;==============================================
loc_03f014:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_03f026(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f026:
	dc.b $02,$04,$06,$08
	dc.b $0a,$0c,$02,$04
	dc.b $06,$08,$0a,$0c
	dc.b $02,$04,$06,$08

;==============================================
loc_03f036:
	move.b (PL_Move_state,a6),d0
	move.w loc_03f042(pc,d0.w),d1
	jmp loc_03f042(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f042:
	dc.w loc_03f04a-loc_03f042
	dc.w loc_03f062-loc_03f042
	dc.w loc_03f096-loc_03f042
	dc.w loc_03f0a8-loc_03f042

;----------------------------------------------
loc_03f04a:
	addq.b #2,(PL_Move_state,a6)
	move.b #$3c,($3a,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_03f062:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_03f18a
	tst.b ($11c,a5)
	bne.w loc_03f18a
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	move.w loc_03f086(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f086:
	dc.w $0023,$0023,$0024,$0025,$0026,$0027,$0032,$0023

;----------------------------------------------
loc_03f096:
	subq.b #1,($3a,a6)
	bpl.b loc_03f0a8
	addq.b #2,(PL_Move_state,a6)
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

;----------------------------------------------
loc_03f0a8:
	jmp loc_02a7ea

;==============================================
loc_03f0ae:
	move.b (PL_Move_state,a6),d0
	move.w loc_03f0ba(pc,d0.w),d1
	jmp loc_03f0ba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f0ba:
	dc.w loc_03f04a-loc_03f0ba
	dc.w loc_03f062-loc_03f0ba
	dc.w loc_03f0c6-loc_03f0ba
	dc.w loc_03f0ee-loc_03f0ba
	dc.w loc_03f096-loc_03f0ba
	dc.w loc_03f0a8-loc_03f0ba

;----------------------------------------------
loc_03f0c6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_03f0ec
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$50000,(pl_y_velocity,a6)
	move.l #$ffffc000,(pl_y_drag,a6)

loc_03f0ec:
	rts

;----------------------------------------------
loc_03f0ee:
	bsr.w loc_03f1da
	bpl.b loc_03f116
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03f116
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c

loc_03f116:
	tst.b ($35,a6)
	beq.w loc_03f18a
	rts

;==============================================
loc_03f120:
	move.b (PL_Move_state,a6),d0
	move.w loc_03f12c(pc,d0.w),d1
	jmp loc_03f12c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03f12c:
	dc.w loc_03f04a-loc_03f12c
	dc.w loc_03f062-loc_03f12c
	dc.w loc_03f138-loc_03f12c
	dc.w loc_03f158-loc_03f12c
	dc.w loc_03f096-loc_03f12c
	dc.w loc_03f0a8-loc_03f12c

;----------------------------------------------
loc_03f138:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03f156
	addq.b #2,(PL_Move_state,a6)
	moveq #$2a,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03f152
	neg.w d0

loc_03f152:
	add.w d0,($10,a6)

loc_03f156:
	rts

;----------------------------------------------
loc_03f158:
	tst.b ($34,a6)
	beq.b loc_03f180
	addq.b #2,(PL_Move_state,a6)
	jsr loc_01c2c8
	beq.b loc_03f180
	move.l #$1001c0c,(a4)
	move.w a6,($36,a4)
	move.w #7,($44,a4)
	move.w #$63,($4c,a4)

loc_03f180:
	bra.w loc_03f096

;==============================================
loc_03f184:
	jmp loc_02baf2

;==============================================
loc_03f18a:
	jmp loc_02a7ea

;==============================================
loc_03f190:
	jmp loc_02f9be

;==============================================
loc_03f196:
	jmp loc_02fa36

;==============================================
loc_03f19c:
	rts

;==============================================
loc_03f19e:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03f19c
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.b loc_03f19c
	jmp loc_02a7ea

;==============================================
loc_03f1b4:
	cmpi.b #2,($35,a6)
	bne.b loc_03f18a
	rts

;==============================================
loc_03f1be:
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03f1ca
	neg.l d0

loc_03f1ca:
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	rts

;==============================================
loc_03f1d8:
	bsr.b loc_03f1be

;==============================================
loc_03f1da:
	move.l (pl_y_velocity,a6),d0
	add.l d0,($14,a6)
	add.l (pl_y_drag,a6),d0
	move.l d0,(pl_y_velocity,a6)
	rts

;==============================================
loc_03f1ec:
	cmpi.b #$10,(6,a6)
	bne.b loc_03f206
	cmpi.b #$a,(pl_move_id,a6)
	bne.b loc_03f206
	tst.b ($31,a6)
	bne.b loc_03f206
	moveq #1,d0
	rts

loc_03f206:
	moveq #0,d0
	rts

;==============================================
loc_03f20a:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_5,a6)
	movem.l d0-d1,(pl_inp_slot_6,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;##############################################
;
;##############################################
loc_03f246:
	dc.w loc_03f28c-loc_03f246
	dc.w loc_03f28c-loc_03f246
	dc.w loc_03f24c-loc_03f246

loc_03f24c:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02

loc_03f28c:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
