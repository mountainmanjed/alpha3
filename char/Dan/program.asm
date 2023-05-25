;##############################################
;
;##############################################
loc_04ad88:
	jsr loc_01c368
	beq.b loc_04adac
	addq.b #1,(a4)
	move.b #$c,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_04adac:
	clr.b ($1fd,a6)
	clr.b ($1fe,a6)
	clr.b ($1ff,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04adba:
	dc.w $0170,$0390

;##############################################
;
;##############################################
loc_04adbe:
	move.b (7,a6),d0
	move.w loc_04adca(pc,d0.w),d1
	jmp loc_04adca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04adca:
	dc.w loc_04adde-loc_04adca
	dc.w loc_04adfc-loc_04adca
	dc.w loc_04ae3e-loc_04adca
	dc.w loc_04ae7e-loc_04adca
	dc.w loc_04ae9c-loc_04adca
	dc.w loc_04aed4-loc_04adca
	dc.w loc_04af22-loc_04adca
	dc.w loc_04af6e-loc_04adca

	dc.w loc_04af82-loc_04adca
	dc.w loc_04af9e-loc_04adca

;==============================================
loc_04adde:
	movea.w ($38,a6),a4
	cmpi.b #$19,($102,a4)
	bne.b loc_04adfc
	tst.b (PL_cpucontrol,a6)
	sne.b d0
	tst.b ($125,a4)
	sne.b d1
	eor.b d0,d1
	bmi.w loc_04ae9c

;==============================================
loc_04adfc:
	move.b #4,(7,a6)
	move.l ($10,a6),($4c,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_04ae3a(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.l #$80000,($40,a6)
	move.l #0,($48,a6)
	moveq #$22,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ae3a:
	dc.w $ff50,$0230

;==============================================
loc_04ae3e:
	bsr.w loc_04d20c
	move.w ($4c,a6),d0
	sub.w ($10,a6),d0
	tst.b (PL_Flip,a6)
	seq.b d1
	ext.w d1
	eor.w d0,d1
	bpl.w loc_04ced4
	addq.b #2,(7,a6)
	move.b #$48,($3b,a6)
	move.l ($4c,a6),($10,a6)
	moveq #$23,d0
	movea.w ($38,a6),a4
	cmpi.b #$b,($102,a4)
	bne.b loc_04ae78
	moveq #$36,d0

loc_04ae78:
	jmp loc_02a708

;==============================================
loc_04ae7e:
	jsr loc_02a7ea
	subq.b #1,($3b,a6)
	bne.w loc_04ceda
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04ae9c:
	move.b #$a,(7,a6)
	move.b #1,($31,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_04aed0(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	addi.w #$40,($14,a6)
	moveq #$22,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04aed0:
	dc.w $ffc0,$01c0

;==============================================
loc_04aed4:
	movea.w ($38,a6),a4
	tst.b ($1f0,a4)
	beq.b loc_04af1c
	addq.b #2,(7,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_04af1e(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.l #$30000,($40,a6)
	move.l #0,($48,a6)
	move.l #$ffffe000,($44,a6)
	move.l #$ffffe000,($4c,a6)

loc_04af1c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04af1e:
	dc.w $0000,$0180

;==============================================
loc_04af22:
	bsr.w loc_04d226
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ced4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_04af6a(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	moveq #3,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04af6a:
	dc.w $0060,$0120

;==============================================
loc_04af6e:
	movea.w ($38,a6),a4
	tst.w ($44,a4)
	ble.b loc_04af7c
	addq.b #2,(7,a6)

loc_04af7c:
	jmp loc_02a7ea

;==============================================
loc_04af82:
	addq.b #2,(7,a6)
	jsr loc_083628
	st.b ($2ce,a6)
	move.b #$78,($3a,a6)
	moveq #$1a,d0
	jmp loc_02a75e

;==============================================
loc_04af9e:
	subq.b #1,($3a,a6)
	bpl.w loc_04ced4
	move.l #$02000000,(4,a6)
	jsr loc_00374e
	moveq #0,d0
	move.b d0,($2ce,a6)
	move.b d0,($2cf,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normal Programming
;##############################################
loc_04afc6:
	tst.b ($80,a6)
	bne.w loc_04b0a8
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_04b022
	move.b (7,a6),d0
	move.w loc_04afe6(pc,d0.w),d1
	jmp loc_04afe6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04afe6:
	dc.w loc_04afea-loc_04afe6
	dc.w loc_04b01c-loc_04afe6

;----------------------------------------------
loc_04afea:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bsr.w loc_04b760
	jsr loc_02aebc
	move.b ($82,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_04b01c:
	jmp loc_02f5ac

;==============================================
;Kick
;==============================================
loc_04b022:
	move.b (7,a6),d0
	move.w loc_04b02e(pc,d0.w),d1
	jmp loc_04b02e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b02e:
	dc.w loc_04b034-loc_04b02e
	dc.w loc_04b074-loc_04b02e
	dc.w loc_04b07a-loc_04b02e

;----------------------------------------------
loc_04b034:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bsr.w loc_04b760
	jsr loc_02aebc
	move.b ($82,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b d1,d0
	cmpi.b #4,($82,a6)
	bne.b loc_04b06e
	move.b #4,(7,a6)

loc_04b06e:
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_04b074:
	jmp loc_02f5ac

;----------------------------------------------
loc_04b07a:
	tst.b ($33,a6)
	bmi.b loc_04b0a2
	tst.b ($35,a6)
	beq.b loc_04b09c
	clr.b ($35,a6)
	move.l #$80000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_04b098
	neg.l d0

loc_04b098:
	add.l d0,($10,a6)

loc_04b09c:
	jmp loc_02a7ea

loc_04b0a2:
	jmp loc_02baf2

;==============================================
;Crouching
;==============================================
loc_04b0a8:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_04b0ba(pc,d0.w),d1
	jmp loc_04b0ba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b0ba:
	dc.w loc_04b0be-loc_04b0ba
	dc.w loc_04b0f8-loc_04b0ba

;----------------------------------------------
loc_04b0be:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bsr.w loc_04b760
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_04b0f0
	moveq #$f,d0

loc_04b0f0:
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_04b0f8:
	jmp loc_02f5ac

;##############################################
;Air Normal Programming
;##############################################
loc_04b0fe:
	move.b #6,(7,a6)
	bsr.w loc_04b760
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_04b12c
	moveq #$18,d0

loc_04b12c:
	tst.b ($81,a6)
	beq.b loc_04b134
	addq.w #3,d0

loc_04b134:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Inputs
;##############################################
loc_04b144:
	jsr SPButton_Vism_code
	bne.w loc_04b29e

loc_04b14e:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_04b388

loc_04b15c:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_04b3cc

loc_04b16a:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_21421K_code
	bne.w loc_04b34a

loc_04b178:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623P_code
	bne.w loc_04b4d2

loc_04b186:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_236P_code
	bne.w loc_04b48c

loc_04b194:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_214K_code
	bne.w loc_04b4fa

loc_04b1a2:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_04b442

loc_04b1b0:
	lea.l (pl_inp_slot_9,a6),a4
	jsr SpInp_214214_code
	bne.w loc_04b22a

loc_04b1be:
	lea.l (pl_inp_slot_8,a6),a4
	jsr SpInp_236236_code
	bne.w loc_04b1f4

loc_04b1cc:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_236_code
	bne.w loc_04b26a

loc_04b1da:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_214_Code
	bne.w loc_04b27e

loc_04b1e8:
	jsr SPButton_Taunt_code
	bne.w loc_04b302

loc_04b1f2:
	rts

;Move ID Writes start
;==============================================
;
;==============================================
loc_04b1f4:
	tst.b (PL_ism_choice,a6)
	bne.b loc_04b1cc
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_04b1cc
	jsr loc_02ecd8
	beq.b loc_04b1cc
	move.l #$02001000,(4,a6)
	move.b #$18,(pl_move_id,a6)
	moveq #0,d0
	move.b d0,($82,a6)
	move.b d0,($248,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
;
;==============================================
loc_04b22a:
	tst.b (PL_ism_choice,a6)
	bne.b loc_04b1be
	cmpi.w #$90,(PL_meter,a6)
	bcs.b loc_04b1be
	jsr loc_02ecd8
	beq.w loc_04b1be
	move.l #$02001004,(4,a6)
	move.b #$1c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($82,a6)
	move.b #4,($248,a6)
	moveq #0,d0
	move.l d0,($84,a6)
	rts

;==============================================
;
;==============================================
loc_04b26a:
	jsr loc_02ed00
	beq.w loc_04b1da
	move.l #$02000e00,(4,a6)
	bra.b loc_04b290

;==============================================
;
;==============================================
loc_04b27e:
	jsr loc_02ed00
	beq.w loc_04b1e8
	move.l #$02000e06,(4,a6)

loc_04b290:
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
;
;==============================================
loc_04b29e:
	tst.b ($28a,a6)
	bne.w loc_04b14e
	tst.b ($31,a6)
	bne.w loc_04b2dc
	jsr loc_02ef54
	beq.w loc_04b14e
	jsr loc_02ecd8
	beq.w loc_04b14e
	move.l #$02001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_04b2dc:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04b14e
	jsr loc_02ed28
	beq.w loc_04b14e
	move.l #$02001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	jmp loc_02f980

;==============================================
;
;==============================================
loc_04b302:
	tst.b ($31,a6)
	beq.b loc_04b32a
	tst.w ($44,a6)
	blt.w loc_04b1f2
	jsr loc_02ed28
	beq.w loc_04b1f2
	move.l #$02000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	rts

loc_04b32a:
	jsr loc_02ed00
	beq.w loc_04b1f2
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
;
;==============================================
loc_04b34a:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_04b178
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b178
	jsr loc_02ecd8
	beq.w loc_04b178
	move.l #$02001000,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
;
;==============================================
loc_04b388:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04b15c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b15c
	tst.b ($238,a6)
	bne.w loc_04b15c
	jsr loc_02ecd8
	beq.w loc_04b15c
	move.l #$02001000,(4,a6)
	move.b #$8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
;
;==============================================
loc_04b3cc:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04b16a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b16a
	jsr loc_02ecd8
	beq.w loc_04b16a
	move.l #$02001000,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;##############################################
;Vism AC Move write
;##############################################
loc_04b408:
	move.l #$02000e00,(4,a6)
	move.b #$4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #$1b,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$17,($5f,a4)
	moveq #2,d0
	jmp loc_02a758

;==============================================
;
;==============================================
loc_04b442:
	jsr loc_02edf8
	beq.w loc_04b1b0

;##############################################
;Aism AC Move write
;##############################################
loc_04b44c:
	tst.b (PL_ism_choice,a6)
	bne.b loc_04b408
	move.l #$02000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #$18,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$14,($5f,a4)
	moveq #1,d0
	jmp loc_02a758

;==============================================
;
;==============================================
loc_04b48c:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04b49e
	tst.b ($238,a6)
	bne.w loc_04b194
	bra.b loc_04b4a8

loc_04b49e:
	cmpi.b #2,($238,a6)
	bcc.w loc_04b194

loc_04b4a8:
	jsr loc_02ed00
	beq.w loc_04b194
	move.l #$02000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
;
;==============================================
loc_04b4d2:
	jsr loc_02ed00
	beq.w loc_04b186
	move.l #$02000e00,(4,a6)
	clr.b (pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;==============================================
;
;==============================================
loc_04b4fa:
	tst.b ($31,a6)
	bne.b loc_04b52a
	jsr loc_02ed00
	beq.w loc_04b1a2
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

loc_04b52a:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_04b1a2
	jsr loc_02ed28
	beq.w loc_04b1a2
	move.l #$02000e00,(4,a6)
	move.b #$1a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;##############################################
;AI Move Check
;##############################################
loc_04b556:
	move.b (pl_move_id,a6),d0
	move.w loc_04b562(pc,d0.w),d1
	jmp loc_04b562(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b562:
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b580-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b58c-loc_04b562
	dc.w loc_04b5aa-loc_04b562
	dc.w loc_04b5b8-loc_04b562
	dc.w loc_04b588-loc_04b562

	dc.w loc_04b588-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b5ce-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b588-loc_04b562
	dc.w loc_04b5dc-loc_04b562

;==============================================
loc_04b580:
	tst.b ($238,a6)
	bne.w loc_04b5dc

;==============================================
loc_04b588:
	bra.w loc_04b5d8

;==============================================
loc_04b58c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04b5dc
	tst.b ($238,a6)
	bne.w loc_04b5dc
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b5dc
	bra.w loc_04b5d8

;==============================================
loc_04b5aa:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b5dc
	bra.w loc_04b5d8

;==============================================
loc_04b5b8:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04b5dc
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b5dc
	bra.w loc_04b5d8

;==============================================
loc_04b5ce:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04b5dc

;----------------------------------------------
loc_04b5d8:
	moveq #1,d0
	rts

;----------------------------------------------
loc_04b5dc:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_04b5e0:
	move.b (pl_move_id,a6),d0
	move.w loc_04b5ec(pc,d0.w),d1
	jmp loc_04b5ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b5ec:
	dc.w loc_04b60a-loc_04b5ec;Koryuken
	dc.w loc_04b792-loc_04b5ec;Gadouken
	dc.w loc_04b916-loc_04b5ec;Vism Alpha Counter
	dc.w loc_04b938-loc_04b5ec;Super Gadou
	dc.w loc_04ba5a-loc_04b5ec;Dankyaku
	dc.w loc_04bba4-loc_04b5ec;Aism Alpha Counter
	dc.w loc_04bbe6-loc_04b5ec;Super Koryuken
	dc.w loc_04bd90-loc_04b5ec;Taunt

	dc.w loc_04be28-loc_04b5ec;Vism Activate
	dc.w loc_04beaa-loc_04b5ec;Air Taunt
	dc.w loc_04bf02-loc_04b5ec;Roll Taunt
	dc.w loc_04bfda-loc_04b5ec;214214+K
	dc.w loc_04c17a-loc_04b5ec;Super Taunt
	dc.w loc_04c3b4-loc_04b5ec;Air Dankyaku
	dc.w loc_04c516-loc_04b5ec;Taunt Mode

;==============================================
;Koryuken
;==============================================
loc_04b60a:
	move.b (7,a6),d0
	move.w loc_04b616(pc,d0.w),d1
	jmp loc_04b616(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b616:
	dc.w loc_04b620-loc_04b616
	dc.w loc_04b6b2-loc_04b616
	dc.w loc_04b6d2-loc_04b616
	dc.w loc_04b6fa-loc_04b616
	dc.w loc_04b730-loc_04b616

;----------------------------------------------
loc_04b620:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	tst.b ($1fd,a6)
	beq.b loc_04b652
	clr.b ($1fd,a6)
	move.b #$ff,(pl_invinciblity_timer,a6)
	move.b #$e,($2a0,a6)

loc_04b652:
	move.b ($82,a6),d1
	ext.w d1
	lsl.w #3,d1
	move.l loc_04b682(pc,d1.w),($40,a6)
	move.l loc_04b682+4(pc,d1.w),($44,a6)
	move.l loc_04b682+8(pc,d1.w),($48,a6)
	move.l loc_04b682+$c(pc,d1.w),($4c,a6)
	moveq #4,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b682:
	dc.l $00030000,$00050000,$ffff8000,$ffffa000
	dc.l $00050000,$00070000,$ffff8000,$ffffa000
	dc.l $00070000,$00090000,$ffff8000,$ffffa000

;----------------------------------------------
loc_04b6b2:
	tst.b ($35,a6)
	bne.b loc_04b6cc
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_invinciblity_timer,a6)
	move.b #0,($2a0,a6)

loc_04b6cc:
	jmp loc_02a7ea

;----------------------------------------------
loc_04b6d2:
	bsr.w loc_04b74e
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_04b6e2
	neg.l d0

loc_04b6e2:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_04b6f4
	addq.b #2,(7,a6)

loc_04b6f4:
	jmp loc_02a7ea

;----------------------------------------------
loc_04b6fa:
	bsr.w loc_04b74e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04b710
	tst.b ($35,a6)
	beq.b loc_04b72a
	rts

loc_04b710:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b (pl_attk_active,a6)
	clr.b ($ce,a6)
	jsr loc_00369c

loc_04b72a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04b730:
	tst.b ($33,a6)
	bmi.w loc_04cec8
	movea.w ($38,a6),a4
	move.b #5,($23f,a6)
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_04b74e:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
; ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
;==============================================
loc_04b760:
	addq.b #1,($1fe,a6)
	clr.b ($1fd,a6)
	tst.b ($1ff,a6)
	bne.b loc_04b778
	cmpi.b #$17,($1fe,a6)
	bne.b loc_04b790
	bra.b loc_04b780

loc_04b778:
	cmpi.b #$f,($1fe,a6)
	bne.b loc_04b790

loc_04b780:
	clr.b ($1fe,a6)
	move.b #1,($1ff,a6)
	move.b #1,($1fd,a6)

loc_04b790:
	rts

;==============================================
;Gadouken
;==============================================
loc_04b792:
	move.b (7,a6),d0
	move.w loc_04b79e(pc,d0.w),d1
	jmp loc_04b79e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b79e:
	dc.w loc_04b7a4-loc_04b79e
	dc.w loc_04b7ce-loc_04b79e
	dc.w loc_04b8f2-loc_04b79e

;----------------------------------------------
loc_04b7a4:
	addq.b #2,(7,a6)
	bsr.b loc_04b760
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #7,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04b7ce:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_04b8dc
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_04b8dc
	addq.b #1,(a4)
	move.w #$c00,(2,a4)
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
	bsr.w loc_04b8de
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_04b8dc
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_04b8dc
	jsr loc_01c1c8
	beq.b loc_04b8dc
	addq.b #1,(a4)
	move.w #$c00,(2,a4)
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
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_04b8de

loc_04b8dc:
	rts

;==============================================
loc_04b8de:
	move.b #$a,($cc,a4)
	move.b #2,($ee,a4)
	move.b #$8,($ef,a4)
	rts

;----------------------------------------------
loc_04b8f2:
	tst.b ($33,a6)
	bmi.w loc_04cec8
	tst.b ($3a,a6)
	beq.b loc_04b90a
	subq.b #1,($3a,a6)
	bne.b loc_04b910
	clr.b ($ce,a6)

loc_04b90a:
	jsr loc_02f6f8

loc_04b910
	jmp loc_02a7ea

;==============================================
;Vism Alpha Counter
;==============================================
loc_04b916:
	tst.b ($33,a6)
	bmi.w loc_04cec8
	tst.b ($35,a6)
	beq.b loc_04b932
	clr.b ($35,a6)
	jsr loc_080e8e
	bsr.w loc_04b760

loc_04b932:
	jmp loc_02a7ea

;==============================================
;Super Gadouken
;==============================================
loc_04b938:
	move.b (7,a6),d0
	move.w loc_04b944(pc,d0.w),d1
	jmp loc_04b944(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b944:
	dc.w loc_04b94c-loc_04b944
	dc.w loc_04b9a8-loc_04b944
	dc.w loc_04b9f0-loc_04b944
	dc.w loc_04ba46-loc_04b944

;----------------------------------------------
loc_04b94c:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$a,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04b978:
	dc.l $00048000,$fffffa00,$00078000,$ffff7800
	dc.l $00050000,$fffffa00,$00050000,$ffffb000
	dc.l $00058000,$fffffa00,$00034000,$ffffe000

;----------------------------------------------
loc_04b9a8:
	tst.b ($35,a6)
	bne.b loc_04b9ea
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.w ($16,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_04b978(pc,d0.w),d1
	move.l loc_04b978+4(pc,d0.w),d2
	move.l loc_04b978+8(pc,d0.w),($44,a6)
	move.l loc_04b978+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_04b9e2
	neg.l d1
	neg.l d2

loc_04b9e2:
	move.l d1,($40,a6)
	move.l d2,($48,a6)

loc_04b9ea:
	jmp loc_02a7ea

;----------------------------------------------
loc_04b9f0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ba40
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	move.b #1,(pl_crouching,a6)
	moveq #$10,d0
	jmp loc_02a758

loc_04ba40:
	jmp loc_02a7ea

;----------------------------------------------
loc_04ba46:
	tst.b ($33,a6)
	bmi.w loc_04cece
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04ba5a:
	move.b (7,a6),d0
	move.w loc_04ba66(pc,d0.w),d1
	jmp loc_04ba66(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ba66:
	dc.w loc_04ba6e-loc_04ba66
	dc.w loc_04ba8a-loc_04ba66
	dc.w loc_04bab2-loc_04ba66
	dc.w loc_04bae0-loc_04ba66

;----------------------------------------------
loc_04ba6e:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$11,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ba8a:
	tst.b ($34,a6)
	beq.b loc_04baac
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04ba9e
	moveq #1,d0

loc_04ba9e:
	move.b d0,($ab,a6)
	moveq #$1e,d0
	moveq #$57,d1
	jsr loc_082e36

loc_04baac:
	jmp loc_02a7ea

;----------------------------------------------
loc_04bab2:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_04bada
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_04bad4
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04bad4:
	move.b loc_04badc(pc,d0.w),(pl_invinciblity_timer,a6)

loc_04bada:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04badc:
	dc.b $02,$04,$06,$00

;----------------------------------------------
loc_04bae0:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_04bb7c
	tst.b ($34,a6)
	bne.w loc_04bb7a
	tst.b ($35,a6)
	beq.b loc_04bb7a
	clr.w ($34,a6)
	jsr loc_01c1c8
	beq.b loc_04bb7a
	addq.b #1,(a4)
	move.w #$c02,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($59,a6),($59,a4)
	moveq #6,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #2,d0
	move.w d0,($50,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_04bb82

loc_04bb7a:
	rts

loc_04bb7c:
	jmp loc_02baf2

;==============================================
loc_04bb82:
	move.b #2,($ee,a4)
	move.b #8,($ee,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_04bb9e(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bb9e:
	dc.w $000b,$000d,$000f

;==============================================
;Aism Alpha Counter
;==============================================
loc_04bba4:
	move.b (7,a6),d0
	move.w loc_04bbb0(pc,d0.w),d1
	jmp loc_04bbb0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bbb0:
	dc.w loc_04bbb4-loc_04bbb0
	dc.w loc_04bbd8-loc_04bbb0

;----------------------------------------------
loc_04bbb4:
	tst.b ($35,a6)
	beq.b loc_04bbd2
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_080e8e
	bsr.w loc_04b760
	move.b #$40,($3a,a6)

loc_04bbd2:
	jmp loc_02a7ea

;----------------------------------------------
loc_04bbd8:
	subq.b #1,($3a,a6)
	beq.w loc_04cec8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04bbe6:
	move.b (7,a6),d0
	move.w loc_04bbf2(pc,d0.w),d1
	jmp loc_04bbf2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bbf2:
	dc.w loc_04bc00-loc_04bbf2
	dc.w loc_04bc4e-loc_04bbf2
	dc.w loc_04bc76-loc_04bbf2
	dc.w loc_04bcd0-loc_04bbf2
	dc.w loc_04bd16-loc_04bbf2
	dc.w loc_04bd3e-loc_04bbf2
	dc.w loc_04bd82-loc_04bbf2

;----------------------------------------------
loc_04bc00:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_04bc42(pc,d0.w),($40,a6)
	move.l #$ffff8000,($48,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$d,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bc42:
	dc.l $00000000,$00060000,$00090000

;----------------------------------------------
loc_04bc4e:
	tst.b ($35,a6)
	beq.b loc_04bc70
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04bc62
	moveq #1,d0

loc_04bc62:
	move.b d0,($ab,a6)
	moveq #-$10,d0
	moveq #$2e,d1
	jsr loc_082e36

loc_04bc70:
	jmp loc_02a7ea

;----------------------------------------------
loc_04bc76:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_04bcca
	tst.b ($ab,a6)
	beq.b loc_04bca4
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04bc9e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04bc9e:
	move.b loc_04bccc(pc,d0.w),(pl_invinciblity_timer,a6)

loc_04bca4:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_04bcb0
	neg.l d0

loc_04bcb0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_04bcca
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_04bcca:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bccc:
	dc.b $05,$07,$09,$00

;----------------------------------------------
loc_04bcd0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_04bcf2
	addq.b #2,(7,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	rts

loc_04bcf2:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_04bcfe
	neg.l d0

loc_04bcfe:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_04bd14
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_04bd14:
	rts

;----------------------------------------------
loc_04bd16:
	tst.b ($35,a6)
	bne.b loc_04bd38
	move.b #1,($31,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_04bd38
	addq.b #2,(7,a6)

loc_04bd38:
	jmp loc_02a7ea

;----------------------------------------------
loc_04bd3e:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04bd66
	tst.b ($35,a6)
	bne.b loc_04bd64
	jmp loc_02a7ea

loc_04bd64:
	rts

loc_04bd66:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	jmp loc_02a7ea

;----------------------------------------------
loc_04bd82:
	tst.b ($33,a6)
	bmi.w loc_04cec8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04bd90:
	move.b (7,a6),d0
	move.w loc_04bd9c(pc,d0.w),d1
	jmp loc_04bd9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bd9c:
	dc.w loc_04bda0-loc_04bd9c
	dc.w loc_04be10-loc_04bd9c

;----------------------------------------------
loc_04bda0:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	move.b #$48,($3a,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #$23,d0
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.b loc_04bdca
	clr.b (pl_attk_active,a6)
	moveq #$1b,d0

loc_04bdca:
	clr.b (pl_crouching,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_04bddc
	tst.b ($81,a6)
	beq.b loc_04bdf4
	bra.b loc_04bde4

loc_04bddc:
	btst.b #2,($83,a6)
	beq.b loc_04bdf4

loc_04bde4:
	moveq #$1c,d0
	cmpi.b #-1,(PL_ism_choice,a6)
	bne.b loc_04bdf0
	moveq #$24,d0

loc_04bdf0:
	addq.b #1,(pl_crouching,a6)

loc_04bdf4:
	jsr loc_02a758
	moveq #3,d0
	tst.b (pl_crouching,a6)
	bne.b loc_04be04
	addq.b #1,d0

loc_04be04:
	jsr loc_02ef6c
	jmp loc_020674

;----------------------------------------------
loc_04be10:
	subq.b #1,($3a,a6)
	bne.b loc_04be22
	tst.b (pl_crouching,a6)
	beq.w loc_04cec8
	bra.w loc_04cece

loc_04be22:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04be28:
	move.b (7,a6),d0
	move.w loc_04be34(pc,d0.w),d1
	jmp loc_04be34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04be34:
	dc.w loc_04be3a-loc_04be34
	dc.w loc_04be5a-loc_04be34
	dc.w loc_04be8e-loc_04be34

;----------------------------------------------
loc_04be3a:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_04be54
	moveq #$2f,d0

loc_04be54:
	jmp loc_02a708

;----------------------------------------------
loc_04be5a:
	tst.b ($34,a6)
	beq.b loc_04be88
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #0,d0
	moveq #$3b,d1
	tst.b ($31,a6)
	beq.b loc_04be7e
	moveq #8,d0
	moveq #$3f,d1

loc_04be7e:
	jsr loc_097cd6
	bsr.w loc_04d23a

loc_04be88:
	jmp loc_02a7ea

;----------------------------------------------
loc_04be8e:
	subq.b #1,($3a,a6)
	bne.w loc_04ced4
	tst.b ($31,a6)
	beq.b loc_04bea4
	move.l #$02000602,(4,a6)

loc_04bea4:
	jmp loc_02f796

;==============================================
;
;==============================================
loc_04beaa:
	move.b (7,a6),d0
	move.w loc_04beb6(pc,d0.w),d1
	jmp loc_04beb6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04beb6:
	dc.w loc_04beba-loc_04beb6
	dc.w loc_04beec-loc_04beb6

;----------------------------------------------
loc_04beba:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #$25,d0
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.b loc_04bede
	clr.b (pl_attk_active,a6)
	moveq #$1d,d0

loc_04bede:
	jsr loc_02a758
	jsr loc_020674
	bra.b loc_04bef2

;----------------------------------------------
loc_04beec:
	jsr loc_02a7ea

loc_04bef2:
	jsr loc_02aa08
	bcc.b loc_04bf00
	jmp loc_02bd64

loc_04bf00:
	rts

;==============================================
;
;==============================================
loc_04bf02:
	move.b (7,a6),d0
	move.w loc_04bf0e(pc,d0.w),d1
	jmp loc_04bf0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bf0e:
	dc.w loc_04bf16-loc_04bf0e
	dc.w loc_04bf4e-loc_04bf0e
	dc.w loc_04bf98-loc_04bf0e
	dc.w loc_04bfa6-loc_04bf0e

;----------------------------------------------
loc_04bf16:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$40000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_04bf3c
	neg.l d0

loc_04bf3c:
	move.l d0,($40,a6)
	moveq #$12,d0
	jsr loc_02a758
	jmp loc_020674

;----------------------------------------------
loc_04bf4e:
	tst.b ($33,a6)
	bpl.b loc_04bf82
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #$48,($3a,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #5,d0
	jsr loc_02ef6c
	moveq #$14,d0
	cmpi.b #$ff,(PL_ism_choice,a6)
	bne.b loc_04bf7c
	moveq #$30,d0

loc_04bf7c:
	jmp loc_02a758

loc_04bf82:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04bf96
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_04bf96:
	rts

;----------------------------------------------
loc_04bf98:
	subq.b #1,($3a,a6)
	beq.w loc_04cec8
	jmp loc_02a7ea

;----------------------------------------------
loc_04bfa6:
	move.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$fffd0000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_04bfce
	neg.l d0

loc_04bfce:
	move.l d0,($40,a6)
	moveq #$13,d0
	jmp loc_02a758

;==============================================
;
;==============================================
loc_04bfda:
	move.b (7,a6),d0
	move.w loc_04bfe6(pc,d0.w),d1
	jmp loc_04bfe6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04bfe6:
	dc.w loc_04bff6-loc_04bfe6
	dc.w loc_04c022-loc_04bfe6
	dc.w loc_04c04a-loc_04bfe6
	dc.w loc_04c07c-loc_04bfe6
	dc.w loc_04c08e-loc_04bfe6
	dc.w loc_04c0f4-loc_04bfe6
	dc.w loc_04c132-loc_04bfe6
	dc.w loc_04c170-loc_04bfe6

;----------------------------------------------
loc_04bff6:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_04c022:
	tst.b ($35,a6)
	beq.b loc_04c044
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04c036
	moveq #1,d0

loc_04c036:
	move.b d0,($ab,a6)
	moveq #3,d0
	moveq #$55,d1
	jsr loc_082e36

loc_04c044:
	jmp loc_02a7ea

;----------------------------------------------
loc_04c04a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_04c076
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04c070
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04c070:
	move.b loc_04c078(pc,d0.w),(pl_invinciblity_timer,a6)

loc_04c076:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c078:
	dc.b $04,$06,$08,$00

;----------------------------------------------
loc_04c07c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04c08c
	addq.b #2,(7,a6)

loc_04c08c:
	rts

;----------------------------------------------
loc_04c08e:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_04c0a2
	move.b #1,($35,a6)

loc_04c0a2:
	tst.b ($35,a6)
	bne.b loc_04c0da
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	add.w d0,d0
	move.l loc_04c0dc(pc,d0.w),($40,a6)
	move.l #$90000,($44,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)

loc_04c0da:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c0dc:
	dc.l $00030000,$ffffe000
	dc.l $00060000,$ffffb000
	dc.l $00090000,$ffff8000

;----------------------------------------------
loc_04c0f4:
	tst.w ($40,a6)
	bmi.b loc_04c128
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_04c116
	neg.l d0

loc_04c116:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04c128:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04c132:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04c154
	tst.b ($35,a6)
	beq.b loc_04c16a
	rts

loc_04c154:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c

loc_04c16a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04c170:
	tst.b ($33,a6)
	bpl.b loc_04c16a
	bra.w loc_04cec8

;==============================================
;Super Taunt
;==============================================
loc_04c17a:
	move.b (7,a6),d0
	move.w loc_04c186(pc,d0.w),d1
	jmp loc_04c186(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c186:
	dc.w loc_04c1aa-loc_04c186;0024
	dc.w loc_04c1ea-loc_04c186;0064
	dc.w loc_04c210-loc_04c186;008a
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c260-loc_04c186;00da
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c260-loc_04c186;00da
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c260-loc_04c186;00da
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c260-loc_04c186;00da
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c260-loc_04c186;00da
	dc.w loc_04c22c-loc_04c186;00a6
	dc.w loc_04c2ba-loc_04c186;0134
	dc.w loc_04c2e0-loc_04c186;015a
	dc.w loc_04c326-loc_04c186;01a0
	dc.w loc_04c392-loc_04c186;020c

;----------------------------------------------
loc_04c1aa:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	jsr loc_0804da
	moveq #-$30,d0
	jsr loc_02ef6c
	jsr loc_02068c
	clr.b (pl_attk_active,a6)
	move.b #1,(pl_crouching,a6)
	move.b #0,($248,a6)
	move.b #0,($82,a6)
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_04c1ea:
	tst.b ($35,a6)
	beq.b loc_04c20a
	addq.b #2,(7,a6)
	move.b #-1,($ab,a6)
	move.b #$32,($3a,a6)
	moveq #-$25,d0
	moveq #$41,d1
	jsr loc_082e36

loc_04c20a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04c210:
	jsr loc_02a7ea
	subq.b #1,($3a,a6)
	bne.b loc_04c22a
	addq.b #2,(7,a6)
	move.w #1,($3a,a6)
	clr.b ($ab,a6)

loc_04c22a:
	rts

;----------------------------------------------
loc_04c22c:
	subq.b #1,($3b,a6)
	bne.b loc_04c25a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$30000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_04c24e
	neg.l d0

loc_04c24e:
	move.l d0,($40,a6)
	moveq #$21,d0
	jsr loc_02a758

loc_04c25a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04c260:
	tst.b ($33,a6)
	bpl.b loc_04c2aa
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_04cece
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	clr.b (pl_crouching,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	move.b ($3a,a6),d0
	move.b loc_04c2ae(pc,d0.w),($3b,a6)
	move.b loc_04c2b4(pc,d0.w),d0
	jsr loc_0038e4
	addq.b #1,($3a,a6)
	moveq #$1e,d0
	jmp loc_02a758

loc_04c2aa:
	bra.w loc_04c3a0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c2ae:
	dc.b $30,$30,$30,$30,$60,$00

loc_04c2b4:
	dc.b $11,$0f,$14,$12,$0b,$00

;----------------------------------------------
loc_04c2ba:
	tst.b ($33,a6)
	bpl.b loc_04c2dc
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #$30,($3b,a6)
	move.b #1,(pl_crouching,a6)
	moveq #$1f,d0
	jmp loc_02a758

loc_04c2dc:
	bra.w loc_04c3a0

;----------------------------------------------
loc_04c2e0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04c324
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$fffe4000,d0
	tst.b (PL_Flip,a6)
	beq.b loc_04c308
	neg.l d0

loc_04c308:
	move.l d0,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffffb000,($4c,a6)

loc_04c324:
	rts

;----------------------------------------------
loc_04c326:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04c356
	tst.b ($35,a6)
	bne.b loc_04c354
	jmp loc_02a7ea

loc_04c354:
	rts

loc_04c356:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	jsr loc_00369c
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_04cec8
	move.b #$70,($3a,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #2,($294,a6)
	moveq #$20,d0
	jmp loc_02a758

;----------------------------------------------
loc_04c392:
	subq.b #1,($3a,a6)
	beq.w loc_04cec8
	jmp loc_02a7ea

;==============================================
loc_04c3a0:
	tst.b ($35,a6)
	beq.b loc_04c3ae
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_04c3ae:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04c3b4:
	move.b (7,a6),d0
	move.w loc_04c3c0(pc,d0.w),d1
	jmp loc_04c3c0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c3c0:
	dc.w loc_04c3c8-loc_04c3c0
	dc.w loc_04c466-loc_04c3c0
	dc.w loc_04b9f0-loc_04c3c0
	dc.w loc_04ba46-loc_04c3c0

;----------------------------------------------
loc_04c3c8:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_04c436+8(pc,d0.w),($44,a6)
	move.l loc_04c436+$c(pc,d0.w),($4c,a6)
	move.l loc_04c436(pc,d0.w),d1
	move.l loc_04c436+4(pc,d0.w),d2
	tst.b ($3c,a6)
	bpl.b loc_04c414
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	neg.l d1
	neg.l d2

loc_04c414:
	tst.b (PL_Flip,a6)
	bne.b loc_04c41e
	neg.l d1
	neg.l d2

loc_04c41e:
	add.l d1,($40,a6)
	add.l d2,($48,a6)
	moveq #$27,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c436:
	dc.l $00010000,$fffffa00,$00038000,$ffff7800
	dc.l $00020000,$fffffa00,$00038000,$ffffb000
	dc.l $00030000,$fffffa00,$00038000,$ffffe000

;----------------------------------------------
loc_04c466:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04c4fc
	move.b #6,(7,a6)
	bra.w loc_04c4dc

loc_04c49c:
	tst.b ($33,a6)
	bpl.b loc_04c4a6
	addq.b #2,(7,a6)

loc_04c4a6:
	jmp loc_02a7ea

;==============================================
loc_04c4ac:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04c4fc
	addq.b #2,(7,a6)

loc_04c4dc:
	move.w d0,($14,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	move.b #1,(pl_crouching,a6)
	moveq #$10,d0
	jmp loc_02a758

loc_04c4fc:
	jmp loc_02a7ea

;==============================================
loc_04c502:
	tst.b ($33,a6)
	bmi.w loc_04cece
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Taunt Mode(replace attacks with Taunts and replace the actual taunt)
;==============================================
loc_04c516:
	move.b (7,a6),d0
	move.w loc_04c522(pc,d0.w),d1
	jmp loc_04c522(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c522:
	dc.w loc_04c52a-loc_04c522
	dc.w loc_04caf4-loc_04c522
	dc.w loc_04caf6-loc_04c522
	dc.w loc_04cba6-loc_04c522

;----------------------------------------------
loc_04c52a:
	subq.w #1,($3a,a6)
	bne.b loc_04c534
	st.b ($1fc,a6)

loc_04c534:
	bsr.w loc_04ce6e
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_04c546(pc,d0.w),d1
	jmp loc_04c546(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c546:
	dc.w loc_04c558-loc_04c546
	dc.w loc_04c606-loc_04c546
	dc.w loc_04c6d4-loc_04c546
	dc.w loc_04c71a-loc_04c546
	dc.w loc_04c82a-loc_04c546
	dc.w loc_04c8c2-loc_04c546
	dc.w loc_04cac2-loc_04c546
	dc.w loc_04cac4-loc_04c546

	dc.w loc_04cac4-loc_04c546

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c558:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_04c566(pc,d0.w),d1
	jmp loc_04c566(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c566:
	dc.w loc_04c56e-loc_04c566
	dc.w loc_04c588-loc_04c566
	dc.w loc_04c5ce-loc_04c566
	dc.w loc_04c600-loc_04c566

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c56e:
	addq.b #2,($85,a6)
	moveq #0,d0
	tst.b (pl_crouching,a6)
	beq.b loc_04c582
	move.b #4,($85,a6)
	moveq #1,d0

loc_04c582:
	jmp loc_02a708

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c588:
	clr.b (pl_crouching,a6)
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cd38
	bne.w loc_04cd42
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cd68
	bne.w loc_04cd70
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cbdc
	bne.w loc_04cbea
	jmp loc_02a7ea

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c5ce:
	move.b #2,(pl_crouching,a6)
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cd38
	bne.w loc_04cd42
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cd68
	beq.w loc_04cd88

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c600:
	jmp loc_02a7ea

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c606:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_04c614(pc,d0.w),d1
	jmp loc_04c614(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c614:
	dc.w loc_04c61c-loc_04c614
	dc.w loc_04c620-loc_04c614
	dc.w loc_04c67c-loc_04c614
	dc.w loc_04c680-loc_04c614

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c61c:
	addq.b #2,($85,a6)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c620:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cd68
	bne.b loc_04c666
	bsr.w loc_04cbdc
	bne.w loc_04cbea
	addq.b #2,($85,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addq.w #4,d0
	jmp loc_02a708

loc_04c666:
	bsr.w loc_04cd38
	bne.w loc_04cd42
	tst.b ($33,a6)
	bmi.w loc_04ce44
	jmp loc_02a7ea

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c67c:
	addq.b #2,($85,a6)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c680:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cd68
	beq.b loc_04c6be
	clr.b ($85,a6)
	move.b ($35,a6),d0
	andi.w #$00ff,d0
	addq.w #7,d0
	jmp loc_02a708

loc_04c6be:
	bsr.w loc_04cd38
	bne.w loc_04cd42
	tst.b ($33,a6)
	bmi.w loc_04ce1e
	jmp loc_02a7ea

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c6d4:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cd68
	bne.w loc_04cd70
	bsr.w loc_04cd2e
	beq.w loc_04ce1e
	bsr.w loc_04cd38
	bne.w loc_04cd42
	bsr.w loc_04cc30
	jmp loc_02a7ea

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c71a:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_04c728(pc,d0.w),d1
	jmp loc_04c728(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c728:
	dc.w loc_04c730-loc_04c728
	dc.w loc_04c766-loc_04c728
	dc.w loc_04c7b8-loc_04c728
	dc.w loc_04c7f0-loc_04c728

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c730:
	tst.b ($33,a6)
	bpl.w loc_04ced4
	addq.b #2,($85,a6)
	clr.b (pl_crouching,a6)
	move.b #1,($31,a6)
	clr.b ($23f,a6)
	moveq #$13,d0
	cmpi.b #1,($3c,a6)
	beq.b loc_04c760
	moveq #$14,d0
	cmpi.b #$ff,($3c,a6)
	beq.b loc_04c760
	moveq #$12,d0

loc_04c760:
	jmp loc_02a708

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c766:
	jsr loc_02aa08
	bcc.b loc_04c7aa
	tst.w ($44,a6)
	bpl.b loc_04c7aa
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	jsr loc_00369c
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cd38
	bne.w loc_04cd42
	addq.b #2,($85,a6)
	moveq #$11,d0
	jmp loc_02a708

loc_04c7aa:
	bsr.w loc_04cda0
	bne.w loc_04cc92
	jmp loc_02a7ea

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c7b8:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cd38
	bne.w loc_04cd42
	tst.b ($33,a6)
	bpl.w loc_04ced4
	bsr.w loc_04cd68
	bne.w loc_04cd70
	bra.w loc_04ce1e

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c7f0:
	jsr loc_02aa08
	bcc.w loc_04ced4
	tst.w ($44,a6)
	bpl.w loc_04ced4
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	jsr loc_00369c
	move.b #4,($85,a6)
	moveq #$11,d0
	jmp loc_02a708

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c82a:
	move.b ($85,a6),d0
	move.w loc_04c836(pc,d0.w),d1
	jmp loc_04c836(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c836:
	dc.w loc_04c83a-loc_04c836
	dc.w loc_04c882-loc_04c836

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c83a:
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cbdc
	bne.w loc_04cbea
	bsr.w loc_04cd68
	beq.b loc_04c86e
	addq.b #2,($85,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addi.w #$d,d0
	jmp loc_02a708

loc_04c86e:
	tst.b ($33,a6)
	bmi.w loc_04ce1e
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02a7ea

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c882:
	bsr.w loc_04cda0
	bne.w loc_04cdaa
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	bsr.w loc_04cd68
	bne.b loc_04c8ae
	clr.b ($85,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addi.w #$a,d0
	jmp loc_02a708

loc_04c8ae:
	tst.b ($33,a6)
	bmi.w loc_04ce44
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02a7ea

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04c8c2:
	clr.b (pl_crouching,a6)
	tst.b ($80,a6)
	beq.b loc_04c8d2
	move.b #2,(pl_crouching,a6)

loc_04c8d2:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1fc,a6),d0
	bne.w loc_04ceb4
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_04c8f4(pc,d0.w),d1
	jmp loc_04c8f4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c8f4:
	dc.w loc_04c8fa-loc_04c8f4
	dc.w loc_04c9b6-loc_04c8f4
	dc.w loc_04ca08-loc_04c8f4

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c8fa:
	move.b #4,($85,a6)
	move.b #1,(pl_attk_active,a6)
	bsr.w loc_04cab6
	move.b ($82,a6),($1f8,a6)
	move.b ($80,a6),($1f9,a6)
	move.b ($81,a6),($1fa,a6)
	moveq #0,d0
	move.b ($80,a6),d0
	beq.b loc_04c934
	btst.b #1,($371,a6)
	bne.b loc_04c962
	btst.b #0,($371,a6)
	bne.b loc_04c986

loc_04c934:
	lsr.b #1,d0
	add.b ($82,a6),d0
	move.b d0,($a,a6)
	tst.b ($81,a6)
	beq.b loc_04c946
	addq.b #6,d0

loc_04c946:
	move.b loc_04c9aa(pc,d0.w),d0
	jsr loc_0038e4
	moveq #$2a,d0
	add.b ($a,a6),d0
	move.b #$3c,($a,a6)
	jmp loc_02a758

loc_04c962:
	move.b #2,($85,a6)
	move.b #1,($31,a6)
	move.l #$20000,($40,a6)
	move.l #0,($48,a6)
	moveq #$12,d0
	jmp loc_02a758

loc_04c986:
	move.b #2,($85,a6)
	move.b #1,($31,a6)
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	moveq #$13,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c9aa:
	dc.b $09,$09,$0c,$0c,$0d,$0d
	dc.b $0e,$0e,$0f,$0f,$10,$10

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04c9b6:
	bsr.w loc_04d20c
	tst.b ($33,a6)
	bpl.w loc_04ced4
	addq.b #2,($85,a6)
	move.b #$3c,($a,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.b ($82,a6),d0
	tst.b ($81,a6)
	beq.b loc_04c9de
	addq.b #6,d0

loc_04c9de:
	tst.w ($40,a6)
	bpl.b loc_04c9e6
	addq.b #1,d0

loc_04c9e6:
	move.b loc_04c9fc(pc,d0.w),d0
	jsr loc_0038e4
	moveq #$2b,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04c9fc:
	dc.b $10,$10,$11,$11,$12,$12
	dc.b $14,$14,$17,$17,$19,$19

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04ca08:
	bsr.w loc_04cc46
	bne.w loc_04cc4e
	subq.b #1,($a,a6)
	bmi.b loc_04ca5e
	tst.b ($35,a6)
	beq.b loc_04ca46
	bsr.w loc_04ca6a
	beq.b loc_04ca46
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #8,d0
	move.b ($80,a6),d0
	lsl.l #8,d0
	move.b ($81,a6),d0
	lsl.l #8,d0
	cmp.l ($1f8,a6),d0
	beq.b loc_04ca46
	clr.b ($85,a6)
	jmp loc_02a7ea

loc_04ca46:
	move.b ($1f8,a6),($82,a6)
	move.b ($1f9,a6),($80,a6)
	move.b ($1fa,a6),($81,a6)
	jmp loc_02a7ea

loc_04ca5e:
	tst.b ($80,a6)
	bne.w loc_04ce44
	bra.w loc_04ce1e

loc_04ca6a:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($1fc,a6),d0
	bne.b loc_04caae
	move.b ($378,a6),d0
	andi.w #$77,d0
	beq.b loc_04caae
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	bsr.w loc_04cdea
	move.b d1,($82,a6)
	move.b d2,($81,a6)
	clr.b ($80,a6)
	btst.b #2,($371,a6)
	beq.b loc_04caa6
	move.b #2,($80,a6)

loc_04caa6:
	moveq #1,d0
	move.b d0,($247,a6)
	rts

loc_04caae:
	moveq #0,d0
	move.b d0,($247,a6)
	rts

;==============================================
loc_04cab6:
	moveq #0,d0
	move.b d0,(pl_crouching,a6)
	move.b d0,($5b,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04cac2:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04cac4:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_04cad2(pc,d0.w),d1
	jmp loc_04cad2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04cad2:
	dc.w loc_04cad6-loc_04cad2
	dc.w loc_04cae8-loc_04cad2

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04cad6:
	addq.b #2,($85,a6)
	move.b #$3c,($a,a6)
	moveq #$20,d0
	jmp loc_02a758

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04cae8:
	subq.b #1,($a,a6)
	bpl.w loc_04ced4
	bra.w loc_04ce1e

;----------------------------------------------
loc_04caf4:
	rts

;----------------------------------------------
loc_04caf6:
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_04cb04(pc,d0.w),d1
	jmp loc_04cb04(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04cb04:
	dc.w loc_04cb0a-loc_04cb04
	dc.w loc_04cb3c-loc_04cb04
	dc.w loc_04cb6a-loc_04cb04

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04cb0a:
	addq.b #2,($84,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b d0,($1fc,a6)
	move.b d0,($5b,a6)
	move.l d0,($1f8,a6)
	move.w #$4b0,($3a,a6)
	moveq #$1a,d0
	jmp loc_02a758

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04cb3c:
	tst.b ($34,a6)
	beq.b loc_04cb64
	addq.b #2,($84,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04cb50
	moveq #1,d0

loc_04cb50:
	move.b d0,($ab,a6)
	move.b #$3c,($a,a6)
	moveq #$1f,d0
	moveq #$4b,d1
	jsr loc_082e36

loc_04cb64:
	jmp loc_02a7ea

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_04cb6a:
	jsr loc_02a7ea
	subq.b #1,($a,a6)
	bne.b loc_04cba0
	moveq #0,d0
	move.b d0,(7,a6)
	move.l d0,($84,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04cb96
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04cb96:
	move.b loc_04cba2(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($216,a6)

loc_04cba0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04cba2:
	dc.b $10,$10,$10,$00

;----------------------------------------------
loc_04cba6:
	tst.b ($35,a6)
	beq.b loc_04cbce
	jsr loc_01c2c8
	beq.b loc_04cbce
	move.l #$01001c0c,(a4)
	move.w a6,($36,a4)
	move.w #7,($44,a4)
	move.w #$52,($4c,a4)
	clr.b ($35,a6)

loc_04cbce:
	subq.b #1,($a,a6)
	bpl.w loc_04ced4
	jmp loc_02baf2

;==============================================
loc_04cbdc:
	moveq #6,d1
	move.b ($371,a6),d0
	andi.w #$f,d0
	btst.l d0,d1
	rts

;==============================================
loc_04cbea:
	move.w #$402,($84,a6)
	bsr.w loc_04cc06
	moveq #2,d0
	btst.b #1,($371,a6)
	bne.b loc_04cc00
	moveq #3,d0

loc_04cc00:
	jmp loc_02a708

;==============================================
loc_04cc06:
	move.l #$fffd0000,d1
	moveq #0,d2
	btst.b #1,($371,a6)
	bne.b loc_04cc1e
	move.l #$20000,d1
	moveq #2,d2

loc_04cc1e:
	move.b d2,($3c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_04cc2a
	neg.l d1

loc_04cc2a:
	move.l d1,($40,a6)
	rts

;==============================================
loc_04cc30:
	move.b ($3c,a6),d0
	btst d0,($371,a6)
	beq.b loc_04cc3c
	bsr.b loc_04cbea

loc_04cc3c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;==============================================
loc_04cc46:
	btst.b #3,($371,a6)
	rts

;==============================================
loc_04cc4e:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$600,($84,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,(pl_invinciblity_timer,a6)
	move.b #5,($23f,a6)
	bsr.w loc_04ccc0
	move.b #1,($3c,a6)
	move.b ($371,a6),d1
	btst #1,d1
	bne.b loc_04cc8a
	st.b ($3c,a6)
	btst #0,d1
	bne.b loc_04cc8a
	clr.b ($3c,a6)

loc_04cc8a:
	moveq #$10,d0
	jmp loc_02a708

;==============================================
loc_04cc92:
	move.b #6,($85,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b ($d2,a6)
	bsr.w loc_04cab6
	move.b #4,($80,a6)
	move.b #0,($82,a6)
	move.b #0,($81,a6)
	moveq #$1d,d0
	jmp loc_02a758

;==============================================
loc_04ccc0:
	moveq #0,d1
	move.b ($371,a6),d2
	andi.w #3,d2
	beq.b loc_04ccd6
	moveq #$10,d1
	btst #1,d2
	bne.b loc_04ccd6
	moveq #$20,d1

loc_04ccd6:
	move.l loc_04ccfe+4(pc,d1.w),($44,a6)
	move.l loc_04ccfe+$c(pc,d1.w),($4c,a6)
	move.l loc_04ccfe(pc,d1.w),d0
	move.l loc_04ccfe+8(pc,d1.w),d1
	tst.b (PL_Flip,a6)
	beq.b loc_04ccf4
	neg.l d0
	neg.l d1

loc_04ccf4:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ccfe:
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;==============================================
loc_04cd2e:
	move.b ($371,a6),d0
	andi.b #3,d0
	rts

;==============================================
loc_04cd38:
	move.b (pl_sidecheck,a6),d0
	cmp.b (PL_Flip,a6),d0
	rts

;==============================================
loc_04cd42:
	clr.b (7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.w #$800,($84,a6)
	moveq #$a,d0
	tst.b (pl_crouching,a6)
	beq.b loc_04cd62
	move.w #$802,($84,a6)
	moveq #$d,d0

loc_04cd62:
	jmp loc_02a708

;==============================================
loc_04cd68:
	btst.b #2,($371,a6)
	rts

;==============================================
loc_04cd70:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$200,($84,a6)
	move.b d0,(pl_crouching,a6)
	moveq #7,d0
	jmp loc_02a708

;==============================================
loc_04cd88:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$204,($84,a6)
	move.b d0,(pl_crouching,a6)
	moveq #4,d0
	jmp loc_02a708

;==============================================
loc_04cda0:
	move.b ($378,a6),d0
	andi.w #$77,d0
	rts

;==============================================
loc_04cdaa:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$a00,($84,a6)
	move.b d0,($82,a6)
	move.b d0,($81,a6)
	bsr.w loc_04cdd6
	moveq #0,d0
	bsr.b loc_04cd68
	beq.b loc_04cdca
	moveq #2,d0

loc_04cdca:
	move.b d0,(pl_crouching,a6)
	move.b d0,($80,a6)
	bra.w loc_04c8c2

;==============================================
loc_04cdd6:
	bsr.w loc_04cdea
	move.b d1,($82,a6)
	move.b d2,($81,a6)
	move.b ($371,a6),($83,a6)
	rts

;==============================================
loc_04cdea:
	move.b ($378,a6),d0
	moveq #0,d1
	moveq #0,d2
	btst #0,d0
	bne.b loc_04ce1c
	moveq #2,d1
	btst #1,d0
	bne.b loc_04ce1c
	moveq #4,d1
	btst #2,d0
	bne.b loc_04ce1c
	moveq #0,d1
	moveq #2,d2
	btst #4,d0
	bne.b loc_04ce1c
	moveq #2,d1
	btst #5,d0
	bne.b loc_04ce1c
	moveq #4,d1

loc_04ce1c:
	rts

;==============================================
loc_04ce1e:
	tst.b ($1fc,a6)
	bne.w loc_04ceb4
	moveq #0,d0
	move.b d0,(7,a6)
	move.w d0,($84,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,(pl_attk_active,a6)
	move.b d0,($247,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04ce44:
	tst.b ($1fc,a6)
	bne.w loc_04ceb4
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #4,($84,a6)
	move.b #2,(pl_crouching,a6)
	move.b d0,(pl_attk_active,a6)
	move.b d0,($247,a6)
	moveq #1,d0
	jmp loc_02a708

;==============================================
loc_04ce6e:
	btst.b #7,($378,a6)
	bne.w loc_04ce7a

loc_04ce78:
	rts

loc_04ce7a:
	bsr.w loc_04ce92
	beq.b loc_04ce78
	clr.b (7,a6)
	move.w #$e00,($84,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
loc_04ce92:
	tst.b (7,a6)
	bne.w loc_04ceb0
	tst.b ($31,a6)
	bne.w loc_04ceb0
	cmpi.b #$e,($84,a6)
	beq.w loc_04ceb0
	moveq #1,d0
	rts

loc_04ceb0:
	moveq #0,d0
	rts

;==============================================
loc_04ceb4:
	move.b #6,(7,a6)
	move.b #$3c,($a,a6)
	moveq #$20,d0
	jmp loc_02a758

;==============================================
loc_04cec8:
	jmp loc_02baf2

;==============================================
loc_04cece:
	jmp loc_02bb26

;==============================================
loc_04ced4:
	jmp loc_02a7ea

;==============================================
loc_04ceda:
	rts

;##############################################
;Throws
;##############################################
loc_04cedc:
	cmpi.b #4,($80,a6)
	beq.w loc_04cfa8
	move.b (7,a6),d0
	move.w loc_04cef8(pc,d0.w),d1
	jsr loc_04cef8(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04cef8:
	dc.w loc_04cf02-loc_04cef8
	dc.w loc_04cf20-loc_04cef8
	dc.w loc_04cf72-loc_04cef8
	dc.w loc_04cf7e-loc_04cef8
	dc.w loc_04cf96-loc_04cef8

;----------------------------------------------
loc_04cf02:
	addq.b #2,(7,a6)
	bsr.w loc_04b760
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_04cf20:
	tst.b ($33,a6)
	bpl.b loc_04ced4
	moveq #$57,d0
	jsr loc_02e3fe
	beq.b loc_04cf66
	move.b #6,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_04cf46
	jsr loc_03a0e4
	bcs.b loc_04cf5a
	bra.b loc_04cf5e

loc_04cf46:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_04cf5e
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_04cf5e

loc_04cf5a:
	addq.b #1,(PL_Flip,a6)

loc_04cf5e:
	moveq #0,d0
	jmp loc_02a758

loc_04cf66:
	addq.b #2,(7,a6)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_04cf72:
	tst.b ($33,a6)
	bpl.b loc_04cf90
	jmp loc_02baf2

;----------------------------------------------
loc_04cf7e:
	tst.b ($35,a6)
	beq.b loc_04cf90
	addq.b #2,(7,a6)
	moveq #$57,d0
	jsr loc_02e7f2

loc_04cf90:
	jmp loc_02a7ea

;----------------------------------------------
loc_04cf96:
	tst.b ($33,a6)
	bpl.b loc_04cf90
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;==============================================
;Air Throws
;==============================================
loc_04cfa8:
	move.b (7,a6),d0
	move.w loc_04cfba(pc,d0.w),d1
	jsr loc_04cfba(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04cfba:
	dc.w loc_04cfc2-loc_04cfba
	dc.w loc_04cfee-loc_04cfba
	dc.w loc_04cffe-loc_04cfba
	dc.w loc_04d016-loc_04cfba

;----------------------------------------------
loc_04cfc2:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$58,d0
	jsr loc_02e636
	beq.b loc_04cfe6
	move.b #$4,(7,a6)
	moveq #$26,d0
	jmp loc_02a758

loc_04cfe6:
	moveq #$22,d0
	jmp loc_02a758

;----------------------------------------------
loc_04cfee:
	jsr loc_02aa08
	bcc.w loc_04ced4
	jmp loc_02baf2

;----------------------------------------------
loc_04cffe:
	tst.b ($35,a6)
	beq.b loc_04d010
	addq.b #2,(7,a6)
	moveq #$58,d0
	jsr loc_02e7f2

loc_04d010:
	jmp loc_02a7ea

;----------------------------------------------
loc_04d016:
	jsr loc_02aa08
	bcc.w loc_04ced4
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;##############################################
;
;##############################################
loc_04d02c:
	move.b (6,a6),d0
	move.w loc_04d038(pc,d0.w),d1
	jmp loc_04d038(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d038:
	dc.w loc_04d040-loc_04d038
	dc.w loc_04d052-loc_04d038
	dc.w loc_04d068-loc_04d038
	dc.w loc_04d16a-loc_04d038

;----------------------------------------------
loc_04d040:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04d052:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_04d062
	tst.b ($11c,a5)
	bne.b loc_04d062
	addq.b #2,(6,a6)

loc_04d062:
	jmp loc_02a7ea

;----------------------------------------------
loc_04d068:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	subq.b #2,d0
	bpl.w loc_04d112
	movea.w ($38,a6),a4
	cmpi.b #$b,($102,a4)
	beq.w loc_04d12a
	cmpi.b #$19,($102,a4)
	beq.w loc_04d12a
	cmpi.w #$90,($50,a6)
	bcs.b loc_04d0ac
	jsr RNGFunction
	andi.w #$3f,d0
	bne.b loc_04d0ac
	moveq #2,d0
	bra.b loc_04d0c8

loc_04d0ac:
	jsr RNGFunction
	andi.w #$1f,d0
	cmpi.w #$80,($50,a6)
	bcs.b loc_04d0c4
	move.b loc_04d0f2(pc,d0.w),d0
	bra.b loc_04d0c8

loc_04d0c4:
	move.b loc_04d0d2(pc,d0.w),d0

loc_04d0c8:
	addi.b #$23,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d0d2:
	dc.b $00,$01,$00,$01,$00,$01,$00,$00
	dc.b $00,$00,$00,$01,$00,$01,$00,$01
	dc.b $00,$01,$00,$01,$00,$01,$00,$00
	dc.b $00,$00,$00,$01,$00,$01,$00,$01

loc_04d0f2:
	dc.b $00,$00,$01,$00,$00,$00,$01,$00
	dc.b $01,$01,$03,$01,$01,$01,$01,$01
	dc.b $00,$00,$01,$00,$00,$00,$01,$00
	dc.b $01,$01,$03,$01,$01,$01,$01,$01

;----------------------------------------------
loc_04d112:
	lsr.b #1,d0
	move.b loc_04d122(pc,d0.w),d0
	addi.b #$23,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d122:
	dc.b $00,$01,$02,$03,$04,$00,$01,$02

;----------------------------------------------
loc_04d12a:
	moveq #$26,d0
	tst.b ($141,a5)
	beq.b loc_04d144
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_04d14a(pc,d0.w),d0
	addi.b #$23,d0

loc_04d144:
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d14a:
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $01,$01,$03,$01,$01,$03,$01,$01
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $01,$01,$03,$01,$01,$03,$01,$01

;----------------------------------------------
loc_04d16a:
	tst.b ($3a,a6)
	beq.b loc_04d17e
	subq.b #1,($3a,a6)
	bne.b loc_04d17e
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04d17e:
	jmp loc_02a7ea

;##############################################
;Time Over
;##############################################
loc_04d184:
	move.b (6,a6),d0
	move.w loc_04d190(pc,d0.w),d1
	jmp loc_04d190(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d190:
	dc.w loc_04d198-loc_04d190
	dc.w loc_04d1aa-loc_04d190
	dc.w loc_04d1ba-loc_04d190
	dc.w loc_04d1d4-loc_04d190

;----------------------------------------------
loc_04d198:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04d1aa:
	tst.b ($11c,a5)
	bne.b loc_04d1b4
	addq.b #2,(6,a6)

loc_04d1b4:
	jmp loc_02a7ea

;----------------------------------------------
loc_04d1ba:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_04d1ce
	moveq #$29,d0

loc_04d1ce:
	jmp loc_02a708

;----------------------------------------------
loc_04d1d4:
	tst.b ($35,a6)
	beq.b loc_04d1f2
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04d1f2
	addq.b #1,(a4)
	move.w #$3a07,(2,a4)
	move.w a6,($36,a4)

loc_04d1f2:
	tst.b ($3a,a6)
	beq.b loc_04d206
	subq.b #1,($3a,a6)
	bne.b loc_04d206
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04d206:
	jmp loc_02a7ea

;==============================================
loc_04d20c:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_04d218
	neg.l d0

loc_04d218:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_04d226:
	bsr.b loc_04d20c
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_04d23a:
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
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;##############################################
;
;##############################################
loc_04d282:
	dc.w loc_04d2c4-loc_04d282
	dc.w loc_04d2c4-loc_04d282
	dc.w loc_04d288-loc_04d282

loc_04d288:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $02,$02,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_04d2c4:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $02,$02,$08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
