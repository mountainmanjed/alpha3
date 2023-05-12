;##############################################
;
;##############################################
loc_04d300:
	jsr loc_01c368
	beq.b loc_04d324
	addq.b #1,(a4)
	move.b #$d,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_04d324:
	rts

;##############################################
;
;##############################################
loc_04d326:
	move.b (7,a6),d0
	move.w loc_04d332(pc,d0.w),d1
	jmp loc_04d332(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d332:
	dc.w loc_04d33e-loc_04d332
	dc.w loc_04d38c-loc_04d332
	dc.w loc_04d3b2-loc_04d332
	dc.w loc_04d404-loc_04d332
	dc.w loc_04d41c-loc_04d332
	dc.w loc_04d42e-loc_04d332

;==============================================
loc_04d33e:
	movea.w ($38,a6),a4
	move.b ($102,a4),d1
	cmpi.b #$c,d1
	beq.w loc_04d37e
	cmpi.b #$1d,d1
	beq.w loc_04d37e
	move.b ($101,a6),d0
	add.b d0,d0
	move.w loc_04d388(pc,d0.w),($10,a6)
	move.l #$80000,($40,a6)
	move.l #$ffffa000,($48,a6)
	addq.b #2,(7,a6)
	moveq #$22,d0
	jmp loc_02a708

loc_04d37e:
	move.b #8,(7,a6)
	bra.w loc_04d41c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d388:
	dc.w $0390,$0170

;==============================================
loc_04d38c:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	beq.b loc_04d398
	neg.l d0

loc_04d398:
	add.l d0,($10,a6)
	cmpi.w #$280,($10,a6)
	bne.w loc_04ee3a
	addq.b #2,(7,a6)
	moveq #$30,d0
	jmp loc_02a708

;==============================================
loc_04d3b2:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	beq.b loc_04d3be
	neg.l d0

loc_04d3be:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.b ($40,a6)
	bpl.b loc_04d3f6
	addq.b #2,(7,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_04d400(pc,d0.w),($10,a6)
	moveq #$31,d0
	jmp loc_02a708

loc_04d3f6:
	jsr loc_02a7ea
	bra.w loc_04d444

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d400:
	dc.w $0220,$02e0

;==============================================
loc_04d404:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	move.l #$2000000,($4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04d41c:
	addq.b #2,(7,a6)
	move.w #$78,($3a,a6)
	moveq #$35,d0
	jmp loc_02a708

;==============================================
loc_04d42e:
	subq.w #1,($3a,a6)
	bpl.w loc_04ee3a
	move.b #6,(7,a6)
	moveq #$36,d0
	jmp loc_02a708

;==============================================
loc_04d444:
	tst.b ($35,a6)
	bne.b loc_04d466
	move.b ($81,a5),d0
	add.b ($101,a6),d0
	andi.w #3,d0
	bne.b loc_04d466
	moveq #1,d6

loc_04d45a:
	jsr loc_085a74
	beq.b loc_04d466
	dbra d6,loc_04d45a

loc_04d466:
	rts

;##############################################
;Normals
;##############################################
loc_04d468:
	tst.b ($80,a6)
	bne.w loc_04d5da
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_04d528
	move.b (7,a6),d0
	move.w loc_04d488(pc,d0.w),d1
	jmp loc_04d488(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d488:
	dc.w loc_04d490-loc_04d488
	dc.w loc_04d4f8-loc_04d488
	dc.w loc_04d4fe-loc_04d488
	dc.w loc_04d51c-loc_04d488

;----------------------------------------------
loc_04d490:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	moveq #0,d1
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	tst.b ($125,a6)
	bne.b loc_04d4d2
	cmpi.b #1,($132,a6)
	bne.b loc_04d4d2
	btst.b #0,($83,a6)
	bne.b loc_04d4e0
	bra.b loc_04d4de

loc_04d4d2:
	move.w loc_04d4f2(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_04d4e0

loc_04d4de:
	addq.b #1,d0

loc_04d4e0:
	cmpi.b #4,d0
	bne.b loc_04d4ec
	move.b #4,(7,a6)

loc_04d4ec:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d4f2:
	dc.w $0020,$0020,$0058

;----------------------------------------------
loc_04d4f8:
	jmp loc_02f5ac

;----------------------------------------------
loc_04d4fe:
	tst.b ($35,a6)
	beq.b loc_04d516
	addq.b #2,(7,a6)
	moveq #$18,d0
	tst.b ($b,a6)
	bne.b loc_04d512
	neg.w d0

loc_04d512:
	add.w d0,($10,a6)

loc_04d516:
	jmp loc_02a7ea

;----------------------------------------------
loc_04d51c:
	tst.b ($33,a6)
	bpl.b loc_04d516
	jmp loc_02baf2

;==============================================
;Kicks
;==============================================
loc_04d528:
	move.b (7,a6),d0
	move.w loc_04d534(pc,d0.w),d1
	jmp loc_04d534(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d534:
	dc.w loc_04d53a-loc_04d534
	dc.w loc_04d5ae-loc_04d534
	dc.w loc_04d5b4-loc_04d534

;----------------------------------------------
loc_04d53a:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	moveq #0,d1
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b d1,d0
	tst.b ($125,a6)
	bne.b loc_04d57c
	cmpi.b #1,($132,a6)
	bne.b loc_04d57c
	btst.b #0,($83,a6)
	bne.b loc_04d58a
	bra.b loc_04d588

loc_04d57c:
	move.w loc_04d5a8(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_04d58a

loc_04d588:
	addq.b #1,d0

loc_04d58a:
	cmpi.b #2,($82,a6)
	bne.b loc_04d5a2
	btst.b #1,($83,a6)
	beq.b loc_04d5a2
	move.b #4,(7,a6)
	moveq #$1e,d0
 
loc_04d5a2:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d5a8:
	dc.w $0020,$0040,$0058

;----------------------------------------------
loc_04d5ae:
	jmp loc_02f5ac

;----------------------------------------------
loc_04d5b4:
	tst.b ($33,a6)
	bmi.b loc_04d5d4
	tst.b ($35,a6)
	beq.b loc_04d5ce
	moveq #2,d0
	tst.b ($b,a6)
	bne.b loc_04d5ca
	neg.w d0

loc_04d5ca:
	add.w d0,($10,a6)

loc_04d5ce:
	jmp loc_02a7ea

loc_04d5d4:
	jmp loc_02baf2

;==============================================
;Crouching
;==============================================
loc_04d5da:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_04d5ec(pc,d0.w),d1
	jmp loc_04d5ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d5ec:
	dc.w loc_04d5f0-loc_04d5ec
	dc.w loc_04d620-loc_04d5ec

;----------------------------------------------
loc_04d5f0:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_04d616
	addq.b #3,d1

loc_04d616:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_04d620:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_04d626:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_04d650
	moveq #$18,d0

loc_04d650:
	tst.b ($81,a6)
	beq.b loc_04d658
	addq.w #3,d0

loc_04d658:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################
;Special Move Inputs
;##############################################
loc_04d668:
	jsr loc_02e096
	bne.w loc_04d72a

loc_04d672:
	lea.l ($198,a6),a4
	jsr loc_02d6ba
	bne.w loc_04d8a2

loc_04d680:
	lea.l ($1a0,a6),a4
	jsr loc_02d69a
	bne.w loc_04d8e6

loc_04d68e:
	lea.l ($1a8,a6),a4
	jsr loc_02d6b2
	bne.w loc_04d924

loc_04d69c:
	lea.l ($188,a6),a4
	jsr loc_02d61a
	bne.w loc_04d814

loc_04d6aa:
	lea.l ($1b0,a6),a4
	jsr loc_02d622
	bne.w loc_04d994

loc_04d6b8:
	lea.l ($180,a6),a4
	jsr loc_02d5ea
	bne.w loc_04d6ee

loc_04d6c6:
	lea.l ($190,a6),a4
	jsr loc_02d612
	bne.w loc_04d83e

loc_04d6d4:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_04d78e

loc_04d6e2:
	jsr loc_02e0cc
	bne.w loc_04d960

loc_04d6ec:
	rts

;Move ID writes
loc_04d6ee:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_04d6fc
	tst.b ($238,a6)
	bne.b loc_04d6c6
	bra.b loc_04d704

loc_04d6fc:
	cmpi.b #2,($238,a6)
	bcc.b loc_04d6c6

loc_04d704:
	jsr loc_02ed00
	beq.b loc_04d6c6
	move.l #$02000e00,(4,a6)
	clr.b ($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

loc_04d72a:
	tst.b ($28a,a6)
	bne.w loc_04d672
	tst.b ($31,a6)
	bne.w loc_04d768
	jsr loc_02ef54
	beq.w loc_04d672
	jsr loc_02ecd8
	beq.w loc_04d672
	move.l #$02001000,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_04d768:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04d672
	jsr loc_02ed28
	beq.w loc_04d672
	move.l #$02001000,(4,a6)
	move.b #2,($aa,a6)
	jmp loc_02f980

loc_04d78e:
	jsr loc_02edf8
	beq.w loc_04d6e2

;##############################################
;A-ism Alpha Counter
;##############################################
loc_04d798:
	tst.b ($132,a6)
	bne.w loc_04d7da
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #$1c,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$18,($5f,a4)
	moveq #$19,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter
;##############################################
loc_04d7da:
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #$20,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$1c,($5f,a4)
	moveq #$19,d0
	jmp loc_02a758

loc_04d814:
	jsr loc_02ed00
	beq.w loc_04d6aa
	move.l #$02000e00,(4,a6)
	move.b #8,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

loc_04d83e:
	tst.b ($31,a6)
	beq.b loc_04d878
	move.w ($64,a6),d1
	addi.w #$28,d1
	cmp.w ($14,a6),d1
	bhi.w loc_04d6d4
	jsr loc_02ed28
	beq.w loc_04d6d4
	move.b #$16,($aa,a6)
	move.l #$02000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

loc_04d878:
	jsr loc_02ed00
	beq.w loc_04d6d4
	move.b #$a,($aa,a6)
	move.l #$02000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

loc_04d8a2:
	tst.b ($132,a6)
	bne.w loc_04d680
	tst.w ($a4,a6)
	bne.w loc_04d680
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04d680
	jsr loc_02ecd8
	beq.w loc_04d680
	move.l #$02001000,(4,a6)
	move.b #$c,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

loc_04d8e6:
	cmpi.b #1,($132,a6)
	beq.w loc_04d68e
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04d68e
	jsr loc_02ecd8
	beq.w loc_04d68e
	move.l #$02001000,(4,a6)
	move.b #$e,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

loc_04d924:
	tst.b ($132,a6)
	bne.w loc_04d69c
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04d69c
	jsr loc_02ecd8
	beq.w loc_04d69c
	move.l #$02001000,(4,a6)
	move.b #$10,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

loc_04d960:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_04d96e
	tst.b (pl_taunt_count,a6)
	beq.w loc_04d6ec

loc_04d96e:
	jsr loc_02ed00
	beq.w loc_04d6ec
	move.l #$02000e00,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	rts

loc_04d994:
	cmpi.b #$ff,($132,a6)
	beq.w loc_04d6b8
	jsr loc_02ed00
	beq.w loc_04d6b8
	move.l #$02000e00,(4,a6)
	move.b #$14,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;##############################################
;AI move check
;##############################################
loc_04d9c8:
	move.b ($aa,a6),d0
	move.w loc_04d9d4(pc,d0.w),d1
	jmp loc_04d9d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04d9d4:
	dc.w loc_04d9ec-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04d9f8-loc_04d9d4
	dc.w loc_04da0e-loc_04d9d4

	dc.w loc_04da1c-loc_04d9d4
	dc.w loc_04da32-loc_04d9d4
	dc.w loc_04d9f4-loc_04d9d4
	dc.w loc_04da3e-loc_04d9d4

;==============================================
loc_04d9ec:
	tst.b ($238,a6)
	bne.w loc_04da4e

;==============================================
loc_04d9f4:
	bra.w loc_04da4a

;==============================================
loc_04d9f8:
	tst.b ($132,a6)
	bne.w loc_04da4e
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04da4e
	bra.w loc_04da4a

;==============================================
loc_04da0e:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04da4e
	bra.w loc_04da4a

;==============================================
loc_04da1c:
	tst.b ($132,a6)
	bne.w loc_04da4e
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04da4e
	bra.w loc_04da4a

;==============================================
loc_04da32:
	tst.b (pl_taunt_count,a6)
	beq.w loc_04da4e
	bra.w loc_04da4a

;==============================================
loc_04da3e:
	tst.b ($31,a6)
	beq.w loc_04da4e
	bra.w loc_04da4a

;----------------------------------------------
loc_04da4a:
	moveq #1,d0
	rts

;----------------------------------------------
loc_04da4e:
	moveq #0,d0
	rts

;##############################################
;AI Special Moves
;##############################################
loc_04da52:
	move.b ($aa,a6),d0
	move.w loc_04da5e(pc,d0.w),d1
	jmp loc_04da5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04da5e:
	dc.w loc_04db28-loc_04da5e
	dc.w loc_04dd4e-loc_04da5e
	dc.w loc_04ddd0-loc_04da5e
	dc.w loc_04de96-loc_04da5e
	dc.w loc_04dedc-loc_04da5e
	dc.w loc_04e038-loc_04da5e
	dc.w loc_04e162-loc_04da5e
	dc.w loc_04e2b8-loc_04da5e

	dc.w loc_04e4c0-loc_04da5e
	dc.w loc_04e5ce-loc_04da5e
	dc.w loc_04e60c-loc_04da5e
	dc.w loc_04e8c6-loc_04da5e

;##############################################
;Player Special moves
;##############################################
loc_04da76:
	move.b ($aa,a6),d0
	move.w loc_04da82(pc,d0.w),d1
	jmp loc_04da82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04da82:
	dc.w loc_04da9a-loc_04da82
	dc.w loc_04dd4e-loc_04da82
	dc.w loc_04ddd0-loc_04da82
	dc.w loc_04de96-loc_04da82
	dc.w loc_04dedc-loc_04da82
	dc.w loc_04e038-loc_04da82
	dc.w loc_04e162-loc_04da82
	dc.w loc_04e2b8-loc_04da82

	dc.w loc_04e4c0-loc_04da82
	dc.w loc_04e5ce-loc_04da82
	dc.w loc_04e60c-loc_04da82
	dc.w loc_04e8c6-loc_04da82

;==============================================
;AI Fireball
;==============================================
loc_04da9a:
	move.b (7,a6),d0
	move.w loc_04daa6(pc,d0.w),d1
	jmp loc_04daa6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04daa6:
	dc.w loc_04db3c-loc_04daa6
	dc.w loc_04daae-loc_04daa6
	dc.w loc_04dbe8-loc_04daa6
	dc.w loc_04dd2a-loc_04daa6

;----------------------------------------------
loc_04daae:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_04db16
	tst.b ($1fe,a6)
	beq.b loc_04daf0
	clr.b ($1fe,a6)
	cmpi.b #2,($1ff,a6)
	beq.b loc_04daf0
	addq.b #1,($1ff,a6)
	subq.b #1,($82,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	move.b ($1ff,a6),d1
	move.b loc_04db24(pc,d1.w),d1
	moveq #$f,d0
	add.b d1,d0
	jmp loc_02a758

loc_04daf0:
	addq.b #2,(7,a6)
	moveq #0,d1
	move.b ($1ff,a6),d1
	move.b loc_04db24(pc,d1.w),d1
	move.b d1,d2
	add.b d2,d2
	move.b d2,($82,a6)
	move.b #1,($216,a6)
	moveq #$12,d0
	add.b d1,d0
	jmp loc_02a758

loc_04db16:
	tst.b ($82,a6)
	beq.b loc_04db22
	move.b #1,($1fe,a6)

loc_04db22:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04db24:
	dc.b $00,$01,$02,$00

;==============================================
;Player Fireball
;==============================================
loc_04db28:
	move.b (7,a6),d0
	move.w loc_04db34(pc,d0.w),d1
	jmp loc_04db34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04db34:
	dc.w loc_04db3c-loc_04db34
	dc.w loc_04db60-loc_04db34
	dc.w loc_04dbe8-loc_04db34
	dc.w loc_04dd2a-loc_04db34

;----------------------------------------------
loc_04db3c:
	addq.b #2,($7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.w ($1fe,a6)
	moveq #$e,d0
	jmp loc_02a758

;----------------------------------------------
loc_04db60:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_04dbc4
	tst.b ($1fe,a6)
	beq.b loc_04db9e
	clr.b ($1fe,a6)
	cmpi.b #2,($1ff,a6)
	beq.b loc_04db9e
	addq.b #1,($1ff,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	move.b ($1ff,a6),d1
	move.b loc_04dbe4(pc,d1.w),d1
	moveq #$f,d0
	add.b d1,d0
	jmp loc_02a758

loc_04db9e:
	addq.b #2,(7,a6)
	moveq #0,d1
	move.b ($1ff,a6),d1
	move.b loc_04dbe4(pc,d1.w),d1
	move.b d1,d2
	add.b d2,d2
	move.b d2,($82,a6)
	move.b #1,($216,a6)
	moveq #$12,d0
	add.b d1,d0
	jmp loc_02a758

loc_04dbc4:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_04dbde(pc,d1.w),d1
	move.w ($378,a6),d0
	and.w d1,d0
	beq.b loc_04dbdc
	move.b #1,($1fe,a6)

loc_04dbdc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dbde:
	dc.w $0100,$0200,$0400

loc_04dbe4:
	dc.b $00,$01,$02,$00

;----------------------------------------------
loc_04dbe8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_04dd06
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	moveq #$17,d0
	tst.b ($82,a6)
	beq.b loc_04dc0a
	moveq #$18,d0

loc_04dc0a:
	jsr loc_0038e4
	jsr loc_01c1c8
	beq.w loc_04dd06
	addq.b #1,(a4)
	move.w #$d00,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_04dd08
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_04dd06
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_04dd06
	jsr loc_01c1c8
	beq.b loc_04dd06
	addq.b #1,(a4)
	move.w #$d00,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_04dd08

loc_04dd06:
	rts

;==============================================
loc_04dd08:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_04dd24(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dd24:
	dc.w $000a,$000e,$0012

;----------------------------------------------
loc_04dd2a:
	tst.b ($33,a6)
	bmi.w loc_04ee2e
	tst.b ($3a,a6)
	beq.b loc_04dd42
	subq.b #1,($3a,a6)
	bne.b loc_04dd48
	clr.b ($ce,a6)

loc_04dd42:
	jsr loc_02f6f8

loc_04dd48:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04dd4e:
	move.b (7,a6),d0
	move.w loc_04dd5a(pc,d0.w),d1
	jmp loc_04dd5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dd5a:
	dc.w loc_04dd60-loc_04dd5a
	dc.w loc_04dd80-loc_04dd5a
	dc.w loc_04ddb4-loc_04dd5a

;----------------------------------------------
loc_04dd60:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_04dd7a
	moveq #$2f,d0

loc_04dd7a:
	jmp loc_02a708

;----------------------------------------------
loc_04dd80:
	tst.b ($34,a6)
	beq.b loc_04ddae
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_04dda4
	moveq #-5,d0
	moveq #$44,d1

loc_04dda4:
	jsr loc_097cd6
	bsr.w loc_04efbe

loc_04ddae:
	jmp loc_02a7ea

;----------------------------------------------
loc_04ddb4:
	subq.b #1,($3a,a6)
	bne.w loc_04ee3a
	tst.b ($31,a6)
	beq.b loc_04ddca
	move.l #$2000602,(4,a6)

loc_04ddca:
	jmp loc_02f796

;==============================================
;
;==============================================
loc_04ddd0:
	move.b (7,a6),d0
	move.w loc_04dddc(pc,d0.w),d1
	jmp loc_04dddc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dddc:
	dc.w loc_04dde4-loc_04dddc
	dc.w loc_04de0c-loc_04dddc
	dc.w loc_04de3c-loc_04dddc
	dc.w loc_04de7e-loc_04dddc

;----------------------------------------------
loc_04dde4:
	tst.b ($33,a6)
	bpl.b loc_04ddf6
	addq.b #2,(7,a6)
	moveq #$1a,d0
	jmp loc_02a758

loc_04ddf6:
	tst.b ($35,a6)
	beq.b loc_04de06
	clr.b ($35,a6)
	jsr loc_080e8e

loc_04de06:
	jmp loc_02a7ea

;----------------------------------------------
loc_04de0c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04de3a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$18000,($40,a6)
	move.l #$78000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_04de3a:
	rts

;----------------------------------------------
loc_04de3c:
	bsr.w loc_04e018
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_04de68
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$d,d0
	jmp loc_02a758

loc_04de68:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04de74
	neg.l d0

loc_04de74:
	add.l d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04de7e:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04de96:
	move.b (7,a6),d0
	move.w loc_04dea2(pc,d0.w),d1
	jmp loc_04dea2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dea2:
	dc.w loc_04dea6-loc_04dea2
	dc.w loc_04dece-loc_04dea2

;----------------------------------------------
loc_04dea6:
	tst.b ($33,a6)
	bpl.b loc_04deb8
	addq.b #2,(7,a6)
	moveq #$1b,d0
	jmp loc_02a758

loc_04deb8:
	tst.b ($35,a6)
	beq.b loc_04dec8
	clr.b ($35,a6)
	jsr loc_080e8e

loc_04dec8:
	jmp loc_02a7ea

;----------------------------------------------
loc_04dece:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04dedc:
	move.b (7,a6),d0
	move.w loc_04dee8(pc,d0.w),d1
	jmp loc_04dee8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04dee8:
	dc.w loc_04def0-loc_04dee8
	dc.w loc_04df2a-loc_04dee8
	dc.w loc_04dfa6-loc_04dee8
	dc.w loc_04dff6-loc_04dee8

;----------------------------------------------
loc_04def0:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$60000,d0
	tst.b ($b,a6)
	bne.b loc_04df16
	neg.l d0

loc_04df16:
	move.l d0,($40,a6)
	moveq #$a,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04df2a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_04df6c
	beq.b loc_04df74
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04df76(pc,d0.w),($40,a6)
	move.l loc_04df76+4(pc,d0.w),($44,a6)
	bra.b loc_04df74

loc_04df6c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_04df74:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04df76:
	dc.l $00018000,$00050000
	dc.l $00018000,$00060000
	dc.l $00018000,$00078000

loc_04df8e:
	dc.l $00008000,$00048000
	dc.l $00010000,$00050000
	dc.l $00018000,$00078000

;----------------------------------------------
loc_04dfa6:
	bsr.w loc_04e018
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04dfd2
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04dfc0
	neg.l d0

loc_04dfc0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04dfd2:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #$d,d0
	jmp loc_02a758

;----------------------------------------------
loc_04dff6:
	tst.b ($33,a6)
	bpl.b loc_04e00c
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_04e00c:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_04e018:
	tst.b ($44,a6)
	bpl.b loc_04e026
	move.l #$ffffb000,($4c,a6)

loc_04e026:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
;
;==============================================
loc_04e038:
	move.b (7,a6),d0
	move.w loc_04e044(pc,d0.w),d1
	jmp loc_04e044(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e044:
	dc.w loc_04e04c-loc_04e044
	dc.w loc_04e07e-loc_04e044
	dc.w loc_04e0e4-loc_04e044
	dc.w loc_04e140-loc_04e044

;----------------------------------------------
loc_04e04c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b (pl_crouching,a6)
	moveq #$15,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e07e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04e0b2
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_04e0b4(pc,d0.w),($40,a6)
	move.l loc_04e0b4+4(pc,d0.w),($44,a6)
	move.l loc_04e0b4+8(pc,d0.w),($48,a6)
	move.l loc_04e0b4+$c(pc,d0.w),($4c,a6)

loc_04e0b2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e0b4:
	dc.l $00038000,$00028000,$00000000,$ffffa000
	dc.l $00038000,$00048000,$00000000,$ffffa000
	dc.l $00038000,$0006a000,$00000000,$ffffa000

;----------------------------------------------
loc_04e0e4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04e11c
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04e10a
	neg.l d0

loc_04e10a:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04e11c:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e140:
	tst.b ($33,a6)
	bpl.b loc_04e156
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_04e156:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04e162:
	move.b (7,a6),d0
	move.w loc_04e16e(pc,d0.w),d1
	jmp loc_04e16e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e16e:
	dc.w loc_04e178-loc_04e16e
	dc.w loc_04e19c-loc_04e16e
	dc.w loc_04e1cc-loc_04e16e
	dc.w loc_04e1fc-loc_04e16e
	dc.w loc_04e2a8-loc_04e16e

;----------------------------------------------
loc_04e178:
	addq.b #2,(7,a6)
	move.b #$32,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e19c:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_04e1c6
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04e1b8
	moveq #1,d0

loc_04e1b8:
	move.b d0,($ab,a6)
	moveq #$11,d0
	moveq #$40,d1
	jsr loc_082e36

loc_04e1c6:
	jmp loc_02a7ea

;----------------------------------------------
loc_04e1cc:
	subq.b #1,($3a,a6)
	bpl.w loc_04ee3a
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_04e1ea
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04e1ea:
	move.b loc_04e1f8(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #$1d,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e1f8:
	dc.b $02,$04,$06,00

;----------------------------------------------
loc_04e1fc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04e284
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_04e284
	addq.b #1,(a4)
	move.w #$d02,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($59,a6),($59,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	addq.b #6,($72,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	lsr.b #1,d0
	addq.b #2,d0
	move.w d0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_04e286

loc_04e284:
	rts

;==============================================
loc_04e286:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_04e2a2(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e2a2:
	dc.w $000b,$000d,$000f

;----------------------------------------------
loc_04e2a8:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04e2b8:
	move.b (7,a6),d0
	move.w loc_04e2c2(pc,d0.w),d1
	jmp loc_04e2c2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e2c2:
	dc.w loc_04e2d0-loc_04e2c2
	dc.w loc_04e30e-loc_04e2c2
	dc.w loc_04e33c-loc_04e2c2
	dc.w loc_04e3fc-loc_04e2c2
	dc.w loc_04e44c-loc_04e2c2
	dc.w loc_04e468-loc_04e2c2
	dc.w loc_04e4aa-loc_04e2c2

;----------------------------------------------
loc_04e2d0:
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
	addi.b #$1e,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e30e:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_04e336
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04e328
	moveq #1,d0

loc_04e328:
	move.b d0,($ab,a6)
	moveq #$f,d0
	moveq #$44,d1
	jsr loc_082e36

loc_04e336:
	jmp loc_02a7ea

;----------------------------------------------
loc_04e33c:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_04e390
	addq.b #2,(7,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04e378(pc,d0.w),($40,a6)
	move.l loc_04e378+4(pc,d0.w),($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e378:
	dc.l $00080000,$00080000
	dc.l $00090000,$00090000
	dc.l $000a0000,$000a0000

;==============================================
loc_04e390:
	cmpi.b #2,($35,a6)
	bne.b loc_04e3ac
	clr.b ($35,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)

loc_04e3ac:
	tst.b ($35,a6)
	bne.b loc_04e3f6
	tst.b ($ab,a6)
	beq.b loc_04e3d4
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04e3ce
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04e3ce:
	move.b loc_04e3f8(pc,d0.w),(pl_invinciblity_timer,a6)

loc_04e3d4:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04e3e0
	neg.l d0

loc_04e3e0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_04e3f6
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_04e3f6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e3f8:
	dc.b $05,$0e,$15,00

;----------------------------------------------
loc_04e3fc:
	move.b #2,($23f,a6)
	tst.w ($40,a6)
	bmi.b loc_04e442
	tst.b ($35,a6)
	bne.b loc_04e424
	move.b #1,($31,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)

loc_04e424:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04e430
	neg.l d0

loc_04e430:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04e442:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04e44c:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_04e462
	addq.b #2,(7,a6)

loc_04e462:
	jmp loc_02a7ea

;----------------------------------------------
loc_04e468:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04e48a
	tst.b ($35,a6)
	beq.b loc_04e4a4
	rts

loc_04e48a:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_00369c

loc_04e4a4:
	jmp loc_02a7ea

;----------------------------------------------
loc_04e4aa:
	tst.b ($33,a6)
	bpl.b loc_04e4a4
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04e4c0:
	move.b (7,a6),d0
	move.w loc_04e4cc(pc,d0.w),d1
	jmp loc_04e4cc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e4cc:
	dc.w loc_04e4d6-loc_04e4cc
	dc.w loc_04e508-loc_04e4cc
	dc.w loc_04e532-loc_04e4cc
	dc.w loc_04e574-loc_04e4cc
	dc.w loc_04e594-loc_04e4cc

;----------------------------------------------
loc_04e4d6:
	addq.b #2,(7,a6)
	move.b #1,(pl_crouching,a6)
	move.b #1,($ed,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b ($82,a6),d1
	lsr.b #1,d1
	moveq #$21,d0
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e508:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04e530
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04e522
	moveq #1,d0

loc_04e522:
	move.b d0,($ab,a6)
	moveq #-$1a,d0
	moveq #$44,d1
	jmp loc_082e36

loc_04e530:
	rts

;----------------------------------------------
loc_04e532:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_04e56e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04e558
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04e558:
	move.b loc_04e570(pc,d0.w),(pl_invinciblity_timer,a6)
	move.l #$30000,($40,a6)
	move.l #0,($48,a6)

loc_04e56e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e570:
	dc.b $04,$08,$0c,00

;----------------------------------------------
loc_04e574:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04e590
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	move.l #$ffffc000,($48,a6)

loc_04e590:
	bra.w loc_04e5b2

;----------------------------------------------
loc_04e594:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.w loc_04e5b2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_04e5b2:
	move.l ($40,a6),d0
	bmi.b loc_04e5cc
	tst.b ($b,a6)
	bne.b loc_04e5c0
	neg.l d0

loc_04e5c0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_04e5cc:
	rts

;==============================================
;
;==============================================
loc_04e5ce:
	move.b (7,a6),d0
	move.w loc_04e5da(pc,d0.w),d1
	jmp loc_04e5da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e5da:
	dc.w loc_04e5de-loc_04e5da
	dc.w loc_04e5fe-loc_04e5da

;----------------------------------------------
loc_04e5de:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_04e5f2
	subq.b #1,(pl_taunt_count,a6)

loc_04e5f2:
	clr.b (pl_crouching,a6)
	moveq #9,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e5fe:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04e60c:
	move.b (7,a6),d0
	move.w loc_04e618(pc,d0.w),d1
	jmp loc_04e618(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e618:
	dc.w loc_04e62a-loc_04e618
	dc.w loc_04e65c-loc_04e618
	dc.w loc_04e6c0-loc_04e618
	dc.w loc_04e724-loc_04e618
	dc.w loc_04e742-loc_04e618
	dc.w loc_04e7b2-loc_04e618
	dc.w loc_04e804-loc_04e618
	dc.w loc_04e826-loc_04e618

	dc.w loc_04e84a-loc_04e618

;----------------------------------------------
loc_04e62a:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($1fb,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #3,($3b,a6)
	moveq #$24,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e65c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04e6a2
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($3a,a6)
	clr.b ($5b,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04e6a4(pc,d0.w),($40,a6)
	move.l loc_04e6a4+4(pc,d0.w),($44,a6)

loc_04e6a2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e6a4:
	dc.l $00018000,$00060000
	dc.l $00020000,$00070000
	dc.l $00028000,$00080000

loc_04e6bc:
	dc.b $0f,$0d,$0c,$0c

;----------------------------------------------
loc_04e6c0:
	tst.b ($3b,a6)
	beq.b loc_04e6ee
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.b loc_04e6ee
	st.b ($1fb,a6)
	subq.b #1,($3b,a6)
	move.b #8,(7,a6)
	moveq #0,d0
	move.b ($3b,a6),d0
	move.b loc_04e6bc(pc,d0.w),d0
	jsr loc_0038e4

loc_04e6ee:
	bsr.w loc_04e8a6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_04e7ca
	bra.w loc_04e88c

;==============================================
loc_04e702:
	move.b #6,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$27,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e724:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_04e740
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_04e740:
	rts

;----------------------------------------------
loc_04e742:
	jsr loc_02a7ea
	tst.b ($5b,a6)
	bne.b loc_04e796
	movea.l ($1c,a6),a0
	tst.b ($9,a0)
	beq.b loc_04e782
	jsr loc_024fce
	beq.b loc_04e782
	moveq #$6d,d0
	jsr loc_080b70
	move.b #$10,(7,a6)
	st.b ($1fc,a6)
	move.l #$48000,($44,a6)
	addi.l #$20000,($40,a6)

loc_04e782:
	bsr.w loc_04e8a6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_04e7ca
	bra.w loc_04e88c

loc_04e796:
	move.b #$10,(7,a6)
	clr.b ($1fc,a6)
	move.l #$58000,($44,a6)
	addi.l #$20000,($40,a6)
	bra.b loc_04e782

;----------------------------------------------
loc_04e7b2:
	jsr loc_02a7ea
	bsr.w loc_04e8a6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_04e7ca
	bra.w loc_04e88c

loc_04e7ca:
	tst.b ($1fb,a6)
	bne.w loc_04e702
	move.b #$c,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	eori.b #1,($b,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$2000,($48,a6)
	moveq #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e804:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_04e822
	bsr.w loc_04e88c
	bmi.b loc_04e822
	addq.b #2,(7,a6)
	moveq #$2a,d0
	jmp loc_02a758

loc_04e822:
	bra.w loc_04d444

;----------------------------------------------
loc_04e826:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_04e848
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	eori.b #1,($b,a6)
	jmp loc_02baf2

loc_04e848:
	rts

;----------------------------------------------
loc_04e84a:
	jsr loc_02a7ea
	bsr.w loc_04e8a6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_04e7ca
	bsr.w loc_04e88c
	tst.l ($44,a6)
	bpl.b loc_04e88a
	tst.b ($3b,a6)
	beq.b loc_04e88a
	move.b #4,(7,a6)
	clr.b ($5b,a6)
	moveq #$2b,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

loc_04e88a:
	rts

;==============================================
loc_04e88c:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04e898
	neg.l d0

loc_04e898:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_04e8a6:
	tst.b ($44,a6)
	bpl.b loc_04e8b4
	move.l #$ffffb000,($4c,a6)

loc_04e8b4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
;
;==============================================
loc_04e8c6:
	move.b (7,a6),d0
	move.w loc_04e8d2(pc,d0.w),d1
	jmp loc_04e8d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e8d2:
	dc.w loc_04e8d8-loc_04e8d2
	dc.w loc_04e956-loc_04e8d2
	dc.w loc_04e99e-loc_04e8d2

;----------------------------------------------
loc_04e8d8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b (pl_crouching,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04e93e(pc,d0.w),d1
	move.l loc_04e93e+4(pc,d0.w),($4c,a6)
	tst.b ($3c,a6)
	bpl.b loc_04e916
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)

loc_04e916:
	tst.b ($b,a6)
	bne.b loc_04e92a
	neg.l d1
	tst.w ($40,a6)
	beq.b loc_04e932
	bmi.b loc_04e932
	neg.l d1
	bra.b loc_04e932

loc_04e92a:
	tst.w ($40,a6)
	bpl.b loc_04e932
	neg.l d1

loc_04e932:
	add.l d1,($40,a6)
	moveq #$2f,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e93e:
	dc.l $0000c000,$ffffd800
	dc.l $00014000,$ffffd800
	dc.l $0001c000,$ffffd800

;----------------------------------------------
loc_04e956:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_04e99e:
	tst.b ($33,a6)
	bpl.b loc_04e9b4
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2
 
loc_04e9b4:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_04e9c0:
	tst.b ($34,a6)
	beq.b loc_04e9cc
	jmp loc_02fa36

loc_04e9cc:
	jmp loc_02f9be

;##############################################
;Throws
;##############################################
loc_04e9d2:
	cmpi.b #4,($80,a6)
	beq.w loc_04ed10
	tst.b ($81,a6)
	bne.w loc_04ebd6
	move.b (7,a6),d0
	move.w loc_04e9f2(pc,d0.w),d1
	jsr loc_04e9f2(pc,d1.w)
	bra.b loc_04e9c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04e9f2:
	dc.w loc_04ea04-loc_04e9f2
	dc.w loc_04ea1e-loc_04e9f2
	dc.w loc_04ea60-loc_04e9f2
	dc.w loc_04eafa-loc_04e9f2
	dc.w loc_04eb16-loc_04e9f2
	dc.w loc_04eb58-loc_04e9f2
	dc.w loc_04eb84-loc_04e9f2
	dc.w loc_04eb98-loc_04e9f2

	dc.w loc_04ebc8-loc_04e9f2

;----------------------------------------------
loc_04ea04:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ea1e:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	moveq #1,d0
	jsr loc_02e3fe
	beq.b loc_04ea52
	addq.b #2,(7,a6)
	move.w #$b4,($ae,a6)
	clr.w ($3a,a6)
	clr.b ($1fd,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #2,d0
	jmp loc_02a758

loc_04ea52:
	move.b #$10,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ea60:
	jsr loc_02ea06
	jsr loc_02a7ea
	movea.w ($38,a6),a4
	tst.b ($35,a6)
	beq.b loc_04ea9a
	clr.b ($35,a6)
	move.b #1,($31,a6)
	moveq #3,d0
	tst.b ($1fd,a6)
	bne.b loc_04ea8e
	st.b ($1fd,a6)
	moveq #2,d0

loc_04ea8e:
	jsr loc_02e970
	bne.b loc_04eac0
	addq.b #1,($3a,a6)

loc_04ea9a:
	tst.b ($3a,a6)
	beq.b loc_04eabe
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_04eac0
	jsr loc_02ea7a
	beq.b loc_04eabe
	addq.b #2,(7,a6)
	moveq #3,d0
	jmp loc_02a758

loc_04eabe:
	rts

loc_04eac0:
	move.b #$e,(7,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$40000,d0
	eori.b #1,($b,a6)
	beq.b loc_04eae6
	neg.l d0

loc_04eae6:
	move.l d0,($40,a6)
	moveq #4,d0
	jsr loc_02e7f2
	moveq #$14,d0
	jmp loc_02a708

;----------------------------------------------
loc_04eafa:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	addq.b #2,(7,a6)
	moveq #$6c,d0
	jsr loc_080b70
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_04eb16:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04eb56
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #1,d0
	jsr loc_02e7f2
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_04eb56
	clr.b ($23a,a4)
	moveq #$e,d0
	jmp loc_0038e4

loc_04eb56:
	rts

;----------------------------------------------
loc_04eb58:
	bsr.w loc_04ee14
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_04eb84:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	eori.b #1,($b,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_04eb98:
	bsr.w loc_04ee14
	tst.w ($44,a6)
	bpl.b loc_04ebbc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_04ebbc
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jmp loc_02baf2

loc_04ebbc:
	jsr loc_02a7ea
	jmp loc_02a7ea

;----------------------------------------------
loc_04ebc8:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04ebd6:
	move.b (7,a6),d0
	move.w loc_04ebe6(pc,d0.w),d1
	jsr loc_04ebe6(pc,d1.w)
	bra.w loc_04e9c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ebe6:
	dc.w loc_04ebf2-loc_04ebe6
	dc.w loc_04ec0c-loc_04ebe6
	dc.w loc_04ec62-loc_04ebe6
	dc.w loc_04ecb0-loc_04ebe6
	dc.w loc_04ecd8-loc_04ebe6
	dc.w loc_04ed04-loc_04ebe6

;----------------------------------------------
loc_04ebf2:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ec0c:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	moveq #5,d0
	jsr loc_02e3fe
	beq.b loc_04ec54
	tst.b ($125,a6)
	beq.b loc_04ec2e
	jsr loc_03a0e4
	bcs.b loc_04ec44
	bra.b loc_04ec48

loc_04ec2e:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_04ec48
	clr.b ($b,a6)
	btst.b #1,($11b,a6)
	bne.b loc_04ec48

loc_04ec44:
	addq.b #1,($b,a6)

loc_04ec48:
	addq.b #2,(7,a6)
	moveq #6,d0
	jmp loc_02a758

loc_04ec54:
	move.b #$a,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ec62:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04ecae
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	moveq #6,d0
	jsr loc_080b70
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$36000,d1
	tst.b ($b,a6)
	beq.b loc_04eca2
	neg.l d1

loc_04eca2:
	move.l d1,($40,a6)
	moveq #5,d0
	jmp loc_02e7f2

loc_04ecae:
	rts

;----------------------------------------------
loc_04ecb0:
	bsr.w loc_04ee14
	tst.w ($44,a6)
	bpl.w loc_04ee3a
	move.w ($64,a6),d0
	addi.w #$50,d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ecd8:
	bsr.w loc_04ee14
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ed04:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	bra.w loc_04ee2e

;==============================================
;
;==============================================
loc_04ed10:
	move.b (7,a6),d0
	move.w loc_04ed20(pc,d0.w),d1
	jsr loc_04ed20(pc,d1.w)
	bra.w loc_04e9c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ed20:
	dc.w loc_04ed2c-loc_04ed20
	dc.w loc_04ed58-loc_04ed20
	dc.w loc_04ed68-loc_04ed20
	dc.w loc_04edb6-loc_04ed20
	dc.w loc_04edde-loc_04ed20
	dc.w loc_04ee0a-loc_04ed20

;----------------------------------------------
loc_04ed2c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1f,d0
	jsr loc_02e636
	beq.b loc_04ed50
	move.b #4,(7,a6)
	moveq #6,d0
	jmp loc_02a758

loc_04ed50:
	moveq #$2e,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ed58:
	jsr loc_02aa08
	bcc.w loc_04ee3a
	jmp loc_02baf2

;----------------------------------------------
loc_04ed68:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04edb4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	moveq #6,d0
	jsr loc_080b70
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$36000,d1
	tst.b ($b,a6)
	beq.b loc_04eda8
	neg.l d1

loc_04eda8:
	move.l d1,($40,a6)
	moveq #$1f,d0
	jmp loc_02e7f2

loc_04edb4:
	rts

;----------------------------------------------
loc_04edb6:
	bsr.w loc_04ee14
	tst.w ($44,a6)
	bpl.w loc_04ee3a
	move.w ($64,a6),d0
	addi.w #$50,d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_04edde:
	bsr.w loc_04ee14
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ee3a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_04ee0a:
	tst.b ($33,a6)
	bpl.w loc_04ee3a
	bra.b loc_04ee2e

;==============================================
loc_04ee14:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_04ee2e:
	jmp loc_02baf2

;==============================================
loc_04ee34:
	jmp loc_02bb26

;==============================================
loc_04ee3a:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_04ee40:
	move.b ($2c4,a6),d0
	move.w loc_04ee4c(pc,d0.w),d1
	jmp loc_04ee4c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ee4c:
	dc.w loc_04ee5a-loc_04ee4c
	dc.w loc_04eed8-loc_04ee4c
	dc.w loc_04ef0a-loc_04ee4c
	dc.w loc_04ef1c-loc_04ee4c
	dc.w loc_04ef0a-loc_04ee4c
	dc.w loc_04ef0a-loc_04ee4c
	dc.w loc_04ef90-loc_04ee4c

;==============================================
loc_04ee5a:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_04ee6c(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ee6c:
	dc.b $02,$04,$06,$08,$0a,$0c,$02,$04,$06,$08,$0a,$0c,$02,$06,$0a,$0c

;----------------------------------------------
loc_04ee7c:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04ee94:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_04ee3a
	tst.b ($11c,a5)
	bne.b loc_04ee3a
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	subq.b #2,d0
	lsr.b #1,d0
	addi.b #$23,d0
	jmp loc_02a708

;==============================================
loc_04eeb8:
	bsr.w loc_04eec2
	jmp loc_02a7ea

;==============================================
loc_04eec2:
	tst.b ($3a,a6)
	beq.b loc_04eed6
	subq.b #1,($3a,a6)
	bne.b loc_04eed6
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04eed6:
	rts

;==============================================
loc_04eed8:
	move.b (7,a6),d0
	move.w loc_04eee4(pc,d0.w),d1
	jmp loc_04eee4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04eee4:;323300
	dc.w loc_04ee7c-loc_04eee4
	dc.w loc_04ee94-loc_04eee4
	dc.w loc_04eeea-loc_04eee4

;----------------------------------------------
loc_04eeea:
	tst.b ($33,a6)
	bpl.b loc_04ef08
	jsr RNGFunction
	andi.b #3,d0
	bne.b loc_04ef00
	moveq #$33,d0
	bra.b loc_04ef02

loc_04ef00:
	moveq #$32,d0

loc_04ef02:
	jsr loc_02a708

loc_04ef08:
	bra.b loc_04eeb8

;==============================================
loc_04ef0a:
	move.b (7,a6),d0
	move.w loc_04ef16(pc,d0.w),d1
	jmp loc_04ef16(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ef16:;323350
	dc.w loc_04ee7c-loc_04ef16
	dc.w loc_04ee94-loc_04ef16
	dc.w loc_04eeb8-loc_04ef16

;==============================================
loc_04ef1c:
	move.b (7,a6),d0
	move.w loc_04ef28(pc,d0.w),d1
	jmp loc_04ef28(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ef28:;323368
	dc.w loc_04ee7c-loc_04ef28
	dc.w loc_04ee94-loc_04ef28
	dc.w loc_04ef2e-loc_04ef28

;----------------------------------------------
loc_04ef2e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04ef8c
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04ef8c
	addq.b #1,(a4)
	move.b #$77,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.l ($18,a6),($18,a4)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	addi.w #$63,($14,a4)
	move.w #$ffc5,d0
	tst.b ($b,a6)
	beq.b loc_04ef88
	neg.w d0

loc_04ef88:
	add.w d0,($10,a4)


loc_04ef8c:
	bra.w loc_04eec2

;==============================================
loc_04ef90:
	move.b (7,a6),d0
	move.w loc_04ef9c(pc,d0.w),d1
	jmp loc_04ef9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04ef9c:;323484
	dc.w loc_04ee7c-loc_04ef9c;-288
	dc.w loc_04efa2-loc_04ef9c
	dc.w loc_04eeb8-loc_04ef9c;-228

;----------------------------------------------
loc_04efa2:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_04ee3a
	tst.b ($11c,a5)
	bne.w loc_04ee3a
	addq.b #2,(7,a6)
	moveq #$34,d0
	jmp loc_02a708

;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;==============================================
loc_04efbe:
	moveq #0,d0
	lea.l ($180,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	lea.l ($300,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	rts

;##############################################
;
;##############################################
loc_04efe2:
	dc.w loc_04f026-loc_04efe2
	dc.w loc_04f026-loc_04efe2
	dc.w loc_04efe8-loc_04efe2

loc_04efe8:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

loc_04f026:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$07,$09,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02