;##############################################
;
;##############################################
loc_04f064:
	jsr loc_01c368
	beq.b loc_04f0a0
	addq.b #1,(a4)
	move.b #$e,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.b ($102,a6),(3,a4)

loc_04f0a0:
	rts

;##############################################
;
;##############################################
loc_04f0a2:
	move.b (6,a6),d0
	move.w loc_04f0ae(pc,d0.w),d1
	jmp loc_04f0ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f0ae:
	dc.w loc_04f0b6-loc_04f0ae
	dc.w loc_04f0ce-loc_04f0ae
	dc.w loc_04f0f4-loc_04f0ae
	dc.w loc_04f13a-loc_04f0ae

;----------------------------------------------
loc_04f0b6:
	addq.b #2,(6,a6)
	move.w ($64,a6),d0
	addi.w #$f0,d0
	move.w d0,($14,a6)
	moveq #$22,d0
	jmp loc_02a708

;----------------------------------------------
loc_04f0ce:
	tst.b ($35,a6)
	bne.b loc_04f0ee
	addq.b #2,(6,a6)
	move.b #1,($31,a6)
	move.l #0,($44,a6)
	move.l #$ffffe000,($4c,a6)

loc_04f0ee:
	jmp loc_02a7ea

;----------------------------------------------
loc_04f0f4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_051aee
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_04f13a:
	tst.b ($33,a6)
	bpl.w loc_051aee
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_04f152:
	move.b (6,a6),d0
	move.w loc_04f15e(pc,d0.w),d1
	jmp loc_04f15e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f15e:
	dc.w loc_04f164-loc_04f15e
	dc.w loc_04f176-loc_04f15e
	dc.w loc_04f1ea-loc_04f15e

;==============================================
loc_04f164:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04f176:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_051aee
	tst.b ($11c,a5)
	bne.w loc_051aee
	addq.b #2,(6,a6)
	clr.b (7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.b loc_04f1ae
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_04f1d4(pc,d0.w),d0
	subq.b #1,d0

loc_04f1ae:
	move.b d0,($2c4,a6)
	move.b ($10d,a5),d1
	or.b ($8a,a5),d1
	beq.b loc_04f1c4
	cmpi.b #1,d0
	bne.b loc_04f1c4
	moveq #5,d0

loc_04f1c4:
	move.b d0,($3c,a6)
	ext.w d0
	move.b loc_04f1e4(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f1d4:
	dc.b $01,$05,$04,$03,$02,$06,$01,$05
	dc.b $04,$03,$02,$06,$01,$02,$02,$02

loc_04f1e4:
	dc.b $23,$24,$25,$26,$27,$30

;==============================================
loc_04f1ea:
	tst.b ($3a,a6)
	beq.b loc_04f1fe
	subq.b #1,($3a,a6)
	bne.b loc_04f1fe
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04f1fe:
	move.b ($3c,a6),d0
	add.w d0,d0
	move.w loc_04f20c(pc,d0.w),d1
	jmp loc_04f20c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f20c:
	dc.w loc_04f218-loc_04f20c
	dc.w loc_04f2ac-loc_04f20c
	dc.w loc_04f218-loc_04f20c
	dc.w loc_04f218-loc_04f20c
	dc.w loc_04f218-loc_04f20c
	dc.w loc_04f432-loc_04f20c

;----------------------------------------------
loc_04f218:
	cmpi.b #1,($35,a6)
	bne.b loc_04f264
	jsr loc_01c2c8
	beq.b loc_04f264
	move.l #$01003b00,(a4)
	move.b #0,($9,a4)
	move.b #0,($e,a4)
	move.w #$f0,($14,a4)
	move.w a6,($36,a4)
	move.b ($34,a6),d0
	andi.w #$f,d0
	lsl.w #2,d0
	move.w loc_04f27c(pc,d0.w),($10,a4)
	move.b loc_04f27c+2(pc,d0.w),($3c,a4)
	move.b loc_04f27c+3(pc,d0.w),(3,a4)
	clr.b ($35,a6)

loc_04f264:
	cmpi.b #2,($35,a6)
	bne.b loc_04f276
	clr.b ($35,a6)
	move.b #$2c,($2a0,a6)

loc_04f276:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f27c:
	dc.w $0028
	dc.b $59,$03

	dc.w $0074
	dc.b $58,$03

	dc.w $00c0
	dc.b $59,$03

	dc.w $010c
	dc.b $58,$03

	dc.w $0158
	dc.b $59,$03

	dc.w $010c
	dc.b $5c,$04

	dc.w $010c
	dc.b $5d,$04

	dc.w $0028
	dc.b $5f,$04

	dc.w $0074
	dc.b $5e,$04

	dc.w $00c0
	dc.b $5f,$04

	dc.w $010c
	dc.b $5e,$04

	dc.w $0158
	dc.b $5f,$04

;==============================================
loc_04f2ac:
	move.b (7,a6),d0
	move.w loc_04f2be(pc,d0.w),d1
	jsr loc_04f2be(pc,d1.w)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f2be:
	dc.w loc_04f2cc-loc_04f2be
	dc.w loc_04f318-loc_04f2be
	dc.w loc_04f330-loc_04f2be
	dc.w loc_04f380-loc_04f2be
	dc.w loc_04f3c8-loc_04f2be
	dc.w loc_04f3fc-loc_04f2be
	dc.w loc_04f42c-loc_04f2be

;----------------------------------------------
loc_04f2cc:
	cmpi.b #1,($35,a6)
	bne.b loc_04f316
	jsr loc_01c2c8
	beq.b loc_04f316
	move.l #$01003b02,(a4)
	move.b #6,($9,a4)
	move.w a6,($36,a4)
	move.w #$ffcd,d0
	move.b (PL_Flip,a6),($b,a4)
	beq.b loc_04f2fa
	neg.w d0

loc_04f2fa:
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a6),d0
	addi.w #$3b,d0
	move.w d0,($14,a4)
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_04f316:
	rts

;----------------------------------------------
loc_04f318:
	cmpi.b #2,($35,a6)
	bne.b loc_04f32e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #$2e,($2a0,a6)
 
loc_04f32e:
	rts

;----------------------------------------------
loc_04f330:
	cmpi.b #3,($35,a6)
	bne.b loc_04f37e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a1
	jsr loc_083c5e
	movea.l a6,a3
	jsr loc_003688
	movea.l a3,a6
	move.l #$5c000,($44,a6)
	move.l #$ffffac00,($4c,a6)
	movea.w ($38,a6),a4
	move.b #1,($31,a4)
	move.b #2,($2a0,a4)
	moveq #$13,d0
	moveq #$4,d1
	jmp loc_02a838

loc_04f37e:
	rts

;----------------------------------------------
loc_04f380:
	movea.w ($38,a6),a4
	bsr.w loc_04f438
	move.w ($14,a4),d0
	cmp.w ($64,a4),d0
	bge.b loc_04f3c2
	addq.b #2,(7,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	move.b d0,($31,a4)
	move.w d0,($16,a4)
	move.w ($64,a4),($14,a4)
	move.b #0,($2a0,a4)
	move.b #4,($3b,a6)
	moveq #$14,d0
	moveq #4,d1
	jmp loc_02a838

loc_04f3c2:
	jmp loc_02a8c6

;----------------------------------------------
loc_04f3c8:
	movea.w ($38,a6),a4
	subq.b #1,($3b,a6)
	bne.b loc_04f3f6
	addq.b #2,(7,a6)
	move.b #1,($31,a4)
	move.l #$28000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$15,d0
	moveq #4,d1
	jmp loc_02a838

loc_04f3f6:
	jmp loc_02a8c6

;----------------------------------------------
loc_04f3fc:

	movea.w ($38,a6),a4
	bsr.w loc_04f438
	move.w ($14,a4),d0
	cmp.w ($64,a4),d0
	bge.b loc_04f3f6
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a4)
	move.w d0,($16,a4)
	move.w ($64,a4),($14,a4)
	moveq #$16,d0
	moveq #4,d1
	jmp loc_02a838

;----------------------------------------------
loc_04f42c:
	jmp loc_02a8c6

;==============================================
loc_04f432:
	jmp loc_02a7ea

;==============================================
loc_04f438:
	move.l ($44,a6),d0
	add.l d0,($14,a4)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;##############################################
;
;##############################################
loc_04f44a:
	move.b (6,a6),d0
	move.w loc_04f456(pc,d0.w),d1
	jmp loc_04f456(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f456:
	dc.w loc_04f45e-loc_04f456
	dc.w loc_04f470-loc_04f456
	dc.w loc_04f480-loc_04f456
	dc.w loc_04f49a-loc_04f456

;==============================================
loc_04f45e:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04f470:
	tst.b ($11c,a5)
	bne.b loc_04f47a
	addq.b #2,(6,a6)

loc_04f47a:
	jmp loc_02a7ea

;==============================================
loc_04f480:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_04f494
	moveq #$29,d0

loc_04f494:
	jmp loc_02a708

;==============================================
loc_04f49a:
	tst.b ($3a,a6)
	beq.b loc_04f4ae
	subq.b #1,($3a,a6)
	bne.b loc_04f4ae
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04f4ae:
	move.b (7,a6),d0
	move.w loc_04f4c0(pc,d0.w),d1
	jsr loc_04f4c0(pc,d1.w)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f4c0:
	dc.w loc_04f4ce-loc_04f4c0
	dc.w loc_04f51a-loc_04f4c0
	dc.w loc_04f532-loc_04f4c0
	dc.w loc_04f580-loc_04f4c0
	dc.w loc_04f5b8-loc_04f4c0
	dc.w loc_04f5e2-loc_04f4c0
	dc.w loc_04f60c-loc_04f4c0

;----------------------------------------------
loc_04f4ce:
	cmpi.b #1,($35,a6)
	bne.b loc_04f518
	jsr loc_01c2c8
	beq.b loc_04f518
	move.l #$01003b07,(a4)
	move.b #6,(9,a4)
	move.w a6,($36,a4)
	move.w #$ffcd,d0
	move.b (PL_Flip,a6),($b,a4)
	beq.b loc_04f4fc
	neg.w d0

loc_04f4fc:
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a6),d0
	addi.w #$3b,d0
	move.w d0,($14,a4)
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_04f518:
	rts

;----------------------------------------------
loc_04f51a:
	cmpi.b #2,($35,a6)
	bne.b loc_04f530
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #$2e,($2a0,a6)

loc_04f530:
	rts

;----------------------------------------------
loc_04f532:
	cmpi.b #3,($35,a6)
	bne.b loc_04f57e
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	movea.l a6,a1
	jsr loc_083c5e
	jsr loc_003688
	move.l #$5c000,($44,a6)
	move.l #$ffffac00,($4c,a6)
	move.b #1,($31,a6)
	move.b #2,($2a0,a6)
	moveq #$13,d0
	jmp loc_02a75e

loc_04f57e:
	rts

;----------------------------------------------
loc_04f580:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.b loc_04f5b6
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b #0,($2a0,a6)
	move.b #4,($3b,a6)
	moveq #$14,d0
	jmp loc_02a75e

loc_04f5b6:
	rts

;----------------------------------------------
loc_04f5b8:
	subq.b #1,($3b,a6)
	bne.b loc_04f5e0
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$28000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$15,d0
	jmp loc_02a75e

loc_04f5e0:
	rts

;----------------------------------------------
loc_04f5e2:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.b loc_04f5e0
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	moveq #$16,d0
	jmp loc_02a75e

;----------------------------------------------
loc_04f60c:
	rts

;##############################################
;Normal Programming
;##############################################
loc_04f60e:
	tst.b ($80,a6)
	bne.w loc_04f744
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_04f698
	move.b (7,a6),d0
	move.w loc_04f62e(pc,d0.w),d1
	jmp loc_04f62e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f62e:
	dc.w loc_04f632-loc_04f62e
	dc.w loc_04f692-loc_04f62e

;----------------------------------------------
loc_04f632:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_04f672
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_04f672
	btst.b #0,($83,a6)
	bne.b loc_04f686
	bra.b loc_04f684

loc_04f672:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_04f68c(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_04f686

loc_04f684:
	addq.b #1,d0

loc_04f686:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f68c:
	dc.w $0030,$0038,$0030

;----------------------------------------------
loc_04f692:
	jmp loc_02f5ac

;==============================================
;Kicks
;==============================================
loc_04f698:
	move.b (7,a6),d0
	move.w loc_04f6a4(pc,d0.w),d1
	jmp loc_04f6a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f6a4:
	dc.w loc_04f6aa-loc_04f6a4
	dc.w loc_04f728-loc_04f6a4
	dc.w loc_04f72e-loc_04f6a4

;----------------------------------------------
loc_04f6aa:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_04f6ea
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_04f6ea
	btst.b #0,($83,a6)
	bne.b loc_04f6fe
	bra.b loc_04f6fc

loc_04f6ea:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_04f722(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_04f6fe

loc_04f6fc:
	addq.b #1,d0

loc_04f6fe:
	cmpi.b #2,($82,a6)
	bne.b loc_04f71c
	btst.b #1,($83,a6)
	beq.b loc_04f71c
	move.b #4,(7,a6)
	move.b #1,($31,a6)
	moveq #$1e,d0

loc_04f71c:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f722:
	dc.w $0030,$0040,$0028

;----------------------------------------------
loc_04f728:
	jmp loc_02f5ac

;----------------------------------------------
loc_04f72e:
	tst.b ($33,a6)
	bmi.b loc_04f73a
	jmp loc_02a7ea

loc_04f73a:
	clr.b ($31,a6)
	jmp loc_02baf2

;==============================================
;Crouching
;==============================================
loc_04f744:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_04f756(pc,d0.w),d1
	jmp loc_04f756(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04f756:
	dc.w loc_04f75c-loc_04f756
	dc.w loc_04f7be-loc_04f756
	dc.w loc_04f7c4-loc_04f756

;----------------------------------------------
loc_04f75c:
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
	beq.b loc_04f7b6
	moveq #$f,d0
	cmpi.b #4,($82,a6)
	bne.b loc_04f7b6
	move.b #4,(7,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff4000,($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_04f7b6
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_04f7b6:
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_04f7be:
	jmp loc_02f5ac

;----------------------------------------------
loc_04f7c4:
	tst.b ($35,a6)
	beq.b loc_04f7da
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_04f7da:
	tst.b ($33,a6)
	bmi.w loc_051ae8
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_04f7e8:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	bsr.w loc_04f838
	bne.w loc_04f85c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_04f820
	moveq #$18,d0

loc_04f820:
	tst.b ($81,a6)
	beq.b loc_04f828
	addq.w #3,d0

loc_04f828:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;==============================================
loc_04f838:
	tst.b (PL_ism_choice,a6)
	bpl.b loc_04f858
	tst.b ($81,a6)
	beq.b loc_04f858
	cmpi.b #2,($82,a6)
	bne.b loc_04f858
	btst.b #2,($83,a6)
	beq.b loc_04f858
	moveq #1,d0
	rts

loc_04f858:
	moveq #0,d0
	rts

;==============================================
loc_04f85c:
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$39,d0
	jmp loc_02a758

;##############################################
;Special Move Inputs
;##############################################
loc_04f876:
	jsr SPButton_Vism_code
	bne.w loc_04fcbe

loc_04f880:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_04fb2a

loc_04f88e:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_214214P_Code
	bne.w loc_04faea

loc_04f89c:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_04fb6c

loc_04f8aa:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_623K_code
	bne.w loc_04f932

loc_04f8b8:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_214K_code
	bne.w loc_04f97c

loc_04f8c6:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_236P_code
	bne.w loc_04fbac

loc_04f8d4:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_214P_code
	bne.w loc_04fbda

loc_04f8e2:
	jsr SPButton_AllP_code
	bne.w loc_04f9aa

loc_04f8ec:
	jsr SPButton_AllK_code
	bne.w loc_04f9d4

loc_04f8f6:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_04f904
	bsr.w loc_04fa30
	bne.w loc_04fa4a

loc_04f904:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_04f918
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_28N_Code
	bne.w loc_04faa0

loc_04f918:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_04fc08

loc_04f926:
	jsr SPButton_Taunt_code
	bne.w loc_04fc80

loc_04f930:
	rts

;----------------------------------------------
;Move ID writes
loc_04f932:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04f944
	tst.b ($238,a6)
	bne.w loc_04f8b8
	bra.b loc_04f94e

loc_04f944:
	cmpi.b #2,($238,a6)
	bcc.w loc_04f8b8

loc_04f94e:
	jsr loc_02ed00
	beq.w loc_04f8b8
	move.b #0,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_04f97c:
	jsr loc_02ed00
	beq.w loc_04f8c6
	move.b #2,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #$1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_04f9aa:
	jsr loc_02ed00
	beq.w loc_04f8ec
	move.b #$1a,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_04f9d4:
	jsr loc_02ed28
	beq.w loc_04f8f6
	tst.b ($31,a6)
	beq.w loc_04f8f6
	tst.w ($44,a6)
	bpl.w loc_04f8f6
	move.w ($64,a6),d0
	addi.w #$20,d0
	cmp.w ($14,a6),d0
	bcs.w loc_04f8f6
	move.b #1,($3c,a6)
	btst.b #1,($371,a6)
	bne.b loc_04fa12
	move.b #$ff,($3c,a6)

loc_04fa12:
	move.b #4,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	clr.b (pl_attk_active,a6)
	rts

;----------------------------------------------
loc_04fa30:
	move.w ($370,a6),d0
	andi.w #4,d0
	beq.b loc_04fa46
	btst.b #5,($378,a6)
	beq.b loc_04fa46
	moveq #1,d0
	rts

loc_04fa46:
	moveq #0,d0
	rts

;----------------------------------------------
loc_04fa4a:
	jsr loc_02ed28
	beq.w loc_04f904
	tst.b ($31,a6)
	beq.w loc_04f904
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcc.w loc_04f904
	move.b #$ff,($3c,a6)
	btst.b #0,($371,a6)
	bne.b loc_04fa80
	move.b #1,($3c,a6)

loc_04fa80:
	move.b #$1c,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_04faa0:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_04faae
	tst.b ($23e,a6)
	bne.w loc_04f918

loc_04faae:
	jsr loc_02ed00
	beq.w loc_04f918
	move.b #6,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	clr.b (pl_attk_active,a6)
	move.b #$ff,($3c,a6)
	btst.b #0,($371,a6)
	bne.b loc_04fae8
	move.b #1,($3c,a6)

loc_04fae8:
	rts

;----------------------------------------------
loc_04faea:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04f89c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04f89c
	jsr loc_02ecd8
	beq.w loc_04f89c
	move.b #$a,(pl_move_id,a6)
	move.l #$02001000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_04fb2a:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_04f88e
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04f88e
	jsr loc_02ecd8
	beq.w loc_04f88e
	move.b #$c,(pl_move_id,a6)
	move.l #$2001000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_04fb6c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04f8aa
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04f8aa
	jsr loc_02ecd8
	beq.w loc_04f8aa
	move.b #8,(pl_move_id,a6)
	move.l #$2001000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_04fbac:
	jsr loc_02ed00
	beq.w loc_04f8d4
	move.b #$e,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_04fbda:
	jsr loc_02ed00
	beq.w loc_04f8e2
	move.b #$18,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_04fc08:
	jsr loc_02edf8
	beq.w loc_04f926

;##############################################
;Alpha Counter Write
;##############################################
loc_04fc12:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04fc4e
	move.b #$12,(pl_move_id,a6)
	move.l #$2000e00,(4,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	clr.b (pl_hitfreeze,a6)
	movea.w ($38,a6),a4
	move.b #$18,($5f,a4)
	move.b #$1c,(pl_invinciblity_timer,a6)
	rts

;##############################################
;Alpha Counter Write
;##############################################
loc_04fc4e:
	move.b #$14,(pl_move_id,a6)
	move.l #$02000e00,(4,a6)
	clr.b (pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	clr.b (pl_hitfreeze,a6)
	movea.w ($38,a6),a4
	move.b #$17,($5f,a4)
	move.b #$1b,(pl_invinciblity_timer,a6)
	rts

;----------------------------------------------
loc_04fc80:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_04f930
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_04fc96
	tst.b (pl_taunt_count,a6)
	beq.w loc_04f930

loc_04fc96:
	jsr loc_02ed00
	beq.w loc_04f930
	move.b #$10,(pl_move_id,a6)
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	clr.b (pl_attk_active,a6)
	rts

;----------------------------------------------
loc_04fcbe:
	tst.b ($28a,a6)
	bne.w loc_04f880
	tst.b ($31,a6)
	bne.b loc_04fcfa
	jsr loc_02ef54
	beq.w loc_04f880
	jsr loc_02ecd8
	beq.w loc_04f880
	move.b #$16,(pl_move_id,a6)
	move.l #$02001000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_04fcfa:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04f880
	jsr loc_02ed28
	beq.w loc_04f880
	move.b #$16,(pl_move_id,a6)
	move.l #$2001000,(4,a6)
	jmp loc_02f980

;##############################################
;
;##############################################
loc_04fd20:
	move.b (pl_move_id,a6),d0
	move.w loc_04fd2c(pc,d0.w),d1
	jmp loc_04fd2c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04fd2c:
	dc.w loc_04fd4a-loc_04fd2c;00 Knife Throw
	dc.w loc_04fd56-loc_04fd2c;02
	dc.w loc_04fd72-loc_04fd2c;04
	dc.w loc_04fd5a-loc_04fd2c;06 Super Jump
	dc.w loc_04fd76-loc_04fd2c;08
	dc.w loc_04fd8a-loc_04fd2c;0a
	dc.w loc_04fd9e-loc_04fd2c;0c
	dc.w loc_04fd56-loc_04fd2c;0e

	dc.w loc_04fdb4-loc_04fd2c;10
	dc.w loc_04fdcc-loc_04fd2c;12
	dc.w loc_04fdcc-loc_04fd2c;14
	dc.w loc_04fd56-loc_04fd2c;16
	dc.w loc_04fd56-loc_04fd2c;18
	dc.w loc_04fd56-loc_04fd2c;1a
	dc.w loc_04fd72-loc_04fd2c;1c

;==============================================
loc_04fd4a:
	tst.b ($238,a6)
	bne.w loc_04fdd8
	bra.w loc_04fdd4

;==============================================
loc_04fd56:
	bra.w loc_04fdd4

;==============================================
loc_04fd5a:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_04fdd8
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_04fd6e
	tst.b ($23e,a6)
	bne.w loc_04fdd8

loc_04fd6e:
	bra.w loc_04fdd4

;==============================================
loc_04fd72:
	bra.w loc_04fdd8

;==============================================
loc_04fd76:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04fdd8
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04fdd8
	bra.b loc_04fdd8

;==============================================
loc_04fd8a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_04fdd8
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04fdd8
	bra.b loc_04fdd4

;==============================================
loc_04fd9e:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_04fdd8
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_04fdd8
	bra.b loc_04fdd4

;==============================================
loc_04fdb4:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_04fdd8
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_04fdd4
	tst.b (pl_taunt_count,a6)
	beq.w loc_04fdd8
	bra.b loc_04fdd4

;==============================================
loc_04fdcc:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_04fdd8

;----------------------------------------------
loc_04fdd4:
	moveq #1,d0
	rts

;----------------------------------------------
loc_04fdd8:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_04fddc:
	move.b (pl_move_id,a6),d0
	move.w loc_04fde8(pc,d0.w),d1
	jmp loc_04fde8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04fde8:
	dc.w loc_04fe06-loc_04fde8;00 Stinger
	dc.w loc_0500d2-loc_04fde8;02 Mekong Escape
	dc.w loc_050302-loc_04fde8;04 Trick Landing
	dc.w loc_050430-loc_04fde8;06 Super Jump
	dc.w loc_0504e0-loc_04fde8;08 Steel Rain
	dc.w loc_05065c-loc_04fde8;0a Mine Sweeper
	dc.w loc_0507e4-loc_04fde8;0c Take no Prisoner
	dc.w loc_050d08-loc_04fde8;0e P.Circle

	dc.w loc_050f02-loc_04fde8;10 Taunt
	dc.w loc_05100e-loc_04fde8;12 Aism Alpha counter
	dc.w loc_05104a-loc_04fde8;14 Vism Alpha counter
	dc.w loc_0510f4-loc_04fde8;16 Vism Activate
	dc.w loc_051176-loc_04fde8;18 Mekong Air Raid
	dc.w loc_05130c-loc_04fde8;1a Spike Rod
	dc.w loc_0515fa-loc_04fde8;1c Mekong Attack

;==============================================
;Stinger
;==============================================
loc_04fe06:
	move.b (7,a6),d0
	move.w loc_04fe12(pc,d0.w),d1
	jmp loc_04fe12(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04fe12:
	dc.w loc_04fe20-loc_04fe12
	dc.w loc_04fe5c-loc_04fe12
	dc.w loc_04feb6-loc_04fe12
	dc.w loc_04fefe-loc_04fe12
	dc.w loc_050036-loc_04fe12
	dc.w loc_05005e-loc_04fe12
	dc.w loc_05009c-loc_04fe12

;----------------------------------------------
loc_04fe20:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($1ec,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	bsr.w loc_051c50
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_04fe5c:
	tst.b ($1ec,a6)
	bne.b loc_04fe66
	bsr.w loc_0500b0

loc_04fe66:
	cmpi.b #1,($35,a6)
	bne.b loc_04fe98
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.b #1,($31,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_04fe9e(pc,d0.w),($44,a6);e9e
	move.l loc_04feaa(pc,d0.w),($4c,a6);eaa

loc_04fe98:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04fe9e:
	dc.l $00088000,$00098000,$000a8000

loc_04feaa:
	dc.l $ffff9800,$ffff8800,$ffff7800

;----------------------------------------------
loc_04feb6:
	tst.b ($1ec,a6)
	bne.b loc_04fec0
	bsr.w loc_0500b0

loc_04fec0:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	blt.w loc_05006e
	move.w ($64,a6),d0
	addi.w #$18,d0
	cmp.w ($14,a6),d0
	bcc.w loc_051aee
	tst.b ($1ec,a6)
	beq.w loc_051aee
	addq.b #2,(7,a6)
	moveq #$f,d1
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	add.w d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04fefe:
	cmpi.b #1,($35,a6)
	bne.w loc_05001c
	jsr loc_01c1c8
	beq.w loc_05000e
	move.l #$01000e00,(a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($3c,a6),($72,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	moveq #0,d0
	move.w d0,($40,a6)
	move.w d0,($44,a6)
	move.w d0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_050022
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_05000e
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_05000e
	jsr loc_01c1c8
	beq.w loc_05000e
	move.l #$01000e00,(a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($3c,a6),($72,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	moveq #0,d0
	move.w d0,($40,a6)
	move.w d0,($44,a6)
	move.w d0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_050022

loc_05000e:
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #2,($3a,a6)

loc_05001c:
	jmp loc_02a7ea

;==============================================
loc_050022:
	move.b #$c,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_050036:
	subq.b #1,($3a,a6)
	bpl.b loc_05005c
	addq.b #2,(7,a6)
	move.l #0,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_05005c:
	rts

;----------------------------------------------
loc_05005e:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_051aee

loc_05006e:
	move.b #$c,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_05009c:
	tst.b ($33,a6)
	bmi.w loc_051ae2
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_0500b0:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0500be
	bsr.w loc_051bae
	beq.b loc_0500d0
	bra.b loc_0500c8

loc_0500be:
	move.b ($378,a6),d0
	andi.w #$77,d0
	beq.b loc_0500d0

loc_0500c8:
	bsr.w loc_051b90
	move.b d1,($3c,a6)

loc_0500d0:
	rts

;==============================================
;Mekong Escape
;==============================================
loc_0500d2:
	move.b (7,a6),d0
	move.w loc_0500de(pc,d0.w),d1
	jmp loc_0500de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0500de:
	dc.w loc_0500ec-loc_0500de
	dc.w loc_050114-loc_0500de
	dc.w loc_050166-loc_0500de
	dc.w loc_0501dc-loc_0500de
	dc.w loc_050222-loc_0500de
	dc.w loc_050264-loc_0500de
	dc.w loc_050280-loc_0500de

;----------------------------------------------
loc_0500ec:
	addq.b #2,(7,a6)
	clr.b ($1ec,a6)
	move.b #1,($ce,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	bsr.w loc_051c50
	moveq #$27,d0
	jmp loc_02a758

;----------------------------------------------
loc_050114:
	tst.b ($33,a6)
	bpl.w loc_051aee
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$68000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d1
	sub.l ($10,a6),d1
	bmi.b loc_050146
	neg.l d1

loc_050146:
	addi.l #$1800000,d1
	tst.b (PL_Flip,a6)
	beq.b loc_050154
	neg.l d1

loc_050154:
	asr.l #5,d1
	move.l d1,($40,a6)
	clr.l ($48,a6)
	moveq #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_050166:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	move.w ($64,a6),d1
	cmp.w d1,d0
	blt.b loc_0501ae
	addi.w #$30,d1
	cmp.w d1,d0
	bcs.w loc_051aee
	moveq #1,d0
	tst.b (PL_Flip,a6)
	bne.b loc_05018a
	moveq #2,d0

loc_05018a:
	cmp.b ($ac,a6),d0
	bne.w loc_051aee
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #$29,d0
	jsr loc_02a758
	jmp loc_00369c

loc_0501ae:
	move.b #$c,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$2b,d0
	jmp loc_02a758

;----------------------------------------------
loc_0501dc:
	tst.b ($1ec,a6)
	bne.b loc_0501e6
	bsr.w loc_0502dc

loc_0501e6:
	tst.b ($33,a6)
	bpl.w loc_051aee
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$60000,($40,a6)
	move.l #$90000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_05021a
	neg.l ($40,a6)

loc_05021a:
	moveq #$2a,d0
	jmp loc_02a758

;----------------------------------------------
loc_050222:
	tst.b ($1ec,a6)
	bne.b loc_05022c
	bsr.w loc_0502dc

loc_05022c:
	bsr.w loc_050be4
	moveq #3,d0
	bsr.w loc_05029c
	tst.b ($1ec,a6)
	beq.b loc_050252
	addq.b #2,(7,a6)
	move.b #1,($282,a6)
	bsr.w loc_04f838
	bne.w loc_04f85c
	bra.w loc_0502ba

loc_050252:
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	blt.w loc_0501ae
	jmp loc_02a7ea

;----------------------------------------------
loc_050264:
	bsr.w loc_050be4
	moveq #5,d0
	bsr.w loc_05029c
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	blt.w loc_0501ae
	jmp loc_02a7ea

;----------------------------------------------
loc_050280:
	tst.b ($33,a6)
	bpl.b loc_050290
	clr.b ($282,a6)
	jmp loc_02baf2

loc_050290:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_05029c:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_0502b8
	move.w (PL_Buttons,a6),d1
	andi.w #3,d1
	beq.b loc_0502b8
	btst #1,d1
	beq.b loc_0502b4
	neg.w d0

loc_0502b4:
	add.w d0,($10,a6)

loc_0502b8:
	rts

;==============================================
loc_0502ba:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	move.w d0,d6
	jsr loc_02ef6c
	moveq #$18,d0
	tst.b ($81,a6)
	beq.b loc_0502d4
	addq.w #3,d0

loc_0502d4:
	add.b d6,d0
	jmp Set_Spec_Cancel_Timers

;==============================================
loc_0502dc:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0502ea
	bsr.w loc_051bae
	beq.b loc_050300
	bra.b loc_0502f4

loc_0502ea:
	move.b ($378,a6),d0
	andi.b #$77,d0
	beq.b loc_050300

loc_0502f4:
	bsr.w loc_051b90
	move.b d1,($82,a6)
	move.b d2,($81,a6)

loc_050300:
	rts

;==============================================
;Trick Landing
;==============================================
loc_050302:
	move.b (7,a6),d0
	move.w loc_05030e(pc,d0.w),d1
	jmp loc_05030e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05030e:
	dc.w loc_050318-loc_05030e
	dc.w loc_050338-loc_05030e
	dc.w loc_05038c-loc_05030e
	dc.w loc_0503e8-loc_05030e
	dc.w loc_050422-loc_05030e

;----------------------------------------------
loc_050318:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #2,d0
	jsr loc_02ef6c
	subi.l #$6000,($4c,a6)
	jsr loc_020674

;----------------------------------------------
loc_050338:
	jsr loc_02aa08
	bcc.b loc_050366
	addq.b #2,(7,a6)
	moveq #0,d0
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.w ($64,a6),($14,a6)
	moveq #2,d0
	jmp loc_02a758

loc_050366:
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$10,d0
	bhi.b loc_05037c
	moveq #7,d0
	jmp loc_02a758

loc_05037c:
	cmpi.w #$20,d0
	bhi.w loc_051aee
	moveq #6,d0
	jmp loc_02a758

;----------------------------------------------
loc_05038c:
	tst.b ($33,a6)
	bpl.w loc_051aee
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #3,d0
	move.l #$fffc8000,d1
	move.l #$500,d2
	tst.b ($3c,a6)
	bpl.b loc_0503d0
	moveq #4,d0
	move.l #$40000,d1
	move.l #$fffffb00,d2

loc_0503d0:
	tst.b (PL_Flip,a6)
	beq.b loc_0503da
	neg.l d1
	neg.l d2

loc_0503da:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	jmp loc_02a758

;----------------------------------------------
loc_0503e8:
	jsr loc_02aa08
	bcc.w loc_051aee
	addq.b #2,(7,a6)
	moveq #0,d0
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_050422:
	tst.b ($33,a6)
	bpl.w loc_051aee
	jmp loc_02baf2

;==============================================
;Super Jump
;==============================================
loc_050430:
	move.b (7,a6),d0
	move.w loc_05043c(pc,d0.w),d1
	jmp loc_05043c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05043c:
	dc.w loc_050440-loc_05043c
	dc.w loc_050464-loc_05043c

;----------------------------------------------
loc_050440:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_050456
	move.b ($211,a6),($3c,a6)

loc_050456:
	jsr loc_020674
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_050464:
	tst.b ($33,a6)
	bpl.w loc_051aee
	move.l #$2000602,(4,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	clr.b ($ce,a6)
	move.l #$fff88000,($40,a6)
	move.l #$70000,($44,a6)
	move.l #$500,($48,a6)
	move.l #$ffffa600,($4c,a6)
	moveq #$a,d0
	tst.b ($3c,a6)
	bpl.b loc_0504cc
	move.l #$78000,($40,a6)
	move.l #$74000,($44,a6)
	move.l #$fffffb00,($48,a6)
	move.l #$ffffa600,($4c,a6)
	moveq #$b,d0

loc_0504cc:
	tst.b (PL_Flip,a6)
	beq.b loc_0504da
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0504da:
	jmp loc_02a758

;==============================================
;Steel Rain
;==============================================
loc_0504e0:
	move.b (7,a6),d0
	move.w loc_0504ec(pc,d0.w),d1
	jmp loc_0504ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0504ec:
	dc.w loc_0504f2-loc_0504ec
	dc.w loc_050510-loc_0504ec
	dc.w loc_05057a-loc_0504ec

;----------------------------------------------
loc_0504f2:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$3e,d0
	jmp loc_02a758

;----------------------------------------------
loc_050510:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_05054a
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05053c
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05053c:
	move.b loc_050576(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #$3f,d0
	jmp loc_02a758

loc_05054a:
	cmpi.b #2,($35,a6)
	beq.b loc_050574
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_05056a
	move.b #1,($ab,a6)

loc_05056a:
	moveq #-$57,d0;a9
	moveq #$31,d1
	jmp loc_082e36

loc_050574:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050576:
	dc.b $01,$02,$03,$00

;----------------------------------------------
loc_05057a:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_051ae2
	tst.b ($35,a6)
	beq.b loc_0505a8
	clr.b ($35,a6)
	lea.l loc_050626(pc),a2
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_0505aa(pc,d0.w),d0

loc_0505a0:
	bsr.w loc_0505b0
	dbra d0,loc_0505a0

loc_0505a8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0505aa:
	dc.w $0002,$0005,$0008

;==============================================
loc_0505b0:
	jsr loc_01c1c8
	beq.b loc_050624
	move.l #$02000e06,(a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w (a2)+,(2,a4)
	move.w (a2)+,($40,a4)
	move.w (a2)+,($44,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

;==============================================
loc_050624:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050626:
	dc.b $0e,$06
	dc.w $0000,$0000

	dc.b $0e,$08
	dc.w $fff0,$0010

	dc.b $0e,$0a
	dc.w $0008,$0020

	dc.b $0e,$06
	dc.w $ffec,$0030

	dc.b $0e,$08
	dc.w $0020,$0040

	dc.b $0e,$0a
	dc.w $000c,$0050

	dc.b $0e,$06
	dc.w $0030,$0060

	dc.b $0e,$08
	dc.w $ffc8,$0070

	dc.b $0e,$0a
	dc.w $0000,$0080

;==============================================
;Mine Sweeper
;==============================================
loc_05065c:
	move.b (7,a6),d0
	move.w loc_050668(pc,d0.w),d1
	jmp loc_050668(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050668:
	dc.w loc_050670-loc_050668
	dc.w loc_050692-loc_050668
	dc.w loc_05072c-loc_050668
	dc.w loc_050768-loc_050668

;----------------------------------------------
loc_050670:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$2f,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05068e:
	dc.b $01,$02,$03,$00

;----------------------------------------------
loc_050692:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_050702
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.l #$50000,($40,a6)
	move.l #0,($48,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_0506d2
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0506d2:
	move.b loc_05068e(pc,d0.w),(pl_invinciblity_timer,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_0506e6
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0506e6:
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #1,d0
	move.b d0,($3a,a6)
	clr.b ($3b,a6)
	bsr.w loc_050776
	moveq #$30,d0
	jmp loc_02a758

loc_050702:
	cmpi.b #2,d0
	beq.b loc_05072a
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_050720
	move.b #1,($ab,a6)

loc_050720:
	moveq #-$25,d0;db
	moveq #$3a,d1
	jmp loc_082e36

loc_05072a:
	rts

;----------------------------------------------
loc_05072c:
	bsr.w loc_050be4
	cmpi.b #1,($35,a6)
	bne.b loc_050762
	cmpi.b #2,($3b,a6)
	bne.b loc_050748
	moveq #$d,d0
	jsr loc_0038e4

loc_050748:
	subq.b #1,($3a,a6)
	bpl.b loc_05075a
	addq.b #2,(7,a6)
	moveq #$31,d0
	jmp loc_02a758

loc_05075a:
	clr.b ($35,a6)
	bsr.w loc_050776

loc_050762:
	jmp loc_02a7ea

;----------------------------------------------
loc_050768:
	tst.b ($33,a6)
	bpl.w loc_051aee
	jmp loc_02baf2

;==============================================
loc_050776:
	jsr loc_01c1c8
	beq.b loc_0507e2
	addq.b #1,(a4)
	move.b #$18,(2,a4)
	move.b ($3b,a6),(3,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	addq.b #1,($3b,a6)

loc_0507e2:
	rts

;==============================================
;Take no Prisoners
;==============================================
loc_0507e4:
	move.b (7,a6),d0
	move.w loc_0507f0(pc,d0.w),d1
	jmp loc_0507f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0507f0:
	dc.w loc_0507fa-loc_0507f0
	dc.w loc_050824-loc_0507f0
	dc.w loc_0508b0-loc_0507f0
	dc.w loc_0509b6-loc_0507f0
	dc.w loc_050bd6-loc_0507f0

;----------------------------------------------
loc_0507fa:
	addq.b #2,(7,a6)
	clr.l ($1e4,a6)
	clr.w ($1d2,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$32,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050820:
	dc.b $01,$02,$03,$00

;----------------------------------------------
loc_050824:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_05087a
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_050850
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_050850:
	move.b loc_050820(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_0508a4(pc,d0.w),($40,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_05086e
	neg.l ($40,a6)

loc_05086e:
	lsr.w #2,d0
	addi.w #$35,d0
	jmp loc_02a758

loc_05087a:
	cmpi.b #2,d0
	beq.b loc_0508a2
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_050898
	move.b #1,($ab,a6)

loc_050898:
	moveq #-$1d,d0;e3
	moveq #5,d1
	jmp loc_082e36

loc_0508a2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0508a4:
	dc.l $00040000,$00080000,$00100000

;----------------------------------------------
loc_0508b0:
	cmpi.b #$80,($35,a6)
	beq.w loc_051aee
	move.l ($40,a6),d0
	add.l d0,($1e4,a6)
	bsr.w loc_050c5e
	tst.b ($33,a6)
	bmi.w loc_05095c
	bsr.w loc_05099a
	move.w ($1e4,a6),d6
	add.w ($10,a6),d6
	move.w d6,d0
	sub.w ($10,a0),d0
	cmpi.w #$180,d0
	bhi.w loc_05095c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3e,d0
	jsr loc_02e534
	beq.w loc_051aee
	bmi.w loc_050954
	addq.b #2,(7,a6)
	clr.b ($84,a6)
	move.b #$ff,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	clr.b ($263,a4)
	movea.l #loc_2040d8,a0
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	bpl.b loc_050928
	neg.w d0

loc_050928:
	subi.w #$10,d0
	lsr.w #3,d0
	cmpi.w #$2d,d0
	bcs.b loc_050936
	moveq #$2c,d0

loc_050936:
	move.w d0,d1
	lsl.w #4,d0
	lsl.w #2,d1
	add.w d1,d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	bsr.w loc_050c9a
	jmp loc_02fb96

loc_050954:
	moveq #$41,d0
	jsr loc_080b70

loc_05095c:
	move.b #8,(7,a6)
	jsr loc_01c2c8
	beq.b loc_050992
	move.l #$01003b01,(a4)
	move.b #6,(9,a4)
	move.w ($1e4,a6),d0
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a6),($14,a4)
	move.b #$4b,($3c,a4)
	move.w a6,($36,a4)

loc_050992:
	moveq #$38,d0
	jmp loc_02a758

;==============================================
loc_05099a:
	moveq #0,d0
	move.b ($e,a6),d0
	movea.l loc_0509a6(pc,d0.w),a0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0509a6:
	dc.l $ff8280
	dc.l $ff8200
	dc.l $ff8280
	dc.l $ff8300

;----------------------------------------------
loc_0509b6:
	move.b ($82,a6),d0
	move.w loc_0509c8(pc,d0.w),d1
	jsr loc_0509c8(pc,d1.w)
	jmp loc_02fb96

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0509c8:
	dc.w loc_0509ce-loc_0509c8
	dc.w loc_0509ce-loc_0509c8
	dc.w loc_0509ce-loc_0509c8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0509ce:
	movea.w ($38,a6),a4
	move.b ($84,a6),d0
	move.w loc_0509de(pc,d0.w),d1
	jmp loc_0509de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0509de:
	dc.w loc_0509ee-loc_0509de
	dc.w loc_050a00-loc_0509de
	dc.w loc_050a1a-loc_0509de
	dc.w loc_050a50-loc_0509de
	dc.w loc_050a84-loc_0509de
	dc.w loc_050abe-loc_0509de
	dc.w loc_050af6-loc_0509de
	dc.w loc_050b6c-loc_0509de

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0509ee:
	addq.b #2,($84,a6)
	move.b #$20,($3a,a6)
	moveq #$42,d0
	jmp loc_080b70

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050a00:
	subq.b #1,($3a,a6)
	bpl.b loc_050a18
	addq.b #2,($84,a6)
	moveq #0,d0
	move.b d0,(pl_invinciblity_timer,a6)
	moveq #$33,d0
	jmp loc_02a758

loc_050a18:
	rts

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050a1a:
	tst.b ($35,a6)
	bne.b loc_050a4a
	addq.b #2,($84,a6)
	move.b #1,($31,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff4000,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_050a4a:
	jmp loc_02a7ea

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050a50:
	bsr.w loc_050c06
	tst.w ($44,a6)
	bpl.w loc_051aee
	addq.b #2,($84,a6)
	move.b #6,($3a,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffff4000,($4c,a6)
	moveq #$1b,d0
	jmp loc_0038e4

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050a84:
	subq.b #1,($3a,a6)
	bpl.w loc_051aee
	bsr.w loc_050c06
	addq.b #2,($84,a6)
	move.l #0,($1d8,a6)
	move.l #$8000,($1e0,a6)
	moveq #0,d0
	move.l d0,($1dc,a6)
	move.l ($10,a6),d0
	sub.l ($10,a4),d0
	asr.l #4,d0
	move.l d0,($1d4,a6)
	jmp loc_02a7ea

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050abe:
	bsr.w loc_050c38
	bsr.w loc_050c06
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.b loc_050af0
	addq.b #2,($84,a6)
	move.w ($64,a6),($14,a6)
	move.b #1,($32,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)

loc_050af0:
	jmp loc_02a7ea

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050af6:
	bsr.w loc_050c38
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_050b6a
	addq.b #2,($84,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	move.b d0,($35,a6)
	move.l d0,($1d4,a6)
	move.l d0,($1dc,a6)
	move.l d0,($1d8,a6)
	move.l d0,($1e0,a6)
	moveq #0,d0
	move.l d0,($1d4,a6)
	move.l d0,($1dc,a6)
	move.l #$fff80000,($1d8,a6)
	move.l #$ffff8000,($1e0,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3e,d0
	jsr loc_02e96c
	moveq #$0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3e,d0
	jsr loc_02e970
	moveq #$34,d0
	jmp loc_02a758
 
loc_050b6a:
	rts

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_050b6c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.w loc_050bd4
	bsr.w loc_050c38
	move.w ($14,a4),d0
	cmp.w ($64,a4),d0
	bge.w loc_050bd4
	addq.b #2,(7,a6)
	move.b #$18,($123,a5)
	moveq #0,d0
	movea.w ($38,a6),a4
	move.b d0,($84,a6)
	move.w ($64,a4),($14,a4)
	move.w d0,($12,a4)
	move.w d0,($16,a4)
	move.b #1,($2ca,a4)
	moveq #$43,d0
	jsr loc_080b70
	moveq #$43,d0
	jsr loc_02e7f2
	move.w ($1d2,a6),d0
	beq.b loc_050bd4
	movea.w d0,a1
	addq.b #2,(5,a1)
	move.b #$57,($3c,a1)

loc_050bd4:
	rts

;----------------------------------------------
loc_050bd6:
	tst.b ($33,a6)
	bpl.w loc_051aee
	jmp loc_02baf2

;==============================================
loc_050be4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_050c06:
	move.l ($40,a6),d0
	beq.b loc_050c26
	tst.b (PL_Flip,a6)
	bne.b loc_050c14
	neg.l d0

loc_050c14:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_050c26
	clr.l ($40,a6)

loc_050c26:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_050c38:
	movea.w ($38,a6),a4
	move.l ($1d4,a6),d0
	add.l d0,($10,a4)
	move.l ($1dc,a6),d0
	add.l d0,($1d4,a6)
	move.l ($1d8,a6),d0
	add.l d0,($14,a4)
	move.l ($1e0,a6),d0
	add.l d0,($1d8,a6)
	rts

;==============================================
loc_050c5e:
	move.b ($b4,a5),d0
	andi.b #7,d0
	bne.b loc_050c98
	jsr loc_01c2c8
	beq.b loc_050c98
	move.l #$01003b01,(a4)
	move.b #6,(9,a4)
	move.w ($1e4,a6),d0
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a6),($14,a4)
	move.b #$4e,($3c,a4)
	move.w a6,($36,a4)

loc_050c98:
	rts

;==============================================
loc_050c9a:
	jsr loc_01c2c8
	beq.b loc_050d06
	move.l #$01003b00,(a4)
	move.b #0,(9,a4)
	bsr.w loc_05099a
	move.b (PL_Flip,a6),($b,a4)
	beq.b loc_050cd2
	move.w #$40,d0
	add.w ($10,a6),d0
	move.w #$160,d1
	add.w ($46,a0),d1
	cmp.w d1,d0
	bcs.b loc_050ce8
	move.w d1,d0
	bra.b loc_050ce8

loc_050cd2:
	move.w #$ffc0,d0
	add.w ($10,a6),d0
	move.w #$20,d1
	add.w ($44,a0),d1
	cmp.w d1,d0
	bhi.b loc_050ce8
	move.w d1,d0

loc_050ce8:
	move.w d0,($10,a4)
	move.w #$d8,d0
	add.w ($64,a6),d0
	move.w d0,($14,a4)
	move.b #$56,($3c,a4)
	move.w a6,($36,a4)
	move.w a4,($1d2,a6)

loc_050d06:
	rts

;==============================================
;P.Circle
;==============================================
loc_050d08:
	move.b (7,a6),d0
	move.w loc_050d14(pc,d0.w),d1
	jmp loc_050d14(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050d14:
	dc.w loc_050d1e-loc_050d14
	dc.w loc_050d66-loc_050d14
	dc.w loc_050dc6-loc_050d14
	dc.w loc_050dfa-loc_050d14
	dc.w loc_050e24-loc_050d14

;----------------------------------------------
loc_050d1e:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b #$3c,($3b,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($1ec,a6)
	move.l d0,(pl_inp_slot_8,a6)
	move.l d0,($1c4,a6)
	move.b #1,($1c7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	bsr.w loc_051c50
	bsr.w loc_050e70
	moveq #$13,d0
	jmp loc_02a758

;----------------------------------------------
loc_050d66:
	subq.b #1,($3a,a6)
	bmi.b loc_050dc0
	btst.b #0,($34,a6)
	beq.w loc_050dac
	tst.b ($1ec,a6)
	beq.b loc_050dac
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b #$3c,($3b,a6)
	moveq #0,d0
	move.b d0,($1ec,a6)
	move.l d0,(pl_inp_slot_8,a6)
	move.l d0,($1c4,a6)
	move.b #1,($1c7,a6)
	bsr.w loc_050e70
	moveq #$14,d0
	jmp loc_02a758

loc_050dac:
	subq.b #1,($3b,a6)
	bmi.b loc_050db6
	bsr.w loc_050e3c

loc_050db6:
	jsr loc_02a7ea
	bra.w loc_050eac

loc_050dc0:
	moveq #0,d0
	bra.w loc_050e02

;----------------------------------------------
loc_050dc6:
	subq.b #1,($3a,a6)
	bmi.b loc_050df4
	btst.b #0,($34,a6)
	beq.b loc_050dac
	tst.b ($1ec,a6)
	beq.b loc_050dac
	addq.b #2,(7,a6)
	move.b #$28,($3a,a6)
	bsr.w loc_050e70
	moveq #$15,d0
	jsr loc_02a758
	bra.w loc_050eac

loc_050df4:
	moveq #1,d0
	bra.w loc_050e02

;----------------------------------------------
loc_050dfa:
	subq.b #1,($3a,a6)
	bpl.b loc_050e1a
	moveq #2,d0

loc_050e02:
	move.b #8,(7,a6)
	clr.b ($ce,a6)
	addi.w #$16,d0
	jsr loc_02a758
	bra.w loc_050eac

loc_050e1a:
	jsr loc_02a7ea
	bra.w loc_050eac

;----------------------------------------------
loc_050e24:
	tst.b ($33,a6)
	bmi.w loc_051ae2
	jsr loc_02f6f8
	jsr loc_02a7ea
	bra.w loc_050eac

;==============================================
loc_050e3c:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_050e68
	lea.l (pl_inp_slot_8,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_236P_code
	beq.b loc_050e66
 
loc_050e54:
	st.b ($1ec,a6)
	clr.l (pl_inp_slot_8,a6)
	clr.l ($1c4,a6)
	move.b #1,($1c7,a6)

loc_050e66:
	rts

loc_050e68:
	bsr.w loc_051bae
	bne.b loc_050e54
	bra.b loc_050e66

;==============================================
loc_050e70:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_050e94(pc,d0.w),($40,a6)
	move.l loc_050e94+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_050e92
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_050e92:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050e94:
	dc.l $00040000,$fffff800
	dc.l $00050000,$fffff600
	dc.l $00060000,$fffff400

;==============================================
loc_050eac:
	move.b ($35,a6),d0
	beq.w loc_050f00
	bmi.b loc_050ed0
	andi.w #$ff,d0
	tst.b (PL_Flip,a6)
	bne.b loc_050ec2
	neg.w d0

loc_050ec2:
	add.w d0,($10,a6)
	clr.b ($35,a6)
	jmp loc_085a7e

loc_050ed0:
	move.l ($40,a6),d0
	beq.b loc_050ef0
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	add.l d1,d0
	move.l d0,($40,a6)
	eor.l d0,d1
	bmi.b loc_050ef0
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_050ef0:
	move.b ($b4,a5),d0
	andi.b #3,d0
	bne.b loc_050f00
	jmp loc_085a7e

loc_050f00:
	rts

;==============================================
;Taunt
;==============================================
loc_050f02:
	move.b (7,a6),d0
	move.w loc_050f0e(pc,d0.w),d1
	jmp loc_050f0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_050f0e:
	dc.w loc_050f14-loc_050f0e
	dc.w loc_050f34-loc_050f0e
	dc.w loc_050ffc-loc_050f0e

;----------------------------------------------
loc_050f14:
	addq.b #2,(7,a6)
	clr.b (pl_crouching,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_050f2c
	subq.b #1,(pl_taunt_count,a6)

loc_050f2c:
	moveq #$2e,d0
	jmp loc_02a758

;----------------------------------------------
loc_050f34:
	cmpi.b #1,($35,a6)
	bne.w loc_050ff6
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.w loc_050ff6
	move.l #$01003b06,(a4)
	move.b #2,(9,a4)
	move.w a6,($36,a4)
	move.w #$ffcd,d0
	move.b (PL_Flip,a6),($b,a4)
	beq.b loc_050f6e
	neg.w d0

loc_050f6e:
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a6),d0
	addi.w #$3b,d0
	move.w d0,($14,a4)
	move.w a4,($40,a6)
	jsr loc_01c1c8
	beq.w loc_050ff6
	move.l #$1001f00,(a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($3c,a6),($72,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$fff,($50,a4)
	move.w a6,($36,a4)
	move.w ($40,a6),($40,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_050ff6:
	jmp loc_02a7ea

;----------------------------------------------
loc_050ffc:
	tst.b ($33,a6)
	bpl.w loc_051aee
	clr.b ($ce,a6)
	jmp loc_02baf2

;==============================================
;Aism Alpha counter
;==============================================
loc_05100e:
	move.b (7,a6),d0
	move.w loc_05101a(pc,d0.w),d1
	jmp loc_05101a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05101a:
	dc.w loc_05101e-loc_05101a
	dc.w loc_051034-loc_05101a

;----------------------------------------------
loc_05101e:
	addq.b #2,(7,a6)
	clr.b (pl_crouching,a6)
	jsr loc_080e8e
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_051034:
	tst.b ($33,a6)
	bpl.b loc_051040
	jmp loc_02bb26

loc_051040:
	jsr loc_02a7ea
	bra.w loc_050eac

;==============================================
;Vism Alpha counter
;==============================================
loc_05104a:
	move.b (7,a6),d0
	move.w loc_051056(pc,d0.w),d1
	jmp loc_051056(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051056:
	dc.w loc_05105c-loc_051056
	dc.w loc_051072-loc_051056
	dc.w loc_0510bc-loc_051056

;----------------------------------------------
loc_05105c:
	addq.b #2,(7,a6)
	clr.b (pl_crouching,a6)
	jsr loc_080e8e
	moveq #$2d,d0
	jmp loc_02a758

;----------------------------------------------
loc_051072:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_0510ba
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)
	move.l #$d0000,($40,a6)
	move.l #$ffffe000,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_0510ba
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0510ba:
	rts

;----------------------------------------------
loc_0510bc:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.b loc_0510ba
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02bb26

;==============================================
;Vism Activate
;==============================================
loc_0510f4:
	move.b (7,a6),d0
	move.w loc_051100(pc,d0.w),d1
	jmp loc_051100(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051100:
	dc.w loc_051106-loc_051100
	dc.w loc_051126-loc_051100
	dc.w loc_05115a-loc_051100

;----------------------------------------------
loc_051106:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_051120
	moveq #$2f,d0

loc_051120:
	jmp loc_02a708

;----------------------------------------------
loc_051126:
	tst.b ($34,a6)
	beq.b loc_051154
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-$3b,d0;c5
	moveq #$51,d1
	tst.b ($31,a6)
	beq.b loc_05114a
	moveq #-$f,d0
	moveq #$54,d1

loc_05114a:
	jsr loc_097cd6
	bsr.w loc_051b48

loc_051154:
	jmp loc_02a7ea

;----------------------------------------------
loc_05115a:
	subq.b #1,($3a,a6)
	bne.w loc_051aee
	tst.b ($31,a6)
	beq.b loc_051170
	move.l #$02000602,(4,a6)

loc_051170:
	jmp loc_02f796

;==============================================
;Mekong Air Raid
;==============================================
loc_051176:
	move.b (7,a6),d0
	move.w loc_051182(pc,d0.w),d1
	jmp loc_051182(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051182:
	dc.w loc_05118c-loc_051182
	dc.w loc_0511d8-loc_051182
	dc.w loc_051230-loc_051182
	dc.w loc_0512aa-loc_051182
	dc.w loc_0512e6-loc_051182

;----------------------------------------------
loc_05118c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	jsr loc_020674
	bsr.w loc_051c50
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b #8,($3a,a6)
	move.l #$50000,($40,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_0511c6
	neg.l ($40,a6)

loc_0511c6:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.b #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_0511d8:
	tst.b ($35,a6)
	bne.b loc_0511f2
	bsr.w loc_0512fa
	beq.b loc_0511f2
	jsr loc_02b216
	move.b d1,($3c,a6)
	bra.w loc_051212

loc_0511f2:
	bsr.w loc_050be4
	tst.b ($33,a6)
	bpl.w loc_051aee
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	clr.b ($ce,a6)
	jmp loc_02bb26

loc_051212:
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($3c,a6),d0
	lsr.w #1,d0
	addi.b #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_051230:
	tst.b ($35,a6)
	bne.b loc_051274
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #3,d0
	move.l loc_05127a(pc,d0.w),($40,a6)
	move.l loc_05127a+4(pc,d0.w),($48,a6)
	move.l loc_05127a+8(pc,d0.w),($44,a6)
	move.l loc_05127a+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_051274
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_051274:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05127a:
	dc.l $fffd0000,$fffff000,$00098000,$ffff6000
	dc.l $fffb8000,$fffff000,$00098000,$ffff6000
	dc.l $fffa0000,$fffff000,$00098000,$ffff6000

;----------------------------------------------
loc_0512aa:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_051aee
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$1f,d0
	jmp loc_02a758

;----------------------------------------------
loc_0512e6:
	tst.b ($33,a6)
	bmi.w loc_051ae2
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_0512fa:
	tst.b (PL_cpucontrol,a6)
	bne.w loc_051bae
	move.b ($378,a6),d0
	andi.b #7,d0
	rts

;==============================================
;Spike Rod
;==============================================
loc_05130c:
	move.b (7,a6),d0
	move.w loc_051318(pc,d0.w),d1
	jmp loc_051318(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051318:
	dc.w loc_051328-loc_051318
	dc.w loc_051348-loc_051318
	dc.w loc_05138c-loc_051318
	dc.w loc_0513d8-loc_051318
	dc.w loc_0514b2-loc_051318
	dc.w loc_051556-loc_051318
	dc.w loc_05156e-loc_051318
	dc.w loc_0515aa-loc_051318

;----------------------------------------------
loc_051328:
	addq.b #2,(7,a6)
	clr.b ($1ec,a6)
	move.b #1,($ce,a6)
	jsr loc_020674
	bsr.w loc_051c50
	moveq #$20,d0
	jmp loc_02a758

;----------------------------------------------
loc_051348:
	tst.b ($35,a6)
	beq.b loc_051386
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$50000,($40,a6)
	move.l #$ffffe800,($48,a6)
	move.l #$48000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_051386
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_051386:
	jmp loc_02a7ea

;----------------------------------------------
loc_05138c:
	tst.b ($35,a6)
	bne.b loc_05139c
	tst.b ($1ec,a6)
	bne.b loc_05139c
	bsr.w loc_0515be

loc_05139c:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_051aee
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.b d0,($5b,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #$21,d0
	jmp loc_02a758

;----------------------------------------------
loc_0513d8:
	tst.b ($35,a6)
	bne.b loc_0513e8
	tst.b ($1ec,a6)
	bne.b loc_0513e8
	bsr.w loc_0515be

loc_0513e8:
	tst.b ($33,a6)
	bpl.w loc_051aee
	tst.b ($1ec,a6)
	beq.w loc_05147e
	bmi.w loc_051488
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$c,d0
	jsr loc_0038e4
	moveq #7,d0
	jsr loc_0038e4
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b #7,($3b,a6)
	move.b ($3c,a6),d0
	lsr.w #1,d0
	move.b loc_051462(pc,d0.w),($3a,a6)
	lsl.w #3,d0
	move.l loc_051466(pc,d0.w),($40,a6)
	move.l loc_051466+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_051450
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_051450:
	moveq #0,d0
	move.b ($3c,a6),d0
	lsr.w #1,d0
	addi.b #$22,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051462:
	dc.b $10,$14,$18,$00

loc_051466:
	dc.l $fffd0000,$ffff8000
	dc.l $fffd0000,$ffff8000
	dc.l $fffd0000,$ffff8000

;==============================================
loc_05147e:
	clr.b ($ce,a6)
	jmp loc_02bb26

loc_051488:
	move.b ($107,a5),d0
	or.b ($10d,a5),d0
	bne.b loc_05147e
	move.b #2,(7,a6)
	clr.b ($1ec,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	moveq #$20,d0
	jmp loc_02a758

;----------------------------------------------
loc_0514b2:
	bsr.w loc_050be4
	tst.b ($5b,a6)
	bne.b loc_0514ec
	subq.b #1,($3a,a6)
	bmi.w loc_051530
	moveq #1,d0
	tst.b (PL_Flip,a6)
	beq.b loc_0514ce
	moveq #2,d0

loc_0514ce:
	cmp.b ($ac,a6),d0
	beq.b loc_0514ec
	addq.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	bne.b loc_0514e6
	jsr loc_080dd0

loc_0514e6:
	jmp loc_02a7ea

loc_0514ec:
	tst.b ($3e,a6)
	bne.b loc_051530
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.l #$20000,($40,a6)
	move.l #$1000,($48,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_05152a
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_05152a:
	jmp loc_02a7ea

loc_051530:
	move.b #$e,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	moveq #$26,d0
	jmp loc_02a758

;----------------------------------------------
loc_051556:
	tst.b ($33,a6)
	bpl.b loc_05152a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #$25,d0
	jsr loc_02a758

;----------------------------------------------
loc_05156e:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_051aee
	move.b #$e,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$26,d0
	jmp loc_02a758

;----------------------------------------------
loc_0515aa:
	tst.b ($33,a6)
	bmi.w loc_051ae2
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_0515be:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0515da
	bsr.w loc_051bae
	beq.b loc_0515f8
	bsr.w loc_051b90
	move.b d1,($3c,a6)
	move.b #1,($1ec,a6)
	rts

loc_0515da:
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.b loc_0515f8
	bsr.w loc_051b90
	move.b d1,($3c,a6)
	cmpi.b #7,d0
	beq.b loc_0515f8
	move.b #1,($1ec,a6)

loc_0515f8:
	rts

;==============================================
;Mekong Attack
;==============================================
loc_0515fa:
	move.b (7,a6),d0
	move.w loc_051606(pc,d0.w),d1
	jmp loc_051606(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051606:
	dc.w loc_051610-loc_051606
	dc.w loc_05163a-loc_051606
	dc.w loc_05166a-loc_051606
	dc.w loc_0516ca-loc_051606
	dc.w loc_0516f6-loc_051606

;----------------------------------------------
loc_051610:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	jsr loc_020674
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$39,d0
	jsr loc_02a758

;----------------------------------------------
loc_05163a:
	jsr loc_02aa08
	bcc.w loc_051aee
	addq.b #2,(7,a6)
	moveq #0,d0
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.w ($64,a6),($14,a6)
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_05166a:
	tst.b ($33,a6)
	bpl.w loc_051aee
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #3,d0
	move.l #$fffc8000,d1
	move.l #$500,d2
	tst.b ($3c,a6)
	bpl.b loc_0516b2
	moveq #4,d0
	move.l #$40000,d1
	move.l #$fffffb00,d2

loc_0516b2:
	tst.b (PL_Flip,a6)
	beq.b loc_0516bc
	neg.l d1
	neg.l d2

loc_0516bc:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	jmp loc_02a758

;----------------------------------------------
loc_0516ca:
	jsr loc_02aa08
	tst.w ($44,a6)
	bpl.w loc_051aee
	clr.b ($ce,a6)
	tst.b (PL_ism_choice,a6)
	beq.b loc_0516ec
	move.l #$02000602,(4,a6)
	rts

loc_0516ec:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0516f6:
	jsr loc_02aa08
	tst.b (PL_cpucontrol,a6)
	bne.b loc_05170a
	bsr.w loc_04fa30
	bne.w loc_051736

loc_05170a:
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_051aee
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	jmp loc_02bb26

loc_051736:
	tst.b ($107,a5)
	bne.b loc_051778
	tst.b ($10d,a5)
	bne.b loc_051778
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcc.b loc_051778
	move.b #$ff,($3c,a6)
	btst.b #0,($371,a6)
	bne.b loc_051764
	move.b #1,($3c,a6)

loc_051764:
	clr.b (7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	move.b #1,(pl_attk_active,a6)

loc_051778:
	rts

;##############################################
;
;##############################################
loc_05177a:
	cmpi.b #4,($80,a6)
	beq.w loc_0519ee
	tst.b ($81,a6)
	bne.w loc_051874
	move.b (7,a6),d0
	move.w loc_05179e(pc,d0.w),d1
	jsr loc_05179e(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05179e:
	dc.w loc_0517a8-loc_05179e
	dc.w loc_0517bc-loc_05179e
	dc.w loc_05183c-loc_05179e
	dc.w loc_05184a-loc_05179e
	dc.w loc_051862-loc_05179e

;----------------------------------------------
loc_0517a8:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3a,d0
	jmp loc_02a758

;----------------------------------------------
loc_0517bc:
	tst.b ($33,a6)
	bpl.w loc_051aee
	moveq #$26,d0
	tst.b ($81,a6)
	beq.b loc_0517ce
	moveq #$27,d0

loc_0517ce:
	jsr loc_02e3fe
	beq.b loc_051830
	move.b #6,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0517fc
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_051810
	bra.b loc_051814

loc_0517fc:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_051814
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_051814

loc_051810:
	addq.b #1,(PL_Flip,a6)

loc_051814:
	tst.b ($81,a6)
	bne.b loc_051822
	moveq #0,d0
	jmp loc_02a758

loc_051822:
	moveq #1,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_051830:
	addq.b #2,(7,a6)
	moveq #$3b,d0
	jmp loc_02a758

;----------------------------------------------
loc_05183c:
	tst.b ($33,a6)
	bpl.w loc_051aee
	jmp loc_02baf2

;----------------------------------------------
loc_05184a:
	tst.b ($35,a6)
	beq.b loc_05185c
	addq.b #2,(7,a6)
	moveq #$26,d0
	jsr loc_02e7f2

loc_05185c:
	jmp loc_02a7ea

;----------------------------------------------
loc_051862:
	tst.b ($33,a6)
	bpl.w loc_051aee
	eori.b #1,(PL_Flip,a6)
	bra.w loc_051ae2

;==============================================
;
;==============================================
loc_051874:
	move.b (7,a6),d0
	move.w loc_051880(pc,d0.w),d1
	jmp loc_051880(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051880:;333952
	dc.w loc_0517a8-loc_051880;-216
	dc.w loc_0517bc-loc_051880;-196
	dc.w loc_05183c-loc_051880;-68
	dc.w loc_051892-loc_051880
	dc.w loc_0518f4-loc_051880
	dc.w loc_051944-loc_051880
	dc.w loc_05197a-loc_051880
	dc.w loc_0519b0-loc_051880

	dc.w loc_051862-loc_051880;-30

;----------------------------------------------
loc_051892:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_0518c8
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	movea.w ($38,a6),a4
	move.b d0,($263,a4)
	moveq #$53,d0
	moveq #0,d1
	moveq #0,d2
	bsr.b loc_0518ce
	moveq #$54,d0
	moveq #-7,d1
	moveq #-2,d2
	bsr.b loc_0518ce
	moveq #$55,d0
	moveq #-$11,d1
	moveq #-3,d2
	bra.b loc_0518ce

loc_0518c8:
	jmp loc_02fa36

loc_0518ce:
	jsr loc_01c2c8
	beq.b loc_0518f2
	move.l #$01003b05,(a4)
	move.b #2,(9,a4)
	move.w a6,($36,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.w d2,($44,a4)

loc_0518f2:
	rts

;----------------------------------------------
loc_0518f4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05193e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffffe000,($48,a6)
	move.l #$28000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_05193e
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_05193e:
	jmp loc_02fb96

;----------------------------------------------
loc_051944:
	bsr.w loc_050be4
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_051974
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_051974
	move.b #$2e,($2a0,a6)
	moveq #$d,d0
	jsr loc_0038e4

loc_051974:
	jmp loc_02fb96

;----------------------------------------------
loc_05197a:
	bsr.w loc_050be4
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_051974
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	movea.w ($38,a6),a4
	move.w d0,($12,a4)
	moveq #$27,d0
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.b loc_0519aa
	moveq #$28,d0

loc_0519aa:
	jmp loc_02e7f2

;----------------------------------------------
loc_0519b0:
	bsr.w loc_050be4
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.b loc_051974
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w ($64,a6),($14,a6)
	move.b #0,($2a0,a6)
	jsr loc_00369c
	move.b #1,($32,a6)
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_0519ee:
	move.b (7,a6),d0
	move.w loc_0519fa(pc,d0.w),d1
	jmp loc_0519fa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0519fa:;334330
	dc.w loc_051a0c-loc_0519fa
	dc.w loc_051a20-loc_0519fa
	dc.w loc_051a94-loc_0519fa
	dc.w loc_051892-loc_0519fa;-360
	dc.w loc_0518f4-loc_0519fa;-262
	dc.w loc_051944-loc_0519fa;-182
	dc.w loc_051aaa-loc_0519fa
	dc.w loc_0519b0-loc_0519fa;-74

	dc.w loc_051862-loc_0519fa;-408

;----------------------------------------------
loc_051a0c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$3c,d0
	jmp loc_02a758

;----------------------------------------------
loc_051a20:
	jsr loc_02aa08
	bcs.w loc_051ae2
	tst.b ($33,a6)
	bpl.w loc_051aee
	moveq #$29,d0
	jsr loc_02e636
	beq.b loc_051a88
	move.b #6,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_051a62
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_051a76
	bra.b loc_051a7a

loc_051a62:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_051a7a
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_051a7a

loc_051a76:
	addq.b #1,(PL_Flip,a6)

loc_051a7a:
	moveq #$40,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_051a88:
	addq.b #2,(7,a6)
	moveq #$3d,d0
	jmp loc_02a758

;----------------------------------------------
loc_051a94:
	jsr loc_02aa08
	bcc.w loc_051aee
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_051aaa:
	bsr.w loc_050be4
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_051974
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	movea.w ($38,a6),a4
	move.w d0,($12,a4)
	moveq #$29,d0
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.b loc_051adc
	moveq #$28,d0

loc_051adc:
	jmp loc_02e7f2

;==============================================
loc_051ae2:
	jmp loc_02baf2

;==============================================
loc_051ae8:
	jmp loc_02bb26

;==============================================
loc_051aee:
	jmp loc_02a7ea

;==============================================
loc_051af4:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_051b44
	jsr SPButton_AllK_code
	beq.b loc_051b0e
	jsr loc_02ed28
	beq.b loc_051b0e
	moveq #1,d0
	rts

loc_051b0e:
	moveq #0,d0
	rts

;==============================================
loc_051b12:
	move.b #1,($3c,a6)
	btst.b #1,($371,a6)
	bne.b loc_051b26
	move.b #$ff,($3c,a6)

loc_051b26:
	move.b #4,(pl_move_id,a6)
	clr.b (pl_attk_active,a6)
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	rts

loc_051b44:
	moveq #0,d0
	rts

;==============================================
loc_051b48:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_5,a6)
	movem.l d0-d1,(pl_inp_slot_6,a6)
	movem.l d0-d1,(pl_inp_slot_8,a6)
	movem.l d0-d1,(pl_inp_slot_7,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;==============================================
loc_051b90:
	st.b ($1ec,a6)
	tst.b (PL_cpucontrol,a6)
	bne.b loc_051ba0
	jmp loc_02b216

loc_051ba0:
	moveq #0,d1
	moveq #0,d2
	move.b ($1ea,a6),d1
	move.b ($1eb,a6),d2
	rts

;==============================================
loc_051bae:
	move.b ($83,a6),d0
	add.b d0,d0
	andi.w #$1e,d0
	move.w loc_051bc2(pc,d0.w),d1
	jmp loc_051bc2(pc,d1.w)

loc_051bc0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051bc2:
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051bee-loc_051bc2;002c
	dc.w loc_051bf2-loc_051bc2;0030
	dc.w loc_051bf6-loc_051bc2;0034
	dc.w loc_051c02-loc_051bc2;0040
	dc.w loc_051c30-loc_051bc2;006e
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020
	dc.w loc_051be2-loc_051bc2;0020

;----------------------------------------------
loc_051be2:
	subq.w #1,($1e8,a6)
	bpl.w loc_051d5c
	bra.w loc_051d58

;----------------------------------------------
loc_051bee:
	bra.w loc_051d5c

;----------------------------------------------
loc_051bf2:
	bra.w loc_051d58

;----------------------------------------------
loc_051bf6:
	tst.w ($44,a6)
	bpl.w loc_051d5c
	bra.w loc_051d58

;----------------------------------------------
loc_051c02:
	subq.w #1,($1e8,a6)
	bpl.w loc_051d5c
	move.w (pl_dist_away,a6),d0
	cmpi.w #$58,d0
	bcs.w loc_051d5c
	moveq #0,d1
	cmpi.w #$90,d0
	bcs.b loc_051c28
	moveq #2,d1
	cmpi.w #$c0,d0
	bcs.b loc_051c28
	moveq #4,d1

loc_051c28:
	move.b d1,($1ea,a6)
	bra.w loc_051d58

;----------------------------------------------
loc_051c30:
	tst.b ($1ec,a6)
	bne.w loc_051d58
	subq.w #1,($1e8,a6)
	bpl.w loc_051d5c
	subq.b #1,($1ea,a6)
	bmi.w loc_051d5c
	bsr.w loc_051cc6
	bra.w loc_051d58

;==============================================
loc_051c50:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_051c68
	move.b ($83,a6),d0
	add.b d0,d0
	andi.w #$1e,d0
	move.w loc_051c6a(pc,d0.w),d1
	jmp loc_051c6a(pc,d1.w)

loc_051c68:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051c6a:
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c92-loc_051c6a;0028
	dc.w loc_051c94-loc_051c6a;002a
	dc.w loc_051c94-loc_051c6a;002a
	dc.w loc_051ca0-loc_051c6a;0036
	dc.w loc_051ca4-loc_051c6a;003a
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020
	dc.w loc_051c8a-loc_051c6a;0020

;----------------------------------------------
loc_051c8a:
	bsr.w loc_051cc6
	bra.w loc_051d24

;----------------------------------------------
loc_051c92:
	rts

;----------------------------------------------
loc_051c94:
	move.b ($82,a6),($1ea,a6)
	clr.b ($1eb,a6)
	rts

;----------------------------------------------
loc_051ca0:
	bra.w loc_051cc6

;----------------------------------------------
loc_051ca4:
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,($1ea,a6)
	clr.b ($1eb,a6)
	bsr.w loc_051cc6
	move.w ($1e8,a6),d0
	move.w d0,d1
	lsr.w #1,d1
	add.w d1,d0
	move.w d0,($1e8,a6)
	rts

;==============================================
loc_051cc6:
	jsr RNGFunction
	andi.w #$1f,d0
	moveq #0,d1
	move.b ($127,a6),d1
	add.w d1,d1
	move.w loc_051ce4(pc,d1.w),d1
	add.w d1,d0
	move.w d0,($1e8,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051ce4:
	dc.w $001e,$001a,$0018,$0016,$0014,$0012,$0010,$000f
	dc.w $000e,$000d,$000c,$000b,$000a,$000a,$0009,$0009
	dc.w $0008,$0007,$0006,$0005,$0004,$0004,$0003,$0003
	dc.w $0002,$0002,$0002,$0002,$0001,$0001,$0001,$0001

;==============================================
loc_051d24:
	jsr RNGFunction
	andi.w #$f,d0
	add.w d0,d0
	move.w loc_051d38(pc,d0.w),($1ea,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051d38:
	dc.w $0000,$0200,$0400,$0002,$0202,$0402,$0000,$0200
	dc.w $0400,$0002,$0202,$0402,$0000,$0002,$0200,$0202

;==============================================
loc_051d58:
	moveq #1,d0
	rts

;==============================================
loc_051d5c:
	moveq #0,d0
	rts

;##############################################
;
;##############################################
loc_051d60:
	dc.w loc_051da4-loc_051d60
	dc.w loc_051da4-loc_051d60
	dc.w loc_051d66-loc_051d60

loc_051d66:
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$02,$02,$02,$02,$09,$0b,$09,$0b,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

loc_051da4:
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$02,$02,$02,$02,$08,$0a,$08,$0a,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02