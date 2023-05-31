;##############################################
;Normals
;##############################################
loc_054124:
	cmpi.b #4,($80,a6)
	beq.w loc_054550;To Bodysplash
	tst.b ($80,a6)
	bne.w loc_05438e;To Crouching
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_054318;To Kicks
	move.b (7,a6),d0
	move.w loc_05414e(pc,d0.w),d1
	jmp loc_05414e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05414e:
	dc.w loc_05415a-loc_05414e
	dc.w loc_054266-loc_05414e
	dc.w loc_054284-loc_05414e
	dc.w loc_05429c-loc_05414e
	dc.w loc_0542e6-loc_05414e
	dc.w loc_05430a-loc_05414e

;----------------------------------------------
loc_05415a:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	jsr loc_02aebc
	cmpi.b #$ff,(PL_ism_choice,a6)
	bne.b loc_0541d6
	cmpi.b #4,($82,a6)
	bne.w loc_05422a
	btst.b #1,($83,a6)
	beq.w loc_05422a
	move.b #4,(7,a6)
	move.l #$48000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$120000,d1
	move.l #$fffff000,d2
	tst.b (PL_Flip,a6)
	bne.b loc_0541c6
	neg.l d1
	neg.l d2

loc_0541c6:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

loc_0541d6:
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_05422a
	cmpi.b #2,($82,a6)
	bne.b loc_05422a
	btst.b #1,($83,a6)
	beq.b loc_05422a
	move.b #4,(7,a6)
	move.l #$48000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$a0000,d1
	move.l #$fffff000,d2
	tst.b (PL_Flip,a6)
	bne.b loc_05421a
	neg.l d1
	neg.l d2

loc_05421a:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #$21,d0
	jmp Set_Spec_Cancel_Timers

loc_05422a:
	moveq #0,d1
	moveq #0,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_05424c
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_05424c
	btst.b #0,($83,a6)
	bne.b loc_054258
	bra.b loc_05425a

loc_05424c:
	move.w loc_054260(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_05425a

loc_054258:
	addq.b #1,d0

loc_05425a:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054260:
	dc.w $0020,$0030,$0040

;----------------------------------------------
loc_054266:
	btst.b #0,($34,a6)
	beq.b loc_05427e
	move.w #3,d0
	tst.b (PL_Flip,a6)
	bne.b loc_05427a
	neg.w d0

loc_05427a:
	add.w d0,($10,a6)

loc_05427e:
	jmp loc_02f5ac

;----------------------------------------------
loc_054284:
	tst.b ($35,a6)
	bne.w loc_05697e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05429c:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.w loc_0542c2
	addq.b #2,(7,a6)
	move.l #$20000,d1
	move.l #$fffff800,d2
	cmpi.b #4,($82,a6)
	beq.b loc_0542ce

loc_0542c2:
	move.l #$24000,d1
	move.l #$fffff800,d2

loc_0542ce:
	tst.b (PL_Flip,a6)
	bne.b loc_0542d8
	neg.l d1
	neg.l d2

loc_0542d8:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0542e6:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05430a:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02baf2

;==============================================
;Kicks
;==============================================
loc_054318:
	move.b (7,a6),d0
	move.w loc_054324(pc,d0.w),d1
	jmp loc_054324(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054324:
	dc.w loc_054328-loc_054324
	dc.w loc_054388-loc_054324


;----------------------------------------------
loc_054328:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	jsr loc_02aebc
	moveq #0,d1
	moveq #6,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_05436e
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_05436e
	btst.b #0,($83,a6)
	bne.b loc_05437a
	bra.b loc_05437c

loc_05436e:
	move.w loc_054382(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_05437c

loc_05437a:
	addq.b #1,d0

loc_05437c:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054382:
	dc.w $0020,$0030,$0040

;----------------------------------------------
loc_054388:
	jmp loc_02f5ac

;==============================================
;Crouching
;==============================================
loc_05438e:
	move.b #1,(pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_0543e0
	move.b (7,a6),d0
	move.w loc_0543a8(pc,d0.w),d1
	jmp loc_0543a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0543a8:
	dc.w loc_0543ac-loc_0543a8
	dc.w loc_0543da-loc_0543a8

;----------------------------------------------
loc_0543ac:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_0543da:
	jmp loc_02f5ac

;==============================================
;Crouching Kicks
;==============================================
loc_0543e0:
	move.b (7,a6),d0
	move.w loc_0543ec(pc,d0.w),d1
	jmp loc_0543ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0543ec:
	dc.w loc_0543f0-loc_0543ec
	dc.w loc_054440-loc_0543ec

;----------------------------------------------
loc_0543f0:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	move.b ($82,a6),d0
	beq.b loc_054434
	move.b ($83,a6),d1
	btst #0,d1
	beq.b loc_054434
	lsr.b #1,d0
	addi.w #$1d,d0
	jmp Set_Spec_Cancel_Timers

loc_054434:
	lsr.b #1,d0
	addi.w #$f,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_054440:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_054446:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	move.b ($83,a6),d0
	tst.b ($3c,a6)
	beq.b loc_054498
	andi.w #4,d0
	beq.b loc_0544ae
	tst.b ($81,a6)
	bne.b loc_05448c
	cmpi.b #4,($82,a6)
	bne.b loc_0544ae
	bra.b loc_0544d0

loc_05448c:
	cmpi.b #4,($82,a6)
	beq.b loc_0544ae
	bra.w loc_0544ee

loc_054498:
	andi.w #8,d0
	beq.b loc_0544ae
	tst.b ($81,a6)
	bne.b loc_0544ae
	tst.b ($82,a6)
	beq.b loc_0544ae
	bra.w loc_054516

loc_0544ae:
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_0544b8
	moveq #$18,d0

loc_0544b8:
	tst.b ($81,a6)
	beq.b loc_0544c0
	addq.w #3,d0

loc_0544c0:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

loc_0544d0:
	move.l #$2000a00,(4,a6)
	move.b #0,($87,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$34,d0
	jmp Set_Char_Special_Ani

loc_0544ee:
	move.l #$2000a00,(4,a6)
	move.b #2,($87,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$35,d0
	jmp Set_Char_Special_Ani

loc_054516:
	move.l #$2000a00,(4,a6)
	move.b #4,($87,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	tst.b (PL_ism_choice,a6)
	bmi.b loc_054546
	addi.w #$37,d0
	jmp Set_Char_Special_Ani

loc_054546:
	addi.w #$40,d0
	jmp Set_Char_Special_Ani

;==============================================
;Body Splash
;==============================================
loc_054550:
	move.b ($87,a6),d0
	move.w loc_05455c(pc,d0.w),d1
	jmp loc_05455c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05455c:
	dc.w loc_054562-loc_05455c
	dc.w loc_054594-loc_05455c
	dc.w loc_0545ca-loc_05455c

;----------------------------------------------
loc_054562:
	jsr loc_02aa08
	bcc.w loc_05697e
	move.w ($64,a6),d0
	addi.w #$ffec,d0
	cmp.w ($14,a6),d0
	bcs.w loc_05697e
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	jmp loc_02bd64

;----------------------------------------------
loc_054594:
	jsr loc_02aa08
	bcc.w loc_05697e
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	bsr.w loc_056990
	cmpi.l #$2000604,(4,a6)
	bne.b loc_0545c8
	move.w #$2b,d0
	jmp Set_Char_Special_Ani

loc_0545c8:
	rts

;----------------------------------------------
loc_0545ca:
	jsr loc_02aa08
	bcc.b loc_0545fc
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	bsr.w loc_056990
	cmpi.l #$2000604,(4,a6)
	bne.b loc_054602
	move.w #$2c,d0
	jmp Set_Char_Special_Ani

loc_0545fc:
	jmp loc_02a7ea

loc_054602:
	rts

;##############################################
;Special Move Inputs
;##############################################
loc_054604:
	jsr SPButton_Vism_code
	bne.w loc_05469a

loc_05460e:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_720RotP_code
	bne.w loc_0546fe

loc_05461c:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_05473c

loc_05462a:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_360RotP_code
	bne.w loc_054782

loc_054638:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_360RotK_code
	bne.w loc_0547ac

loc_054646:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_05465e
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_623P_code
	bne.w loc_0547d6
	bra.w loc_05466c

loc_05465e:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_632P_code
	bne.w loc_0547d6

loc_05466c:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_05484c

loc_05467a:
	jsr SPButton_AllP_code
	bne.w loc_054800

loc_054684:
	jsr SPButton_AllK_code
	bne.w loc_054826

loc_05468e:
	jsr SPButton_Taunt_code
	bne.w loc_0548ea

loc_054698:
	rts

;----------------------------------------------
;Id Writes
loc_05469a:
	tst.b ($28a,a6)
	bne.w loc_05460e
	tst.b ($31,a6)
	bne.w loc_0546d8
	jsr loc_02ef54
	beq.w loc_05460e
	jsr loc_02ecd8
	beq.w loc_05460e
	move.l #$02001000,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_0546d8:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_05460e
	jsr loc_02ed28
	beq.w loc_05460e
	move.l #$02001000,(4,a6)
	move.b #0,(pl_move_id,a6)
	jmp loc_02f980

;----------------------------------------------
loc_0546fe:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_05461c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_05461c
	jsr loc_02ecd8
	beq.w loc_05461c
	move.l #$02001000,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_05473c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_05462a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_05462a
	jsr loc_02ecd8
	beq.w loc_05462a
	jsr loc_02ed00
	beq.w loc_05462a
	move.l #$02001000,(4,a6)
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_054782:
	jsr loc_02ed00
	beq.w loc_054638
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0547ac:
	jsr loc_02ed00
	beq.w loc_054646
	move.b #$10,(pl_move_id,a6)
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_0547d6:
	jsr loc_02ed00
	beq.w loc_05466c
	move.l #$02000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_054800:
	jsr loc_02ed00
	beq.w loc_054684
	move.l #$02000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_054826:
	jsr loc_02ed00
	beq.w loc_05468e
	move.l #$02000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_05484c:
	jsr loc_02edf8
	beq.w loc_05467a

;##############################################
;Vism AC Write
;##############################################
loc_054856:
	tst.b (PL_ism_choice,a6)
	beq.w loc_0548a4
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #1,($ce,a6)
	move.b #$24,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$20,($5f,a4)
	moveq #8,d0
	jmp Set_Char_Special_Ani

;##############################################
;Aism AC Write
;##############################################
loc_0548a4:
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #1,($ce,a6)
	move.b #$1a,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$16,($5f,a4)
	moveq #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0548ea:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0548f8
	tst.b (pl_taunt_count,a6)
	beq.w loc_054698

loc_0548f8:
	jsr loc_02ed00
	beq.w loc_054698
	move.l #$02000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;##############################################
;AI Move Check
;##############################################
loc_05491e:
	move.b (pl_move_id,a6),d0
	move.w loc_05492a(pc,d0.w),d1
	jmp loc_05492a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05492a:
	dc.w loc_05496a-loc_05492a
	dc.w loc_054942-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a

	dc.w loc_05496a-loc_05492a
	dc.w loc_05496a-loc_05492a
	dc.w loc_054956-loc_05492a
	dc.w loc_05494a-loc_05492a

;==============================================
loc_054942:
	tst.b (pl_taunt_count,a6)
	beq.b loc_05496e
	bra.b loc_05496a

;==============================================
loc_05494a:
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_05496e
	bra.w loc_05496a

;==============================================
loc_054956:
	tst.b (PL_ism_choice,a6)
	bne.w loc_05496e
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_05496e
	bra.w loc_05496a

;----------------------------------------------
loc_05496a:
	moveq #1,d0
	rts

;----------------------------------------------
loc_05496e:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_054972:
	move.b (pl_move_id,a6),d0
	move.w loc_05497e(pc,d0.w),d1
	jmp loc_05497e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05497e:
	dc.w loc_054996-loc_05497e;00 Vism Activate
	dc.w loc_054a18-loc_05497e;02 Taunt
	dc.w loc_054a5a-loc_05497e;04 Vism AC
	dc.w loc_054abe-loc_05497e;06 Aism AC
	dc.w loc_054b00-loc_05497e;08 Punch Lariat
	dc.w loc_054b4e-loc_05497e;0a Kick Lariat
	dc.w loc_054cc6-loc_05497e;0c Greenhand
	dc.w loc_054dfc-loc_05497e;0e SPD

	dc.w loc_0550ce-loc_05497e;10 Atomic Suplex
	dc.w loc_05539a-loc_05497e;12 Running Bear
	dc.w loc_0556a2-loc_05497e;14 Russian Slam
	dc.w loc_055b32-loc_05497e;16 FAB

;==============================================
;Vism Activate
;==============================================
loc_054996:
	move.b (7,a6),d0
	move.w loc_0549a2(pc,d0.w),d1
	jmp loc_0549a2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0549a2:
	dc.w loc_0549a8-loc_0549a2
	dc.w loc_0549c8-loc_0549a2
	dc.w loc_0549fc-loc_0549a2

;----------------------------------------------
loc_0549a8:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_0549c2
	moveq #$2f,d0

loc_0549c2:
	jmp loc_02a708

;----------------------------------------------
loc_0549c8:
	tst.b ($34,a6)
	beq.b loc_0549f6
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #0,d0
	moveq #$55,d1
	tst.b ($31,a6)
	beq.b loc_0549ec
	moveq #-$24,d0;dc
	moveq #$53,d1

loc_0549ec:
	jsr loc_097cd6
	bsr.w loc_05694e

loc_0549f6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0549fc:
	subq.b #1,($3a,a6)
	bne.w loc_05697e
	tst.b ($31,a6)
	beq.b loc_054a12
	move.l #$02000602,(4,a6)

loc_054a12:
	jmp loc_02f796

;==============================================
;Taunt
;==============================================
loc_054a18:
	move.b (7,a6),d0
	move.w loc_054a24(pc,d0.w),d1
	jmp loc_054a24(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054a24:
	dc.w loc_054a28-loc_054a24
	dc.w loc_054a4c-loc_054a24

;----------------------------------------------
loc_054a28:

	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_054a3c
	subq.b #1,(pl_taunt_count,a6)

loc_054a3c:
	clr.b (pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #$2d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_054a4c:
	tst.b ($33,a6)
	bmi.w loc_056984
	jmp loc_02a7ea

;==============================================
;Vism AC
;==============================================
loc_054a5a:
	move.b (7,a6),d0
	move.w loc_054a66(pc,d0.w),d1
	jmp loc_054a66(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054a66:
	dc.w loc_054a6a-loc_054a66
	dc.w loc_054a84-loc_054a66

;----------------------------------------------
loc_054a6a:
	tst.b ($35,a6)
	beq.b loc_054a7e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_080e8e

loc_054a7e:
	jmp loc_02a7ea

;----------------------------------------------
loc_054a84:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.b loc_054aae
	cmpi.b #3,($35,a6)
	bne.w loc_054aac
	clr.b ($35,a6)
	moveq #$30,d0
	tst.b (PL_Flip,a6)
	bne.b loc_054aa8
	neg.w d0

loc_054aa8:
	add.w d0,($10,a6)

loc_054aac:
	rts

loc_054aae:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Aism AC
;==============================================
loc_054abe:
	move.b (7,a6),d0
	move.w loc_054aca(pc,d0.w),d1
	jmp loc_054aca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054aca:
	dc.w loc_054ace-loc_054aca
	dc.w loc_054ae8-loc_054aca

;----------------------------------------------
loc_054ace:
	tst.b ($35,a6)
	beq.b loc_054ae2
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_080e8e

loc_054ae2:
	jmp loc_02a7ea

;----------------------------------------------
loc_054ae8:
	tst.b ($33,a6)
	bpl.w loc_05697e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Punch Lariat
;==============================================
loc_054b00:
	move.b (7,a6),d0
	move.w loc_054b0c(pc,d0.w),d1
	jmp loc_054b0c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054b0c:
	dc.w loc_054b14-loc_054b0c
	dc.w loc_054c26-loc_054b0c
	dc.w loc_054c36-loc_054b0c
	dc.w loc_054cb2-loc_054b0c

;----------------------------------------------
loc_054b14:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($290,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$fffe8000,($40,a6)
	moveq #$2f,d0
	jsr Set_Char_Special_Ani
	move.w #$68,d2
	tst.b (PL_cpucontrol,a6)
	bne.b loc_054b9c
	rts

;==============================================
;Kick Lariat
;==============================================
loc_054b4e:
	move.b (7,a6),d0
	move.w loc_054b5a(pc,d0.w),d1
	jmp loc_054b5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054b5a:
	dc.w loc_054b62-loc_054b5a
	dc.w loc_054c26-loc_054b5a
	dc.w loc_054c36-loc_054b5a
	dc.w loc_054cb2-loc_054b5a

;----------------------------------------------
loc_054b62:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($290,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff0000,($40,a6)
	moveq #$30,d0
	jsr Set_Char_Special_Ani
	move.w #$98,d2
	tst.b (PL_cpucontrol,a6)
	bne.b loc_054b9c
	rts

loc_054b9c:
	clr.b ($6f,a6)
	clr.b ($70,a6)
	clr.b ($71,a6)
	jsr RNGFunction
	andi.w #3,d0
	beq.b loc_054c18
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_054bd0
	move.b #1,($6f,a6)
	clr.b ($70,a6)
	move.b #$46,($71,a6)
	rts

loc_054bd0:
	cmp.w (pl_dist_away,a6),d2
	bcs.b loc_054be8
	move.b #1,($6f,a6)
	clr.b ($70,a6)
	move.b #$46,($71,a6)
	rts

loc_054be8:
	jsr RNGFunction
	andi.w #3,d0
	move.b loc_054c1a(pc,d0.w),($6f,a6)
	jsr RNGFunction
	andi.w #3,d0
	move.b loc_054c1e(pc,d0.w),($70,a6)
	jsr RNGFunction
	andi.w #3,d0
	move.b loc_054c22(pc,d0.w),($71,a6)

loc_054c18:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054c1a:
	dc.b $01,$01,$00,$ff

loc_054c1e:
	dc.b $00,$04,$08,$10

loc_054c22:
	dc.b $08,$0c,$10,$20

;----------------------------------------------
loc_054c26:
	tst.b ($35,a6)
	beq.w loc_05697e
	addq.b #2,(7,a6)
	clr.b ($35,a6)

;----------------------------------------------
loc_054c36:
	tst.b ($35,a6)
	bne.b loc_054caa
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_054c50
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_054c50:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_054c88
	tst.b ($6f,a6)
	beq.b loc_054ca4
	tst.b ($70,a6)
	beq.b loc_054c68
	subq.b #1,($70,a6)
	bra.b loc_054ca4

loc_054c68:
	tst.b ($71,a6)
	beq.b loc_054ca4
	subq.b #1,($71,a6)
	move.l ($40,a6),d0
	tst.b ($6f,a6)
	bpl.b loc_054c7e
	neg.l d0

loc_054c7e:
	tst.b (PL_Flip,a6)
	beq.b loc_054ca0
	neg.l d0
	bra.b loc_054ca0

loc_054c88:
	move.l ($40,a6),d0
	btst.b #1,($11b,a6)
	bne.b loc_054ca0
	neg.l d0
	btst.b #0,($11b,a6)
	bne.b loc_054ca0
	moveq #0,d0

loc_054ca0:
	add.l d0,($10,a6)

loc_054ca4:
	jmp loc_02a7ea

loc_054caa:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)

;----------------------------------------------
loc_054cb2:
	tst.b ($33,a6)
	bmi.w loc_056984
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Green Hand
;==============================================
loc_054cc6:
	move.b (7,a6),d0
	move.w loc_054cd2(pc,d0.w),d1
	jmp loc_054cd2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054cd2:
	dc.w loc_054cda-loc_054cd2
	dc.w loc_054d12-loc_054cd2
	dc.w loc_054dce-loc_054cd2
	dc.w loc_054de8-loc_054cd2

;----------------------------------------------
loc_054cda:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #0,($290,a6)
	move.b #1,($216,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$31,d0
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr Set_Char_Special_Ani
	bra.b loc_054d84

;----------------------------------------------
loc_054d12:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_054d82
	cmpi.b #3,($35,a6)
	bne.b loc_054d84
	addq.b #2,(7,a6)
	bsr.b loc_054d84
	jsr loc_01c1c8
	beq.b loc_054d82
	addq.b #1,(a4)
	move.b #$10,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)

loc_054d82:
	rts

loc_054d84:
	moveq #0,d0
	move.b ($35,a6),d0
	lsl.w #3,d0
	add.b ($82,a6),d0
	move.w loc_054da6(pc,d0.w),d0
	tst.b (PL_Flip,a6)
	bne.b loc_054d9c
	neg.w d0

loc_054d9c:
	add.w d0,($10,a6)
	clr.b ($35,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054da6:
	dc.w $000e,$0010,$0014,$0000
	dc.w $0001,$0003,$0007,$0000
	dc.w $0003,$0005,$0009,$0000
	dc.w $0016,$0018,$001c,$0000
	dc.w $0008,$0010,$0018,$0000

;----------------------------------------------
loc_054dce:
	jsr loc_02a7ea
	cmpi.b #4,($35,a6)
	bne.b loc_054de6
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	bra.b loc_054d84

loc_054de6:
	rts

;----------------------------------------------
loc_054de8:
	tst.b ($33,a6)
	bmi.w loc_056984
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Spinning Pile Driver
;==============================================
loc_054dfc:
	move.b (7,a6),d0
	move.w loc_054e08(pc,d0.w),d1
	jmp loc_054e08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054e08:
	dc.w loc_054e18-loc_054e08
	dc.w loc_054e54-loc_054e08
	dc.w loc_054eac-loc_054e08
	dc.w loc_054f56-loc_054e08
	dc.w loc_054f90-loc_054e08
	dc.w loc_054fba-loc_054e08
	dc.w loc_05507e-loc_054e08
	dc.w loc_0550a8-loc_054e08

;----------------------------------------------
loc_054e18:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #0,($290,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$28,d0
	jsr Set_Char_Special_Ani
	tst.b ($3e,a6)
	beq.b loc_054e54
	move.b #1,($216,a6)

;----------------------------------------------
loc_054e54:
	move.b #$4a,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_054e62
	move.b #$3e,d0

loc_054e62:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$4a,d0
	tst.b ($23f,a6)
	beq.b loc_054e78
	addi.b #3,d0

loc_054e78:
	jsr loc_02e3fe
	bne.b loc_054e8c
	move.b #$e,(7,a6)
	jmp loc_02a7ea

loc_054e8c:
	addq.b #2,(7,a6)
	moveq #$14,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #5,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

;----------------------------------------------
loc_054eac:
	cmpi.b #1,($35,a6)
	bne.w loc_056996
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_054f26(pc,d0.w),($40,a6)
	move.l loc_054f26+4(pc,d0.w),($44,a6)
	move.l loc_054f26+8(pc,d0.w),($48,a6)
	move.l loc_054f26+$c(pc,d0.w),($4c,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_054f04
	tst.b (PL_Flip,a6)
	bne.b loc_054f18
	jmp loc_02f9be

loc_054f04:
	tst.b (PL_Flip,a6)
	beq.b loc_054f18
	neg.l ($40,a6)
	neg.l ($48,a6)
	jmp loc_02f9be

loc_054f18:
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054f26:
	dc.l $00011000,$00098000,$00002000,$ffff8000
	dc.l $00014000,$000ac000,$00001000,$ffffa000
	dc.l $00014000,$000a8000,$00001000,$ffffc000

;----------------------------------------------
loc_054f56:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.b loc_054f78
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #1,d0
	move.l loc_054f84(pc,d0.w),($4c,a6)
	clr.l ($48,a6)

loc_054f78:
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_054f84:
	dc.l $ffff7000,$ffff4000,$ffff4000

;----------------------------------------------
loc_054f90:
	jsr loc_02aa08
	bcc.w loc_056996
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #6,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

;----------------------------------------------
loc_054fba:
	tst.b ($35,a6)
	beq.w loc_056996
	cmpi.b #$f,($35,a6)
	bne.b loc_055000
	clr.b ($35,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	jsr loc_02a7ea
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$4a,d0
	jsr loc_02e970
	jmp loc_02f9be

loc_055000:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$39,d0
	jsr loc_02e7f2
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_05504e(pc,d0.w),($40,a6)
	move.l loc_05504e+4(pc,d0.w),($44,a6)
	move.l loc_05504e+$c(pc,d0.w),($4c,a6)
	clr.l ($48,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_055048
	neg.l ($40,a6)

loc_055048:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05504e:
	dc.l $00038000,$00060000,$00000000,$ffff8000
	dc.l $00030000,$00070000,$00000000,$ffff7c00
	dc.l $00048000,$00080000,$00000000,$ffff7800

;----------------------------------------------
loc_05507e:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #7,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0550a8:
	tst.b ($33,a6)
	bpl.w loc_0550c2
	clr.b ($ce,a6)
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_056984

loc_0550c2:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Atomic Suplex
;==============================================
loc_0550ce:
	move.b (7,a6),d0
	move.w loc_0550da(pc,d0.w),d1
	jmp loc_0550da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0550da:
	dc.w loc_0550ec-loc_0550da
	dc.w loc_055122-loc_0550da
	dc.w loc_055162-loc_0550da
	dc.w loc_0551c2-loc_0550da
	dc.w loc_055226-loc_0550da
	dc.w loc_05525e-loc_0550da
	dc.w loc_0552ae-loc_0550da
	dc.w loc_055344-loc_0550da

	dc.w loc_05536e-loc_0550da

;----------------------------------------------
loc_0550ec:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$21,d0
	jsr Set_Char_Special_Ani
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	tst.b ($3e,a6)
	beq.b loc_055122
	move.b #1,($216,a6)

;----------------------------------------------
loc_055122:
	moveq #$50,d0
	tst.b ($23f,a6)
	beq.b loc_05512c
	moveq #$51,d0

loc_05512c:
	jsr loc_02e3fe
	bne.b loc_055142
	move.b #$12,(pl_move_id,a6)
	clr.b (7,a6)
	bra.w loc_05539a

loc_055142:
	addq.b #2,(7,a6)
	moveq #$14,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$a,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

;----------------------------------------------
loc_055162:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0551bc
	cmpi.b #1,($35,a6)
	bne.b loc_05519e
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$52,d0
	jsr loc_02e970
	clr.b ($35,a6)
	move.b #$3c,($123,a5)
	jsr loc_080e70
	jmp loc_02f9be

loc_05519e:
	cmpi.b #2,($35,a6)
	bne.b loc_0551bc
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$60,d0
	tst.b (PL_Flip,a6)
	beq.b loc_0551b8
	neg.w d0

loc_0551b8:
	sub.w d0,($10,a6)

loc_0551bc:
	jmp loc_02f9be

;----------------------------------------------
loc_0551c2:
	jsr loc_02a7ea
	cmpi.b #3,($35,a6)
	bne.b loc_055208
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.l d0,($48,a6)
	move.l #$24000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_0551f2
	neg.l d1

loc_0551f2:
	move.l d1,($40,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05520e(pc,d0.w),($44,a6)
	move.l loc_05520e+4(pc,d0.w),($4c,a6)

loc_055208:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05520e:
	dc.l $00090000,$ffff8000
	dc.l $000a0000,$ffff7c00
	dc.l $000b0000,$ffff7800

;----------------------------------------------
loc_055226:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.b loc_05524c
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #1,d0
	move.l loc_055252(pc,d0.w),($4c,a6)
	moveq #$b,d0
	jsr Set_Char_Special_Ani

loc_05524c:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055252:
	dc.l $ffff7000,$fffe8000,$fffe8000

;----------------------------------------------
loc_05525e:
	jsr loc_02aa08
	bcc.w loc_056996
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	moveq #$c,d0
	jsr Set_Char_Special_Ani
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$55,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_0552ae:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_05530e
	cmpi.b #1,($35,a6)
	bne.w loc_05530e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$50,d0
	jsr loc_02e7f2
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_055314(pc,d0.w),d1
	move.l loc_055314+4(pc,d0.w),($44,a6)
	move.l loc_055314+$c(pc,d0.w),($4c,a6)
	clr.l ($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_05530e
	neg.l d1
	move.l d1,($40,a6)

loc_05530e:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055314:
	dc.l $00040000,$00070000,$00000000,$ffff8000
	dc.l $00044000,$00080000,$00000000,$ffff7c00
	dc.l $00048000,$00090000,$00000000,$ffff7800

;----------------------------------------------
loc_055344:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05536e:
	tst.b ($33,a6)
	bpl.w loc_05538e
	clr.b ($ce,a6)
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	eori.b #1,(PL_Flip,a6)
	bra.w loc_056984

loc_05538e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Running Bear
;==============================================
loc_05539a:
	move.b (7,a6),d0
	move.w loc_0553a6(pc,d0.w),d1
	jmp loc_0553a6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0553a6:
	dc.w loc_0553ba-loc_0553a6
	dc.w loc_0553c0-loc_0553a6
	dc.w loc_055420-loc_0553a6
	dc.w loc_055486-loc_0553a6
	dc.w loc_055502-loc_0553a6
	dc.w loc_055538-loc_0553a6
	dc.w loc_055592-loc_0553a6
	dc.w loc_055614-loc_0553a6

	dc.w loc_05563e-loc_0553a6
	dc.w loc_055666-loc_0553a6

;----------------------------------------------
loc_0553ba:
	addq.b #2,(7,a6)
	rts

;----------------------------------------------
loc_0553c0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0553ee
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0553f0(pc,d0.w),($40,a6)
	move.l loc_0553f0+4(pc,d0.w),($48,a6)
	move.b loc_0553f0+$b(pc,d0.w),($3a,a6)

loc_0553ee:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0553f0:
	dc.l $00060000,$ffffc000,$00000018,$00000000
	dc.l $00060000,$ffffc800,$0000001b,$00000000
	dc.l $00060000,$ffffd000,$00000020,$00000000

;----------------------------------------------
loc_055420:
	bsr.w loc_05567c
	cmpi.w #2,($40,a6)
	bcc.b loc_055438
	moveq #$58,d0
	jsr loc_02e3fe
	bne.w loc_055444

loc_055438:
	subq.b #1,($3a,a6)
	beq.b loc_05546e
	jmp loc_02a7ea

loc_055444:
	move.b #$6,(7,a6)
	moveq #$c,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$b,d0
	jsr loc_0038e4
	moveq #$e,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_05546e:
	move.b #$12,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$24,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055486:
	cmpi.b #1,($35,a6)
	bne.w loc_056996
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0554d2(pc,d0.w),d1
	move.l loc_0554d2+4(pc,d0.w),($44,a6)
	move.l loc_0554d2+8(pc,d0.w),d2
	move.l loc_0554d2+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0554c4
	neg.l d1
	neg.l d2

loc_0554c4:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0554d2:
	dc.l $00038000,$00080000,$00000000,$ffff9400
	dc.l $00030000,$00088000,$00000000,$ffff9400
	dc.l $00048000,$00090000,$00000000,$ffff9000

;----------------------------------------------
loc_055502:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.b loc_055520
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #1,d0
	move.l loc_05552c(pc,d0.w),($4c,a6)

loc_055520:
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05552c:
	dc.l $fffee000,$fffe8000,$fffe8000

;----------------------------------------------
loc_055538:
	jsr loc_02aa08
	bcc.w loc_056996
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	moveq #$d,d0
	jsr loc_0038e4
	moveq #$f,d0
	jsr Set_Char_Special_Ani
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$59,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_055592:
	tst.b ($35,a6)
	beq.w loc_056996
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$58,d0
	jsr loc_02e7f2
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0555e4(pc,d0.w),d1
	move.l loc_0555e4+4(pc,d0.w),($44,a6)
	move.l loc_0555e4+$c(pc,d0.w),($4c,a6)
	clr.l ($48,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_0555de
	neg.l d1

loc_0555de:
	move.l d1,($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0555e4:
	dc.l $00038000,$00060000,$00000000,$ffff8000
	dc.l $00030000,$00070000,$00000000,$ffff7c00
	dc.l $00048000,$00080000,$00000000,$ffff7800

;----------------------------------------------
loc_055614:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$10,d0
	jsr Set_Char_Special_Ani

;----------------------------------------------
loc_05563e:
	tst.b ($33,a6)
	bpl.w loc_05565a
	clr.b ($ce,a6)
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_05565a:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_055666:
	bsr.w loc_05567c
	tst.b ($35,a6)
	beq.b loc_055676
	move.b #$10,(7,a6)

loc_055676:
	jmp loc_02a7ea

;==============================================
loc_05567c:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_055688
	neg.l d0

loc_055688:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0556a0
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0556a0:
	rts

;==============================================
;Russian Slam
;==============================================
loc_0556a2:
	move.b (7,a6),d0
	move.w loc_0556b4(pc,d0.w),d1
	jsr loc_0556b4(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0556b4:
	dc.w loc_0556d8-loc_0556b4
	dc.w loc_055738-loc_0556b4
	dc.w loc_055760-loc_0556b4
	dc.w loc_055792-loc_0556b4
	dc.w loc_05583c-loc_0556b4
	dc.w loc_05586a-loc_0556b4
	dc.w loc_055882-loc_0556b4
	dc.w loc_0558d6-loc_0556b4

	dc.w loc_055904-loc_0556b4
	dc.w loc_05591c-loc_0556b4
	dc.w loc_05594a-loc_0556b4
	dc.w loc_055974-loc_0556b4
	dc.w loc_055a04-loc_0556b4
	dc.w loc_055a2e-loc_0556b4
	dc.w loc_055a4c-loc_0556b4
	dc.w loc_055a72-loc_0556b4

	dc.w loc_055aba-loc_0556b4
	dc.w loc_055b10-loc_0556b4

;----------------------------------------------
loc_0556d8:
	addq.b #2,(7,a6)
	move.b #0,($290,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.l #$ffff8000,($48,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_055720(pc,d0.w),($40,a6)
	move.l loc_055720+4(pc,d0.w),($44,a6)
	moveq #$18,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055720:
	dc.l $00080000,$00078000
	dc.l $000c0000,$00074000
	dc.l $000e0000,$00078000

;----------------------------------------------
loc_055738:
	tst.b ($34,a6)
	beq.b loc_05575a
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05574c
	moveq #1,d0

loc_05574c:
	move.b d0,($ab,a6)
	moveq #-$24,d0
	moveq #$2b,d1
	jsr loc_082e36

loc_05575a:
	jmp loc_02a7ea

;----------------------------------------------
loc_055760:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_05578c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_055786
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_055786:
	move.b loc_05578e(pc,d0.w),(pl_invinciblity_timer,a6)

loc_05578c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05578e:
	dc.b $04,$04,$04,00

;----------------------------------------------
loc_055792:
	tst.b ($33,a6)
	bpl.w loc_05697e
	move.b #1,($31,a6)
	bsr.w loc_055806
	tst.w ($44,a6)
	bpl.b loc_0557c0
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

loc_0557c0:
	moveq #$5c,d0
	jsr loc_02e636
	beq.b loc_055804
	jsr loc_080668
	moveq #$a,d0
	jsr loc_0038e4
	move.b #$1c,d1
	moveq #$1f,d0
	cmpi.b #4,($82,a6)
	beq.b loc_0557fa
	move.b #$12,d1
	moveq #$1c,d0
	cmpi.b #2,($82,a6)
	beq.b loc_0557fa
	move.b #$c,d1
	moveq #$19,d0

loc_0557fa:
	move.b d1,(7,a6)
	jmp Set_Char_Special_Ani

loc_055804:
	rts

;==============================================
loc_055806:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_055822
	neg.l d0

loc_055822:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_05583a
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_05583a:
	rts

;----------------------------------------------
loc_05583c:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$1b,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05586a:
	tst.b ($33,a6)
	bpl.w loc_05697e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;----------------------------------------------
loc_055882:
	tst.b ($33,a6)
	bmi.w loc_05589a
	tst.w ($44,a6)
	bmi.b loc_055894
	bsr.w loc_055806

loc_055894:
	jmp loc_02a7ea

loc_05589a:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	moveq #$5d,d0
	jsr loc_02e7f2
	move.l #$10000,($40,a6)
	eori.b #1,(PL_Flip,a6)
	tst.w ($44,a6)
	bmi.b loc_0558ce
	clr.l ($44,a6)

loc_0558ce:
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0558d6:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c
	moveq #$1b,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055904:
	tst.b ($33,a6)
	bpl.w loc_05697e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;----------------------------------------------
loc_05591c:
	tst.b ($33,a6)
	bmi.w loc_055934
	tst.w ($44,a6)
	bmi.b loc_05592e
	bsr.w loc_055806

loc_05592e:
	jmp loc_02a7ea

loc_055934:
	addq.b #2,(7,a6)
	move.l #$ffff6000,($4c,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	rts

;----------------------------------------------
loc_05594a:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$1d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055974:
	tst.b ($35,a6)
	beq.w loc_05697e
	cmpi.b #$f,($35,a6)
	bne.b loc_0559b2
	clr.b ($35,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	jsr loc_02a7ea
	moveq #$5c,d0
	jsr loc_02e96c
	moveq #$5e,d0
	jmp loc_02e970

loc_0559b2:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	moveq #$5f,d0
	jsr loc_02e7f2
	move.l #$48000,d1
	move.l #$90000,($44,a6)
	move.l #$ffff7800,($4c,a6)
	move.l #0,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0559fe
	neg.l d1

loc_0559fe:
	move.l d1,($40,a6)
	rts

;----------------------------------------------
loc_055a04:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$1e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055a2e:
	tst.b ($33,a6)
	bpl.w loc_05697e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	eori.b #1,(PL_Flip,a6)
	jmp loc_02bb26

;----------------------------------------------
loc_055a4c:
	jsr loc_055806(pc)
	tst.w ($44,a6)
	bpl.w loc_05697e
	addq.b #2,(7,a6)
	move.l #$ffff8000,($4c,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_055a72:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	moveq #$20,d0
	jsr Set_Char_Special_Ani
	moveq #$5c,d0
	jsr loc_02e96c
	moveq #$60,d0
	jmp loc_02e970

;----------------------------------------------
loc_055aba:
	tst.b ($35,a6)
	beq.w loc_05697e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff7800,($4c,a6)
	move.l #$48000,d1
	tst.b (PL_Flip,a6)
	beq.b loc_055af2
	neg.l d1

loc_055af2:
	move.l d1,($40,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	moveq #$61,d0
	jsr loc_02e7f2
	rts

;----------------------------------------------
loc_055b10:
	jsr loc_02aa08
	bcc.w loc_05697e
	move.b #$10,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$1b,d0
	jmp Set_Char_Special_Ani

;==============================================
;Final Atomic Buster
;==============================================
loc_055b32:
	move.b (7,a6),d0
	move.w loc_055b44(pc,d0.w),d1
	jsr loc_055b44(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055b44:
	dc.w loc_055b5c-loc_055b44
	dc.w loc_055b7e-loc_055b44
	dc.w loc_055ba6-loc_055b44
	dc.w loc_055bcc-loc_055b44
	dc.w loc_055c18-loc_055b44
	dc.w loc_055d8e-loc_055b44
	dc.w loc_055daa-loc_055b44
	dc.w loc_055dfa-loc_055b44

	dc.w loc_055e9c-loc_055b44
	dc.w loc_055ec6-loc_055b44
	dc.w loc_055ee2-loc_055b44
	dc.w loc_055ef0-loc_055b44

;----------------------------------------------
loc_055b5c:
	addq.b #2,(7,a6)
	clr.b ($6e,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$11,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055b7e:
	tst.b ($34,a6)
	beq.b loc_055ba0
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_055b92
	moveq #1,d0

loc_055b92:
	move.b d0,($ab,a6)
	moveq #-$13,d0
	moveq #$53,d1
	jsr loc_082e36

loc_055ba0:
	jmp loc_02a7ea

;----------------------------------------------
loc_055ba6:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_055bca
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	moveq #$27,d0
	jsr Set_Char_Special_Ani
	bra.b loc_055bcc

loc_055bca:
	rts

;----------------------------------------------
loc_055bcc:
	moveq #$62,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_055bd6
	moveq #$44,d0

loc_055bd6:
	jsr loc_02e3fe
	bne.b loc_055bea
	move.b #$14,(7,a6)
	jmp loc_02a7ea

loc_055bea:
	addq.b #2,(7,a6)
	moveq #$b,d0
	tst.b ($82,a6)
	bne.b loc_055bf8
	moveq #7,d0

loc_055bf8:
	jsr loc_0038e4
	jsr loc_080668
	moveq #$12,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055c0c:
	dc.w $0063,$0000,$0064,$0066,$0065,$0067

;----------------------------------------------
loc_055c18:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_055cf6
	tst.b ($34,a6)
	beq.w loc_055c60
	cmpi.b #1,($34,a6)
	bne.w loc_055c4c
	clr.b ($34,a6)
	tst.b ($82,a6)
	bne.b loc_055c60
	moveq #8,d0
	jsr loc_0038e4
	bra.b loc_055c60

loc_055c4c:
	clr.b ($34,a6)
	cmpi.b #2,($82,a6)
	bne.b loc_055c60
	moveq #7,d0
	jsr loc_0038e4

loc_055c60:
	tst.b ($35,a6)
	beq.w loc_055cf4
	cmpi.b #1,($35,a6)
	bne.b loc_055cbe
	moveq #0,d0
	move.b ($82,a6),d0
	add.b ($6e,a6),d0
	lsl.w #1,d0
	move.w loc_055c0c(pc,d0.w),d0
	jsr loc_02e970
	clr.b ($35,a6)
	move.b #$3c,($123,a5)
	tst.b ($82,a6)
	beq.b loc_055cb8
	tst.b ($6e,a6)
	bne.b loc_055cb0
	cmpi.b #4,($82,a6)
	bne.b loc_055cb8
	moveq #7,d0
	jsr loc_0038e4
	bra.w loc_055cb8

loc_055cb0:
	moveq #8,d0
	jsr loc_0038e4

loc_055cb8:
	jmp loc_080e70

loc_055cbe:
	cmpi.b #2,($35,a6)
	bne.b loc_055cda
	clr.b ($35,a6)
	moveq #$58,d0
	tst.b (PL_Flip,a6)
	beq.b loc_055cd4
	neg.w d0

loc_055cd4:
	sub.w d0,($10,a6)
	rts

loc_055cda:
	cmpi.b #3,($35,a6)
	bne.b loc_055cf4
	clr.b ($35,a6)
	tst.b ($82,a6)
	bne.b loc_055cf4
	moveq #$13,d0
	jmp Set_Char_Special_Ani

loc_055cf4:
	rts

loc_055cf6:
	tst.b ($82,a6)
	beq.b loc_055d10
	tst.b ($6e,a6)
	bne.b loc_055d10
	move.b #1,($6e,a6)
	moveq #$13,d0
	jmp Set_Char_Special_Ani

loc_055d10:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #0,($290,a6)
	moveq #$14,d0
	jsr Set_Char_Special_Ani
	clr.b ($6e,a6)
	cmpi.b #4,($82,a6)
	bne.b loc_055d3a
	move.b #1,($6e,a6)

loc_055d3a:
	moveq #0,d0
	move.b ($6e,a6),d0
	lsl.w #4,d0
	move.l loc_055d5e(pc,d0.w),($44,a6)
	move.l loc_055d5e+4(pc,d0.w),($4c,a6)
	move.l loc_055d5e+8(pc,d0.w),($6a,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055d5e:
	dc.l $000ac000,$ffffa000,$ffff4000,$00000000
	dc.l $00098000,$ffff8000,$ffff7000,$00000000
	dc.l $000ac000,$ffffa000,$ffff4000,$00000000

;----------------------------------------------
loc_055d8e:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.b loc_055da4
	addq.b #2,(7,a6)
	move.l ($6a,a6),($4c,a6)

loc_055da4:
	jmp loc_02a7ea

;----------------------------------------------
loc_055daa:
	jsr loc_02aa08
	bcc.w loc_05697e
	cmpi.b #4,($82,a6)
	bne.b loc_055de0
	cmpi.b #2,($6e,a6)
	beq.b loc_055de0
	move.b #$16,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #$15,d0
	jmp Set_Char_Special_Ani

loc_055de0:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #$16,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055dfa:
	tst.b ($35,a6)
	beq.w loc_05697e
	cmpi.b #$f,($35,a6)
	bne.w loc_055e44
	clr.b ($35,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70
	jsr loc_02a7ea
	moveq #9,d0
	jsr loc_0038e4
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$68,d0
	jmp loc_02e970

loc_055e44:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	moveq #$62,d0
	jsr loc_02e7f2
	move.l loc_055e8c(pc),($40,a6)
	move.l loc_055e8c+4(pc),($44,a6)
	move.l loc_055e8c+$c(pc),($4c,a6)
	clr.l ($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_055e8a
	neg.l ($40,a6)

loc_055e8a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055e8c:
	dc.l $00038000,$00060000,$00000000,$ffff8000

;----------------------------------------------
loc_055e9c:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$17,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055ec6:
	tst.b ($33,a6)
	bpl.w loc_05697e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	eori.b #1,(PL_Flip,a6)
	bra.w loc_05698a

;----------------------------------------------
loc_055ee2:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02baf2

;----------------------------------------------
loc_055ef0:
	tst.b ($33,a6)
	bpl.w loc_055f1c
	move.b #$a,(7,a6)
	move.b #1,($31,a6)
	move.b #0,($290,a6)
	move.b #2,($6e,a6)
	bsr.w loc_055d3a
	moveq #$14,d0
	jmp Set_Char_Special_Ani

loc_055f1c:
	cmpi.b #$f,($35,a6)
	bne.w loc_055f46
	moveq #$6b,d0
	jsr loc_02e970
	clr.b ($35,a6)
	move.b ($82,a6),d0
	lsl.b #2,d0
	addi.b #$3c,d0
	move.b d0,($123,a5)
	jsr loc_080e70

loc_055f46:
	jmp loc_02a7ea

;##############################################
;Throw Programming
;##############################################
loc_055f4c:
	move.b ($80,a6),d0
	move.w loc_055f58(pc,d0.w),d1
	jmp loc_055f58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055f58:
	dc.w loc_055f5e-loc_055f58
	dc.w loc_05616e-loc_055f58
	dc.w loc_05644c-loc_055f58

;==============================================
;Stand Throws
;==============================================
loc_055f5e:
	tst.b ($81,a6)
	bne.w loc_05603e
	move.b (7,a6),d0
	move.w loc_055f78(pc,d0.w),d1
	jsr loc_055f78(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_055f78:
	dc.w loc_055f80-loc_055f78
	dc.w loc_055f94-loc_055f78
	dc.w loc_055fee-loc_055f78
	dc.w loc_055ffc-loc_055f78

;----------------------------------------------
loc_055f80:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055f94:
	tst.b ($33,a6)
	bpl.w loc_05697e
	moveq #$46,d0
	jsr loc_02e3fe
	bne.b loc_055fb2
	addq.b #2,(7,a6)
	moveq #$3b,d0
	jmp Set_Char_Special_Ani

loc_055fb2:
	move.b #6,(7,a6)
	clr.b (PL_Flip,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_055fd8
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_055fe0
	bra.b loc_055fe6

loc_055fd8:
	btst.b #1,($11b,a6)
	bne.b loc_055fe6

loc_055fe0:
	move.b #1,(PL_Flip,a6)

loc_055fe6:
	moveq #4,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_055fee:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02baf2

;----------------------------------------------
loc_055ffc:
	cmpi.b #2,($35,a6)
	bne.b loc_056022
	clr.b ($35,a6)
	move.b #$3c,($123,a5)
	jsr loc_080e70
	jsr loc_02a7ea
	moveq #$6c,d0
	jmp loc_02e970

loc_056022:
	cmpi.b #1,($35,a6)
	bne.b loc_056038
	move.b #4,(7,a6)
	moveq #$46,d0
	jsr loc_02e7f2

loc_056038:
	jmp loc_02a7ea

;==============================================
;Stand Kick Throw
;==============================================
loc_05603e:
	move.b (7,a6),d0
	move.w loc_056050(pc,d0.w),d1
	jsr loc_056050(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056050:
	dc.w loc_05605c-loc_056050
	dc.w loc_056070-loc_056050
	dc.w loc_0560ca-loc_056050
	dc.w loc_0560d8-loc_056050
	dc.w loc_0560fa-loc_056050
	dc.w loc_056150-loc_056050

;----------------------------------------------
loc_05605c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056070:
	tst.b ($33,a6)
	bpl.w loc_05697e
	moveq #$47,d0
	jsr loc_02e3fe
	bne.b loc_05608e
	addq.b #2,(7,a6)
	moveq #$3b,d0
	jmp Set_Char_Special_Ani

loc_05608e:
	move.b #6,(7,a6)
	clr.b (PL_Flip,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0560b4
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_0560bc
	bra.b loc_0560c2

loc_0560b4:
	btst.b #1,($11b,a6)
	bne.b loc_0560c2

loc_0560bc:
	move.b #1,(PL_Flip,a6)

loc_0560c2:
	moveq #4,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0560ca:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02baf2

;----------------------------------------------
loc_0560d8:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	move.w #$64,($ae,a6)
	clr.w ($3a,a6)
	clr.b ($1ff,a6)
	moveq #0,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0560fa:
	movea.w ($38,a6),a1
	cmpi.b #1,($35,a6)
	bne.b loc_056120
	clr.b ($35,a6)
	moveq #$6e,d0
	tst.b ($1ff,a6)
	bne.b loc_056118
	addq.b #1,($1ff,a6)
	moveq #$6d,d0

loc_056118:
	jsr loc_02e970
	bne.b loc_056142

loc_056120:
	jsr loc_02ea06
	tst.b ($1ff,a6)
	beq.w loc_05697e
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_056142
	jsr loc_02ea7a
	beq.w loc_05697e

loc_056142:
	move.b #$a,(7,a6)
	moveq #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056150:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	bne.b loc_05616c
	moveq #$47,d0
	jsr loc_02e7f2
	move.b #4,(7,a6)

loc_05616c:
	rts

;==============================================
;Crouch Throws
;==============================================
loc_05616e:
	tst.b ($81,a6)
	bne.w loc_056292
	move.b (7,a6),d0
	move.w loc_056188(pc,d0.w),d1
	jsr loc_056188(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056188:
	dc.w loc_056192-loc_056188
	dc.w loc_0561a6-loc_056188
	dc.w loc_056212-loc_056188
	dc.w loc_056220-loc_056188
	dc.w loc_056274-loc_056188

;----------------------------------------------
loc_056192:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0561a6:
	tst.b ($33,a6)
	bpl.w loc_05697e
	moveq #$48,d0
	jsr loc_02e3fe
	bne.b loc_0561c4
	addq.b #2,(7,a6)
	moveq #$3f,d0
	jmp Set_Char_Special_Ani

loc_0561c4:
	move.b #6,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	move.w #$64,($ae,a6)
	clr.b ($1ff,a6)
	clr.b (PL_Flip,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0561fc
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_056204
	bra.b loc_05620a

loc_0561fc:
	btst.b #1,($11b,a6)
	bne.b loc_05620a

loc_056204:
	move.b #1,(PL_Flip,a6)

loc_05620a:
	moveq #2,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056212:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02bb26

;----------------------------------------------
loc_056220:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_056244
	clr.b ($35,a6)
	moveq #$70,d0
	tst.b ($1ff,a6)
	bne.b loc_05623c
	addq.b #1,($1ff,a6)
	moveq #$6f,d0

loc_05623c:
	jsr loc_02e970
	bne.b loc_056266

loc_056244:
	jsr loc_02ea06
	tst.b ($1ff,a6)
	beq.w loc_05697e
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_056266
	jsr loc_02ea7a
	beq.w loc_05697e

loc_056266:
	move.b #8,(7,a6)
	moveq #3,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056274:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	bne.b loc_056290
	moveq #$48,d0
	jsr loc_02e7f2
	move.b #4,(7,a6)

loc_056290:
	rts

;==============================================
;Crouch KicK Throw
;==============================================
loc_056292:
	move.b (7,a6),d0
	move.w loc_0562a4(pc,d0.w),d1
	jsr loc_0562a4(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0562a4:
	dc.w loc_0562b4-loc_0562a4
	dc.w loc_0562c8-loc_0562a4
	dc.w loc_056322-loc_0562a4
	dc.w loc_056330-loc_0562a4
	dc.w loc_05637c-loc_0562a4
	dc.w loc_056392-loc_0562a4
	dc.w loc_0563ba-loc_0562a4
	dc.w loc_05642a-loc_0562a4

;----------------------------------------------
loc_0562b4:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0562c8:
	tst.b ($33,a6)
	bpl.w loc_05697e
	moveq #$46,d0
	jsr loc_02e3fe
	bne.b loc_0562e6
	addq.b #2,(7,a6)
	moveq #$3b,d0
	jmp Set_Char_Special_Ani

loc_0562e6:
	move.b #6,(7,a6)
	clr.b (PL_Flip,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_05630c
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_056314
	bra.b loc_05631a

loc_05630c:
	btst.b #1,($11b,a6)
	bne.b loc_05631a

loc_056314:
	move.b #1,(PL_Flip,a6)

loc_05631a:
	moveq #4,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056322:
	tst.b ($33,a6)
	bpl.w loc_05697e
	jmp loc_02baf2

;----------------------------------------------
loc_056330:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	move.l #$fffd8000,d0
	move.l #0,($48,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	move.b (PL_Flip,a6),d1
	bne.b loc_056362
	neg.l d0

loc_056362:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_056370
	btst d1,($371,a6)
	bne.b loc_056370
	clr.l d0

loc_056370:
	move.l d0,($40,a6)
	moveq #$39,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05637c:
	tst.b ($35,a6)
	beq.b loc_05638c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_05638c:
	jmp loc_02a7ea

;----------------------------------------------
loc_056392:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b (pl_attk_active,a6)
	moveq #6,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0563ba:
	cmpi.b #$f,($35,a6)
	bne.b loc_0563e0
	clr.b ($35,a6)
	move.b #$3c,($123,a5)
	jsr loc_080e70
	jsr loc_02a7ea
	moveq #$72,d0
	jmp loc_02e970

loc_0563e0:
	cmpi.b #1,($35,a6)
	bne.b loc_056424
	addq.b #2,(7,a6)
	moveq #$71,d0
	jsr loc_02e7f2
	move.l #$fffd8000,d0
	move.l #$0,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	move.b #1,($31,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_056420
	neg.l d0

loc_056420:
	move.l d0,($40,a6)

loc_056424:
	jmp loc_02a7ea

;----------------------------------------------
loc_05642a:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_02baf2

;==============================================
;Air Throws
;==============================================
loc_05644c:
	move.b (7,a6),d0
	move.w loc_05645e(pc,d0.w),d1
	jsr loc_05645e(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05645e:
	dc.w loc_05646c-loc_05645e
	dc.w loc_0564c2-loc_05645e
	dc.w loc_0564e2-loc_05645e
	dc.w loc_0564f0-loc_05645e
	dc.w loc_056526-loc_05645e
	dc.w loc_05656a-loc_05645e
	dc.w loc_05658e-loc_05645e

;----------------------------------------------
loc_05646c:
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$3a,d0
	jsr loc_02e636
	beq.b loc_0564b6
	move.b #4,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$b,d0
	jsr loc_0038e4
	moveq #$1c,d0
	jmp Set_Char_Special_Ani

loc_0564b6:
	addq.b #2,(7,a6)
	moveq #$3d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0564c2:
	jsr loc_02aa08
	bcc.w loc_05697e
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_0564e2:
	tst.b ($33,a6)
	bpl.w loc_05697e
	addq.b #2,(7,a6)
	rts

;----------------------------------------------
loc_0564f0:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$3b,d0
	jsr loc_02e970
	moveq #$d,d0
	jsr loc_0038e4
	moveq #$1d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056526:
	cmpi.b #1,($35,a6)
	bne.w loc_05697e
	addq.b #2,(7,a6)
	moveq #$3a,d0
	jsr loc_02e7f2
	move.b #1,($31,a6)
	move.l #$20000,d1
	move.l #$60000,($44,a6)
	move.l #$ffff7800,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_056560
	neg.l d1

loc_056560:
	move.l d1,($40,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05656a:
	jsr loc_02aa08
	bcc.w loc_05697e
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$1e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05658e:
	tst.b ($33,a6)
	bpl.w loc_05697e
	eori.b #1,(PL_Flip,a6)
	jmp loc_02bb26

;##############################################
;
;##############################################
loc_0565a2:
	move.b (6,a6),d0
	move.w loc_0565ae(pc,d0.w),d1
	jmp loc_0565ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0565ae:
	dc.w loc_0565b6-loc_0565ae
	dc.w loc_0565c8-loc_0565ae
	dc.w loc_0565de-loc_0565ae
	dc.w loc_056634-loc_0565ae

;----------------------------------------------
loc_0565b6:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_0565c8:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_0565d8
	tst.b ($11c,a5)
	bne.b loc_0565d8
	addq.b #2,(6,a6)

loc_0565d8:
	jmp loc_02a7ea

;----------------------------------------------
loc_0565de:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	subq.b #2,d0
	bpl.b loc_056600
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_05661e(pc,d0.w),d0
	add.w d0,d0

loc_056600:
	movea.w ($38,a6),a4
	cmpi.b #$19,($102,a4)
	bne.b loc_05660e
	moveq #0,d0

loc_05660e:
	move.b d0,($2c4,a6)
	lsr.b #1,d0
	move.b loc_05662e(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05661e:
	dc.b $00,$00,$00,$04,$01,$01,$01,$04
	dc.b $02,$02,$02,$05,$03,$03,$03,$05

loc_05662e:
	dc.b $23,$24,$25,$26,$27,$27

;----------------------------------------------
loc_056634:
	move.b ($2c4,a6),d0
	move.w loc_056640(pc,d0.w),d1
	jmp loc_056640(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056640:
	dc.w loc_05664c-loc_056640
	dc.w loc_05664c-loc_056640
	dc.w loc_05664c-loc_056640
	dc.w loc_05664c-loc_056640
	dc.w loc_056656-loc_056640
	dc.w loc_05670e-loc_056640

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05664c:
	bsr.w loc_0567c6
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_056656:
	cmpi.b #1,($34,a6)
	bne.b loc_0566d4
	clr.b ($34,a6)
	move.b #$50,($2a0,a6)
	jsr loc_01c2c8
	beq.b loc_0566d4
	move.l #$1003d00,(a4)
	move.b #$f,($31,a4)
	move.w #$ff88,($40,a4)
	move.w #$5e,($44,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0566d4
	move.l #$1003d02,(a4)
	move.b #$19,($31,a4)
	move.w #$ff80,($40,a4)
	move.w #$e0,($44,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0566d4
	move.l #$1003d04,(a4)
	move.b #$19,($31,a4)
	move.w #$ff80,($40,a4)
	move.w #$e0,($44,a4)
	move.w a6,($36,a4)

loc_0566d4:
	cmpi.b #2,($34,a6)
	bne.b loc_056704
	clr.b ($34,a6)
	jsr loc_01c2c8
	beq.b loc_056704
	move.l #$1003d0a,(a4)
	move.b #$10,($31,a4)
	move.w #$fff0,($40,a4)
	move.w #$60,($44,a4)
	move.w a6,($36,a4)

loc_056704:
	bsr.w loc_0567c6
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05670e:
	cmpi.b #1,($34,a6)
	bne.b loc_05678c
	clr.b ($34,a6)
	move.b #$50,($2a0,a6)
	jsr loc_01c2c8
	beq.b loc_05678c
	move.l #$1003d00,(a4)
	move.b #$f,($31,a4)
	move.w #$ff88,($40,a4)
	move.w #$5e,($44,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_05678c
	move.l #$01003d06,(a4)
	move.b #$19,($31,a4)
	move.w #$ff80,($40,a4)
	move.w #$e0,($44,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_05678c
	move.l #$1003d08,(a4)
	move.b #$19,($31,a4)
	move.w #$ff80,($40,a4)
	move.w #$e0,($44,a4)
	move.w a6,($36,a4)

loc_05678c:
	cmpi.b #2,($34,a6)
	bne.b loc_0567bc
	clr.b ($34,a6)
	jsr loc_01c2c8
	beq.b loc_0567bc
	move.l #$1003d0a,(a4)
	move.b #$10,($31,a4)
	move.w #$fff0,($40,a4)
	move.w #$60,($44,a4)
	move.w a6,($36,a4)

loc_0567bc:
	bsr.w loc_0567c6
	jmp loc_02a7ea

loc_0567c6:
	tst.b ($3a,a6)
	beq.b loc_0567da
	subq.b #1,($3a,a6)
	bne.b loc_0567da
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0567da:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_0567e0:
	move.b (6,a6),d0
	move.w loc_0567ec(pc,d0.w),d1
	jmp loc_0567ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0567ec:
	dc.w loc_0567f6-loc_0567ec
	dc.w loc_0568b4-loc_0567ec
	dc.w loc_0568c8-loc_0567ec
	dc.w loc_0568fc-loc_0567ec
	dc.w loc_056910-loc_0567ec

;----------------------------------------------
loc_0567f6:
	movea.w ($38,a6),a4
	cmpi.b #$1a,($102,a4)
	beq.b loc_05680e
	addq.b #2,(6,a6)
	moveq #$22,d0
	jmp loc_02a708

loc_05680e:
	move.b #4,(6,a6)
	cmpi.b #6,($6eb9,a5)
	bcs.w loc_05688a
	jsr loc_01c2c8
	move.l #$1002d00,(a4)
	move.b #$0,($3c,a4)
	jsr loc_01c2c8
	move.l #$1002d00,(a4)
	move.b #$1,($3c,a4)
	jsr loc_01c2c8
	move.l #$1002d00,(a4)
	move.b #$2,($3c,a4)
	jsr loc_01c2c8
	move.l #$1002d01,(a4)
	move.b #$3,($3c,a4)
	jsr loc_01c2c8
	move.l #$1002d01,(a4)
	move.b #$4,($3c,a4)
	jsr loc_01c2c8
	move.l #$1002d01,(a4)
	move.b #$5,($3c,a4)

loc_05688a:
	move.w #$c0,d0
	move.l #$fff90000,d1
	tst.b ($101,a6)
	bne.b loc_05689e
	neg.l d0
	neg.l d1

loc_05689e:
	move.l ($10,a6),($4c,a6)
	add.w d0,($10,a6)
	move.l d1,($40,a6)
	moveq #$21,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0568b4:
	tst.b ($33,a6)
	bpl.b loc_0568c2
	move.l #$02000000,(4,a6)

loc_0568c2:
	jmp loc_02a7ea

;----------------------------------------------
loc_0568c8:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$ffa0,d0
	cmpi.w #$c0,d0
	bhi.w loc_05697e
	addq.b #2,(6,a6)
	move.l ($4c,a6),($10,a6)
	moveq #$23,d0
	jmp loc_02a708

;----------------------------------------------
loc_0568fc:
	tst.b ($33,a6)
	bpl.w loc_05697e
	addq.b #2,(6,a6)
	moveq #$30,d0
	jmp loc_02a708

;----------------------------------------------
loc_056910:
	tst.b ($33,a6)
	bpl.w loc_05697e
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_056928:
	jsr loc_01c368
	beq.b loc_05694c
	addq.b #1,(a4)
	move.b #$10,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_05694c:
	rts

;==============================================
loc_05694e:
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

;==============================================
loc_05697e:
	jmp loc_02a7ea

;==============================================
loc_056984:
	jmp loc_02baf2

;==============================================
loc_05698a:
	jmp loc_02bb26

;==============================================
loc_056990:
	jmp loc_02bd64

;==============================================
loc_056996:
	jsr loc_02a7ea

loc_05699c:
	jmp loc_02f9be

;##############################################
;
;##############################################
loc_0569a2:
	dc.w loc_0569ea-loc_0569a2
	dc.w loc_0569ea-loc_0569a2
	dc.w loc_0569a8-loc_0569a2

loc_0569a8:
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$02,$02,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$09,$02,$02
	dc.b $02,$02

loc_0569ea:
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$02,$02,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$08,$02,$02
	dc.b $02,$02