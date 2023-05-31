;##############################################
;
;##############################################
loc_0431be:
	jmp loc_00d5bc

;##############################################
;
;##############################################
loc_0431c4:
	move.b (6,a6),d0
	move.w loc_0431d0(pc,d0.w),d1
	jmp loc_0431d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0431d0:
	dc.w loc_0431d8-loc_0431d0
	dc.w loc_0431ea-loc_0431d0
	dc.w loc_043200-loc_0431d0
	dc.w loc_043252-loc_0431d0

;==============================================
loc_0431d8:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_0431ea:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_0431fa
	tst.b ($11c,a5)
	bne.b loc_0431fa
	addq.b #2,(6,a6)

loc_0431fa:
	jmp loc_02a7ea

;==============================================
loc_043200:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	bne.b loc_043220
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_04323a(pc,d0.w),d0

loc_043220:
	cmpi.b #6,d0
	bne.b loc_04322e
	tst.w (Region,a5)
	beq.b loc_04322e
	moveq #4,d0

loc_04322e:
	ext.w d0
	move.b loc_04324a(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04323a:
	dc.b $00,$00,$00,$04,$04,$04,$01,$01
	dc.b $02,$02,$02,$02,$03,$03,$03,$03

loc_04324a:
	dc.b $23,$32,$24,$25,$26,$27,$31,$32

;==============================================
loc_043252:
	tst.b ($3a,a6)
	beq.b loc_043266
	subq.b #1,($3a,a6)
	bne.b loc_043266
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_043266:
	jmp loc_02a7ea

;##############################################
;Normals
;##############################################
loc_04326c:
	tst.b ($80,a6)
	bne.w loc_04349e
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_0433b6
	move.b (7,a6),d0
	move.w loc_04328c(pc,d0.w),d1
	jmp loc_04328c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04328c:
	dc.w loc_043294-loc_04328c
	dc.w loc_043308-loc_04328c
	dc.w loc_04330e-loc_04328c
	dc.w loc_043384-loc_04328c

;==============================================
loc_043294:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b ($3a,a6)
	clr.b ($5b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_0432dc
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_0432dc
	btst.b #0,($83,a6)
	bne.b loc_0432f0
	bra.b loc_0432ee

loc_0432dc:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_043302(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_0432f0

loc_0432ee:
	addq.b #1,d0

loc_0432f0:
	cmpi.b #4,d0
	bne.b loc_0432fc
	move.b #4,(7,a6)

loc_0432fc:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043302:
	dc.w $0030,$0038,$0048

;==============================================
loc_043308:
	jmp loc_02f5ac

;==============================================
loc_04330e:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	tst.b ($5b,a6)
	beq.w loc_044b4a
	clr.b ($5b,a6)
	addq.b #1,($3a,a6)
	cmpi.b #2,($3a,a6)
	bne.w loc_044b4a
	cmpi.b #$ff,(PL_ism_choice,a6)
	bne.w loc_044b4a
	tst.b (PL_cpucontrol,a6)
	bne.w loc_044b4a
	btst.b #3,($371,a6)
	beq.w loc_044b4a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff4000,($4c,a6)
	clr.l ($48,a6)
	move.l #$20000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_043378
	neg.l d0

loc_043378:
	move.l d0,($40,a6)
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

;==============================================
loc_043384:
	jsr loc_02aa08
	bcs.b loc_0433a2
	tst.w ($44,a6)
	bpl.w loc_044b4a
	move.l #$ffffc000,($4c,a6)
	jmp loc_02a7ea

loc_0433a2:
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_0433b6:
	move.b (7,a6),d0
	move.w loc_0433c2(pc,d0.w),d1
	jmp loc_0433c2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0433c2:
	dc.w loc_0433c8-loc_0433c2
	dc.w loc_04344e-loc_0433c2
	dc.w loc_043476-loc_0433c2

;----------------------------------------------
loc_0433c8:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	cmpi.b #4,($82,a6)
	bne.b loc_043404
	btst.b #1,($83,a6)
	beq.b loc_0433fe
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

loc_0433fe:
	move.b #4,(7,a6)

loc_043404:
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_04342e
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_04342e
	btst.b #0,($83,a6)
	bne.b loc_043442
	bra.b loc_043440

loc_04342e:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_043448(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_043442

loc_043440:
	addq.b #1,d0

loc_043442:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043448
	dc.w $0030,$0038,$0040

;----------------------------------------------
loc_04344e:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	cmpi.b #4,($82,a6)
	bne.b loc_043464
	tst.b ($3e,a6)
	bne.b loc_043470

loc_043464:
	jsr loc_02eb06
	beq.b loc_043470
	clr.b (7,a6)

loc_043470:
	jmp loc_02a7ea

;----------------------------------------------
loc_043476:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_044b3e
	tst.b ($35,a6)
	beq.b loc_04349c
	clr.b ($35,a6)
	moveq #$10,d0
	tst.b (PL_Flip,a6)
	bne.b loc_043498
	neg.w d0

loc_043498:
	add.w d0,($10,a6)

loc_04349c:
	rts

;==============================================
;
;==============================================
loc_04349e:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_0434b0(pc,d0.w),d1
	jmp loc_0434b0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0434b0:
	dc.w loc_0434b4-loc_0434b0
	dc.w loc_0434ea-loc_0434b0

;----------------------------------------------
loc_0434b4:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_0434e2
	moveq #$f,d0

loc_0434e2:
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_0434ea:
	jmp loc_02f5ac

;##############################################
;
;##############################################
loc_0434f0:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_043520
	moveq #$18,d0

loc_043520:
	tst.b ($81,a6)
	beq.b loc_04352a
	addq.w #3,d0
	bra.b loc_04354c

loc_04352a:
	cmpi.b #4,($82,a6)
	bne.b loc_04354c
	move.b ($83,a6),d1
	andi.w #4,d1
	beq.b loc_04354c
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_04354c:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Move Inputs
;##############################################
loc_04355c:
	jsr SPButton_Vism_code
	bne.w loc_043992

loc_043566:
	lea.l ($1d8,a6),a4
	jsr SpChrg_4646P_code
	bne.w loc_0438a6

loc_043574:
	lea.l ($1d0,a6),a4
	jsr SpInp_23623A_code
	bne.w loc_04382a

loc_043582:
	lea.l (pl_inp_slot_9,a6),a4
	jsr SpInp_360RotA_code
	bne.w loc_0437ec

loc_043590:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpChrg_46P_code
	bne.w loc_043628

loc_04359e:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpHold_AllP_code
	bne.w loc_0436e8

loc_0435ac:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpHold_LPMP_code
	bne.w loc_043652

loc_0435ba:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpHold_LPHP_code
	bne.w loc_043684

loc_0435c8:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpHold_MPHP_code
	bne.w loc_0436b6

loc_0435d6:
	lea.l (pl_inp_slot_8,a6),a4
	jsr SpHold_AllK_code
	bne.w loc_0437ac

loc_0435e4:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpHold_LKMK_code
	bne.w loc_04371a

loc_0435f2:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpHold_LKHK_code
	bne.w loc_04374c

loc_043600:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpHold_MKHK_code
	bne.w loc_04377c

loc_04360e:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_04390c

loc_04361c:
	jsr SPButton_Taunt_code
	bne.w loc_0438de

loc_043626:
	rts

;==============================================
;Special Move ID Writes
;==============================================
loc_043628:
	jsr loc_02ed00
	beq.w loc_04359e
	move.l #$2000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
loc_043652:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435ba
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #0,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_0437da

;==============================================
loc_043684:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435c8
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #2,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_0437da

;==============================================
loc_0436b6:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435d6
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #4,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_0437da

;==============================================
loc_0436e8:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435ac
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #6,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_0437da

;==============================================
loc_04371a:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435f2
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #0,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_0437da

;==============================================
loc_04374c:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_043600
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #2,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.b loc_0437da

;==============================================
loc_04377c:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_04360e
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #4,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.b loc_0437da

;==============================================
loc_0437ac:
	move.b d1,($1fd,a6)
	jsr loc_02ed00
	beq.w loc_0435e4
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #6,($81,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)

loc_0437da:
	move.b ($1fd,a6),d0
	cmpi.b #8,d0
	bls.b loc_0437e6
	moveq #8,d0

loc_0437e6:
	move.b d0,($82,a6)
	rts

;==============================================
loc_0437ec:
	jsr loc_02ed00
	beq.w loc_043590
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.b #7,d0
	bne.b loc_04381e
	move.b #$12,(pl_move_id,a6)
	jmp loc_02f74c

loc_04381e:
	move.b #4,(pl_move_id,a6)
	jmp loc_02f728

;==============================================
loc_04382a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_043582
	jsr loc_02ecd8
	beq.w loc_043582
	move.l #$2001000,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	move.l d0,($84,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	tst.b ($254,a6)
	beq.b loc_04388a
	andi.b #$22,d0
	cmpi.b #$22,d0
	bne.b loc_04387e
	clr.b ($81,a6)
	jmp loc_02f4bc

loc_04387e:
	move.b #2,($81,a6)
	jmp loc_02f4dc

loc_04388a:
	andi.b #7,d0
	bne.b loc_04389c
	move.b #2,($81,a6)
	jmp loc_02f4dc

loc_04389c:
	clr.b ($81,a6)
	jmp loc_02f4bc

;==============================================
loc_0438a6:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_043574
	jsr loc_02ecd8
	beq.w loc_043574
	move.l #$2001000,(4,a6)
	move.b #8,(pl_move_id,a6)
	clr.l ($84,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
loc_0438de:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0438ec
	tst.b (pl_taunt_count,a6)
	beq.w loc_043626

loc_0438ec:
	jsr loc_02ed00
	beq.w loc_043626
	move.l #$2000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
loc_04390c:
	jsr loc_02edf8
	beq.w loc_04361c

;##############################################
;
;##############################################
loc_043916:
	tst.b (PL_ism_choice,a6)
	bne.w loc_043958
	move.l #$2000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	movea.w ($38,a6),a4
	move.b #$19,(pl_invinciblity_timer,a6)
	move.b #$15,($5f,a4)
	moveq #3,d0
	jmp Set_Char_Special_Ani

;##############################################
;
;##############################################
loc_043958:
	move.l #$2000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	movea.w ($38,a6),a4
	move.b #$16,($5f,a4)
	move.b #$1a,(pl_invinciblity_timer,a6)
	moveq #4,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_043992:
	tst.b ($28a,a6)
	bne.w loc_043566
	tst.b ($31,a6)
	bne.w loc_0439d0
	jsr loc_02ef54
	beq.w loc_043566
	jsr loc_02ecd8
	beq.w loc_043566
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_0439d0:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_043566
	jsr loc_02ed28
	beq.w loc_043566
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	jmp loc_02f980

;##############################################
;AI Special Move Checks
;##############################################
loc_0439f6:
	move.b (pl_move_id,a6),d0
	move.w loc_043a02(pc,d0.w),d1
	jmp loc_043a02(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043a02:
	dc.w loc_043a5a-loc_043a02
	dc.w loc_043a44-loc_043a02
	dc.w loc_043a5a-loc_043a02
	dc.w loc_043a16-loc_043a02
	dc.w loc_043a2c-loc_043a02
	dc.w loc_043a4e-loc_043a02
	dc.w loc_043a5a-loc_043a02
	dc.w loc_043a4e-loc_043a02

	dc.w loc_043a5a-loc_043a02
	dc.w loc_043a5a-loc_043a02

;==============================================
loc_043a16:
	tst.b (PL_ism_choice,a6)
	bne.w loc_043a66
	cmpi.w #$30,(PL_meter,a6)
	bls.w loc_043a66
	bra.w loc_043a5e

;==============================================
loc_043a2c:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_043a66
	cmpi.w #$30,(PL_meter,a6)
	bls.w loc_043a66
	bra.w loc_043a5e

;==============================================
loc_043a44:
	move.b ($83,a6),($81,a6)
	bra.w loc_043a5e

;==============================================
loc_043a4e:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_043a66
	bra.w loc_043a5e

;==============================================
loc_043a5a:
	bra.w loc_043a5e

;----------------------------------------------
loc_043a5e:
	clr.l ($84,a6)
	moveq #1,d0
	rts

;----------------------------------------------
loc_043a66:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_043a6a:
	move.b (pl_move_id,a6),d0
	move.w loc_043a76(pc,d0.w),d1
	jmp loc_043a76(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043a76:
	dc.w loc_043a8a-loc_043a76
	dc.w loc_043c52-loc_043a76
	dc.w loc_043d98-loc_043a76
	dc.w loc_043f2a-loc_043a76
	dc.w loc_04420e-loc_043a76
	dc.w loc_044630-loc_043a76
	dc.w loc_044658-loc_043a76
	dc.w loc_044630-loc_043a76

	dc.w loc_0446b8-loc_043a76
	dc.w loc_04473a-loc_043a76

;==============================================
;
;==============================================
loc_043a8a:
	move.b (7,a6),d0
	move.w loc_043a96(pc,d0.w),d1
	jmp loc_043a96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043a96:
	dc.w loc_043aa0-loc_043a96
	dc.w loc_043b10-loc_043a96
	dc.w loc_043b68-loc_043a96
	dc.w loc_043bfe-loc_043a96
	dc.w loc_043c2c-loc_043a96

;----------------------------------------------
loc_043aa0:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_043afe(pc,d0.w),d2
	add.w d0,d0
	move.l loc_043b04(pc,d0.w),($40,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_043ad2
	neg.w d2

loc_043ad2:
	move.w ($10,a6),($1f8,a6)
	add.w d2,($1f8,a6)
	move.l #$ffff4000,($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #5,d0
	jsr Set_Char_Special_Ani
	move.b ($34,a6),($2a0,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043afe:
	dc.w $0018,$0080,$0110

loc_043b04:
	dc.l $00080000,$00088000,$00090000

;----------------------------------------------
loc_043b10:
	tst.b ($35,a6)
	beq.b loc_043b64
	addq.b #2,(7,a6)
	clr.b ($3a,a6)
	jsr loc_01c2c8
	beq.b loc_043b64
	addq.b #1,(a4)
	move.w #$2a01,(2,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$6c,($14,a4)
	jsr loc_01c2c8
	beq.b loc_043b64
	addq.b #1,(a4)
	move.w #$2a00,(2,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_043b64:
	bra.w loc_043c44

;----------------------------------------------
loc_043b68:
	addq.b #1,($3a,a6)
	andi.b #7,($3a,a6)
	bne.w loc_043b9c
	jsr loc_01c2c8
	beq.b loc_043b9c
	addq.b #1,(a4)
	move.w #$2a01,(2,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$6c,($14,a4)

loc_043b9c:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_043ba8
	neg.l d0

loc_043ba8:
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($1f8,a6),d0
	addi.w #$10,d0
	cmpi.w #$20,d0
	bcs.b loc_043bd2
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.b loc_043bd2
	cmpi.w #$30,(pl_dist_away,a6)
	bhi.w loc_043c44

loc_043bd2:
	addq.b #2,(7,a6)
	move.b #8,($1ff,a6)
	move.l #$80000,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #8,d0
	jsr Set_Char_Special_Ani
	move.b ($34,a6),($2a0,a6)
	rts

;----------------------------------------------
loc_043bfe:
	subq.b #1,($1ff,a6)
	bne.b loc_043c08
	clr.b ($ce,a6)

loc_043c08:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_043c14
	neg.l d0

loc_043c14:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.w loc_043c44
	addq.b #2,(7,a6)
	bra.w loc_043c44

;----------------------------------------------
loc_043c2c:
	subq.b #1,($1ff,a6)
	bne.b loc_043c36
	clr.b ($ce,a6)

loc_043c36:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	jsr loc_02f6f8

loc_043c44:
	jsr loc_02a7ea
	move.b ($34,a6),($2a0,a6)
	rts

;==============================================
;
;==============================================
loc_043c52:
	move.b (7,a6),d0
	move.w loc_043c5e(pc,d0.w),d1
	jmp loc_043c5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043c5e:
	dc.w loc_043c68-loc_043c5e
	dc.w loc_043cd0-loc_043c5e
	dc.w loc_043ce8-loc_043c5e
	dc.w loc_043d4c-loc_043c5e
	dc.w loc_043d7a-loc_043c5e

;----------------------------------------------
loc_043c68:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$80000,($40,a6)
	move.l #$ffff4000,($48,a6)
	moveq #0,d0
	move.b ($81,a6),d0
	tst.b (PL_cpucontrol,a6)
	beq.b loc_043ca0
	move.b ($83,a6),d0

loc_043ca0:
	move.w loc_043cc8(pc,d0.w),d0
	tst.b (PL_Flip,a6)
	bne.b loc_043cac
	neg.w d0

loc_043cac:
	move.w ($10,a6),($1f8,a6)
	add.w d0,($1f8,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$b,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043cc8:
	dc.w $0018,$0060,$0090,$0110

;----------------------------------------------
loc_043cd0:
	tst.b ($35,a6)
	beq.b loc_043ce2
	addq.b #2,(7,a6)
	clr.b ($3a,a6)
	bsr.w loc_044b50

loc_043ce2:
	jmp loc_02a7ea

;----------------------------------------------
loc_043ce8:
	addq.b #1,($3a,a6)
	andi.b #7,($3a,a6)
	bne.w loc_043cfa
	bsr.w loc_044b50

loc_043cfa:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_043d06
	neg.l d0

loc_043d06:
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($1f8,a6),d0
	addi.w #$10,d0
	cmpi.w #$20,d0
	bcs.b loc_043d30
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.b loc_043d30
	cmpi.w #$30,(pl_dist_away,a6)
	bhi.w loc_044b4a

loc_043d30:
	addq.b #2,(7,a6)
	move.b #8,($1ff,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$11,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_043d4c:
	subq.b #1,($1ff,a6)
	bne.b loc_043d56
	clr.b ($ce,a6)

loc_043d56:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_043d62
	neg.l d0

loc_043d62:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_043d74
	addq.b #2,(7,a6)

loc_043d74:
	jmp loc_02a7ea

;----------------------------------------------
loc_043d7a:
	subq.b #1,($1ff,a6)
	bne.b loc_043d84
	clr.b ($ce,a6)

loc_043d84:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_043d98:
	move.b (7,a6),d0
	move.w loc_043daa(pc,d0.w),d1
	jsr loc_043daa(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043daa:
	dc.w loc_043dba-loc_043daa
	dc.w loc_043de2-loc_043daa
	dc.w loc_043e20-loc_043daa
	dc.w loc_043e4c-loc_043daa
	dc.w loc_043e66-loc_043daa
	dc.w loc_043e98-loc_043daa
	dc.w loc_043ef0-loc_043daa
	dc.w loc_043f1c-loc_043daa

;----------------------------------------------
loc_043dba:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$1c,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_043de2:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	tst.b ($35,a6)
	beq.w loc_044b4a
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_043e1a(pc,d0.w),d0
	jsr loc_02e3fe
	beq.w loc_044b4a
	addq.b #2,(7,a6)
	moveq #$14,d0
	jsr loc_02ef6c
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043e1a:
	dc.w $0044,$0045,$0046

;----------------------------------------------
loc_043e20:
	tst.b ($35,a6)
	beq.b loc_043e46
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$47,d0
	jsr loc_02e970

loc_043e46:
	jmp loc_02a7ea

;----------------------------------------------
loc_043e4c:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$1f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_043e66:
	tst.b ($35,a6)
	beq.b loc_043e92
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$5c,d0
	jsr loc_02e970
	move.b #$18,($3a,a6)

loc_043e92:
	jmp loc_02a7ea

;----------------------------------------------
loc_043e98:
	subq.b #1,($3a,a6)
	bpl.w loc_043eee
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$44,d0
	jsr loc_02e7f2
	move.l #$18000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_043ece
	neg.l d0
	neg.l d1

loc_043ece:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #$30,d0
	jmp loc_02a708

loc_043eee:
	rts

;----------------------------------------------
loc_043ef0:
	jsr loc_02aa08
	bcc.w loc_044b4a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_043f1c:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_043f2a:
	move.w ($84,a6),d0
	move.w loc_043f36(pc,d0.w),d1
	jmp loc_043f36(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043f36:
	dc.w loc_043f3a-loc_043f36
	dc.w loc_043f5c-loc_043f36

;==============================================
;
;==============================================
loc_043f3a:
	addq.w #2,($84,a6)
	jsr loc_0804da
	clr.b ($1fe,a6)
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$23,d0
	jmp Set_Char_Special_Ani
 
;==============================================
;
;==============================================
loc_043f5c:
	move.b ($82,a6),d0
	move.w loc_043f6e(pc,d0.w),d1
	jsr loc_043f6e(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043f6e:
	dc.w loc_043f74-loc_043f6e
	dc.w loc_043f74-loc_043f6e
	dc.w loc_043f74-loc_043f6e

;==============================================
loc_043f74:
	move.b (7,a6),d0
	move.w loc_043f80(pc,d0.w),d1
	jmp loc_043f80(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_043f80:
	dc.w loc_043f92-loc_043f80
	dc.w loc_04402c-loc_043f80
	dc.w loc_0440b8-loc_043f80
	dc.w loc_04410e-loc_043f80
	dc.w loc_044118-loc_043f80
	dc.w loc_044132-loc_043f80
	dc.w loc_044170-loc_043f80
	dc.w loc_0441d4-loc_043f80

	dc.w loc_044200-loc_043f80

;----------------------------------------------
loc_043f92:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.b loc_043fc4
	tst.b ($35,a6)
	beq.w loc_044026
	clr.b ($35,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_043fb4
	moveq #1,d0

loc_043fb4
	move.b d0,($ab,a6)
	moveq #-$10,d0
	moveq #$3c,d1
	jsr loc_082e36
	bra.b loc_044026

loc_043fc4:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_043fe4
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_043fe4:
	move.b loc_044028(pc,d0.w),(pl_invinciblity_timer,a6)
	move.l #$40000,($40,a6)
	move.l #0,($48,a6)
	move.l #$c0000,($44,a6)
	move.l #$fffee000,($4c,a6)
	tst.b ($81,a6)
	beq.b loc_044018
	move.l #$a8000,($40,a6)

loc_044018:
	tst.b (PL_Flip,a6)
	bne.b loc_044026
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_044026:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044028:
	dc.b $16,$16,$16,00

;----------------------------------------------
loc_04402c:
	jsr loc_02aa08
	bcc.w loc_044b4a
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$4a,d0
	jsr loc_02e3fe
	beq.b loc_044066
	addq.b #2,(7,a6)
	clr.w ($3a,a6)
	jsr loc_080668
	bra.w loc_044074

loc_044066:
	move.b #$10,(7,a6)
	moveq #$1b,d0
	jmp Set_Char_Special_Ani

loc_044074:
	moveq #0,d0
	move.b ($82,a6),d0
	lea.l loc_044c6e(pc),a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($1fe,a6),d1
	add.w d1,d1
	add.w d1,d1
	move.w (a0,d1.w),d0
	bmi.b loc_0440b2
	move.b #4,(7,a6)
	addq.b #1,($1fe,a6)
	tst.w (2,a0,d1.w)
	beq.b loc_0440ac
	eori.b #1,(PL_Flip,a6)

loc_0440ac:
	jmp Set_Char_Special_Ani

loc_0440b2:
	addq.b #2,(7,a6)
	rts

;----------------------------------------------
loc_0440b8:
	tst.b ($35,a6)
	beq.b loc_0440f0
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	moveq #0,d1
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.b ($1fe,a6),d1
	subq.w #1,d1
	add.w d1,d1
	add.w d1,d0
	move.w loc_0440f6(pc,d0.w),d0
	jsr loc_02e970
	addq.b #2,(7,a6)
	move.b #$10,($3a,a6)

loc_0440f0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0440f6:
	dc.w $004b,$004c,$0000,$0000
	dc.w $004d,$004e,$004f,$0000
	dc.w $0050,$0051,$0052,$0053

;----------------------------------------------
loc_04410e:
	subq.b #1,($3a,a6)
	bmi.w loc_044074
	rts

;----------------------------------------------
loc_044118:
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$28,d0
	tst.b ($82,a6)
	beq.b loc_04412c
	moveq #$2a,d0

loc_04412c:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044132:
	tst.b ($35,a6)
	beq.w loc_04416a
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	moveq #0,d1
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.b ($1fe,a6),d1
	add.w d1,d1
	add.w d1,d0
	move.w loc_0440f6(pc,d0.w),d0
	jsr loc_02e970
	addq.b #2,(7,a6)
	move.b #$10,($3a,a6)

loc_04416a:
	jmp loc_02a7ea

;----------------------------------------------
loc_044170:
	subq.b #1,($3a,a6)
	bpl.w loc_0441d2
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	moveq #$4a,d0
	jsr loc_02e7f2
	move.b #1,($31,a6)
	move.l #$18000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_0441b2
	neg.l d0
	neg.l d1

loc_0441b2:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #$30,d0
	jmp loc_02a708

loc_0441d2:
	rts

;----------------------------------------------
loc_0441d4:
	jsr loc_02aa08
	bcc.w loc_044b4a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_044200:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04420e:
	move.w ($84,a6),d0
	move.w loc_04421a(pc,d0.w),d1
	jmp loc_04421a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04421a:
	dc.w loc_04421e-loc_04421a
	dc.w loc_04424a-loc_04421a

;==============================================
;
;==============================================
loc_04421e:
	addq.w #2,($84,a6)
	jsr loc_0804da
	clr.b ($1fc,a6)
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.w #$2b,d0
	jmp Set_Char_Special_Ani

;==============================================
;
;==============================================
loc_04424a:
	move.b ($82,a6),d0
	move.w loc_044256(pc,d0.w),d1
	jmp loc_044256(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044256:
	dc.w loc_04425c-loc_044256
	dc.w loc_044276-loc_044256
	dc.w loc_044290-loc_044256

;==============================================
;Level 1
;==============================================
loc_04425c:
	move.b (7,a6),d0
	move.w loc_044268(pc,d0.w),d1
	jmp loc_044268(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044268:
	dc.w loc_0442b0-loc_044268
	dc.w loc_044318-loc_044268
	dc.w loc_044362-loc_044268
	dc.w loc_0443f0-loc_044268
	dc.w loc_0444a8-loc_044268
	dc.w loc_0444e6-loc_044268
	dc.w loc_044622-loc_044268

;==============================================
;Level 2
;==============================================
loc_044276:
	move.b (7,a6),d0
	move.w loc_044282(pc,d0.w),d1
	jmp loc_044282(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044282:
	dc.w loc_0442b0-loc_044282
	dc.w loc_044318-loc_044282
	dc.w loc_044362-loc_044282
	dc.w loc_044436-loc_044282
	dc.w loc_0444a8-loc_044282
	dc.w loc_0444e6-loc_044282
	dc.w loc_044622-loc_044282

;==============================================
;Level 3
;==============================================
loc_044290:
	move.b (7,a6),d0
	move.w loc_04429c(pc,d0.w),d1
	jmp loc_04429c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04429c
	dc.w loc_0442b0-loc_04429c
	dc.w loc_044318-loc_04429c
	dc.w loc_044362-loc_04429c
	dc.w loc_044436-loc_04429c
	dc.w loc_0444a8-loc_04429c
	dc.w loc_0444e6-loc_04429c
	dc.w loc_044552-loc_04429c
	dc.w loc_044576-loc_04429c

	dc.w loc_0445c0-loc_04429c
	dc.w loc_044622-loc_04429c

;----------------------------------------------
loc_0442b0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0442d8
	clr.b ($35,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0442ca
	moveq #1,d0

loc_0442ca:
	move.b d0,($ab,a6)
	moveq #-$a,d0
	moveq #$72,d1
	jsr loc_082e36

loc_0442d8:
	tst.b ($33,a6)
	beq.b loc_044312
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_0442f8
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0442f8:
	move.b loc_044314(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$40,d0
	jsr Set_Char_Special_Ani
	bra.b loc_044318

loc_044312:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044314:
	dc.b $04,$0a,$10,00

;----------------------------------------------
loc_044318:
	tst.b ($35,a6)
	beq.b loc_04435c
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	move.l #$90000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.w #$c0,d0
	tst.b (PL_Flip,a6)
	bne.b loc_04434a
	neg.l ($40,a6)
	neg.l ($48,a6)
	neg.w d0

loc_04434a:
	move.w ($10,a6),($1f8,a6)
	add.w d0,($1f8,a6)
	clr.b ($3a,a6)
	bsr.w loc_044b50

loc_04435c:
	jmp loc_02a7ea

;----------------------------------------------
loc_044362:
	addq.b #1,($3a,a6)
	andi.b #7,($3a,a6)
	bne.w loc_044374
	bsr.w loc_044b50

loc_044374:
	movea.w ($38,a6),a4
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($1f8,a6),d0
	tst.b (PL_Flip,a6)
	beq.w loc_044392
	neg.w d0

loc_044392:
	tst.w d0
	bmi.b loc_0443d0
	moveq #1,d0
	tst.w ($40,a6)
	bmi.w loc_0443a2
	moveq #2,d0

loc_0443a2:
	cmp.b ($ac,a6),d0
	beq.w loc_0443d0
	tst.b ($5b,a6)
	bne.b loc_0443d0
	moveq #-$20,d0
	moveq #$40,d1
	tst.b (PL_Flip,a6)
	beq.w loc_0443be
	neg.w d0

loc_0443be:
	add.w ($10,a6),d0
	sub.w ($10,a4),d0
	add.w d1,d0
	add.w d1,d1
	cmp.w d1,d0
	bhi.w loc_044b4a

loc_0443d0:
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsr.b #1,d0
	move.w d0,d1
	add.w d0,d0
	add.w d1,d0
	addi.w #$31,d0
	add.b ($1fc,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0443f0:
	cmpi.b #2,($1fc,a6)
	beq.b loc_044408
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_044408:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	addq.b #1,($1fc,a6)
	cmpi.b #3,($1fc,a6)
	beq.w loc_044b3e
	move.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044436:
	cmpi.b #2,($1fc,a6)
	beq.b loc_04444e
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_04444e:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	addq.b #1,($1fc,a6)
	cmpi.b #3,($1fc,a6)
	bne.w loc_044490
	cmpi.b #2,($82,a6)
	beq.b loc_044478
	movea.w ($38,a6),a4
	tst.b ($2ce,a4)
	beq.w loc_044b3e

loc_044478:
	move.b #8,(7,a6)
	moveq #$3b,d0
	cmpi.b #2,($82,a6)
	bne.b loc_04448a
	moveq #$3a,d0

loc_04448a:
	jmp Set_Char_Special_Ani

loc_044490:
	move.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsr.w #1,d0
	addi.w #$2e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0444a8:
	tst.b ($33,a6)
	bpl.b loc_0444e0
	addq.b #2,(7,a6)
	move.w ($10,a6),($1f8,a6)
	move.w #$160,d0
	move.l #$80000,d1
	move.l #$ffff4000,d2
	tst.b (PL_Flip,a6)
	bne.b loc_0444d4
	neg.w d0
	neg.l d1
	neg.l d2

loc_0444d4:
	add.w d0,($1f8,a6)
	move.l d1,($40,a6)
	move.l d2,($48,a6)

loc_0444e0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0444e6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($1f8,a6),d0
	tst.b (PL_Flip,a6)
	beq.w loc_044500
	neg.w d0

loc_044500:
	tst.w d0
	bmi.b loc_04453c
	moveq #1,d0
	tst.w ($40,a6)
	bmi.w loc_044510
	moveq #2,d0

loc_044510:
	cmp.b ($ac,a6),d0
	beq.w loc_04453c
	movea.w ($38,a6),a4
	moveq #-$14,d0;ec
	moveq #$32,d1
	tst.b (PL_Flip,a6)
	beq.w loc_04452a
	neg.w d0

loc_04452a:
	add.w ($10,a6),d0
	sub.w ($10,a4),d0
	add.w d1,d0
	add.w d1,d1
	cmp.w d1,d0
	bhi.w loc_044b4a

loc_04453c:
	addq.b #2,(7,a6)
	moveq #$3c,d0
	cmpi.b #4,($82,a6)
	bne.b loc_04454c
	moveq #$3d,d0

loc_04454c:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044552:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.b ($33,a6)
	bpl.w loc_044b4a
	addq.b #2,(7,a6)
	moveq #$3e,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044576:
	tst.b ($33,a6)
	bpl.b loc_0445ba
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	clr.b ($3a,a6)
	move.w ($10,a6),($1f8,a6)
	move.w #$160,d0
	move.l #$80000,d1
	move.l #$ffff4000,d2
	tst.b (PL_Flip,a6)
	bne.b loc_0445aa
	neg.w d0
	neg.l d1
	neg.l d2

loc_0445aa:
	add.w d0,($1f8,a6)
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	bsr.w loc_044b50

loc_0445ba:
	jmp loc_02a7ea

;----------------------------------------------
loc_0445c0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($1f8,a6),d0
	tst.b (PL_Flip,a6)
	beq.w loc_0445da
	neg.w d0

loc_0445da:
	tst.w d0
	bmi.b loc_044616
	moveq #1,d0
	tst.w ($40,a6)
	bmi.w loc_0445ea
	moveq #2,d0

loc_0445ea:
	cmp.b ($ac,a6),d0
	beq.w loc_044616
	movea.w ($38,a6),a4
	moveq #-$20,d0
	moveq #$50,d1
	tst.b (PL_Flip,a6)
	beq.w loc_044604
	neg.w d0

loc_044604:
	add.w ($10,a6),d0
	sub.w ($10,a4),d0
	add.w d1,d0
	add.w d1,d1
	cmp.w d1,d0
	bhi.w loc_044b4a

loc_044616:
	addq.b #2,(7,a6)
	moveq #$3f,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044622:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_044630:
	move.b (7,a6),d0
	move.w loc_04463c(pc,d0.w),d1
	jmp loc_04463c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04463c:
	dc.w loc_044640-loc_04463c
	dc.w loc_04464a-loc_04463c

;----------------------------------------------
loc_044640:
	addq.b #2,(7,a6)
	jmp loc_080e8e

;----------------------------------------------
loc_04464a:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_044658:
	move.b (7,a6),d0
	move.w loc_044664(pc,d0.w),d1
	jmp loc_044664(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044664:
	dc.w loc_044668-loc_044664
	dc.w loc_0446aa-loc_044664

;----------------------------------------------
loc_044668:
	addq.b #2,(7,a6)
	clr.b (pl_crouching,a6)
	move.b #1,($ce,a6)
	move.b #1,(pl_attk_active,a6)
	tst.b ($3e,a6)
	bne.b loc_044686
	subq.b #1,(pl_taunt_count,a6)

loc_044686:
	moveq #$17,d0
	btst.b #1,($83,a6)
	beq.b loc_044696
	addq.w #1,d0
	clr.b (pl_attk_active,a6)

loc_044696:
	btst.b #0,($83,a6)
	beq.b loc_0446a4
	addq.w #2,d0
	clr.b (pl_attk_active,a6)

loc_0446a4:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0446aa:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_0446b8:
	move.b (7,a6),d0
	move.w loc_0446c4(pc,d0.w),d1
	jmp loc_0446c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0446c4:
	dc.w loc_0446ca-loc_0446c4
	dc.w loc_0446ea-loc_0446c4
	dc.w loc_04471e-loc_0446c4

;----------------------------------------------
loc_0446ca:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_0446e4
	moveq #$2f,d0

loc_0446e4:
	jmp loc_02a708

;----------------------------------------------
loc_0446ea:
	tst.b ($34,a6)
	beq.b loc_044718
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-$b,d0
	moveq #$6a,d1
	tst.b ($31,a6)
	beq.b loc_04470e
	moveq #-$b,d0
	moveq #$6a,d1

loc_04470e:
	jsr loc_097cd6
	bsr.w loc_044b6a

loc_044718:
	jmp loc_02a7ea

;----------------------------------------------
loc_04471e:
	subq.b #1,($3a,a6)
	bne.w loc_044b4a
	tst.b ($31,a6)
	beq.b loc_044734
	move.l #$2000602,(4,a6)

loc_044734:
	jmp loc_02f796

;==============================================
;
;==============================================
loc_04473a:
	move.b (7,a6),d0
	move.w loc_04474c(pc,d0.w),d1
	jsr loc_04474c(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04474c:
	dc.w loc_044754-loc_04474c
	dc.w loc_04477e-loc_04474c
	dc.w loc_0447ce-loc_04474c
	dc.w loc_04481a-loc_04474c

;----------------------------------------------
loc_044754:
	addq.b #2,(7,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$1c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_04477e:
	tst.b ($33,a6)
	bmi.w loc_044b3e
	tst.b ($35,a6)
	beq.w loc_044b4a
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_0447c8(pc,d0.w),d0
	jsr loc_02e3fe
	beq.w loc_044b4a
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_0447c4(pc,d0.w),($3a,a6)
	moveq #$f,d0
	jsr loc_02ef6c
	moveq #$20,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0447c4:
	dc.b $01,$02,$03,$04

loc_0447c8:
	dc.w $0054,$0055,$0056

;----------------------------------------------
loc_0447ce:
	tst.b ($33,a6)
	bpl.b loc_0447ee
	subq.b #1,($3a,a6)
	beq.b loc_0447e2
	moveq #$21,d0
	jmp Set_Char_Special_Ani

loc_0447e2:
	addq.b #2,(7,a6)
	moveq #$22,d0
	jmp Set_Char_Special_Ani

loc_0447ee:
	tst.b ($35,a6)
	beq.b loc_04480e
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_044814(pc,d0.w),d0
	jsr loc_02e970

loc_04480e:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044814
	dc.w $0057,$0058,$0059

;----------------------------------------------
loc_04481a:
	tst.b ($33,a6)
	bpl.b loc_044828
	clr.b ($ce,a6)
	bra.w loc_044b3e

loc_044828:
	tst.b ($35,a6)
	beq.b loc_04484c
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_044852(pc,d0.w),d0
	jsr loc_02e7f2

loc_04484c:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044852:
	dc.w $0054,$0055,$0056

;##############################################
;Throws
;##############################################
loc_044858:
	cmpi.b #4,($80,a6)
	beq.w loc_0449c0
	move.b (7,a6),d0
	move.w loc_044874(pc,d0.w),d1
	jsr loc_044874(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044874:
	dc.w loc_044880-loc_044874
	dc.w loc_044894-loc_044874
	dc.w loc_04491c-loc_044874
	dc.w loc_04492a-loc_044874
	dc.w loc_04493c-loc_044874
	dc.w loc_0449aa-loc_044874

;----------------------------------------------
loc_044880:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$43,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044894:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	moveq #$41,d0
	tst.b ($81,a6)
	beq.b loc_0448a6
	moveq #$43,d0

loc_0448a6:
	jsr loc_02e3fe
	beq.w loc_044910
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0448d0
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_0448ee
	bra.b loc_0448f4

loc_0448d0:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_0448f4
	clr.b (PL_Flip,a6)
	tst.b ($81,a6)
	beq.b loc_0448e8
	eori.w #3,d0

loc_0448e8:
	btst #1,d0
	bne.b loc_0448f4

loc_0448ee:
	move.b #1,(PL_Flip,a6)

loc_0448f4:
	move.b #6,(7,a6)
	moveq #1,d0
	tst.b ($81,a6)
	beq.b loc_04490a
	move.b #$a,(7,a6)
	moveq #0,d0

loc_04490a:
	jmp Set_Char_Special_Ani

loc_044910:
	addq.b #2,(7,a6)
	moveq #$44,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_04491c:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	jmp loc_02baf2

;----------------------------------------------
loc_04492a:
	addq.b #2,(7,a6)
	move.w #$60,($ae,a6)
	clr.w ($3a,a6)
	clr.b ($1fe,a6)

;----------------------------------------------
loc_04493c:
	movea.w ($38,a6),a4
	tst.b ($35,a6)
	beq.b loc_044972
	clr.b ($35,a6)
	moveq #$42,d0
	tst.b ($1fe,a6)
	bne.b loc_044958
	st.b ($1fe,a6)
	moveq #$42,d0

loc_044958:
	jsr loc_02e970
	beq.w loc_04496e
	moveq #$41,d0
	jsr loc_02e7f2
	bra.w loc_04499c

loc_04496e:
	addq.b #1,($3a,a6)

loc_044972:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_044b4a
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_044994
	jsr loc_02ea7a
	beq.w loc_044b4a

loc_044994:
	moveq #$41,d0
	jsr loc_02e7f2

loc_04499c:
	move.b #4,(7,a6)
	moveq #2,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0449aa:
	tst.b ($35,a6)
	beq.w loc_044b4a
	move.b #4,(7,a6)
	moveq #$43,d0
	jmp loc_02e7f2

;==============================================
;Air Throws
;==============================================
loc_0449c0:
	move.b (7,a6),d0
	move.w loc_0449d2(pc,d0.w),d1
	jsr loc_0449d2(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0449d2:
	dc.w loc_0449e0-loc_0449d2
	dc.w loc_0449f4-loc_0449d2
	dc.w loc_044a64-loc_0449d2
	dc.w loc_044a7a-loc_0449d2
	dc.w loc_044aac-loc_0449d2
	dc.w loc_044b14-loc_0449d2
	dc.w loc_04491c-loc_0449d2

;----------------------------------------------
loc_0449e0:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$45,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0449f4:
	jsr loc_02aa08
	bcs.w loc_044b3e
	tst.b ($33,a6)
	bpl.w loc_044b4a
	moveq #$5a,d0
	jsr loc_02e636
	beq.w loc_044a58
	tst.b (PL_cpucontrol,a6)
	beq.b loc_044a32
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_044a44
	bra.b loc_044a4a

loc_044a32:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_044a4a
	btst.b #1,($11b,a6)
	bne.b loc_044a4a

loc_044a44:
	move.b #1,(PL_Flip,a6)

loc_044a4a:
	move.b #6,(7,a6)
	moveq #$47,d0
	jmp Set_Char_Special_Ani

loc_044a58:
	addq.b #2,(7,a6)
	moveq #$46,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044a64:
	jsr loc_02aa08
	bcc.w loc_044b4a
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_044a7a:
	tst.b ($35,a6)
	bne.w loc_044b4a
	jsr loc_02aa08
	bcc.w loc_044b4a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$48,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_044aac:
	tst.b ($35,a6)
	beq.b loc_044ac4
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	moveq #$5b,d0
	jsr loc_02e970

loc_044ac4:
	tst.b ($33,a6)
	bpl.w loc_044b4a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #$5a,d0
	jsr loc_02e7f2
	move.l #$20000,($40,a6)
	move.l #$fffffb00,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_044b0c
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_044b0c:
	moveq #$14,d0
	jmp loc_02a708

;----------------------------------------------
loc_044b14:
	jsr loc_02aa08
	bcc.w loc_044b4a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	moveq #$11,d0
	jmp loc_02a708

;==============================================
loc_044b3e:
	jmp loc_02baf2

;==============================================
loc_044b44:
	jmp loc_02bb26

;==============================================
loc_044b4a:
	jmp loc_02a7ea

;==============================================
loc_044b50:
	jsr loc_080dd0
	beq.b loc_044b68
	move.w #$20,d0
	tst.b (PL_Flip,a6)
	beq.b loc_044b64
	neg.w d0

loc_044b64:
	add.w d0,($10,a4)

loc_044b68:
	rts

;==============================================
loc_044b6a:
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

;##############################################
;
;##############################################
loc_044bc4:
	jsr loc_01c368
	beq.b loc_044be2
	addq.b #1,(a4)
	move.w a4,($28,a6)
	move.w #$800,(2,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w a6,($36,a4)

loc_044be2:
	rts

;##############################################
;
;##############################################
loc_044be4:
	dc.w loc_044c2c-loc_044be4
	dc.w loc_044c2c-loc_044be4
	dc.w loc_044bea-loc_044be4

loc_044bea:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

loc_044c2c:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$07,$09,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

;==============================================
loc_044c6e:
	dc.w loc_044c74-loc_044c6e
	dc.w loc_044c7a-loc_044c6e
	dc.w loc_044c84-loc_044c6e

loc_044c74:
	dc.w $0025,$0000
	dc.w $ffff

loc_044c7a:
	dc.w $0025,$0000
	dc.w $0029,$0000
	dc.w $ffff

loc_044c84:
	dc.w $0025,$0000
	dc.w $0026,$0000
	dc.w $0029,$0000
	dc.w $ffff
