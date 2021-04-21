;==============================================
;Start of test menu?
;==============================================
loc_00dd7e:
	clr.b ($83,a5)
	clr.b ($ab,a5)
	jsr loc_0031ba
	move.b #1,($82,a5)
	clr.b ($181,a5)
	clr.b ($182,a5)
	jsr loc_01b0e6
	jsr loc_01bdd6
	bsr.w loc_010cc2
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.w d0,(stageid,a5)
	move.b d0,($8e,a5)
	move.b d0,(Active_Player,a5)
	move.b d0,($aa,a5)
	bsr.w loc_010ea4
	andi.b #$cc,($6b,a5)

loc_00ddea:
	moveq #1,d0
	jsr loc_001370
	move.w #$74,d0
	moveq #$1e,d1
	jsr loc_00141a
	lea.l (-$6024,a5),a6
	move.w (0,a5),d0
	move.w loc_00de10(pc,d0.w),d0
	jsr loc_00de10(pc,d0.w)
	bra.b loc_00ddea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00de10:
	dc.w loc_00de16-loc_00de10
	dc.w loc_00dea0-loc_00de10
	dc.w loc_00defe-loc_00de10

;==============================================
loc_00de16:
	addq.w #2,(0,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)
	move.b #$10,(a6)
	move.b #$10,(1,a6)
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,($26,a5)
	move.w #$300,($28,a5)
	move.w d0,($2a,a5)
	move.w #$700,($2c,a5)
	moveq #0,d0
	tst.w (Region,a5)
	bne.b loc_00de6a
	jsr loc_0168cc
	bra.b loc_00de70

loc_00de6a:
	jsr loc_01557c

loc_00de70:
	jsr loc_001b8e
	beq.b loc_00de9c
	tst.w (Region,a5)
	bne.b loc_00de8e
	lea.l $904264,a1
	moveq #$1d,d1
	moveq #1,d6
	bsr.w loc_010cb4
	bra.b loc_00de9c

loc_00de8e:
	lea.l $900948,a1
	moveq #$1d,d1
	moveq #$c,d6
	bsr.w loc_010ca6

loc_00de9c:
	bra.w loc_00df36

;==============================================
loc_00dea0:
	bsr.w loc_010b64
	moveq #$10,d7
	move.w (4,a6),d6
	andi.w #$c,d6
	beq.b loc_00dedc
	bsr.w loc_00df1c
	btst #3,d6
	beq.b loc_00dec4
	subq.w #2,(4,a5)
	bcc.b loc_00dec4
	move.w d7,(4,a5)

loc_00dec4:
	btst #2,d6
	beq.b loc_00ded8
	addq.w #2,(4,a5)
	cmp.w (4,a5),d7
	bcc.b loc_00ded8
	clr.w (4,a5)

loc_00ded8:
	bsr.w loc_00df36

loc_00dedc:
	btst.b #8,(6,a6)
	beq.b loc_00defc
	addq.w #2,(0,a5)
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

loc_00defc:
	rts

;==============================================
loc_00defe:
	move.w (4,a5),d0
	move.w ServiceMain_States(pc,d0.w),d1
	jmp ServiceMain_States(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
ServiceMain_States:
	dc.w InputTest_Main-ServiceMain_States
	dc.w OutputTest_Main-ServiceMain_States
	dc.w SoundTest_Main-ServiceMain_States
	dc.w ColorBarTest_Main-ServiceMain_States
	dc.w DotCrossTest_Main-ServiceMain_States
	dc.w GameDataTest_Main-ServiceMain_States
	dc.w Configuration_Main-ServiceMain_States
	dc.w MemoryandRomCheck_Main-ServiceMain_States
	dc.w ExitService_Main-ServiceMain_States

;==============================================
loc_00df1c:
	move.l #$200000,d1
	tst.w (Region,a5)
	bne.b loc_00df2e
	move.l #$6c200000,d1

loc_00df2e:
	movea.l ($c,a6),a1
	move.l d1,(a1)
	rts

;==============================================
loc_00df36:
	lea.l $900718,a1
	move.w (4,a5),d0
	lsl.w #2,d0
	move.l #$3e001f,d1
	tst.w (Region,a5)
	bne.b loc_00df68
	lea.l $90418c,a1
	move.w (4,a5),d0
	cmpi.w #$10,d0
	bne.b loc_00df60
	addq.w #2,d0

loc_00df60:
	add.w d0,d0
	move.l #$6d8c003f,d1

loc_00df68:
	lea.l (a1,d0.w),a1
	move.l a1,($c,a6)
	move.l d1,(a1)
	rts

;==============================================
ExitService_Main:
	moveq #0,d0
	move.w d0,(0,a5)
	move.w d0,(4,a5)
	move.w d0,(8,a5)
	move.w d0,($c,a5)
	move.w d0,($10,a5)
	move.w d0,($14,a5)
	move.b d0,($82,a5)
	move.b d0,($71,a5)
	move.b d0,($76,a5)
	move.b d0,($79,a5)
	move.b d0,($7e,a5)
	move.b d0,($6e,a5)
	move.b #1,($a9,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.w #0,d0
	lea.l loc_003eba,a0
	jsr loc_001302
	jmp loc_001324

;==============================================
;Input test
;==============================================
InputTest_Main:
	move.w (8,a5),d0
	move.w loc_00dfd6(pc,d0.w),d1
	jmp loc_00dfd6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00dfd6:
	dc.w loc_00dfda-loc_00dfd6
	dc.w loc_00e004-loc_00dfd6

;==============================================
loc_00dfda:
	addq.w #2,($8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	moveq #1,d0
	jsr loc_01557c
	moveq #$17,d0
	jmp loc_01557c

;==============================================
loc_00e004:
	move.b ($64,a5),d7
	lea.l $900898,a1
	moveq #0,d0
	lsl.b #6,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l $90089c,a1
	moveq #0,d0
	lsl.b #1,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	move.b ($60,a5),d7
	ror.b #4,d7
	lea.l $9008a8,a1
	moveq #0,d0
	lsr.b #1,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l $9010a8,a1
	moveq #0,d0
	lsr.b #1,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l $9008ac,a1
	moveq #0,d0
	lsr.b #3,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l $9010ac,a1
	moveq #0,d0
	lsr.b #1,d7
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l $9007b4,a0
	move.w ($58,a5),d7
	bsr.b loc_00e092
	lea.l $900fb4,a0
	move.w ($5c,a5),d7
	bsr.b loc_00e092
	bsr.w loc_010eec
	moveq #0,d7
	bra.w loc_010c08
	rts

;==============================================
loc_00e092:
	move.w d7,d6
	andi.w #$f,d6
	move.b loc_00e09e(pc,d6.w),d5
	bra.b loc_00e0ae

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e09e:
	dc.b $00,$08,$10,$18,$02,$01,$04,$05,$40,$20,$80,$a0,$42,$21,$84,$a5

;==============================================
loc_00e0ae:
	lea.l (a0),a1
	moveq #2,d6

loc_00e0b2:
	moveq #0,d0
	lsl.b #1,d5
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l ($80,a1),a1
	dbra d6,loc_00e0b2
	lea.l (4,a0),a1
	moveq #1,d6

loc_00e0ca:
	moveq #0,d0
	lsl.b #1,d5
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l ($100,a1),a1
	dbra d6,loc_00e0ca
	lea.l (8,a0),a1
	moveq #2,d6

loc_00e0e2:
	moveq #0,d0
	lsl.b #1,d5
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l ($80,a1),a1
	dbra d6,loc_00e0e2
	move.w d7,d5
	lsr.w #8,d5
	lea.l ($10,a0),a1
	moveq #2,d6

loc_00e0fe:
	moveq #0,d0
	lsr.b #1,d5
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l ($80,a1),a1
	dbra d6,loc_00e0fe
	lsr.b #1,d5
	lea.l ($14,a0),a1
	moveq #2,d6

loc_00e118:
	moveq #0,d0
	lsr.b #1,d5
	roxl.b #1,d0
	bsr.w loc_00e12c
	lea.l ($80,a1),a1
	dbra d6,loc_00e118
	rts

;==============================================
loc_00e12c:
	moveq #$1e,d1
	tst.b d0
	beq.b loc_00e134
	moveq #$1d,d1

loc_00e134:
	move.w d0,(a1)
	move.w d1,(2,a1)
	rts

;==============================================
;Output Test
;==============================================
OutputTest_Main:
	move.w (8,a5),d0
	move.w loc_00e148(pc,d0.w),d1
	jmp loc_00e148(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e148:
	dc.w loc_00e14c-loc_00e148
	dc.w loc_00e19a-loc_00e148

;==============================================
loc_00e14c:
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	andi.b #$cc,($6b,a5)
	moveq #3,d0
	jsr loc_01557c
	cmpi.w #4,(Region,a5)
	beq.b loc_00e184
	cmpi.w #$c,(Region,a5)
	bne.b loc_00e192

loc_00e184:
	tst.b ($ce,a5)
	beq.b loc_00e192
	moveq #4,d0
	jsr loc_01557c

loc_00e192:
	moveq #$17,d0
	jmp loc_01557c

;==============================================
loc_00e19a:
	move.w ($5a,a5),d1
	move.w ($5e,a5),d2
	not.w d1
	not.w d2
	and.w ($58,a5),d1
	and.w ($5c,a5),d2
	bclr.b #0,($6b,a5)
	btst #8,d1
	beq.b loc_00e1c0
	bchg.b #4,($6b,a5)

loc_00e1c0:
	btst #8,d2
	beq.b loc_00e1cc
	bchg.b #5,($6b,a5)

loc_00e1cc:
	btst.b #1,($58,a5)
	beq.b loc_00e1da
	bset.b #0,($6b,a5)

loc_00e1da:
	cmpi.w #4,(Region,a5)
	beq.b loc_00e1ea
	cmpi.w #$c,(Region,a5)
	bne.b loc_00e1fc

loc_00e1ea:
	tst.b ($ce,a5)
	beq.b loc_00e1fc
	btst #9,d2
	beq.b loc_00e1fc
	move.b #1,($d0,a5)

loc_00e1fc:
	bra.w loc_010c7a

;==============================================
;Sound Test
;==============================================
SoundTest_Main:
	move.w (8,a5),d0
	move.w loc_00e20c(pc,d0.w),d1
	jmp loc_00e20c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e20c:
	dc.w loc_00e212-loc_00e20c
	dc.w loc_00e2b8-loc_00e20c
	dc.w loc_00e300-loc_00e20c

;==============================================
loc_00e212:
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,(-$5f64,a5)
	move.b d0,(-$5f62,a5)
	move.b d0,(-$5f61,a5)
	move.b #$10,(a6)
	move.b #$10,(1,a6)
	move.b #$10,(2,a6)
	move.b #$10,(3,a6)
	moveq #7,d0
	jsr loc_01557c
	tst.b ($e4,a5)
	bne.b loc_00e264
	moveq #8,d0
	jsr loc_01557c

loc_00e264:
	moveq #$17,d0
	jsr loc_01557c
	lea.l $90c400,a1
	movem.l (loc_00e298,pc),d0-d3
	movem.l d0-d3,(a1)
	lea.l $90c420,a1
	movem.l (loc_00e2a8,pc),d0-d3
	movem.l d0-d3,(a1)
	bsr.w loc_00e47e
	bsr.w loc_00e3d4
	bra.w loc_00e3e8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e298:
	dc.l $f008f222,$f055f0ff,$ff0ff000,$f008f000

loc_00e2a8:
	dc.l $f008f222,$f055ff00,$ff0ff000,$fff0f000

;==============================================
loc_00e2b8:
	bsr.w loc_00e302
	beq.b loc_00e2c2
	bsr.w loc_00e3d4

loc_00e2c2:
	bsr.w loc_00e4fc
	bsr.w loc_00e3e8
	move.w (6,a6),d0
	btst #8,d0
	bne.w loc_00e37e
	btst #9,d0
	bne.w loc_00e364
	btst #$a,d0
	bne.w loc_00e36a
	move.b ($60,a5),d0
	and.b ($58,a5),d0
	btst #0,d0
	beq.b loc_00e2fe
	jsr loc_0031ba
	bra.w loc_010c88

loc_00e2fe:
	rts

;==============================================
loc_00e300:
	rts

;==============================================
loc_00e302:
	bsr.w loc_010b64
	move.w (4,a6),d0
	move.w d0,d1
	andi.w #$f,d0
	beq.b loc_00e362
	moveq #1,d2
	move.w #$1000,d3
	btst #$a,d1
	beq.b loc_00e322
	move.w #$100,d2

loc_00e322:
	move.w (-$5f64,a5),d1
	btst #3,d0
	beq.b loc_00e32e
	add.w d2,d1

loc_00e32e
	btst #2,d0
	beq.b loc_00e336
	sub.w d2,d1

loc_00e336
	lsl.w #4,d2
	andi.w #$10,d2
	btst #0,d0
	beq.b loc_00e344
	add.w d2,d1

loc_00e344:
	btst #1,d0
	beq.b loc_00e34c
	sub.w d2,d1

loc_00e34c:
	tst.w d1
	bpl.b loc_00e352
	add.w d3,d1

loc_00e352:
	cmp.w d3,d1
	bcs.b loc_00e358
	sub.w d3,d1

loc_00e358:
	andi.w #$7fff,d1
	move.w d1,(-$5f64,a5)
	moveq #-1,d0

loc_00e362:
	rts

;==============================================
loc_00e364:
	jmp loc_0031ba

;==============================================
loc_00e36a:
	tst.b ($bf,a5)
	bne.b loc_00e37c
	move.l #$2220000,d0
	jmp loc_00322e

loc_00e37c:
	rts

;==============================================
loc_00e37e:
	tst.b ($bf,a5)
	beq.b loc_00e39e
	move.w (-$5f64,a5),d0
	lsr.w #4,d0
	move.w d0,d1
	andi.w #$1f,d0
	lsr.w #3,d1
	andi.w #$1c,d1
	move.l loc_00e3b4(pc,d1.w),d1
	btst.l d0,d1
	beq.b loc_00e3b2

loc_00e39e:
	moveq #0,d1
	move.w (-$5f64,a5),d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_003174

loc_00e3b2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e3b4:
	dc.l $ffffffff,$ffffffff,$300fffff,$ffff0fff
	dc.l $ffffffff,$0fff300f,$ffffffff,$ffffffff

;==============================================
loc_00e3d4:
	lea.l $900f18,a1
	move.w (-$5f64,a5),d0
	moveq #$1e,d1
	jmp loc_01b2d8
	rts

;==============================================
loc_00e3e8:
	tst.b ($e4,a5)
	bne.w loc_00e432
	bsr.w loc_00e434
	move.b d0,(-$5f5f,a5)
	lea.l $9001ec,a1
	move.l #$2f2003b,(a1)
	lea.l ($80,a1),a1
	moveq #$27,d1
	move.l #$2f0001b,d2
	move.l #$2f1001d,d3
	bsr.w loc_00e460
	move.l #$2f2001d,(a1)
	lea.l $900be8,a1
	move.b (-$5f5f,a5),d0
	moveq #$1e,d1
	jmp loc_01b282

loc_00e432:
	rts

;==============================================
loc_00e434:
	moveq #0,d1
	move.w ($68,a5),d0
	moveq #4,d2

loc_00e43c
	lsr.w #1,d0
	bcs.b loc_00e446
	addq.b #1,d1
	dbra d2,loc_00e43c

loc_00e446:
	move.w ($68,a5),d0
	lsr.w #5,d0
	moveq #7,d2

loc_00e44e:
	lsr.w #1,d0
	bcs.b loc_00e458
	addq.b #5,d1
	dbra d2,loc_00e44e

loc_00e458:
	moveq #$27,d0
	sub.b d1,d0
	rts

loc_00e45e:
	rts

;==============================================
loc_00e460:
	tst.b d0
	beq.b loc_00e472
	move.l d2,(a1)
	lea.l ($80,a1),a1
	subq.b #1,d0
	subq.w #1,d1
	bne.b loc_00e460
	bra.b loc_00e47c

loc_00e472:
	move.l d3,(a1)
	lea.l ($80,a1),a1
	subq.w #1,d1
	bne.b loc_00e472

loc_00e47c:
	rts

;==============================================
loc_00e47e:
	moveq #0,d0
	moveq #7,d7
	lea.l (-$5fa4,a5),a0
	lea.l (-$5f84,a5),a1

loc_00e48a:
	move.l d0,(a0)+
	move.l d0,(a1)+
	dbra d7,loc_00e48a
	lea.l $900bc0,a0
	move.l #$2f40000,(a0)
	move.l #$2f50000,($80,a0)
	lea.l (4,a0),a0
	moveq #1,d2
	move.l #$2f60000,d0
	bsr.b loc_00e4e6
	moveq #0,d2
	move.l #$2f70000,d0
	bsr.b loc_00e4e6
	moveq #2,d2
	move.l #$2f60000,d0
	bsr.b loc_00e4e6
	move.l #$3020000,(a0)
	move.l #$3030000,($80,a0)
	lea.l (4,a0),a0
	moveq #0,d2
	move.l #$3060000,d0
	bsr.b loc_00e4e6
	bra.b loc_00e4fc

loc_00e4e6:
	move.l d0,d1
	move.l d0,(a0)
	eori.w #$20,d1
	move.l d1,($80,a0)
	lea.l (4,a0),a0
	dbra d2,loc_00e4e6
	rts

;==============================================
;Sound test Equalizer
loc_00e4fc:
	bsr.w loc_00e632
	lea.l $619fe1,a0
	movep.w (0,a0),d0
	moveq #0,d4
	moveq #$f,d1
	lea.l $619fe9,a0
	movep.w (0,a0),d2
	andi.w #$ff,d2
	beq.b loc_00e526

loc_00e51e:
	lsr.w #1,d0
	roxl.w #1,d4
	dbra d1,loc_00e51e

loc_00e526:
	moveq #0,d5
	move.w #$80,d6
	lea.l (-$5fc4,a5),a0
	lea.l (-$5fa4,a5),a1
	lea.l $9003e0,a2
	bsr.b loc_00e54e
	moveq #$20,d5
	moveq #-$80,d6
	lea.l (-$5fb4,a5),a0
	lea.l (-$5f94,a5),a1
	lea.l $901460,a2

loc_00e54e:
	moveq #$f,d7

loc_00e550:
	lea.l (a2),a3
	move.w #$304,d0
	tst.w d7
	bne.b loc_00e55e
	move.w #$305,d0

loc_00e55e:
	moveq #0,d1
	or.b d5,d1
	movem.w d0-d1,(a3)
	lea.l (-4,a3),a3
	moveq #0,d0
	moveq #0,d1
	move.b (a0,d7.w),d0
	move.b (a1,d7.w),d1
	swap d7
	move.w #8,d7

loc_00e57c:
	tst.w d7
	beq.b loc_00e5a2
	cmpi.w #4,d0
	bcs.b loc_00e590
	moveq #4,d2
	bsr.b loc_00e5c4
	subq.w #4,d0
	subq.w #1,d7
	bra.b loc_00e57c

loc_00e590:
	tst.w d7
	beq.b loc_00e5a2
	move.w d0,d2
	bsr.b loc_00e5c4

loc_00e598:
	subq.w #1,d7
	beq.b loc_00e5a2
	moveq #0,d2
	bsr.b loc_00e5c4
	bra.b loc_00e598

loc_00e5a2:
	swap d7
	move.w d7,d0
	addi.w #0,d0
	moveq #0,d1
	btst.l d7,d4
	beq.b loc_00e5b2
	moveq #1,d1

loc_00e5b2:
	movem.w d0-d1,(a3)
	lea.l (-4,a3),a3
	lea.l (a2,d6.w),a2
	dbra d7,loc_00e550
	rts

;==============================================
loc_00e5c4:
	moveq #0,d3
	tst.w d1
	bmi.b loc_00e5d8
	cmpi.w #4,d1
	bgt.b loc_00e5d6
	move.w d1,d3
	moveq #-1,d1
	bra.b loc_00e5d8

loc_00e5d6:
	subq.w #4,d1

loc_00e5d8:
	add.w d3,d2
	lsl.w #2,d3
	add.w d3,d2
	add.w d2,d2
	move.w loc_00e600(pc,d2.w),d2
	addi.w #0,d3
	moveq #0,d3
	cmpi.w #2,d7
	bhi.b loc_00e5f2
	moveq #1,d3

loc_00e5f2:
	or.w d5,d3
	move.w d2,(a3)
	move.w d3,(2,a3)
	lea.l (-4,a3),a3
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e600:
	dc.w $02f3,$02fc,$02fd,$02fe,$02ff,$02fc,$02fc,$02fd
	dc.w $02fe,$02ff,$02f8,$02fd,$02fd,$02fe,$02ff,$02f9
	dc.w $0301,$02fe,$02fe,$02ff,$02fa,$0300,$02fb,$02ff
	dc.w $02ff

;==============================================
loc_00e632:
	lea.l $619e81,a0
	lea.l $619ea1,a1
	lea.l (-$5fc4,a5),a2
	lea.l (-$5fb4,a5),a3
	moveq #$f,d7

loc_00e648:
	move.w d7,d6
	add.w d6,d6
	bsr.w loc_00e6c8
	mulu.w d2,d0
	divu.w #$ff00,d0
	move.w d0,d3
	add.w d3,d0
	add.w d3,d0
	lsr.w #4,d0
	cmpi.b #$20,d0
	bls.b loc_00e666
	moveq #$20,d0

loc_00e666:
	move.b d0,(a2,d7.w)
	mulu.w d2,d1
	divu.w #$ff00,d1
	move.w d1,d3
	add.w d3,d1
	add.w d3,d1
	lsr.w #4,d1
	cmpi.b #$20,d1
	bls.b loc_00e680
	moveq #$20,d1

loc_00e680:
	move.b d1,(a3,d7.w)
	dbra d7,loc_00e648
	lea.l (-$5fc4,a5),a0
	lea.l (-$5fa4,a5),a1
	lea.l (-$5f84,a5),a2
	moveq #$1f,d7

loc_00e696:
	move.b (a0,d7.w),d0
	cmp.b (a1,d7.w),d0
	bcs.b loc_00e6ac
	move.b d0,(a1,d7.w)
	move.b #$30,(a2,d7.w)
	bra.b loc_00e6c2

loc_00e6ac:
	move.b (a2,d7.w),d2
	beq.b loc_00e6c2
	subq.b #1,(a2,d7.w)
	bne.b loc_00e6c2
	subq.b #1,(a1,d7.w)
	move.b #1,(a2,d7.w)

loc_00e6c2:
	dbra d7,loc_00e696
	rts

;==============================================
loc_00e6c8:
	moveq #0,d0
	moveq #$40,d1
	move.b (a1,d6.w),d0
	add.w d0,d0
	sub.w d0,d1
	move.w loc_00e6e8(pc,d0.w),d0
	move.w loc_00e6e8(pc,d1.w),d1
	moveq #0,d2
	move.b (a0,d6.w),d2
	move.b loc_00e72a(pc,d2.w),d2
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e6e8:
	dc.w $ff00,$fee0,$fe80,$fde0,$fcff,$fbde,$fa7a,$f8d2
	dc.w $f6e7,$f4b4,$f23a,$ef75,$ec64,$e902,$e54c,$e13f
	dc.w $dcd6,$d80a,$d2d5,$cd2f,$c70f,$c068,$b92d,$b14b
	dc.w $a8aa,$9f2c,$94a7,$88de,$7b73,$6bcc,$58bc,$3f3f
	dc.w $0000

loc_00e72a:
	dc.b $00,$16,$1f,$27,$2d,$32,$37,$3b,$3f,$43,$46,$4a,$4d,$50,$53,$56
	dc.b $59,$5b,$5e,$60,$63,$65,$67,$6a,$6c,$6e,$70,$72,$74,$76,$78,$7a
	dc.b $7b,$7d,$7f,$81,$82,$84,$86,$87,$89,$8a,$8c,$8e,$8f,$90,$92,$93
	dc.b $95,$96,$97,$99,$9a,$9b,$9d,$9e,$9f,$a1,$a2,$a3,$a4,$a5,$a7,$a8
	dc.b $a9,$aa,$ab,$ac,$ad,$ae,$af,$b0,$b1,$b3,$b4,$b5,$b6,$b7,$b7,$b8
	dc.b $b9,$ba,$bb,$bc,$bd,$be,$bf,$c0,$c1,$c2,$c2,$c3,$c4,$c5,$c6,$c7
	dc.b $c7,$c8,$c9,$ca,$ca,$cb,$cc,$cd,$cd,$ce,$cf,$d0,$d0,$d1,$d2,$d2
	dc.b $d3,$d4,$d5,$d5,$d6,$d6,$d7,$d8,$d8,$d9,$da,$da,$db,$db,$dc,$dd
	dc.b $dd,$de,$de,$df,$df,$e0,$e1,$e1,$e2,$e2,$e3,$e3,$e4,$e4,$e5,$e5
	dc.b $e6,$e6,$e7,$e7,$e8,$e8,$e9,$e9,$e9,$ea,$ea,$eb,$eb,$ec,$ec,$ec
	dc.b $ed,$ed,$ee,$ee,$ee,$ef,$ef,$f0,$f0,$f0,$f1,$f1,$f1,$f2,$f2,$f2
	dc.b $f3,$f3,$f3,$f4,$f4,$f4,$f5,$f5,$f5,$f5,$f6,$f6,$f6,$f7,$f7,$f7
	dc.b $f7,$f8,$f8,$f8,$f8,$f9,$f9,$f9,$f9,$fa,$fa,$fa,$fa,$fa,$fb,$fb
	dc.b $fb,$fb,$fb,$fc,$fc,$fc,$fc,$fc,$fc,$fd,$fd,$fd,$fd,$fd,$fd,$fd
	dc.b $fd,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

;==============================================
;Color
;==============================================
ColorBarTest_Main:
	move.w (8,a5),d0
	move.w loc_00e836(pc,d0.w),d1
	jmp loc_00e836(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e836:
	dc.w loc_00e83c-loc_00e836
	dc.w loc_00e8f4-loc_00e836
	dc.w loc_00e958-loc_00e836


;==============================================
loc_00e83c
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	lea.l ColorBarPalettes(pc),a0
	lea.l $90c400,a1
	moveq #3,d7

loc_00e862:
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_00e862
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
ColorBarPalettes:
;Red
	dc.w $ff00,$fe00,$fd00,$fc00,$fb00,$fa00,$f900,$f800
	dc.w $f700,$f600,$f500,$f400,$f300,$f200,$f100,$f000
;Green
	dc.w $f0f0,$f0e0,$f0d0,$f0c0,$f0b0,$f0a0,$f090,$f080
	dc.w $f070,$f060,$f050,$f040,$f030,$f020,$f010,$f000
;Blue
	dc.w $f00f,$f00e,$f00d,$f00c,$f00b,$f00a,$f009,$f008
	dc.w $f007,$f006,$f005,$f004,$f003,$f002,$f001,$f000
;White
	dc.w $ffff,$feee,$fddd,$fccc,$fbbb,$faaa,$f999,$f888
	dc.w $f777,$f666,$f555,$f444,$f333,$f222,$f111,$f000

;==============================================
loc_00e8f4:
	addq.w #2,(8,a5)
	lea.l $900520,a1
	moveq #0,d1
	bsr.b loc_00e930
	lea.l $900534,a1
	moveq #1,d1
	bsr.b loc_00e930
	lea.l $900548,a1
	moveq #2,d1
	bsr.b loc_00e930
	lea.l $90055c,a1
	moveq #3,d1
	bsr.b loc_00e930
	moveq #9,d0
	jsr loc_01557c
	moveq #$17,d0
	jmp loc_01557c

loc_00e930:
	moveq #$f,d6
	move.w #$1f,d0

loc_00e936:
	moveq #3,d5
	lea.l (a1),a0

loc_00e93a:
	movem.w d0-d1,(a0)
	movem.w d0-d1,($80,a0)
	lea.l (4,a0),a0
	dbra d5,loc_00e93a
	subq.w #1,d0
	lea.l ($100,a1),a1
	dbra d6,loc_00e936
	rts

;==============================================
loc_00e958:
	bsr.w loc_010eec
	moveq #1,d7
	bra.w loc_010c08

;==============================================
;DotCross
;==============================================
DotCrossTest_Main:
	move.w (8,a5),d0
	move.w loc_00e96e(pc,d0.w),d1
	jmp loc_00e96e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00e96e:
	dc.w loc_00e974-loc_00e96e
	dc.w loc_00e9aa-loc_00e96e
	dc.w loc_00ea44-loc_00e96e

;==============================================
loc_00e974:
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,($26,a5)
	move.w #$300,($28,a5)
	move.w #$ffff,$90c800
	move.w #$ff00,$90c820
	rts

;==============================================
loc_00e9aa:
	addq.w #2,(8,a5)
	lea.l $904004,a1
	move.l #$6dfd0001,(a1)+
	moveq #$b,d1
	move.l #$6df00001,d0

loc_00e9c2:
	move.l d0,(a1)+
	dbra d1,loc_00e9c2
	move.l #$6dfe0001,(a1)+
	lea.l (8,a1),a1
	moveq #$14,d2

loc_00e9d4:
	move.l #$6dfe0001,(a1)+
	moveq #$a,d1
	move.l #$6dfd0000,d0

loc_00e9e2:
	move.l d0,(a1)+
	dbra d1,loc_00e9e2
	move.l #$6dfe0000,(a1)+
	move.l #$6dfe0001,(a1)+
	lea.l (8,a1),a1
	dbra d2,loc_00e9d4
	move.l #$6dfe0001,(a1)+
	moveq #$a,d1
	move.l #$6df00000,d0

loc_00ea0a:
	move.l d0,(a1)+
	dbra d1,loc_00ea0a
	move.l #$6dff0000,(a1)+
	move.l #$6dfe0001,(a1)+
	lea.l (8,a1),a1
	moveq #$c,d1
	move.l #$6df00001,d0

loc_00ea28:
	move.l d0,(a1)+
	dbra d1,loc_00ea28
	move.l #$6dff0001,(a1)+
	moveq #$a,d0
	jsr loc_01557c
	moveq #$17,d0
	jmp loc_01557c

;==============================================
loc_00ea44:
	bsr.w loc_010eec
	moveq #3,d7
	bra.w loc_010c08

;==============================================
;Game Data
;==============================================
GameDataTest_Main:
	move.w (8,a5),d0
	move.w loc_00ea5a(pc,d0.w),d1
	jmp loc_00ea5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ea5a:
	dc.w loc_00ea5e-loc_00ea5a
	dc.w loc_00ea98-loc_00ea5a

;==============================================
loc_00ea5e:
	addq.w #2,($8,a5)
	jsr loc_01b0e6
	moveq #$b,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_00ea7c
	cmpi.w #$c,(Region,a5)
	beq.b loc_00ea7c
	addq.w #2,d0

loc_00ea7c:
	tst.b ($86,a5)
	beq.b loc_00ea84
	addq.w #1,d0

loc_00ea84:
	jsr loc_01557c
	moveq #$17,d0
	jsr loc_01557c
	jsr loc_002e5e

loc_00ea98:
	cmpi.w #4,(Region,a5)
	beq.b loc_00eaa8
	cmpi.w #$c,(Region,a5)
	bne.b loc_00eae2

loc_00eaa8:
	move.w ($58,a5),d0
	move.w ($5a,a5),d1
	not.w d1
	and.w d0,d1
	andi.w #$2600,d1
	beq.b loc_00eae2
	cmpi.w #$2600,d0
	bne.b loc_00eae2
	moveq #1,d0
	jsr loc_0013f8
	jsr loc_001dfa
	moveq #0,d0
	jsr loc_0013f8
	jsr loc_002c08
	jmp loc_002e5e

loc_00eae2:
	bsr.w loc_010eec
	moveq #2,d7
	bra.w loc_010c08

;==============================================
;Configuration
;==============================================
Configuration_Main:
	move.w (8,a5),d0
	move.w loc_00eaf8(pc,d0.w),d1
	jmp loc_00eaf8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00eaf8:
	dc.w loc_00eb00-loc_00eaf8
	dc.w loc_00ebb4-loc_00eaf8
	dc.w loc_00ec16-loc_00eaf8
	dc.w loc_00ecd6-loc_00eaf8

;==============================================
loc_00eb00:
	addq.w #2,($8,a5)
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,($26,a5)
	move.w #$300,($28,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b ($97,a5),(-$5f5d,a5)
	move.b ($97,a5),(-$5f5c,a5)
	move.b ($98,a5),(-$5f5b,a5)
	move.b ($98,a5),(-$5f5a,a5)
	move.b ($96,a5),(-$5f59,a5)
	move.b ($99,a5),(-$5f58,a5)
	move.b ($9a,a5),(-$5f57,a5)
	move.b ($9b,a5),(-$5f56,a5)
	move.b ($bb,a5),(-$5f55,a5)
	move.b ($bc,a5),(-$5f52,a5)
	move.b ($ce,a5),(-$5f51,a5)
	move.b ($d2,a5),(-$5f50,a5)
	move.b ($d3,a5),(-$5f4f,a5)
	move.w ($92,a5),(-$5f54,a5)
	move.b ($a0,a5),(-$5f4e,a5)
	move.b ($a1,a5),(-$5f4d,a5)
	move.b (Timer_Speed,a5),(-$5f4c,a5)
	move.b (Game_Turbo,a5),(-$5f4b,a5)
	move.b ($de,a5),(-$5f4a,a5)
	move.b ($df,a5),(-$5f49,a5)
	move.b ($a5,a5),(-$5f48,a5)
	move.b ($a4,a5),(-$5f47,a5)
	move.b ($a4,a5),(-$5f46,a5)
	bra.w loc_010cc2

;==============================================
loc_00ebb4:
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	move.b #$10,(a6)
	move.b #$10,(1,a6)
	tst.w (Region,a5)
	bne.b loc_00ebd8
	moveq #1,d0
	jsr loc_0168cc
	bra.b loc_00ebe0

loc_00ebd8:
	moveq #$f,d0
	jsr loc_01557c

loc_00ebe0:
	jsr loc_001bc2
	beq.b loc_00ec0c
	tst.w (Region,a5)
	bne.b loc_00ebfe
	lea.l $904254,a1
	moveq #$1d,d1
	moveq #3,d6
	bsr.w loc_010cb4
	bra.b loc_00ec0c

loc_00ebfe
	lea.l $900aac,a1
	moveq #$1d,d1
	moveq #6,d6
	bsr.w loc_010ca6

loc_00ec0c:
	bsr.w loc_00ed04
	moveq #$1b,d1
	bra.w loc_00ed42

;==============================================
loc_00ec16:
	bsr.w loc_010b64
	move.w #6,d7
	move.w (4,a6),d6
	andi.w #$c,d6
	beq.b loc_00ec6e
	bsr.w loc_00ecea
	btst #3,d6
	beq.b loc_00ec3c
	subq.w #2,($c,a5)
	bcc.b loc_00ec3c
	move.w d7,($c,a5)

loc_00ec3c:
	btst #2,d6
	beq.b loc_00ec50
	addq.w #2,($c,a5)
	cmp.w ($c,a5),d7
	bcc.b loc_00ec50
	clr.w ($c,a5)

loc_00ec50:
	bsr.w loc_00ed04
	moveq #$1d,d1
	cmpi.w #6,($c,a5)
	beq.b loc_00ec6a
	moveq #$1e,d1
	cmpi.w #4,($c,a5)
	beq.b loc_00ec6a
	moveq #$1b,d1

loc_00ec6a:
	bsr.w loc_00ed42

loc_00ec6e:
	cmpi.w #4,($c,a5)
	beq.b loc_00ec8e
	btst.b #0,(6,a6)
	beq.b loc_00ecd4
	addq.w #2,(8,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	bra.b loc_00ecd4

loc_00ec8e:
	move.w (6,a6),d0
	andi.w #$300,d0
	beq.b loc_00ecd4
	move.w (4,a6),d0
	andi.w #$300,d0
	cmpi.w #$300,d0
	bne.b loc_00ecd4
	jsr loc_001b12
	move.b ($98,a5),(-$5f5a,a5)
	tst.w (Region,a5)
	bne.b loc_00ecc6
	lea.l $904254,a1
	moveq #$1f,d1
	moveq #3,d6
	bra.w loc_010cb4

loc_00ecc6:
	lea.l $900aac,a1
	moveq #$1f,d1
	moveq #6,d6
	bra.w loc_010ca6

loc_00ecd4:
	rts

;==============================================
loc_00ecd6:
	move.w ($c,a5),d0
	move.w loc_00ece2(pc,d0.w),d0
	jmp loc_00ece2(pc,d0.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ece2:
	dc.w loc_00ee72-loc_00ece2
	dc.w loc_00f09a-loc_00ece2
	dc.w loc_00f192-loc_00ece2
	dc.w loc_00f192-loc_00ece2

;----------------------------------------------
loc_00ecea:
	move.l #$200000,d1
	tst.w (Region,a5)
	bne.b loc_00ecfc
	move.l #$6c200000,d1

loc_00ecfc:
	movea.l ($c,a6),a1
	move.l d1,(a1)
	rts

;----------------------------------------------
loc_00ed04:
	lea.l $90081c,a1
	move.w ($c,a5),d0
	lsl.w #2,d0
	move.l #$3e001f,d1
	tst.w (Region,a5)
	bne.b loc_00ed36
	lea.l $90418c,a1
	move.w ($c,a5),d0
	cmpi.w #6,d0
	bne.b loc_00ed2e
	addq.w #2,d0

loc_00ed2e:
	add.w d0,d0
	move.l #$6d8c003f,d1

loc_00ed36:
	lea.l (a1,d0.w),a1
	move.l a1,($c,a6)
	move.l d1,(a1)
	rts

;----------------------------------------------
loc_00ed42:
	move.w ($c,a5),d0
	tst.w (Region,a5)
	bne.w loc_00ede0
	lsl.w #4,d0
	lea.l loc_00ed60(pc,d0.w),a0
	moveq #$f,d2
	lea.l $904138,a1
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ed60:
	dc.w $2b60,$2b60,$2b60,$2c26,$2c41,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2b9c,$2c75,$2c72,$2b60,$2b60,$2b60
	dc.w $2b60,$2b60,$2b60,$2c26,$2c41,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2b9c,$2c75,$2c72,$2b60,$2b60,$2b60
	dc.w $2b60,$2c26,$2c41,$2bcc,$2c10,$2c0d,$2bd4,$2c26
	dc.w $2c21,$2c27,$2b9c,$2be8,$2bce,$2c0d,$2bd4,$2b60
	dc.w $2c26,$2c41,$2bcc,$2c10,$2c0d,$2bd4,$2c26,$2b9c
	dc.w $2bd3,$2bcd,$2bd4,$2be2,$2bd6,$2c0f,$2bbd,$2b7d

;--------;--------;--------;--------;--------;--------;--------;--------;------
loc_00ede0:
	lsl.w #4,d0
	lea.l loc_00edf2(pc,d0.w),a0
	moveq #$18,d2
	lea.l $9006f0,a1
	bra.w loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00edf2:
	dc.b 'START  = 1P SHOT1               '
	dc.b 'START  = 1P SHOT1               '
	dc.b 'RESET  = 1P SHOT1 & SHOT2       '
	dc.b 'EXIT   = 1P SHOT1               '

;==============================================
loc_00ee72:
	move.w ($10,a5),d0
	move.w loc_00ee7e(pc,d0.w),d0
	jmp loc_00ee7e(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ee7e:
	dc.w loc_00ee82-loc_00ee7e
	dc.w loc_00ef36-loc_00ee7e

;==============================================
loc_00ee82:
	addq.w #2,($10,a5)
	jsr loc_01b0e6
	move.b #$10,(a6)
	move.b #$10,($1,a6)
	tst.w (Region,a5)
	bne.b loc_00eea6
	moveq #2,d0
	jsr loc_0168cc
	bra.b loc_00eeca

loc_00eea6:
	moveq #$13,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_00eec4
	cmpi.w #$c,(Region,a5)
	beq.b loc_00eec4
	moveq #$12,d0
	cmpi.w #8,(Region,a5)
	beq.b loc_00eec4
	moveq #$10,d0

loc_00eec4:
	jsr loc_01557c

loc_00eeca:
	bsr.w loc_00f86e
	bsr.w loc_00fd84
	bsr.w loc_00fdda
	bsr.w loc_00fe46
	bsr.w loc_00fe94
	bsr.w loc_00ff3e
	bsr.w loc_00ffea
	cmpi.w #8,(Region,a5)
	bne.b loc_00eef2
	bsr.w loc_010040

loc_00eef2:
	cmpi.w #4,(Region,a5)
	beq.b loc_00ef02
	cmpi.w #$c,(Region,a5)
	bne.b loc_00ef0e

loc_00ef02:
	bsr.w loc_0100c8
	bsr.w loc_010114
	bsr.w loc_0101a0

loc_00ef0e:
	moveq #$1b,d1
	bsr.w loc_00f1fc
	moveq #$14,d7
	cmpi.w #4,(Region,a5)
	beq.b loc_00ef32
	cmpi.w #$c,(Region,a5)
	beq.b loc_00ef32
	moveq #$10,d7
	cmpi.w #8,(Region,a5)
	beq.b loc_00ef32
	moveq #$e,d7

loc_00ef32:
	bra.w loc_00f1c0

;==============================================
loc_00ef36:
	bsr.w loc_010b64
	moveq #$14,d7
	cmpi.w #4,(Region,a5)
	beq.b loc_00ef58
	cmpi.w #$c,(Region,a5)
	beq.b loc_00ef58
	moveq #$10,d7
	cmpi.w #8,(Region,a5)
	beq.b loc_00ef58
	moveq #$e,d7

loc_00ef58:
	move.w (4,a6),d6
	andi.w #$c,d6
	beq.w loc_00f02e
	bsr.w loc_00ecea
	btst #3,d6
	beq.b loc_00efc0
	subq.w #2,($14,a5)
	bcc.b loc_00ef78
	move.w d7,($14,a5)

loc_00ef78:
	cmpi.w #2,($14,a5)
	bne.b loc_00ef94
	tst.b ($a5,a5)
	bne.b loc_00ef8e
	cmpi.b #$11,($97,a5)
	bne.b loc_00ef94

loc_00ef8e:
	move.w #0,($14,a5)

loc_00ef94:
	cmpi.w #4,(Region,a5)
	beq.b loc_00efa4
	cmpi.w #$c,(Region,a5)
	bne.b loc_00efc0

loc_00efa4:
	cmpi.w #$10,($14,a5)
	beq.b loc_00efb4
	cmpi.w #$12,($14,a5)
	bne.b loc_00efc0

loc_00efb4:
	tst.b ($ce,a5)
	bne.b loc_00efc0
	move.w #$e,($14,a5)

loc_00efc0:
	btst #2,d6
	beq.b loc_00f01c
	addq.w #2,($14,a5)
	cmp.w ($14,a5),d7
	bcc.b loc_00efd4
	clr.w ($14,a5)

loc_00efd4:
	cmpi.w #2,($14,a5)
	bne.b loc_00eff0
	tst.b ($a5,a5)
	bne.b loc_00efea
	cmpi.b #$11,($97,a5)
	bne.b loc_00eff0

loc_00efea:
	move.w #4,($14,a5)

loc_00eff0:
	cmpi.w #4,(Region,a5)
	beq.b loc_00f000
	cmpi.w #$c,(Region,a5)
	bne.b loc_00f01c

loc_00f000:
	cmpi.w #$10,($14,a5)
	beq.b loc_00f010
	cmpi.w #$12,($14,a5)
	bne.b loc_00f01c

loc_00f010:
	tst.b ($ce,a5)
	bne.b loc_00f01c
	move.w #$14,($14,a5)

loc_00f01c:
	bsr.w loc_00f1c0
	moveq #$1d,d1
	cmp.w ($14,a5),d7
	beq.b loc_00f02a
	moveq #$1b,d1

loc_00f02a:
	bsr.w loc_00f1fc

loc_00f02e:
	move.w ($14,a5),d0
	cmpi.w #4,(Region,a5)
	beq.b loc_00f05a
	cmpi.w #8,(Region,a5)
	beq.b loc_00f052
	cmpi.w #$c,(Region,a5)
	beq.b loc_00f05a
	move.w loc_00f062(pc,d0.w),d1
	jmp loc_00f062(pc,d1.w)

loc_00f052:
	move.w loc_00f072(pc,d0.w),d1
	jmp loc_00f072(pc,d1.w)

loc_00f05a:
	move.w loc_00f084(pc,d0.w),d1
	jmp loc_00f084(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Asia/US
loc_00f062:
	dc.w loc_00f7b6-loc_00f062
	dc.w loc_00fd6a-loc_00f062;64
	dc.w loc_00fdc6-loc_00f062;66
	dc.w loc_00fe32-loc_00f062;68
	dc.w loc_00fe80-loc_00f062;6a
	dc.w loc_00ff0c-loc_00f062;6c
	dc.w loc_00ffd6-loc_00f062
	dc.w loc_00f79c-loc_00f062

;Euro
loc_00f072:
	dc.w loc_00f7b6-loc_00f072
	dc.w loc_00fd6a-loc_00f072
	dc.w loc_00fdc6-loc_00f072
	dc.w loc_00fe32-loc_00f072
	dc.w loc_00fe80-loc_00f072
	dc.w loc_00ff0c-loc_00f072
	dc.w loc_00ffd6-loc_00f072
	dc.w loc_01002c-loc_00f072
	dc.w loc_00f79c-loc_00f072

;Brazil
loc_00f084:
	dc.w loc_00f7b6-loc_00f084
	dc.w loc_00fd6a-loc_00f084
	dc.w loc_00fdc6-loc_00f084
	dc.w loc_00fe32-loc_00f084
	dc.w loc_00fe80-loc_00f084
	dc.w loc_00ff0c-loc_00f084
	dc.w loc_00ffd6-loc_00f084
	dc.w loc_0100b4-loc_00f084
	dc.w loc_0100e2-loc_00f084
	dc.w loc_01016e-loc_00f084
	dc.w loc_00f79c-loc_00f084

;==============================================
loc_00f09a:
	move.w ($10,a5),d0
	move.w loc_00f0a6(pc,d0.w),d0
	jmp loc_00f0a6(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00f0a6:
	dc.w loc_00f0aa-loc_00f0a6
	dc.w loc_00f102-loc_00f0a6

;==============================================
loc_00f0aa:
	addq.w #2,($10,a5)
	jsr loc_01b0e6
	move.b #$10,(a6)
	move.b #$10,(1,a6)
	tst.w (Region,a5)
	bne.b loc_00f0ce
	moveq #3,d0
	jsr loc_0168cc
	bra.b loc_00f0d6

loc_00f0ce:
	moveq #$14,d0
	jsr loc_01557c

loc_00f0d6:
	bsr.w loc_010284
	bsr.w loc_010428
	bsr.w loc_0104ee
	bsr.w loc_0105ba
	bsr.w loc_0106c4
	bsr.w loc_010710
	bsr.w loc_0107e8
	bsr.w loc_01085a
	moveq #$1b,d1
	bsr.w loc_00f1fc
	moveq #$10,d7
	bra.w loc_00f1c0

;==============================================
loc_00f102:
	bsr.w loc_010b64
	moveq #$10,d7
	move.w (4,a6),d6
	andi.w #$c,d6
	beq.b loc_00f174
	bsr.w loc_00ecea
	btst #3,d6
	beq.b loc_00f13a
	subq.w #2,($14,a5)
	bcc.b loc_00f126
	move.w d7,($14,a5)

loc_00f126:
	cmpi.w #$e,($14,a5)
	bne.b loc_00f13a
	tst.b ($a5,a5)
	beq.b loc_00f13a
	move.w #$c,($14,a5)

loc_00f13a:
	btst #2,d6
	beq.b loc_00f162
	addq.w #2,($14,a5)
	cmp.w ($14,a5),d7
	bcc.b loc_00f14e
	clr.w ($14,a5)

loc_00f14e:
	cmpi.w #$e,($14,a5)
	bne.b loc_00f162
	tst.b ($a5,a5)
	beq.b loc_00f162
	move.w #$10,($14,a5)

loc_00f162:
	bsr.w loc_00f1c0
	moveq #$1d,d1
	cmp.w ($14,a5),d7
	beq.b loc_00f170
	moveq #$1b,d1

loc_00f170:
	bsr.w loc_00f1fc

loc_00f174:
	move.w ($14,a5),d0
	move.w loc_00f180(pc,d0.w),d1
	jmp loc_00f180(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00f180:
	dc.w loc_01025a-loc_00f180
	dc.w loc_0103fe-loc_00f180
	dc.w loc_0104c2-loc_00f180
	dc.w loc_010588-loc_00f180
	dc.w loc_010692-loc_00f180
	dc.w loc_0106de-loc_00f180
	dc.w loc_0107a2-loc_00f180
	dc.w loc_010840-loc_00f180
	dc.w loc_00f79c-loc_00f180


;==============================================
loc_00f192:
	jsr loc_01b19c
	jsr loc_01b1ae
	moveq #$15,d0
	jsr loc_01557c
	moveq #1,d0
	jsr loc_0013f8
	jsr loc_0019e8
	moveq #0,d0
	jsr loc_0013f8
	bra.w loc_010c88

;==============================================
loc_00f1c0:
	lea.l $900098,a1
	move.w ($14,a5),d0
	lsl.w #2,d0
	move.l #$3e001f,d1
	tst.w (Region,a5)
	bne.b loc_00f1f0
	lea.l $90400c,a1
	move.w ($14,a5),d0
	cmp.w d0,d7
	bne.b loc_00f1e8
	addq.w #2,d0

loc_00f1e8:
	add.w d0,d0
	move.l #$6d8c003f,d1

loc_00f1f0:
	lea.l (a1,d0.w),a1
	move.l a1,($c,a6)
	move.l d1,(a1)
	rts

;==============================================
loc_00f1fc:
	move.w ($14,a5),d0
	move.w d0,d2
	tst.w (Region,a5)
	bne.b loc_00f22c
	lsl.w #4,d0
	lsl.w #3,d2
	add.w d2,d0
	lea.l loc_00f61c(pc),a0
	tst.w ($c,a5)
	beq.b loc_00f21c
	lea.l loc_00f5ec(pc),a0

loc_00f21c:
	lea.l (a0,d0.w),a0
	moveq #$13,d2
	lea.l $9040f8,a1
	bra.w loc_0108cc

loc_00f22c:
	lsl.w #5,d0
	lsl.w #3,d2
	add.w d2,d0
	lea.l loc_00f27c(pc),a0
	cmpi.w #4,(Region,a5)
	beq.b loc_00f256
	cmpi.w #$c,(Region,a5)
	beq.b loc_00f256
	lea.l loc_00f31c(pc),a0
	cmpi.w #$8,(Region,a5)
	beq.b loc_00f256
	lea.l loc_00f36c(pc),a0

loc_00f256:
	tst.w ($c,a5)
	beq.b loc_00f260
	lea.l loc_00f31c(pc),a0

loc_00f260:
	lea.l (a0,d0.w),a0
	moveq #$27,d2
	lea.l $9003f0,a1
	bsr.w loc_0108b4
	moveq #$27,d2
	lea.l $9003f4,a1
	bra.w loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00f27c:
	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '
	
	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

loc_00f31c:
	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

loc_00f36c:
	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'MODIFY SETTING = 1P LEFT or RIGHT       '
	dc.b '               = 1P SHOT1 or SHOT2      '

	dc.b 'RETURN TO CONFIGURATION MENU            '
	dc.b '               = 1P SHOT1               '

;JP Menu
loc_00f5ec:
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60

loc_00f61c:
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2c8a,$2c8b,$2b7f,$2b70,$2b7a,$2bcc,$2c10,$2c0d
	dc.w $2bd4,$2c26,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c27
	dc.w $2b9c,$2c8c,$2c8d,$2b60,$2b60,$2b60,$2b60,$2b60
	dc.w $2b60,$2c26,$2c41,$2bcc,$2c10,$2c0d,$2bd4,$2c26
	dc.w $2b9c,$2c71,$2c72,$2be2,$2bd6,$2c0f,$2bbd,$2b76
	dc.w $2c76,$2b89,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

;==============================================
loc_00f79c:
	btst.b #0,($4,a6)
	beq.b loc_00f7b4
	moveq #0,d0
	move.w #2,($8,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)

loc_00f7b4:
	rts

;==============================================
loc_00f7b6:
	bsr.w loc_010894
	andi.w #3,d0
	beq.w loc_00f86c
	moveq #9,d1
	moveq #1,d3
	cmpi.w #4,(Region,a5)
	beq.b loc_00f7da
	moveq #2,d3
	cmpi.w #$c,(Region,a5)
	beq.b loc_00f7da
	moveq #$12,d1

loc_00f7da:
	moveq #0,d2
	move.b ($97,a5),d2
	btst #1,d0
	beq.b loc_00f812
	subq.b #1,d2
	bcc.b loc_00f7ee
	move.b d1,d2
	bra.b loc_00f804

loc_00f7ee:
	cmpi.w #4,(Region,a5)
	beq.b loc_00f7fe
	cmpi.w #$c,(Region,a5)
	bne.b loc_00f804

loc_00f7fe:
	cmp.b d3,d2
	bls.b loc_00f804
	move.b d3,d2

loc_00f804:
	tst.b ($a5,a5)
	beq.b loc_00f812
	cmpi.b #$11,d2
	bne.b loc_00f812
	moveq #$10,d2

loc_00f812:
	btst #0,d0
	beq.b loc_00f846
	addq.b #1,d2
	cmp.b d1,d2
	bls.b loc_00f822
	moveq #0,d2
	bra.b loc_00f838

loc_00f822:
	cmpi.w #4,(Region,a5)
	beq.b loc_00f832
	cmpi.w #$c,(Region,a5)
	bne.b loc_00f838

loc_00f832:
	cmp.b d3,d2
	bls.b loc_00f846
	move.b d1,d2

loc_00f838:
	tst.b ($a5,a5)
	beq.b loc_00f846
	cmpi.b #$11,d2
	bne.b loc_00f846
	moveq #$12,d2

loc_00f846:
	moveq #0,d0
	tst.b ($a5,a5)
	bne.b loc_00f85a
	moveq #1,d0
	cmpi.b #$11,d2
	beq.b loc_00f85a
	move.b (-$5f5a,a5),d0

loc_00f85a:
	move.b d2,($97,a5)
	move.b d2,(-$5f5c,a5)
	move.b d0,($98,a5)
	bsr.b loc_00f86e
	bra.w loc_00fd84

loc_00f86c:
	rts

;==============================================
loc_00f86e:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($97,a5),d0
	cmp.b (-$5f5d,a5),d0
	beq.b loc_00f87e
	moveq #$1d,d1

loc_00f87e:
	lsl.w #5,d0
	tst.w (Region,a5)
	beq.b loc_00f896
	lea.l loc_00f8aa(pc,d0.w),a0
	lea.l $900918,a1
	moveq #$1c,d2
	bra.w loc_0108b4

loc_00f896:
	lea.l loc_00fb0a(pc),a0
	lea.l (a0,d0.w),a0
	lea.l $90428c,a1
	moveq #$c,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00f8aa:
	dc.b '1 COIN  1 CREDIT                '
	dc.b '1 COIN  2 CREDITS               '
	dc.b '1 COIN  3 CREDITS               '
	dc.b '1 COIN  4 CREDITS               '
	dc.b '1 COIN  5 CREDITS               '
	dc.b '1 COIN  6 CREDITS               '
	dc.b '1 COIN  7 CREDITS               '
	dc.b '1 COIN  8 CREDITS               '
	dc.b '1 COIN  9 CREDITS               '
	dc.b '2 COINS 1 CREDIT                '
	dc.b '3 COINS 1 CREDIT                '
	dc.b '4 COINS 1 CREDIT                '
	dc.b '5 COINS 1 CREDIT                '
	dc.b '6 COINS 1 CREDIT                '
	dc.b '7 COINS 1 CREDIT                '
	dc.b '8 COINS 1 CREDIT                '
	dc.b '9 COINS 1 CREDIT                '
	dc.b '2 COINS START 1 COIN CONTINUE   '
	dc.b 'FREE PLAY                       '

loc_00fb0a:
	dc.w $2c26,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c27,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c28,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c29,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c2a,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c2b,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c2c,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c2d,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c26,$2bca,$2bc2,$2bee,$2c2e,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c27,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c28,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c29,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c2a,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c2b,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c2c,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c2d,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c2e,$2bca,$2bc2,$2bee,$2c26,$2bc8,$2bea,$2bf5
	dc.w $2c0d,$2bd4,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

	dc.w $2c27,$2bcd,$2bd0,$2bbd,$2bd4,$2c26,$2bca,$2bee
	dc.w $2bd3,$2c09,$2bd6,$2c0f,$2bbd,$2b60,$2b60,$2b60

	dc.w $2bdc,$2be8,$2bbd,$2c05,$2bea,$2bc2,$2b60,$2b60
	dc.w $2b60,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60,$2b60

;==============================================
loc_00fd6a:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00fd82
	eori.b #1,($98,a5)
	move.b ($98,a5),(-$5f5a,a5)
	bra.b loc_00fd84

loc_00fd82:
	rts

;==============================================
loc_00fd84:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($98,a5),d0
	cmp.b (-$5f5b,a5),d0
	beq.b loc_00fd94
	moveq #$1d,d1

loc_00fd94:
	tst.w (Region,a5)
	beq.b loc_00fda4
	lea.l $900920,a1
	bra.w loc_0108a2

loc_00fda4:
	lsl.w #3,d0
	lea.l loc_00fdb6(pc,d0.w),a0
	lea.l $904290,a1
	moveq #3,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00fdb6:
	dc.w $2c7e,$2c92,$2b75,$2b62,$2c7e,$2c92,$2b89,$2b60

;==============================================
loc_00fdc6:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00fdd8
	eori.b #$80,($96,a5)
	bra.b loc_00fdda

loc_00fdd8:
	rts

;==============================================
loc_00fdda:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($96,a5),d0
	cmp.b (-$5f59,a5),d0
	beq.b loc_00fdea
	moveq #$1d,d1

loc_00fdea:
	lsr.w #4,d0
	tst.w (Region,a5)
	beq.b loc_00fe02
	lea.l loc_00fe12(pc,d0.w),a0
	lea.l $900928,a1
	moveq #5,d2
	bra.w loc_0108b4

loc_00fe02:
	lea.l loc_00fe22(pc,d0.w),a0
	lea.l $904294,a1
	moveq #3,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00fe12:
	dc.b 'NORMAL  '
	dc.b 'FLIP    '

loc_00fe22:
	dc.w $2bd9,$2bbd,$2bdf,$2be9,$2bdc,$2be8,$2c0d,$2c05

;==============================================
loc_00fe32:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00fe44
	eori.b #1,($99,a5)
	bra.b loc_00fe46

loc_00fe44:
	rts

loc_00fe46:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($99,a5),d0
	cmp.b (-$5f58,a5),d0
	beq.b loc_00fe56
	moveq #$1d,d1

loc_00fe56:
	tst.w (Region,a5)
	beq.b loc_00fe66
	lea.l $900930,a1
	bra.w loc_0108a2

loc_00fe66:
	lsl.w #2,d0
	lea.l loc_00fe78(pc,d0.w),a0
	lea.l $904298,a1
	moveq #1,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00fe78:
	dc.w $2b75,$2b6c,$2b61,$2b88

;==============================================
loc_00fe80:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00fe92
	eori.b #1,($9a,a5)
	bra.b loc_00fe94

loc_00fe92:
	rts

loc_00fe94:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($9a,a5),d0
	cmp.b (-$5f57,a5),d0
	beq.b loc_00fea4
	moveq #$1d,d1

loc_00fea4:
	lsl.w #4,d0
	tst.w (Region,a5)
	beq.b loc_00febc
	lea.l loc_00fecc(pc,d0.w),a0
	lea.l $900938,a1
	moveq #$f,d2
	bra.w loc_0108b4

loc_00febc:
	lea.l loc_00feec(pc,d0.w),a0
	lea.l $90429c,a1
	moveq #6,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00fecc:
	dc.b 'MONAURAL        '
	dc.b 'STEREO (Q SOUND)'

loc_00feec:
	dc.w $2be3,$2bd9,$2be7,$2be9,$2b60,$2b60,$2b60,$2b60
	dc.w $2c42,$2c14,$2bcd,$2bd3,$2bea,$2bc5,$2c15,$2b60

;==============================================
loc_00ff0c:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00ff3c
	moveq #2,d1
	move.b ($9b,a5),d2
	btst #1,d0
	beq.b loc_00ff28
	subq.b #1,d2
	bcc.b loc_00ff28
	move.b d1,d2

loc_00ff28:
	btst #0,d0
	beq.b loc_00ff36
	addq.b #1,d2
	cmp.b d1,d2
	bls.b loc_00ff36
	moveq #0,d2

loc_00ff36:
	move.b d2,($9b,a5)
	bra.b loc_00ff3e

loc_00ff3c:
	rts

;==============================================
loc_00ff3e:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($9b,a5),d0
	cmp.b (-$5f56,a5),d0
	beq.b loc_00ff4e
	moveq #$1d,d1

loc_00ff4e:
	lsl.w #4,d0
	tst.w (Region,a5)
	beq.b loc_00ff66
	lea.l loc_00ff76(pc,d0.w),a0
	lea.l $900940,a1
	moveq #$e,d2
	bra.w loc_0108b4

loc_00ff66:
	lea.l loc_00ffa6(pc,d0.w),a0
	lea.l $9042a0,a1
	moveq #7,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ff76:
	dc.b '2 CHUTES SINGLE '
	dc.b '2 CHUTES MULTI  '
	dc.b '1 CHUTE  SINGLE '

loc_00ffa6:
	dc.w $2c27,$2bcc,$2c0f,$2bbd,$2bd0,$2bbd,$2c82,$2c83
	dc.w $2c27,$2bcc,$2c0f,$2bbd,$2bd0,$2bbd,$2c84,$2c85
	dc.w $2c26,$2bcc,$2c0f,$2bbd,$2bd0,$2bbd,$2b60,$2b60

;==============================================
loc_00ffd6:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_00ffe8
	eori.b #1,($bb,a5)
	bra.b loc_00ffea

loc_00ffe8:
	rts

;==============================================
loc_00ffea:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($bb,a5),d0
	cmp.b (-$5f55,a5),d0
	beq.b loc_00fffa
	moveq #$1d,d1

loc_00fffa:
	tst.w (Region,a5)
	beq.b loc_01000a
	lea.l $900948,a1
	bra.w loc_0108a2

loc_01000a:
	lsl.w #3,d0
	lea.l loc_01001c(pc,d0.w),a0
	lea.l $9042a4,a1
	moveq #2,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01001c:
	dc.w $2b6c,$2b75,$2b62,$2b60,$2b6d,$2b89,$2b60,$2b60

;==============================================
loc_01002c:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_01003e
	eori.b #1,($bc,a5)
	bra.b loc_010040

loc_01003e:
	rts

;==============================================
loc_010040:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($bc,a5),d0
	cmp.b (-$5f52,a5),d0
	beq.b loc_010050
	moveq #$1d,d1

loc_010050:
	lsl.w #3,d0
	lea.l loc_010062(pc,d0.w),a0
	lea.l $900950,a1
	moveq #7,d2
	bra.w loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010062:
	dc.b 'NORMAL  '
	dc.b 'OFF     '

loc_010072:
	rts

loc_010074:
	dc.b 'JAPANESE        '
	dc.b 'ENGLISH         '
	dc.b 'SPANISH         '
	dc.b 'PORTUGUESE      '

;==============================================
loc_0100b4:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_0100c6
	eori.b #1,($ce,a5)
	bra.b loc_0100c8

loc_0100c6:
	rts

;==============================================
loc_0100c8:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($ce,a5),d0
	cmp.b (-$5f51,a5),d0
	beq.b loc_0100d8
	moveq #$1d,d1

loc_0100d8:
	lea.l $900950,a1
	bra.w loc_0108a2

;==============================================
loc_0100e2:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_010112
	move.b ($d2,a5),d2
	btst #1,d0
	beq.b loc_0100fc
	subq.b #1,d2
	bcc.b loc_0100fc
	moveq #6,d2

loc_0100fc:
	btst #0,d0
	beq.b loc_01010c
	addq.b #1,d2
	cmpi.b #6,d2
	bls.b loc_01010c
	moveq #0,d2

loc_01010c:
	move.b d2,($d2,a5)
	bra.b loc_010114

loc_010112:
	rts

;==============================================
loc_010114:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($d2,a5),d0
	cmp.b (-$5f50,a5),d0
	beq.b loc_010124
	moveq #$1d,d1

loc_010124:
	lsl.b #3,d0
	lea.l loc_010136(pc,d0.w),a0
	lea.l $900958,a1
	moveq #7,d2
	bra.w loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010136:
	dc.b 'COM    2'
	dc.b 'COM    3'
	dc.b 'COM    4'
	dc.b 'COM    5'
	dc.b 'COM    6'
	dc.b 'COM    7'
	dc.b 'COM    8'

;==============================================
loc_01016e:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_01019e
	move.b ($d3,a5),d2
	btst #1,d0
	beq.b loc_010188
	subq.b #1,d2
	bcc.b loc_010188
	moveq #$12,d2

loc_010188:
	btst #0,d0
	beq.b loc_010198
	addq.b #1,d2
	cmpi.b #$12,d2
	bls.b loc_010198
	moveq #0,d2

loc_010198:
	move.b d2,($d3,a5)
	bra.b loc_0101a0

loc_01019e:
	rts

;==============================================
loc_0101a0:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($d3,a5),d0
	cmp.b (-$5f4f,a5),d0
	beq.b loc_0101b0
	moveq #$1d,d1

loc_0101b0:
	lsl.b #3,d0
	lea.l loc_0101c2(pc,d0.w),a0
	lea.l $900960,a1
	moveq #7,d2
	bra.w loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0101c2:
	dc.b 'HUMAN  2'
	dc.b 'HUMAN  3'
	dc.b 'HUMAN  4'
	dc.b 'HUMAN  5'
	dc.b 'HUMAN  6'
	dc.b 'HUMAN  7'
	dc.b 'HUMAN  8'
	dc.b 'HUMAN  9'
	dc.b 'HUMAN 10'
	dc.b 'HUMAN 11'
	dc.b 'HUMAN 12'
	dc.b 'HUMAN 13'
	dc.b 'HUMAN 14'
	dc.b 'HUMAN 15'
	dc.b 'HUMAN 16'
	dc.b 'HUMAN 17'
	dc.b 'HUMAN 18'
	dc.b 'HUMAN 19'
	dc.b 'HUMAN 20'

;==============================================
loc_01025a:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_010282
	move.b ($a0,a5),d2
	btst #1,d0
	beq.b loc_010270
	subq.b #1,d2

loc_010270:
	btst #0,d0
	beq.b loc_010278
	addq.b #1,d2

loc_010278:
	andi.b #7,d2
	move.b d2,($a0,a5)
	bra.b loc_010284

loc_010282:
	rts

;==============================================
loc_010284:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($a0,a5),d0
	cmp.b (-$5f4e,a5),d0
	beq.b loc_010294
	moveq #$1d,d1

loc_010294:
	lsl.w #3,d0
	tst.w (Region,a5)
	beq.b loc_0102ac
	lea.l loc_0102be(pc,d0.w),a0
	lea.l $900998,a1
	moveq #5,d2
	bra.w loc_0108b4

loc_0102ac:
	lsl.w #2,d0
	lea.l loc_0102fe(pc,d0.w),a0
	lea.l $90428c,a1
	moveq #$b,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0102be:
	dc.b 'EASY    '
	dc.b 'NORMAL  '
	dc.b 'HARD 1  '
	dc.b 'HARD 2  '
	dc.b 'HARD 3  '
	dc.b 'HARD 4  '
	dc.b 'HARD 5  '
	dc.b 'EXPERT  '

loc_0102fe:
	dc.w $2c86,$2b60,$2c26,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2c27,$2bb6,$2bb6,$2bb6,$2bb6
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2c28,$2bb6,$2bb6,$2bb6
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2bb6,$2c29,$2bb6,$2bb6
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2bb6,$2bb6,$2c2a,$2bb6
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6,$2c2b
	dc.w $2bb6,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6
	dc.w $2c2c,$2bb6,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60
	dc.w $2c86,$2b60,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6,$2bb6
	dc.w $2bb6,$2c2d,$2b60,$2c87,$2b60,$2b60,$2b60,$2b60

;==============================================
loc_0103fe:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_010426
	move.b ($a1,a5),d2
	btst #1,d0
	beq.b loc_010414
	subq.b #1,d2

loc_010414:
	btst #0,d0
	beq.b loc_01041c
	addq.b #1,d2

loc_01041c:
	andi.b #3,d2
	move.b d2,($a1,a5)
	bra.b loc_010428

loc_010426:
	rts

;==============================================
loc_010428:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($a1,a5),d0
	cmp.b (-$5f4d,a5),d0
	beq.b loc_010438
	moveq #$1d,d1

loc_010438:
	lsl.b #3,d0
	tst.w (Region,a5)
	beq.b loc_010450
	lea.l loc_010462(pc,d0.w),a0
	lea.l $9009a0,a1
	moveq #6,d2
	bra.w loc_0108b4

loc_010450:
	add.w d0,d0
	lea.l loc_010482(pc,d0.w),a0
	lea.l $904290,a1
	moveq #7,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010462:
	dc.b 'LOW     '
	dc.b 'NORMAL  '
	dc.b 'HIGH    '
	dc.b 'MAXIMUM '

loc_010482:
	dc.w $2c95,$2b60,$2c26,$2bb6,$2bb6,$2bb6,$2b60,$2c96
	dc.w $2c95,$2b60,$2bb6,$2c27,$2bb6,$2bb6,$2b60,$2c96
	dc.w $2c95,$2b60,$2bb6,$2bb6,$2c28,$2bb6,$2b60,$2c96
	dc.w $2c95,$2b60,$2bb6,$2bb6,$2bb6,$2c29,$2b60,$2c96

;==============================================
loc_0104c2:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_0104ec
	move.b (Timer_Speed,a5),d2
	btst #1,d0
	beq.b loc_0104d8
	subq.b #1,d2

loc_0104d8:
	btst #0,d0
	beq.b loc_0104e0
	addq.b #1,d2

loc_0104e0:
	andi.b #3,d2
	move.b d2,(Timer_Speed,a5)
	bra.w loc_0104ee

loc_0104ec:
	rts

;==============================================
loc_0104ee:
	moveq #$1e,d1
	moveq #0,d0
	move.b (Timer_Speed,a5),d0
	cmp.b (-$5f4c,a5),d0
	beq.b loc_0104fe
	moveq #$1d,d1

loc_0104fe
	lsl.b #3,d0
	tst.w (Region,a5)
	beq.b loc_010516
	lea.l loc_010528(pc,d0.w),a0
	lea.l $9009a8,a1
	moveq #6,d2
	bra.w loc_0108b4

loc_010516:
	add.w d0,d0
	lea.l loc_010548(pc,d0.w),a0
	lea.l $904294,a1
	moveq #7,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010528:
	dc.b 'SLOW    '
	dc.b 'NORMAL  '
	dc.b 'FAST    '
	dc.b 'FASTEST '

loc_010548:
	dc.w $2c93,$2b60,$2c26,$2bb6,$2bb6,$2bb6,$2b60,$2c94
	dc.w $2c93,$2b60,$2bb6,$2c27,$2bb6,$2bb6,$2b60,$2c94
	dc.w $2c93,$2b60,$2bb6,$2bb6,$2c28,$2bb6,$2b60,$2c94
	dc.w $2c93,$2b60,$2bb6,$2bb6,$2bb6,$2c29,$2b60,$2c94

;==============================================
loc_010588:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_0105b8
	move.b (Game_Turbo,a5),d2
	moveq #4,d1
	btst #1,d0
	beq.b loc_0105a4
	subq.b #1,d2
	bcc.b loc_0105a4
	move.b d1,d2

loc_0105a4:
	btst #0,d0
	beq.b loc_0105b2
	addq.b #1,d2
	cmp.b d1,d2
	bls.b loc_0105b2
	moveq #0,d2

loc_0105b2:
	move.b d2,(Game_Turbo,a5)
	bra.b loc_0105ba

loc_0105b8:
	rts

;==============================================
loc_0105ba:
	moveq #$1e,d1
	moveq #0,d0
	move.b (Game_Turbo,a5),d0
	cmp.b (-$5f4b,a5),d0
	beq.b loc_0105ca
	moveq #$1d,d1

loc_0105ca:
	lsl.b #4,d0
	tst.w (Region,a5)
	beq.b loc_0105e2
	lea.l loc_0105f2(pc,d0.w),a0
	lea.l $9009b0,a1
	moveq #$c,d2
	bra.w loc_0108b4

loc_0105e2:
	lea.l loc_010642(pc,d0.w),a0
	lea.l $904298,a1
	moveq #7,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0105f2:
	dc.b 'NORMAL          '
	dc.b 'TURBO 1         '
	dc.b 'TURBO 2         '
	dc.b 'FREE SELECT 1   '
	dc.b 'FREE SELECT 2   '

loc_010642:
	dc.w $2bd9,$2bbd,$2bdf,$2be9,$2b60,$2b60,$2b60,$2b60
	dc.w $2bd0,$2bbd,$2c02,$2c26,$2b60,$2b60,$2b60,$2b60
	dc.w $2bd0,$2bbd,$2c02,$2c27,$2b60,$2b60,$2b60,$2b60
	dc.w $2bdc,$2be8,$2bbd,$2bce,$2bea,$2bc8,$2bd4,$2c26
	dc.w $2bdc,$2be8,$2bbd,$2bce,$2bea,$2bc8,$2bd4,$2c27

;==============================================
loc_010692:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_0106c2
	move.b ($de,a5),d2
	btst #1,d0
	beq.b loc_0106ac
	subq.b #1,d2
	bcc.b loc_0106ac
	moveq #2,d2

loc_0106ac:
	btst #0,d0
	beq.b loc_0106bc
	addq.b #1,d2
	cmpi.b #2,d2
	bls.b loc_0106bc
	moveq #0,d2

loc_0106bc:
	move.b d2,($de,a5)
	bra.b loc_0106c4

loc_0106c2:
	rts

;==============================================
loc_0106c4:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($de,a5),d0
	cmp.b (-$5f4a,a5),d0
	beq.b loc_0106d4
	moveq #$1d,d1

loc_0106d4:
	lsl.b #3,d0
	tst.w (Region,a5)
	beq.b loc_01074a
	bra.b loc_01072a

;==============================================
loc_0106de:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_01070e
	move.b ($df,a5),d2
	btst #1,d0
	beq.b loc_0106f8
	subq.b #1,d2
	bcc.b loc_0106f8
	moveq #2,d2

loc_0106f8:
	btst #0,d0
	beq.b loc_010708
	addq.b #1,d2
	cmpi.b #2,d2
	bls.b loc_010708
	moveq #0,d2

loc_010708:
	move.b d2,($df,a5)
	bra.b loc_010710

loc_01070e:
	rts

;==============================================
loc_010710:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($df,a5),d0
	cmp.b (-$5f49,a5),d0
	beq.b loc_010720
	moveq #$1d,d1

loc_010720:
	lsl.b #3,d0
	tst.w (Region,a5)
	beq.b loc_01075a
	bra.b loc_01073a

loc_01072a:
	lea.l loc_01076a(pc,d0.w),a0
	lea.l $9009b8,a1
	moveq #7,d2
	bra.w loc_0108b4

loc_01073a:
	lea.l loc_01076a(pc,d0.w),a0
	lea.l $9009c0,a1
	moveq #7,d2
	bra.w loc_0108b4

loc_01074a:
	lea.l loc_01078a(pc,d0.w),a0
	lea.l $90429c,a1
	moveq #3,d2
	bra.w loc_0108cc

loc_01075a:
	lea.l loc_01078a(pc,d0.w),a0
	lea.l $9042a0,a1
	moveq #3,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01076a:
	dc.b '1 ROUND '
	dc.b '3 ROUNDS'
	dc.b '5 ROUNDS'
	dc.b '7 ROUNDS'

loc_01078a:
	dc.w $2c26,$2c7b,$2c7c,$2c7d,$2c28,$2c7b
	dc.w $2c7c,$2c7d,$2c2a,$2c7b,$2c7c,$2c7d

;==============================================
loc_0107a2:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_0107e6
	move.b (-$5f5c,a5),d0
	eori.b #1,($a5,a5)
	beq.b loc_0107c6
	moveq #0,d1
	moveq #0,d2
	cmpi.b #$11,d0
	bne.b loc_0107d6
	moveq #0,d0
	bra.b loc_0107d6

loc_0107c6:
	move.b (-$5f5a,a5),d1
	move.b (-$5f46,a5),d2
	cmpi.b #$11,d0
	bne.b loc_0107d6
	moveq #1,d1

loc_0107d6:
	move.b d0,($97,a5)
	move.b d1,($98,a5)
	move.b d2,($a4,a5)
	bsr.b loc_0107e8
	bra.b loc_01085a

loc_0107e6
	rts

;==============================================
loc_0107e8:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($a5,a5),d0
	cmp.b (-$5f48,a5),d0
	beq.b loc_0107f8
	moveq #$1d,d1

loc_0107f8:
	lsl.b #3,d0
	tst.w (Region,a5)
	beq.b loc_010810
	lea.l loc_010820(pc,d0.w),a0
	lea.l $9009c8,a1
	moveq #6,d2
	bra.w loc_0108b4

loc_010810:
	lea.l loc_010830(pc,d0.w),a0
	lea.l $9042a4,a1
	moveq #3,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010820:
	dc.b 'OFF     '
	dc.b '1 MATCH '

loc_010830:
	dc.w $2bd9,$2bbd,$2bdf,$2be9,$2c26,$2bdf,$2c0d,$2bd1

;==============================================
loc_010840:
	bsr.w loc_010894
	andi.w #3,d0
	beq.b loc_010858
	eori.b #1,($a4,a5)
	move.b ($a4,a5),(-$5f46,a5)
	bra.b loc_01085a

loc_010858:
	rts

;==============================================
loc_01085a:
	moveq #$1e,d1
	moveq #0,d0
	move.b ($a4,a5),d0
	cmp.b (-$5f47,a5),d0
	beq.b loc_01086a
	moveq #$1d,d1

loc_01086a:
	tst.w (Region,a5)
	beq.b loc_01087a
	lea.l $9009d0,a1
	bra.w loc_0108a2

loc_01087a:
	lsl.w #2,d0
	lea.l loc_01088c(pc,d0.w),a0
	lea.l $9042a8,a1
	moveq #1,d2
	bra.w loc_0108cc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01088c:
	dc.w $2b75,$2b6c,$2b61,$2b88

;==============================================
loc_010894:
	move.w (4,a6),d0
	move.w (6,a6),d1
	lsr.w #8,d1
	or.b d1,d0
	rts

;==============================================
loc_0108a2:
	lsl.w #2,d0
	lea.l loc_0108ac(pc,d0.w),a0
	moveq #2,d2
	bra.b loc_0108b4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0108ac:
	dc.b 'OFF '
	dc.b 'ON  '

;==============================================
loc_0108b4:
	moveq #0,d0
	move.b (a0)+,d0
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	dbra d2,loc_0108b4
	rts

;==============================================
loc_0108cc:
	move.w (a0)+,d0
	addi.w #$6c00,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($40,a1),a1
	dbra d2,loc_0108cc
	rts

;==============================================
;Memory Check
;==============================================
MemoryandRomCheck_Main:
	move.w (8,a5),d0
	move.w loc_0108ee(pc,d0.w),d1
	jmp loc_0108ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0108ee:
	dc.w loc_0108f6-loc_0108ee
	dc.w loc_01090c-loc_0108ee
	dc.w loc_010938-loc_0108ee
	dc.w loc_010942-loc_0108ee

;==============================================
loc_0108f6:
	addq.w #2,(8,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	moveq #$16,d0
	jmp loc_01557c

;==============================================
loc_01090c:
	moveq #1,d0
	jsr loc_0013f8
	clr.b ($14,a5)
	bsr.b loc_010944
	moveq #0,d0
	jsr loc_0013f8
	addq.w #2,(8,a5)
	move.w #$40,($a,a5)
	tst.b ($14,a5)
	beq.b loc_010936
	addq.w #2,(8,a5)

loc_010936:
	rts

;==============================================
loc_010938:
	subq.w #1,($a,a5)
	beq.w loc_010c88
	rts

;==============================================
loc_010942:
	rts

;==============================================
loc_010944:
	lea.l $ff0000,a0
	lea.l $fffff0,a1
	lea.l $900f1c,a2
	moveq #0,d6
	bsr.w loc_010aa0

	lea.l $900000,a0
	lea.l $930000,a1
	lea.l $900f24,a2
	moveq #0,d6
	bsr.w loc_010aa0


	clr.b ($15,a5)
	lea.l $708000,a0
	lea.l $70a000,a1
	moveq #2,d6
	bsr.w loc_010aa0
	eori.w #1,OBJram_Bank0
	lea.l $708000,a0
	lea.l $70a000,a1
	moveq #2,d6
	bsr.w loc_010aa0
	eori.w #1,OBJram_Bank0
	lea.l $900f2c,a2
	tst.b ($15,a5)
	bne.b loc_0109c0
	moveq #0,d6
	bsr.w loc_010ad6
	bra.b loc_0109c6

loc_0109c0:
	moveq #0,d6
	bsr.w loc_010af6

loc_0109c6:
	move.b #0,$619ffb
	lea.l $618000,a0
	lea.l $61a000,a1
	lea.l $900f34,a2
	moveq #1,d6
	bsr.w loc_010aa0
	move.b #$88,$619ffb
	jsr loc_001ca4
	bne.b loc_010a04
	moveq #0,d6
	lea.l $900f3c,a2
	bsr.w loc_010ad6
	bra.b loc_010a10

loc_010a04:
	moveq #0,d6
	lea.l $900f3c,a2
	bsr.w loc_010af6

;rom3
loc_010a10:
	moveq #0,d6
	moveq #0,d2
	lea.l $0.w,a0
	lea.l $900f44,a2
	bsr.w loc_010b2c

;rom4
	moveq #2,d2
	lea.l $80000,a0
	lea.l $900f48,a2
	bsr.w loc_010b2c

;rom5
	moveq #4,d2
	lea.l $100000,a0
	lea.l $900f4c,a2
	bsr.w loc_010b2c

;rom6
	moveq #6,d2
	lea.l $180000,a0
	lea.l $900f50,a2
	bsr.w loc_010b2c

;rom7
	moveq #8,d2
	lea.l $200000,a0
	lea.l $900f54,a2
	bsr.w loc_010b2c

;rom8
	moveq #$a,d2
	lea.l $280000,a0
	lea.l $900f58,a2
	bsr.w loc_010b2c

;rom9
	moveq #$c,d2
	lea.l $300000,a0
	lea.l $900f5c,a2
	bsr.w loc_010b2c

;rom10
	moveq #$e,d2
	lea.l $380000,a0
	lea.l $900f60,a2
	bra.w loc_010b2c

;==============================================
loc_010aa0:
	moveq #3,d1
	moveq #0,d2

loc_010aa4:
	move.w (a0),d5
	move.w loc_010b24(pc,d2.w),d0
	btst #0,d6
	beq.b loc_010aba
	move.w d0,(a0)
	cmp.b (1,a0),d0
	bne.b loc_010af6
	bra.b loc_010ac0

loc_010aba:
	move.w d0,(a0)
	cmp.w (a0),d0
	bne.b loc_010af6

loc_010ac0:
	move.w d5,(a0)
	addq.w #2,d2
	WATCHDOG
	dbra d1,loc_010aa4
	lea.l (2,a0),a0
	cmpa.l a0,a1
	bne.b loc_010aa0

loc_010ad6:
	btst #1,d6
	bne.b loc_010af4
	move.w #$4f,(a2)
	move.w #$1b,(2,a2)
	lea.l ($80,a2),a2
	move.w #$4b,(a2)
	move.w #$1b,(2,a2)

loc_010af4:
	rts

loc_010af6:
	st.b ($14,a5)
	btst #1,d6
	bne.b loc_010b1e
	move.w #$4e,(a2)
	move.w #$1d,(2,a2)
	lea.l ($80,a2),a2
	move.w #$47,(a2)
	move.w #$1d,(2,a2)
	clr.b ($15,a5)
	rts

loc_010b1e:
	st.b ($15,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010b24:
	dc.w $0000,$5555,$aaaa,$ffff

;==============================================
loc_010b2c:
	moveq #0,d0
	lea.l (a0),a1
	adda.l #$80000,a1

loc_010b36:
	WATCHDOG
	moveq #0,d1
	move.b (a0),d1
	add.l d1,d0
	lea.l ($fff,a0),a0
	cmpa.l a1,a0
	bcs.b loc_010b36
	lea.l loc_010b54(pc,d2.w),a0
	cmp.w (a0),d0
	beq.b loc_010ad6
	bra.b loc_010af6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010b54:
	dc.w $1f22,$3cf1,$176f,$1686,$19fc,$11fe,$184b,$42e6

;==============================================
loc_010b64:
	move.w ($58,a5),d1
	move.w d1,d2
	move.w d1,d3
	andi.w #$c,d2
	bne.b loc_010b78
	move.b #$10,(a6)
	bra.b loc_010b7e

loc_010b78:
	subi.b #$10,(a6)
	beq.b loc_010b80

loc_010b7e:
	moveq #0,d2

loc_010b80:
	andi.w #3,d3
	bne.b loc_010b8e
	move.b #$10,(1,a6)
	bra.b loc_010b96

loc_010b8e:
	subi.b #$10,(1,a6)
	beq.b loc_010b98

loc_010b96:
	moveq #0,d3

loc_010b98:
	andi.w #$7f00,d1
	or.w d2,d1
	or.w d3,d1
	move.w d1,(4,a6)
	move.w ($5a,a5),d1
	not.w d1
	and.w ($58,a5),d1
	move.w d1,(6,a6)
	rts

;==============================================
loc_010bb4:
	move.w ($5c,a5),d1
	move.w d1,d2
	move.w d1,d3
	andi.w #$c,d2
	bne.b loc_010bca
	move.b #$10,(2,a6)
	bra.b loc_010bd2

loc_010bca:
	subi.b #$10,(2,a6)
	beq.b loc_010bd4

loc_010bd2:
	moveq #0,d2

loc_010bd4:
	andi.w #3,d3
	bne.b loc_010be2
	move.b #$10,(3,a6)
	bra.b loc_010bea

loc_010be2:
	subi.b #$10,(3,a6)
	beq.b loc_010bec

loc_010bea:
	moveq #0,d3

loc_010bec:
	andi.w #$7f00,d1
	or.w d2,d1
	or.w d3,d1
	move.w d1,(8,a6)
	move.w ($5e,a5),d1
	not.w d1
	and.w ($5c,a5),d1
	move.w d1,($a,a6)
	rts

;==============================================
loc_010c08:
	move.b ($60,a5),d0
	and.b ($58,a5),d0
	btst #0,d0
	beq.b loc_010c70
	bsr.w loc_010f22
	beq.b loc_010c6c
	moveq #0,d1
	move.b loc_010c72(pc,d7.w),d1
	cmp.l ($ea,a5),d1
	bcs.b loc_010c6c
	moveq #0,d0
	move.b loc_010c76(pc,d7.w),d0
	cmp.b ($ef,a5),d0
	bne.b loc_010c6c
	move.l d1,($ea,a5)
	jsr loc_01b19c
	jsr loc_01b1ae
	moveq #$20,d0
	add.w d7,d0
	jsr loc_01557c
	moveq #1,d0
	jsr loc_0013f8
	jsr loc_001e24
	moveq #0,d0
	jsr loc_0013f8
	moveq #$60,d0
	jsr loc_001370

loc_010c6c:
	bra.w loc_010c88

loc_010c70:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010c72:
	dc.w $101d,$329b

loc_010c76:
	dc.w $0001,$0203

;==============================================
loc_010c7a:
	move.b ($60,a5),d0
	and.b ($58,a5),d0
	btst #0,d0
	beq.b loc_010ca4

loc_010c88:
	andi.b #$cc,($6b,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.w d0,(stageid,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)

loc_010ca4:
	rts

;==============================================
loc_010ca6:
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	dbra d6,loc_010ca6
	rts

;==============================================
loc_010cb4:
	move.w d1,(2,a1)
	lea.l ($40,a1),a1
	dbra d6,loc_010cb4
	rts

;==============================================
loc_010cc2:
	lea.l $90c7e0,a1
	movem.l loc_010d64(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c720,a1
	movem.l loc_010d84(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c7a0,a1
	movem.l loc_010da4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c7c0,a1
	movem.l loc_010dc4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c760,a1
	movem.l loc_010de4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cbe0,a1
	movem.l loc_010e04(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cb20,a1
	movem.l loc_010e24(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cba0,a1
	movem.l loc_010e44(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cbc0,a1
	movem.l loc_010e64(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cb60,a1
	movem.l loc_010e84(pc),d0-d7
	movem.l d0-d7,(a1)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010d64:
	dc.l $00000000,$0000fc60,$ff80fa40,$ff800000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010d84:
	dc.l $00000000,$0000f666,$f888f444,$ffff0000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010da4:
	dc.l $00000000,$0000fc00,$ff00fa00,$ff000000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010dc4:
	dc.l $00000000,$0000f06c,$f08ff04a,$f08f0000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010de4:
	dc.l $00000000,$0000f0a0,$f0c0f080,$f0c00000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010e04:
	dc.l $00000000,$00000000,$0000ffed,$00000000
	dc.l $0000ffed,$fcbafa98,$f765f432,$f2100000

loc_010e24:
	dc.l $00000000,$00000000,$0000ffff,$00000000
	dc.l $0000ffff,$fcccfaaa,$f777f444,$f2220000

loc_010e44:
	dc.l $00000000,$00000000,$0000ff00,$00000000
	dc.l $0000ff00,$fc00fa00,$f700f400,$f2000000

loc_010e64:
	dc.l $00000000,$00000000,$0000fdef,$00000000
	dc.l $0000fdef,$fabcf89a,$f567f234,$f0120000

loc_010e84:
	dc.l $00000000,$00000000,$0000fefe,$00000000
	dc.l $0000fefe,$fbcbf9a9,$f676f343,$f1210000

;==============================================
loc_010ea4:
	moveq #0,d0
	move.w d0,(-$5f04,a5)
	move.l d0,(-$5f44,a5)
	move.l d0,(-$5f40,a5)
	move.l d0,(-$5f3c,a5)
	move.l d0,(-$5f38,a5)
	move.l d0,(-$5f34,a5)
	move.l d0,(-$5f30,a5)
	move.l d0,(-$5f2c,a5)
	move.l d0,(-$5f28,a5)
	move.l d0,(-$5f24,a5)
	move.l d0,(-$5f20,a5)
	move.l d0,(-$5f1c,a5)
	move.l d0,(-$5f18,a5)
	move.l d0,(-$5f14,a5)
	move.l d0,(-$5f10,a5)
	move.l d0,(-$5f0c,a5)
	move.l d0,(-$5f08,a5)
	rts

;==============================================
loc_010eec:
	move.w ($5a,a5),d0
	not.w d0
	and.w ($58,a5),d0
	swap d0
	move.w ($5e,a5),d0
	not.w d0
	and.w ($5c,a5),d0
	andi.l #$770f770f,d0
	beq.b loc_010f20
	move.w (-$5f04,a5),d1
	cmpi.w #$40,d1
	beq.b loc_010f20
	lea.l (-$5f44,a5),a0
	move.l d0,(a0,d1.w)
	addq.w #4,(-$5f04,a5)

loc_010f20:
	rts

;==============================================
loc_010f22:
	tst.b ($bf,a5)
	bne.b loc_010f58
	cmpi.w #$40,(-$5f04,a5)
	beq.b loc_010f58
	move.w d7,d0
	lsl.w #6,d0
	move.w #0,d1
	moveq #$f,d6
	lea.l (-$5f44,a5),a0

loc_010f3e:
	move.l loc_010f5c(pc,d0.w),d2
	cmp.l (a0,d1.w),d2
	bne.b loc_010f58
	addq.w #4,d0
	addq.w #4,d1
	dbra d6,loc_010f3e
	bsr.w loc_010ea4
	moveq #1,d0
	rts

loc_010f58:
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010f5c:
	dc.l $01000000,$01000000,$00010000,$10000000
	dc.l $04000000,$01000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $10000000,$00004000,$02000000,$00000200
	dc.l $00080000,$01000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000001,$00000004,$00020000,$00004000
	dc.l $00010000,$00040000,$00000100,$00080000
	dc.l $01000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000004,$20000000,$00000001,$00040000
	dc.l $00000001,$00000400,$00040000,$00000002
	dc.l $02000000,$00000001,$00080000,$00040000
	dc.l $00002000,$10000000,$01000000,$00000000


;Text and Data for Editors/Tests no longer present but are in the Sample Version of the game
loc_01105c:
	dc.b 'OFF '
	dc.b 'ON  '

loc_011064:
	rts

loc_011066:
	dc.w loc_0110fa-loc_011066
	dc.w loc_011110-loc_011066
	dc.w loc_011126-loc_011066
	dc.w loc_01114c-loc_011066
	dc.w loc_011160-loc_011066
	dc.w loc_011174-loc_011066;70
	dc.w loc_011188-loc_011066;72
	dc.w loc_01119c-loc_011066;74
	dc.w loc_0111b0-loc_011066;76
	dc.w loc_0111c4-loc_011066;78
	dc.w loc_0111d8-loc_011066;7a
	dc.w loc_0111ec-loc_011066;7c
	dc.w loc_011212-loc_011066;7e

	dc.w loc_01123e-loc_011066;80
	dc.w loc_01126a-loc_011066;82
	dc.w loc_0112ae-loc_011066;84
	dc.w loc_0112f2-loc_011066;86
	dc.w loc_011382-loc_011066;88
	dc.w loc_011412-loc_011066;8a
	dc.w loc_01141a-loc_011066;8c
	dc.w loc_011422-loc_011066;8e

	dc.w loc_01142a-loc_011066;90
	dc.w loc_011432-loc_011066;92
	dc.w loc_01145f-loc_011066;94
	dc.w loc_01148c-loc_011066;96
	dc.w loc_01149c-loc_011066;98
	dc.w loc_0114ac-loc_011066;9a
	dc.w loc_0114bc-loc_011066;9c
	dc.w loc_0114cc-loc_011066;9e

	dc.w loc_0114d4-loc_011066;a0
	dc.w loc_0114dc-loc_011066;a2
	dc.w loc_0114e4-loc_011066;a4
	dc.w loc_0114ec-loc_011066;a6
	dc.w loc_0114f4-loc_011066;a8
	dc.w loc_0114fc-loc_011066;aa
	dc.w loc_011504-loc_011066;ac
	dc.w loc_01150c-loc_011066;ae
	dc.w loc_011512-loc_011066
	dc.w loc_011518-loc_011066
	dc.w loc_01151e-loc_011066
	dc.w loc_011524-loc_011066
	dc.w loc_01152a-loc_011066
	dc.w loc_011530-loc_011066
	dc.w loc_011536-loc_011066
	dc.w loc_01153c-loc_011066
	dc.w loc_011560-loc_011066
	dc.w loc_011584-loc_011066
	dc.w loc_01158a-loc_011066
	dc.w loc_011590-loc_011066
	dc.w loc_011596-loc_011066
	dc.w loc_01159c-loc_011066
	dc.w loc_0115a2-loc_011066
	dc.w loc_0115a8-loc_011066
	dc.w loc_0115ae-loc_011066
	dc.w loc_0115b4-loc_011066
	dc.w loc_0115c2-loc_011066
	dc.w loc_0115ce-loc_011066
	dc.w loc_0115dc-loc_011066
	dc.w loc_0115f2-loc_011066
	dc.w loc_0115fa-loc_011066
	dc.w loc_011602-loc_011066
	dc.w loc_011610-loc_011066
	dc.w loc_01161e-loc_011066
	dc.w loc_01162c-loc_011066
	dc.w loc_01163a-loc_011066
	dc.w loc_01165a-loc_011066
	dc.w loc_01167a-loc_011066
	dc.w loc_01169a-loc_011066
	dc.w loc_0116ba-loc_011066
	dc.w loc_0116da-loc_011066
	dc.w loc_0116fa-loc_011066
	dc.w loc_01171a-loc_011066
	dc.w loc_01173a-loc_011066
	dc.w loc_01174e-loc_011066

loc_0110fa:
	dc.b $0f,$08,$1f
	dc.b '                  ',00

loc_011110:
	dc.b $0f,$08,$1b
	dc.b 'CHARCTER TEST MODE',00

loc_011126:
	dc.b $0f,$08,$1b
	dc.b 'NAGE  EDIT  MODE    ',$ff

	dc.b $18,$18,$1b
	dc.b 'TBL3:',$ff

	dc.b $20,$18,$1b,$2f,$00

loc_01114c:
	dc.b $00, $6c,$1f
	dc.b 'L-R:COLOR CHANGE'
	dc.b $00

loc_011160:
	dc.b $00,$6c,$1f
	dc.b 'L-R:DIR  CHANGE '
	dc.b $00

loc_011174:
	dc.b $00,$6c,$1f
	dc.b 'L-R:X  MOVE     '
	dc.b $00

loc_011188:
	dc.b $00,$68,$1f
	dc.b 'U-D:Y  MOVE     '
	dc.b $00

loc_01119c:
	dc.b $00,$68,$1f
	dc.b 'U-D:PAT  CHANGE '
	dc.b $00

loc_0111b0:
	dc.b $00,$68,$1f
	dc.b 'U-D:CHAR  CHANGE'
	dc.b $00

loc_0111c4:
	dc.b $00,$6c,$1f
	dc.b '                '
	dc.b $00

loc_0111d8:
	dc.b $00,$70,$1f
	dc.b '                '
	dc.b $00

loc_0111ec:
	dc.b $0f,$08,$1b
	dc.b 'NAGE  EDIT  MODE   S'
	dc.b $ff
	dc.b $18,$18,$1b
	dc.b 'TBL3:'
	dc.b $ff,$20,$18,$1b,$2f,$00

loc_011212:
	dc.w $0044,$1b54,$424c,$313a,$ff0a,$441b,$2fff,$0048
	dc.w $1b54,$424c,$323a,$ff08,$481b,$2fff,$0040,$1b43
	dc.w $6861,$7243,$6f75,$6e74,$203d,$2000

loc_01123e:
	dc.w $1844,$1b54,$424c,$313a,$ff22,$441b,$2fff,$1848
	dc.w $1b54,$424c,$323a,$ff20,$481b,$2fff,$1840,$1b43
	dc.w $6861,$7243,$6f75,$6e74,$203d,$2000

loc_01126a:
	dc.w $000c,$1b43,$6861,$7254,$424c,$3aff,$0014
	dc.w $1b43,$6f64,$6520,$2020,$3aff,$0024,$1b50
	dc.w $6174,$3aff,$0128,$1b48,$203a,$ff01,$2c1b
	dc.w $4220,$3aff,$0130,$1b46,$203a,$ff01,$341b
	dc.w $4f20,$3aff,$0138,$1b41,$203a,$0000

loc_0112ae:
	dc.w $180c,$1b43,$6861,$7254,$424c,$3aff,$1814,$1b43
	dc.w $6f64,$6520,$2020,$3aff,$1824,$1b50,$6174,$3aff
	dc.w $1928,$1b48,$203a,$ff19,$2c1b,$4220,$3aff,$1930
	dc.w $1b46,$203a,$ff19,$341b,$4f20,$3aff,$1938,$1b41
	dc.w $203a,$0000

loc_0112f2:
	dc.w $0428,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$042c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $0430,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$0434,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $0438,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$043c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$2000

loc_011382:
	dc.w $1c28,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c2c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c30,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c34,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c38,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c3c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$2000

loc_011412:
	dc.b $05,$64,$1f,$20,$4f,$4e,$20,$00

loc_01141a:
	dc.b $05,$64,$1f,$20,$4f,$46,$46,$00

loc_011422:
	dc.b $1d,$64,$1f,$20,$4f,$4e,$20,$00

loc_01142a:
	dc.b $1d,$64,$1f,$20,$4f,$46,$46,$00

loc_011432:
	dc.b $00,$64,$1b,$45,$66,$63,$74,$3a,$ff
	dc.b $00,$68,$1b,$50,$72,$69,$6f,$3a,$ff
	dc.b $00,$6c,$1b,$46,$6c,$69,$70,$3a,$ff
	dc.b $00,$70,$1b,$53,$2e,$45,$2e,$3a,$ff
	dc.b $00,$74,$1b,$43,$6f,$6c,$2e,$3a,$00

loc_01145f:
	dc.b $18,$64,$1b,$45,$66,$63,$74,$3a,$ff
	dc.b $18,$68,$1b,$50,$72,$69,$6f,$3a,$ff
	dc.b $18,$6c,$1b,$46,$6c,$69,$70,$3a,$ff
	dc.b $18,$70,$1b,$53,$2e,$45,$2e,$3a,$ff
	dc.b $18,$74,$1b,$43,$6f,$6c,$2e,$3a,$00

loc_01148c:
	dc.w $2428,$1f2b,$6d61,$65ff,$2d28,$1f78,$3138,$2000

loc_01149c:
	dc.w $2428,$1f2b,$6174,$6fff,$2d28,$1f78,$3138,$2000

loc_0114ac:
	dc.w $2430,$1f2b,$6d61,$65ff,$2d30,$1f78,$3138,$2000

loc_0114bc:
	dc.w $2430,$1f2b,$6174,$6fff,$2d30,$1f78,$3138,$2000

loc_0114cc:
	dc.b $06,$68,$1f,$6d,$61,$65,$20,$00

loc_0114d4:
	dc.b $06,$68,$1f,$61,$74,$6f,$20,$00

loc_0114dc:
	dc.b $1e,$68,$1f,$61,$74,$6f,$20,$00

loc_0114e4:
	dc.b $1e,$68,$1f,$6d,$61,$65,$20,$00


loc_0114ec:
	dc.b $06,$70,$1f,$4f,$4e,$20,$20,$00

loc_0114f4:
	dc.b $06,$70,$1f,$4f,$46,$46,$20,$00

loc_0114fc:
	dc.b $1e,$70,$1f,$4f,$4e,$20,$20,$00

loc_011504:
	dc.b $1e,$70,$1f,$4f,$46,$46,$20,$00

loc_01150c:
	dc.b $06,$6c,$1f,$2d,$2d,$00

loc_011512:
	dc.b $06,$6c,$1f,$48,$2d,$00

loc_011518:
	dc.b $06,$6c,$1f,$2d,$56,$00

loc_01151e:
	dc.b $06,$6c,$1f,$48,$56,$00

loc_011524:
	dc.b $1e,$6c,$1f,$2d,$2d,$00

loc_01152a:
	dc.b $1e,$6c,$1f,$48,$2d,$00

loc_011530:
	dc.b $1e,$6c,$1f,$2d,$56,$00

loc_011536:
	dc.b $1e,$6c,$1f,$48,$56,$00

loc_01153c:
	dc.w $0050,$1b50,$6f73,$583a,$ff00,$541b,$506f,$7359,$3aff
	dc.w $0058,$1b52,$6e67,$583a,$ff00,$5c1b,$526e,$6759,$3a00

loc_011560:
	dc.w $1850,$1b50,$6f73,$583a,$ff18,$541b,$506f,$7359,$3aff
	dc.w $1858,$1b52,$6e67,$583a,$ff18,$5c1b,$526e,$6759,$3a00

loc_011584:
	dc.b $06,$6c,$1e,$2d,$2d,$00

loc_01158a:
	dc.b $06,$6c,$1e,$48,$2d,$00

loc_011590:
	dc.b $06,$6c,$1e,$2d,$56,$00

loc_011596:
	dc.b $06,$6c,$1e,$48,$56,$00

loc_01159c:
	dc.b $1e,$6c,$1e,$2d,$2d,$00

loc_0115a2:
	dc.b $1e,$6c,$1e,$48,$2d,$00

loc_0115a8:
	dc.b $1e,$6c,$1e,$2d,$56,$00

loc_0115ae:
	dc.b $1e,$6c,$1e,$48,$56,$00

loc_0115b4:
	dc.w $181c,$1b43,$6174,$6368,$204e,$6f2e,$3d00

loc_0115c2:
	dc.w $1820,$1b43,$6f6c,$6f72,$203d,$2000

loc_0115ce:
	dc.w $1824,$1b50,$6c2e,$5479,$7065,$203d,$2000

loc_0115dc:
	dc.w $0f08,$1b50,$4154,$5445,$524e,$2020,$4544,$4954
	dc.w $204d,$4f44,$4500

loc_0115f2:
	dc.w $1c10,$1f43,$4f44,$2000

loc_0115fa:
	dc.w $1c10,$1f4c,$4f44,$2000

loc_011602:
	dc.w $220c,$1f4c,$4f4f,$5020,$504f,$494e,$5400

loc_011610:
	dc.w $220c,$1e4c,$4f4f,$5020,$504f,$494e,$5400

loc_01161e:
	dc.w $220c,$1f2e,$2e2e,$2e20,$2e2e,$2e2e,$2e00

loc_01162c:
	dc.w $220c,$1e2e,$2e2e,$2e20,$2e2e,$2e2e,$2e00

loc_01163a:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1f53,$4156,$4520,$2000

loc_01165a:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1f44,$454c,$4554,$4500

loc_01167a:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1f49,$4e53,$4552,$5400

loc_01169a:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1f43,$4f50,$5920,$2000

loc_0116ba:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1e53,$4156,$4520,$2000

loc_0116da:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1e44,$454c,$4554,$4500

loc_0116fa:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1e49,$4e53,$4552,$5400

loc_01171a:
	dc.w $1824,$1f53,$484f,$5420,$3620,$2b20,$5348,$4f54
	dc.w $2037,$203d,$20ff,$2a24,$1e43,$4f50,$5920,$2000

loc_01173a:
	dc.w $1d38,$1b3c,$2063,$6174,$6368,$5f68,$6f73,$6569,$3020,$3e00

loc_01174e:
	dc.w $1d38,$1b3c,$2063,$6174,$6368,$5f68,$6f73,$6569,$3120,$3e00

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_011762:
	dc.w $0006,$0e00,$0a08,$0c00,$0204,$1000,$0000,$0000

loc_011772:
	dc.l loc_141f00,loc_1461e8,loc_152da4,loc_15c5cc
	dc.l loc_167cb0,loc_1713a8,loc_185676,loc_18efcc
	dc.l loc_1a5eec,loc_1af7e6,loc_1bb3f2,loc_1ca1de
	dc.l loc_1de87e,loc_1e9472,loc_1f1112,loc_1fe362
	dc.l loc_20d366,loc_21bde4,loc_229418,loc_1713a8
	dc.l loc_229418,loc_15c5cc,loc_2387ec,loc_23fe00
	dc.l loc_1461e8,loc_24be0a,loc_254b3c,loc_262344
	dc.l loc_270f16,loc_27dc4a,loc_28a274,loc_298f0c
	dc.l loc_2a8270

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0117f6:
	dc.l loc_1461e8
	dc.w $0000,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0004,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0008,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $000c,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0010,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0014,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0018,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $001c,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0020,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0024,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $0028,$0000,$0000,$0000,$0000,$0014

	dc.l loc_1461e8
	dc.w $002c,$0000,$0000,$0000,$0000,$0014

	dc.l loc_152da4
	dc.w $0000,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0004,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0008,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $000c,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0010,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0014,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0018,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $001c,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0020,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0024,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $0028,$0000,$0000,$0000,$0000,$0114
	dc.l loc_152da4
	dc.w $002c,$0000,$0000,$0000,$0000,$0114

	dc.l loc_15c5cc
	dc.w $0000,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0004,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0008,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $000c,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0010,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0014,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0018,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $001c,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0020,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0024,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $0028,$0000,$0000,$0000,$0000,$0214
	dc.l loc_15c5cc
	dc.w $002c,$0000,$0000,$0000,$0000,$0214

	dc.l loc_167cb0
	dc.w $0000,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0004,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0008,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $000c,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0010,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0014,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0018,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $001c,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0020,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0024,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $0028,$0000,$0000,$0000,$0000,$0314
	dc.l loc_167cb0
	dc.w $002c,$0000,$0000,$0000,$0000,$0314

	dc.l loc_1713a8
	dc.w $0000,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0004,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0008,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $000c,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0010,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0014,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0018,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $001c,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0020,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0024,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $0028,$0000,$0000,$0000,$0000,$0414
	dc.l loc_1713a8
	dc.w $002c,$0000,$0000,$0000,$0000,$0414

	dc.l loc_185676
	dc.w $0000,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0004,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0008,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $000c,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0010,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0014,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0018,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $001c,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0020,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0024,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $0028,$0000,$0000,$0000,$0000,$0514
	dc.l loc_185676
	dc.w $002c,$0000,$0000,$0000,$0000,$0514
	dc.l loc_18efcc
	dc.w $0000,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0004,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0008,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $000c,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0010,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0014,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0018,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $001c,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0020,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0024,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $0028,$0000,$0000,$0000,$0000,$0614
	dc.l loc_18efcc
	dc.w $002c,$0000,$0000,$0000,$0000,$0614
	dc.l loc_1a5eec
	dc.w $0000,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0004,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0008,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $000c,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0010,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0014,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0018,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $001c,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0020,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0024,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $0028,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1a5eec
	dc.w $002c,$0000,$0000,$0000,$0000,$0714
	dc.l loc_1af7e6
	dc.w $0000,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0004,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0008,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $000c,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0010,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0014,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0018,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $001c,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0020,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0024,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $0028,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1af7e6
	dc.w $002c,$0000,$0000,$0000,$0000,$0814
	dc.l loc_1bb3f2
	dc.w $0000,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0004,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0008,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $000c,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0010,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0014,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0018,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $001c,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0020,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0024,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $0028,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1bb3f2
	dc.w $002c,$0000,$0000,$0000,$0000,$0914
	dc.l loc_1ca1de
	dc.w $0000,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0004,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0008,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $000c,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0010,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0014,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0018,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $001c,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0020,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0024,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $0028,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1ca1de
	dc.w $002c,$0000,$0000,$0000,$0000,$0a14
	dc.l loc_1de87e
	dc.w $0000,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0004,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0008,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $000c,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0010,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0014,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0018,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $001c,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0020,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0024,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $0028,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1de87e
	dc.w $002c,$0000,$0000,$0000,$0000,$0b14
	dc.l loc_1e9472
	dc.w $0000,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0004,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0008,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $000c,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0010,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0014,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0018,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $001c,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0020,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0024,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $0028,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1e9472
	dc.w $002c,$0000,$0000,$0000,$0000,$0c14
	dc.l loc_1f1112
	dc.w $0000,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0004,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0008,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $000c,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0010,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0014,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0018,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $001c,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0020,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0024,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $0028,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1f1112
	dc.w $002c,$0000,$0000,$0000,$0000,$0d14
	dc.l loc_1fe362
	dc.w $0000,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0004,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0008,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $000c,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0010,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0014,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0018,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $001c,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0020,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0024,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $0028,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_1fe362
	dc.w $002c,$0000,$0000,$0000,$0000,$0e14
	dc.l loc_20d366
	dc.w $0000,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0004,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0008,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $000c,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0010,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0014,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0018,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $001c,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0020,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0024,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $0028,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_20d366
	dc.w $002c,$0000,$0000,$0000,$0000,$0f14
	dc.l loc_21bde4
	dc.w $0000,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0004,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0008,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $000c,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0010,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0014,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0018,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $001c,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0020,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0024,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $0028,$0000,$0000,$0000,$0000,$1014
	dc.l loc_21bde4
	dc.w $002c,$0000,$0000,$0000,$0000,$1014
	dc.l loc_229418
	dc.w $0000,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0004,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0008,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $000c,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0010,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0014,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0018,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $001c,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0020,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0024,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $0028,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229418
	dc.w $002c,$0000,$0000,$0000,$0000,$1114
	dc.l loc_229448
	dc.w $0000,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0004,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0008,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $000c,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0010,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0014,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0018,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $001c,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0020,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0024,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $0028,$0000,$0000,$0000,$0000,$1314
	dc.l loc_229448
	dc.w $002c,$0000,$0000,$0000,$0000,$1314
	dc.l loc_2387ec
	dc.w $0000,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0004,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0008,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $000c,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0010,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0014,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0018,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $001c,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0020,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0024,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $0028,$0000,$0000,$0000,$0000,$1514
	dc.l loc_2387ec
	dc.w $002c,$0000,$0000,$0000,$0000,$1514
	dc.l loc_23fe00
	dc.w $0000,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0004,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0008,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $000c,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0010,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0014,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0018,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $001c,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0020,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0024,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $0028,$0000,$0000,$0000,$0000,$1614
	dc.l loc_23fe00
	dc.w $002c,$0000,$0000,$0000,$0000,$1614

	dc.l loc_24be0a
	dc.w $0000,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0004,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0008,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $000c,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0010,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0014,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0018,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $001c,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0020,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0024,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $0028,$0000,$0000,$0000,$0000,$1814

	dc.l loc_24be0a
	dc.w $002c,$0000,$0000,$0000,$0000,$1814

	dc.l loc_254b3c
	dc.w $0000,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0004,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0008,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $000c,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0010,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0014,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0018,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $001c,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0020,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0024,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $0028,$0000,$0000,$0000,$0000,$1914

	dc.l loc_254b3c
	dc.w $002c,$0000,$0000,$0000,$0000,$1914

	dc.l loc_262344
	dc.w $0000,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0004,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0008,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $000c,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0010,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0014,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0018,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $001c,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0020,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0024,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $0028,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_262344
	dc.w $002c,$0000,$0000,$0000,$0000,$1a14

	dc.l loc_270f16
	dc.w $0000,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0004,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0008,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $000c,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0010,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0014,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0018,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $001c,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0020,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0024,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $0028,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_270f16
	dc.w $002c,$0000,$0000,$0000,$0000,$1b14

	dc.l loc_27dc4a
	dc.w $0000,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0004,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0008,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $000c,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0010,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0014,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0018,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $001c,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0020,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0024,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $0028,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_27dc4a
	dc.w $002c,$0000,$0000,$0000,$0000,$1c14

	dc.l loc_28a274
	dc.w $0000,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0004,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0008,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $000c,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0010,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0014,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0018,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $001c,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0020,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0024,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $0028,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_28a274
	dc.w $002c,$0000,$0000,$0000,$0000,$1d14

	dc.l loc_298f0c
	dc.w $0000,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0004,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0008,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $000c,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0010,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0014,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0018,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $001c,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0020,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0024,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $0028,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_298f0c
	dc.w $002c,$0000,$0000,$0000,$0000,$1e14

	dc.l loc_2a8270
	dc.w $0000,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0004,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0008,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $000c,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0010,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0014,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0018,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $001c,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0020,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0024,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $0028,$0000,$0000,$0000,$0000,$1f14

	dc.l loc_2a8270
	dc.w $002c,$0000,$0000,$0000,$0000,$1f14

loc_012db6:
	dc.w $0014,$aec0,$0000,$0000,$0000,$0000,$0800,$2014
	dc.w $0015,$7994,$0000,$0000,$0000,$0000,$0801,$2114
	dc.w $0016,$1a32,$0000,$0000,$0000,$0000,$0802,$2214
	dc.w $0016,$cb5c,$0000,$0000,$0000,$0000,$0803,$2314
	dc.w $0017,$b76e,$0000,$0000,$0000,$0000,$0804,$2414
	dc.w $001c,$0994,$0000,$0000,$0000,$0000,$0809,$2914
	dc.w $001c,$f420,$0000,$0000,$0000,$0000,$080a,$2a14
	dc.w $001e,$3c8c,$0000,$0000,$0000,$0000,$080b,$2b14
	dc.w $001e,$dabc,$0000,$0000,$0000,$0000,$080c,$2c14
	dc.w $001f,$6dc2,$0000,$0000,$0000,$0000,$080d,$2d14
	dc.w $0020,$4474,$0000,$0000,$0000,$0000,$080e,$2e14
	dc.w $0021,$2eae,$0000,$0000,$0000,$0000,$080f,$2f14
	dc.w $0022,$0f6c,$0000,$0000,$0000,$0000,$0810,$3014
	dc.w $0017,$b76e,$0000,$0000,$0000,$0000,$0812,$3214
	dc.w $0017,$be58,$0000,$0000,$0000,$0000,$0804,$3514
	dc.w $0025,$adda,$0000,$0000,$0000,$0000,$0819,$3914
	dc.w $0021,$2eae,$0000,$0000,$0000,$0000,$081b,$3b14
	dc.w $0021,$2eae,$0000,$0000,$0000,$0000,$080f,$3c14
	dc.w $0021,$2eae,$0000,$0000,$0000,$0000,$080f,$3e14
	dc.w $0027,$6bc6,$0000,$0000,$0000,$0000,$081b,$3b14
	dc.w $0014,$ae86,$0000,$0000,$0000,$0000,$1800,$7008
	dc.w $0015,$7980,$0000,$0000,$0000,$0000,$1801,$7108
	dc.w $0016,$19fe,$0000,$0000,$0000,$0000,$1802,$7208
	dc.w $0016,$cb34,$0000,$0000,$0000,$0000,$1803,$7308
	dc.w $0017,$be70,$0000,$0000,$0000,$0000,$1804,$7408
	dc.w $0018,$a5d2,$0000,$0000,$0000,$0000,$1805,$7508
	dc.w $0019,$6fb6,$0000,$0000,$0000,$0000,$1806,$7608
	dc.w $001a,$b486,$0000,$0000,$0000,$0000,$1807,$7708
	dc.w $001b,$4836,$0000,$0000,$0000,$0000,$1808,$7808
	dc.w $001c,$0874,$0000,$0000,$0000,$0000,$1809,$7908
	dc.w $001c,$f38a,$0000,$0000,$0000,$0000,$180a,$7a08
	dc.w $001e,$3ca2,$0000,$0000,$0000,$0000,$180b,$7b08
	dc.w $001e,$da74,$0000,$0000,$0000,$0000,$180c,$7c08
	dc.w $001f,$6d9a,$0000,$0000,$0000,$0000,$180d,$7d08
	dc.w $0020,$44b0,$0000,$0000,$0000,$0000,$180e,$7e08
	dc.w $0021,$2ef0,$0000,$0000,$0000,$0000,$180f,$7f08
	dc.w $0022,$0fb0,$0000,$0000,$0000,$0000,$1810,$8008
	dc.w $0023,$2030,$0000,$0000,$0000,$0000,$1811,$8108
	dc.w $0017,$bed4,$0000,$0000,$0000,$0000,$1812,$8208
	dc.w $0023,$cd80,$0000,$0000,$0000,$0000,$1815,$8508
	dc.w $0024,$5ad6,$0000,$0000,$0000,$0000,$1816,$8608
	dc.w $0025,$09c4,$0000,$0000,$0000,$0000,$1818,$8808
	dc.w $0025,$a5c0,$0000,$0000,$0000,$0000,$1819,$8908
	dc.w $0026,$889c,$0000,$0000,$0000,$0000,$181a,$8a08
	dc.w $0027,$6258,$0000,$0000,$0000,$0000,$181b,$8b08
	dc.w $002b,$634e,$0000,$0000,$0000,$0000,$181c,$8c08
	dc.w $002b,$55b0,$0000,$0000,$0000,$0000,$181c,$8c08
	dc.w $0029,$0590,$0000,$0000,$0000,$0000,$181d,$8d08
	dc.w $002b,$54f8,$0000,$0000,$0000,$0000,$181c,$8f08
	dc.w $002e,$d7ee,$0000,$0000,$6000,$0000,$1400,$4008
	dc.w $002e,$d818,$0000,$0000,$6000,$0000,$1400,$4108
	dc.w $002e,$da32,$0000,$0000,$6000,$0000,$1400,$4208
	dc.w $002e,$da52,$0000,$0000,$6000,$0000,$1400,$4308
	dc.w $002e,$db6c,$0000,$0000,$6000,$0000,$1400,$4408
	dc.w $002e,$dc62,$0000,$0000,$6000,$0000,$1400,$4508
	dc.w $002e,$dc8c,$0000,$0000,$6000,$0000,$1400,$4608
	dc.w $002e,$ddd6,$0000,$0000,$6000,$0000,$1400,$4708
	dc.w $002e,$deac,$0000,$0000,$6000,$0000,$1400,$4808
	dc.w $002e,$df92,$0000,$0000,$6000,$0000,$1400,$4908
	dc.w $002e,$dfd0,$0000,$0000,$6000,$0000,$1400,$4a08
	dc.w $002e,$e110,$0000,$0000,$6000,$0000,$1400,$4b08
	dc.w $002e,$e206,$0000,$0000,$6000,$0000,$1400,$4c08
	dc.w $002e,$e2c0,$0000,$0000,$6000,$0000,$1400,$4d08
	dc.w $002e,$e3e4,$0000,$0000,$6000,$0000,$1400,$4e08
	dc.w $002e,$e43a,$0000,$0000,$6000,$0000,$1400,$4f08
	dc.w $002e,$e486,$0000,$0000,$6000,$0000,$1400,$5008
	dc.w $002e,$e588,$0000,$0000,$6000,$0000,$1400,$5108
	dc.w $002e,$e62e,$0000,$0000,$6000,$0000,$1400,$5608
	dc.w $002e,$e6a6,$0000,$0000,$6000,$0000,$1400,$5808
	dc.w $002e,$e7a4,$0000,$0000,$6000,$0000,$1400,$5908
	dc.w $002e,$e8b0,$0000,$0000,$6000,$0000,$1400,$5a08
	dc.w $002e,$e990,$0000,$0000,$6000,$0000,$1400,$5b08
	dc.w $002e,$eab6,$0000,$0000,$6000,$0000,$1400,$5c08
	dc.w $0009,$87aa,$0000,$0000,$2000,$0000,$0c00,$9108
	dc.w $000a,$2b90,$0000,$0000,$2000,$0000,$0c00,$9108
	dc.w $002f,$2de8,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $0008,$7352,$0000,$0000,$2000,$0000,$0c00,$9108
	dc.w $002f,$31b0,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $0008,$ef60,$0000,$0000,$2000,$0000,$0c00,$9108
	dc.w $002f,$357a,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $002f,$407c,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $002f,$3b20,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $002f,$4284,$0000,$0000,$6000,$0000,$0c00,$9208
	dc.w $0030,$1fa2,$0000,$0000,$2000,$0000,$0c00,$9108
	dc.w $002f,$40ce,$0000,$0000,$6000,$0000,$0c00,$9108
	dc.w $002e,$50a0,$0000,$0000,$6000,$0000,$1800,$6008
	dc.w $002e,$514c,$0000,$0000,$6000,$0000,$1800,$6108

loc_013326:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0007,$2dc6,$0007,$3614,$0007,$3ba4,$0007,$4e7c
	dc.w $0007,$5208,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$60b2,$0007,$682a,$0007,$6b94
	dc.w $0007,$759e,$0007,$7db6,$0007,$8a18,$0007,$8e3e
	dc.w $0007,$9092,$0000,$0000,$0007,$5208,$0000,$0000
	dc.w $0000,$0000,$0007,$91a2,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$b562,$0000,$0000,$0007,$9f1c
	dc.w $0007,$a074,$0007,$b9a6,$0007,$a456,$0007,$ae0e
	dc.w $0007,$2dce,$0007,$361c,$0007,$3bac,$0007,$4e84
	dc.w $0007,$5210,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$60c2,$0007,$6832,$0007,$6bb0
	dc.w $0007,$75a6,$0007,$7dca,$0007,$8a20,$0007,$8e46
	dc.w $0007,$90a2,$0000,$0000,$0007,$5210,$0000,$0000
	dc.w $0000,$0000,$0007,$91aa,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$b56a,$0000,$0000,$0007,$9f24
	dc.w $0007,$a07c,$0007,$b9ae,$0007,$a462,$0007,$ae16

loc_013436:
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076

loc_013476:
	dc.w $001a,$001a,$001a,$0010,$0004,$000d,$001c,$001e
	dc.w $0028,$0009,$0006,$0006,$001a,$0006,$001f,$001a
	dc.w $004e,$0021,$0003,$0021,$001a,$0007,$0023,$001a
	dc.w $001a,$0007,$0047,$001a,$001a,$001a,$001a,$001a
	dc.w $0413,$0fff,$0ff9,$0fd7,$0fb6,$0f93,$0f71,$0f50
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001f
	dc.w $0111,$0222,$0333,$0444,$0555,$0666,$0777,$0888
	dc.w $0111,$0222,$0333,$0444,$0555,$0666,$0777,$0888
	dc.w $0124,$0fff,$06ff,$05df,$03bf,$029f,$017f,$005f
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001e
	dc.w $0133,$0fff,$0afc,$08e9,$06c7,$04b5,$02a2,$0090
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001b
	dc.w $0088,$0099,$00aa,$00bb,$00cc,$00dd,$00ee,$00ff
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001e
	dc.w $0511,$0fff,$0fac,$0f8a,$0f68,$0f22,$0d11,$0c00
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001d
	dc.w $0808,$0909,$0a0a,$0b0b,$0c0c,$0d0d,$0e0e,$0f0f
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001e
	dc.w $0324,$0fff,$0ff9,$0ff6,$0ee3,$0dd1,$0cb0,$0b90
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001a
	dc.w $0444,$0fff,$0fff,$0ddd,$0ccc,$0bbb,$0aaa,$0999
	dc.w $0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff,$001c

;==============================================
loc_0135d6:
	rts

;==============================================
;Message Test Leftovers
;==============================================
loc_0135d8:
	move.w (8,a5),d0
	move.w loc_0135e4(pc,d0.w),d1
	jmp loc_0135e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0135e4:
	dc.w loc_0135e8-loc_0135e4
	dc.w loc_013672-loc_0135e4

;==============================================
loc_0135e8:
	addq.w #2,(8,a5)
	jsr loc_01bdd6
	jsr loc_01b0e6
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.b d0,($160,a5)
	lea.l (p1memory,a5),a6
	move.b ($93,a5),($3c,a6)
	move.b d0,($52,a6)
	move.b d0,($53,a6)
	move.b d0,($50,a6)
	moveq #1,d0
	moveq #0,d1
	lea.l $908000,a1
	jsr loc_01babc
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	moveq #0,d0
	bsr.w loc_013854
	jsr loc_01c3ac
	beq.w loc_0137ce
	addq.b #1,(a4)
	move.b #1,(2,a4)
	move.w #$40,($10,a4)
	move.w #$40,($14,a4)
	move.w #$ff,($3a,a4)
	move.w a4,($36,a6)
	bsr.w loc_013718
	jmp loc_01fc26

;==============================================
loc_013672:
	jsr loc_01b096
	bsr.w loc_0137b2
	lea.l (p1memory,a5),a6
	bsr.w loc_013694
	bsr.w loc_0137d0
	jsr loc_0336d6
	jmp loc_020c4a

loc_013694:
	move.b ($378,a6),d0
	btst #0,d0
	bne.w loc_013790
	btst #1,d0
	bne.w loc_013774
	move.b ($11b,a6),d0
	andi.b #$f,d0
	beq.w loc_0137ce
	move.b ($379,a6),d0
	andi.w #$f,d0
	beq.w loc_0137ce
	lea.l loc_013994(pc),a0
	move.b (a0,d0.w),d0
	move.w loc_0136d0(pc,d0.w),d1
	jmp loc_0136d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0136d0:
	dc.w $00fe,$0012,$0012,$002e
	dc.w $0016,$0016,$0016,$0032
	dc.w $0012

;==============================================
loc_0136e2:
	moveq #1,d0
	bra.b loc_0136ea

loc_0136e6:
	move.b #-1,d0

loc_0136ea:
	add.b ($102,a6),d0
	andi.b #$1f,d0
	move.b d0,($102,a6)
	clr.b ($52,a6)
	bra.w loc_013718

loc_0136fe:
	moveq #1,d0
	bra.b loc_013706

loc_013702:
	move.b #-1,d0

loc_013706:
	add.b ($52,a6),d0
	bpl.b loc_013710
	add.b ($53,a6),d0

loc_013710:
	move.b d0,($52,a6)
	bra.w loc_013744

;==============================================
loc_013718:
	lea.l loc_013944(pc),a0
	move.b ($50,a6),d0
	ext.w d0
	movea.l (a0,d0.w),a0
	move.b ($3c,a6),d0
	add.b d0,d0
	movea.l (a0,d0.w),a0
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	move.l a0,($54,a6)
	bsr.w loc_0137a2

loc_013744:
	movea.l ($54,a6),a0
	move.b ($52,a6),d0
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	bne.b loc_01375c
	clr.b ($52,a6)
	move.w (a0),d0

loc_01375c:
	lea.l (a0,d0.w),a0
	movea.w ($36,a6),a4
	move.l a0,($36,a4)
	move.w #$ff,($3a,a4)
	clr.l ($4,a4)
	rts

;==============================================
loc_013774:
	tst.b ($92,a5)
	beq.b loc_01378a
	addq.b #2,($3c,a6)
	andi.b #6,($3c,a6)
	bne.b loc_01378a
	addq.b #2,($3c,a6)

loc_01378a:
	clr.b ($52,a6)
	bra.b loc_013718

;==============================================
loc_013790:
	addq.b #4,($50,a6)
	andi.b #$c,($50,a6)
	clr.b ($52,a6)
	bra.w loc_013718

;==============================================
loc_0137a2:
	moveq #0,d0

loc_0137a4:
	tst.w (a0)+
	beq.b loc_0137ac
	addq.b #1,d0
	bra.b loc_0137a4

loc_0137ac:
	move.b d0,($53,a6)
	rts

;==============================================
loc_0137b2:
	lea.l (p1memory,a5),a3
	bsr.w loc_0137be
	lea.l (p2memory,a5),a3

loc_0137be:
	move.w ($11c,a3),d0
	not.w d0
	and.w ($11a,a3),d0
	move.w d0,($378,a3)
	rts

;==============================================
loc_0137ce:
	rts

;==============================================
loc_0137d0:
	move.b ($50,a6),d0
	ext.w d0
	lsr.w #2,d0
	addq.w #1,d0
	bsr.w loc_013854
	move.b ($3c,a6),d0
	ext.w d0
	lsr.w #1,d0
	addq.w #5,d0
	bsr.w loc_013854
	lea.l $900830,a1
	move.b ($53,a6),d0
	subq.b #1,d0
	bsr.w loc_013818
	lea.l $9006b0,a1
	move.b ($52,a6),d0
	bsr.w loc_013818
	lea.l $9004ac,a1
	move.b ($102,a6),d0
	bra.w loc_013818

loc_013818:
	move.w d0,d2
	lsr.w #4,d2
	andi.w #$f,d2
	cmpi.w #$a,d2
	bcs.b loc_01382a
	addi.w #$57,d2

loc_01382a:
	addi.w #0,d2
	move.w d2,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	andi.w #$f,d0
	cmpi.w #$a,d0
	bcs.b loc_013846
	addi.w #$57,d0

loc_013846:
	addi.w #0,d0
	movem.w d0-d1,(a1)
	lea.l ($80,a1),a1
	rts

;==============================================
loc_013854:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_01385c
	moveq #-1,d2

loc_01385c:
	move.w loc_01389c(pc,d0.w),d0
	lea.l loc_01389c(pc,d0.w),a0

loc_013864:
	moveq #0,d0
	lea.l $900000,a1
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_01387a:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_01389a
	bmi.b loc_013864
	addi.w #0,d0
	tst.b d2
	beq.b loc_01388e
	move.w #$20,d0

loc_01388e:
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	bra.b loc_01387a

loc_01389a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01389c:
	dc.w $0012,$0048,$0052,$005c
	dc.w $0066,$0070,$007e,$008c
	dc.w $009a,$0024
	dc.b $1f,$4b,$69,$6e,$64,$3a,$ff,$00
	dc.b $28,$1f,$4c,$61,$6e,$67,$75,$61,$67,$65,$3a,$ff,$00
	dc.b $2c,$1f,$50,$4c,$5f,$54,$59,$50,$45,$3a,$ff,$00
	dc.b $30,$1f,$4d,$65,$73,$73,$61,$67,$65,$20,$4e,$6f,$2e,$3a,$20,$20,$20,$2f,$00
	dc.b $06,$24,$1f,$57,$69,$6e,$20,$20,$20,$00
	dc.b $06,$24,$1f,$4f,$70,$65,$6e,$20,$20,$00
	dc.b $06,$24,$1f,$45,$6e,$64,$69,$6e,$67,$00
	dc.b $06,$24,$1f,$42,$6f,$73,$73,$20,$20,$00
	dc.b $0b,$28,$1f,$4a,$61,$70,$61,$6e,$65,$73,$65,$20,$20,$00
	dc.b $0b,$28,$1f,$45,$6e,$67,$6c,$69,$73,$68,$20,$20,$20,$00
	dc.b $0b,$28,$1f,$53,$70,$61,$6e,$69,$73,$68,$20,$20,$20,$00
	dc.b $0b,$28,$1f,$50,$6f,$72,$74,$75,$67,$75,$65,$73,$65,$00

loc_013944:
	dc.l loc_013954,loc_013984,loc_013974,loc_013964

loc_013954:
	dc.l EnglishWinQuotes,EnglishWinQuotes,EnglishWinQuotes,EnglishWinQuotes

loc_013964:
	dc.l EnglishWinQuotes,loc_0cde08,loc_0cde08,loc_0cde08

loc_013974:
	dc.l EnglishWinQuotes,loc_0d5c4c,loc_0d5c4c,loc_0d5c4c

loc_013984:
	dc.l EnglishWinQuotes,loc_0cc7e0,loc_0cc7e0,loc_0cc7e0

loc_013994:
	dc.w $0006,$0e00,$0a08,$0c00,$0204,$1000,$0000,$0000

loc_0139a4:
	rts

loc_0139a6:
	dc.w $0038,$004e,$0064,$0064,$0064,$0064,$0064,$0064
	dc.w $0064,$0064,$0078,$008c,$008c,$008c,$00c6,$00c6
	dc.w $0100,$0190,$0220,$0220,$031a,$0332,$034a,$0362
	dc.w $037a,$0392,$03aa,$03c2
	
	dc.w $0f08,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2000,$0f08
	dc.w $1b41,$5454,$4143,$4b20,$4348,$4543,$4b20,$4d4f
	dc.w $4445,$2000,$006c,$1f20,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$2000,$0070,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2000,$1918,$1b54
	dc.w $424c,$313a,$ff33,$181b,$2fff,$191c,$1b54,$424c
	dc.w $323a,$ff21,$1c1b,$2fff,$1920,$1b41,$7474,$6163
	dc.w $6b20,$4e6f,$2e3d,$20ff,$1924,$1b4f,$7665,$726c
	dc.w $6170,$203d,$2000,$010c,$1b43,$6861,$7254,$424c
	dc.w $3aff,$1740,$1b50,$6174,$203a,$ff17,$441b,$4865
	dc.w $6164,$3aff,$1748,$1b42,$6f64,$793a,$ff17,$4c1b
	dc.w $466f,$6f74,$3aff,$1750,$1b4f,$7368,$693a,$0000

	dc.w $0128,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c44,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c48,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c4c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c50,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c5c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$2000
	dc.w $1c28,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c2c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c30,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c34,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$20ff
	dc.w $1c38,$1f20,$2020,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$20ff,$1c3c,$1f20,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$2000

loc_013bc6:
	dc.w $012c,$0070,$6f77,$3030,$20ff,$072c,$0168,$626b
	dc.w $3030,$20ff,$0d2c,$0276,$6563,$3030,$20ff,$132c
	dc.w $0373,$686f,$636b,$3020,$ff1a,$2c04,$7069,$796f
	dc.w $3030,$20ff,$212c,$0520,$2020,$2020,$2020,$2020
	dc.w $2020,$20ff,$0130,$0668,$6974,$3031,$20ff,$0730
	dc.w $0773,$645f,$7030,$20ff,$0d30,$0868,$7330,$3020
	dc.w $ff12,$3009,$7570,$6730,$3020,$ff18,$300a,$6b7a
	dc.w $5f6f,$6666,$20ff,$1f30,$0b4e,$4d41,$ff01,$340c
	dc.w $6e6c,$7630,$20ff,$0634,$0d47,$6f6f,$6f20,$ff0b
	dc.w $340e,$666e,$5f6e,$6f72,$6d61,$6c30,$20ff,$1634
	dc.w $0f6e,$6f5f,$616b,$626f,$6e6f,$20ff,$2034,$1061
	dc.w $646a,$3030,$20ff,$2634,$1177,$6142,$30ff,$0138
	dc.w $1270,$6979,$6f30,$3120,$ff08,$3813,$756b,$6d30
	dc.w $3020,$ff0e,$3814,$6e65,$3030,$20ff,$1338,$1f44
	dc.w $414d,$3144,$20ff,$1938,$1f44,$414d,$3145,$20ff
	dc.w $1f38,$1f44,$414d,$3146,$0000,$185c,$1b4a,$756d
	dc.w $70ff,$1864,$1b53,$7461,$6e64,$ff18,$6c1b,$5369
	dc.w $7400,$185c,$1b4a,$756d,$70ff,$1864,$1c53,$7461
	dc.w $6e64,$ff18,$6c1b,$5369,$7400,$185c,$1b4a,$756d
	dc.w $70ff,$1864,$1b53,$7461,$6e64,$ff18,$6c1c,$5369
	dc.w $7400,$185c,$1b4a,$756d,$70ff,$1864,$1c53,$7461
	dc.w $6e64,$ff18,$6c1c,$5369,$7400,$185c,$1c4a,$756d
	dc.w $70ff,$1864,$1b53,$7461,$6e64,$ff18,$6c1b,$5369
	dc.w $7400,$185c,$1c4a,$756d,$70ff,$1864,$1c53,$7461
	dc.w $6e64,$ff18,$6c1b,$5369,$7400,$185c,$1c4a,$756d
	dc.w $70ff,$1864,$1b53,$7461,$6e64,$ff18,$6c1c,$5369
	dc.w $7400,$185c,$1c4a,$756d,$70ff,$1864,$1c53,$7461
	dc.w $6e64,$ff18,$6c1c,$5369,$7400

loc_013d80:
	dc.b 'garde_dm       ',$00
	dc.b 'nml_dm0        ',$00
	dc.b 'nml_dm1        ',$00
	dc.b 'nml_dm2        ',$00
	dc.b 'head_dm0       ',$00
	dc.b 'head_dm1       ',$00
	dc.b 'head_dm2       ',$00
	dc.b 'body_dm0       ',$00
	dc.b 'body_dm1       ',$00
	dc.b 'body_dm2       ',$00
	dc.b 'sit_dm0        ',$00
	dc.b 'sit_dm1        ',$00
	dc.b 'sit_dm2        ',$00
	dc.b 'tobi_dm        ',$00
	dc.b 'down_dm        ',$00
	dc.b 'ashi_dm        ',$00
	dc.b 'nage_dm        ',$00
	dc.b 'h_bokki_dm     ',$00
	dc.b 'b_bokki_dm     ',$00
	dc.b 'summer_dm      ',$00
	dc.b 'h_fire_dm      ',$00
	dc.b 'b_fire_dm      ',$00
	dc.b 'fire_down_dm   ',$00
	dc.b 'h_psyc_dm      ',$00
	dc.b 'b_psyc_dm      ',$00
	dc.b 'psyc_down_dm   ',$00
	dc.b 'goro_dm        ',$00
	dc.b 'guru_dm        ',$00
	dc.b 'elec_down_dm   ',$00
	dc.b 'nage1_dm       ',$00
	dc.b 'nage2_dm       ',$00
	dc.b 'sleep_dm       ',$00
	dc.b 'guru2_dm       ',$00
	dc.b 'ne_dm          ',$00
	dc.b 'gurun_dm       ',$00

loc_013fb0:
	dc.b 'no_sd ',$00,$00
	dc.b 'sd_gd ',$00,$00
	dc.b 'sd_p0 ',$00,$00
	dc.b 'sd_p1 ',$00,$00
	dc.b 'sd_p2 ',$00,$00
	dc.b 'sd_sp ',$00,$00
	dc.b 'sd_k0 ',$00,$00
	dc.b 'sd_k1 ',$00,$00
	dc.b 'sd_k2 ',$00,$00
	dc.b 'sd_sk ',$00,$00
	dc.b 'sd_n0 ',$00,$00
	dc.b 'sd_n1 ',$00,$00
	dc.b 'sd_n2 ',$00,$00
	dc.b 'sd_sn ',$00,$00
	dc.b 'sd_KS ',$00,$00
	dc.b 'sd_BO ',$00,$00
	dc.b 'sd_NE ',$00,$00
	dc.b 'sd_EL ',$00,$00
	dc.b 'sd_TT ',$00,$00
	dc.b 'sd_GB ',$00,$00
	dc.b 'no_sd ',$00,$00
	dc.b 'sd_gd ',$00,$00
	dc.b 'ct_sd ',$00,$00
	dc.b 'sd_p1 ',$00,$00
	dc.b 'sd_p2 ',$00,$00
	dc.b 'sd_sp ',$00,$00
	dc.b 'sd_k0 ',$00,$00
	dc.b 'sd_k1 ',$00,$00
	dc.b 'sd_k2 ',$00,$00
	dc.b 'sd_sk ',$00,$00
	dc.b 'sd_n0 ',$00,$00
	dc.b 'sd_n1 ',$00,$00
	dc.b 'sd_n2 ',$00,$00
	dc.b 'sd_sn ',$00,$00
	dc.b 'sd_KS ',$00,$00
	dc.b 'sd_BO ',$00,$00
	dc.b 'sd_NE ',$00,$00
	dc.b 'sd_EL ',$00,$00
	dc.b 'sd_TT ',$00,$00
	dc.b 'sd_GB ',$00,$00

loc_0140f0:
	dc.w $6666,$2000,$2a2a,$2000,$6e32,$2000,$2a2a,$2000
	dc.w $6e34,$2000,$2a2a,$2000,$6e38,$2000,$4e4d,$4100
	dc.w $5353,$4100,$4558,$4100

loc_014118:
	dc.w $6e6c,$7630,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6e6c,$7631,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6e6c,$7632,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $736c,$7630,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $736c,$7631,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $736c,$7632,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $7375,$7072,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6e6f,$6d6b,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $626c,$6f64,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $736d,$6b30,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $736d,$6b31,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6772,$6e64,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6764,$626b,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $6e6c,$6764,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $7370,$6764,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $7373,$6764,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $636e,$7472,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $2a2a,$2a2a,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $2a2a,$2a2a,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $2a2a,$2a2a,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $2a2a,$2a2a,$2000,$0000,$2a2a,$2a2a,$2000,$0000
	dc.w $725f,$6673,$2000,$0000

loc_014270:
	dc.w $6f6f,$6f00,$6f6f,$7800
	dc.w $6f78,$6f00,$6f78,$7800
	dc.w $786f,$6f00,$786f,$7800
	dc.w $7878,$6f00,$7878,$7800
	dc.w $6475,$6d6d,$7920,$2000
	dc.w $6e6f,$726d,$616c,$3000
	dc.w $7370,$6563,$6961,$6c00
	dc.w $7469,$6d65,$6f75,$7400
	dc.w $6669,$6e61,$6c72,$6400
	dc.w $3035,$2020,$2020,$2000
	dc.w $3036,$2020,$2020,$2000
	dc.w $775f,$6c65,$7665,$6c00
	dc.w $765f,$6f72,$6963,$6d00
	dc.w $785f,$7375,$7065,$7200
	dc.w $7a5f,$6c65,$7630,$3100
	dc.w $7a5f,$6c65,$7630,$3200
	dc.w $7a5f,$6c65,$7630,$3300
	dc.w $3064,$2020,$2020,$2000
	dc.w $3065,$2020,$2020,$2000
	dc.w $3066,$2020,$2020,$2000
	dc.w $2a2a,$2a2a,$2a2a,$2a00

loc_014318:
	dc.w $6e6f,$5f61,$6b62,$6f6e,$6f20,$0000,$0000,$0000
	dc.w $616b,$626e,$5f6e,$6d61,$6c20,$0000,$0000,$0000
	dc.w $616b,$626e,$5f72,$6774,$7520,$0000,$0000,$0000
	dc.w $616b,$626e,$5f6c,$6674,$7520,$0000,$0000,$0000
	dc.w $616b,$626e,$5f76,$6572,$7520,$0000,$0000,$0000
	dc.w $616b,$626e,$5f76,$6572,$6420,$0000,$0000,$0000
	dc.w $616b,$626e,$5f68,$6f6c,$6920,$0000,$0000,$0000
	dc.w $616b,$626e,$5f6c,$616e,$6420,$0000,$0000,$0000
	dc.w $616b,$626e,$5f73,$7063,$6c20,$0000,$0000,$0000
	dc.w $616b,$626e,$5f76,$6567,$6120,$0000,$0000,$0000
	dc.w $616b,$626e,$5f6f,$7263,$6d20,$0000,$0000,$0000
	dc.w $616b,$626e,$5f6c,$6f63,$6120,$0000,$0000,$0000
	dc.w $616b,$626e,$5f67,$6f75,$6b20,$0000,$0000,$0000

loc_0143e8:
	dc.w $4230,$2000,$4231,$2000,$4232,$2000,$4233,$2000
	dc.w $4234,$2000,$4235,$2000,$4236,$2000,$4237,$2000
	dc.w $2a2a,$2000,$2a2a,$2000,$2a2a,$2000,$2a2a,$2000
	dc.w $2a2a,$2000,$2a2a,$2000,$2a2a,$2000,$2a2a,$2000
	dc.w $4630,$2000,$4631,$2000,$4632,$2000,$4633,$2000
	dc.w $4634,$2000,$4635,$2000,$4636,$2000,$4637,$2000
	dc.w $2a2a,$2000,$2a2a,$2000,$2a2a,$2000,$2a2a,$2000
	dc.w $2a2a,$2000,$2a2a,$2000,$2a2a,$2000,$2a2a,$2000
	dc.w $4130,$2000,$4131,$2000,$4132,$2000,$4133,$2000
	dc.w $4134,$2000,$4135,$2000,$4136,$2000,$4137,$2000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

loc_0144a8:
	dc.w $00ff,$ffff,$ffff,$ffff,$00ff,$ffff,$ffff,$ffff
	dc.w $00ff,$ffff,$ffff,$ffff,$ffff,$ffff,$ffff,$ffff
	dc.w $ffff,$ffff,$ffff,$ffff,$ffff,$ffff,$ffff,$30ff
	dc.w $ffff,$ffff,$ffff,$ffff,$ffff,$ffff,$ff45,$ffff
	dc.w $ffff,$ffff,$ffff,$ffff,$ffff,$ffff,$60ff,$ffff
	dc.w $ffff,$ffff,$ffff,$ffff,$ffff,$ff75

loc_014504:
	dc.w $3144,$2000,$3145,$2000,$3146,$2000,$0006,$0e00
	dc.w $0a08,$0c00,$0204,$1000,$0000,$0000,$0114,$1f00
	dc.w $2020,$2020,$2020,$2020,$2020,$2020,$2020,$2000

loc_014534:
	dc.w $0014,$61e8,$0015,$2da4,$0015,$c5cc,$0016,$7cb0
	dc.w $0017,$13a8,$0018,$5676,$0018,$efcc,$001a,$5eec
	dc.w $001a,$f7e6,$001b,$b3f2,$001c,$a1de,$001d,$e87e
	dc.w $001e,$9472,$001f,$1112,$001f,$e362,$0020,$d366
	dc.w $0021,$bde4,$0022,$9418,$0017,$13a8,$0022,$9418
	dc.w $0015,$c5cc,$0023,$87ec,$0023,$fe00,$0014,$61e8
	dc.w $0024,$be0a,$0025,$4b3c,$0026,$2344,$0027,$0f16
	dc.w $0027,$dc4a,$0028,$a274,$0029,$8f0c,$002a,$8270

loc_0145b4:
	dc.w $0014,$61e8,$0008,$0000,$0000,$0000,$0000,$0014
	dc.w $0014,$61e8,$000c,$0000,$0000,$0000,$0000,$0014
	dc.w $0014,$61e8,$0018,$0000,$0000,$0000,$0000,$0014
	dc.w $0014,$61e8,$001c,$0000,$0000,$0000,$0000,$0014
	dc.w $0014,$61e8,$0028,$0000,$0000,$0000,$0000,$0014
	dc.w $0014,$61e8,$002c,$0000,$0000,$0000,$0000,$0014
	dc.w $0015,$2da4,$0008,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$2da4,$000c,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$2da4,$0018,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$2da4,$001c,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$2da4,$0028,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$2da4,$002c,$0000,$0000,$0000,$0000,$0114
	dc.w $0015,$c5cc,$0008,$0000,$0000,$0000,$0000,$0214
	dc.w $0015,$c5cc,$000c,$0000,$0000,$0000,$0000,$0214
	dc.w $0015,$c5cc,$0018,$0000,$0000,$0000,$0000,$0214
	dc.w $0015,$c5cc,$001c,$0000,$0000,$0000,$0000,$0214
	dc.w $0015,$c5cc,$0028,$0000,$0000,$0000,$0000,$0214
	dc.w $0015,$c5cc,$002c,$0000,$0000,$0000,$0000,$0214
	dc.w $0016,$7cb0,$0008,$0000,$0000,$0000,$0000,$0314
	dc.w $0016,$7cb0,$000c,$0000,$0000,$0000,$0000,$0314
	dc.w $0016,$7cb0,$0018,$0000,$0000,$0000,$0000,$0314
	dc.w $0016,$7cb0,$001c,$0000,$0000,$0000,$0000,$0314
	dc.w $0016,$7cb0,$0028,$0000,$0000,$0000,$0000,$0314
	dc.w $0016,$7cb0,$002c,$0000,$0000,$0000,$0000,$0314
	dc.w $0017,$13a8,$0008,$0000,$0000,$0000,$0000,$0414
	dc.w $0017,$13a8,$000c,$0000,$0000,$0000,$0000,$0414
	dc.w $0017,$13a8,$0018,$0000,$0000,$0000,$0000,$0414
	dc.w $0017,$13a8,$001c,$0000,$0000,$0000,$0000,$0414
	dc.w $0017,$13a8,$0028,$0000,$0000,$0000,$0000,$0414
	dc.w $0017,$13a8,$002c,$0000,$0000,$0000,$0000,$0414
	dc.w $0018,$5676,$0008,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$5676,$000c,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$5676,$0018,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$5676,$001c,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$5676,$0028,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$5676,$002c,$0000,$0000,$0000,$0000,$0514
	dc.w $0018,$efcc,$0008,$0000,$0000,$0000,$0000,$0614
	dc.w $0018,$efcc,$000c,$0000,$0000,$0000,$0000,$0614
	dc.w $0018,$efcc,$0018,$0000,$0000,$0000,$0000,$0614
	dc.w $0018,$efcc,$001c,$0000,$0000,$0000,$0000,$0614
	dc.w $0018,$efcc,$0028,$0000,$0000,$0000,$0000,$0614
	dc.w $0018,$efcc,$002c,$0000,$0000,$0000,$0000,$0614
	dc.w $001a,$5eec,$0008,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$5eec,$000c,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$5eec,$0018,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$5eec,$001c,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$5eec,$0028,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$5eec,$002c,$0000,$0000,$0000,$0000,$0714
	dc.w $001a,$f7e6,$0008,$0000,$0000,$0000,$0000,$0814
	dc.w $001a,$f7e6,$000c,$0000,$0000,$0000,$0000,$0814
	dc.w $001a,$f7e6,$0018,$0000,$0000,$0000,$0000,$0814
	dc.w $001a,$f7e6,$001c,$0000,$0000,$0000,$0000,$0814
	dc.w $001a,$f7e6,$0028,$0000,$0000,$0000,$0000,$0814
	dc.w $001a,$f7e6,$002c,$0000,$0000,$0000,$0000,$0814
	dc.w $001b,$b3f2,$0008,$0000,$0000,$0000,$0000,$0914
	dc.w $001b,$b3f2,$000c,$0000,$0000,$0000,$0000,$0914
	dc.w $001b,$b3f2,$0018,$0000,$0000,$0000,$0000,$0914
	dc.w $001b,$b3f2,$001c,$0000,$0000,$0000,$0000,$0914
	dc.w $001b,$b3f2,$0028,$0000,$0000,$0000,$0000,$0914
	dc.w $001b,$b3f2,$002c,$0000,$0000,$0000,$0000,$0914
	dc.w $001c,$a1de,$0008,$0000,$0000,$0000,$0000,$0a14
	dc.w $001c,$a1de,$000c,$0000,$0000,$0000,$0000,$0a14
	dc.w $001c,$a1de,$0018,$0000,$0000,$0000,$0000,$0a14
	dc.w $001c,$a1de,$001c,$0000,$0000,$0000,$0000,$0a14
	dc.w $001c,$a1de,$0028,$0000,$0000,$0000,$0000,$0a14
	dc.w $001c,$a1de,$002c,$0000,$0000,$0000,$0000,$0a14
	dc.w $001d,$e87e,$0008,$0000,$0000,$0000,$0000,$0b14
	dc.w $001d,$e87e,$000c,$0000,$0000,$0000,$0000,$0b14
	dc.w $001d,$e87e,$0018,$0000,$0000,$0000,$0000,$0b14
	dc.w $001d,$e87e,$001c,$0000,$0000,$0000,$0000,$0b14
	dc.w $001d,$e87e,$0028,$0000,$0000,$0000,$0000,$0b14
	dc.w $001d,$e87e,$002c,$0000,$0000,$0000,$0000,$0b14
	dc.w $001e,$9472,$0008,$0000,$0000,$0000,$0000,$0c14
	dc.w $001e,$9472,$000c,$0000,$0000,$0000,$0000,$0c14
	dc.w $001e,$9472,$0018,$0000,$0000,$0000,$0000,$0c14
	dc.w $001e,$9472,$001c,$0000,$0000,$0000,$0000,$0c14
	dc.w $001e,$9472,$0028,$0000,$0000,$0000,$0000,$0c14
	dc.w $001e,$9472,$002c,$0000,$0000,$0000,$0000,$0c14
	dc.w $001f,$1112,$0008,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$1112,$000c,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$1112,$0018,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$1112,$001c,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$1112,$0028,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$1112,$002c,$0000,$0000,$0000,$0000,$0d14
	dc.w $001f,$e362,$0008,$0000,$0000,$0000,$0000,$0e14
	dc.w $001f,$e362,$000c,$0000,$0000,$0000,$0000,$0e14
	dc.w $001f,$e362,$0018,$0000,$0000,$0000,$0000,$0e14
	dc.w $001f,$e362,$001c,$0000,$0000,$0000,$0000,$0e14
	dc.w $001f,$e362,$0028,$0000,$0000,$0000,$0000,$0e14
	dc.w $001f,$e362,$002c,$0000,$0000,$0000,$0000,$0e14
	dc.w $0020,$d366,$0008,$0000,$0000,$0000,$0000,$0f14
	dc.w $0020,$d366,$000c,$0000,$0000,$0000,$0000,$0f14
	dc.w $0020,$d366,$0018,$0000,$0000,$0000,$0000,$0f14
	dc.w $0020,$d366,$001c,$0000,$0000,$0000,$0000,$0f14
	dc.w $0020,$d366,$0028,$0000,$0000,$0000,$0000,$0f14
	dc.w $0020,$d366,$002c,$0000,$0000,$0000,$0000,$0f14
	dc.w $0021,$bde4,$0008,$0000,$0000,$0000,$0000,$1014
	dc.w $0021,$bde4,$000c,$0000,$0000,$0000,$0000,$1014
	dc.w $0021,$bde4,$0018,$0000,$0000,$0000,$0000,$1014
	dc.w $0021,$bde4,$001c,$0000,$0000,$0000,$0000,$1014
	dc.w $0021,$bde4,$0028,$0000,$0000,$0000,$0000,$1014
	dc.w $0021,$bde4,$002c,$0000,$0000,$0000,$0000,$1014
	dc.w $0022,$9418,$0008,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9418,$000c,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9418,$0018,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9418,$001c,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9418,$0028,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9418,$002c,$0000,$0000,$0000,$0000,$1114
	dc.w $0022,$9448,$0008,$0000,$0000,$0000,$0000,$1314
	dc.w $0022,$9448,$000c,$0000,$0000,$0000,$0000,$1314
	dc.w $0022,$9448,$0018,$0000,$0000,$0000,$0000,$1314
	dc.w $0022,$9448,$001c,$0000,$0000,$0000,$0000,$1314
	dc.w $0022,$9448,$0028,$0000,$0000,$0000,$0000,$1314
	dc.w $0022,$9448,$002c,$0000,$0000,$0000,$0000,$1314
	dc.w $0023,$87ec,$0008,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$87ec,$000c,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$87ec,$0018,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$87ec,$001c,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$87ec,$0028,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$87ec,$002c,$0000,$0000,$0000,$0000,$1514
	dc.w $0023,$fe00,$0008,$0000,$0000,$0000,$0000,$1614
	dc.w $0023,$fe00,$000c,$0000,$0000,$0000,$0000,$1614
	dc.w $0023,$fe00,$0018,$0000,$0000,$0000,$0000,$1614
	dc.w $0023,$fe00,$001c,$0000,$0000,$0000,$0000,$1614
	dc.w $0023,$fe00,$0028,$0000,$0000,$0000,$0000,$1614
	dc.w $0023,$fe00,$002c,$0000,$0000,$0000,$0000,$1614
	dc.w $0024,$be0a,$0008,$0000,$0000,$0000,$0000,$1814
	dc.w $0024,$be0a,$000c,$0000,$0000,$0000,$0000,$1814
	dc.w $0024,$be0a,$0018,$0000,$0000,$0000,$0000,$1814
	dc.w $0024,$be0a,$001c,$0000,$0000,$0000,$0000,$1814
	dc.w $0024,$be0a,$0028,$0000,$0000,$0000,$0000,$1814
	dc.w $0024,$be0a,$002c,$0000,$0000,$0000,$0000,$1814
	dc.w $0025,$4b3c,$0008,$0000,$0000,$0000,$0000,$1914
	dc.w $0025,$4b3c,$000c,$0000,$0000,$0000,$0000,$1914
	dc.w $0025,$4b3c,$0018,$0000,$0000,$0000,$0000,$1914
	dc.w $0025,$4b3c,$001c,$0000,$0000,$0000,$0000,$1914
	dc.w $0025,$4b3c,$0028,$0000,$0000,$0000,$0000,$1914
	dc.w $0025,$4b3c,$002c,$0000,$0000,$0000,$0000,$1914
	dc.w $0026,$2344,$0008,$0000,$0000,$0000,$0000,$1a14
	dc.w $0026,$2344,$000c,$0000,$0000,$0000,$0000,$1a14
	dc.w $0026,$2344,$0018,$0000,$0000,$0000,$0000,$1a14
	dc.w $0026,$2344,$001c,$0000,$0000,$0000,$0000,$1a14
	dc.w $0026,$2344,$0028,$0000,$0000,$0000,$0000,$1a14
	dc.w $0026,$2344,$002c,$0000,$0000,$0000,$0000,$1a14
	dc.w $0027,$0f16,$0008,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$0f16,$000c,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$0f16,$0018,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$0f16,$001c,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$0f16,$0028,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$0f16,$002c,$0000,$0000,$0000,$0000,$1b14
	dc.w $0027,$dc4a,$0008,$0000,$0000,$0000,$0000,$1c14
	dc.w $0027,$dc4a,$000c,$0000,$0000,$0000,$0000,$1c14
	dc.w $0027,$dc4a,$0018,$0000,$0000,$0000,$0000,$1c14
	dc.w $0027,$dc4a,$001c,$0000,$0000,$0000,$0000,$1c14
	dc.w $0027,$dc4a,$0028,$0000,$0000,$0000,$0000,$1c14
	dc.w $0027,$dc4a,$002c,$0000,$0000,$0000,$0000,$1c14
	dc.w $0028,$a274,$0008,$0000,$0000,$0000,$0000,$1d14
	dc.w $0028,$a274,$000c,$0000,$0000,$0000,$0000,$1d14
	dc.w $0028,$a274,$0018,$0000,$0000,$0000,$0000,$1d14
	dc.w $0028,$a274,$001c,$0000,$0000,$0000,$0000,$1d14
	dc.w $0028,$a274,$0028,$0000,$0000,$0000,$0000,$1d14
	dc.w $0028,$a274,$002c,$0000,$0000,$0000,$0000,$1d14
	dc.w $0029,$8f0c,$0008,$0000,$0000,$0000,$0000,$1e14
	dc.w $0029,$8f0c,$000c,$0000,$0000,$0000,$0000,$1e14
	dc.w $0029,$8f0c,$0018,$0000,$0000,$0000,$0000,$1e14
	dc.w $0029,$8f0c,$001c,$0000,$0000,$0000,$0000,$1e14
	dc.w $0029,$8f0c,$0028,$0000,$0000,$0000,$0000,$1e14
	dc.w $0029,$8f0c,$002c,$0000,$0000,$0000,$0000,$1e14
	dc.w $002a,$8270,$0008,$0000,$0000,$0000,$0000,$1f14
	dc.w $002a,$8270,$000c,$0000,$0000,$0000,$0000,$1f14
	dc.w $002a,$8270,$0018,$0000,$0000,$0000,$0000,$1f14
	dc.w $002a,$8270,$001c,$0000,$0000,$0000,$0000,$1f14
	dc.w $002a,$8270,$0028,$0000,$0000,$0000,$0000,$1f14
	dc.w $002a,$8270,$002c,$0000,$0000,$0000,$0000,$1f14

loc_015094:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0007,$2dc6,$0007,$3614,$0007,$3ba4,$0007,$4e7c
	dc.w $0007,$5208,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$60b2,$0007,$682a,$0007,$6b94
	dc.w $0007,$759e,$0007,$7db6,$0007,$8a18,$0007,$8e3e
	dc.w $0007,$9092,$0000,$0000,$0007,$5208,$0000,$0000
	dc.w $0000,$0000,$0007,$91a2,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$9a9c,$0000,$0000,$0007,$9f1c
	dc.w $0007,$a074,$0000,$0000,$0007,$a456,$0007,$ae0e
	dc.w $0007,$2dce,$0007,$361c,$0007,$3bac,$0007,$4e84
	dc.w $0007,$5210,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$60c2,$0007,$6832,$0007,$6bb0
	dc.w $0007,$75a6,$0007,$7dca,$0007,$8a20,$0007,$8e46
	dc.w $0007,$90a2,$0000,$0000,$0007,$5210,$0000,$0000
	dc.w $0000,$0000,$0007,$91aa,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0007,$9ab0,$0000,$0000,$0007,$9f24
	dc.w $0007,$a07c,$0000,$0000,$0007,$a462,$0007,$ae16

loc_0151a4:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0030,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0010,$2020,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0030,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0111,$2121,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0030,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0212,$2222,$0000,$0030
	dc.w $0034,$0000,$0000,$0000,$0000,$0097,$0076,$0000
	dc.w $0074,$0000,$0091,$0080,$0095,$007e,$0000,$0087
	dc.w $0000,$0000,$0000,$0000,$0000,$0000

loc_015270:
	dc.w $0001,$0202,$0102,$0304,$0506,$0708,$090a,$0b0c
	dc.w $0d0e,$0f10,$1112,$1314,$1516,$1718,$191a,$1b1c
	dc.w $1d1e,$1f10,$2122,$2324,$2526,$2728,$292a,$2b2c
	dc.w $2d2e,$2f10,$3132,$3334,$3536,$3738,$393a,$3b3c
	dc.w $3d3e,$3f3f,$0000,$0809,$0a0b,$0c0d,$0e0e,$0000
	dc.w $0102,$0304,$0506,$0600,$0102,$1011,$1220,$2122
	dc.w $2200,$0204,$0401,$0101,$0203,$0506,$0707,$0000
	dc.w $0000,$0032,$0000,$0000,$0000,$0000,$0086,$0000
	dc.w $0000,$007e,$0000,$0082,$0000,$0030,$007c,$0000
	dc.w $0072,$0000,$0000,$0000,$0000,$0000,$0000,$0202
	dc.w $0102,$0304,$0506,$0708,$090a,$0b0c,$0d0e,$0f10
	dc.w $1112,$1314,$1516,$1718,$191a,$1b1c,$1d1e,$1f10
	dc.w $2122,$2324,$2526,$2728,$292a,$2b2c,$2d2e,$2f10
	dc.w $3132,$3334,$3536,$3738,$393a,$3b3c,$3d3e,$3f3f
	dc.w $0203,$0412,$1314,$2223,$2424,$0000,$0204,$0606
	dc.w $0608,$0a0a,$0408,$0800,$0000,$0000,$0035,$0000
	dc.w $0000,$0000,$0000,$0095,$0000,$0075,$008f,$0000
	dc.w $0093,$0000,$0030,$0084,$0000,$0077,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$090a,$0b0c,$0c01,$0203
	dc.w $0405,$0607,$0809,$0a0b,$0c0d,$0e0f,$1011,$1213
	dc.w $1415,$1617,$1819,$1a1b,$1c1d,$1e1f,$1021,$2223
	dc.w $2425,$2627,$2829,$2a2b,$2c2d,$2e2f,$1031,$3233
	dc.w $3435,$3637,$3839,$3a3b,$3c3d,$3e3f,$3f00,$0004
	dc.w $0506,$0714,$1516,$1724,$2526,$2727,$0182,$8304
	dc.w $0506,$0708,$090c,$0c02,$0406,$060c,$0c04,$0808
	dc.w $00ff,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0076,$0076,$0076,$0076,$0076,$0076,$0076
	dc.w $0076,$0413,$0fff,$0ff9,$0fd7,$0fb6,$0f93,$0f71
	dc.w $0f50,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001f,$0111,$0222,$0333,$0444,$0555,$0666,$0777
	dc.w $0888,$0111,$0222,$0333,$0444,$0555,$0666,$0777
	dc.w $0888,$0124,$0fff,$06ff,$05df,$03bf,$029f,$017f
	dc.w $005f,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001e,$0133,$0fff,$0afc,$08e9,$06c7,$04b5,$02a2
	dc.w $0090,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001b,$0088,$0099,$00aa,$00bb,$00cc,$00dd,$00ee
	dc.w $00ff,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001e,$0511,$0fff,$0fac,$0f8a,$0f68,$0f22,$0d11
	dc.w $0c00,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001d,$0808,$0909,$0a0a,$0b0b,$0c0c,$0d0d,$0e0e
	dc.w $0f0f,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001e,$0324,$0fff,$0ff9,$0ff6,$0ee3,$0dd1,$0cb0
	dc.w $0b90,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff
	dc.w $001a,$0444,$0fff,$0fff,$0ddd,$0ccc,$0bbb,$0aaa
	dc.w $0999,$0111,$0333,$0555,$0888,$0aaa,$0ccc,$0fff

loc_015560:
	dc.w $001c,$0140,$0000,$0001,$557a,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0012

;==============================================
;West Menu Text
;==============================================
loc_01557c:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_015584
	moveq #-1,d2

loc_015584:
	move.w loc_0155c4(pc,d0.w),d0
	lea.l loc_0155c4(pc,d0.w),a0

loc_01558c:
	moveq #0,d0
	lea.l $900000,a1
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_0155a2:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_0155c2
	bmi.b loc_01558c
	addi.w #0,d0
	tst.b d2
	beq.b loc_0155b6
	move.w #$20,d0

loc_0155b6:
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	bra.b loc_0155a2

loc_0155c2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0155c4:
	dc.w loc_01560c-loc_0155c4
	dc.w loc_0156d9-loc_0155c4
	dc.w loc_015735-loc_0155c4
	dc.w loc_01575d-loc_0155c4
	dc.w loc_0157da-loc_0155c4
	dc.w loc_0157fa-loc_0155c4
	dc.w loc_015a11-loc_0155c4
	dc.w loc_015a29-loc_0155c4
	dc.w loc_015aeb-loc_0155c4
	dc.w loc_015b03-loc_0155c4
	dc.w loc_015b60-loc_0155c4
	dc.w loc_015b85-loc_0155c4
	dc.w loc_015bda-loc_0155c4
	dc.w loc_015c3c-loc_0155c4
	dc.w loc_015c91-loc_0155c4
	dc.w loc_015cf7-loc_0155c4
	dc.w loc_015d74-loc_0155c4
	dc.w loc_015e43-loc_0155c4
	dc.w loc_015f21-loc_0155c4
	dc.w loc_016001-loc_0155c4
	dc.w loc_016104-loc_0155c4
	dc.w loc_0161e5-loc_0155c4
	dc.w loc_016211-loc_0155c4
	dc.w loc_0162cb-loc_0155c4
	dc.w loc_0162e7-loc_0155c4
	dc.w loc_016407-loc_0155c4
	dc.w loc_0164c0-loc_0155c4
	dc.w loc_0165d1-loc_0155c4
	dc.w loc_0166ce-loc_0155c4
	dc.w loc_0167a8-loc_0155c4
	dc.w loc_0167e0-loc_0155c4
	dc.w loc_016818-loc_0155c4
	dc.w loc_016850-loc_0155c4
	dc.w loc_01686d-loc_0155c4
	dc.w loc_016889-loc_0155c4
	dc.w loc_0168a5-loc_0155c4

loc_01560c:
	dc.b $0f,$0c,$1f
	dc.b 'T E S T   M E N U',$FF

	dc.b $10,$18,$1f
	dc.b '1 INPUT',$ff

	dc.b $10,$20,$1f
	dc.b '2 OUTPUT',$ff

	dc.b $10,$28,$1f
	dc.b '3 SOUND & VOICE',$ff

	dc.b $10,$30,$1f
	dc.b '4 COLOR',$ff

	dc.b $10,$38,$1f
	dc.b '5 DOT CROSS HATCH',$ff

	dc.b $10,$40,$1f
	dc.b '6 GAME DATA',$ff

	dc.b $10,$48,$1f
	dc.b '7 CONFIGURATION',$ff

	dc.b $10,$50,$1f
	dc.b '8 MEMORY CHECK',$ff

	dc.b $10,$58,$1f
	dc.b '9 EXIT',$ff

	dc.b $0d,$70,$1b
	dc.b 'SELECT = 1P UP or DOWN',$ff

	dc.b $0d,$74,$1b
	dc.b 'START  = 1P SHOT 1',$00

loc_0156d9:
	dc.b $0c,$0c,$1f
	dc.b '1 . I N P U T   T E S T',$ff

	dc.b $06,$18,$1f
	dc.b 'SERVICE',$ff

	dc.b $06,$1c,$1f
	dc.b 'TEST',$ff

	dc.b $10,$24,$1f
	dc.b '1P',$ff

	dc.b $20,$24,$1f
	dc.b '2P',$ff

	dc.b $06,$28,$1f
	dc.b 'COIN',$ff

	dc.b $06,$2c,$1f
	dc.b 'START',$ff

	dc.b $06,$34,$1f
	dc.b 'LEVER',$ff

	dc.b $06,$44,$1f
	dc.b 'SHOT',00

loc_015735:
	dc.b $06,$50,$1f
	dc.b 'DIP-SW     -12345678-',$ff

	dc.b $0a,$54,$1f
	dc.b 'A',$ff
	dc.b $0a,$58,$1f
	dc.b 'B',$ff
	dc.b $0a,$5c,$1f
	dc.b 'C',$00

loc_01575d:
	dc.b $0b,$0c,$1f
	dc.b '2 . O U T P U T   T E S T',$ff

	dc.b $0a,$1c,$1f
	dc.b 'COIN LOCK 1P      (1P SHOT1)',$ff

	dc.b $0a,$24,$1f
	dc.b 'COIN LOCK 2P      (2P SHOT1)',$ff

	dc.b $0a,$30,$1f
	dc.b 'ELECTRIC COUNTER  (1P SHOT2)',00

loc_0157da:
	dc.b $0a,$3c,$1f
	dc.b 'CARD DISPENSER    (2P SHOT2)',00

loc_0157fa:
	dc.b $0e,$0c,$1f
	dc.b 'Q S O U N D   T E S T',$ff

	dc.b $06,$14,$1f
	dc.b 'REQ-No.=(    H)',$ff

	dc.b $18,$14,$1b
	dc.b 'No.CHANGE(1P LEVER)',$ff

	dc.b $18,$18,$1b
	dc.b 'SOUND REQ(1P SHOT1)',$ff

	dc.b $18,$1c,$1b
	dc.b 'SOUND OFF(1P SHOT2)',$ff

	dc.b $05,$24,$1f
	dc.b '-MODE-  START DISTANCE SPEED1   SPEED2',$ff

	dc.b $08,$28,$1f
	dc.b '0    [  H]',$ff

	dc.b $08,$2c,$1f
	dc.b '1    [  H]          [    H]',$ff

	dc.b $08,$30,$1f
	dc.b '2    [  H]   [  H]  [    H]',$ff

	dc.b $08,$34,$1f
	dc.b '3    [  H]   [  H]  [    H]',$ff

	dc.b $08,$38,$1f
	dc.b '4    [  H]   [  H]  [    H]',$ff

	dc.b $08,$3c,$1f
	dc.b '5    [  H]   [  H]  [    H]  [    H]',$ff

	dc.b $08,$40,$1f
	dc.b '6    [  H]   [  H]  [    H]  [    H]',$ff

	dc.b $08,$44,$1f
	dc.b '7    [  H]   [  H]  [    H]',$ff

	dc.b $14,$4c,$1f
	dc.b 'POSITION',$ff

	dc.b $06,$64,$1b
	dc.b 'MODE SELECT      = 2P UP or DOWN',$ff

	dc.b $06,$68,$1b
	dc.b 'PALAMETER SELECT = 2P LEFT or RIGHT',$ff

	dc.b $06,$6c,$1b
	dc.b 'PALAMETER CHANGE = 2P SHOT1&(UP or DOWN)',00

loc_015a11:
	dc.b $13,$58,$1f
	dc.b 'VOLUME',$ff

	dc.b $04,$58,$1f
	dc.b 'MIN',$ff

	dc.b $28,$58,$1f
	dc.b 'MAX',00

loc_015a29:
	dc.b $04,$0c,$1f
	dc.b '3 . S O U N D   &   V O I C E   T E S T',$ff

	dc.b $0e,$18,$1f
	dc.b 'SOUND CODE NO.',$ff

	dc.b $0e,$20,$1b
	dc.b 'CODE +01 = 1P UP',$ff

	dc.b $0e,$24,$1b
	dc.b 'CODE -01 = 1P DOWN',$ff

	dc.b $0e,$28,$1b
	dc.b 'CODE +10 = 1P RIGHT',$ff

	dc.b $0e,$2c,$1b
	dc.b 'CODE -10 = 1P LEFT',$ff

	dc.b $0e,$30,$1b
	dc.b 'REQUEST  = 1P SHOT1',$ff

	dc.b $0e,$34,$1b
	dc.b 'STOP     = 1P SHOT2',00

loc_015aeb:
	dc.b $15,$64,$1f
	dc.b 'VOLUME',$ff

	dc.b $03,$70,$1f 
	dc.b 'MIN',$ff

	dc.b $29,$70,$1f
	dc.b 'MAX',00

loc_015b03:
	dc.b $0d,$0c,$1f
	dc.b '4 . C O L O R   B A R',$ff

	dc.b $0b,$18,$1f
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff

	dc.b $06,$20,$1d
	dc.b 'RED',$ff
	dc.b $04,$34,$1b
	dc.b 'GREEN',$ff
	dc.b $05,$48,$1e
	dc.b 'BLUE',$ff
	dc.b $04,$5c,$19
	dc.b 'WHITE',00

loc_015b60:
	dc.b $07,$0c,$1f
	dc.b '5 . D O T   C R O S S   H A T C H',00

loc_015b85:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'CARD     COUNTER',00

loc_015bda:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN    COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'CARD    COUNTER',$ff
	dc.b $0b,$30,$1f
	dc.b 'AVERAGE TIME',00

loc_015c3c:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'FREEPLAY COUNTER',00

loc_015c91:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'FREEPLAY COUNTER',$ff
	dc.b $0b,$30,$1f
	dc.b 'AVERAGE  TIME',00


loc_015cf7:
	dc.b $04,$0c,$1f
	dc.b '7 . C O N F I G U R A T I O N   M E N U',$ff

	dc.b $12,$1c,$1f
	dc.b '1. SYSTEM',$ff

	dc.b $12,$24,$1f
	dc.b '2. GAME',$ff

	dc.b $12,$2c,$1f
	dc.b '3. DEFAULT',$ff

	dc.b $12,$34,$1f
	dc.b '4. SAVE & EXIT',$ff

	dc.b $0d,$6c,$1b
	dc.b 'SELECT = 1P UP or DOWN',00

loc_015d74:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_015e43:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. LANGUAGE',$ff
	dc.b $09,$58,$1f
	dc.b '8. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_015f21:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. VOICE TYPE',$ff
	dc.b $03,$58,$1f
	dc.b '9. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_016001:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. C.DISPENSER',$ff
	dc.b $03,$58,$1f
	dc.b '9. WIN POINT',$ff
	dc.b $02,$60,$1f
	dc.b '10. WIN POINT',$ff
	dc.b $02,$68,$1f
	dc.b '11. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_016104:
	dc.b $03,$0c,$1f
	dc.b '7-2 . G A M E   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. DIFFICULTY',$ff
	dc.b $03,$20,$1f
	dc.b '2. DAMAGE LEVEL',$ff
	dc.b $03,$28,$1f
	dc.b '3. TIMER SPEED',$ff
	dc.b $03,$30,$1f
	dc.b '4. GAME SPEED',$ff
	dc.b $03,$38,$1f
	dc.b '5. 1P MAX ROUND',$ff
	dc.b $03,$40,$1f
	dc.b '6. 2P MAX ROUND',$ff
	dc.b $03,$48,$1f
	dc.b '7. EVENT',$ff
	dc.b $03,$50,$1f
	dc.b '8. JOIN-IN',$ff
	dc.b $03,$58,$1f
	dc.b '9. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_0161e5:
	dc.b $0a,$30,$1d
	dc.b 'SAVING NEW CONFIGURATION',$ff

	dc.b $1a,$38,$1d
	dc.b 'IN EEPROM...',00

loc_016211:
	dc.b $0a,$0c,$1f
	dc.b '8 . M E M O R Y   C H E C K',$ff
	dc.b $10,$1c,$1f
	dc.b 'W O R K RAM',$ff
	dc.b $10,$24,$1f
	dc.b 'C P S   RAM',$ff
	dc.b $10,$2c,$1f
	dc.b 'OBJECT  RAM',$ff
	dc.b $10,$34,$1f
	dc.b 'QSOUND  RAM',$ff
	dc.b $10,$3c,$1f
	dc.b 'E E P   ROM',$ff
	dc.b $10,$44,$1f
	dc.b 'PROGRAM ROM 0',$ff
	dc.b $18,$48,$1f
	dc.b 'ROM 1',$ff
	dc.b $18,$4c,$1f
	dc.b 'ROM 2',$ff
	dc.b $18,$50,$1f
	dc.b 'ROM 3',$ff
	dc.b $18,$54,$1f
	dc.b 'ROM 4',$ff
	dc.b $18,$58,$1f
	dc.b 'ROM 5',$ff
	dc.b $18,$5c,$1f
	dc.b 'ROM 6',$ff
	dc.b $18,$60,$1f
	dc.b 'ROM 7',00

loc_0162cb:
	dc.b $0c,$74,$1d
	dc.b 'EXIT = 1P START & SHOT 1',00

loc_0162e7:
	dc.b $0d,$0c,$1f
	dc.b 'S E C R E T   T E S T',$ff
	dc.b $06,$20,$1f
	dc.b '1 OBJECT TEST',$ff
	dc.b $06,$28,$1f
	dc.b '2 SCROLL 1 TEST',$ff
	dc.b $06,$30,$1f
	dc.b '3 SCROLL 2 TEST',$ff
	dc.b $06,$38,$1f
	dc.b '4 SCROLL 3 TEST',$ff
	dc.b $06,$40,$1f
	dc.b '5 CHARACTER TEST',$ff
	dc.b $06,$48,$1f
	dc.b '6 BLOCK 1 TEST',$ff
	dc.b $06,$50,$1f
	dc.b '7 BLOCK 2 TEST',$ff
	dc.b $06,$58,$1f
	dc.b '8 BLOCK 3 TEST',$ff
	dc.b $1c,$20,$1f
	dc.b '9 MESSAGE TEST',$ff
	dc.b $1b,$28,$1f
	dc.b '10 ATTACK CHECK',$ff
	dc.b $1b,$30,$1f
	dc.b '11 SCROLL MOVE TEST',$ff
	dc.b $1b,$38,$1f
	dc.b '12 EXIT',$ff
	dc.b $1b,$40,$1f
	dc.b '13 EXIT',$ff
	dc.b $1b,$48,$1f
	dc.b '14 EXIT',$ff
	dc.b $1b,$50,$1f
	dc.b '15 EXIT',$ff
	dc.b $1b,$58,$1f
	dc.b '16 EXIT',$00

loc_016407:
	dc.b $0b,$0c,$1f
	dc.b '1 . O B J E C T   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $0a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff
	dc.b $46,$0c,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5d,$10,$1f
	dc.b 'CODE =      H',$ff
	dc.b $67,$10,$1e
	dc.b 'XX',00

loc_0164c0:
	dc.b $0b,$0c,$1f
	dc.b '2 . S C R O L L 1   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $10,$2c,$1e
	dc.b '0123456789ABCDEF',$ff
	dc.b $4b,$0c,$1f
	dc.b '2 . S C R O L L 1   T E S T',$ff

	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $4a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$00

loc_0165d1:
	dc.b $0b,$0c,$1f
	dc.b '3 . S C R O L L 2   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $0a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff
	dc.b $4a,$0c,$1f
	dc.b '3 . S C R O L L 2   T E S T',$ff
	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',$00

loc_0166ce:
	dc.b $0b,$0c,$1f
	dc.b '4 . S C R O L L 3   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff

	dc.b $4b,$0c,$1f
	dc.b '4 . S C R O L L 3   T E S T',$ff
	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',00

loc_0167a8:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 1',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_0167e0:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 2',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_016818:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 3',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_016850:
	dc.b $0b,$34,$1d
	dc.b 'HERE COME NEW CHALLENGERS',00

loc_01686d:
	dc.b $0c,$34,$1d
	dc.b 'TRADITIONAL FIGHT BEGINS',00

loc_016889:
	dc.b $0c,$34,$1d
	dc.b 'ENJOY NEW FIGHTING STYLE',00

loc_0168a5:
	dc.b $07,$34,$1d
	dc.b 'THANK YOU SO MUCH FOR LONG PLAYING',00
	even

;==============================================
loc_0168cc:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_0168d4
	moveq #-1,d2

loc_0168d4:
	move.w loc_01690a(pc,d0.w),d0
	lea.l loc_01690a(pc,d0.w),a0

loc_0168dc:
	lea.l $904000,a1
	move.w (a0)+,d0
	lea.l (a1,d0.w),a1
	move.w (a0)+,d1

loc_0168ea:
	move.w (a0)+,d0
	beq.b loc_016908
	bmi.b loc_0168dc
	addi.w #$6c00,d0
	tst.b d2
	beq.b loc_0168fc
	move.w #$6c20,d0

loc_0168fc:
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($40,a1),a1
	bra.b loc_0168ea

loc_016908:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;JP Test Menu Text
loc_01690a:
	dc.w $0008,$0108,$0190,$024c,$0204,$001f,$2bd3,$2bcd
	dc.w $2bd4,$2be2,$2bd6,$2c0f,$2bbd,$ffff,$01cc,$001f
	dc.w $2c26,$2c50,$2c73,$2c74,$2bd3,$2bcd,$2bd4,$ffff
	dc.w $01d0,$001f,$2c27,$2c50,$2c7e,$2c74,$2bd3,$2bcd
	dc.w $2bd4,$ffff,$01d4,$001f,$2c28,$2c50,$2c02,$2be8
	dc.w $2c0f,$2bbd,$2be1,$2bd3,$2bcd,$2bd4,$ffff,$01d8
	dc.w $001f,$2c29,$2c50,$2bc6,$2be7,$2bbd,$2bd3,$2bcd
	dc.w $2bd4,$ffff,$01dc,$001f,$2c2a,$2c50,$2b7b,$2b96
	dc.w $2b80,$2bd3,$2bcd,$2bd4,$ffff,$01e0,$001f,$2c2b
	dc.w $2c50,$2bf2,$2bbd,$2be1,$2bfc,$2bbd,$2bd0,$ffff
	dc.w $01e4,$001f,$2c2c,$2c50,$2c71,$2c72,$ffff,$01e8
	dc.w $001f,$2c2d,$2c50,$2be2,$2be3,$2be8,$2bbd,$2bd3
	dc.w $2bcd,$2bd4,$ffff,$01f0,$001f,$2c2e,$2c50,$2bf2
	dc.w $2bbd,$2be1,$2b76,$2c76,$2b89,$ffff,$00f8,$001b
	dc.w $2c26,$2c41,$2bea,$2bfe,$2bbd,$2c77,$2c78,$2b9c
	dc.w $2c79,$2c7a,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c26
	dc.w $2b9c,$2c75,$2c72,$0000,$0244,$001f,$2c71,$2c72
	dc.w $2be2,$2bd6,$2c0f,$2bbd,$ffff,$01cc,$001f,$2c26
	dc.w $2c50,$2bcc,$2bcd,$2bd3,$2be1,$2c71,$2c72,$ffff
	dc.w $01d0,$001f,$2c27,$2c50,$2bf2,$2bbd,$2be1,$2c71
	dc.w $2c72,$ffff,$01d4,$001f,$2c28,$2c50,$2be8,$2bce
	dc.w $2c0d,$2bd4,$ffff,$01dc,$001f,$2c29,$2c50,$2bce
	dc.w $2bbd,$2c00,$2b6c,$2b73,$2bd3,$2bcd,$2bd4,$2b76
	dc.w $2c76,$2b89,$ffff,$01f4,$001b,$2c26,$2c41,$2bea
	dc.w $2bfe,$2bbd,$2c77,$2c78,$2b9c,$2c79,$2c7a,$0000
	dc.w $0244,$001f,$2bcc,$2bcd,$2bd3,$2be1,$2c71,$2c72
	dc.w $ffff,$004c,$001f,$2bca,$2bc2,$2bee,$2c71,$2c72
	dc.w $ffff,$0050,$001f,$2bca,$2bee,$2bd3,$2c09,$2bd6
	dc.w $2c0f,$2bbd,$ffff,$0054,$001f,$2be3,$2bd6,$2bd0
	dc.w $2bbd,$ffff,$0058,$001f,$2bfc,$2be3,$2bcb,$2bc3
	dc.w $2bee,$2bfd,$ffff,$005c,$001f,$2c42,$2bcb,$2bc3
	dc.w $2bee,$2bfd,$ffff,$0060,$001f,$2bca,$2bc2,$2bee
	dc.w $2bcc,$2c0f,$2bbd,$2bd0,$2bbd,$ffff,$0064,$001f
	dc.w $2c8e,$2c8f,$2c90,$2c91,$ffff,$006c,$001f,$2c71
	dc.w $2c72,$2be2,$2bd6,$2c0f,$2bbd,$2b76,$2c76,$2b89
	dc.w $ffff,$01f4,$001b,$2c26,$2c41,$2bea,$2bfe,$2bbd
	dc.w $2c77,$2c78,$2b9c,$2c79,$2c7a,$0000,$0244,$001f
	dc.w $2bf2,$2bbd,$2be1,$2c71,$2c72,$ffff,$004c,$001f
	dc.w $2c87,$2c86,$2c97,$ffff,$0050,$001f,$2c88,$2c89
	dc.w $2c74,$ffff,$0054,$001f,$2bd0,$2bc2,$2bdf,$2bbd
	dc.w $ffff,$0058,$001f,$2bf2,$2bbd,$2be1,$2bcd,$2c04
	dc.w $2bbd,$2bfd,$ffff,$005c,$001f,$2c7f,$2c34,$2c41
	dc.w $2c46,$2c7c,$2c7d,$2c81,$ffff,$0060,$001f,$2c27
	dc.w $2c41,$2c7f,$2c80,$2c7c,$2c7d,$2c81,$ffff,$0064
	dc.w $001f,$2bc2,$2c01,$2bee,$2bd4,$ffff,$0068,$001f
	dc.w $2c98,$2c73,$ffff,$0070,$001f,$2c71,$2c72,$2be2
	dc.w $2bd6,$2c0f,$2bbd,$2b76,$2c76,$2b89,$ffff,$01f4
	dc.w $001b,$2c26,$2c41,$2bea,$2bfe,$2bbd,$2c77,$2c78
	dc.w $2b9c,$2c79,$2c7a,$0000