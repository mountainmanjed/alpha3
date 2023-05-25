;##############################################
;
;##############################################
loc_03a36e:
	jsr loc_01c368
	beq.b loc_03a38c
	addq.b #1,(a4)
	move.b #3,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.b ($102,a6),(3,a4)

loc_03a38c:
	rts

;##############################################
;Normals
;##############################################
loc_03a38e:
	tst.b ($80,a6)
	bne.w loc_03a650
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_03a416
	move.b (7,a6),d0
	move.w loc_03a3ae(pc,d0.w),d1
	jmp loc_03a3ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a3ae:
	dc.w loc_03a3b2-loc_03a3ae
	dc.w loc_03a410-loc_03a3ae

;----------------------------------------------
loc_03a3b2:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03a3f6
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03a3f6
	btst.b #0,(PL_Directioninput,a6)
	bne.b loc_03a404
	bra.b loc_03a402

loc_03a3f6:
	move.w loc_03a40a(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_03a404

loc_03a402:
	addq.b #1,d0

loc_03a404:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a40a:
	dc.w $0020,$0034,$0048

;----------------------------------------------
loc_03a410:
	jmp loc_02f5ac

;==============================================
loc_03a416:
	move.b (7,a6),d0
	move.w loc_03a422(pc,d0.w),d1
	jmp loc_03a422(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a422:
	dc.w loc_03a432-loc_03a422
	dc.w loc_03a518-loc_03a422
	dc.w loc_03a51e-loc_03a422
	dc.w loc_03a57e-loc_03a422
	dc.w loc_03a590-loc_03a422
	dc.w loc_03a5c2-loc_03a422
	dc.w loc_03a614-loc_03a422
	dc.w loc_03a63c-loc_03a422

;----------------------------------------------
loc_03a432:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b (PL_ism_choice,a6)
	bpl.w loc_03a474
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	cmpi.b #0,d1
	bne.b loc_03a474
	move.b (PL_Directioninput,a6),d0
	andi.w #3,d0
	bne.w loc_03a5b4

loc_03a474:
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	cmpi.b #2,d1
	bne.b loc_03a48a
	move.b (PL_Directioninput,a6),d0
	andi.w #3,d0
	bne.b loc_03a4cc

loc_03a48a:
	move.b (PL_ButtonStrength,a6),d1
	cmpi.b #4,d1
	bne.b loc_03a49e
	move.b (PL_Directioninput,a6),d0
	andi.w #3,d0
	bne.b loc_03a504

loc_03a49e:
	moveq #6,d0
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03a4b2
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03a4b2
	bra.b loc_03a4c0

loc_03a4b2:
	move.w loc_03a4c6(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_03a4c0
	addq.b #1,d0

loc_03a4c0:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a4c6:
	dc.w $0038,$0048,$0048

;----------------------------------------------
loc_03a4cc:
	move.b #6,(7,a6)
	move.l #$30000,d1
	move.l #$ffffe800,d2
	tst.b (PL_Flip,a6)
	bne.b loc_03a4e8
	neg.l d1
	neg.l d2

loc_03a4e8:
	btst.b #1,(PL_Directioninput,a6)
	bne.b loc_03a4f4
	neg.l d1
	neg.l d2

loc_03a4f4:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

loc_03a504:
	move.b #4,(7,a6)
	move.w #$ffff,($3a,a6)
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03a518:
	jmp loc_02f5ac

;----------------------------------------------
loc_03a51e:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	move.w ($34,a6),d0
	andi.w #$ff,d0
	cmp.w ($3a,a6),d0
	bne.b loc_03a540
	tst.b ($34,a6)
	bne.b loc_03a544
	jmp loc_02a7ea

loc_03a540:
	move.w d0,($3a,a6)

loc_03a544:
	cmpi.b #$16,($35,a6)
	bne.b loc_03a550
	clr.b ($35,a6)

loc_03a550:
	move.l loc_03a566(pc,d0.w),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03a55c
	neg.l d0

loc_03a55c:
	add.l d0,($10,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a566:
	dc.l $00030000,$00030000
	dc.l $00000000,$00000000
	dc.l $00000000,$00000000

;----------------------------------------------
loc_03a57e:
	tst.b ($35,a6)
	bne.w loc_03bcc4
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_03a590:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	tst.b ($35,a6)
	bne.b loc_03a5ae
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_03a5ae:
	jmp loc_02a7ea

loc_03a5b4:
	move.b #$a,(7,a6)
	moveq #$21,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03a5c2:
	move.b ($34,a6),d0
	beq.b loc_03a5d8
	clr.b ($34,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_03a5d4
	neg.w d0

loc_03a5d4:
	add.w d0,($10,a6)

loc_03a5d8:
	tst.b ($35,a6)
	beq.b loc_03a60e
	addq.b #2,(7,a6)
	move.l #$40000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_03a5f0
	neg.l d1

loc_03a5f0:
	move.l d1,($40,a6)
	clr.l ($48,a6)
	move.l #$48000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #1,($31,a6)

loc_03a60e:
	jmp loc_02a7ea

;----------------------------------------------
loc_03a614:
	bsr.w loc_03b742
	bcc.b loc_03a620
	jmp loc_02a7ea

loc_03a620:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #$31,d0
	jmp loc_02a758

;----------------------------------------------
loc_03a63c:
	tst.b ($33,a6)
	bmi.w loc_03bcb8
	jsr loc_02e35a
	jmp loc_02a7ea

;==============================================
loc_03a650:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_03a662(pc,d0.w),d1
	jmp loc_03a662(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a662:
	dc.w loc_03a666-loc_03a662
	dc.w loc_03a69c-loc_03a662

;----------------------------------------------
loc_03a666:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_03a692
	addq.b #3,d1

loc_03a692:
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03a69c:
	jmp loc_02f5ac

;##############################################
;
;##############################################
loc_03a6a2:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$15,d1
	tst.b ($3c,a6)
	beq.b loc_03a6cc
	moveq #$1b,d1

loc_03a6cc:
	tst.b ($81,a6)
	bne.b loc_03a6d4
	subq.w #3,d1

loc_03a6d4:
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	add.w d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Moves Inputs
;##############################################
loc_03a6e4:
	tst.b (PL_ism_choice,a6)
	beq.w loc_03a6f4
	bmi.w loc_03a6f4
	bra.w loc_03a6f4

loc_03a6f4:
	jsr SPButton_Vism_code
	bne.w loc_03a770

loc_03a6fe:
	lea.l (pl_inp_slot_3,a6),a4
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpChrg_4646P_code
	bne.w loc_03a8fc

loc_03a710:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpChrg_1318K_code
	bne.w loc_03a8ba

loc_03a71e:
	lea (pl_inp_slot_2,a6),a4
	jsr SpChrg_4646K_code
	bne.w loc_03a87a

loc_03a72c:
	lea (pl_inp_slot_6,a6),a4
	jsr SpInp_66N_code
	bne.w loc_03a840

loc_03a73a:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_03a940

loc_03a748:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpChrg_46P_code
	bne.w loc_03a7fc

loc_03a756:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpChrg_28K_code
	bne.w loc_03a7d0

loc_03a764:
	jsr SPButton_Taunt_code
	bne.w loc_03a98c

loc_03a76e:
	rts

;==============================================
loc_03a770:
	tst.b ($28a,a6)
	bne.b loc_03a6fe
	tst.b ($31,a6)
	bne.b loc_03a7aa
	jsr loc_02ef54
	beq.w loc_03a6fe
	jsr loc_02ecd8
	beq.w loc_03a6fe
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_03a7aa:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_03a6fe
	jsr loc_02ed28
	beq.w loc_03a6fe
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	jmp loc_02f980

;==============================================
loc_03a7d0:
	jsr loc_02ed00
	beq.b loc_03a764
	bsr.w loc_03a9f4
	move.l #$2000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
loc_03a7fc:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03a80c
	tst.b ($238,a6)
	bne.w loc_03a756
	bra.b loc_03a816

loc_03a80c:
	cmpi.b #2,($238,a6)
	bcc.w loc_03a756

loc_03a816:
	jsr loc_02ed00
	beq.w loc_03a756
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
loc_03a840:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_03a73a
	tst.b ($23e,a6)
	bne.w loc_03a73a
	jsr loc_02ed00
	beq.w loc_03a73a
	move.l #$2000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;==============================================
loc_03a87a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03a72c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03a72c
	jsr loc_02ecd8
	beq.w loc_03a72c
	move.l #$2001000,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
loc_03a8ba:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_03a71e
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03a71e
	jsr loc_02ecd8
	beq.w loc_03a71e
	bsr.w loc_03a9f4
	move.l #$2001000,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
loc_03a8fc:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03a710
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03a710
	tst.b ($238,a6)
	bne.w loc_03a710
	jsr loc_02ecd8
	beq.w loc_03a710
	move.l #$2001000,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
loc_03a940:
	jsr loc_02edf8
	beq.w loc_03a748

;##############################################
;Alpha Counter A-Ism
;##############################################
loc_03a94a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03a9ba
	move.l #$2000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$1d,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$19,($5f,a4)
	moveq #5,d0
	jmp loc_02a758

;==============================================
loc_03a98c:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03a99a
	tst.b (pl_taunt_count,a6)
	beq.w loc_03a76e

loc_03a99a:
	jsr loc_02ed00
	beq.w loc_03a76e
	move.l #$2000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;##############################################
;Alpha Counter Vism
;##############################################
loc_03a9ba:
	move.l #$2000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$1c,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$18,($5f,a4)
	moveq #5,d0
	jmp loc_02a758

;==============================================
loc_03a9f4:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	rts

;##############################################
;Ai Move Checks
;##############################################
loc_03aa0c:
	move.b (pl_move_id,a6),d0
	move.w loc_03aa18(pc,d0.w),d1
	jmp loc_03aa18(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03aa18:
	dc.w loc_03aa2c-loc_03aa18
	dc.w loc_03aa44-loc_03aa18
	dc.w loc_03aa50-loc_03aa18
	dc.w loc_03aa6a-loc_03aa18
	dc.w loc_03aa78-loc_03aa18
	dc.w loc_03aa2c-loc_03aa18
	dc.w loc_03aa96-loc_03aa18
	dc.w loc_03aa2c-loc_03aa18

	dc.w loc_03aa2c-loc_03aa18
	dc.w loc_03aa30-loc_03aa18

;==============================================
loc_03aa2c:
	bra.w loc_03aaa2

;==============================================
loc_03aa30:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_03aaa6
	tst.b ($23e,a6)
	bne.w loc_03aaa6
	bra.w loc_03aaa2

;==============================================
loc_03aa44:
	tst.b ($238,a6)
	bne.w loc_03aaa6
	bra.w loc_03aaa2

;==============================================
loc_03aa50:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03aaa6
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03aaa6
	clr.l ($84,a6)
	bra.w loc_03aaa2

;==============================================
loc_03aa6a:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03aaa6
	bra.w loc_03aaa2

;==============================================
loc_03aa78:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03aaa6
	tst.b ($238,a6)
	bne.w loc_03aaa6
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_03aaa6
	bra.w loc_03aaa2

;==============================================
loc_03aa96:
	tst.b (pl_taunt_count,a6)
	beq.w loc_03aaa6
	bra.w loc_03aaa2

;----------------------------------------------
loc_03aaa2:
	moveq #1,d0
	rts

loc_03aaa6:
	moveq #0,d0
	rts

;##############################################
;
;##############################################
loc_03aaaa:
	move.b (pl_move_id,a6),d0
	move.w loc_03aab6(pc,d0.w),d1
	jmp loc_03aab6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03aab6:
	dc.w loc_03aaea-loc_03aab6;Flash kick
	dc.w loc_03abc6-loc_03aab6;Sonic boom
	dc.w loc_03ad4e-loc_03aab6;Super Blitz
	dc.w loc_03ae8a-loc_03aab6;Super Flash Kick
	dc.w loc_03b0e6-loc_03aab6;Super Boom
	dc.w loc_03b3ce-loc_03aab6;Alpha Counter Punch
	dc.w loc_03b418-loc_03aab6;Taunt
	dc.w loc_03b464-loc_03aab6;Alpha Counter Kick

	dc.w loc_03b4ae-loc_03aab6;Vism Activate
	dc.w loc_03b530-loc_03aab6;Dash

;##############################################
;
;##############################################
loc_03aaca:
	move.b (pl_move_id,a6),d0
	move.w loc_03aad6(pc,d0.w),d1
	jmp loc_03aad6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03aad6:
	dc.w loc_03aaea-loc_03aad6;Flash kick
	dc.w loc_03abc6-loc_03aad6;Sonic boom
	dc.w loc_03ad4e-loc_03aad6;Super Blitz
	dc.w loc_03ae8a-loc_03aad6;Super Flash Kick
	dc.w loc_03b10a-loc_03aad6;Super Boom
	dc.w loc_03b3ce-loc_03aad6;Alpha Counter Punch
	dc.w loc_03b418-loc_03aad6;Taunt
	dc.w loc_03b464-loc_03aad6;Alpha Counter Kick

	dc.w loc_03b4ae-loc_03aad6;Vism Activate
	dc.w loc_03b530-loc_03aad6;Dash

;==============================================
;Flash Kick Programming
;==============================================
loc_03aaea:
	move.b (7,a6),d0
	move.w loc_03aaf6(pc,d0.w),d1
	jmp loc_03aaf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03aaf6:
	dc.w loc_03aafc-loc_03aaf6
	dc.w loc_03ab56-loc_03aaf6
	dc.w loc_03ab9c-loc_03aaf6

;----------------------------------------------
loc_03aafc:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$18000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03ab22
	neg.l d0

loc_03ab22:
	move.l d0,($40,a6)
	move.l #$ffff8800,($4c,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	move.b d0,d1
	add.w d0,d0
	move.l loc_03ab4a(pc,d0.w),($44,a6)
	moveq #$b,d0
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ab4a:
	dc.l $00070000
	dc.l $00080000
	dc.l $00090000

;----------------------------------------------
loc_03ab56:
	tst.b ($35,a6)
	bne.w loc_03bcc4
	move.b #1,($31,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	bsr.w loc_03abb4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03bcc4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$e,d0
	jmp loc_02a758

;----------------------------------------------
loc_03ab9c:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	jsr loc_02e35a
	bra.w loc_03bcb2

loc_03abb4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts
;==============================================
;Sonic Boom
;==============================================
loc_03abc6:
	move.b (7,a6),d0
	move.w loc_03abd2(pc,d0.w),d1
	jmp loc_03abd2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03abd2:
	dc.w loc_03abd8-loc_03abd2
	dc.w loc_03ac06-loc_03abd2
	dc.w loc_03ad2c-loc_03abd2

;----------------------------------------------
loc_03abd8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($216,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #8,d0
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_03ac06:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_03ad16
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.w loc_03ad16
	addq.b #1,(a4)
	move.w #$300,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	clr.b ($64,a4)
	move.b (PL_ButtonStrength,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a4,($a4,a6)
	move.w a6,($36,a4)
	addq.b #1,($238,a6)
	bsr.w loc_03ad18
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_03ad16
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_03ad16
	jsr loc_01c1c8
	beq.b loc_03ad16
	addq.b #1,(a4)
	move.w #$300,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	clr.b ($64,a4)
	move.b (PL_ButtonStrength,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a4,($a4,a6)
	move.w a6,($36,a4)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_03ad18

loc_03ad16:
	rts

loc_03ad18:
	move.b #8,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_03ad2c:
	cmpi.b #1,($34,a6)
	bne.b loc_03ad3c
	clr.b ($34,a6)
	clr.b ($ce,a6)

loc_03ad3c:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	jsr loc_02f6f8
	bra.w loc_03bcc4

;==============================================
;Super 1
;==============================================
loc_03ad4e:
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_03ad5a(pc,d0.w),d1
	jmp loc_03ad5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ad5a:
	dc.w loc_03ad60-loc_03ad5a
	dc.w loc_03ad7a-loc_03ad5a
	dc.w loc_03ad96-loc_03ad5a

;==============================================
;Super 1 Level 1
;==============================================
loc_03ad60:
	move.b (7,a6),d0
	move.w loc_03ad6c(pc,d0.w),d1
	jmp loc_03ad6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ad6c:
	dc.w loc_03adb4-loc_03ad6c
	dc.w loc_03addc-loc_03ad6c
	dc.w loc_03ae06-loc_03ad6c
	dc.w loc_03ae3c-loc_03ad6c
	dc.w loc_03ae60-loc_03ad6c
	dc.w loc_03ae60-loc_03ad6c
	dc.w loc_03ae7c-loc_03ad6c

;==============================================
;Super 1 Level 2
;==============================================
loc_03ad7a:
	move.b (7,a6),d0
	move.w loc_03ad86(pc,d0.w),d1
	jmp loc_03ad86(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ad86:
	dc.w loc_03adb4-loc_03ad86
	dc.w loc_03addc-loc_03ad86
	dc.w loc_03ae06-loc_03ad86
	dc.w loc_03ae3c-loc_03ad86
	dc.w loc_03ae60-loc_03ad86
	dc.w loc_03ae60-loc_03ad86
	dc.w loc_03ae60-loc_03ad86
	dc.w loc_03ae7c-loc_03ad86

;==============================================
;Super 1 Level 3
;==============================================
loc_03ad96:
	move.b (7,a6),d0
	move.w loc_03ada2(pc,d0.w),d1
	jmp loc_03ada2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ada2:
	dc.w loc_03adb4-loc_03ada2
	dc.w loc_03addc-loc_03ada2
	dc.w loc_03ae06-loc_03ada2
	dc.w loc_03ae3c-loc_03ada2
	dc.w loc_03ae60-loc_03ada2
	dc.w loc_03ae60-loc_03ada2
	dc.w loc_03ae60-loc_03ada2
	dc.w loc_03ae60-loc_03ada2

	dc.w loc_03ae7c-loc_03ada2

;----------------------------------------------
loc_03adb4:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	lsr.b #1,d0
	addi.w #$f,d0
	jmp loc_02a758

;----------------------------------------------
loc_03addc:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,($7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03adf2
	moveq #1,d0

loc_03adf2:
	move.b d0,($ab,a6)
	moveq #$f,d0
	moveq #$4e,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_03ae06:
	jsr loc_03bcc4(pc)
	nop
	tst.b ($35,a6)
	bne.b loc_03ae36
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03ae30
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_03ae30:
	move.b loc_03ae38(pc,d0.w),(pl_invinciblity_timer,a6)

loc_03ae36:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ae38:
	dc.b $04,$06,$08,$00

;----------------------------------------------
loc_03ae3c:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.l #$22000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03ae5a
	neg.l d0

loc_03ae5a:
	move.l d0,($40,a6)
	rts

;----------------------------------------------
loc_03ae60:
	tst.b ($35,a6)
	beq.b loc_03ae6e
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_03ae6e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_03ae7c:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	jmp loc_02a7ea

;==============================================
;Super 2
;==============================================
loc_03ae8a:
	move.b (7,a6),d0
	move.w loc_03ae96(pc,d0.w),d1
	jmp loc_03ae96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ae96:
	dc.w loc_03aea4-loc_03ae96
	dc.w loc_03aef6-loc_03ae96
	dc.w loc_03af20-loc_03ae96
	dc.w loc_03af5a-loc_03ae96
	dc.w loc_03afc8-loc_03ae96
	dc.w loc_03b066-loc_03ae96
	dc.w loc_03b09e-loc_03ae96

;----------------------------------------------
loc_03aea4:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	move.w d0,d1
	add.w d1,d1
	add.w d1,d1
	move.l loc_03aede(pc,d1.w),($40,a6)
	move.l loc_03aede+4(pc,d1.w),($48,a6)
	lsr.w #1,d0
	addi.w #$1b,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03aede:
	dc.l $00060000,$ffff8000
	dc.l $00060000,$ffff8000
	dc.l $00060000,$ffff8000

;----------------------------------------------
loc_03aef6:
	tst.w ($34,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03af0c
	moveq #1,d0

loc_03af0c:
	move.b d0,($ab,a6)
	moveq #-$18,d0
	moveq #$28,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_03af20:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_03af4c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03af46
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_03af46:
	move.b loc_03af56(pc,d0.w),(pl_invinciblity_timer,a6)

loc_03af4c:
	tst.b ($35,a6)
	beq.w loc_03b0b4
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03af56:
	dc.b $05,$0c,$10,00

;----------------------------------------------
loc_03af5a:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_03af4c
	addq.b #2,(7,a6)
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	move.w d0,d1
	lsl.w #3,d1
	move.l loc_03af98(pc,d1.w),($40,a6)
	move.l loc_03af98+4(pc,d1.w),($48,a6)
	move.l loc_03af98+8(pc,d1.w),($44,a6)
	move.l loc_03af98+$c(pc,d1.w),($4c,a6)
	lsr.w #1,d0
	addi.w #$1e,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03af98:
	dc.l $00090000,$ffff8000,$00080000,$ffffa000
	dc.l $000c0000,$ffff8000,$00090000,$ffffa000
	dc.l $00060000,$ffff8000,$00000000,$00000000

;----------------------------------------------
loc_03afc8:
	cmpi.b #2,(PL_ButtonStrength,a6)
	ble.b loc_03b012
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.w loc_03af4c
	tst.b (PL_ButtonStrength,a6)
	beq.w loc_03b048
	addq.b #2,(7,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$21,d0
	jmp loc_02a758

loc_03b012:
	tst.b ($35,a6)
	bne.w loc_03bcc4
	move.b #1,($31,a6)
	bsr.w loc_03b0b4
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03bcc4
	move.w d0,($14,a6)
	clr.b ($31,a6)

loc_03b048:
	jsr loc_00369c
	move.b #$c,(7,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$22,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b066:
	tst.b ($35,a6)
	bne.w loc_03bcc4
	move.b #1,($31,a6)
	bsr.w loc_03b0b4
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03bcc4
	move.w d0,($14,a6)
	clr.b ($31,a6)
	bra.b loc_03b048

;----------------------------------------------
loc_03b09e:
	tst.b ($33,a6)
	bpl.b loc_03b0ae
	jsr loc_02e35a
	bra.w loc_03bcb2

loc_03b0ae:
	jmp loc_02a7ea

loc_03b0b4:
	tst.w ($44,a6)
	bpl.b loc_03b0c2
	move.l #$ffff8000,($4c,a6)

loc_03b0c2:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03b0ce
	neg.l d0

loc_03b0ce:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_03b0e4
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_03b0e4:
	rts

;==============================================
;Super 3 Table 1
;==============================================
loc_03b0e6:
	move.b (7,a6),d0
	move.w loc_03b0f2(pc,d0.w),d1
	jmp loc_03b0f2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b0f2:
	dc.w loc_03b12e-loc_03b0f2
	dc.w loc_03b15c-loc_03b0f2
	dc.w loc_03b188-loc_03b0f2
	dc.w loc_03b1b8-loc_03b0f2
	dc.w loc_03b26a-loc_03b0f2
	dc.w loc_03b1b8-loc_03b0f2
	dc.w loc_03b29e-loc_03b0f2
	dc.w loc_03b1b8-loc_03b0f2

	dc.w loc_03b2d8-loc_03b0f2
	dc.w loc_03b1b8-loc_03b0f2
	dc.w loc_03b316-loc_03b0f2
	dc.w loc_03b324-loc_03b0f2

;==============================================
;Super 3 Table 2
;==============================================
loc_03b10a:
	move.b (7,a6),d0
	move.w loc_03b116(pc,d0.w),d1
	jmp loc_03b116(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b116:
	dc.w loc_03b12e-loc_03b116
	dc.w loc_03b15c-loc_03b116
	dc.w loc_03b188-loc_03b116
	dc.w loc_03b1b8-loc_03b116
	dc.w loc_03b332-loc_03b116
	dc.w loc_03b1b8-loc_03b116
	dc.w loc_03b360-loc_03b116
	dc.w loc_03b1b8-loc_03b116

	dc.w loc_03b396-loc_03b116
	dc.w loc_03b1b8-loc_03b116
	dc.w loc_03b316-loc_03b116
	dc.w loc_03b324-loc_03b116

;----------------------------------------------
loc_03b12e:
	addq.b #2,(7,a6)
	move.b #6,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	lsr.w #1,d0
	addi.w #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b15c:
	jsr loc_02a7ea
	tst.w ($34,a6)
	beq.w loc_03b186
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03b178
	moveq #1,d0

loc_03b178:
	move.b d0,($ab,a6)
	moveq #$34,d0
	moveq #$4c,d1
	jsr loc_082e36

loc_03b186:
	rts

;----------------------------------------------
loc_03b188:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.w loc_03b1b2
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_03b1ac
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_03b1ac
	move.b loc_03b1b4(pc,d0.w),(pl_invinciblity_timer,a6)

loc_03b1b2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b1b4:
	dc.b $02,$04,$06,00

;----------------------------------------------
loc_03b1b8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_03b246
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_03b246
	addq.b #1, (a4)
	move.w #$301,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($35,a6),($64,a4)
	move.b (PL_ButtonStrength,a6),($72,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	movea.l ($1c,a6),a0
	move.w a4,($a4,a6)
	move.w a6,($36,a4)
	addq.b #2,($3a,a6)
	addq.b #1,($238,a6)
	bsr.w loc_03b248

loc_03b246:
	rts

loc_03b248:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_03b264(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;\\
loc_03b264:
	dc.w $000a,$000f,$0014

;----------------------------------------------
loc_03b26a:
	tst.b ($33,a6)
	bmi.b loc_03b290
	tst.w ($34,a6)
	bne.w loc_03bcc4
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #$15,d0
	jmp loc_02a758

loc_03b290:
	move.b #$16,(7,a6)
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b29e:
	tst.b ($33,a6)
	bmi.b loc_03b2ca
	tst.w ($34,a6)
	bne.w loc_03bcc4
	tst.b (PL_ButtonStrength,a6)
	beq.b loc_03b2ca
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #$16,d0
	jmp loc_02a758

loc_03b2ca:
	move.b #$16,(7,a6)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b2d8:
	tst.b ($33,a6)
	bmi.b loc_03b308
	tst.w ($34,a6)
	bne.w loc_03bcc4
	cmpi.b #2,(PL_ButtonStrength,a6)
	bls.w loc_03b308
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #$17,d0
	jmp loc_02a758

loc_03b308:
	move.b #$16,(7,a6)
	moveq #$1a,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b316:
	tst.b ($33,a6)
	bmi.w loc_03bcb8
	jmp loc_02a7ea

;----------------------------------------------
loc_03b324:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	jmp loc_02a7ea

loc_03b332:
	tst.b ($33,a6)
	bmi.b loc_03b352
	tst.w ($34,a6)
	bne.w loc_03bcc4
	subq.b #1,(PL_Directioninput,a6)
	bmi.b loc_03b352
	addq.b #2,(7,a6)
	moveq #$15,d0
	jmp loc_02a758

loc_03b352:
	move.b #$16,(7,a6)
	moveq #$18,d0
	jmp loc_02a758

loc_03b360:
	tst.b ($33,a6)
	bmi.b loc_03b388
	tst.w ($34,a6)
	bne.w loc_03bcc4
	tst.b (PL_ButtonStrength,a6)
	beq.w loc_03b388
	subq.b #1,(PL_Directioninput,a6)
	bmi.b loc_03b388
	addq.b #2,(7,a6)
	moveq #$16,d0
	jmp loc_02a758

loc_03b388:
	move.b #$16,(7,a6)
	moveq #$19,d0
	jmp loc_02a758

loc_03b396:
	tst.b ($33,a6)
	bmi.b loc_03b3c0
	tst.w ($34,a6)
	bne.w loc_03bcc4
	cmpi.b #2,(PL_ButtonStrength,a6)
	bls.w loc_03b3c0
	subq.b #1,(PL_Directioninput,a6)
	bmi.b loc_03b3c0
	addq.b #2,(7,a6)
	moveq #$17,d0
	jmp loc_02a758

loc_03b3c0:
	move.b #$16,(7,a6)
	moveq #$1a,d0
	jmp loc_02a758

;==============================================
;Alpha Counter Punch
;==============================================
loc_03b3ce:
	move.b (7,a6),d0
	move.w loc_03b3da(pc,d0.w),d1
	jmp loc_03b3da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b3da:
	dc.w loc_03b3e0-loc_03b3da
	dc.w loc_03b3f8-loc_03b3da
	dc.w loc_03b40c-loc_03b3da

;----------------------------------------------
loc_03b3e0:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	jsr loc_080e8e
	jmp loc_02a7ea

;----------------------------------------------
loc_03b3f8:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #6,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b40c:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	bra.w loc_03bcb2

;==============================================
;Taunt
;==============================================
loc_03b418:
	move.b (7,a6),d0
	move.w loc_03b424(pc,d0.w),d1
	jmp loc_03b424(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b424:
	dc.w loc_03b428-loc_03b424
	dc.w loc_03b456-loc_03b424

;----------------------------------------------
loc_03b428:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_03b43c
	subq.b #1,(pl_taunt_count,a6)

loc_03b43c:
	clr.b (pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #$25,d0
	btst.b #1,(PL_Directioninput,a6)
	beq.b loc_03b450
	addq.b #1,d0

loc_03b450:
	jmp loc_02a758

;----------------------------------------------
loc_03b456:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	jmp loc_02a7ea


;==============================================
;Alpha Counter Kick
;==============================================
loc_03b464:
	move.b (7,a6),d0
	move.w loc_03b470(pc,d0.w),d1
	jmp loc_03b470(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b470:
	dc.w loc_03b476-loc_03b470
	dc.w loc_03b48e-loc_03b470
	dc.w loc_03b4a2-loc_03b470

;----------------------------------------------
loc_03b476:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	jsr loc_080e8e
	jmp loc_02a7ea

;----------------------------------------------
loc_03b48e:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b4a2
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	bra.w loc_03bcb2

;==============================================
;Vism Activate
;==============================================
loc_03b4ae:
	move.b (7,a6),d0
	move.w loc_03b4ba(pc,d0.w),d1
	jmp loc_03b4ba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b4ba:
	dc.w loc_03b4c0-loc_03b4ba
	dc.w loc_03b4e0-loc_03b4ba
	dc.w loc_03b514-loc_03b4ba

;----------------------------------------------
loc_03b4c0:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_03b4da
	moveq #$2f,d0

loc_03b4da:
	jmp loc_02a708

;----------------------------------------------
loc_03b4e0:
	tst.b ($35,a6)
	beq.b loc_03b50e
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-6,d0
	moveq #$4c,d1
	tst.b ($31,a6)
	beq.b loc_03b504
	moveq #-2,d0
	moveq #$4e,d1

loc_03b504:
	jsr loc_097cd6
	bsr.w loc_03bcee

loc_03b50e:
	jmp loc_02a7ea

;----------------------------------------------
loc_03b514:
	subq.b #1,($3a,a6)
	bne.w loc_03bcc4
	tst.b ($31,a6)
	beq.b loc_03b52a
	move.l #$2000602,(4,a6)

loc_03b52a:
	jmp loc_02f796

;==============================================
;Dash
;==============================================
loc_03b530:
	move.b (7,a6),d0
	move.w loc_03b53c(pc,d0.w),d1
	jmp loc_03b53c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b53c:
	dc.w loc_03b54c-loc_03b53c
	dc.w loc_03b580-loc_03b53c
	dc.w loc_03b5f2-loc_03b53c
	dc.w loc_03b656-loc_03b53c
	dc.w loc_03b66e-loc_03b53c
	dc.w loc_03b6b4-loc_03b53c
	dc.w loc_03b6ea-loc_03b53c
	dc.w loc_03b702-loc_03b53c

;----------------------------------------------
loc_03b54c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.l ($48,a6)
	move.l #$88000,d1
	move.l #$ffffc000,d2
	tst.b (PL_Flip,a6)
	bne.b loc_03b570
	neg.l d1
	neg.l d2

loc_03b570:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #$2f,d0
	jmp loc_02a758

;----------------------------------------------
loc_03b580:
	tst.b ($35,a6)
	bne.b loc_03b5da
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	clr.w ($3a,a6)
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03b5d4
	move.b (PL_Buttons,a6),d0
	move.b ($378,a6),d0
	andi.b #$10,d0
	bne.w loc_03b5d0
	move.b ($378,a6),d0
	andi.b #$20,d0
	bne.w loc_03b5cc
	move.b ($378,a6),d0
	andi.b #$40,d0
	beq.w loc_03b5d4
	addq.w #2,($3a,a6)

loc_03b5cc:
	addq.w #2,($3a,a6)

loc_03b5d0:
	addq.b #2,(7,a6)

loc_03b5d4:
	jmp loc_02a7ea

loc_03b5da:
	move.b #$e,(7,a6)
	jsr loc_085a7e
	jsr loc_0036c0
	jmp loc_02a7ea

;----------------------------------------------
loc_03b5f2:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.l ($48,a6)
	move.l #$ffffc000,($4c,a6)
	move.w ($3a,a6),d0
	move.w d0,d2
	lsr.w #1,d2
	lsl.w #2,d0
	move.l loc_03b63e(pc,d0.w),d1
	move.l loc_03b63e+4(pc,d0.w),($44,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_03b632
	neg.l d1

loc_03b632:
	move.l d1,($40,a6)
	moveq #$2b,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b63e:
	dc.l $00060000,$00030000
	dc.l $00068000,$00030000
	dc.l $00070000,$00030000

;----------------------------------------------
loc_03b656:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03b66c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_03b66c:
	rts

;----------------------------------------------
loc_03b66e:
	bsr.w loc_03b742
	tst.l ($44,a6)
	bpl.b loc_03b6ae
	addq.b #2,(7,a6)
	move.l #0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffff0000,($4c,a6)
	move.l #$10000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03b6a2
	neg.l d0

loc_03b6a2:
	move.l d0,($40,a6)
	moveq #$2e,d0
	jmp loc_02a758

loc_03b6ae:
	jmp loc_02a7ea

;----------------------------------------------
loc_03b6b4:
	bsr.w loc_03b742
	bcc.b loc_03b6c0
	jmp loc_02a7ea

loc_03b6c0:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.w ($16,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #$31,d0
	jmp loc_02a758

loc_03b6e4:
	jmp loc_02a7ea

;----------------------------------------------
loc_03b6ea:
	tst.b ($33,a6)
	bmi.b loc_03b6f6
	jmp loc_02a7ea

loc_03b6f6:
	jsr loc_02e35a
	jmp loc_02bb26

;----------------------------------------------
loc_03b702:
	tst.b ($33,a6)
	bmi.b loc_03b736
	tst.b ($35,a6)
	beq.w loc_03b71a
	clr.b ($35,a6)
	jsr loc_085a7e

loc_03b71a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_03b736:
	jsr loc_02e35a
	jmp loc_02baf2

;End of Specials
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;==============================================
loc_03b742:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	rts

;##############################################
;Throws
;##############################################
loc_03b764:
	cmpi.b #4,($80,a6)
	beq.w loc_03b94a
	move.b (7,a6),d0
	move.w loc_03b780(pc,d0.w),d1
	jsr loc_03b780(pc,d1.w)
	jmp loc_02f9be


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b780:
	dc.w loc_03b792-loc_03b780
	dc.w loc_03b7a6-loc_03b780
	dc.w loc_03b82c-loc_03b780
	dc.w loc_03b83a-loc_03b780
	dc.w loc_03b88c-loc_03b780
	dc.w loc_03b8da-loc_03b780
	dc.w loc_03b904-loc_03b780
	dc.w loc_03b924-loc_03b780

	dc.w loc_03b93e-loc_03b780

;==============================================
loc_03b792:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$27,d0
	jmp loc_02a758

;==============================================
loc_03b7a6:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	moveq #$58,d0
	tst.b ($81,a6)
	beq.b loc_03b7b8
	moveq #$59,d0

loc_03b7b8:
	jsr loc_02e3fe
	beq.w loc_03b820
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03b7e2
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_03b7f6
	bra.b loc_03b7fa

loc_03b7e2:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_03b7fa
	clr.b (PL_Flip,a6)
	btst #1,d0
	bne.b loc_03b7fa

loc_03b7f6:
	addq.b #1,(PL_Flip,a6)

loc_03b7fa:
	move.b #$c,(7,a6)
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_03b81a
	move.b #6,(7,a6)
	moveq #3,d0
	move.w #$b4,($ae,a6)
	clr.w ($3a,a6)

loc_03b81a:
	jmp loc_02a758

loc_03b820:
	addq.b #2,(7,a6)
	moveq #$28,d0
	jmp loc_02a758

;==============================================
loc_03b82c:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	jmp loc_02baf2

;==============================================
loc_03b83a:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_03b85c
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	moveq #$5a,d0
	jsr loc_02e970
	beq.b loc_03b858
	bra.b loc_03b87e

loc_03b858:
	addq.b #1,($3a,a6)

loc_03b85c:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_03bcc4
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_03b87e
	jsr loc_02ea7a
	beq.w loc_03bcc4

loc_03b87e:
	move.b #$a,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;==============================================
loc_03b88c:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_03b8aa
	clr.b ($35,a6)
	moveq #$5a,d0
	jsr loc_02e970
	beq.b loc_03b8a6
	bra.b loc_03b8cc

loc_03b8a6:
	addq.b #1,($3a,a6)

loc_03b8aa:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_03bcc4
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_03b8cc
	jsr loc_02ea7a
	beq.w loc_03bcc4

loc_03b8cc:
	move.b #$a,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;==============================================
loc_03b8da:
	tst.b ($33,a6)
	bmi.w loc_03bcb2
	tst.b ($35,a6)
	beq.w loc_03bcc4
	moveq #$5b,d0
	jsr loc_080b70
	clr.b ($35,a6)
	moveq #$59,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_03b904:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	move.b #$30,($123,a5)
	moveq #$5c,d0
	jsr loc_02e970
	jmp loc_02a7ea

;==============================================
loc_03b924:
	tst.b ($35,a6)
	bpl.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #$58,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_03b93e:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	bra.w loc_03bcb2

;xXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXx
;Air Throws
;xXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXxxXx
loc_03b94a:
	move.b (7,a6),d0
	move.w loc_03b95c(pc,d0.w),d1
	jsr loc_03b95c(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03b95c:
	dc.w loc_03b970-loc_03b95c
	dc.w loc_03b9b8-loc_03b95c
	dc.w loc_03b9c8-loc_03b95c
	dc.w loc_03b9e2-loc_03b95c
	dc.w loc_03b9ee-loc_03b95c
	dc.w loc_03ba20-loc_03b95c
	dc.w loc_03ba3a-loc_03b95c
	dc.w loc_03ba46-loc_03b95c

	dc.w loc_03ba5a-loc_03b95c
	dc.w loc_03baaa-loc_03b95c

;==============================================
loc_03b970:
	moveq #3,d0
	jsr loc_02ef6c
	move.b #4,(7,a6)
	moveq #$52,d0
	tst.b ($81,a6)
	beq.b loc_03b98e
	move.b #$e,(7,a6)
	moveq #$53,d0

loc_03b98e:
	jsr loc_02e636
	beq.b loc_03b9aa
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03b9a2
	jsr loc_01bd5c

loc_03b9a2:
	move.b #$c,($3a,a6)
	rts

loc_03b9aa:
	move.b #2,(7,a6)
	moveq #$2a,d0
	jmp loc_02a758

;==============================================
loc_03b9b8:
	jsr loc_02aa08
	bcc.w loc_03bcc4
	jmp loc_02baf2

;==============================================
loc_03b9c8:
	addq.b #2,(7,a6)
	move.w #$c,($3a,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #1,d0
	jmp loc_02a758

;==============================================
loc_03b9e2:
	subq.w #1,($3a,a6)
	bne.w loc_03bcc4
	addq.b #2,(7,a6)

;==============================================
loc_03b9ee:
	bsr.w loc_03bccc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03bcc4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	move.b #$30,($123,a5)
	moveq #$5d,d0
	jsr loc_02e970
	beq.w loc_03ba18

loc_03ba18:
	moveq #2,d0
	jmp loc_02a758

;==============================================
loc_03ba20:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	moveq #$52,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_03ba3a:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	bra.w loc_03bcb2

;==============================================
loc_03ba46:
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$30,d0
	jmp loc_02a758

;==============================================
loc_03ba5a:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.l #$20000,d0
	tst.b (PL_Flip,a6)
	beq.b loc_03ba78
	neg.l d0

loc_03ba78:
	move.l d0,($40,a6)
	move.l #0,($48,a6)
	move.l #$4a000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$54,d0
	jsr loc_080b70
	moveq #$53,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_03baaa:
	tst.b ($35,a6)
	beq.w loc_03bcc4
	bsr.w loc_03bccc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03bcc4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	bra.w loc_03bcb8

;##############################################
;Winposes
;##############################################
loc_03bace:
	move.b (6,a6),d0
	move.w loc_03bada(pc,d0.w),d1
	jmp loc_03bada(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bada:
	dc.w loc_03bae2-loc_03bada
	dc.w loc_03baf4-loc_03bada
	dc.w loc_03bb0e-loc_03bada
	dc.w loc_03bb5e-loc_03bada

;==============================================
loc_03bae2:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_03baf4:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_03bcc4
	tst.b ($11c,a5)
	bne.w loc_03bcc4
	addq.b #2,(6,a6)
	jmp loc_03bcc4(pc)
	nop

;==============================================
loc_03bb0e:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	tst.b ($2c4,a6)
	bne.w loc_03bb34
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_03bb46(pc,d0.w),d0
	add.b d0,d0
	move.b d0,($2c4,a6)

loc_03bb34:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	ext.w d0
	move.b loc_03bb56(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bb46:
	dc.b $00,$04,$03,$02,$01,$00,$04,$03
	dc.b $02,$01,$00,$04,$03,$02,$01,$00

loc_03bb56:
	dc.b $23,$24,$25,$26,$27,$23,$24,$25

;==============================================
loc_03bb5e:
	move.b ($2c4,a6),d0
	move.w loc_03bb6a(pc,d0.w),d1
	jmp loc_03bb6a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bb6a:
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a
	dc.w loc_03bb78-loc_03bb6a

;----------------------------------------------
loc_03bb78:
	tst.b ($3a,a6)
	beq.w loc_03bcc4
	subq.b #1,($3a,a6)
	bne.w loc_03bcc4
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_03bb96:
	move.b (6,a6),d0
	move.w loc_03bba2(pc,d0.w),d1
	jmp loc_03bba2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bba2:
	dc.w loc_03bbac-loc_03bba2
	dc.w loc_03bc20-loc_03bba2
	dc.w loc_03bc38-loc_03bba2
	dc.w loc_03bc44-loc_03bba2
	dc.w loc_03bc68-loc_03bba2

;----------------------------------------------
loc_03bbac:
	addq.b #2,(6,a6)
	moveq #$22,d0
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	bne.b loc_03bc1a
	tst.b ($125,a4)
	beq.b loc_03bc1a
	move.b #4,(6,a6)
	move.b #$50,($3a,a6)
	eori.b #1,(PL_Flip,a6)
	move.l #0,($40,a6)
	move.l #0,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffdc00,($4c,a6)
	move.w #$f0,($14,a6)
	jsr loc_01c2c8
	beq.w loc_03bc18
	addq.b #1,(a4)
	move.b #$2f,(2,a4)
	move.b (PL_Flip,a6),($31,a4)
	move.w a6,($36,a4)

loc_03bc18:
	moveq #$32,d0

loc_03bc1a:
	jmp loc_02a708

;----------------------------------------------
loc_03bc20:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_03bc38:
	subq.b #1,($3a,a6)
	bpl.w loc_03bcca
	addq.b #2,(6,a6)

;----------------------------------------------
loc_03bc44:
	bsr.w loc_03b742
	bcc.b loc_03bc50
	jmp loc_02a7ea

loc_03bc50:
	addq.b #2,(6,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #$30,d0
	jmp loc_02a708

;----------------------------------------------
loc_03bc68:
	tst.b ($33,a6)
	bpl.w loc_03bcc4
	move.b #2,(6,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$31,d0
	jmp loc_02a708

;==============================================
loc_03bc84:
	move.l #$2040000,(4,a6)
	clr.b ($80,a6)
	rts

;==============================================
loc_03bc92:
	move.l #$2040000,(4,a6)
	move.b #1,($80,a6)
	rts

;==============================================
loc_03bca2:
	move.l #$2040000,(4,a6)
	move.b #2,($80,a6)
	rts

;==============================================
loc_03bcb2:
	jmp 0x2baf2

;==============================================
loc_03bcb8:
	jmp 0x2bb26

;==============================================
loc_03bcbe:
	jmp 0x2a708

;==============================================
loc_03bcc4:
	jmp 0x2a7ea

;==============================================
loc_03bcca:
	rts

;==============================================
loc_03bccc:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_03bcee:
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

;##############################################
;
;##############################################
loc_03bd1e:
	dc.w loc_03bd68-loc_03bd1e
	dc.w loc_03bd68-loc_03bd1e
	dc.w loc_03bd24-loc_03bd1e

loc_03bd24:
	dc.b $09,$0b,$09,$0b,$09,$0b,$00,$00
	dc.b $09,$0b,$00,$00,$09,$0b,$09,$0b
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00

loc_03bd68:
	dc.b $08,$0a,$08,$0a,$08,$0a,$00,$00
	dc.b $07,$09,$00,$00,$08,$0a,$08,$0a
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00
