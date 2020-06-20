;##############################################################################
;
;##############################################################################
loc_03f2cc:
	jsr loc_01c368
	beq.b loc_03f2ea
	addq.b #1,(a4)
	move.w a4,($28,a6)
	move.w #$600,(2,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)

loc_03f2ea:
	rts

;##############################################################################
;
;##############################################################################
loc_03f2ec:
	tst.b ($33,a6)
	bpl.b loc_03f302
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

loc_03f302:
	tst.b ($35,a6)
	beq.b loc_03f31e
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_03f31e
	move.l #$1003a04,(a4)
	move.w a6,($36,a4)

loc_03f31e:
	jmp loc_02a7ea

;##############################################################################
;Normals
;##############################################################################
loc_03f324:
	tst.b ($80,a6)
	bne.w loc_03f498
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_03f3ae
	move.b (7,a6),d0
	move.w loc_03f344(pc,d0.w),d1
	jmp loc_03f344(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f344:
	dc.w loc_03f348-loc_03f344
	dc.w loc_03f3a8-loc_03f344

;==============================================================================
loc_03f348:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_03f388
	cmpi.b #1,($132,a6)
	bne.b loc_03f388
	btst.b #0,($83,a6)
	bne.b loc_03f39c
	bra.b loc_03f39a

loc_03f388:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_03f3a2(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_03f39c

loc_03f39a:
	addq.b #1,d0

loc_03f39c:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f3a2:
	dc.w $0030,$0028,$0050

;==============================================================================
loc_03f3a8:
	jmp loc_02f5ac

;==============================================================================
;
;==============================================================================
loc_03f3ae:
	move.b ($82,a6),d0
	move.w loc_03f3ba(pc,d0.w),d1
	jmp loc_03f3ba(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f3ba:
	dc.w loc_03f3c0-loc_03f3ba
	dc.w loc_03f3c0-loc_03f3ba
	dc.w loc_03f436-loc_03f3ba

;==============================================================================
loc_03f3c0:
	move.b (7,a6),d0
	move.w loc_03f3cc(pc,d0.w),d1
	jmp loc_03f3cc(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f3cc:
	dc.w loc_03f3d0-loc_03f3cc
	dc.w loc_03f430-loc_03f3cc

;------------------------------------------------------------------------------
loc_03f3d0:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_03f410
	cmpi.b #1,($132,a6)
	bne.b loc_03f410
	btst.b #0,($83,a6)
	bne.b loc_03f424
	bra.b loc_03f422

loc_03f410:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_03f42a(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_03f424

loc_03f422:
	addq.b #1,d0

loc_03f424:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f42a:
	dc.w $0030,$0038,$0028

;------------------------------------------------------------------------------
loc_03f430:
	jmp loc_02f5ac

;==============================================================================
loc_03f436:
	move.b (7,a6),d0
	move.w loc_03f442(pc,d0.w),d1
	jmp loc_03f442(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f442:
	dc.w loc_03f448-loc_03f442
	dc.w loc_03f46e-loc_03f442
	dc.w loc_03f48c-loc_03f442

;------------------------------------------------------------------------------
loc_03f448:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$a,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_03f46e:
	tst.b ($35,a6)
	beq.b loc_03f486
	addq.b #2,(7,a6)
	moveq #$10,d0
	tst.b ($b,a6)
	bne.b loc_03f482
	neg.w d0

loc_03f482:
	add.w d0,($10,a6)

loc_03f486:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03f48c:
	tst.b ($33,a6)
	bpl.b loc_03f486
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_03f498:
	move.b #1,($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_03f4ea
	move.b (7,a6),d0
	move.w loc_03f4b2(pc,d0.w),d1
	jmp loc_03f4b2(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f4b2:
	dc.w loc_03f4b6-loc_03f4b2
	dc.w loc_03f4e4-loc_03f4b2

;------------------------------------------------------------------------------
loc_03f4b6:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_03f4e4:
	jmp loc_02f5ac

;==============================================================================
loc_03f4ea:
	move.b ($82,a6),d0
	move.w loc_03f4f6(pc,d0.w),d1
	jmp loc_03f4f6(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f4f6:
	dc.w loc_03f4fc-loc_03f4f6
	dc.w loc_03f4fc-loc_03f4f6
	dc.w loc_03f540-loc_03f4f6

;==============================================================================
loc_03f4fc:
	move.b (7,a6),d0
	move.w loc_03f508(pc,d0.w),d1
	jmp loc_03f508(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f508:
	dc.w loc_03f50c-loc_03f508
	dc.w loc_03f53a-loc_03f508

;------------------------------------------------------------------------------
loc_03f50c:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$f,d0
	add.b d1,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_03f53a:
	jmp loc_02f5ac

;==============================================================================
loc_03f540:
	move.b (7,a6),d0
	move.w loc_03f54c(pc,d0.w),d1
	jmp loc_03f54c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f54c:
	dc.w loc_03f550-loc_03f54c
	dc.w loc_03f586-loc_03f54c

;------------------------------------------------------------------------------
loc_03f550:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff4000,($48,a6)
	jsr loc_02aebc
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$11,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_03f586:
	tst.b ($33,a6)
	bmi.w loc_0411aa
	tst.b ($35,a6)
	beq.b loc_03f59e
	move.l ($40,a6),d0
	bmi.b loc_03f59e
	bsr.w loc_040ef8

loc_03f59e:
	jmp loc_02a7ea

;##############################################################################
;
;##############################################################################
loc_03f5a4:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_03f5d4
	moveq #$18,d0

loc_03f5d4:
	tst.b ($81,a6)
	beq.b loc_03f5dc
	addq.w #3,d0

loc_03f5dc:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################################################
;Special Inputs
;##############################################################################
loc_03f5ec:
	jsr loc_02e096
	bne.w loc_03f8ba

loc_03f5f6:
	lea.l ($190,a6),a4
	jsr loc_02d722
	bne.w loc_03f71c

loc_03f604:
	lea.l ($198,a6),a4
	jsr loc_02d6ba
	bne.w loc_03f6ae

loc_03f612:
	lea.l ($180,a6),a4
	jsr loc_02d70a
	bne.w loc_03f68e

loc_03f620:
	lea.l ($1a0,a6),a4
	jsr loc_02d712
	bne.w loc_03f7e4

loc_03f62e:
	lea.l ($188,a6),a4
	jsr loc_02d5ea
	bne.w loc_03f6f2

loc_03f63c:
	lea.l ($1b0,a6),a4
	jsr loc_02d622
	bne.w loc_03f91c

loc_03f64a:
	lea.l ($1b8,a6),a4
	jsr loc_02d632
	bne.w loc_03f83c

loc_03f658:
	lea.l ($1a8,a6),a4
	jsr loc_02d632
	bne.w loc_03f80e

loc_03f666:
	lea.l ($1c0,a6),a4
	jsr loc_02d602
	bne.w loc_03f860

loc_03f674:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_03f752

loc_03f682:
	jsr loc_02e0cc
	bne.w loc_03f886

loc_03f68c:
	rts

;------------------------------------------------------------------------------
;Special Move Writes
;------------------------------------------------------------------------------
loc_03f68e:
	jsr loc_02ed00
	beq.b loc_03f620
	move.l #$2000e00,(4,a6)
	clr.b ($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;------------------------------------------------------------------------------
loc_03f6ae:
	cmpi.b #1,($132,a6)
	beq.w loc_03f604
	cmpi.w #$30,($11e,a6)
	bcs.w loc_03f612
	jsr loc_02ecd8
	beq.w loc_03f612
	move.l #$2001000,(4,a6)
	move.b #2,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #4,($82,a6)
	jmp loc_02f4bc

;------------------------------------------------------------------------------
loc_03f6f2:
	jsr loc_02ed00
	beq.w loc_03f63c
	move.l #$2000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;------------------------------------------------------------------------------
loc_03f71c:
	tst.b ($132,a6)
	bne.w loc_03f612
	cmpi.w #$30,($11e,a6)
	bcs.w loc_03f604
	jsr loc_02ecd8
	beq.w loc_03f604
	move.l #$2001000,(4,a6)
	move.b #6,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

;------------------------------------------------------------------------------
loc_03f752:
	jsr loc_02edf8
	beq.w loc_03f682

;##############################################################################
;
;##############################################################################
loc_03f75c:
	tst.b ($132,a6)
	bne.w loc_03f7a4
	move.l #$2000e00,(4,a6)
	move.b #8,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	clr.b ($2c8,a6)
	move.b #0,($82,a6)
	move.b #$1e,($25d,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #$1a,($5f,a4)
	moveq #$1a,d0
	jmp loc_02a758

;##############################################################################
;
;##############################################################################
loc_03f7a4:
	move.l #$2000e00,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	clr.b ($2c8,a6)
	move.b #0,($82,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #$1b,($5f,a4)
	move.b #$1f,($25d,a6)
	moveq #$1a,d0
	jmp loc_02a758

;==============================================================================
loc_03f7e4:
	jsr loc_02ed00
	beq.w loc_03f62e
	move.l #$2000e00,(4,a6)
	move.b #$a,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;==============================================================================
loc_03f80e:
	tst.b ($258,a6)
	bne.w loc_03f666
	jsr loc_02eea6
	beq.w loc_03f666
	move.l #$2000e00,(4,a6)
	move.b #$c,($aa,a6)
	move.b #1,($a9,a6)
	move.b #2,($82,a6)
	rts

;==============================================================================
loc_03f83c:
	jsr ReversalCheck
	beq.w loc_03f658
	move.l #$2000e00,(4,a6)
	move.b #$18,($aa,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;==============================================================================
loc_03f860:
	jsr loc_02ed00
	beq.w loc_03f674
	move.l #$2000e00,(4,a6)
	move.b #$1a,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;==============================================================================
loc_03f886:
	tst.b ($b9,a6)
	bne.b loc_03f894
	tst.b ($bc,a6)
	beq.w loc_03f68c

loc_03f894:
	jsr loc_02ed00
	beq.w loc_03f68c
	move.l #$2000e00,(4,a6)
	move.b #$e,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	rts

;==============================================================================
loc_03f8ba:
	tst.b ($28a,a6)
	bne.w loc_03f5f6
	tst.b ($31,a6)
	bne.b loc_03f8f6
	jsr loc_02ef54
	beq.w loc_03f5f6
	jsr loc_02ecd8
	beq.w loc_03f5f6
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980
 
loc_03f8f6:
	tst.b ($b9,a6)
	bne.w loc_03f5f6
	jsr loc_02ed28
	beq.w loc_03f5f6
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	jmp loc_02f980

;==============================================================================
loc_03f91c:
	jsr loc_02ed00
	beq.w loc_03f64a
	move.l #$2000e00,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;==============================================================================
loc_03f940:
	move.l #$2000e00,(4,a1)
	move.b #$16,($aa,a1)
	move.b #1,($295,a1)
	clr.b ($a9,a6)
	clr.b ($a9,a1)
	clr.b ($216,a6)
	clr.b ($216,a1)
	move.b #$10,($5f,a6)
	move.b #$c,($5f,a1)
	rts

;##############################################################################
;Ai Special move Checks
;##############################################################################
loc_03f972:
	move.b ($aa,a6),d0
	move.w loc_03f97e(pc,d0.w),d1
	jmp loc_03f97e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03f97e:
	dc.w loc_03f99a-loc_03f97e
	dc.w loc_03f9a4-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e
	dc.w loc_03f9cc-loc_03f97e
	dc.w loc_03f9c0-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e
	dc.w loc_03f9e2-loc_03f97e
	dc.w loc_03fa0e-loc_03f97e

	dc.w loc_03f9c0-loc_03f97e
	dc.w loc_03fa16-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e
	dc.w loc_03f9bc-loc_03f97e

;==============================================================================
loc_03f99a:
	move.b #2,($82,a6)
	bra.w loc_03fa06

;==============================================================================
loc_03f9a4:
	cmpi.b #1,($132,a6)
	beq.w loc_03fa0a
	cmpi.w #$30,($11e,a6)
	bcs.w loc_03fa0a
	bra.w loc_03fa06

;==============================================================================
loc_03f9bc:
	bra.w loc_03fa06

;==============================================================================
loc_03f9c0:
	tst.b ($132,a6)
	bmi.w loc_03fa0a
	bra.w loc_03fa06

;==============================================================================
loc_03f9cc:
	tst.b ($132,a6)
	bne.w loc_03fa0a
	cmpi.w #$30,($11e,a6)
	bcs.w loc_03fa0a
	bra.w loc_03fa06


;==============================================================================
loc_03f9e2:
	cmpi.l #$2020202,(4,a6)
	bne.w loc_03fa0a
	tst.b ($31,a6)
	bne.w loc_03fa0a
	tst.b ($2ce,a6)
	bne.w loc_03fa0a
	tst.b ($50,a6)
	bmi.w loc_03fa0a

;------------------------------------------------------------------------------
loc_03fa06:
	moveq #1,d0
	rts

;------------------------------------------------------------------------------
loc_03fa0a:
	moveq #0,d0
	rts

;==============================================================================
loc_03fa0e:
	tst.b ($bc,a6)
	beq.b loc_03fa0a
	bra.b loc_03fa06

;==============================================================================
loc_03fa16:
	cmpi.b #1,($132,a6)
	bne.b loc_03fa0a
	cmpi.w #$48,($11e,a6)
	bcs.b loc_03fa0a
	bra.b loc_03fa06

;##############################################################################
;Special Move Programming
;##############################################################################
loc_03fa28:
	move.b ($aa,a6),d0
	move.w loc_03fa34(pc,d0.w),d1
	jmp loc_03fa34(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fa34:
	dc.w loc_03fa50-loc_03fa34
	dc.w loc_0401ca-loc_03fa34
	dc.w loc_04037c-loc_03fa34
	dc.w loc_03fd66-loc_03fa34
	dc.w loc_04086a-loc_03fa34
	dc.w loc_040432-loc_03fa34
	dc.w loc_040786-loc_03fa34
	dc.w loc_040912-loc_03fa34

	dc.w loc_040950-loc_03fa34
	dc.w loc_0409ba-loc_03fa34
	dc.w loc_040a3c-loc_03fa34
	dc.w loc_040ad6-loc_03fa34
	dc.w loc_040b86-loc_03fa34
	dc.w loc_040c30-loc_03fa34

;==============================================================================
;
;==============================================================================
loc_03fa50:
	move.b (7,a6),d0
	move.w loc_03fa62(pc,d0.w),d1
	jsr loc_03fa62(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fa62:
	dc.w loc_03fa7c-loc_03fa62
	dc.w loc_03faa0-loc_03fa62
	dc.w loc_03facc-loc_03fa62
	dc.w loc_03fb20-loc_03fa62
	dc.w loc_03fb5a-loc_03fa62
	dc.w loc_040b72-loc_03fa62
	dc.w loc_03fbae-loc_03fa62
	dc.w loc_03fc0c-loc_03fa62

	dc.w loc_03fc26-loc_03fa62
	dc.w loc_03fc7c-loc_03fa62
	dc.w loc_03fcd8-loc_03fa62
	dc.w loc_03fce8-loc_03fa62
	dc.w loc_03fd3a-loc_03fa62

;------------------------------------------------------------------------------
loc_03fa7c:
	addq.b #2,(7,a6)
	clr.b ($1f3,a6)
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #5,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03faa0:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	move.l #$28000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff6000,($4c,a6)
	move.b #1,($31,a6)
	rts

;------------------------------------------------------------------------------
loc_03facc:
	tst.b ($1f3,a6)
	beq.b loc_03fb08
	cmpi.b #$31,($1f3,a6)
	bne.b loc_03fae4
	moveq #-$26,d0;
	moveq #$62,d1
	jsr loc_082e36

loc_03fae4:
	subq.b #1,($1f3,a6)
	bne.b loc_03fb1a
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03fb00
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_03fb00:
	move.b loc_03fb1c(pc,d0.w),($25d,a6)
	rts

loc_03fb08
	tst.b ($35,a6)
	beq.w loc_0411b0
	addq.b #2,(7,a6)
	move.b #$a,($1f3,a6)

loc_03fb1a:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fb1c:
	dc.b $00,$00,$00,$00

;------------------------------------------------------------------------------
loc_03fb20:
	bsr.w loc_040ef8
	bsr.w loc_040f12
	tst.b ($1f3,a6)
	beq.b loc_03fb34
	subq.b #1,($1f3,a6)
	beq.b loc_03fb3e

loc_03fb34:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03fb58

loc_03fb3e:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #5,($23f,a6)
	jsr loc_00369c
	jmp loc_02a7ea

loc_03fb58:
	rts

;------------------------------------------------------------------------------
loc_03fb5a:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_03fba8(pc,d0.w),d0
	cmpi.b #$10,(6,a6)
	bne.b loc_03fb6e
	moveq #$44,d0

loc_03fb6e:
	jsr loc_02e3fe
	beq.b loc_03fb9c
	addq.b #4,(7,a6)
	move.w ($64,a6),($14,a6)
	move.b #1,($a9,a6)
	cmpi.b #$10,(6,a6)
	bne.b loc_03fb94
	jsr loc_080668

loc_03fb94:
	moveq #6,d0
	jmp loc_02a758

loc_03fb9c:
	addq.b #2,(7,a6)
	moveq #$e,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fba8:
	dc.w $0041,$0042,$0043

;------------------------------------------------------------------------------
loc_03fbae:
	addq.b #2,(7,a6)
	moveq #$f,d0
	jsr loc_02ef6c
	moveq #0,d1
	move.b ($82,a6),d1
	lsl.w #3,d1
	move.l loc_03fbdc(pc,d1.w),($40,a6)
	move.l loc_03fbdc+4(pc,d1.w),($44,a6)
	move.l loc_03fbdc+8(pc,d1.w),($48,a6)
	move.l loc_03fbdc+$c(pc,d1.w),($4c,a6)
	rts


;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fbdc:
	dc.l $00010000,$00060000,$00000000,$ffffa000
	dc.l $00010000,$00080000,$00000000,$ffffa000
	dc.l $00010000,$000a0000,$00000000,$ffffa000

;------------------------------------------------------------------------------
loc_03fc0c:
	tst.b ($35,a6)
	beq.b loc_03fc20
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($1f8,a6)

loc_03fc20:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03fc26:
	bsr.w loc_040f12
	cmpi.l #$20000,($44,a6)
	bge.b loc_03fc48
	tst.b ($1f8,a6)
	bne.b loc_03fc48
	move.b #1,($1f8,a6)
	moveq #$f,d0
	jmp loc_02a758

loc_03fc48:
	tst.l ($44,a6)
	bmi.b loc_03fc58
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_03fc58:
	addq.b #2,(7,a6)
	move.l #$18000,($40,a6)
	move.l #$fff80000,($44,a6)
	moveq #$a,d0
	jsr loc_0038e4
	moveq #7,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03fc7c:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_03fc94
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_03fc94:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_03fcd2(pc,d0.w),d0
	jsr loc_02e970
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	move.b #$10,($1f2,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsr.w #1,d0
	move.b loc_03fcce(pc,d0.w),($123,a5)
	moveq #8,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fcce:
	dc.b $10,$15,$1a,$1a

loc_03fcd2:
	dc.w $004e,$004f,$0050

;------------------------------------------------------------------------------
loc_03fcd8:
	subq.b #1,($1f2,a6)
	bpl.b loc_03fce2
	addq.b #2,(7,a6)

loc_03fce2:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03fce8:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_03fd34(pc,d0.w),d0
	jsr loc_02e7f2
	addq.b #2,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$44000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #1,($31,a6)
	move.w #$d,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fd34:
	dc.w $0041,$0042,$0043

;------------------------------------------------------------------------------
loc_03fd3a:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_03fd4c
	bra.w loc_040ef8

loc_03fd4c:
	clr.b ($31,a6)
	jsr loc_00369c
	clr.b ($ce,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_03fd66:
	move.b (7,a6),d0
	move.w loc_03fd78(pc,d0.w),d1
	jsr loc_03fd78(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03fd78:;261496
	dc.w loc_03fda4-loc_03fd78
	dc.w loc_03fdd6-loc_03fd78
	dc.w loc_03facc-loc_03fd78
	dc.w loc_03fb20-loc_03fd78
	dc.w loc_03fb5a-loc_03fd78
	dc.w loc_040b72-loc_03fd78
	dc.w loc_03fe02-loc_03fd78
	dc.w loc_03fe28-loc_03fd78

	dc.w loc_03fe4e-loc_03fd78
	dc.w loc_03fe9c-loc_03fd78
	dc.w loc_03fed6-loc_03fd78
	dc.w loc_03ff12-loc_03fd78
	dc.w loc_03ff2c-loc_03fd78
	dc.w loc_03ff86-loc_03fd78
	dc.w loc_03ffb6-loc_03fd78
	dc.w loc_03fff8-loc_03fd78

	dc.w loc_040084-loc_03fd78
	dc.w loc_040094-loc_03fd78
	dc.w loc_040104-loc_03fd78
	dc.w loc_04012c-loc_03fd78
	dc.w loc_040150-loc_03fd78
	dc.w loc_0401a2-loc_03fd78

;------------------------------------------------------------------------------
loc_03fda4:
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03fdb2
	moveq #1,d0

loc_03fdb2:
	move.b d0,($ab,a6)
	move.b #$32,($1f3,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #9,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03fdd6:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	move.l #$28000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff6000,($4c,a6)
	move.b #1,($31,a6)
	rts

;------------------------------------------------------------------------------
loc_03fe02:
	addq.b #2,(7,a6)
	move.l #$20000,($40,a6)
	move.l #$78000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	rts

;------------------------------------------------------------------------------
loc_03fe28:
	tst.b ($1f3,a6)
	beq.b loc_03fe34
	subq.b #1,($1f3,a6)
	rts

loc_03fe34:
	tst.b ($35,a6)
	beq.b loc_03fe48
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($1f8,a6)

loc_03fe48:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03fe4e:
	bsr.w loc_040f12
	cmpi.l #$20000,($44,a6)
	bge.b loc_03fe70
	tst.b ($1f8,a6)
	bne.b loc_03fe70
	move.b #1,($1f8,a6)
	moveq #$f,d0
	jmp loc_02a758

loc_03fe70:
	tst.l ($44,a6)
	bmi.b loc_03fe80
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_03fe80:
	addq.b #2,(7,a6)
	move.l #$fff80000,($44,a6)
	moveq #$e,d0
	jsr loc_0038e4
	moveq #7,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03fe9c:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_040ef8
	addq.b #2,(7,a6)
	moveq #$46,d0
	jsr loc_080b70
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	move.b #$a,($1f2,a6)
	move.b #$a,($123,a5)
	moveq #8,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03fed6:
	subq.b #1,($1f2,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	move.l #$18000,($40,a6)
	move.l #$8a000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$45,d0
	jsr loc_02e970
	moveq #$a,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03ff12:
	tst.b ($35,a6)
	beq.b loc_03ff26
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($1f8,a6)

loc_03ff26:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03ff2c:
	bsr.w loc_040f12
	cmpi.l #$20000,($44,a6)
	bge.b loc_03ff4e
	tst.b ($1f8,a6)
	bne.b loc_03ff4e
	move.b #1,($1f8,a6)
	moveq #$10,d0
	jmp loc_02a758

loc_03ff4e:
	tst.l ($44,a6)
	bmi.b loc_03ff5e
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_03ff5e:
	addq.b #2,(7,a6)
	move.b #$a,($1f2,a6)
	tst.b ($82,a6)
	bne.b loc_03ff84
	move.b #$1e,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

loc_03ff84:
	rts

;------------------------------------------------------------------------------
loc_03ff86:
	subq.b #1,($1f2,a6)
	bpl.b loc_03ff96
	addq.b #2,(7,a6)
	move.b #$28,($1f2,a6)

loc_03ff96:
	move.l #$4000,d0
	tst.b ($b,a6)
	bne.b loc_03ffa4
	neg.l d0

loc_03ffa4:
	add.l d0,($10,a6)
	addi.l #$10000,($14,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03ffb6:
	subq.b #1,($1f2,a6)
	bpl.b loc_03ffd8
	addq.b #2,(7,a6)
	move.l #$fff00000,($44,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

loc_03ffd8:
	move.l #$4000,d0
	tst.b ($b,a6)
	bne.b loc_03ffe6
	neg.l d0

loc_03ffe6:
	add.l d0,($10,a6)
	addi.l #$4000,($14,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03fff8:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_040ef8
	addq.b #2,(7,a6)
	moveq #$60,d3
	moveq #$24,d4
	jsr loc_080e34
	move.w #$80,d3
	moveq #$10,d4
	jsr loc_080e34
	moveq #$40,d3
	moveq #$10,d4
	jsr loc_080e34
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	move.b #$1c,($123,a5)
	move.b #$c,($1f2,a6)
	cmpi.b #4,($82,a6)
	beq.b loc_040050
	move.b #$1c,($1f2,a6)

loc_040050:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_04007e(pc,d0.w),d0
	jsr loc_02e970
	beq.b loc_040076
	cmpi.b #4,($82,a6)
	beq.b loc_040076
	move.b #$30,($1f2,a6)
	move.b #$20,($123,a5)

loc_040076:
	moveq #$c,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04007e:
	dc.w $0046,$0047,$0048

;------------------------------------------------------------------------------
loc_040084:
	subq.b #1,($1f2,a6)
	bpl.b loc_04008e
	addq.b #2,(7,a6)

loc_04008e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040094:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	cmpi.b #4,($82,a6)
	beq.w loc_0400e0
	moveq #$44,d0
	jsr loc_02e7f2
	addq.b #2,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$44000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #1,($31,a6)
	moveq #$d,d0
	jmp loc_02a758

loc_0400e0
	move.b #$26,(7,a6)
	move.l #$80000,($40,a6)
	move.l #0,($48,a6)
	jsr loc_0036d4
	moveq #$2e,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040104:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_040116
	bra.w loc_040ef8

loc_040116:
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_04012c:
	tst.b ($33,a6)
	bpl.b loc_040144
	addq.b #2,(7,a6)
	jsr loc_0036d4
	moveq #$14,d0
	jmp loc_02a758

loc_040144:
	jsr loc_040ef8(pc)
	nop
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040150:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	movea.w ($38,a6),a0
	move.b #1,($2ca,a0)
	move.b #1,($258,a0)
	moveq #$49,d0
	jsr loc_02e7f2
	addq.b #2,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$44000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #1,($31,a6)
	moveq #$d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0401a2:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_0401b4
	bra.w loc_040ef8

loc_0401b4:
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_0401ca:
	move.b (7,a6),d0
	move.w loc_0401d6(pc,d0.w),d1
	jmp loc_0401d6(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0401d6:
	dc.w loc_0401de-loc_0401d6
	dc.w loc_04021c-loc_0401d6
	dc.w loc_0402d8-loc_0401d6
	dc.w loc_040354-loc_0401d6

;------------------------------------------------------------------------------
loc_0401de:
	addq.b #2,(7,a6)
	move.b #$32,($1f3,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.l #$ffffa000,($48,a6)
	bsr.w loc_040360
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$29,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040218:
	dc.b $04,$08,$13,$00

;------------------------------------------------------------------------------
loc_04021c:
	cmpi.b #$2f,($1f3,a6)
	bne.b loc_04023c
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04022e
	moveq #1,d0

loc_04022e:
	move.b d0,($ab,a6)
	moveq #-2,d0
	moveq #$5c,d1
	jsr loc_082e36

loc_04023c:
	tst.b ($1f3,a6)
	beq.b loc_040264
	subq.b #1,($1f3,a6)
	bne.b loc_040288
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04025e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04025e:
	move.b loc_040218(pc,d0.w),($25d,a6)

loc_040264:
	tst.b ($33,a6)
	bmi.b loc_04028a
	tst.b ($35,a6)
	beq.b loc_040278
	clr.b ($35,a6)
	bsr.w loc_040360

loc_040278:
	tst.w ($40,a6)
	bmi.b loc_040282
	bsr.w loc_040ef8

loc_040282:
	jsr loc_02a7ea

loc_040288:
	rts

loc_04028a:
	cmpi.b #4,($82,a6)
	bne.w loc_0411a4
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$b0000,($44,a6)
	move.l #$ffff2000,($4c,a6)
	move.l #$fffc0000,d0
	move.l #$500,d1
	tst.b ($b,a6)
	beq.b loc_0402c4
	neg.l d0
	neg.l d1

loc_0402c4:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	clr.w ($3a,a6)
	moveq #$2c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0402d8:
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
	bcs.b loc_040316
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.b ($31,a6)
	moveq #$2d,d0
	jmp loc_02a758

loc_040316:
	tst.w ($3a,a6)
	bne.b loc_04034c
	tst.w ($44,a6)
	bpl.b loc_040352
	addq.w #1,($3a,a6)
	move.b #$a,($5f,a6)
	clr.l ($44,a6)
	move.l #$ffffa000,($4c,a6)
	movea.w ($38,a6),a4
	cmpi.w #$202,(4,a4)
	bne.b loc_04034c
	addi.l #$30000,($44,a4)

loc_04034c:
	jmp loc_02a7ea

loc_040352:
	rts

;------------------------------------------------------------------------------
loc_040354:
	tst.b ($33,a6)
	bpl.b loc_040316
	jmp loc_02bb26

;------------------------------------------------------------------------------
loc_040360:
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_040370(pc,d0.w),($40,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040370:
	dc.l $00060000
	dc.l $00070000
	dc.l $00080000

;==============================================================================
;
;==============================================================================
loc_04037c:
	move.b (7,a6),d0
	move.w loc_040388(pc,d0.w),d1
	jmp loc_040388(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040388:
	dc.w loc_04038e-loc_040388
	dc.w loc_0403e8-loc_040388
	dc.w loc_0403fc-loc_040388

;------------------------------------------------------------------------------
loc_04038e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #1,($216,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsl.w #2,d1
	move.l loc_0403d0(pc,d1.w),($40,a6)
	move.l loc_0403d0+4(pc,d1.w),($48,a6)
	moveq #2,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0403d0:
	dc.l $000c0000,$ffff0000
	dc.l $000e0000,$ffff0000
	dc.l $00100000,$ffff0000

;------------------------------------------------------------------------------
loc_0403e8:
	tst.b ($35,a6)
	beq.b loc_0403f6
	clr.b ($35,a6)
	addq.b #2,(7,a6)

loc_0403f6:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0403fc:
	tst.b ($33,a6)
	bpl.b loc_04040e
	jsr loc_02e35a
	jmp loc_02baf2

loc_04040e:
	tst.b ($35,a6)
	beq.b loc_04041c
	clr.b ($35,a6)
	clr.b ($ce,a6)

loc_04041c:
	tst.w ($40,a6)
	bmi.b loc_040426
	bsr.w loc_040ef8

loc_040426:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_040432:
	move.b ($7,a6),d0
	move.w loc_040444(pc,d0.w),d1
	jsr loc_040444(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040444:
	dc.w loc_04045a-loc_040444
	dc.w loc_0404a6-loc_040444
	dc.w loc_0404ba-loc_040444
	dc.w loc_0404ee-loc_040444
	dc.w loc_040534-loc_040444
	dc.w loc_040584-loc_040444
	dc.w loc_040b72-loc_040444
	dc.w loc_0405ac-loc_040444

	dc.w loc_0405e4-loc_040444
	dc.w loc_040702-loc_040444
	dc.w loc_040756-loc_040444

;------------------------------------------------------------------------------
loc_04045a:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #8,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$40000,($40,a6)
	move.l #$28000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff6000,($4c,a6)
	move.b #1,($31,a6)
	move.b #1,($a9,a6)
	moveq #$11,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0404a6:
	tst.b ($35,a6)
	beq.w loc_0411b0
	addq.b #2,(7,a6)
	move.b #$a,($1f3,a6)
	rts
  
;------------------------------------------------------------------------------
loc_0404ba:
	bsr.w loc_040ef8
	bsr.w loc_040f12
	tst.b ($1f3,a6)
	beq.b loc_0404ce
	subq.b #1,($1f3,a6)
	beq.b loc_0404d8


loc_0404ce:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0404ec

loc_0404d8:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_02a7ea

loc_0404ec:
	rts

;------------------------------------------------------------------------------
loc_0404ee:
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	moveq #-$1b,d3;e5
	moveq #0,d4
	jsr loc_080e3e
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04051c(pc,d0.w),($40,a6)
	move.l loc_04051c+4(pc,d0.w),($48,a6)
	moveq #$12,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04051c:
	dc.l $00060000,$ffffc000
	dc.l $00080000,$ffffc000
	dc.l $000a0000,$ffffc000

;------------------------------------------------------------------------------
loc_040534:
	move.l ($40,a6),d0
	bmi.b loc_040572
	bsr.w loc_040ef8
	tst.b ($5b,a6)
	beq.b loc_04056c
	clr.b ($5b,a6)
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_04056c
	cmpi.b #$ff,($55,a4)
	beq.b loc_04056c
	tst.b ($50,a4)
	bmi.b loc_040572
	move.b #$e,(7,a6)
	move.b #1,($a9,a6)

loc_04056c:
	jmp loc_02a7ea

loc_040572:
	addq.b #2,(7,a6)
	move.l #$ffffa000,($48,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040584:
	move.l ($40,a6),d0
	bmi.b loc_040594
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_040594:
	move.b #$c,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$17,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0405ac:
	moveq #$4b,d0
	jsr loc_02e3e0
	beq.b loc_040594
	addq.b #2,(7,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff2000,($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_0405e0(pc,d0.w),($1f5,a6)
	moveq #$13,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0405e0:
	dc.b $04,$05,$06,$00

;------------------------------------------------------------------------------
loc_0405e4:
	cmpi.b #2,($35,a6)
	bne.b loc_040610
	cmpi.w #$200,($10,a6)
	ble.b loc_0405fc
	cmpi.w #$300,($10,a6)
	ble.b loc_04060c

loc_0405fc:
	clr.b ($b,a6)
	cmpi.w #$280,($10,a6)
	bge.b loc_04060c
	addq.b #1,($b,a6)

loc_04060c:
	bra.w loc_0406ae

loc_040610:
	tst.b ($35,a6)
	beq.w loc_0406ae
	cmpi.b #2,($35,a6)
	bne.b loc_04062e
	move.b #$18,($123,a5)
	moveq #$46,d0
	jsr loc_080b70

loc_04062e:
	move.l ($40,a6),d0
	bmi.w loc_0406b4
	bsr.w loc_040ef8
	move.b ($80,a5),d0
	andi.w #1,d0
	bne.b loc_04065a
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addq.w #3,d0
	cmp.b ($1f5,a6),d0
	ble.b loc_04065a
	jsr loc_0937b4

loc_04065a:
	move.b ($80,a5),d0
	andi.w #3,d0
	bne.b loc_0406ae
	jsr RNGFunction
	andi.w #$f,d0
	move.w d0,d3
	addi.w #$68,d3
	jsr RNGFunction
	andi.w #$f,d0
	move.w d0,d4
	addi.w #0,d4
	cmpi.b #1,($1f5,a6)
	bne.b loc_040694
	jsr loc_080e48
	bra.b loc_0406ae

loc_040694:
	jsr RNGFunction
	andi.w #$f,d0
	bne.b loc_0406a8
	jsr loc_080e52
	bra.b loc_0406ae

loc_0406a8:
	jsr loc_080e5c

loc_0406ae:
	jmp loc_02a7ea

loc_0406b4:
	subq.b #1,($1f5,a6)
	beq.b loc_0406ea
	moveq #$4a,d0
	jsr loc_02e970
	move.l #$a0000,($40,a6)
	move.l #$ffff2000,($48,a6)
	move.b #8,($123,a5)
	moveq #0,d0
	move.b ($1f5,a6),d0
	add.w d0,d0
	move.w loc_0406f6(pc,d0.w),d0
	jmp loc_02a758

loc_0406ea:
	addq.b #2,(7,a6)
	moveq #$14,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0406f6:
	dc.w $0015,$0016,$0015,$0016,$0015,$0016

;------------------------------------------------------------------------------
loc_040702:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$4c,d0
	jsr loc_02e7f2
	movea.w ($38,a6),a4
	clr.b ($23d,a4)
	move.l #$fffe0000,($40,a6)
	move.l #$44000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #1,($31,a6)
	moveq #$d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040756:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_040ef8
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_040786:
	move.b (7,a6),d0
	move.w loc_040792(pc,d0.w),d1
	jmp loc_040792(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040792:
	dc.w loc_04079c-loc_040792
	dc.w loc_040800-loc_040792
	dc.w loc_040820-loc_040792
	dc.w loc_040840-loc_040792
	dc.w loc_040b72-loc_040792

;------------------------------------------------------------------------------
loc_04079c:
	bsr.w loc_040f12
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_0407bc
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	add.l d1,($40,a6)
	rts

loc_0407bc:
	addq.b #2,(7,a6)
	jsr loc_02c0ac
	moveq #0,d0
	move.b d0,($5e,a6)
	move.b d0,($5d,a6)
	move.b d0,($31,a6)
	move.b d0,($251,a6)
	move.b d0,($250,a6)
	move.b d0,($252,a6)
	move.b #0,($2a0,a6)
	move.w ($64,a6),($14,a6)
	move.b #$a,($1f2,a6)
	move.b #$a,($123,a5)
	moveq #$10,d0
	jmp loc_0038e4

;------------------------------------------------------------------------------
loc_040800:
	addq.b #2,(7,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($2c9,a6),($b,a6)
	moveq #$22,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040820:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	move.b #$1e,($1f6,a6)
	move.b #1,($a9,a6)
	moveq #$23,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040840:
	subq.b #1,($1f6,a6)
	bmi.b loc_04085e
	move.l #$80000,d0
	tst.b ($b,a6)
	bne.b loc_040854
	neg.l d0

loc_040854:
	add.l d0,($10,a6)
	jmp loc_02a7ea

loc_04085e:
	addq.b #2,(7,a6)
	moveq #$24,d0
	jmp loc_02a758

;==============================================================================
;
;==============================================================================
loc_04086a:
	move.b (7,a6),d0
	move.w loc_040876(pc,d0.w),d1
	jmp loc_040876(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040876:
	dc.w loc_040880-loc_040876
	dc.w loc_040896-loc_040876
	dc.w loc_0408ba-loc_040876
	dc.w loc_0408ea-loc_040876
	dc.w loc_040904-loc_040876

;------------------------------------------------------------------------------
loc_040880:
	tst.b ($35,a6)
	beq.b loc_040890
	jsr loc_080e8e
	addq.b #2,(7,a6)

loc_040890:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040896:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff0000,($48,a6)
	moveq #$1b,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0408ba:
	tst.b ($35,a6)
	beq.b loc_0408d2
	cmpi.b #2,($35,a6)
	beq.b loc_0408d8
	move.l ($40,a6),d0
	bmi.b loc_0408d8
	bsr.w loc_040ef8

loc_0408d2:
	jmp loc_02a7ea

loc_0408d8:
	addq.b #2,(7,a6)
	move.l #$ffffa000,($48,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0408ea:
	move.l ($40,a6),d0
	bmi.b loc_0408fa
	bsr.w loc_040ef8
	jmp loc_02a7ea

loc_0408fa:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040904:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_040912:
	move.b (7,a6),d0
	move.w loc_04091e(pc,d0.w),d1
	jmp loc_04091e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04091e:
	dc.w loc_040922-loc_04091e
	dc.w loc_040942-loc_04091e

;------------------------------------------------------------------------------
loc_040922:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_040936
	subq.b #1,($bc,a6)

loc_040936:
	clr.b ($2c8,a6)
	moveq #$21,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040942:
	tst.b ($33,a6)
	bmi.w loc_040b72
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_040950:
	move.b (7,a6),d0
	move.w loc_04095c(pc,d0.w),d1
	jmp loc_04095c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04095c:
	dc.w loc_040962-loc_04095c
	dc.w loc_040978-loc_04095c
	dc.w loc_04099c-loc_04095c

;------------------------------------------------------------------------------
loc_040962:
	tst.b ($35,a6)
	beq.b loc_040972
	addq.b #2,(7,a6)
	jsr loc_080e8e

loc_040972:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040978:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff4000,($48,a6)
	moveq #$1c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_04099c:
	tst.b ($33,a6)
	bmi.w loc_0411aa
	tst.b ($35,a6)
	beq.b loc_0409b4
	move.l ($40,a6),d0
	bmi.b loc_0409b4
	bsr.w loc_040ef8

loc_0409b4:
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_0409ba:
	move.b (7,a6),d0
	move.w loc_0409c6(pc,d0.w),d1
	jmp loc_0409c6(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0409c6:
	dc.w loc_0409cc-loc_0409c6
	dc.w loc_0409ec-loc_0409c6
	dc.w loc_040a20-loc_0409c6

;------------------------------------------------------------------------------
loc_0409cc:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_0409e6
	moveq #$2f,d0

loc_0409e6:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_0409ec:
	tst.b ($34,a6)
	beq.b loc_040a1a
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-8,d0
	moveq #$51,d1
	tst.b ($31,a6)
	beq.b loc_040a10
	moveq #-$a,d0
	moveq #$6a,d1

loc_040a10:
	jsr loc_097cd6
	bsr.w loc_0411b6

loc_040a1a:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040a20:
	subq.b #1,($3a,a6)
	bne.w loc_0411b0
	tst.b ($31,a6)
	beq.b loc_040a36
	move.l #$2000602,(4,a6)

loc_040a36:
	jmp loc_02f796

;==============================================================================
;
;==============================================================================
loc_040a3c:
	move.b (7,a6),d0
	move.w loc_040a48(pc,d0.w),d1
	jmp loc_040a48(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040a48:
	dc.w loc_040a4e-loc_040a48
	dc.w loc_040a8a-loc_040a48
	dc.w loc_040ac4-loc_040a48

;------------------------------------------------------------------------------
loc_040a4e:
	addq.b #2,(7,a6)
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	move.b #1,($ce,a6)
	move.b #3,($294,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$1d,d0
	jsr loc_02a758
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_040a86(pc,d0.w),($32,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040a86:
	dc.b $06,$07,$08,$00

;------------------------------------------------------------------------------
loc_040a8a:
	tst.b ($35,a6)
	beq.b loc_040aa2
	moveq #0,d0
	move.b d0,($35,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_040ac0(pc,d0.w),($32,a6)

loc_040aa2:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1e,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040ac0:
	dc.b $18,$1a,$1c,00

;------------------------------------------------------------------------------
loc_040ac4:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	clr.b ($ce,a6)
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_040ad6:
	move.b (7,a6),d0
	move.w loc_040ae8(pc,d0.w),d1
	jsr loc_040ae8(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040ae8:
	dc.w loc_040aee-loc_040ae8
	dc.w loc_040b32-loc_040ae8
	dc.w loc_040b60-loc_040ae8

;------------------------------------------------------------------------------
loc_040aee:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	moveq #$51,d0
	jsr loc_080b70
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$56,d0
	jsr loc_02e714
	bne.b loc_040b2a
	move.b #4,(7,a6)
	moveq #$30,d0
	jmp loc_02a758

loc_040b2a:
	moveq #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040b32:
	tst.b ($35,a6)
	beq.w loc_0411b0
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$56,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040b60:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	clr.b ($ce,a6)
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_040b72:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_040b86:
	move.b (7,a6),d0
	move.w loc_040b92(pc,d0.w),d1
	jmp loc_040b92(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040b92:
	dc.w loc_040b9a-loc_040b92
	dc.w loc_040bd0-loc_040b92
	dc.w loc_040bfc-loc_040b92
	dc.w loc_040b72-loc_040b92

;------------------------------------------------------------------------------
loc_040b9a:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #$a,($1f2,a6)
	move.b #$a,($123,a5)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($2c9,a6),($b,a6)
	moveq #$25,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040bd0:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	addq.b #1,d1
	move.b d1,($1f6,a6)
	move.b #1,($a9,a6)
	addi.b #$26,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040bfc:
	tst.b ($35,a6)
	beq.b loc_040c0c
	clr.b ($35,a6)
	subq.b #1,($1f6,a6)
	bmi.b loc_040c24

loc_040c0c:
	move.l #$80000,d0
	tst.b ($b,a6)
	bne.b loc_040c1a
	neg.l d0

loc_040c1a:
	add.l d0,($10,a6)
	jmp loc_02a7ea

loc_040c24:
	addq.b #2,(7,a6)
	moveq #$24,d0
	jmp loc_02a758

;==============================================================================
;
;==============================================================================
loc_040c30:
	move.b (7,a6),d0
	move.w loc_040c3c(pc,d0.w),d1
	jmp loc_040c3c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040c3c:
	dc.w loc_040c40-loc_040c3c
	dc.w loc_040c66-loc_040c3c

;------------------------------------------------------------------------------
loc_040c40:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$36,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040c66:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	jmp loc_02baf2

;##############################################################################
;Throws
;##############################################################################
loc_040c74:
	cmpi.b #4,($80,a6)
	beq.w loc_040d4c
	move.b (7,a6),d0
	move.w loc_040c90(pc,d0.w),d1
	jsr loc_040c90(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040c90:
	dc.w loc_040c98-loc_040c90
	dc.w loc_040cac-loc_040c90
	dc.w loc_040d1c-loc_040c90
	dc.w loc_040d2a-loc_040c90

;------------------------------------------------------------------------------
loc_040c98:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2f,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040cac:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	moveq #$3f,d0
	tst.b ($81,a6)
	beq.b loc_040cbe
	moveq #$40,d0

loc_040cbe:
	jsr loc_02e3fe
	beq.w loc_040d10
	tst.b ($125,a6)
	beq.b loc_040ce8
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_040cfc
	bra.b loc_040d02

loc_040ce8:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_040d02
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_040d02

loc_040cfc:
	move.b #1,($b,a6)

loc_040d02:
	move.b #6,(7,a6)
	moveq #0,d0
	jmp loc_02a758

loc_040d10:
	addq.b #2,(7,a6)
	moveq #$30,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040d1c:
	tst.b ($33,a6)
	bpl.w loc_0411b0
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_040d2a:
	tst.b ($35,a6)
	beq.b loc_040d46
	move.b #4,(7,a6)
	moveq #$3f,d0
	tst.b ($81,a6)
	beq.b loc_040d40
	moveq #$40,d0

loc_040d40:
	jsr loc_02e7f2

loc_040d46:
	jmp loc_02a7ea

;==============================================================================
;Air Throws
;==============================================================================
loc_040d4c:
	move.b (7,a6),d0
	move.w loc_040d5e(pc,d0.w),d1
	jsr loc_040d5e(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040d5e:
	dc.w loc_040d6c-loc_040d5e
	dc.w loc_040d80-loc_040d5e
	dc.w loc_040df6-loc_040d5e
	dc.w loc_040e0c-loc_040d5e
	dc.w loc_040e7e-loc_040d5e
	dc.w loc_040ece-loc_040d5e
	dc.w loc_040d1c-loc_040d5e

;------------------------------------------------------------------------------
loc_040d6c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$31,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040d80:
	jsr loc_02aa08
	bcs.w loc_0411a4
	tst.b ($33,a6)
	bpl.w loc_0411b0
	moveq #$52,d0
	jsr loc_02e636
	beq.w loc_040de6
	tst.b ($125,a6)
	beq.b loc_040dbe
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_040dd2
	bra.b loc_040dd8


loc_040dbe:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_040dd8
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_040dd8

loc_040dd2:
	move.b #1,($b,a6)

loc_040dd8:
	move.b #6,(7,a6)
	moveq #$33,d0
	jmp loc_02a758

loc_040de6:
	addq.b #2,(7,a6)
	clr.b ($3a,a6)
	moveq #$32,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_040df6:
	jsr loc_02aa08
	bcc.w loc_0411b0
	jsr loc_00369c
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_040e0c:
	tst.b ($35,a6)
	bne.w loc_0411b0
	tst.b ($3a,a6)
	bne.b loc_040e3a
	tst.w ($44,a6)
	bpl.b loc_040e3a
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcs.b loc_040e3a
	st.b ($3a,a6)
	moveq #$34,d0
	jsr loc_02a758

loc_040e3a:
	jsr loc_02aa08
	bcc.w loc_0411b0
	addq.b #2,(7,a6)
	move.b #$17,($3a,a6)
	move.b #$18,($123,a5)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$35,d0
	jsr loc_02a758
	jsr loc_02f9be
	moveq #$55,d0
	jmp loc_02e970

;------------------------------------------------------------------------------
loc_040e7e:
	subq.b #1,($3a,a6)
	bpl.w loc_0411b0
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #$52,d0
	jsr loc_02e7f2
	move.l #$20000,($40,a6)
	move.l #$fffffb00,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_040ec6
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_040ec6:
	moveq #$14,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_040ece:
	jsr loc_02aa08
	bcc.w loc_0411b0
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	moveq #$11,d0
	jmp loc_02a708

;==============================================================================
loc_040ef8:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_040f04
	neg.l d0

loc_040f04:
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	add.l d1,($40,a6)
	rts

;==============================================================================
loc_040f12:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;##############################################################################
;
;##############################################################################
loc_040f24:
	move.b (6,a6),d0
	move.w loc_040f30(pc,d0.w),d1
	jmp loc_040f30(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040f30:
	dc.w loc_040f3a-loc_040f30
	dc.w loc_040f4c-loc_040f30
	dc.w loc_040f62-loc_040f30
	dc.w loc_040fd4-loc_040f30
	dc.w loc_041104-loc_040f30

;------------------------------------------------------------------------------
loc_040f3a:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_040f4c:
	tst.b ($124,a5)
	bne.b loc_040f5c
	tst.b ($11c,a5)
	bne.b loc_040f5c
	addq.b #2,(6,a6)

loc_040f5c:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_040f62:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.b loc_040f90
	jsr RNGFunction
	andi.w #$3f,d0
	bne.b loc_040f8c
	moveq #4,d0
	bra.b loc_040f90

loc_040f8c:
	andi.w #$f,d0

loc_040f90:
	move.b loc_040fb8(pc,d0.w),d0
	tst.b ($132,a6)
	bpl.b loc_040fa2
	cmpi.b #3,d0
	bcs.b loc_040fa2
	moveq #5,d0

loc_040fa2:
	add.w d0,d0
	move.b d0,($2c4,a6)
	ext.w d0
	move.w d0,($1f0,a6)
	move.w loc_040fc8(pc,d0.w),d0
	jmp loc_02a708

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040fb8:
	dc.b $00,$01,$02,$03,$04,$00,$01,$02
	dc.b $03,$00,$01,$02,$03,$00,$01,$02

loc_040fc8:
	dc.w $0023,$0024,$0025,$0026,$0027,$0026

;------------------------------------------------------------------------------
loc_040fd4:
	move.w ($1f0,a6),d0
	move.w loc_040fe0(pc,d0.w),d1
	jmp loc_040fe0(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_040fe0:
	dc.w loc_040fec-loc_040fe0
	dc.w loc_040ff2-loc_040fe0
	dc.w loc_041022-loc_040fe0
	dc.w loc_041064-loc_040fe0
	dc.w loc_04108c-loc_040fe0
	dc.w loc_0410d4-loc_040fe0

;------------------------------------------------------------------------------
loc_040fec:
	addq.b #2,(6,a6)
	rts

;------------------------------------------------------------------------------
loc_040ff2:
	tst.b ($33,a6)
	bpl.b loc_041000
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_041000:
	tst.b ($35,a6)
	beq.b loc_04101c
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04101c
	move.l #$1003a06,(a4)
	move.w a6,($36,a4)

loc_04101c:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_041022:
	tst.b ($33,a6)
	bpl.b loc_041030
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_041030:
	tst.b ($35,a6)
	beq.b loc_04105e
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04105e
	move.l #$1003a00,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_04105e
	move.l #$1003a01,(a4)
	move.w a6,($36,a4)

loc_04105e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_041064:
	tst.b ($33,a6)
	bpl.b loc_041072
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_041072:
	tst.b ($35,a6)
	beq.b loc_041086
	clr.b ($35,a6)
	moveq #7,d3
	moveq #$47,d4
	jsr loc_080e66

loc_041086:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_04108c:
	tst.b ($3a,a6)
	beq.b loc_0410a0
	subq.b #1,($3a,a6)
	bne.b loc_0410a0
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0410a0:
	tst.b ($35,a6)
	beq.b loc_0410ce
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_0410ce
	move.l #$1003a02,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0410ce
	move.l #$1003a03,(a4)
	move.w a6,($36,a4)

loc_0410ce:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0410d4:
	tst.b ($33,a6)
	bpl.b loc_0410e2
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0410e2:
	tst.b ($35,a6)
	beq.b loc_0410fe
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_0410fe
	move.l #$1003a08,(a4)
	move.w a6,($36,a4)

loc_0410fe:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_041104:
	tst.b ($3a,a6)
	beq.b loc_041118
	subq.b #1,($3a,a6)
	bne.b loc_041118
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_041118:
	jmp loc_02a7ea

;##############################################################################
;
;##############################################################################
loc_04111e:
	move.b (6,a6),d0
	move.w loc_04112a(pc,d0.w),d1
	jmp loc_04112a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04112a:
	dc.w loc_041132-loc_04112a
	dc.w loc_041144-loc_04112a
	dc.w loc_041154-loc_04112a
	dc.w loc_04116e-loc_04112a

;------------------------------------------------------------------------------
loc_041132:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_041144:
	tst.b ($11c,a5)
	bne.b loc_04114e
	addq.b #2,(6,a6)

loc_04114e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_041154:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_041168
	moveq #$29,d0

loc_041168:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_04116e:
	tst.b ($35,a6)
	beq.b loc_04118a
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04118a
	move.l #$1003a05,(a4)
	move.w a6,($36,a4)

loc_04118a:
	tst.b ($3a,a6)
	beq.b loc_04119e
	subq.b #1,($3a,a6)
	bne.b loc_04119e
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04119e:
	jmp loc_02a7ea

;==============================================================================
loc_0411a4:
	jmp loc_02baf2

;==============================================================================
loc_0411aa:
	jmp loc_02bb26

;==============================================================================
loc_0411b0:
	jmp loc_02a7ea

;==============================================================================
loc_0411b6:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($1b8,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;##############################################################################
;
;##############################################################################
loc_0411f2:
	dc.w loc_041234-loc_0411f2
	dc.w loc_041234-loc_0411f2
	dc.w loc_0411f8-loc_0411f2

loc_0411f8:
	dc.b $09,$0b,$09,$0b,$09
	dc.b $0b,$09,$0b,$02,$02
	dc.b $02,$02,$09,$0b,$09
	dc.b $0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$09
	dc.b $0b,$02,$02,$08,$0a
	dc.b $09,$0b,$09,$0b,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02

loc_041234:
	dc.b $08,$0a,$08,$0a,$08
	dc.b $0a,$08,$0a,$02,$02
	dc.b $02,$02,$08,$0a,$08
	dc.b $0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$08
	dc.b $0a,$02,$02,$08,$0a
	dc.b $08,$0a,$08,$0a,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02
