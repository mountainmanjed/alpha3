;##############################################
;
;##############################################
loc_06f15c:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_06f168(pc,d0.w),d1
	jmp loc_06f168(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f168:
	dc.w loc_06f170-loc_06f168
	dc.w loc_06f176-loc_06f168
	dc.w loc_06f19a-loc_06f168
	dc.w loc_06f1c0-loc_06f168

;----------------------------------------------
loc_06f170:
	clr.w ($276,a6)
	rts

;----------------------------------------------
loc_06f176:
	tst.b ($101,a6)
	beq.b loc_06f170
	lea.l (p3memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06f18c
	lea.l (p4memory,a5),a4

loc_06f18c:
	cmpi.b #$1e,($102,a4)
	bne.b loc_06f170
	move.w a4,($276,a6)
	rts

;----------------------------------------------
loc_06f19a:
	cmpi.b #1,($101,a6)
	beq.b loc_06f170
	lea.l (p3memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06f1b2
	lea.l (p4memory,a5),a4

loc_06f1b2:
	cmpi.b #$1e,($102,a4)
	bne.b loc_06f170
	move.w a4,($276,a6)
	rts

;----------------------------------------------
loc_06f1c0:
	cmpi.b #2,($101,a6)
	beq.b loc_06f170
	lea.l (p1memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06f1d8
	lea.l (p2memory,a5),a4

loc_06f1d8:
	cmpi.b #$1e,($102,a4)
	bne.b loc_06f170
	move.w a4,($276,a6)
	rts

;##############################################
;Intro
;##############################################
loc_06f1e6:
	move.b (6,a6),d0
	move.w loc_06f1f2(pc,d0.w),d1
	jmp loc_06f1f2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f1f2:
	dc.w loc_06f1fa-loc_06f1f2
	dc.w loc_06f246-loc_06f1f2
	dc.w loc_06f27c-loc_06f1f2
	dc.w loc_06f2a0-loc_06f1f2

;----------------------------------------------
loc_06f1fa:
	move.b #6,(6,a6)
	moveq #$22,d0
	tst.w ($276,a6)
	beq.b loc_06f240
	move.b #2,(6,a6)
	clr.b (1,a6)
	move.b #$18,($3a,a6)
	move.w ($64,a6),d0
	addi.w #$e0,d0
	move.w d0,($14,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$fffe0000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$33,d0

loc_06f240:
	jmp loc_02a708

;----------------------------------------------
loc_06f246:
	cmpi.w #4,($c,a5)
	bne.b loc_06f27a
	addq.b #2,(6,a6)
	move.b #1,(1,a6)
	move.b #$4e,($2a0,a6)
	moveq #7,d0

loc_06f260:
	jsr loc_01c2c8
	beq.b loc_06f27a
	move.l #$01003908,(a4)
	move.w a6,($36,a4)
	move.b d0,($3c,a4)
	dbra d0,loc_06f260

loc_06f27a:
	rts

;----------------------------------------------
loc_06f27c:
	subq.b #1,($3a,a6)
	bpl.b loc_06f29e
	jsr loc_02aa08
	bcc.b loc_06f29e
	addq.b #2,(6,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_06f29e:
	rts

;----------------------------------------------
loc_06f2a0:
	tst.b ($33,a6)
	bpl.w loc_072a36
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_06f2b8:
	tst.b ($80,a6)
	bne.w loc_06f3d6
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_06f328
	move.b (7,a6),d0
	move.w loc_06f2d8(pc,d0.w),d1
	jmp loc_06f2d8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f2d8:
	dc.w loc_06f2dc-loc_06f2d8
	dc.w loc_06f322-loc_06f2d8

;----------------------------------------------
loc_06f2dc:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #1,d0
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_06f31c(pc,d1.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcs.b loc_06f312
	moveq #0,d0

loc_06f312:
	add.b ($82,a6),d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f31c:
	dc.w $0030,$0038,$0028

;----------------------------------------------
loc_06f322:
	jmp loc_02f5ac

;==============================================
;Standing Kicks
;==============================================
loc_06f328:
	move.b (7,a6),d0
	move.w loc_06f334(pc,d0.w),d1
	jmp loc_06f334(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f334:
	dc.w loc_06f33a-loc_06f334
	dc.w loc_06f3a8-loc_06f334
	dc.w loc_06f3ae-loc_06f334

;----------------------------------------------
loc_06f33a:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	cmpi.b #2,($82,a6)
	bne.b loc_06f370
	btst #1,($83,a6)
	beq.b loc_06f370
	move.b #4,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_06f370:
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_06f3a2(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_06f39c
	addq.b #1,d0

loc_06f39c:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f3a2:
	dc.w $0030,$0040,$0038

;----------------------------------------------
loc_06f3a8:
	jmp loc_02f5ac

;----------------------------------------------
loc_06f3ae:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_072a2a
	moveq #0,d0
	move.b ($34,a6),d0
	beq.b loc_06f3d4
	clr.b ($34,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06f3d0
	neg.w d0

loc_06f3d0:
	add.w d0,($10,a6)

loc_06f3d4:
	rts

;==============================================
;Crouching
;==============================================
loc_06f3d6:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_06f3e8(pc,d0.w),d1
	jmp loc_06f3e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06f3e8:
	dc.w loc_06f3ec-loc_06f3e8
	dc.w loc_06f422-loc_06f3e8

;----------------------------------------------
loc_06f3ec:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_06f418
	addq.b #3,d1

loc_06f418:
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_06f422:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_06f428:
	move.b #6,($7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_06f458
	moveq #$18,d0

loc_06f458:
	tst.b ($81,a6)
	beq.b loc_06f460
	addq.w #3,d0

loc_06f460:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Move Inputs
;##############################################
loc_06f46e:
	jsr SPButton_Vism_code
	bne.w loc_06f54a

loc_06f478:
	lea.l ($1d0,a6),a4
	jsr SpInp_LPLP6LKHP_code
	bne.w loc_06f820

loc_06f486:
	lea.l ($1e8,a6),a4
	jsr SpInp_23623P_Code
	bne.w loc_06f8de

loc_06f494:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_360RotP_code
	bne.w loc_06f792

loc_06f4a2:
	lea.l ($388,a6),a4
	jsr SpChrg_4646P_code
	bne.w loc_06f954

loc_06f4b0:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpChrg_1318K_code
	bne.w loc_06f7e4

loc_06f4be:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_1239K_Code
	bne.w loc_06f6e8

loc_06f4cc:
	lea.l (pl_inp_slot_9,a6),a4
	jsr SpInp_236K_code
	bne.w loc_06f762

loc_06f4da:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpChrg_28K_code
	bne.w loc_06f5e2

loc_06f4e8:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpChrg_46K_code
	bne.w loc_06f65c

loc_06f4f6:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_06f992

loc_06f504:
	jsr SPButton_AllK_code
	bne.w loc_06f712

loc_06f50e:
	jsr SPButton_Taunt_code
	bne.w loc_06f51c

loc_06f518:
	moveq #0,d0
	rts

;----------------------------------------------
;Move ID writes
;----------------------------------------------
loc_06f51c:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_06f528
	tst.b (pl_taunt_count,a6)
	beq.b loc_06f518

loc_06f528:
	jsr loc_02ed00
	beq.b loc_06f518
	move.l #$02000e00,(4,a6)
	move.b #$2a,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06f54a:
	tst.b ($28a,a6)
	bne.w loc_06f478
	tst.b ($31,a6)
	bne.w loc_06f588
	jsr loc_02ef54
	beq.w loc_06f478
	jsr loc_02ecd8
	beq.w loc_06f478
	move.l #$02001000,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_06f588:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_06f478
	jsr loc_02ed28
	beq.w loc_06f478
	move.l #$02001000,(4,a6)
	move.b #2,(pl_move_id,a6)
	jmp loc_02f980

;----------------------------------------------
loc_06f5ae:
	tst.w ($276,a6)
	beq.w loc_06f50e
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_06f50e
	jsr loc_02ed00
	beq.w loc_06f50e
	move.l #$02000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06f5e2:
	jsr loc_02ed00
	beq.w loc_06f4e8
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06f60c:
	tst.b ($31,a6)
	beq.w loc_06f4f6
	tst.b ($3c,a6)
	ble.w loc_06f4f6
	moveq #$40,d0
	tst.w ($44,a6)
	bpl.b loc_06f626
	moveq #$58,d0

loc_06f626:
	add.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_06f4f6
	jsr loc_02ed28
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06f65c:
	tst.b ($31,a6)
	bne.b loc_06f68c
	jsr loc_02ed00
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_06f68c:
	tst.w ($44,a6)
	bmi.w loc_06f4f6
	jsr loc_02ed28
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06f6be:
	jsr loc_02ed00
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06f6e8:
	jsr loc_02ed00
	beq.w loc_06f4cc
	move.l #$02000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06f712:
	tst.w ($276,a6)
	beq.w loc_06f50e
	jsr loc_02ed00
	beq.w loc_06f50e
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06f73e:
	jsr loc_02ed00
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06f762:
	tst.b ($31,a6)
	bne.w loc_06f60c
	jsr loc_02ed00
	beq.w loc_06f4da
	move.l #$02000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06f792:
	jsr loc_02ed00
	beq.w loc_06f4a2
	move.l #$02000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06f7ba:
	jsr loc_02ed00
	beq.w loc_06f4f6
	move.l #$02000e00,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06f7e4:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f4be
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06f4be
	jsr loc_02ecd8
	beq.w loc_06f4be
	move.l #$02001000,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06f820:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f486
	tst.w ($276,a6)
	beq.w loc_06f486
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_06f486
	jsr loc_02eee0
	beq.w loc_06f486
	move.l #$02001000,(4,a6)
	move.b #$1c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;----------------------------------------------
loc_06f866:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f4b0
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06f4b0
	jsr loc_02ecd8
	beq.w loc_06f4b0
	move.l #$02001000,(4,a6)
	move.b #$1e,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06f8a2:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f494
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06f494
	jsr loc_02ecd8
	beq.w loc_06f494
	move.l #$02001000,(4,a6)
	move.b #$20,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06f8de:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f494
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06f494
	bsr.w loc_072acc
	beq.w loc_06f494
	jsr loc_02ecd8
	beq.w loc_06f494
	move.l #$02001000,(4,a6)
	move.b #$22,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	jsr loc_02f4bc

loc_06f926:
	movea.w ($276,a6),a4
	move.l #$0200100e,(4,a4)
	move.b #$22,($aa,a4)
	move.b #1,($a9,a4)
	move.b ($2c9,a4),($b,a4)
	clr.l ($84,a4)
	st.b ($85,a4)
	move.w #$a00,d0
	bra.w loc_072a84

;----------------------------------------------
loc_06f954:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_06f4b0
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06f4b0
	jsr loc_02ecd8
	beq.w loc_06f4b0
	move.l #$02001000,(4,a6)
	move.b #$26,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_06f992:
	jsr loc_02edf8
	beq.w loc_06f504

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_06f99c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06f9e4
	move.l #$02000e06,(4,a6)
	move.b #$10,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$14,($5f,a4)
	move.b #$18,(pl_invinciblity_timer,a6)
	moveq #$28,d0
	jmp Set_Char_Special_Ani

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_06f9e4:
	move.l #$02000e0c,(4,a6)
	move.b #4,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,(pl_invinciblity_timer,a6)
	moveq #$28,d0
	jmp Set_Char_Special_Ani

;##############################################
;AI Move Checks
;##############################################
loc_06fa24:
	move.b (pl_move_id,a6),d0
	move.w loc_06fa30(pc,d0.w),d1
	jmp loc_06fa30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fa30:
	dc.w loc_06fa68-loc_06fa30
	dc.w loc_06fa68-loc_06fa30
	dc.w loc_06fa6c-loc_06fa30
	dc.w loc_06fae0-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fa6c-loc_06fa30
	dc.w loc_06fa70-loc_06fa30
	dc.w loc_06fa6c-loc_06fa30

	dc.w loc_06fa6c-loc_06fa30
	dc.w loc_06faec-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fa6c-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fa86-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30

	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fab8-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06faa2-loc_06fa30
	dc.w loc_06fb1a-loc_06fa30
	dc.w loc_06fa5c-loc_06fa30

;----------------------------------------------
loc_06fa5c:
	tst.b (pl_taunt_count,a6)
	beq.w loc_06fb1a
	bra.w loc_06fb16

;----------------------------------------------
loc_06fa68:
	bra.w loc_06fb16

;----------------------------------------------
loc_06fa6c:
	bra.w loc_06fb16

;----------------------------------------------
loc_06fa70:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06fb1a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06fb1a
	bra.w loc_06fb16

;----------------------------------------------
loc_06fa86:
	tst.w ($276,a6)
	beq.w loc_06fb1a
	tst.b (PL_ism_choice,a6)
	bne.w loc_06fb1a
	cmpi.w #$90,(PL_meter,a6)
	bcs.b loc_06fb1a
	bra.w loc_06fb16

;----------------------------------------------
loc_06faa2:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_06fb1a
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_06fb1a
	bra.w loc_06fb16

;----------------------------------------------
loc_06fab8:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06fb1a
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_06fb1a
	bsr.w loc_072acc
	beq.w loc_06fb1a
	move.l a4,($70,a6)
	bsr.w loc_06f926
	movea.l ($70,a6),a4
	bra.w loc_06fb16

;----------------------------------------------
loc_06fae0:
	tst.b ($31,a6)
	bne.w loc_06fb1a
	bra.w loc_06fb16

;----------------------------------------------
loc_06faec:
	tst.b ($31,a6)
	beq.w loc_06fb1a
	tst.b ($3c,a6)
	ble.w loc_06fb1a
	moveq #$40,d0
	tst.w ($44,a6)
	bpl.b loc_06fb06
	moveq #$58,d0

loc_06fb06:
	add.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_06fb1a
	bra.w loc_06fb16

;==============================================
loc_06fb16:
	moveq #1,d0
	rts

;==============================================
loc_06fb1a:
	moveq #0,d0
	rts

;##############################################
;Special Moves Programming
;##############################################
loc_06fb1e:
	move.b (pl_move_id,a6),d0
	move.w loc_06fb2a(pc,d0.w),d1
	jmp loc_06fb2a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fb2a:
	dc.w loc_06fb56-loc_06fb2a;00 Meter Charge
	dc.w loc_06fc38-loc_06fb2a;02 Vism Activate
	dc.w loc_06fcba-loc_06fb2a;04 Cannon Spike
	dc.w loc_06fec8-loc_06fb2a;06 Cannon Drill
	dc.w loc_07011a-loc_06fb2a;08 Spin Knuckle
	dc.w loc_07023a-loc_06fb2a;0a Hooligan Comboination
	dc.w loc_0707c6-loc_06fb2a;0c Spin Drive Smasher
	dc.w loc_070b1a-loc_06fb2a;0e Healing

	dc.w loc_070c22-loc_06fb2a;10 Mach Slide
	dc.w loc_070d38-loc_06fb2a;12 Cannon Strike
	dc.w loc_070ea6-loc_06fb2a;14 Run
	dc.w loc_070f76-loc_06fb2a;16 Earth Direct
	dc.w loc_071180-loc_06fb2a;18 Sniping Arrow
	dc.w loc_0712a0-loc_06fb2a;1a ??? Disappears
	dc.w loc_0712ca-loc_06fb2a;1c Death Cross Dancing
	dc.w loc_0716fc-loc_06fb2a;1e Reverse Shaft Breaker

	dc.w loc_0718c0-loc_06fb2a;20 Killer Bee Cannon Drill
	dc.w loc_071d5c-loc_06fb2a;22 Crash
	dc.w loc_0720aa-loc_06fb2a;24 Dramatic Mode Super 2?
	dc.w loc_07215c-loc_06fb2a;26 Psycho Streak
	dc.w loc_0707c6-loc_06fb2a;28 Spin Drive Smasher
	dc.w loc_072214-loc_06fb2a;2a Taunt

;==============================================
;Meter Charge
;==============================================
loc_06fb56:
	move.b (7,a6),d0
	move.w loc_06fb62(pc,d0.w),d1
	jmp loc_06fb62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fb62:
	dc.w loc_06fb66-loc_06fb62
	dc.w loc_06fbb8-loc_06fb62

;----------------------------------------------
loc_06fb66:
	addq.b #2,(7,a6)
	move.b #2,($40,a6)
	move.b #$48,($41,a6)
	move.b #$7f,($3a,a6)
	move.b #2,($3b,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	jsr loc_01c2c8
	beq.b loc_06fbb0
	move.l #$01003902,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_06fbb0
	move.l #$01003903,(a4)
	move.w a6,($36,a4)

loc_06fbb0:
	moveq #0,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_06fbb8:
	tst.b ($35,a6)
	bne.w loc_06fc24
	tst.b ($3e,a6)
	bne.b loc_06fbda
	subq.b #1,($3b,a6)
	bpl.b loc_06fbda
	move.b #2,($3b,a6)
	moveq #1,d0
	jsr loc_02ef6c

loc_06fbda:
	subq.b #1,($40,a6)
	bpl.b loc_06fbfe
	move.b #2,($40,a6)
	move.b ($41,a6),($2a0,a6)
	addq.b #2,($41,a6)
	cmpi.b #$4e,($41,a6)
	blt.b loc_06fbfe
	move.b #$48,($41,a6)

loc_06fbfe:
	subq.b #1,($3a,a6)
	bmi.b loc_06fc2a
	cmpi.b #$5f,($3a,a6)
	bge.b loc_06fc24
	clr.b ($ce,a6)
	tst.b (PL_cpucontrol,a6)
	bne.b loc_06fc24
	move.b ($370,a6),d0
	andi.b #$77,d0
	cmpi.b #7,d0
	bne.b loc_06fc2a

loc_06fc24:
	jmp loc_02a7ea

loc_06fc2a:
	moveq #$1c,d0
	jsr loc_0038e4
	jmp loc_02baf2

;==============================================
;Vism Activate
;==============================================
loc_06fc38:
	move.b (7,a6),d0
	move.w loc_06fc44(pc,d0.w),d1
	jmp loc_06fc44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fc44:
	dc.w loc_06fc4a-loc_06fc44
	dc.w loc_06fc6a-loc_06fc44
	dc.w loc_06fc9e-loc_06fc44

;----------------------------------------------
loc_06fc4a:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_06fc64
	moveq #$2f,d0

loc_06fc64:
	jmp loc_02a708

;----------------------------------------------
loc_06fc6a:
	tst.b ($34,a6)
	beq.b loc_06fc98
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_06fc8e
	moveq #-5,d0
	moveq #$44,d1

loc_06fc8e:
	jsr loc_097cd6
	bsr.w loc_0729be

loc_06fc98:
	jmp loc_02a7ea

;----------------------------------------------
loc_06fc9e:
	subq.b #1,($3a,a6)
	bne.w loc_072a36
	tst.b ($31,a6)
	beq.b loc_06fcb4
	move.l #$02000602,(4,a6)

loc_06fcb4:
	jmp loc_02f796

;==============================================
;Cannon Spike
;==============================================
loc_06fcba:
	move.b (7,a6),d0
	move.w loc_06fcc6(pc,d0.w),d1
	jmp loc_06fcc6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fcc6:
	dc.w loc_06fcd4-loc_06fcc6
	dc.w loc_06fd0a-loc_06fcc6
	dc.w loc_06fd5a-loc_06fcc6
	dc.w loc_06fda2-loc_06fcc6
	dc.w loc_06fe04-loc_06fcc6
	dc.w loc_06fe36-loc_06fcc6
	dc.w loc_06fe58-loc_06fcc6

;----------------------------------------------
loc_06fcd4:
	addq.b #2,(7,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #6,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_06fd0a:
	tst.b ($35,a6)
	beq.b loc_06fd3c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #7,($3b,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06fd42(pc,d0.w),($40,a6)
	move.l loc_06fd42+4(pc,d0.w),($48,a6)
	moveq #$14,d0
	jsr loc_0038e4

loc_06fd3c:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fd42:
	dc.l $00050000,$ffffd000
	dc.l $00060000,$ffffd000
	dc.l $00070000,$ffffd000

;----------------------------------------------
loc_06fd5a:
	tst.b ($5b,a6)
	bne.w loc_06fe86
	bsr.w loc_072a9e
	subq.b #1,($3b,a6)
	bne.b loc_06fd84
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06fd8a(pc,d0.w),($44,a6)
	move.l loc_06fd8a+4(pc,d0.w),($4c,a6)

loc_06fd84:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fd8a:
	dc.l $00060000,$ffffa000
	dc.l $00080000,$ffffa000
	dc.l $000a0000,$ffffa000

;----------------------------------------------
loc_06fda2:
	tst.b ($5b,a6)
	bne.w loc_06fe86
	bsr.w loc_072ab8
	bpl.b loc_06fdba
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_06fdba:
	tst.w ($44,a6)
	bpl.b loc_06fde6
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #2,d0
	move.l loc_06fdec(pc,d0.w),($40,a6)
	move.l loc_06fdec+4(pc,d0.w),($48,a6)
	moveq #$c,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jsr Set_Char_Special_Ani

loc_06fde6:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fdec:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;----------------------------------------------
loc_06fe04:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.b d0,($ce,a6)
	moveq #$c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_06fe36:
	tst.b ($33,a6)
	bpl.b loc_06fe4c
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_06fe4c:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_06fe58:
	tst.b ($33,a6)
	bpl.b loc_06fe70
	move.b #2,(7,a6)
	clr.b ($5b,a6)
	moveq #2,d0
	jmp Set_Char_Special_Ani

loc_06fe70:
	tst.b ($35,a6)
	beq.b loc_06fe80
	clr.b ($35,a6)
	jsr loc_080e8e

loc_06fe80:
	jmp loc_02a7ea

;==============================================
loc_06fe86:
	move.b #8,(7,a6)
	cmpi.b #4,(pl_move_id,a6)
	beq.b loc_06fe9a
	move.b #$10,(7,a6)

loc_06fe9a:
	move.l #$ffff4000,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;==============================================
;Cannon Drill
;==============================================
loc_06fec8:
	move.b (7,a6),d0
	move.w loc_06fed4(pc,d0.w),d1
	jmp loc_06fed4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06fed4:
	dc.w loc_06fee2-loc_06fed4
	dc.w loc_06ff2a-loc_06fed4
	dc.w loc_06ffac-loc_06fed4
	dc.w loc_07001a-loc_06fed4
	dc.w loc_070038-loc_06fed4
	dc.w loc_070056-loc_06fed4
	dc.w loc_070086-loc_06fed4

;----------------------------------------------
loc_06fee2:
	addq.b #2,(7,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,($a,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$13,d0
	jsr loc_0038e4
	moveq #$1a,d0
	tst.b ($31,a6)
	beq.b loc_06ff1e
	moveq #$62,d0
	move.b #1,($a,a6)

loc_06ff1e:
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_06ff2a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06ff74
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	move.b loc_06ff76(pc,d0.w),($3a,a6)
	lsl.w #3,d0
	move.l loc_06ff7c(pc,d0.w),($40,a6)
	move.l loc_06ff7c+4(pc,d0.w),($44,a6)
	move.l loc_06ff7c+8(pc,d0.w),($48,a6)
	move.l loc_06ff7c+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06ff74
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06ff74:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ff76:
	dc.b $0c,00,$10,00,$14,00

loc_06ff7c:
	dc.l $00068000,$00000000,$fffff000,$ffffe800
	dc.l $00078000,$00000000,$fffff000,$ffffe800
	dc.l $00088000,$00000000,$fffff000,$ffffe800

;----------------------------------------------
loc_06ffac:
	tst.b ($a,a6)
	beq.b loc_06ffc2
	tst.b ($5b,a6)
	bmi.w loc_0700e6
	subq.b #1,($3a,a6)
	bmi.w loc_0700be

loc_06ffc2:
	jsr loc_02aa08
	bcc.w loc_072a36
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_070002(pc,d0.w),($40,a6)
	move.l loc_070002+4(pc,d0.w),($48,a6)
	moveq #$10,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070002:
	dc.l $00030000,$ffffc000
	dc.l $00030000,$ffffc800
	dc.l $00030000,$ffffd000

;----------------------------------------------
loc_07001a:
	bsr.w loc_072a9e
	tst.w ($40,a6)
	bpl.b loc_070036
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b d0,($ce,a6)

loc_070036:
	rts

;----------------------------------------------
loc_070038:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_072a36
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_070056:
	bsr.w loc_072ab8
	bpl.w loc_072a36
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	move.b #6,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070086:
	bsr.w loc_072ab8
	bpl.w loc_072a36
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	move.b #6,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l #$ffffc000,($48,a6)
	moveq #$35,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_0700be:
	move.b #$c,(7,a6)
	move.l #$20000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$34,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_0700e6:
	move.b #$a,(7,a6)
	move.l #$ffff8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;==============================================
;Spin Knunkle
;==============================================
loc_07011a:
	move.b (7,a6),d0
	move.w loc_070126(pc,d0.w),d1
	jmp loc_070126(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070126:
	dc.w loc_07012e-loc_070126
	dc.w loc_070158-loc_070126
	dc.w loc_0701be-loc_070126
	dc.w loc_07021c-loc_070126

;----------------------------------------------
loc_07012e:
	addq.b #2,(7,a6)
	move.b d0,(pl_crouching,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$28,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070158:
	tst.b ($35,a6)
	bne.b loc_070188
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_07018e(pc,d0.w),($40,a6)
	move.l loc_07018e+4(pc,d0.w),($44,a6)
	move.l loc_07018e+8(pc,d0.w),($48,a6)
	move.l loc_07018e+$c(pc,d0.w),($4c,a6)

loc_070188:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07018e:
	dc.l $00040000,$00040000,$ffffee00,$ffff9000
	dc.l $00058000,$00044000,$ffffe400,$ffff8800
	dc.l $00060000,$0005c000,$ffffe000,$ffff7000

;----------------------------------------------
loc_0701be:
	tst.b ($35,a6)
	bne.b loc_0701ca
	jsr loc_02a7ea

loc_0701ca:
	bsr.w loc_072ab8
	bpl.w loc_072a3c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.w #$18,d0
	tst.b (PL_Flip,a6)
	bne.b loc_07020c
	neg.w d0

loc_07020c:
	add.w d0,($10,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_07021c:
	tst.b ($33,a6)
	bmi.w loc_072a2a
	tst.b ($35,a6)
	bpl.b loc_07022e
	clr.b ($ce,a6)

loc_07022e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Holligan Combonation
;==============================================
loc_07023a:
	move.b (7,a6),d0
	move.w loc_070246(pc,d0.w),d1
	jmp loc_070246(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070246:
	dc.w loc_070256-loc_070246
	dc.w loc_0702e0-loc_070246
	dc.w loc_070348-loc_070246
	dc.w loc_070360-loc_070246
	dc.w loc_070426-loc_070246
	dc.w loc_070562-loc_070246
	dc.w loc_0706b2-loc_070246
	dc.w loc_070744-loc_070246

;----------------------------------------------
loc_070256:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($84,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,(pl_attk_active,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	beq.b loc_07027a
	move.b #1,($216,a6)

loc_07027a:
	movea.w ($38,a6),a4
	move.b ($102,a4),d0
	add.b d0,d0
	move.w loc_0702a0(pc,d0.w),($6a,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$17,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0702a0:
	dc.w $0035,$0035,$0035,$003e
	dc.w $0033,$003e,$0040,$003b
	dc.w $003e,$003c,$0036,$0041
	dc.w $0035,$0037,$003b,$003c
	dc.w $003e,$0032,$0033,$003c
	dc.w $0035,$003e,$003c,$0035
	dc.w $0036,$0041,$0035,$0035
	dc.w $0033,$0037,$0036,$0000

;----------------------------------------------
loc_0702e0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_070316
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_070318(pc,d0.w),($40,a6)
	move.l loc_070318+4(pc,d0.w),($44,a6)
	move.l loc_070318+8(pc,d0.w),($48,a6)
	move.l loc_070318+$c(pc,d0.w),($4c,a6)

loc_070316:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070318:
	dc.l $00020000,$00070000,$00000000,$ffffa800
	dc.l $00050000,$00070000,$fffff000,$ffff9000
	dc.l $00058000,$00058000,$00000000,$ffffa800

;----------------------------------------------
loc_070348:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_07035e
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)

loc_07035e:
	rts

;----------------------------------------------
loc_070360:
	bsr.w loc_072ab8
	bpl.b loc_070394
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_070394
	move.b #$c,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

loc_070394:
	bsr.w loc_07040a
	beq.w loc_072a36
	move.b ($378,a6),d0
	andi.w #$70,d0
	beq.w loc_072a36
	move.b ($371,a6),d0
	andi.b #3,d0
	beq.b loc_0703c0
	moveq #$59,d0
	jsr loc_02e714
	beq.b loc_0703c0
	bra.w loc_0703d6

loc_0703c0:
	move.b #$e,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$1b,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_0703d6:
	movea.w ($38,a6),a4
	move.w ($14,a6),d1
	sub.w ($14,a4),d1
	move.b #8,(7,a6)
	moveq #$18,d0
	tst.b ($31,a4)
	bne.b loc_0703fc
	tst.b ($2c8,a4)
	bne.b loc_070404
	cmp.w ($6a,a6),d1
	bcc.b loc_070404

loc_0703fc:
	move.b #$a,(7,a6)
	moveq #$19,d0

loc_070404:
	jmp Set_Char_Special_Ani

;==============================================
loc_07040a:
	tst.w ($44,a6)
	bpl.b loc_070422
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcc.b loc_070422
	moveq #1,d0
	rts

loc_070422:
	moveq #0,d0
	rts

;----------------------------------------------
loc_070426:
	move.b ($84,a6),d0
	move.w loc_070432(pc,d0.w),d1
	jmp loc_070432(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070432:
	dc.w loc_07043e-loc_070432
	dc.w loc_07045e-loc_070432
	dc.w loc_07049c-loc_070432
	dc.w loc_0704d8-loc_070432
	dc.w loc_07051e-loc_070432
	dc.w loc_070554-loc_070432

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07043e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.w loc_072a44
	addq.b #2,($84,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07045e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_070486
	addq.b #2,($84,a6)
	move.l loc_07048c(pc),($40,a6)
	move.l loc_07048c+4(pc),($44,a6)
	move.l loc_07048c+8(pc),($48,a6)
	move.l loc_07048c+$c(pc),($4c,a6)

loc_070486:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07048c:
	dc.l $00010000,$00040000,$00000000,$ffff9000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07049c:
	cmpi.b #2,($35,a6)
	beq.b loc_0704aa
	jsr loc_02a7ea

loc_0704aa:
	bsr.w loc_072ab8
	bpl.b loc_0704d2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0704d2
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_0704d2:
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0704d8:
	addq.b #2,($84,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.l loc_07050e(pc),($40,a6)
	move.l loc_07050e+4(pc),($44,a6)
	move.l loc_07050e+8(pc),($48,a6)
	move.l loc_07050e+$c(pc),($4c,a6)
	moveq #$5b,d0
	jsr loc_080b70
	moveq #$59,d0
	jmp loc_02e7f2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07050e:
	dc.l $00013000,$00080000,$00000000,$ffff5000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07051e:
	tst.b ($35,a6)
	bne.b loc_070530
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_070530:
	bsr.w loc_072ab8
	bpl.w loc_072a3c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3c
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea
 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_070554:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02bb26

;----------------------------------------------
loc_070562:
	move.b ($84,a6),d0
	move.w loc_07056e(pc,d0.w),d1
	jmp loc_07056e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07056e:
	dc.w loc_070578-loc_07056e
	dc.w loc_0705d0-loc_07056e
	dc.w loc_07061a-loc_07056e
	dc.w loc_07063e-loc_07056e
	dc.w loc_070686-loc_07056e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_070578:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_0705b4
	addq.b #2,($84,a6)
	move.b #1,($31,a6)
	move.l loc_0705c0(pc),($40,a6)
	move.l loc_0705c0+4(pc),($44,a6)
	move.l loc_0705c0+8(pc),($48,a6)
	move.l loc_0705c0+$c(pc),($4c,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jmp loc_02f9be

loc_0705b4:
	jsr loc_02a7ea
	jmp loc_02fa36

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0705c0:
	dc.l $00040000,$00048000,$fffff800,$ffffc800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0705d0:
	tst.w ($44,a6)
	bpl.b loc_070604
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_070604
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

loc_070604:
	bsr.w loc_072ab8
	tst.b ($35,a6)
	bne.b loc_070614
	jsr loc_02a7ea

loc_070614:
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07061a:
	addq.b #2,($84,a6)
	move.b #$16,($123,a5)
	move.b #$10,($3b,a6)
	move.b #1,($2ca,a6)
	moveq #$5b,d0
	jsr loc_02e970
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07063e:
	subq.b #1,($3b,a6)
	bne.w loc_072a3e
	addq.b #2,($84,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$5a,d0
	jsr loc_02e7f2
	move.l loc_070676(pc),($40,a6)
	move.l loc_070676+4(pc),($44,a6)
	move.l loc_070676+8(pc),($48,a6)
	move.l loc_070676+$c(pc),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070676:
	dc.l $fffe0000,$00050000,$00000000,$ffffc400

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_070686:
	tst.b ($35,a6)
	beq.b loc_070698
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_070698:
	bsr.w loc_072ab8
	bpl.w loc_072a36
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	jmp loc_02bb26

;----------------------------------------------
loc_0706b2:
	move.b ($84,a6),d0
	move.w loc_0706be(pc,d0.w),d1
	jmp loc_0706be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0706be:
	dc.w loc_0706c4-loc_0706be
	dc.w loc_0706fe-loc_0706be
	dc.w loc_070722-loc_0706be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0706c4:
	addq.b #2,($84,a6)
	move.b #1,(pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_0706f2(pc,d0.w),($48,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #3,d0
	jmp loc_02ef6c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0706f2:
	dc.l $ffffc800,$ffffb800,$ffffa800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0706fe:
	bsr.w loc_0707a0
	bne.b loc_070714
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_070714:
	tst.b ($35,a6)
	bne.w loc_072a3c
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_070722:
	tst.b ($33,a6)
	bpl.b loc_070738
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_070738:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_070744:
	move.b ($84,a6),d0
	move.w loc_070750(pc,d0.w),d1
	jmp loc_070750(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070750:
	dc.w loc_070754-loc_070750
	dc.w loc_07077e-loc_070750

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_070754:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$1c,d0
	jmp Set_Char_Special_Ani

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07077e:
	tst.b ($33,a6)
	bpl.b loc_070794
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

loc_070794:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_0707a0:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_0707ac
	neg.l d0

loc_0707ac:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0707c4
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0707c4:
	rts

;==============================================
;Spin Drive Smasher
;==============================================
loc_0707c6:
	move.b (7,a6),d0
	move.w loc_0707d2(pc,d0.w),d1
	jmp loc_0707d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0707d2:
	dc.w loc_0707e6-loc_0707d2
	dc.w loc_070814-loc_0707d2
	dc.w loc_070842-loc_0707d2
	dc.w loc_0708d0-loc_0707d2
	dc.w loc_070948-loc_0707d2
	dc.w loc_070976-loc_0707d2
	dc.w loc_0709e6-loc_0707d2
	dc.w loc_070a5c-loc_0707d2

	dc.w loc_070ace-loc_0707d2
	dc.w loc_070b0c-loc_0707d2

;----------------------------------------------
loc_0707e6:
	addq.b #2,(7,a6)
	move.b d0,(pl_crouching,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$42,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070814:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_07083c
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_07082e
	moveq #1,d0

loc_07082e:
	move.b d0,($ab,a6)
	moveq #-6,d0
	moveq #$16,d1
	jsr loc_082e36

loc_07083c:
	jmp loc_02a7ea

;----------------------------------------------
loc_070842:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_07089a
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_07086e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_07086e:
	move.b loc_07089c(pc,d0.w),(pl_invinciblity_timer,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0708a0(pc,d0.w),($40,a6)
	move.l loc_0708a0+4(pc,d0.w),($48,a6)
	move.l loc_0708a0+8(pc,d0.w),($44,a6)
	move.l loc_0708a0+$c(pc,d0.w),($4c,a6)

loc_07089a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07089c:
	dc.b $04,$0a,$21,00

loc_0708a0:
	dc.l $00048000,$ffffe000,$00020000,$ffffd000
	dc.l $00058000,$ffffe000,$00020000,$ffffd000
	dc.l $00068000,$ffffe000,$00020000,$ffffd000

;----------------------------------------------
loc_0708d0:
	bsr.w loc_072ab8
	bpl.w loc_072a36
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_070918(pc,d0.w),($40,a6)
	move.l loc_070918+4(pc,d0.w),($48,a6)
	move.l loc_070918+8(pc,d0.w),($44,a6)
	move.l loc_070918+$c(pc,d0.w),($4c,a6)
	moveq #$24,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070918:
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000

;----------------------------------------------
loc_070948:
	bsr.w loc_072ab8
	tst.b ($31,a6)
	beq.b loc_07095c
	tst.b ($35,a6)
	beq.b loc_07095c
	clr.b ($31,a6)

loc_07095c:
	tst.w ($40,a6)
	bpl.w loc_072a36
	addq.b #2,(7,a6)
	moveq #$4a,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070976:
	tst.b ($35,a6)
	bne.b loc_0709b0
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #5,($3b,a6)
	clr.b ($5b,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0709b6(pc,d0.w),($40,a6)
	move.l loc_0709b6+4(pc,d0.w),($48,a6)
	move.l loc_0709b6+8(pc,d0.w),($44,a6)
	move.l loc_0709b6+$c(pc,d0.w),($4c,a6)

loc_0709b0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0709b6:
	dc.l $00050000,$00000000,$00000000,$00000000
	dc.l $00068000,$00000000,$00000000,$00000000
	dc.l $00080000,$00000000,$00000000,$00000000

;----------------------------------------------
loc_0709e6:
	bsr.w loc_072ab8
	tst.b ($35,a6)
	beq.b loc_0709f8
	tst.b ($5b,a6)
	bne.w loc_06fe86

loc_0709f8:
	clr.b ($5b,a6)
	subq.b #1,($3b,a6)
	bne.b loc_070a26
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_070a2c(pc,d0.w),($40,a6)
	move.l loc_070a2c+4(pc,d0.w),($48,a6)
	move.l loc_070a2c+8(pc,d0.w),($44,a6)
	move.l loc_070a2c+$c(pc,d0.w),($4c,a6)

loc_070a26:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070a2c:
	dc.l $00050000,$ffffd000,$00080000,$ffffa000
	dc.l $0005c000,$ffffd000,$00080000,$ffffa000
	dc.l $00068000,$ffffd000,$00080000,$ffffa000

;----------------------------------------------
loc_070a5c:
	tst.b ($35,a6)
	beq.b loc_070a6a
	tst.b ($5b,a6)
	bne.w loc_06fe86

loc_070a6a:
	moveq #0,d0
	move.b d0,($5b,a6)
	tst.w ($40,a6)
	bpl.b loc_070a7e
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_070a7e:
	tst.w ($44,a6)
	bpl.b loc_070aac
	addq.b #2,(7,a6)
	move.b d0,($35,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_070ab6(pc,d0.w),($40,a6)
	move.l loc_070ab6+4(pc,d0.w),($48,a6)
	moveq #$c,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jsr Set_Char_Special_Ani

loc_070aac:
	bsr.w loc_072ab8
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070ab6:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;----------------------------------------------
loc_070ace:
	tst.b ($35,a6)
	bne.b loc_070ada
	jsr loc_02a7ea

loc_070ada:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.w #$94,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070b0c:
	tst.b ($33,a6)
	bmi.w loc_072a2a
	jmp loc_02a7ea

;==============================================
;Healing
;==============================================
loc_070b1a:
	move.b (7,a6),d0
	move.w loc_070b26(pc,d0.w),d1
	jmp loc_070b26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070b26:
	dc.w loc_070b2e-loc_070b26
	dc.w loc_070b86-loc_070b26
	dc.w loc_070be8-loc_070b26
	dc.w loc_070bf6-loc_070b26

;----------------------------------------------
loc_070b2e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,(pl_crouching,a6)
	move.l d0,($84,a6)
	move.b #$46,($2a0,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #$50,($3a,a6)
	move.b #$5,($3b,a6)
	clr.b ($40,a6)
	move.b #1,($41,a6)
	jsr loc_01c2c8
	beq.b loc_070b7e
	move.l #$01003905,(a4)
	move.w a6,($36,a4)

loc_070b7e:
	moveq #$51,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070b86:
	tst.b ($35,a6)
	bne.b loc_070bce
	move.b ($34,a6),($2a0,a6)
	subq.b #1,($41,a6)
	bpl.b loc_070ba6
	move.b #1,($41,a6)
	moveq #1,d0
	jsr loc_02f0ae

loc_070ba6:
	subq.b #1,($3b,a6)
	bpl.b loc_070bce
	move.b #5,($3b,a6)
	jsr loc_01c2c8
	beq.b loc_070bce
	move.l #$01003904,(a4)
	move.b ($40,a6),($3c,a4)
	move.w a6,($36,a4)
	addq.b #2,($40,a6)

loc_070bce:
	subq.b #1,($3a,a6)
	bpl.w loc_072a36
	addq.b #2,(7,a6)
	move.b #0,($2a0,a6)
	moveq #$52,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070be8:
	tst.b ($33,a6)
	bmi.w loc_072a2a
	jmp loc_02a7ea

;----------------------------------------------
loc_070bf6:
	st.b ($85,a6)
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02000e00,d0
	bne.b loc_070c12
	rts

loc_070c12:
	moveq #0,d0
	move.b d0,(pl_invinciblity_timer,a6)
	move.b d0,($263,a6)
	jmp loc_02baf2

;==============================================
;Mach Slide
;==============================================
loc_070c22:
	move.b (7,a6),d0
	move.w loc_070c2e(pc,d0.w),d1
	jmp loc_070c2e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070c2e:
	dc.w loc_070c36-loc_070c2e
	dc.w loc_070ca8-loc_070c2e
	dc.w loc_070cf0-loc_070c2e
	dc.w loc_070d08-loc_070c2e

;----------------------------------------------
loc_070c36:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	moveq #$13,d0
	jsr loc_0038e4
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674

loc_070c5a:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_070c8a(pc,d0.w),($3a,a6)
	lsl.w #2,d0
	move.l loc_070c90(pc,d0.w),($40,a6)
	move.l loc_070c90+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_070c82
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_070c82:
	moveq #$58,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070c8a:
	dc.w $000c,$0017,$0027

loc_070c90:
	dc.l $00070000,$fffff400
	dc.l $00070000,$fffff400
	dc.l $00070000,$fffff400

;----------------------------------------------
loc_070ca8:
	tst.b ($35,a6)
	bne.b loc_070cb2
	bsr.w loc_070f64

loc_070cb2:
	move.b ($ac,a6),d0
	subq.b #1,d0
	cmp.b (PL_Flip,a6),d0
	beq.b loc_070cc6
	subq.w #1,($3a,a6)
	bpl.w loc_072a36

loc_070cc6:
	addq.b #2,(7,a6)
	move.l #$30000,($40,a6)
	move.l #$3000,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_070ce8
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_070ce8:
	moveq #$59,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070cf0:
	tst.b ($35,a6)
	beq.b loc_070cfa
	bsr.w loc_070f64

loc_070cfa:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2

;----------------------------------------------
loc_070d08:
	tst.b ($33,a6)
	bpl.b loc_070d22
	move.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	bra.w loc_070c5a

loc_070d22:
	tst.b ($35,a6)
	beq.b loc_070d32
	clr.b ($35,a6)
	jsr loc_080e8e

loc_070d32:
	jmp loc_02a7ea

;==============================================
;Cannon Strike
;==============================================
loc_070d38:
	move.b (7,a6),d0
	move.w loc_070d44(pc,d0.w),d1
	jmp loc_070d44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070d44:
	dc.w loc_070d4e-loc_070d44
	dc.w loc_070dce-loc_070d44
	dc.w loc_070dee-loc_070d44
	dc.w loc_070e22-loc_070d44
	dc.w loc_070e52-loc_070d44

;----------------------------------------------
loc_070d4e:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_070d9e(pc,d0.w),($40,a6)
	move.l loc_070d9e+4(pc,d0.w),($48,a6)
	move.l loc_070d9e+8(pc,d0.w),($44,a6)
	move.l loc_070d9e+$c(pc,d0.w),($4c,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$52,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070d9e:
	dc.l $00040000,$fffff000,$fffc0000,$ffff8000
	dc.l $00060000,$ffffe800,$fffc0000,$ffff8000
	dc.l $00080000,$ffffe000,$fffc0000,$ffff8000

;----------------------------------------------
loc_070dce:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_070dec
	addq.b #2,(7,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_070dec
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_070dec:
	rts

;----------------------------------------------
loc_070dee:
	tst.b ($5b,a6)
	bmi.w loc_070e60
	jsr loc_02aa08
	bcc.w loc_072a36
	move.b #8,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070e22:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	move.b #8,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070e52:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02bb26

;==============================================
loc_070e60:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_070e72
	move.w d0,($14,a6)
	clr.w ($16,a6)

loc_070e72:
	move.b #6,(7,a6)
	move.l #$ffff8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;==============================================
;Run
;==============================================
loc_070ea6:
	move.b (7,a6),d0
	move.w loc_070eb2(pc,d0.w),d1
	jmp loc_070eb2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070eb2:
	dc.w loc_070eb8-loc_070eb2
	dc.w loc_070ef8-loc_070eb2
	dc.w loc_070f4c-loc_070eb2

;----------------------------------------------
loc_070eb8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	move.b #5,($3a,a6)
	move.b #$27,($3b,a6)
	move.l #$70000,($40,a6)
	move.l #$fffff400,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_070ef0
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_070ef0:
	moveq #$4e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070ef8:
	bsr.w loc_070f64
	tst.b ($ac,a6)
	bne.b loc_070f22
	subq.b #1,($3b,a6)
	bmi.b loc_070f22
	subq.b #1,($3a,a6)
	bpl.w loc_072a36
	tst.b (PL_cpucontrol,a6)
	bne.w loc_072a36
	btst #0,($83,a6)
	beq.w loc_072a36

loc_070f22:
	addq.b #2,(7,a6)
	move.l #$30000,($40,a6)
	move.l #$3000,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_070f44
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_070f44:
	moveq #$4f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070f4c:
	tst.b ($35,a6)
	beq.b loc_070f56
	bsr.w loc_070f64

loc_070f56:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2


;==============================================
loc_070f64:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
;Earth Direct
;==============================================
loc_070f76:
	move.b (7,a6),d0
	move.w loc_070f82(pc,d0.w),d1
	jmp loc_070f82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_070f82:
	dc.w loc_070f90-loc_070f82
	dc.w loc_070fb4-loc_070f82
	dc.w loc_071070-loc_070f82
	dc.w loc_07107e-loc_070f82
	dc.w loc_0710de-loc_070f82
	dc.w loc_071144-loc_070f82
	dc.w loc_071172-loc_070f82

;----------------------------------------------
loc_070f90:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$2d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_070fb4:
	tst.b ($35,a6)
	beq.w loc_072a36
	move.w #$bb,d0
	add.b ($82,a6),d0
	jsr loc_02e3fe
	beq.w loc_071066
	move.b #6,(7,a6)
	move.b #1,($31,a6)
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_071036(pc,d0.w),($40,a6)
	move.l loc_071036+4(pc,d0.w),($48,a6)
	move.l loc_071036+8(pc,d0.w),($44,a6)
	move.l loc_071036+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071028
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071028:
	moveq #$55,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071036:
	dc.l $fffe0000,$00000000,$00080000,$ffffb000
	dc.l $fffdc000,$00000000,$000b0000,$ffff9800
	dc.l $fffd8000,$00000000,$000e0000,$ffff8000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_071066:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_071070:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2

;----------------------------------------------
loc_07107e:
	tst.b ($35,a6)
	bne.b loc_0710d2
	jsr loc_02aa08
	bcc.b loc_0710d2
	addq.b #2,(7,a6)
	move.b #$18,($3a,a6)
	move.b #$30,($123,a5)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w #$bc,d0
	add.b ($82,a6),d0
	jsr loc_02e970
	moveq #$56,d0
	jsr Set_Char_Special_Ani
	jsr loc_02faae
	moveq #$2e,d0
	moveq #4,d1
	jmp loc_02a838

loc_0710d2:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0710de:
	subq.b #1,($3a,a6)
	bpl.b loc_071138
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #1,($de,a6)
	move.w #$bb,d0
	add.b ($82,a6),d0
	jsr loc_02e7f2
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071130
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071130:
	moveq #$14,d0
	jmp loc_02a708

loc_071138:
	jsr loc_02a7ea
	jmp loc_02a8c6

;----------------------------------------------
loc_071144:
	jsr loc_02aa08
	bcc.w loc_072a36
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	move.b d0,($de,a6)
	moveq #$57,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071172:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2

;==============================================
;Sniping Arrow
;==============================================
loc_071180:
	move.b (7,a6),d0
	move.w loc_07118c(pc,d0.w),d1
	jmp loc_07118c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07118c:
	dc.w loc_071194-loc_07118c
	dc.w loc_07121e-loc_07118c
	dc.w loc_07124c-loc_07118c
	dc.w loc_07127e-loc_07118c

;----------------------------------------------
loc_071194:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0711ee(pc,d0.w),($40,a6)
	move.l loc_0711ee+4(pc,d0.w),($48,a6)
	move.l loc_0711ee+8(pc,d0.w),($44,a6)
	move.l loc_0711ee+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0711de
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0711de:
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$5a,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0711ee:
	dc.l $00050000,$00001000,$00040000,$ffffa000
	dc.l $00060000,$00001000,$00040000,$ffffa000
	dc.l $00070000,$00001000,$00040000,$ffffa000

;----------------------------------------------
loc_07121e:
	jsr loc_02a7ea
	move.b ($34,a6),d0
	beq.b loc_07123a
	tst.b (PL_Flip,a6)
	bne.b loc_071232
	neg.w d0

loc_071232:
	add.w d0,($10,a6)
	clr.b ($34,a6)

loc_07123a:
	tst.b ($35,a6)
	bne.b loc_07124a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_07124a:
	rts

;----------------------------------------------
loc_07124c:
	jsr loc_02aa08
	bcc.w loc_072a36
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$5d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_07127e:
	tst.b ($33,a6)
	bpl.b loc_071294
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_071294:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;??? Disappear
;==============================================
loc_0712a0:
	move.b (7,a6),d0
	move.w loc_0712ac(pc,d0.w),d1
	jmp loc_0712ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0712ac:
	dc.w loc_0712b0-loc_0712ac
	dc.w loc_0712c4-loc_0712ac

;----------------------------------------------
loc_0712b0:
	tst.b ($33,a6)
	bpl.w loc_072a36
	addq.b #2,(7,a6)
	moveq #$50,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0712c4:
	jmp loc_02a7ea

;==============================================
;Death Cross Dancing
;==============================================
loc_0712ca:
	move.b (7,a6),d0
	move.w loc_0712d6(pc,d0.w),d1
	jmp loc_0712d6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0712d6:
	dc.w loc_0712e8-loc_0712d6
	dc.w loc_07131a-loc_0712d6
	dc.w loc_07134e-loc_0712d6
	dc.w loc_0713ac-loc_0712d6
	dc.w loc_07142c-loc_0712d6
	dc.w loc_071446-loc_0712d6
	dc.w loc_0714ac-loc_0712d6
	dc.w loc_071510-loc_0712d6

	dc.w loc_071522-loc_0712d6

;----------------------------------------------
loc_0712e8:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,(pl_crouching,a6)
	move.b d0,($3c,a6)
	move.b d0,($5b,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$61,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_07131a:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_071348
	addq.b #2,(7,a6)
	move.b #$31,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_07133a
	moveq #1,d0

loc_07133a:
	move.b d0,($ab,a6)
	moveq #$b,d0
	moveq #$58,d1
	jsr loc_082e36

loc_071348:
	jmp loc_02a7ea

;----------------------------------------------
loc_07134e:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	subq.b #1,($3a,a6)
	bpl.b loc_0713a6
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_07137a
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_07137a:
	move.b loc_0713a8(pc,d0.w),(pl_invinciblity_timer,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff8000,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_07139e
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_07139e:
	moveq #$62,d0
	jmp Set_Char_Special_Ani

loc_0713a6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0713a8:
	dc.b $12,$12,$12,00

;----------------------------------------------
loc_0713ac:
	tst.b ($35,a6)
	beq.b loc_0713b6
	bsr.w loc_070f64

loc_0713b6:
	tst.b ($33,a6)
	bmi.w loc_072a2a
	cmpi.b #1,($5b,a6)
	bne.w loc_072a36
	bsr.w loc_072acc
	beq.w loc_071422
	move.w #$9f,d0
	jsr loc_02e3e0
	beq.w loc_071422
	addq.b #2,(7,a6)
	clr.l ($84,a6)
	movea.w ($276,a6),a4
	move.l #$02001010,(4,a4)
	move.b #$1c,($aa,a4)
	move.b #4,($248,a4)
	move.b #4,($82,a4)
	clr.l ($84,a4)
	move.w #$a00,d0
	bsr.w loc_072a84
	moveq #$63,d0
	jsr Set_Char_Special_Ani
	jsr loc_02f9be
	bra.w loc_071558

loc_071422:
	clr.b ($5b,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_07142c:
	tst.b ($3c,a6)
	beq.w loc_071558
	addq.b #2,(7,a6)
	clr.b ($3c,a6)
	move.w #$9f,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_071446:
	tst.b ($33,a6)
	bpl.b loc_0714a2
	bset.b #0,($3c,a6)
	cmpi.b #3,($3c,a6)
	bne.b loc_0714a2
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	st.b ($3c,a6)
	move.l #$70000,($40,a6)
	move.l #$1000,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071496
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071496:
	moveq #$64,d0
	jsr Set_Char_Special_Ani
	bra.w loc_071558

loc_0714a2:
	jsr loc_02a7ea
	bra.w loc_071558

;----------------------------------------------
loc_0714ac:
	jsr loc_02a7ea
	bsr.w loc_071558
	tst.b ($34,a6)
	beq.b loc_0714e0
	jsr loc_02aa08
	bcc.b loc_0714e0
	addq.b #2,(7,a6)
	move.b #$f,($3a,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	moveq #$5d,d0
	jmp Set_Char_Special_Ani

loc_0714e0:
	tst.b ($35,a6)
	beq.b loc_07150e
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_07150e
	move.l #$01003906,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_07150e
	move.l #$01003907,(a4)
	move.w a6,($36,a4)

loc_07150e:
	rts

;----------------------------------------------
loc_071510:
	tst.b ($33,a6)
	bpl.b loc_0714a2
	subq.b #1,($3a,a6)
	bpl.b loc_0714a2
	jmp loc_02bb26

;----------------------------------------------
loc_071522:
	st.b ($85,a6)
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_07153e
	rts

loc_07153e:
	moveq #0,d0
	move.b d0,(pl_invinciblity_timer,a6)
	move.b d0,($263,a6)
	move.b d0,($31,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_02bb26

;==============================================
loc_071558:
	movea.w ($276,a6),a4
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_07156a(pc,d0.w),d1
	jmp loc_07156a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07156a:
	dc.w loc_071576-loc_07156a
	dc.w loc_07159a-loc_07156a
	dc.w loc_071610-loc_07156a
	dc.w loc_071630-loc_07156a
	dc.w loc_07168c-loc_07156a
	dc.w loc_0716b8-loc_07156a

;----------------------------------------------
loc_071576:
	addq.b #2,($84,a6)
	move.b #1,($ce,a4)
	clr.b ($2c8,a4)
	move.b #$7f,($25d,a4)
	move.b #1,($263,a4)
	moveq #$58,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_07159a:
	tst.b ($33,a4)
	bpl.w loc_072b18
	addq.b #2,($84,a6)
	move.b #$1a,($25d,a4)
	clr.b ($263,a4)
	move.w ($64,a4),($14,a4)
	move.b (PL_Flip,a6),d0
	eori.b #1,d0
	move.b d0,($b,a4)
	movea.w ($38,a6),a1
	move.w ($10,a1),d0
	sub.w ($10,a6),d0
	add.w ($10,a1),d0
	move.w d0,($10,a4)
	jsr loc_01bd5c
	move.w ($a6,a6),d2
	move.w ($10,a4),d0
	sub.w d2,d0
	sub.w ($10,a3),d0
	bhi.b loc_0715f2
	sub.w d0,($10,a6)
	bra.b loc_071600

loc_0715f2:
	add.w d2,d2
	add.w d2,d0
	subi.w #$180,d0
	bmi.b loc_071600
	sub.w d0,($10,a6)

loc_071600:
	moveq #$59,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_02f9be

;----------------------------------------------
loc_071610:
	tst.b ($33,a4)
	bpl.w loc_072b18
	addq.b #2,($84,a6)
	st.b ($3c,a6)
	moveq #$63,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_080744

;----------------------------------------------
loc_071630:
	tst.b ($33,a4)
	bpl.w loc_072b18
	bset.b #1,($3c,a6)
	tst.b ($3c,a6)
	bpl.w loc_072b18
	addq.b #2,($84,a6)
	movea.w ($276,a6),a4
	move.b #1,($31,a4)
	move.l #$70000,($40,a4)
	move.l #$1000,($48,a4)
	move.l #$40000,($44,a4)
	move.l #$ffffa000,($4c,a4)
	tst.b ($b,a4)
	bne.b loc_071682
	neg.l ($40,a4)
	neg.l ($48,a4)

loc_071682:
	moveq #$64,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_07168c:
	jsr loc_02a8ca
	tst.b ($34,a4)
	beq.b loc_0716b6
	bsr.w loc_0716be
	bcc.b loc_0716b6
	addq.b #2,($84,a6)
	clr.b ($31,a4)
	move.w ($64,a4),($14,a4)
	moveq #$5d,d0
	moveq #2,d1
	jmp loc_02a83c

loc_0716b6:
	rts

;----------------------------------------------
loc_0716b8:
	jmp loc_02a8ca

;==============================================
loc_0716be:
	move.l ($40,a4),d0
	add.l d0,($10,a4)
	move.l ($48,a4),d0
	add.l d0,($40,a4)
	move.l ($44,a4),d0
	add.l d0,($14,a4)
	move.l ($4c,a4),d0
	add.l d0,($44,a4)
	moveq #0,d0
	movea.l ($1c,a4),a0
	move.b ($b,a0),d0
	add.w ($14,a4),d0
	addi.w #$100,d0
	move.w ($64,a4),d1
	addi.w #$100,d1
	cmp.w d1,d0
	rts

;==============================================
;Reverse Shaft Breaker
;==============================================
loc_0716fc:
	move.b (7,a6),d0
	move.w loc_071708(pc,d0.w),d1
	jmp loc_071708(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071708:
	dc.w loc_071718-loc_071708
	dc.w loc_071746-loc_071708
	dc.w loc_071770-loc_071708
	dc.w loc_0717a2-loc_071708
	dc.w loc_0717e6-loc_071708
	dc.w loc_07183a-loc_071708
	dc.w loc_071868-loc_071708
	dc.w loc_0718a8-loc_071708

;----------------------------------------------
loc_071718:
	addq.b #2,(7,a6)
	move.b #1,(pl_crouching,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$36,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071746:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_07176e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_071760
	moveq #1,d0

loc_071760:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_07176e:
	rts

;----------------------------------------------
loc_071770:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_07179c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_071796
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_071796:
	move.b loc_07179e(pc,d0.w),(pl_invinciblity_timer,a6)

loc_07179c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07179e:
	dc.b $04,$08,$0c,00

;----------------------------------------------
loc_0717a2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0717cc
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0717ce(pc,d0.w),($44,a6)
	move.l loc_0717ce+4(pc,d0.w),($4c,a6)

loc_0717cc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0717ce:
	dc.l $00070000,$ffffa800
	dc.l $00080000,$ffffa800
	dc.l $00090000,$ffffa800

;----------------------------------------------
loc_0717e6:
	bsr.w loc_072aba
	cmpi.w #1,($44,a6)
	bcs.b loc_07181e
	tst.b (PL_cpucontrol,a6)
	beq.b loc_071808
	movea.l #loc_05dcb4,a1
	jsr loc_030a66
	beq.b loc_071818
	bra.b loc_071812

loc_071808:
	move.w ($378,a6),d0
	andi.w #$770f,d0
	beq.b loc_071818

loc_071812:
	move.b #1,($32,a6)

loc_071818:
	jmp loc_02a7ea

loc_07181e:
	addq.b #2,(7,a6)
	move.l #$fffff800,($4c,a6)
	move.b #1,($a8,a6)
	clr.w ($3a,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_07183a:
	bsr.w loc_072aba
	bpl.b loc_071858
	addq.b #2,(7,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$37,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

loc_071858:
	addq.w #1,($3a,a6)
	andi.w #1,($3a,a6)
	beq.w loc_072a36
	rts

;----------------------------------------------
loc_071868:
	bsr.w loc_072aba
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0718a2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	jsr loc_00369c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$75,d0
	jmp Set_Char_Special_Ani

loc_0718a2:
	jmp loc_02a7ea

;----------------------------------------------
loc_0718a8:
	tst.b ($33,a6)
	bpl.w loc_072a36
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Killer Bee Cannon Drill
;==============================================
loc_0718c0:
	move.b (7,a6),d0
	move.w loc_0718cc(pc,d0.w),d1
	jmp loc_0718cc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0718cc:
	dc.w loc_0718f0-loc_0718cc
	dc.w loc_071908-loc_0718cc
	dc.w loc_071986-loc_0718cc
	dc.w loc_07199e-loc_0718cc
	dc.w loc_0719e8-loc_0718cc
	dc.w loc_071a12-loc_0718cc
	dc.w loc_071a44-loc_0718cc
	dc.w loc_071aa6-loc_0718cc

	dc.w loc_071aea-loc_0718cc
	dc.w loc_071b88-loc_0718cc
	dc.w loc_071bea-loc_0718cc
	dc.w loc_071bfa-loc_0718cc
	dc.w loc_071c4e-loc_0718cc
	dc.w loc_071ca0-loc_0718cc
	dc.w loc_071cb0-loc_0718cc
	dc.w loc_071cd8-loc_0718cc

	dc.w loc_071d18-loc_0718cc
	dc.w loc_071d44-loc_0718cc

;----------------------------------------------
loc_0718f0:
	addq.b #2,(7,a6)
	move.b d0,(pl_crouching,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071908:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_071954
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_071956(pc,d0.w),($40,a6)
	move.l loc_071956+4(pc,d0.w),($48,a6)
	move.l loc_071956+8(pc,d0.w),($44,a6)
	move.l loc_071956+$c(pc,d0.w),($4c,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	bpl.b loc_07194e
	neg.l d0

loc_07194e:
	asr.l #5,d0
	move.l d0,($40,a6)

loc_071954:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071956:
	dc.l $00020000,$fffff000,$000b0000,$ffffa800
	dc.l $00040000,$ffffe800,$000b0000,$ffffa800
	dc.l $00060000,$ffffe000,$000b0000,$ffffa800

;----------------------------------------------
loc_071986:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_07199c
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)

loc_07199c:
	rts

;----------------------------------------------
loc_07199e:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	addi.w #$b8,d0
	cmp.w ($14,a6),d0
	bcc.w loc_072a36
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	addi.w #$ffcc,d0
	move.w d0,($14,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0719e8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_071a10
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_071a02
	moveq #1,d0

loc_071a02:
	move.b d0,($ab,a6)
	moveq #9,d0
	moveq #$4c,d1
	jsr loc_082e36

loc_071a10:
	rts

;----------------------------------------------
loc_071a12:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_071a3e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_071a38
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_071a38:
	move.b loc_071a40(pc,d0.w),(pl_invinciblity_timer,a6)

loc_071a3e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071a40:
	dc.b $00,$00,$00,00

;----------------------------------------------
loc_071a44:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_071a74
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_071a76(pc,d0.w),($40,a6)
	move.l loc_071a76+4(pc,d0.w),($48,a6)
	move.l loc_071a76+8(pc,d0.w),($44,a6)
	move.l loc_071a76+$c(pc,d0.w),($4c,a6)

loc_071a74:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071a76:
	dc.l $00080000,$fffff000,$fff98000,$ffff8000
	dc.l $00090000,$ffffe800,$fff90000,$ffff8000
	dc.l $000a0000,$ffffe000,$fff88000,$ffff8000

;----------------------------------------------
loc_071aa6:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071aea:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_071b46
	addq.b #2,(7,a6)
	tst.b ($5b,a6)
	beq.b loc_071b06
	bmi.b loc_071b06
	st.b ($dd,a6)

loc_071b06:
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b #1,(pl_crouching,a6)
	move.b ($82,a6),d0
	move.b d0,($3a,a6)
	addq.b #2,($3a,a6)
	lsl.w #3,d0
	move.l loc_071b58(pc,d0.w),($40,a6)
	move.l loc_071b58+4(pc,d0.w),($48,a6)
	move.l loc_071b58+8(pc,d0.w),($44,a6)
	move.l loc_071b58+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071b56
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071b46:
	tst.b ($34,a6)
	beq.b loc_071b56
	clr.b ($34,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_071b56:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071b58:
	dc.l $000a0000,$00000000,$00000000,$ffffe800
	dc.l $000c0000,$00000000,$00000000,$ffffe800
	dc.l $000e0000,$00000000,$00000000,$ffffe800

;----------------------------------------------
loc_071b88:
	tst.b ($5b,a6)
	beq.b loc_071b9e
	clr.b ($5b,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_071b9e
	move.b #1,($a8,a6)

loc_071b9e:
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.b loc_071bb6
	jsr loc_02aa08
	bcs.b loc_071bb6
	jmp loc_02a7ea

loc_071bb6:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071bea:
	bsr.w loc_072a9e
	bpl.b loc_071bf4
	addq.b #2,(7,a6)

loc_071bf4:
	jmp loc_02a7ea

;----------------------------------------------
loc_071bfa:
	tst.b ($33,a6)
	bpl.w loc_072a36
	bra.w loc_071c3e
	tst.b ($107,a5)
	bne.b loc_071c3e
	tst.b ($5b,a6)
	beq.b loc_071c3e
	bmi.b loc_071c3e
	cmpi.b #4,($82,a6)
	bcs.b loc_071c3e
	tst.b (PL_cpucontrol,a6)
	bne.b loc_071c32
	btst #3,($11b,a6)
	beq.b loc_071c3e
	btst #6,(PL_Buttons,a6)
	beq.b loc_071c3e

loc_071c32:
	addq.b #2,(7,a6)
	moveq #$48,d0
	jmp Set_Char_Special_Ani

loc_071c3e:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_071c4e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_071c9e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #4,d0
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	bne.b loc_071c7c
	neg.l d0

loc_071c7c:
	move.l d0,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #$10,($3a,a6)

loc_071c9e:
	rts

;----------------------------------------------
loc_071ca0:
	bsr.w loc_072ab8
	subq.b #1,($3a,a6)
	bpl.b loc_071cae
	addq.b #2,(7,a6)
 
loc_071cae:
	rts

;----------------------------------------------
loc_071cb0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_071cd6
	addq.b #2,(7,a6)
	move.b #1,($dd,a6)
	move.l #$fffc0000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_071cd6:
	rts

;----------------------------------------------
loc_071cd8:
	bsr.w loc_072aba
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	move.l #$fffc0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$49,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071d18:
	bsr.w loc_072ab8
	bpl.b loc_071d3a
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_071d3a
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_071d3a:
	tst.b ($35,a6)
	beq.w loc_072a36
	rts

;----------------------------------------------
loc_071d44:
	tst.b ($33,a6)
	bpl.w loc_072a36
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
;Crash
;==============================================
loc_071d5c:
	move.b (7,a6),d0
	move.w loc_071d6c(pc,d0.w),d1
	jsr loc_071d6c(pc,d1.w)
	bra.w loc_071fd6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071d6c:
	dc.w loc_071d7c-loc_071d6c
	dc.w loc_071db4-loc_071d6c
	dc.w loc_071de4-loc_071d6c
	dc.w loc_071e58-loc_071d6c
	dc.w loc_071ef2-loc_071d6c
	dc.w loc_071f6c-loc_071d6c
	dc.w loc_071f82-loc_071d6c
	dc.w loc_071f9a-loc_071d6c

;----------------------------------------------
loc_071d7c:
	addq.b #2,(7,a6)
	move.b #1,(pl_crouching,a6)
	move.b #2,($23f,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b d0,($3c,a6)
	move.l d0,($84,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$67,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071db4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_071de2
	addq.b #2,(7,a6)
	move.b #$31,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_071dd4
	moveq #1,d0

loc_071dd4:
	move.b d0,($ab,a6)
	moveq #-2,d0
	moveq #$1e,d1
	jsr loc_082e36

loc_071de2:
	rts

;----------------------------------------------
loc_071de4:
	subq.b #1,($3a,a6)
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.w loc_071e56
	bpl.b loc_071e14
	move.b #1,($34,a6)
	addi.w #$28,($14,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_071e14:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_071e56
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	move.w ($64,a6),($14,a6)
	move.w #$d0,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

loc_071e56:
	rts

;----------------------------------------------
loc_071e58:
	subq.b #1,($3a,a6)
	bpl.b loc_071eb8
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_071e7e
	move.b ($82,a6),d0
	lsr.b #1,d0
 
loc_071e7e:
	move.b loc_071eba(pc,d0.w),(pl_invinciblity_timer,a6)
	move.b loc_071ebe(pc,d0.w),($3a,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_071ec2(pc,d0.w),($40,a6)
	move.l loc_071ec2+4(pc,d0.w),($48,a6)
	move.l loc_071ec2+8(pc,d0.w),($44,a6)
	move.l loc_071ec2+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071eb8
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071eb8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071eba:
	dc.b $04,$08,$0c,$00

loc_071ebe:
	dc.b $03,$06,$0a,$03

loc_071ec2:
	dc.l $00050000,$00000000,$00030000,$ffffa000
	dc.l $00060000,$00000000,$00048000,$ffffa000
	dc.l $00070000,$00000000,$0006a000,$ffffa000

;----------------------------------------------
loc_071ef2:
	jsr loc_02aa08
	bcs.b loc_071f26
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_071f26
	tst.b ($5b,a6)
	beq.b loc_071f20
	clr.b ($5b,a6)
	subq.b #1,($3a,a6)
	beq.b loc_071f26

loc_071f20:
	jmp loc_02a7ea

loc_071f26:
	move.b #$a,(7,a6)
	st.b ($3c,a6)
	move.l #$ffff0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_071f5e
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_071f5e:
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071f6c:
	jsr loc_02aa08
	bcc.w loc_072a36
	addq.b #2,(7,a6)
	moveq #$c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_071f82:
	tst.b ($33,a6)
	bpl.w loc_072a36
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;----------------------------------------------
loc_071f9a:
	st.b ($85,a6)
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_071fbc
	tst.b ($3c,a4)
	bne.b loc_071fbc
	rts

loc_071fbc:
	moveq #0,d0
	move.b d0,(pl_invinciblity_timer,a6)
	move.b d0,($263,a6)
	bsr.w loc_071f26
	move.l ($40,a6),d0
	add.l d0,d0
	move.l d0,($40,a6)
	rts

;==============================================
loc_071fd6:
	tst.b ($85,a6)
	bne.b loc_071fee
	movea.w ($276,a6),a4
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_071ff0(pc,d0.w),d1
	jmp loc_071ff0(pc,d1.w)

loc_071fee:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_071ff0:
	dc.w loc_071ffa-loc_071ff0
	dc.w loc_07201e-loc_071ff0
	dc.w loc_072056-loc_071ff0
	dc.w loc_072070-loc_071ff0
	dc.w loc_072082-loc_071ff0

;----------------------------------------------
loc_071ffa:
	addq.b #2,($84,a6)
	move.b #1,($ce,a4)
	clr.b ($2c8,a4)
	move.b #$7f,($25d,a4)
	move.b #1,($263,a4)
	moveq #$58,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_07201e:
	tst.b ($33,a4)
	bpl.w loc_072b18
	addq.b #2,($84,a6)
	move.b #$1a,($25d,a4)
	clr.b ($263,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	moveq #$6b,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_080744

;----------------------------------------------
loc_072056:
	tst.b ($33,a4)
	bpl.w loc_072b18
	addq.b #2,($84,a6)
	movea.w ($276,a6),a4
	moveq #$6c,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_072070:
	tst.b ($ab,a6)
	bne.b loc_072080
	addq.b #2,($84,a6)
	move.b #1,($31,a4)

loc_072080:
	rts

;----------------------------------------------
loc_072082:
	tst.b ($3c,a6)
	bne.b loc_0720a8
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	movea.w ($276,a6),a4
	moveq #$6c,d0
	move.b ($35,a6),d1
	add.b d1,d0
	moveq #2,d1
	jmp loc_02a83c

loc_0720a8:
	rts

;==============================================
;Dramatic mode super 2?
;==============================================
loc_0720aa:
	move.b (7,a6),d0
	move.w loc_0720b6(pc,d0.w),d1
	jmp loc_0720b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0720b6:
	dc.w loc_0720be-loc_0720b6
	dc.w loc_0720e8-loc_0720b6
	dc.w loc_072112-loc_0720b6
	dc.w loc_072144-loc_0720b6

;----------------------------------------------
loc_0720be:
	addq.b #2,(7,a6)
	move.b #1,(pl_crouching,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$67,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0720e8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_072110
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_072102
	moveq #1,d0

loc_072102:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_072110:
	rts

;----------------------------------------------
loc_072112:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_07213e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_072138
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_072138:
	move.b loc_072140(pc,d0.w),(pl_invinciblity_timer,a6)

loc_07213e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072140:
	dc.b $08,$0c,$10,00

;----------------------------------------------
loc_072144:
	tst.b ($33,a6)
	bpl.w loc_072a36
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Psycho Streak
;==============================================
loc_07215c:
	move.b (7,a6),d0
	move.w loc_072168(pc,d0.w),d1
	jmp loc_072168(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072168:
	dc.w loc_072170-loc_072168
	dc.w loc_072198-loc_072168
	dc.w loc_0721cc-loc_072168
	dc.w loc_072206-loc_072168

;----------------------------------------------
loc_072170:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	clr.b (pl_crouching,a6)
	move.b #$44,($2a0,a6)
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$30,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_072198:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_0721c6
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0721b2
	moveq #1,d0

loc_0721b2:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$5b,d1
	jsr loc_082e36
	jsr loc_07565c

loc_0721c6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0721cc:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_072200
	addq.b #2,(7,a6)
	move.b #$5a,($3b,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_0721fa
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0721fa:
	move.b loc_072202(pc,d0.w),(pl_invinciblity_timer,a6)

loc_072200:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072202:
	dc.b $06,$08,$0a,00

;----------------------------------------------
loc_072206:
	subq.b #1,($3b,a6)
	beq.w loc_072a2a
	jmp loc_02a7ea

;==============================================
;Taunt
;==============================================
loc_072214:
	move.b (7,a6),d0
	move.w loc_072220(pc,d0.w),d1
	jmp loc_072220(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072220:
	dc.w loc_072224-loc_072220
	dc.w loc_072244-loc_072220

;----------------------------------------------
loc_072224:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_072238
	subq.b #1,(pl_taunt_count,a6)

loc_072238:
	clr.b (pl_crouching,a6)
	moveq #$4d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_072244:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2

;##############################################
;Throws
;##############################################
loc_072252:
	cmpi.b #4,($80,a6)
	beq.w loc_0724be
	move.b (7,a6),d0
	move.w loc_072268(pc,d0.w),d1
	jmp loc_072268(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072268:
	dc.w loc_072282-loc_072268
	dc.w loc_072296-loc_072268
	dc.w loc_072316-loc_072268
	dc.w loc_072324-loc_072268
	dc.w loc_072340-loc_072268
	dc.w loc_072364-loc_072268
	dc.w loc_07238e-loc_072268
	dc.w loc_07239c-loc_072268

	dc.w loc_0723d4-loc_072268
	dc.w loc_072410-loc_072268
	dc.w loc_072428-loc_072268
	dc.w loc_07246c-loc_072268
	dc.w loc_0724b0-loc_072268

;----------------------------------------------
loc_072282:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_072296:
	tst.b ($35,a6)
	beq.w loc_072a36
	moveq #$55,d0
	tst.b ($81,a6)
	beq.b loc_0722a8
	moveq #$56,d0

loc_0722a8:
	jsr loc_02e3fe
	beq.b loc_07230c
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0722d6
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_0722e4
	move.b #1,(PL_Flip,a6)
	bra.b loc_0722e4

loc_0722d6:
	btst.b #0,($371,a6)
	beq.b loc_0722e4
	eori.b #1,(PL_Flip,a6)

loc_0722e4:
	move.b #6,(7,a6)
	moveq #$1e,d0
	tst.b ($81,a6)
	beq.b loc_072300
	move.b #$e,(7,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$1d,d0

loc_072300:
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

loc_07230c:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_072316:
	tst.b ($33,a6)
	bpl.w loc_072a36
	jmp loc_02baf2

;----------------------------------------------
loc_072324:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_072a3c
	bmi.w loc_072a44
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	rts

;----------------------------------------------
loc_072340:
	tst.b ($35,a6)
	beq.b loc_072358
	addq.b #2,(7,a6)
	move.b #$30,($123,a5)
	moveq #$5c,d0
	jsr loc_02e970

loc_072358:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_072364:
	tst.b ($35,a6)
	bpl.b loc_072382
	addq.b #2,(7,a6)
	jsr loc_02a7ea
	jsr loc_02f9be
	moveq #$55,d0
	jmp loc_02e7f2

loc_072382:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_07238e:
	tst.b ($33,a6)
	bmi.w loc_072a30
	jmp loc_02a7ea

;----------------------------------------------
loc_07239c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_072a44
	addq.b #2,(7,a6)
	move.l #$ffff0000,($40,a6)
	move.l #$40000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff9000,($4c,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_0723d4:
	cmpi.b #2,($35,a6)
	beq.b loc_0723e2
	jsr loc_02a7ea

loc_0723e2:
	bsr.w loc_072ab8
	bpl.b loc_07240a
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07240a
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_07240a:
	jmp loc_02f9be

;----------------------------------------------
loc_072410:
	addq.b #2,(7,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5d,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_072428:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_072a3e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.l #$13000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff5000,($4c,a6)
	jsr loc_02f9be
	moveq #$56,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_07246c:
	tst.b ($35,a6)
	bne.b loc_07247e
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_07247e:
	bsr.w loc_072ab8
	bpl.w loc_072a3c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0724b0:
	tst.b ($33,a6)
	bmi.w loc_072a2a
	jmp loc_02a7ea

;==============================================
;Air Throws
;==============================================
loc_0724be:
	move.b (7,a6),d0
	move.w loc_0724ca(pc,d0.w),d1
	jmp loc_0724ca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0724ca:
	dc.w loc_0724e2-loc_0724ca
	dc.w loc_07259e-loc_0724ca
	dc.w loc_0725b4-loc_0724ca
	dc.w loc_0725ee-loc_0724ca
	dc.w loc_07263c-loc_0724ca
	dc.w loc_072668-loc_0724ca
	dc.w loc_072692-loc_0724ca
	dc.w loc_0726b2-loc_0724ca

	dc.w loc_0726c8-loc_0724ca
	dc.w loc_07272c-loc_0724ca
	dc.w loc_07274a-loc_0724ca
	dc.w loc_072782-loc_0724ca

;----------------------------------------------
loc_0724e2:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$71,d0
	tst.b ($81,a6)
	beq.b loc_0724f4
	moveq #$72,d0

loc_0724f4:
	jsr loc_02e636
	beq.w loc_072592
	tst.b (PL_cpucontrol,a6)
	beq.b loc_072524
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_072532
	move.b #1,(PL_Flip,a6)
	bra.b loc_072532

loc_072524:
	btst.b #0,($371,a6)
	beq.b loc_072532
	eori.b #1,(PL_Flip,a6)

loc_072532:
	tst.b ($81,a6)
	bne.b loc_072552
	move.b #4,(7,a6)
	move.b #$c,($3b,a6)
	moveq #$20,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_072552:
	move.b #$e,(7,a6)
	eori.b #1,(PL_Flip,a6)
	move.l #0,($40,a6)
	move.l #0,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffc000,($4c,a6)
	move.b #$c,($3b,a6)
	moveq #$1f,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

loc_072592:
	addq.b #2,(7,a6)
	moveq #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_07259e:
	jsr loc_02aa08
	bcc.w loc_072a36
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_0725b4:
	subq.b #1,($3b,a6)
	bpl.w loc_072a3e
	addq.b #2,(7,a6)
	clr.b ($3b,a6)
	jmp loc_02f9be

;==============================================
loc_0725ca:
	move.l ($40,a6),d0
	beq.b loc_0725dc
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_0725dc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;----------------------------------------------
loc_0725ee:
	bsr.b loc_0725ca
	bpl.b loc_072600
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	bcc.b loc_07261e

loc_072600:
	tst.b ($35,a6)
	bne.b loc_072612
	jsr loc_02a7ea
	jmp loc_02f9be

loc_072612:
	addq.b #2,(7,a6)
	moveq #$57,d0
	jmp loc_02e7f2

loc_07261e:
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b #$a,(7,a6)
	jsr loc_00369c
	moveq #$2f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_07263c:
	bsr.b loc_0725ca
	bpl.w loc_072a36
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a36
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_072668:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.w loc_072a3c
	addq.b #2,(7,a6)
	move.w ($64,a6),d0
	subi.w #8,d0
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$57,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_072692:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0726a4
	move.w ($64,a6),($14,a6)

loc_0726a4:
	tst.b ($33,a6)
	bpl.w loc_072a3c
	jmp loc_02bb26

;----------------------------------------------
loc_0726b2:
	subq.b #1,($3b,a6)
	bpl.w loc_072a44
	addq.b #2,(7,a6)
	clr.b ($3b,a6)
	jmp loc_02fa36

;----------------------------------------------
loc_0726c8:
	tst.b ($35,a6)
	bne.b loc_0726d4
	jsr loc_02a7ea

loc_0726d4:
	bsr.w loc_072ab8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3e
	move.w d0,($14,a6)
	clr.w ($16,a6)
	tst.b ($35,a6)
	beq.w loc_072a3e
	addq.b #2,(7,a6)
	move.l #$20000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5e,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_07272c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_072a3e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$58,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_07274a:
	tst.b ($35,a6)
	bne.b loc_072756
	jsr loc_02a7ea

loc_072756:
	bsr.w loc_072ab8
	bpl.w loc_072a3c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_072a3c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_00369c

;----------------------------------------------
loc_072782:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_072a30
	rts

;##############################################
;Winposes
;##############################################
loc_072792:
	move.b (6,a6),d0
	move.w loc_07279e(pc,d0.w),d1
	jmp loc_07279e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07279e:
	dc.w loc_0727a8-loc_07279e
	dc.w loc_0727be-loc_07279e
	dc.w loc_0727d0-loc_07279e
	dc.w loc_07283a-loc_07279e
	dc.w loc_072864-loc_07279e

;----------------------------------------------
loc_0727a8:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.w ($84,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_0727be:
	tst.b ($11c,a5)
	bne.w loc_072a36
	addq.b #2,(6,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0727d0:
	move.b #8,(6,a6)
	moveq #0,d6
	move.b #$3c,($3a,a6)
	st.b ($85,a6)
	move.w #$258,($40,a6)
	tst.w ($276,a6)
	beq.b loc_0727f6
	move.b #6,(6,a6)
	moveq #$10,d6

loc_0727f6:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.b loc_07280a
	jsr RNGFunction
	andi.w #$f,d0

loc_07280a:
	add.b d6,d0
	move.b loc_07281a(pc,d0.w),d0
	move.b d0,($84,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07281a:
	dc.b $00,$01,$02,$03,$00,$01,$02,$03
	dc.b $00,$01,$02,$03,$00,$01,$02,$03
	dc.b $04,$05,$06,$04,$05,$06,$04,$05
	dc.b $06,$04,$05,$06,$04,$05,$06,$04

;----------------------------------------------
loc_07283a:
	subq.w #1,($40,a6)
	bmi.w loc_072856
	movea.w ($276,a6),a4
	tst.w ($50,a4)
	bpl.b loc_072850
	addq.b #2,(6,a6)

loc_072850:
	jmp loc_02a7ea

loc_072856:
	addq.b #2,(6,a6)
	clr.b ($84,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_072864:
	move.b ($84,a6),d0
	add.w d0,d0
	move.w loc_072872(pc,d0.w),d1
	jmp loc_072872(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072872:
	dc.w loc_072880-loc_072872
	dc.w loc_072880-loc_072872
	dc.w loc_072880-loc_072872
	dc.w loc_0728d4-loc_072872
	dc.w loc_0728fe-loc_072872
	dc.w loc_072938-loc_072872
	dc.w loc_072938-loc_072872

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_072880:
	move.b (7,a6),d0
	move.w loc_07288c(pc,d0.w),d1
	jmp loc_07288c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07288c:
	dc.w loc_072890-loc_07288c
	dc.w loc_0728a2-loc_07288c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_072890:
	addq.b #2,(7,a6)
	move.b ($84,a6),d0
	addi.b #$23,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0728a2:
	cmpi.b #1,($35,a6)
	bne.w loc_0728ca
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	beq.w loc_0728ca
	move.b #$44,($2a0,a6)
	jsr loc_0a3f9e

loc_0728ca:
	bsr.w loc_0729ac
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0728d4:
	move.b (7,a6),d0
	move.w loc_0728e0(pc,d0.w),d1
	jmp loc_0728e0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0728e0:
	dc.w loc_0728e4-loc_0728e0
	dc.w loc_0728f4-loc_0728e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0728e4:
	addq.b #2,(7,a6)
	clr.b (PL_Flip,a6)
	moveq #$25,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0728f4:
	bsr.w loc_0729ac
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0728fe:
	movea.w ($276,a6),a4
	move.b (7,a6),d0
	move.w loc_07290e(pc,d0.w),d1
	jmp loc_07290e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07290e:
	dc.w loc_072912-loc_07290e
	dc.w loc_07292e-loc_07290e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_072912:
	addq.b #2,(7,a6)
	clr.b (PL_Flip,a6)
	moveq #$25,d0
	move.w ($10,a6),d1
	cmp.w ($10,a4),d1
	bcc.b loc_072928
	moveq #$26,d0

loc_072928:
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07292e:
	bsr.w loc_0729ac
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_072938:
	movea.w ($276,a6),a4
	move.b (7,a6),d0
	move.w loc_072948(pc,d0.w),d1
	jmp loc_072948(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_072948:
	dc.w loc_072950-loc_072948
	dc.w loc_07295c-loc_072948
	dc.w loc_07298e-loc_072948
	dc.w loc_0729a2-loc_072948

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_072950:
	addq.b #2,(7,a6)
	moveq #$58,d0
	jmp Set_Char_Special_Ani

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07295c:
	tst.b ($33,a6)
	bpl.w loc_072a36
	addq.b #2,(7,a6)
	move.w #$e0,d0
	cmpi.b #5,($84,a6)
	beq.b loc_072978
	move.w #$98,d0

loc_072978:
	add.w ($290,a5),d0
	move.w d0,($10,a6)
	move.b #1,(PL_Flip,a6)
	moveq #$59,d0
	jmp Set_Char_Special_Ani

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07298e:
	tst.b ($33,a6)
	bpl.w loc_072a36
	addq.b #2,(7,a6)
	moveq #$27,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0729a2:
	bsr.w loc_0729ac
	jmp loc_02a7ea

;==============================================
loc_0729ac:
	subq.b #1,($3a,a6)
	bpl.w loc_072a3c
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)
	rts

;==============================================
loc_0729be:
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
	movem.l d0-d1,($1e0,a6)
	movem.l d0-d1,($1e8,a6)
	movem.l d0-d1,($380,a6)
	movem.l d0-d1,($388,a6)
	movem.l d0-d1,($390,a6)
	rts

;==============================================
loc_072a2a:
	jmp loc_02baf2

;==============================================
loc_072a30:
	jmp loc_02bb26

;==============================================
loc_072a36:
	jmp loc_02a7ea

;==============================================
loc_072a3c:
	rts

;==============================================
loc_072a3e:
	jmp loc_02f9be

;==============================================
loc_072a44:
	jmp loc_02fa36

;==============================================
loc_072a4a:
	jsr loc_02bb5a
	move.l #$2000e00,(4,a6)
	move.b #$1a,(pl_move_id,a6)
	move.b #$7f,(pl_invinciblity_timer,a6)
	move.b #1,($263,a6)
	moveq #$58,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_072a72:
	move.b #$1a,(pl_invinciblity_timer,a6)
	clr.b ($263,a6)
	moveq #$59,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_072a84:
	move.w ($276,a6),d1
	beq.b loc_072a9c
	movea.w d1,a4
	tst.b ($125,a4)
	beq.b loc_072a9c
	move.w #$202,($200,a4)
	move.w d0,($202,a4)

loc_072a9c:
	rts

;==============================================
loc_072a9e:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_072aaa
	neg.l d0

loc_072aaa:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_072ab8:
	bsr.b loc_072a9e

;==============================================
loc_072aba:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_072acc:
	move.l a0,($6c,a6)
	move.l a4,($70,a6)
	move.w ($276,a6),d0
	beq.b loc_072afa
	movea.w d0,a4
	cmpi.b #$1e,($102,a4)
	bne.b loc_072afa
	tst.w ($50,a4)
	bmi.b loc_072afa
	tst.b ($b9,a4)
	bne.b loc_072afa
	movea.l ($1c,a4),a0
	tst.b ($13,a0)
	bne.b loc_072b06

loc_072afa:
	movea.l ($6c,a6),a0
	movea.l ($70,a6),a4
	moveq #0,d0
	rts

loc_072b06:
	movea.l ($6c,a6),a0
	movea.l ($70,a6),a4
	moveq #1,d0
	rts

;==============================================
loc_072b12:
	jmp loc_02baf2

;==============================================
loc_072b18:
	jmp loc_02a8ca

;##############################################
;
;##############################################
loc_072b1e:
	dc.w loc_072b62-loc_072b1e
	dc.w loc_072b62-loc_072b1e
	dc.w loc_072b24-loc_072b1e

loc_072b24:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02

loc_072b62:
	dc.b $08,$0a,$08,$0a,$06,$06,$06,$06
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02
