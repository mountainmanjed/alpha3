
;==============================================
loc_016c12:
	tst.b ($82,a5)
	bne.b loc_016c24
	btst.b #1,($64,a5)
	beq.b loc_016c24
	bsr.w loc_016c58

loc_016c24:
	tst.b ($aa,a5)
	beq.b loc_016c50
	lea.l (-$7da4,a5),a0
	move.w #$f,d0

loc_016c32:
	cmpi.b #1,(a0)
	bne.b loc_016c48
	cmpi.w #$c,d0
	beq.b loc_016c48
	subq.b #1,(1,a0)
	bne.b loc_016c48
	move.b #4,(a0)

loc_016c48:
	lea.l ($20,a0),a0
	dbra d0,loc_016c32

loc_016c50:
	jsr loc_0013a2
	bra.b loc_016c12

;==============================================
loc_016c58:
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.b d0,($8c,a5)
	move.b #1,($82,a5)
	move.w #0,d0
	jsr loc_001346
	move.w #$20,d0
	jsr loc_001346
	move.w #$40,d0
	jsr loc_001346
	move.w #$60,d0
	jsr loc_001346
	move.w #$80,d0
	jsr loc_001346
	move.w #$a0,d0
	jsr loc_001346
	move.w #$c0,d0
	jsr loc_001346
	move.w #$e0,d0
	jsr loc_001346
	move.w #$100,d0
	jsr loc_001346
	move.w #$c0,d0
	movea.l #loc_00dd7e,a0
	jmp loc_001302

;==============================================
loc_016cee:
	st.b ($181,a5)

loc_016cf2:
	tst.b ($181,a5)
	beq.b loc_016d18
	moveq #0,d0
	movea.l (-$7ba0,a5),a6
	move.b ($10,a6),d0
	move.w loc_016d22(pc,d0.w),d1
	jsr loc_016d22(pc,d1.w)
	moveq #0,d0
	move.b ($11,a6),d0
	jsr loc_001370
	bra.b loc_016cf2

loc_016d18:
	clr.b ($182,a5)
	jmp loc_001324

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_016d22:
	dc.w loc_016d48-loc_016d22;
	dc.w loc_016d6a-loc_016d22;24
	dc.w loc_016da0-loc_016d22;26
	dc.w loc_016dd6-loc_016d22;28
	dc.w loc_016e0c-loc_016d22;2a
	dc.w loc_016e40-loc_016d22;
	dc.w loc_016e5a-loc_016d22;e
	dc.w loc_016e7c-loc_016d22

	dc.w loc_016eb2-loc_016d22
	dc.w loc_016ee8-loc_016d22
	dc.w loc_016f1e-loc_016d22
	dc.w loc_016f52-loc_016d22
	dc.w loc_016fa0-loc_016d22
	dc.w loc_017092-loc_016d22
	dc.w loc_0170d0-loc_016d22
	dc.w loc_0170ea-loc_016d22

	dc.w loc_017140-loc_016d22
	dc.w loc_0171cc-loc_016d22
	dc.w loc_017248-loc_016d22


;==============================================
loc_016d48:
	clr.b ($180,a5)
	bsr.w loc_016d7e
	bsr.w loc_016db4
	bsr.w loc_016dea
	bsr.w loc_016e20
	cmpi.b #$f,($180,a5)
	bne.b loc_016d68
	clr.b ($181,a5)

loc_016d68:
	rts

;==============================================
loc_016d6a:
	clr.b ($180,a5)
	bsr.b loc_016d7e
	cmpi.b #1,($180,a5)
	bne.b loc_016d7c
	clr.b ($181,a5)

loc_016d7c:
	rts

;==============================================
loc_016d7e:
	lea.l $90c000,a0
	move.w ($12,a6),d6
	ror.w #4,d6
	andi.w #$f000,d6
	move.w #$f000,d0
	bsr.w loc_016f6c
	bne.b loc_016d9e
	ori.b #1,($180,a5)

loc_016d9e:
	rts

;==============================================
loc_016da0:
	clr.b ($180,a5)
	bsr.b loc_016db4
	cmpi.b #2,($180,a5)
	bne.b loc_016db2
	clr.b ($181,a5)

loc_016db2:
	rts

;==============================================
loc_016db4:
	lea.l $90c400,a0
	move.w ($12,a6),d6
	lsl.w #8,d6
	andi.w #$f000,d6
	move.w #$f000,d0
	bsr.w loc_016f6c
	bne.b loc_016dd4
	ori.b #2,($180,a5)

loc_016dd4:
	rts

;==============================================
loc_016dd6:
	clr.b ($180,a5)
	bsr.b loc_016dea
	cmpi.b #4,($180,a5)
	bne.b loc_016de8
	clr.b ($181,a5)

loc_016de8:
	rts

;==============================================
loc_016dea:
	lea.l $90c800,a0
	move.w ($12,a6),d6
	lsl.w #4,d6
	andi.w #$f000,d6
	move.w #$f000,d0
	bsr.w loc_016f6c
	bne.b loc_016e0a
	ori.b #4,($180,a5)

loc_016e0a:
	rts

;==============================================
loc_016e0c:
	clr.b ($180,a5)
	bsr.b loc_016e20
	cmpi.b #8,($180,a5)
	bne.b loc_016e1e
	clr.b ($181,a5)

loc_016e1e:
	rts

;==============================================
loc_016e20:
	lea.l $90cc00,a0
	move.w ($12,a6),d6
	andi.w #$f000,d6
	move.w #$f000,d0
	bsr.w loc_016f6c
	bne.b loc_016e3e
	ori.b #8,($180,a5)

loc_016e3e:
	rts

;==============================================
loc_016e40:
	clr.b ($180,a5)
	bsr.w loc_016d7e
	bsr.b loc_016dea
	bsr.b loc_016e20
	cmpi.b #$d,($180,a5)
	bne.b loc_016e58
	clr.b ($181,a5)

loc_016e58:
	rts

;==============================================
loc_016e5a:
	clr.b ($180,a5)
	bsr.w loc_016e90
	bsr.w loc_016ec6
	bsr.w loc_016efc
	bsr.w loc_016f32
	cmpi.b #$f,($180,a5)
	bne.b loc_016e7a
	clr.b ($181,a5)

loc_016e7a:
	rts

;==============================================
loc_016e7c:
	clr.b ($180,a5)
	bsr.b loc_016e90
	cmpi.b #1,($180,a5)
	bne.b loc_016e8e
	clr.b ($181,a5)

loc_016e8e:
	rts

;==============================================
loc_016e90:
	lea.l $90c000,a0
	move.w ($12,a6),d6
	ror.w #4,d6
	andi.w #$f000,d6
	move.w #$1000,d0
	bsr.w loc_016f6c
	bne.b loc_016eb0
	ori.b #1,($180,a5)

loc_016eb0:
	rts

;==============================================
loc_016eb2:
	clr.b ($180,a5)
	bsr.b loc_016ec6
	cmpi.b #2,($180,a5)
	bne.b loc_016ec4
	clr.b ($181,a5)

loc_016ec4:
	rts

;==============================================
loc_016ec6:
	lea.l $90c400,a0
	move.w ($12,a6),d6
	lsl.w #8,d6
	andi.w #$f000,d6
	move.w #$1000,d0
	bsr.w loc_016f6c
	bne.b loc_016ee6
	ori.b #2,($180,a5)

loc_016ee6:
	rts

;==============================================
loc_016ee8:
	clr.b ($180,a5)
	bsr.b loc_016efc
	cmpi.b #4,($180,a5)
	bne.b loc_016efa
	clr.b ($181,a5)

loc_016efa:
	rts

;==============================================
loc_016efc:
	lea.l $90c800,a0
	move.w ($12,a6),d6
	lsl.w #4,d6
	andi.w #$f000,d6
	move.w #$1000,d0
	bsr.w loc_016f6c
	bne.b loc_016f1c
	ori.b #4,($180,a5)

loc_016f1c:
	rts

;==============================================
loc_016f1e:
	clr.b ($180,a5)
	bsr.b loc_016f32
	cmpi.b #8,($180,a5)
	bne.b loc_016f30
	clr.b ($181,a5)

loc_016f30:
	rts

;==============================================
loc_016f32:
	lea.l $90cc00,a0
	move.w ($12,a6),d6
	andi.w #$f000,d6
	move.w #$1000,d0
	bsr.w loc_016f6c
	bne.b loc_016f50
	ori.b #8,($180,a5)

loc_016f50:
	rts

;==============================================
loc_016f52:
	clr.b ($180,a5)
	bsr.w loc_016e90
	bsr.b loc_016efc
	bsr.b loc_016f32
	cmpi.b #$d,($180,a5)
	bne.b loc_016f6a
	clr.b ($181,a5)

loc_016f6a:
	rts

;==============================================
loc_016f6c:
	move.w (a0),d1
	andi.w #$f000,d1
	cmp.w d1,d6
	beq.b loc_016f9e
	moveq #$1f,d7

loc_016f78:
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	add.w d0,(a0)+
	dbra d7,loc_016f78
	moveq #1,d1

loc_016f9e:
	rts

;==============================================
loc_016fa0:
	clr.b ($180,a5)
	move.w ($12,a6),d6
	ror.w #4,d6
	andi.w #$f000,d6
	move.w #$f000,d0
	bsr.w loc_016fdc
	bsr.w loc_016ff2
	bsr.w loc_017008
	bsr.w loc_01701e
	cmpi.b #$f,($180,a5)
	bne.b loc_016fda
	clr.b ($181,a5)
	move.w #$9240,(palrampointer,a5)
	move.w #$9240,($48,a5)

loc_016fda:
	rts

;==============================================
loc_016fdc:
	lea.l $90c000,a0
	moveq #-6,d2
	bsr.w loc_017034
	bne.b loc_016ff0
	ori.b #1,($180,a5)

loc_016ff0:
	rts

;==============================================
loc_016ff2:
	lea.l $90c400,a0
	moveq #-1,d2
	bsr.w loc_017034
	bne.b loc_017006
	ori.b #2,($180,a5)

loc_017006:
	rts

;==============================================
loc_017008:
	lea.l $90c800,a0
	moveq #-1,d2
	bsr.w loc_017034
	bne.b loc_01701c
	ori.b #4,($180,a5)

loc_01701c:
	rts

;==============================================
loc_01701e:
	lea.l $90cc00,a0
	moveq #-1,d2
	bsr.w loc_017034
	bne.b loc_017032
	ori.b #8,($180,a5)

loc_017032:
	rts

;==============================================
loc_017034:
	moveq #$1f,d7

loc_017036:
	btst.l d7,d2
	beq.b loc_017086
	move.w (a0),d1
	andi.w #$f000,d1
	cmp.w d1,d6
	bne.b loc_017048
	bclr d7,d2
	bra.b loc_017086

loc_017048:
	add.w d0,(a0)
	add.w d0,(2,a0)
	add.w d0,(4,a0)
	add.w d0,(6,a0)
	add.w d0,(8,a0)
	add.w d0,($a,a0)
	add.w d0,($c,a0)
	add.w d0,($e,a0)
	add.w d0,($10,a0)
	add.w d0,($12,a0)
	add.w d0,($14,a0)
	add.w d0,($16,a0)
	add.w d0,($18,a0)
	add.w d0,($1a,a0)
	add.w d0,($1c,a0)
	add.w d0,($1e,a0)

loc_017086:
	lea.l ($20,a0),a0
	dbra d7,loc_017036
	tst.l d2
	rts

;==============================================
loc_017092:
	subq.w #1,($12,a6)
	bmi.w loc_0170b8
	move.w #$f,d7
	lea.l $90c000,a1
	bsr.b loc_0170ca
	lea.l $90c400,a1
	bsr.w loc_01710a
	bsr.w loc_01710a
	bra.w loc_01710a

loc_0170b8:
	clr.b ($181,a5)
	move.w #$9220,(palrampointer,a5)
	move.w #$9220,($48,a5)
	rts

;==============================================
loc_0170ca:
	moveq #$1c,d5
	bra.w loc_01710c

;==============================================
loc_0170d0:
	clr.b ($180,a5)
	bsr.w loc_016dea
	bsr.w loc_016e20
	cmpi.b #$c,($180,a5)
	bne.b loc_0170e8
	clr.b ($181,a5)

loc_0170e8:
	rts

;==============================================
loc_0170ea:
	subq.w #1,($12,a6)
	bmi.w loc_017104
	move.w #$f,d7
	lea.l $90c000,a1
	bsr.b loc_01710a
	bsr.b loc_01710a
	bsr.b loc_01710a
	bra.b loc_01710a

loc_017104:
	clr.b ($181,a5)
	rts

;==============================================
loc_01710a:
	moveq #$1f,d5

loc_01710c:
	moveq #$f,d6

loc_01710e:
	move.w (a1),d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_01711a
	addq.w #1,d0

loc_01711a:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_017126
	addq.w #1,d0

loc_017126:
	ror.w #$4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_017132
	addq.w #1,d0

loc_017132:
	ror.w #8,d0
	move.w d0,(a1)+
	dbra d6,loc_01710e
	dbra d5,loc_01710c
	rts

;==============================================
loc_017140:
	subq.w #1,($12,a6)
	bmi.w loc_0171c6
	move.w #$f,d7
	movea.l ($184,a5),a0
	lea.l $90c000,a1
	bsr.w loc_017180
	movea.l ($188,a5),a0
	lea.l $90c400,a1
	bsr.w loc_017180
	movea.l ($18c,a5),a0
	lea.l $90c800,a1
	bsr.w loc_017180
	movea.l ($190,a5),a0
	lea.l $90cc00,a1

loc_017180:
	moveq #$1f,d5

loc_017182:
	moveq #$f,d6

loc_017184:
	move.w (a0)+,d3
	move.w (a1),d2
	move.w d3,d0
	move.w d2,d1
	and.w d7,d0
	and.w d7,d1
	cmp.w d0,d1
	beq.b loc_017196
	subq.w #1,d2

loc_017196:
	lsr.w #4,d3
	ror.w #4,d2
	move.w d3,d0
	move.w d2,d1
	and.w d7,d0
	and.w d7,d1
	cmp.w d0,d1
	beq.b loc_0171a8
	subq.w #1,d2

loc_0171a8:
	lsr.w #4,d3
	ror.w #4,d2
	move.w d2,d1
	and.w d7,d3
	and.w d7,d1
	cmp.w d3,d1
	beq.b loc_0171b8
	subq.w #1,d2

loc_0171b8:
	ror.w #8,d2
	move.w d2,(a1)+
	dbra d6,loc_017184
	dbra d5,loc_017182
	rts

loc_0171c6:
	clr.b ($181,a5)
	rts

;==============================================
loc_0171cc:
	subq.w #1,($12,a6)
	bmi.w loc_017242
	move.w #$f,d7
	btst.b #0,($13,a6)
	bne.b loc_0171f2
	lea.l $90c000,a1
	moveq #$1d,d5
	bsr.b loc_017202
	lea.l $90c400,a1
	bra.b loc_017200

loc_0171f2:
	lea.l $90c800,a1
	bsr.b loc_017200
	lea.l $90cc00,a1

loc_017200:
	moveq #$1f,d5

loc_017202:
	moveq #$f,d6

loc_017204:
	move.w (a1),d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_017210
	addq.w #1,d0

loc_017210:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_01721c
	addq.w #1,d0

loc_01721c:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_017228
	addq.w #1,d0

loc_017228:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_017234
	addq.w #1,d0

loc_017234:
	ror.w #4,d0
	move.w d0,(a1)+
	dbra d6,loc_017204
	dbra d5,loc_017202
	rts

loc_017242:
	clr.b ($181,a5)
	rts

;==============================================
loc_017248:
	subq.w #1,($12,a6)
	bmi.w loc_0172d4
	move.w #$f,d7
	move.w #$f000,d4
	movea.l ($184,a5),a0
	lea.l $90c000,a1
	bsr.w loc_01728c
	movea.l ($188,a5),a0
	lea.l $90c400,a1
	bsr.w loc_01728c
	movea.l ($18c,a5),a0
	lea.l $90c800,a1
	bsr.w loc_01728c
	movea.l ($190,a5),a0
	lea.l $90cc00,a1

loc_01728c:
	moveq #$1f,d5

loc_01728e:
	moveq #$f,d6

loc_017290:
	move.w (a0)+,d3
	move.w (a1),d2
	move.w d3,d0
	move.w d2,d1
	and.w d7,d0
	and.w d7,d1
	cmp.w d0,d1
	beq.b loc_0172a2
	subq.w #1,d2

loc_0172a2:
	lsr.w #4,d3
	ror.w #4,d2
	move.w d3,d0
	move.w d2,d1
	and.w d7,d0
	and.w d7,d1
	cmp.w d0,d1
	beq.b loc_0172b4
	subq.w #1,d2

loc_0172b4:
	lsr.w #4,d3
	ror.w #4,d2
	move.w d2,d1
	and.w d7,d3
	and.w d7,d1
	cmp.w d3,d1
	beq.b loc_0172c4
	subq.w #1,d2

loc_0172c4:
	ror.w #8,d2
	or.w d4,d2
	move.w d2,(a1)+
	dbra d6,loc_017290
	dbra d5,loc_01728e
	rts

loc_0172d4:
	clr.b ($181,a5)
	rts

;==============================================
loc_0172da:
	tst.b ($182,a5)
	beq.b loc_0172ea
	moveq #1,d0
	jsr loc_001370
	bra.b loc_0172da

loc_0172ea:
	st.b ($182,a5)
	move.w #$100,d0
	move.w #1,d1
	move.w #0,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302

loc_017304:
	moveq #1,d0
	jsr loc_001370
	tst.b ($181,a5)
	bne.b loc_017304
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	rts

;==============================================
loc_017320:
	tst.b ($182,a5)
	beq.b loc_017330
	moveq #1,d0
	jsr loc_001370
	bra.b loc_017320

loc_017330:
	st.b ($182,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)
	move.w #$100,d0
	move.w #$c01,d1
	move.w #$ffff,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302

loc_017356:
	moveq #1,d0
	jsr loc_001370
	tst.b ($181,a5)
	bne.b loc_017356
	rts

;==============================================
loc_017366:
	tst.b ($181,a5)
	bne.b loc_017388
	st.b ($182,a5)
	move.w #$100,d0
	move.w #1,d1
	move.w #0,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_017388:
	rts

;==============================================
loc_01738a:
	tst.b ($181,a5)
	bne.b loc_0173ac
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$c01,d1
	move.w #$ffff,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_0173ac:
	rts

;==============================================
loc_0173ae:
	tst.b ($181,a5)
	bne.b loc_0173d0
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$1e01,d1
	move.w #$f,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_0173d0:
	rts

;==============================================
loc_0173d2:
	tst.b ($181,a5)
	bne.b loc_0173f4
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$2001,d1
	move.w #$f,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_0173f4:
	rts

;==============================================
loc_0173f6
	tst.b ($181,a5)
	bne.b loc_017418
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$1801,d1
	move.w #0,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_017418:
	rts

;==============================================
loc_01741a:
	tst.b ($181,a5)
	bne.b loc_01743c
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$1a01,d1
	move.w #$f,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_01743c:
	rts

;==============================================
loc_01743e:
	tst.b ($181,a5)
	bne.b loc_017460
	st.b ($182,a5)
	move.w #$100,d0
	move.w #$2201,d1
	move.w #$1e,d2
	lea.l loc_016cee(pc),a0
	jsr loc_001302
	moveq #0,d0

loc_017460:
	rts

;==============================================
loc_017462:
	moveq #0,d0
	moveq #0,d1
	move.b ($123,a5),d1
	beq.b loc_01747a
	subq.b #1,($123,a5)
	btst #0,d1
	beq.b loc_01747a
	lsr.b #2,d1
	move.b d1,d0

loc_01747a:
	move.w d0,($14e,a5)
	move.b ($66f,a5),d0
	or.b ($a6f,a5),d0
	move.b d0,(-$5eb6,a5)
	move.w (stageid,a5),d0
	move.w loc_01749a(pc,d0.w),d1
	jsr loc_01749a(pc,d1.w)
	bra.w loc_01884a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01749a:
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a

	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a

	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a

	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174ee-loc_01749a
	dc.w loc_0174f8-loc_01749a
	dc.w loc_0174f8-loc_01749a

;==============================================
loc_0174da:
	bsr.b loc_017514
	bsr.w loc_017c4e
	bra.w loc_017f98

;==============================================
loc_0174e4:
	bsr.b loc_017514
	bsr.w loc_017f98
	bra.w loc_017c4e

;==============================================
loc_0174ee:
	bsr.w loc_017c4e
	bsr.b loc_017514
	bra.w loc_017f98

;==============================================
loc_0174f8:
	bsr.w loc_017c4e
	bsr.w loc_017f98
	bra.b loc_017514

;==============================================
loc_017502:
	bsr.w loc_017f98
	bsr.b loc_017514
	bra.w loc_017c4e

;==============================================
loc_01750c:
	bsr.w loc_017f98
	bsr.w loc_017c4e

loc_017514:
	lea.l ($200,a5),a6
	move.w (stageid,a5),d0
	move.w loc_017532(pc,d0.w),d1
	jsr loc_017532(pc,d1.w)
	move.w ($20,a6),($28,a6)
	move.w ($24,a6),($2c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Stage Programming
loc_017532:
	dc.w loc_017572-loc_017532;Ryu
	dc.w loc_017598-loc_017532;Ken
	dc.w loc_0175b4-loc_017532;Gki
	dc.w loc_0175da-loc_017532;Nsh
	dc.w loc_0175f6-loc_017532;Chn
	dc.w loc_017612-loc_017532;Adn
	dc.w loc_01762e-loc_017532;Sdm
	dc.w loc_01764a-loc_017532;Guy

	dc.w loc_017666-loc_017532;Brd
	dc.w loc_017682-loc_017532;Rse
	dc.w loc_01769e-loc_017532;Dic
	dc.w loc_01771a-loc_017532;Sag
	dc.w loc_01773e-loc_017532;Dan
	dc.w loc_017764-loc_017532;Sak
	dc.w loc_017780-loc_017532;Rol
	dc.w loc_0177be-loc_017532;Sim

	dc.w loc_0177e2-loc_017532;Zan
	dc.w loc_0177fe-loc_017532;Gen
	dc.w loc_0175f6-loc_017532;0x12
	dc.w loc_0177fe-loc_017532;GnC
	dc.w loc_01762e-loc_017532;0x14
	dc.w loc_01769e-loc_017532;Box
	dc.w loc_017896-loc_017532;Cam
	dc.w loc_017572-loc_017532;0x17

	dc.w loc_0178ba-loc_017532;EHD
	dc.w loc_0178d6-loc_017532;Blk
	dc.w loc_0178f2-loc_017532;RMK
	dc.w loc_01790e-loc_017532;Cdy
	dc.w loc_01792a-loc_017532;Clw
	dc.w loc_017764-loc_017532;Kar
	dc.w loc_01769e-loc_017532;Jli
	dc.w loc_01769e-loc_017532;Jni

;==============================================
loc_017572:
	move.b (4,a6),d0
	move.w loc_017582(pc,d0.w),d1
	jsr loc_017582(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017582:
	dc.w loc_017586-loc_017582
	dc.w loc_017590-loc_017582

;----------------------------------------------
loc_017586:
	move.w #$40,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_017590:
	bsr.w loc_017a8c
	bra.w loc_017b7a

;==============================================
loc_017598:
	move.b (4,a6),d0
	move.w loc_0175a8(pc,d0.w),d1
	jsr loc_0175a8(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0175a8:
	dc.w loc_0179d0-loc_0175a8
	dc.w loc_0175ac-loc_0175a8

;----------------------------------------------
loc_0175ac:
	bsr.w loc_017ad2
	bra.w loc_017bb0

;==============================================
loc_0175b4:
	move.b (4,a6),d0
	move.w loc_0175c4(pc,d0.w),d1
	jsr loc_0175c4(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0175c4:
	dc.w loc_0175c8-loc_0175c4
	dc.w loc_0175d2-loc_0175c4

;----------------------------------------------
loc_0175c8:
	move.w #$40,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_0175d2:
	bsr.w loc_017a8c
	bra.w loc_017b7a

;==============================================
loc_0175da:
	move.b (4,a6),d0
	move.w loc_0175ea(pc,d0.w),d1
	jsr loc_0175ea(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0175ea:
	dc.w loc_0179d0-loc_0175ea
	dc.w loc_0175ee-loc_0175ea

;----------------------------------------------
loc_0175ee:
	bsr.w loc_017ad2
	bra.w loc_017bb0

;==============================================
loc_0175f6:;Chun li
	move.b (4,a6),d0
	move.w loc_017606(pc,d0.w),d1
	jsr loc_017606(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017606:
	dc.w loc_0179d0-loc_017606
	dc.w loc_01760a-loc_017606

;----------------------------------------------
loc_01760a:
	bsr.w loc_017ab8
	bra.w loc_017b9a

;==============================================
loc_017612:;Adon
	move.b (4,a6),d0
	move.w loc_017622(pc,d0.w),d1
	jsr loc_017622(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017622:
	dc.w loc_0179d0-loc_017622
	dc.w loc_017626-loc_017622

;----------------------------------------------
loc_017626:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_01762e:
	move.b (4,a6),d0
	move.w loc_01763e(pc,d0.w),d1
	jsr loc_01763e(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01763e:
	dc.w loc_0179be-loc_01763e
	dc.w loc_017642-loc_01763e

;----------------------------------------------
loc_017642:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_01764a:
	move.b (4,a6),d0
	move.w loc_01765a(pc,d0.w),d1
	jsr loc_01765a(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01765a:
	dc.w loc_0179d0-loc_01765a
	dc.w loc_01765e-loc_01765a

;----------------------------------------------
loc_01765e:
	bsr.w loc_017ad2
	bra.w loc_017bc4

;==============================================
loc_017666:
	move.b (4,a6),d0
	move.w loc_017676(pc,d0.w),d1
	jsr loc_017676(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017676:
	dc.w loc_0179d0-loc_017676
	dc.w loc_01767a-loc_017676

;----------------------------------------------
loc_01767a:
	bsr.w loc_017ad2
	bra.w loc_017bb0

;==============================================
loc_017682:
	move.b (4,a6),d0
	move.w loc_017692(pc,d0.w),d1
	jsr loc_017692(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017692:
	dc.w loc_0179d0-loc_017692
	dc.w loc_017696-loc_017692

;----------------------------------------------
loc_017696:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_01769e:
	move.b (4,a6),d0
	move.w loc_0176ae(pc,d0.w),d1
	jsr loc_0176ae(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0176ae:
	dc.w loc_0176b2-loc_0176ae
	dc.w loc_0176d4-loc_0176ae

;----------------------------------------------
loc_0176b2:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.w loc_0179e8
	tst.b (1,a6)
	beq.b loc_0176d2
	moveq #0,d0
	addq.b #2,(4,a6)
	move.b d0,(1,a6)
	move.w d0,($60,a6)
	bra.b loc_0176f8

loc_0176d2:
	rts

;----------------------------------------------
loc_0176d4:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0176f0
	subq.w #1,($3c,a6)
	bne.b loc_0176f0
	addq.w #8,($60,a6)
	andi.w #8,($60,a6)
	bsr.b loc_0176f8

loc_0176f0:
	bsr.w loc_017aea
	bra.w loc_017bc4

;----------------------------------------------
loc_0176f8:
	move.w ($60,a6),d0
	move.w loc_01770a+2(pc,d0.w),($3c,a6)
	move.w loc_01770a+6(pc,d0.w),($5a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01770a:
	dc.w $9000,$0008,$0000,$0000
	dc.w $9000,$0008,$0000,$0100

;==============================================
loc_01771a:
	move.b (4,a6),d0
	move.w loc_01772a(pc,d0.w),d1
	jsr loc_01772a(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01772a:
	dc.w loc_01772e-loc_01772a
	dc.w loc_017736-loc_01772a

;----------------------------------------------
loc_01772e:
	moveq #$40,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_017736:
	bsr.w loc_017a8c
	bra.w loc_017b7a

;==============================================
loc_01773e:
	move.b (4,a6),d0
	move.w loc_01774e(pc,d0.w),d1
	jsr loc_01774e(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01774e:
	dc.w loc_017752-loc_01774e
	dc.w loc_01775e-loc_01774e

;----------------------------------------------
loc_017752:
	move.w #$1c0,d0
	moveq #-4,d1
	bra.w loc_0179d6

loc_01775e:
	bsr.w loc_017ad2
	bra.w loc_017bb0

;==============================================
loc_017764:
	move.b (4,a6),d0
	move.w loc_017774(pc,d0.w),d1
	jsr loc_017774(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017774:
	dc.w loc_0179be-loc_017774
	dc.w loc_017778-loc_017774

;----------------------------------------------
loc_017778:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_017780:;Rolento Stage
	move.b (4,a6),d0
	move.w loc_017790(pc,d0.w),d1
	jsr loc_017790(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017790:
	dc.w loc_017794-loc_017790
	dc.w loc_01779e-loc_017790

;----------------------------------------------
loc_017794:
	move.w #$a0,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_01779e:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0177b6
	subi.l #$20000,($50,a6)
	andi.w #$1ff,($50,a6)

loc_0177b6:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_0177be:
	move.b (4,a6),d0
	move.w loc_0177ce(pc,d0.w),d1
	jsr loc_0177ce(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0177ce:
	dc.w loc_0177d2-loc_0177ce
	dc.w loc_0177da-loc_0177ce

;----------------------------------------------
loc_0177d2:
	moveq #$48,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_0177da:
	bsr.w loc_017a76
	bra.w loc_017b68

;==============================================
loc_0177e2:
	move.b (4,a6),d0
	move.w loc_0177f2(pc,d0.w),d1
	jsr loc_0177f2(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0177f2:
	dc.w loc_0179d0-loc_0177f2
	dc.w loc_0177f6-loc_0177f2

;----------------------------------------------
loc_0177f6:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_0177fe:
	move.b (4,a6),d0
	move.w loc_01780e(pc,d0.w),d1
	jsr loc_01780e(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01780e:
	dc.w loc_017812-loc_01780e
	dc.w loc_017830-loc_01780e

;----------------------------------------------
loc_017812:
	bsr.b loc_017854
	move.w #$1c0,d0
	moveq #0,d1
	moveq #0,d2
	bsr.w loc_0179f2
	tst.b (1,a6)
	beq.b loc_01782e
	addq.b #2,(4,a6)
	clr.b (1,a6)

loc_01782e:
	rts

loc_017830:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_01784c
	subq.w #1,($3c,a6)
	bne.b loc_01784c
	addq.w #4,($60,a6)
	andi.w #$1c,($60,a6)
	bsr.b loc_017854

loc_01784c:
	bsr.w loc_017aea
	bra.w loc_017bc4

;----------------------------------------------
loc_017854:
	jsr RNGFunction
	add.b ($81,a5),d0
	andi.w #$f,d0
	move.w ($60,a6),d1
	move.w loc_017876(pc,d1.w),($54,a6)
	add.w loc_017876+2(pc,d1.w),d0
	move.w d0,($3c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017876:
	dc.w $0000,$000c,$0001,$0014,$0002,$0038,$0001,$0014
	dc.w $0000,$000c,$ffff,$0014,$fffe,$0038,$ffff,$0014

;==============================================
loc_017896:
	move.b (4,a6),d0
	move.w loc_0178a6(pc,d0.w),d1
	jsr loc_0178a6(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0178a6:
	dc.w loc_0178aa-loc_0178a6
	dc.w loc_0178b2-loc_0178a6

;----------------------------------------------
loc_0178aa:
	moveq #$40,d0
	moveq #0,d1
	bra.w loc_0179d6

loc_0178b2:
	bsr.w loc_017a8c
	bra.w loc_017b7a

;==============================================
loc_0178ba:
	 move.b (4,a6),d0
	 move.w loc_0178ca(pc,d0.w),d1
	 jsr loc_0178ca(pc,d1.w)
	 bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0178ca:
	dc.w loc_0179be-loc_0178ca
	dc.w loc_0178ce-loc_0178ca

;----------------------------------------------
loc_0178ce:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_0178d6:
	move.b (4,a6),d0
	move.w loc_0178e6(pc,d0.w),d1
	jsr loc_0178e6(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0178e6:
	dc.w loc_0179d0-loc_0178e6
	dc.w loc_0178ea-loc_0178e6

;----------------------------------------------
loc_0178ea:
	bsr.w loc_017a8c
	bra.w loc_017b7a

;==============================================
loc_0178f2:
	move.b (4,a6),d0
	move.w loc_017902(pc,d0.w),d1
	jsr loc_017902(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017902:
	dc.w loc_0179be-loc_017902
	dc.w loc_017906-loc_017902

;----------------------------------------------
loc_017906:
	bsr.w loc_017ad2
	bra.w loc_017bb0

;==============================================
loc_01790e:
	move.b (4,a6),d0
	move.w loc_01791e(pc,d0.w),d1
	jsr loc_01791e(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01791e:
	dc.w loc_0179d0-loc_01791e
	dc.w loc_017922-loc_01791e

;----------------------------------------------
loc_017922:
	bsr.w loc_017aea
	bra.w loc_017bc4

;==============================================
loc_01792a:
	move.b (4,a6),d0
	move.w loc_01793a(pc,d0.w),d1
	jsr loc_01793a(pc,d1.w)
	bra.w loc_017c20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01793a:
	dc.w loc_01793e-loc_01793a
	dc.w loc_017978-loc_01793a

;----------------------------------------------
loc_01793e:
	move.l #$ff000000,d1
	tst.w ($102,a5)
	beq.b loc_017950
	addq.b #2,(5,a6)
	moveq #0,d1

loc_017950:
	clr.l ($50,a6)
	move.l d1,($54,a6)
	move.w #$1c0,d0
	moveq #0,d1
	moveq #0,d2
	bsr.w loc_0179f2
	tst.b (1,a6)
	beq.b loc_017976
	addq.b #2,(4,a6)
	clr.b (1,a6)
	clr.l ($60,a6)

loc_017976:
	rts

;----------------------------------------------
loc_017978:
	move.b (5,a6),d0
	move.w loc_017984(pc,d0.w),d1
	jmp loc_017984(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017984:
	dc.w loc_017988-loc_017984
	dc.w loc_0179b6-loc_017984

;----------------------------------------------
loc_017988:
	tst.b ($8c,a5)
	bne.b loc_0179b6
	move.l ($60,a6),d0
	addi.l #$8000,d0
	move.l d0,($60,a6)
	add.l d0,($54,a6)
	bmi.b loc_0179b6
	addq.b #2,(5,a6)
	clr.l ($54,a6)
	jsr loc_003590
	move.b #$40,($123,a5)

loc_0179b6:
	bsr.w loc_017afc
	bra.w loc_017bc4

;==============================================
;Global 8x8 Functions
;==============================================
loc_0179be:
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_0179d0
	move.w #$1c0,d0
	move.w #$100,d1
	bra.b loc_0179d6

loc_0179d0:
	move.w #$1c0,d0
	moveq #0,d1

loc_0179d6:
	bsr.b loc_0179e8
	tst.b (1,a6)
	beq.b loc_0179e6
	addq.b #2,(4,a6)
	clr.b (1,a6)

loc_0179e6
	rts

;==============================================
loc_0179e8:
	moveq  #0,d2
	move.l d2,($50,a6)
	move.l d2,($54,a6)

loc_0179f2:
	move.w d2,($58,a6)
	move.w d2,($5a,a6)
	move.w d2,($12,a6)
	move.w d2,($16,a6)
	move.w d2,($a,a6)
	move.w d2,($e,a6)
	move.w d2,($22,a6)
	move.w d2,($26,a6)
	move.w d0,d2
	move.w d2,(8,a6)
	add.w ($50,a6),d2
	move.w d2,($20,a6)
	move.w d2,($10,a6)
	andi.w #$1ff,d2
	move.w d2,($22,a5)
	subi.w #$40,d2
	move.w d2,($4a,a5)
	not.w d0
	andi.w #$20,d0
	move.b d0,($38,a6)
	move.w #$100,d2
	move.w d1,($c,a6)
	add.w ($54,a6),d1
	move.w d1,($24,a6)
	move.w d1,($14,a6)
	andi.w #$1ff,d1
	move.w d1,($24,a5)
	sub.w d1,d2
	move.w d2,($4c,a5)
	not.w d1
	andi.w #$20,d1
	move.b d1,($39,a6)
	jsr loc_0189d4
	jmp loc_0188f6

;==============================================
loc_017a76:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	asr.w #3,d0
	add.w (8,a6),d0
	bra.w loc_017b18

;==============================================
loc_017a8c:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	asr.w #2,d0
	add.w (8,a6),d0
	bra.w loc_017b18

;==============================================
loc_017aa2:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	asr.w #1,d0
	add.w (8,a6),d0
	bra.w loc_017b18

;==============================================
loc_017ab8:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	move.w d0,d1
	asl.w #2,d0
	add.w d1,d0
	asr.w #3,d0
	add.w (8,a6),d0
	bra.b loc_017b18

;==============================================
loc_017ad2:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	move.w d0,d1
	asr.w #3,d1
	sub.w d1,d0
	add.w (8,a6),d0
	bra.b loc_017b18

;==============================================
loc_017aea:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	add.w (8,a6),d0
	bra.b loc_017b18

;==============================================
loc_017afc:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	movea.l ($380,a5),a0
	move.w ($3a0,a5),d1
	add.w (-$e,a0,d1.w),d0
	subi.w #$c0,d0
	add.w (8,a6),d0

loc_017b18:
	add.w ($50,a6),d0
	move.b #$c,($3b,a6)
	cmp.w ($28,a6),d0
	bge.b loc_017b2e
	move.b #8,($3b,a6)

loc_017b2e:
	move.w d0,($20,a6)
	tst.b (3,a6)
	beq.b loc_017b66
	andi.b #$20,d0
	move.b ($38,a6),d1
	eor.b d1,d0
	bne.b loc_017b66
	eori.b #$20,($38,a6)
	move.b ($3b,a6),d0
	jsr loc_018b9a
	jsr loc_018ae8
	jsr loc_018b1e
	jmp loc_018bb6

loc_017b66:
	rts

;==============================================
loc_017b68:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	asr.w #3,d0
	add.w ($c,a6),d0
	bra.w loc_017bd0

;==============================================
loc_017b7a:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	asr.w #2,d0
	add.w ($c,a6),d0
	bra.b loc_017bd0

;==============================================
loc_017b8a:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	asr.w #1,d0
	add.w ($c,a6),d0
	bra.b loc_017bd0

;==============================================
loc_017b9a:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	move.w d0,d1
	asl.w #2,d0
	add.w d1,d0
	asr.w #3,d0
	add.w ($c,a6),d0
	bra.b loc_017bd0

;==============================================
loc_017bb0:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	move.w d0,d1
	asr.w #3,d1
	sub.w d1,d0
	add.w ($c,a6),d0
	bra.b loc_017bd0

;==============================================
loc_017bc4:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	add.w ($c,a6),d0

loc_017bd0:
	add.w ($54,a6),d0
	move.b #0,($3a,a6)
	cmp.w ($2c,a6),d0
	bge.b loc_017be6
	move.b #4,($3a,a6)

loc_017be6:
	move.w d0,($24,a6)
	tst.b (3,a6)
	beq.b loc_017c1e
	andi.b #$20,d0
	move.b ($39,a6),d1
	eor.b d1,d0
	bne.b loc_017c1e
	eori.b #$20,($39,a6)
	move.b ($3a,a6),d0
	jsr loc_018b9a
	jsr loc_018ae8
	jsr loc_018b1e
	jmp loc_018c44

loc_017c1e:
	rts

;==============================================
loc_017c20:
	move.w ($20,a6),d0
	move.w ($24,a6),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	add.w ($58,a6),d0
	andi.w #$1ff,d0
	move.w d0,($22,a5)
	sub.w ($14e,a5),d1
	add.w ($5a,a6),d1
	andi.w #$1ff,d1
	move.w d1,($24,a5)
	rts

;==============================================
	include 'backgrounds/16x16layerprg.asm'

;==============================================
loc_017f98:
	lea.l ($300,a5),a6
	move.w (stageid,a5),d0
	move.w loc_018000(pc,d0.w),d1
	jsr loc_018000(pc,d1.w)
	move.w ($20,a6),($28,a6)
	move.w ($24,a6),($2c,a6)
	tst.b ($124,a5)
	beq.b loc_017fce
	moveq #0,d0
	move.b ($12b,a5),d0
	lsl.w #2,d0
	move.w loc_017fd0(pc,d0.w),($2a,a5)
	move.w loc_017fd0+2(pc,d0.w),($2c,a5)

loc_017fce:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017fd0:
	dc.w $0000,$0700
	dc.w $0000,$0600
	dc.w $0180,$0600
	dc.w $0300,$0700
	dc.w $0300,$0700
	dc.w $0480,$0700
	dc.w $0180,$0700
	dc.w $0000,$0700
	dc.w $0300,$0600
	dc.w $0000,$0700
	dc.w $0000,$0700
	dc.w $0600,$0700

loc_018000:
	dc.w loc_018040-loc_018000
	dc.w loc_01805c-loc_018000
	dc.w loc_018078-loc_018000
	dc.w loc_018094-loc_018000
	dc.w loc_0180b0-loc_018000
	dc.w loc_0180cc-loc_018000
	dc.w loc_0180e8-loc_018000
	dc.w loc_018104-loc_018000

	dc.w loc_018120-loc_018000
	dc.w loc_018146-loc_018000
	dc.w loc_01816c-loc_018000
	dc.w loc_01825e-loc_018000
	dc.w loc_01827a-loc_018000
	dc.w loc_0182a0-loc_018000
	dc.w loc_0182bc-loc_018000
	dc.w loc_0182d8-loc_018000

	dc.w loc_0182fe-loc_018000
	dc.w loc_01838a-loc_018000
	dc.w loc_0180b0-loc_018000
	dc.w loc_01838a-loc_018000
	dc.w loc_0180e8-loc_018000
	dc.w loc_01816c-loc_018000
	dc.w loc_0183a6-loc_018000
	dc.w loc_018040-loc_018000

	dc.w loc_0183c2-loc_018000
	dc.w loc_0183e8-loc_018000
	dc.w loc_018404-loc_018000
	dc.w loc_018420-loc_018000
	dc.w loc_01843c-loc_018000
	dc.w loc_0182a0-loc_018000
	dc.w loc_01816c-loc_018000
	dc.w loc_01816c-loc_018000

;==============================================
loc_018040:
	move.b (4,a6),d0
	move.w loc_018050(pc,d0.w),d1
	jsr loc_018050(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018050:
	dc.w loc_018472-loc_018050
	dc.w loc_018054-loc_018050

;----------------------------------------------
loc_018054:
	bsr.w loc_018548
	bra.w loc_0185b0

;==============================================
loc_01805c:
	move.b (4,a6),d0
	move.w loc_01806c(pc,d0.w),d1
	jsr loc_01806c(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01806c:
	dc.w loc_018472-loc_01806c
	dc.w loc_018070-loc_01806c

;----------------------------------------------
loc_018070:
	bsr.w loc_018578
	bra.w loc_018610

;==============================================
loc_018078:
	move.b (4,a6),d0
	move.w loc_018088(pc,d0.w),d1
	jsr loc_018088(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018088:
	dc.w loc_018472-loc_018088
	dc.w loc_01808c-loc_018088

;----------------------------------------------
loc_01808c:
	bsr.w loc_018534
	bra.w loc_0185d8

;==============================================
loc_018094:
	move.b (4,a6),d0
	move.w loc_0180a4(pc,d0.w),d1
	jsr loc_0180a4(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0180a4:
	dc.w loc_018472-loc_0180a4
	dc.w loc_0180a8-loc_0180a4

;----------------------------------------------
loc_0180a8:
	bsr.w loc_018578
	bra.w loc_018610

;==============================================
loc_0180b0:
	move.b (4,a6),d0
	move.w loc_0180c0(pc,d0.w),d1
	jsr loc_0180c0(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0180c0:
	dc.w loc_018472-loc_0180c0
	dc.w loc_0180c4-loc_0180c0

;----------------------------------------------
loc_0180c4:
	bsr.w loc_01858a
	bra.w loc_018610

;==============================================
loc_0180cc:
	move.b (4,a6),d0
	move.w loc_0180dc(pc,d0.w),d1
	jsr loc_0180dc(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0180dc:
	dc.w loc_018472-loc_0180dc
	dc.w loc_0180e0-loc_0180dc

;----------------------------------------------
loc_0180e0:
	bsr.w loc_018560
	bra.w loc_0185fc

;==============================================
loc_0180e8:
	move.b (4,a6),d0
	move.w loc_0180f8(pc,d0.w),d1
	jsr loc_0180f8(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0180f8:
	dc.w loc_018460-loc_0180f8
	dc.w loc_0180fc-loc_0180f8

;----------------------------------------------
loc_0180fc:
	bsr.w loc_018578
	bra.w loc_018610

;==============================================
loc_018104:
	move.b (4,a6),d0
	move.w loc_018114(pc,d0.w),d1
	jsr loc_018114(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018114:
	dc.w loc_018472-loc_018114
	dc.w loc_018118-loc_018114

;----------------------------------------------
loc_018118:
	bsr.w loc_018548
	bra.w loc_0185e8

;==============================================
loc_018120:
	move.b (4,a6),d0
	move.w loc_018130(pc,d0.w),d1
	jsr loc_018130(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018130:
	dc.w loc_018134-loc_018130
	dc.w loc_01813e-loc_018130

;----------------------------------------------
loc_018134:
	move.w #$1c0,d0
	moveq #-$10,d1
	bra.w loc_018478

loc_01813e:
	bsr.w loc_018518
	bra.w loc_0185c2

;==============================================
loc_018146:
	move.b (4,a6),d0
	move.w loc_018156(pc,d0.w),d1
	jsr loc_018156(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018156:
	dc.w loc_01815a-loc_018156
	dc.w loc_018164-loc_018156

;----------------------------------------------
loc_01815a:
	move.w #$120,d0
	moveq #0,d1
	bra.w loc_018478

loc_018164:
	bsr.w loc_018534
	bra.w loc_0185d8

;==============================================
loc_01816c:
	move.b (4,a6),d0
	move.w loc_01817c(pc,d0.w),d1
	jsr loc_01817c(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01817c:
	dc.w loc_018180-loc_01817c
	dc.w loc_0181a2-loc_01817c

;----------------------------------------------
loc_018180:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.w loc_01848a
	tst.b (1,a6)
	beq.b loc_0181a0
	moveq #0,d0
	addq.b #2,(4,a6)
	move.b d0,(1,a6)
	move.w d0,($60,a6)
	bra.b loc_0181c6

loc_0181a0:
	rts

loc_0181a2:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0181be
	subq.w #1,($3c,a6)
	bne.b loc_0181be
	addq.w #8,($60,a6)
	andi.w #$78,($60,a6)
	bsr.b loc_0181c6

loc_0181be:
	bsr.w loc_018578
	bra.w loc_018610

loc_0181c6:
	move.w ($60,a6),d0
	move.w loc_0181de+2(pc,d0.w),($3c,a6)
	move.w loc_0181de+4(pc,d0.w),($58,a6)
	move.w loc_0181de+6(pc,d0.w),($5a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0181de:
	dc.w $9080,$0006,$0000,$0000
	dc.w $9080,$0003,$0000,$0100
	dc.w $9080,$0003,$0000,$0100
	dc.w $9080,$0006,$0000,$0200
	dc.w $9080,$0003,$0000,$0300
	dc.w $9080,$0003,$0000,$0300
	dc.w $9080,$0006,$0000,$0400
	dc.w $9080,$0003,$0000,$0500
	dc.w $9080,$0003,$0000,$0500
	dc.w $9080,$0006,$0400,$0000
	dc.w $9080,$0003,$0400,$0100
	dc.w $9080,$0003,$0400,$0100
	dc.w $9080,$0006,$0400,$0200
	dc.w $9080,$0003,$0400,$0300
	dc.w $9080,$0003,$0400,$0300
	dc.w $9080,$0006,$0400,$0400

;==============================================
loc_01825e:
	move.b (4,a6),d0
	move.w loc_01826e(pc,d0.w),d1
	jsr loc_01826e(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01826e:
	dc.w loc_018472-loc_01826e
	dc.w loc_018272-loc_01826e

;----------------------------------------------
loc_018272:
	bsr.w loc_018578
	bra.w loc_018610

;==============================================
loc_01827a:
	move.b (4,a6),d0
	move.w loc_01828a(pc,d0.w),d1
	jsr loc_01828a(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01828a:
	dc.w loc_01828e-loc_01828a
	dc.w loc_018298-loc_01828a

;----------------------------------------------
loc_01828e:
	move.w #$1c0,d0
	moveq #-4,d1
	bra.w loc_018478

loc_018298:
	bsr.w loc_018518
	bra.w loc_0185e8

;==============================================
loc_0182a0:
	move.b (4,a6),d0
	move.w loc_0182b0(pc,d0.w),d1
	jsr loc_0182b0(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0182b0:
	dc.w loc_018472-loc_0182b0
	dc.w loc_0182b4-loc_0182b0

;----------------------------------------------
loc_0182b4:
	bsr.w loc_018548
	bra.w loc_0185e8

;==============================================
loc_0182bc:
	move.b (4,a6),d0
	move.w loc_0182cc(pc,d0.w),d1
	jsr loc_0182cc(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0182cc:
	dc.w loc_018472-loc_0182cc
	dc.w loc_0182d0-loc_0182cc

;----------------------------------------------
loc_0182d0:
	bsr.w loc_018560
	bra.w loc_0185fc

;==============================================
loc_0182d8:
	move.b (4,a6),d0
	move.w loc_0182e8(pc,d0.w),d1
	jsr loc_0182e8(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0182e8:
	dc.w loc_0182ec-loc_0182e8
	dc.w loc_0182f6-loc_0182e8

;----------------------------------------------
loc_0182ec:
	move.w #$1c0,d0
	moveq #-$10,d1
	bra.w loc_018478

loc_0182f6:
	bsr.w loc_018548
	bra.w loc_018610

;==============================================
loc_0182fe:
	move.b (4,a6),d0
	move.w loc_01830e(pc,d0.w),d1
	jsr loc_01830e(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01830e:
	dc.w loc_018312-loc_01830e
	dc.w loc_018334-loc_01830e

;----------------------------------------------
loc_018312:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.w loc_01848a
	tst.b (1,a6)
	beq.b loc_018332
	moveq #0,d0
	addq.b #2,(4,a6)
	move.b d0,(1,a6)
	move.w d0,($60,a6)
	bra.b loc_018358

loc_018332:
	rts

loc_018334:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_018350
	subq.w #1,($3c,a6)
	bne.b loc_018350
	addq.w #8,($60,a6)
	andi.w #$18,($60,a6)
	bsr.b loc_018358

loc_018350:
	bsr.w loc_018578
	bra.w loc_018610

loc_018358:
	move.w ($60,a6),d0
	move.w loc_01836a+2(pc,d0.w),($3c,a6)
	move.w loc_01836a+6(pc,d0.w),($5a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01836a:
	dc.w $9080,$000c,$0000,$0000
	dc.w $9080,$000c,$0000,$0100
	dc.w $9080,$000c,$0000,$0000
	dc.w $9080,$000c,$0000,$0200

;==============================================
loc_01838a:
	move.b (4,a6),d0
	move.w loc_01839a(pc,d0.w),d1
	jsr loc_01839a(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01839a:
	dc.w loc_018472-loc_01839a
	dc.w loc_01839e-loc_01839a

;----------------------------------------------
loc_01839e:
	bsr.w loc_018548
	bra.w loc_0185e8

;==============================================
loc_0183a6:
	move.b (4,a6),d0
	move.w loc_0183b6(pc,d0.w),d1
	jsr loc_0183b6(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0183b6:
	dc.w loc_018472-loc_0183b6
	dc.w loc_0183ba-loc_0183b6

;----------------------------------------------
loc_0183ba:
	bsr.w loc_018534
	bra.w loc_0185d8

;==============================================
loc_0183c2:
	move.b (4,a6),d0
	move.w loc_0183d2(pc,d0.w),d1
	jsr loc_0183d2(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0183d2:
	dc.w loc_0183d6-loc_0183d2
	dc.w loc_0183e0-loc_0183d2
;----------------------------------------------
loc_0183d6:
	move.w #$1c2,d0
	moveq #0,d1
	bra.w loc_018478

loc_0183e0:
	bsr.w loc_018560
	bra.w loc_0185fc

;==============================================
loc_0183e8:
	move.b (4,a6),d0
	move.w loc_0183f8(pc,d0.w),d1
	jsr loc_0183f8(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0183f8:
	dc.w loc_018472-loc_0183f8
	dc.w loc_0183fc-loc_0183f8

;----------------------------------------------
loc_0183fc:
	bsr.w loc_018534
	bra.w loc_0185d8

;==============================================
loc_018404:
	move.b (4,a6),d0
	move.w loc_018414(pc,d0.w),d1
	jsr loc_018414(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018414:
	dc.w loc_018472-loc_018414
	dc.w loc_018418-loc_018414

;----------------------------------------------
loc_018418:
	bsr.w loc_018548
	bra.w loc_0185e8

;==============================================
loc_018420:
	move.b (4,a6),d0
	move.w loc_018430(pc,d0.w),d1
	jsr loc_018430(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018430:
	dc.w loc_018472-loc_018430
	dc.w loc_018434-loc_018430

;----------------------------------------------
loc_018434:
	bsr.w loc_018560
	bra.w loc_0185fc

;==============================================
loc_01843c:
	move.b (4,a6),d0
	move.w loc_01844c(pc,d0.w),d1
	jsr loc_01844c(pc,d1.w)
	bra.w loc_018626

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01844c:
	dc.w loc_018450-loc_01844c
	dc.w loc_018458-loc_01844c

;----------------------------------------------
loc_018450:
	move.w #$140,d0
	moveq #0,d1
	bra.b loc_018478

loc_018458:
	bsr.w loc_018534
	bra.w loc_0185d8

;==============================================
loc_018460:
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_018472
	move.w #$1c0,d0
	move.w #$100,d1
	bra.b loc_018478

loc_018472:
	move.w #$1c0,d0
	moveq #0,d1

loc_018478:
	bsr.b loc_01848a
	tst.b (1,a6)
	beq.b loc_018488
	addq.b #2,(4,a6)
	clr.b (1,a6)

loc_018488:
	rts

;==============================================
loc_01848a:
	moveq #0,d2
	move.l d2,($50,a6)
	move.l d2,($54,a6)
	move.w d2,($58,a6)
	move.w d2,($5a,a6)
	move.w d2,($12,a6)
	move.w d2,($16,a6)
	move.w d2,($a,a6)
	move.w d2,($e,a6)
	move.w d2,($22,a6)
	move.w d2,($26,a6)
	move.w d0,d2
	move.w d2,(8,a6)
	add.w ($50,a6),d2
	move.w d2,($20,a6)
	move.w d2,($10,a6)
	andi.w #$7ff,d2
	move.w d2,($2a,a5)
	subi.w #$40,d2
	move.w d2,($52,a5)
	not.w d0
	andi.w #$20,d0
	move.b d0,($38,a6)
	move.w #$700,d2
	move.w d1,($c,a6)
	add.w ($54,a6),d1
	move.w d1,($24,a6)
	move.w d1,($14,a6)
	andi.w #$7ff,d1
	move.w d1,($2c,a5)
	sub.w d1,d2
	move.w d2,($54,a5)
	not.w d1
	andi.w #$20,d1
	move.b d1,($39,a6)
	jsr loc_018fbe
	jmp loc_018f56

;==============================================
loc_018518:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	move.w d0,d1
	add.w d1,d0
	add.w d1,d0
	asr.w #3,d0
	add.w (8,a6),d0
	bra.w loc_0185a6

;==============================================
loc_018534:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	asr.w #1,d0
	add.w ($8,a6),d0
	bra.b loc_0185a6

;==============================================
loc_018548:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	move.w d0,d1
	asr.w #2,d1
	sub.w d1,d0
	add.w (8,a6),d0
	bra.b loc_0185a6

;==============================================
loc_018560:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	move.w d0,d1
	asr.w #3,d1
	sub.w d1,d0
	add.w (8,a6),d0
	bra.b loc_0185a6

;==============================================
loc_018578:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	add.w ($398,a5),d0
	add.w (8,a6),d0
	bra.b loc_0185a6

;==============================================
loc_01858a:
	move.w (camera_x,a5),d0
	sub.w ($288,a5),d0
	movea.l ($380,a5),a0
	move.w ($3a0,a5),d1
	add.w (-$12,a0,d1.w),d0
	subi.w #$c0,d0
	add.w (8,a6),d0

loc_0185a6:
	add.w ($50,a6),d0
	move.w d0,($20,a6)
	rts

;==============================================
loc_0185b0:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	asr.w #2,d0
	add.w ($c,a6),d0
	bra.w loc_01861c

;==============================================
loc_0185c2:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	move.w d0,d1
	add.w d1,d0
	add.w d1,d0
	asr.w #3,d0
	add.w ($c,a6),d0
	bra.b loc_01861c

;==============================================
loc_0185d8:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	asr.w #1,d0
	add.w ($c,a6),d0
	bra.b loc_01861c

;==============================================
loc_0185e8:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	move.w d0,d1
	asr.w #2,d1
	sub.w d1,d0
	add.w ($c,a6),d0
	bra.b loc_01861c

;==============================================
loc_0185fc:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	move.w d0,d1
	asr.w #3,d1
	sub.w d1,d0
	add.w ($c,a6),d0
	bra.b loc_01861c


;==============================================
loc_018610:
	move.w (camera_y,a5),d0
	sub.w ($28c,a5),d0
	add.w ($c,a6),d0

loc_01861c
	add.w ($54,a6),d0
	move.w d0,($24,a6)
	rts

;==============================================
loc_018626:
	move.w ($20,a6),d0
	move.w ($24,a6),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	add.w ($58,a6),d0
	andi.w #$7ff,d0
	move.w d0,($2a,a5)
	sub.w ($14e,a5),d1
	add.w ($5a,a6),d1
	andi.w #$7ff,d1
	move.w d1,($2c,a5)
	rts

;==============================================
loc_018654:
	move.w ($138,a5),d0
	move.w loc_018660(pc,d0.w),d1
	jmp loc_018660(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018660:
	dc.w loc_018668-loc_018660
	dc.w loc_018674-loc_018660
	dc.w loc_018682-loc_018660
	dc.w loc_018690-loc_018660

;==============================================
loc_018668:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	bra.w loc_018700

;==============================================
loc_018674:
	lea.l (p1memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3
	bra.b loc_01869c

;==============================================
loc_018682:
	lea.l (p2memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3
	bra.b loc_01869c

;==============================================
loc_018690:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	lea.l (p3memory,a5),a3

loc_01869c:
	tst.b ($263,a1)
	beq.b loc_0186a6
	lea.l (a3),a1
	bra.b loc_018700

loc_0186a6:
	tst.b ($263,a2)
	beq.b loc_0186b0
	lea.l (a3),a2
	bra.b loc_018700

loc_0186b0:
	tst.b ($263,a3)
	bne.b loc_018700
	move.w ($10,a1),d0
	sub.w ($a6,a1),d0
	move.w ($10,a2),d1
	sub.w ($a6,a2),d1
	move.w ($10,a3),d2
	sub.w ($a6,a3),d2
	cmp.w d2,d1
	ble.b loc_0186d4
	move.w d2,d1

loc_0186d4:
	cmp.w d1,d0
	ble.b loc_0186da
	move.w d1,d0

loc_0186da:
	move.w ($10,a1),d1
	add.w ($a6,a1),d1
	move.w ($10,a2),d2
	add.w ($a6,a2),d2
	move.w ($10,a3),d3
	add.w ($a6,a3),d3
	cmp.w d3,d2
	bge.b loc_0186f8
	move.w d3,d2

loc_0186f8:
	cmp.w d2,d1
	bge.b loc_0186fe
	move.w d2,d1

loc_0186fe:
	rts

loc_018700:
	moveq #0,d0
	tst.b ($263,a2)
	beq.b loc_01870a
	addq.w #2,d0

loc_01870a:
	tst.b ($263,a1)
	beq.b loc_018712
	addq.w #4,d0

loc_018712:
	move.w loc_01871a(pc,d0.w),d0
	jmp loc_01871a(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01871a:
	dc.w loc_018722-loc_01871a
	dc.w loc_018750-loc_01871a
	dc.w loc_018760-loc_01871a
	dc.w loc_018770-loc_01871a

;==============================================
loc_018722:
	move.w ($10,a1),d0
	sub.w ($a6,a1),d0
	move.w ($10,a2),d1
	sub.w ($a6,a2),d1
	cmp.w d1,d0
	ble.b loc_018738
	move.w d1,d0

loc_018738:
	move.w ($10,a1),d1
	add.w ($a6,a1),d1
	move.w ($10,a2),d2
	add.w ($a6,a2),d2
	cmp.w d2,d1
	bge.b loc_01874e
	move.w d2,d1

loc_01874e:
	rts

;==============================================
loc_018750:
	move.w ($10,a1),d0
	move.w d0,d1
	sub.w ($a6,a1),d0
	add.w ($a6,a1),d1
	rts

;==============================================
loc_018760:
	move.w ($10,a2),d0
	move.w d0,d1
	sub.w ($a6,a2),d0
	add.w ($a6,a2),d1
	rts

;==============================================
loc_018770:
	move.w ($10,a6),d0
	addi.w #$c0,d0
	move.w d0,d1
	rts

;==============================================
;camera?????
loc_01877c:
	move.w ($138,a5),d0
	move.w loc_018788(pc,d0.w),d1
	jmp loc_018788(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018788:
	dc.w loc_018790-loc_018788
	dc.w loc_01879a-loc_018788
	dc.w loc_0187a8-loc_018788
	dc.w loc_0187b6-loc_018788

;==============================================
loc_018790:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	bra.b loc_0187fc

;==============================================
loc_01879a:
	lea.l (p1memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3
	bra.b loc_0187c2

;==============================================
loc_0187a8:
	lea.l (p2memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3
	bra.b loc_0187c2

;==============================================
loc_0187b6:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	lea.l (p3memory,a5),a3

loc_0187c2:
	tst.b ($263,a1)
	beq.b loc_0187cc
	lea.l (a3),a1
	bra.b loc_0187fc

loc_0187cc:
	tst.b ($263,a2)
	beq.b loc_0187d6
	lea.l (a3),a2
	bra.b loc_0187fc

loc_0187d6:
	tst.b ($263,a3)
	bne.b loc_0187fc
	move.w ($14,a1),d0
	move.w ($14,a2),d1
	move.w ($14,a3),d2
	cmp.w d2,d1
	ble.b loc_0187ee
	dc.w $c541;exg.l d2,d1

loc_0187ee:
	cmp.w d1,d0
	ble.b loc_0187f4
	dc.w $c340;exg.l d1,d0

loc_0187f4:
	cmp.w d2,d1
	bge.b loc_0187fa
	move.w d2,d1

loc_0187fa:
	rts

loc_0187fc:
	moveq #0,d0
	tst.b ($263,a2)
	beq.b loc_018806
	addq.w #2,d0

loc_018806:
	tst.b ($263,a1)
	beq.b loc_01880e
	addq.w #4,d0

loc_01880e:
	move.w loc_018816(pc,d0.w),d0
	jmp loc_018816(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018816:
	dc.w loc_01881e-loc_018816
	dc.w loc_01882e-loc_018816
	dc.w loc_018836-loc_018816
	dc.w loc_01883e-loc_018816

;==============================================
loc_01881e:
	move.w ($14,a1),d0
	move.w ($14,a2),d1
	cmp.w d0,d1
	bge.b loc_01882c
	exg.l d0,d1

loc_01882c:
	rts

;==============================================
loc_01882e:
	move.w ($14,a1),d0
	move.w d0,d1
	rts

;==============================================
loc_018836:
	move.w ($14,a2),d0
	move.w d0,d1
	rts

;==============================================
loc_01883e:
	move.w ($10,a6),d0
	addi.w #$28,d0
	move.w d0,d1
	rts

;==============================================
loc_01884a:
	move.w (stageid,a5),d1
	add.w d1,d1
	move.w loc_018876(pc,d1.w),d0
	move.w loc_018876+2(pc,d1.w),d1
	tst.b ($124,a5)
	beq.b loc_018866
	move.w #$3900,d0
	move.w #$1111,d1

loc_018866:
	andi.w #$e,($32,a5)
	or.w d0,($32,a5)
	move.w d1,($3a,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018876:
	dc.w $2d00,$4621;
	dc.w $3900,$6421;
	dc.w $2d00,$4621;
	dc.w $2d00,$4621;
	dc.w $3900,$6421;
	dc.w $1b00,$2461;
	dc.w $1e00,$4261;
	dc.w $2700,$2641;

	dc.w $2700,$2641;
	dc.w $1b00,$2461;
	dc.w $3600,$6241;
	dc.w $3900,$6421;
	dc.w $2700,$2641;
	dc.w $1b00,$2461;
	dc.w $2700,$2641;
	dc.w $2d00,$4621;

	dc.w $2d00,$4621;
	dc.w $2700,$2641;
	dc.w $3900,$6421;
	dc.w $2700,$2641;
	dc.w $1e00,$4621;
	dc.w $3600,$6241;
	dc.w $2d00,$4621;
	dc.w $2d00,$4621;

	dc.w $1b00,$2461;
	dc.w $2d00,$4621;
	dc.w $2700,$2641;
	dc.w $1b00,$2461;
	dc.w $1b00,$2461;
	dc.w $1b00,$2461;
	dc.w $3600,$6241;
	dc.w $3600,$6241;

;==============================================
loc_0188f6:
	move.b #0,($3a,a6)
	move.b #$c,($3b,a6)
	move.w (stageid,a5),d0
	lea.l loc_019106,a1
	move.b (1,a1,d0.w),(3,a6)
	lea.l loc_019146,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l (-$5eb4,a5),a1
	moveq #7,d0

loc_018926:
	movem.l (a0)+,d1-d4
	movem.l d1-d4,(a1)
	lea.l ($10,a1),a1
	dbra d0,loc_018926
	bsr.w loc_0189ae
	tst.b (3,a6)
	beq.b loc_018978
	move.w #$10,(-$5e30,a5)
	move.w #$ffc0,(-$5e34,a5)
	move.w #$120,(-$5e32,a5)

loc_018952:
	move.w (-$5e34,a5),d2
	move.w (-$5e32,a5),d3
	bsr.w loc_018ae8
	bsr.w loc_018b1e
	bsr.w loc_018bb6
	addi.w #$20,(-$5e34,a5)
	subq.w #1,(-$5e30,a5)
	bne.b loc_018952
	st.b (1,a6)
	rts

loc_018978:
	lea.l $900000,a1
	lea.l (-$5eb4,a5),a4
	moveq #3,d7

loc_018984:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018cdc(pc)
	nop
	dbra d7,loc_018984
	st.b (1,a6)
	rts

;==============================================
loc_018998:
	clr.b (1,a6)
	lea.l $910000,a3
	lea.l (-$5eb4,a5),a4
	lea.l (a4,d0.w),a4
	moveq #3,d7
	bra.b loc_018984

loc_0189ae:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d0
	move.l loc_0189c4(pc,d0.w),($48,a6)
	move.l loc_0189c4+4(pc,d0.w),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0189c4:
	dc.l $00020003,$00010002,$00040007,$00030004

;==============================================
loc_0189d4:
	move.w (stageid,a5),d0
	lsl.w #2,d0
	move.l loc_0189e8(pc,d0.w),($40,a6)
	move.l loc_0189e8+4(pc,d0.w),($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0189e8:
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff

;==============================================
loc_018ae8:
	move.w ($20,a6),d5
	move.w ($24,a6),d6
	add.w d2,d5
	add.w d3,d6
	not.w d6
	move.w d6,d0
	andi.w #$100,d0
	lsl.w #5,d0
	move.w d6,d1
	andi.w #$e0,d1
	lsr.w #1,d1
	add.w d1,d0
	move.w d5,d1
	andi.w #$1e0,d1
	lsl.w #4,d1
	add.w d1,d0
	lea.l $900000,a3
	lea.l (a3,d0.w),a3
	rts

;==============================================
loc_018b1e:
	bsr.b loc_018b50
	andi.l #$000000ff,d0
	lsl.l #7,d0
	lea.l loc_367494,a0
	adda.l d0,a0
	move.w d6,d0
	andi.w #$e0,d0
	lsr.w #4,d0
	move.w d0,($1e,a6)
	move.w d5,d1
	andi.w #$00e0,d1
	lsr.w #1,d1
	move.w d1,($1c,a6)
	add.w d1,d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
loc_018b50:
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_018b72(pc,d0.w),d0
	jsr loc_018b72(pc,d0.w)
	add.w d1,d0
	move.w d0,($18,a6)
	move.w d0,($1a,a6)
	lea.l (-$5eb4,a5),a0
	move.b (a0,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018b72:
	dc.w loc_018b76-loc_018b72
	dc.w loc_018b88-loc_018b72

;===============================================
loc_018b76:
	move.w d5,d1
	andi.w #$100,d1
	lsr.w #8,d1
	move.w d6,d0
	andi.w #$100,d0
	lsr.w #7,d0
	rts

;===============================================
loc_018b88:
	move.w d5,d1
	andi.w #$300,d1
	lsr.w #8,d1
	move.w d6,d0
	andi.w #$100,d0
	lsr.w #6,d0
	rts

;==============================================
loc_018b9a:
	ext.w d0
	move.w loc_018ba6(pc,d0.w),d2
	move.w loc_018ba6+2(pc,d0.w),d3
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018ba6:
	dc.w $ffc0,$0120,$ffc0,$ffc0
	dc.w $ffc0,$0120,$01a0,$0120

;==============================================
loc_018bb6:
	move.w d6,d7
	not.w d7
	andi.w #$e0,d7
	lsr.w #5,d7
	move.w d7,d4
	bsr.b loc_018bde
	bsr.b loc_018bfa
	moveq #$a,d7
	sub.w d4,d7
	cmpi.w #$7,d7
	bls.b loc_018bde
	move.w d7,d4
	moveq #7,d7
	bsr.b loc_018bde
	bsr.b loc_018bfa
	subi.w #8,d4
	move.w d4,d7

loc_018bde:
	moveq #0,d0
	move.w (a0)+,d0
	lsl.l #6,d0
	lea.l loc_36a394,a2
	adda.l d0,a2
	bsr.w loc_018d14
	lea.l ($10,a3),a3
	dbra d7,loc_018bde
	rts

;==============================================
loc_018bfa:
	lea.l (-$10,a3),a3
	move.l a3,d0
	move.w d0,d1
	addi.w #$2000,d1
	andi.w #$df80,d0
	andi.w #$2000,d1
	or.w d1,d0
	movea.l d0,a3
	lea.l (-$5eb4,a5),a0
	move.w ($1a,a6),d0
	add.w ($48,a6),d0
	and.w ($4a,a6),d0
	move.w d0,($1a,a6)
	move.b (a0,d0.w),d0
	andi.l #$000000ff,d0
	lsl.l #7,d0
	lea.l loc_367494,a0
	adda.l d0,a0
	move.w ($1c,a6),d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
loc_018c44:
	move.w d5,d7
	not.w d7
	andi.w #$e0,d7
	lsr.w #5,d7
	move.w d7,d4
	bsr.b loc_018c6c
	bsr.b loc_018c8c
	moveq #$e,d7
	sub.w d4,d7
	cmpi.w #7,d7
	bls.b loc_018c6c
	move.w d7,d4
	moveq #7,d7
	bsr.b loc_018c6c
	bsr.b loc_018c8c
	subi.w #8,d4
	move.w d4,d7

loc_018c6c:
	moveq #0,d0
	move.w (a0),d0
	lsl.l #6,d0
	lea.l loc_36a394,a2
	adda.l d0,a2
	bsr.w loc_018d14
	lea.l ($10,a0),a0
	lea.l ($200,a3),a3
	dbra d7,loc_018c6c
	rts


;==============================================
loc_018c8c:
	lea.l (-$200,a3),a3
	move.l a3,d0
	move.w d0,d1
	addi.w #$200,d1
	andi.w #$e000,d0
	andi.w #$1fff,d1
	or.w d1,d0
	movea.l d0,a3
	lea.l (-$5eb4,a5),a0
	move.w ($18,a6),d0
	move.w d0,d1
	addq.w #1,d0
	and.w ($4c,a6),d0
	and.w ($4e,a6),d1
	add.w d1,d0
	move.w d0,($18,a6)
	move.b (a0,d0.w),d0
	andi.l #$000000ff,d0
	lsl.l #7,d0
	lea.l loc_367494,a0
	adda.l d0,a0
	move.w ($1e,a6),d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
loc_018cdc:
	andi.l #$000000ff,d0
	lsl.l #7,d0
	lea.l loc_367494,a0
	adda.l d0,a0
	moveq #7,d6

loc_018cee:
	lea.l (a1),a3
	moveq #7,d5

loc_018cf2:
	moveq #0,d0
	move.w (a0)+,d0
	lsl.l #6,d0
	lea.l loc_36a394,a2
	adda.l d0,a2
	bsr.b loc_018d14
	lea.l ($10,a3),a3
	dbra d5,loc_018cf2
	lea.l ($200,a1),a1
	dbra d6,loc_018cee
	rts

;==============================================
loc_018d14:
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,(a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($8,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($80,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($88,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($100,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($108,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($180,a3)
	movem.w (a2)+,d0-d3
	addi.w #0,d0
	addi.w #0,d2
	movem.w d0-d3,($188,a3)
	rts

;==============================================
loc_018da4:
	move.w (stageid,a5),d0
	lea.l loc_019232,a1
	move.b (1,a1,d0.w),(3,a6)
	lea.l loc_019272,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l (-$5e2e,a5),a1
	moveq #7,d0

loc_018dc8:
	movem.l (a0)+,d1-d4
	movem.l d1-d4,(a1)
	lea.l ($10,a1),a1
	dbra d0,loc_018dc8
	lea.l $904000,a1
	lea.l (-$5e2e,a5),a4
	moveq #$f,d7

loc_018de4:
	moveq #0,d0
	move.b (a4)+,d0
	bsr.w loc_018f20
	dbra d7,loc_018de4
	st.b (1,a6)
	rts

;==============================================
loc_018df6:
	clr.b (1,a6)
	lea.l $914000,a1
	lea.l (-$5e2e,a5),a4
	lea.l (a4,d0.w),a4
	moveq #$f,d7
	bra.b loc_018de4

;==============================================
Set_Stage_Bounds:
	move.w (stageid,a5),d0
	lsl.w #2,d0
	move.l Stage_Bounds(pc,d0.w),(cam_ybound,a6)
	move.l Stage_Bounds+4(pc,d0.w),(cam_xbound,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
Stage_Bounds:
;	dc.w   Top,Bottm, Left,Right
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280
	dc.w $0010,$0000,$0100,$0280

;==============================================
loc_018f20:
	andi.l #$000000ff,d0
	move.w d0,d1
	add.w d1,d0
	add.w d1,d0
	lsl.l #8,d0
	lea.l loc_391014,a0
	adda.l d0,a0
	move.w #$00ff,d6
	lea.l ($200,a0),a2

loc_018f3e:
	moveq #0,d1
	move.w (a0)+,d0
	move.b (a2)+,d1
	addi.w #$6c00,d0
	movem.w d0-d1,(a1)
	lea.l (4,a1),a1
	dbra d6,loc_018f3e
	rts


;==============================================
loc_018f56:
	move.w (stageid,a5),d0
	lea.l loc_019462,a1
	move.b (1,a1,d0.w),(3,a6)
	lea.l loc_0194a2,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l (-$5dae,a5),a1
	moveq #7,d0

loc_018f7a:
	movem.l (a0)+,d1-d4
	movem.l d1-d4,(a1)
	lea.l ($10,a1),a1
	dbra d0,loc_018f7a
	lea.l $908000,a1
	lea.l (-$5dae,a5),a4
	moveq #$3f,d7

loc_018f96:
	moveq #0,d0
	move.b (a4)+,d0
	bsr.w loc_0190d2
	dbra d7,loc_018f96
	st.b (1,a6)
	rts

loc_018fa8:
	clr.b (1,a6)
	lea.l $918000,a1
	lea.l (-$5dae,a5),a4
	lea.l (a4,d0.w),a4
	moveq #$3f,d7
	bra.b loc_018f7a

;==============================================
loc_018fbe:
	move.w (stageid,a5),d0
	lsl.w #2,d0
	move.l loc_018fd2(pc,d0.w),($40,a6)
	move.l loc_018fd2+4(pc,d0.w),($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_018fd2:
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff
	dc.l $ffffffff,$ffffffff

;==============================================
loc_0190d2:
	andi.l #$000000ff,d0
	move.w d0,d1
	add.w d1,d0
	add.w d1,d0
	lsl.l #6,d0
	lea.l loc_3ac614,a0
	adda.l d0,a0
	moveq #$3f,d6
	lea.l ($80,a0),a2

loc_0190ee:
	moveq #0,d1
	move.w (a0)+,d0
	move.b (a2)+,d1
	addi.w #$b00,d0
	movem.w d0-d1,(a1)
	lea.l (4,a1),a1
	dbra d6,loc_0190ee
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019106:
	dc.w $0000
	dc.w $0002
	dc.w $0000
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002

	dc.w $0002
	dc.w $0002
	dc.w $0000
	dc.w $0000
	dc.w $0002
	dc.w $0002
	dc.w $0000
	dc.w $0000

	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0000
	dc.w $0000
	dc.w $0000

	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0002
	dc.w $0000
	dc.w $0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019146:
	dc.w loc_019186-loc_019146;Ryu
	dc.w loc_01918a-loc_019146;Ken
	dc.w loc_019192-loc_019146;Gki
	dc.w loc_019196-loc_019146;Nsh
	dc.w loc_01919e-loc_019146;Chn
	dc.w loc_0191a6-loc_019146;Adn
	dc.w loc_0191ae-loc_019146;Sdm
	dc.w loc_0191b6-loc_019146;Guy

	dc.w loc_0191be-loc_019146;Brd
	dc.w loc_0191c6-loc_019146;Rse
	dc.w loc_0191ce-loc_019146;Dic
	dc.w loc_0191d2-loc_019146;Sag
	dc.w loc_0191d6-loc_019146;Dan
	dc.w loc_0191de-loc_019146;Sak
	dc.w loc_0191e6-loc_019146;Rol
	dc.w loc_0191ea-loc_019146;Sim

	dc.w loc_0191ee-loc_019146;Zan
	dc.w loc_0191f6-loc_019146;Gen
	dc.w loc_01919e-loc_019146;Chn
	dc.w loc_0191f6-loc_019146;Gen
	dc.w loc_0191ae-loc_019146;Sdm
	dc.w loc_0191ce-loc_019146;Box
	dc.w loc_0191fe-loc_019146;Cam
	dc.w loc_019186-loc_019146;Ryu

	dc.w loc_019202-loc_019146;EHD
	dc.w loc_01920a-loc_019146;Blk
	dc.w loc_019212-loc_019146;RMK
	dc.w loc_01921a-loc_019146;Cdy
	dc.w loc_019222-loc_019146;Clw
	dc.w loc_01922a-loc_019146;Kar
	dc.w loc_0191ce-loc_019146;Box
	dc.w loc_0191ce-loc_019146;Box

loc_019186:
	dc.w $0000,$4445

loc_01918a:
	dc.w $0000,$0000,$0022,$2324

loc_019192:
	dc.w $0000,$0f10

loc_019196:
	dc.w $0000,$0000,$0019,$1a1b

loc_01919e:
	dc.w $0000,$0000,$0016,$1718

loc_0191a6:
	dc.w $0000,$0000,$0025,$2627

loc_0191ae:
	dc.w $0040,$0b0c,$0008,$090a

loc_0191b6:
	dc.w $0000,$0000,$0028,$292a

loc_0191be:
	dc.w $0000,$0000,$001c,$1d1e

loc_0191c6:
	dc.w $0000,$0000,$000d,$0e3f

loc_0191ce:
	dc.w $4700,$4600

loc_0191d2:
	dc.w $0000,$1415

loc_0191d6:
	dc.w $0000,$0000,$0041,$4243

loc_0191de:
	dc.w $0048,$494a,$001f,$2021

loc_0191e6:
	dc.w $0000,$3839

loc_0191ea:
	dc.w $0000,$0102

loc_0191ee:
	dc.w $0000,$0000,$003c,$3d3e

loc_0191f6:
	dc.w $0000,$0000,$0034,$3500

loc_0191fe:
	dc.w $0000,$3637

loc_019202:
	dc.w $0003,$0607,$0003,$0405

loc_01920a:
	dc.w $0000,$0000,$0011,$1213

loc_019212:
	dc.w $002e,$3a3b,$002e,$2f30

loc_01921a:
	dc.w $0000,$0000,$0031,$3233

loc_019222:
	dc.w $0000,$0000,$002b,$2c2d

loc_01922a:
	dc.w $005a,$5b5c,$0057,$5859

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019232:
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019272:
	dc.w loc_0192b2-loc_019272;Ryu
	dc.w loc_0192c2-loc_019272;Ken
	dc.w loc_0192d2-loc_019272;Akm
	dc.w loc_0192e2-loc_019272;Nsh
	dc.w loc_0192f2-loc_019272;Chn
	dc.w loc_019302-loc_019272;Adn
	dc.w loc_019312-loc_019272;Sdm
	dc.w loc_019322-loc_019272;Guy

	dc.w loc_019332-loc_019272;Brd
	dc.w loc_019342-loc_019272;Rse
	dc.w loc_019352-loc_019272;Dic
	dc.w loc_019362-loc_019272;Sag
	dc.w loc_019372-loc_019272;Dan
	dc.w loc_019382-loc_019272;Sak
	dc.w loc_019392-loc_019272;Rol
	dc.w loc_0193a2-loc_019272;Sim

	dc.w loc_0193b2-loc_019272;Zan
	dc.w loc_0193c2-loc_019272;Gen
	dc.w loc_0192f2-loc_019272;Chn
	dc.w loc_0193c2-loc_019272;Gen
	dc.w loc_019312-loc_019272;Sdm
	dc.w loc_0193d2-loc_019272;Box
	dc.w loc_0193e2-loc_019272;Cam
	dc.w loc_0192b2-loc_019272;Ryu

	dc.w loc_019402-loc_019272;EHn
	dc.w loc_019412-loc_019272;Blk
	dc.w loc_019422-loc_019272;Rmk
	dc.w loc_019432-loc_019272;Cdy
	dc.w loc_019442-loc_019272;Clw
	dc.w loc_019452-loc_019272;Kar
	dc.w loc_0193d2-loc_019272;Box
	dc.w loc_0193d2-loc_019272;Box

loc_0192b2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$4d4a,$4b4c

loc_0192c2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$2728,$292a

loc_0192d2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0b0c,$0d0e

loc_0192e2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$1e1b,$1c1d

loc_0192f2:
	dc.w $0000,$0000,$0000,$0000,$1a17,$6d19,$1a17,$1819

loc_019302:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$002c,$2d2e

loc_019312:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0008,$090a

loc_019322:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$002f,$3031

loc_019332:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$221f,$2021

loc_019342:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$605d,$5e5f

loc_019352:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$6e69,$6a6b

loc_019362:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$1613,$1415

loc_019372:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$6461,$6263

loc_019382:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$2324,$2526

loc_019392:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0044,$4546

loc_0193a2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0401,$0203

loc_0193b2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$6865,$6667

loc_0193c2:
	dc.w $0000,$0000,$0000,$0000,$403d,$3e6c,$403d,$3e3f

loc_0193d2:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$6e71,$7273

loc_0193e2:
	dc.w $0041,$5253,$0041,$5051,$0041,$4e4f,$0041,$4243

loc_0193f2:
	dc.w $0041,$5a5b,$0041,$5859,$0041,$5657,$0041,$5455

loc_019402:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$2b05,$0607

loc_019412:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0f10,$1112

loc_019422:
	dc.w $0000,$0000,$0000,$0000,$3947,$4849,$3936,$3738

loc_019432:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$5c3a,$3b3c

loc_019442:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$3233,$3435

loc_019452:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$858a,$8b91

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019462:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0194a2:
	dc.w loc_0194e2-loc_0194a2;Ryu
	dc.w loc_019522-loc_0194a2;Ken
	dc.w loc_019562-loc_0194a2;Gki
	dc.w loc_0195a2-loc_0194a2;Nsh
	dc.w loc_0195e2-loc_0194a2;Chn
	dc.w loc_019622-loc_0194a2;Adn
	dc.w loc_019662-loc_0194a2;Sdm
	dc.w loc_0196a2-loc_0194a2;Guy

	dc.w loc_0196e2-loc_0194a2;Brd
	dc.w loc_019722-loc_0194a2;Rse
	dc.w loc_019762-loc_0194a2;Dic
	dc.w loc_0197a2-loc_0194a2;Sag
	dc.w loc_0197e2-loc_0194a2;Dan
	dc.w loc_019822-loc_0194a2;Sak
	dc.w loc_019862-loc_0194a2;Rol
	dc.w loc_0198a2-loc_0194a2;Sim

	dc.w loc_0198e2-loc_0194a2;Zan
	dc.w loc_019922-loc_0194a2;Gen
	dc.w loc_0195e2-loc_0194a2;Chn
	dc.w loc_019922-loc_0194a2;Gen
	dc.w loc_019662-loc_0194a2;Sdm
	dc.w loc_019762-loc_0194a2;Box
	dc.w loc_019962-loc_0194a2;Cam
	dc.w loc_0194e2-loc_0194a2;Ryu

	dc.w loc_0199a2-loc_0194a2;Ehd
	dc.w loc_0199e2-loc_0194a2;Blk
	dc.w loc_019a22-loc_0194a2;Rmk
	dc.w loc_019a62-loc_0194a2;Cdy
	dc.w loc_019aa2-loc_0194a2;Clw
	dc.w loc_019ae2-loc_0194a2;Kar
	dc.w loc_019762-loc_0194a2;Box
	dc.w loc_019762-loc_0194a2;Box

loc_0194e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0037,$3839,$0000,$0000

loc_019522:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$001a,$1b1c,$0000,$0000

loc_019562:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$090a,$0000,$0000

loc_0195a2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0011,$1213,$0000,$0000

loc_0195e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0028,$292a,$0000,$0000

loc_019622:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$001d,$1e1f,$0000,$0000

loc_019662:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0007,$0806,$0000,$0000,$0004,$0506,$0000,$0000

loc_0196a2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0020,$2122,$0000,$0000

loc_0196e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0014,$1516,$0000,$0000

loc_019722:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$003b,$3c00,$0000,$0000

loc_019762:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0063,$6465,$0000,$0000,$0060,$6162,$0072,$7374
	dc.w $005d,$5e5f,$006f,$7071,$005a,$5b5c,$006c,$6d6e
	dc.w $0057,$5859,$0069,$6a6b,$0054,$5556,$0066,$6768

loc_0197a2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$000e,$0f10,$0000,$0000

loc_0197e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$003d,$3e3f,$0000,$0000

loc_019822:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0017,$1819,$0000,$0000

loc_019862:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0034,$3536,$0000,$0000

loc_0198a2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0001,$0203,$0000,$0000

loc_0198e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0078,$797a,$0000,$0000
	dc.w $0075,$7677,$0000,$0000,$0040,$4142,$0000,$0000

loc_019922:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$002e,$2f30,$0000,$0000

loc_019962:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0031,$3233,$0000,$0000

loc_0199a2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$003a,$3a3a,$0000,$0000

loc_0199e2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$000b,$0c0d,$0000,$0000

loc_019a22:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0025,$2627,$0000,$0000

loc_019a62:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$002b,$2c2d,$0000,$0000

loc_019aa2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0023,$2400,$0000,$0000

loc_019ae2:
	dc.w $4344,$4546,$4748,$4e4e,$494a,$4b4c,$4d00,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0088,$898a,$0000,$0000

;==============================================
;Raster
;==============================================
loc_019b22:
	lea.l ($380,a5),a4
	tst.b ($118,a5)
	bne.b loc_019b64
	move.w (rasterram,a5),d0
	addq.w #8,d0
	andi.w #$18,d0
	lsr.w #1,d0
	movea.l loc_019b66(pc,d0.w),a3
	move.l a3,(a4)
	moveq #0,d0
	move.b (4,a4),d0
	move.w loc_019b76(pc,d0.w),d1
	jsr loc_019b76(pc,d1.w)
	move.l (a4),d0
	lsr.l #8,d0
	move.w d0,(rasterram,a5)
	move.w ($14,a4),d0
	sub.w ($14e,a5),d0
	andi.w #$03ff,d0
	move.w d0,($2e,a5)

loc_019b64:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019b66:
	dc.l $0090e000,$0090e800,$0090f000,$0090f800

loc_019b76:
	dc.w loc_019b7a-loc_019b76
	dc.w loc_019b90-loc_019b76

;==============================================
loc_019b7a:
	addq.b #2,(4,a4)
	moveq #0,d0
	move.l d0,(8,a4)
	move.l d0,($18,a4)
	move.l d0,($1c,a4)
	bsr.w loc_01a5e0

loc_019b90:
	move.l (camera_x,a5),($10,a4)
	move.l (camera_y,a5),($14,a4)
	move.w (stageid,a5),d0
	move.w loc_019ba8(pc,d0.w),d1
	jmp loc_019ba8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019ba8:
	dc.w loc_019be8-loc_019ba8;Ryu
	dc.w loc_019c5a-loc_019ba8;Ken
	dc.w loc_019cba-loc_019ba8;Akuma
	dc.w loc_019d1a-loc_019ba8;Nash
	dc.w loc_019da4-loc_019ba8;Chun
	dc.w loc_01a5de-loc_019ba8;Adon
	dc.w loc_01a5de-loc_019ba8;Sodom
	dc.w loc_01a5de-loc_019ba8;Guy

	dc.w loc_019e1c-loc_019ba8;Birdie
	dc.w loc_019e80-loc_019ba8;Rose
	dc.w loc_019ee0-loc_019ba8;Dic
	dc.w loc_01a18e-loc_019ba8;Sagat
	dc.w loc_01a1fc-loc_019ba8;Dan
	dc.w loc_01a25c-loc_019ba8;Sakura
	dc.w loc_01a5de-loc_019ba8;Rolento
	dc.w loc_01a2c0-loc_019ba8;Sim

	dc.w loc_01a320-loc_019ba8;Zangief
	dc.w loc_01a380-loc_019ba8;Gen
	dc.w loc_019da4-loc_019ba8;0x12
	dc.w loc_01a380-loc_019ba8;Gen Cran
	dc.w loc_01a5de-loc_019ba8;0x14
	dc.w loc_019ee0-loc_019ba8;Boxer
	dc.w loc_01a5de-loc_019ba8;Cammy
	dc.w loc_01a5de-loc_019ba8;0x17

	dc.w loc_01a3e4-loc_019ba8;Ehonda
	dc.w loc_01a448-loc_019ba8;Blanka
	dc.w loc_01a4ac-loc_019ba8;R.Mika
	dc.w loc_01a50c-loc_019ba8;Cody
	dc.w loc_01a570-loc_019ba8;Claw
	dc.w loc_01a25c-loc_019ba8;Karin
	dc.w loc_019ee0-loc_019ba8;Juli
	dc.w loc_019ee0-loc_019ba8;Juni

;==============================================
loc_019be8:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$58,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019c0e:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019c0e
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$f,d1

loc_019c2a:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	cmpi.w #8,d1
	bne.b loc_019c3e
	move.w d0,d2

loc_019c3e:
	move.w d0,-(a1)
	dbra d1,loc_019c2a
	move.w #$87,d1

loc_019c48:
	move.w d0,-(a1)
	dbra d1,loc_019c48
	move.w #$3f,d1

loc_019c52:
	move.w d2,-(a1)
	dbra d1,loc_019c52
	rts

;==============================================
loc_019c5a:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$50,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019c80:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019c80
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$d,d1

loc_019c9c:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019c9c
	move.w #$c9,d1

loc_019cb2:
	move.w d0,-(a1)
	dbra d1,loc_019cb2
	rts

;==============================================
loc_019cba:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$28,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019ce0:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019ce0
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_019cfc:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019cfc
	move.w #$cf,d1

loc_019d12:
	move.w d0,-(a1)
	dbra d1,loc_019d12
	rts

;==============================================
loc_019d1a:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$28,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019d40:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019d40
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$c,d1

loc_019d5c:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019d5c
	moveq #$4a,d1

loc_019d70:
	move.w d0,-(a1)
	dbra d1,loc_019d70
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$ffffff50,d2
	jsr loc_01bb9c
	moveq #$2f,d1
	move.l ($18,a4),d2

loc_019d90:
	sub.l d3,d2
	move.w #$c0,d0
	swap d2
	add.w d2,d0
	swap d2
	move.w d0,-(a1)
	dbra d1,loc_019d90
	rts

;==============================================
loc_019da4:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$28,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019dca:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019dca
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$b,d1

loc_019de6:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019de6
	move.w #$5b,d1

loc_019dfc:
	move.w d0,-(a1)
	dbra d1,loc_019dfc
	move.l ($18,a4),d0
	sub.l d3,d0
	sub.l d3,d0
	swap d0
	addi.w #$c0,d0
	move.w #$6f,d1

loc_019e14:
	move.w d0,-(a1)
	dbra d1,loc_019e14
	rts

;==============================================
loc_019e1c:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$a0,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019e46:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019e46
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$f,d1

loc_019e62:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019e62
	move.w #$c7,d1

loc_019e78:
	move.w d0,-(a1)
	dbra d1,loc_019e78
	rts

;==============================================
loc_019e80:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$58,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019ea6:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019ea6
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_019ec2:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019ec2
	move.w #$cf,d1

loc_019ed8:
	move.w d0,-(a1)
	dbra d1,loc_019ed8
	rts

;==============================================
loc_019ee0:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.w #$a8,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_019f08:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_019f08
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_019f24:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_019f24
	move.w #$2f,d1

loc_019f3a:
	move.w d0,-(a1)
	dbra d1,loc_019f3a
	move.w ($288,a5),d0
	sub.w ($10,a4),d0
	asr.w #1,d0
	addi.w #$c0,d0
	lea.l ($600,a3),a1
	move.w (8,a4),d2
	andi.w #$1fe,d2
	move.w #$9f,d4

loc_019f5e:
	move.w loc_019f8e(pc,d2.w),d3
	addq.w #2,d2
	andi.w #$1fe,d2
	asr.w #7,d3
	add.w d0,d3
	move.w d3,(a1)+
	dbra d4,loc_019f5e
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_019f8c
	addi.l #$8000,(8,a4)
	andi.l #$1ffffff,(8,a4)

loc_019f8c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_019f8e:
	dc.w $0000,$0062,$00c8,$012f,$0191,$01f3,$0256,$02b8
	dc.w $031e,$0381,$03df,$0441,$04a3,$0502,$0560,$05be
	dc.w $061c,$067a,$06d4,$072f,$0789,$07df,$0839,$088f
	dc.w $08e1,$0937,$0985,$09d7,$0a24,$0a72,$0abc,$0b06
	dc.w $0b4f,$0b95,$0bd7,$0c1c,$0c5e,$0c9b,$0cd9,$0d12
	dc.w $0d4b,$0d81,$0db6,$0deb,$0e18,$0e49,$0e72,$0e9f
	dc.w $0ec4,$0ee9,$0f0e,$0f2f,$0f4b,$0f68,$0f85,$0f9d
	dc.w $0fae,$0fc2,$0fd2,$0fdf,$0feb,$0ff3,$0ff7,$0ffb
	dc.w $1000,$0ffb,$0ff7,$0ff3,$0feb,$0fdf,$0fd2,$0fc2
	dc.w $0fae,$0f9d,$0f85,$0f68,$0f4b,$0f2f,$0f0e,$0ee9
	dc.w $0ec4,$0e9f,$0e72,$0e49,$0e18,$0deb,$0db6,$0d81
	dc.w $0d4b,$0d12,$0cd9,$0c9b,$0c5e,$0c1c,$0bd7,$0b95
	dc.w $0b4f,$0b06,$0abc,$0a72,$0a24,$09d7,$0985,$0937
	dc.w $08e1,$088f,$0839,$07df,$0789,$072f,$06d4,$067a
	dc.w $061c,$05be,$0560,$0502,$04a3,$0441,$03df,$0381
	dc.w $031e,$02b8,$0256,$01f3,$0191,$012f,$00c8,$0062
	dc.w $0000,$ff9e,$ff38,$fed1,$fe6f,$fe0d,$fdaa,$fd48
	dc.w $fce2,$fc7f,$fc21,$fbbf,$fb5d,$fafe,$faa0,$fa42
	dc.w $f9e4,$f986,$f92c,$f8d1,$f877,$f821,$f7c7,$f771
	dc.w $f71f,$f6c9,$f67b,$f629,$f5dc,$f58e,$f544,$f4fa
	dc.w $f4b1,$f46b,$f429,$f3e4,$f3a2,$f365,$f327,$f2ee
	dc.w $f2b5,$f27f,$f24a,$f215,$f1e8,$f1b7,$f18e,$f161
	dc.w $f13c,$f117,$f0f2,$f0d1,$f0b5,$f098,$f07b,$f063
	dc.w $f052,$f03e,$f02e,$f021,$f015,$f00d,$f009,$f005
	dc.w $f000,$f005,$f009,$f00d,$f015,$f021,$f02e,$f03e
	dc.w $f052,$f063,$f07b,$f098,$f0b5,$f0d1,$f0f2,$f117
	dc.w $f13c,$f161,$f18e,$f1b7,$f1e8,$f215,$f24a,$f27f
	dc.w $f2b5,$f2ee,$f327,$f365,$f3a2,$f3e4,$f429,$f46b
	dc.w $f4b1,$f4fa,$f544,$f58e,$f5dc,$f629,$f67b,$f6c9
	dc.w $f71f,$f771,$f7c7,$f821,$f877,$f8d1,$f92c,$f986
	dc.w $f9e4,$fa42,$faa0,$fafe,$fb5d,$fbbf,$fc21,$fc7f
	dc.w $fce2,$fd48,$fdaa,$fe0d,$fe6f,$fed1,$ff38,$ff9e

;==============================================
loc_01a18e:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$48,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a1b4:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a1b4
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$f,d1

loc_01a1d0:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a1d0
	lsl.l #4,d3
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w #$c7,d1

loc_01a1f4:
	move.w d0,-(a1)
	dbra d1,loc_01a1f4
	rts

;==============================================
loc_01a1fc:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$58,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a222:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a222
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a23e:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a23e
	move.w #$cf,d1

loc_01a254:
	move.w d0,-(a1)
	dbra d1,loc_01a254
	rts

;==============================================
loc_01a25c:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$88,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a286:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a286
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a2a2:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a2a2
	move.w #$cf,d1

loc_01a2b8:
	move.w d0,-(a1)
	dbra d1,loc_01a2b8
	rts

;==============================================
loc_01a2c0:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$28,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a2e6:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a2e6
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #9,d1

loc_01a302:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a302
	move.w #$cd,d1

loc_01a318:
	move.w d0,-(a1)
	dbra d1,loc_01a318
	rts

;==============================================
loc_01a320:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$70,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a346:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a346
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$13,d1

loc_01a362:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a362
	move.w #$c3,d1

loc_01a378:
	move.w d0,-(a1)
	dbra d1,loc_01a378
	rts

;==============================================
loc_01a380:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$d8,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a3aa:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a3aa
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$f,d1

loc_01a3c6:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a3c6
	move.w #$c7,d1

loc_01a3dc:
	move.w d0,-(a1)
	dbra d1,loc_01a3dc
	rts

;==============================================
loc_01a3e4:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$d0,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a40e:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a40e
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a42a:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a42a
	move.w #$cf,d1

loc_01a440:
	move.w d0,-(a1)
	dbra d1,loc_01a440
	rts

;==============================================
loc_01a448:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$c0,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a472:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a472
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a48e:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a48e
	move.w #$cf,d1

loc_01a4a4:
	move.w d0,-(a1)
	dbra d1,loc_01a4a4
	rts

;==============================================
loc_01a4ac:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$28,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a4d2:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a4d2
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$7,d1

loc_01a4ee:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a4ee
	move.w #$cf,d1

loc_01a504:
	move.w d0,-(a1)
	dbra d1,loc_01a504
	rts

;==============================================
loc_01a50c:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	move.l #$c8,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a536:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a536
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a552:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a552
	move.w #$cf,d1

loc_01a568:
	move.w d0,-(a1)
	dbra d1,loc_01a568
	rts

;==============================================
loc_01a570:
	move.l ($10,a4),d3
	sub.l ($288,a5),d3
	moveq #$30,d2
	jsr loc_01bb9c
	move.l d3,($c,a4)
	clr.l ($18,a4)
	clr.l ($1c,a4)
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #$27,d1

loc_01a596:
	move.w #$c0,d0
	add.w ($1c,a4),d0
	move.w d0,(a1)+
	add.l d3,($1c,a4)
	dbra d1,loc_01a596
	move.w ($20,a4),d0
	lea.l (a3,d0.w),a1
	moveq #7,d1

loc_01a5b2:
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w d0,-(a1)
	dbra d1,loc_01a5b2
	lsl.l #3,d3
	sub.l d3,($18,a4)
	move.w #$c0,d0
	add.w ($18,a4),d0
	move.w #$cf,d1

loc_01a5d6:
	move.w d0,-(a1)
	dbra d1,loc_01a5d6
	rts

;==============================================
loc_01a5de:
	rts

;==============================================
loc_01a5e0:
	move.w #$7b0,($20,a4)
	rts

;==============================================
;Object Postions
;==============================================
loc_01a5e8:
	move.w (stageid,a5),d0
	move.w loc_01a644(pc,d0.w),d0
	lea.l loc_01a644(pc,d0.w),a1

loc_01a5f4:
	tst.b (a1)
	bmi.b loc_01a642
	jsr loc_01c318
	beq.b loc_01a642
	addq.b #1,(a4)
	move.w (a1),($2,a4)
	move.w (2,a1),($10,a4)
	move.w (4,a1),($14,a4)
	move.b (6,a1),(9,a4)
	move.b (7,a1),($3c,a4)
	move.b (9,a1),($b,a4)
	move.b (8,a1),($e,a4)
	move.w ($a,a1),($1a,a4)
	move.w ($c,a1),($18,a4)
	move.w ($e,a1),($26,a4)
	lea.l ($10,a1),a1
	bra.b loc_01a5f4

loc_01a642:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01a644:
	dc.w loc_01a684-loc_01a644;040
	dc.w loc_01a6c6-loc_01a644;082
	dc.w loc_01a748-loc_01a644;104
	dc.w loc_01a77a-loc_01a644;136
	dc.w loc_01a7bc-loc_01a644;178
	dc.w loc_01a80e-loc_01a644;1ca
	dc.w loc_01a840-loc_01a644;1fc
	dc.w loc_01a8b2-loc_01a644;26e

	dc.w loc_01a934-loc_01a644;2f0
	dc.w loc_01a996-loc_01a644;352
	dc.w loc_01aa18-loc_01a644;3d4
	dc.w loc_01aa6a-loc_01a644;426
	dc.w loc_01ab1c-loc_01a644;4d8
	dc.w loc_01ab6e-loc_01a644;52a
	dc.w loc_01abe0-loc_01a644;59c
	dc.w loc_01ac72-loc_01a644;62e

	dc.w loc_01acf4-loc_01a644;6b0
	dc.w loc_01ad66-loc_01a644;722
	dc.w loc_01a7bc-loc_01a644;178
	dc.w loc_01ad66-loc_01a644;722
	dc.w loc_01a840-loc_01a644;1fc
	dc.w loc_01aa18-loc_01a644;3d4
	dc.w loc_01ae08-loc_01a644;7c4
	dc.w loc_01a684-loc_01a644;040

	dc.w loc_01ae7a-loc_01a644;836
	dc.w loc_01aecc-loc_01a644;888
	dc.w loc_01aefe-loc_01a644;8ba
	dc.w loc_01af50-loc_01a644;90c
	dc.w loc_01afd2-loc_01a644;98e
	dc.w loc_01b024-loc_01a644;9e0
	dc.w loc_01aa18-loc_01a644;3d4
	dc.w loc_01aa18-loc_01a644;3d4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01a684:
	dc.w $0405,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0300,$0100,$0000,$0001,$0800,$6000,$e000,$ffd9
	dc.w $0002,$0318,$00b0,$0202,$0800,$6000,$e000,$0008
	dc.w $0600,$fff0,$0050,$0200,$0000,$6000,$6000,$0000
	dc.w $ffff

loc_01a6c6:
	dc.w $0000,$0270,$0050,$0200,$0800,$6000,$e000,$000e
	dc.w $0001,$0238,$0040,$0202,$0800,$6000,$e000,$000e
	dc.w $0002,$02d0,$0040,$0202,$0800,$6000,$e000,$000e
	dc.w $0004,$0320,$0060,$0203,$0800,$6000,$e000,$000e
	dc.w $0005,$0290,$0060,$0200,$0800,$6000,$e000,$000e
	dc.w $0301,$01f0,$0050,$0206,$0800,$6000,$e000,$000e
	dc.w $0207,$0110,$0070,$0200,$000f,$6000,$6000,$0000
	dc.w $0700,$0160,$0080,$0000,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01a748:
	dc.w $0400,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0302,$0140,$00d0,$0200,$0800,$6000,$e000,$0008
	dc.w $0002,$0280,$00e0,$0200,$0c00,$6000,$a000,$0000
	dc.w $ffff

loc_01a77a:
	dc.w $0000,$02c0,$00b0,$0200,$0800,$6000,$e000,$0088
	dc.w $0001,$02c0,$0088,$0200,$0800,$6000,$e000,$0060
	dc.w $0003,$0378,$0033,$0207,$0800,$6000,$e000,$000b
	dc.w $0002,$01f8,$0048,$0202,$0800,$6000,$e000,$000d
	dc.w $ffff

loc_01a7bc:
	dc.w $0100,$0280,$0080,$0200,$0800,$6000,$a000,$0058
	dc.w $0303,$0170,$00a0,$0202,$0800,$6000,$a000,$0069
	dc.w $0204,$fff0,$0040,$0201,$000d,$6000,$6000,$0000
	dc.w $0205,$0180,$0040,$0201,$000d,$6000,$6000,$0000
	dc.w $0800,$0000,$0000,$0000,$0c00,$0000,$0000,$0000
	dc.w $ffff

loc_01a80e:
	dc.w $0304,$0140,$0020,$0000,$0800,$6000,$e000,$0000
	dc.w $0001,$0270,$0018,$0000,$0800,$6000,$e000,$0000
	dc.w $0003,$02e8,$0050,$0202,$0800,$6000,$a000,$0000
	dc.w $ffff

loc_01a840:
	dc.w $0c00,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0a02,$04d0,$0030,$0000,$0800,$6000,$e000,$0000
	dc.w $0b00,$028f,$00b0,$0200,$0800,$6000,$e000,$0000
	dc.w $0005,$0290,$00b0,$0201,$0800,$6000,$e000,$0000
	dc.w $0004,$0370,$00b0,$0204,$0800,$6000,$a000,$0000
	dc.w $0903,$00d0,$0092,$0200,$0000,$6000,$2000,$0000
	dc.w $0500,$0170,$00b0,$0000,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01a8b2:
	dc.w $0401,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0402,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0120,$0000,$0002,$0800,$6000,$e000,$0000
	dc.w $0e01,$0269,$0029,$0202,$0800,$6000,$e000,$0000
	dc.w $0e04,$0298,$0036,$0202,$0801,$6000,$e000,$0000
	dc.w $0e03,$019c,$003e,$0202,$0400,$6000,$a000,$0000
	dc.w $0e02,$0180,$0042,$0202,$0400,$6000,$a000,$0000
	dc.w $0d06,$0190,$0050,$0203,$0c00,$6000,$6000,$0000
	dc.w $ffff

loc_01a934:
	dc.w $1000,$03a5,$00e5,$0206,$0800,$6000,$e000,$0000
	dc.w $0f02,$034e,$009e,$0202,$0800,$6000,$e000,$0010
	dc.w $0005,$02b8,$0090,$0202,$0800,$6000,$e000,$0010
	dc.w $0004,$0258,$0080,$0200,$0800,$6000,$e000,$0010
	dc.w $0001,$013a,$003c,$0202,$0800,$6000,$e000,$0010
	dc.w $0f03,$0202,$00ed,$0202,$0400,$6000,$a000,$0000
	dc.w $ffff

loc_01a996:
	dc.w $0a00,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0404,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0260,$0088,$0205,$0800,$6000,$e000,$0008
	dc.w $0001,$0280,$003e,$0202,$0800,$6000,$e000,$0008
	dc.w $0002,$017b,$0090,$0202,$0800,$6000,$e000,$0008
	dc.w $0003,$01e9,$0088,$0202,$0800,$6000,$e000,$0008
	dc.w $0b01,$02fa,$00cf,$0201,$0800,$6000,$e000,$0008
	dc.w $0004,$02e8,$002e,$0202,$0800,$6000,$e000,$0006
	dc.w $ffff

loc_01aa18:
	dc.w $1305,$0140,$0010,$0200,$0800,$6000,$e000,$0000
	dc.w $1306,$01c0,$0016,$0200,$0800,$6000,$e000,$0000
	dc.w $1307,$0240,$0012,$0200,$0800,$6000,$e000,$0000
	dc.w $1308,$02c0,$0018,$0200,$0800,$6000,$e000,$0000
	dc.w $1100,$0000,$0000,$0200,$0800,$6000,$e000,$0000
	dc.w $ffff

loc_01aa6a:
	dc.w $0009,$0260,$0001,$0001,$0800,$6000,$e000,$ffd9
	dc.w $0307,$0140,$0018,$0000,$0800,$6000,$e000,$fff1
	dc.w $0309,$01a8,$0011,$0008,$0800,$6000,$e000,$ffee
	dc.w $0002,$0228,$0018,$0002,$0800,$6000,$e000,$fff1
	dc.w $0000,$02c0,$0018,$0001,$0800,$6000,$e000,$fff1
	dc.w $0308,$0140,$0018,$0203,$0800,$6000,$e000,$fff1
	dc.w $030a,$01a8,$0015,$0204,$0800,$6000,$e000,$ffee
	dc.w $0005,$0228,$0018,$0204,$0800,$6000,$e000,$fff1
	dc.w $0003,$02c0,$0018,$0203,$0800,$6000,$e000,$fff1
	dc.w $0006,$0350,$0038,$020a,$0800,$6000,$e000,$0010
	dc.w $0207,$01a0,$0040,$0209,$0092,$6000,$e000,$0000
	dc.w $ffff

loc_01ab1c:
	dc.w $0000,$011a,$0000,$0007,$0800,$6000,$e000,$ffd9
	dc.w $0002,$0150,$0080,$0201,$0400,$6000,$a000,$0000
	dc.w $030b,$0198,$0078,$0203,$0400,$6000,$a000,$0000
	dc.w $0004,$01d8,$0068,$0201,$0400,$6000,$a000,$0000
	dc.w $0201,$0088,$0080,$0200,$000c,$6000,$6000,$0000
	dc.w $ffff

loc_01ab6e:
	dc.w $1407,$02c8,$0028,$0200,$0800,$6000,$e000,$0000
	dc.w $0006,$0278,$0030,$0201,$0800,$6000,$e000,$0008
	dc.w $0305,$01d0,$005f,$0201,$0800,$6000,$e000,$0008
	dc.w $0000,$0320,$0060,$0204,$0800,$6000,$e000,$0008
	dc.w $0003,$0230,$00d0,$0202,$0800,$6000,$e000,$0008
	dc.w $0005,$0370,$0080,$0202,$0800,$6000,$e000,$0008
	dc.w $0501,$01f0,$0080,$0000,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01abe0:
	dc.w $1600,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $1700,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0201,$0020,$001a,$0006,$0014,$6000,$e000,$0000
	dc.w $0202,$00c8,$001a,$0000,$0014,$6000,$e000,$0000
	dc.w $0203,$0180,$001a,$0007,$0014,$6000,$e000,$0000
	dc.w $0200,$ff68,$001a,$0007,$0014,$6000,$e000,$0000
	dc.w $0200,$0218,$001a,$0007,$0014,$6000,$e000,$0000
	dc.w $0004,$0330,$0040,$0202,$0800,$6000,$e000,$0000
	dc.w $1500,$0020,$0043,$0200,$0400,$6000,$c000,$0000
	dc.w $ffff

loc_01ac72:
	dc.w $1800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0001,$0350,$0030,$0202,$0800,$6000,$e000,$000a
	dc.w $0200,$00bf,$00f0,$0200,$0088,$6000,$6000,$0000
	dc.w $0202,$00bf,$00f0,$0200,$0086,$6000,$6000,$0000
	dc.w $0502,$01d0,$0070,$0000,$0800,$0000,$0000,$0000
	dc.w $0503,$0200,$0060,$0000,$0800,$0000,$0000,$0000
	dc.w $0504,$02f0,$0060,$0000,$0800,$0000,$0000,$0000
	dc.w $0505,$02a0,$0050,$0000,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01acf4:
	dc.w $1a00,$01e0,$0060,$0000,$0c00,$0000,$0000,$0000
	dc.w $0002,$0320,$00e2,$0208,$0800,$6000,$e000,$fff8
	dc.w $0001,$0238,$0098,$0203,$0800,$6000,$e000,$0008
	dc.w $0000,$01a0,$0088,$0202,$0800,$6000,$e000,$0014
	dc.w $0003,$02d0,$00a8,$0203,$0800,$6000,$e000,$0014
	dc.w $030c,$0160,$0038,$0204,$0800,$6000,$e000,$0014
	dc.w $1900,$0288,$0070,$0200,$0800,$6000,$e000,$0014
	dc.w $ffff

loc_01ad66:
	dc.w $1b00,$03d0,$0070,$0200,$0800,$2000,$e000,$0000
	dc.w $1b00,$03e0,$0060,$0200,$0800,$2000,$e000,$0000
	dc.w $0007,$0140,$0050,$0202,$0400,$6000,$a000,$0000
	dc.w $1d00,$0300,$0080,$0200,$0c00,$6000,$6000,$0000
	dc.w $1c00,$0090,$0060,$0203,$0000,$6000,$6000,$0000
	dc.w $1c02,$ff90,$0058,$0203,$0000,$6000,$6000,$0000
	dc.w $1c01,$0000,$0060,$0202,$0000,$6000,$6000,$0000
	dc.w $0204,$00e0,$0058,$0203,$008d,$6000,$6000,$0000
	dc.w $1c03,$ff90,$0060,$0202,$0000,$6000,$6000,$0000
	dc.w $0506,$0320,$0080,$0001,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01ae08:
	dc.w $0403,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$022a,$0060,$0201,$0800,$6000,$e000,$0000
	dc.w $0001,$0288,$003e,$0204,$0800,$6000,$e000,$0000
	dc.w $0002,$0308,$0030,$0202,$0800,$6000,$e000,$0000
	dc.w $0003,$0168,$0040,$0207,$0800,$6000,$e000,$0000
	dc.w $0004,$0278,$0040,$0200,$0800,$6000,$e000,$0000
	dc.w $0306,$0160,$0030,$0206,$0800,$6000,$e000,$0000
	dc.w $ffff

loc_01ae7a:
	dc.w $0100,$0318,$00f0,$0202,$0800,$6000,$e000,$0008
	dc.w $0102,$0280,$00d0,$0204,$0800,$6000,$e000,$0008
	dc.w $1f00,$0160,$0030,$0202,$0800,$6000,$e000,$0008
	dc.w $1e01,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $1e00,$0220,$00a8,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

loc_01aecc:
	dc.w $0e01,$0380,$00d8,$0208,$0800,$6000,$e000,$0008
	dc.w $0200,$00a0,$0060,$0200,$000a,$6000,$a000,$0000
	dc.w $0202,$ffeb,$0100,$0206,$000a,$6000,$a000,$0000
	dc.w $ffff

loc_01aefe:
	dc.w $0000,$01b0,$0050,$0209,$0800,$6000,$e000,$00c0
	dc.w $030d,$0140,$0050,$0203,$0800,$6000,$e000,$00c0
	dc.w $0004,$0390,$0050,$0203,$0800,$6000,$e000,$00c0
	dc.w $0002,$02b0,$0050,$0200,$0400,$6000,$a000,$00c0
	dc.w $0507,$01e0,$0080,$0001,$0800,$0000,$0000,$0000
	dc.w $ffff

loc_01af50:
	dc.w $0004,$01c0,$0020,$0003,$0800,$6000,$e000,$ffd9
	dc.w $0005,$0268,$0020,$0004,$0800,$6000,$e000,$ffd9
	dc.w $0006,$0370,$0030,$0003,$0800,$6000,$e000,$ffd9
	dc.w $0e00,$03d8,$0080,$0203,$0800,$6000,$e000,$00c0
	dc.w $0e01,$0340,$0050,$0203,$0800,$6000,$e000,$00c0
	dc.w $0e02,$0338,$0098,$0202,$0800,$6000,$e000,$00c0
	dc.w $0003,$0208,$0060,$0202,$0800,$6000,$e000,$00c0
	dc.w $0007,$0260,$0088,$0202,$0c00,$6000,$6000,$00c0
	dc.w $ffff

loc_01afd2:
	dc.w $0000,$0220,$0071,$0200,$0800,$6000,$a000,$0009
	dc.w $0001,$02c0,$0071,$0200,$0800,$6000,$a000,$0009
	dc.w $0002,$02a8,$003d,$0200,$0800,$6000,$a000,$0009
	dc.w $0003,$0240,$0030,$0200,$0800,$6000,$a000,$0009
	dc.w $0004,$02f0,$0030,$0202,$0800,$6000,$a000,$0009
	dc.w $ffff

loc_01b024:
	dc.w $0406,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0305,$01d0,$005f,$0201,$0800,$6000,$e000,$0008
	dc.w $0006,$0250,$00a0,$0200,$0800,$6000,$e000,$0008
	dc.w $0000,$0320,$0060,$0204,$0800,$6000,$e000,$0008
	dc.w $0003,$0230,$00d0,$0202,$0800,$6000,$e000,$0008
	dc.w $0005,$0370,$0080,$0202,$0800,$6000,$e000,$0008
	dc.w $0508,$01f0,$0080,$0000,$0800,$0000,$0000,$0000
	dc.w $ffff

;==============================================
loc_01b096:
	move.w ($51a,a5),($51c,a5)
	move.w ($91a,a5),($91c,a5)
	move.b ($60,a5),d0
	moveq #0,d1
	lsr.b #1,d0
	roxr.w #1,d1
	or.w (INP_P1,a5),d1
	move.w d1,($51a,a5)
	moveq #0,d2
	lsr.b #1,d0
	roxr.w #1,d2
	or.w (INP_P2,a5),d2
	move.w d2,($91a,a5)
	rts

;==============================================
loc_01b0c4:
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
loc_01b0e6:
	movea.l #$904000,a0
	move.w #$ff,d4
	move.l #$200000,d0
	bsr.w loc_01b218
	movea.l #$908000,a0
	move.w #$ff,d4
	move.l #$6c200000,d0
	bsr.w loc_01b218
	movea.l #$90c000,a0
	move.w #$ff,d4
	move.l #$b000000,d0
	bsr.w loc_01b218
	movea.l #$910000,a0
	move.w #$7f,d4
	move.l #$c000c0,d0
	bsr.w loc_01b218
	bra.w loc_01b13a

;==============================================
loc_01b13a:
	WATCHDOG
	movea.l #$708020,a0
	move.l #$80008000,(a0)+
	move.l #$80008000,(a0)+
	tst.b ($95,a5)
	bne.b loc_01b162
	eori.b #1,($94,a5)
	st.b ($95,a5)

loc_01b162:
	moveq #1,d0
	jsr loc_001370
	WATCHDOG
	movea.l #$708020,a0
	move.l #$80008000,(a0)+
	move.l #$80008000,(a0)+
	tst.b ($95,a5)
	bne.b loc_01b19a
	eori.b #1,($94,a5)
	st.b ($95,a5)
	moveq #1,d0
	jmp loc_001370

loc_01b19a:
	rts

;==============================================
loc_01b19c:
	movea.l #$904000,a0
	move.w #$ff,d4
	move.l #$200000,d0
	bra.b loc_01b218

;==============================================
loc_01b1ae:
	movea.l #$908000,a0
	move.w #$ff,d4
	move.l #$6c200000,d0
	bra.b loc_01b218

;==============================================
loc_01b1c0:
	movea.l #$90c000,a0
	move.w #$ff,d4
	move.l #$b000000,d0
	bra.b loc_01b218

;==============================================
loc_01b1d2:
	movea.l #$914000,a0
	move.w #$ff,d4
	move.l #$200000,d0
	bra.b loc_01b218

;==============================================
loc_01b1e4:
	movea.l #$918000,a0
	move.w #$ff,d4
	move.l #$6c200000,d0
	bra.b loc_01b218

;==============================================
loc_01b1f6:
	movea.l #$91c000,a0
	move.w #$ff,d4
	move.l #$b000000,d0
	bra.b loc_01b218

;==============================================
loc_01b208:
	movea.l #$910000,a0
	move.w #$7f,d4
	move.l #$c000c0,d0

loc_01b218:
	WATCHDOG
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3

loc_01b224:
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	dbra d4,loc_01b224
	rts

;==============================================
loc_01b23a:
	bsr.w Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	bra.w loc_01b2a6

;==============================================
loc_01b246:
	bsr.w Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	bra.w loc_01b2aa

;==============================================
loc_01b252:
	bsr.w Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	bra.w loc_01b2b0

;==============================================
loc_01b25e:
	bsr.w Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	bra.w loc_01b2b6

;==============================================
loc_01b26a:
	bsr.w Hex_to_Decimal
	move.w (-$5d28,a5),d0
	bra.w loc_01b2d8

;==============================================
loc_01b276:
	bsr.w Hex_to_Decimal
	move.w (-$5d28,a5),d0
	bra.w loc_01b2e2

;==============================================
loc_01b282:
	bsr.w Hex_to_Decimal
	move.w (-$5d28,a5),d0
	bra.w loc_01b2ea

;==============================================
loc_01b28e:
	bsr.w Hex_to_Decimal
	move.w (-$5d28,a5),d0
	bra.w loc_01b300

;==============================================
loc_01b29a:
	bsr.w Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	bra.w loc_01b312

;==============================================
loc_01b2a6:
	moveq #7,d3
	bra.b loc_01b2bc

loc_01b2aa:
	lsl.l #4,d0
	moveq #6,d3
	bra.b loc_01b2bc

loc_01b2b0:
	lsl.l #8,d0
	moveq #5,d3
	bra.b loc_01b2bc

loc_01b2b6:
	lsl.l #6,d0
	lsl.l #6,d0
	moveq #4,d3

loc_01b2bc:
	rol.l #4,d0
	move.l d0,d2
	andi.w #$f,d2
	addi.w #0,d2
	move.w d2,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	dbra d3,loc_01b2bc
	rts

;==============================================
loc_01b2d8:
	move.w d0,d3
	lsr.w #8,d0
	bsr.b loc_01b2ea
	move.w d3,d0
	bra.b loc_01b2ea

loc_01b2e2:
	move.w d0,d3
	lsr.w #8,d0
	bsr.b loc_01b300
	move.w d3,d0

loc_01b2ea:
	move.w d0,d2
	lsr.w #4,d2
	andi.w #$f,d2
	addi.w #0,d2
	move.w d2,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1

loc_01b300:
	andi.w #$f,d0
	addi.w #0,d0
	movem.w d0-d1,(a1)
	lea.l ($80,a1),a1
	rts

;==============================================
loc_01b312:
	moveq #0,d4
	moveq #6,d3

loc_01b316:
	rol.l #4,d0
	move.w d0,d2
	andi.w #$f,d2
	bne.b loc_01b328
	tst.b d4
	bne.b loc_01b32a
	moveq #$20,d2
	bra.b loc_01b32a

loc_01b328:
	moveq #-1,d4

loc_01b32a:
	addi.w #0,d2
	move.w d2,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	dbra d3,loc_01b316
	rol.l #4,d0
	andi.w #$f,d0
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	rts

;==============================================
;HextoDecimal
;==============================================
Hex_to_Decimal:
	moveq #0,d2
	move.l d2,(-$5d2e,a5)
	move.l d2,(-$5d2a,a5)
	lea.l loc_01b390+8(pc),a2
	lea.l (-$5d26,a5),a3
	moveq #$1f,d2

loc_01b366:
	lsr.l #1,d0
	bcc.b loc_01b386
	andi.b #$ef,ccr
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	abcd.b -(a2),-(a3)
	lea.l (8,a2),a2
	lea.l (8,a3),a3

loc_01b386:
	lea.l (8,a2),a2
	dbra d2,loc_01b366
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b390:
	dc.l $00000000,$00000001
	dc.l $00000000,$00000002
	dc.l $00000000,$00000004
	dc.l $00000000,$00000008
	dc.l $00000000,$00000016
	dc.l $00000000,$00000032
	dc.l $00000000,$00000064
	dc.l $00000000,$00000128
	dc.l $00000000,$00000256
	dc.l $00000000,$00000512
	dc.l $00000000,$00001024
	dc.l $00000000,$00002048
	dc.l $00000000,$00004096
	dc.l $00000000,$00008192
	dc.l $00000000,$00016384
	dc.l $00000000,$00032768
	dc.l $00000000,$00065536
	dc.l $00000000,$00131072
	dc.l $00000000,$00262144
	dc.l $00000000,$00524288
	dc.l $00000000,$01048576
	dc.l $00000000,$02097152
	dc.l $00000000,$04194304
	dc.l $00000000,$08388608
	dc.l $00000000,$16777216
	dc.l $00000000,$33554432
	dc.l $00000000,$67108864
	dc.l $00000001,$34217728
	dc.l $00000002,$68435456
	dc.l $00000005,$36870912
	dc.l $00000010,$73741824
	dc.l $00000021,$47483648

;==============================================
loc_01b490:
	bsr.w loc_01bd68
	neg.w d0
	add.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bls.b loc_01b4ae
	move.b #6,(4,a6)

loc_01b4ae:
	rts

;==============================================
loc_01b4b0:
	tst.b (a6)
	beq.b loc_01b508
	bsr.w loc_01bd68
	neg.w d0
	add.w ($10,a6),d0
	sub.w ($10,a3),d0
	add.w d6,d0
	add.w d6,d6
	addi.w #$180,d6
	cmp.w d6,d0
	bhi.b loc_01b504
	bra.b loc_01b4ec

loc_01b4d0:
	tst.b (a6)
	beq.b loc_01b508
	bsr.w loc_01bd68
	neg.w d0
	add.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.b loc_01b504

loc_01b4ec:
	move.b #1,(1,a6)
	moveq #0,d0
	move.b (8,a6),d0
	subq.w #8,d0
	lsr.b #1,d0
	move.w loc_01b50a(pc,d0.w),d1
	jmp loc_01b50a(pc,d1.w)

loc_01b504:
	clr.b (1,a6)

loc_01b508:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b50a:
	dc.w loc_01b512-loc_01b50a
	dc.w loc_01b55c-loc_01b50a
	dc.w loc_01b5f8-loc_01b50a
	dc.w loc_01b65a-loc_01b50a

;==============================================
loc_01b512:
	tst.b ($59,a6)
	bne.b loc_01b528
	movea.w ($6e92,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e92,a5)
	addq.b #1,($6ebd,a5)
	bra.b loc_01b536

loc_01b528:
	movea.w ($6e94,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e94,a5)
	addq.b #1,($6ebe,a5)

loc_01b536:
	tst.b (9,a6)
	bne.b loc_01b54c
	movea.w ($6ea6,a5),a0
	move.w a6,-(a0)
	move.w a0,($6ea6,a5)
	addq.b #1,($6ec7,a5)
	rts

loc_01b54c:
	movea.w ($6ea8,a5),a0
	move.w a6,-(a0)
	move.w a0,($6ea8,a5)
	addq.b #1,($6ec8,a5)
	rts

;==============================================
loc_01b55c:
	move.b (9,a6),d0
	move.w loc_01b568(pc,d0.w),d1
	jmp loc_01b568(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b568:
	dc.w loc_01b578-loc_01b568
	dc.w loc_01b588-loc_01b568
	dc.w loc_01b598-loc_01b568
	dc.w loc_01b5a8-loc_01b568
	dc.w loc_01b5b8-loc_01b568
	dc.w loc_01b5c8-loc_01b568
	dc.w loc_01b5d8-loc_01b568
	dc.w loc_01b5e8-loc_01b568

;==============================================
loc_01b578:
	movea.w ($6e96,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e96,a5)
	addq.b #1,($6ebf,a5)
	rts

;==============================================
loc_01b588:
	movea.w ($6e98,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e98,a5)
	addq.b #1,($6ec0,a5)
	rts

;==============================================
loc_01b598:
	movea.w ($6e9a,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e9a,a5)
	addq.b #1,($6ec1,a5)
	rts

;==============================================
loc_01b5a8:
	movea.w ($6e9c,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e9c,a5)
	addq.b #1,($6ec2,a5)
	rts

;==============================================
loc_01b5b8:
	movea.w ($6e9e,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e9e,a5)
	addq.b #1,($6ec3,a5)
	rts

;==============================================
loc_01b5c8:
	movea.w ($6ea0,a5),a0
	move.w a6,-(a0)
	move.w a0,($6ea0,a5)
	addq.b #1,($6ec4,a5)
	rts

;==============================================
loc_01b5d8:
	movea.w ($6ea2,a5),a0
	move.w a6,-(a0)
	move.w a0,($6ea2,a5)
	addq.b #1,($6ec5,a5)
	rts

;==============================================
loc_01b5e8:
	movea.w ($6ea4,a5),a0
	move.w a6,-(a0)
	move.w a0,($6ea4,a5)
	addq.b #1,($6ec6,a5)
	rts

;==============================================
loc_01b5f8:
	tst.b ($124,a5)
	beq.b loc_01b604
	tst.b ($30,a6)
	beq.b loc_01b610

loc_01b604:
	move.b (9,a6),d0
	move.w loc_01b612(pc,d0.w),d1
	jmp loc_01b612(pc,d1.w)

loc_01b610:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b612:
	dc.w loc_01b61a-loc_01b612
	dc.w loc_01b62a-loc_01b612
	dc.w loc_01b63a-loc_01b612
	dc.w loc_01b64a-loc_01b612

;==============================================
loc_01b61a:
	movea.w ($6eaa,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eaa,a5)
	addq.b #1,($6ec9,a5)
	rts

;==============================================
loc_01b62a:
	movea.w ($6eac,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eac,a5)
	addq.b #1,($6eca,a5)
	rts

;==============================================
loc_01b63a:
	movea.w ($6eae,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eae,a5)
	addq.b #1,($6ecb,a5)
	rts

;==============================================
loc_01b64a:
	movea.w ($6eb0,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eb0,a5)
	addq.b #1,($6ecc,a5)
	rts

;==============================================
loc_01b65a:
	tst.b ($124,a5)
	bne.b loc_01b66c
	move.b (9,a6),d0
	move.w loc_01b66e(pc,d0.w),d1
	jmp loc_01b66e(pc,d1.w)

loc_01b66c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b66e:
	dc.w loc_01b672-loc_01b66e
	dc.w loc_01b682-loc_01b66e

;==============================================
loc_01b672:
	movea.w ($6eb2,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eb2,a5)
	addq.b #1,($6ecd,a5)
	rts

loc_01b682:
	movea.w ($6eb4,a5),a0
	move.w a6,-(a0)
	move.w a0,($6eb4,a5)
	addq.b #1,($6ece,a5)
	rts

;==============================================
loc_01b692:
	subq.b #1,($32,a6)
	bne.b loc_01b6de
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b6aa
	bmi.b loc_01b6b0
	btst #6,d0
	bne.b loc_01b6da

loc_01b6aa:
	lea.l ($14,a0),a0
	bra.b loc_01b6ee

loc_01b6b0:
	movea.l ($14,a0),a0
	bra.b loc_01b6ee

loc_01b6b6:
	subq.b #1,($32,a6)
	bne.b loc_01b6de
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b6ce
	bmi.b loc_01b6d4
	btst #6,d0
	bne.b loc_01b6da

loc_01b6ce:
	lea.l (8,a0),a0
	bra.b loc_01b6ee

loc_01b6d4:
	movea.l (8,a0),a0
	bra.b loc_01b6ee

loc_01b6da:
	st.b ($33,a6)

loc_01b6de:
	rts

;==============================================
loc_01b6e0:
	andi.w #$ff,d0
	add.w d0,d0

loc_01b6e6:
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01b6ee:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

;==============================================
loc_01b6f8:
	subq.b #1,($32,a6)
	bne.b loc_01b720
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b710
	bmi.b loc_01b716
	btst #6,d0
	bne.b loc_01b71c

loc_01b710:
	lea.l (8,a0),a0
	bra.b loc_01b730

loc_01b716:
	movea.l (8,a0),a0
	bra.b loc_01b730

loc_01b71c:
	st.b ($33,a6)

loc_01b720:
	rts

;==============================================
loc_01b722:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01b730:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)

loc_01b738:
	movea.l (4,a0),a2
	moveq #0,d0
	lea.l $90c000,a3
	move.w (stageid,a5),d3

loc_01b748:
	move.w (a2)+,d0
	lea.l (a3,d0.w),a1
	move.w (a1),d1
	andi.w #$f000,d1
	move.w (a2)+,d0
	movea.l loc_01b788(pc,d0.w),a0
	cmpi.w #$10,d0
	bcc.b loc_01b768
	move.w (a0,d3.w),d0
	lea.l (a0,d0.w),a0

loc_01b768:
	move.w (a2)+,d0
	move.w d0,d6
	andi.l #$ffe0,d0
	adda.l d0,a0
	moveq #$f,d2

loc_01b776:
	move.w (a0)+,d0
	or.w d1,d0
	move.w d0,(a1)+
	dbra d2,loc_01b776
	btst #0,d6
	beq.b loc_01b748
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01b788:
	dc.l loc_34c514,loc_361354,loc_362a14,loc_363ef4
	dc.l loc_35fdb4,loc_364d14,loc_3606b4,loc_3629f4
	dc.l loc_363ed4,loc_366e94,loc_35bb94,loc_362854
	dc.l loc_363574,loc_364894

;==============================================
loc_01b7c0:
	move.l (a1),d6
	andi.l #$f000f000,d6
	bra.b loc_01b7d4

;==============================================
loc_01b7ca:
	moveq #0,d6
	bra.b loc_01b7d4

;==============================================
loc_01b7ce:
	move.l #$f000f000,d6

loc_01b7d4:
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,($10,a1)
	lea.l ($20,a1),a1
	dbra d7,loc_01b7d4
	rts

;==============================================
loc_01b800:
	subq.b #1,($32,a6)
	bne.b loc_01b828
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b818
	bmi.b loc_01b81e
	btst #6,d0
	bne.b loc_01b824

loc_01b818:
	lea.l (8,a0),a0
	bra.b loc_01b838

loc_01b81e:
	movea.l (8,a0),a0
	bra.b loc_01b838

loc_01b824:
	st.b ($33,a6)

loc_01b828:
	rts

;==============================================
loc_01b82a:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01b838:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)

loc_01b840:
	move.w ($10,a6),d0
	move.w ($14,a6),d1
	not.w d1
	move.w d1,d2
	andi.l #$00000100,d2
	lsl.w #5,d2
	andi.w #$f8,d1
	lsr.w #1,d1
	add.w d2,d1
	andi.l #$1f8,d0
	lsl.w #4,d0
	add.w d1,d0
	moveq #0,d1
	move.w (gfxram8x8,a5),d1
	lsl.l #8,d1
	add.l d1,d0
	movea.l d0,a2
	move.b (1,a6),d2
	movea.l (4,a0),a0
	bra.w loc_01b978

loc_01b87e:
	subq.b #1,($32,a6)
	bne.b loc_01b8a6
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b896
	bmi.b loc_01b89c
	btst #6,d0
	bne.b loc_01b8a2

loc_01b896:
	lea.l (8,a0),a0
	bra.b loc_01b8b6

loc_01b89c:
	movea.l (8,a0),a0
	bra.b loc_01b8b6

loc_01b8a2:
	st.b ($33,a6)

loc_01b8a6:
	rts

;==============================================
loc_01b8a8:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01b8b6:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	move.w ($10,a6),d0
	move.w ($14,a6),d1
	neg.w d1
	move.w d1,d2
	andi.l #$300,d2
	lsl.w #4,d2
	andi.w #$f0,d1
	lsr.w #2,d1
	add.w d2,d1
	andi.l #$3f0,d0
	lsl.w #2,d0
	add.w d1,d0
	moveq #0,d1
	move.w (gfxram16x16,a5),d1
	lsl.l #8,d1
	add.l d1,d0
	movea.l d0,a2
	move.b (1,a6),d2
	movea.l (4,a0),a0
	bra.w loc_01b9d6

;==============================================
loc_01b8fc:
	subq.b #1,($32,a6)
	bne.b loc_01b924
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_01b914
	bmi.b loc_01b91a
	btst #6,d0
	bne.b loc_01b920

loc_01b914:
	lea.l (8,a0),a0
	bra.b loc_01b934

loc_01b91a:
	movea.l (8,a0),a0
	bra.b loc_01b934

loc_01b920:
	st.b ($33,a6)

loc_01b924:
	rts

;==============================================
loc_01b926:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01b934:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)

loc_01b93c:
	move.w ($10,a6),d0
	move.w ($14,a6),d1
	neg.w d1
	move.w d1,d2
	andi.l #$700,d2
	lsl.w #3,d2
	andi.w #$e0,d1
	lsr.w #3,d1
	add.w d2,d1
	andi.l #$7e0,d0
	add.w d1,d0
	moveq #0,d1
	move.w (gfxram32x32,a5),d1
	lsl.l #8,d1
	add.l d1,d0
	movea.l d0,a2
	move.b (1,a6),d2
	movea.l (4,a0),a0
	bra.w loc_01ba34

;==============================================
loc_01b978:
	move.w (a0)+,d5
	move.w (a0)+,d5
	move.w (a0)+,d6

loc_01b97e:
	lea.l (a2),a1
	move.w d5,d4

loc_01b982:
	movem.w (a0)+,d0-d1
	tst.b d2
	bne.b loc_01b98c
	moveq #$20,d0

loc_01b98c:
	addi.w #0,d0
	movem.w d0-d1,(a1)
	lea.l (4,a1),a1
	move.w a1,d0
	andi.w #$7f,d0
	bne.b loc_01b9b8
	lea.l (-4,a1),a1
	move.l a1,d0
	move.w d0,d1
	addi.w #$2000,d1
	andi.w #$df80,d0
	andi.w #$2000,d1
	or.w d1,d0
	movea.l d0,a1

loc_01b9b8:
	dbra d4,loc_01b982
	move.l a2,d0
	move.w d0,d1
	addi.w #$80,d1
	andi.w #$e000,d0
	andi.w #$1ffc,d1
	or.w d1,d0
	movea.l d0,a2
	dbra d6,loc_01b97e
	rts

;==============================================
loc_01b9d6:
	move.w (a0)+,d5
	move.w (a0)+,d5
	move.w (a0)+,d6

loc_01b9dc:
	lea.l (a2),a1
	move.w d5,d4

loc_01b9e0:
	movem.w (a0)+,d0-d1
	tst.b d2
	bne.b loc_01b9ea
	moveq #$20,d0

loc_01b9ea:
	addi.w #$6c00,d0
	movem.w d0-d1,(a1)
	lea.l (4,a1),a1
	move.w a1,d0
	andi.w #$3f,d0
	bne.b loc_01ba16
	lea.l (-4,a1),a1
	move.l a1,d0
	move.w d0,d1
	addi.w #$1000,d1
	andi.w #$cfc0,d0
	andi.w #$3000,d1
	or.w d1,d0
	movea.l d0,a1

loc_01ba16:
	dbra d4,loc_01b9e0
	move.l a2,d0
	move.w d0,d1
	addi.w #$40,d1
	andi.w #$f000,d0
	andi.w #$0ffc,d1
	or.w d1,d0
	movea.l d0,a2
	dbra d6,loc_01b9dc
	rts

;==============================================
loc_01ba34:
	move.w (a0)+,d5
	move.w (a0)+,d5
	move.w (a0)+,d6

loc_01ba3a:
	lea.l (a2),a1
	move.w d5,d4

loc_01ba3e:
	movem.w (a0)+,d0-d1
	tst.b d2
	bne.b loc_01ba48
	moveq #0,d0

loc_01ba48:
	addi.w #$b00,d0
	movem.w d0-d1,(a1)
	lea.l (4,a1),a1
	move.w a1,d0
	andi.w #$1f,d0
	bne.b loc_01ba74
	lea.l (-4,a1),a1
	move.l a1,d0
	move.w d0,d1
	addi.w #$800,d1
	andi.w #$c7e0,d0
	andi.w #$3800,d1
	or.w d1,d0
	movea.l d0,a1

loc_01ba74:
	dbra d4,loc_01ba3e
	move.l a2,d0
	move.w d0,d1
	addi.w #$20,d1
	andi.w #$f800,d0
	andi.w #$7fc,d1
	or.w d1,d0
	movea.l d0,a2
	dbra d6,loc_01ba3a
	rts

;==============================================
loc_01ba92:
	andi.w #$f,d0
	andi.w #$1f,d1
	addi.w #$10,d0
	swap d0
	add.w d1,d0
	move.w #$17f,d1
	bra.b loc_01bad0

loc_01baa8:
	andi.w #$f,d0
	andi.w #$1f,d1
	addi.w #$6c10,d0
	swap d0
	add.w d1,d0
	moveq #$5f,d1
	bra.b loc_01bad0

loc_01babc:
	addq.w #$1,d0
	andi.w #$f,d0
	andi.w #$1f,d1
	addi.w #$b00,d0
	swap d0
	add.w d1,d0
	moveq #$17,d1

loc_01bad0:
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	dbra d1,loc_01bad0
	rts

;==============================================
loc_01bade:
	lea.l (p1memory,a5),a1
	tst.b d1
	bmi.w loc_01bb42
	beq.b loc_01baee
	lea.l (p2memory,a5),a1

loc_01baee:
	tst.b ($125,a1)
	bne.b loc_01bb42
	move.l d0,(-$5d26,a5)
	lea.l (-$5d22,a5),a0
	lea.l ($114,a1),a1
	bra.w loc_01bb28
	lea.l (p1memory,a5),a1
	tst.b d1
	bmi.b loc_01bb42
	beq.b loc_01bb12
	lea.l (p2memory,a5),a1

loc_01bb12:
	tst.b ($125,a1)
	bne.b loc_01bb42
	lea.l loc_01bbfc(pc),a0
	ext.w d0
	lsl.w #2,d0
	lea.l (a0,d0.w),a0
	lea.l ($114,a1),a1

loc_01bb28:
	andi.b #$ef,ccr
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	cmpi.l #$09999999,(a1)
	bcs.b loc_01bb42
	move.l #$09999999,(a1)

loc_01bb42:
	rts

;==============================================
loc_01bb44:
	tst.b ($110,a5)
	bne.b loc_01bb42
	tst.b ($141,a5)
	bne.b loc_01bb42
	tst.b ($125,a0)
	bne.b loc_01bb42
	move.l a1,(-$5d22,a5)
	lea.l ($114,a0),a1
	move.l d0,(-$5d26,a5)
	lea.l (-$5d22,a5),a0
	bsr.b loc_01bb28
	movea.l (-$5d22,a5),a1
	rts

;==============================================
loc_01bb6e:
	tst.b ($110,a5)
	bne.b loc_01bb42
	tst.b ($141,a5)
	bne.b loc_01bb42
	tst.b ($125,a0)
	bne.b loc_01bb42
	move.l a1,(-$5d22,a5)
	lea.l ($114,a0),a1
	lea.l loc_01bbfc(pc),a0
	ext.w d0
	lsl.w #2,d0
	lea.l (a0,d0.w),a0
	bsr.b loc_01bb28
	movea.l (-$5d22,a5),a1
	rts

;==============================================
loc_01bb9c:
	move.l d3,d4
	eor.l d2,d4
	tst.l d3
	bpl.w loc_01bba8
	neg.l d3

loc_01bba8:
	tst.l d2
	bpl.w loc_01bbb0
	neg.l d2

loc_01bbb0:
	bsr.w loc_01bbbe
	tst.l d4
	bpl.w loc_01bbbc
	neg.l d3

loc_01bbbc:
	rts

;==============================================
loc_01bbbe:
	moveq #0,d0
	move.w #$1f,d4

loc_01bbc4:
	add.l d3,d3
	addx.l d0,d0
	cmp.l d2,d0
	bcs.w loc_01bbd2
	sub.l d2,d0
	addq.l #1,d3

loc_01bbd2:
	dbra d4,loc_01bbc4
	rts

loc_01bbd8:
	ext.l d1
	tst.w d0
	bpl.w loc_01bbe4
	neg.w d0
	neg.l d1

loc_01bbe4:
	moveq #0,d2
	moveq #$f,d3

loc_01bbe8:
	asr.w #1,d0
	bcc.b loc_01bbee
	add.l d1,d2

loc_01bbee:
	asl.l #1,d1
	dbra d3,loc_01bbe8
	move.l d2,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
	dc.l $00000000

loc_01bbfc:
	dc.l $00000001,$00000010,$00000050,$00000100
	dc.l $00000200,$00000300,$00000400,$00000500
	dc.l $00000600,$00000700,$00000800,$00000900
	dc.l $00001000,$00001100,$00001200,$00001300
	dc.l $00001400,$00001500,$00001600,$00001700
	dc.l $00001800,$00001900,$00002000,$00002100
	dc.l $00002200,$00002300,$00002400,$00002500
	dc.l $00002600,$00002700,$00002800,$00002900
	dc.l $00003000,$00003100,$00003200,$00003300
	dc.l $00003400,$00003500,$00003600,$00003700
	dc.l $00003800,$00003900,$00004000,$00004100
	dc.l $00004200,$00004300,$00004400,$00004500
	dc.l $00004600,$00004700,$00004800,$00004900
	dc.l $00005000,$00005100,$00005200,$00005300
	dc.l $00005400,$00005500,$00005600,$00005700
	dc.l $00005800,$00005900,$00006000,$00006100
	dc.l $00006200,$00006300,$00006400,$00007000
	dc.l $00008000,$00009000,$00010000,$00020000
	dc.l $00030000,$00040000,$00050000,$00060000
	dc.l $00070000,$00080000,$00090000,$00100000
	dc.l $00200000,$00300000,$00400000,$00500000
	dc.l $00600000,$00700000,$00800000,$00900000

;==============================================
loc_01bd5c:
	moveq #0,d0
	move.b ($e,a6),d0
	movea.l loc_01bd96(pc,d0.w),a3
	rts

;==============================================
loc_01bd68:
	moveq #0,d0
	moveq #0,d1
	move.b ($e,a6),d1
	cmpi.b #8,d1
	bne.b loc_01bd90
	move.w ($26,a6),d2
	beq.b loc_01bd90
	add.w d2,d2
	movea.l ($380,a5),a3
	move.w ($3a0,a5),d0
	sub.w d2,d0
	move.w (a3,d0.w),d0
	subi.w #$c0,d0

loc_01bd90:
	movea.l loc_01bd96(pc,d1.w),a3
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01bd96:
	dc.l $00000030,$00ff8200,$00ff8280,$00ff8300

;==============================================
RNGFunction:
	move.w (RngByte0,a5),d0
	move.w d0,d1
	add.w d0,d0
	add.w d1,d0
	lsr.w #8,d0
	add.b d0,(RngByte1,a5)
	move.b d0,(RngByte0,a5)
	move.b (RngByte1,a5),d0
	rts

;==============================================
loc_01bdc0:
	bsr.w loc_01bf68
	bsr.w loc_01c046
	bsr.w loc_01c0ba
	bra.w loc_01be06

;==============================================
loc_01bdd0:
	bsr.w loc_01bfd0
	bra.b loc_01bdea

;==============================================
loc_01bdd6:
	bsr.w loc_01bf22
	bsr.w loc_01bfd0
	bsr.w loc_01bff8
	bsr.w loc_01c00a
	bsr.w loc_01c024

loc_01bdea:
	bsr.w loc_01bf68
	move.b #0,($c08,a5)
	move.b #0,($1008,a5)
	bsr.w loc_01c046
	bsr.w loc_01c0ba
	bsr.w loc_01c0f0

loc_01be06:
	bsr.w loc_01c126
	bsr.w loc_01c192
	bsr.w loc_01c15c
	lea.l ($71c2,a5),a0
	move.w #$1ff,d7

loc_01be1a:
	move.l d1,(a0)+
	dbra d7,loc_01be1a
	move.w #$8400,($6ffe,a5)
	move.w #$8800,($7000,a5)
	move.w #$8c00,($7002,a5)
	move.w #$9000,($7004,a5)

loc_01be38:
	lea ($6fce,a5),a0
	move.w a0,($6e92,a5)
	lea ($6ffe,a5),a0
	move.w a0,($6e94,a5)
	lea ($7036,a5),a0
	move.w a0,($6ea6,a5)
	lea ($7066,a5),a0
	move.w a0,($6ea8,a5)
	lea ($7076,a5),a0
	move.w a0,($6e96,a5)
	lea ($7078,a5),a0
	move.w a0,($6e98,a5)
	lea ($707a,a5),a0
	move.w a0,($6e9a,a5)
	lea ($707c,a5),a0
	move.w a0,($6e9c,a5)
	lea ($707e,a5),a0
	move.w a0,($6e9e,a5)
	lea ($7080,a5),a0
	move.w a0,($6ea0,a5)
	lea ($7082,a5),a0
	move.w a0,($6ea2,a5)
	lea ($7084,a5),a0
	move.w a0,($6ea4,a5)
	lea ($70b6,a5),a0
	move.w a0,($6eaa,a5)
	lea ($70f6,a5),a0
	move.w a0,($6eac,a5)
	lea ($7136,a5),a0
	move.w a0,($6eae,a5)
	lea ($7176,a5),a0
	move.w a0,($6eb0,a5)
	lea ($7196,a5),a0
	move.w a0,($6eb2,a5)
	lea ($71b6,a5),a0
	move.w a0,($6eb4,a5)
	lea ($71c2,a5),a0
	move.w a0,($71b6,a5)
	move.b d1,($6ebd,a5)
	move.b d1,($6ebe,a5)
	move.b d1,($6ec7,a5)
	move.b d1,($6ec8,a5)
	move.b d1,($6ebf,a5)
	move.b d1,($6ec0,a5)
	move.b d1,($6ec1,a5)
	move.b d1,($6ec2,a5)
	move.b d1,($6ec3,a5)
	move.b d1,($6ec4,a5)
	move.b d1,($6ec5,a5)
	move.b d1,($6ec6,a5)
	move.b d1,($6ec9,a5)
	move.b d1,($6eca,a5)
	move.b d1,($6ecb,a5)
	move.b d1,($6ecc,a5)
	move.b d1,($6ecd,a5)
	move.b d1,($6ece,a5)
	move.w d1,($71ba,a5)
	move.w d1,($71be,a5)
	rts

;==============================================
loc_01bf22:
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a4
	lea.l (p3memory,a5),a3
	lea.l (p4memory,a5),a2
	move.w #$ff,d7
	moveq #0,d1

loc_01bf38:
	move.l d1,(a6)+
	move.l d1,(a4)+
	move.l d1,(a3)+
	dbra d7,loc_01bf38
	rts

;==============================================
loc_01bf44:
	lea.l (p3memory,a5),a4
	lea.l (p4memory,a5),a3
	move.w #$3f,d7
	moveq #0,d1

loc_01bf52:
	move.l d1,(a4)+
	move.l d1,(a4)+
	move.l d1,(a4)+
	move.l d1,(a4)+
	move.l d1,(a3)+
	move.l d1,(a3)+
	move.l d1,(a3)+
	move.l d1,(a3)+
	dbra d7,loc_01bf52
	rts

;==============================================
loc_01bf68:
	moveq #0,d0
	lea.l (p3memory,a5),a4
	bsr.b loc_01bf80
	lea.l (p4memory,a5),a4
	bsr.b loc_01bf80
	lea.l (p1memory,a5),a4
	bsr.b loc_01bf80
	lea.l (p2memory,a5),a4

loc_01bf80:
	move.b d0,(1,a4)
	move.l d0,(4,a4)
	move.l d0,($28,a4)
	move.l d0,($2c,a4)
	move.b d0,($31,a4)
	move.b d0,($67,a4)
	move.b d0,($5e,a4)
	move.b d0,($5d,a4)
	move.b d0,($114,a4)
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	moveq #9,d4
	lea.l ($400,a4),a1
	bsr.w loc_01bfba
	lea.l (-$80,a1),a1
	moveq #1,d4

loc_01bfba:
	movem.l d0-d3,-(a1)
	movem.l d0-d3,-(a1)
	movem.l d0-d3,-(a1)
	movem.l d0-d3,-(a1)
	dbra d4,loc_01bfba
	rts

;==============================================
loc_01bfd0:
	st.b ($a9,a5)
	lea.l ($200,a5),a0
	lea.l (Camera_Data,a5),a1
	lea.l ($300,a5),a2
	lea.l ($380,a5),a3
	move.w #$1f,d7
	moveq #0,d1

loc_01bfea:
	move.l d1,(a0)+
	move.l d1,(a1)+
	move.l d1,(a2)+
	move.l d1,(a3)+
	dbra d7,loc_01bfea
	rts

;==============================================
;clears 0xff8100~ff8180
loc_01bff8:
	lea.l ($100,a5),a6
	move.w #$1f,d7
	moveq #0,d1

loc_01c002:
	move.l d1,(a6)+
	dbra d7,loc_01c002
	rts

;==============================================
loc_01c00a:
	lea.l ($79c2,a5),a0
	move.w a0,($71b8,a5)
	moveq #$3f,d7

loc_01c014:
	move.l d1,(a0)+
	dbra d7,loc_01c014
	move.w d1,($71bc,a5)
	move.w d1,($71c0,a5)
	rts

;==============================================
loc_01c024:
	lea.l ($5e00,a5),a6
	moveq #$1f,d7
	moveq #0,d1

loc_01c02c:
	move.l d1,(a6)+
	dbra d7,loc_01c02c
	move.b #$20,(-$21f8,a6)
	move.b d1,($8c,a5)
	move.b d1,($8a,a5)
	move.b d1,($8b,a5)
	rts

;==============================================
loc_01c046:
	moveq #0,d1
	lea.l ($6ee8,a5),a0
	lea.l ($1400,a5),a6
	move.b #$c,($6eb6,a5)
	move.w #$b,d0

loc_01c05a:
	movea.l a6,a1
	move.w #$3f,d7

loc_01c060:
	move.l d1,(a1)+
	dbra d7,loc_01c060
	move.b #8,(8,a6)
	move.b #0,($bf,a6)
	move.w a6,-(a0)
	lea.l ($100,a6),a6
	dbra d0,loc_01c05a
	move.w a0,($6e84,a5)
	lea.l ($6f00,a5),a0
	lea.l ($2000,a5),a6
	move.b #$c,($6eb7,a5)
	move.w #$b,d0

loc_01c092:
	movea.l a6,a1
	move.w #$3f,d7

loc_01c098:
	move.l d1,(a1)+
	dbra d7,loc_01c098
	move.b #8,(8,a6)
	move.b #1,($bf,a6)
	move.w a6,-(a0)
	lea.l ($100,a6),a6
	dbra d0,loc_01c092
	move.w a0,($6e86,a5)
	rts

;==============================================
loc_01c0ba:
	moveq #0,d1
	lea.l ($6f50,a5),a0
	lea.l ($3000,a5),a6
	move.b #$20,($6eb9,a5)
	move.w #$1f,d0

loc_01c0ce:
	movea.l a6,a1
	move.w #$1f,d7

loc_01c0d4:
	move.l d1,(a1)+
	dbra d7,loc_01c0d4
	move.b #$10,($8,a6)
	move.w a6,-(a0)
	lea.l ($80,a6),a6
	dbra d0,loc_01c0ce
	move.w a0,($6e8a,a5)
	rts

;==============================================
loc_01c0f0:
	moveq #0,d1
	lea.l ($6f70,a5),a0
	lea.l ($4000,a5),a6
	move.b #$10,($6eba,a5)
	move.w #$f,d0

loc_01c104:
	movea.l a6,a1
	move.w #$1f,d7

loc_01c10a:
	move.l d1,(a1)+
	dbra d7,loc_01c10a
	move.b #$14,(8,a6)
	move.w a6,-(a0)
	lea.l ($80,a6),a6
	dbra d0,loc_01c104
	move.w a0,($6e8c,a5)
	rts

;==============================================
loc_01c126:
	moveq #0,d1
	lea.l ($6f90,a5),a0
	lea.l ($4800,a5),a6
	move.b #$10,($6ebb,a5)
	move.w #$f,d0

loc_01c13a:
	movea.l a6,a1
	move.w #$1f,d7

loc_01c140:
	move.l d1,(a1)+
	dbra d7,loc_01c140
	move.b #$18,(8,a6)
	move.w a6,-(a0)
	lea.l ($80,a6),a6
	dbra d0,loc_01c13a
	move.w a0,($6e8e,a5)
	rts

;==============================================
loc_01c15c:
	moveq #0,d1
	lea.l ($6f9e,a5),a0
	lea.l ($5000,a5),a6
	move.b #7,($6ebc,a5)
	move.w #6,d0

loc_01c170:
	movea.l a6,a1
	move.w #$7f,d7

loc_01c176:
	move.l d1,(a1)+
	dbra d7,loc_01c176
	move.b #$1c,(8,a6)
	move.w a6,-(a0)
	lea.l ($200,a6),a6
	dbra d0,loc_01c170
	move.w a0,($6e90,a5)
	rts

;==============================================
loc_01c192:
	moveq #0,d1
	lea.l ($6f10,a5),a0
	lea.l ($2c00,a5),a6
	move.b #8,($6eb8,a5)
	move.w #7,d0

loc_01c1a6:
	movea.l a6,a1
	move.w #$1f,d7

loc_01c1ac:
	move.l d1,(a1)+
	dbra d7,loc_01c1ac
	move.b #$c,($8,a6)
	move.w a6,-(a0)
	lea.l ($80,a6),a6
	dbra d0,loc_01c1a6
	move.w a0,($6e88,a5)
	rts

;==============================================
loc_01c1c8:
	tst.b ($59,a6)
	bne.b loc_01c1ea
	tst.b ($6eb6,a5)
	beq.b loc_01c1e8
	subq.b #1,($6eb6,a5)
	movea.w ($6e84,a5),a0
	movea.w (a0)+,a4
	move.b #0,($71,a4)
	move.w a0,($6e84,a5)

loc_01c1e8:
	rts

loc_01c1ea:
	tst.b ($6eb7,a5)
	beq.b loc_01c204
	subq.b #1,($6eb7,a5)
	movea.w ($6e86,a5),a0
	movea.w (a0)+,a4
	move.b #2,($71,a4)
	move.w a0,($6e86,a5)

loc_01c204:
	rts

;==============================================
loc_01c206:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b d0,($68,a6)
	move.b d0,($5b,a6)
	move.b d0,($30,a6)
	move.w d0,($26,a6)
	move.l d0,($28,a6)
	move.l d0,($2c,a6)
	move.b d0,($bd,a6)
	move.b d0,($d7,a6)
	move.b d0,($cc,a6)
	move.b d0,($ee,a6)
	move.b d0,($ef,a6)
	move.b d0,($3e,a6)
	tst.b ($bf,a6)
	bne.b loc_01c262
	move.b #8,(8,a6)
	movea.w ($6e84,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e84,a5)
	addq.b #1,($6eb6,a5)
	rts

loc_01c262:
	move.b #8,(8,a6)
	movea.w ($6e86,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e86,a5)
	addq.b #1,($6eb7,a5)
	rts

;==============================================
loc_01c278:
	tst.b ($6eb8,a5)
	beq.b loc_01c28c
	subq.b #1,($6eb8,a5)
	movea.w ($6e88,a5),a0
	movea.w (a0)+,a4
	move.w a0,($6e88,a5)

loc_01c28c:
	rts

;==============================================
loc_01c28e:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b d0,($30,a6)
	move.w d0,($26,a6)
	move.l d0,($28,a6)
	move.l d0,($2c,a6)
	move.b #$c,(8,a6)
	move.b d0,($30,a6)
	movea.w ($6e88,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e88,a5)
	addq.b #1,($6eb8,a5)
	rts

;==============================================
loc_01c2c8:
	tst.b ($6eb9,a5)
	beq.b loc_01c2dc
	subq.b #1,($6eb9,a5)
	movea.w ($6e8a,a5),a0
	movea.w (a0)+,a4
	move.w a0,($6e8a,a5)

loc_01c2dc:
	rts

;==============================================
loc_01c2de:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b d0,($30,a6)
	move.w d0,($26,a6)
	move.l d0,($28,a6)
	move.l d0,($2c,a6)
	move.b #$10,(8,a6)
	move.b d0,($30,a6)
	movea.w ($6e8a,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e8a,a5)
	addq.b #1,($6eb9,a5)
	rts

;==============================================
loc_01c318:
	tst.b ($6eba,a5)
	beq.b loc_01c32c
	subq.b #1,($6eba,a5)
	movea.w ($6e8c,a5),a0
	movea.w (a0)+,a4
	move.w a0,($6e8c,a5)

loc_01c32c:
	rts

;==============================================
loc_01c32e:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b d0,($30,a6)
	move.w d0,($26,a6)
	move.l d0,($28,a6)
	move.l d0,($2c,a6)
	move.b #$14,(8,a6)
	move.b d0,($30,a6)
	movea.w ($6e8c,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e8c,a5)
	addq.b #1,($6eba,a5)
	rts

;==============================================
loc_01c368:
	tst.b ($6ebb,a5)
	beq.b loc_01c37c
	subq.b #1,($6ebb,a5)
	movea.w ($6e8e,a5),a0
	movea.w (a0)+,a4
	move.w a0,($6e8e,a5)

loc_01c37c:
	rts

;==============================================
loc_01c37e:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b d0,($30,a6)
	move.w d0,($26,a6)
	move.b #$18,(8,a6)
	movea.w ($6e8e,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e8e,a5)
	addq.b #1,($6ebb,a5)
	rts

;==============================================
loc_01c3ac:
	tst.b ($6ebc,a5)
	beq.b loc_01c3c0
	subq.b #1,($6ebc,a5)
	movea.w ($6e90,a5),a0
	movea.w (a0)+,a4
	move.w a0,($6e90,a5)

loc_01c3c0:
	rts

;==============================================
loc_01c3c2:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b #$1c,(8,a6)
	movea.w ($6e90,a5),a0
	move.w a6,-(a0)
	move.w a0,($6e90,a5)
	addq.b #1,($6ebc,a5)
	rts

;==============================================
loc_01c3e8:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_01c3f0
	moveq #-1,d2

loc_01c3f0:
	movea.l #loc_01cdd2,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01c3fe:
	moveq #0,d0
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l $900000,a1
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_01c414:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_01c438
	cmpi.b #$7f,d0
	beq.b loc_01c3fe
	tst.b d2
	beq.b loc_01c428
	move.b #$20,d0

loc_01c428:
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	bra.b loc_01c414

loc_01c438:
	rts

;==============================================
loc_01c43a:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_01c442
	moveq #-1,d2

loc_01c442:
	movea.l #loc_01deda,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01c450:
	moveq #0,d0
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l $900000,a1
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_01c466:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_01c4a4
	cmpi.b #$7f,d0
	beq.b loc_01c450
	tst.b d2
	bne.b loc_01c47c
	subi.b #$20,d0
	bcc.b loc_01c47e

loc_01c47c:
	moveq #0,d0

loc_01c47e:
	add.w d0,d0
	lea.l loc_01c52a(pc),a2
	move.w (a2,d0.w),d0
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	addi.w #$10,d0
	move.w d0,(4,a1)
	move.w d1,(6,a1)
	lea.l ($80,a1),a1
	bra.b loc_01c466

loc_01c4a4:
	rts

;==============================================
;Unused Text render
loc_01c4a6:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_01c4ae
	moveq #-1,d2

loc_01c4ae:
	movea.l #loc_01df34,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_01c4bc:
	moveq #0,d0
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l $900000,a1
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_01c4d2:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_01c528
	cmpi.b #$7f,d0
	beq.b loc_01c4bc
	tst.b d2
	bne.b loc_01c4e8
	subi.b #$20,d0
	bcc.b loc_01c4ea

loc_01c4e8:
	moveq #0,d0

loc_01c4ea:
	add.w d0,d0
	lea.l loc_01c5ea(pc),a2
	move.w (a2,d0.w),d0
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	addi.w #$10,d0
	move.w d0,(4,a1)
	move.w d1,(6,a1)
	subi.w #$f,d0
	move.w d0,($80,a1)
	move.w d1,($82,a1)
	addi.w #$10,d0
	move.w d0,($84,a1)
	move.w d1,($86,a1)
	lea.l ($100,a1),a1
	bra.b loc_01c4d2

loc_01c528:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01c52a:
	dc.w $0080,$0081,$0082,$0083,$0084,$0085,$0086,$0087
	dc.w $0088,$0089,$008a,$008b,$008c,$008d,$008e,$008f
	dc.w $00a0,$00a1,$00a2,$00a3,$00a4,$00a5,$00a6,$00a7
	dc.w $00a8,$00a9,$00aa,$00ab,$00ac,$00ad,$00ae,$00af
	dc.w $00c0,$00c1,$00c2,$00c3,$00c4,$00c5,$00c6,$00c7
	dc.w $00c8,$00c9,$00ca,$00cb,$00cc,$00cd,$00ce,$00cf
	dc.w $00e0,$00e1,$00e2,$00e3,$00e4,$00e5,$00e6,$00e7
	dc.w $00e8,$00e9,$00ea,$00eb,$00ec,$00ed,$00ee,$00ef
	dc.w $0100,$0101,$0102,$0103,$0104,$0105,$0106,$0107
	dc.w $0108,$0109,$010a,$010b,$010c,$010d,$010e,$010f
	dc.w $0120,$0121,$0122,$0123,$0124,$0125,$0126,$0127
	dc.w $0128,$0129,$012a,$012b,$012c,$012d,$012e,$012f

loc_01c5ea:
	dc.w $024a,$0238,$023a,$023c,$023e,$0250,$0252,$0254
	dc.w $0256,$0258,$0290,$0270,$025c,$0272,$025a,$027e
	dc.w $01b0,$01b2,$01b4,$01b6,$01b8,$01ba,$01bc,$01be
	dc.w $01d0,$01d2,$027a,$027c,$024a,$0278,$024a,$0296
	dc.w $02ba,$01d4,$01d6,$01d8,$01da,$01dc,$01de,$01f0
	dc.w $01f2,$01f4,$01f6,$01f8,$01fa,$01fc,$01fe,$0210
	dc.w $0212,$0214,$0216,$0218,$021a,$021c,$021e,$0230
	dc.w $0232,$0234,$0236,$02b4,$02b6,$02b8,$02b2,$0292
	dc.w $02b0,$024a,$024a,$024a,$024a,$024a,$024a,$024a
	dc.w $024a,$024a,$024a,$024a,$024a,$024a,$024a,$024a
	dc.w $024a,$024a,$024a,$024a,$024a,$024a,$024a,$024a
	dc.w $024a,$024a,$024a,$024a,$024a,$024a,$02d2,$024a

;==============================================
loc_01c6aa:
	moveq #$44,d0
	moveq #$1b,d1
	jsr loc_00141a
	tst.b ($85,a5)
	beq.b loc_01c6f2
	moveq #0,d0
	lea.l (-$5d1e,a5),a6
	bsr.w loc_01cb38
	bsr.w loc_01cc4a
	moveq #0,d7
	movea.w ($71b6,a5),a0
	bsr.w loc_01c6f4
	bsr.w loc_01c7b0
	bsr.w loc_01c7e4
	bsr.w loc_01c838
	bsr.w loc_01c86e
	tst.w d7
	beq.b loc_01c6f2
	add.w d7,($71be,a5)
	add.w d7,($71ba,a5)
	move.w a0,($71b6,a5)

loc_01c6f2:
	rts

;==============================================
loc_01c6f4:
	btst.b #4,($1c2,a5)
	beq.w loc_01c7ae
	move.l #$5053484c,d0
	moveq #$48,d2
	moveq #$38,d3
	moveq #$c,d5
	moveq #$c,d6
	sub.b ($6eb6,a5),d6
	bsr.b loc_01c788
	move.l #$4553484c,d0
	moveq #$48,d2
	moveq #$40,d3
	moveq #$c,d5
	moveq #$c,d6
	sub.b ($6eb7,a5),d6
	bsr.b loc_01c788
	move.l #$5349474e,d0
	moveq #$48,d2
	moveq #$48,d3
	moveq #8,d5
	moveq #8,d6
	sub.b ($6eb8,a5),d6
	bsr.b loc_01c788
	move.l #$53455420,d0
	moveq #$48,d2
	moveq #$50,d3
	moveq #$20,d5
	moveq #$20,d6
	sub.b ($6eb9,a5),d6
	bsr.b loc_01c788
	move.l #$534f424a,d0
	moveq #$48,d2
	moveq #$58,d3
	moveq #$10,d5
	moveq #$10,d6
	sub.b ($6eba,a5),d6
	bsr.b loc_01c788
	move.l #$45464354,d0
	moveq #$48,d2
	moveq #$60,d3
	moveq #$10,d5
	moveq #$10,d6
	sub.b ($6ebb,a5),d6
	bsr.b loc_01c788
	move.l #$5652414d,d0
	moveq #$48,d2
	moveq #$68,d3
	moveq #7,d5
	moveq #7,d6
	sub.b ($6ebc,a5),d6

loc_01c788:
	moveq #$15,d1
	bsr.w loc_01ccfe
	addq.w #8,d2
	moveq #$16,d1
	cmp.b d5,d6
	bne.b loc_01c798
	moveq #$17,d1

loc_01c798:
	move.l d6,d0
	bsr.w loc_01cd2e
	moveq #$15,d1
	move.b #$2f,d0
	bsr.w loc_01ccf2
	move.l d5,d0
	bra.w loc_01cd2e

loc_01c7ae:
	rts

;==============================================
loc_01c7b0:
	btst.b #3,($1c2,a5)
	beq.b loc_01c7e2
	lea.l (Sound_Buffer_Start,a5),a4
	move.w ($6e82,a5),d5
	moveq #$38,d3
	moveq #9,d6

loc_01c7c4:
	subi.w #$10,d5
	andi.w #$ff0,d5
	move.w (2,a4,d5.w),d0
	moveq #$19,d1
	move.w #$198,d2
	jsr loc_01cd62(pc)
	nop
	addq.w #8,d3
	dbra d6,loc_01c7c4

loc_01c7e2:
	rts

;==============================================
loc_01c7e4:
	btst.b #6,($1c2,a5)
	beq.b loc_01c836
	subq.b #1,(-$5d16,a5)
	bne.b loc_01c7f6
	clr.w (-$5d18,a5)

loc_01c7f6:
	move.w ($11a,a5),d1
	move.w d1,(-$5d1a,a5)
	cmp.w (-$5d18,a5),d1
	bls.b loc_01c80c
	move.w d1,(-$5d18,a5)
	clr.b (-$5d16,a5)

loc_01c80c:
	move.w (-$5d1a,a5),d0
	move.w #$a0,d2
	moveq #$58,d3
	bsr.w loc_01c820
	move.w (-$5d18,a5),d0
	addq.w #8,d2

loc_01c820:
	andi.l #$0000ffff,d0
	moveq #$16,d1
	cmpi.w #$304,d0
	bcs.b loc_01c832
	move.w #$17,d1

loc_01c832:
	bra.w loc_01cd3e

loc_01c836:
	rts

;==============================================
loc_01c838:
	btst.b #4,($1c2,a5)
	beq.b loc_01c86c
	moveq #$38,d3
	moveq #2,d6
	lea.l ($200,a5),a6

loc_01c848:
	move.w ($10,a6),d0
	moveq #$19,d1
	move.w #$a0,d2
	bsr.w loc_01cd62
	move.w ($14,a6),d0
	moveq #$19,d1
	addq.w #8,d2
	bsr.w loc_01cd62
	addq.w #8,d3
	lea.l ($80,a6),a6
	dbra d6,loc_01c848

loc_01c86c:
	rts

;==============================================
loc_01c86e:
	btst.b #5,($1c2,a5)
	beq.w loc_01caca

loc_01c878:
	moveq #$48,d6
	move.w #$90,d3
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a4
	bsr.b loc_01c898
	move.w #$148,d6
	move.w #$90,d3
	lea.l (p2memory,a5),a6
	lea.l (p1memory,a5),a4

loc_01c898:
	move.w d6,d2
	move.w ($50,a6),d0
	moveq #$16,d1
	cmpi.w #$20,d0
	bge.b loc_01c8ae
	moveq #$17,d1
	tst.w d0
	bpl.b loc_01c8ae
	moveq #0,d0

loc_01c8ae:
	bsr.w loc_01cd62
	addq.w #8,d2
	move.w ($11e,a6),d0
	moveq #$1f,d1
	cmpi.w #$30,d0
	bcs.b loc_01c8d2
	moveq #$16,d1
	cmpi.w #$60,d0
	bcs.b loc_01c8d2
	moveq #$15,d1
	cmpi.w #$90,d0
	bcs.b loc_01c8d2
	moveq #$17,d1

loc_01c8d2:
	bsr.w loc_01cd62
	addq.w #8,d2
	moveq #$1f,d1
	move.l #$4c414e44,d0
	tst.b ($31,a6)
	beq.b loc_01c8ee
	moveq #$15,d1
	move.l #$4a554d50,d0

loc_01c8ee:
	bsr.w loc_01ccfe
	addq.w #8,d3
	move.w d6,d2
	move.b ($2cc,a6),d0
	moveq #$16,d1
	bsr.w loc_01cd54
	move.b #$2f,d0
	moveq #$15,d1
	bsr.w loc_01ccf2
	move.b ($2cd,a6),d0
	bsr.w loc_01cd54
	addq.w #8,d2
	move.b ($24c,a6),d0
	sub.b ($24d,a6),d0
	moveq #$16,d1
	bsr.w loc_01cd54
	move.b #$2f,d0
	moveq #$15,d1
	bsr.w loc_01ccf2
	move.b ($24c,a6),d0
	bsr.w loc_01cd54
	moveq #$16,d1
	addq.w #8,d3
	move.w d6,d2
	move.b #$2d,d0
	bsr.w loc_01ccf2
	move.w ($330,a6),d0
	bsr.w loc_01cd54
	addq.w #8,d2
	move.b #$2b,d0
	bsr.w loc_01ccf2
	move.b ($334,a6),d0
	bsr.w loc_01cd54
	addq.w #8,d2
	move.b #$2b,d0
	bsr.w loc_01ccf2
	move.b ($332,a6),d0
	bsr.w loc_01cd54
	addq.w #8,d2
	move.b #$2d,d0
	bsr.w loc_01ccf2
	move.b ($333,a6),d0
	bsr.w loc_01cd54
	addq.w #8,d3
	move.w d6,d2
	tst.b ($2ce,a6)
	bne.b loc_01c990
	tst.b ($2cf,a6)
	bne.b loc_01c9da

loc_01c990:
	moveq #$1f,d1
	move.l #$43414e43,d0
	bsr.w loc_01ccfe
	move.w #$454c,d0
	bsr.w loc_01ccf8
	tst.b ($a9,a6)
	beq.b loc_01c9fe
	move.l (4,a6),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000a00,d0
	bne.b loc_01c9fe
	cmpi.b #2,($80,a6)
	bhi.b loc_01c9fe
	addq.w #8,d2
	move.b ($23e,a6),d1
	bsr.w loc_01cda4
	addq.w #8,d2
	move.b ($293,a6),d1
	bsr.w loc_01cda4
	bra.b loc_01c9fe

loc_01c9da:
	moveq #$15,d1
	move.l #$5049594f,d0
	bsr.w loc_01ccfe
	addq.w #8,d2
	move.l #$54494d45,d0
	bsr.w loc_01ccfe
	addq.w #8,d2
	move.w ($3a,a6),d0
	moveq #$16,d1
	bsr.w loc_01cd54

loc_01c9fe:
	addq.w #8,d3
	move.w d6,d2
	moveq #$1f,d1
	move.l #$4d555445,d0
	bsr.w loc_01ccfe
	move.w #$4b49,d0
	bsr.w loc_01ccf8
	addq.w #8,d2
	moveq #$17,d1
	move.b ($25d,a6),d0
	beq.b loc_01ca22
	moveq #$1f,d1

loc_01ca22:
	bsr.w loc_01cd54
	addq.w #8,d3
	move.w d6,d2
	moveq #$16,d1
	move.w ($10,a6),d0
	bsr.w loc_01cd62
	addq.w #8,d2
	move.w ($14,a6),d0
	bsr.w loc_01cd62
	addq.w #8,d2
	move.w ($21c,a6),d0
	bsr.w loc_01cd62
	tst.b ($125,a6)
	beq.b loc_01caca
	bsr.w loc_01cb1a
	move.w d6,d2
	addq.w #8,d3
	move.w #$656d,d0
	bsr.w loc_01ccf8
	move.b ($102,a6),d0
	bsr.w loc_01cd54
	move.b #$5f,d0
	bsr.w loc_01ccf2

loc_01ca6e:
	move.b (a2)+,d0
	cmpi.b #$20,d0
	beq.b loc_01ca7c
	bsr.w loc_01ccf2
	bra.b loc_01ca6e

loc_01ca7c:
	bsr.b loc_01cacc
	move.w d6,d2
	addq.w #8,d3
	move.b ($127,a6),d0
	moveq #$1f,d1
	cmpi.b #$10,d0
	bcs.b loc_01ca98
	moveq #$17,d1
	cmpi.b #$1f,d0
	beq.b loc_01ca98
	moveq #$15,d1

loc_01ca98:
	bsr.w loc_01cd54
	addq.w #8,d2
	moveq #0,d1
	move.b ($213,a6),d1
	lsr.b #3,d1
	lea.l loc_01cce6(pc),a2
	lea.l (a2,d1.w),a2
	move.b (a2)+,d1
	moveq #2,d5

loc_01cab2:
	moveq #0,d0
	move.b (a2)+,d0
	bsr.w loc_01ccf2
	dbra d5,loc_01cab2
	addq.w #8,d2
	move.l ($230,a6),d0
	moveq #$16,d1
	bra.w loc_01cd68

loc_01caca:
	rts

;==============================================
loc_01cacc:
	moveq #0,d0
	move.b ($204,a6),d0
	move.w loc_01cada(pc,d0.w),d0
	jmp loc_01cada(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01cada:
	dc.w loc_01cae2-loc_01cada
	dc.w loc_01caec-loc_01cada
	dc.w loc_01cafe-loc_01cada
	dc.w loc_01cb12-loc_01cada

;==============================================
loc_01cae2:
	move.b ($205,a6),d0
	lsr.b #1,d0
	bra.w loc_01cd4e

;==============================================
loc_01caec:
	move.b ($205,a6),d0
	lsr.b #1,d0
	bsr.w loc_01cd4e
	move.b ($21f,a6),d0
	bra.w loc_01cd4e

;==============================================
loc_01cafe:
	move.b ($c7,a4),d0
	bmi.b loc_01cb10
	bsr.w loc_01cd4e
	move.b ($21f,a6),d0
	bra.w loc_01cd4e

loc_01cb10:
	rts

;==============================================
loc_01cb12:
	move.b ($21e,a6),d0
	bra.w loc_01cd4e

;==============================================
loc_01cb1a:
	moveq #0,d0
	move.b ($204,a6),d0
	move.w loc_01cb30(pc,d0.w),d1
	lsl.w #2,d0
	lea.l loc_01ccc6(pc),a2
	lea.l (a2,d0.w),a2
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01cb30:
	dc.w $0016,$0017,$001f,$0015

;==============================================
loc_01cb38:
	move.b ($1c0,a5),d0
	andi.b #$18,d0
	lsr.b #2,d0
	cmp.b (a6),d0
	beq.b loc_01cb50
	move.b d0,(a6)
	move.w loc_01cb52(pc,d0.w),d0
	jmp loc_01cb52(pc,d0.w)

loc_01cb50:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01cb52:
	dc.w loc_01cb5a-loc_01cb52
	dc.w loc_01cb92-loc_01cb52
	dc.w loc_01cb6c-loc_01cb52
	dc.w loc_01cbd6-loc_01cb52

;==============================================
loc_01cb5a:
	lea.l $900000,a1
	move.w #$bf,d7
	move.l #$200000,d0
	bra.b loc_01cb7c

;==============================================
loc_01cb6c:
	lea.l $900000,a1
	move.w #$bf,d7
	move.l #$148001f,d0

loc_01cb7c:
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	move.l d0,(a1)+
	dbra d7,loc_01cb7c
	rts

;==============================================
loc_01cb92:
	lea.l $900000,a0
	move.l #$148001d,d0
	move.l #$14e001d,d1
	move.l #$14f001d,d2
	move.l #$20001d,d3
	moveq #$17,d7

loc_01cbb2:
	lea.l (a0),a1
	moveq #$f,d6

loc_01cbb6:
	move.l d0,(a1)
	move.l d1,(4,a1)
	move.l d2,($80,a1)
	move.l d3,($84,a1)
	lea.l (8,a1),a1
	dbra d6,loc_01cbb6
	lea.l ($100,a0),a0
	dbra d7,loc_01cbb2
	rts

;==============================================
loc_01cbd6:
	lea.l $900000,a0
	move.l #$148001b,d0
	move.l #$14e001b,d1
	move.l #$14f001b,d2
	move.l #$20001b,d3
	moveq #$b,d7

loc_01cbf6:
	lea.l (a0),a1
	moveq #7,d6

loc_01cbfa:
	move.l d0,(a1)
	move.l d1,(4,a1)
	move.l d1,(8,a1)
	move.l d1,($c,a1)
	move.l d2,($80,a1)
	move.l d3,($84,a1)
	move.l d3,($88,a1)
	move.l d3,($8c,a1)
	move.l d2,($100,a1)
	move.l d3,($104,a1)
	move.l d3,($108,a1)
	move.l d3,($10c,a1)
	move.l d2,($180,a1)
	move.l d3,($184,a1)
	move.l d3,($188,a1)
	move.l d3,($18c,a1)
	lea.l ($10,a1),a1
	dbra d6,loc_01cbfa
	lea.l ($200,a0),a0
	dbra d7,loc_01cbf6
	rts

;==============================================
loc_01cc4a:
	move.b ($1c0,a5),d0
	andi.b #$19,d0
	beq.b loc_01ccc4
	move.w ($32,a5),d0
	move.w d0,d1
	andi.w #$c0,d1
	cmpi.w #$40,d1
	bne.b loc_01cc70
	move.w d0,d1
	andi.w #$3f,d0
	andi.w #$3f00,d1
	bra.b loc_01cca6

loc_01cc70:
	move.w d0,d1
	andi.w #$300,d1
	cmpi.w #$100,d1
	bne.b loc_01cc88
	move.w d0,d1
	andi.w #$ff,d0
	andi.w #$3c00,d1
	bra.b loc_01cca6

loc_01cc88:
	move.w d0,d1
	andi.w #$c00,d1
	cmpi.w #$400,d1
	bne.b loc_01cca0
	move.w d0,d1
	andi.w #$3ff,d0
	andi.w #$3000,d1
	bra.b loc_01cca6

loc_01cca0:
	andi.w #$0fff,d0
	moveq #0,d1

loc_01cca6:
	lsr.w #2,d1
	ori.w #$1000,d1
	or.w d1,d0
	move.w d0,($32,a5)
	ori.w #$70,($3a,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)

loc_01ccc4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01ccc6:
	dc.b 'taiki   '
	dc.b 'atck    '
	dc.b 'yoke    '
	dc.b 'eye     '

loc_01cce6:
	dc.b $1f,'NML'
	dc.b $15,'MAJ'
	dc.b $17,'ONI'

;==============================================
loc_01ccf2:
	ror.l #8,d0
	moveq #0,d4
	bra.b loc_01cd00

loc_01ccf8:
	swap d0
	moveq #1,d4
	bra.b loc_01cd00

loc_01ccfe:
	moveq #3,d4

loc_01cd00:
	swap d4
	move.w d2,d4
	ori.w #$e000,d4
	move.w d4,(a0)+
	move.w d3,d4
	ori.w #$2000,d4
	move.w d4,(a0)+
	rol.l #8,d0
	move.w d0,d4
	andi.w #$7f,d4
	addi.w #$6e00,d4
	move.w d4,(a0)+
	move.w d1,(a0)+
	addq.w #8,d2
	addq.w #1,d7
	swap d4
	dbra d4,loc_01cd00
	rts

;==============================================
loc_01cd2e:
	move.l d2,d4
	jsr Hex_to_Decimal
	move.l d4,d2
	move.w (-$5d28,a5),d0
	bra.b loc_01cd54

loc_01cd3e:
	move.l d2,d4
	jsr Hex_to_Decimal
	move.l d4,d2
	move.w (-$5d28,a5),d0
	bra.b loc_01cd62

loc_01cd4e:
	ror.l #4,d0
	moveq #0,d4
	bra.b loc_01cd6c

loc_01cd54:
	ror.l #8,d0
	moveq #1,d4
	bra.b loc_01cd6c

loc_01cd5a:
	swap d0
	lsl.l #4,d0
	moveq #2,d4
	bra.b loc_01cd6c

;==============================================
loc_01cd62:
	swap d0
	moveq #3,d4
	bra.b loc_01cd6c

loc_01cd68:
	lsl.l #8,d0
	moveq #5,d4

loc_01cd6c:
	swap d4
	move.w d2,d4
	ori.w #$e000,d4
	move.w d4,(a0)+
	move.w d3,d4
	ori.w #$2000,d4
	move.w d4,(a0)+
	rol.l #4,d0
	move.w d0,d4
	andi.w #$f,d4
	cmpi.w #$a,d4
	bcs.b loc_01cd90
	addi.w #7,d4

loc_01cd90:
	addi.w #$6e30,d4
	move.w d4,(a0)+
	move.w d1,(a0)+
	addq.w #8,d2
	addq.w #1,d7
	swap d4
	dbra d4,loc_01cd6c
	rts

;==============================================
loc_01cda4:
	move.w #$4e47,d0
	tst.b d1
	beq.b loc_01cdb0
	move.w #$4f4b,d0

loc_01cdb0:
	moveq #$19,d1
	bra.w loc_01ccf8

loc_01cdb6:
	moveq #0,d7
	movea.w ($71b6,a5),a0
	bsr.w loc_01c878
	tst.w d7
	beq.b loc_01cdd0
	add.w d7,($71be,a5)
	add.w d7,($71ba,a5)
	move.w a0,($71b6,a5)

loc_01cdd0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
	include "bootuptext.asm"

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01df34:
	dc.w $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020

;==============================================
loc_01df54:
	move.w (8,a5),d0
	move.w loc_01df60(pc,d0.w),d1
	jmp loc_01df60(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01df60:
	dc.w loc_01df68-loc_01df60
	dc.w loc_01e09c-loc_01df60
	dc.w loc_01e446-loc_01df60
	dc.w loc_01e4ba-loc_01df60

;==============================================
loc_01df68:
	move.w ($c,a5),d0
	move.w loc_01df74(pc,d0.w),d1
	jmp loc_01df74(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01df74:
	dc.w loc_01df7c-loc_01df74
	dc.w loc_01dfde-loc_01df74
	dc.w loc_01e05a-loc_01df74
	dc.w loc_01e076-loc_01df74

;==============================================
loc_01df7c:
	move.b #1,($ab,a5)
	tst.b ($8b,a5)
	beq.b loc_01df90
	addq.w #2,(8,a5)
	bra.w loc_01e09c

loc_01df90:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($a,a5)
	move.w d0,($e,a5)
	move.w d0,($10,a5)
	move.w d0,($14,a5)
	move.b d0,($15,a5)
	move.b d0,($16,a5)
	move.b d0,($17,a5)
	move.b d0,($12,a5)
	move.b #1,($13,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	move.w #$1b00,($32,a5)
	moveq #8,d0
	jmp loc_0039e0

;==============================================
loc_01dfde:
	addq.w #2,($c,a5)
	jsr loc_01b0e6
	jsr loc_01bdd0
	lea.l (p1memory,a5),a6
	bsr.w loc_01e1b2
	lea.l (p2memory,a5),a6
	bsr.w loc_01e1b2
	move.w #0,($210,a5)
	move.w #$100,($214,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	bsr.w loc_01e256
	move.w #2,($128,a5)
	jsr loc_01fa5e
	bra.w loc_01e1f4

;==============================================
loc_01e05a:
	addq.w #2,($c,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	jmp loc_01738a

;==============================================
loc_01e076:
	tst.b ($182,a5)
	bne.b loc_01e09a
	addq.w #4,(8,a5)
	clr.l ($c,a5)
	bsr.w loc_01e296
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

loc_01e09a:
	rts

;==============================================
loc_01e09c:
	move.w ($c,a5),d0
	move.w loc_01e0a8(pc,d0.w),d1
	jmp loc_01e0a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e0a8:
	dc.w loc_01e0ac-loc_01e0a8
	dc.w loc_01e19c-loc_01e0a8

;==============================================
loc_01e0ac:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w #$10,($a,a5)
	move.w d0,($e,a5)
	move.w d0,($10,a5)
	move.w d0,($14,a5)
	move.b d0,($15,a5)
	move.b d0,($16,a5)
	move.b d0,($17,a5)
	move.b d0,($12,a5)
	move.b #1,($13,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.w #0,($210,a5)
	move.w #$100,($214,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	jsr loc_01b13a
	jsr loc_01b19c
	jsr loc_01b208
	bsr.w loc_01e256
	move.w #2,($128,a5)
	jsr loc_01fcaa
	bsr.w loc_01e1f4
	jsr loc_01bdd0
	lea.l (p1memory,a5),a6
	bsr.w loc_01e1b2
	lea.l (p2memory,a5),a6
	bsr.w loc_01e1b2
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	jsr loc_01e296(pc)
	nop
	clr.b ($8b,a5)
	moveq #8,d0
	jsr loc_0039e0
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

;==============================================
loc_01e19c:
	subq.w #1,($a,a5)
	bne.b loc_01e1b0
	addq.w #2,(8,a5)
	moveq #0,d0
	move.w d0,($a,a5)
	move.l d0,($c,a5)

loc_01e1b0:
	rts

;==============================================
;
;==============================================
loc_01e1b2:
	moveq #0,d0
	move.l d0,(4,a6)
	move.b d0,($3f,a6)
	move.b d0,($31,a6)
	move.b d0,($3e,a6)
	move.b d0,($5e,a6)
	andi.b #3,($15b,a6)
	cmpi.b #3,(Dip_Game_Turbo,a5)
	bcc.w loc_01e1de
	bset.b #2,($15b,a6)

loc_01e1de:
	move.b ($15b,a6),($3c,a6)
	cmpi.b #$13,($102,a6)
	bne.b loc_01e1f2
	move.b #$11,($102,a6)

loc_01e1f2:
	rts

;==============================================
loc_01e1f4:
	move.w ($176,a5),d0
	move.w d0,d4
	move.w d0,d1
	lsl.w #3,d0
	add.w d1,d0
	add.w d1,d0
	add.w d1,d0
	lsl.w #5,d0
	lea.l loc_35e854,a0
	lea.l (a0,d0.w),a0
	lea.l $90c280,a1
	moveq #$a,d7
	jsr loc_01b7c0
	move.w d4,d0
	add.w d0,d4
	add.w d0,d4
	lsl.w #5,d4
	lea.l loc_363cf4,a0
	lea.l (a0,d4.w),a0
	lea.l $90c800,a1
	moveq #0,d7
	jsr loc_01b7c0
	lea.l loc_364b34,a0
	lea.l (a0,d4.w),a0
	lea.l $90cc00,a1
	moveq #0,d7
	jmp loc_01b7c0

;==============================================
loc_01e256:
	move.w #$86,d0
	lea.l $904000,a1
	jsr loc_018f20
	move.w #$87,d0
	lea.l $904400,a1
	jsr loc_018f20
	move.w #$81,d0
	lea.l $908000,a1
	jsr loc_0190d2
	move.w #$82,d0
	lea.l $908100,a1
	jmp loc_0190d2

;==============================================
loc_01e296:
	cmpi.b #$12,($6eb9,a5)
	bcs.w loc_01e444

	jsr loc_01c2c8;2a0
	addq.b #1,(a4)
	move.w #$1001,(2,a4)
	move.w #$8400,($38,a4)
	move.b #0,($a,a4)

	jsr loc_01c2c8;2ba
	addq.b #1,(a4)
	move.w #$1001,(2,a4)
	move.w #$8800,($38,a4)
	move.b #0,($a,a4)

	jsr loc_01c2c8;2d4
	addq.b #1,(a4)
	move.w #$1000,(2,a4)
	move.b #0,($a,a4)

	jsr loc_01c2c8;2e8
	addq.b #1,(a4)
	move.w #$1000,(2,a4)
	move.b #1,($a,a4)

	jsr loc_01c2c8;2fc
	addq.b #1,(a4)
	move.w #$1001,(2,a4)
	move.w #$8400,($38,a4)
	move.b #1,($a,a4)

	jsr loc_01c2c8;316
	addq.b #1,(a4)
	move.w #$1001,(2,a4)
	move.w #$8800,($38,a4)
	move.b #1,($a,a4)

	jsr loc_01c2c8;330
	addq.b #1,(a4)
	move.w #$1005,(2,a4)
	move.w #$8400,($38,a4)
	move.b ($8b,a5),($a,a4)

	jsr loc_01c2c8;34a
	addq.b #1,(a4)
	move.w #$1005,(2,a4)
	move.w #$8800,($38,a4)
	move.b ($8b,a5),($a,a4)

	jsr loc_01c2c8;364
	addq.b #1,(a4)
	move.w #$1006,(2,a4)
	move.w #$8400,($38,a4)

	jsr loc_01c2c8;378
	addq.b #1,(a4)
	move.w #$1006,(2,a4)
	move.w #$8800,($38,a4)

	jsr loc_01c2c8;38c
	addq.b #1,(a4)
	move.w #$1002,(2,a4)
	move.w #$8400,($38,a4)
	move.b #0,($a,a4)

	jsr loc_01c2c8;3a6
	addq.b #1,(a4)
	move.w #$1002,(2,a4)
	move.w #$8800,($38,a4)
	move.b #0,($a,a4)

	jsr loc_01c2c8;3c0
	addq.b #1,(a4)
	move.w #$1002,(2,a4)
	move.w #$8400,($38,a4)
	move.b #1,($a,a4)

	jsr loc_01c2c8;3da
	addq.b #1,(a4)
	move.w #$1002,(2,a4)
	move.w #$8800,($38,a4)
	move.b #1,($a,a4)

	jsr loc_01c2c8;3f4
	addq.b #1,(a4)
	move.w #$1003,(2,a4)
	move.w #$8400,($38,a4)

	jsr loc_01c2c8;408
	addq.b #1,(a4)
	move.w #$1003,(2,a4)
	move.w #$8800,($38,a4)

	jsr loc_01c2c8;41c
	addq.b #1,(a4)
	move.w #$1004,(2,a4)
	move.w #$8400,($38,a4)

	jsr loc_01c2c8;430
	addq.b #1,(a4)
	move.w #$1004,(2,a4)
	move.w #$8800,($38,a4)

loc_01e444:
	rts

;==============================================
loc_01e446:
	move.w ($c,a5),d0
	move.w loc_01e464(pc,d0.w),d1
	jsr loc_01e464(pc,d1.w)
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e464:
	dc.w loc_01e468-loc_01e464
	dc.w loc_01e47a-loc_01e464

;==============================================
loc_01e468:
	cmpi.b #3,($17,a5)
	bne.b loc_01e4b8
	addq.w #2,($c,a5)
	jsr loc_003c94

loc_01e47a:
	lea.l (p2memory,a5),a4
	lea.l (p1memory,a5),a6
	bsr.w loc_01e56e
	lea.l (p1memory,a5),a4
	lea.l (p2memory,a5),a6
	bsr.w loc_01e56e
	move.b ($ac,a5),d0
	or.b ($8d,a5),d0
	cmp.b ($15,a5),d0
	bne.b loc_01e4b8
	addq.w #2,(8,a5)
	clr.w ($c,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b #1,($16,a5)

loc_01e4b8:
	rts

;==============================================
loc_01e4ba:
	move.w ($c,a5),d0
	move.w loc_01e4c6(pc,d0.w),d1
	jmp loc_01e4c6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e4c6:
	dc.w loc_01e4ca-loc_01e4c6
	dc.w loc_01e4d4-loc_01e4c6

;==============================================
loc_01e4ca:
	addq.w #2,($c,a5)
	move.w #$20,($e,a5)

loc_01e4d4:
	subq.w #1,($e,a5)
	bne.b loc_01e53c
	addq.w #2,(4,a5)
	tst.b ($bf,a5)
	bne.b loc_01e50e
	cmpi.b #4,(game_unlock,a5)
	bcs.b loc_01e50e
	tst.b (Dramatic_Mode_flag,a5)
	bne.b loc_01e50e
	btst.b #0,($8d,a5)
	beq.b loc_01e500
	lea.l (p1memory,a5),a0
	bsr.b loc_01e54e

loc_01e500:
	btst.b #1,($8d,a5)
	beq.b loc_01e50e
	lea.l (p2memory,a5),a0
	bsr.b loc_01e54e

loc_01e50e:
	moveq #0,d0
	move.w d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($ab,a5)
	jsr loc_00b778
	moveq #0,d0
	move.b d0,($8d,a5)
	jsr loc_009178
	jmp loc_01bdd0

loc_01e53c:
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

;==============================================
loc_01e54e:
	tst.b ($14b,a0)
	bne.b loc_01e56c
	cmpi.w #$a500,($11a,a0)
	bne.b loc_01e56c
	moveq #-1,d0
	move.l d0,($140,a0)
	move.b d0,($149,a0)
	move.b #1,($111,a5)

loc_01e56c:
	rts

;==============================================
loc_01e56e:
	moveq #0,d0
	move.b ($101,a6),d0
	move.b ($ac,a5),d1
	or.b ($8d,a5),d1
	btst.l d0,d1
	beq.b loc_01e58c
	move.b (4,a6),d0
	move.w loc_01e58e(pc,d0.w),d1
	jmp loc_01e58e(pc,d1.w)

loc_01e58c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e58e:
	dc.w loc_01e596-loc_01e58e
	dc.w loc_01ea12-loc_01e58e
	dc.w loc_01eb2c-loc_01e58e
	dc.w loc_01ebfe-loc_01e58e

;==============================================
loc_01e596:
	move.b (5,a6),d0
	move.w loc_01e5a2(pc,d0.w),d1
	jmp loc_01e5a2(pc,d1.w)

;==============================================
loc_01e5a2:
	dc.w loc_01e5a8-loc_01e5a2
	dc.w loc_01e652-loc_01e5a2
	dc.w loc_01e862-loc_01e5a2

;==============================================
loc_01e5a8:
	moveq #0,d1
	move.b d1,($3f,a6)
	move.b d1,($31,a6)
	move.b d1,($3e,a6)
	move.b d1,($5e,a6)
	move.b ($102,a6),d1
	move.b ($15c,a6),d0
	beq.b loc_01e5d6
	move.b d0,d1
	andi.b #$80,d0
	move.b d0,($5e,a6)
	andi.w #$23,d1
	move.b d1,($3f,a6)

loc_01e5d6:
	add.w d1,d1
	move.b loc_01e60a(pc,d1.w),d0
	move.b loc_01e60a+1(pc,d1.w),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	btst.b #0,($15b,a6)
	beq.b loc_01e5f8
	addq.b #2,(4,a6)
	bra.w loc_01ea12

loc_01e5f8:
	addq.b #2,(5,a6)
	move.w #$4b0,($3a,a6)
	move.b ($3f,a6),($15c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Character Selected Location
loc_01e60a:
	dc.b 00,03;00 Ryu
	dc.b 06,03;01 Ken
	dc.b 05,02;02 Akuma
	dc.b 02,01;03 Nash
	dc.b 03,01;04 Chun
	dc.b 04,04;05 Adon
	dc.b 02,04;06 Sodom
	dc.b 02,02;07 Guy
	dc.b 04,02;08 Bridie
	dc.b 03,06;09 Rose
	dc.b 03,00;0a Dic
	dc.b 04,01;0b Sagat
	dc.b 01,02;0c Dan

	dc.b 03,05;0d Sakura
	dc.b 02,05;0e Rolento
	dc.b 01,04;0f Dhalsim
	dc.b 05,04;10 Zangief
	dc.b 04,05;11 Gen

	dc.b 03,01;12 sf2-Chun

	dc.b 04,05;13 Gen 2

	dc.b 02,04;14 Sword Sodom

	dc.b 00,00;15 Boxer
	dc.b 03,04;16 Cammy

	dc.b 00,00;17 Evil Ryu

	dc.b 01,03;18 E.Honda
	dc.b 05,03;19 Blanka
	dc.b 03,02;1a R.Mika
	dc.b 02,03;1b Cody
	dc.b 04,03;1c Claw
	dc.b 03,03;1d Karin

	dc.b 00,00;1e Juli
	dc.b 00,00;1f Juni

;Random Select
	dc.b 01,01;p1 upper
	dc.b 05,05;p1 bottom
	dc.b 05,01;p2 upper
	dc.b 01,05;p2 bottom

;==============================================
loc_01e652:
	moveq #0,d2
	move.w #$100,d1
	subq.w #1,($3a,a6)
	beq.w loc_01e764
	bsr.w loc_01e944
	move.w ($11c,a6),d0
	not.w d0
	move.w (PL_Buttons,a6),d2
	and.w d2,d0
	andi.w #$770f,d0
	beq.b loc_01e686
	move.w d0,d1
	andi.w #$7700,d1
	bne.w loc_01e764
	andi.w #$f,d0
	bne.b loc_01e696

loc_01e686
	tst.b ($3f,a6)
	beq.b loc_01e694
	bsr.w loc_01e898
	move.b d0,(PL_charid,a6)

loc_01e694:
	rts

loc_01e696:
	move.w (PL_X,a6),d2
	move.w (PL_Y,a6),d3

loc_01e69e:
	btst #3,d0
	beq.b loc_01e6a6
	subq.w #1,d3

loc_01e6a6:
	btst #2,d0
	beq.b loc_01e6ae
	addq.w #1,d3

loc_01e6ae:
	btst #1,d0
	beq.b loc_01e6b6
	subq.w #1,d2

loc_01e6b6:
	btst #0,d0
	beq.b loc_01e6be
	addq.w #1,d2

loc_01e6be:
	andi.w #7,d2
	andi.w #7,d3
	move.w d3,d1
	lsl.w #3,d1
	add.w d2,d1
	move.b Char_ID_SEL_TBL(pc,d1.w),d1
	cmpi.b #$3f,d1
	beq.b loc_01e69e
	move.b d1,d0
	moveq #6,d1
	add.b ($101,a6),d1
	btst.l d1,d0
	bne.b loc_01e722
	clr.b ($3f,a6)
	clr.b ($15c,a6)
	clr.b ($5e,a6)
	btst #5,d0
	beq.b loc_01e700
	andi.b #$23,d0
	move.b d0,($3f,a6)
	bsr.w loc_01e898

loc_01e700:
	move.b d0,(PL_charid,a6)
	move.w d2,(PL_X,a6)
	move.w d3,(PL_Y,a6)
	moveq #0,d1
	cmp.b ($160,a6),d0
	bne.b loc_01e71e
	tst.b ($3f,a6)
	bne.b loc_01e71e
	move.b ($162,a6),d1

loc_01e71e:
	move.b d1,(PL_ism_choice,a6)

loc_01e722:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Character Select IDtable
Char_ID_SEL_TBL:
	dc.b $ff,$ff,$ff,$0a,$ff,$ff,$ff,$ff
	dc.b $ff,$a0,$03,$04,$0b,$62,$ff,$ff
	dc.b $ff,$0c,$07,$1a,$08,$02,$ff,$ff
	dc.b $00,$18,$1b,$1d,$1c,$19,$01,$3f
	dc.b $ff,$0f,$06,$16,$05,$10,$ff,$ff
	dc.b $ff,$63,$0e,$0d,$11,$a1,$ff,$ff
	dc.b $ff,$ff,$ff,$09,$ff,$ff,$ff,$ff
	dc.b $ff,$ff,$ff,$3f,$ff,$ff,$ff,$ff

;==============================================
loc_01e764:
	addq.b #2,(5,a6)
	bset.b #0,($3c,a6)
	bsr.w loc_01e97c
	move.b (PL_charid,a6),d0
	cmp.b ($160,a6),d0
	beq.b loc_01e784
	clr.l ($140,a6)
	clr.b ($149,a6)

loc_01e784:
	move.b d0,($160,a6)
	tst.b ($bf,a5)
	bne.b loc_01e7c4
	cmpi.b #4,(game_unlock,a5)
	bcs.b loc_01e7b0
	tst.b (Dramatic_Mode_flag,a5)
	beq.b loc_01e7b0
	move.w d1,($378,a6)
	btst.b #1,($3c,a4)
	beq.b loc_01e7b0
	move.b (PL_ism_choice,a4),(PL_ism_choice,a6)
	bra.b Palette_Set_Classic_mode

loc_01e7b0:
	cmpi.b #2,(game_unlock,a5)
	bcs.b loc_01e7c4
	tst.b ($15e,a6)
	beq.b loc_01e7c4
	st.b (PL_ism_choice,a6)
	bra.b Palette_Set_Classic_mode

loc_01e7c4:
	tst.b ($3f,a6)
	beq.b loc_01e83a
	tst.b ($3e,a6)
	bne.b loc_01e83a
	tst.b ($5e,a6)
	bne.b loc_01e83a
	tst.b ($15c,a6)
	bne.b Palette_Set_Classic_mode
;
	move.b ($81,a5),d0
	andi.w #$f,d0
	move.b ($3f,a6),d3
	andi.w #1,d3
	lsl.w #4,d3
	add.w d3,d0
	move.b loc_01e842(pc,d0.w),(PL_ism_choice,a6)

Palette_Set_Classic_mode:
	moveq #0,d0
	andi.w #$700,d1
	bne.b loc_01e800
	moveq #1,d0

loc_01e800:
	btst.b #1,($3c,a4)
	beq.b loc_01e826
	move.b (PL_charid,a4),d1
	cmp.b (PL_charid,a6),d1
	bne.b loc_01e826
	move.b (PL_ism_choice,a4),d1
	cmp.b (PL_ism_choice,a6),d1
	bne.b loc_01e826
	cmp.b (PL_Palnum,a4),d0
	bne.b loc_01e826
	eori.b #1,d0


loc_01e826:
	move.b d0,(PL_Palnum,a6)
	move.b d0,($161,a6)
	bset.b #1,($3c,a6)
	move.b (PL_ism_choice,a6),($162,a6)

loc_01e83a:
	move.w #$20,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e842:
	dc.b $ff,$ff,$00,$00
	dc.b $01,$01,$01,$ff
	dc.b $ff,$ff,$00,$00
	dc.b $00,$01,$01,$01
	dc.b $ff,$ff,$ff,$00
	dc.b $00,$01,$01,$ff
	dc.b $ff,$ff,$00,$00
	dc.b $00,$01,$01,$01

;==============================================
loc_01e862:
	subq.w #1,($3a,a6)
	bne.b loc_01e896
	addq.b #2,(4,a6)
	clr.b (5,a6)
	bset.b #0,($15b,a6)
	moveq #0,d1
	move.b ($3f,a6),d0
	beq.b loc_01e882
	move.b ($5e,a6),d1

loc_01e882:
	or.b d1,d0
	move.b d0,($15c,a6)
	btst.b #1,($3c,a6)
	beq.b loc_01e896
	bset.b #1,($15b,a6)

loc_01e896:
	rts

;==============================================
loc_01e898:
	move.b (PL_charid,a6),d0
	tst.b ($15c,a6)
	bne.b loc_01e8c2
	jsr RNGFunction
	andi.w #$3f,d0
	tst.b ($bf,a5)
	bne.b loc_01e8be
	cmpi.b #1,(game_unlock,a5)
	bcs.b loc_01e8be
	addi.w #$40,d0

loc_01e8be:
	move.b loc_01e8c4(pc,d0.w),d0

loc_01e8c2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e8c4:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$16,$18
	dc.b $19,$1a,$1b,$1c
	dc.b $1d,$00,$01,$02
	dc.b $03,$04,$05,$06
	dc.b $07,$08,$09,$0a
	dc.b $0b,$0c,$0d,$0e
	dc.b $0f,$10,$11,$16
	dc.b $18,$19,$1a,$1b
	dc.b $1c,$1d,$16,$18
	dc.b $19,$1a,$1b,$1c
	dc.b $1d,$03,$04,$05
	dc.b $06,$07,$08,$09
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$15,$16
	dc.b $18,$19,$1a,$1b
	dc.b $1c,$1d,$1e,$1f
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$15,$16
	dc.b $18,$19,$1a,$1b
	dc.b $1c,$1d,$1e,$1f
	dc.b $1a,$16,$18,$19
	dc.b $1a,$1b,$1c,$1d

;==============================================
loc_01e944:
	tst.b ($bf,a5)
	bne.b loc_01e976
	cmpi.b #1,(game_unlock,a5)
	bcs.b loc_01e976
	move.w ($10,a6),d0
	cmp.w ($14,a6),d0
	bne.b loc_01e976
	cmpi.w #3,d0
	bne.b loc_01e976
	addq.b #1,($31,a6)
	cmpi.b #$3c,($31,a6)
	bcs.b loc_01e97a
	move.b #1,($3e,a6)
	bra.b loc_01e97a

loc_01e976:
	clr.b ($31,a6)

loc_01e97a:
	rts

;==============================================
loc_01e97c:
	tst.b ($bf,a5)
	bne.b loc_01e9c4
	tst.b ($3e,a6)
	beq.b loc_01e9c4
	move.b ($3f,a6),d3
	beq.b loc_01e9c4
	tst.b ($15c,a6)
	bne.b loc_01e9c4
	andi.w #$800f,d2
	beq.b loc_01e9c4
	moveq #$15,d0
	btst #$f,d2
	bne.b loc_01e9b2
	andi.w #3,d3
	add.w d3,d3
	move.w loc_01e9ca(pc,d3.w),d3
	jsr loc_01e9ca(pc,d3.w)
	beq.b loc_01e9c4

loc_01e9b2:
	move.b d0,($102,a6)
	move.b #1,($3e,a6)
	move.b #$80,($5e,a6)
	rts

loc_01e9c4:
	clr.b ($3e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01e9ca:
	dc.w loc_01e9d2-loc_01e9ca
	dc.w loc_01e9e2-loc_01e9ca
	dc.w loc_01e9f2-loc_01e9ca
	dc.w loc_01ea02-loc_01e9ca

;==============================================
loc_01e9d2:
	moveq #$1e,d0
	btst #3,d2
	bne.b loc_01e9e0
	moveq #$1f,d0
	btst #1,d2

loc_01e9e0:
	rts

;==============================================
loc_01e9e2:
	moveq #$1e,d0
	btst #2,d2
	bne.b loc_01e9f0
	moveq #$1f,d0
	btst #0,d2

loc_01e9f0:
	rts

;==============================================
loc_01e9f2:
	moveq #$1e,d0
	btst #3,d2
	bne.b loc_01ea00
	moveq #$1f,d0
	btst #0,d2

loc_01ea00:
	rts

;==============================================
loc_01ea02:
	moveq #$1e,d0
	btst #2,d2
	bne.b loc_01ea10
	moveq #$1f,d0
	btst #1,d2

loc_01ea10:
	rts

;==============================================
loc_01ea12:
	move.b (5,a6),d0
	move.w loc_01ea1e(pc,d0.w),d1
	jmp loc_01ea1e(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01ea1e:
	dc.w loc_01ea24-loc_01ea1e
	dc.w loc_01ea44-loc_01ea1e
	dc.w loc_01eb16-loc_01ea1e

;==============================================
loc_01ea24:
	btst.b #1,($15b,a6)
	beq.b loc_01ea34
	addq.b #2,(4,a6)
	bra.w loc_01eb2c

loc_01ea34:
	addq.b #2,(5,a6)
	move.w #$258,($3a,a6)
	jmp loc_003cae

;==============================================
loc_01ea44:
	move.w #$100,d1
	subq.w #1,($3a,a6)
	beq.w loc_01eac6
	tst.b ($bf,a5)
	bne.b loc_01ea7a
	cmpi.b #4,(game_unlock,a5)
	bcs.b loc_01ea7a
	tst.b (Dramatic_Mode_flag,a5)
	beq.b loc_01ea7a
	btst.b #1,($3c,a4)
	beq.b loc_01ea7a
	move.w ($378,a6),d1
	move.b (PL_ism_choice,a4),(PL_ism_choice,a6)
	bra.w loc_01eac6

loc_01ea7a:
	move.w ($11c,a6),d0
	not.w d0
	and.w (PL_Buttons,a6),d0
	andi.w #$770c,d0
	beq.b loc_01ea9a
	move.w d0,d1
	andi.w #$7700,d1
	bne.w loc_01eac6
	andi.w #$c,d0
	bne.b loc_01ea9c

loc_01ea9a:
	rts

loc_01ea9c:
	move.b (PL_ism_choice,a6),d1
	btst #3,d0
	beq.b loc_01eab0
	subq.b #1,d1
	cmpi.b #-1,d1
	bge.b loc_01eab0
	moveq #1,d1

loc_01eab0:
	btst #2,d0
	beq.b loc_01eac0
	addq.b #1,d1
	cmpi.b #1,d1
	ble.b loc_01eac0
	moveq #-1,d1

loc_01eac0:
	move.b d1,(PL_ism_choice,a6)
	rts

loc_01eac6:
	addq.b #2,(5,a6)
	moveq #0,d0
	andi.w #$700,d1
	bne.b loc_01ead4
	moveq #1,d0

loc_01ead4:
	btst.b #1,($3c,a4)
	beq.b loc_01eafa
	move.b ($102,a4),d1
	cmp.b ($102,a6),d1
	bne.b loc_01eafa
	move.b (PL_ism_choice,a4),d1
	cmp.b (PL_ism_choice,a6),d1
	bne.b loc_01eafa
	cmp.b ($128,a4),d0
	bne.b loc_01eafa
	eori.b #1,d0

loc_01eafa:
	move.b d0,($128,a6)
	move.b d0,($161,a6)
	move.b (PL_ism_choice,a6),($162,a6)
	bset.b #1,($3c,a6)
	move.w #$20,($3a,a6)
	rts

;==============================================
loc_01eb16:
	subq.w #1,($3a,a6)
	bne.b loc_01eb2a
	addq.b #2,(4,a6)
	clr.b (5,a6)
	bset.b #1,($15b,a6)

loc_01eb2a:
	rts

;==============================================
loc_01eb2c:
	move.b (5,a6),d0
	move.w loc_01eb38(pc,d0.w),d1
	jmp loc_01eb38(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01eb38:
	dc.w loc_01eb3e-loc_01eb38
	dc.w loc_01eb78-loc_01eb38
	dc.w loc_01ebe8-loc_01eb38

;==============================================
loc_01eb3e:
	btst.b #2,($15b,a6)
	bne.b loc_01eb66
	tst.b ($12,a5)
	bne.w loc_01eb66
	addq.b #2,(5,a6)
	move.b #1,($12,a5)
	move.b #1,($13,a5)
	move.w #$258,($3a,a6)
	rts

loc_01eb66:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	bset.b #2,($15b,a6)
	bra.w loc_01ebfe

;==============================================
loc_01eb78:
	subq.w #1,($3a,a6)
	beq.w loc_01ebc0
	move.w ($11c,a6),d0
	not.w d0
	and.w (PL_Buttons,a6),d0
	andi.w #$770c,d0
	beq.b loc_01eba0
	move.w d0,d1
	andi.w #$7700,d1
	bne.w loc_01ebc0
	andi.w #$c,d0
	bne.b loc_01eba2

loc_01eba0:
	rts

loc_01eba2:
	move.b ($13,a5),d1
	btst #3,d0
	beq.b loc_01ebae
	subq.b #1,d1

loc_01ebae:
	btst #2,d0
	beq.b loc_01ebb6
	addq.b #1,d1

loc_01ebb6:
	andi.b #1,d1
	move.b d1,($13,a5)
	rts

loc_01ebc0:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b ($13,a5),d0
	add.b (Dip_Game_Turbo,a5),d0
	lea.l Turbo_Options,a0
	move.b (a0,d0.w),(Dev_Turbo,a5)
	bset.b #2,($3c,a6)
	move.w #$20,($3a,a6)
	rts

;==============================================
loc_01ebe8:
	subq.w #1,($3a,a6)
	bne.b loc_01ebfc
	addq.b #2,(4,a6)
	clr.b (5,a6)
	bset.b #2,($15b,a6)

loc_01ebfc:
	rts

;==============================================
loc_01ebfe:
	move.b ($101,a6),d0
	btst d0,($15,a5)
	bne.b loc_01ec30
	bset.b d0,($15,a5)
	btst d0,($ac,a5)
	bne.b loc_01ec30
	bset.b d0,($ac,a5)
	moveq #0,d0

;Versus Stage Select
	move.b (PL_charid,a6),d0
	add.w d0,d0
	move.w d0,(stageid,a5)

	move.b (PL_charid,a6),d0
	move.b (PL_ism_choice,a6),d1
	jmp loc_002c84

loc_01ec30:
	rts

;==============================================
loc_01ec32:
	move.w ($10,a5),d0
	move.w loc_01ec3e(pc,d0.w),d1
	jmp loc_01ec3e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01ec3e:
	dc.w loc_01ec42-loc_01ec3e
	dc.w loc_01ed60-loc_01ec3e

;==============================================
loc_01ec42:
	tst.b ($15d,a5)
	bne.w loc_01f05c
	tst.b ($141,a5)
	bne.w loc_01f05c
	tst.b ($111,a5)
	bne.w loc_01f05c
	addq.w #2,($10,a5)
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,($15f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	jsr loc_01bdd0
	move.w #0,($210,a5)
	move.w #$100,($214,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	jsr loc_01b19c
	jsr loc_01b208
	jsr loc_01b1d2
	bsr.b loc_01ed28
	tst.b ($8c,a5)
	bne.b loc_01ece0
	jsr loc_01b13a
	bra.b loc_01ecf2

loc_01ece0:
	bsr.w loc_01e256
	tst.b $618023
	bne.b loc_01ecf2
	jsr loc_003cc8

loc_01ecf2:
	move.w #$9000,(gfxram8x8,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	clr.w ($216,a5)
	move.l #$ffe1e1e2,($244,a5)
	move.l #$1e1e1,($24c,a5)
	jsr loc_00b5d0
	bra.w loc_01f07a

loc_01ed28:
	moveq #$50,d0
	lea.l $902000,a1
	jsr loc_018cdc
	moveq #$50,d0
	lea.l $903000,a1
	jsr loc_018cdc
	moveq #$51,d0
	lea.l $912000,a1
	jsr loc_018cdc
	moveq #$51,d0
	lea.l $913000,a1
	jmp loc_018cdc

;==============================================
loc_01ed60:
	move.w ($14,a5),d0
	move.w loc_01ed84(pc,d0.w),d1
	jsr loc_01ed84(pc,d1.w)
	eori.w #$100,(gfxram8x8,a5)
	move.w ($214,a5),($24,a5)
	jsr loc_03330e
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01ed84:
	dc.w loc_01ed98-loc_01ed84
	dc.w loc_01ef12-loc_01ed84
	dc.w loc_01ef34-loc_01ed84
	dc.w loc_01ef56-loc_01ed84
	dc.w loc_01ef78-loc_01ed84
	dc.w loc_01ef9a-loc_01ed84
	dc.w loc_01efbc-loc_01ed84
	dc.w loc_01f002-loc_01ed84
	dc.w loc_01f01e-loc_01ed84
	dc.w loc_01f054-loc_01ed84

;==============================================
loc_01ed98:
	tst.b ($8c,a5)
	bne.w loc_01ef10
	cmpi.b #$e,($6eb9,a5)
	bcs.w loc_01ef10
	addq.w #2,($14,a5)
	moveq #0,d0
	move.b d0,($12,a5)
	move.b d0,($13,a5)
	move.w d0,($16,a5)
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	btst.b #0,($ac,a5)
	bne.b loc_01edce
	exg.l a1,a2

loc_01edce:
	cmpi.w #6,($138,a5)
	bne.b loc_01eddc
	movea.l a2,a3
	lea.l (p3memory,a5),a2

loc_01eddc:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1306,(2,a4)
	move.w a1,($38,a4)
	move.w a2,($36,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1304,(2,a4)
	move.w a1,($38,a4)
	move.b #0,($a,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1304,(2,a4)
	move.w a1,($38,a4)
	move.b #1,($a,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1305,(2,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1304,(2,a4)
	move.w a1,($38,a4)
	move.b #2,($a,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1307,(2,a4)
	move.w a1,($38,a4)
	move.b #0,($a,a4)
	cmpi.w #6,($138,a5)
	bne.b loc_01ee84
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1307,(2,a4)
	move.w a3,($38,a4)
	move.b #0,($a,a4)

loc_01ee84:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1307,(2,a4)
	move.w a1,($38,a4)
	move.b #1,($a,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1303,(2,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1301,(2,a4)
	move.w a1,($38,a4)
	cmpi.w #6,($138,a5)
	bne.b loc_01eeda
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1301,(2,a4)
	move.w a3,($38,a4)

loc_01eeda:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1300,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1302,(2,a4)
	move.b #0,($a,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$1302,(2,a4)
	move.b #1,($a,a4)

loc_01ef10:
	rts

;==============================================
loc_01ef12:
	jsr loc_00af50
	bne.w loc_01eff6
	cmpi.b #3,($13,a5)
	bne.b loc_01ef32
	addq.w #2,($14,a5)
	move.b #1,($12,a5)
	clr.b ($13,a5)

loc_01ef32:
	rts

;==============================================
loc_01ef34:
	jsr loc_00af50
	bne.w loc_01eff6
	cmpi.b #3,($13,a5)
	bne.b loc_01ef54
	addq.w #2,($14,a5)
	move.b #2,($12,a5)
	clr.b ($13,a5)

loc_01ef54:
	rts

;==============================================
loc_01ef56:
	jsr loc_00af50
	bne.w loc_01eff6
	cmpi.b #$f,($13,a5)
	bne.b loc_01ef76
	addq.w #2,($14,a5)
	move.b #3,($12,a5)
	clr.b ($13,a5)

loc_01ef76:
	rts

;==============================================
loc_01ef78:
	jsr loc_00af50
	bne.w loc_01eff6
	cmpi.b #$20,($13,a5)
	bne.b loc_01ef98
	addq.w #2,($14,a5)
	move.b #4,($12,a5)
	clr.b ($13,a5)

loc_01ef98:
	rts

;==============================================
loc_01ef9a:
	jsr loc_00af50
	bne.w loc_01eff6
	cmpi.b #$40,($13,a5)
	bne.b loc_01efba
	addq.w #2,($14,a5)
	move.b #5,($12,a5)
	clr.b ($13,a5)

loc_01efba:
	rts

;==============================================
loc_01efbc:
	jsr loc_00af50
	bne.w loc_01eff6
	move.l ($244,a5),d0
	add.l d0,($214,a5)
	move.l ($24c,a5),d0
	add.l d0,($244,a5)
	tst.w ($214,a5)
	bgt.b loc_01eff4
	addq.w #2,($14,a5)

loc_01efe0:
	move.w #$c0,($16,a5)
	moveq #0,d0
	move.l d0,($214,a5)
	move.l d0,($244,a5)
	move.b d0,($13,a5)

loc_01eff4:
	rts

loc_01eff6:
	move.w #$e,($14,a5)
	st.b ($15f,a5)
	bra.b loc_01efe0

;==============================================
loc_01f002:
	jsr loc_00af50
	bne.b loc_01f010
	subq.w #1,($16,a5)
	bne.b loc_01f01c

loc_01f010:
	addq.w #2,($14,a5)
	st.b ($12,a5)
	clr.b ($13,a5)

loc_01f01c:
	rts

;==============================================
loc_01f01e:
	move.l ($244,a5),d0
	add.l d0,($214,a5)
	move.l ($24c,a5),d0
	add.l d0,($244,a5)
	cmpi.w #$100,($214,a5)
	blt.b loc_01f052
	addq.w #2,($14,a5)
	move.w #$100,($214,a5)
	bset.b #7,($13,a5)
	jsr loc_01b19c
	jmp loc_01b1d2

loc_01f052:
	rts

;==============================================
loc_01f054:
	cmpi.b #$ff,($13,a5)
	bne.b loc_01f078

loc_01f05c:
	moveq #0,d0
	addq.w #2,(8,a5)
	move.w d0,($a,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jmp loc_01bdd0

loc_01f078:
	rts

;==============================================
loc_01f07a:
	move.w ($176,a5),d0
	move.w d0,d4
	lsl.w #8,d0
	lea.l loc_35e354,a0
	lea.l (a0,d0.w),a0
	lea.l $90c140,a1
	moveq #7,d7
	jsr loc_01b7c0
	lsl.w #5,d4
	lea.l loc_362954,a0
	lea.l (a0,d4.w),a0
	lea.l $90c400,a1
	moveq #0,d7
	jsr loc_01b7c0
	move.w d4,d0
	add.w d0,d4
	add.w d0,d4
	lea.l loc_363cd4,a0
	lea.l (a0,d4.w),a0
	lea.l $90c800,a1
	moveq #0,d7
	jsr loc_01b7c0
	lea.l loc_364b14,a0
	lea.l (a0,d4.w),a0
	lea.l $90cc00,a1
	moveq #0,d7
	jmp loc_01b7c0

;==============================================
loc_01f0ea:
	move.w ($10,a5),d0
	move.w loc_01f0f6(pc,d0.w),d1
	jmp loc_01f0f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f0f6:
	dc.w loc_01f0fa-loc_01f0f6
	dc.w loc_01f1ac-loc_01f0f6

;==============================================
loc_01f0fa:
	addq.w #2,($10,a5)
	moveq #0,d0
	move.w d0,($12,a5)
	move.l d0,($14,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($15f,a5)
	move.b d0,($13,a5)
	jsr loc_01bdd0
	move.w #0,($210,a5)
	move.w #$100,($214,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	jsr loc_01b19c
	jsr loc_01b208
	jsr loc_01b1d2
	tst.b ($8c,a5)
	bne.b loc_01f186
	jsr loc_01b13a
	bra.b loc_01f18a

loc_01f186:
	bsr.w loc_01e256

loc_01f18a:
	move.w #$9000,(gfxram8x8,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	jsr loc_00b5d0
	bra.w loc_01f3c6

;==============================================
loc_01f1ac:
	move.w ($14,a5),d0
	move.w loc_01f1ca(pc,d0.w),d1
	jsr loc_01f1ca(pc,d1.w)
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f1ca:
	dc.w loc_01f1d0-loc_01f1ca
	dc.w loc_01f356-loc_01f1ca
	dc.w loc_01f378-loc_01f1ca

;==============================================
loc_01f1d0:
	tst.b ($8c,a5)
	bne.w loc_01f354
	cmpi.b #$a,($6eb9,a5)
	bcs.w loc_01f354
	addq.w #2,($14,a5)
	move.b ($81,a5),d6
	andi.w #3,d6
	movea.w (left_hud_pointer,a5),a1
	movea.w (right_hud_pointer,a5),a2
	cmpi.w #2,($138,a5)
	bne.b loc_01f214
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a3
	lea.l (p3memory,a5),a2
	btst.b #5,($149,a1)
	bne.b loc_01f214
	exg.l a2,a3

loc_01f214:
	cmpi.w #4,($138,a5)
	bne.b loc_01f232
	lea.l (p1memory,a5),a3
	lea.l (p2memory,a5),a1
	lea.l (p3memory,a5),a2
	btst.b #5,($149,a1)
	bne.b loc_01f232
	exg.l a2,a3

loc_01f232:
	cmpi.w #6,($138,a5)
	bne.b loc_01f250
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a3
	lea.l (p3memory,a5),a2
	btst.b #0,($ac,a5)
	bne.b loc_01f250
	exg.l a1,a3

loc_01f250:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e03,(2,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e03,(2,a4)
	move.w a2,($38,a4)
	cmpi.w #6,($138,a5)
	bne.b loc_01f28e
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e03,(2,a4)
	move.w a3,($38,a4)

loc_01f28e:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e05,(2,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e05,(2,a4)
	move.w a2,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e01,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e02,(2,a4)
	move.b d6,($a,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e02,(2,a4)
	move.b d6,($a,a4)
	move.w a2,($38,a4)
	cmpi.w #6,($138,a5)
	bne.b loc_01f30a
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e02,(2,a4)
	move.b d6,($a,a4)
	move.w a3,($38,a4)

loc_01f30a:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e00,(2,a4)
	move.b d6,($a,a4)
	move.w a1,($38,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e00,(2,a4)
	move.b d6,($a,a4)
	move.w a2,($38,a4)
	cmpi.w #6,($138,a5)
	bne.b loc_01f354
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$e00,(2,a4)
	move.b d6,($a,a4)
	move.w a3,($38,a4)

loc_01f354:
	rts

;==============================================
loc_01f356:
	jsr loc_00af50
	beq.b loc_01f364
	st.b ($15f,a5)
	bra.b loc_01f36c

loc_01f364:
	cmpi.b #$7f,($13,a5)
	bne.b loc_01f376

loc_01f36c:
	addq.w #2,($14,a5)
	move.w #$c0,($16,a5)

loc_01f376:
	rts

;==============================================s
loc_01f378:
	tst.b ($8a,a5)
	bne.b loc_01f3c4
	jsr loc_00af50
	bne.b loc_01f38c
	subq.w #1,($16,a5)
	bne.b loc_01f3c4

loc_01f38c:
	moveq #0,d0
	jsr loc_033f06
	beq.b loc_01f3c4
	addq.w #2,($c,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	st.b ($8c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	tst.b ($178,a5)
	beq.b loc_01f3c4
	move.l #$1b40000,d0
	jmp loc_00322e

loc_01f3c4:
	rts

;==============================================
loc_01f3c6:
	move.w ($176,a5),d0
	move.w d0,d4
	move.w d0,d1
	lsl.w #3,d0
	add.w d1,d0
	add.w d1,d0
	add.w d1,d0
	lsl.w #5,d0
	lea.l loc_35e854,a0
	lea.l (a0,d0.w),a0
	lea.l $90c280,a1
	moveq #9,d7
	jsr loc_01b7c0
	move.w d4,d0
	add.w d0,d4
	add.w d0,d4
	lsl.w #5,d4
	lea.l loc_363d14,a0
	lea.l (a0,d4.w),a0
	lea.l $90c800,a1
	moveq #0,d7
	jsr loc_01b7c0
	lea.l loc_364b54,a0
	lea.l (a0,d4.w),a0
	lea.l $90cc00,a1
	moveq #0,d7
	jmp loc_01b7c0

;==============================================
loc_01f428:
	move.w ($10,a5),d0
	move.w loc_01f434(pc,d0.w),d1
	jmp loc_01f434(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f434:
	dc.w loc_01f438-loc_01f434
	dc.w loc_01f52c-loc_01f434

;==============================================
loc_01f438:
	tst.b ($bf,a5)
	bne.w loc_01f688
	tst.b (Dramatic_Mode_flag,a5)
	bne.w loc_01f688
	tst.b ($15d,a5)
	bne.w loc_01f688
	tst.b ($141,a5)
	bne.w loc_01f688
	lea.l (p1memory,a5),a6
	btst.b #0,($ac,a5)
	bne.b loc_01f468
	lea.l (p2memory,a5),a6

loc_01f468:
	btst.b #0,($149,a6)
	bne.w loc_01f688
	bset.b #0,($149,a6)
	addq.w #2,($10,a5)
	moveq #0,d0
	move.w d0,($12,a5)
	move.l d0,($14,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($15f,a5)
	move.l #$8880000,d0
	jsr loc_00322e
	jsr loc_01bdd0
	move.w #0,($210,a5)
	move.w #$100,($214,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	jsr loc_01b19c
	jsr loc_01b208
	tst.b ($8c,a5)
	bne.b loc_01f506
	jsr loc_01b13a
	bra.b loc_01f50a

loc_01f506:
	bsr.w loc_01e256

loc_01f50a
	move.w #$9000,(gfxram8x8,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	jsr loc_00b5d0
	bra.w loc_01f3c6

;==============================================
loc_01f52c:
	move.w ($14,a5),d0
	move.w loc_01f550(pc,d0.w),d1
	jsr loc_01f550(pc,d1.w)
	jsr loc_03330e
	jsr loc_0336d6
	jsr loc_033522
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f550:
	dc.w loc_01f55a-loc_01f550
	dc.w loc_01f574-loc_01f550
	dc.w loc_01f5aa-loc_01f550
	dc.w loc_01f632-loc_01f550
	dc.w loc_01f65c-loc_01f550

;==============================================
loc_01f55a:
	tst.b ($8c,a5)
	bne.w loc_01f572
	addq.w #2,($14,a5)
	move.w #$17,($16,a5)
	jmp loc_08bc8a

loc_01f572:
	rts

;==============================================
loc_01f574:
	subq.w #1,($16,a5)
	bpl.b loc_01f5a8
	addq.w #2,($14,a5)
	moveq #$18,d0
	jsr loc_0039e0
	moveq #0,d0
	move.b d0,($145,a5)
	move.b #$7f,($112,a5)
	lea.l (p1memory,a5),a0
	btst.b #0,($ac,a5)
	bne.b loc_01f5a2
	lea.l (p2memory,a5),a0

loc_01f5a2:
	move.b ($102,a0),($146,a5)

loc_01f5a8:
	rts

;==============================================
loc_01f5aa:
	addq.w #2,($14,a5)
	move.w #$e0,($16,a5)
	lea.l loc_01f6a8(pc),a3
	moveq #0,d0
	moveq #0,d3
	move.b ($146,a5),d0
	add.w d0,d0
	move.w (a3,d0.w),d1
	lea.l (a3,d1.w),a3
	move.b ($145,a5),d3
	move.b (a3,d3.w),d0
	move.b d0,($112,a5)
	beq.w loc_01f688
	lea.l loc_01f698(pc),a1
	move.w ($92,a5),d1
	add.w d1,d1
	movea.l (a1,d1.w),a1
	andi.w #$7f,d0
	subq.w #1,d0
	add.w d0,d0
	move.w (a1,d0.w),d0
	lea.l (a1,d0.w),a1
	addq.b #1,($145,a5)
	jsr loc_01c3ac
	beq.b loc_01f630
	move.l #$01000100,(a4)
	move.l a1,($36,a4)
	clr.b ($3a,a4)
	move.b #3,($3b,a4)
	move.w #$39,($10,a4)
	move.w #$38,($14,a4)
	tst.w ($92,a5)
	beq.b loc_01f630
	move.b #1,($3b,a4)

loc_01f630:
	rts

;==============================================
loc_01f632:
	tst.b ($8a,a5)
	bne.b loc_01f65a
	jsr loc_00af22
	bne.w loc_01f688
	jsr loc_00af50
	bne.b loc_01f650
	subq.w #1,($16,a5)
	bpl.b loc_01f65a

loc_01f650:
	addq.w #2,($14,a5)
	move.b #1,($160,a5)

loc_01f65a:
	rts

;==============================================
loc_01f65c:
	tst.b ($8a,a5)
	bne.b loc_01f686
	jsr loc_00af22
	bne.w loc_01f688
	jsr loc_00af50
	bne.b loc_01f67a
	subq.w #1,($16,a5)
	bpl.b loc_01f686

loc_01f67a:
	move.w #4,($14,a5)
	move.b #2,($160,a5)

loc_01f686:
	rts

;==============================================
loc_01f688:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f698:
	dc.l EnglishWinQuotes,loc_0cc7e0
	dc.l loc_0cc7e0,loc_0cc7e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Story Intros
loc_01f6a8:
	dc.w loc_01f6e8-loc_01f6a8;Ryu
	dc.w loc_01f6ec-loc_01f6a8;Ken
	dc.w loc_01f6f1-loc_01f6a8;Gki
	dc.w loc_01f6f5-loc_01f6a8;Nsh
	dc.w loc_01f6fa-loc_01f6a8;Chn
	dc.w loc_01f6ff-loc_01f6a8;Adn
	dc.w loc_01f703-loc_01f6a8;Sdm
	dc.w loc_01f707-loc_01f6a8;Guy

	dc.w loc_01f70c-loc_01f6a8;Brd
	dc.w loc_01f711-loc_01f6a8;Rse
	dc.w loc_01f716-loc_01f6a8;Dic
	dc.w loc_01f71b-loc_01f6a8;Sag
	dc.w loc_01f720-loc_01f6a8;Dan
	dc.w loc_01f724-loc_01f6a8;Sak
	dc.w loc_01f729-loc_01f6a8;Rol
	dc.w loc_01f72e-loc_01f6a8;Sim

	dc.w loc_01f732-loc_01f6a8;Zan
	dc.w loc_01f736-loc_01f6a8;Gen
	dc.w loc_01f6fa-loc_01f6a8;Chn
	dc.w loc_01f736-loc_01f6a8;Gen
	dc.w loc_01f703-loc_01f6a8;Sdm
	dc.w loc_01f716-loc_01f6a8;Box
	dc.w loc_01f73b-loc_01f6a8;Cam
	dc.w loc_01f6e8-loc_01f6a8;Ryu

	dc.w loc_01f740-loc_01f6a8;Ehd
	dc.w loc_01f745-loc_01f6a8;Blk
	dc.w loc_01f749-loc_01f6a8;Rmk
	dc.w loc_01f74e-loc_01f6a8;Cdy
	dc.w loc_01f753-loc_01f6a8;Clw
	dc.w loc_01f757-loc_01f6a8;Kar
	dc.w loc_01f716-loc_01f6a8;Jli
	dc.w loc_01f716-loc_01f6a8;Jni

loc_01f6e8:
	dc.b $01,$02,$83,$00

loc_01f6ec:
	dc.b $04,$05,$06,$87,$00

loc_01f6f1:
	dc.b $08,$09,$8a,$00

loc_01f6f5:
	dc.b $0b,$0c,$0d,$8e,$00

loc_01f6fa:
	dc.b $0f,$10,$11,$92,$00

loc_01f6ff:
	dc.b $13,$14,$95,$00

loc_01f703:
	dc.b $16,$17,$98,$00

loc_01f707:
	dc.b $19,$1a,$1b,$9c,$00

loc_01f70c:
	dc.b $1d,$1e,$1f,$a0,$00

loc_01f711:
	dc.b $21,$22,$23,$a4,$00

loc_01f716:
	dc.b $25,$26,$27,$a8,$00

loc_01f71b:
	dc.b $29,$2a,$2b,$ac,$00

loc_01f720:
	dc.b $2d,$2e,$af,$00

loc_01f724:
	dc.b $30,$31,$32,$b3,$00

loc_01f729:
	dc.b $34,$35,$36,$b7,$00

loc_01f72e:
	dc.b $38,$39,$ba,$00

loc_01f732:
	dc.b $3b,$3c,$bd,$00

loc_01f736:
	dc.b $3e,$3f,$40,$c1,$00

loc_01f73b:
	dc.b $42,$43,$44,$c5,$00

loc_01f740:
	dc.b $46,$47,$48,$c9,$00

loc_01f745:
	dc.b $4a,$4b,$cc,$00

loc_01f749:
	dc.b $4d,$4e,$4f,$d0,$00

loc_01f74e:
	dc.b $51,$52,$53,$d4,$00

loc_01f753:
	dc.b $55,$56,$d7,$00

loc_01f757:
	dc.b $58,$59,$5a,$db,$00

;==============================================
loc_01f75c:
	ext.w d1
	addq.w #1,d1
	add.w d1,d1
	andi.w #1,d2
	add.w d2,d1
	lsl.w #7,d1
	add.w d0,d0
	lea.l loc_34cdd4,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	andi.w #$1f,d3
	lsl.w #5,d3
	lea.l $90c000,a1
	lea.l (a1,d3.w),a1
	moveq #3,d7
	jmp loc_01b7c0

;==============================================
loc_01f792:
	bsr.w loc_01f9e8
	bsr.b loc_01f7a2
	bsr.b loc_01f7aa
	bsr.b loc_01f7d0
	bsr.b loc_01f80e
	bra.w loc_01f84e


;==============================================
loc_01f7a2:
	lea.l $90d000,a0
	bra.b loc_01f7b0

;==============================================
loc_01f7aa:
	lea.l $90d400,a0

loc_01f7b0:
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	moveq #0,d4
	moveq #0,d5
	moveq #0,d6
	movea.l d0,a1
	moveq #$1f,d7

loc_01f7c2:
	movem.l d0-d6/a1,(a0)
	lea.l ($20,a0),a0
	dbra d7,loc_01f7c2
	rts

;==============================================
loc_01f7d0:
	moveq #-1,d0
	moveq #-1,d1
	moveq #-1,d2
	moveq #-1,d3
	moveq #-1,d4
	moveq #-1,d5
	moveq #-1,d6
	movea.l d0,a1
	moveq #$1f,d7
	lea.l $92a000,a0

loc_01f7e8:
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	dbra d7,loc_01f7e8
	rts

;==============================================
loc_01f80e:
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	moveq #0,d4
	moveq #0,d5
	moveq #0,d6
	movea.l d0,a1
	move.w #$1f,d7
	lea.l Palettebank3,a0

loc_01f828:
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	dbra d7,loc_01f828
	rts

;==============================================
loc_01f84e:
	move.l #$ff00ff00,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	movea.l d0,a1
	move.w #$1f,d7
	lea.l $928000,a0

loc_01f86c:
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	movem.l d0-d6/a1,-(a0)
	dbra d7,loc_01f86c
	rts

;==============================================
loc_01f892:
	bsr.b loc_01f8a0
	bsr.w loc_01f9e8
	bsr.w loc_01fa04
	bra.w loc_01fa20

;==============================================
loc_01f8a0:
	bsr.b loc_01f8c6
	bsr.w loc_01f994
	bra.w loc_01f9b2

;==============================================
loc_01f8aa:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bra.w loc_01f95c

;==============================================
loc_01f8b8:
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bra.w loc_01f95c

;==============================================
loc_01f8c6:
	move.w ($138,a5),d0
	move.w loc_01f8d2(pc,d0.w),d1
	jmp loc_01f8d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01f8d2:
	dc.w loc_01f8da-loc_01f8d2
	dc.w loc_01f8f2-loc_01f8d2
	dc.w loc_01f916-loc_01f8d2
	dc.w loc_01f93a-loc_01f8d2

;==============================================
loc_01f8da:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01f95c
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bra.b loc_01f95c

;==============================================
loc_01f8f2:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01f95c
	lea.l (p3memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01f95c
	lea.l (p4memory,a5),a4
	lea.l $90c140,a1
	bra.b loc_01f95c

;==============================================
loc_01f916:
	lea.l (p2memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01f95c
	lea.l (p3memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01f95c
	lea.l (p4memory,a5),a4
	lea.l $90c140,a1
	bra.b loc_01f95c

;==============================================
loc_01f93a:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01f95c
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01f95c
	lea.l (p3memory,a5),a4
	lea.l $90c140,a1

loc_01f95c:
	move.b ($132,a4),d0
	ext.w d0
	addq.w #1,d0
	add.w d0,d0
	add.b ($128,a4),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	lsl.w #5,d0
	move.b ($102,a4),d1
	add.w d1,d1
	lea.l loc_32c094,a0
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($14c,a4)
	move.l a1,($150,a4)
	moveq #4,d7
	bra.w loc_01fad0

;==============================================
loc_01f994:
	move.w (stageid,a5),d0
	movea.l #loc_3383b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c1e0,a1
	moveq #5,d7
	bra.w loc_01fad0

;==============================================
loc_01f9b2:
	movea.l #loc_33bb14,a0
	lea.l $90c2a0,a1
	moveq #8,d7
	bsr.w loc_01fad0
	tst.b ($bb,a5)
	beq.b loc_01f9d4
	move.l #$0fff0ccc,$90c33a

loc_01f9d4:
	rts

;==============================================
loc_01f9d6:
	movea.l #loc_33c034,a0
	lea.l $90c3c0,a1
	moveq #1,d7
	bra.w loc_01fad0

;==============================================
;Stage load?
;==============================================
loc_01f9e8:
	move.w (stageid,a5),d0
	movea.l #loc_33c474,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.w loc_01face

loc_01fa04:
	move.w (stageid,a5),d0
	movea.l #loc_340954,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01face

loc_01fa20:
	move.w (stageid,a5),d0
	movea.l #loc_3477b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	moveq #$1e,d7
	lea.l $90cc00,a1
	bsr.w loc_01fad0
	move.l #$0fff0fff,d0
	move.l d0,d1
	movem.l d0-d1,(a1)
	movem.l d0-d1,(8,a1)
	movem.l d0-d1,($10,a1)
	movem.l d0-d1,($18,a1)
	rts

;==============================================
loc_01fa5e:
	bsr.w loc_01fa6e
	bsr.w loc_01fa88
	bsr.w loc_01faa0
	bra.w loc_01fab8

;==============================================
loc_01fa6e:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_33bc74,a0
	lea.l (a0,d0.w),a0
	lea.l $90c000,a1
	bra.w loc_01face

;==============================================
loc_01fa88:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_340154,a0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.b loc_01face

;==============================================
loc_01faa0:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_346fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.b loc_01face

;==============================================
loc_01fab8:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_349fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90cc00,a1

loc_01face:
	moveq #$1f,d7

loc_01fad0:
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_01fad0
	rts

;==============================================
loc_01fae2:
	bsr.b loc_01faf0
	bsr.w loc_01fc38
	bsr.w loc_01fc54
	bra.w loc_01fc70

;==============================================
loc_01faf0:
	bsr.b loc_01fb16
	bsr.w loc_01fbe4
	bra.w loc_01fc02

;==============================================
loc_01fafa:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bra.w loc_01fbac

;==============================================
loc_01fb08:
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bra.w loc_01fbac

;==============================================
loc_01fb16:
	move.w ($138,a5),d0
	move.w loc_01fb22(pc,d0.w),d1
	jmp loc_01fb22(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01fb22:
	dc.w loc_01fb2a-loc_01fb22
	dc.w loc_01fb42-loc_01fb22
	dc.w loc_01fb66-loc_01fb22
	dc.w loc_01fb8a-loc_01fb22

;==============================================
loc_01fb2a:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01fbac
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bra.b loc_01fbac

;==============================================
loc_01fb42:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01fbac
	lea.l (p3memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01fbac
	lea.l (p4memory,a5),a4
	lea.l $90c140,a1
	bra.b loc_01fbac

;==============================================
loc_01fb66:
	lea.l (p2memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01fbac
	lea.l (p3memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01fbac
	lea.l (p4memory,a5),a4
	lea.l $90c140,a1
	bra.b loc_01fbac

;==============================================
loc_01fb8a:
	lea.l (p1memory,a5),a4
	lea.l $90c000,a1
	bsr.b loc_01fbac
	lea.l (p2memory,a5),a4
	lea.l $90c0a0,a1
	bsr.b loc_01fbac
	lea.l (p3memory,a5),a4
	lea.l $90c140,a1

loc_01fbac:
	move.b ($132,a4),d0
	ext.w d0
	addq.w #1,d0
	add.w d0,d0
	add.b ($128,a4),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	lsl.w #5,d0
	move.b ($102,a4),d1
	add.w d1,d1
	lea.l loc_32c094,a0
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($14c,a4)
	move.l a1,($150,a4)
	moveq #4,d7
	bra.w loc_01fd9e

;==============================================
loc_01fbe4:
	move.w (stageid,a5),d0
	movea.l #loc_3383b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c1e0,a1
	moveq #5,d7
	bra.w loc_01fd9e

;==============================================
loc_01fc02:
	movea.l #loc_33bb14,a0
	lea.l $90c2a0,a1
	moveq #8,d7
	bsr.w loc_01fd9e
	tst.b ($bb,a5)
	beq.b loc_01fc24
	move.l #$fffffccc,$90c33a

loc_01fc24:
	rts

;==============================================
loc_01fc26:
	movea.l #loc_33c034,a0
	lea.l $90c3c0,a1
	moveq #1,d7
	bra.w loc_01fd9e

;==============================================
loc_01fc38:
	move.w (stageid,a5),d0
	movea.l #loc_33c474,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.w loc_01fd9c

;==============================================
loc_01fc54:
	move.w (stageid,a5),d0
	movea.l #loc_340954,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01fd9c

;==============================================
loc_01fc70:
	move.w (stageid,a5),d0
	movea.l #loc_3477b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	moveq #$1e,d7
	lea.l $90cc00,a1
	bsr.w loc_01fd9e
	moveq #-1,d0
	move.l d0,d1
	movem.l d0-d1,(a1)
	movem.l d0-d1,(8,a1)
	movem.l d0-d1,($10,a1)
	movem.l d0-d1,($18,a1)
	rts

;==============================================
loc_01fcaa:
	bsr.w loc_01fcba
	bsr.w loc_01fcd4
	bsr.w loc_01fcee
	bra.w loc_01fd08

;==============================================
loc_01fcba:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_33bc74,a0
	lea.l (a0,d0.w),a0
	lea.l $90c000,a1
	bra.w loc_01fd9c

;==============================================
loc_01fcd4:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_340154,a0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.w loc_01fd9c

;==============================================
loc_01fcee:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_346fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01fd9c

;==============================================
loc_01fd08:
	move.w ($128,a5),d0
	ror.w #7,d0
	movea.l #loc_349fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90cc00,a1
	bra.w loc_01fd9c

;==============================================
loc_01fd22:
	move.w d0,d4
	bsr.w loc_01fd3a
	move.w d4,d0
	bsr.w loc_01fd52
	move.w d4,d0
	bsr.w loc_01fd6c
	move.w d4,d0
	bra.w loc_01fd86

;==============================================
loc_01fd3a:
	movea.l #loc_339774,a0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	lea.l $90c000,a1
	moveq #$1d,d7
	bra.w loc_01fd9e

;==============================================
loc_01fd52:
	movea.l #loc_33fd14,a0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.w loc_01fd9c

;==============================================
loc_01fd6c:
	movea.l #loc_345bd4,a0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01fd9c

;==============================================
loc_01fd86:
	movea.l #loc_349cb4,a0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90cc00,a1

loc_01fd9c:
	moveq #$1f,d7

loc_01fd9e:
	move.l #$f000f000,d6

loc_01fda4:
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d7,loc_01fda4
	rts

;==============================================
;Unknown
loc_01fdd2:
	bsr.b loc_01fde0
	bsr.w loc_01fe50
	bsr.w loc_01febc
	bra.w loc_01fef8

;==============================================
loc_01fde0:
	move.w (stageid,a5),d0
	subi.w #$40,d0
	bcc.b loc_01fe3a
	move.w (stageid,a5),d0
	movea.l #loc_32c094,a0
	move.w (a0,d0.w),d0
	addi.w #$140,d0
	lea.l (a0,d0.w),a0
	lea.l $90c000,a1
	moveq #$e,d7
	bsr.b loc_01fd9e
	move.w (stageid,a5),d0
	movea.l #loc_3383b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.w loc_01fd9e
	movea.l #loc_33bb14,a0
	lea.l $90c2a0,a1
	moveq #$a,d7
	bra.w loc_01fd9e

loc_01fe3a:
	ror.w #7,d0
	movea.l #loc_33bc74,a0
	lea.l (a0,d0.w),a0
	lea.l $90c000,a1
	bra.w loc_01fd9c

;==============================================
loc_01fe50:
	move.w (stageid,a5),d0
	subi.w #$40,d0
	bcc.b loc_01fe96
	move.w (stageid,a5),d0
	movea.l #loc_33c474,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bsr.w loc_01fd9c
	move.w #$f000,d1
	moveq #7,d2
	lea.l loc_01feac(pc),a0
	lea.l $90c70c,a1

loc_01fe86:
	move.w (a0)+,d0
	or.w d1,d0
	move.w d0,(a1)
	lea.l ($20,a1),a1
	dbra d2,loc_01fe86
	rts

loc_01fe96:
	ror.w #7,d0
	movea.l #loc_340154,a0
	lea.l (a0,d0.w),a0
	lea.l $90c400,a1
	bra.w loc_01fd9c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_01feac:
	dc.w $01e4,$0d6c,$0cb0,$02a2,$0aaa,$0d11,$015f,$0f81

;==============================================
loc_01febc:
	move.w (stageid,a5),d0
	subi.w #$40,d0
	bcc.b loc_01fee2
	move.w (stageid,a5),d0
	movea.l #loc_340954,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01fd9c

loc_01fee2:
	ror.w #7,d0
	movea.l #loc_346fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90c800,a1
	bra.w loc_01fd9c

;==============================================
loc_01fef8:
	move.w (stageid,a5),d0
	subi.w #$40,d0
	bcc.b loc_01ff3c
	move.w (stageid,a5),d0
	movea.l #loc_3477b4,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	moveq #$1e,d7
	lea.l $90cc00,a1
	bsr.w loc_01fd9e
	moveq #-1,d0
	move.l d0,d1
	movem.l d0-d1,(a1)
	movem.l d0-d1,(8,a1)
	movem.l d0-d1,($10,a1)
	movem.l d0-d1,($18,a1)
	rts

loc_01ff3c:
	ror.w #7,d0
	movea.l #loc_349fb4,a0
	lea.l (a0,d0.w),a0
	lea.l $90cc00,a1
	bra.w loc_01fd9c

;==============================================
loc_01ff52:
	cmpi.b #4,($6ebc,a5)
	bcs.b loc_01ff9e
	jsr loc_01c3ac
	addq.b #1,(a4)
	move.b #6,(2,a4)
	move.w a4,($152,a5)
	jsr loc_01c3ac
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.w a4,($16e,a5)
	jsr loc_01c3ac
	addq.b #1,(a4)
	move.b #2,(2,a4)
	jsr loc_01c3ac
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.w a4,($150,a5)

loc_01ff9e:
	rts

;==============================================
loc_01ffa0:
	tst.b ($bd,a5)
	bne.b loc_01ffc2
	lea.l (p2memory,a5),a0
	tst.b ($101,a6)
	beq.b loc_01ffb4
	lea.l (p1memory,a5),a0

loc_01ffb4:
	tst.b ($14b,a0)
	beq.b loc_01ffbc
	moveq #$23,d0

loc_01ffbc:
	move.b d0,($14a,a6)
	rts

loc_01ffc2:
	clr.b ($14a,a6)
	rts

;==============================================
loc_01ffc8:
	movea.w ($71b8,a5),a4
	move.w #$2010,d1
	moveq #0,d7
	moveq #0,d5
	lea.l loc_020038(pc),a0
	move.b ($54a,a5),d0
	beq.b loc_01fff0
	move.w #$e070,d4
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a1
	bsr.b loc_020016

loc_01fff0:
	move.b ($94a,a5),d0
	beq.b loc_020008
	move.w #$e148,d4
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a1
	bsr.b loc_020016

loc_020008:
	move.w a4,($71b8,a5)
	add.w d7,($71bc,a5)
	add.w d5,($71c0,a5)
	rts

