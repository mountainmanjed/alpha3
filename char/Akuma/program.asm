
;##############################################
loc_037676:
	clr.b ($245,a6)
	jsr loc_01c368
	beq.b loc_03769e
	addq.b #1,(a4)
	move.b #2,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_03769e:
	rts

;##############################################
;
;##############################################
loc_0376a0:
	movea.w ($38,a6),a4
	move.b ($102,a4),d0
	add.w d0,d0
	move.w loc_0376b2(pc,d0.w),d1
	jmp loc_0376b2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0376b2:
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2

	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2

	dc.w loc_0376f2-loc_0376b2
	dc.w loc_03771e-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_03771e-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2

	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2
	dc.w loc_0376f2-loc_0376b2

;==============================================
loc_0376f2:
	tst.b ($33,a6)
	bpl.b loc_037708
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

loc_037708:
	tst.b ($35,a6)
	beq.b loc_037718
	clr.b ($35,a6)
	move.b #$18,($123,a5)

loc_037718:
	jmp loc_02a7ea

;==============================================
loc_03771e:
	move.b (7,a6),d0
	move.w loc_03772a(pc,d0.w),d1
	jmp loc_03772a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03772a:
	dc.w loc_03773a-loc_03772a
	dc.w loc_0377a6-loc_03772a
	dc.w loc_0377d6-loc_03772a
	dc.w loc_037800-loc_03772a
	dc.w loc_037834-loc_03772a
	dc.w loc_03785a-loc_03772a
	dc.w loc_0378c6-loc_03772a
	dc.w loc_0376f2-loc_03772a

;----------------------------------------------
loc_03773a:
	tst.b (PL_cpucontrol,a6)
	sne.b d0
	tst.b ($125,a4)
	sne.b d1
	eor.b d0,d1
	bmi.b loc_037752
	move.b #$e,(7,a6)
	bra.b loc_0376f2

loc_037752:
	addq.b #2,(7,a6)
	jsr loc_01bd5c
	move.l ($10,a6),($48,a6)
	move.w #$ffd0,d0
	move.l #$70000,d1
	move.b ($101,a6),(PL_Flip,a6)
	bne.b loc_03777a
	move.w #$1b0,d0
	neg.l d1

loc_03777a:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.l d1,($40,a6)
	clr.b ($a,a6)
	lea.l ($a,a6),a0
	move.l a0,d4
	jsr loc_083e72
	moveq #$f,d0
	jsr loc_0038e4
	moveq #$29,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0377a6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	swap d0
	move.w ($48,a6),d1
	sub.w ($10,a6),d1
	eor.w d0,d1
	bpl.w loc_03a29c
	addq.b #2,(7,a6)
	move.l ($48,a6),($10,a6)
	move.b #$f,($3a,a6)
	moveq #$2a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0377d6:
	subq.b #1,($3a,a6)
	bpl.b loc_0377fe
	addq.b #2,(7,a6)
	jsr loc_00b652
	movea.w ($38,a6),a4
	move.b #1,(1,a4)
	st.b ($a,a6)
	move.b #$3e,($3a,a6)
	clr.b ($3b,a6)

loc_0377fe:
	rts

;----------------------------------------------
loc_037800:
	addq.b #1,($3b,a6)
	andi.b #3,($3b,a6)
	bne.b loc_037814
	moveq #$68,d0
	jsr loc_080b70

loc_037814:
	subq.b #1,($3a,a6)
	bpl.w loc_03a29c
	addq.b #2,(7,a6)
	jsr loc_00b674
	move.w #$40,($3a,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_037834:
	subq.w #1,($3a,a6)
	bpl.w loc_03a2aa
	addq.b #2,(7,a6)
	move.w #$f0,($3a,a6)
	move.w ($10,a6),($48,a6)
	move.w ($14,a6),($4a,a6)
	moveq #$15,d0
	jmp loc_02a708

;----------------------------------------------
loc_03785a:
	move.w ($3a,a6),d0
	subq.w #4,d0
	move.w d0,($3a,a6)
	andi.w #$1f,d0
	move.w loc_0378a6+2(pc,d0.w),d1
	move.w loc_0378a6(pc,d0.w),d0
	add.w ($48,a6),d0
	add.w ($4a,a6),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	tst.w ($3a,a6)
	bne.w loc_03a2aa
	addq.b #2,(7,a6)
	move.w ($48,a6),($10,a6)
	move.w ($4a,a6),($14,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$a,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0378a6:
	dc.w $0000,$0000
	dc.w $0002,$0002
	dc.w $0000,$0000
	dc.w $fffe,$fffe
	dc.w $0000,$0000
	dc.w $0002,$fffe
	dc.w $0000,$0000
	dc.w $fffe,$0002

;----------------------------------------------
loc_0378c6:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_0378de:
	move.b ($80,a6),d0
	move.w loc_0378ea(pc,d0.w),d1
	jmp loc_0378ea(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0378ea:
	dc.w loc_0378f0-loc_0378ea
	dc.w loc_037af6-loc_0378ea
	dc.w loc_037c62-loc_0378ea

;==============================================
loc_0378f0:
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_0379c4
	move.b (7,a6),d0
	move.w loc_037908(pc,d0.w),d1
	jmp loc_037908(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_037908:
	dc.w loc_03790e-loc_037908
	dc.w loc_037994-loc_037908
	dc.w loc_03799a-loc_037908

;----------------------------------------------
loc_03790e:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	cmpi.b #2,($82,a6)
	bne.b loc_03794a
	btst.b #1,($83,a6)
	beq.b loc_03794a
	move.b #4,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_03794a:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	moveq #0,d1
	move.b ($82,a6),d1
	move.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03797a
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03797a
	btst.b #0,($83,a6)
	bne.b loc_037988
	bra.b loc_037986

loc_03797a:
	move.w loc_03798e(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_037988

loc_037986:
	addq.b #1,d0

loc_037988:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03798e:
	dc.w $0020,$0038,$003a

;----------------------------------------------
loc_037994:
	jmp loc_02f5ac

;----------------------------------------------
loc_03799a:
	tst.b ($33,a6)
	bmi.b loc_0379be
	tst.b ($35,a6)
	beq.b loc_0379b8
	move.l #$20000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0379b4
	neg.l d0

loc_0379b4:
	add.l d0,($10,a6)

loc_0379b8:
	jmp loc_02a7ea

loc_0379be:
	jmp loc_02baf2

;----------------------------------------------
loc_0379c4:
	move.b (7,a6),d0
	move.w loc_0379d0(pc,d0.w),d1
	jmp loc_0379d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0379d0:
	dc.w loc_0379d8-loc_0379d0
	dc.w loc_037a90-loc_0379d0
	dc.w loc_037a96-loc_0379d0
	dc.w loc_037ae4-loc_0379d0

;----------------------------------------------
loc_0379d8:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	cmpi.b #2,($82,a6)
	bne.b loc_037a36
	btst.b #1,($83,a6)
	beq.b loc_037a36
	move.b #4,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.l #$36000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_037a1a
	neg.l d1

loc_037a1a:
	move.l d1,($40,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

loc_037a36:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	moveq #6,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_037a66
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_037a66
	btst.b #0,($83,a6)
	bne.b loc_037a74
	bra.b loc_037a72

loc_037a66:
	move.w loc_037a8a(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_037a74

loc_037a72:
	addq.b #1,d0

loc_037a74:
	cmpi.b #$ff,(PL_ism_choice,a6)
	bne.b loc_037a84
	cmpi.b #$a,d0
	bne.b loc_037a84
	moveq #$22,d0

loc_037a84:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_037a8a:
	dc.w $0030,$0034,$0030

;----------------------------------------------
loc_037a90:
	jmp loc_02f5ac

;----------------------------------------------
loc_037a96:
	tst.b ($35,a6)
	bne.b loc_037ade
	move.b #1,($31,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_037ade
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

loc_037ade:
	jmp loc_02a7ea

;----------------------------------------------
loc_037ae4:
	tst.b ($33,a6)
	bpl.b loc_037ade
	jsr loc_02e35a
	jmp loc_02baf2


;==============================================
loc_037af6:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_037b08(pc,d0.w),d1
	jmp loc_037b08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_037b08:
	dc.w loc_037b0c-loc_037b08
	dc.w loc_037b42-loc_037b08

;----------------------------------------------
loc_037b0c:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_037b38
	addq.b #3,d1

loc_037b38:
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_037b42:
	jmp loc_02f5ac

;==============================================
loc_037b48:
	tst.b ($31,a6)
	beq.b loc_037bb8
	btst.b #1,($83,a6)
	beq.b loc_037b74
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_037bb8
	tst.w ($a4,a6)
	bne.b loc_037bb8
	move.l #$2001000,(4,a6)
	move.b #$12,(pl_move_id,a6)
	bra.b loc_037bac

loc_037b74:
	tst.b ($81,a6)
	beq.b loc_037b8a
	move.l #$2000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	bra.b loc_037bac

loc_037b8a:
	tst.w ($a4,a6)
	bne.b loc_037bb8
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bcc.b loc_037bb8
	move.l #$2000e00,(4,a6)
	move.b #8,(pl_move_id,a6)

loc_037bac:
	move.b #1,(pl_attk_active,a6)
	jmp loc_0382e4(pc)
	nop

loc_037bb8:
	bclr.b #$b,($20b,a6)
	bset.b #9,($20b,a6)
	bra.b loc_037bdc

;##############################################
;
;##############################################
loc_037bc6:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_037bdc
	tst.b (PL_ism_choice,a6)
	bne.b loc_037bdc
	btst.b #3,($20a,a6)
	bne.w loc_037b48

loc_037bdc:
	move.b #4,($80,a6)
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_037c0c
	moveq #$18,d0

loc_037c0c:
	tst.b ($81,a6)
	beq.b loc_037c14
	addq.w #3,d0

loc_037c14:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr Set_Spec_Cancel_Timers
	move.w ($64,a6),d0
	addi.w #$50,d0
	cmp.w ($14,a6),d0
	bcc.b loc_037c60
	tst.b ($3c,a6)
	beq.b loc_037c60
	bmi.b loc_037c60
	tst.b ($81,a6)
	beq.b loc_037c60
	cmpi.b #2,($82,a6)
	bne.b loc_037c60
	btst.b #2,($83,a6)
	beq.b loc_037c60
	move.l #$2000a00,(4,a6)
	moveq #$21,d0
	jmp Set_Spec_Cancel_Timers

loc_037c60:
	rts

;==============================================
loc_037c62:
	move.b (7,a6),d0
	move.w loc_037c6e(pc,d0.w),d1
	jmp loc_037c6e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_037c6e:
	dc.w loc_037c72-loc_037c6e
	dc.w loc_037c90-loc_037c6e

;----------------------------------------------
loc_037c72:
	addq.b #2,(7,a6)
	move.l #$fffb4000,($44,a6)
	move.l #$fffc0000,d0
	tst.b (PL_Flip,a6)
	beq.b loc_037c8c
	neg.l d0

loc_037c8c:
	move.l d0,($40,a6)

;----------------------------------------------
loc_037c90:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_037cb4
	move.w d0,($14,a6)
	jmp loc_02baf2

loc_037cb4:
	jmp loc_02a7ea

;##############################################
;Special Moves
;##############################################
;inputs
loc_037cba:
	jsr SPButton_Vism_code
	bne.w loc_037d86

loc_037cc4:
	lea.l (pl_inp_slot_9,a6),a4
	jsr SpInp_LPLP6LKHP_code
	bne.w loc_037e82

loc_037cd2:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_038110

loc_037ce0:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_632143214P_Code
	bne.w loc_0380cc

loc_037cee:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_23623P_Code
	bne.w loc_037f34

loc_037cfc:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_632A_Code
	bne.w loc_037ef0

loc_037d0a:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_421A_Code
	bne.w loc_037ec2

loc_037d18:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623P_code
	bne.w loc_037ff2

loc_037d26:
	lea.l ($1d8,a6),a4
	jsr SpInp_2369K_Code
	bne.w loc_037dea

loc_037d34:
	lea.l (pl_inp_slot_8,a6),a4
	jsr SpInp_63214P_Code
	bne.w loc_03815c

loc_037d42:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_236P_code
	bne.w loc_03801a

loc_037d50:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_214K_code
	bne.w loc_03808a

loc_037d5e:
	lea.l ($1d0,a6),a4
	jsr SpInp_214P_code
	bne.w loc_037e18

loc_037d6c:
	jsr SPButton_Taunt_code
	bne.w loc_037e54

loc_037d76:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_037faa

loc_037d84:
	rts

;==============================================
;Move ID Writes
;==============================================
loc_037d86:
	tst.b ($28a,a6)
	bne.w loc_037cc4
	tst.b ($31,a6)
	bne.w loc_037dc4
	jsr loc_02ef54
	beq.w loc_037cc4
	jsr loc_02ecd8
	beq.w loc_037cc4
	move.l #$2001000,(4,a6)
	move.b #$1e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_037dc4:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_037cc4
	jsr loc_02ed28
	beq.w loc_037cc4
	move.l #$2001000,(4,a6)
	move.b #$1e,(pl_move_id,a6)
	jmp loc_02f980
 
;==============================================
loc_037dea:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.w loc_037d34
	jsr loc_02ed00
	beq.w loc_037d34
	move.l #$2000e00,(4,a6)
	move.b #$1c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;==============================================
loc_037e18:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.w loc_037d6c
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_037e30
	tst.b (PL_Special_Cancel_Timer,a6)
	bne.w loc_037d6c

loc_037e30:
	jsr loc_02ed00
	beq.w loc_037d6c
	move.l #$2000e00,(4,a6)
	move.b #$1a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;==============================================
loc_037e54:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_037e62
	tst.b (pl_taunt_count,a6)
	beq.w loc_037d76

loc_037e62:
	jsr loc_02ed00
	beq.w loc_037d76
	move.l #$2000e00,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
loc_037e82:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_037cd2
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_037cd2
	jsr loc_02eee0
	beq.w loc_037cd2
	move.l #$2001000,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;==============================================
loc_037ec2:
	jsr loc_02ed00
	beq.w loc_037d18
	move.l #$2000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b (PL_Flip,a6),($3c,a6)
	eori.b #1,($3c,a6)
	bra.w loc_037f14

;==============================================
loc_037ef0:
	jsr loc_02ed00
	beq.w loc_037d0a
	move.l #$2000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b (PL_Flip,a6),($3c,a6)

loc_037f14:
	clr.b ($82,a6)
	clr.b ($81,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.b #7,d0
	cmpi.b #7,d0
	beq.b loc_037f32
	addq.b #2,($81,a6)

loc_037f32:
	rts

;==============================================
loc_037f34:
	tst.b (PL_ism_choice,a6)
	bne.w loc_037cfc
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_037cfc
	jsr loc_02ecd8
	beq.w loc_037cfc
	move.l #$2001000,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;##############################################
;Alpha Counter
;##############################################
loc_037f70:
	move.l #$2000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #$1e,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$1a,($5f,a4)
	moveq #$43,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_037faa:
	jsr loc_02edf8
	beq.w loc_037d84
 
;##############################################
;
;##############################################
loc_037fb4:
	tst.b (PL_ism_choice,a6)
	bne.b loc_037f70
	move.l #$2000e0a,(4,a6)
	clr.b (pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #$19,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	moveq #$44,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_037ff2:
	jsr loc_02ed00
	beq.w loc_037d26
	move.l #$2000e00,(4,a6)
	clr.b (pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;==============================================
loc_03801a:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03802c
	tst.b ($238,a6)
	bne.w loc_037d50
	bra.w loc_038036

loc_03802c:
	cmpi.b #2,($238,a6)
	bcc.w loc_037d50

loc_038036:
	tst.b ($31,a6)
	beq.w loc_038060
	jsr loc_02ed28
	beq.w loc_037d50
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bcc.w loc_037d50
	move.b #8,(pl_move_id,a6)
	bra.b loc_038076

loc_038060:
	jsr loc_02ed00
	beq.w loc_037d50
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_038076:
	move.l #$2000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
loc_03808a:
	tst.b ($31,a6)
	beq.b loc_0380a2
	jsr loc_02ed28
	beq.w loc_037d5e
	move.b #6,(pl_move_id,a6)
	bra.b loc_0380b8

loc_0380a2:
	jsr loc_02ed00
	beq.w loc_037d5e
	move.b #4,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_0380b8:
	move.l #$2000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
loc_0380cc:
	tst.b (PL_ism_choice,a6)
	bne.w loc_037cee
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_037cee
	tst.b ($238,a6)
	bne.w loc_037cee
	jsr loc_02ecd8
	beq.w loc_037cee
	move.l #$2001000,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
loc_038110:
	tst.b (PL_ism_choice,a6)
	bne.w loc_037ce0
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_037ce0
	tst.b ($238,a6)
	bne.w loc_037ce0
	tst.b ($31,a6)
	beq.w loc_037ce0
	jsr loc_02ed1c
	beq.w loc_037ce0
	move.b ($254,a6),($3f,a6)
	move.l #$2001000,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
loc_03815c:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03816c
	tst.b ($238,a6)
	bne.w loc_037d42
	bra.b loc_038176

loc_03816c:
	cmpi.b #2,($238,a6)
	bcc.w loc_037d42

loc_038176:
	jsr loc_02ed00
	beq.w loc_037d42
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.l #$2000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
;Move Checks
;==============================================
loc_0381a0:
	move.b (pl_move_id,a6),d0
	move.w loc_0381ac(pc,d0.w),d1
	jmp loc_0381ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0381ac:
	dc.w loc_0381cc-loc_0381ac;DP
	dc.w loc_0381f4-loc_0381ac;Hadouken
	dc.w loc_0381cc-loc_0381ac;Tatsu
	dc.w loc_038200-loc_0381ac;Air Tatsu
	dc.w loc_03820c-loc_0381ac;Air Hadou
	dc.w loc_038230-loc_0381ac;Super Hadou
	dc.w loc_0381cc-loc_0381ac;Vism AC
	dc.w loc_03824e-loc_0381ac;Super DP

	dc.w loc_0381cc-loc_0381ac;Teleport
	dc.w loc_038264-loc_0381ac;Air SuperBall
	dc.w loc_0381f4-loc_0381ac;Fire Hadou
	dc.w loc_03828a-loc_0381ac;Demon
	dc.w loc_0381d0-loc_0381ac;Taunt
	dc.w loc_0381d8-loc_0381ac;Roll
	dc.w loc_0381cc-loc_0381ac;Grandpa Flip
	dc.w loc_0382a2-loc_0381ac;Vism Activate

;----------------------------------------------
loc_0381cc:
	bra.w loc_0382b0

;----------------------------------------------
loc_0381d0:
	tst.b (pl_taunt_count,a6)
	beq.w loc_0382b4

;----------------------------------------------
loc_0381d8:
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.w loc_0382b4
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0381f0
	tst.b (PL_Special_Cancel_Timer,a6)
	bne.w loc_0382b4

loc_0381f0:
	bra.w loc_0382b0

;----------------------------------------------
loc_0381f4:
	tst.b ($238,a6)
	bne.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_038200:
	tst.b ($31,a6)
	beq.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_03820c:
	tst.b ($238,a6)
	bne.w loc_0382b4
	tst.b ($31,a6)
	beq.w loc_0382b4
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bcc.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_038230:
	tst.b (PL_ism_choice,a6)
	bne.w loc_0382b4
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_0382b4
	tst.b ($238,a6)
	bne.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_03824e:
	tst.b (PL_ism_choice,a6)
	bne.w loc_0382b4
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_038264:
	tst.b (PL_ism_choice,a6)
	bne.w loc_0382b4
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_0382b4
	tst.b ($31,a6)
	beq.w loc_0382b4
	tst.b ($238,a6)
	bne.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_03828a:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_0382b4
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_0382a2:
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_0382b4
	bra.w loc_0382b0

;----------------------------------------------
loc_0382b0:
	moveq #1,d0
	rts

;----------------------------------------------
loc_0382b4:
	moveq #0,d0
	rts

;##############################################
;Special move 
;##############################################
loc_0382b8:
	move.b (pl_move_id,a6),d0
	move.w loc_0382c4(pc,d0.w),d1
	jmp loc_0382c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0382c4:
	dc.w loc_038310-loc_0382c4;DP
	dc.w loc_0384a2-loc_0382c4;Hadouken
	dc.w loc_038624-loc_0382c4;Tatsu
	dc.w loc_03874a-loc_0382c4;Air Tatsu
	dc.w loc_038878-loc_0382c4;Air Hadou
	dc.w loc_038a88-loc_0382c4;Super Hadou
	dc.w loc_038be6-loc_0382c4;Vism AC
	dc.w loc_038c08-loc_0382c4;Super DP

	dc.w loc_038e86-loc_0382c4;Teleport
	dc.w loc_038f9e-loc_0382c4;Air SuperBall
	dc.w loc_0391d6-loc_0382c4;Fire Hadou
	dc.w loc_03939a-loc_0382c4;Demon
	dc.w loc_039532-loc_0382c4;Taunt
	dc.w loc_039586-loc_0382c4;Roll
	dc.w loc_039602-loc_0382c4;Grandpa Flip
	dc.w loc_039e52-loc_0382c4;Vism Activate

;##############################################
;Special move 
;##############################################
loc_0382e4:
	move.b (pl_move_id,a6),d0
	move.w loc_0382f0(pc,d0.w),d1
	jmp loc_0382f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0382f0:
	dc.w loc_038310-loc_0382f0;DP
	dc.w loc_0384a2-loc_0382f0;Hadouken
	dc.w loc_038624-loc_0382f0;Tatsu
	dc.w loc_03874a-loc_0382f0;Air Tatsu
	dc.w loc_038878-loc_0382f0;Air Hadou
	dc.w loc_038a88-loc_0382f0;Super Hadou
	dc.w loc_038be6-loc_0382f0;Vism AC
	dc.w loc_038c08-loc_0382f0;Super DP

	dc.w loc_038e12-loc_0382f0;Teleport
	dc.w loc_038f9e-loc_0382f0;Air SuperBall
	dc.w loc_0391d6-loc_0382f0;Fire Hadou
	dc.w loc_03939a-loc_0382f0;Demon
	dc.w loc_039532-loc_0382f0;Taunt
	dc.w loc_039586-loc_0382f0;Roll
	dc.w loc_039634-loc_0382f0;Grandpa Flip
	dc.w loc_039e52-loc_0382f0;Vism Activate

;==============================================
loc_038310:
	move.b (7,a6),d0
	move.w loc_03831c(pc,d0.w),d1
	jmp loc_03831c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03831c:
	dc.w loc_038328-loc_03831c
	dc.w loc_0383a4-loc_03831c
	dc.w loc_0383ba-loc_03831c
	dc.w loc_0383ec-loc_03831c
	dc.w loc_038428-loc_03831c
	dc.w loc_038446-loc_03831c

;----------------------------------------------
loc_038328:
	addq.b #2,(7,a6)
	clr.l ($84,a6)
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d1
	ext.w d1
	lsl.w #3,d1
	move.l loc_038374(pc,d1.w),($40,a6)
	move.l loc_038374+4(pc,d1.w),($44,a6)
	move.l loc_038374+8(pc,d1.w),($48,a6)
	move.l loc_038374+$c(pc,d1.w),($4c,a6)
	moveq #7,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038374:
	dc.l $00040000,$00050000,$ffff8000,$ffffa000
	dc.l $00060000,$00070000,$ffff8000,$ffffa000
	dc.l $00080000,$00090000,$ffff8000,$ffffa000

;----------------------------------------------
loc_0383a4:
	tst.b ($35,a6)
	bne.b loc_0383b4
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_0383b4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0383ba:
	bsr.w loc_038490
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_038408
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_0383d4
	neg.l d0

loc_0383d4:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0383e6
	addq.b #2,(7,a6)

loc_0383e6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0383ec:
	bsr.w loc_038490
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_038408
	tst.b ($35,a6)
	bne.b loc_038406
	jmp loc_02a7ea

loc_038406:
	rts

loc_038408:
	addq.b #2,(7,a6)
	jsr loc_00369c
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b (pl_attk_active,a6)
	clr.b ($ce,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_038428:
	tst.b ($33,a6)
	bpl.b loc_03843a
	jsr loc_02e35a
	jmp loc_02baf2

loc_03843a:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_038446:
	tst.b ($33,a6)
	bpl.b loc_03847a
	move.b #2,(7,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$45,d0
	jmp Set_Char_Special_Ani

loc_03847a:
	tst.b ($35,a6)
	beq.b loc_03848a
	clr.b ($35,a6)
	jsr loc_080e8e

loc_03848a:
	jmp loc_02a7ea

loc_038490:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_0384a2:
	move.b (7,a6),d0
	move.w loc_0384ae(pc,d0.w),d1
	jmp loc_0384ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0384ae:
	dc.w loc_0384b4-loc_0384ae
	dc.w loc_0384dc-loc_0384ae
	dc.w loc_038600-loc_0384ae

;----------------------------------------------
loc_0384b4:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$15,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0384dc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_0385ea
	addq.b #2,(7,a6)
	move.b #4,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_0385ea
	addq.b #1,(a4)
	move.w #$200,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
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
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0385ec
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_0385ea
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_0385ea
	jsr loc_01c1c8
	beq.b loc_0385ea
	addq.b #1,(a4)
	move.w #$200,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
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
	move.w a6,($36,a4)
	move.b ($2a7,a6),($dc,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0385ec

loc_0385ea:
	rts

loc_0385ec:
	move.b #$b,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_038600:
	tst.b ($33,a6)
	bmi.w loc_03a29e
	tst.b ($3a,a6)
	beq.b loc_038618
	subq.b #1,($3a,a6)
	bne.b loc_03861e
	clr.b ($ce,a6)

loc_038618:
	jsr loc_02f6f8

loc_03861e:
	jmp loc_02a7ea

;==============================================
loc_038624:
	move.b (7,a6),d0
	move.w loc_038630(pc,d0.w),d1
	jmp loc_038630(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038630:
	dc.w loc_03863a-loc_038630
	dc.w loc_0386a6-loc_038630
	dc.w loc_0386e6-loc_038630
	dc.w loc_03870c-loc_038630
	dc.w loc_038738-loc_038630

;----------------------------------------------
loc_03863a:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.w ($16,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_038696(pc,d0.w),d0
	tst.b (PL_Flip,a6)
	bne.b loc_038680
	neg.l d0

loc_038680:
	move.l d0,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_0386a2(pc,d0.w),d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038696:
	dc.l $00028000,$00032000,$0003c000

loc_0386a2:
	dc.b $0a,$0b,$0c,00

;----------------------------------------------
loc_0386a6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_0386e0
	addq.b #2,(7,a6)
	moveq #$e,d1
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($1ff,a6)
	bne.b loc_0386d6
	addq.b #1,($1ff,a6)

loc_0386d6:
	lsr.b #1,d0
	add.w d1,d0
	jmp Set_Char_Special_Ani

loc_0386e0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0386e6:
	tst.b ($33,a6)
	bpl.b loc_0386fe
	subq.b #1,($1ff,a6)
	bne.b loc_0386fe
	addq.b #2,(7,a6)
	moveq #$d,d0
	jmp Set_Char_Special_Ani

loc_0386fe:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_03870c:
	bsr.w loc_038856
	bcs.b loc_038732
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

loc_038732:
	jmp loc_02a7ea

;----------------------------------------------
loc_038738:
	tst.b ($33,a6)
	bpl.b loc_038732
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================
;Air Tatsu
;==============================================
loc_03874a:
	move.b (7,a6),d0
	move.w loc_038756(pc,d0.w),d1
	jmp loc_038756(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038756:
	dc.w loc_038760-loc_038756
	dc.w loc_0387d8-loc_038756
	dc.w loc_0387fc-loc_038756
	dc.w loc_038814-loc_038756
	dc.w loc_03883e-loc_038756

;----------------------------------------------
loc_038760:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0387a6(pc,d0.w),d1
	move.l loc_0387a6+4(pc,d0.w),($4c,a6)
	tst.b ($3c,a6)
	bpl.b loc_03879a
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)

loc_03879a:
	tst.l ($40,a6)
	beq.b loc_0387be
	bpl.b loc_0387c6
	neg.l d1
	bra.b loc_0387c6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0387a6:
	dc.l $00010000,$ffffb000
	dc.l $00018000,$ffffc000
	dc.l $00020000,$ffffd000

;----------------------------------------------
loc_0387be:
	tst.b (PL_Flip,a6)
	bne.b loc_0387c6
	neg.l d1

loc_0387c6:
	add.l d1,($40,a6)
	move.b #3,($1ff,a6)
	moveq #$12,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0387d8:
	bsr.w loc_038856
	bcc.b loc_03881a
	tst.b ($33,a6)
	bpl.b loc_0387f6
	subq.b #1,($1ff,a6)
	bne.b loc_0387f6
	addq.b #2,(7,a6)
	moveq #$d,d0
	jmp Set_Char_Special_Ani

loc_0387f6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0387fc:
	bsr.w loc_038856
	bcc.b loc_03881a
	tst.b ($33,a6)
	bpl.b loc_0387f6
	addq.b #2,(7,a6)
	moveq #$21,d0
	jmp loc_02a708

;----------------------------------------------
loc_038814:
	bsr.w loc_038856
	bcs.b loc_0387f6

loc_03881a:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_03883e:
	tst.b ($33,a6)
	bpl.b loc_038850
	jsr loc_02e35a
	jmp loc_02baf2

loc_038850:
	jmp loc_02a7ea

loc_038856:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	rts

;==============================================
;Air Hadou
;==============================================
loc_038878:
	move.b (7,a6),d0
	move.w loc_038884(pc,d0.w),d1
	jmp loc_038884(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038884:
	dc.w loc_03888e-loc_038884
	dc.w loc_0388b4-loc_038884
	dc.w loc_038a1e-loc_038884
	dc.w loc_038a42-loc_038884
	dc.w loc_038a76-loc_038884

;----------------------------------------------
loc_03888e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #2,($294,a6)
	moveq #$1c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0388b4:
	jsr loc_02aa08
	bcc.b loc_0388da
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	move.l #$2000604,(4,a6)
	moveq #$11,d0
	jmp loc_02a708

loc_0388da:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	bne.w loc_038a08
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_01c1c8
	beq.w loc_038a08
	addq.b #1,(a4)
	move.w #$202,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	addq.b #6,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_038a0a
	move.l #$ffffd800,($4c,a6)
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_038a08
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_038a08
	jsr loc_01c1c8
	beq.w loc_038a08
	addq.b #1,(a4)
	move.w #$202,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	addq.b #6,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_038a0a

loc_038a08:
	rts

loc_038a0a:
	move.b #8,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_038a1e:
	jsr loc_02aa08
	bcs.b loc_038a4a
	tst.b ($33,a6)
	bpl.b loc_038a3c
	addq.b #2,(7,a6)
	clr.b (pl_attk_active,a6)
	moveq #$21,d0
	jmp loc_02a708

loc_038a3c:
	jmp loc_02a7ea

;----------------------------------------------
loc_038a42:
	jsr loc_02aa08
	bcc.b loc_038a3c

loc_038a4a:
	move.b #8,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$1d,d0
	cmpi.b #1,($3c,a6)
	beq.b loc_038a70
	addq.b #1,d0

loc_038a70:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_038a76:
	tst.b ($33,a6)
	bpl.b loc_038a82
	jmp loc_02bb26

loc_038a82:
	jmp loc_02a7ea

;==============================================
;Messatsu Hadou
;==============================================
loc_038a88:
	move.b (7,a6),d0
	move.w loc_038a94(pc,d0.w),d1
	jmp loc_038a94(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038a94:
	dc.w loc_038a9c-loc_038a94
	dc.w loc_038ac0-loc_038a94
	dc.w loc_038af6-loc_038a94
	dc.w loc_038b2e-loc_038a94

;----------------------------------------------
loc_038a9c:
	addq.b #2,(7,a6)
	move.b #$36,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$1f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_038ac0:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_038af0
	addq.b #2,($7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_038ad8
	moveq #1,d0

loc_038ad8:
	move.b d0,($ab,a6)
	moveq #$1e,d0
	moveq #$30,d1
	jsr loc_082e36
	moveq #-$2c,d0;d4
	moveq #$30,d1
	jsr loc_082df2

loc_038af0:
	jmp loc_02a7ea

;----------------------------------------------
loc_038af6:
	subq.b #1,($3a,a6)
	bpl.b loc_038af0
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_038b12
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_038b12:
	move.b loc_038b2a(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$46,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038b2a:
	dc.b $02,$04,$06,$00

;----------------------------------------------
loc_038b2e:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_038bbe
	tst.b ($35,a6)
	beq.b loc_038bbc
	clr.b ($35,a6)
	jsr loc_01c1c8
	beq.b loc_038bbc
	addq.b #1,(a4)
	move.w #$206,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3f,a6),($3f,a4)
	moveq #$12,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	moveq #3,d0
	add.b ($82,a6),d0
	move.w d0,($50,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_038bc4

loc_038bbc:
	rts

loc_038bbe:
	jmp loc_02baf2

loc_038bc4:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_038be0(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038be0:
	dc.w $000a,$000c,$000d

;==============================================
;Alpha Counter
;==============================================
loc_038be6:
	tst.b ($33,a6)
	bpl.b loc_038bf2
	jmp loc_02baf2

loc_038bf2:
	tst.b ($35,a6)
	beq.b loc_038c02
	clr.b ($35,a6)
	jsr loc_080e8e

loc_038c02:
	jmp loc_02a7ea

;==============================================
;Shoryu Super
;==============================================
loc_038c08:
	move.b (7,a6),d0
	move.w loc_038c14(pc,d0.w),d1
	jmp loc_038c14(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038c14:
	dc.w loc_038c22-loc_038c14
	dc.w loc_038c60-loc_038c14
	dc.w loc_038c8e-loc_038c14
	dc.w loc_038d50-loc_038c14
	dc.w loc_038da0-loc_038c14
	dc.w loc_038dbc-loc_038c14
	dc.w loc_038dfa-loc_038c14

;----------------------------------------------
;State 00
;----------------------------------------------
loc_038c22:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$26,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
;State 02
;----------------------------------------------
loc_038c60:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_038c88
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_038c7a
	moveq #1,d0

loc_038c7a:
	move.b d0,($ab,a6)
	moveq #-$12,d0
	moveq #$30,d1
	jsr loc_082e36

loc_038c88:
	jmp loc_02a7ea

;----------------------------------------------
;State 04
;----------------------------------------------
loc_038c8e:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_038ce2
	addq.b #2,(7,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_038cca(pc,d0.w),($40,a6)
	move.l loc_038cca+4(pc,d0.w),($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038cca:
	dc.l $00080000,$00080000
	dc.l $000a0000,$00090000
	dc.l $000c0000,$000a0000

;----------------------------------------------
loc_038ce2:
	cmpi.b #2,($35,a6)
	bne.b loc_038cfe
	clr.b ($35,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)

loc_038cfe:
	tst.b ($35,a6)
	bne.b loc_038d4a
	tst.b ($ab,a6)
	beq.b loc_038d28
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_038d20
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_038d20:
	move.b loc_038d4c(pc,d0.w),(pl_invinciblity_timer,a6)
	rts

loc_038d28:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_038d34
	neg.l d0

loc_038d34:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_038d4a
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_038d4a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038d4c:
	dc.b $05,$08,$1d,$00

;----------------------------------------------
;State 06
;----------------------------------------------
loc_038d50:
	move.b #2,($23f,a6)
	tst.w ($40,a6)
	bmi.b loc_038d96
	tst.b ($35,a6)
	bne.b loc_038d78
	move.b #1,($31,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)

loc_038d78:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_038d84
	neg.l d0

loc_038d84:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_038d96
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
;State 08
;----------------------------------------------
loc_038da0:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_038db6
	addq.b #2,(7,a6)

loc_038db6:
	jmp loc_02a7ea

;----------------------------------------------
;State 0a
;----------------------------------------------
loc_038dbc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_038dde
	tst.b ($35,a6)
	beq.b loc_038df4
	rts

loc_038dde:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c

loc_038df4:
	jmp loc_02a7ea

;----------------------------------------------
;State 0c
;----------------------------------------------
loc_038dfa:
	tst.b ($33,a6)
	bpl.b loc_038e0c
	jsr loc_02e35a
	jmp loc_02baf2

loc_038e0c:
	jmp loc_02a7ea

;==============================================
;Teleport1
;==============================================
loc_038e12:
	move.b (7,a6),d0
	move.w loc_038e1e(pc,d0.w),d1
	jmp loc_038e1e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038e1e:
	dc.w loc_038e26-loc_038e1e
	dc.w loc_038eee-loc_038e1e
	dc.w loc_038f0a-loc_038e1e
	dc.w loc_038f6c-loc_038e1e

;----------------------------------------------
loc_038e26:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_attk_active,a6)
	move.b (PL_Flip,a6),d0
	move.b ($211,a6),d1
	eor.b d1,d0
	move.b d0,($3c,a6)
	jsr loc_020674
	move.l #$ffffd000,($48,a6)
	move.l #$b8000,d0
	tst.b ($81,a6)
	beq.b loc_038e62
	move.l #$80000,d0

loc_038e62:
	move.l d0,($40,a6)
	st.b ($245,a6)
	moveq #$14,d0
	tst.b ($3e,a6)
	beq.b loc_038e76
	clr.b ($245,a6)

loc_038e76:
	jsr Set_Char_Special_Ani
	jsr loc_083dda
	bra.w loc_038f90

;==============================================
;Teleport2
;==============================================
loc_038e86:
	move.b (7,a6),d0
	move.w loc_038e92(pc,d0.w),d1
	jmp loc_038e92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038e92:
	dc.w loc_038e9a-loc_038e92
	dc.w loc_038eee-loc_038e92
	dc.w loc_038f0a-loc_038e92
	dc.w loc_038f6c-loc_038e92

;----------------------------------------------
loc_038e9a:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	st.b ($245,a6)
	jsr loc_020674
	move.l #$ffffd000,($48,a6)
	move.l #$b8000,d0
	tst.b ($81,a6)
	beq.b loc_038ece
	move.l #$80000,d0

loc_038ece:
	move.l d0,($40,a6)
	moveq #$14,d0
	tst.b ($3e,a6)
	beq.b loc_038ede
	clr.b ($245,a6)

loc_038ede:
	jsr Set_Char_Special_Ani
	jsr loc_083dda
	bra.w loc_038f90

;----------------------------------------------
loc_038eee:
	tst.b ($33,a6)
	bpl.b loc_038efa
	addq.b #2,(7,a6)
	bra.b loc_038f0a

loc_038efa:
	move.b ($35,a6),d0
	ext.w d0
	add.w d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_038f0a:
	move.l ($40,a6),d0
	tst.b ($3c,a6)
	bne.b loc_038f16
	neg.l d0

loc_038f16:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b ($3c,a6),d0
	btst d0,($ac,a6)
	beq.b loc_038f38
	st.b ($29d,a6)
	bra.b loc_038f50

loc_038f38:
	move.l #$30000,d0
	tst.b ($81,a6)
	beq.b loc_038f4a
	move.l #$24000,d0

loc_038f4a:
	cmp.l ($40,a6),d0
	bcs.b loc_038f66

loc_038f50:
	addq.b #2,(7,a6)
	move.b #$a,($3a,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	jmp loc_02a708

loc_038f66:
	jmp loc_02a7ea

;----------------------------------------------
loc_038f6c:
	subq.b #1,($3a,a6)
	bne.b loc_038f84
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02e35a
	jmp loc_02baf2

loc_038f84:
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_038f90:
	tst.b ($3e,a6)
	bne.b loc_038f9c
	move.b #$22,($2a0,a6)

loc_038f9c:
	rts

;==============================================
;Air Super Hadou
;==============================================
loc_038f9e:
	move.b (7,a6),d0
	move.w loc_038faa(pc,d0.w),d1
	jmp loc_038faa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038faa:
	dc.w loc_038fb6-loc_038faa
	dc.w loc_038fe8-loc_038faa
	dc.w loc_039058-loc_038faa
	dc.w loc_039112-loc_038faa
	dc.w loc_039174-loc_038faa
	dc.w loc_03919c-loc_038faa

;----------------------------------------------
loc_038fb6:
	addq.b #2,(7,a6)
	move.b #1,($216,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$21,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_038fe4:
	dc.b $02,$04,$06,$00

;----------------------------------------------
loc_038fe8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03904e
	bpl.b loc_039014
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_03900c
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_03900c:
	move.b loc_038fe4(pc,d0.w),(pl_invinciblity_timer,a6)
	rts

loc_039014:
	tst.b ($ab,a6)
	bne.b loc_03902e
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_039024
	moveq #1,d0

loc_039024:
	move.b d0,($ab,a6)
	jsr loc_003814

loc_03902e:
	moveq #0,d1
	move.b ($35,a6),d1
	clr.b ($35,a6)
	subq.b #1,d1
	lsl.w #2,d1
	move.w loc_039050(pc,d1.w),d0
	move.w loc_039050+2(pc,d1.w),d1
	ext.w d0
	ext.w d1
	jmp loc_082df2

loc_03904e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039050:
	dc.w $ffcc,$002c
	dc.w $ffc0,$002e

;----------------------------------------------
loc_039058:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	bne.w loc_0390ee
	addq.b #2,(7,a6)
	move.b #8,($3a,a6)
	jsr loc_01c1c8
	beq.b loc_0390ee
	addq.b #1,(a4)
	move.w #$208,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($59,a6),($59,a4)
	moveq #$18,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	moveq #3,d0
	add.b ($82,a6),d0
	move.w d0,($50,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0390f0

loc_0390ee:
	rts

;----------------------------------------------
loc_0390f0:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_03910c(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03910c:
	dc.w $0009,$000a,$000c

;----------------------------------------------
loc_039112:
	tst.b ($3a,a6)
	beq.b loc_03914e
	subq.b #1,($3a,a6)
	bne.b loc_03916e
	move.l #$10000,d0
	move.l #$74000,($44,a6)
	move.l #$fffffd80,d1
	move.l #$ffffb000,($4c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_039144
	neg.l d0
	neg.l d1

loc_039144:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	bra.b loc_03916e

loc_03914e:
	jsr loc_02aa08
	bcs.w loc_0391ae
	tst.b ($33,a6)
	bpl.b loc_03916e
	addq.b #2,(7,a6)
	clr.b (pl_attk_active,a6)
	moveq #$21,d0
	jmp loc_02a708

loc_03916e:
	jmp loc_02a7ea

;----------------------------------------------
loc_039174:
	jsr loc_02aa08
	bcc.b loc_03916e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	moveq #$24,d0
	cmpi.b #1,($3c,a6)
	beq.b loc_039196
	moveq #$25,d0

loc_039196:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03919c:
	tst.b ($33,a6)
	bpl.b loc_0391a8
	jmp loc_02bb26

loc_0391a8:
	jmp loc_02a7ea

loc_0391ae:
	move.b #$a,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$24,d0
	cmpi.b #1,($3c,a6)
	beq.b loc_0391d0
	moveq #$25,d0

loc_0391d0:
	jmp Set_Char_Special_Ani

;==============================================
;Red Hadou
;==============================================
loc_0391d6:
	move.b (7,a6),d0
	move.w loc_0391e2(pc,d0.w),d1
	jmp loc_0391e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0391e2:
	dc.w loc_0391ea-loc_0391e2
	dc.w loc_03920a-loc_0391e2
	dc.w loc_03922a-loc_0391e2
	dc.w loc_039376-loc_0391e2

;----------------------------------------------
loc_0391ea:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$18,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03920a:
	tst.b ($33,a6)
	bpl.b loc_039224
	addq.b #2,(7,a6)
	move.b ($82,a6),d1
	lsr.b #1,d1
	moveq #$19,d0
	add.b d1,d0
	jsr Set_Char_Special_Ani

loc_039224:
	jmp loc_02a7ea

;----------------------------------------------
loc_03922a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_039352
	addq.b #2,(7,a6)
	move.b #6,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_039352
	addq.b #1,(a4)
	move.w #$204,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	addi.b #$c,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$2,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.w d0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_039354
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_039352
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_039352
	jsr loc_01c1c8
	beq.b loc_039352
	addq.b #1,(a4)
	move.w #$204,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	addi.b #$c,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #2,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.w d0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_039354

loc_039352:
	rts

;----------------------------------------------
loc_039354:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_039370(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039370:
	dc.w $000b,$0006,$0004

;----------------------------------------------
loc_039376:
	tst.b ($33,a6)
	bmi.w loc_03a29e
	tst.b ($3a,a6)
	beq.b loc_03938e
	subq.b #1,($3a,a6)
	bne.b loc_039394
	clr.b ($ce,a6)

loc_03938e:
	jsr loc_02f6f8

loc_039394:
	jmp loc_02a7ea

;==============================================
;Shun Goku Satsu
;==============================================
loc_03939a:
	move.b (7,a6),d0
	move.w loc_0393ac(pc,d0.w),d1
	jsr loc_0393ac(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0393ac:
	dc.w loc_0393be-loc_0393ac
	dc.w loc_0393fe-loc_0393ac
	dc.w loc_039442-loc_0393ac
	dc.w loc_03945c-loc_0393ac
	dc.w loc_03946c-loc_0393ac
	dc.w loc_0394c0-loc_0393ac
	dc.w loc_0394de-loc_0393ac
	dc.w loc_0394fe-loc_0393ac

	dc.w loc_03950c-loc_0393ac

;----------------------------------------------
loc_0393be:
	addq.b #2,(7,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	move.b #$32,($3a,a6)
	move.b (PL_Flip,a6),($3c,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_0805c0
	move.l #$ffffff70,d0
	jsr loc_02ef6c
	jsr loc_02068c
	moveq #$29,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0393fe:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_03943c
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_039416
	moveq #1,d0

loc_039416:
	move.b d0,($ab,a6)
	move.b #$30,($3b,a6)
	move.l #$48000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03942e
	neg.l d0

loc_03942e:
	move.l d0,($40,a6)
	moveq #-$10,d0
	moveq #$58,d1
	jsr loc_082e36

loc_03943c:
	jmp loc_02a7ea

;----------------------------------------------
loc_039442:
	subq.b #1,($3a,a6)
	bpl.b loc_039456
	addq.b #4,(7,a6)
	clr.b ($ab,a6)
	move.b #4,($3a,a6)

loc_039456:
	jmp loc_02a7ea

;----------------------------------------------
loc_03945c:
	subq.b #1,($3a,a6)
	bne.b loc_039466
	addq.b #2,(7,a6)

loc_039466:
	jmp loc_02a7ea

;----------------------------------------------
loc_03946c:
	subq.b #1,($3b,a6)
	beq.w loc_0394ac
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.b ($3c,a6),d0
	btst d0,($ac,a6)
	bne.w loc_0394ac
	moveq #$5d,d0
	jsr loc_02e3fe
	bne.w loc_03949a
	jmp loc_02a7ea

loc_03949a:
	addq.b #2,(7,a6)
	move.b #$10,($3b,a6)
	moveq #$2a,d0
	jmp Set_Char_Special_Ani

loc_0394ac:
	move.b #$10,(7,a6)
	move.b #8,($3a,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_0394c0:
	subq.b #1,($3b,a6)
	bne.b loc_0394dc
	addq.b #2,(7,a6)
	move.b #$3c,($3b,a6)
	jsr loc_00b652
	jmp loc_02a7ea

loc_0394dc:
	rts

;----------------------------------------------
loc_0394de:
	subq.b #1,($3b,a6)
	bne.b loc_0394fa
	addq.b #2,(7,a6)
	moveq #$66,d0
	jsr loc_02e970
	jsr loc_00b674
	bra.w loc_03951a

loc_0394fa:
	bra.w loc_03a2b0

;----------------------------------------------
loc_0394fe:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	jmp loc_02baf2

;----------------------------------------------
loc_03950c:
	subq.b #1,($3a,a6)
	bne.w loc_03a2aa
	jmp loc_02baf2

loc_03951a:
	jsr loc_02a7ea
	movea.w ($38,a6),a0
	move.b #1,($2ca,a0)
	moveq #$5d,d0
	jmp loc_02e720

;==============================================
;Taunt
;==============================================
loc_039532:
	move.b (7,a6),d0
	move.w loc_03953e(pc,d0.w),d1
	jmp loc_03953e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03953e:
	dc.w loc_039542-loc_03953e
	dc.w loc_039568-loc_03953e

;----------------------------------------------
loc_039542:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_039556
	subq.b #1,(pl_taunt_count,a6)

loc_039556:
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #2,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_039568:
	tst.b ($33,a6)
	bmi.w loc_03a29e
	tst.b ($35,a6)
	beq.b loc_039580
	clr.b ($35,a6)
	move.b #$18,($123,a5)

loc_039580:
	jmp loc_02a7ea

;==============================================
;Roll
;==============================================
loc_039586:
	move.b (7,a6),d0
	move.w loc_039592(pc,d0.w),d1
	jmp loc_039592(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039592:
	dc.w loc_039596-loc_039592
	dc.w loc_0395dc-loc_039592

;----------------------------------------------
loc_039596:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	clr.b (pl_attk_active,a6)
	move.b #1,($31,a6)
	jsr loc_020674
	move.l #$40000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_0395c4
	neg.l d1

loc_0395c4:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.l #$2b,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0395dc:
	tst.b ($33,a6)
	bpl.b loc_0395ee
	jsr loc_02e35a
	jmp loc_02bb26

loc_0395ee:
	tst.b ($35,a6)
	bne.b loc_0395fc
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_0395fc:
	jmp loc_02a7ea

;==============================================
;Flip 1
;==============================================
loc_039602:
	move.b (7,a6),d0
	move.w loc_03960e(pc,d0.w),d1
	jmp loc_03960e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03960e:
	dc.w loc_039666-loc_03960e
	dc.w loc_03968a-loc_03960e
	dc.w loc_0396f6-loc_03960e
	dc.w loc_039740-loc_03960e
	dc.w loc_0399f8-loc_03960e
	dc.w loc_039a86-loc_03960e
	dc.w loc_039a9a-loc_03960e
	dc.w loc_039aea-loc_03960e

	dc.w loc_039b64-loc_03960e
	dc.w loc_039b78-loc_03960e
	dc.w loc_039bf6-loc_03960e
	dc.w loc_039c36-loc_03960e
	dc.w loc_039c56-loc_03960e
	dc.w loc_039c8c-loc_03960e
	dc.w loc_039cde-loc_03960e
	dc.w loc_039d4e-loc_03960e

	dc.w loc_039d96-loc_03960e
	dc.w loc_039de0-loc_03960e
	dc.w loc_039e3e-loc_03960e

;==============================================
;Flip 2
;==============================================
loc_039634:
	move.b (7,a6),d0
	move.w loc_039640(pc,d0.w),d1
	jmp loc_039640(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039640:
	dc.w loc_039666-loc_039640
	dc.w loc_03968a-loc_039640
	dc.w loc_0396f6-loc_039640
	dc.w loc_0397c2-loc_039640;just to have this
	dc.w loc_0399f8-loc_039640
	dc.w loc_039a86-loc_039640
	dc.w loc_039a9a-loc_039640
	dc.w loc_039aea-loc_039640

	dc.w loc_039b64-loc_039640
	dc.w loc_039b78-loc_039640
	dc.w loc_039bf6-loc_039640
	dc.w loc_039c36-loc_039640
	dc.w loc_039c56-loc_039640
	dc.w loc_039c8c-loc_039640
	dc.w loc_039cde-loc_039640
	dc.w loc_039d4e-loc_039640

	dc.w loc_039d96-loc_039640
	dc.w loc_039de0-loc_039640
	dc.w loc_039e3e-loc_039640

;----------------------------------------------
loc_039666:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03968a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0396c4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0396c6(pc,d0.w),($40,a6)
	move.l loc_0396c6+4(pc,d0.w),($48,a6)
	move.l loc_0396c6+8(pc,d0.w),($44,a6)
	move.l loc_0396c6+$c(pc,d0.w),($4c,a6)

loc_0396c4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0396c6:
	dc.l $00020000,$00000000,$00070000,$ffffa800
	dc.l $00038000,$00000000,$00070000,$ffffa800
	dc.l $00050000,$00000000,$00070000,$ffffa800

;----------------------------------------------
loc_0396f6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_039716
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)
	clr.b ($35,a6)
	move.b #$a,($3a,a6)

loc_039716:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039722
	neg.l d0

loc_039722:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;----------------------------------------------
loc_039740:
	jsr loc_02a7ea
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039752
	neg.l d0

loc_039752:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0397ae
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #1,(pl_crouching,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,d1
	add.w d0,d0
	move.l loc_0397b6(pc,d0.w),($48,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #$32,d0
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

loc_0397ae:
	bsr.w loc_03987c
	bra.w loc_03995c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0397b6:
	dc.l $ffffc800,$ffffb800,$ffffa800

;----------------------------------------------
loc_0397c2:
	jsr loc_02a7ea
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_0397d4
	neg.l d0

loc_0397d4:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_039830
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #1,(pl_crouching,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,d1
	add.w d0,d0
	move.l loc_0397b6(pc,d0.w),($48,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #$32,d0
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

loc_039830:
	bsr.w loc_039838
	bra.w loc_039918

loc_039838:
	tst.l ($44,a6)
	bpl.w loc_03987a
	tst.b ($81,a6)
	bne.w loc_03987a
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.b loc_039872
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	bpl.b loc_03985e
	neg.w d0

loc_03985e:
	cmpi.w #$18,d0
	bhi.w loc_03987a
	moveq #$5e,d0
	jsr loc_02e6ec
	bne.w loc_0398b2

loc_039872:
	subq.b #1,($3a,a6)
	beq.w loc_0398f8

loc_03987a:
	rts

loc_03987c:
	tst.l ($44,a6)
	bpl.w loc_039916
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	beq.w loc_039916
	move.b ($83,a6),d0
	andi.w #3,d0
	beq.b loc_0398f8
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.b loc_0398f8
	moveq #$5e,d0
	jsr loc_02e6ec
	beq.b loc_0398f8

loc_0398b2:
	move.b #$c,(7,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	move.l #$20000,d0
	move.l #0,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0398de
	neg.l d0

loc_0398de:
	move.l d0,($40,a6)
	moveq #8,d0
	jsr loc_02ef6c
	moveq #$2f,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

loc_0398f8:
	move.b #$22,(7,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3f,d0
	jmp Set_Char_Special_Ani

loc_039916:
	rts

loc_039918:
	tst.l ($44,a6)
	bpl.w loc_03995a
	tst.b ($81,a6)
	beq.w loc_03995a
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.b loc_039952
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	bpl.b loc_03993e
	neg.w d0

loc_03993e:
	cmpi.w #$18,d0
	bhi.w loc_03995a
	moveq #$5f,d0
	jsr loc_02e6ec
	bne.w loc_039992

loc_039952:
	subq.b #1,($3a,a6)
	beq.w loc_0399d8

loc_03995a:
	rts

loc_03995c:
	tst.l ($44,a6)
	bpl.w loc_0399f6
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #$70,d0
	beq.w loc_0399f6
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.b loc_0399d8
	move.b ($83,a6),d0
	andi.w #3,d0
	beq.b loc_0399d8
	moveq #$5f,d0
	jsr loc_02e6ec
	beq.b loc_0399d8

loc_039992:
	move.b #$18,(7,a6)
	move.l #$58000,($44,a6)
	move.l #$ffffe800,($4c,a6)
	move.l #$20000,d0
	move.l #0,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0399be
	neg.l d0

loc_0399be:
	move.l d0,($40,a6)
	moveq #8,d0
	jsr loc_02ef6c
	moveq #$3c,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

loc_0399d8:
	move.b #$12,(7,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$37,d0
	jmp Set_Char_Special_Ani

loc_0399f6:
	rts

;----------------------------------------------
loc_0399f8:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039a04
	neg.l d0

loc_039a04:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bpl.b loc_039a2c
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	move.b #1,($32,a6)
	moveq #$35,d0
	jmp Set_Char_Special_Ani

loc_039a2c:
	tst.b ($35,a6)
	bne.b loc_039a38
	jsr loc_02a7ea

loc_039a38:
	bra.w loc_039a3c

loc_039a3c:
	move.b ($81,a5),d6
	andi.b #3,d6
	bne.b loc_039a7a
	moveq #1,d6
	tst.b ($35,a6)
	beq.b loc_039a50
	moveq #2,d6

loc_039a50:
	jsr loc_085a74
	beq.b loc_039a7a
	move.w d6,d0
	add.w d0,d0
	move.w loc_039a7c(pc,d0.w),d1
	tst.b ($35,a6)
	beq.b loc_039a6a
	move.w loc_039a7c+4(pc,d0.w),d1

loc_039a6a:
	tst.b (PL_Flip,a6)
	beq.b loc_039a72
	neg.w d1

loc_039a72:
	add.w d1,($10,a4)
	dbra d6,loc_039a50

loc_039a7a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039a7c:
	dc.w $ffc0,$fff8,$ffb0,$ffdf,$0018

;----------------------------------------------
loc_039a86:
	tst.b ($33,a6)
	bmi.w loc_03a2a4
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_039a9a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_039ade
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_039ade
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	moveq #$30,d0
	jsr Set_Char_Special_Ani

loc_039ade:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039ae4:
	dc.w $0013,$0014,$0015

;----------------------------------------------
loc_039aea:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_039b22
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d2
	move.b ($82,a6),d2
	move.w loc_039ae4(pc,d2.w),d2
	moveq #$5e,d0
	jsr loc_02e7f2
	moveq #$36,d0
	jsr Set_Char_Special_Ani

loc_039b22:
	tst.b ($35,a6)
	beq.b loc_039b5a
	clr.b ($35,a6)
	moveq #$61,d0
	jsr loc_080b70
	tst.b ($11c,a5)
	bne.b loc_039b4c
	move.b #$a,($11c,a5)
	move.b #2,($11d,a5)
	move.b #2,($11e,a5)

loc_039b4c:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_039b60(pc,d0.w),($123,a5)

loc_039b5a:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039b60:
	dc.b $14,$16,$18,$00

;----------------------------------------------
loc_039b64:
	tst.b ($33,a6)
	bmi.w loc_03a2a4
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_039b78:
	jsr loc_02a7ea
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039b8a
	neg.l d0

loc_039b8a:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_039be8
	addq.b #2,(7,a6)
	tst.b ($3e,a6)
	beq.b loc_039bc2
	clr.b ($31,a6)
	clr.b ($ce,a6)

loc_039bc2:
	move.w ($64,a6),($14,a6)
	move.l #$20000,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,d1
	add.w d0,d0
	move.l loc_039bea(pc,d0.w),($48,a6)
	moveq #$3a,d0
	jmp Set_Char_Special_Ani

loc_039be8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039bea:
	dc.l $ffffd800,$ffffc800,$ffffb800

;----------------------------------------------
loc_039bf6:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039c02
	neg.l d0

loc_039c02:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bpl.b loc_039c26
	addq.b #2,(7,a6)
	moveq #$3b,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f6f8

loc_039c26:
	jsr loc_02f6f8
	jsr loc_02a7ea
	bra.w loc_039a3c

;----------------------------------------------
loc_039c36:
	tst.b ($33,a6)
	bpl.b loc_039c4a
	clr.b ($31,a6)
	clr.b (pl_crouching,a6)
	jmp loc_02baf2

loc_039c4a:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_039c56:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_039c86
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	eori.b #1,(PL_Flip,a6)
	subi.w #$27,($14,a6)
	move.w #$11,d0
	tst.b (PL_Flip,a6)
	beq.b loc_039c82
	neg.w d0

loc_039c82:
	add.w d0,($10,a6)

loc_039c86:
	jmp loc_02f9be

;----------------------------------------------
loc_039c8c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	tst.l ($44,a6)
	bpl.b loc_039cd2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffff7000,($4c,a6)
	moveq #$3d,d0
	jsr Set_Char_Special_Ani
	bra.b loc_039cd8

loc_039cd2:
	jsr loc_02a7ea

loc_039cd8:
	jmp loc_02f9be

;----------------------------------------------
loc_039cde:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	tst.l ($44,a6)
	bpl.w loc_039d3e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_039d3e
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_080e70
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_039d4a(pc,d0.w),($123,a5)
	moveq #$62,d0
	jsr loc_02e970
	moveq #$3e,d0
	jsr Set_Char_Special_Ani
	bra.b loc_039d44

loc_039d3e:
	jsr loc_02a7ea

loc_039d44:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039d4a:
	dc.b $14,$16,$18,$00

;----------------------------------------------
loc_039d4e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_039d90
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$5f,d0
	jsr loc_02e7f2
	move.l #$28000,($40,a6)
	move.l #0,($48,a6)
	move.l #$70000,($44,a6)
	move.l #$ffffac00,($4c,a6)

loc_039d90:
	jmp loc_02f9be

;----------------------------------------------
loc_039d96:
	tst.b ($35,a6)
	bne.w loc_03a2aa
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039daa
	neg.l d0

loc_039daa:
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_03a2aa
	jsr loc_00369c
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_039de0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_039df0
	clr.b ($35,a6)

loc_039df0:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_039dfc
	neg.l d0

loc_039dfc:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_039e3c
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	moveq #$42,d0
	jmp Set_Char_Special_Ani

loc_039e3c:
	rts

;----------------------------------------------
loc_039e3e:
	tst.b ($33,a6)
	bmi.w loc_03a2a4
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
loc_039e52:
	move.b (7,a6),d0
	move.w loc_039e5e(pc,d0.w),d1
	jmp loc_039e5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039e5e:
	dc.w loc_039e64-loc_039e5e
	dc.w loc_039ea4-loc_039e5e
	dc.w loc_039ed8-loc_039e5e

;----------------------------------------------
loc_039e64:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2f,d0
	tst.b ($31,a6)
	bne.b loc_039e9e
	jsr loc_01c2c8
	beq.b loc_039e9c
	addq.b #1,(a4)
	move.b #$3f,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)

loc_039e9c:
	moveq #$2b,d0

loc_039e9e:
	jmp loc_02a708

;----------------------------------------------
loc_039ea4:
	tst.b ($34,a6)
	beq.b loc_039ed2
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$d,d0
	moveq #$39,d1
	tst.b ($31,a6)
	beq.b loc_039ec8
	moveq #1,d0
	moveq #$47,d1

loc_039ec8:
	jsr loc_097cd6
	bsr.w loc_03a242

loc_039ed2:
	jmp loc_02a7ea

;----------------------------------------------
loc_039ed8:
	subq.b #1,($3a,a6)
	bne.w loc_03a2aa
	tst.b ($31,a6)
	beq.b loc_039eee
	move.l #$2000602,(4,a6)

loc_039eee:
	jmp loc_02f796

;##############################################
;Throws
;##############################################
loc_039ef4:
	cmpi.b #4,($80,a6)
	beq.w loc_039fca
	move.b (7,a6),d0
	move.w loc_039f10(pc,d0.w),d1
	jsr loc_039f10(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039f10:
	dc.w loc_039f1a-loc_039f10
	dc.w loc_039f34-loc_039f10
	dc.w loc_039f8e-loc_039f10
	dc.w loc_039f9c-loc_039f10
	dc.w loc_039fb6-loc_039f10

;----------------------------------------------
loc_039f1a:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_039f34:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	moveq #$5b,d0
	tst.b ($81,a6)
	beq.b loc_039f46
	moveq #$5c,d0

loc_039f46:
	jsr loc_02e3fe
	beq.b loc_039f82
	move.b #6,(7,a6)
	clr.b (PL_Flip,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_039f66
	bsr.w loc_03a0e4
	bcs.b loc_039f6e
	bra.b loc_039f72

loc_039f66:
	btst.b #1,($11b,a6)
	beq.b loc_039f72

loc_039f6e:
	addq.b #1,(PL_Flip,a6)

loc_039f72:
	moveq #0,d0
	move.b ($81,a6),d0
	lsr.b #1,d0
	addq.b #4,d0
	jmp Set_Char_Special_Ani

loc_039f82:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_039f8e:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	jmp loc_02baf2

;----------------------------------------------
loc_039f9c:
	tst.b ($35,a6)
	beq.w loc_03a2aa
	addq.b #2,(7,a6)
	moveq #$5b,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;----------------------------------------------
loc_039fb6:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;==============================================
loc_039fca:
	move.b (7,a6),d0
	move.w loc_039fdc(pc,d0.w),d1
	jsr loc_039fdc(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_039fdc:
	dc.w loc_039fea-loc_039fdc
	dc.w loc_03a012-loc_039fdc
	dc.w loc_03a022-loc_039fdc
	dc.w loc_03a04c-loc_039fdc
	dc.w loc_03a05c-loc_039fdc
	dc.w loc_03a096-loc_039fdc
	dc.w loc_03a0b6-loc_039fdc

;----------------------------------------------
loc_039fea:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$5c,d0
	jsr loc_02e636
	beq.w loc_03a006
	move.b #4,(7,a6)
	rts

loc_03a006:
	addq.b #2,(7,a6)
	moveq #3,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03a012:
	jsr loc_02aa08
	bcc.w loc_03a2aa
	jmp loc_02baf2

;----------------------------------------------
loc_03a022:
	addq.b #2,(7,a6)
	move.b #$a,($3a,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.w ($40,a6)
	beq.b loc_03a044
	bpl.b loc_03a040
	moveq #1,d0

loc_03a040:
	move.b d0,(PL_Flip,a6)

loc_03a044:
	moveq #6,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_03a04c:
	subq.b #1,($3a,a6)
	bne.b loc_03a056
	addq.b #2,(7,a6)

loc_03a056:
	jmp loc_02a7ea

;----------------------------------------------
loc_03a05c:
	bsr.w loc_03a0ca
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03a090
	move.w d0,($14,a6)
	clr.b ($16,a6)
	move.b #$18,($123,a5)
	addq.b #2,(7,a6)
	move.l #$60000,d0
	tst.b (PL_Flip,a6)
	beq.w loc_03a08c
	neg.l d0

loc_03a08c:
	move.l d0,($40,a6)

loc_03a090:
	jmp loc_02a7ea

;----------------------------------------------
loc_03a096:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.b loc_03a0b0
	addq.b #2,(7,a6)
	moveq #$5c,d0
	jsr loc_02e7f2

loc_03a0b0:
	jmp loc_02a7ea

;----------------------------------------------
loc_03a0b6:
	tst.b ($33,a6)
	bpl.w loc_03a2aa
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_03a0ca:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;----------------------------------------------
loc_03a0e4:
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	rts

;##############################################
;Winposes
;##############################################
loc_03a0fc:
	move.b (6,a6),d0
	move.w loc_03a108(pc,d0.w),d1
	jmp loc_03a108(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a108:
	dc.w loc_03a110-loc_03a108
	dc.w loc_03a122-loc_03a108
	dc.w loc_03a138-loc_03a108
	dc.w loc_03a188-loc_03a108

;==============================================
loc_03a110:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_03a122:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_03a132
	tst.b ($11c,a5)
	bne.b loc_03a132
	addq.b #2,(6,a6)

loc_03a132:
	jmp loc_02a7ea

;==============================================
loc_03a138:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	tst.b ($2c4,a6)
	bne.w loc_03a15e
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_03a170(pc,d0.w),d0
	add.w d0,d0
	move.b d0,($2c4,a6)

loc_03a15e:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	ext.w d0
	move.b loc_03a180(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a170:
	dc.b $05,$04,$03,$02,$01,$05,$04,$03
	dc.b $02,$01,$05,$04,$03,$02,$01,$05

loc_03a180:
	dc.b $23,$23,$25,$24,$26,$23,$24,$25

;==============================================
loc_03a188:
	move.b ($2c4,a6),d0
	move.w loc_03a194(pc,d0.w),d1
	jmp loc_03a194(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a194:
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194
	dc.w loc_03a1a2-loc_03a194

;----------------------------------------------
loc_03a1a2:
	cmpi.b #1,($35,a6)
	bne.b loc_03a1b4
	clr.b ($35,a6)
	move.b #$18,($123,a5)

loc_03a1b4:
	tst.b ($3a,a6)
	beq.b loc_03a1c8
	subq.b #1,($3a,a6)
	bne.b loc_03a1c8
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_03a1c8:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_03a1ce:
	move.b (6,a6),d0
	move.w loc_03a1da(pc,d0.w),d1
	jmp loc_03a1da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03a1da:
	dc.w loc_03a1e2-loc_03a1da
	dc.w loc_03a1f4-loc_03a1da
	dc.w loc_03a204-loc_03a1da
	dc.w loc_03a228-loc_03a1da

;----------------------------------------------
loc_03a1e2:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708


;----------------------------------------------
loc_03a1f4:
	tst.b ($11c,a5)
	bne.b loc_03a1fe
	addq.b #2,(6,a6)

loc_03a1fe:
	jmp loc_02a7ea

;----------------------------------------------
loc_03a204:
	addq.b #2,(6,a6)
	movea.w ($38,a6),a4
	move.b ($b,a4),(PL_Flip,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_03a222
	moveq #$29,d0

loc_03a222:
	jmp loc_02a708

;----------------------------------------------
loc_03a228:
	tst.b ($3a,a6)
	beq.b loc_03a23c
	subq.b #1,($3a,a6)
	bne.b loc_03a23c
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_03a23c:
	jmp loc_02a7ea

;==============================================
loc_03a242:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_5,a6)
	movem.l d0-d1,(pl_inp_slot_6,a6)
	movem.l d0-d1,(pl_inp_slot_7,a6)
	movem.l d0-d1,(pl_inp_slot_8,a6)
	movem.l d0-d1,(pl_inp_slot_9,a6)
	movem.l d0-d1,($1d0,a6)
	movem.l d0-d1,($1d8,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;==============================================
loc_03a29c:
	rts

;==============================================
loc_03a29e:
	jmp loc_02baf2

;==============================================
loc_03a2a4:
	jmp loc_02bb26

;==============================================
loc_03a2aa:
	jmp loc_02a7ea

;==============================================
loc_03a2b0:
	addq.b #1,($3a,a6)
	andi.b #3,($3a,a6)
	bne.b loc_03a2d8
	moveq #$69,d2
	jsr RNGFunction
	andi.b #1,d0
	bne.b loc_03a2cc
	moveq #$6a,d2

loc_03a2cc:
	move.l d2,d0
	jsr loc_02e970
	moveq #1,d0
	rts

loc_03a2d8:
	moveq #0,d0
	rts

;##############################################
loc_03a2dc:
	dc.w loc_03a328-loc_03a2dc
	dc.w loc_03a328-loc_03a2dc
	dc.w loc_03a2e2-loc_03a2dc

loc_03a2e2:
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b,$08,$0a
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_03a328:
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$07,$09
	dc.b $02,$02,$08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a,$07,$09
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
