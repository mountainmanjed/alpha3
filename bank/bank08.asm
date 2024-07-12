;##############################################
loc_07ffbe:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_08017c
	move.b (4,a6),d0
	move.w loc_07ffda(pc,d0.w),d1
	jmp loc_07ffda(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ffda:
	dc.w loc_07ffe2-loc_07ffda
	dc.w loc_080022-loc_07ffda
	dc.w loc_08017c-loc_07ffda
	dc.w loc_080180-loc_07ffda

;==============================================
loc_07ffe2:
	addq.b #2,(4,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	move.l #$10000,d2
	jsr loc_03a0e4
	bcc.b loc_080006
	neg.l d2

loc_080006:
	move.l d2,($40,a6)
	move.w #$1f,d0
	jsr loc_00390e
	moveq #2,d0
	movea.l #loc_2b54f8,a0
	jsr loc_01b6e0

;==============================================
loc_080022:
	tst.b ($12a,a5)
	beq.b loc_080032
	move.l #$4000000,(4,a6)
	rts

loc_080032:
	move.b (5,a6),d0
	move.w loc_08003e(pc,d0.w),d1
	jmp loc_08003e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08003e:
	dc.w loc_080044-loc_08003e
	dc.w loc_080094-loc_08003e
	dc.w loc_08010c-loc_08003e

;----------------------------------------------
loc_080044:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_080088
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.l ($44,a6),d0
	neg.l d0
	asr.l #1,d0
	move.l d0,($44,a6)
	move.l ($4c,a6),d0
	add.l d0,d0
	move.l d0,($4c,a6)

loc_080088:
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_080094:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_080100
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	jsr RNGFunction
	andi.w #1,d0
	addi.b #3,d0
	movea.l #loc_2b54f8,a0
	jsr loc_01b6e0
	tst.b ($125,a4)
	bne.b loc_080100
	jsr loc_01c368
	beq.b loc_080100
	move.l #$1001200,(a4)
	move.w a6,($36,a4)
	movea.w ($36,a6),a0
	move.w a0,($38,a4)
	lea.l ($6a,a0),a0
	move.l a0,($40,a4)
	move.w a4,($28,a6)

loc_080100:
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_08010c:
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$18,d0
	cmpi.w #$30,d0
	bhi.b loc_080170
	tst.b ($2c8,a4)
	bne.b loc_080170
	tst.b ($31,a4)
	bne.b loc_080170
	cmpi.w #$200,(4,a4)
	bne.b loc_080170
	tst.b (6,a4)
	beq.b loc_080140
	cmpi.b #4,(6,a4)
	bne.b loc_080170

loc_080140:
	addq.b #2,(4,a6)
	move.b #1,($6a,a4)
	movea.l #loc_13e186,a0
	exg.l a4,a6
	jsr loc_02ad68
	exg.l a4,a6
	movea.l #loc_14165c,a0
	move.l a0,($e6,a4)
	move.w #$20,d0
	jsr loc_00390e
	bra.b loc_08017c

loc_080170:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_08017c:
	addq.b #2,(4,a6)

loc_080180:
	jmp loc_01c2de

;##############################################
loc_080186:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_0802d4
	move.b (4,a6),d0
	move.w loc_0801a2(pc,d0.w),d1
	jmp loc_0801a2(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0801a2:
	dc.w loc_0801aa-loc_0801a2
	dc.w loc_0801ea-loc_0801a2
	dc.w loc_0802d4-loc_0801a2
	dc.w loc_0802d8-loc_0801a2

;==============================================
loc_0801aa:
	addq.b #2,(4,a6)
	move.l #$20000,($44,a6)
	move.l #$fffff000,($4c,a6)
	move.l #$8000,d2
	jsr loc_03a0e4
	bcc.b loc_0801ce
	neg.l d2

loc_0801ce:
	move.l d2,($40,a6)
	move.w #$1f,d0
	jsr loc_00390e
	moveq #0,d0
	movea.l #loc_2b54f8,a0
	jsr loc_01b6e0

;==============================================
loc_0801ea:
	tst.b ($12a,a5)
	beq.b loc_0801fa
	move.l #$4000000,(4,a6)
	rts

loc_0801fa:
	move.b (5,a6),d0
	move.w loc_080206(pc,d0.w),d1
	jmp loc_080206(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080206:
	dc.w loc_08020a-loc_080206
	dc.w loc_08027e-loc_080206

;----------------------------------------------
loc_08020a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_080272
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #1,d0
	movea.l #loc_2b54f8,a0
	jsr loc_01b6e0
	tst.b ($125,a4)
	bne.b loc_080272
	jsr loc_01c368
	beq.b loc_080272
	move.l #$1001200,(a4)
	move.w a6,($36,a4)
	movea.w ($36,a6),a0
	move.w a0,($38,a4)
	lea.l ($6b,a0),a0
	move.l a0,($40,a4)
	move.w a4,($28,a6)

loc_080272:
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_08027e:
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$18,d0
	cmpi.w #$30,d0
	bhi.b loc_0802c8
	tst.b ($2c8,a4)
	bne.b loc_0802c8
	tst.b ($31,a4)
	bne.b loc_0802c8
	cmpi.w #$200,(4,a4)
	bne.b loc_0802c8
	tst.b (6,a4)
	beq.b loc_0802b2
	cmpi.b #4,(6,a4)
	bne.b loc_0802c8

loc_0802b2:
	addq.b #2,(4,a6)
	move.b #1,($6b,a4)
	move.w #$20,d0
	jsr loc_00390e
	bra.b loc_0802d4

loc_0802c8:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0802d4:
	addq.b #2,(4,a6)

loc_0802d8:
	jmp loc_01c2de

;##############################################
loc_0802de:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_0803b6
	move.b (4,a6),d0
	move.w loc_080300(pc,d0.w),d1
	jsr loc_080300(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080300:
	dc.w loc_080308-loc_080300
	dc.w loc_080362-loc_080300
	dc.w loc_0803b6-loc_080300
	dc.w loc_0803ba-loc_080300

;==============================================
loc_080308:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	addi.w #$90,($14,a6)
	move.w #8,d0
	tst.b ($b,a6)
	beq.b loc_080348
	neg.w d0

loc_080348:
	add.w d0,($10,a6)
	move.l #$ffff0000,($44,a6)
	moveq #0,d0
	movea.l #loc_282f36,a0
	jmp loc_01b6e0

;==============================================
loc_080362:
	move.b (5,a6),d0
	move.w loc_08036e(pc,d0.w),d1
	jmp loc_08036e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08036e:
	dc.w loc_080372-loc_08036e
	dc.w loc_0803a0-loc_08036e

;----------------------------------------------
loc_080372:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($64,a6),d0
	addi.w #$80,d0
	cmp.w ($14,a6),d0
	bcs.b loc_08039a
	addq.b #2,(5,a6)
	moveq #1,d0
	movea.l #loc_282f36,a0
	jmp loc_01b6e0

loc_08039a:
	jmp loc_01b6b6

;----------------------------------------------
loc_0803a0:
	cmpi.l #$2000000,(4,a4)
	bne.b loc_0803b0
	addq.b #2,(4,a6)
	bra.b loc_0803b6

loc_0803b0:
	jmp loc_01b6b6

;==============================================
loc_0803b6:
	addq.b #2,(4,a6)

loc_0803ba:
	jmp loc_01c2de

;##############################################
loc_0803c0:
	move.b (4,a6),d0
	move.w loc_0803cc(pc,d0.w),d1
	jmp loc_0803cc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0803cc:
	dc.w loc_0803d4-loc_0803cc
	dc.w loc_0803f0-loc_0803cc
	dc.w loc_08042e-loc_0803cc
	dc.w loc_08042e-loc_0803cc

;==============================================
loc_0803d4:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	bsr.w loc_080434
	bra.w loc_080470

;==============================================
loc_0803f0:
	subq.b #1,($3a,a6)
	bpl.b loc_08042c
	clr.b ($3a,a6)
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmp.l ($44,a6),d0
	beq.b loc_080414
	move.b #4,(4,a6)

loc_080414:
	bsr.w loc_080434
	bsr.w loc_080470
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_08042c
	jmp loc_01b4ec

loc_08042c:
	rts

;==============================================
loc_08042e:
	jmp loc_01c2de

;##############################################
loc_080434:
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #2,d0
	movea.l loc_080442(pc,d0.w),a1
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080442:
	dc.l $ff0fca,$ff13ca,$ff17ca,$ff1bca

;##############################################
loc_080452:
	ext.w d0
	move.w d0,d1
	lsl.w #2,d1
	movea.l loc_080460(pc,d1.w),a1
	move.w (a1),d1
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080460:
	dc.l $ff0fc2,$ff0fc4,$ff0fc6,$ff0fc8

;##############################################
loc_080470:
	move.w ($40,a6),d0
	addq.w #8,d0
	andi.w #$3ff,d0
	move.w d0,($40,a6)
	move.b (a1,d0.w),($b,a6)
	move.l (a1,d0.w),d1
	andi.l #$ffffff,d1
	move.l d1,($1c,a6)
	move.w (4,a1,d0.w),($10,a6)
	move.w (6,a1,d0.w),($14,a6)
	rts

;##############################################
loc_0804a0:
	cmpi.b #3,($6eb9,a5)
	bcs.w loc_0804d6
	jsr loc_01c2c8
	lea.l (a4),a2
	jsr loc_01c2c8
	lea.l (a4),a3
	jsr loc_01c2c8
	cmpa.l a2,a3
	bcc.b loc_0804c6
	exg.l a2,a3

loc_0804c6:
	cmpa.l a2,a4
	bcc.b loc_0804cc
	exg.l a2,a4

loc_0804cc:
	cmpa.l a3,a4
	bcc.b loc_0804d2
	exg.l a3,a4

loc_0804d2:
	moveq #1,d2
	rts

loc_0804d6:
	moveq #0,d2
	rts

;##############################################
;Super Activate Flash
loc_0804da:
	move.b ($101,a6),d0
	bsr.w loc_080452
	bsr.b loc_0804a0
	beq.w loc_0805a0
	move.l #$2001000,d2
	move.b #8,($2a0,a6)
	addq.b #1,(a4)
	move.w #$300,($2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #8,($3a,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b #1,($30,a4)
	move.l d2,($44,a4)
	addq.b #3,($d,a4)
	addq.b #1,(a3)
	move.w #$301,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #$10,($3a,a3)
	move.w a6,($36,a3)
	move.w ($c,a6),($c,a3)
	move.b #1,($30,a3)
	move.l d2,($44,a3)
	addq.b #4,($d,a3)
	addq.b #1,(a2)
	move.w #$302,(2,a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #$18,($3a,a2)
	move.w a6,($36,a2)
	move.w ($c,a6),($c,a2)
	move.b #1,($30,a2)
	move.l d2,($44,a2)
	addq.b #4,($d,a2)
	cmpi.b #6,($271,a6)
	beq.b loc_0805a2
	cmpi.b #8,($271,a6)
	beq.b loc_0805ac

loc_0805a0:
	rts

loc_0805a2:
	subq.b #1,($d,a3)
	subq.b #1,($d,a2)
	rts

loc_0805ac:
	move.b #1,($c,a4)
	move.b #1,($c,a3)
	move.b #1,($c,a2)
	rts

;##############################################
;Super Activate Flash
loc_0805c0:
	move.b ($101,a6),d0
	bsr.w loc_080452
	bsr.w loc_0804a0
	beq.w loc_080666
	move.l #$2001000,d2
	move.b #8,($2a0,a6)
	addq.b #1,(a4)
	move.w #$300,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #2,($3a,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.l d2,($44,a4)
	addq.b #3,($d,a4)
	addq.b #1,(a3)
	move.w #$301,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #4,($3a,a3)
	move.w a6,($36,a3)
	move.w ($c,a6),($c,a3)
	move.l d2,($44,a3)
	addq.b #4,($d,a3)
	addq.b #1,(a2)
	move.w #$302,(2,a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #6,($3a,a2)
	move.w a6,($36,a2)
	move.w ($c,a6),($c,a2)
	move.l d2,($44,a2)
	addq.b #4,($d,a2)

loc_080666:
	rts

;##############################################
loc_080668:
	movea.w ($38,a6),a4
	move.b #1,($25c,a4)
	move.b ($101,a4),d0
	bsr.w loc_080452
	bsr.w loc_0804a0
	beq.w loc_080742
	move.l #$2060000,d2
	movea.w ($38,a6),a0
	move.b #8,($2a0,a0)

loc_080692:
	addq.b #1,(a4)
	move.w #$300,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #8,($3a,a4)
	move.w a0,($36,a4)
	move.b #1,($30,a4)
	move.w ($c,a0),($c,a4)
	move.l d2,($44,a4)
	addq.b #3,($d,a4)
	addq.b #1,(a3)
	move.w #$301,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #$10,($3a,a3)
	move.w a0,($36,a3)
	move.b #1,($30,a3)
	move.w ($c,a0),($c,a3)
	move.l d2,($44,a3)
	addq.b #4,($d,a3)
	addq.b #1,(a2)
	move.w #$302,(2,a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #$18,($3a,a2)
	move.w a0,($36,a2)
	move.b #1,($30,a2)
	move.w ($c,a0),($c,a2)
	move.l d2,($44,a2)
	addq.b #4,($d,a2)
	cmpi.b #6,($271,a0)
	beq.w loc_0805a2
	cmpi.b #8,($271,a0)
	beq.w loc_0805ac

loc_080742:
	rts

;##############################################
loc_080744:
	movea.w ($276,a6),a4
	move.b ($101,a4),d0
	bsr.w loc_080452
	bsr.w loc_0804a0
	beq.b loc_080742
	move.l #$2001000,d2
	movea.w ($276,a6),a0
	move.b #8,($2a0,a0)
	bra.w loc_080692

;##############################################
loc_08076a:
	move.b (4,a6),d0
	move.w loc_080776(pc,d0.w),d1
	jmp loc_080776(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080776:
	dc.w loc_08077e-loc_080776
	dc.w loc_0809b4-loc_080776
	dc.w loc_080a8a-loc_080776
	dc.w loc_080aa8-loc_080776

;==============================================
loc_08077e:
	cmpi.b #$2a,(3,a6)
	bcs.b loc_080798
	move.b #$e,(3,a6)
	st.b ($57,a6)
	st.b ($67,a6)
	clr.w ($3a,a6)

loc_080798:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b #1,($30,a6)
	movea.w ($36,a6),a4
	move.b ($e,a4),($e,a6)
	bsr.w loc_080c6c
	tst.b ($3a,a6)
	beq.b loc_0807ce
	move.w #whiteflash,(palrampointer,a5);Counter Hit Flash
	jsr loc_0035f2

loc_0807ce:
	moveq #0,d0
	move.w d0,($c,a6)
	move.w d0,($26,a6)
	move.b (3,a6),d0
	move.w loc_0807e4(pc,d0.w),d1
	jmp loc_0807e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0807e4:
	dc.w loc_08080e-loc_0807e4
	dc.w loc_08080e-loc_0807e4
	dc.w loc_08080e-loc_0807e4
	dc.w loc_08085a-loc_0807e4
	dc.w loc_08085a-loc_0807e4
	dc.w loc_08085a-loc_0807e4
	dc.w loc_08080e-loc_0807e4
	dc.w loc_0808ae-loc_0807e4

	dc.w loc_0808b6-loc_0807e4
	dc.w loc_0808b6-loc_0807e4
	dc.w loc_0808b6-loc_0807e4
	dc.w loc_0808c0-loc_0807e4
	dc.w loc_080908-loc_0807e4
	dc.w loc_080922-loc_0807e4
	dc.w loc_080922-loc_0807e4
	dc.w loc_080922-loc_0807e4

	dc.w loc_08095c-loc_0807e4
	dc.w loc_08096a-loc_0807e4
	dc.w loc_08096a-loc_0807e4
	dc.w loc_08096a-loc_0807e4
	dc.w loc_0809a0-loc_0807e4


;----------------------------------------------
loc_08080e:
	move.b #0,(9,a6)
	bsr.w loc_080adc
	tst.b ($59,a6)
	bne.b loc_08082a
	move.b #$ff,($c,a6)
	move.b #2,($d,a6)

loc_08082a:
	moveq #0,d0
	move.b (3,a6),d0
	lsr.b #1,d0
	move.b loc_080842(pc,d0.w),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080842:
	dc.b $01,$02,$03,$05
	dc.b $05,$05,$0a,$24
	dc.b $10,$15,$16,$1e
	dc.b $41,$00,$04,$09
	dc.b $43,$06,$07,$08
	dc.b $1f,$00,$00,$00

;----------------------------------------------
loc_08085a:
	move.b #0,(9,a6)
	bsr.w loc_080adc
	tst.b ($59,a6)
	bne.b loc_080876
	move.b #$ff,($c,a6)
	move.b #2,($d,a6)

loc_080876:
	jsr loc_01c2c8
	beq.b loc_0808aa
	move.l #$1000400,(a4)
	move.b (3,a6),(3,a4)
	addi.b #$1c,(3,a4)
	move.b ($59,a6),($59,a4)
	move.w ($36,a6),($36,a4)
	st.b ($67,a4)
	clr.w ($3a,a4)
	move.b #$ff,($57,a4)

loc_0808aa:
	bra.w loc_08082a

;----------------------------------------------
loc_0808ae:
	move.b #4,(4,a6)
	rts

;----------------------------------------------
loc_0808b6:
	move.b #0,(9,a6)
	bra.w loc_08082a

;----------------------------------------------
loc_0808c0:
	move.b #0,(9,a6)
	move.w ($64,a4),($14,a6)
	jsr loc_01c2c8
	beq.b loc_080904
	move.l #$1000428,(a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($59,a6),($59,a4)
	move.w ($36,a6),($36,a4)
	st.b ($67,a4)
	clr.w ($3a,a4)
	move.w a6,($38,a4)
	move.b #$ff,($57,a4)

loc_080904:
	bra.w loc_08082a

;----------------------------------------------
loc_080908:
	move.b #0,(9,a6)
	jsr loc_0035de
	bsr.w loc_080adc
	move.w ($10,a6),($40,a6)
	bra.w loc_08082a

;----------------------------------------------
loc_080922:
	move.b #0,(9,a6)
	bsr.w loc_080adc
	tst.b ($59,a6)
	bne.b loc_08093e
	move.b #$ff,($c,a6)
	move.b #2,($d,a6)

loc_08093e:
	move.b ($24c,a4),d0
	sub.b ($24d,a4),d0
	cmpi.b #$10,d0
	bgt.b loc_080958
	move.b #$ff,($c,a6)
	move.b #1,($d,a6)

loc_080958:
	bra.w loc_08082a

;----------------------------------------------
loc_08095c:
	move.b #0,(9,a6)
	bsr.w loc_080adc
	bra.w loc_08082a

;----------------------------------------------
loc_08096a:
	move.b #4,($9,a6)
	movea.l #loc_0df692,a0
	moveq #0,d1
	move.b ($102,a4),d1
	lsl.w #2,d1
	movea.l (a0,d1.w),a0
	move.l a0,($40,a6)
	bsr.w loc_080b28
	tst.b ($59,a6)
	bne.b loc_08099c
	move.b #$ff,($c,a6)
	move.b #2,($d,a6)

loc_08099c:
	bra.w loc_08082a

;----------------------------------------------
loc_0809a0:
	move.b #4,(9,a6)
	bsr.w loc_08082a
	moveq #0,d0
	cmpa.w ($38,a6),a6
	bcs.b loc_0809b4
	rts

;==============================================
loc_0809b4:
	move.b (3,a6),d0
	move.w loc_0809c0(pc,d0.w),d1
	jmp loc_0809c0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0809c0:
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0

	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_080a04-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0
	dc.w loc_0809ea-loc_0809c0

	dc.w loc_080a40-loc_0809c0
	dc.w loc_080a6c-loc_0809c0
	dc.w loc_080a6c-loc_0809c0
	dc.w loc_080a6c-loc_0809c0
	dc.w loc_0809ea-loc_0809c0

;----------------------------------------------
loc_0809ea:
	tst.b (pause_check,a5)
	bne.w loc_080aae
	tst.b ($33,a6)
	bmi.w loc_080a8a
	jsr loc_01b6b6
	bra.w loc_080aae

;----------------------------------------------
loc_080a04:
	jsr loc_01b6b6
	tst.b ($33,a6)
	bmi.w loc_080a8a
	tst.b ($34,a6)
	beq.b loc_080a2a
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	move.w d0,($10,a6)

loc_080a2a:
	tst.b ($35,a6)
	beq.b loc_080a3a
	clr.b ($35,a6)
	move.w ($40,a6),($10,a6)

loc_080a3a:
	jmp loc_01b4d0

;----------------------------------------------
loc_080a40:
	tst.b (pause_check,a5)
	bne.w loc_080aae
	tst.b ($33,a6)
	bmi.w loc_080a8a
	jsr loc_01bd5c
	move.w ($14,a3),d0
	addi.w #$80,d0
	move.w d0,($14,a6)
	jsr loc_01b6b6
	bra.w loc_080aae

;----------------------------------------------
loc_080a6c:
	tst.b (pause_check,a5)
	bne.w loc_080aae
	tst.b ($33,a6)
	bmi.w loc_080a8a
	bsr.w loc_080b28
	jsr loc_01b6b6
	bra.w loc_080aae

;==============================================
loc_080a8a:
	tst.b ($3a,a6)
	beq.w loc_080aa8
	subq.b #1,($3a,a6)
	bne.b loc_080aa6
	cmpi.w #whiteflash,(palrampointer,a5)
	bne.b loc_080aa6
	move.w #Mainpalette,(palrampointer,a5)

loc_080aa6:
	rts

;==============================================
loc_080aa8:
	jmp loc_01c2de

;----------------------------------------------
loc_080aae:
	tst.b ($3a,a6)
	beq.b loc_080ac8
	subq.b #1,($3a,a6)
	bne.b loc_080ac8
	cmpi.w #whiteflash,(palrampointer,a5)
	bne.b loc_080ac8
	move.w #Mainpalette,(palrampointer,a5)

loc_080ac8:
	jmp loc_01b4d0

;----------------------------------------------
loc_080ace:
	move.b #0,($c,a6)
	move.b #0,($d,a6)
	rts

;----------------------------------------------
loc_080adc:
	tst.b ($67,a6)
	bne.b loc_080b06
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_080b08(pc,d0.w),d0
	add.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_080b08(pc,d0.w),d0
	add.w d0,($14,a6)

loc_080b06:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080b08:
	dc.w $0000,$0000,$0004,$fffc
	dc.w $ffff,$ffff,$0001,$0001
	dc.w $fffe,$fffe,$0002,$0002
	dc.w $fffd,$fffd,$0003,$0003

;----------------------------------------------
loc_080b28:
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	movea.l ($1c,a4),a2
	move.b ($11,a2),d1
	andi.w #$f,d1
	add.w d1,d1
	movea.l ($40,a6),a0
	move.b (a0,d1.w),d2
	move.b (1,a0,d1.w),d3
	ext.w d2
	ext.w d3
	move.b ($b,a4),($b,a6)
	andi.b #1,($b,a6)
	beq.b loc_080b66
	neg.w d2

loc_080b66:
	add.w d2,($10,a6)
	add.w d3,($14,a6)
	rts

;##############################################
loc_080b70:
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.w ($38,a6),a1

loc_080b82:
	jsr loc_01c2c8
	beq.w loc_080c2a
	move.l #$1000400,(a4)
	move.b ($14,a3),(3,a4)
	move.w a1,($36,a4)
	move.b ($f,a3),($57,a4)
	move.b ($59,a6),($59,a4)
	st.b ($67,a4)
	clr.w ($3a,a4)
	tst.w ($50,a1)
	bpl.b loc_080bbc
	move.b #2,($3b,a4)

loc_080bbc:
	jsr RNGFunction
	move.w (6,a3),d2
	and.w d2,d0
	lsr.w #1,d2
	sub.w d0,d2
	add.w (2,a3),d2
	jsr RNGFunction
	move.w (4,a3),d1
	and.w d1,d0
	lsr.w #1,d1
	sub.w d0,d1
	add.w (a3),d1
	tst.b ($e,a3)
	bne.b loc_080c02
	move.b ($b,a6),($b,a4)
	andi.b #1,($b,a4)
	beq.b loc_080bf8
	neg.w d1

loc_080bf8:
	add.w ($10,a6),d1
	add.w ($14,a6),d2
	bra.b loc_080c1a

loc_080c02:
	move.b ($b,a1),($b,a4)
	andi.b #1,($b,a4)
	beq.b loc_080c12
	neg.w d1

loc_080c12:
	add.w ($10,a1),d1
	add.w ($14,a1),d2

loc_080c1a:
	move.w d1,($10,a4)
	move.w d2,($14,a4)
	move.b ($b,a3),d0
	eor.b d0,($b,a4)

loc_080c2a:
	rts

;==============================================
;Alpha Counter
loc_080c2c:
	jsr loc_01c2c8
	beq.w loc_080c6a
	move.l #$1000420,(a4)
	move.w a6,($36,a4)
	move.b #$ff,($57,a4)
	move.b ($59,a6),($59,a4)
	st.b ($67,a4)
	clr.w ($3a,a4)
	move.b ($b,a6),($b,a4)
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)

loc_080c6a:
	rts

;==============================================
loc_080c6c:
	move.b ($57,a6),d0
	bmi.w loc_080cd0
	bne.w loc_080cae
	jsr loc_0032a4
	move.b ($102,a4),d0
	move.l #$10004040,d1
	btst d0,d1
	beq.b loc_080c9e
	move.l #$23a,d1
	cmpi.b #$1c,d0
	bne.b loc_080ca4
	tst.b ($6a,a4)
	bne.b loc_080ca4

loc_080c9e:
	move.l #$239,d1

loc_080ca4:
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

loc_080cae:
	jsr loc_0032a4
	lea.l loc_080cd2(pc),a0
	ext.w d0
	lsl.w #3,d0
	add.b ($3b,a6),d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	move.w (a0,d0.w),d1
	jmp loc_003938

loc_080cd0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080cd2:
	dc.w $0239,$0239,$0239,$0000
	dc.w $0200,$0210,$0201,$0000
	dc.w $0201,$0211,$0202,$0000
	dc.w $0202,$0212,$0202,$0000
	dc.w $0203,$0213,$0203,$0000
	dc.w $0204,$0214,$0205,$0000
	dc.w $0205,$0215,$0206,$0000
	dc.w $0206,$0216,$0206,$0000
	dc.w $0207,$0217,$0207,$0000
	dc.w $0208,$0218,$0209,$0000
	dc.w $0209,$0219,$020a,$0000
	dc.w $020a,$021a,$020a,$0000
	dc.w $020b,$021b,$020b,$0000
	dc.w $020c,$021c,$020c,$0000
	dc.w $020d,$021d,$020d,$0000
	dc.w $020e,$021e,$020e,$0000
	dc.w $020f,$021f,$020f,$0000
	dc.w $0238,$0238,$0238,$0000
	dc.w $023b,$023b,$023b,$0000

;==============================================
loc_080d6a:
	move.b (4,a6),d0
	move.w loc_080d76(pc,d0.w),d1
	jmp loc_080d76(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080d76:
	dc.w loc_080d7e-loc_080d76
	dc.w loc_080d9e-loc_080d76
	dc.w loc_080db6-loc_080d76
	dc.w loc_080db6-loc_080d76

;----------------------------------------------
loc_080d7e:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.w #$6000,($1a,a6)
	move.b ($3c,a6),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_080d9e:
	tst.b ($33,a6)
	bpl.b loc_080daa
	move.b #4,(4,a6)

loc_080daa:
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_080db6:
	jmp loc_01c2de

;==============================================
loc_080dbc:
	moveq #0,d0
	moveq #0,d1
	moveq #$10,d2
	bra.w loc_080fd4

loc_080dc6:
	moveq #0,d0
	moveq #0,d1
	moveq #$11,d2
	bra.w loc_080fd4

loc_080dd0:
	moveq #0,d0
	moveq #2,d1
	moveq #$f,d2
	bra.w loc_080fd4

loc_080dda:
	moveq #0,d0
	moveq #2,d1
	moveq #$b,d2
	bra.w loc_080fd4

loc_080de4:
	moveq #0,d0
	moveq #2,d1
	moveq #$c,d2
	bra.w loc_080fd4

loc_080dee:
	moveq #0,d0
	moveq #2,d1
	moveq #$d,d2
	bra.w loc_080fd4

loc_080df8:
	moveq #0,d0
	moveq #2,d1
	moveq #$e,d2
	bra.w loc_080fd4

loc_080e02:
	moveq #0,d0
	moveq #2,d1
	moveq #$20,d2
	bra.w loc_080fd4

loc_080e0c:
	moveq #0,d0
	moveq #2,d1
	moveq #$21,d2
	bra.w loc_080fd4

loc_080e16:
	moveq #0,d0
	moveq #2,d1
	moveq #$22,d2
	bra.w loc_080fd4

loc_080e20:
	moveq #0,d0
	moveq #2,d1
	moveq #$c,d2
	bra.w loc_080f46

loc_080e2a:
	moveq #0,d0
	moveq #2,d1
	moveq #$d,d2
	bra.w loc_080f46

loc_080e34:
	moveq #0,d0
	moveq #2,d1
	moveq #$a,d2
	bra.w loc_08105a

loc_080e3e:
	moveq #0,d0
	moveq #2,d1
	moveq #$f,d2
	bra.w loc_08105a

loc_080e48:
	moveq #0,d0
	moveq #2,d1
	moveq #$30,d2
	bra.w loc_08105a

loc_080e52:
	moveq #0,d0
	moveq #2,d1
	moveq #$15,d2
	bra.w loc_08105a

loc_080e5c:
	moveq #0,d0
	moveq #2,d1
	moveq #$16,d2
	bra.w loc_08105a

loc_080e66:
	moveq #0,d0
	moveq #2,d1
	moveq #$d,d2
	bra.w loc_08105a

loc_080e70:
	moveq #0,d0
	moveq #2,d1
	moveq #$1e,d2
	bsr.w loc_080f88
	moveq #0,d0
	moveq #4,d1
	moveq #$1f,d2
	bra.w loc_080f88

;Push Block GFX
loc_080e84:
	moveq #0,d0
	moveq #2,d1
	moveq #$4f,d2
	bra.w loc_08105a

;Alpha Counter Flash
loc_080e8e:
	moveq #0,d0
	moveq #4,d1
	moveq #$12,d2
	jsr loc_080f46(pc)
	nop
	beq.b loc_080eba
	move.b ($102,a6),d1
	lsl.w #2,d1
	move.w loc_080ec6(pc,d1.w),d0
	move.w loc_080ec6+2(pc,d1.w),d1
	tst.b ($b,a6)
	bne.b loc_080eb2
	neg.w d0

loc_080eb2:
	add.w d0,($10,a4)
	add.w d1,($14,a4)

loc_080eba:
	jsr loc_080c2c
	jmp loc_0035ca

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_080ec6:
	dc.w $0021,$004c
	dc.w $0021,$004c
	dc.w $0021,$004c
	dc.w $0036,$003d
	dc.w $0008,$003f
	dc.w $002b,$0039
	dc.w $0021,$004b
	dc.w $0014,$004e
	dc.w $0028,$0035
	dc.w $0032,$004e
	dc.w $0029,$004e
	dc.w $0025,$005b
	dc.w $0043,$0051
	dc.w $001c,$0040
	dc.w $001a,$0048
	dc.w $003d,$004e
	dc.w $004c,$0061
	dc.w $0012,$004e
	dc.w $0008,$003f
	dc.w $0012,$004e
	dc.w $0021,$004c
	dc.w $001c,$0040
	dc.w $fff3,$0042
	dc.w $0021,$004c
	dc.w $001c,$0054
	dc.w $0020,$0048
	dc.w $0018,$004e
	dc.w $0021,$004c
	dc.w $0008,$003f
	dc.w $001c,$0040
	dc.w $fff3,$0042
	dc.w $fff3,$0042

;==============================================
loc_080f46:
	jsr loc_01c2c8
	beq.b loc_080f86
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.b d0,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b d1,(9,a4)
	move.b d2,($3c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)
	move.w ($18,a6),($18,a4)
	clr.w ($c,a4)
	moveq #1,d0

loc_080f86:
	rts

;==============================================
loc_080f88:
	jsr loc_01c2c8
	beq.b loc_080fd2
	movea.w ($38,a6),a0
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.b d0,(3,a4)
	move.b ($e,a0),($e,a4)
	move.b d1,(9,a4)
	move.b d2,($3c,a4)
	move.w ($10,a0),($10,a4)
	move.w ($64,a0),($14,a4)
	move.b ($b,a0),($b,a4)
	andi.b #1,($b,a4)
	move.w ($18,a6),($18,a4)
	clr.w ($c,a4)
	moveq #1,d0

loc_080fd2:
	rts

;==============================================
loc_080fd4:
	jsr loc_01c2c8
	beq.b loc_081038
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.b d0,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b d1,(9,a4)
	move.b d2,($3c,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($18,a6),($18,a4)
	clr.w ($c,a4)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_08103a(pc,d0.w),d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_08103a(pc,d0.w),d0
	add.w d0,($14,a4)
	moveq #1,d0

loc_081038:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08103a:
	dc.w $0000,$0000,$0004,$fffc,$ffff,$ffff,$0001,$0001
	dc.w $fffe,$fffe,$0002,$0002,$fffd,$fffd,$0003,$0003

;==============================================
loc_08105a:
	jsr loc_01c2c8
	beq.b loc_0810a6
	addq.b #1,(a4)
	move.b #5,(2,a4)
	move.b d0,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b d1,(9,a4)
	move.b d2,($3c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)
	bne.b loc_081092
	neg.w d3

loc_081092:
	add.w d3,($10,a4)
	add.w d4,($14,a4)
	move.w ($18,a6),($18,a4)
	clr.w ($c,a4)
	moveq #1,d0

loc_0810a6:
	rts

;==============================================
;KO Super Flash 1
loc_0810a8:
	tst.b ($162,a5)
	bne.w loc_0810f8
	jsr loc_01c2c8
	beq.w loc_0810f8
	addq.b #1,(a4)
	move.b #6,(2,a4)
	move.b ($12b,a5),(3,a4)
	move.b ($148,a5),($31,a4)
	move.b ($b,a6),($3c,a4)
	st.b ($162,a5)
	move.b #$90,(Set_GC_Flash_BG,a5)
	moveq #0,d0
	move.b d0,(Reset_GaurdTag,a5)
	move.b d0,($66e,a5)
	move.b d0,($a6e,a5)
	move.b d0,($e6e,a5)
	move.b d0,($126e,a5)
	moveq #1,d0
	rts

loc_0810f8:
	moveq #0,d0
	rts

;==============================================
;KO Super Flash 2
loc_0810fc:
	tst.b ($162,a5)
	bne.b loc_0810f8
	movea.w a4,a3
	jsr loc_01c2c8
	beq.b loc_0810f8
	addq.b #1,(a4)
	move.b #6,(2,a4)
	move.b ($12b,a5),(3,a4)
	move.b ($148,a5),($31,a4)
	move.b ($b,a3),($3c,a4)
	st.b ($162,a5)
	move.b #$90,(Set_GC_Flash_BG,a5)
	moveq #0,d0
	move.b d0,(Reset_GaurdTag,a5)
	move.b d0,($66e,a5)
	move.b d0,($a6e,a5)
	move.b d0,($e6e,a5)
	move.b d0,($126e,a5)
	moveq #1,d0
	rts

;==============================================
loc_08114a:
	move.b (4,a6),d0
	move.w loc_081156(pc,d0.w),d1
	jmp loc_081156(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081156:
	dc.w loc_08115e-loc_081156
	dc.w loc_081246-loc_081156
	dc.w loc_08131c-loc_081156
	dc.w loc_08131c-loc_081156

;----------------------------------------------
loc_08115e:
	tst.b (Set_GC_Flash_BG,a5)
	beq.w loc_082a58
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($3f,a6)
	move.w d0,($3a,a6)
	move.b #6,(9,a6)
	move.b d0,($b,a6)
	move.w #$11e,($c,a6)
	move.b #0,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b #1,($30,a6)
	bsr.w loc_081486
	moveq #0,d1
	move.b (3,a6),d1
	move.b loc_0811d2(pc,d1.w),d0
	lsl.w #2,d1
	move.w loc_0811ea(pc,d1.w),($10,a6)
	move.w loc_0811ea+2(pc,d1.w),($14,a6)
	bsr.w loc_081384
	movea.l #loc_2f40ce,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0811d2:
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$08
	dc.b $01,$00,$00,$00
	dc.b $02,$03,$04,$05
	dc.b $06,$07,$0f,$0f
	dc.b $0c,$0c,$09,$00

loc_0811ea:
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $00d8,$00f0
	dc.w $00c0,$00b0
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0058,$0098
	dc.w $0068,$0100
	dc.w $0180,$00d0
	dc.w $0100,$0088
	dc.w $00e0,$0100
	dc.w $00a0,$0060
	dc.w $00c0,$ffc0
	dc.w $00c0,$ffc0
	dc.w $0040,$0180
	dc.w $0040,$ff80
	dc.w $00c0,$0040

;----------------------------------------------
loc_081246:
	tst.b (Set_GC_Flash_BG,a5)
	beq.w loc_082a58
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_08125c(pc,d0.w),d1
	jmp loc_08125c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08125c:
	dc.w loc_08128e-loc_08125c
	dc.w loc_08128a-loc_08125c
	dc.w loc_08128a-loc_08125c
	dc.w loc_08128a-loc_08125c
	dc.w loc_08128a-loc_08125c
	dc.w loc_08128a-loc_08125c
	dc.w loc_08128e-loc_08125c
	dc.w loc_0812d4-loc_08125c
	dc.w loc_081296-loc_08125c
	dc.w loc_08128e-loc_08125c
	dc.w loc_08128e-loc_08125c
	dc.w loc_0812f0-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812f2-loc_08125c
	dc.w loc_0812fe-loc_08125c
	dc.w loc_0812fe-loc_08125c
	dc.w loc_0812fe-loc_08125c
	dc.w loc_0812fe-loc_08125c
	dc.w loc_0812fe-loc_08125c


;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08128a:
	bsr.w loc_081322

loc_08128e:
	lea.l ($50,a6),a4
	bra.w loc_0814fa

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_081296:
	tst.b ($3f,a6)
	bne.b loc_0812d4
	subq.b #1,($3b,a6)
	bpl.b loc_0812d4
	moveq #0,d0
	move.b ($3a,a6),d0
	move.b loc_0812e2(pc,d0.w),($3b,a6)
	move.b loc_0812e2+1(pc,d0.w),d1
	bpl.b loc_0812bc
	st.b ($3f,a6)
	bra.w loc_0812d4

loc_0812bc:
	addq.b #2,($3a,a6)
	jsr loc_01c2c8
	beq.b loc_0812d4
	addq.b #1,(a4)
	move.b #6,(2,a4)
	move.b d1,(3,a4)

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0812d4:
	lea.l ($50,a6),a4
	bsr.w loc_0814fa
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0812e2:
	dc.b $04,$0f
	dc.b $02,$0c
	dc.b $04,$11
	dc.b $03,$0e
	dc.b $04,$10
	dc.b $05,$0d
	dc.b $ff,$ff

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0812f0:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0812f2:
	jsr loc_01b6b6
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0812fe:
	subq.b #1,($3a,a6)
	bmi.w loc_082a58
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jmp loc_01b4ec

;----------------------------------------------
loc_08131c:
	jmp loc_01c2de

;----------------------------------------------
loc_081322:
	move.b ($31,a6),d2
	beq.b loc_081372
	moveq #$f,d1
	cmpi.b #2,d2
	beq.b loc_081332
	moveq #7,d1

loc_081332:
	move.b ($b4,a5),d0
	and.b d1,d0
	bne.b loc_081372
	jsr loc_01c2c8
	beq.b loc_081372
	addq.b #1,(a4)
	move.b #6,(2,a4)
	moveq #$11,d0
	add.b (3,a6),d0
	move.b d0,(3,a4)
	move.b ($3c,a6),($3c,a4)
	jsr RNGFunction
	andi.w #7,d0
	cmpi.b #2,d2
	beq.b loc_08136c
	addq.w #8,d0

loc_08136c:
	move.b loc_081374(pc,d0.w),($31,a4)

loc_081372:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081374:
	dc.b $00,$00,$00,$00
	dc.b $00,$01,$01,$01
	dc.b $00,$00,$01,$01
	dc.b $02,$02,$02,$02

;----------------------------------------------
loc_081384:
	moveq #0,d1
	move.b (3,a6),d1
	subi.b #$12,d1
	bcs.b loc_08139e
	move.w d0,d5
	add.w d1,d1
	move.w loc_0813a0(pc,d1.w),d1
	jsr loc_0813a0(pc,d1.w)
	move.w d5,d0

loc_08139e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0813a0:
	dc.w loc_0813aa-loc_0813a0
	dc.w loc_0813b6-loc_0813a0
	dc.w loc_08140e-loc_0813a0
	dc.w loc_081416-loc_0813a0
	dc.w loc_081444-loc_0813a0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0813aa:
	move.l #$48000,d1
	move.w #$ff80,d3
	bra.b loc_0813c6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0813b6:
	move.l #$fffb8000,d1
	move.w #$80,d3
	move.b #1,($b,a6)

loc_0813c6:
	moveq #0,d4
	move.b ($31,a6),d4
	add.w d4,d5
	move.l #$90000,d0
	move.w #$ff00,d2
	asl.l d4,d0
	asl.l d4,d1
	tst.b ($3c,a6)
	beq.b loc_0813ea
	neg.l d0
	neg.l d1
	neg.w d2
	neg.w d3

loc_0813ea:
	move.l d0,($40,a6)
	move.l d1,($44,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	add.w d0,d3
	add.w d2,($10,a6)
	move.w d3,($14,a6)
	move.b #$30,($3a,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08140e:
	move.l #$fffa0000,d1
	bra.b loc_08141c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_081416:
	move.l #$60000,d1

loc_08141c:
	moveq #0,d0
	move.l d0,($40,a6)
	move.b ($31,a6),d0
	add.w d0,d5
	asl.l d0,d1
	move.l d1,($44,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	add.w d0,($10,a6)
	move.b #$30,($3a,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_081444:
	move.l #$90000,d1
	move.l #$ffffff00,d3
	moveq #0,d0
	move.l d0,($44,a6)
	move.b ($31,a6),d0
	add.w d0,d5
	asl.l d0,d1
	tst.b ($3c,a6)
	beq.b loc_081468
	neg.l d1
	neg.w d3

loc_081468:
	move.l d1,($40,a6)
	jsr RNGFunction
	andi.w #$7f,d0
	add.w d3,($10,a6)
	add.w d0,($14,a6)
	move.b #$30,($3a,a6)
	rts

;----------------------------------------------
loc_081486:
	moveq #0,d0
	move.b (3,a6),d0
	move.b loc_0814ba(pc,d0.w),d0
	bmi.w loc_081520
	cmpi.b #8,d0
	bcc.b loc_0814aa
	add.w d0,d0
	add.b ($3c,a6),d0
	move.b loc_0814d2(pc,d0.w),d1
	move.b ($31,a6),d0
	add.b d1,d0

loc_0814aa:
	lea.l ($50,a6),a4
	lea.l loc_081522(pc),a0
	bsr.b loc_0814e0
	jmp loc_003556

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0814ba:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$09
	dc.b $0a,$08,$09,$ff
	dc.b $ff,$ff,$ff,$ff
	dc.b $ff,$ff,$ff,$ff
	dc.b $ff,$ff,$ff,$ff

loc_0814d2:
	dc.b $00,$00,$01,$00
	dc.b $00,$01,$00,$00
	dc.b $01,$01,$00,$01
	dc.b $01,$01

;----------------------------------------------
loc_0814e0:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_0814ee:
	move.l a0,(4,a4)
	move.l (a0),(a4)
	jmp loc_01b738

;----------------------------------------------
loc_0814fa:
	subq.b #1,(a4)
	bne.b loc_081520
	movea.l (4,a4),a0
	move.b (1,a0),d0
	beq.b loc_081510
	bmi.b loc_081516
	btst #6,d0
	bne.b loc_08151c

loc_081510:
	lea.l (8,a0),a0
	bra.b loc_0814ee

loc_081516:
	movea.l (8,a0),a0
	bra.b loc_0814ee

loc_08151c:
	st.b (1,a4)

loc_081520:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081522:
	dc.w loc_081948-loc_081522
	dc.w loc_081a2c-loc_081522
	dc.w loc_081b10-loc_081522
	dc.w loc_081bf4-loc_081522
	dc.w loc_081cd8-loc_081522
	dc.w loc_081dbc-loc_081522
	dc.w loc_081780-loc_081522
	dc.w loc_081864-loc_081522
	dc.w loc_081ea0-loc_081522
	dc.w loc_08161c-loc_081522
	dc.w loc_081538-loc_081522

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081538:
	dc.w $0200,$0000
	dc.l loc_082068
	dc.w $0200,$0000
	dc.l loc_082074
	dc.w $0200,$0000
	dc.l loc_082080
	dc.w $0200,$0000
	dc.l loc_08208c
	dc.w $0200,$0000
	dc.l loc_082098
	dc.w $0200,$0000
	dc.l loc_0820a4
	dc.w $0200,$0000
	dc.l loc_0820b0
	dc.w $0200,$0000
	dc.l loc_0820bc
	dc.w $0200,$0000
	dc.l loc_0820c8
	dc.w $0200,$0000
	dc.l loc_0820d4
	dc.w $0200,$0000
	dc.l loc_0820e0
	dc.w $0200,$0000
	dc.l loc_0820ec
	dc.w $0200,$0000
	dc.l loc_0820f8
	dc.w $0200,$0000
	dc.l loc_082104
	dc.w $0200,$0000
	dc.l loc_082110
	dc.w $0200,$0000
	dc.l loc_08211c
	dc.w $0200,$0000
	dc.l loc_082128
	dc.w $0200,$0000
	dc.l loc_082134
	dc.w $0200,$0000
	dc.l loc_082140
	dc.w $0200,$0000
	dc.l loc_08214c
	dc.w $0200,$0000
	dc.l loc_082158
	dc.w $0200,$0000
	dc.l loc_082164
	dc.w $0200,$0000
	dc.l loc_082170
	dc.w $0200,$0000
	dc.l loc_08217c
	dc.w $0200,$0000
	dc.l loc_082188
	dc.w $0200,$0000
	dc.l loc_082194
	dc.w $0200,$0000
	dc.l loc_0821a0
	dc.w $0280,$0000
	dc.l loc_0821ac
	dc.l loc_081538


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08161c:
	dc.w $0200,$0000
	dc.l loc_0821b8
	dc.w $0200,$0000
	dc.l loc_0821c4
	dc.w $0200,$0000
	dc.l loc_0821d0
	dc.w $0200,$0000
	dc.l loc_0821dc
	dc.w $0200,$0000
	dc.l loc_0821e8
	dc.w $0200,$0000
	dc.l loc_0821f4
	dc.w $0200,$0000
	dc.l loc_082200
	dc.w $0200,$0000
	dc.l loc_08220c
	dc.w $0200,$0000
	dc.l loc_082218
	dc.w $0200,$0000
	dc.l loc_082224
	dc.w $0200,$0000
	dc.l loc_082230
	dc.w $0200,$0000
	dc.l loc_08223c
	dc.w $0200,$0000
	dc.l loc_082248
	dc.w $0200,$0000
	dc.l loc_082254
	dc.w $0200,$0000
	dc.l loc_082260
	dc.w $0200,$0000
	dc.l loc_08226c

loc_08169c:
	dc.w $0200,$0000
	dc.l loc_082278
	dc.w $0200,$0000
	dc.l loc_082284
	dc.w $0200,$0000
	dc.l loc_082290
	dc.w $0200,$0000
	dc.l loc_08229c
	dc.w $0200,$0000
	dc.l loc_0822a8
	dc.w $0200,$0000
	dc.l loc_0822b4
	dc.w $0200,$0000
	dc.l loc_0822c0
	dc.w $0200,$0000
	dc.l loc_0822cc
	dc.w $0200,$0000
	dc.l loc_0822d8
	dc.w $0200,$0000
	dc.l loc_0822e4
	dc.w $0200,$0000
	dc.l loc_0822f0
	dc.w $0200,$0000
	dc.l loc_0822fc
	dc.w $0200,$0000
	dc.l loc_082308
	dc.w $0200,$0000
	dc.l loc_082314
	dc.w $0200,$0000
	dc.l loc_082320
	dc.w $0200,$0000
	dc.l loc_08232c
	dc.w $0200,$0000
	dc.l loc_082338
	dc.w $0200,$0000
	dc.l loc_082344
	dc.w $0200,$0000
	dc.l loc_082350
	dc.w $0200,$0000
	dc.l loc_08235c
	dc.w $0200,$0000
	dc.l loc_082368
	dc.w $0200,$0000
	dc.l loc_082374
	dc.w $0200,$0000
	dc.l loc_082380
	dc.w $0200,$0000
	dc.l loc_08238c
	dc.w $0200,$0000
	dc.l loc_082398
	dc.w $0200,$0000
	dc.l loc_0823a4
	dc.w $0200,$0000
	dc.l loc_0823b0
	dc.w $0280,$0000
	dc.l loc_0823bc
	dc.l loc_08169c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081780:
	dc.w $0200,$0000
	dc.l loc_0823c8
	dc.w $0200,$0000
	dc.l loc_0823d4
	dc.w $0200,$0000
	dc.l loc_0823e0
	dc.w $0200,$0000
	dc.l loc_0823ec
	dc.w $0200,$0000
	dc.l loc_0823f8
	dc.w $0200,$0000
	dc.l loc_082404
	dc.w $0200,$0000
	dc.l loc_082410
	dc.w $0200,$0000
	dc.l loc_08241c
	dc.w $0200,$0000
	dc.l loc_082428
	dc.w $0200,$0000
	dc.l loc_082434
	dc.w $0200,$0000
	dc.l loc_082440
	dc.w $0200,$0000
	dc.l loc_08244c
	dc.w $0200,$0000
	dc.l loc_082458
	dc.w $0200,$0000
	dc.l loc_082464
	dc.w $0200,$0000
	dc.l loc_082470
	dc.w $0200,$0000
	dc.l loc_08247c
	dc.w $0200,$0000
	dc.l loc_082488
	dc.w $0200,$0000
	dc.l loc_082494
	dc.w $0200,$0000
	dc.l loc_0824a0
	dc.w $0200,$0000
	dc.l loc_0824ac
	dc.w $0200,$0000
	dc.l loc_0824b8
	dc.w $0200,$0000
	dc.l loc_0824c4
	dc.w $0200,$0000
	dc.l loc_0824d0
	dc.w $0200,$0000
	dc.l loc_0824dc
	dc.w $0200,$0000
	dc.l loc_0824e8
	dc.w $0200,$0000
	dc.l loc_0824f4
	dc.w $0200,$0000
	dc.l loc_082500
	dc.w $0280,$0000
	dc.l loc_08250c
	dc.l loc_081780

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081864:
	dc.w $0200,$0000
	dc.l loc_08250c
	dc.w $0200,$0000
	dc.l loc_082500
	dc.w $0200,$0000
	dc.l loc_0824f4
	dc.w $0200,$0000
	dc.l loc_0824e8
	dc.w $0200,$0000
	dc.l loc_0824dc
	dc.w $0200,$0000
	dc.l loc_0824d0
	dc.w $0200,$0000
	dc.l loc_0824c4
	dc.w $0200,$0000
	dc.l loc_0824b8
	dc.w $0200,$0000
	dc.l loc_0824ac
	dc.w $0200,$0000
	dc.l loc_0824a0
	dc.w $0200,$0000
	dc.l loc_082494
	dc.w $0200,$0000
	dc.l loc_082488
	dc.w $0200,$0000
	dc.l loc_08247c
	dc.w $0200,$0000
	dc.l loc_082470
	dc.w $0200,$0000
	dc.l loc_082464
	dc.w $0200,$0000
	dc.l loc_082458
	dc.w $0200,$0000
	dc.l loc_08244c
	dc.w $0200,$0000
	dc.l loc_082440
	dc.w $0200,$0000
	dc.l loc_082434
	dc.w $0200,$0000
	dc.l loc_082428
	dc.w $0200,$0000
	dc.l loc_08241c
	dc.w $0200,$0000
	dc.l loc_082410
	dc.w $0200,$0000
	dc.l loc_082404
	dc.w $0200,$0000
	dc.l loc_0823f8
	dc.w $0200,$0000
	dc.l loc_0823ec
	dc.w $0200,$0000
	dc.l loc_0823e0
	dc.w $0200,$0000
	dc.l loc_0823d4
	dc.w $0280,$0000
	dc.l loc_0823c8
	dc.l loc_081864

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081948:
	dc.w $0200,$0000
	dc.l loc_082518
	dc.w $0200,$0000
	dc.l loc_082524
	dc.w $0200,$0000
	dc.l loc_082530
	dc.w $0200,$0000
	dc.l loc_08253c
	dc.w $0200,$0000
	dc.l loc_082548
	dc.w $0200,$0000
	dc.l loc_082554
	dc.w $0200,$0000
	dc.l loc_082560
	dc.w $0200,$0000
	dc.l loc_08256c
	dc.w $0200,$0000
	dc.l loc_082578
	dc.w $0200,$0000
	dc.l loc_082584
	dc.w $0200,$0000
	dc.l loc_082590
	dc.w $0200,$0000
	dc.l loc_08259c
	dc.w $0200,$0000
	dc.l loc_0825a8
	dc.w $0200,$0000
	dc.l loc_0825b4
	dc.w $0200,$0000
	dc.l loc_0825c0
	dc.w $0200,$0000
	dc.l loc_0825cc
	dc.w $0200,$0000
	dc.l loc_0825d8
	dc.w $0200,$0000
	dc.l loc_0825e4
	dc.w $0200,$0000
	dc.l loc_0825f0
	dc.w $0200,$0000
	dc.l loc_0825fc
	dc.w $0200,$0000
	dc.l loc_082608
	dc.w $0200,$0000
	dc.l loc_082614
	dc.w $0200,$0000
	dc.l loc_082620
	dc.w $0200,$0000
	dc.l loc_08262c
	dc.w $0200,$0000
	dc.l loc_082638
	dc.w $0200,$0000
	dc.l loc_082644
	dc.w $0200,$0000
	dc.l loc_082650
	dc.w $0280,$0000
	dc.l loc_08265c
	dc.l loc_081948

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081a2c:
	dc.w $0200,$0000
	dc.l loc_08265c
	dc.w $0200,$0000
	dc.l loc_082650
	dc.w $0200,$0000
	dc.l loc_082644
	dc.w $0200,$0000
	dc.l loc_082638
	dc.w $0200,$0000
	dc.l loc_08262c
	dc.w $0200,$0000
	dc.l loc_082620
	dc.w $0200,$0000
	dc.l loc_082614
	dc.w $0200,$0000
	dc.l loc_082608
	dc.w $0200,$0000
	dc.l loc_0825fc
	dc.w $0200,$0000
	dc.l loc_0825f0
	dc.w $0200,$0000
	dc.l loc_0825e4
	dc.w $0200,$0000
	dc.l loc_0825d8
	dc.w $0200,$0000
	dc.l loc_0825cc
	dc.w $0200,$0000
	dc.l loc_0825c0
	dc.w $0200,$0000
	dc.l loc_0825b4
	dc.w $0200,$0000
	dc.l loc_0825a8
	dc.w $0200,$0000
	dc.l loc_08259c
	dc.w $0200,$0000
	dc.l loc_082590
	dc.w $0200,$0000
	dc.l loc_082584
	dc.w $0200,$0000
	dc.l loc_082578
	dc.w $0200,$0000
	dc.l loc_08256c
	dc.w $0200,$0000
	dc.l loc_082560
	dc.w $0200,$0000
	dc.l loc_082554
	dc.w $0200,$0000
	dc.l loc_082548
	dc.w $0200,$0000
	dc.l loc_08253c
	dc.w $0200,$0000
	dc.l loc_082530
	dc.w $0200,$0000
	dc.l loc_082524
	dc.w $0280,$0000
	dc.l loc_082518
	dc.l loc_081a2c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081b10:
	dc.w $0200,$0000
	dc.l loc_082668
	dc.w $0200,$0000
	dc.l loc_082674
	dc.w $0200,$0000
	dc.l loc_082680
	dc.w $0200,$0000
	dc.l loc_08268c
	dc.w $0200,$0000
	dc.l loc_082698
	dc.w $0200,$0000
	dc.l loc_0826a4
	dc.w $0200,$0000
	dc.l loc_0826b0
	dc.w $0200,$0000
	dc.l loc_0826bc
	dc.w $0200,$0000
	dc.l loc_0826c8
	dc.w $0200,$0000
	dc.l loc_0826d4
	dc.w $0200,$0000
	dc.l loc_0826e0
	dc.w $0200,$0000
	dc.l loc_0826ec
	dc.w $0200,$0000
	dc.l loc_0826f8
	dc.w $0200,$0000
	dc.l loc_082704
	dc.w $0200,$0000
	dc.l loc_082710
	dc.w $0200,$0000
	dc.l loc_08271c
	dc.w $0200,$0000
	dc.l loc_082728
	dc.w $0200,$0000
	dc.l loc_082734
	dc.w $0200,$0000
	dc.l loc_082740
	dc.w $0200,$0000
	dc.l loc_08274c
	dc.w $0200,$0000
	dc.l loc_082758
	dc.w $0200,$0000
	dc.l loc_082764
	dc.w $0200,$0000
	dc.l loc_082770
	dc.w $0200,$0000
	dc.l loc_08277c
	dc.w $0200,$0000
	dc.l loc_082788
	dc.w $0200,$0000
	dc.l loc_082794
	dc.w $0200,$0000
	dc.l loc_0827a0
	dc.w $0280,$0000
	dc.l loc_0827ac
	dc.l loc_081b10

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081bf4:
	dc.w $0200,$0000
	dc.l loc_0827ac
	dc.w $0200,$0000
	dc.l loc_0827a0
	dc.w $0200,$0000
	dc.l loc_082794
	dc.w $0200,$0000
	dc.l loc_082788
	dc.w $0200,$0000
	dc.l loc_08277c
	dc.w $0200,$0000
	dc.l loc_082770
	dc.w $0200,$0000
	dc.l loc_082764
	dc.w $0200,$0000
	dc.l loc_082758
	dc.w $0200,$0000
	dc.l loc_08274c
	dc.w $0200,$0000
	dc.l loc_082740
	dc.w $0200,$0000
	dc.l loc_082734
	dc.w $0200,$0000
	dc.l loc_082728
	dc.w $0200,$0000
	dc.l loc_08271c
	dc.w $0200,$0000
	dc.l loc_082710
	dc.w $0200,$0000
	dc.l loc_082704
	dc.w $0200,$0000
	dc.l loc_0826f8
	dc.w $0200,$0000
	dc.l loc_0826ec
	dc.w $0200,$0000
	dc.l loc_0826e0
	dc.w $0200,$0000
	dc.l loc_0826d4
	dc.w $0200,$0000
	dc.l loc_0826c8
	dc.w $0200,$0000
	dc.l loc_0826bc
	dc.w $0200,$0000
	dc.l loc_0826b0
	dc.w $0200,$0000
	dc.l loc_0826a4
	dc.w $0200,$0000
	dc.l loc_082698
	dc.w $0200,$0000
	dc.l loc_08268c
	dc.w $0200,$0000
	dc.l loc_082680
	dc.w $0200,$0000
	dc.l loc_082674
	dc.w $0280,$0000
	dc.l loc_082668
	dc.l loc_081bf4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081cd8:
	dc.w $0200,$0000
	dc.l loc_0827b8
	dc.w $0200,$0000
	dc.l loc_0827c4
	dc.w $0200,$0000
	dc.l loc_0827d0
	dc.w $0200,$0000
	dc.l loc_0827dc
	dc.w $0200,$0000
	dc.l loc_0827e8
	dc.w $0200,$0000
	dc.l loc_0827f4
	dc.w $0200,$0000
	dc.l loc_082800
	dc.w $0200,$0000
	dc.l loc_08280c
	dc.w $0200,$0000
	dc.l loc_082818
	dc.w $0200,$0000
	dc.l loc_082824
	dc.w $0200,$0000
	dc.l loc_082830
	dc.w $0200,$0000
	dc.l loc_08283c
	dc.w $0200,$0000
	dc.l loc_082848
	dc.w $0200,$0000
	dc.l loc_082854
	dc.w $0200,$0000
	dc.l loc_082860
	dc.w $0200,$0000
	dc.l loc_08286c
	dc.w $0200,$0000
	dc.l loc_082878
	dc.w $0200,$0000
	dc.l loc_082884
	dc.w $0200,$0000
	dc.l loc_082890
	dc.w $0200,$0000
	dc.l loc_08289c
	dc.w $0200,$0000
	dc.l loc_0828a8
	dc.w $0200,$0000
	dc.l loc_0828b4
	dc.w $0200,$0000
	dc.l loc_0828c0
	dc.w $0200,$0000
	dc.l loc_0828cc
	dc.w $0200,$0000
	dc.l loc_0828d8
	dc.w $0200,$0000
	dc.l loc_0828e4
	dc.w $0200,$0000
	dc.l loc_0828f0
	dc.w $0280,$0000
	dc.l loc_0828fc
	dc.l loc_081cd8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081dbc:
	dc.w $0200,$0000
	dc.l loc_0828fc
	dc.w $0200,$0000
	dc.l loc_0828f0
	dc.w $0200,$0000
	dc.l loc_0828e4
	dc.w $0200,$0000
	dc.l loc_0828d8
	dc.w $0200,$0000
	dc.l loc_0828cc
	dc.w $0200,$0000
	dc.l loc_0828c0
	dc.w $0200,$0000
	dc.l loc_0828b4
	dc.w $0200,$0000
	dc.l loc_0828a8
	dc.w $0200,$0000
	dc.l loc_08289c
	dc.w $0200,$0000
	dc.l loc_082890
	dc.w $0200,$0000
	dc.l loc_082884
	dc.w $0200,$0000
	dc.l loc_082878
	dc.w $0200,$0000
	dc.l loc_08286c
	dc.w $0200,$0000
	dc.l loc_082860
	dc.w $0200,$0000
	dc.l loc_082854
	dc.w $0200,$0000
	dc.l loc_082848
	dc.w $0200,$0000
	dc.l loc_08283c
	dc.w $0200,$0000
	dc.l loc_082830
	dc.w $0200,$0000
	dc.l loc_082824
	dc.w $0200,$0000
	dc.l loc_082818
	dc.w $0200,$0000
	dc.l loc_08280c
	dc.w $0200,$0000
	dc.l loc_082800
	dc.w $0200,$0000
	dc.l loc_0827f4
	dc.w $0200,$0000
	dc.l loc_0827e8
	dc.w $0200,$0000
	dc.l loc_0827dc
	dc.w $0200,$0000
	dc.l loc_0827d0
	dc.w $0200,$0000
	dc.l loc_0827c4
	dc.w $0280,$0000
	dc.l loc_0827b8
	dc.l loc_081dbc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081ea0:
	dc.w $0200,$0000
	dc.l loc_082908
	dc.w $0200,$0000
	dc.l loc_082914
	dc.w $0200,$0000
	dc.l loc_082920
	dc.w $0200,$0000
	dc.l loc_08292c
	dc.w $0200,$0000
	dc.l loc_082938
	dc.w $0200,$0000
	dc.l loc_082944
	dc.w $0200,$0000
	dc.l loc_082950
	dc.w $0200,$0000
	dc.l loc_08295c
	dc.w $0200,$0000
	dc.l loc_082968
	dc.w $0200,$0000
	dc.l loc_082974
	dc.w $0200,$0000
	dc.l loc_082980
	dc.w $0200,$0000
	dc.l loc_08298c
	dc.w $0200,$0000
	dc.l loc_082998
	dc.w $0200,$0000
	dc.l loc_0829a4
	dc.w $0200,$0000
	dc.l loc_0829b0
	dc.w $0200,$0000
	dc.l loc_0829bc
	dc.w $0200,$0000
	dc.l loc_0829c8
	dc.w $0200,$0000
	dc.l loc_0829d4
	dc.w $0200,$0000
	dc.l loc_0829e0
	dc.w $0200,$0000
	dc.l loc_0829ec
	dc.w $0200,$0000
	dc.l loc_0829f8
	dc.w $0200,$0000
	dc.l loc_082a04
	dc.w $0200,$0000
	dc.l loc_082a10
	dc.w $0200,$0000
	dc.l loc_082a1c
	dc.w $0200,$0000
	dc.l loc_082a28
	dc.w $0200,$0000
	dc.l loc_082a34
	dc.w $0200,$0000
	dc.l loc_082a40
	dc.w $0280,$0000
	dc.l loc_082a4c
	dc.l loc_081ea0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_081f84:
	dc.w $0200,$0000
	dc.l loc_082a4c
	dc.w $0200,$0000
	dc.l loc_082a40
	dc.w $0200,$0000
	dc.l loc_082a34
	dc.w $0200,$0000
	dc.l loc_082a28
	dc.w $0200,$0000
	dc.l loc_082a1c
	dc.w $0200,$0000
	dc.l loc_082a10
	dc.w $0200,$0000
	dc.l loc_082a04
	dc.w $0200,$0000
	dc.l loc_0829f8
	dc.w $0200,$0000
	dc.l loc_0829ec
	dc.w $0200,$0000
	dc.l loc_0829e0
	dc.w $0200,$0000
	dc.l loc_0829d4
	dc.w $0200,$0000
	dc.l loc_0829c8
	dc.w $0200,$0000
	dc.l loc_0829bc
	dc.w $0200,$0000
	dc.l loc_0829b0
	dc.w $0200,$0000
	dc.l loc_0829a4
	dc.w $0200,$0000
	dc.l loc_082998
	dc.w $0200,$0000
	dc.l loc_08298c
	dc.w $0200,$0000
	dc.l loc_082980
	dc.w $0200,$0000
	dc.l loc_082974
	dc.w $0200,$0000
	dc.l loc_082968
	dc.w $0200,$0000
	dc.l loc_08295c
	dc.w $0200,$0000
	dc.l loc_082950
	dc.w $0200,$0000
	dc.l loc_082944
	dc.w $0200,$0000
	dc.l loc_082938
	dc.w $0200,$0000
	dc.l loc_08292c
	dc.w $0200,$0000
	dc.l loc_082920
	dc.w $0200,$0000
	dc.l loc_082914
	dc.w $0280,$0000
	dc.l loc_082908
	dc.l loc_081f84

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082068:
	dc.w $03c0,$0010,$0000,$0fe0,$0014,$0001

loc_082074:
	dc.w $03c0,$0010,$0020,$0fe0,$0014,$0021

loc_082080:
	dc.w $03c0,$0010,$0040,$0fe0,$0014,$0041

loc_08208c:
	dc.w $03c0,$0010,$0060,$0fe0,$0014,$0061

loc_082098:
	dc.w $03c0,$0010,$0080,$0fe0,$0014,$0081

loc_0820a4:
	dc.w $03c0,$0010,$00a0,$0fe0,$0014,$00a1

loc_0820b0:
	dc.w $03c0,$0010,$00c0,$0fe0,$0014,$00c1

loc_0820bc:
	dc.w $03c0,$0010,$00e0,$0fe0,$0014,$00e1

loc_0820c8:
	dc.w $03c0,$0010,$0100,$0fe0,$0014,$0101

loc_0820d4:
	dc.w $03c0,$0010,$0120,$0fe0,$0014,$0121

loc_0820e0:
	dc.w $03c0,$0010,$0140,$0fe0,$0014,$0141

loc_0820ec:
	dc.w $03c0,$0010,$0160,$0fe0,$0014,$0161

loc_0820f8:
	dc.w $03c0,$0010,$0180,$0fe0,$0014,$0181

loc_082104:
	dc.w $03c0,$0010,$01a0,$0fe0,$0014,$01a1

loc_082110:
	dc.w $03c0,$0010,$01c0,$0fe0,$0014,$01c1

loc_08211c:
	dc.w $03c0,$0010,$01e0,$0fe0,$0014,$01e1

loc_082128:
	dc.w $03c0,$0010,$0200,$0fe0,$0014,$0201

loc_082134:
	dc.w $03c0,$0010,$0220,$0fe0,$0014,$0221

loc_082140:
	dc.w $03c0,$0010,$0240,$0fe0,$0014,$0241

loc_08214c:
	dc.w $03c0,$0010,$0260,$0fe0,$0014,$0261

loc_082158:
	dc.w $03c0,$0010,$0280,$0fe0,$0014,$0281

loc_082164:
	dc.w $03c0,$0010,$02a0,$0fe0,$0014,$02a1

loc_082170:
	dc.w $03c0,$0010,$02c0,$0fe0,$0014,$02c1

loc_08217c:
	dc.w $03c0,$0010,$02e0,$0fe0,$0014,$02e1

loc_082188:
	dc.w $03c0,$0010,$0300,$0fe0,$0014,$0301

loc_082194:
	dc.w $03c0,$0010,$0320,$0fe0,$0014,$0321

loc_0821a0:
	dc.w $03c0,$0010,$0340,$0fe0,$0014,$0341

loc_0821ac:
	dc.w $03c0,$0010,$0360,$0fe0,$0014,$0361

loc_0821b8:
	dc.w $03c0,$0010,$0380,$0fe0,$0014,$0381

loc_0821c4:
	dc.w $03c0,$0010,$03a0,$0fe0,$0014,$03a1

loc_0821d0:
	dc.w $03c0,$0010,$03c0,$0fe0,$0014,$03c1

loc_0821dc:
	dc.w $03c0,$0010,$03e0,$0fe0,$0014,$03e1

loc_0821e8:
	dc.w $03c0,$0010,$0400,$0fe0,$0014,$0401

loc_0821f4:
	dc.w $03c0,$0010,$0420,$0fe0,$0014,$0421

loc_082200:
	dc.w $03c0,$0010,$0440,$0fe0,$0014,$0441

loc_08220c:
	dc.w $03c0,$0010,$0460,$0fe0,$0014,$0461

loc_082218:
	dc.w $03c0,$0010,$0480,$0fe0,$0014,$0481

loc_082224:
	dc.w $03c0,$0010,$04a0,$0fe0,$0014,$04a1

loc_082230:
	dc.w $03c0,$0010,$04c0,$0fe0,$0014,$04c1

loc_08223c:
	dc.w $03c0,$0010,$04e0,$0fe0,$0014,$04e1

loc_082248:
	dc.w $03c0,$0010,$0500,$0fe0,$0014,$0501

loc_082254:
	dc.w $03c0,$0010,$0520,$0fe0,$0014,$0521

loc_082260:
	dc.w $03c0,$0010,$0540,$0fe0,$0014,$0541

loc_08226c:
	dc.w $03c0,$0010,$0560,$0fe0,$0014,$0561

loc_082278:
	dc.w $03c0,$0010,$0580,$0fe0,$0014,$0581

loc_082284:
	dc.w $03c0,$0010,$05a0,$0fe0,$0014,$05a1

loc_082290:
	dc.w $03c0,$0010,$05c0,$0fe0,$0014,$05c1

loc_08229c:
	dc.w $03c0,$0010,$05e0,$0fe0,$0014,$05e1

loc_0822a8:
	dc.w $03c0,$0010,$0600,$0fe0,$0014,$0601

loc_0822b4:
	dc.w $03c0,$0010,$0620,$0fe0,$0014,$0621

loc_0822c0:
	dc.w $03c0,$0010,$0640,$0fe0,$0014,$0641

loc_0822cc:
	dc.w $03c0,$0010,$0660,$0fe0,$0014,$0661

loc_0822d8:
	dc.w $03c0,$0010,$0680,$0fe0,$0014,$0681

loc_0822e4:
	dc.w $03c0,$0010,$06a0,$0fe0,$0014,$06a1

loc_0822f0:
	dc.w $03c0,$0010,$06c0,$0fe0,$0014,$06c1

loc_0822fc:
	dc.w $03c0,$0010,$06e0,$0fe0,$0014,$06e1

loc_082308:
	dc.w $03c0,$0010,$0700,$0fe0,$0014,$0381

loc_082314:
	dc.w $03c0,$0010,$0720,$0fe0,$0014,$03a1

loc_082320:
	dc.w $03c0,$0010,$0740,$0fe0,$0014,$03c1

loc_08232c:
	dc.w $03c0,$0010,$0760,$0fe0,$0014,$03e1

loc_082338:
	dc.w $03c0,$0010,$0780,$0fe0,$0014,$0401

loc_082344:
	dc.w $03c0,$0010,$07a0,$0fe0,$0014,$0421

loc_082350:
	dc.w $03c0,$0010,$07c0,$0fe0,$0014,$0441

loc_08235c:
	dc.w $03c0,$0010,$07e0,$0fe0,$0014,$0461

loc_082368:
	dc.w $03c0,$0010,$0800,$0fe0,$0014,$0481

loc_082374:
	dc.w $03c0,$0010,$0820,$0fe0,$0014,$04a1

loc_082380:
	dc.w $03c0,$0010,$0840,$0fe0,$0014,$04c1

loc_08238c:
	dc.w $03c0,$0010,$0860,$0fe0,$0014,$04e1

loc_082398:
	dc.w $03c0,$0010,$0880,$0fe0,$0014,$0501

loc_0823a4:
	dc.w $03c0,$0010,$08a0,$0fe0,$0014,$0521

loc_0823b0:
	dc.w $03c0,$0010,$08c0,$0fe0,$0014,$0541

loc_0823bc:
	dc.w $03c0,$0010,$08e0,$0fe0,$0014,$0561

loc_0823c8:
	dc.w $03c0,$0014,$0700,$0fe0,$0014,$0701

loc_0823d4:
	dc.w $03c0,$0014,$0720,$0fe0,$0014,$0721

loc_0823e0:
	dc.w $03c0,$0014,$0740,$0fe0,$0014,$0741

loc_0823ec:
	dc.w $03c0,$0014,$0760,$0fe0,$0014,$0761

loc_0823f8:
	dc.w $03c0,$0014,$0780,$0fe0,$0014,$0781

loc_082404:
	dc.w $03c0,$0014,$07a0,$0fe0,$0014,$07a1

loc_082410:
	dc.w $03c0,$0014,$07c0,$0fe0,$0014,$07c1

loc_08241c:
	dc.w $03c0,$0014,$07e0,$0fe0,$0014,$07e1

loc_082428:
	dc.w $03c0,$0014,$0800,$0fe0,$0014,$0801

loc_082434:
	dc.w $03c0,$0014,$0820,$0fe0,$0014,$0821

loc_082440:
	dc.w $03c0,$0014,$0840,$0fe0,$0014,$0841

loc_08244c:
	dc.w $03c0,$0014,$0860,$0fe0,$0014,$0861

loc_082458:
	dc.w $03c0,$0014,$0880,$0fe0,$0014,$0881

loc_082464:
	dc.w $03c0,$0014,$08a0,$0fe0,$0014,$08a1

loc_082470:
	dc.w $03c0,$0014,$08c0,$0fe0,$0014,$08c1

loc_08247c:
	dc.w $03c0,$0014,$08e0,$0fe0,$0014,$08e1

loc_082488:
	dc.w $03c0,$0014,$0900,$0fe0,$0014,$0901

loc_082494:
	dc.w $03c0,$0014,$0920,$0fe0,$0014,$0921

loc_0824a0:
	dc.w $03c0,$0014,$0940,$0fe0,$0014,$0941

loc_0824ac:
	dc.w $03c0,$0014,$0960,$0fe0,$0014,$0961

loc_0824b8:
	dc.w $03c0,$0014,$0980,$0fe0,$0014,$0981

loc_0824c4:
	dc.w $03c0,$0014,$09a0,$0fe0,$0014,$09a1

loc_0824d0:
	dc.w $03c0,$0014,$09c0,$0fe0,$0014,$09c1

loc_0824dc:
	dc.w $03c0,$0014,$09e0,$0fe0,$0014,$09e1

loc_0824e8:
	dc.w $03c0,$0014,$0a00,$0fe0,$0014,$0a01

loc_0824f4:
	dc.w $03c0,$0014,$0a20,$0fe0,$0014,$0a21

loc_082500:
	dc.w $03c0,$0014,$0a40,$0fe0,$0014,$0a41

loc_08250c:
	dc.w $03c0,$0014,$0a60,$0fe0,$0014,$0a61

loc_082518:
	dc.w $03c0,$0014,$0a80,$0fe0,$0014,$0a81

loc_082524:
	dc.w $03c0,$0014,$0aa0,$0fe0,$0014,$0aa1

loc_082530:
	dc.w $03c0,$0014,$0ac0,$0fe0,$0014,$0ac1

loc_08253c:
	dc.w $03c0,$0014,$0ae0,$0fe0,$0014,$0ae1

loc_082548:
	dc.w $03c0,$0014,$0b00,$0fe0,$0014,$0b01

loc_082554:
	dc.w $03c0,$0014,$0b20,$0fe0,$0014,$0b21

loc_082560:
	dc.w $03c0,$0014,$0b40,$0fe0,$0014,$0b41

loc_08256c:
	dc.w $03c0,$0014,$0b60,$0fe0,$0014,$0b61

loc_082578:
	dc.w $03c0,$0014,$0b80,$0fe0,$0014,$0b81

loc_082584:
	dc.w $03c0,$0014,$0ba0,$0fe0,$0014,$0ba1

loc_082590:
	dc.w $03c0,$0014,$0bc0,$0fe0,$0014,$0bc1

loc_08259c:
	dc.w $03c0,$0014,$0be0,$0fe0,$0014,$0be1

loc_0825a8:
	dc.w $03c0,$0014,$0c00,$0fe0,$0014,$0c01

loc_0825b4:
	dc.w $03c0,$0014,$0c20,$0fe0,$0014,$0c21

loc_0825c0:
	dc.w $03c0,$0014,$0c40,$0fe0,$0014,$0c41

loc_0825cc:
	dc.w $03c0,$0014,$0c60,$0fe0,$0014,$0c61

loc_0825d8:
	dc.w $03c0,$0014,$0c80,$0fe0,$0014,$0c81

loc_0825e4:
	dc.w $03c0,$0014,$0ca0,$0fe0,$0014,$0ca1

loc_0825f0:
	dc.w $03c0,$0014,$0cc0,$0fe0,$0014,$0cc1

loc_0825fc:
	dc.w $03c0,$0014,$0ce0,$0fe0,$0014,$0ce1

loc_082608:
	dc.w $03c0,$0014,$0d00,$0fe0,$0014,$0d01

loc_082614:
	dc.w $03c0,$0014,$0d20,$0fe0,$0014,$0d21

loc_082620:
	dc.w $03c0,$0014,$0d40,$0fe0,$0014,$0d41

loc_08262c:
	dc.w $03c0,$0014,$0d60,$0fe0,$0014,$0d61

loc_082638:
	dc.w $03c0,$0014,$0d80,$0fe0,$0014,$0d81

loc_082644:
	dc.w $03c0,$0014,$0da0,$0fe0,$0014,$0da1

loc_082650:
	dc.w $03c0,$0014,$0dc0,$0fe0,$0014,$0dc1

loc_08265c:
	dc.w $03c0,$0014,$0de0,$0fe0,$0014,$0de1

loc_082668:
	dc.w $03c0,$0014,$0e00,$0fe0,$0014,$0e01

loc_082674:
	dc.w $03c0,$0014,$0e20,$0fe0,$0014,$0e21

loc_082680:
	dc.w $03c0,$0014,$0e40,$0fe0,$0014,$0e41

loc_08268c:
	dc.w $03c0,$0014,$0e60,$0fe0,$0014,$0e61

loc_082698:
	dc.w $03c0,$0014,$0e80,$0fe0,$0014,$0e81

loc_0826a4:
	dc.w $03c0,$0014,$0ea0,$0fe0,$0014,$0ea1

loc_0826b0:
	dc.w $03c0,$0014,$0ec0,$0fe0,$0014,$0ec1

loc_0826bc:
	dc.w $03c0,$0014,$0ee0,$0fe0,$0014,$0ee1

loc_0826c8:
	dc.w $03c0,$0014,$0f00,$0fe0,$0014,$0f01

loc_0826d4:
	dc.w $03c0,$0014,$0f20,$0fe0,$0014,$0f21

loc_0826e0:
	dc.w $03c0,$0014,$0f40,$0fe0,$0014,$0f41

loc_0826ec:
	dc.w $03c0,$0014,$0f60,$0fe0,$0014,$0f61

loc_0826f8:
	dc.w $03c0,$0014,$0f80,$0fe0,$0014,$0f81

loc_082704:
	dc.w $03c0,$0014,$0fa0,$0fe0,$0014,$0fa1

loc_082710:
	dc.w $03c0,$0014,$0fc0,$0fe0,$0014,$0fc1

loc_08271c:
	dc.w $03c0,$0014,$0fe0,$0fe0,$0014,$0fe1

loc_082728:
	dc.w $03c0,$0014,$1000,$0fe0,$0014,$1001

loc_082734:
	dc.w $03c0,$0014,$1020,$0fe0,$0014,$1021

loc_082740:
	dc.w $03c0,$0014,$1040,$0fe0,$0014,$1041

loc_08274c:
	dc.w $03c0,$0014,$1060,$0fe0,$0014,$1061

loc_082758:
	dc.w $03c0,$0014,$1080,$0fe0,$0014,$1081

loc_082764:
	dc.w $03c0,$0014,$10a0,$0fe0,$0014,$10a1

loc_082770:
	dc.w $03c0,$0014,$10c0,$0fe0,$0014,$10c1

loc_08277c:
	dc.w $03c0,$0014,$10e0,$0fe0,$0014,$10e1

loc_082788:
	dc.w $03c0,$0014,$1100,$0fe0,$0014,$1101

loc_082794:
	dc.w $03c0,$0014,$1120,$0fe0,$0014,$1121

loc_0827a0:
	dc.w $03c0,$0014,$1140,$0fe0,$0014,$1141

loc_0827ac:
	dc.w $03c0,$0014,$1160,$0fe0,$0014,$1161

loc_0827b8:
	dc.w $03c0,$0014,$1180,$0fe0,$0014,$1181

loc_0827c4:
	dc.w $03c0,$0014,$11a0,$0fe0,$0014,$11a1

loc_0827d0:
	dc.w $03c0,$0014,$11c0,$0fe0,$0014,$11c1

loc_0827dc:
	dc.w $03c0,$0014,$11e0,$0fe0,$0014,$11e1

loc_0827e8:
	dc.w $03c0,$0014,$1200,$0fe0,$0014,$1201

loc_0827f4:
	dc.w $03c0,$0014,$1220,$0fe0,$0014,$1221

loc_082800:
	dc.w $03c0,$0014,$1240,$0fe0,$0014,$1241

loc_08280c:
	dc.w $03c0,$0014,$1260,$0fe0,$0014,$1261

loc_082818:
	dc.w $03c0,$0014,$1280,$0fe0,$0014,$1281

loc_082824:
	dc.w $03c0,$0014,$12a0,$0fe0,$0014,$12a1

loc_082830:
	dc.w $03c0,$0014,$12c0,$0fe0,$0014,$12c1

loc_08283c:
	dc.w $03c0,$0014,$12e0,$0fe0,$0014,$12e1

loc_082848:
	dc.w $03c0,$0014,$1300,$0fe0,$0014,$1301

loc_082854:
	dc.w $03c0,$0014,$1320,$0fe0,$0014,$1321

loc_082860:
	dc.w $03c0,$0014,$1340,$0fe0,$0014,$1341

loc_08286c:
	dc.w $03c0,$0014,$1360,$0fe0,$0014,$1361

loc_082878:
	dc.w $03c0,$0014,$1380,$0fe0,$0014,$1381

loc_082884:
	dc.w $03c0,$0014,$13a0,$0fe0,$0014,$13a1

loc_082890:
	dc.w $03c0,$0014,$13c0,$0fe0,$0014,$13c1

loc_08289c:
	dc.w $03c0,$0014,$13e0,$0fe0,$0014,$13e1

loc_0828a8:
	dc.w $03c0,$0014,$1400,$0fe0,$0014,$1401

loc_0828b4:
	dc.w $03c0,$0014,$1420,$0fe0,$0014,$1421

loc_0828c0:
	dc.w $03c0,$0014,$1440,$0fe0,$0014,$1441

loc_0828cc:
	dc.w $03c0,$0014,$1460,$0fe0,$0014,$1461

loc_0828d8:
	dc.w $03c0,$0014,$1480,$0fe0,$0014,$1481

loc_0828e4:
	dc.w $03c0,$0014,$14a0,$0fe0,$0014,$14a1

loc_0828f0:
	dc.w $03c0,$0014,$14c0,$0fe0,$0014,$14c1

loc_0828fc:
	dc.w $03c0,$0014,$14e0,$0fe0,$0014,$14e1

loc_082908:
	dc.w $03c0,$0014,$1500,$0fe0,$0014,$1501

loc_082914:
	dc.w $03c0,$0014,$1520,$0fe0,$0014,$1521

loc_082920:
	dc.w $03c0,$0014,$1540,$0fe0,$0014,$1541

loc_08292c:
	dc.w $03c0,$0014,$1560,$0fe0,$0014,$1561

loc_082938:
	dc.w $03c0,$0014,$1580,$0fe0,$0014,$1581

loc_082944:
	dc.w $03c0,$0014,$15a0,$0fe0,$0014,$15a1

loc_082950:
	dc.w $03c0,$0014,$15c0,$0fe0,$0014,$15c1

loc_08295c:
	dc.w $03c0,$0014,$15e0,$0fe0,$0014,$15e1

loc_082968:
	dc.w $03c0,$0014,$1600,$0fe0,$0014,$1601

loc_082974:
	dc.w $03c0,$0014,$1620,$0fe0,$0014,$1621

loc_082980:
	dc.w $03c0,$0014,$1640,$0fe0,$0014,$1641

loc_08298c:
	dc.w $03c0,$0014,$1660,$0fe0,$0014,$1661

loc_082998:
	dc.w $03c0,$0014,$1680,$0fe0,$0014,$1681

loc_0829a4:
	dc.w $03c0,$0014,$16a0,$0fe0,$0014,$16a1

loc_0829b0:
	dc.w $03c0,$0014,$16c0,$0fe0,$0014,$16c1

loc_0829bc:
	dc.w $03c0,$0014,$16e0,$0fe0,$0014,$16e1

loc_0829c8:
	dc.w $03c0,$0014,$1700,$0fe0,$0014,$1701

loc_0829d4:
	dc.w $03c0,$0014,$1720,$0fe0,$0014,$1721

loc_0829e0:
	dc.w $03c0,$0014,$1740,$0fe0,$0014,$1741

loc_0829ec:
	dc.w $03c0,$0014,$1760,$0fe0,$0014,$1761

loc_0829f8:
	dc.w $03c0,$0014,$1780,$0fe0,$0014,$1781

loc_082a04:
	dc.w $03c0,$0014,$17a0,$0fe0,$0014,$17a1

loc_082a10:
	dc.w $03c0,$0014,$17c0,$0fe0,$0014,$17c1

loc_082a1c:
	dc.w $03c0,$0014,$17e0,$0fe0,$0014,$17e1

loc_082a28:
	dc.w $03c0,$0014,$1800,$0fe0,$0014,$1801

loc_082a34:
	dc.w $03c0,$0014,$1820,$0fe0,$0014,$1821

loc_082a40:
	dc.w $03c0,$0014,$1840,$0fe0,$0014,$1841

loc_082a4c:
	dc.w $03c0,$0014,$1860,$0fe0,$0014,$1861

;----------------------------------------------
loc_082a58:
	move.b #4,(4,a6)
	rts

;==============================================
loc_082a60:
	move.b (4,a6),d0
	move.w loc_082a6c(pc,d0.w),d1
	jmp loc_082a6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082a6c:
	dc.w loc_082a74-loc_082a6c
	dc.w loc_082aca-loc_082a6c
	dc.w loc_082d2c-loc_082a6c
	dc.w loc_082d2c-loc_082a6c

;----------------------------------------------
loc_082a74:
	move.b (3,a6),d0
	move.w loc_082a80(pc,d0.w),d1
	jmp loc_082a80(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082a80:
	dc.w loc_082a8a-loc_082a80
	dc.w loc_082a8a-loc_082a80
	dc.w loc_082a8a-loc_082a80
	dc.w loc_082ab2-loc_082a80
	dc.w loc_082ab2-loc_082a80

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082a8a:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.b ($3c,a6),d0
	move.b loc_082aaa(pc,d0.w),($3b,a6)
	moveq #$13,d0
	bra.w loc_082de6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082aaa:
	dc.b $00,$00,$17,$1f
	dc.b $15,$1a,$20,$00

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082ab2:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.w #$6000,($1a,a6)
	move.b ($3c,a6),d0
	bra.w loc_082de6

;----------------------------------------------
loc_082aca:
	move.b (3,a6),d0
	move.w loc_082ad6(pc,d0.w),d1
	jmp loc_082ad6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082ad6:
	dc.w loc_082ae0-loc_082ad6
	dc.w loc_082b32-loc_082ad6
	dc.w loc_082bf2-loc_082ad6
	dc.w loc_082c72-loc_082ad6
	dc.w loc_082cfe-loc_082ad6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082ae0:
	move.b (5,a6),d0
	move.w loc_082af6(pc,d0.w),d1
	jsr loc_082af6(pc,d1.w)
	bsr.w loc_082d32
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082af6:
	dc.w loc_082afc-loc_082af6
	dc.w loc_082b0c-loc_082af6
	dc.w loc_082b22-loc_082af6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082afc:
	addq.b #2,(5,a6)
	move.b #$1d,($3a,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082b0c:
	subq.b #1,($3a,a6)
	bpl.b loc_082b1c
	addq.b #2,(5,a6)
	moveq #$14,d0
	bra.w loc_082de6

loc_082b1c:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082b22:
	tst.b ($33,a6)
	bpl.b loc_082b1c
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082b32:
	move.b (5,a6),d0
	move.w loc_082b44(pc,d0.w),d1
	jsr loc_082b44(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082b44:
	dc.w loc_082b50-loc_082b44
	dc.w loc_082b9a-loc_082b44
	dc.w loc_082bb0-loc_082b44
	dc.w loc_082bb0-loc_082b44
	dc.w loc_082bc2-loc_082b44
	dc.w loc_082be2-loc_082b44

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082b50:
	addq.b #2,(5,a6)
	move.b #5,($3a,a6)
	jsr loc_01b6b6

loc_082b60:
	move.l #$3a0000,($40,a6)
	move.l #$ffe80000,($44,a6)
	move.l #$fff8c000,($48,a6)
	move.l #$30000,($4c,a6)
	tst.b ($3c,a6)
	beq.b loc_082b96
	neg.l ($40,a6)
	neg.l ($44,a6)
	neg.l ($48,a6)
	neg.l ($4c,a6)

loc_082b96:
	bra.w loc_082d5a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082b9a:
	subq.b #1,($3a,a6)
	bpl.b loc_082baa
	addq.b #2,(5,a6)
	move.b #7,($3a,a6)

loc_082baa:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082bb0:
	subq.b #1,($3a,a6)
	bpl.b loc_082b96
	addq.b #2,(5,a6)
	move.b #7,($3a,a6)
	bra.b loc_082b60

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082bc2:
	subq.b #1,($3a,a6)
	bpl.b loc_082bde
	tst.b ($31,a6)
	bne.w loc_082be8
	addq.b #2,(5,a6)
	bsr.w loc_082d32
	moveq #$14,d0
	bra.w loc_082de6

loc_082bde:
	bra.w loc_082d5a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082be2:
	tst.b ($33,a6)
	bpl.b loc_082baa

loc_082be8:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082bf2:
	move.b (5,a6),d0
	move.w loc_082c04(pc,d0.w),d1
	jsr loc_082c04(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082c04:
	dc.w loc_082c0c-loc_082c04
	dc.w loc_082c20-loc_082c04
	dc.w loc_082c36-loc_082c04
	dc.w loc_082c62-loc_082c04

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082c0c:
	addq.b #2,(5,a6)
	move.b #5,($3a,a6)

loc_082c16:
	bsr.w loc_082d9a
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082c20:
	subq.b #1,($3a,a6)
	bpl.b loc_082c30
	addq.b #2,(5,a6)
	move.b #$17,($3a,a6)

loc_082c30:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082c36:
	subq.b #1,($3a,a6)
	bpl.b loc_082c4c
	tst.b ($31,a6)
	bne.b loc_082be8
	addq.b #2,(5,a6)
	moveq #$14,d0
	bra.w loc_082de6

loc_082c4c:
	tst.b ($3b,a6)
	bne.b loc_082c5e
	tst.b ($3c,a6)
	bne.b loc_082c5e
	jmp loc_01b6b6

loc_082c5e:
	bra.w loc_082d9a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082c62:
	tst.b ($33,a6)
	bpl.b loc_082c16
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082c72:
	move.b (5,a6),d0
	move.w loc_082c7e(pc,d0.w),d1
	jmp loc_082c7e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082c7e:
	dc.w loc_082c82-loc_082c7e
	dc.w loc_082ce6-loc_082c7e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082c82:
	jsr loc_01b6b6
	move.b ($35,a6),(9,a6)
	tst.b ($34,a6)
	bpl.b loc_082ce0
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	moveq #0,d0
	move.b ($102,a4),d0
	cmpi.b #$1c,d0
	bne.b loc_082cb6
	moveq #$20,d0
	movea.l ($1c,a4),a0
	tst.b ($10,a0)
	beq.b loc_082cb6
	moveq #$21,d0

loc_082cb6:
	lsl.w #2,d0
	movea.l #loc_0832a6,a0
	move.w (a0,d0.w),d1
	move.w (2,a0,d0.w),d0
	move.b ($b,a4),($b,a6)
	beq.b loc_082cd0
	neg.w d1

loc_082cd0:
	add.w ($10,a4),d1
	add.w ($14,a4),d0
	move.w d1,($10,a6)
	move.w d0,($14,a6)

loc_082ce0:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082ce6:
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_082cf8
	move.b #4,(4,a6)

loc_082cf8:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_082cfe:
	move.b (5,a6),d0
	move.w loc_082d0a(pc,d0.w),d1
	jmp loc_082d0a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_082d0a:
	dc.w loc_082d0e-loc_082d0a
	dc.w loc_082ce6-loc_082d0a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_082d0e:
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_082d26
	addq.b #2,(5,a6)
	move.b ($3c,a6),d0
	bsr.w loc_082de6

loc_082d26:
	jmp loc_01b4ec

;----------------------------------------------
loc_082d2c:
	jmp loc_01c2de

;----------------------------------------------
loc_082d32:
	movea.w ($36,a6),a4
	move.w ($50,a6),d0
	move.b ($b,a4),($b,a6)
	beq.b loc_082d44
	neg.w d0

loc_082d44:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($52,a6),d0
	add.w ($14,a4),d0
	move.w d0,($14,a6)
	rts

;----------------------------------------------
loc_082d5a:
	movea.w ($36,a6),a4
	move.w ($50,a6),d0
	move.b ($b,a4),($b,a6)
	beq.b loc_082d6c
	neg.w d0

loc_082d6c:
	add.w ($10,a4),d0
	add.w ($40,a6),d0
	move.w d0,($10,a6)
	move.w ($52,a6),d1
	add.w ($14,a4),d1
	add.w ($44,a6),d1
	move.w d1,($14,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;----------------------------------------------
loc_082d9a:
	lea.l loc_0831a6(pc),a0
	moveq #0,d0
	move.b ($3b,a6),d0
	beq.b loc_082dac
	subq.w #1,d0
	move.b d0,($3b,a6)

loc_082dac:
	lsl.w #3,d0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	moveq #0,d1
	movea.w ($36,a6),a4
	move.w ($50,a6),d0
	move.b ($b,a4),($b,a6)
	beq.b loc_082dc8
	neg.w d0

loc_082dc8:
	add.w ($10,a4),d0
	swap d0
	add.l (a0)+,d0
	move.l d0,($10,a6)
	move.w ($52,a6),d1
	add.w ($14,a4),d1
	swap d1
	add.l (a0),d1
	move.l d1,($14,a6)
	rts

;----------------------------------------------
loc_082de6:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_082df2:
	jsr loc_01c2c8
	beq.b loc_082e34
	addq.b #1,(a4)
	move.w #$700,(2,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	clr.b ($31,a4)
	move.b #0,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)
	move.b ($b,a6),($b,a4)

loc_082e34:
	rts

;==============================================
loc_082e36:
	jsr loc_003814
	tst.b ($132,a6)
	bmi.w loc_0830b6
	cmpi.b #2,($82,a6)
	bcs.w loc_082eda
	beq.w loc_082e96
	jsr loc_01c2c8
	beq.w loc_082f1e
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	clr.b ($31,a4)
	move.b #2,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)

loc_082e96:
	jsr loc_01c2c8
	beq.w loc_082f1e
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	clr.b ($31,a4)
	move.b #1,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)

loc_082eda:
	jsr loc_01c2c8
	beq.w loc_082f1e
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	clr.b ($31,a4)
	move.b #0,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)

loc_082f1e:
	rts

;==============================================
loc_082f20:
	moveq #2,d6

loc_082f22:
	jsr loc_01c2c8
	beq.w loc_082f72
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b #4,(3,a4)
	move.b #0,(9,a4)
	clr.b ($31,a4)
	move.b d6,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b #1,($c,a4)
	andi.b #$1f,d2
	move.b d2,($d,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)
	dbra d6,loc_082f22

loc_082f72:
	rts

;==============================================
loc_082f74:
	jsr loc_003814
	cmpi.b #2,($82,a6)
	bcs.w loc_083064
	beq.w loc_082fdc
	cmpi.b #Ryu_id,(PL_charid,a6)
	bne.b loc_082f98
	tst.b (PL_ism_choice,a6)
	bmi.w loc_083066

loc_082f98:
	jsr loc_01c2c8
	beq.w loc_083064
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	st.b ($31,a4)
	move.b #2,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)

loc_082fdc:
	jsr loc_01c2c8
	beq.w loc_083064
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	st.b ($31,a4)
	move.b #1,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)
	jsr loc_01c2c8
	beq.w loc_083064
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b ($82,a6),(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	st.b ($31,a4)
	move.b #0,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w d0,($50,a4)
	move.w d1,($52,a4)

loc_083064:
	rts

loc_083066:
	jsr loc_01c2c8
	beq.b loc_0830b4
	addq.b #1,(a4)
	move.b #7,(2,a4)
	move.b #8,(3,a4)
	move.b #2,(9,a4)
	clr.w ($c,a4)
	move.b #$51,($3c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	tst.b ($b,a6)
	beq.b loc_0830a4
	neg.w d0

loc_0830a4:
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)

loc_0830b4:
	rts

;==============================================
loc_0830b6
	jsr loc_01c2c8
	beq.b loc_08311c
	move.l #$1000706,(a4)
	move.b #0,(9,a4)
	move.w ($18,a6),($18,a4)
	move.b ($e,a6),($e,a4)
	clr.w ($c,a4)
	move.w a6,($36,a4)
	move.b #$46,($3c,a4)
	cmpi.b #$1c,($102,a6)
	beq.b loc_0830f6
	move.b #$45,($3c,a4)
	move.b ($102,a6),d0

loc_0830f6:
	ext.w d0
	lsl.w #2,d0
	move.w loc_08311e(pc,d0.w),d1
	move.w loc_08311e+2(pc,d0.w),d2
	move.b ($b,a6),($b,a4)
	beq.b loc_08310c
	neg.w d1

loc_08310c:
	add.w ($10,a6),d1
	add.w ($14,a6),d2
	move.w d1,($10,a4)
	move.w d2,($14,a4)

loc_08311c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08311e:
	dc.w $fffa,$0036
	dc.w $fff0,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $fff6,$0036
	dc.w $fff9,$0036
	dc.w $000b,$0036
	dc.w $fff7,$0036
	dc.w $0005,$0036
	dc.w $fffc,$0036
	dc.w $ffe9,$0036
	dc.w $0002,$0036
	dc.w $fffb,$0036
	dc.w $0011,$0036
	dc.w $0000,$0036
	dc.w $0011,$0036
	dc.w $0000,$0036
	dc.w $0000,$0036
	dc.w $0004,$0036
	dc.w $0000,$0036
	dc.w $0008,$0036
	dc.w $fffb,$0036
	dc.w $0004,$0036
	dc.w $fffc,$0036
	dc.w $0000,$0000
	dc.w $fff7,$0036
	dc.w $0004,$0036
	dc.w $0004,$0036
	dc.w $0014,$0054
	dc.w $ffeb,$005a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0831a6:
	dc.l $00000000,$00000000,$0001d906,$0000c3ef
	dc.l $0002d413,$0002d413,$00024bcd,$00058b14
	dc.l $00000000,$00080000,$fffc2c55,$00093d21
	dc.l $fff783c5,$00087c3b,$fff310d1,$00055b89
	dc.l $fff00000,$00000000,$ffef5ec4,$fff91c99
	dc.l $fff1db9d,$fff1db9d,$fff794bb,$ffebacb6
	dc.l $00000000,$ffe80000,$0009f324,$ffe7faa9
	dc.l $0013cc8a,$ffec3376,$001bb765,$fff484fe
	dc.l $00200000,$00000000,$001f6972,$000d02e0
	dc.l $001974b2,$001974b2,$000e8abe,$00231b80
	dc.l $00000000,$00280000,$ffefed64,$0026cd8d
	dc.l $ffe0e327,$001f1cd9,$ffd58066,$00119a7a
	dc.l $ffd00000,$00000000,$ffd1ce58,$ffecdda7
	dc.l $ffdb3aff,$ffdb3aff,$ffeb55c9,$ffce1c4b
	dc.l $00000000,$ffc80000,$00163215,$ffca6a3d
	dc.l $002a6d29,$ffd592d7,$003947d0,$ffe8460d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0832a6:
	dc.w $0000,$0000
	dc.w $ffe8,$0019
	dc.w $fff7,$0057
	dc.w $fff7,$0023
	dc.w $fffa,$0049
	dc.w $ffef,$0044
	dc.w $fffe,$005c
	dc.w $000d,$0054
	dc.w $fffa,$0073
	dc.w $ffd4,$0040
	dc.w $ffe5,$0043
	dc.w $ffd8,$0063
	dc.w $0001,$004b
	dc.w $000f,$0043
	dc.w $ffe2,$0004
	dc.w $0002,$0046
	dc.w $ffeb,$0056
	dc.w $0028,$0066
	dc.w $fffa,$0049
	dc.w $0028,$0066
	dc.w $000a,$0061
	dc.w $ffdb,$0054
	dc.w $fff7,$0017
	dc.w $0000,$0000
	dc.w $0000,$0058
	dc.w $ffd6,$002d
	dc.w $ffe6,$0048
	dc.w $ffe3,$0057
	dc.w $0000,$0000
	dc.w $0000,$0038
	dc.w $ffed,$0038
	dc.w $0006,$005a
	dc.w $0024,$0060
	dc.w $ffda,$0071

;==============================================
loc_08332e:
	move.b (4,a6),d0
	move.w loc_08333a(pc,d0.w),d1
	jmp loc_08333a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08333a:
	dc.w loc_083342-loc_08333a
	dc.w loc_08336a-loc_08333a
	dc.w loc_083422-loc_08333a
	dc.w loc_083422-loc_08333a

;----------------------------------------------
loc_083342:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	move.b #1,($30,a6)
	move.b #1,($f,a6)
	move.w #$6000,($1a,a6)
	movea.w ($36,a6),a4
	move.w ($18,a4),($18,a6)
	rts

;----------------------------------------------
loc_08336a:
	tst.b (3,a6)
	bne.w loc_0833d2
	move.b (5,a6),d0
	move.w loc_08337e(pc,d0.w),d1
	jmp loc_08337e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08337e:
	dc.w loc_083382-loc_08337e
	dc.w loc_0833a0-loc_08337e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083382:
	movea.w ($36,a6),a4
	tst.b ($31,a4)
	beq.b loc_08339e
	addq.b #2,(5,a6)
	moveq #$f,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

loc_08339e:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0833a0:
	tst.b ($125,a5)
	bne.b loc_0833cc
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2001000,d0
	beq.b loc_0833c6
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

loc_0833c6:
	jsr loc_01b6b6

loc_0833cc:
	jmp loc_01b4d0

;----------------------------------------------
loc_0833d2:
	move.b (5,a6),d0
	move.w loc_0833de(pc,d0.w),d1
	jmp loc_0833de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0833de:
	dc.w loc_0833e2-loc_0833de
	dc.w loc_0833f4-loc_0833de

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0833e2:
	addq.b #2,(5,a6)
	moveq #$f,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0833f4:
	tst.b ($125,a5)
	bne.b loc_08341c
	movea.w ($36,a6),a4
	tst.b ($23b,a4)
	bne.w loc_08340c
	tst.b ($31,a4)
	beq.b loc_083416

loc_08340c:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

loc_083416:
	jsr loc_01b6b6

loc_08341c:
	jmp loc_01b4d0

;----------------------------------------------
loc_083422:
	jmp loc_01c2de

;==============================================
loc_083428:
	jsr loc_01c2c8
	beq.b loc_0834a0
	addq.b #1,(a4)
	move.w #$800,($2,a4)
	clr.w ($c,a4)
	move.b ($e,a6),($e,a4)
	move.b #0,($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$20,($10,a4)
	addi.w #0,($14,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0834a0
	addq.b #1,(a4)
	move.w #$800,($2,a4)
	clr.w ($c,a4)
	move.b ($e,a6),($e,a4)
	move.b #1,($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$ffe0,($10,a4)
	addi.w #0,($14,a4)
	move.w a6,($36,a4)

loc_0834a0:
	rts

;==============================================
loc_0834a2:
	jsr loc_01c2c8
	beq.b loc_08351a
	addq.b #1,(a4)
	move.w #$802,($2,a4)
	clr.w ($c,a4)
	move.b ($e,a6),($e,a4)
	move.b #0,($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$20,($10,a4)
	addi.w #0,($14,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_08351a
	addq.b #1,(a4)
	move.w #$802,($2,a4)
	clr.w ($c,a4)
	move.b ($e,a6),($e,a4)
	move.b #1,($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$ffe0,($10,a4)
	addi.w #0,($14,a4)
	move.w a6,($36,a4)

loc_08351a:
	rts

;==============================================
loc_08351c:
	move.b (4,a6),d0
	move.w loc_083528(pc,d0.w),d1
	jmp loc_083528(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083528:
	dc.w loc_083530-loc_083528
	dc.w loc_083582-loc_083528
	dc.w loc_0835ce-loc_083528
	dc.w loc_0835ce-loc_083528

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083530:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	movea.w ($36,a6),a4
	bsr.w loc_0835e2

loc_083548:
	moveq #0,d0
	move.b #2,(9,a6)
	move.b #1,($b,a6)
	move.b (3,a6),d0
	add.w d0,d0
	addi.w #$18,d0
	cmpi.b #$20,($3c,a6)
	bcs.b loc_083576
	move.b #4,(9,a6)
	move.b #0,($b,a6)
	addq.w #1,d0

loc_083576:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083582:
	tst.b ($125,a5)
	bne.b loc_0835c0
	movea.w ($36,a6),a4
	tst.b ($a,a6)
	bmi.b loc_0835b0
	bgt.b loc_0835c6
	tst.w ($50,a4)
	bmi.b loc_0835c6
	tst.b ($2ce,a4)
	bne.b loc_0835b0
	cmpi.w #$202,(4,a4)
	bne.b loc_0835c6
	cmpi.b #$c,($54,a4)
	bne.b loc_0835c6

loc_0835b0:
	addq.b #1,($3c,a6)
	andi.b #$3f,($3c,a6)
	bsr.w loc_0835e2
	bsr.b loc_083548

loc_0835c0:
	jmp loc_01b4ec

loc_0835c6:
	move.b #4,(4,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0835ce:
	tst.b ($31,a6)
	bne.b loc_0835dc
	movea.w ($36,a6),a3
	clr.b ($2cf,a3)

loc_0835dc:
	jmp loc_01c2de

;----------------------------------------------
loc_0835e2:
	moveq #0,d0
	move.b ($3a,a6),d0
	lsl.w #2,d0
	lea.l loc_083742(pc),a0
	move.w (a0,d0.w),d1
	move.w (2,a0,d0.w),d2
	tst.b ($b,a4)
	beq.b loc_0835fe
	neg.w d1

loc_0835fe:
	add.w ($10,a4),d1
	add.w ($14,a4),d2
	lea.l loc_0837c2(pc),a0
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #2,d0
	move.w (a0,d0.w),d3
	add.w d3,d1
	move.w d1,($10,a6)
	move.w (2,a0,d0.w),d3
	add.w d3,d2
	move.w d2,($14,a6)
	rts

;==============================================
loc_083628:
	tst.w ($50,a6)
	bmi.w loc_0836f2
	moveq #2,d6
	jsr RNGFunction
	cmpi.b #$25,d0
	beq.b loc_083648
	moveq #0,d6
	btst #0,d0
	beq.b loc_083648
	moveq #1,d6

loc_083648:
	jsr loc_01c2c8
	beq.w loc_0836f2
	addq.b #1,(a4)
	move.b #$9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b ($102,a6),($3a,a4)
	move.w a6,($36,a4)
	move.b #$10,($3c,a4)
	move.b #0,($31,a4)
	clr.b ($a,a4)
	jsr loc_01c2c8
	beq.b loc_0836f2
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b ($102,a6),($3a,a4)
	move.w a6,($36,a4)
	move.b #$24,($3c,a4)
	move.b #1,($31,a4)
	clr.b ($a,a4)
	jsr loc_01c2c8
	beq.b loc_0836f2
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b ($102,a6),($3a,a4)
	move.w a6,($36,a4)
	move.b #$34,($3c,a4)
	move.b #2,($31,a4)
	clr.b ($a,a4)
	move.b #1,($2cf,a6)
	jmp loc_00373a

loc_0836f2:
	rts

;##############################################
;Dizzy Chicks
loc_0836f4:
	cmpi.b #3,($6eb9,a5)
	bcs.b loc_0836f4
	bsr.w loc_08371c
	move.b #$10,($3c,a4)
	bsr.w loc_08371c
	move.b #$24,($3c,a4)
	bsr.w loc_08371c
	move.b #$34,($3c,a4)
	rts

loc_08371c:
	jsr loc_01c2c8
	move.l #$1000900,(a4)
	clr.b ($31,a4)
	move.b ($e,a6),($e,a4)
	move.b ($102,a6),($3a,a4)
	move.w a6,($36,a4)
	st.b ($a,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083742:
	dc.w $0000,$005a
	dc.w $0000,$005a
	dc.w $0000,$005a
	dc.w $0000,$005f
	dc.w $0000,$0054
	dc.w $0000,$0060
	dc.w $ffe0,$005e
	dc.w $ffef,$0042
	dc.w $ffe1,$0068
	dc.w $0000,$005e
	dc.w $fff2,$005e
	dc.w $fffc,$0073
	dc.w $0000,$005a
	dc.w $fffa,$0055
	dc.w $0003,$0062
	dc.w $0000,$005d
	dc.w $fff5,$0071
	dc.w $ffff,$0066
	dc.w $0000,$0054
	dc.w $ffff,$0066
	dc.w $0000,$005a
	dc.w $fff8,$0069
	dc.w $0004,$0058
	dc.w $0000,$005a
	dc.w $fff2,$005c
	dc.w $fffc,$0073
	dc.w $0000,$005a
	dc.w $0000,$005f
	dc.w $0000,$0065
	dc.w $000a,$005b
	dc.w $0004,$0058
	dc.w $0004,$0058

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0837c2:
	dc.w $ffe0,$0000
	dc.w $ffe1,$ffff
	dc.w $ffe1,$fffe
	dc.w $ffe2,$fffd
	dc.w $ffe3,$fffc
	dc.w $ffe4,$fffb
	dc.w $ffe6,$fffa
	dc.w $ffe8,$fff9
	dc.w $ffea,$fff8
	dc.w $ffec,$fff7
	dc.w $ffef,$fff7
	dc.w $fff1,$fff6
	dc.w $fff4,$fff5
	dc.w $fff7,$fff5
	dc.w $fffa,$fff5
	dc.w $fffd,$fff5
	dc.w $0000,$fff4
	dc.w $0003,$fff5
	dc.w $0006,$fff5
	dc.w $0009,$fff5
	dc.w $000c,$fff5
	dc.w $000f,$fff6
	dc.w $0011,$fff7
	dc.w $0014,$fff7
	dc.w $0016,$fff8
	dc.w $0018,$fff9
	dc.w $001a,$fffa
	dc.w $001c,$fffb
	dc.w $001d,$fffc
	dc.w $001e,$fffd
	dc.w $001f,$fffe
	dc.w $001f,$ffff
	dc.w $0020,$0000
	dc.w $001f,$0001
	dc.w $001f,$0002
	dc.w $001e,$0003
	dc.w $001d,$0004
	dc.w $001c,$0005
	dc.w $001a,$0006
	dc.w $0018,$0007
	dc.w $0016,$0008
	dc.w $0014,$0009
	dc.w $0011,$0009
	dc.w $000f,$000a
	dc.w $000c,$000b
	dc.w $0009,$000b
	dc.w $0006,$000b
	dc.w $0003,$000b
	dc.w $0000,$000c
	dc.w $fffd,$000b
	dc.w $fffa,$000b
	dc.w $fff7,$000b
	dc.w $fff4,$000b
	dc.w $fff1,$000a
	dc.w $ffef,$0009
	dc.w $ffec,$0009
	dc.w $ffea,$0008
	dc.w $ffe8,$0007
	dc.w $ffe6,$0006
	dc.w $ffe4,$0005
	dc.w $ffe3,$0004
	dc.w $ffe2,$0003
	dc.w $ffe1,$0002
	dc.w $ffe1,$0001

;##############################################
loc_0838c2:
	move.b (4,a6),d0
	move.w loc_0838ce(pc,d0.w),d1
	jmp loc_0838ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0838ce:
	dc.w loc_0838d6-loc_0838ce
	dc.w loc_083902-loc_0838ce
	dc.w loc_083a2e-loc_0838ce
	dc.w loc_083a2e-loc_0838ce

;==============================================
loc_0838d6:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	clr.w ($c,a6)
	move.b #1,($30,a6)
	move.w #$6000,(PL_spritebank,a6)
	movea.w ($36,a6),a4
	move.b ($b,a4),($b,a6)
	eori.b #1,($b,a6)
	moveq #0,d0

;==============================================
loc_083902:
	move.b ($3c,a6),d0
	move.w loc_08390e(pc,d0.w),d1
	jmp loc_08390e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08390e:
	dc.w loc_083916-loc_08390e
	dc.w loc_083916-loc_08390e
	dc.w loc_083972-loc_08390e
	dc.w loc_0839d6-loc_08390e

;----------------------------------------------
loc_083916:
	move.b (5,a6),d0
	move.w loc_083928(pc,d0.w),d1
	jsr loc_083928(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083928:
	dc.w loc_08392e-loc_083928
	dc.w loc_08393e-loc_083928
	dc.w loc_083960-loc_083928

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08392e:
	addq.b #2,(5,a6)
	move.b ($3c,a6),d6
	bsr.w loc_083af6
	bra.w loc_083a4e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08393e:
	bsr.w loc_083a34
	beq.b loc_083956
	addq.b #2,(5,a6)
	move.b ($3c,a6),d0
	add.b d0,d0
	addi.b #$33,d0
	bsr.w loc_083b0c

loc_083956:
	bsr.w loc_083a4e
	jmp loc_01b6b6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083960:
	tst.b ($33,a6)
	bmi.b loc_08396c
	jmp loc_01b6b6

loc_08396c:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_083972:
	bsr.w loc_083a34
	bne.b loc_08396c
	move.b (5,a6),d0
	move.w loc_08398a(pc,d0.w),d1
	jsr loc_08398a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08398a:
	dc.w loc_08398e-loc_08398a
	dc.w loc_0839cc-loc_08398a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08398e:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b ($3a,a6),d0
	move.b loc_0839ac(pc,d0.w),d0
	move.b (3,a6),d1
	lsr.b #2,d1
	add.b d1,d0
	bsr.w loc_083b0c
	bra.w loc_083aaa


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0839ac:
	dc.b $3b,$3b,$3b,$3e
	dc.b $38,$3b,$3e,$3b
	dc.b $3e,$3b,$3e,$3e
	dc.b $3b,$38,$3b,$3b
	dc.b $3e,$38,$38,$38
	dc.b $3e,$3e,$38,$3b
	dc.b $3e,$3e,$3b,$3b
	dc.b $3b,$38,$38,$38

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0839cc:
	jsr loc_01b6b6
	bra.w loc_083aaa

;----------------------------------------------
loc_0839d6:
	tst.b ($12a,a5)
	bne.b loc_08396c
	move.b (5,a6),d0
	move.w loc_0839ee(pc,d0.w),d1
	jsr loc_0839ee(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0839ee:
	dc.w loc_0839f4-loc_0839ee
	dc.w loc_083a02-loc_0839ee
	dc.w loc_083a20-loc_0839ee

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0839f4:
	addq.b #2,(5,a6)
	moveq #0,d6
	bsr.w loc_083af6
	bra.w loc_083a4e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083a02:
	movea.w ($36,a6),a4
	tst.b ($31,a4)
	bne.b loc_083a16
	addq.b #2,(5,a6)
	moveq #$33,d0
	bsr.w loc_083b0c

loc_083a16:
	bsr.w loc_083a4e
	jmp loc_01b6b6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_083a20:
	tst.b ($33,a6)
	bmi.w loc_08396c
	jmp loc_01b6b6

;==============================================
loc_083a2e:
	jmp loc_01c2de

;==============================================
loc_083a34:
	movea.w ($36,a6),a4
	move.b ($251,a4),d0
	or.b ($250,a4),d0
	or.b ($252,a4),d0
	beq.b loc_083a4a
	moveq #0,d0
	rts

loc_083a4a:
	moveq #1,d0
	rts

;==============================================
;Fire Hurtsun fire placement
loc_083a4e:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	move.b ($11,a0),d0
	andi.w #$1f,d0
	lsl.w #4,d0
	add.b (3,a6),d0
	btst #0,($b4,a5)
	beq.b loc_083a6e
	addq.b #8,d0

loc_083a6e:
	movea.l #loc_0df712,a0
	moveq #0,d1
	move.b ($3a,a6),d1
	lsl.w #2,d1
	movea.l (a0,d1.w),a0
	move.w (a0,d0.w),d1
	move.b (PL_Flip,a4),(PL_Flip,a6)
	beq.b loc_083a8e
	neg.w d1

loc_083a8e:
	add.w (PL_X,a4),d1
	move.w d1,(PL_X,a6)
	move.w (2,a0,d0.w),d1
	add.w (PL_Y,a4),d1
	move.w d1,(PL_Y,a6)
	eori.b #1,(PL_Flip,a6)
	rts

;##############################################
;Deals with AC hurtstun spin
loc_083aaa:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	move.b ($11,a0),d0
	andi.w #1,d0
	lsl.w #4,d0
	add.b (3,a6),d0
	movea.l #loc_0df792,a0
	moveq #0,d1
	move.b ($3a,a6),d1
	lsl.w #2,d1
	movea.l (a0,d1.w),a0
	move.w (a0,d0.w),d1
	move.b (PL_Flip,a4),(PL_Flip,a6)
	beq.b loc_083ae0
	neg.w d1

loc_083ae0:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w (2,a0,d0.w),d1
	add.w ($14,a4),d1
	move.w d1,($14,a6)
	rts

;##############################################
loc_083af6:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_083b18(pc,d0.w),d0
	add.b d6,d6
	add.b d6,d0
	addi.b #$30,d0

loc_083b0c:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083b18:
	dc.b $00,$01,$02,$00
	dc.b $01,$02,$00,$01
	dc.b $02,$00,$01,$02
	dc.b $00,$01,$02,$00

;##############################################
loc_083b28:
	jsr loc_01c2c8
	beq.w loc_083b80
	move.l #$1000a00,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #0,($3c,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.w loc_083b80
	move.l #$1000a04,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #0,($3c,a4)
	move.w a6,($36,a4)

loc_083b80:
	rts

;##############################################
loc_083b82:
	jsr loc_01c2c8
	beq.w loc_083bda
	move.l #$1000a00,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #2,($3c,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.w loc_083bda
	move.l #$1000a04,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #2,($3c,a4)
	move.w a6,($36,a4)

loc_083bda:
	rts

;##############################################
loc_083bdc:
	jsr loc_01c2c8
	beq.w loc_083c5c
	move.l #$1000a00,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #4,($3c,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_083c5c
	move.l #$1000a04,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #4,($3c,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_083c5c
	move.l #$1000a08,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b ($102,a6),($3a,a4)
	move.b #4,($3c,a4)
	move.w a6,($36,a4)

loc_083c5c:
	rts

;##############################################
loc_083c5e:
	jsr loc_01c2c8
	beq.w loc_083cb6
	move.l #$1000a00,(a4)
	move.b ($e,a1),($e,a4)
	move.w ($18,a1),($18,a4)
	move.b ($102,a1),($3a,a4)
	move.b #6,($3c,a4)
	move.w a1,($36,a4)
	jsr loc_01c2c8
	beq.w loc_083cb6
	move.l #$1000a04,(a4)
	move.b ($e,a1),($e,a4)
	move.w ($18,a1),($18,a4)
	move.b ($102,a1),($3a,a4)
	move.b #6,($3c,a4)
	move.w a1,($36,a4)

loc_083cb6:
	rts

;##############################################
loc_083cb8:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_083cc6(pc,d0.w),d1
	jmp loc_083cc6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083cc6:
	dc.w loc_083ccc-loc_083cc6
	dc.w loc_083ccc-loc_083cc6
	dc.w loc_083d5e-loc_083cc6

;==============================================
loc_083ccc:
	move.b (4,a6),d0
	move.w loc_083cd8(pc,d0.w),d1
	jmp loc_083cd8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083cd8:
	dc.w loc_083ce0-loc_083cd8
	dc.w loc_083d06-loc_083cd8
	dc.w loc_083d58-loc_083cd8
	dc.w loc_083d58-loc_083cd8

;----------------------------------------------
loc_083ce0:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #$ff,($c,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	jsr loc_080434
	jmp loc_080470

;----------------------------------------------
loc_083d06:
	tst.b ($125,a5)
	bne.b loc_083d40
	subq.b #1,($3a,a6)
	bpl.b loc_083d40
	clr.b ($3a,a6)
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000e00,d0
	beq.b loc_083d34
	cmpi.w #$20e,(4,a4)
	bne.b loc_083d50

loc_083d34:
	jsr loc_080434
	jsr loc_080470

loc_083d40:
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_083d56
	jmp loc_01b4ec

loc_083d50:
	move.b #4,(4,a6)

loc_083d56:
	rts

;----------------------------------------------
loc_083d58:
	jmp loc_01c2de

;==============================================
loc_083d5e:
	move.b (4,a6),d0
	move.w loc_083d6a(pc,d0.w),d1
	jmp loc_083d6a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083d6a:
	dc.w loc_083d72-loc_083d6a
	dc.w loc_083d98-loc_083d6a
	dc.w loc_083dd4-loc_083d6a
	dc.w loc_083dd4-loc_083d6a

;----------------------------------------------
loc_083d72:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #$ff,($c,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	jsr loc_080434
	jmp loc_080470

;----------------------------------------------
loc_083d98:
	tst.b ($125,a5)
	bne.b loc_083dbc
	subq.b #1,($3a,a6)
	bpl.b loc_083dbc
	clr.b ($3a,a6)
	movea.l ($44,a6),a0
	tst.b (a0)
	bmi.b loc_083dcc
	jsr loc_080434
	jsr loc_080470

loc_083dbc:
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_083dd2
	jmp loc_01b4ec

loc_083dcc:
	move.b #4,(4,a6)

loc_083dd2:
	rts

;----------------------------------------------
loc_083dd4:
	jmp loc_01c2de

;##############################################
loc_083dda:
	tst.b ($3e,a6)
	bne.w loc_083e70
	move.b ($101,a6),d0
	jsr loc_080452
	jsr loc_0804a0
	beq.w loc_083e70
	addq.b #1,(a4)
	move.w #$b00,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #5,($3a,a4)
	move.w a6,($36,a4)
	move.b ($d,a6),($d,a4)
	addq.b #1,(a3)
	move.w #$b01,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #$a,($3a,a3)
	move.w a6,($36,a3)
	move.b ($d,a6),($d,a3)
	addq.b #3,($d,a3)
	addq.b #1,(a2)
	move.w #$b00,(2,a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #$f,($3a,a2)
	move.w a6,($36,a2)
	move.b ($d,a6),($d,a2)
	addq.b #4,($d,a2)

loc_083e70:
	rts

;##############################################
loc_083e72:
	tst.b ($3e,a6)
	bne.w loc_083f18
	move.b ($101,a6),d0
	jsr loc_080452
	jsr loc_0804a0
	beq.w loc_083f18
	addq.b #1,(a4)
	move.w #$b02,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #5,($3a,a4)
	move.w a6,($36,a4)
	move.l d4,($44,a4)
	move.b ($d,a6),($d,a4)
	addq.b #3,($d,a4)
	addq.b #1,(a3)
	move.w #$b02,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #$a,($3a,a3)
	move.w a6,($36,a3)
	move.l d4,($44,a3)
	move.b ($d,a6),($d,a3)
	addq.b #4,($d,a3)
	addq.b #1,(a2)
	move.w #$b02,(2,a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #$f,($3a,a2)
	move.w a6,($36,a2)
	move.l d4,($44,a2)
	move.b ($d,a6),($d,a2)
	addq.b #4,($d,a2)

loc_083f18:
	rts

;##############################################
loc_083f1a:
	jsr loc_01c2c8
	beq.b loc_083f34
	addq.b #1,(a4)
	move.b #$c,(2,a4)
	move.b #0,(3,a4)
	move.w a6,($36,a4)

loc_083f34:
	rts

;##############################################
loc_083f36:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_083f46(pc,d0.w),d1
	jmp loc_083f46(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_083f46:
	dc.w loc_083f4e-loc_083f46
	dc.w loc_083fc0-loc_083f46
	dc.w loc_083fdc-loc_083f46
	dc.w loc_083fe0-loc_083f46

;==============================================
loc_083f4e:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	move.w #$11f,($c,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b d0,($b,a6)
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.w #8,(a0)+
	move.w #4,(a0)+
	move.w #3,(a0)+
	move.w #$1f1,(a0)+
	move.w #0,(a0)+
	move.w d0,(a0)+
	move.w d0,(a0)+
	move.w #$1f1,(a0)+
	move.w #$20,(a0)+
	move.w d0,(a0)+
	move.w d0,(a0)+
	move.w #$1f1,(a0)+
	move.w #$40,(a0)+
	move.w d0,(a0)+
	move.w d0,(a0)+
	move.w #$1f1,(a0)+
	move.w #$60,(a0)+
	move.w d0,(a0)+
	move.w d0,(a0)+

loc_083fc0:
	tst.b ($195,a4)
	beq.w loc_084056
	bsr.w loc_083fe6
	addq.b #1,($d,a6)
	andi.b #$1f,($d,a6)
	jmp loc_01b4ec

;==============================================
loc_083fdc:
	addq.b #2,(4,a6)

loc_083fe0:
	jmp loc_01c2de

;##############################################
loc_083fe6:
	move.w #$fff0,d3
	move.w ($40,a4),d1
	move.w ($44,a4),d0
	btst #0,($b,a4)
	beq.b loc_083ffc
	neg.w d1

loc_083ffc:
	move.w d0,($6a,a6)
	add.w d3,($6a,a6)
	move.w d0,($7a,a6)
	add.w d3,($7a,a6)
	neg.w d0
	move.w d0,($62,a6)
	move.w d0,($72,a6)
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w ($42,a4),d1
	move.w ($46,a4),d0
	neg.w d0
	btst #1,($b,a4)
	beq.b loc_084032
	neg.w d1

loc_084032:
	move.w d0,($64,a6)
	move.w d0,($6c,a6)
	neg.w d0
	move.w d0,($74,a6)
	add.w d3,($74,a6)
	move.w d0,($7c,a6)
	add.w d3,($7c,a6)
	add.w ($14,a4),d1
	move.w d1,($14,a6)
	rts

loc_084056:
	addq.b #2,(4,a6)
	rts

;##############################################
;Win Portrait
loc_08405c:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_08406a(pc,d0.w),d1
	jmp loc_08406a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08406a:
	dc.w loc_084078-loc_08406a
	dc.w loc_0843ea-loc_08406a
	dc.w loc_0844be-loc_08406a
	dc.w loc_084662-loc_08406a
	dc.w loc_0847a8-loc_08406a
	dc.w loc_084800-loc_08406a
	dc.w loc_08495a-loc_08406a;Ism and Name Tags

;==============================================
loc_084078:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_084088(pc,d0.w),d1
	jmp loc_084088(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084088:
	dc.w loc_084090-loc_084088
	dc.w loc_0841bc-loc_084088
	dc.w loc_084b04-loc_084088
	dc.w loc_084b04-loc_084088

;----------------------------------------------
loc_084090:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b #$ff,($c,a6)
	bsr.w loc_084c2e
	move.b d0,($b,a6)
	eori.b #1,($b,a6)
	lsl.w #2,d3
	move.b d3,($d,a6)
	lsl.w #3,d1
	bsr.w loc_084202
	move.b ($102,a4),d0
	move.b ($132,a4),d1
	move.b ($128,a4),d2
	move.b ($d,a6),d3
	jsr loc_01f75c
	move.b ($132,a4),d0
	add.b d0,d0
	add.b ($bb,a5),d0
	ext.w d0
	addi.w #$1a,d0
	moveq #0,d1
	move.b ($102,a4),d1
	lsl.w #3,d1
	add.w d0,d0
	lea.l loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jsr loc_01b6ee
	tst.b (3,a6)
	bne.w loc_0841ba
	tst.b ($35,a6)
	beq.w loc_0841ba
	moveq #$14,d1
	move.w (Dramatic_Mode_Type,a5),d0
	btst d0,d1
	beq.b loc_084196
	move.l #$c0000000,d1
	move.b ($102,a4),d0
	btst d0,d1
	beq.b loc_084196
	btst #1,($101,a4)
	beq.w loc_084196
	jsr loc_01c368
	beq.b loc_0841ba
	addq.b #1,(a4)
	move.w #$2105,(2,a4)
	move.b #1,($3c,a4)
	move.w a6,($36,a4)
	move.w #$8c00,($38,a4)
	move.w a4,($28,a6)
	jsr loc_01c368
	beq.b loc_0841ba
	addq.b #1,(a4)
	move.w #$2105,(2,a4)
	move.b #$ff,($3c,a4)
	move.w a6,($36,a4)
	move.w #$9000,($38,a4)
	move.w a4,($2a,a6)
	bra.b loc_0841ba

loc_084196:
	jsr loc_01c368
	beq.b loc_0841ba
	addq.b #1,(a4)
	move.w #$2105,(2,a4)
	move.b #0,($3c,a4)
	move.w a6,($36,a4)
	move.w ($38,a6),($38,a4)
	move.w a4,($28,a6)

loc_0841ba:
	rts

;----------------------------------------------
loc_0841bc:
	move.b (5,a6),d0
	move.w loc_0841ce(pc,d0.w),d1
	jsr loc_0841ce(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0841ce:
	dc.w loc_0841d2-loc_0841ce
	dc.w loc_084200-loc_0841ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0841d2:
	tst.b ($15f,a5)
	bne.b loc_0841de
	bsr.w loc_0843d6
	beq.b loc_084200

loc_0841de:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w ($4a,a6),($10,a6)
	move.w d0,($12,a6)
	move.w ($4e,a6),($14,a6)
	move.w d0,($16,a6)
	bsr.w loc_084c5a
	bset.b d0,($13,a5)

loc_084200:
	rts

;----------------------------------------------
loc_084202:
	cmpi.b #4,(3,a6)
	bne.b loc_08420e
	addi.w #$30,d1

loc_08420e:
	moveq #0,d2
	move.b ($a,a6),d2
	add.w d2,d2
	move.w loc_08421e(pc,d2.w),d2
	jmp loc_08421e(pc,d2.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08421e:
	dc.w loc_084226-loc_08421e
	dc.w loc_084292-loc_08421e
	dc.w loc_0842fe-loc_08421e
	dc.w loc_08436a-loc_08421e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084226:
	move.w loc_084252(pc,d1.w),($42,a6)
	move.w loc_084252+2(pc,d1.w),($4a,a6)
	move.w loc_084252+4(pc,d1.w),($40,a6)
	move.w loc_084252+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$88,($14,a6)
	move.w #$88,($4e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084252:
	dc.w $ffc0,$0040,$0f0f,$ff10
	dc.w $01c0,$0140,$f0f1,$00f0
	dc.w $ffc0,$0030,$0d0d,$ff30
	dc.w $ffc0,$0060,$1313,$fed0
	dc.w $01c0,$0150,$f2f3,$00d0
	dc.w $01c0,$0120,$eced,$0130
	dc.w $ffc0,$0070,$1515,$feb0
	dc.w $01c0,$0110,$eaeb,$0150

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084292:
	move.w loc_0842be(pc,d1.w),($42,a6)
	move.w loc_0842be+2(pc,d1.w),($4a,a6)
	move.w loc_0842be+4(pc,d1.w),($40,a6)
	move.w loc_0842be+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$88,($14,a6)
	move.w #$88,($4e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0842be:
	dc.w $01c0,$0040,$d2d3,$02d2
	dc.w $ffc0,$0140,$2d2d,$fd2e
	dc.w $01c0,$0030,$d0d1,$02f2
	dc.w $01c0,$0060,$d5d6,$02a2
	dc.w $ffc0,$0150,$2f2f,$fd0e
	dc.w $ffc0,$0120,$2a2a,$fd5e
	dc.w $01c0,$0070,$d4d5,$02b2
	dc.w $ffc0,$0110,$2b2b,$fd4e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0842fe:
	move.w loc_08432a(pc,d1.w),($10,a6)
	move.w loc_08432a+2(pc,d1.w),($46,a6)
	move.w loc_08432a+4(pc,d1.w),($44,a6)
	move.w loc_08432a+6(pc,d1.w),($4c,a6)
	move.w ($46,a6),($14,a6)
	move.w ($10,a6),($4a,a6)
	move.w #$88,($4e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08432a:
	dc.w $0040,$0188,$e1e2,$01e1
	dc.w $0140,$ff88,$1e1e,$fe1f
	dc.w $0030,$0188,$e1e2,$01e1
	dc.w $0060,$0188,$e1e2,$01e1
	dc.w $0150,$ff88,$1e1e,$fe1f
	dc.w $0120,$ff88,$1e1e,$fe1f
	dc.w $0070,$0188,$e1e2,$01e1
	dc.w $0110,$ff88,$1e1e,$fe1f

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08436a:
	move.w loc_08432a(pc,d1.w),($10,a6)
	move.w loc_08432a+2(pc,d1.w),($46,a6)
	move.w loc_08432a+4(pc,d1.w),($44,a6)
	move.w loc_08432a+6(pc,d1.w),($4c,a6)
	move.w ($46,a6),($14,a6)
	move.w ($10,a6),($4a,a6)
	move.w #$88,($4e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;?????
loc_084396:
	dc.w $0040,$ff88,$1e1e,$fe1f
	dc.w $0140,$0188,$e1e2,$01e1
	dc.w $0030,$ff88,$1e1e,$fe1f
	dc.w $0060,$ff88,$1e1e,$fe1f
	dc.w $0150,$0188,$e1e2,$01e1
	dc.w $0120,$0188,$e1e2,$01e1
	dc.w $0070,$ff88,$1e1e,$fe1f
	dc.w $0110,$0188,$e1e2,$01e1

;==============================================
loc_0843d6:
	add.b ($a,a6),d1
	andi.w #2,d1
	move.w loc_0843e6(pc,d1.w),d1
	jmp loc_0843e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0843e6:
	dc.w loc_084bd2-loc_0843e6
	dc.w loc_084c00-loc_0843e6

;==============================================
loc_0843ea:
	move.b (4,a6),d0
	move.w loc_0843f6(pc,d0.w),d1
	jmp loc_0843f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0843f6:
	dc.w loc_0843fe-loc_0843f6
	dc.w loc_084486-loc_0843f6
	dc.w loc_084b04-loc_0843f6
	dc.w loc_084b04-loc_0843f6

;----------------------------------------------
loc_0843fe:
	move.b (5,a6),d0
	move.w loc_08440a(pc,d0.w),d1
	jmp loc_08440a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08440a:
	dc.w loc_08440e-loc_08440a
	dc.w loc_08446a-loc_08440a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08440e:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($16,a6)
	move.w #$180,($46,a6)
	move.w #$80,($4e,a6)
	move.w #$e1e2,($44,a6)
	move.w #$1e1,($4c,a6)
	move.w #$c0,($10,a6)
	move.w ($46,a6),($14,a6)
	moveq #$1d,d0
	lea.l loc_2f3b20,a0
	jmp loc_01b6e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08446a:
	tst.b ($15f,a5)
	beq.b loc_084474
	bsr.b loc_08447c
	bra.b loc_0844a8

loc_084474:
	cmpi.b #3,($13,a5)
	bne.b loc_084484

loc_08447c:
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_084484:
	rts

;----------------------------------------------
loc_084486:
	move.b ($5,a6),d0
	move.w loc_084498(pc,d0.w),d1
	jsr loc_084498(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084498:
	dc.w loc_08449c-loc_084498
	dc.w loc_0844bc-loc_084498

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08449c:
	tst.b ($15f,a5)
	bne.b loc_0844a8
	bsr.w loc_084c00
	beq.b loc_0844bc

loc_0844a8:
	addq.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	bset.b #2,($13,a5)

loc_0844bc:
	rts

;==============================================
loc_0844be:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_0844ce(pc,d0.w),d1
	jmp loc_0844ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0844ce:
	dc.w loc_0844d6-loc_0844ce
	dc.w loc_084548-loc_0844ce
	dc.w loc_084b04-loc_0844ce
	dc.w loc_084b04-loc_0844ce

;----------------------------------------------
loc_0844d6:
	move.b (5,a6),d0
	move.w loc_0844e2(pc,d0.w),d1
	jmp loc_0844e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0844e2:
	dc.w loc_0844e6-loc_0844e2
	dc.w loc_08452c-loc_0844e2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0844e6:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	bsr.w loc_084c5a
	sne.b ($c,a6)
	move.b d0,($d,a6)
	move.b d0,($b,a6)
	add.w d0,d0
	bsr.b loc_084590
	moveq #0,d0
	lea.l loc_084b20(pc),a0
	jmp loc_01b6e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08452c:
	tst.b ($15f,a5)
	beq.b loc_084536
	bsr.b loc_08453e
	bra.b loc_08456a

loc_084536:
	cmpi.b #3,($13,a5)
	bne.b loc_084546

loc_08453e:
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_084546:
	rts

;----------------------------------------------
loc_084548:
	move.b (5,a6),d0
	move.w loc_08455a(pc,d0.w),d1
	jsr loc_08455a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08455a:
	dc.w loc_08455e-loc_08455a
	dc.w loc_08458e-loc_08455a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08455e:
	tst.b ($15f,a5)
	bne.b loc_08456a
	bsr.w loc_08464e
	beq.b loc_08458e

loc_08456a:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w ($4a,a6),($10,a6)
	move.w d0,($12,a6)
	move.w ($4e,a6),($14,a6)
	move.w d0,($16,a6)
	bsr.w loc_084c5a
	addq.b #3,d0
	bset.b d0,($13,a5)

loc_08458e:
	rts

;==============================================
loc_084590:
	move.b ($a,a6),d1
	andi.w #2,d1
	move.w loc_0845a0(pc,d1.w),d1
	jmp loc_0845a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0845a0:
	dc.w loc_0845a4-loc_0845a0
	dc.w loc_0845fa-loc_0845a0

;----------------------------------------------
loc_0845a4:
	move.w #$f4,d1
	move.w #$1c,d2
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_0845c2
	move.b ($101,a4),d2
	lsl.w #2,d2
	move.w loc_0845ee(pc,d2.w),d1
	move.w loc_0845ee+2(pc,d2.w),d2

loc_0845c2:
	move.w d1,($46,a6)
	move.w d2,($4e,a6)
	move.w #$e697,($44,a6)
	move.w #$196,($4c,a6)
	move.w loc_0845ea(pc,d0.w),($10,a6)
	move.w ($46,a6),($14,a6)
	move.w ($10,a6),($4a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0845ea:
	dc.w $0050,$0130

loc_0845ee:
	dc.w $00fc,$0024
	dc.w $00e8,$0012
	dc.w $00f4,$001c

;----------------------------------------------
loc_0845fa:
	lsl.w #2,d0
	move.w loc_084638(pc,d0.w),($42,a6)
	move.w loc_084638+2(pc,d0.w),($4a,a6)
	move.w loc_084638+4(pc,d0.w),($40,a6)
	move.w loc_084638+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	moveq #$1c,d1
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_08462e
	move.b ($101,a4),d1
	add.w d1,d1
	move.w loc_084648(pc,d1.w),d1

loc_08462e:
	move.w d1,($14,a6)
	move.w d1,($4e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084638:
	dc.w $ffb0,$0050,$12d2,$fed3
	dc.w $01d0,$0130,$ed2e,$012d

loc_084648:
	dc.w $0024,$0014,$001c

;==============================================
loc_08464e:
	add.b ($a,a6),d1
	andi.w #2,d1
	move.w loc_08465e(pc,d1.w),d1
	jmp loc_08465e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08465e:
	dc.w loc_084c00-loc_08465e
	dc.w loc_084bd2-loc_08465e

;==============================================
loc_084662:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_084672(pc,d0.w),d1
	jmp loc_084672(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084672:
	dc.w loc_08467a-loc_084672
	dc.w loc_084716-loc_084672
	dc.w loc_084b04-loc_084672
	dc.w loc_084b04-loc_084672

;----------------------------------------------
loc_08467a:
	move.b (5,a6),d0
	move.w loc_084686(pc,d0.w),d1
	jmp loc_084686(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084686:
	dc.w loc_08468a-loc_084686
	dc.w loc_0846fa-loc_084686

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08468a:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	bsr.w loc_084c5a
	move.w d0,d1
	addi.w #$11b,d1
	move.w d1,($c,a6)
	add.w d0,d0
	move.w loc_0846f0(pc,d0.w),($10,a6)
	moveq #$1f,d1
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_0846de
	move.b ($101,a4),d1
	add.w d1,d1
	move.w loc_0846f4(pc,d1.w),d1

loc_0846de:
	move.w d1,($14,a6)
	moveq #$1c,d0
	lea.l loc_2f3b20,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0846f0:
	dc.w $0058,$0128

loc_0846f4:
	dc.w $0027,$0017,$001f

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0846fa:
	tst.b ($15f,a5)
	beq.b loc_084704
	bsr.b loc_08470c
	bra.b loc_08473e

loc_084704:
	cmpi.b #$1f,($13,a5)
	bne.b loc_084714

loc_08470c:
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_084714:
	rts

;----------------------------------------------
loc_084716:
	move.b (5,a6),d0
	move.w loc_084728(pc,d0.w),d1
	jsr loc_084728(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084728:
	dc.w loc_08472c-loc_084728
	dc.w loc_0847a6-loc_084728

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08472c:
	tst.b ($15f,a5)
	bne.b loc_08473e
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_0847a6

loc_08473e:
	addq.b #2,(5,a6)
	bsr.w loc_084c5a
	move.b d0,($d,a6)
	sne.b ($c,a6)
	move.w #$2000,($1a,a6)
	subq.w #3,($14,a6)
	bsr.w loc_084c5a
	addq.b #5,d0
	bset.b d0,($13,a5)
	moveq #2,d0
	tst.w (Region,a5)
	beq.b loc_08476c
	moveq #4,d0

loc_08476c:
	moveq #0,d1
	move.b ($102,a4),d1
	moveq #$14,d2
	move.w (Dramatic_Mode_Type,a5),d3
	btst d3,d2
	beq.b loc_084790
	move.l #$c0000000,d2
	btst d1,d2
	beq.b loc_084790
	btst #1,($101,a4)
	beq.b loc_084790
	moveq #$17,d1

loc_084790:
	lsl.w #3,d1
	lea.l loc_087352,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0847a6:
	rts

;==============================================
loc_0847a8:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_0847b8(pc,d0.w),d1
	jmp loc_0847b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0847b8:
	dc.w loc_084090-loc_0847b8
	dc.w loc_0847c0-loc_0847b8
	dc.w loc_084b04-loc_0847b8
	dc.w loc_084b04-loc_0847b8

;----------------------------------------------
loc_0847c0:
	tst.b ($8c,a5)
	bne.w loc_084c90
	move.b (5,a6),d0
	move.w loc_0847da(pc,d0.w),d1
	jsr loc_0847da(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0847da:
	dc.w loc_0847de-loc_0847da
	dc.w loc_0847fe-loc_0847da

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0847de:
	bsr.w loc_0843d6
	beq.b loc_0847fe
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w ($4a,a6),($10,a6)
	move.w d0,($12,a6)
	move.w ($4e,a6),($14,a6)
	move.w d0,($16,a6)

loc_0847fe:
	rts

;==============================================
loc_084800:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_084810(pc,d0.w),d1
	jmp loc_084810(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084810:
	dc.w loc_084818-loc_084810
	dc.w loc_084900-loc_084810
	dc.w loc_084b04-loc_084810
	dc.w loc_084b04-loc_084810

;----------------------------------------------
loc_084818:
	move.b (5,a6),d0
	move.w loc_084824(pc,d0.w),d1
	jmp loc_084824(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084824:
	dc.w loc_084828-loc_084824
	dc.w loc_0848e4-loc_084824

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084828:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	bsr.w loc_084c5a
	move.b d0,($d,a6)
	sne.b ($c,a6)
	lsl.w #3,d0
	move.w loc_0848d4(pc,d0.w),($42,a6)
	move.w loc_0848d4+2(pc,d0.w),($4a,a6)
	move.w loc_0848d4+4(pc,d0.w),($40,a6)
	move.w loc_0848d4+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$2d,($14,a6)
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_084892
	move.w #$35,($14,a6)

loc_084892:
	bsr.w loc_084c5a
	addi.b #$c,d0
	move.b ($132,a4),d1
	bsr.w loc_084934
	tst.b ($15e,a4)
	bne.b loc_0848bc
	tst.b ($125,a4)
	beq.b loc_0848c2
	move.l #$c0200400,d1
	move.b ($102,a4),d0
	btst d0,d1
	beq.b loc_0848c2


loc_0848bc:
	move.b #4,(4,a6)

loc_0848c2:
	move.b ($132,a4),d1
	ext.w d1
	addq.w #1,d1
	moveq #1,d0
	add.b (Dip_SFAlpha,a5),d0
	bra.w loc_084b0a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0848d4:
	dc.w $ffc8,$0058,$12d2,$fed3
	dc.w $01c8,$0128,$ed2e,$012d

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0848e4:
	tst.b ($15f,a5)
	beq.b loc_0848ee
	bsr.b loc_0848f6
	bra.b loc_084922

loc_0848ee:
	cmpi.b #$1f,($13,a5)
	bne.b loc_0848fe

loc_0848f6:
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_0848fe:
	rts

;----------------------------------------------
loc_084900:
	move.b (5,a6),d0
	move.w loc_084912(pc,d0.w),d1
	jsr loc_084912(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084912:
	dc.w loc_084916-loc_084912
	dc.w loc_084932-loc_084912

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084916:
	tst.b ($15f,a5)
	bne.b loc_084922
	bsr.w loc_084bd2
	beq.b loc_084932

loc_084922:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w ($4a,a6),($10,a6)
	move.w d0,($12,a6)

loc_084932:
	rts

;==============================================
loc_084934:
	lsl.w #5,d0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d0.w),a1
	ext.w d1
	addi.w #$125,d1
	lsl.w #5,d1
	lea.l loc_35cc34,a0
	lea.l (a0,d1.w),a0
	moveq #0,d7
	jmp loc_01b7c0

;==============================================
loc_08495a:
	tst.b ($8c,a5)
	bne.w loc_084c90
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_084972(pc,d0.w),d1
	jmp loc_084972(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084972:
	dc.w loc_08497a-loc_084972
	dc.w loc_084a54-loc_084972
	dc.w loc_084b04-loc_084972
	dc.w loc_084b04-loc_084972

;----------------------------------------------
loc_08497a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b #$f,($3a,a6)
	move.w #$ff07,($c,a6)
	move.b #1,($b,a6)
	move.w #$fec0,($10,a6)
	move.w #$18,($40,a6)
	move.w #$40,($42,a6)
	bsr.w loc_084c5a
	beq.b loc_0849e8
	move.w #$ff0b,($c,a6)
	move.b #0,($b,a6)
	move.w #$2c0,($10,a6)
	move.w #$ffe8,($40,a6)
	move.w #$140,($42,a6)

loc_0849e8:
	move.w #$c8,($14,a6)
	move.w #8,($44,a6)
	tst.b ($125,a4)
	beq.b loc_084a06
	move.w #$48,($14,a6)
	move.w #$fff8,($44,a6)

loc_084a06:
	move.b ($102,a4),d0
	move.b d0,($3c,a6)

loc_084a0e:
	moveq #0,d0
	move.b ($3c,a6),d0
	move.b ($132,a4),d1
	move.b ($128,a4),d2
	move.b ($d,a6),d3
	jsr loc_01f75c
	move.b ($132,a4),d0
	add.b d0,d0
	add.b ($bb,a5),d0
	ext.w d0
	addi.w #$14,d0
	moveq #0,d1
	move.b ($3c,a6),d1
	lsl.w #3,d1
	add.w d0,d0
	lea.l loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;----------------------------------------------
loc_084a54:
	move.b (5,a6),d0
	move.w loc_084a66(pc,d0.w),d1
	jsr loc_084a66(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084a66:
	dc.w loc_084a6c-loc_084a66
	dc.w loc_084a8c-loc_084a66
	dc.w loc_084af2-loc_084a66

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084a6c:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_084a8a
	addq.b #2,(5,a6)
	move.w ($42,a6),($10,a6)
	move.w ($112,a5),($48,a6)

loc_084a8a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084a8c:
	move.w ($112,a5),d1
	beq.b loc_084ac6
	cmp.w ($48,a6),d1
	beq.b loc_084abe
	move.w d1,d2
	rol.w #1,d2
	andi.w #1,d2
	cmp.b ($125,a4),d2
	bne.b loc_084abe
	moveq #0,d0
	move.b ($102,a4),d0
	btst #$e,d1
	beq.b loc_084ab6
	move.b loc_084ad2(pc,d0.w),d0

loc_084ab6:
	move.b d0,($3c,a6)
	bsr.w loc_084a0e

loc_084abe:
	move.w ($112,a5),($48,a6)
	rts

loc_084ac6:
	addq.b #2,(5,a6)
	move.b #$b,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084ad2:
	dc.b $0a,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$00,$11
	dc.b $00,$0a,$16,$00
	dc.b $18,$19,$10,$1b
	dc.b $1c,$1d,$0a,$0a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084af2:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_084c90
	rts

;----------------------------------------------
loc_084b04:
	jmp loc_01c2de

;----------------------------------------------
loc_084b0a:
	lsl.w #3,d1
	add.w d0,d0
	lea.l loc_084b20(pc),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084b20:
	dc.w loc_084b28-loc_084b20
	dc.w loc_084b30-loc_084b20
	dc.w loc_084b48-loc_084b20
	dc.w $0000

loc_084b28:
	dc.w $ff40,$0000
	dc.l loc_084b60

loc_084b30:
	dc.w $0800,$0000
	dc.l loc_084b6e

	dc.w $0800,$0000
	dc.l loc_084b84

	dc.w $0840,$0000
	dc.l loc_084b9a

loc_084b48:
	dc.w $0800,$0000
	dc.l loc_084b6e

	dc.w $0800,$0000
	dc.l loc_084bb0

	dc.w $ff40,$0000
	dc.l loc_084b9a


loc_084b60:
	dc.w $0008,$000a,$0000,$0556,$091b,$ffb0,$fff4

loc_084b6e:;2P name
	dc.w $000c,$0007,$0002
	dc.l loc_084bc6
	dc.w $28c4,$010c,$28cc
	dc.w $030c,$28d0,$000c

loc_084b84:;1P name
	dc.w $000c,$0007,$0002
	dc.l loc_084bc6
	dc.w $28c6,$010c,$28cc
	dc.w $030c,$28d0,$000c

loc_084b9a:;2P ISM
	dc.w $000c,$0007,$0002
	dc.l loc_084bc6
	dc.w $28c8,$010c,$28cc
	dc.w $030c,$28d0,$000c

loc_084bb0:
	dc.w $000c,$0007,$0002
	dc.l loc_084bc6
	dc.w $28ca,$010c,$28cc
	dc.w $030c,$28d0,$000c

loc_084bc6:
	dc.w $ffc8,$fff8
	dc.w $ffe8,$fff8
	dc.w $0028,$fff8

;##############################################
loc_084bd2:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($48,a6),d0
	add.w ($40,a6),d0
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_084bf8
	eor.w d0,d1
	bmi.b loc_084bfc

loc_084bf8:
	moveq #1,d0
	rts

loc_084bfc:
	moveq #0,d0
	rts

;##############################################
loc_084c00:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_084c26
	eor.w d0,d1
	bmi.b loc_084c2a

loc_084c26:
	moveq #1,d0
	rts

loc_084c2a:
	moveq #0,d0
	rts

;##############################################
loc_084c2e:
	bsr.w loc_084c5a
	move.w d0,d1
	move.w d0,d3
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_084c58
	move.b ($101,a4),d3
	btst #1,d3
	bne.b loc_084c58
	moveq #2,d1
	add.b d3,d1
	btst #0,(Active_Player_01,a5)
	bne.b loc_084c58
	moveq #5,d1
	sub.b d3,d1

loc_084c58:
	rts

;==============================================
loc_084c5a:
	move.w (Dramatic_Mode_Type,a5),d0
	add.w d0,d0
	add.b ($101,a4),d0
	move.b loc_084c80(pc,d0.w),d0
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_084c7c
	btst #0,(Active_Player_01,a5)
	bne.b loc_084c7c
	eori.b #1,d0

loc_084c7c:
	tst.b d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084c80:
	dc.b $00,$01,$ff,$ff
	dc.b $00,$01,$01,$01
	dc.b $00,$01,$00,$00
	dc.b $00,$00,$01,$ff

;==============================================
loc_084c90:
	move.b #4,(4,a6)
	rts

;##############################################
;Start of ??
loc_084c98:
	move.b (3,a6),d0
	move.w loc_084ca4(pc,d0.w),d1
	jmp loc_084ca4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084ca4:
	dc.w loc_084cbc-loc_084ca4
	dc.w loc_084d84-loc_084ca4
	dc.w loc_084eac-loc_084ca4
	dc.w loc_084f26-loc_084ca4
	dc.w loc_085060-loc_084ca4
	dc.w loc_0850a0-loc_084ca4
	dc.w loc_0850a0-loc_084ca4
	dc.w loc_0851ac-loc_084ca4

	dc.w loc_08522e-loc_084ca4
	dc.w loc_085262-loc_084ca4
	dc.w loc_085342-loc_084ca4
	dc.w loc_085422-loc_084ca4

;==============================================
loc_084cbc:
	move.b (4,a6),d0
	move.w loc_084cc8(pc,d0.w),d1
	jmp loc_084cc8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084cc8:
	dc.w loc_084cd0-loc_084cc8
	dc.w loc_084cf0-loc_084cc8
	dc.w loc_085460-loc_084cc8
	dc.w loc_085460-loc_084cc8

;----------------------------------------------
loc_084cd0:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$190,($10,a6)
	moveq #0,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_084cf0:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	move.b (5,a6),d0
	move.w loc_084d12(pc,d0.w),d1
	jsr loc_084d12(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084d12:
	dc.w loc_084d18-loc_084d12
	dc.w loc_084d38-loc_084d12
	dc.w loc_084d70-loc_084d12

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084d18:
	addi.w #$fff0,($10,a6)
	cmpi.w #$a0,($10,a6)
	bcc.b loc_084d36
	addq.b #2,(5,a6)
	move.w #$a0,($10,a6)
	move.w #$20,($3a,a6)

loc_084d36:
	bra.b loc_084d70

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084d38:
	move.w ($3a,a6),d0
	subq.w #2,d0
	bne.b loc_084d44
	addq.b #2,(5,a6)

loc_084d44:
	move.w d0,($3a,a6)
	move.w loc_084d50(pc,d0.w),($10,a6)
	bra.b loc_084d70

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084d50:
	dc.w $00a0,$00a1,$009f,$00a2
	dc.w $009e,$00a3,$009d,$00a4
	dc.w $009c,$00a5,$009b,$00a6
	dc.w $009a,$00a7,$0099,$00a8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084d70:
	addq.w #1,($14,a6)
	cmpi.w #$160,($14,a6)
	ble.b loc_084d82
	addi.w #$fe40,($14,a6)

loc_084d82:
	rts

;==============================================
loc_084d84:
	move.b (4,a6),d0
	move.w loc_084d90(pc,d0.w),d1
	jmp loc_084d90(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084d90:
	dc.w loc_084d98-loc_084d90
	dc.w loc_084e16-loc_084d90
	dc.w loc_085460-loc_084d90
	dc.w loc_085460-loc_084d90

;----------------------------------------------
loc_084d98:
	addq.b #2,(4,a6)
	movea.w (-$6026,a5),a4
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$2000,($1a,a6)
	move.w #$20,($3a,a6)
	move.w #$e0,($10,a6)
	move.w #$80,($14,a6)
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)+
	lea.l ($58,a6),a1
	move.l a1,(a0)
	move.w #8,(a1)+
	move.l #$100000,(a1)+
	moveq #0,d0
	move.b ($10c,a4),d0
	move.b d0,($3c,a6)
	add.b d0,d0
	move.w loc_084e02(pc,d0.w),(a1)+
	move.w #$331e,(a1)+
	move.l #$ffe0ffe0,(a1)+
	move.b ($10c,a4),d0
	jmp loc_003c5e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084e02:
	dc.w $0980,$0984,$0988,$098c
	dc.w $09c0,$09c4,$09c8,$09cc
	dc.w $0a00,$0a04

;----------------------------------------------
loc_084e16:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	movea.w (-$6026,a5),a4
	moveq #0,d0
	move.b ($10c,a4),d0
	cmp.b ($3c,a6),d0
	beq.b loc_084e5c
	clr.b (5,a6)
	move.b d0,($3c,a6)
	add.b d0,d0
	move.w loc_084e02(pc,d0.w),($5e,a6)
	move.w #$20,($3a,a6)
	move.w #$9280,(sub_palram,a5)
	move.b ($10c,a4),d0
	jsr loc_003c5e

loc_084e5c:
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_084e70(pc,d0.w),d1
	jsr loc_084e70(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084e70:
	dc.w loc_084e74-loc_084e70
	dc.w loc_084e8a-loc_084e70

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_084e74:
	move.w ($3a,a6),d0
	subq.w #2,d0
	bne.b loc_084e80
	addq.b #2,(5,a6)

loc_084e80:
	move.w d0,($3a,a6)
	move.w loc_084e8c(pc,d0.w),($14,a6)

loc_084e8a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084e8c:
	dc.w $0080,$0081,$007e,$0083
	dc.w $007c,$0085,$007a,$0087
	dc.w $0078,$0089,$0076,$008b
	dc.w $0074,$008d,$0072,$008f

;==============================================
loc_084eac:
	move.b (4,a6),d0
	move.w loc_084eb8(pc,d0.w),d1
	jmp loc_084eb8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084eb8:
	dc.w loc_084ec0-loc_084eb8
	dc.w loc_084eee-loc_084eb8
	dc.w loc_085460-loc_084eb8
	dc.w loc_085460-loc_084eb8

;----------------------------------------------
loc_084ec0:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	bsr.w loc_08546c
	move.w #$ff38,($10,a6)
	move.w #$80,($14,a6)
	move.w #$10,($40,a6)
	moveq #4,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_084eee:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	move.w ($40,a6),d0
	beq.b loc_084f1a
	add.w d0,($10,a6)
	cmpi.w #$b8,($10,a6)
	bcc.b loc_084f1a
	move.w #$b8,($10,a6)
	clr.w ($40,a6)

loc_084f1a:
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_084f26:
	move.b (4,a6),d0
	move.w loc_084f32(pc,d0.w),d1
	jmp loc_084f32(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_084f32:
	dc.w loc_084f3a-loc_084f32
	dc.w loc_084f9a-loc_084f32
	dc.w loc_085460-loc_084f32
	dc.w loc_085460-loc_084f32

;----------------------------------------------
loc_084f3a:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	bsr.w loc_08546c
	move.w d0,($30,a6)
	move.w #0,($10,a6)
	move.w #$8c,($14,a6)
	lea.l ($36,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.l #$e001a,(a0)+
	move.l #$19001e,(a0)+
	move.l #loc_085764,(a0)+
	movea.w (-$6026,a5),a4
	move.b ($10a,a4),d0
	move.b ($10c,a4),d1
	ext.w d0
	lea.l loc_085932(pc),a0
	move.b (a0,d0.w),d0
	bra.w loc_084fe0

;----------------------------------------------
loc_084f9a:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	addi.l #$a000,($10,a6)
	movea.w (-$6026,a5),a4
	bsr.b loc_084fbe
	jmp loc_01b4ec

loc_084fbe:
	move.b ($10a,a4),d0
	move.b ($10c,a4),d1
	ext.w d0
	lea.l loc_085932(pc),a0
	move.b (a0,d0.w),d0
	cmp.b ($31,a6),d0
	bne.b loc_084fdc
	cmp.b ($30,a6),d1
	beq.b loc_085022

loc_084fdc:
	clr.l ($10,a6)

loc_084fe0:
	move.b d0,($31,a6)
	move.b d1,($30,a6)
	lea.l ($4a,a6),a1
	ext.w d1
	lsl.w #2,d1
	movea.l loc_085024(pc,d1.w),a0
	add.w d0,d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,(a1)+
	movem.l (a0),d2-d7

	movem.l d2-d7,(a1)
	lea.l ($18,a1),a1
	lsr.w #1,d1
	move.w loc_08504c(pc,d1.w),d1
	add.w d0,d1
	lea.l loc_0857cc(pc),a0
	lea.l (a0,d1.w),a0
	move.w (a0)+,(a1)+
	movem.l (a0),d2-d7
	movem.l d2-d7,(a1)

loc_085022:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085024:
	dc.l loc_085906,loc_0858da
	dc.l loc_0858ae,loc_0858ae
	dc.l loc_0858ae,loc_0858ae
	dc.l loc_0858ae,loc_0858ae
	dc.l loc_0858ae,loc_0858ae

loc_08504c:
	dc.w $0000,$0014,$0028,$003c
	dc.w $0050,$0064,$0078,$008c
	dc.w $00a0,$00b4

;==============================================
loc_085060:
	move.b (4,a6),d0
	move.w loc_08506c(pc,d0.w),d1
	jmp loc_08506c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08506c:
	dc.w loc_085074-loc_08506c
	dc.w loc_08509a-loc_08506c
	dc.w loc_085460-loc_08506c
	dc.w loc_085460-loc_08506c

;----------------------------------------------
loc_085074:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$b0,($10,a6)
	move.w #$88,($14,a6)
	moveq #1,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08509a:
	jmp loc_01b4ec

;==============================================
loc_0850a0:
	move.b (4,a6),d0
	move.w loc_0850b2(pc,d0.w),d1
	jsr loc_0850b2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0850b2:
	dc.w loc_0850ba-loc_0850b2
	dc.w loc_08510c-loc_0850b2
	dc.w loc_085460-loc_0850b2
	dc.w loc_085460-loc_0850b2

;----------------------------------------------
loc_0850ba:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$c0,($10,a6)
	move.w #$20,($3a,a6)
	clr.w ($36,a6)
	jsr loc_01c2c8
	beq.b loc_0850fa
	move.l #$1000d16,(a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($a,a6),($a,a4)
	move.w a4,($36,a6)

loc_0850fa:
	moveq #2,d0
	add.b ($a,a6),d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08510c:
	move.b ($5,a6),d0
	move.w loc_08512e(pc,d0.w),d1
	jsr loc_08512e(pc,d1.w)
	move.w ($36,a6),d0
	beq.b loc_08512c
	movea.w d0,a4
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_08512c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08512e:
	dc.w loc_085136-loc_08512e
	dc.w loc_085142-loc_08512e
	dc.w loc_08516e-loc_08512e
	dc.w loc_085196-loc_08512e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085136:
	subq.w #1,($3a,a6)
	bpl.b loc_085140
	addq.b #2,(5,a6)

loc_085140:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085142:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	move.w ($14,a6),d1
	subi.w #$80,d1
	beq.b loc_085158
	eor.w d0,d1
	bmi.b loc_085168

loc_085158:
	addq.b #2,(5,a6)
	move.w #$80,($14,a6)
	move.w #$10,($3a,a6)

loc_085168:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08516e:
	move.w ($3a,a6),d0
	subq.w #1,d0
	bne.b loc_08517a
	addq.b #2,(5,a6)

loc_08517a:
	move.w d0,($3a,a6)
	moveq #0,d1
	move.b loc_08519c(pc,d0.w),d1
	ext.w d1
	tst.b ($a,a6)
	beq.b loc_08518e
	neg.w d1

loc_08518e:
	addi.w #$80,d1
	move.w d1,($14,a6)

loc_085196:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08519c:
	dc.b $00,$01,$ff,$02
	dc.b $fe,$03,$fd,$04
	dc.b $fc,$05,$fb,$06
	dc.b $fa,$07,$f9,$08

;==============================================
loc_0851ac:
	move.b (4,a6),d0
	move.w loc_0851b8(pc,d0.w),d1
	jmp loc_0851b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0851b8:
	dc.w loc_0851c0-loc_0851b8
	dc.w loc_085218-loc_0851b8
	dc.w loc_085460-loc_0851b8
	dc.w loc_085460-loc_0851b8

;----------------------------------------------
loc_0851c0:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #6,(9,a6)
	bsr.w loc_08546c
	move.w #$2000,($1a,a6)
	move.w #$c0,($10,a6)
	move.w #$88,($14,a6)
	move.b ($132,a4),d0
	ext.w d0
	add.w d0,d0
	addi.w #$e,d0
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_0851fa
	addq.w #1,d0

loc_0851fa:
	moveq #0,d1
	move.b ($102,a4),d1
	lsl.w #3,d1
	add.w d0,d0
	movea.l #loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;----------------------------------------------
loc_085218:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	jmp loc_01b4ec

;==============================================
loc_08522e:
	move.b (4,a6),d0
	move.w loc_08523a(pc,d0.w),d1
	jmp loc_08523a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08523a:
	dc.w loc_085242-loc_08523a
	dc.w loc_085218-loc_08523a
	dc.w loc_085460-loc_08523a
	dc.w loc_085460-loc_08523a

;----------------------------------------------
loc_085242:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$c0,($10,a6)
	moveq #0,d0
	movea.l #loc_2f407c,a0
	jmp loc_01b6e0

;==============================================
loc_085262:
	move.b (4,a6),d0
	move.w loc_08526e(pc,d0.w),d1
	jmp loc_08526e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08526e:
	dc.w loc_085276-loc_08526e
	dc.w loc_0852a4-loc_08526e
	dc.w loc_085460-loc_08526e
	dc.w loc_085460-loc_08526e

;----------------------------------------------
loc_085276:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$190,($10,a6)
	move.w #$fff0,($40,a6)
	move.l #$14000,($44,a6)
	moveq #7,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0852a4:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	move.b (5,a6),d0
	move.w loc_0852c6(pc,d0.w),d1
	jsr loc_0852c6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0852c6:
	dc.w loc_0852cc-loc_0852c6
	dc.w loc_0852f2-loc_0852c6
	dc.w loc_08532a-loc_0852c6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0852cc:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$88,($10,a6)
	bcc.b loc_0852f0
	addq.b #2,(5,a6)
	move.w #$88,($10,a6)
	clr.w ($40,a6)
	move.w #$20,($3a,a6)

loc_0852f0:
	bra.b loc_08532a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0852f2:
	move.w ($3a,a6),d0
	subq.w #2,d0
	bne.b loc_0852fe
	addq.b #2,(5,a6)

loc_0852fe:
	move.w d0,($3a,a6)
	move.w loc_08530a(pc,d0.w),($10,a6)
	bra.b loc_08532a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08530a:
	dc.w $0088,$0089,$0087,$008a
	dc.w $0086,$008b,$0085,$008c
	dc.w $0084,$008d,$0083,$008e
	dc.w $0082,$008f,$0081,$0090

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08532a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	cmpi.w #$160,($14,a6)
	ble.b loc_085340
	addi.w #$fe40,($14,a6)

loc_085340:
	rts

;==============================================
loc_085342:
	move.b (4,a6),d0
	move.w loc_08534e(pc,d0.w),d1
	jmp loc_08534e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08534e:
	dc.w loc_085356-loc_08534e
	dc.w loc_085384-loc_08534e
	dc.w loc_085460-loc_08534e
	dc.w loc_085460-loc_08534e

;----------------------------------------------
loc_085356:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$190,($10,a6)
	move.w #$fff0,($40,a6)
	move.l #$18000,($44,a6)
	moveq #8,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_085384:
	tst.b ($b8,a5)
	bmi.w loc_085466
	tst.b ($8e,a5)
	beq.w loc_085466
	move.b (5,a6),d0
	move.w loc_0853a6(pc,d0.w),d1
	jsr loc_0853a6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0853a6:
	dc.w loc_0853ac-loc_0853a6
	dc.w loc_0853d2-loc_0853a6
	dc.w loc_08540a-loc_0853a6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0853ac:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$78,($10,a6)
	bcc.b loc_0853d0
	addq.b #2,(5,a6)
	move.w #$78,($10,a6)
	clr.w ($40,a6)
	move.w #$20,($3a,a6)

loc_0853d0:
	bra.b loc_08540a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0853d2:
	move.w ($3a,a6),d0
	subq.w #2,d0
	bne.b loc_0853de
	addq.b #2,(5,a6)

loc_0853de:
	move.w d0,($3a,a6)
	move.w loc_0853ea(pc,d0.w),($10,a6)
	bra.b loc_08540a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0853ea:
	dc.w $0078,$0079,$0077,$007a
	dc.w $0076,$007b,$0075,$007c
	dc.w $0074,$007d,$0073,$007e
	dc.w $0072,$007f,$0071,$0080

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08540a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	cmpi.w #$160,($14,a6)
	ble.b loc_085420
	addi.w #$fe40,($14,a6)

loc_085420:
	rts

;==============================================
loc_085422:
	move.b (4,a6),d0
	move.w loc_08542e(pc,d0.w),d1
	jmp loc_08542e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08542e:
	dc.w loc_085436-loc_08542e
	dc.w loc_08545a-loc_08542e
	dc.w loc_085460-loc_08542e
	dc.w loc_085460-loc_08542e

;----------------------------------------------
loc_085436:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	bsr.w loc_08546c
	move.w #$2000,($1a,a6)
	moveq #0,d0
	add.b ($a,a6),d0
	movea.l #loc_085682,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08545a:
	jmp loc_01b4ec

;==============================================
loc_085460:
	jmp loc_01c2de

;==============================================
loc_085466:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_08546c:
	moveq #0,d0
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	rts

;##############################################
loc_08548a:
	move.w loc_085492(pc,d0.w),d1
	jmp loc_085492(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085492:
	dc.w loc_085496-loc_085492
	dc.w loc_0855a6-loc_085492

;==============================================
loc_085496:
	cmpi.b #$c,($6eb9,a5)
	bcs.w loc_085582
	jsr loc_01c2c8
	move.l #$1000d00,(a4)
	move.w #$80,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d00,(a4)
	move.w #$ffa0,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d12,(a4)
	move.w #$80,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d12,(a4)
	move.w #$ffa0,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d14,(a4)
	move.w #$80,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d14,(a4)
	move.w #$ffa0,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d02,(a4)
	jsr loc_01c2c8
	move.l #$1000d04,(a4)
	jsr loc_01c2c8
	move.l #$1000d06,(a4)
	jsr loc_01c2c8
	move.l #$1000d10,(a4)
	move.w #$f0,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d10,(a4)
	move.w #$20,($14,a4)
	jsr loc_01c2c8
	move.l #$1000d0e,(a4)
	move.w ($13a,a5),d0
	bne.b loc_085576
	move.w #$8400,d0
	btst #0,(Active_Player,a5)
	bne.b loc_085576
	move.w #$8800,d0

loc_085576:
	move.w d0,($36,a4)
	movea.w d0,a4
	jsr loc_08bd36

loc_085582:
	move.l #$101f80ff,(-$4a74,a5)
	move.l #$ffffffff,(-$4a70,a5)
	move.l #$ffffffff,(-$4a6c,a5)
	move.l #$7fffffff,(-$4a68,a5)
	bra.w loc_0855fc

;==============================================
loc_0855a6:
	cmpi.b #3,($6eb9,a5)
	bcs.b loc_0855f6
	jsr loc_01c2c8
	move.l #$1000d08,(a4)
	jsr loc_01c2c8
	move.l #$1000d0a,(a4)
	move.w #$100,($14,a4)
	move.w #$fff0,($44,a4)
	move.b #0,($a,a4)
	jsr loc_01c2c8
	move.l #$1000d0c,(a4)
	move.w #0,($14,a4)
	move.w #$10,($44,a4)
	move.b #1,($a,a4)

loc_0855f6:
	jmp loc_08bd6a

;==============================================
loc_0855fc:
	move.l (-$4a74,a5),d4
	lea.l $90c400,a0
	bsr.b loc_08562a
	move.l (-$4a70,a5),d4
	lea.l $90c800,a0
	bsr.b loc_08562a
	move.l (-$4a6c,a5),d4
	lea.l $90cc00,a0
	bsr.b loc_08562a
	move.l (-$4a68,a5),d4
	lea.l $90d000,a0

loc_08562a:
	moveq #$1f,d7
	moveq #$f,d5

loc_08562e:
	btst d7,d4
	bne.b loc_085638
	lea.l (-$20,a0),a0
	bra.b loc_08567c

loc_085638:
	move.w #$f,d6

loc_08563c:
	move.w -(a0),d0
	move.w d0,d1
	move.w d0,d2
	move.w d0,d3
	lsr.w #8,d1
	lsr.w #4,d2
	and.w d5,d1
	and.w d5,d2
	and.w d5,d3
	cmp.w d3,d2
	bcs.b loc_085654
	dc.w $c742 ;exg d3,d2

loc_085654:
	cmp.w d3,d1
	bcs.b loc_08565a
	dc.w $c741 ;exg d3,d1

loc_08565a:
	add.w d3,d3
	add.w d2,d3
	add.w d1,d3
	lsr.w #3,d3
	addq.w #8,d3
	move.w d3,d2
	lsl.w #4,d2
	move.w d3,d1
	lsl.w #8,d1
	andi.w #$f000,d0
	or.w d1,d0
	or.w d2,d0
	or.w d3,d0
	move.w d0,(a0)
	dbra d6,loc_08563c

loc_08567c:
	dbra d7,loc_08562e
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085682:
	dc.w loc_085688-loc_085682
	dc.w loc_085690-loc_085682
	dc.w 0

loc_085688:
	dc.w $0140,$0000
	dc.l loc_085698

loc_085690:
	dc.w $0140,$0000
	dc.l loc_0856fe

loc_085698:
	dc.w $0008,$0090,$000b
	dc.w $2488,$331e,$ff40,$ff80
	dc.w $2488,$331e,$ff80,$ff80
	dc.w $2488,$331e,$ffc0,$ff80
	dc.w $2488,$331e,$0000,$ff80
	dc.w $2488,$331e,$0040,$ff80
	dc.w $2488,$331e,$0080,$ff80
	dc.w $2488,$131e,$ff40,$ffc0
	dc.w $2488,$131e,$ff80,$ffc0
	dc.w $2488,$131e,$ffc0,$ffc0
	dc.w $2488,$131e,$0000,$ffc0
	dc.w $2488,$131e,$0040,$ffc0
	dc.w $2488,$131e,$0080,$ffc0

loc_0856fe:
	dc.w $0008,$0090,$000b
	dc.w $2488,$131e,$ff40,$0020
	dc.w $2488,$131e,$ff80,$0020
	dc.w $2488,$131e,$ffc0,$0020
	dc.w $2488,$131e,$0000,$0020
	dc.w $2488,$131e,$0040,$0020
	dc.w $2488,$131e,$0080,$0020
	dc.w $2488,$331e,$ff40,$0040
	dc.w $2488,$331e,$ff80,$0040
	dc.w $2488,$331e,$ffc0,$0040
	dc.w $2488,$331e,$0000,$0040
	dc.w $2488,$331e,$0040,$0040
	dc.w $2488,$331e,$0080,$0040


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085764:
	dc.w $fff0,$0000,$0000,$0000
	dc.w $0010,$0000,$0020,$0000
	dc.w $0030,$0000,$0040,$0000
	dc.w $0050,$0000,$0060,$0000
	dc.w $0070,$0000,$0080,$0000
	dc.w $0090,$0000,$00a0,$0000
	dc.w $00b0,$0000,$fff0,$0000
	dc.w $0000,$0000,$0010,$0000
	dc.w $0020,$0000,$0030,$0000
	dc.w $0040,$0000,$0050,$0000
	dc.w $0060,$0000,$0070,$0000
	dc.w $0080,$0000,$0090,$0000
	dc.w $00a0,$0000,$00b0,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0857cc:
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0a40,$0a40,$0a40
	dc.w $0a40,$0a40,$0a40,$0a40
	dc.w $0a40,$0a40,$0a40,$0a41
	dc.w $0a41,$0a41,$0a41,$0a41
	dc.w $0a41,$0a41,$0a41,$0a41
	dc.w $0a41,$0a42,$0a42,$0a42
	dc.w $0a42,$0a42,$0a42,$0a42
	dc.w $0a42,$0a42,$0a42,$0a43
	dc.w $0a43,$0a43,$0a43,$0a43
	dc.w $0a43,$0a43,$0a43,$0a43
	dc.w $0a43,$0a44,$0a44,$0a44
	dc.w $0a44,$0a44,$0a44,$0a44
	dc.w $0a44,$0a44,$0a44,$0a45
	dc.w $0a45,$0a45,$0a45,$0a45
	dc.w $0a45,$0a45,$0a45,$0a45
	dc.w $0a45,$0a46,$0a46,$0a46
	dc.w $0a46,$0a46,$0a46,$0a46
	dc.w $0a46,$0a46,$0a46,$0a47
	dc.w $0a47,$0a47,$0a47,$0a47
	dc.w $0a47,$0a47,$0a47,$0a47
	dc.w $0a47,$0a48,$0a48,$0a48
	dc.w $0a48,$0a48,$0a48,$0a48
	dc.w $0a48,$0a48,$0a48,$0a49
	dc.w $0a49,$0a49,$0a49,$0a49
	dc.w $0a49,$0a49,$0a49,$0a49
	dc.w $0a49

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0858ae:
	dc.w $0a57,$0a58,$0a59,$0a50
	dc.w $0a51,$0a52,$0a53,$0a54
	dc.w $0a55,$0a56,$0a57,$0a58
	dc.w $0a59,$0a50,$0a51,$0a52
	dc.w $0a53,$0a54,$0a55,$0a56
	dc.w $0a57,$0a58

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0858da:
	dc.w $0020,$0020,$0020,$0a50
	dc.w $0a51,$0a52,$0a53,$0a54
	dc.w $0a55,$0a56,$0a57,$0a58
	dc.w $0a59,$0a50,$0a51,$0a52
	dc.w $0a53,$0a54,$0a55,$0a56
	dc.w $0a57,$0a58

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085906:
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020
	dc.w $0020,$0a50,$0a51,$0a52
	dc.w $0a53,$0a54,$0a55,$0a56
	dc.w $0a57,$0a58

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085932:
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$03,$03
	dc.b $03,$03,$03,$03
	dc.b $03,$03,$03,$03
	dc.b $03,$03,$03,$04
	dc.b $04,$04,$04,$04
	dc.b $04,$04,$04,$04
	dc.b $04,$04,$04,$04
	dc.b $05,$05,$05,$05
	dc.b $05,$05,$05,$05
	dc.b $05,$05,$05,$05
	dc.b $05,$06,$06,$06
	dc.b $06,$06,$06,$06
	dc.b $06,$06,$06,$06
	dc.b $06,$07,$07,$07
	dc.b $07,$07,$07,$07
	dc.b $07,$07,$07,$07
	dc.b $07,$07,$08,$08
	dc.b $08,$08,$08,$08
	dc.b $08,$08,$08,$08
	dc.b $08,$08,$08,$09
	dc.b $09,$09,$09,$09
	dc.b $09,$09,$09,$09
	dc.b $09,$09,$09,$09

;##############################################
loc_0859b2:
	move.b (4,a6),d0
	move.w loc_0859be(pc,d0.w),d1
	jmp loc_0859be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0859be:
	dc.w loc_0859c6-loc_0859be
	dc.w loc_085a1c-loc_0859be
	dc.w loc_085a6e-loc_0859be
	dc.w loc_085a6e-loc_0859be

;==============================================
loc_0859c6:
	addq.b #2,(4,a6)
	clr.w ($c,a6)
	move.b #1,($30,a6)
	move.w #$6000,($1a,a6)
	move.w ($10,a6),($40,a6)
	addi.w #8,($14,a6)
	move.l #0,($44,a6)
	move.l #0,($4c,a6)
	jsr RNGFunction
	andi.w #$30,d0
	move.b d0,($4e,a6)
	clr.l ($48,a6)
	clr.w ($3a,a6)
	move.b ($3c,a6),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_085a1c:
	tst.b ($33,a6)
	bmi.b loc_085a68
	addq.w #1,($3a,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),($10,a6)
	addi.l #$c000,($48,a6)
	move.l ($48,a6),d0
	move.w ($3a,a6),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.b loc_085a58
	neg.l d0
 
loc_085a58:
	add.l d0,($10,a6)
	jsr loc_01b6b6
	jmp loc_01b4d0

loc_085a68:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_085a6e:
	jmp loc_01c2de

;##############################################
loc_085a74:
	moveq #0,d0
	moveq #2,d1
	moveq #$15,d2
	bra.w loc_085a88

;##############################################
loc_085a7e:
	moveq #0,d0
	moveq #2,d1
	moveq #$16,d2
	bra.w loc_085a88

;==============================================
loc_085a88:
	jsr loc_01c2c8
	beq.b loc_085af2
	addq.b #1,(a4)
	move.b #$f,(2,a4)
	move.b d0,(3,a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b d1,(9,a4)
	move.b d2,($3c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	moveq #$10,d0
	move.b ($b,a6),($b,a4)
	beq.b loc_085ac8
	neg.w d0

loc_085ac8:
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_085af4(pc,d0.w),d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_085af4(pc,d0.w),d0
	add.w d0,($14,a4)
	moveq #1,d0

loc_085af2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085af4:
	dc.w $0000,$0000,$0004,$fffc
	dc.w $ffff,$ffff,$0001,$0001
	dc.w $fffe,$fffe,$0002,$0002
	dc.w $fffd,$fffd,$0003,$0003

;##############################################
loc_085b14:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_085b22(pc,d0.w),d1
	jmp loc_085b22(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085b22:
	dc.w loc_085b30-loc_085b22
	dc.w loc_085d72-loc_085b22
	dc.w loc_085f0c-loc_085b22
	dc.w loc_086336-loc_085b22
	dc.w loc_0867de-loc_085b22
	dc.w loc_086baa-loc_085b22
	dc.w loc_086df8-loc_085b22

;==============================================
loc_085b30:
	move.b (4,a6),d0
	move.w loc_085b3c(pc,d0.w),d1
	jmp loc_085b3c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085b3c:
	dc.w loc_085b44-loc_085b3c
	dc.w loc_085bfc-loc_085b3c
	dc.w loc_0872a0-loc_085b3c
	dc.w loc_0872a0-loc_085b3c

;----------------------------------------------
loc_085b44:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$c0,($10,a6)
	move.w #$80,($14,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w #$f000,($20,a6)
	move.w #$f000,($22,a6)
	move.w d0,($24,a6)
	move.w d0,($26,a6)
	move.w #$1e1,($50,a6)
	move.w #$ffe2,($52,a6)
	moveq #0,d0
	moveq #0,d1
	cmpi.b #3,($8d,a5)
	beq.b loc_085bb4
	move.w #$1e1e,d0
	move.w #$fe1f,d1
	btst #0,($8d,a5)
	beq.b loc_085bb4
	neg.w d0
	neg.w d1

loc_085bb4:
	move.w d0,($12,a6)
	move.w d1,($16,a6)
	moveq #0,d0
	tst.b ($a,a6)
	beq.w loc_087334
	movem.w loc_085bf0(pc),d0/d1/d2/d3/d4
	movem.w d0/d1/d2/d3/d4,(-$4a5c,a5)
	bsr.w loc_085ce0
	lea.l (-$4a5c,a5),a0
	move.l a0,(-$4a60,a5)
	move.l loc_085bee(pc),(-$4a64,a5)
	lea.l (-$4a64,a5),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085bee:
	dc.l $ff400000

loc_085bf0:
	dc.w $0010,$0074,$001c
	dc.l loc_08ac56

;----------------------------------------------
loc_085bfc:
	move.b (5,a6),d0
	move.w loc_085c0e(pc,d0.w),d1
	jsr loc_085c0e(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085c0e:
	dc.w loc_085c14-loc_085c0e
	dc.w loc_085c58-loc_085c0e
	dc.w loc_085cac-loc_085c0e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085c14:
	move.w ($50,a6),d0
	add.w d0,($20,a6)
	move.w ($52,a6),d0
	add.w d0,($50,a6)
	move.w ($12,a6),d0
	add.w d0,($24,a6)
	move.w ($16,a6),d0
	add.w d0,($12,a6)
	move.w ($20,a6),($22,a6)
	bmi.b loc_085c56
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w d0,($20,a6)
	move.w d0,($22,a6)
	move.w d0,($24,a6)
	move.b ($a,a6),d0
	bset.b d0,($17,a5)

loc_085c56:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085c58:
	tst.b ($16,a5)
	beq.b loc_085c96
	addq.b #2,(5,a6)
	moveq #0,d0
	moveq #0,d1
	cmpi.b #3,(Active_Player_01,a5)
	beq.b loc_085c82
	move.w #$fd00,d0
	move.w #$c0,d1
	btst #0,($8d,a5)
	beq.b loc_085c82
	neg.w d0
	neg.w d1

loc_085c82:
	move.w d0,($12,a6)
	move.w d1,($16,a6)
	move.w #$fd00,($50,a6)
	move.w #$c0,($52,a6)

loc_085c96:
	tst.b ($a,a6)
	beq.b loc_085caa
	bsr.b loc_085ce0
	lea.l (p1memory,a5),a4
	bsr.b loc_085d0c
	lea.l (p2memory,a5),a4
	bra.b loc_085d0c

loc_085caa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085cac:
	move.w ($50,a6),d0
	add.w d0,($20,a6)
	move.w ($52,a6),d0
	add.w d0,($50,a6)
	move.w ($12,a6),d0
	add.w d0,($24,a6)
	move.w ($16,a6),d0
	add.w d0,($12,a6)
	move.w ($20,a6),d0
	move.w d0,($22,a6)
	cmpi.w #$4000,d0
	blt.b loc_085cde
	addq.b #2,(4,a6)

loc_085cde:
	rts

;----------------------------------------------
loc_085ce0:
	move.w #$25cc,d0
	move.w #$1116,d1
	moveq #$18,d2
	lea.l (-$4a52,a5),a0
	bsr.b loc_085cfe
	move.w #$560,d0
	move.w #$1100,d1
	moveq #3,d2
	lea.l (-$49ee,a5),a0

loc_085cfe:
	movem.w d0-d1,(a0)
	lea.l (4,a0),a0
	dbra d2,loc_085cfe
	rts

;----------------------------------------------
loc_085d0c:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_085d50
	moveq #0,d0
	move.b ($102,a4),d0
	move.b loc_085d52(pc,d0.w),d0
	bmi.b loc_085d50
	lsl.w #2,d0
	move.b ($3f,a4),d1
	bne.b loc_085d3c
	lea.l (-$4a52,a5),a0
	move.w #$560,(a0,d0.w)
	rts

loc_085d3c:
	lea.l loc_0880a4(pc),a0
	lea.l (-$49ee,a5),a1
	andi.w #3,d1
	lsl.w #2,d1
	move.l ($a,a0,d0.w),(a1,d1.w)

loc_085d50:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085d52:
	dc.b $18,$17,$16,$15
	dc.b $14,$13,$12,$11
	dc.b $10,$0f,$0e,$0d
	dc.b $0c,$0b,$0a,$09
	dc.b $08,$07,$ff,$07
	dc.b $ff,$19,$06,$ff
	dc.b $05,$04,$03,$02
	dc.b $01,$00,$1a,$1b

;==============================================
loc_085d72:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_085d82(pc,d0.w),d1
	jmp loc_085d82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085d82:
	dc.w loc_085d8a-loc_085d82
	dc.w loc_085dc4-loc_085d82
	dc.w loc_0872a0-loc_085d82
	dc.w loc_0872a0-loc_085d82

;----------------------------------------------
loc_085d8a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($3a,a6)
	move.b ($101,a4),d0
	move.b d0,($59,a6)
	move.b d0,($d,a6)
	sne.b ($c,a6)
	rts

;----------------------------------------------
loc_085dc4:
	addi.w #$80,($3a,a6)
	cmpi.w #$a00,($3a,a6)
	bcs.b loc_085dd6
	clr.b ($3a,a6)

loc_085dd6:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_085df2
	move.b (5,a6),d0
	move.w loc_085df4(pc,d0.w),d1
	jmp loc_085df4(pc,d1.w)

loc_085df2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085df4:
	dc.w loc_085dfe-loc_085df4
	dc.w loc_085e0c-loc_085df4
	dc.w loc_085e24-loc_085df4
	dc.w loc_085e4c-loc_085df4
	dc.w loc_085e74-loc_085df4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085dfe:
	cmpi.b #3,($17,a5)
	bne.b loc_085e0a
	addq.b #2,(5,a6)

loc_085e0a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085e0c:
	addq.b #2,(5,a6)
	btst #0,($15b,a4)
	beq.b loc_085e1c
	addq.b #4,(5,a6)

loc_085e1c:
	move.b ($102,a4),d0
	bra.w loc_085eb4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085e24:
	btst #0,($3c,a4)
	beq.b loc_085e34
	addq.b #2,(5,a6)
	bsr.w loc_0872b2

loc_085e34:
	move.b ($102,a4),d0
	bsr.b loc_085e8a
	moveq #0,d1
	move.b ($3a,a6),d1
	lsl.w #3,d1
	bsr.w loc_085ef2
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085e4c:
	btst #0,($15b,a4)
	beq.b loc_085e58
	addq.b #2,(5,a6)

loc_085e58:
	moveq #0,d1
	bsr.w loc_085ef2
	move.b ($81,a5),d0
	add.b ($101,a4),d0
	andi.w #1,d0
	beq.b loc_085e72
	jmp loc_01b4ec

loc_085e72:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085e74:
	tst.b ($16,a5)
	beq.b loc_085e7e
	addq.b #2,(4,a6)

loc_085e7e:
	moveq #0,d1
	bsr.w loc_085ef2
	jmp loc_01b4ec

;==============================================
loc_085e8a:
	tst.b ($3f,a4)
	beq.b loc_085ea2
	tst.b ($15c,a4)
	bne.b loc_085ea2
	move.b ($81,a5),d1
	andi.b #3,d1
	bne.b loc_085eb4
	bra.b loc_085ea8

loc_085ea2:
	cmp.b ($3c,a6),d0
	beq.b loc_085eb4

loc_085ea8:
	btst #0,($3c,a4)
	bne.b loc_085eb4
	bsr.w loc_0872a6

loc_085eb4:
	move.b d0,($3c,a6)
	move.w ($10,a4),d0
	add.w d0,d0
	move.w loc_085ed2(pc,d0.w),($10,a6)
	move.w ($14,a4),d0
	add.w d0,d0
	move.w loc_085ee2(pc,d0.w),($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085ed2:
	dc.w $0078,$0090,$00a8,$00c0
	dc.w $00d8,$00f0,$0108,$01c0

loc_085ee2:
	dc.w $00c8,$00b0,$0098,$0080
	dc.w $0068,$0050,$0038,$0110

;==============================================
loc_085ef2:
	moveq #0,d0
	add.b ($101,a4),d0
	tst.b ($a,a6)
	beq.b loc_085f08
	add.b ($81,a5),d0
	andi.w #1,d0
	addq.w #2,d0

loc_085f08:
	bra.w loc_087308

;==============================================
loc_085f0c:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_085f1c(pc,d0.w),d1
	jmp loc_085f1c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085f1c:
	dc.w loc_085f24-loc_085f1c
	dc.w loc_085f28-loc_085f1c
	dc.w loc_0872a0-loc_085f1c
	dc.w loc_0872a0-loc_085f1c

;----------------------------------------------
loc_085f24:
	addq.b #2,(4,a6)

loc_085f28:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_085f44
	move.b (5,a6),d0
	move.w loc_085f46(pc,d0.w),d1
	jmp loc_085f46(pc,d1.w)

loc_085f44:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085f46:
	dc.w loc_085f4c-loc_085f46
	dc.w loc_086076-loc_085f46
	dc.w loc_0861c4-loc_085f46

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_085f4c:
	move.b (6,a6),d0
	move.w loc_085f58(pc,d0.w),d1
	jmp loc_085f58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085f58:
	dc.w loc_085f62-loc_085f58
	dc.w loc_085ff0-loc_085f58
	dc.w loc_086006-loc_085f58
	dc.w loc_08601e-loc_085f58
	dc.w loc_08602a-loc_085f58

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_085f62:
	btst #0,($15b,a4)
	bne.b loc_085fda
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b #$ff,($3c,a6)
	move.b ($101,a4),d0
	move.b d0,($d,a6)
	sne.b ($c,a6)
	lsl.w #3,d0
	move.w loc_085fe0(pc,d0.w),($42,a6)
	move.w loc_085fe0+2(pc,d0.w),($4a,a6)
	move.w loc_085fe0+4(pc,d0.w),($40,a6)
	move.w loc_085fe0+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$31,($14,a6)
	tst.b ($a,a6)
	beq.b loc_085fde
	clr.w ($c,a6)
	moveq #3,d0
	bra.w loc_087334

loc_085fda:
	addq.b #2,(5,a6)

loc_085fde:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_085fe0:
	dc.w $ffa0,$0060,$1697,$fe97
	dc.w $01e0,$0120,$e96a,$0169

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_085ff0:
	bsr.w loc_08b22e
	beq.b loc_086004
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_086004:
	bra.b loc_08603c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086006:
	btst #0,($3c,a4)
	beq.b loc_08601c
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_08601c:
	bra.b loc_08603c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08601e:
	bsr.w loc_08b22e
	beq.b loc_086028
	addq.b #2,(6,a6)

loc_086028:
	bra.b loc_08603c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08602a:
	btst #0,($15b,a4)
	beq.b loc_08603a
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_08603a:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08603c:
	tst.b ($a,a6)
	bne.b loc_086064
	moveq #0,d1
	move.b ($102,a4),d1
	cmp.b ($3c,a6),d1
	beq.b loc_086070
	move.b d1,($3c,a6)
	lsl.w #3,d1
	moveq #1,d0
	tst.w (Region,a5)
	beq.b loc_08605e
	addq.b #1,d0

loc_08605e:
	bsr.w loc_08733e
	bra.b loc_086070

loc_086064:
	move.b ($81,a5),d0
	andi.b #1,d0
	move.b d0,($b,a6)

loc_086070:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086076:
	move.b (6,a6),d0
	move.w loc_086082(pc,d0.w),d1
	jmp loc_086082(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086082:
	dc.w loc_08608c-loc_086082
	dc.w loc_08614e-loc_086082
	dc.w loc_086164-loc_086082
	dc.w loc_08617c-loc_086082
	dc.w loc_086188-loc_086082

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08608c:
	btst #1,($15b,a4)
	bne.w loc_086128
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.l d0,($14,a6)
	move.b ($101,a4),d0
	add.w d0,d0
	move.w d0,d1
	move.l #$fffe0000,d2
	tst.b ($a,a6)
	beq.b loc_0860de
	addq.w #1,d1
	asr.l #1,d2

loc_0860de:
	move.l d2,($44,a6)
	lsl.w #3,d1
	move.w loc_08612e(pc,d1.w),($42,a6)
	move.w loc_08612e+2(pc,d1.w),($4a,a6)
	move.w loc_08612e+4(pc,d1.w),($40,a6)
	move.w loc_08612e+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	addi.w #$d,d0
	tst.b ($a,a6)
	bne.b loc_08610e
	moveq #$11,d0

loc_08610e:
	tst.w (Region,a5)
	beq.b loc_086116
	addq.w #1,d0

loc_086116:
	tst.b ($a,a6)
	beq.w loc_087334
	move.b ($102,a4),d1
	lsl.w #3,d1
	bra.w loc_08733e

loc_086128:
	addq.b #2,(5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08612e:
	dc.w $fff8,$0018,$03c3,$ffc4
	dc.w $fff8,$0028,$05a5,$ffa6
	dc.w $0188,$0168,$fc3d,$003c
	dc.w $0188,$0158,$fa5b,$005a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08614e:
	bsr.w loc_08b22e
	beq.b loc_086162
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_086162:
	bra.b loc_08619a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086164:
	btst #1,($3c,a4)
	beq.b loc_08617a
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_08617a:
	bra.b loc_08619a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08617c:
	bsr.w loc_08b22e
	beq.b loc_086186
	addq.b #2,(6,a6)

loc_086186:
	bra.b loc_08619a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086188:
	btst #1,($15b,a4)
	beq.b loc_086198
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_086198:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08619a:
	move.w ($34,a6),d0
	move.l ($44,a6),d1
	add.l d1,($14,a6)

loc_0861a6:
	tst.w ($14,a6)
	bpl.b loc_0861b2
	add.w d0,($14,a6)
	bra.b loc_0861a6

loc_0861b2:
	cmp.w ($14,a6),d0
	bhi.b loc_0861be
	sub.w d0,($14,a6)
	bra.b loc_0861b2

loc_0861be:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0861c4:
	move.b (6,a6),d0
	move.w loc_0861d0(pc,d0.w),d1
	jmp loc_0861d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0861d0:
	dc.w loc_0861da-loc_0861d0
	dc.w loc_08629e-loc_0861d0
	dc.w loc_0862c0-loc_0861d0
	dc.w loc_0862d8-loc_0861d0
	dc.w loc_0862f0-loc_0861d0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0861da:
	btst #2,($15b,a4)
	bne.w loc_086280
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.b d0,($c,a6)
	move.b #1,($d,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b ($101,a4),d0
	lsl.w #3,d0
	move.w loc_08628a(pc,d0.w),($42,a6)
	move.w loc_08628a+2(pc,d0.w),($4a,a6)
	move.w loc_08628a+4(pc,d0.w),($40,a6)
	move.w loc_08628a+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w ($10,a6),($24,a6)
	move.b ($a,a6),d0
	add.w d0,d0
	move.w loc_08629a(pc,d0.w),($14,a6)
	jsr loc_01c368
	beq.b loc_08626a
	addq.b #1,(a4)
	move.w #$2104,(2,a4)
	move.b ($a,a6),($a,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)

loc_08626a:
	moveq #0,d0
	move.b (Dip_Game_Turbo,a5),d0
	subq.b #3,d0
	add.b d0,d0
	add.b ($a,a6),d0
	addi.w #$11,d0
	bra.w loc_0872fc

loc_086280:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08628a:
	dc.w $ffd8,$003c,$0bc3,$ff44
	dc.w $01a8,$0144,$f43d,$00bc

loc_08629a:
	dc.w $0098,$0068

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08629e:
	move.w ($24,a6),($10,a6)
	bsr.w loc_08b22e
	beq.b loc_0862b8
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_0862b8:
	move.w ($10,a6),($24,a6)
	bra.b loc_086306

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0862c0:
	btst #2,($3c,a4)
	beq.b loc_0862d6
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_0862d6:
	bra.b loc_086306

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0862d8:
	move.w ($24,a6),($10,a6)
	bsr.w loc_08b22e
	beq.b loc_0862e8
	addq.b #2,(6,a6)

loc_0862e8:
	move.w ($10,a6),($24,a6)
	bra.b loc_086306

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0862f0:
	btst #2,($15b,a4)
	beq.b loc_086304
	addq.b #2,(4,a6)
	clr.b (5,a6)
	clr.b (6,a6)

loc_086304:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_086306:
	move.w ($24,a6),d1
	moveq #0,d0
	move.b ($13,a5),d0
	cmp.b ($a,a6),d0
	sne.b ($c,a6)
	bne.b loc_086326
	moveq #4,d0
	tst.b ($101,a4)
	beq.b loc_086324
	neg.w d0

loc_086324:
	add.w d0,d1

loc_086326:
	move.w d1,($10,a6)
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_086336:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_086346(pc,d0.w),d1
	jmp loc_086346(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086346:
	dc.w loc_08634e-loc_086346
	dc.w loc_086352-loc_086346
	dc.w loc_0872a0-loc_086346
	dc.w loc_0872a0-loc_086346

;----------------------------------------------
loc_08634e:
	addq.b #2,(4,a6)

loc_086352:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_08636e
	move.b (5,a6),d0
	move.w loc_086370(pc,d0.w),d1
	jmp loc_086370(pc,d1.w)

loc_08636e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086370:
	dc.w loc_086376-loc_086370
	dc.w loc_08654a-loc_086370
	dc.w loc_0866c8-loc_086370

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086376:
	move.b (6,a6),d0
	move.w loc_086382(pc,d0.w),d1
	jmp loc_086382(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086382:
	dc.w loc_08638c-loc_086382
	dc.w loc_086456-loc_086382
	dc.w loc_08646c-loc_086382
	dc.w loc_086484-loc_086382
	dc.w loc_086490-loc_086382

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08638c:
	btst #0,($15b,a4)
	bne.w loc_086440
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b #$ff,($3c,a6)
	move.b #$ff,($31,a6)
	move.b #$80,($3e,a6)
	move.b #$80,($3f,a6)
	move.b #$ff,($c,a6)
	move.b ($101,a4),d0
	move.b d0,($d,a6)
	move.b d0,($b,a6)
	addq.b #8,($d,a6)
	eori.b #1,($b,a6)
	lsl.w #3,d0
	move.w loc_086446(pc,d0.w),($42,a6)
	move.w loc_086446+2(pc,d0.w),($4a,a6)
	move.w loc_086446+4(pc,d0.w),($40,a6)
	move.w loc_086446+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$20,($14,a6)
	jsr loc_01c368
	beq.b loc_086444
	addq.b #1,(a4)
	move.w #$2100,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)
	jsr loc_01c368
	beq.b loc_086444
	addq.b #1,(a4)
	move.w #$2101,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	bra.b loc_086444

loc_086440:
	addq.b #2,(5,a6)

loc_086444:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086446:
	dc.w $ffb0,$0030,$0f0f,$ff0f
	dc.w $01d0,$0150,$f0f1,$00f1

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086456:
	bsr.w loc_08b22e
	beq.b loc_08646a
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_08646a:
	bra.b loc_0864ba

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08646c:
	btst #0,($3c,a4)
	beq.b loc_086482
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_086482:
	bra.b loc_0864ba

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086484:
	bsr.w loc_08b22e
	beq.b loc_08648e
	addq.b #2,(6,a6)

loc_08648e:
	bra.b loc_0864ba

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086490:
	btst #0,($15b,a4)
	beq.b loc_0864b8
	addq.b #2,(5,a6)
	clr.b (6,a6)
	movea.w ($28,a6),a0
	move.l #$6000000,(4,a0)
	movea.w ($2a,a6),a0
	move.l #$6000000,(4,a0)

loc_0864b8:
	rts

;----------------------------------------------
loc_0864ba:
	move.b ($3c,a6),d0
	move.b ($3e,a6),d1
	move.b ($54,a6),d2
	cmp.b ($31,a6),d0
	bne.b loc_0864d8
	cmp.b ($3f,a6),d1
	bne.b loc_0864d8
	cmp.b ($55,a6),d2
	beq.b loc_0864ec

loc_0864d8:
	move.b d0,($31,a6)
	move.b d1,($3f,a6)
	move.b d2,($55,a6)
	move.b ($d,a6),d3
	bsr.w loc_0872c0

loc_0864ec:
	moveq #0,d0
	move.b ($102,a4),d0
	move.b ($132,a4),d1
	move.b ($128,a4),($54,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_086508
	cmp.b ($3e,a6),d1
	beq.b loc_08653e

loc_086508:
	move.b d0,($3c,a6)
	move.b d1,($3e,a6)
	lsl.w #2,d0
	lea.l CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	moveq #$10,d0
	ext.w d1
	lsl.b #5,d1
	bcs.b loc_086526
	move.b d1,d0

loc_086526:
	movea.l (a0,d0.w),a0
	move.b ($102,a4),d0
	jsr loc_02fc88
	moveq #$2a,d0
	jsr loc_01b6e0
	bra.b loc_086544

loc_08653e:
	jsr loc_01b692

loc_086544:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08654a:
	move.b (6,a6),d0
	move.w loc_086556(pc,d0.w),d1
	jmp loc_086556(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086556:
	dc.w loc_086560-loc_086556
	dc.w loc_0865ea-loc_086556
	dc.w loc_086608-loc_086556
	dc.w loc_086628-loc_086556
	dc.w loc_08663c-loc_086556

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086560:
	btst #1,($15b,a4)
	bne.w loc_0865d4
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w #$600,($3a,a6)
	move.b #$80,($3e,a6)
	move.b #$80,($3f,a6)
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_0865da(pc,d1.w),($42,a6)
	move.w loc_0865da+2(pc,d1.w),($4a,a6)
	move.w loc_0865da+4(pc,d1.w),($40,a6)
	move.w loc_0865da+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	addq.b #8,d0
	bra.w loc_0872fc

loc_0865d4:
	addq.b #2,(5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0865da:
	dc.w $ffb8,$0038,$0f0f,$ff10
	dc.w $01c8,$0148,$f0f1,$00f0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0865ea:
	bsr.w loc_08b22e
	beq.b loc_0865fe
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_0865fe:
	bsr.w loc_08664e
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086608:
	btst #1,($3c,a4)
	beq.b loc_08661e
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_08661e:
	bsr.w loc_08664e
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086628:
	bsr.w loc_08b22e
	beq.b loc_086632
	addq.b #2,(6,a6)

loc_086632:
	bsr.w loc_08664e
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08663c:
	btst #1,($15b,a4)
	beq.b loc_08664c
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_08664c:
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08664e:
	subq.b #1,($3a,a6)
	bne.b loc_08666a
	addq.b #1,($3b,a6)
	andi.b #3,($3b,a6)
	move.b #6,($3a,a6)
	move.b ($3e,a6),d0
	bra.b loc_086674

loc_08666a:
	move.b ($3e,a6),d0
	cmp.b ($3f,a6),d0
	beq.b loc_0866a6

loc_086674:
	move.b d0,($3f,a6)
	asl.b #2,d0
	add.b ($3b,a6),d0
	ext.w d0
	asl.w #5,d0
	lea.l loc_35efb4,a0
	lea.l (a0,d0.w),a0
	moveq #$14,d0
	add.b ($101,a4),d0
	lsl.w #5,d0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d0.w),a1
	moveq #0,d7
	jsr loc_01b7c0

loc_0866a6:
	move.b ($132,a4),d1
	cmp.b ($3e,a6),d1
	beq.b loc_0866c0
	move.b d1,($3e,a6)
	ext.w d1
	addq.w #1,d1
	add.w d1,d1
	move.w loc_0866c2(pc,d1.w),($14,a6)

loc_0866c0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0866c2:
	dc.w $00c8,$0080,$0038

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0866c8:
	move.b (6,a6),d0
	move.w loc_0866d4(pc,d0.w),d1
	jmp loc_0866d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0866d4:
	dc.w loc_0866de-loc_0866d4
	dc.w loc_086764-loc_0866d4
	dc.w loc_08677a-loc_0866d4
	dc.w loc_086792-loc_0866d4
	dc.w loc_08679e-loc_0866d4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0866de:
	btst #2,($15b,a4)
	bne.w loc_08674a
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.l d0,($14,a6)
	move.l #$fffe0000,($44,a6)
	move.b ($101,a4),d0
	lsl.w #3,d0
	move.w loc_086754(pc,d0.w),($42,a6)
	move.w loc_086754+2(pc,d0.w),($4a,a6)
	move.w loc_086754+4(pc,d0.w),($40,a6)
	move.w loc_086754+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	moveq #$13,d0
	bra.w loc_087334

loc_08674a:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086754:
	dc.w $fff8,$0018,$03c3,$ffc4
	dc.w $0188,$0168,$fc3d,$003c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086764:
	bsr.w loc_08b22e
	beq.b loc_086778
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_086778:
	bra.b loc_0867b4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08677a:
	btst #2,($3c,a4)
	beq.b loc_086790
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_086790:
	bra.b loc_0867b4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086792:
	bsr.w loc_08b22e
	beq.b loc_08679c
	addq.b #2,(6,a6)

loc_08679c:
	bra.b loc_0867b4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08679e:
	btst #2,($15b,a4)
	beq.b loc_0867b2
	addq.b #2,(4,a6)
	clr.b (5,a6)
	clr.b (6,a6)

loc_0867b2:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0867b4:
	move.w ($34,a6),d0
	move.l ($44,a6),d1
	add.l d1,($14,a6)

loc_0867c0:
	tst.w ($14,a6)
	bpl.b loc_0867cc
	add.w d0,($14,a6)
	bra.b loc_0867c0

loc_0867cc:
	cmp.w ($14,a6),d0
	bhi.b loc_0867d8
	sub.w d0,($14,a6)
	bra.b loc_0867cc

loc_0867d8:
	jmp loc_01b4ec

;==============================================
loc_0867de:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_0867ee(pc,d0.w),d1
	jmp loc_0867ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0867ee:
	dc.w loc_0867f6-loc_0867ee
	dc.w loc_0867fa-loc_0867ee
	dc.w loc_0872a0-loc_0867ee
	dc.w loc_0872a0-loc_0867ee


;----------------------------------------------
loc_0867f6:
	addq.b #2,(4,a6)

loc_0867fa:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_086816
	move.b (5,a6),d0
	move.w loc_086818(pc,d0.w),d1
	jmp loc_086818(pc,d1.w)

loc_086816:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086818:
	dc.w loc_08681e-loc_086818
	dc.w loc_08698e-loc_086818
	dc.w loc_086a80-loc_086818

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08681e:
	move.b (6,a6),d0
	move.w loc_08682a(pc,d0.w),d1
	jmp loc_08682a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08682a:
	dc.w loc_086834-loc_08682a
	dc.w loc_0868d0-loc_08682a
	dc.w loc_0868e6-loc_08682a
	dc.w loc_0868fe-loc_08682a
	dc.w loc_08690a-loc_08682a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086834:
	btst #0,($15b,a4)
	bne.w loc_0868ba
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b #$ff,($3c,a6)
	move.b #$ff,($31,a6)
	move.b #$80,($3e,a6)
	move.b #$80,($3f,a6)
	move.b ($101,a4),d0
	sne.b ($c,a6)
	move.b d0,($b,a6)
	eori.b #1,($b,a6)
	lsl.b #2,d0
	move.b d0,($d,a6)
	add.w d0,d0
	move.w loc_0868c0(pc,d0.w),($42,a6)
	move.w loc_0868c0+2(pc,d0.w),($4a,a6)
	move.w loc_0868c0+4(pc,d0.w),($40,a6)
	move.w loc_0868c0+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.w #$88,($14,a6)
	bra.b loc_0868be

loc_0868ba:
	addq.b #2,(5,a6)

loc_0868be:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0868c0:
	dc.w $ffb8,$0038,$0f0f,$ff0f
	dc.w $01c8,$0148,$f0f1,$00f1

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0868d0:
	bsr.w loc_08b22e
	beq.b loc_0868e4
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_0868e4:
	bra.b loc_08691c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0868e6:
	btst #0,($3c,a4)
	beq.b loc_0868fc
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_0868fc:
	bra.b loc_08691c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0868fe:
	bsr.w loc_08b22e
	beq.b loc_086908
	addq.b #2,(6,a6)

loc_086908:
	bra.b loc_08691c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08690a:
	btst #0,($15b,a4)
	beq.b loc_08691a
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_08691a:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08691c:
	moveq #0,d0
	move.b ($3c,a6),d0
	move.b ($3e,a6),d1
	move.b ($54,a6),d2
	cmp.b ($31,a6),d0
	bne.b loc_08693c
	cmp.b ($3f,a6),d1
	bne.b loc_08693c
	cmp.b ($55,a6),d2
	beq.b loc_086952

loc_08693c:
	move.b d0,($31,a6)
	move.b d1,($3f,a6)
	move.b d2,($55,a6)
	move.b ($d,a6),d3
	jsr loc_01f75c

loc_086952:
	moveq #0,d1
	move.b ($102,a4),d1
	move.b ($132,a4),d0
	move.b ($128,a4),($54,a6)
	cmp.b ($3c,a6),d1
	bne.b loc_08696e
	cmp.b ($3f,a6),d0
	beq.b loc_086988

loc_08696e:
	move.b d1,($3c,a6)
	move.b d0,($3e,a6)
	add.b d0,d0
	add.b ($bb,a5),d0
	addi.b #2,d0
	ext.w d0
	lsl.w #3,d1
	bsr.w loc_08731e

loc_086988:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08698e:
	move.b (6,a6),d0
	move.w loc_08699a(pc,d0.w),d1
	jmp loc_08699a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08699a:
	dc.w loc_0869a4-loc_08699a
	dc.w loc_086a28-loc_08699a
	dc.w loc_086a3e-loc_08699a
	dc.w loc_086a56-loc_08699a
	dc.w loc_086a62-loc_08699a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0869a4:
	btst #1,($15b,a4)
	bne.w loc_086a12
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w #$80,($14,a6)
	move.w d0,($12,a6)
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_086a18(pc,d1.w),($42,a6)
	move.w loc_086a18+2(pc,d1.w),($4a,a6)
	move.w loc_086a18+4(pc,d1.w),($40,a6)
	move.w loc_086a18+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	add.w d0,d0
	addq.b #4,d0
	add.b (Dip_SFAlpha,a5),d0
	bra.w loc_0872fc

loc_086a12:
	addq.b #2,(5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086a18:
	dc.w $ffb8,$0038,$0f0f,$ff10
	dc.w $01c8,$0148,$f0f1,$00f0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086a28:
	bsr.w loc_08b22e
	beq.b loc_086a3c
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_086a3c:
	bra.b loc_086a74

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086a3e:
	btst #1,($3c,a4)
	beq.b loc_086a54
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_086a54:
	bra.b loc_086a74

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086a56:
	bsr.w loc_08b22e
	beq.b loc_086a60
	addq.b #2,(6,a6)

loc_086a60:
	bra.b loc_086a74

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086a62:
	btst #1,($15b,a4)
	beq.b loc_086a72
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_086a72:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_086a74
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086a80:
	move.b (6,a6),d0
	move.w loc_086a8c(pc,d0.w),d1
	jmp loc_086a8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086a8c:
	dc.w loc_086a96-loc_086a8c
	dc.w loc_086b30-loc_086a8c
	dc.w loc_086b46-loc_086a8c
	dc.w loc_086b5e-loc_086a8c
	dc.w loc_086b6a-loc_086a8c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086a96:
	btst #2,($15b,a4)
	bne.w loc_086b16
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.l d0,($14,a6)
	move.l #$ffff0000,($44,a6)
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_086b20(pc,d1.w),($42,a6)
	move.w loc_086b20+2(pc,d1.w),($4a,a6)
	move.w loc_086b20+4(pc,d1.w),($40,a6)
	move.w loc_086b20+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	add.w d0,d0
	addi.w #$d,d0
	tst.w (Region,a5)
	beq.b loc_086b0c
	addq.w #1,d0

loc_086b0c:
	move.b ($102,a4),d1
	lsl.w #3,d1
	bra.w loc_08733e

loc_086b16:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086b20:
	dc.w $fff8,$0028,$05a5,$ffa6
	dc.w $0188,$0158,$fa5b,$005a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086b30:
	bsr.w loc_08b22e
	beq.b loc_086b44
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_086b44:
	bra.b loc_086b80

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086b46:
	btst #2,($3c,a4)
	beq.b loc_086b5c
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_086b5c:
	bra.b loc_086b80

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086b5e:
	bsr.w loc_08b22e
	beq.b loc_086b68
	addq.b #2,(6,a6)

loc_086b68:
	bra.b loc_086b80

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086b6a:
	btst #2,($15b,a4)
	beq.b loc_086b7e
	addq.b #2,(4,a6)
	clr.b (5,a6)
	clr.b (6,a6)

loc_086b7e:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_086b80:
	move.w ($34,a6),d0
	move.l ($44,a6),d1
	add.l d1,($14,a6)

loc_086b8c:
	tst.w ($14,a6)
	bpl.b loc_086b98
	add.w d0,($14,a6)
	bra.b loc_086b8c

loc_086b98:
	cmp.w ($14,a6),d0
	bhi.b loc_086ba4
	sub.w d0,($14,a6)
	bra.b loc_086b98

loc_086ba4:
	jmp loc_01b4ec

;==============================================
loc_086baa:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_086bba(pc,d0.w),d1
	jmp loc_086bba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086bba:
	dc.w loc_086bc2-loc_086bba
	dc.w loc_086ca6-loc_086bba
	dc.w loc_0872a0-loc_086bba
	dc.w loc_0872a0-loc_086bba

;----------------------------------------------
loc_086bc2:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($16,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.l d0,($22,a6)
	move.w d0,($24,a6)
	move.w d0,($26,a6)
	move.l d0,($40,a6)
	move.l #$30000,d1
	btst #0,($15b,a4)
	beq.b loc_086c0a
	asr.l #1,d1

loc_086c0a:
	move.b ($101,a4),d0
	beq.b loc_086c12
	neg.l d1

loc_086c12:
	move.l d1,($48,a6)
	move.b d0,($d,a6)
	sne.b ($c,a6)
	moveq #0,d2
	tst.b ($a,a6)
	beq.b loc_086c48
	btst d0,($8d,a5)
	beq.b loc_086c48
	clr.b (9,a6)
	clr.w ($c,a6)
	moveq #1,d2
	move.w #$c0,($10,a6)
	move.w #$fe00,($50,a6)
	move.w #$22,($52,a6)

loc_086c48:
	move.b d2,($a,a6)
	add.w d0,d0
	add.w d2,d0
	lsl.w #3,d0
	move.w loc_086c86-8(pc,d0.w),($60,a6)
	move.w loc_086c86-2(pc,d0.w),($62,a6)

	move.w loc_086c86(pc,d0.w),($46,a6)
	move.w loc_086c86+2(pc,d0.w),($4e,a6)
	move.w loc_086c86+4(pc,d0.w),($44,a6)
	move.w loc_086c86+6(pc,d0.w),($4c,a6)
	move.w ($46,a6),($14,a6)
	bsr.w loc_086db8
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086c86:
	dc.w $00f8,$00e8,$fe1f,$001e
	dc.w $0080,$00e8,$0c3c,$ff3d
	dc.w $0008,$0018,$01e1,$ffe2
	dc.w $0080,$0018,$f3c4,$00c3

;----------------------------------------------
loc_086ca6:
	move.b (5,a6),d0
	move.w loc_086cb6(pc,d0.w),d1
	jsr loc_086cb6(pc,d1.w)
	bra.w loc_086d80

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086cb6:
	dc.w loc_086cbe-loc_086cb6
	dc.w loc_086d24-loc_086cb6
	dc.w loc_086d48-loc_086cb6
	dc.w loc_086d70-loc_086cb6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086cbe:
	tst.b ($a,a6)
	beq.b loc_086cea
	cmpi.w #$f000,($22,a6)
	ble.b loc_086cea
	move.w ($50,a6),d0
	add.w d0,($22,a6)
	move.w ($52,a6),d0
	add.w d0,($50,a6)
	cmpi.w #$f000,($22,a6)
	bgt.b loc_086cea
	move.w #$f000,($22,a6)

loc_086cea:
	bsr.w loc_08b25c
	beq.b loc_086d22
	addq.b #2,(5,a6)
	tst.b ($a,a6)
	beq.b loc_086d06
	move.w #$48,($40,a6)
	move.b #2,(9,a6)

loc_086d06:
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	bset.b #2,($f,a5)
	btst #0,($15b,a4)
	beq.b loc_086d22
	addq.b #2,(5,a6)

loc_086d22:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086d24:
	tst.b ($16,a5)
	bne.b loc_086d42
	btst #0,($3c,a4)
	beq.b loc_086d40
	addq.b #2,(5,a6)
	move.l ($48,a6),d0
	asr.l #1,d0
	move.l d0,($48,a6)

loc_086d40:
	rts

loc_086d42:
	addq.b #2,(5,a6)
	bra.b loc_086d4e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086d48:
	tst.b ($16,a5)
	beq.b loc_086d6e

loc_086d4e:
	addq.b #2,(5,a6)
	move.w ($46,a6),d0
	tst.b ($a,a6)
	beq.b loc_086d66
	move.w ($60,a6),d0
	move.w ($62,a6),($4c,a6)

loc_086d66:
	move.w d0,($4e,a6)
	clr.w ($44,a6)

loc_086d6e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086d70:
	bsr.w loc_08b25c
	beq.b loc_086d7e
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_086d7e:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_086d80:
	tst.b ($a,a6)
	bne.b loc_086d8c
	tst.b (5,a6)
	beq.b loc_086db0

loc_086d8c:
	move.w ($34,a6),d0
	move.l ($48,a6),d1
	add.l d1,($40,a6)

loc_086d98:
	tst.w ($40,a6)
	bpl.b loc_086da4
	add.w d0,($40,a6)
	bra.b loc_086d98

loc_086da4:
	cmp.w ($40,a6),d0
	bgt.b loc_086db0
	sub.w d0,($40,a6)
	bra.b loc_086da4

loc_086db0:
	bsr.b loc_086db8
	jmp loc_01b4ec

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_086db8:
	tst.b ($a,a6)
	beq.b loc_086dca
	tst.b (5,a6)
	bne.b loc_086dca
	moveq #8,d0
	bra.w loc_087334

loc_086dca:
	move.w ($40,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($10,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1
	moveq #4,d0
	tst.b ($101,a4)
	beq.b loc_086dec
	moveq #5,d0
	add.b (Dip_SFAlpha,a5),d0

loc_086dec:
	tst.b ($a,a6)
	beq.b loc_086df4
	moveq #7,d0

loc_086df4:
	bra.w loc_08733e

;==============================================
loc_086df8:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_086e08(pc,d0.w),d1
	jmp loc_086e08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086e08:
	dc.w loc_086e10-loc_086e08
	dc.w loc_086e1a-loc_086e08
	dc.w loc_0872a0-loc_086e08
	dc.w loc_0872a0-loc_086e08

;----------------------------------------------
loc_086e10:
	addq.b #2,(4,a6)
	move.b ($101,a4),($59,a6)

loc_086e1a:
	move.b (Active_Player_01,a5),d0
	or.b ($8d,a5),d0
	move.b ($101,a4),d1
	btst d1,d0
	beq.b loc_086e36
	move.b (5,a6),d0
	move.w loc_086e38(pc,d0.w),d1
	jmp loc_086e38(pc,d1.w)

loc_086e36:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086e38:
	dc.w loc_086e3e-loc_086e38
	dc.w loc_086fa8-loc_086e38
	dc.w loc_087126-loc_086e38

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086e3e:
	move.b (6,a6),d0
	move.w loc_086e4a(pc,d0.w),d1
	jmp loc_086e4a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086e4a:
	dc.w loc_086e56-loc_086e4a
	dc.w loc_086ea4-loc_086e4a
	dc.w loc_086efa-loc_086e4a
	dc.w loc_086f10-loc_086e4a
	dc.w loc_086f28-loc_086e4a
	dc.w loc_086f34-loc_086e4a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086e56:
	btst #0,($15b,a4)
	bne.b loc_086e9e
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($16,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.l #$18000,d1
	tst.b ($101,a4)
	beq.b loc_086e98
	neg.l d1

loc_086e98:
	move.l d1,($40,a6)
	bra.b loc_086ea4

loc_086e9e:
	addq.b #2,(5,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086ea4:
	addq.b #2,(6,a6)
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_086eea(pc,d1.w),($46,a6)
	move.w loc_086eea+2(pc,d1.w),($4e,a6)
	move.w loc_086eea+4(pc,d1.w),($44,a6)
	move.w loc_086eea+6(pc,d1.w),($4c,a6)
	move.w ($46,a6),($14,a6)
	add.w d0,d0
	tst.w (Region,a5)
	beq.b loc_086ed8
	addq.w #1,d0

loc_086ed8:
	addi.w #9,d0
	move.b ($102,a4),d1
	move.b d1,($3c,a6)
	lsl.w #3,d1
	bra.w loc_08733e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086eea:
	dc.w $00f4,$00dc,$faab,$00aa
	dc.w $000c,$0024,$0555,$ff56

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086efa:
	bsr.w loc_08b25c
	beq.b loc_086f0e
	addq.b #2,(6,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)

loc_086f0e:
	bra.b loc_086f46

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086f10:
	btst #0,($3c,a4)
	beq.b loc_086f26
	addq.b #2,(6,a6)
	move.w ($46,a6),($4e,a6)
	clr.w ($44,a6)

loc_086f26:
	bra.b loc_086f46

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086f28:
	bsr.w loc_08b25c
	beq.b loc_086f32
	addq.b #2,(6,a6)

loc_086f32:
	bra.b loc_086f46

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086f34:
	btst #0,($15b,a4)
	beq.b loc_086f44
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_086f44:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_086f46:
	moveq #0,d1
	move.b ($102,a4),d1
	cmp.b ($3c,a6),d1
	beq.b loc_086f7e
	tst.b ($3f,a4)
	bne.b loc_086f60
	move.b #2,(6,a6)
	bra.b loc_086f7e

loc_086f60:
	move.b d1,($3c,a6)
	lsl.w #3,d1
	moveq #0,d0
	move.b ($101,a4),d0
	add.w d0,d0
	tst.w (Region,a5)
	beq.b loc_086f76
	addq.w #1,d0

loc_086f76:
	addi.w #9,d0
	bsr.w loc_08733e

loc_086f7e:
	move.w ($34,a6),d0
	move.l ($40,a6),d1
	add.l d1,($10,a6)

loc_086f8a:
	tst.w ($10,a6)
	bpl.b loc_086f96
	add.w d0,($10,a6)
	bra.b loc_086f8a

loc_086f96:
	cmp.w ($10,a6),d0
	bhi.b loc_086fa2
	sub.w d0,($10,a6)
	bra.b loc_086f96

loc_086fa2:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_086fa8:
	move.b (6,a6),d0
	move.w loc_086fb4(pc,d0.w),d1
	jmp loc_086fb4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_086fb4:
	dc.w loc_086fbe-loc_086fb4
	dc.w loc_08706a-loc_086fb4
	dc.w loc_087088-loc_086fb4
	dc.w loc_0870ac-loc_086fb4
	dc.w loc_0870c0-loc_086fb4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_086fbe:
	btst #1,($15b,a4)
	bne.w loc_087054
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b ($132,a4),d1
	bsr.w loc_0870f8
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_08705a(pc,d1.w),($42,a6)
	move.w loc_08705a+2(pc,d1.w),($4a,a6)
	move.w loc_08705a+4(pc,d1.w),($40,a6)
	move.w loc_08705a+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	jsr loc_01c368
	beq.b loc_087058
	addq.b #1,(a4)
	move.w #$2102,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)
	jsr loc_01c368
	beq.b loc_087058
	addq.b #1,(a4)
	move.w #$2103,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2e,a6)
	bra.b loc_087058

loc_087054:
	addq.b #2,(5,a6)

loc_087058:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08705a:
	dc.w $ffd8,$0058,$0f0f,$ff10
	dc.w $01a8,$0128,$f0f1,$00f0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08706a:
	bsr.w loc_08b22e
	beq.b loc_08707e
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_08707e:
	bsr.w loc_0870ea
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_087088:
	btst #1,($3c,a4)
	beq.b loc_0870a2
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)
	bsr.w loc_0872b2

loc_0870a2:
	bsr.w loc_0870ea
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0870ac:
	bsr.w loc_08b22e
	beq.b loc_0870b6
	addq.b #2,(6,a6)

loc_0870b6:
	bsr.w loc_0870ea
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0870c0:
	btst #1,($15b,a4)
	beq.b loc_0870e8
	addq.b #2,(5,a6)
	clr.b (6,a6)
	movea.w ($2c,a6),a0
	move.l #$6000000,(4,a0)
	movea.w ($2e,a6),a0
	move.l #$6000000,(4,a0)

loc_0870e8:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0870ea:
	move.b ($132,a4),d1
	cmp.b ($3e,a6),d1
	beq.b loc_08711e
	bsr.w loc_0872a6

loc_0870f8:
	move.b d1,($3e,a6)
	ext.w d1
	addq.w #1,d1
	add.w d1,d1
	move.w loc_087120(pc,d1.w),($14,a6)
	lsl.w #2,d1
	moveq #0,d0
	move.b ($101,a4),d0
	add.w d0,d0
	add.b (Dip_SFAlpha,a5),d0
	addi.w #$c,d0
	bra.w loc_087308

loc_08711e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087120:
	dc.w $00c8,$0080,$0038

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_087126:
	move.b (6,a6),d0
	move.w loc_087132(pc,d0.w),d1
	jmp loc_087132(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087132:
	dc.w loc_08713c-loc_087132
	dc.w loc_0871d0-loc_087132
	dc.w loc_0871ee-loc_087132
	dc.w loc_087212-loc_087132
	dc.w loc_087226-loc_087132

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_08713c:
	btst #2,($15b,a4)
	bne.w loc_0871b6
	addq.b #2,(6,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w #$600,($3a,a6)
	move.b ($101,a4),($d,a6)
	sne.b ($c,a6)
	move.b ($13,a5),d0
	bsr.w loc_08728e
	moveq #0,d0
	move.b ($101,a4),d0
	move.w d0,d1
	lsl.w #3,d1
	move.w loc_0871c0(pc,d1.w),($42,a6)
	move.w loc_0871c0+2(pc,d1.w),($4a,a6)
	move.w loc_0871c0+4(pc,d1.w),($40,a6)
	move.w loc_0871c0+6(pc,d1.w),($48,a6)
	move.w ($42,a6),($10,a6)
	addi.b #$18,d0
	bra.w loc_0872fc

loc_0871b6:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0871c0:
	dc.w $ffd0,$0010,$0787,$ff88
	dc.w $01b0,$0170,$f879,$0078

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0871d0:
	bsr.w loc_08b22e
	beq.b loc_0871e4
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)

loc_0871e4:
	bsr.w loc_08723c
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0871ee:
	btst #2,($3c,a4)
	beq.b loc_087208
	addq.b #2,(6,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)
	bsr.w loc_0872b2

loc_087208:
	bsr.w loc_08723c
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_087212:
	bsr.w loc_08b22e
	beq.b loc_08721c
	addq.b #2,(6,a6)

loc_08721c:
	bsr.w loc_08723c
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_087226:
	btst #2,($15b,a4)
	beq.b loc_08723a
	addq.b #2,(4,a6)
	clr.b (5,a6)
	clr.b (6,a6)

loc_08723a:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08723c:
	subq.b #1,($3a,a6)
	bne.b loc_08727e
	addq.b #1,($3b,a6)
	andi.b #3,($3b,a6)
	move.b #6,($3a,a6)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #5,d0
	lea.l loc_35efb4,a0
	lea.l (a0,d0.w),a0
	moveq #$14,d0
	add.b ($101,a4),d0
	lsl.w #5,d0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d0.w),a1
	moveq #0,d7
	jsr loc_01b7c0

loc_08727e:
	moveq #0,d0
	move.b ($13,a5),d0
	cmp.b ($3d,a6),d0
	beq.b loc_08729a
	bsr.w loc_0872a6

loc_08728e:
	move.b d0,($3d,a6)
	add.w d0,d0
	move.w loc_08729c(pc,d0.w),($14,a6)

loc_08729a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08729c:
	dc.w $0098,$0068

;==============================================
loc_0872a0:
	jmp loc_01c2de

;==============================================
loc_0872a6:
	tst.b ($a,a6)
	bne.b loc_0872be
	jmp loc_0034b0

;==============================================
loc_0872b2:
	tst.b ($a,a6)
	bne.b loc_0872be
	jmp loc_0034dc

loc_0872be:
	rts

;==============================================
loc_0872c0:
	ext.w d1
	addq.w #1,d1
	add.w d1,d1
	andi.w #1,d2
	add.w d2,d1
	move.w d1,d2
	lsl.w #2,d2
	add.w d2,d1
	lsl.w #5,d1
	add.w d0,d0
	lea.l loc_32c094,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	andi.w #$1f,d3
	lsl.w #5,d3
	lea.l MainpaletteDirect,a1
	lea.l (a1,d3.w),a1
	moveq #0,d7
	jmp loc_01b7c0

;==============================================
loc_0872fc:
	lea.l loc_2f31b0,a0
	jmp loc_01b6e0

;==============================================
loc_087308:
	add.w d0,d0
	lea.l loc_2f31b0,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0

;==============================================
loc_087318:
	jmp loc_01b6ee

;==============================================
loc_08731e:
	add.w d0,d0
	lea.l loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;==============================================
loc_087334:
	lea.l loc_087352(pc),a0
	jmp loc_01b6e0

;==============================================
loc_08733e:
	add.w d0,d0
	lea.l loc_087352(pc),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087352:
	dc.w loc_08737c-loc_087352
	dc.w loc_087384-loc_087352
	dc.w loc_087484-loc_087352
	dc.w loc_087584-loc_087352
	dc.w loc_08758c-loc_087352
	dc.w loc_08762c-loc_087352
	dc.w loc_087714-loc_087352
	dc.w loc_087804-loc_087352

	dc.w loc_087884-loc_087352
	dc.w loc_08788c-loc_087352
	dc.w loc_08798c-loc_087352
	dc.w loc_087a8c-loc_087352
	dc.w loc_087b8c-loc_087352
	dc.w loc_087c8c-loc_087352
	dc.w loc_087d8c-loc_087352
	dc.w loc_087e8c-loc_087352

	dc.w loc_087f8c-loc_087352
	dc.w loc_08808c-loc_087352
	dc.w loc_088094-loc_087352
	dc.w loc_08809c-loc_087352
	dc.w $0000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Character Select
loc_08737c:
	dc.w $ff40,$0000
	dc.l loc_0880a4

;Name Tags
loc_087384:
	dc.w $0800,$0000
	dc.l loc_08811e

	dc.w $0800,$0000
	dc.l loc_08812c

	dc.w $0800,$0000
	dc.l loc_08813a

	dc.w $0800,$0000
	dc.l loc_088148

	dc.w $0800,$0000
	dc.l loc_088156

	dc.w $0800,$0000
	dc.l loc_088164

	dc.w $0800,$0000
	dc.l loc_088172

	dc.w $0800,$0000
	dc.l loc_088180

	dc.w $0800,$0000
	dc.l loc_08818e

	dc.w $0800,$0000
	dc.l loc_08819c

	dc.w $0800,$0000
	dc.l loc_0881aa

	dc.w $0800,$0000
	dc.l loc_0881b8

	dc.w $0800,$0000
	dc.l loc_0881c6

	dc.w $0800,$0000
	dc.l loc_0881d4

	dc.w $0800,$0000
	dc.l loc_0881e2

	dc.w $0800,$0000
	dc.l loc_0881f0

	dc.w $0800,$0000
	dc.l loc_0881fe

	dc.w $0800,$0000
	dc.l loc_08820c

	dc.w $0800,$0000
	dc.l loc_088156

	dc.w $0800,$0000
	dc.l loc_08820c

	dc.w $0800,$0000
	dc.l loc_088172

	dc.w $0800,$0000
	dc.l loc_08821a

	dc.w $0800,$0000
	dc.l loc_088228

	dc.w $0800,$0000
	dc.l loc_0882c2

	dc.w $0800,$0000
	dc.l loc_088236

	dc.w $0800,$0000
	dc.l loc_088244

	dc.w $0800,$0000
	dc.l loc_088252

	dc.w $0800,$0000
	dc.l loc_088260

	dc.w $0800,$0000
	dc.l loc_08826e

	dc.w $0800,$0000
	dc.l loc_08827c

	dc.w $0800,$0000
	dc.l loc_08828a

	dc.w $0840,$0000
	dc.l loc_088298


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087484:
	dc.w $0800,$0000
	dc.l loc_08811e
	dc.w $0800,$0000
	dc.l loc_08812c
	dc.w $0800,$0000
	dc.l loc_0882a6
	dc.w $0800,$0000
	dc.l loc_0882b4
	dc.w $0800,$0000
	dc.l loc_088156
	dc.w $0800,$0000
	dc.l loc_088164
	dc.w $0800,$0000
	dc.l loc_088172
	dc.w $0800,$0000
	dc.l loc_088180
	dc.w $0800,$0000
	dc.l loc_08818e
	dc.w $0800,$0000
	dc.l loc_08819c
	dc.w $0800,$0000
	dc.l loc_08821a
	dc.w $0800,$0000
	dc.l loc_0881b8
	dc.w $0800,$0000
	dc.l loc_0881c6
	dc.w $0800,$0000
	dc.l loc_0881d4
	dc.w $0800,$0000
	dc.l loc_0881e2
	dc.w $0800,$0000
	dc.l loc_0881f0
	dc.w $0800,$0000
	dc.l loc_0881fe
	dc.w $0800,$0000
	dc.l loc_08820c
	dc.w $0800,$0000
	dc.l loc_088156
	dc.w $0800,$0000
	dc.l loc_08820c
	dc.w $0800,$0000
	dc.l loc_088172
	dc.w $0800,$0000
	dc.l loc_08826e
	dc.w $0800,$0000
	dc.l loc_088228
	dc.w $0800,$0000
	dc.l loc_0882c2
	dc.w $0800,$0000
	dc.l loc_088236
	dc.w $0800,$0000
	dc.l loc_088244
	dc.w $0800,$0000
	dc.l loc_088252
	dc.w $0800,$0000
	dc.l loc_088260
	dc.w $0800,$0000
	dc.l loc_0881aa
	dc.w $0800,$0000
	dc.l loc_08827c
	dc.w $0800,$0000
	dc.l loc_08828a
	dc.w $0840,$0000
	dc.l loc_088298

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087584:
	dc.w $ff40,$0000
	dc.l loc_0882d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08758c:
	dc.w $0800,$0140
	dc.l loc_0882f4

	dc.w $0800,$0140
	dc.l loc_08831a

	dc.w $0800,$0140
	dc.l loc_088340

	dc.w $0800,$0140
	dc.l loc_088366

	dc.w $0800,$0140
	dc.l loc_08838c

	dc.w $0800,$0140
	dc.l loc_0883b2

	dc.w $0800,$0140
	dc.l loc_0883d8

	dc.w $0800,$0140
	dc.l loc_0883fe

	dc.w $0800,$0140
	dc.l loc_088424

	dc.w $0800,$0140
	dc.l loc_088442

	dc.w $0800,$0140
	dc.l loc_088460

	dc.w $0800,$0140
	dc.l loc_08847e

	dc.w $0800,$0140
	dc.l loc_08849c

	dc.w $0800,$0140
	dc.l loc_0884ba

	dc.w $0800,$0140
	dc.l loc_0884d8

	dc.w $0800,$0140
	dc.l loc_0884f6

	dc.w $0800,$0140
	dc.l loc_088514

	dc.w $0800,$0140
	dc.l loc_088532

	dc.w $0800,$0140
	dc.l loc_088550

	dc.w $0840,$0140
	dc.l loc_08856e


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08762c:
	dc.w $0800,$01d0
	dc.l loc_08858c

	dc.w $0800,$01d0
	dc.l loc_0885aa

	dc.w $0800,$01d0
	dc.l loc_0885c8

	dc.w $0800,$01d0
	dc.l loc_0885e6

	dc.w $0800,$01d0
	dc.l loc_088604

	dc.w $0800,$01d0
	dc.l loc_088622

	dc.w $0800,$01d0
	dc.l loc_088640

	dc.w $0800,$01d0
	dc.l loc_08865e

	dc.w $0800,$01d0
	dc.l loc_08867c

	dc.w $0800,$01d0
	dc.l loc_088692

	dc.w $0800,$01d0
	dc.l loc_0886a8

	dc.w $0800,$01d0
	dc.l loc_0886be

	dc.w $0800,$01d0
	dc.l loc_0886d4

	dc.w $0800,$01d0
	dc.l loc_0886ea

	dc.w $0800,$01d0
	dc.l loc_088708

	dc.w $0800,$01d0
	dc.l loc_088726

	dc.w $0800,$01d0
	dc.l loc_088744

	dc.w $0800,$01d0
	dc.l loc_088762

	dc.w $0800,$01d0
	dc.l loc_088780

	dc.w $0800,$01d0
	dc.l loc_08879e

	dc.w $0800,$01d0
	dc.l loc_0887bc

	dc.w $0800,$01d0
	dc.l loc_0887da

	dc.w $0800,$01d0
	dc.l loc_0887f8

	dc.w $0800,$01d0
	dc.l loc_088816

	dc.w $0800,$01d0
	dc.l loc_088834

	dc.w $0800,$01d0
	dc.l loc_08884a

	dc.w $0800,$01d0
	dc.l loc_088860

	dc.w $0800,$01d0
	dc.l loc_088876

	dc.w $0840,$01d0
	dc.l loc_08888c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087714:
	dc.w $0800,$01e0
	dc.l loc_0888a2

	dc.w $0800,$01e0
	dc.l loc_0888c0

	dc.w $0800,$01e0
	dc.l loc_0888e6

	dc.w $0800,$01e0
	dc.l loc_08890c

	dc.w $0800,$01e0
	dc.l loc_088932

	dc.w $0800,$01e0
	dc.l loc_088958

	dc.w $0800,$01e0
	dc.l loc_088976

	dc.w $0800,$01e0
	dc.l loc_088994

	dc.w $0800,$01e0
	dc.l loc_0889b2

	dc.w $0800,$01e0
	dc.l loc_0889c8

	dc.w $0800,$01e0
	dc.l loc_0889de

	dc.w $0800,$01e0
	dc.l loc_0889f4

	dc.w $0800,$01e0
	dc.l loc_088a12

	dc.w $0800,$01e0
	dc.l loc_088a30

	dc.w $0800,$01e0
	dc.l loc_088a4e

	dc.w $0800,$01e0
	dc.l loc_088a74

	dc.w $0800,$01e0
	dc.l loc_088a9a

	dc.w $0800,$01e0
	dc.l loc_088ac0

	dc.w $0800,$01e0
	dc.l loc_088ae6

	dc.w $0800,$01e0
	dc.l loc_088b0c

	dc.w $0800,$01e0
	dc.l loc_088b32

	dc.w $0800,$01e0
	dc.l loc_088b58

	dc.w $0800,$01e0
	dc.l loc_088b7e

	dc.w $0800,$01e0
	dc.l loc_088ba4

	dc.w $0800,$01e0
	dc.l loc_088bca

	dc.w $0800,$01e0
	dc.l loc_088be8

	dc.w $0800,$01e0
	dc.l loc_088c06

	dc.w $0800,$01e0
	dc.l loc_088c24

	dc.w $0800,$01e0
	dc.l loc_088c42

	dc.w $0840,$01e0
	dc.l loc_088c60

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087804:
	dc.w $0800,$0100
	dc.l loc_088c7e

	dc.w $0800,$0100
	dc.l loc_088c94

	dc.w $0800,$0100
	dc.l loc_088cb2

	dc.w $0800,$0100
	dc.l loc_088cd0

	dc.w $0800,$0100
	dc.l loc_088cee

	dc.w $0800,$0100
	dc.l loc_088d0c

	dc.w $0800,$0100
	dc.l loc_088d2a

	dc.w $0800,$0100
	dc.l loc_088d48

	dc.w $0800,$0100
	dc.l loc_088d66

	dc.w $0800,$0100
	dc.l loc_088d7c

	dc.w $0800,$0100
	dc.l loc_088d92

	dc.w $0800,$0100
	dc.l loc_088da8

	dc.w $0800,$0100
	dc.l loc_088dbe

	dc.w $0800,$0100
	dc.l loc_088dd4

	dc.w $0800,$0100
	dc.l loc_088dea

	dc.w $0840,$0100
	dc.l loc_088e00


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087884:
	dc.w $ff40,$0100
	dc.l loc_088e16

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08788c:
	dc.w $0800,$0040
	dc.l loc_088ec0

	dc.w $0800,$0040
	dc.l loc_088f02

	dc.w $0800,$0050
	dc.l loc_088f44

	dc.w $0800,$0050
	dc.l loc_088f7e

	dc.w $0800,$0060
	dc.l loc_088fb8

	dc.w $0800,$0050
	dc.l loc_088fea

	dc.w $0800,$0060
	dc.l loc_089024

	dc.w $0800,$0040
	dc.l loc_089056

	dc.w $0800,$0060
	dc.l loc_089098

	dc.w $0800,$0050
	dc.l loc_0890ca

	dc.w $0800,$0050
	dc.l loc_089104

	dc.w $0800,$0060
	dc.l loc_08913e

	dc.w $0800,$0040
	dc.l loc_089170

	dc.w $0800,$0060
	dc.l loc_0891b2

	dc.w $0800,$0070
	dc.l loc_0891e4

	dc.w $0800,$0070
	dc.l loc_089216

	dc.w $0800,$0070
	dc.l loc_089248

	dc.w $0800,$0040
	dc.l loc_08927a

	dc.w $0800,$0060
	dc.l loc_088fb8

	dc.w $0800,$0040
	dc.l loc_08927a

	dc.w $0800,$0060
	dc.l loc_089024

	dc.w $0800,$0060
	dc.l loc_0892bc

	dc.w $0800,$0060
	dc.l loc_0892ee

	dc.w $0800,$0088
	dc.l loc_089534

	dc.w $0800,$0070
	dc.l loc_089320

	dc.w $0800,$0060
	dc.l loc_089352

	dc.w $0800,$0060
	dc.l loc_089384

	dc.w $0800,$0050
	dc.l loc_0893b6

	dc.w $0800,$0060
	dc.l loc_0893f0

	dc.w $0800,$0050
	dc.l loc_089422

	dc.w $0800,$0050
	dc.l loc_08945c

	dc.w $0840,$0050
	dc.l loc_089496


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08798c:
	dc.w $0800,$0040
	dc.l loc_088ec0

	dc.w $0800,$0040
	dc.l loc_088f02

	dc.w $0800,$0060
	dc.l loc_0894d0

	dc.w $0800,$0060
	dc.l loc_089502

	dc.w $0800,$0060
	dc.l loc_088fb8

	dc.w $0800,$0050
	dc.l loc_088fea

	dc.w $0800,$0060
	dc.l loc_089024

	dc.w $0800,$0040
	dc.l loc_089056

	dc.w $0800,$0060
	dc.l loc_089098

	dc.w $0800,$0050
	dc.l loc_0890ca

	dc.w $0800,$0060
	dc.l loc_0892bc

	dc.w $0800,$0060
	dc.l loc_08913e

	dc.w $0800,$0040
	dc.l loc_089170

	dc.w $0800,$0060
	dc.l loc_0891b2

	dc.w $0800,$0070
	dc.l loc_0891e4

	dc.w $0800,$0070
	dc.l loc_089216

	dc.w $0800,$0070
	dc.l loc_089248

	dc.w $0800,$0040
	dc.l loc_08927a

	dc.w $0800,$0060
	dc.l loc_088fb8

	dc.w $0800,$0040
	dc.l loc_08927a

	dc.w $0800,$0060
	dc.l loc_089024

	dc.w $0800,$0060
	dc.l loc_0893f0

	dc.w $0800,$0060
	dc.l loc_0892ee

	dc.w $0800,$0088
	dc.l loc_089534

	dc.w $0800,$0070
	dc.l loc_089320

	dc.w $0800,$0060
	dc.l loc_089352

	dc.w $0800,$0060
	dc.l loc_089384

	dc.w $0800,$0050
	dc.l loc_0893b6

	dc.w $0800,$0050
	dc.l loc_089104

	dc.w $0800,$0050
	dc.l loc_089422

	dc.w $0800,$0050
	dc.l loc_08945c

	dc.w $0840,$0050
	dc.l loc_089496


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087a8c:
	dc.w $0800,$0040
	dc.l loc_08955e

	dc.w $0800,$0040
	dc.l loc_0895a0

	dc.w $0800,$0050
	dc.l loc_0895e2

	dc.w $0800,$0050
	dc.l loc_08961c

	dc.w $0800,$0060
	dc.l loc_089656

	dc.w $0800,$0050
	dc.l loc_089688

	dc.w $0800,$0060
	dc.l loc_0896c2

	dc.w $0800,$0040
	dc.l loc_0896f4

	dc.w $0800,$0060
	dc.l loc_089736

	dc.w $0800,$0050
	dc.l loc_089768

	dc.w $0800,$0050
	dc.l loc_0897a2

	dc.w $0800,$0060
	dc.l loc_0897dc

	dc.w $0800,$0040
	dc.l loc_08980e

	dc.w $0800,$0060
	dc.l loc_089850

	dc.w $0800,$0070
	dc.l loc_089882

	dc.w $0800,$0070
	dc.l loc_0898b4

	dc.w $0800,$0070
	dc.l loc_0898e6

	dc.w $0800,$0040
	dc.l loc_089918

	dc.w $0800,$0060
	dc.l loc_089656

	dc.w $0800,$0040
	dc.l loc_089918

	dc.w $0800,$0060
	dc.l loc_0896c2

	dc.w $0800,$0060
	dc.l loc_08995a

	dc.w $0800,$0060
	dc.l loc_08998c

	dc.w $0800,$0088
	dc.l loc_089bd2

	dc.w $0800,$0070
	dc.l loc_0899be

	dc.w $0800,$0060
	dc.l loc_0899f0

	dc.w $0800,$0060
	dc.l loc_089a22

	dc.w $0800,$0050
	dc.l loc_089a54

	dc.w $0800,$0060
	dc.l loc_089a8e

	dc.w $0800,$0050
	dc.l loc_089ac0

	dc.w $0800,$0050
	dc.l loc_089afa

	dc.w $0840,$0050
	dc.l loc_089b34


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087b8c:
	dc.w $0800,$0040
	dc.l loc_08955e

	dc.w $0800,$0040
	dc.l loc_0895a0

	dc.w $0800,$0060
	dc.l loc_089b6e

	dc.w $0800,$0060
	dc.l loc_089ba0

	dc.w $0800,$0060
	dc.l loc_089656

	dc.w $0800,$0050
	dc.l loc_089688

	dc.w $0800,$0060
	dc.l loc_0896c2

	dc.w $0800,$0040
	dc.l loc_0896f4

	dc.w $0800,$0060
	dc.l loc_089736

	dc.w $0800,$0050
	dc.l loc_089768

	dc.w $0800,$0060
	dc.l loc_08995a

	dc.w $0800,$0060
	dc.l loc_0897dc

	dc.w $0800,$0040
	dc.l loc_08980e

	dc.w $0800,$0060
	dc.l loc_089850

	dc.w $0800,$0070
	dc.l loc_089882

	dc.w $0800,$0070
	dc.l loc_0898b4

	dc.w $0800,$0070
	dc.l loc_0898e6

	dc.w $0800,$0040
	dc.l loc_089918

	dc.w $0800,$0060
	dc.l loc_089656

	dc.w $0800,$0040
	dc.l loc_089918

	dc.w $0800,$0060
	dc.l loc_0896c2

	dc.w $0800,$0060
	dc.l loc_089a8e

	dc.w $0800,$0060
	dc.l loc_08998c

	dc.w $0800,$0088
	dc.l loc_089bd2

	dc.w $0800,$0070
	dc.l loc_0899be

	dc.w $0800,$0060
	dc.l loc_0899f0

	dc.w $0800,$0060
	dc.l loc_089a22

	dc.w $0800,$0050
	dc.l loc_089a54

	dc.w $0800,$0050
	dc.l loc_0897a2

	dc.w $0800,$0050
	dc.l loc_089ac0

	dc.w $0800,$0050
	dc.l loc_089afa

	dc.w $0840,$0050
	dc.l loc_089b34


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087c8c:
	dc.w $0800,$004c
	dc.l loc_089bfc

	dc.w $0800,$004c
	dc.l loc_089c30

	dc.w $0800,$0064
	dc.l loc_089c64

	dc.w $0800,$0058
	dc.l loc_089c9e

	dc.w $0800,$0073
	dc.l loc_089cd6

	dc.w $0800,$0058
	dc.l loc_089d18

	dc.w $0800,$0064
	dc.l loc_089d50

	dc.w $0800,$004c
	dc.l loc_089d8a

	dc.w $0800,$0070
	dc.l loc_089dbe

	dc.w $0800,$0058
	dc.l loc_089dfa

	dc.w $0800,$0058
	dc.l loc_089e32

	dc.w $0800,$0064
	dc.l loc_089e6a

	dc.w $0800,$004c
	dc.l loc_089ea4

	dc.w $0800,$0070
	dc.l loc_089ed8

	dc.w $0800,$007c
	dc.l loc_089f14

	dc.w $0800,$007c
	dc.l loc_089f54

	dc.w $0800,$007c
	dc.l loc_089f94

	dc.w $0800,$004c
	dc.l loc_089fd4

	dc.w $0800,$0073
	dc.l loc_089cd6

	dc.w $0800,$004c
	dc.l loc_089fd4

	dc.w $0800,$0064
	dc.l loc_089d50

	dc.w $0800,$0073
	dc.l loc_08a008

	dc.w $0800,$0064
	dc.l loc_08a04a

	dc.w $0800,$0098
	dc.l loc_08a2d8

	dc.w $0800,$0073
	dc.l loc_08a084

	dc.w $0800,$0070
	dc.l loc_08a0c6

	dc.w $0800,$0067
	dc.l loc_08a102

	dc.w $0800,$0058
	dc.l loc_08a140

	dc.w $0800,$0070
	dc.l loc_08a178

	dc.w $0800,$0064
	dc.l loc_08a1b4

	dc.w $0800,$0058
	dc.l loc_08a1ee

	dc.w $0840,$0058
	dc.l loc_08a226


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087d8c:
	dc.w $0800,$004c
	dc.l loc_089bfc

	dc.w $0800,$004c
	dc.l loc_089c30

	dc.w $0800,$0064
	dc.l loc_08a25e

	dc.w $0800,$007c
	dc.l loc_08a298

	dc.w $0800,$0073
	dc.l loc_089cd6

	dc.w $0800,$0058
	dc.l loc_089d18

	dc.w $0800,$0064
	dc.l loc_089d50

	dc.w $0800,$004c
	dc.l loc_089d8a

	dc.w $0800,$0070
	dc.l loc_089dbe

	dc.w $0800,$0058
	dc.l loc_089dfa

	dc.w $0800,$0073
	dc.l loc_08a008

	dc.w $0800,$0064
	dc.l loc_089e6a

	dc.w $0800,$004c
	dc.l loc_089ea4

	dc.w $0800,$0070
	dc.l loc_089ed8

	dc.w $0800,$007c
	dc.l loc_089f14

	dc.w $0800,$007c
	dc.l loc_089f54

	dc.w $0800,$007c
	dc.l loc_089f94

	dc.w $0800,$004c
	dc.l loc_089fd4

	dc.w $0800,$0073
	dc.l loc_089cd6

	dc.w $0800,$004c
	dc.l loc_089fd4

	dc.w $0800,$0064
	dc.l loc_089d50

	dc.w $0800,$0070
	dc.l loc_08a178

	dc.w $0800,$0064
	dc.l loc_08a04a

	dc.w $0800,$0098
	dc.l loc_08a2d8

	dc.w $0800,$0073
	dc.l loc_08a084

	dc.w $0800,$0070
	dc.l loc_08a0c6

	dc.w $0800,$0067
	dc.l loc_08a102

	dc.w $0800,$0058
	dc.l loc_08a140

	dc.w $0800,$0058
	dc.l loc_089e32

	dc.w $0800,$0064
	dc.l loc_08a1b4

	dc.w $0800,$0058
	dc.l loc_08a1ee

	dc.w $0840,$0058
	dc.l loc_08a226

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087e8c:
	dc.w $0800,$004c
	dc.l loc_08a31c

	dc.w $0800,$004c
	dc.l loc_08a350

	dc.w $0800,$0064
	dc.l loc_08a384

	dc.w $0800,$0058
	dc.l loc_08a3be

	dc.w $0800,$0073
	dc.l loc_08a3f6

	dc.w $0800,$0058
	dc.l loc_08a438

	dc.w $0800,$0064
	dc.l loc_08a470

	dc.w $0800,$004c
	dc.l loc_08a4aa

	dc.w $0800,$0070
	dc.l loc_08a4de

	dc.w $0800,$0058
	dc.l loc_08a51a

	dc.w $0800,$0058
	dc.l loc_08a552

	dc.w $0800,$0064
	dc.l loc_08a58a

	dc.w $0800,$004c
	dc.l loc_08a5c4

	dc.w $0800,$0070
	dc.l loc_08a5f8

	dc.w $0800,$007c
	dc.l loc_08a634

	dc.w $0800,$007c
	dc.l loc_08a674

	dc.w $0800,$007c
	dc.l loc_08a6b4

	dc.w $0800,$004c
	dc.l loc_08a6f4

	dc.w $0800,$0073
	dc.l loc_08a3f6

	dc.w $0800,$004c
	dc.l loc_08a6f4

	dc.w $0800,$0064
	dc.l loc_08a470

	dc.w $0800,$0073
	dc.l loc_08a728

	dc.w $0800,$0064
	dc.l loc_08a76a

	dc.w $0800,$0098
	dc.l loc_08a9f8

	dc.w $0800,$0073
	dc.l loc_08a7a4

	dc.w $0800,$0070
	dc.l loc_08a7e6

	dc.w $0800,$0067
	dc.l loc_08a822

	dc.w $0800,$0058
	dc.l loc_08a860

	dc.w $0800,$0070
	dc.l loc_08a898

	dc.w $0800,$0064
	dc.l loc_08a8d4

	dc.w $0800,$0058
	dc.l loc_08a90e

	dc.w $0840,$0058
	dc.l loc_08a946


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_087f8c:
	dc.w $0800,$004c
	dc.l loc_08a31c

	dc.w $0800,$004c
	dc.l loc_08a350

	dc.w $0800,$0064
	dc.l loc_08a97e

	dc.w $0800,$007c
	dc.l loc_08a9b8

	dc.w $0800,$0073
	dc.l loc_08a3f6

	dc.w $0800,$0058
	dc.l loc_08a438

	dc.w $0800,$0064
	dc.l loc_08a470

	dc.w $0800,$004c
	dc.l loc_08a4aa

	dc.w $0800,$0070
	dc.l loc_08a4de

	dc.w $0800,$0058
	dc.l loc_08a51a

	dc.w $0800,$0073
	dc.l loc_08a728

	dc.w $0800,$0064
	dc.l loc_08a58a

	dc.w $0800,$004c
	dc.l loc_08a5c4

	dc.w $0800,$0070
	dc.l loc_08a5f8

	dc.w $0800,$007c
	dc.l loc_08a634

	dc.w $0800,$007c
	dc.l loc_08a674

	dc.w $0800,$007c
	dc.l loc_08a6b4

	dc.w $0800,$004c
	dc.l loc_08a6f4

	dc.w $0800,$0073
	dc.l loc_08a3f6

	dc.w $0800,$004c
	dc.l loc_08a6f4

	dc.w $0800,$0064
	dc.l loc_08a470

	dc.w $0800,$0070
	dc.l loc_08a898

	dc.w $0800,$0064
	dc.l loc_08a76a

	dc.w $0800,$0098
	dc.l loc_08a9f8

	dc.w $0800,$0073
	dc.l loc_08a7a4

	dc.w $0800,$0070
	dc.l loc_08a7e6

	dc.w $0800,$0067
	dc.l loc_08a822

	dc.w $0800,$0058
	dc.l loc_08a860

	dc.w $0800,$0058
	dc.l loc_08a552

	dc.w $0800,$0064
	dc.l loc_08a8d4

	dc.w $0800,$0058
	dc.l loc_08a90e

	dc.w $0840,$0058
	dc.l loc_08a946

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08808c:
	dc.w $ff40,$0040
	dc.l loc_08aa3c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088094:
	dc.w $ff40,$00a0
	dc.l loc_08aae2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08809c:
	dc.w $ff40,$0050
	dc.l loc_08abb0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Select Character Grid
loc_0880a4:
	dc.w $0010,$0064,$0018
	dc.l loc_08ac56
	dc.w $2834,$110b,$2858,$110b
	dc.w $2856,$110b,$281a,$1110
	dc.w $2850,$1111,$2836,$110a
	dc.w $281e,$1110,$27d2,$1113
	dc.w $2852,$110a,$2838,$110e
	dc.w $283a,$110f,$285e,$110a
	dc.w $2854,$110a,$281c,$1113
	dc.w $2810,$110f,$283e,$110d
	dc.w $285a,$110e,$2812,$110f
	dc.w $2814,$1112,$2830,$110f
	dc.w $2818,$110c,$2832,$110b
	dc.w $283c,$110e,$2816,$110b
	dc.w $285c,$110a,$2932,$110c
	dc.w $2936,$110d,$2934,$110d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08811e:
	dc.w $000c,$0004,$0000
	dc.l loc_08acca
	dc.w $0530,$031b


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08812c:
	dc.w $000c,$0004,$0000
	dc.l loc_08acca
	dc.w $0520,$031b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08813a:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0534,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088148:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $04f4,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088156:
	dc.w $000c,$0006,$0000
	dc.l loc_08acd2
	dc.w $0550,$051b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088164:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0524,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088172:
	dc.w $000c,$0006,$0000
	dc.l loc_08acd2
	dc.w $04b0,$051b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088180:
	dc.w $000c,$0004,$0000
	dc.l loc_08acca
	dc.w $0510,$031b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08818e:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0514,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08819c:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0500,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881aa:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $04e4,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881b8:
	dc.w $000c,$0006,$0000
	dc.l loc_08acd2
	dc.w $050a,$051b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881c6:
	dc.w $000c,$0004,$0000
	dc.l loc_08acca
	dc.w $04f0,$031b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881d4:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $0539,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881e2:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $0529,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881f0:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $0519,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0881fe:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04e9,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08820c:
	dc.w $000c,$0004,$0000
	dc.l loc_08acca
	dc.w $04e0,$031b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08821a:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04d7,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088228:
	dc.w $000c,$0006,$0000
	dc.l loc_08acd2
	dc.w $04f9,$051b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088236:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04b6,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088244:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04c7,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088252:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $054b,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088260:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0505,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08826e:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04c0,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08827c:
	dc.w $000c,$0005,$0000
	dc.l loc_08acce
	dc.w $0546,$041b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08828a:
	dc.w $0008,$0004,$0000
	dc.w $03a0,$031b,$ffde,$fff4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088298:
	dc.w $0008,$0004,$0000
	dc.w $03a5,$031b,$ffe4,$fff4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0882a6:
	dc.w $000c,$0006,$0000
	dc.l loc_08acd2
	dc.w $0540,$051b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0882b4:
	dc.w $000c,$0007,$0000
	dc.l loc_08acd6
	dc.w $04d0,$061b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0882c2:
	dc.w $000c,$0009,$0000
	dc.l loc_08acda
	dc.w $03a0,$081b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0882d0:
	dc.w $000a,$000c,$000b,$001b
	dc.l loc_08acde
	dc.w $04ce,$04ce,$04ce,$04ce
	dc.w $04ce,$04ce,$04ce,$04ce
	dc.w $04ce,$04ce,$04ce,$04ce


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0882f4:
	dc.w $0008,$0019,$0003
	dc.w $0693,$001d,$fff0,$fff8
	dc.w $0680,$0f1d,$0000,$fff8
	dc.w $0690,$031d,$0100,$fff8
	dc.w $0680,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08831a:
	dc.w $0008,$0019,$0003
	dc.w $0692,$011d,$fff0,$fff8
	dc.w $0680,$0f1d,$0010,$fff8
	dc.w $0690,$031d,$0110,$fff8
	dc.w $0680,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088340:
	dc.w $0008,$0019,$0003
	dc.w $0691,$021d,$fff0,$fff8
	dc.w $0680,$0f1d,$0020,$fff8
	dc.w $0690,$031d,$0120,$fff8
	dc.w $0680,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088366:
	dc.w $0008,$0019,$0003
	dc.w $0690,$031d,$fff0,$fff8
	dc.w $0680,$0f1d,$0030,$fff8
	dc.w $0690,$031d,$0130,$fff8
	dc.w $0680,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08838c:
	dc.w $0008,$0019,$0003
	dc.w $068f,$001d,$fff0,$fff8
	dc.w $0690,$031d,$0000,$fff8
	dc.w $0680,$0f1d,$0040,$fff8
	dc.w $0690,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0883b2:
	dc.w $0008,$0019,$0003
	dc.w $068e,$011d,$fff0,$fff8
	dc.w $0690,$031d,$0010,$fff8
	dc.w $0680,$0f1d,$0050,$fff8
	dc.w $0690,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0883d8:
	dc.w $0008,$0019,$0003
	dc.w $068d,$021d,$fff0,$fff8
	dc.w $0690,$031d,$0020,$fff8
	dc.w $0680,$0f1d,$0060,$fff8
	dc.w $0690,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0883fe:
	dc.w $0008,$0019,$0003
	dc.w $068c,$031d,$fff0,$fff8
	dc.w $0690,$031d,$0030,$fff8
	dc.w $0680,$0f1d,$0070,$fff8
	dc.w $0690,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088424:
	dc.w $0008,$0019,$0002
	dc.w $068b,$041d,$fff0,$fff8
	dc.w $0690,$031d,$0040,$fff8
	dc.w $0680,$0f1d,$0080,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088442:
	dc.w $0008,$0019,$0002
	dc.w $068a,$051d,$fff0,$fff8
	dc.w $0690,$031d,$0050,$fff8
	dc.w $0680,$0e1d,$0090,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088460:
	dc.w $0008,$0019,$0002
	dc.w $0689,$061d,$fff0,$fff8
	dc.w $0690,$031d,$0060,$fff8
	dc.w $0680,$0d1d,$00a0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08847e:
	dc.w $0008,$0019,$0002
	dc.w $0688,$071d,$fff0,$fff8
	dc.w $0690,$031d,$0070,$fff8
	dc.w $0680,$0c1d,$00b0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08849c:
	dc.w $0008,$0019,$0002
	dc.w $0687,$081d,$fff0,$fff8
	dc.w $0690,$031d,$0080,$fff8
	dc.w $0680,$0b1d,$00c0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0884ba:
	dc.w $0008,$0019,$0002
	dc.w $0686,$091d,$fff0,$fff8
	dc.w $0690,$031d,$0090,$fff8
	dc.w $0680,$0a1d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0884d8:
	dc.w $0008,$0019,$0002
	dc.w $0685,$0a1d,$fff0,$fff8
	dc.w $0690,$031d,$00a0,$fff8
	dc.w $0680,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0884f6:
	dc.w $0008,$0019,$0002
	dc.w $0684,$0b1d,$fff0,$fff8
	dc.w $0690,$031d,$00b0,$fff8
	dc.w $0680,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088514:
	dc.w $0008,$0019,$0002
	dc.w $0683,$0c1d,$fff0,$fff8
	dc.w $0690,$031d,$00c0,$fff8
	dc.w $0680,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088532:
	dc.w $0008,$0019,$0002
	dc.w $0682,$0d1d,$fff0,$fff8
	dc.w $0690,$031d,$00d0,$fff8
	dc.w $0680,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088550:
	dc.w $0008,$0019,$0002
	dc.w $0681,$0e1d,$fff0,$fff8
	dc.w $0690,$031d,$00e0,$fff8
	dc.w $0680,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08856e:
	dc.w $0008,$0019,$0002
	dc.w $0680,$0f1d,$fff0,$fff8
	dc.w $0690,$031d,$00f0,$fff8
	dc.w $0680,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08858c:
	dc.w $0008,$0019,$0002
	dc.w $067c,$001d,$fff0,$fff8
	dc.w $0660,$0f1d,$0000,$fff8
	dc.w $0670,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0885aa:
	dc.w $0008,$0019,$0002
	dc.w $067b,$011d,$fff0,$fff8
	dc.w $0660,$0f1d,$0010,$fff8
	dc.w $0670,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0885c8:
	dc.w $0008,$0019,$0002
	dc.w $067a,$021d,$fff0,$fff8
	dc.w $0660,$0f1d,$0020,$fff8
	dc.w $0670,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0885e6:
	dc.w $0008,$0019,$0002
	dc.w $0679,$031d,$fff0,$fff8
	dc.w $0660,$0f1d,$0030,$fff8
	dc.w $0670,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088604:
	dc.w $0008,$0019,$0002
	dc.w $0678,$041d,$fff0,$fff8
	dc.w $0660,$0f1d,$0040,$fff8
	dc.w $0670,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088622:
	dc.w $0008,$0019,$0002
	dc.w $0677,$051d,$fff0,$fff8
	dc.w $0660,$0f1d,$0050,$fff8
	dc.w $0670,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088640:
	dc.w $0008,$0019,$0002
	dc.w $0676,$061d,$fff0,$fff8
	dc.w $0660,$0f1d,$0060,$fff8
	dc.w $0670,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08865e:
	dc.w $0008,$0019,$0002
	dc.w $0675,$071d,$fff0,$fff8
	dc.w $0660,$0f1d,$0070,$fff8
	dc.w $0670,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08867c:
	dc.w $0008,$0019,$0001
	dc.w $0674,$081d,$fff0,$fff8
	dc.w $0660,$0f1d,$0080,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088692:
	dc.w $0008,$0019,$0001
	dc.w $0673,$091d,$fff0,$fff8
	dc.w $0660,$0e1d,$0090,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0886a8:
	dc.w $0008,$0019,$0001
	dc.w $0672,$0a1d,$fff0,$fff8
	dc.w $0660,$0d1d,$00a0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0886be:
	dc.w $0008,$0019,$0001
	dc.w $0671,$0b1d,$fff0,$fff8
	dc.w $0660,$0c1d,$00b0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0886d4:
	dc.w $0008,$0019,$0001
	dc.w $0670,$0c1d,$fff0,$fff8
	dc.w $0660,$0b1d,$00c0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0886ea:
	dc.w $0008,$0019,$0002
	dc.w $066f,$001d,$fff0,$fff8
	dc.w $0670,$0c1d,$0000,$fff8
	dc.w $0660,$0a1d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088708:
	dc.w $0008,$0019,$0002
	dc.w $066e,$011d,$fff0,$fff8
	dc.w $0670,$0c1d,$0010,$fff8
	dc.w $0660,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088726:
	dc.w $0008,$0019,$0002
	dc.w $066d,$021d,$fff0,$fff8
	dc.w $0670,$0c1d,$0020,$fff8
	dc.w $0660,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088744:
	dc.w $0008,$0019,$0002
	dc.w $066c,$031d,$fff0,$fff8
	dc.w $0670,$0c1d,$0030,$fff8
	dc.w $0660,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088762:
	dc.w $0008,$0019,$0002
	dc.w $066b,$041d,$fff0,$fff8
	dc.w $0670,$0c1d,$0040,$fff8
	dc.w $0660,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088780:
	dc.w $0008,$0019,$0002
	dc.w $066a,$051d,$fff0,$fff8
	dc.w $0670,$0c1d,$0050,$fff8
	dc.w $0660,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08879e:
	dc.w $0008,$0019,$0002
	dc.w $0669,$061d,$fff0,$fff8
	dc.w $0670,$0c1d,$0060,$fff8
	dc.w $0660,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0887bc:
	dc.w $0008,$0019,$0002
	dc.w $0668,$071d,$fff0,$fff8
	dc.w $0670,$0c1d,$0070,$fff8
	dc.w $0660,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0887da:
	dc.w $0008,$0019,$0002
	dc.w $0667,$081d,$fff0,$fff8
	dc.w $0670,$0c1d,$0080,$fff8
	dc.w $0660,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0887f8:
	dc.w $0008,$0019,$0002
	dc.w $0666,$091d,$fff0,$fff8
	dc.w $0670,$0c1d,$0090,$fff8
	dc.w $0660,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088816:
	dc.w $0008,$0019,$0002
	dc.w $0665,$0a1d,$fff0,$fff8
	dc.w $0670,$0c1d,$00a0,$fff8
	dc.w $0660,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088834:
	dc.w $0008,$0019,$0001
	dc.w $0664,$0b1d,$fff0,$fff8
	dc.w $0670,$0c1d,$00b0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08884a:
	dc.w $0008,$0019,$0001
	dc.w $0663,$0c1d,$fff0,$fff8
	dc.w $0670,$0b1d,$00c0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088860:
	dc.w $0008,$0019,$0001
	dc.w $0662,$0d1d,$fff0,$fff8
	dc.w $0670,$0a1d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088876:
	dc.w $0008,$0019,$0001
	dc.w $0661,$0e1d,$fff0,$fff8
	dc.w $0670,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08888c:
	dc.w $0008,$0019,$0001
	dc.w $0660,$0f1d,$fff0,$fff8
	dc.w $0670,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0888a2:
	dc.w $0008,$0018,$0002
	dc.w $0660,$0f1d,$0000,$fff8
	dc.w $0670,$021d,$0100,$fff8
	dc.w $0653,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0888c0:
	dc.w $0008,$0018,$0003
	dc.w $065c,$001d,$fff0,$fff8
	dc.w $0660,$0f1d,$0010,$fff8
	dc.w $0670,$021d,$0110,$fff8
	dc.w $0653,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0888e6:
	dc.w $0008,$0018,$0003
	dc.w $065b,$011d,$fff0,$fff8
	dc.w $0660,$0f1d,$0020,$fff8
	dc.w $0670,$021d,$0120,$fff8
	dc.w $0653,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08890c:
	dc.w $0008,$0018,$0003
	dc.w $065a,$021d,$fff0,$fff8
	dc.w $0660,$0f1d,$0030,$fff8
	dc.w $0670,$021d,$0130,$fff8
	dc.w $0653,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088932:
	dc.w $0008,$0018,$0003
	dc.w $0659,$031d,$fff0,$fff8
	dc.w $0660,$0f1d,$0040,$fff8
	dc.w $0670,$021d,$0140,$fff8
	dc.w $0653,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088958:
	dc.w $0008,$0018,$0003
	dc.w $0658,$041d,$fff0,$fff8
	dc.w $0660,$0f1d,$0050,$fff8
	dc.w $0670,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088976:
	dc.w $0008,$0018,$0002
	dc.w $0657,$051d,$fff0,$fff8
	dc.w $0660,$0f1d,$0060,$fff8
	dc.w $0670,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088994:
	dc.w $0008,$0018,$0002
	dc.w $0656,$061d,$fff0,$fff8
	dc.w $0660,$0f1d,$0070,$fff8
	dc.w $0670,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0889b2:
	dc.w $0008,$0018,$0002
	dc.w $0655,$071d,$fff0,$fff8
	dc.w $0660,$0f1d,$0080,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0889c8:
	dc.w $0008,$0018,$0001
	dc.w $0654,$081d,$fff0,$fff8
	dc.w $0660,$0e1d,$0090,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0889de:
	dc.w $0008,$0018,$0001
	dc.w $0653,$091d,$fff0,$fff8
	dc.w $0660,$0d1d,$00a0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0889f4:
	dc.w $0008,$0018,$0002
	dc.w $0672,$001d,$fff0,$fff8
	dc.w $0653,$091d,$0000,$fff8
	dc.w $0660,$0c1d,$00b0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088a12:
	dc.w $0008,$0018,$0002
	dc.w $0671,$011d,$fff0,$fff8
	dc.w $0653,$091d,$0010,$fff8
	dc.w $0660,$0b1d,$00c0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088a30:
	dc.w $0008,$0018,$0002
	dc.w $0670,$021d,$fff0,$fff8
	dc.w $0653,$091d,$0020,$fff8
	dc.w $0660,$0a1d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088a4e:
	dc.w $0008,$0018,$0003
	dc.w $066f,$001d,$fff0,$fff8
	dc.w $0670,$021d,$0000,$fff8
	dc.w $0653,$091d,$0030,$fff8
	dc.w $0660,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088a74:
	dc.w $0008,$0018,$0003
	dc.w $066e,$011d,$fff0,$fff8
	dc.w $0670,$021d,$0010,$fff8
	dc.w $0653,$091d,$0040,$fff8
	dc.w $0660,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088a9a:
	dc.w $0008,$0018,$0003
	dc.w $066d,$021d,$fff0,$fff8
	dc.w $0670,$021d,$0020,$fff8
	dc.w $0653,$091d,$0050,$fff8
	dc.w $0660,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088ac0:
	dc.w $0008,$0018,$0003
	dc.w $066c,$031d,$fff0,$fff8
	dc.w $0670,$021d,$0030,$fff8
	dc.w $0653,$091d,$0060,$fff8
	dc.w $0660,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088ae6:
	dc.w $0008,$0018,$0003
	dc.w $066b,$041d,$fff0,$fff8
	dc.w $0670,$021d,$0040,$fff8
	dc.w $0653,$091d,$0070,$fff8
	dc.w $0660,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088b0c:
	dc.w $0008,$0018,$0003
	dc.w $066a,$051d,$fff0,$fff8
	dc.w $0670,$021d,$0050,$fff8
	dc.w $0653,$091d,$0080,$fff8
	dc.w $0660,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088b32:
	dc.w $0008,$0018,$0003
	dc.w $0669,$061d,$fff0,$fff8
	dc.w $0670,$021d,$0060,$fff8
	dc.w $0653,$091d,$0090,$fff8
	dc.w $0660,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088b58:
	dc.w $0008,$0018,$0003
	dc.w $0668,$071d,$fff0,$fff8
	dc.w $0670,$021d,$0070,$fff8
	dc.w $0653,$091d,$00a0,$fff8
	dc.w $0660,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088b7e:
	dc.w $0008,$0018,$0003
	dc.w $0667,$081d,$fff0,$fff8
	dc.w $0670,$021d,$0080,$fff8
	dc.w $0653,$091d,$00b0,$fff8
	dc.w $0660,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088ba4:
	dc.w $0008,$0018,$0003
	dc.w $0666,$091d,$fff0,$fff8
	dc.w $0670,$021d,$0090,$fff8
	dc.w $0653,$091d,$00c0,$fff8
	dc.w $0660,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088bca:
	dc.w $0008,$0018,$0002
	dc.w $0665,$0a1d,$fff0,$fff8
	dc.w $0670,$021d,$00a0,$fff8
	dc.w $0653,$091d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088be8:
	dc.w $0008,$0019,$0002
	dc.w $0664,$0b1d,$fff0,$fff8
	dc.w $0670,$021d,$00b0,$fff8
	dc.w $0653,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c06:
	dc.w $0008,$0019,$0002
	dc.w $0663,$0c1d,$fff0,$fff8
	dc.w $0670,$021d,$00c0,$fff8
	dc.w $0653,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c24:
	dc.w $0008,$0019,$0002
	dc.w $0662,$0d1d,$fff0,$fff8
	dc.w $0670,$021d,$00d0,$fff8
	dc.w $0653,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c42:
	dc.w $0008,$0019,$0002
	dc.w $0661,$0e1d,$fff0,$fff8
	dc.w $0670,$021d,$00e0,$fff8
	dc.w $0653,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c60:
	dc.w $0008,$0019,$0002
	dc.w $0660,$0f1d,$fff0,$fff8
	dc.w $0670,$021d,$00f0,$fff8
	dc.w $0653,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c7e:
	dc.w $0008,$0017,$0001
	dc.w $0b70,$0e1d,$0000,$fff8
	dc.w $0b70,$071d,$0100,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088c94:
	dc.w $0008,$0017,$0002
	dc.w $0b7e,$001d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0010,$fff8
	dc.w $0b70,$061d,$0110,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088cb2:
	dc.w $0008,$0017,$0002
	dc.w $0b7d,$011d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0020,$fff8
	dc.w $0b70,$051d,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088cd0:
	dc.w $0008,$0017,$0002
	dc.w $0b7c,$021d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0030,$fff8
	dc.w $0b70,$041d,$0130,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088cee:
	dc.w $0008,$0017,$0002
	dc.w $0b7b,$031d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0040,$fff8
	dc.w $0b70,$031d,$0140,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d0c:
	dc.w $0008,$0017,$0002
	dc.w $0b7a,$041d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0050,$fff8
	dc.w $0b70,$021d,$0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d2a:
	dc.w $0008,$0017,$0002
	dc.w $0b79,$051d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0060,$fff8
	dc.w $0b70,$011d,$0160,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d48:
	dc.w $0008,$0017,$0002
	dc.w $0b78,$061d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0070,$fff8
	dc.w $0b70,$001d,$0170,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d66:
	dc.w $0008,$0017,$0001
	dc.w $0b77,$071d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0080,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d7c:
	dc.w $0008,$0018,$0001
	dc.w $0b76,$081d,$fff0,$fff8
	dc.w $0b70,$0e1d,$0090,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088d92:
	dc.w $0008,$0018,$0001
	dc.w $0b75,$091d,$fff0,$fff8
	dc.w $0b70,$0d1d,$00a0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088da8:
	dc.w $0008,$0018,$0001
	dc.w $0b74,$0a1d,$fff0,$fff8
	dc.w $0b70,$0c1d,$00b0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088dbe:
	dc.w $0008,$0018,$0001
	dc.w $0b73,$0b1d,$fff0,$fff8
	dc.w $0b70,$0b1d,$00c0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088dd4:
	dc.w $0008,$0018,$0001
	dc.w $0b72,$0c1d,$fff0,$fff8
	dc.w $0b70,$0a1d,$00d0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088dea:
	dc.w $0008,$0018,$0001
	dc.w $0b71,$0d1d,$fff0,$fff8
	dc.w $0b70,$091d,$00e0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088e00:
	dc.w $0008,$0018,$0001
	dc.w $0b70,$0e1d,$fff0,$fff8
	dc.w $0b70,$081d,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088e16:
	dc.w $0010,$00b4,$0027
	dc.l loc_08ad0e
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $0b30,$051d,$0b60,$071d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $0b68,$061d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$24c4,$031d
	dc.w $24c4,$031d,$0b70,$0e1d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088ec0:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d
	dc.w $0694,$001d,$0696,$011d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088f02:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d
	dc.w $0694,$001d,$0698,$011d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088f44:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$069a,$021d
	dc.w $0694,$001d,$069a,$021d
	dc.w $0694,$001d,$069a,$021d
	dc.w $0694,$001d,$069a,$021d
	dc.w $0694,$001d,$069a,$021d
	dc.w $0694,$001d,$069a,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088f7e:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$069d,$021d
	dc.w $0694,$001d,$069d,$021d
	dc.w $0694,$001d,$069d,$021d
	dc.w $0694,$001d,$069d,$021d
	dc.w $0694,$001d,$069d,$021d
	dc.w $0694,$001d,$069d,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088fb8:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06a0,$031d
	dc.w $0694,$001d,$06a0,$031d
	dc.w $0694,$001d,$06a0,$031d
	dc.w $0694,$001d,$06a0,$031d
	dc.w $0694,$001d,$06a0,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_088fea:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$06a4,$021d
	dc.w $0694,$001d,$06a4,$021d
	dc.w $0694,$001d,$06a4,$021d
	dc.w $0694,$001d,$06a4,$021d
	dc.w $0694,$001d,$06a4,$021d
	dc.w $0694,$001d,$06a4,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089024:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06a7,$031d
	dc.w $0694,$001d,$06a7,$031d
	dc.w $0694,$001d,$06a7,$031d
	dc.w $0694,$001d,$06a7,$031d
	dc.w $0694,$001d,$06a7,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089056:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d
	dc.w $0694,$001d,$06ab,$011d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089098:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06b0,$031d
	dc.w $0694,$001d,$06b0,$031d
	dc.w $0694,$001d,$06b0,$031d
	dc.w $0694,$001d,$06b0,$031d
	dc.w $0694,$001d,$06b0,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0890ca:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$06ad,$021d
	dc.w $0694,$001d,$06ad,$021d
	dc.w $0694,$001d,$06ad,$021d
	dc.w $0694,$001d,$06ad,$021d
	dc.w $0694,$001d,$06ad,$021d
	dc.w $0694,$001d,$06ad,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089104:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$06b4,$021d
	dc.w $0694,$001d,$06b4,$021d
	dc.w $0694,$001d,$06b4,$021d
	dc.w $0694,$001d,$06b4,$021d
	dc.w $0694,$001d,$06b4,$021d
	dc.w $0694,$001d,$06b4,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08913e:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06b7,$031d
	dc.w $0694,$001d,$06b7,$031d
	dc.w $0694,$001d,$06b7,$031d
	dc.w $0694,$001d,$06b7,$031d
	dc.w $0694,$001d,$06b7,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089170:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d
	dc.w $0694,$001d,$06e4,$011d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0891b2:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06bb,$031d
	dc.w $0694,$001d,$06bb,$031d
	dc.w $0694,$001d,$06bb,$031d
	dc.w $0694,$001d,$06bb,$031d
	dc.w $0694,$001d,$06bb,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0891e4:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0694,$001d,$06c1,$041d
	dc.w $0694,$001d,$06c1,$041d
	dc.w $0694,$001d,$06c1,$041d
	dc.w $0694,$001d,$06c1,$041d
	dc.w $0694,$001d,$06c1,$041d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089216:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0694,$001d,$06c6,$041d
	dc.w $0694,$001d,$06c6,$041d
	dc.w $0694,$001d,$06c6,$041d
	dc.w $0694,$001d,$06c6,$041d
	dc.w $0694,$001d,$06c6,$041d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089248:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0694,$001d,$06cb,$041d
	dc.w $0694,$001d,$06cb,$041d
	dc.w $0694,$001d,$06cb,$041d
	dc.w $0694,$001d,$06cb,$041d
	dc.w $0694,$001d,$06cb,$041d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08927a:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d
	dc.w $0694,$001d,$06d0,$011d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0892bc:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06f0,$031d
	dc.w $0694,$001d,$06f0,$031d
	dc.w $0694,$001d,$06f0,$031d
	dc.w $0694,$001d,$06f0,$031d
	dc.w $0694,$001d,$06f0,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0892ee:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06d2,$031d
	dc.w $0694,$001d,$06d2,$031d
	dc.w $0694,$001d,$06d2,$031d
	dc.w $0694,$001d,$06d2,$031d
	dc.w $0694,$001d,$06d2,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089320:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0694,$001d,$06d6,$041d
	dc.w $0694,$001d,$06d6,$041d
	dc.w $0694,$001d,$06d6,$041d
	dc.w $0694,$001d,$06d6,$041d
	dc.w $0694,$001d,$06d6,$041d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089352:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06db,$031d
	dc.w $0694,$001d,$06db,$031d
	dc.w $0694,$001d,$06db,$031d
	dc.w $0694,$001d,$06db,$031d
	dc.w $0694,$001d,$06db,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089384:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06e0,$031d
	dc.w $0694,$001d,$06e0,$031d
	dc.w $0694,$001d,$06e0,$031d
	dc.w $0694,$001d,$06e0,$031d
	dc.w $0694,$001d,$06e0,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0893b6:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$06ed,$021d
	dc.w $0694,$001d,$06ed,$021d
	dc.w $0694,$001d,$06ed,$021d
	dc.w $0694,$001d,$06ed,$021d
	dc.w $0694,$001d,$06ed,$021d
	dc.w $0694,$001d,$06ed,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0893f0:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06e6,$031d
	dc.w $0694,$001d,$06e6,$031d
	dc.w $0694,$001d,$06e6,$031d
	dc.w $0694,$001d,$06e6,$031d
	dc.w $0694,$001d,$06e6,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089422:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$06ea,$021d
	dc.w $0694,$001d,$06ea,$021d
	dc.w $0694,$001d,$06ea,$021d
	dc.w $0694,$001d,$06ea,$021d
	dc.w $0694,$001d,$06ea,$021d
	dc.w $0694,$001d,$06ea,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08945c:
	dc.w $000c,$0018,$000b
	dc.l loc_08ae66
	dc.w $0694,$001d,$29f4,$021d
	dc.w $0694,$001d,$29f4,$021d
	dc.w $0694,$001d,$29f4,$021d
	dc.w $0694,$001d,$29f4,$021d
	dc.w $0694,$001d,$29f4,$021d
	dc.w $0694,$001d,$29f4,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089496:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0694,$001d,$29f8,$021d
	dc.w $0694,$001d,$29f8,$021d
	dc.w $0694,$001d,$29f8,$021d
	dc.w $0694,$001d,$29f8,$021d
	dc.w $0694,$001d,$29f8,$021d
	dc.w $0694,$001d,$29f8,$021d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0894d0:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06f8,$031d
	dc.w $0694,$001d,$06f8,$031d
	dc.w $0694,$001d,$06f8,$031d
	dc.w $0694,$001d,$06f8,$031d
	dc.w $0694,$001d,$06f8,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089502:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0694,$001d,$06f4,$031d
	dc.w $0694,$001d,$06f4,$031d
	dc.w $0694,$001d,$06f4,$031d
	dc.w $0694,$001d,$06f4,$031d
	dc.w $0694,$001d,$06f4,$031d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089534:
	dc.w $000c,$0020,$0007
	dc.l loc_08ae96
	dc.w $0694,$001d,$29f4,$061d
	dc.w $0694,$001d,$29f4,$061d
	dc.w $0694,$001d,$29f4,$061d
	dc.w $0694,$001d,$29f4,$061d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08955e:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e
	dc.w $0695,$001e,$0696,$011e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0895a0:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e
	dc.w $0695,$001e,$0698,$011e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0895e2:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$069a,$021e
	dc.w $0695,$001e,$069a,$021e
	dc.w $0695,$001e,$069a,$021e
	dc.w $0695,$001e,$069a,$021e
	dc.w $0695,$001e,$069a,$021e
	dc.w $0695,$001e,$069a,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08961c:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$069d,$021e
	dc.w $0695,$001e,$069d,$021e
	dc.w $0695,$001e,$069d,$021e
	dc.w $0695,$001e,$069d,$021e
	dc.w $0695,$001e,$069d,$021e
	dc.w $0695,$001e,$069d,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089656:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06a0,$031e
	dc.w $0695,$001e,$06a0,$031e
	dc.w $0695,$001e,$06a0,$031e
	dc.w $0695,$001e,$06a0,$031e
	dc.w $0695,$001e,$06a0,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089688:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$06a4,$021e
	dc.w $0695,$001e,$06a4,$021e
	dc.w $0695,$001e,$06a4,$021e
	dc.w $0695,$001e,$06a4,$021e
	dc.w $0695,$001e,$06a4,$021e
	dc.w $0695,$001e,$06a4,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0896c2:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06a7,$031e
	dc.w $0695,$001e,$06a7,$031e
	dc.w $0695,$001e,$06a7,$031e
	dc.w $0695,$001e,$06a7,$031e
	dc.w $0695,$001e,$06a7,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0896f4:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e
	dc.w $0695,$001e,$06ab,$011e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089736:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06b0,$031e
	dc.w $0695,$001e,$06b0,$031e
	dc.w $0695,$001e,$06b0,$031e
	dc.w $0695,$001e,$06b0,$031e
	dc.w $0695,$001e,$06b0,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089768:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$06ad,$021e
	dc.w $0695,$001e,$06ad,$021e
	dc.w $0695,$001e,$06ad,$021e
	dc.w $0695,$001e,$06ad,$021e
	dc.w $0695,$001e,$06ad,$021e
	dc.w $0695,$001e,$06ad,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0897a2:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$06b4,$021e
	dc.w $0695,$001e,$06b4,$021e
	dc.w $0695,$001e,$06b4,$021e
	dc.w $0695,$001e,$06b4,$021e
	dc.w $0695,$001e,$06b4,$021e
	dc.w $0695,$001e,$06b4,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0897dc:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06b7,$031e
	dc.w $0695,$001e,$06b7,$031e
	dc.w $0695,$001e,$06b7,$031e
	dc.w $0695,$001e,$06b7,$031e
	dc.w $0695,$001e,$06b7,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08980e:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e
	dc.w $0695,$001e,$06e4,$011e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089850:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06bb,$031e
	dc.w $0695,$001e,$06bb,$031e
	dc.w $0695,$001e,$06bb,$031e
	dc.w $0695,$001e,$06bb,$031e
	dc.w $0695,$001e,$06bb,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089882:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0695,$001e,$06c1,$041e
	dc.w $0695,$001e,$06c1,$041e
	dc.w $0695,$001e,$06c1,$041e
	dc.w $0695,$001e,$06c1,$041e
	dc.w $0695,$001e,$06c1,$041e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0898b4:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0695,$001e,$06c6,$041e
	dc.w $0695,$001e,$06c6,$041e
	dc.w $0695,$001e,$06c6,$041e
	dc.w $0695,$001e,$06c6,$041e
	dc.w $0695,$001e,$06c6,$041e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0898e6:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0695,$001e,$06cb,$041e
	dc.w $0695,$001e,$06cb,$041e
	dc.w $0695,$001e,$06cb,$041e
	dc.w $0695,$001e,$06cb,$041e
	dc.w $0695,$001e,$06cb,$041e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089918:
	dc.w $000c,$0015,$000d
	dc.l loc_08adae
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e
	dc.w $0695,$001e,$06d0,$011e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08995a:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06f0,$031e
	dc.w $0695,$001e,$06f0,$031e
	dc.w $0695,$001e,$06f0,$031e
	dc.w $0695,$001e,$06f0,$031e
	dc.w $0695,$001e,$06f0,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08998c:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06d2,$031e
	dc.w $0695,$001e,$06d2,$031e
	dc.w $0695,$001e,$06d2,$031e
	dc.w $0695,$001e,$06d2,$031e
	dc.w $0695,$001e,$06d2,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0899be:
	dc.w $000c,$001e,$0009
	dc.l loc_08ae3e
	dc.w $0695,$001e,$06d6,$041e
	dc.w $0695,$001e,$06d6,$041e
	dc.w $0695,$001e,$06d6,$041e
	dc.w $0695,$001e,$06d6,$041e
	dc.w $0695,$001e,$06d6,$041e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0899f0:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06db,$031e
	dc.w $0695,$001e,$06db,$031e
	dc.w $0695,$001e,$06db,$031e
	dc.w $0695,$001e,$06db,$031e
	dc.w $0695,$001e,$06db,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089a22:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06e0,$031e
	dc.w $0695,$001e,$06e0,$031e
	dc.w $0695,$001e,$06e0,$031e
	dc.w $0695,$001e,$06e0,$031e
	dc.w $0695,$001e,$06e0,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089a54:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$06ed,$021e
	dc.w $0695,$001e,$06ed,$021e
	dc.w $0695,$001e,$06ed,$021e
	dc.w $0695,$001e,$06ed,$021e
	dc.w $0695,$001e,$06ed,$021e
	dc.w $0695,$001e,$06ed,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089a8e:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06e6,$031e
	dc.w $0695,$001e,$06e6,$031e
	dc.w $0695,$001e,$06e6,$031e
	dc.w $0695,$001e,$06e6,$031e
	dc.w $0695,$001e,$06e6,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089ac0:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$06ea,$021e
	dc.w $0695,$001e,$06ea,$021e
	dc.w $0695,$001e,$06ea,$021e
	dc.w $0695,$001e,$06ea,$021e
	dc.w $0695,$001e,$06ea,$021e
	dc.w $0695,$001e,$06ea,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089afa:
	dc.w $000c,$0018,$000b
	dc.l loc_08ae66
	dc.w $0695,$001e,$29f4,$021e
	dc.w $0695,$001e,$29f4,$021e
	dc.w $0695,$001e,$29f4,$021e
	dc.w $0695,$001e,$29f4,$021e
	dc.w $0695,$001e,$29f4,$021e
	dc.w $0695,$001e,$29f4,$021e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089b34:
	dc.w $000c,$0018,$000b
	dc.l loc_08ade6
	dc.w $0695,$001e,$29f8,$021e
	dc.w $0695,$001e,$29f8,$021e
	dc.w $0695,$001e,$29f8,$021e
	dc.w $0695,$001e,$29f8,$021e
	dc.w $0695,$001e,$29f8,$021e
	dc.w $0695,$001e,$29f8,$021e


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089b6e:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06f8,$031e
	dc.w $0695,$001e,$06f8,$031e
	dc.w $0695,$001e,$06f8,$031e
	dc.w $0695,$001e,$06f8,$031e
	dc.w $0695,$001e,$06f8,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089ba0:
	dc.w $000c,$0019,$0009
	dc.l loc_08ae16
	dc.w $0695,$001e,$06f4,$031e
	dc.w $0695,$001e,$06f4,$031e
	dc.w $0695,$001e,$06f4,$031e
	dc.w $0695,$001e,$06f4,$031e
	dc.w $0695,$001e,$06f4,$031e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089bd2:
	dc.w $000c,$0020,$0007
	dc.l loc_08ae96
	dc.w $0695,$001e,$29f4,$061e
	dc.w $0695,$001e,$29f4,$061e
	dc.w $0695,$001e,$29f4,$061e
	dc.w $0695,$001e,$29f4,$061e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089bfc:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b1,$00d0,$00d2,$00d9,$00d5
	dc.w $00b1,$00d0,$00d2,$00d9,$00d5
	dc.w $00b1,$00d0,$00d2,$00d9,$00d5
	dc.w $00b1,$00d0,$00d2,$00d9,$00d5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089c30:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b1,$00d0,$00cb,$00c5,$00ce
	dc.w $00b1,$00d0,$00cb,$00c5,$00ce
	dc.w $00b1,$00d0,$00cb,$00c5,$00ce
	dc.w $00b1,$00d0,$00cb,$00c5,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089c64:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cb,$00c9,$00b1,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9,$00b1,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9,$00b1,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089c9e:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ce,$00c1,$00d3,$00c8,$00b1,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8,$00b1,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8,$00b1,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089cd6:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08afba
	dc.w $00b1,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9
	dc.w $00b1,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9
	dc.w $00b1,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089d18:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00c1,$00c4,$00cf,$00ce,$00b1,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce,$00b1,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce,$00b1,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089d50:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cf,$00cd,$00b1,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd,$00b1,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd,$00b1,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089d8a:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b1,$00d0,$00c7,$00d5,$00d9
	dc.w $00b1,$00d0,$00c7,$00d5,$00d9
	dc.w $00b1,$00d0,$00c7,$00d5,$00d9
	dc.w $00b1,$00d0,$00c7,$00d5,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089dbe:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b1,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5
	dc.w $00b1,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5
	dc.w $00b1,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089dfa:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00d2,$00cf,$00d3,$00c5,$00b1,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5,$00b1,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5,$00b1,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089e32:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00d6,$00c5,$00c7,$00c1,$00b1,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1,$00b1,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1,$00b1,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089e6a:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00c1,$00d4,$00b1,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4,$00b1,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4,$00b1,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089ea4:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b1,$00d0,$00c4,$00c1,$00ce
	dc.w $00b1,$00d0,$00c4,$00c1,$00ce
	dc.w $00b1,$00d0,$00c4,$00c1,$00ce
	dc.w $00b1,$00d0,$00c4,$00c1,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089ed8:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b1,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1
	dc.w $00b1,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1
	dc.w $00b1,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089f14:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf,$00b1
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf,$00b1
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf

loc_089f54:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd,$00b1
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd,$00b1
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd

loc_089f94:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6,$00b1
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6,$00b1
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_089fd4:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b1,$00d0,$00c7,$00c5,$00ce
	dc.w $00b1,$00d0,$00c7,$00c5,$00ce
	dc.w $00b1,$00d0,$00c7,$00c5,$00ce
	dc.w $00b1,$00d0,$00c7,$00c5,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a008:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08b0ee
	dc.w $00b1,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce
	dc.w $00b1,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce
	dc.w $00b1,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a04a:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cd,$00d9,$00b1,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9,$00b1,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9,$00b1,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a084:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08b0ee
	dc.w $00b1,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1
	dc.w $00b1,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1
	dc.w $00b1,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a0c6:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b1,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1
	dc.w $00b1,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1
	dc.w $00b1,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a102:
	dc.w $000a,$0019,$0018,$001c
	dc.l loc_08b15a
	dc.w $00c1,$00b1,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1,$00b1,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1,$00b1,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a140:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00c3,$00cf,$00c4,$00d9,$00b1,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9,$00b1,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9,$00b1,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a178:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b1,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7
	dc.w $00b1,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7
	dc.w $00b1,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a1b4:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00c9,$00ce,$00b1,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce,$00b1,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce,$00b1,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a1ee:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ca,$00d5,$00cc,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a226:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ca,$00d5,$00ce,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9,$00b1,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a25e:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cd,$00c1,$00b1,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1,$00b1,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1,$00b1,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a298:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5,$00b1
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5,$00b1
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a2d8:
	dc.w $000a,$001c,$001b,$001c
	dc.l loc_08b1be
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9,$00b1,$00d0,$00ca,$00d5,$00cc
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9,$00b1,$00d0,$00ca,$00d5,$00cc
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a31c:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b2,$00d0,$00d2,$00d9,$00d5
	dc.w $00b2,$00d0,$00d2,$00d9,$00d5
	dc.w $00b2,$00d0,$00d2,$00d9,$00d5
	dc.w $00b2,$00d0,$00d2,$00d9,$00d5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a350:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b2,$00d0,$00cb,$00c5,$00ce
	dc.w $00b2,$00d0,$00cb,$00c5,$00ce
	dc.w $00b2,$00d0,$00cb,$00c5,$00ce
	dc.w $00b2,$00d0,$00cb,$00c5,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a384:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cb,$00c9,$00b2,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9,$00b2,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9,$00b2,$00d0,$00c7,$00cf,$00d5
	dc.w $00cb,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a3be:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ce,$00c1,$00d3,$00c8,$00b2,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8,$00b2,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8,$00b2,$00d0
	dc.w $00ce,$00c1,$00d3,$00c8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a3f6:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08afba
	dc.w $00b2,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9
	dc.w $00b2,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9
	dc.w $00b2,$00d0,$00c3,$00c8,$00d5,$00ce,$00ae,$00cc,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a438:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00c1,$00c4,$00cf,$00ce,$00b2,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce,$00b2,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce,$00b2,$00d0
	dc.w $00c1,$00c4,$00cf,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a470:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cf,$00cd,$00b2,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd,$00b2,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd,$00b2,$00d0,$00d3,$00cf,$00c4
	dc.w $00cf,$00cd

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a4aa:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b2,$00d0,$00c7,$00d5,$00d9
	dc.w $00b2,$00d0,$00c7,$00d5,$00d9
	dc.w $00b2,$00d0,$00c7,$00d5,$00d9
	dc.w $00b2,$00d0,$00c7,$00d5,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a4de:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b2,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5
	dc.w $00b2,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5
	dc.w $00b2,$00d0,$00c2,$00c9,$00d2,$00c4,$00c9,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a51a:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00d2,$00cf,$00d3,$00c5,$00b2,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5,$00b2,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5,$00b2,$00d0
	dc.w $00d2,$00cf,$00d3,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a552:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00d6,$00c5,$00c7,$00c1,$00b2,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1,$00b2,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1,$00b2,$00d0
	dc.w $00d6,$00c5,$00c7,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a58a:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00c1,$00d4,$00b2,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4,$00b2,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4,$00b2,$00d0,$00d3,$00c1,$00c7
	dc.w $00c1,$00d4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a5c4:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b2,$00d0,$00c4,$00c1,$00ce
	dc.w $00b2,$00d0,$00c4,$00c1,$00ce
	dc.w $00b2,$00d0,$00c4,$00c1,$00ce
	dc.w $00b2,$00d0,$00c4,$00c1,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a5f8:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b2,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1
	dc.w $00b2,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1
	dc.w $00b2,$00d0,$00d3,$00c1,$00cb,$00d5,$00d2,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a634:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf,$00b2
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf,$00b2
	dc.w $00d0,$00d2,$00cf,$00cc,$00c5,$00ce,$00d4,$00cf

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a674:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd,$00b2
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd,$00b2
	dc.w $00d0,$00c4,$00c8,$00c1,$00cc,$00d3,$00c9,$00cd

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a6b4:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6,$00b2
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6,$00b2
	dc.w $00d0,$00da,$00c1,$00ce,$00c7,$00c9,$00c5,$00c6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a6f4:
	dc.w $000a,$0014,$0013,$001c
	dc.l loc_08aeb6
	dc.w $00b2,$00d0,$00c7,$00c5,$00ce
	dc.w $00b2,$00d0,$00c7,$00c5,$00ce
	dc.w $00b2,$00d0,$00c7,$00c5,$00ce
	dc.w $00b2,$00d0,$00c7,$00c5,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a728:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08b0ee
	dc.w $00b2,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce
	dc.w $00b2,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce
	dc.w $00b2,$00d0,$00cd,$00ae,$00c2,$00c9,$00d3,$00cf,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a76a:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cd,$00d9,$00b2,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9,$00b2,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9,$00b2,$00d0,$00c3,$00c1,$00cd
	dc.w $00cd,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a7a4:
	dc.w $000a,$001b,$001a,$001c
	dc.l loc_08b0ee
	dc.w $00b2,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1
	dc.w $00b2,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1
	dc.w $00b2,$00d0,$00c5,$00ae,$00c8,$00cf,$00ce,$00c4,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a7e6:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b2,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1
	dc.w $00b2,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1
	dc.w $00b2,$00d0,$00c2,$00cc,$00c1,$00ce,$00cb,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a822:
	dc.w $000a,$0019,$0018,$001c
	dc.l loc_08b15a
	dc.w $00c1,$00b2,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1,$00b2,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1,$00b2,$00d0,$00d2,$00ae,$00cd,$00c9,$00cb
	dc.w $00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a860:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00c3,$00cf,$00c4,$00d9,$00b2,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9,$00b2,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9,$00b2,$00d0
	dc.w $00c3,$00cf,$00c4,$00d9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a898:
	dc.w $000a,$0018,$0017,$001c
	dc.l loc_08b026
	dc.w $00b2,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7
	dc.w $00b2,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7
	dc.w $00b2,$00d0,$00c2,$00c1,$00cc,$00d2,$00cf,$00c7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a8d4:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00c9,$00ce,$00b2,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce,$00b2,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce,$00b2,$00d0,$00cb,$00c1,$00d2
	dc.w $00c9,$00ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a90e:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ca,$00d5,$00cc,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00cc,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a946:
	dc.w $000a,$0016,$0015,$001c
	dc.l loc_08af62
	dc.w $00ca,$00d5,$00ce,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9,$00b2,$00d0
	dc.w $00ca,$00d5,$00ce,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a97e:
	dc.w $000a,$0017,$0016,$001c
	dc.l loc_08af06
	dc.w $00cd,$00c1,$00b2,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1,$00b2,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1,$00b2,$00d0,$00c1,$00cb,$00d5
	dc.w $00cd,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a9b8:
	dc.w $000a,$001a,$0019,$001c
	dc.l loc_08b086
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5,$00b2
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5,$00b2
	dc.w $00d0,$00c3,$00c8,$00c1,$00d2,$00cc,$00c9,$00c5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08a9f8:
	dc.w $000a,$001c,$001b,$001c
	dc.l loc_08b1be
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9,$00b2,$00d0,$00ca,$00d5,$00cc
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9,$00b2,$00d0,$00ca,$00d5,$00cc
	dc.w $00c9,$00a6,$00ca,$00d5,$00ce,$00c9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08aa3c:
	dc.w $0008,$0014,$0013
	dc.w $0976,$0018,$fff8,$fef0
	dc.w $0977,$0018,$fff8,$ff00
	dc.w $0978,$0018,$fff8,$ff10
	dc.w $0979,$0018,$fff8,$ff20
	dc.w $0976,$0018,$fff8,$ff30
	dc.w $0977,$0018,$fff8,$ff40
	dc.w $0978,$0018,$fff8,$ff50
	dc.w $0979,$0018,$fff8,$ff60
	dc.w $0976,$0018,$fff8,$ff70
	dc.w $0977,$0018,$fff8,$ff80
	dc.w $0978,$0018,$fff8,$ff90
	dc.w $0979,$0018,$fff8,$ffa0
	dc.w $0976,$0018,$fff8,$ffb0
	dc.w $0977,$0018,$fff8,$ffc0
	dc.w $0978,$0018,$fff8,$ffd0
	dc.w $0979,$0018,$fff8,$ffe0
	dc.w $0976,$0018,$fff8,$fff0
	dc.w $0977,$0018,$fff8,$0000
	dc.w $0978,$0018,$fff8,$0010
	dc.w $0979,$0018,$fff8,$0020

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08aae2:
	dc.w $0008,$0019,$0018
	dc.w $0b83,$0018,$fff8,$ff00
	dc.w $0b84,$0018,$fff8,$ff10
	dc.w $0b85,$0018,$fff8,$ff20
	dc.w $0b86,$0018,$fff8,$ff30
	dc.w $0b87,$0018,$fff8,$ff40
	dc.w $0976,$0018,$fff8,$ff50
	dc.w $0977,$0018,$fff8,$ff60
	dc.w $0b80,$0018,$fff8,$ff70
	dc.w $0b81,$0018,$fff8,$ff80
	dc.w $0b82,$0018,$fff8,$ff90
	dc.w $0b83,$0018,$fff8,$ffa0
	dc.w $0b84,$0018,$fff8,$ffb0
	dc.w $0b85,$0018,$fff8,$ffc0
	dc.w $0b86,$0018,$fff8,$ffd0
	dc.w $0b87,$0018,$fff8,$ffe0
	dc.w $0976,$0018,$fff8,$fff0
	dc.w $0977,$0018,$fff8,$0000
	dc.w $0b80,$0018,$fff8,$0010
	dc.w $0b81,$0018,$fff8,$0020
	dc.w $0b82,$0018,$fff8,$0030
	dc.w $0b83,$0018,$fff8,$0040
	dc.w $0b84,$0018,$fff8,$0050
	dc.w $0b85,$0018,$fff8,$0060
	dc.w $0b86,$0018,$fff8,$0070
	dc.w $0b87,$0018,$fff8,$0080

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08abb0:
	dc.w $0008,$0014,$0013
	dc.w $0971,$0018,$fff8,$ff00
	dc.w $0972,$0018,$fff8,$ff10
	dc.w $0973,$0018,$fff8,$ff20
	dc.w $0974,$0018,$fff8,$ff30
	dc.w $0975,$0018,$fff8,$ff40
	dc.w $0971,$0018,$fff8,$ff50
	dc.w $0972,$0018,$fff8,$ff60
	dc.w $0973,$0018,$fff8,$ff70
	dc.w $0974,$0018,$fff8,$ff80
	dc.w $0975,$0018,$fff8,$ff90
	dc.w $0971,$0018,$fff8,$ffa0
	dc.w $0972,$0018,$fff8,$ffb0
	dc.w $0973,$0018,$fff8,$ffc0
	dc.w $0974,$0018,$fff8,$ffd0
	dc.w $0975,$0018,$fff8,$ffe0
	dc.w $0971,$0018,$fff8,$fff0
	dc.w $0972,$0018,$fff8,$0000
	dc.w $0973,$0018,$fff8,$0010
	dc.w $0974,$0018,$fff8,$0020
	dc.w $0975,$0018,$fff8,$0030

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Character Grid Locations
loc_08ac56:
	dc.w $fff0,$fff0;Karin
	dc.w $0008,$fff0;Claw
	dc.w $ffd8,$fff0;Cody
	dc.w $fff0,$ffd8;R.Mika
	dc.w $0020,$fff0;Blanka
	dc.w $ffc0,$fff0;
	dc.w $fff0,$0008;
	dc.w $0008,$0020;
	dc.w $0020,$0008;
	dc.w $ffc0,$0008;
	dc.w $ffd8,$0020;
	dc.w $fff0,$0020;
	dc.w $ffc0,$ffd8;
	dc.w $0008,$ffc0;
	dc.w $fff0,$ffa8;
	dc.w $fff0,$0038;
	dc.w $0008,$ffd8;
	dc.w $ffd8,$ffd8;
	dc.w $ffd8,$0008;
	dc.w $0008,$0008;
	dc.w $fff0,$ffc0;
	dc.w $ffd8,$ffc0;
	dc.w $0020,$ffd8;Akuma
	dc.w $0038,$fff0;Ken
	dc.w $ffa8,$fff0;Ryu
	dc.w $ffc0,$ffc0;Boxer
	dc.w $0020,$0020;Juli
	dc.w $0020,$ffc0;Juni
	dc.w $ffc0,$0020;Juli+Juni Combo

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08acca:
	dc.w $ffe0,$fff4

loc_08acce:
	dc.w $ffd8,$fff4

loc_08acd2:
	dc.w $ffd0,$fff4

loc_08acd6:
	dc.w $ffc8,$fff4

loc_08acda:
	dc.w $ffb8,$fff4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08acde:
	dc.w $ffa0,$fff4,$ffb0,$fff4
	dc.w $ffc0,$fff4,$ffd0,$fff4
	dc.w $ffe0,$fff4,$fff0,$fff4
	dc.w $0000,$fff4,$0010,$fff4
	dc.w $0020,$fff4,$0030,$fff4
	dc.w $0040,$fff4,$0050,$fff4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ad0e:
	dc.w $ff40,$ffd0,$ff80,$ffd0
	dc.w $ffc0,$ffd0,$0000,$ffd0
	dc.w $0040,$ffd0,$0080,$ffd0
	dc.w $ff40,$ffe0,$ff80,$ffe0
	dc.w $ffc0,$ffe0,$0000,$ffe0
	dc.w $0040,$ffe0,$0080,$ffe0
	dc.w $ff88,$ffd8,$fff8,$ffd8
	dc.w $ff40,$fff0,$ff80,$fff0
	dc.w $ffc0,$fff0,$0000,$fff0
	dc.w $0040,$fff0,$0080,$fff0
	dc.w $ff40,$0000,$ff80,$0000
	dc.w $ffc0,$0000,$0000,$0000
	dc.w $0040,$0000,$0080,$0000
	dc.w $ffc8,$fff8,$ff40,$0010
	dc.w $ff80,$0010,$ffc0,$0010
	dc.w $0000,$0010,$0040,$0010
	dc.w $0080,$0010,$ff40,$0020
	dc.w $ff80,$0020,$ffc0,$0020
	dc.w $0000,$0020,$0040,$0020
	dc.w $0080,$0020,$ff88,$0018

loc_08adae:
	dc.w $ffc0,$fff8,$ffd8,$fff8
	dc.w $0000,$fff8,$0018,$fff8
	dc.w $0040,$fff8,$0058,$fff8
	dc.w $0080,$fff8,$0098,$fff8
	dc.w $00c0,$fff8,$00d8,$fff8
	dc.w $0100,$fff8,$0118,$fff8
	dc.w $0140,$fff8,$0158,$fff8

loc_08ade6:
	dc.w $ffb0,$fff8,$ffc8,$fff8
	dc.w $0000,$fff8,$0018,$fff8
	dc.w $0050,$fff8,$0068,$fff8
	dc.w $00a0,$fff8,$00b8,$fff8
	dc.w $00f0,$fff8,$0108,$fff8
	dc.w $0140,$fff8,$0158,$fff8

loc_08ae16:
	dc.w $ffa0,$fff8,$ffb8,$fff8
	dc.w $0000,$fff8,$0018,$fff8
	dc.w $0060,$fff8,$0078,$fff8
	dc.w $00c0,$fff8,$00d8,$fff8
	dc.w $0120,$fff8,$0138,$fff8

loc_08ae3e:
	dc.w $ff90,$fff8,$ffa8,$fff8
	dc.w $0000,$fff8,$0018,$fff8
	dc.w $0070,$fff8,$0088,$fff8
	dc.w $00e0,$fff8,$00f8,$fff8
	dc.w $0150,$fff8,$0168,$fff8

loc_08ae66:
	dc.w $ffb0,$fff8,$ffc2,$fff8
	dc.w $0000,$fff8,$0012,$fff8
	dc.w $0050,$fff8,$0062,$fff8
	dc.w $00a0,$fff8,$00b2,$fff8
	dc.w $00f0,$fff8,$0102,$fff8
	dc.w $0140,$fff8,$0152,$fff8

loc_08ae96:
	dc.w $ff78,$fff8,$ff88,$fff8
	dc.w $0000,$fff8,$0010,$fff8
	dc.w $0088,$fff8,$0098,$fff8
	dc.w $0110,$fff8,$0120,$fff8

loc_08aeb6:
	dc.w $fffd,$ff0c,$fffd,$ff18
	dc.w $fffd,$ff2c,$fffd,$ff38
	dc.w $fffd,$ff44,$fffd,$ff58
	dc.w $fffd,$ff64,$fffd,$ff78
	dc.w $fffd,$ff84,$fffd,$ff90
	dc.w $fffd,$ffa4,$fffd,$ffb0
	dc.w $fffd,$ffc4,$fffd,$ffd0
	dc.w $fffd,$ffdc,$fffd,$fff0
	dc.w $fffd,$fffc,$fffd,$0010
	dc.w $fffd,$001c,$fffd,$0028

loc_08af06:
	dc.w $fffd,$ff08,$fffd,$ff14,$fffd,$ff28,$fffd,$ff34
	dc.w $fffd,$ff48,$fffd,$ff54,$fffd,$ff60,$fffd,$ff6c
	dc.w $fffd,$ff78,$fffd,$ff8c,$fffd,$ff98,$fffd,$ffac
	dc.w $fffd,$ffb8,$fffd,$ffc4,$fffd,$ffd0,$fffd,$ffdc
	dc.w $fffd,$fff0,$fffd,$fffc,$fffd,$0010,$fffd,$001c
	dc.w $fffd,$0028,$fffd,$0034,$fffd,$0040

loc_08af62:
	dc.w $fffd,$ff08,$fffd,$ff14
	dc.w $fffd,$ff20,$fffd,$ff2c
	dc.w $fffd,$ff40,$fffd,$ff4c
	dc.w $fffd,$ff60,$fffd,$ff6c
	dc.w $fffd,$ff78,$fffd,$ff84
	dc.w $fffd,$ff98,$fffd,$ffa4
	dc.w $fffd,$ffb8,$fffd,$ffc4
	dc.w $fffd,$ffd0,$fffd,$ffdc
	dc.w $fffd,$fff0,$fffd,$fffc
	dc.w $fffd,$0010,$fffd,$001c
	dc.w $fffd,$0028,$fffd,$0034

loc_08afba:
	dc.w $fffd,$ff0a,$fffd,$ff16
	dc.w $fffd,$ff2a,$fffd,$ff36
	dc.w $fffd,$ff42,$fffd,$ff4e
	dc.w $fffd,$ff51,$fffd,$ff5d
	dc.w $fffd,$ff69,$fffd,$ff7d
	dc.w $fffd,$ff89,$fffd,$ff9d
	dc.w $fffd,$ffa9,$fffd,$ffb5
	dc.w $fffd,$ffc1,$fffd,$ffc4
	dc.w $fffd,$ffd0,$fffd,$ffdc
	dc.w $fffd,$fff0,$fffd,$fffc
	dc.w $fffd,$0010,$fffd,$001c
	dc.w $fffd,$0028,$fffd,$0034
	dc.w $fffd,$0037,$fffd,$0043
	dc.w $fffd,$004f

loc_08b026:
	dc.w $fffd,$ff10,$fffd,$ff1c
	dc.w $fffd,$ff30,$fffd,$ff3c
	dc.w $fffd,$ff48,$fffd,$ff54
	dc.w $fffd,$ff60,$fffd,$ff6c
	dc.w $fffd,$ff80,$fffd,$ff8c
	dc.w $fffd,$ffa0,$fffd,$ffac
	dc.w $fffd,$ffb8,$fffd,$ffc4
	dc.w $fffd,$ffd0,$fffd,$ffdc
	dc.w $fffd,$fff0,$fffd,$fffc
	dc.w $fffd,$0010,$fffd,$001c
	dc.w $fffd,$0028,$fffd,$0034
	dc.w $fffd,$0040,$fffd,$004c

loc_08b086:
	dc.w $fffd,$ff04,$fffd,$ff18
	dc.w $fffd,$ff24,$fffd,$ff30
	dc.w $fffd,$ff3c,$fffd,$ff48
	dc.w $fffd,$ff54,$fffd,$ff60
	dc.w $fffd,$ff74,$fffd,$ff80
	dc.w $fffd,$ff94,$fffd,$ffa0
	dc.w $fffd,$ffac,$fffd,$ffb8
	dc.w $fffd,$ffc4,$fffd,$ffd0
	dc.w $fffd,$ffdc,$fffd,$fff0
	dc.w $fffd,$fffc,$fffd,$0010
	dc.w $fffd,$001c,$fffd,$0028
	dc.w $fffd,$0034,$fffd,$0040
	dc.w $fffd,$004c,$fffd,$0058

loc_08b0ee:
	dc.w $fffd,$ff0a,$fffd,$ff16
	dc.w $fffd,$ff2a,$fffd,$ff2d
	dc.w $fffd,$ff39,$fffd,$ff45
	dc.w $fffd,$ff51,$fffd,$ff5d
	dc.w $fffd,$ff69,$fffd,$ff7d
	dc.w $fffd,$ff89,$fffd,$ff9d
	dc.w $fffd,$ffa0,$fffd,$ffac
	dc.w $fffd,$ffb8,$fffd,$ffc4
	dc.w $fffd,$ffd0,$fffd,$ffdc
	dc.w $fffd,$fff0,$fffd,$fffc
	dc.w $fffd,$0010,$fffd,$0013
	dc.w $fffd,$001f,$fffd,$002b
	dc.w $fffd,$0037,$fffd,$0043
	dc.w $fffd,$004f

loc_08b15a:
	dc.w $fffd,$ff0e,$fffd,$ff22
	dc.w $fffd,$ff2e,$fffd,$ff42
	dc.w $fffd,$ff45,$fffd,$ff51
	dc.w $fffd,$ff5d,$fffd,$ff69
	dc.w $fffd,$ff75,$fffd,$ff89
	dc.w $fffd,$ff95,$fffd,$ffa9
	dc.w $fffd,$ffac,$fffd,$ffb8
	dc.w $fffd,$ffc4,$fffd,$ffd0
	dc.w $fffd,$ffdc,$fffd,$fff0
	dc.w $fffd,$fffc,$fffd,$0010
	dc.w $fffd,$0013,$fffd,$001f
	dc.w $fffd,$002b,$fffd,$0037
	dc.w $fffd,$0043

loc_08b1be:
	dc.w $fffd,$ff04,$fffd,$ff12
	dc.w $fffd,$ff20,$fffd,$ff2c
	dc.w $fffd,$ff38,$fffd,$ff44
	dc.w $fffd,$ff58,$fffd,$ff64
	dc.w $fffd,$ff78,$fffd,$ff84
	dc.w $fffd,$ff90,$fffd,$ff9c
	dc.w $fffd,$ffaa,$fffd,$ffb8
	dc.w $fffd,$ffc4,$fffd,$ffd0
	dc.w $fffd,$ffdc,$fffd,$fff0
	dc.w $fffd,$fffc,$fffd,$0010
	dc.w $fffd,$001c,$fffd,$0028
	dc.w $fffd,$0034,$fffd,$0042
	dc.w $fffd,$0050,$fffd,$005c
	dc.w $fffd,$0068,$fffd,$0074

;==============================================
loc_08b22e:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($48,a6),d0
	add.w ($40,a6),d0
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_08b254
	eor.w d0,d1
	bmi.b loc_08b258

loc_08b254:
	moveq #1,d0
	rts

loc_08b258:
	moveq #0,d0
	rts

;==============================================
loc_08b25c:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_08b282
	eor.w d0,d1
	bmi.b loc_08b286

loc_08b282:
	moveq #1,d0
	rts

loc_08b286:
	moveq #0,d0
	rts

;##############################################
loc_08b28a:
	move.b (4,a6),d0
	move.w loc_08b296(pc,d0.w),d1
	jmp loc_08b296(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b296:
	dc.w loc_08b29e-loc_08b296
	dc.w loc_08b2c2-loc_08b296
	dc.w loc_08b306-loc_08b296
	dc.w loc_08b306-loc_08b296

;==============================================
loc_08b29e:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #1,($30,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	jsr loc_080434
	bra.w loc_08b30c

;==============================================
loc_08b2c2:
	subq.b #1,($3a,a6)
	bpl.w loc_08b304
	clr.b ($3a,a6)
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmp.l ($44,a6),d0
	bne.w loc_08b2fe
	jsr loc_080434
	bsr.w loc_08b30c
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_08b304
	jmp loc_01b4ec

loc_08b2fe:
	move.b #4,(4,a6)

loc_08b304:
	rts

;==============================================
loc_08b306:
	jmp loc_01c2de

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08b30c:
	jsr loc_080470
	move.w ($50,a6),($c,a6)
	movea.l ($1c,a6),a0
	move.b ($12,a0),d0
	bpl.b loc_08b332
	andi.b #$7f,d0
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

loc_08b332:
	move.b (3,a6),d1
	add.b d1,($d,a6)
	rts

;##############################################
loc_08b33c:
	move.b ($101,a6),d0
	jsr loc_080452
	jsr loc_0804a0
	beq.w loc_08b3e6
	move.l #$2001000,d2
	move.b #8,($2a0,a6)
	move.l #$1001103,(a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.b #8,($3a,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($50,a4)
	move.b #1,($30,a4)
	move.l d2,($44,a4)
	move.l #$1001104,(a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.b #$10,($3a,a3)
	move.w a6,($36,a3)
	move.w ($c,a6),($50,a3)
	move.b #1,($30,a3)
	move.l d2,($44,a3)
	move.l #$1001104,(a2)
	move.b ($e,a6),($e,a2)
	move.b d0,($3c,a2)
	move.w d1,($40,a2)
	move.b #$18,($3a,a2)
	move.w a6,($36,a2)
	move.w ($c,a6),($50,a2)
	move.b #1,($30,a2)
	move.l d2,($44,a2)

loc_08b3e6:
	rts

;##############################################
loc_08b3e8:
	move.b (3,a6),d0
	move.w loc_08b3f4(pc,d0.w),d1
	jmp loc_08b3f4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b3f4:
	dc.w loc_08b408-loc_08b3f4
	dc.w loc_08b4dc-loc_08b3f4
	dc.w loc_08b56a-loc_08b3f4
	dc.w loc_08b6e8-loc_08b3f4
	dc.w loc_08b778-loc_08b3f4
	dc.w loc_08b852-loc_08b3f4
	dc.w loc_08b8c4-loc_08b3f4
	dc.w loc_08b930-loc_08b3f4

	dc.w loc_08b9f4-loc_08b3f4
	dc.w loc_08bab2-loc_08b3f4

;==============================================
loc_08b408:
	move.b (4,a6),d0
	move.w loc_08b414(pc,d0.w),d1
	jmp loc_08b414(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b414:
	dc.w loc_08b41c-loc_08b414
	dc.w loc_08b4ae-loc_08b414
	dc.w loc_08bba4-loc_08b414
	dc.w loc_08bba4-loc_08b414

;----------------------------------------------
loc_08b41c:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	moveq #0,d0
	move.b #2,(9,a6)
	move.b #0,($e,a6)
	move.w d0,($c,a6)
	move.w ($18,a4),($18,a6)
	move.w #$2000,($1a,a6)
	move.b ($128,a4),($31,a6)
	move.b ($102,a4),d0
	move.w #$fe68,($10,a6)
	move.w #$88,($14,a6)
	move.w #$32,($40,a6)
	move.w #$fffe,($48,a6)
	move.b ($132,a4),d0
	ext.w d0
	add.w d0,d0
	addi.w #$e,d0
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_08b47a
	addq.w #$1,d0

loc_08b47a:
	moveq #0,d1
	move.b ($102,a4),d1
	lsl.w #3,d1
	add.w d0,d0
	movea.l #loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jsr loc_01b6ee
	tst.b ($35,a6)
	beq.b loc_08b4ac
	addi.w #$4b0,($10,a6)
	neg.w ($40,a6)
	neg.w ($48,a6)

loc_08b4ac:
	rts

;----------------------------------------------
loc_08b4ae:
	move.w ($40,a6),d0
	beq.b loc_08b4d6
	add.w ($48,a6),d0
	add.w d0,($10,a6)
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	subi.w #$c0,d1
	eor.w d0,d1
	bmi.b loc_08b4d6
	clr.w ($40,a6)
	move.w #$c0,($10,a6)

loc_08b4d6:
	jmp loc_01b4ec

;==============================================
loc_08b4dc:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b4f0(pc,d0.w),d1
	jmp loc_08b4f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b4f0:
	dc.w loc_08b4f8-loc_08b4f0
	dc.w loc_08b540-loc_08b4f0
	dc.w loc_08bba4-loc_08b4f0
	dc.w loc_08bba4-loc_08b4f0

;----------------------------------------------
loc_08b4f8:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.l #$c00000,($10,a6)
	move.l #$ffd80000,($14,a6)
	move.l #$38000,($44,a6)
	moveq #1,d0
	movea.l #loc_2f407c,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08b540:
	eori.b #1,($b,a6)
	move.l ($44,a6),d0
	beq.b loc_08b564
	add.l d0,($14,a6)
	cmpi.w #$30,($14,a6)
	blt.b loc_08b564
	move.w #$30,($14,a6)
	moveq #0,d0
	move.l d0,($44,a6)

loc_08b564:
	jmp loc_01b4ec

;==============================================
loc_08b56a:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b57e(pc,d0.w),d1
	jmp loc_08b57e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b57e:
	dc.w loc_08b586-loc_08b57e
	dc.w loc_08b6c4-loc_08b57e
	dc.w loc_08bba4-loc_08b57e
	dc.w loc_08bba4-loc_08b57e

;----------------------------------------------
loc_08b586:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	moveq #$22,d0
	move.b ($130,a4),d1
	cmpi.b #1,d1
	bls.b loc_08b5bc
	bsr.b loc_08b5e4
	moveq #$23,d0

loc_08b5bc:
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.w #$12,($10,a6)
	move.w #0,($14,a6)
	move.w ($34,a6),d0
	sub.w d0,($14,a6)
	move.w #1,($44,a6)
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08b5e4:
	movea.l #unk_ff3622,a0
	move.w #$c,(a0)+
	move.l #$3e000a,(a0)+
	move.l #loc_08d67e,(a0)+
	move.l #$906011b,(a0)+
	move.l #$8d0711b,(a0)+
	move.l #$950111b,(a0)+
	move.l #$8d6311b,(a0)+
	move.l #$8d0711b,(a0)+
	move.l #$950111b,(a0)+
	move.l #$8d6311b,(a0)+
	ext.w d1
	move.b loc_08b660(pc,d1.w),d1
	ext.l d1
	move.l d1,d2
	andi.w #$f,d2
	andi.w #$f0,d1
	beq.b loc_08b646
	addi.l #$1b08c4,d1
	addi.l #$1b0962,d2
	bra.b loc_08b652

loc_08b646:
 	lsl.w #4,d2
 	addi.l #$1b08c3,d2
 	move.l d2,d1
 	subq.b #1,d1

loc_08b652:
	swap d1
	swap d2
	move.l d1,(a0)+
	move.l d2,(a0)+
	move.l d1,(a0)+
	move.l d2,(a0)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b660:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$10,$11
	dc.b $12,$13,$14,$15
	dc.b $16,$17,$18,$19
	dc.b $20,$21,$22,$23
	dc.b $24,$25,$26,$27
	dc.b $28,$29,$30,$31
	dc.b $32,$33,$34,$35
	dc.b $36,$37,$38,$39
	dc.b $40,$41,$42,$43
	dc.b $44,$45,$46,$47
	dc.b $48,$49,$50,$51
	dc.b $52,$53,$54,$55
	dc.b $56,$57,$58,$59
	dc.b $60,$61,$62,$63
	dc.b $64,$65,$66,$67
	dc.b $68,$69,$70,$71
	dc.b $72,$73,$74,$75
	dc.b $76,$77,$78,$79
	dc.b $80,$81,$82,$83
	dc.b $84,$85,$86,$87
	dc.b $88,$89,$90,$91
	dc.b $92,$93,$94,$95
	dc.b $96,$97,$98,$99

;----------------------------------------------
loc_08b6c4:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	blt.b loc_08b6e2
	move.w ($34,a6),d0
	sub.w d0,($14,a6)
	move.b #1,($32,a6)
	jsr loc_01b6b6

loc_08b6e2
	jmp loc_01b4ec

;==============================================
loc_08b6e8:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b6fc(pc,d0.w),d1
	jmp loc_08b6fc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b6fc:
	dc.w loc_08b704-loc_08b6fc
	dc.w loc_08b760-loc_08b6fc
	dc.w loc_08bba4-loc_08b6fc
	dc.w loc_08bba4-loc_08b6fc

;----------------------------------------------
loc_08b704:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	jsr RNGFunction
	andi.w #1,d0
	addi.w #$20,d0
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.l #$1780000,($10,a6)
	moveq #0,d0
	move.l d0,($14,a6)
	move.w ($34,a6),d0
	add.w d0,($14,a6)
	move.l #$fffe8000,($44,a6)
	rts

;----------------------------------------------
loc_08b760:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	bgt.b loc_08b772
	move.w ($34,a6),d0
	add.w d0,($14,a6)

loc_08b772:
	jmp loc_01b4ec

;==============================================
loc_08b778:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b78c(pc,d0.w),d1
	jmp loc_08b78c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b78c:
	dc.w loc_08b794-loc_08b78c
	dc.w loc_08b760-loc_08b78c
	dc.w loc_08bba4-loc_08b78c
	dc.w loc_08bba4-loc_08b78c

;----------------------------------------------
loc_08b794:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmpi.b #$1e,d0
	beq.b loc_08b7ca
	cmpi.b #$1f,d0
	bne.b loc_08b7d6

loc_08b7ca:
	btst #1,($101,a4)
	beq.b loc_08b7d6
	moveq #$1e,d0
	bra.b loc_08b7e6

loc_08b7d6:
	ext.w d0
	tst.w (Region,a5)
	beq.b loc_08b7e2
	addi.w #$20,d0

loc_08b7e2:
	move.b loc_08b812(pc,d0.w),d0

loc_08b7e6:
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.l #$1680000,($10,a6)
	moveq #0,d0
	move.l d0,($14,a6)
	move.w ($34,a6),d0
	add.w d0,($14,a6)
	move.l #$ffff0000,($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b812:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$04,$11
	dc.b $02,$19,$12,$00
	dc.b $13,$14,$15,$16
	dc.b $17,$18,$1c,$1d
	dc.b $00,$01,$1b,$1a
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$19,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$04,$11
	dc.b $1b,$17,$12,$00
	dc.b $13,$14,$15,$16
	dc.b $0a,$18,$1c,$1d

;==============================================
loc_08b852:
	move.b (4,a6),d0
	move.w loc_08b85e(pc,d0.w),d1
	jmp loc_08b85e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b85e:
	dc.w loc_08b866-loc_08b85e
	dc.w loc_08b89c-loc_08b85e
	dc.w loc_08bba4-loc_08b85e
	dc.w loc_08bba4-loc_08b85e

;----------------------------------------------
loc_08b866:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$c0,($10,a6)
	moveq #0,d0
	movea.l #loc_2f407c,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08b89c:
	move.w ($44,a6),d0
	beq.b loc_08b8be
	add.w d0,($14,a6)
	move.w ($14,a6),d0
	subi.w #$20,d0
	cmpi.w #$d0,d0
	bhi.b loc_08b8be
	move.w ($4a,a6),($14,a6)
	clr.w ($44,a6)

loc_08b8be:
	jmp loc_01b4ec

;==============================================
loc_08b8c4:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b8d8(pc,d0.w),d1
	jmp loc_08b8d8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b8d8:
	dc.w loc_08b8e0-loc_08b8d8
	dc.w loc_08b6c4-loc_08b8d8
	dc.w loc_08bba4-loc_08b8d8
	dc.w loc_08bba4-loc_08b8d8

;----------------------------------------------
loc_08b8e0:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	moveq #$24,d0
	add.b (Dip_SFAlpha,a5),d0
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.w #$12,($10,a6)
	move.w #0,($14,a6)
	move.w ($34,a6),d0
	sub.w d0,($14,a6)
	move.w #1,($44,a6)
	rts

;==============================================
loc_08b930:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08b944(pc,d0.w),d1
	jmp loc_08b944(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b944:
	dc.w loc_08b94c-loc_08b944
	dc.w loc_08b9ca-loc_08b944
	dc.w loc_08bba4-loc_08b944
	dc.w loc_08bba4-loc_08b944

;----------------------------------------------
loc_08b94c:
	move.b (5,a6),d0
	move.w loc_08b958(pc,d0.w),d1
	jmp loc_08b958(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08b958:
	dc.w loc_08b95c-loc_08b958
	dc.w loc_08b9b8-loc_08b958

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08b95c:
	addq.b #2,(5,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b #$f,($3a,a6)
	moveq #$26,d0
	add.b (Dip_SFAlpha,a5),d0
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.w #0,($10,a6)
	move.w #$fff0,($14,a6)
	move.w ($34,a6),d0
	add.w d0,($14,a6)
	move.w #2,($40,a6)
	move.w #$ffff,($44,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08b9b8:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_08b9ca
	addq.b #2,(4,a6)

loc_08b9ca:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	cmpi.w #$fff0,($14,a6)
	bgt.b loc_08b9ee
	move.w ($34,a6),d0
	add.w d0,($14,a6)
	move.b #1,($32,a6)
	jsr loc_01b6b6

loc_08b9ee:
	jmp loc_01b4ec

;==============================================
loc_08b9f4:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08ba08(pc,d0.w),d1
	jmp loc_08ba08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ba08:
	dc.w loc_08ba10-loc_08ba08
	dc.w loc_08ba8e-loc_08ba08
	dc.w loc_08bba4-loc_08ba08
	dc.w loc_08bba4-loc_08ba08

;----------------------------------------------
loc_08ba10:
	move.b (5,a6),d0
	move.w loc_08ba1c(pc,d0.w),d1
	jmp loc_08ba1c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ba1c:
	dc.w loc_08ba20-loc_08ba1c
	dc.w loc_08ba7c-loc_08ba1c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08ba20:
	addq.b #2,(5,a6)
	move.b d0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b #$f,($3a,a6)
	moveq #$24,d0
	add.b (Dip_SFAlpha,a5),d0
	movea.l #loc_08bd92,a0
	jsr loc_01b6e0
	move.w #$180,($10,a6)
	move.w #0,($14,a6)
	move.w ($34,a6),d0
	sub.w d0,($14,a6)
	move.w #$fffe,($40,a6)
	move.w #$1,($44,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08ba7c:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_08ba8e
	addq.b #2,(4,a6)

loc_08ba8e:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	blt.b loc_08baac
	move.w ($34,a6),d0
	sub.w d0,($14,a6)
	move.b #1,($32,a6)
	jsr loc_01b6b6

loc_08baac:
	jmp loc_01b4ec

;==============================================
loc_08bab2:
	tst.b ($8c,a5)
	bne.w loc_08bba4
	move.b (4,a6),d0
	move.w loc_08bac6(pc,d0.w),d1
	jmp loc_08bac6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bac6:
	dc.w loc_08bace-loc_08bac6
	dc.w loc_08bb48-loc_08bac6
	dc.w loc_08bba4-loc_08bac6
	dc.w loc_08bba4-loc_08bac6

;----------------------------------------------
loc_08bace:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b #$f,($3a,a6)
	movea.w ($36,a6),a4
	move.w #$ff40,($10,a6)
	move.w #$18,($40,a6)
	jsr loc_084c5a
	beq.b loc_08bb1c
	move.w #$240,($10,a6)
	move.w #$ffe8,($40,a6)

loc_08bb1c:
	move.w #$c0,($14,a6)
	move.w #8,($44,a6)
	tst.b ($125,a4)
	beq.b loc_08bb3a
	move.w #$40,($14,a6)
	move.w #$fff8,($44,a6)

loc_08bb3a:
	moveq #$28,d0
	movea.l #loc_08bd92,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_08bb48:
	move.b (5,a6),d0
	move.w loc_08bb60(pc,d0.w),d1
	jsr loc_08bb60(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bb60:
	dc.w loc_08bb66-loc_08bb60
	dc.w loc_08bb80-loc_08bb60
	dc.w loc_08bb92-loc_08bb60

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08bb66:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_08bb7e
	addq.b #2,(5,a6)
	move.w #$c0,($10,a6)

loc_08bb7e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08bb80:
	tst.w ($112,a5)
	bne.b loc_08bb90
	addq.b #2,(5,a6)
	move.b #$b,($3a,a6)

loc_08bb90:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08bb92:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_08db02
	rts

;----------------------------------------------
loc_08bba4:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08bbaa:
	addq.b #2,(4,a6)
	rts

;##############################################
loc_08bbb0:
	movea.w ($13a,a5),a3
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_08bbd2
	btst #1,($101,a3)
	bne.b loc_08bbd2
	lea.l (p1memory,a5),a3
	tst.b ($144,a5)
	beq.b loc_08bbd2
	lea.l (p2memory,a5),a3

loc_08bbd2:
	cmpi.b #3,($6eb9,a5)
	bcs.w loc_08bc84
	jsr loc_01c2c8
	move.l #$1001200,(a4)
	move.w a3,($36,a4)
	jsr loc_01c2c8
	move.l #$1001202,(a4)
	jsr loc_01c2c8
	move.l #$1001208,(a4)
	move.w a3,($36,a4)
	tst.b ($b8,a5)
	bne.b loc_08bc3c
	cmpi.b #4,($6eb9,a5)
	bcs.w loc_08bc84
	jsr loc_01c2c8
	move.l #$1001206,(a4)
	tst.b ($141,a5)
	beq.b loc_08bc3c
	jsr loc_01c2c8
	move.l #$1001204,(a4)
	move.w a3,($36,a4)
	bra.b loc_08bc48

loc_08bc3c:
	jsr loc_01c2c8
	move.l #$100120c,(a4)

loc_08bc48:
	jsr loc_01c2c8
	move.l #$100120a,(a4)
	move.w #$110,($14,a4)
	move.w #$fffd,($44,a4)
	move.w #$f0,($4a,a4)
	jsr loc_01c2c8
	move.l #$100120a,(a4)
	move.w #0,($14,a4)
	move.w #3,($44,a4)
	move.w #$20,($4a,a4)

loc_08bc84:
	movea.l a3,a4
	bra.w loc_08bd36

;##############################################
loc_08bc8a:
	cmpi.b #7,($6eb9,a5)
	bcs.w loc_08bd32
	jsr loc_01c2c8
	move.l #$1001202,(a4)
	jsr loc_01c2c8
	move.l #$100120e,(a4)
	jsr loc_01c2c8
	move.l #$1001210,(a4)
	jsr loc_01c2c8
	move.l #$100120a,(a4)
	move.w #$110,($14,a4)
	move.w #$fffd,($44,a4)
	move.w #$f0,($4a,a4)
	jsr loc_01c2c8
	move.l #$100120a,(a4)
	move.w #0,($14,a4)
	move.w #3,($44,a4)
	move.w #$20,($4a,a4)
	lea.l (p1memory,a5),a1
	btst #0,(Active_Player_01,a5)
	bne.b loc_08bd04
	lea.l (p2memory,a5),a1

loc_08bd04:
	jsr loc_01c2c8
	move.l #$1000e04,(a4)
	move.w a1,($38,a4)
	jsr RNGFunction
	andi.b #3,d0
	move.b d0,($a,a4)
	jsr loc_01c2c8
	move.l #$1002310,(a4)
	move.w a1,($36,a4)

loc_08bd32:
	bra.w loc_08bd6a

;==============================================
loc_08bd36:
	moveq #0,d0
	move.b ($102,a4),d0
	lsl.w #2,d0
	movea.l #loc_351f14,a0
	movea.l (a0,d0.w),a0
	move.b ($132,a4),d0
	ext.w d0
	addq.w #1,d0
	add.w d0,d0
	add.b ($128,a4),d0
	lsl.w #8,d0
	lea.l (a0,d0.w),a0
	movea.l #MainpaletteDirect,a1
	moveq #7,d7
	jsr loc_01b7c0

loc_08bd6a:
	move.w (Char_Sel_PalID,a5),d0
	add.w d0,d0
	movea.l #loc_35fb34,a0
	adda.w loc_08bd88(pc,d0.w),a0
	movea.l #$90c360,a1
	moveq #3,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bd88:
	dc.w $0000,$0080,$0100,$0180,$0200

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bd92:
	dc.w loc_08bde6-loc_08bd92;54
	dc.w loc_08bdee-loc_08bd92;5c
	dc.w loc_08bdf6-loc_08bd92;64
	dc.w loc_08bdfe-loc_08bd92;6c
	dc.w loc_08be06-loc_08bd92;74
	dc.w loc_08be0e-loc_08bd92;7c
	dc.w loc_08be16-loc_08bd92;84
	dc.w loc_08be1e-loc_08bd92;8c

	dc.w loc_08be26-loc_08bd92;94
	dc.w loc_08be2e-loc_08bd92;9c
	dc.w loc_08be36-loc_08bd92;a4
	dc.w loc_08be3e-loc_08bd92;ac
	dc.w loc_08be46-loc_08bd92;b4
	dc.w loc_08be4e-loc_08bd92;bc
	dc.w loc_08be56-loc_08bd92;c4
	dc.w loc_08be5e-loc_08bd92;cc

	dc.w loc_08be66-loc_08bd92;d4
	dc.w loc_08be6e-loc_08bd92;dc
	dc.w loc_08be76-loc_08bd92;e4
	dc.w loc_08be7e-loc_08bd92;ec
	dc.w loc_08be86-loc_08bd92;f4
	dc.w loc_08be8e-loc_08bd92;fc
	dc.w loc_08be96-loc_08bd92;104
	dc.w loc_08be9e-loc_08bd92;10c

	dc.w loc_08bea6-loc_08bd92;114
	dc.w loc_08beae-loc_08bd92;11c
	dc.w loc_08beb6-loc_08bd92;124
	dc.w loc_08bebe-loc_08bd92;12c
	dc.w loc_08bec6-loc_08bd92;134
	dc.w loc_08bece-loc_08bd92;13c
	dc.w loc_08bed6-loc_08bd92;144
	dc.w loc_08bed6-loc_08bd92;144

	dc.w loc_08bede-loc_08bd92;14c
	dc.w loc_08bee6-loc_08bd92;154
	dc.w loc_08beee-loc_08bd92;15c
	dc.w loc_08bef6-loc_08bd92;164
	dc.w loc_08befe-loc_08bd92;16c
	dc.w loc_08bf72-loc_08bd92;1e0
	dc.w loc_08bfe6-loc_08bd92;254
	dc.w loc_08c05a-loc_08bd92;2c8


	dc.w loc_08c0ce-loc_08bd92;33c
	dc.w $0000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bde6:
	dc.w $0140,$0048
	dc.l loc_08c0e2

loc_08bdee:
	dc.w $0140,$0048
	dc.l loc_08c13c

loc_08bdf6:
	dc.w $0140,$0058
	dc.l loc_08c2a4

loc_08bdfe:
	dc.w $0140,$0050
	dc.l loc_08c30e

loc_08be06:
	dc.w $0140,$0068
	dc.l loc_08c9a8

loc_08be0e:
	dc.w $0140,$0050
	dc.l loc_08c37c

loc_08be16:
	dc.w $0140,$0058
	dc.l loc_08c3ea

loc_08be1e:
	dc.w $0140,$0048
	dc.l loc_08c196

loc_08be26:
	dc.w $0140,$0060
	dc.l loc_08c454

loc_08be2e:
	dc.w $0140,$0050
	dc.l loc_08c4ce

loc_08be36:
	dc.w $0140,$0050
	dc.l loc_08c53c

loc_08be3e:
	dc.w $0140,$0058
	dc.l loc_08c5aa

loc_08be46:
	dc.w $0140,$0048
	dc.l loc_08c1f0

loc_08be4e:
	dc.w $0140,$0060
	dc.l loc_08c614

loc_08be56:
	dc.w $0140,$0068
	dc.l loc_08ca32

loc_08be5e:
	dc.w $0140,$0068
	dc.l loc_08cabc

loc_08be66:
	dc.w $0140,$0068
	dc.l loc_08cb46

loc_08be6e:
	dc.w $0140,$0048
	dc.l loc_08c24a

loc_08be76:
	dc.w $0140,$0058
	dc.l loc_08c68e

loc_08be7e:
	dc.w $0140,$0068
	dc.l loc_08cbd0

loc_08be86:
	dc.w $0140,$0060
	dc.l loc_08c6f8

loc_08be8e:
	dc.w $0140,$0060
	dc.l loc_08c772

loc_08be96:
	dc.w $0140,$0050
	dc.l loc_08c7ec

loc_08be9e:
	dc.w $0140,$0060
	dc.l loc_08c85a

loc_08bea6:
	dc.w $0140,$0058
	dc.l loc_08c8d4

loc_08beae:
	dc.w $0140,$0068
	dc.l loc_08cc5a

loc_08beb6:
	dc.w $0140,$0068
	dc.l loc_08cce4
loc_08beba
loc_08bebe:
	dc.w $0140,$0058
	dc.l loc_08c93e

loc_08bec6:
	dc.w $0140,$0050
	dc.l loc_08cd6e

loc_08bece:
	dc.w $0140,$0050
	dc.l loc_08cddc

loc_08bed6:
	dc.w $0140,$0080
	dc.l loc_08ce4a

loc_08bede:
	dc.w $0140,$00d0
	dc.l loc_08cecc

loc_08bee6:
	dc.w $0140,$00b0
	dc.l loc_08cf0a

loc_08beee:
	dc.w $0140,$00e0
	dc.l loc_08cf50

loc_08bef6:
	dc.w $0140,$00f0
	dc.l unk_ff3622


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08befe:
	dc.w $0100,$0010
	dc.l loc_08cfb6
	dc.w $0100,$0010
	dc.l loc_08cff4
	dc.w $0100,$0010
	dc.l loc_08d032
	dc.w $0100,$0010
	dc.l loc_08d070
	dc.w $0100,$0010
	dc.l loc_08d0ae
	dc.w $0100,$0010
	dc.l loc_08d0ec
	dc.w $0100,$0010
	dc.l loc_08d12a
	dc.w $0100,$0010
	dc.l loc_08d168
	dc.w $0100,$0010
	dc.l loc_08d1a6
	dc.w $0100,$0010
	dc.l loc_08d1e4
	dc.w $0100,$0010
	dc.l loc_08d222
	dc.w $0100,$0010
	dc.l loc_08d260
	dc.w $0100,$0010
	dc.l loc_08d29e
	dc.w $0180,$0010
	dc.l loc_08d2dc
	dc.l loc_08befe

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bf72:
	dc.w $0100,$0010
	dc.l loc_08d31a
	dc.w $0100,$0010
	dc.l loc_08d358
	dc.w $0100,$0010
	dc.l loc_08d396
	dc.w $0100,$0010
	dc.l loc_08d3d4
	dc.w $0100,$0010
	dc.l loc_08d412
	dc.w $0100,$0010
	dc.l loc_08d450
	dc.w $0100,$0010
	dc.l loc_08d48e
	dc.w $0100,$0010
	dc.l loc_08d4cc
	dc.w $0100,$0010
	dc.l loc_08d50a
	dc.w $0100,$0010
	dc.l loc_08d548
	dc.w $0100,$0010
	dc.l loc_08d586
	dc.w $0100,$0010
	dc.l loc_08d5c4
	dc.w $0100,$0010
	dc.l loc_08d602
	dc.w $0180,$0010
	dc.l loc_08d640
	dc.l loc_08bf72

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08bfe6:
	dc.w $0100,$0010
	dc.l loc_08cfb6
	dc.w $0100,$0010
	dc.l loc_08d2dc
	dc.w $0100,$0010
	dc.l loc_08d29e
	dc.w $0100,$0010
	dc.l loc_08d260
	dc.w $0100,$0010
	dc.l loc_08d222
	dc.w $0100,$0010
	dc.l loc_08d1e4
	dc.w $0100,$0010
	dc.l loc_08d1a6
	dc.w $0100,$0010
	dc.l loc_08d168
	dc.w $0100,$0010
	dc.l loc_08d12a
	dc.w $0100,$0010
	dc.l loc_08d0ec
	dc.w $0100,$0010
	dc.l loc_08d0ae
	dc.w $0100,$0010
	dc.l loc_08d070
	dc.w $0100,$0010
	dc.l loc_08d032
	dc.w $0180,$0010
	dc.l loc_08cff4
	dc.l loc_08bfe6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c05a:
	dc.w $0100,$0010
	dc.l loc_08d31a
	dc.w $0100,$0010
	dc.l loc_08d640
	dc.w $0100,$0010
	dc.l loc_08d602
	dc.w $0100,$0010
	dc.l loc_08d5c4
	dc.w $0100,$0010
	dc.l loc_08d586
	dc.w $0100,$0010
	dc.l loc_08d548
	dc.w $0100,$0010
	dc.l loc_08d50a
	dc.w $0100,$0010
	dc.l loc_08d4cc
	dc.w $0100,$0010
	dc.l loc_08d48e
	dc.w $0100,$0010
	dc.l loc_08d450
	dc.w $0100,$0010
	dc.l loc_08d412
	dc.w $0100,$0010
	dc.l loc_08d3d4
	dc.w $0100,$0010
	dc.l loc_08d396
	dc.w $0180,$0010
	dc.l loc_08d358
	dc.l loc_08c05a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c0ce:
	dc.w $0100,$0010
	dc.l loc_08d6aa
	dc.w $0180,$0010
	dc.l loc_08d6e0
	dc.l loc_08c0ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c0e2:
	dc.w $000c,$001e,$0013
	dc.l loc_08d716
	dc.w $091f,$201c,$01cb,$001d,$01d2,$001d,$01ce,$001d
	dc.w $091f,$201c,$01cb,$001d,$01d2,$001d,$01ce,$001d
	dc.w $091f,$201c,$01cb,$001d,$01d2,$001d,$01ce,$001d
	dc.w $091f,$201c,$01cb,$001d,$01d2,$001d,$01ce,$001d
	dc.w $091f,$201c,$01cb,$001d,$01d2,$001d,$01ce,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c13c:
	dc.w $000c,$001e,$0013
	dc.l loc_08d716
	dc.w $091f,$201c,$01c4,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01be,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c196:
	dc.w $000c,$001e,$0013
	dc.l loc_08d716
	dc.w $091f,$201c,$01c0,$001d,$01ce,$001d,$01d2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01ce,$001d,$01d2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01ce,$001d,$01d2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01ce,$001d,$01d2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01ce,$001d,$01d2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c1f0:
	dc.w $000c,$001e,$0013
	dc.l loc_08d716
	dc.w $091f,$201c,$01bd,$001d,$01ba,$001d,$01c7,$001d
	dc.w $091f,$201c,$01bd,$001d,$01ba,$001d,$01c7,$001d
	dc.w $091f,$201c,$01bd,$001d,$01ba,$001d,$01c7,$001d
	dc.w $091f,$201c,$01bd,$001d,$01ba,$001d,$01c7,$001d
	dc.w $091f,$201c,$01bd,$001d,$01ba,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c24a:
	dc.w $000c,$001e,$0013
	dc.l loc_08d716
	dc.w $091f,$201c,$01c0,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c0,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c0,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c0,$001d,$01be,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c0,$001d,$01be,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c2a4:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01c0,$001d,$01c8,$001d,$01ce,$001d,$01c4,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01c8,$001d,$01ce,$001d,$01c4,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01c8,$001d,$01ce,$001d,$01c4,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c0,$001d,$01c8,$001d,$01ce,$001d,$01c4,$001d,$01c2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c30e:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01c7,$001d,$01ba,$001d,$01cc,$001d,$01c1,$001d
	dc.w $091f,$201c,$01c7,$001d,$01ba,$001d,$01cc,$001d,$01c1,$001d
	dc.w $091f,$201c,$01c7,$001d,$01ba,$001d,$01cc,$001d,$01c1,$001d
	dc.w $091f,$201c,$01c7,$001d,$01ba,$001d,$01cc,$001d,$01c1,$001d
	dc.w $091f,$201c,$01c7,$001d,$01ba,$001d,$01cc,$001d,$01c1,$001d


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c37c:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01ba,$001d,$01bd,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01ba,$001d,$01bd,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01ba,$001d,$01bd,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01ba,$001d,$01bd,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01ba,$001d,$01bd,$001d,$01c8,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c3ea:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01cc,$001d,$01c8,$001d,$01bd,$001d,$01c8,$001d,$01c6,$001d
	dc.w $091f,$201c,$01cc,$001d,$01c8,$001d,$01bd,$001d,$01c8,$001d,$01c6,$001d
	dc.w $091f,$201c,$01cc,$001d,$01c8,$001d,$01bd,$001d,$01c8,$001d,$01c6,$001d
	dc.w $091f,$201c,$01cc,$001d,$01c8,$001d,$01bd,$001d,$01c8,$001d,$01c6,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c454:
	dc.w $000c,$0024,$001b
	dc.l loc_08d912
	dc.w $091f,$201c,$01bb,$001d,$01c2,$001d,$01cb,$001d,$01bd,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c2,$001d,$01cb,$001d,$01bd,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c2,$001d,$01cb,$001d,$01bd,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c2,$001d,$01cb,$001d,$01bd,$001d,$01c2,$001d,$01be,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c4ce:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01cc,$001d,$01be,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01cc,$001d,$01be,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01cc,$001d,$01be,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01cc,$001d,$01be,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01cc,$001d,$01be,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c53c:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01cf,$001d,$01be,$001d,$01c0,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cf,$001d,$01be,$001d,$01c0,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cf,$001d,$01be,$001d,$01c0,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cf,$001d,$01be,$001d,$01c0,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cf,$001d,$01be,$001d,$01c0,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c5aa:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c0,$001d,$01ba,$001d,$01cd,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c0,$001d,$01ba,$001d,$01cd,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c0,$001d,$01ba,$001d,$01cd,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c0,$001d,$01ba,$001d,$01cd,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c614:
	dc.w $000c,$0024,$001b
	dc.l loc_08d912
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c4
	dc.w $001d,$01ce,$001d,$01cb,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c4
	dc.w $001d,$01ce,$001d,$01cb,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c4
	dc.w $001d,$01ce,$001d,$01cb,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cc,$001d,$01ba,$001d,$01c4
	dc.w $001d,$01ce,$001d,$01cb,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c68e:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01bc,$001d,$01ba,$001d,$01c6,$001d,$01c6,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01ba,$001d,$01c6,$001d,$01c6,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01ba,$001d,$01c6,$001d,$01c6,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01ba,$001d,$01c6,$001d,$01c6,$001d,$01d2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c6f8:
	dc.w $000c,$0024,$001b
	dc.l loc_08d912
	dc.w $091f,$201c,$01bb,$001d,$01c5,$001d,$01ba,$001d,$01c7,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c5,$001d,$01ba,$001d,$01c7,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c5,$001d,$01ba,$001d,$01c7,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01bb,$001d,$01c5,$001d,$01ba,$001d,$01c7,$001d,$01c4,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c772:
	dc.w $000c,$001b,$001b
	dc.l loc_08d8a2
	dc.w $091f,$201c,$01cb,$001d,$0199,$001d,$01c6,$001d,$01c2,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cb,$001d,$0199,$001d,$01c6,$001d,$01c2,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cb,$001d,$0199,$001d,$01c6,$001d,$01c2,$001d,$01c4,$001d,$01ba,$001d
	dc.w $091f,$201c,$01cb,$001d,$0199,$001d,$01c6,$001d,$01c2,$001d,$01c4,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c7ec:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01bc,$001d,$01c8,$001d,$01bd,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c8,$001d,$01bd,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c8,$001d,$01bd,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c8,$001d,$01bd,$001d,$01d2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c8,$001d,$01bd,$001d,$01d2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c85a:
	dc.w $000c,$0024,$001b
	dc.l loc_08d912
	dc.w $091f,$201c,$01bb,$001d,$01ba,$001d,$01c5,$001d,$01cb,$001d,$01c8,$001d,$01c0,$001d
	dc.w $091f,$201c,$01bb,$001d,$01ba,$001d,$01c5,$001d,$01cb,$001d,$01c8,$001d,$01c0,$001d
	dc.w $091f,$201c,$01bb,$001d,$01ba,$001d,$01c5,$001d,$01cb,$001d,$01c8,$001d,$01c0,$001d
	dc.w $091f,$201c,$01bb,$001d,$01ba,$001d,$01c5,$001d,$01cb,$001d,$01c8,$001d,$01c0,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c8d4:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01c4,$001d,$01ba,$001d,$01cb,$001d,$01c2,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01ba,$001d,$01cb,$001d,$01c2,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01ba,$001d,$01cb,$001d,$01c2,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c4,$001d,$01ba,$001d,$01cb,$001d,$01c2,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c93e:
	dc.w $000c,$0020,$0017
	dc.l loc_08d842
	dc.w $091f,$201c,$01ba,$001d,$01c4,$001d,$01ce,$001d,$01c6,$001d,$01ba,$001d
	dc.w $091f,$201c,$01ba,$001d,$01c4,$001d,$01ce,$001d,$01c6,$001d,$01ba,$001d
	dc.w $091f,$201c,$01ba,$001d,$01c4,$001d,$01ce,$001d,$01c6,$001d,$01ba,$001d
	dc.w $091f,$201c,$01ba,$001d,$01c4,$001d,$01ce,$001d,$01c6,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08c9a8:
	dc.w $000c,$0028,$001f
	dc.l loc_08d982
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ce,$001d,$01c7,$001d,$0199,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ce,$001d,$01c7,$001d,$0199,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ce,$001d,$01c7,$001d,$0199,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ce,$001d,$01c7,$001d,$0199,$001d,$01c5,$001d,$01c2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ca32:
	dc.w $000c,$0028,$001f
	dc.l loc_08da02
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01c5,$001d,$01be,$001d,$01c7,$001d,$01cd,$001d,$01c8,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01c5,$001d,$01be,$001d,$01c7,$001d,$01cd,$001d,$01c8,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01c5,$001d,$01be,$001d,$01c7,$001d,$01cd,$001d,$01c8,$001d
	dc.w $091f,$201c,$01cb,$001d,$01c8,$001d,$01c5,$001d,$01be,$001d,$01c7,$001d,$01cd,$001d,$01c8,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cabc:
	dc.w $000c,$0028,$001f
	dc.l loc_08da02
	dc.w $091f,$201c,$01bd,$001d,$01c1,$001d,$01ba,$001d,$01c5,$001d,$01cc,$001d,$01c2,$001d,$01c6,$001d
	dc.w $091f,$201c,$01bd,$001d,$01c1,$001d,$01ba,$001d,$01c5,$001d,$01cc,$001d,$01c2,$001d,$01c6,$001d
	dc.w $091f,$201c,$01bd,$001d,$01c1,$001d,$01ba,$001d,$01c5,$001d,$01cc,$001d,$01c2,$001d,$01c6,$001d
	dc.w $091f,$201c,$01bd,$001d,$01c1,$001d,$01ba,$001d,$01c5,$001d,$01cc,$001d,$01c2,$001d,$01c6,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cb46:
	dc.w $000c,$0028,$001f
	dc.l loc_08da02
	dc.w $091f,$201c,$01d3,$001d,$01ba,$001d,$01c7,$001d,$01c0,$001d,$01c2,$001d,$01be,$001d,$01bf,$001d
	dc.w $091f,$201c,$01d3,$001d,$01ba,$001d,$01c7,$001d,$01c0,$001d,$01c2,$001d,$01be,$001d,$01bf,$001d
	dc.w $091f,$201c,$01d3,$001d,$01ba,$001d,$01c7,$001d,$01c0,$001d,$01c2,$001d,$01be,$001d,$01bf,$001d
	dc.w $091f,$201c,$01d3,$001d,$01ba,$001d,$01c7,$001d,$01c0,$001d,$01c2,$001d,$01be,$001d,$01bf,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cbd0:
	dc.w $000c,$0028,$001f
	dc.l loc_08da82
	dc.w $091f,$201c,$01be,$001d,$0199,$001d,$01c1,$001d,$01c8,$001d,$01c7,$001d,$01bd,$001d,$01ba,$001d
	dc.w $091f,$201c,$01be,$001d,$0199,$001d,$01c1,$001d,$01c8,$001d,$01c7,$001d,$01bd,$001d,$01ba,$001d
	dc.w $091f,$201c,$01be,$001d,$0199,$001d,$01c1,$001d,$01c8,$001d,$01c7,$001d,$01bd,$001d,$01ba,$001d
	dc.w $091f,$201c,$01be,$001d,$0199,$001d,$01c1,$001d,$01c8,$001d,$01c7,$001d,$01bd,$001d,$01ba,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cc5a:
	dc.w $000c,$0028,$001f
	dc.l loc_08da82
	dc.w $091f,$201c,$01c6,$001d,$0199,$001d,$01bb,$001d,$01c2,$001d,$01cc,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c6,$001d,$0199,$001d,$01bb,$001d,$01c2,$001d,$01cc,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c6,$001d,$0199,$001d,$01bb,$001d,$01c2,$001d,$01cc,$001d,$01c8,$001d,$01c7,$001d
	dc.w $091f,$201c,$01c6,$001d,$0199,$001d,$01bb,$001d,$01c2,$001d,$01cc,$001d,$01c8,$001d,$01c7,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cce4:
	dc.w $000c,$0028,$001f
	dc.l loc_08da02
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ba,$001d,$01cb,$001d,$01c5,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ba,$001d,$01cb,$001d,$01c5,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ba,$001d,$01cb,$001d,$01c5,$001d,$01c2,$001d,$01be,$001d
	dc.w $091f,$201c,$01bc,$001d,$01c1,$001d,$01ba,$001d,$01cb,$001d,$01c5,$001d,$01c2,$001d,$01be,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cd6e:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c5,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c5,$001d,$01c2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cddc:
	dc.w $000c,$0023,$0018
	dc.l loc_08d766
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d,$01ce,$001d,$01c7,$001d,$01c2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ce4a:
	dc.w $000c,$0024,$001d
	dc.l loc_08d7ca
	dc.w $091f,$201c,$01c3,$001d
	dc.w $01ce,$001d,$01c5,$001d
	dc.w $01c2,$001d,$2a04,$001d
	dc.w $01c3,$001d,$01ce,$001d
	dc.w $01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d
	dc.w $01ce,$001d,$01c5,$001d
	dc.w $01c2,$001d,$2a04,$001d
	dc.w $01c3,$001d,$01ce,$001d
	dc.w $01c7,$001d,$01c2,$001d
	dc.w $091f,$201c,$01c3,$001d
	dc.w $01ce,$001d,$01c5,$001d
	dc.w $01c2,$001d,$2a04,$001d
	dc.w $01c3,$001d,$01ce,$001d
	dc.w $01c7,$001d,$01c2,$001d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cecc:
	dc.w $0008,$001d,$0006
	dc.w $08f8,$201c,$fff8,$ff00
	dc.w $0926,$301c,$fff8,$ff30
	dc.w $0927,$301c,$fff8,$ff70
	dc.w $08d8,$401c,$fff8,$ffb0
	dc.w $0926,$301c,$fff8,$0000
	dc.w $0927,$301c,$fff8,$0040
	dc.w $08d8,$401c,$fff8,$0080

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cf0a:
	dc.w $0008,$001b,$0007
	dc.w $08f9,$001c,$fff8,$ff00
	dc.w $0909,$301c,$fff8,$ff10
	dc.w $0928,$301c,$fff8,$ff50
	dc.w $08d9,$201c,$fff8,$ff90
	dc.w $0909,$301c,$fff8,$ffc0
	dc.w $0928,$301c,$fff8,$0000
	dc.w $08d9,$201c,$fff8,$0040
	dc.w $0909,$301c,$fff8,$0070

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cf50:
	dc.w $0008,$003c,$000b
	dc.w $08e6,$011b,$fff0,$fe20
	dc.w $0916,$011b,$fff0,$fe30
	dc.w $08d0,$711b,$fff0,$fe40
	dc.w $08d2,$011b,$fff0,$fec0
	dc.w $0950,$111b,$fff0,$fed0
	dc.w $08d6,$111b,$fff0,$fef0
	dc.w $0916,$011b,$fff0,$ff10
	dc.w $08d0,$711b,$fff0,$ff20
	dc.w $08d2,$011b,$fff0,$ffa0
	dc.w $0950,$111b,$fff0,$ffb0
	dc.w $08d6,$111b,$fff0,$ffd0
	dc.w $0916,$011b,$fff0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08cfb6:
	dc.w $0008,$001e,$0006
	dc.w $28a0,$211b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff30
	dc.w $28a4,$111b,$fff0,$ff60
	dc.w $28a6,$111b,$fff0,$ff80
	dc.w $28a8,$111b,$fff0,$ffa0
	dc.w $28aa,$111b,$fff0,$ffc0
	dc.w $28a0,$011b,$fff0,$ffe0

loc_08cff4:
	dc.w $0008,$001e,$0006
	dc.w $28b0,$111b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff20
	dc.w $28a4,$111b,$fff0,$ff50
	dc.w $28a6,$111b,$fff0,$ff70
	dc.w $28a8,$111b,$fff0,$ff90
	dc.w $28aa,$111b,$fff0,$ffb0
	dc.w $28a0,$111b,$fff0,$ffd0

loc_08d032:
	dc.w $0008,$001e,$0006
	dc.w $28c0,$011b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff10
	dc.w $28a4,$111b,$fff0,$ff40
	dc.w $28a6,$111b,$fff0,$ff60
	dc.w $28a8,$111b,$fff0,$ff80
	dc.w $28aa,$111b,$fff0,$ffa0
	dc.w $28a0,$211b,$fff0,$ffc0

loc_08d070:
	dc.w $0008,$001e,$0006
	dc.w $28a2,$211b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff30
	dc.w $28a6,$111b,$fff0,$ff50
	dc.w $28a8,$111b,$fff0,$ff70
	dc.w $28aa,$111b,$fff0,$ff90
	dc.w $28a0,$211b,$fff0,$ffb0
	dc.w $28a2,$011b,$fff0,$ffe0

loc_08d0ae:
	dc.w $0008,$001e,$0006
	dc.w $28b2,$111b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff20
	dc.w $28a6,$111b,$fff0,$ff40
	dc.w $28a8,$111b,$fff0,$ff60
	dc.w $28aa,$111b,$fff0,$ff80
	dc.w $28a0,$211b,$fff0,$ffa0
	dc.w $28a2,$111b,$fff0,$ffd0

loc_08d0ec:
	dc.w $0008,$001e,$0006
	dc.w $28c2,$011b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff10
	dc.w $28a6,$111b,$fff0,$ff30
	dc.w $28a8,$111b,$fff0,$ff50
	dc.w $28aa,$111b,$fff0,$ff70
	dc.w $28a0,$211b,$fff0,$ff90
	dc.w $28a2,$211b,$fff0,$ffc0

loc_08d12a:
	dc.w $0008,$001e,$0006
	dc.w $28a4,$111b,$fff0,$ff00
	dc.w $28a6,$111b,$fff0,$ff20
	dc.w $28a8,$111b,$fff0,$ff40
	dc.w $28aa,$111b,$fff0,$ff60
	dc.w $28a0,$211b,$fff0,$ff80
	dc.w $28a2,$211b,$fff0,$ffb0
	dc.w $28a4,$011b,$fff0,$ffe0

loc_08d168:
	dc.w $0008,$001e,$0006
	dc.w $28b4,$011b,$fff0,$ff00
	dc.w $28a6,$111b,$fff0,$ff10
	dc.w $28a8,$111b,$fff0,$ff30
	dc.w $28aa,$111b,$fff0,$ff50
	dc.w $28a0,$211b,$fff0,$ff70
	dc.w $28a2,$211b,$fff0,$ffa0
	dc.w $28a4,$111b,$fff0,$ffd0

loc_08d1a6:
	dc.w $0008,$001e,$0006
	dc.w $28a6,$111b,$fff0,$ff00
	dc.w $28a8,$111b,$fff0,$ff20
	dc.w $28aa,$111b,$fff0,$ff40
	dc.w $28a0,$211b,$fff0,$ff60
	dc.w $28a2,$211b,$fff0,$ff90
	dc.w $28a4,$111b,$fff0,$ffc0
	dc.w $28a6,$011b,$fff0,$ffe0

loc_08d1e4:
	dc.w $0008,$001e,$0006
	dc.w $28b6,$011b,$fff0,$ff00
	dc.w $28a8,$111b,$fff0,$ff10
	dc.w $28aa,$111b,$fff0,$ff30
	dc.w $28a0,$211b,$fff0,$ff50
	dc.w $28a2,$211b,$fff0,$ff80
	dc.w $28a4,$111b,$fff0,$ffb0
	dc.w $28a6,$111b,$fff0,$ffd0

loc_08d222:
	dc.w $0008,$001e,$0006
	dc.w $28a8,$111b,$fff0,$ff00
	dc.w $28aa,$111b,$fff0,$ff20
	dc.w $28a0,$211b,$fff0,$ff40
	dc.w $28a2,$211b,$fff0,$ff70
	dc.w $28a4,$111b,$fff0,$ffa0
	dc.w $28a6,$111b,$fff0,$ffc0
	dc.w $28a8,$011b,$fff0,$ffe0

loc_08d260:
	dc.w $0008,$001e,$0006
	dc.w $28b8,$011b,$fff0,$ff00
	dc.w $28aa,$111b,$fff0,$ff10
	dc.w $28a0,$211b,$fff0,$ff30
	dc.w $28a2,$211b,$fff0,$ff60
	dc.w $28a4,$111b,$fff0,$ff90
	dc.w $28a6,$111b,$fff0,$ffb0
	dc.w $28a8,$111b,$fff0,$ffd0

loc_08d29e:
	dc.w $0008,$001e,$0006
	dc.w $28aa,$111b,$fff0,$ff00
	dc.w $28a0,$211b,$fff0,$ff20
	dc.w $28a2,$211b,$fff0,$ff50
	dc.w $28a4,$111b,$fff0,$ff80
	dc.w $28a6,$111b,$fff0,$ffa0
	dc.w $28a8,$111b,$fff0,$ffc0
	dc.w $28aa,$011b,$fff0,$ffe0

loc_08d2dc:
	dc.w $0008,$001e,$0006
	dc.w $28ba,$011b,$fff0,$ff00
	dc.w $28a0,$211b,$fff0,$ff10
	dc.w $28a2,$211b,$fff0,$ff40
	dc.w $28a4,$111b,$fff0,$ff70
	dc.w $28a6,$111b,$fff0,$ff90
	dc.w $28a8,$111b,$fff0,$ffb0
	dc.w $28aa,$111b,$fff0,$ffd0

loc_08d31a:
	dc.w $0008,$001e,$0006
	dc.w $28a0,$211b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff30
	dc.w $28a4,$111b,$fff0,$ff60
	dc.w $28a6,$111b,$fff0,$ff80
	dc.w $28ac,$111b,$fff0,$ffa0
	dc.w $28ae,$111b,$fff0,$ffc0
	dc.w $28a0,$011b,$fff0,$ffe0

loc_08d358:
	dc.w $0008,$001e,$0006
	dc.w $28b0,$111b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff20
	dc.w $28a4,$111b,$fff0,$ff50
	dc.w $28a6,$111b,$fff0,$ff70
	dc.w $28ac,$111b,$fff0,$ff90
	dc.w $28ae,$111b,$fff0,$ffb0
	dc.w $28a0,$111b,$fff0,$ffd0

loc_08d396:
	dc.w $0008,$001e,$0006
	dc.w $28c0,$011b,$fff0,$ff00
	dc.w $28a2,$211b,$fff0,$ff10
	dc.w $28a4,$111b,$fff0,$ff40
	dc.w $28a6,$111b,$fff0,$ff60
	dc.w $28ac,$111b,$fff0,$ff80
	dc.w $28ae,$111b,$fff0,$ffa0
	dc.w $28a0,$211b,$fff0,$ffc0

loc_08d3d4:
	dc.w $0008,$001e,$0006
	dc.w $28a2,$211b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff30
	dc.w $28a6,$111b,$fff0,$ff50
	dc.w $28ac,$111b,$fff0,$ff70
	dc.w $28ae,$111b,$fff0,$ff90
	dc.w $28a0,$211b,$fff0,$ffb0
	dc.w $28a2,$011b,$fff0,$ffe0

loc_08d412:
	dc.w $0008,$001e,$0006
	dc.w $28b2,$111b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff20
	dc.w $28a6,$111b,$fff0,$ff40
	dc.w $28ac,$111b,$fff0,$ff60
	dc.w $28ae,$111b,$fff0,$ff80
	dc.w $28a0,$211b,$fff0,$ffa0
	dc.w $28a2,$111b,$fff0,$ffd0

loc_08d450:
	dc.w $0008,$001e,$0006
	dc.w $28c2,$011b,$fff0,$ff00
	dc.w $28a4,$111b,$fff0,$ff10
	dc.w $28a6,$111b,$fff0,$ff30
	dc.w $28ac,$111b,$fff0,$ff50
	dc.w $28ae,$111b,$fff0,$ff70
	dc.w $28a0,$211b,$fff0,$ff90
	dc.w $28a2,$211b,$fff0,$ffc0

loc_08d48e:
	dc.w $0008,$001e,$0006
	dc.w $28a4,$111b,$fff0,$ff00
	dc.w $28a6,$111b,$fff0,$ff20
	dc.w $28ac,$111b,$fff0,$ff40
	dc.w $28ae,$111b,$fff0,$ff60
	dc.w $28a0,$211b,$fff0,$ff80
	dc.w $28a2,$211b,$fff0,$ffb0
	dc.w $28a4,$011b,$fff0,$ffe0

loc_08d4cc:
	dc.w $0008,$001e,$0006
	dc.w $28b4,$011b,$fff0,$ff00
	dc.w $28a6,$111b,$fff0,$ff10
	dc.w $28ac,$111b,$fff0,$ff30
	dc.w $28ae,$111b,$fff0,$ff50
	dc.w $28a0,$211b,$fff0,$ff70
	dc.w $28a2,$211b,$fff0,$ffa0
	dc.w $28a4,$111b,$fff0,$ffd0

loc_08d50a:
	dc.w $0008,$001e,$0006
	dc.w $28a6,$111b,$fff0,$ff00
	dc.w $28ac,$111b,$fff0,$ff20
	dc.w $28ae,$111b,$fff0,$ff40
	dc.w $28a0,$211b,$fff0,$ff60
	dc.w $28a2,$211b,$fff0,$ff90
	dc.w $28a4,$111b,$fff0,$ffc0
	dc.w $28a6,$011b,$fff0,$ffe0

loc_08d548:
	dc.w $0008,$001e,$0006
	dc.w $28b6,$011b,$fff0,$ff00
	dc.w $28ac,$111b,$fff0,$ff10
	dc.w $28ae,$111b,$fff0,$ff30
	dc.w $28a0,$211b,$fff0,$ff50
	dc.w $28a2,$211b,$fff0,$ff80
	dc.w $28a4,$111b,$fff0,$ffb0
	dc.w $28a6,$111b,$fff0,$ffd0

loc_08d586:
	dc.w $0008,$001e,$0006
	dc.w $28ac,$111b,$fff0,$ff00
	dc.w $28ae,$111b,$fff0,$ff20
	dc.w $28a0,$211b,$fff0,$ff40
	dc.w $28a2,$211b,$fff0,$ff70
	dc.w $28a4,$111b,$fff0,$ffa0
	dc.w $28a6,$111b,$fff0,$ffc0
	dc.w $28ac,$011b,$fff0,$ffe0

loc_08d5c4:
	dc.w $0008,$001e,$0006
	dc.w $28bc,$011b,$fff0,$ff00
	dc.w $28ae,$111b,$fff0,$ff10
	dc.w $28a0,$211b,$fff0,$ff30
	dc.w $28a2,$211b,$fff0,$ff60
	dc.w $28a4,$111b,$fff0,$ff90
	dc.w $28a6,$111b,$fff0,$ffb0
	dc.w $28ac,$111b,$fff0,$ffd0

loc_08d602:
	dc.w $0008,$001e,$0006
	dc.w $28ae,$111b,$fff0,$ff00
	dc.w $28a0,$211b,$fff0,$ff20
	dc.w $28a2,$211b,$fff0,$ff50
	dc.w $28a4,$111b,$fff0,$ff80
	dc.w $28a6,$111b,$fff0,$ffa0
	dc.w $28ac,$111b,$fff0,$ffc0
	dc.w $28ae,$011b,$fff0,$ffe0

loc_08d640:
	dc.w $0008,$001e,$0006
	dc.w $28be,$011b,$fff0,$ff00
	dc.w $28a0,$211b,$fff0,$ff10
	dc.w $28a2,$211b,$fff0,$ff40
	dc.w $28a4,$111b,$fff0,$ff70
	dc.w $28a6,$111b,$fff0,$ff90
	dc.w $28ac,$111b,$fff0,$ffb0
	dc.w $28ae,$111b,$fff0,$ffd0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d67e:
	dc.w $fff0,$fe10,$fff0,$fe20
	dc.w $fff0,$feb0,$fff0,$fed0
	dc.w $fff0,$ff10,$fff0,$ffa0
	dc.w $fff0,$ffc0,$fff0,$fea0
	dc.w $0000,$fea0,$fff0,$ff90
	dc.w $0000,$ff90

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d6aa:
	dc.w $0008,$0048,$0005
	dc.w $25c4,$231f,$ff40,$ffe0
	dc.w $25c4,$231f,$ff80,$ffe0
	dc.w $25c4,$231f,$ffc0,$ffe0
	dc.w $25c4,$231f,$0000,$ffe0
	dc.w $25c4,$231f,$0040,$ffe0
	dc.w $25c4,$231f,$0080,$ffe0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d6e0:
	dc.w $0008,$0048,$0005
	dc.w $25c4,$233f,$ff40,$ffe0
	dc.w $25c4,$233f,$ff80,$ffe0
	dc.w $25c4,$233f,$ffc0,$ffe0
	dc.w $25c4,$233f,$0000,$ffe0
	dc.w $25c4,$233f,$0040,$ffe0
	dc.w $25c4,$233f,$0080,$ffe0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d716:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$ffb8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff70,$fff8,$ff98
	dc.w $fff8,$ffa0,$fff8,$ffa8
	dc.w $fff8,$ff28,$fff8,$ff50
	dc.w $fff8,$ff58,$fff8,$ff60
	dc.w $fff8,$fee0,$fff8,$ff08
	dc.w $fff8,$ff10,$fff8,$ff18

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d766:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$ffb0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff60,$fff8,$ff88
	dc.w $fff8,$ff90,$fff8,$ff98
	dc.w $fff8,$ffa0,$fff8,$ff10
	dc.w $fff8,$ff38,$fff8,$ff40
	dc.w $fff8,$ff48,$fff8,$ff50
	dc.w $fff8,$fec0,$fff8,$fee8
	dc.w $fff8,$fef0,$fff8,$fef8
	dc.w $fff8,$ff00

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d7ca:
	dc.w $fff8,$ff00,$fff8,$ff28
	dc.w $fff8,$ff30,$fff8,$ff38
	dc.w $fff8,$ff40,$fff8,$ff50
	dc.w $fff8,$ff58,$fff8,$ff60
	dc.w $fff8,$ff68,$fff8,$ff70
	dc.w $fff8,$ff80,$fff8,$ffa8
	dc.w $fff8,$ffb0,$fff8,$ffb8
	dc.w $fff8,$ffc0,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$0050
	dc.w $fff8,$0058,$fff8,$0060
	dc.w $fff8,$0068,$fff8,$0070

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d842:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$0048
	dc.w $fff8,$ffa8,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff50,$fff8,$ff78
	dc.w $fff8,$ff80,$fff8,$ff88
	dc.w $fff8,$ff90,$fff8,$ff98
	dc.w $fff8,$fef8,$fff8,$ff20
	dc.w $fff8,$ff28,$fff8,$ff30
	dc.w $fff8,$ff38,$fff8,$ff40

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d8a2:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff9,$0034,$fff8,$0038
	dc.w $fff8,$0040,$fff9,$0048
	dc.w $fff8,$0050,$fff8,$ffa0
	dc.w $fff8,$ffc8,$fff9,$ffd4
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff9,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff40,$fff8,$ff68
	dc.w $fff9,$ff74,$fff8,$ff78
	dc.w $fff8,$ff80,$fff9,$ff88
	dc.w $fff8,$ff90,$fff8,$fee0
	dc.w $fff8,$ff08,$fff9,$ff14
	dc.w $fff8,$ff18,$fff8,$ff20
	dc.w $fff9,$ff28,$fff8,$ff30

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d912:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$0048
	dc.w $fff8,$0050,$fff8,$ffa0
	dc.w $fff8,$ffc8,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff40,$fff8,$ff68
	dc.w $fff8,$ff70,$fff8,$ff78
	dc.w $fff8,$ff80,$fff8,$ff88
	dc.w $fff8,$ff90,$fff8,$fee0
	dc.w $fff8,$ff08,$fff8,$ff10
	dc.w $fff8,$ff18,$fff8,$ff20
	dc.w $fff8,$ff28,$fff8,$ff30

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08d982:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff7,$004c
	dc.w $fff9,$0050,$fff8,$0058
	dc.w $fff8,$ff98,$fff8,$ffc0
	dc.w $fff8,$ffc8,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff7,$ffe4
	dc.w $fff9,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff30,$fff8,$ff58
	dc.w $fff8,$ff60,$fff8,$ff68
	dc.w $fff8,$ff70,$fff7,$ff7c
	dc.w $fff9,$ff80,$fff8,$ff88
	dc.w $fff8,$fec8,$fff8,$fef0
	dc.w $fff8,$fef8,$fff8,$ff00
	dc.w $fff8,$ff08,$fff7,$ff14
	dc.w $fff9,$ff18,$fff8,$ff20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08da02:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff8,$0030,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$0048
	dc.w $fff8,$0050,$fff8,$0058
	dc.w $fff8,$ff98,$fff8,$ffc0
	dc.w $fff8,$ffc8,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff30,$fff8,$ff58
	dc.w $fff8,$ff60,$fff8,$ff68
	dc.w $fff8,$ff70,$fff8,$ff78
	dc.w $fff8,$ff80,$fff8,$ff88
	dc.w $fff8,$fec8,$fff8,$fef0
	dc.w $fff8,$fef8,$fff8,$ff00
	dc.w $fff8,$ff08,$fff8,$ff10
	dc.w $fff8,$ff18,$fff8,$ff20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08da82:
	dc.w $fff8,$0000,$fff8,$0028
	dc.w $fff7,$0034,$fff8,$0038
	dc.w $fff8,$0040,$fff8,$0048
	dc.w $fff8,$0050,$fff8,$0058
	dc.w $fff8,$ff98,$fff8,$ffc0
	dc.w $fff7,$ffcc,$fff8,$ffd0
	dc.w $fff8,$ffd8,$fff8,$ffe0
	dc.w $fff8,$ffe8,$fff8,$fff0
	dc.w $fff8,$ff30,$fff8,$ff58
	dc.w $fff7,$ff64,$fff8,$ff68
	dc.w $fff8,$ff70,$fff8,$ff78
	dc.w $fff8,$ff80,$fff8,$ff88
	dc.w $fff8,$fec8,$fff8,$fef0
	dc.w $fff7,$fefc,$fff8,$ff00
	dc.w $fff8,$ff08,$fff8,$ff10
	dc.w $fff8,$ff18,$fff8,$ff20


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08db02:
	move.b #4,(4,a6)
	rts

;##############################################
loc_08db0a:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_08db18(pc,d0.w),d1
	jmp loc_08db18(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08db18:
	dc.w loc_08db28-loc_08db18
	dc.w loc_08dfda-loc_08db18
	dc.w loc_08e124-loc_08db18
	dc.w loc_08e24e-loc_08db18
	dc.w loc_08e388-loc_08db18
	dc.w loc_08e5c0-loc_08db18
	dc.w loc_08e824-loc_08db18
	dc.w loc_08eb00-loc_08db18

;==============================================
loc_08db28:
	move.b (4,a6),d0
	move.w loc_08db34(pc,d0.w),d1
	jmp loc_08db34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08db34:
	dc.w loc_08db3c-loc_08db34
	dc.w loc_08dc0a-loc_08db34
	dc.w loc_08ec9a-loc_08db34
	dc.w loc_08ec9a-loc_08db34

;----------------------------------------------
loc_08db3c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$a000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b #8,($3a,a6)
	move.l #$c0a00400,d2
	move.w (StageID_01,a5),d1
	move.w d1,d0
	lsr.w #1,d0
	btst d0,d2
	beq.b loc_08db8c
	move.w (Main_stageid,a5),d1

loc_08db8c:
	bsr.w loc_08df3e
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	move.w (Main_stageid,a5),d1
	bsr.w loc_08df3e
	move.w d0,($4a,a6)
	move.w d1,($4e,a6)
	move.l #$21000,d2
	moveq #0,d3
	move.w ($4a,a6),d3
	sub.w ($10,a6),d3
	swap d3
	move.l d3,d5
	asl.l #5,d3
	jsr loc_01bb9c
	move.w d3,($40,a6)
	neg.l d5
	move.l d5,d3
	jsr loc_01bb9c
	move.w d3,($48,a6)
	moveq #0,d3
	move.w ($4e,a6),d3
	sub.w ($14,a6),d3
	swap d3
	move.l d3,d5
	asl.l #5,d3
	jsr loc_01bb9c
	move.w d3,($44,a6)
	neg.l d5
	move.l d5,d3
	jsr loc_01bb9c
	move.w d3,($4c,a6)
	bsr.w loc_08dd3a
	bsr.w loc_08de28
	bra.w loc_08dfc2

;----------------------------------------------
loc_08dc0a:
	move.b (5,a6),d0
	move.w loc_08dc16(pc,d0.w),d1
	jmp loc_08dc16(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08dc16:
	dc.w loc_08dc20-loc_08dc16
	dc.w loc_08dc3e-loc_08dc16
	dc.w loc_08dca4-loc_08dc16
	dc.w loc_08dcf6-loc_08dc16
	dc.w loc_08dd12-loc_08dc16

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08dc20:
	tst.b ($15f,a5)
	bne.w loc_08dcca
	subq.b #1,($3a,a6)
	bne.b loc_08dc36
	addq.b #2,(5,a6)
	clr.b (6,a6)

loc_08dc36:
	bsr.w loc_08de28
	bra.w loc_08dfc2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08dc3e:
	tst.b ($15f,a5)
	bne.w loc_08dcca
	btst #0,(6,a6)
	bne.b loc_08dc64
	bsr.w loc_09020a
	beq.b loc_08dc64
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	bset.b #0,(6,a6)

loc_08dc64:
	btst #1,(6,a6)
	bne.b loc_08dc82
	bsr.w loc_090238
	beq.b loc_08dc82
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	bset.b #1,(6,a6)

loc_08dc82:
	cmpi.b #3,(6,a6)
	bne.b loc_08dc9c
	addq.b #2,(5,a6)
	clr.b (6,a6)
	move.b #$10,($3a,a6)
	bsr.w loc_08deb0

loc_08dc9c:
	bsr.w loc_08de28
	bra.w loc_08dfc2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08dca4:
	tst.b ($15f,a5)
	bne.w loc_08dcca
	subq.b #1,($3a,a6)
	bne.b loc_08dcbe
	addq.b #2,(5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08dcbe:
	bsr.w loc_08deb6
	bsr.w loc_08de28
	bra.w loc_08dfc2

loc_08dcca:
	move.b #6,(5,a6)
	clr.b (6,a6)
	moveq #0,d0
	move.w ($4a,a6),($10,a6)
	move.w ($4e,a6),($14,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	bsr.w loc_08deb0
	bsr.w loc_08de28
	bra.w loc_08dfc2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08dcf6:
	tst.b ($12,a5)
	bpl.b loc_08dd06
	addq.b #2,(5,a6)
	move.b #$10,($3a,a6)

loc_08dd06:
	bsr.w loc_08deb6
	bsr.w loc_08de28
	bra.w loc_08dfc2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08dd12:
	subq.b #1,($3a,a6)
	bne.b loc_08dd24
	addq.b #2,(4,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08dd24:
	btst #0,($3a,a6)
	bne.b loc_08dd38
	bsr.w loc_08deb6
	bsr.w loc_08de28
	bra.w loc_08dfc2

loc_08dd38:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08dd3a:
	move.w #8,(-$49b0,a5)
	move.w #$2d,(-$49ae,a5)
	move.w #$28,(-$49ac,a5)
	move.w #$140,(-$49aa,a5)
	move.w #$211,(-$49a8,a5)
	move.w #$ffe8,(-$49a6,a5)
	move.w #$fff0,(-$49a4,a5)
	move.w #$143,(-$49a2,a5)
	move.w #$211,(-$49a0,a5)
	move.w #$ffe8,(-$499e,a5)
	move.w #0,(-$499c,a5)
	move.w #$1f8,(-$499a,a5)
	move.w #$11,(-$4998,a5)
	move.w #0,(-$4996,a5)
	move.w #$ffe0,(-$4994,a5)
	move.w #$11,(-$4990,a5)
	move.w #$10,(-$498e,a5)
	move.w #$ffe0,(-$498c,a5)
	move.w #$1f9,(-$498a,a5)
	move.w #$11,(-$4988,a5)
	move.w #$ffd0,(-$4986,a5)
	move.w #$fff0,(-$4984,a5)
	move.w #$11,(-$4980,a5)
	move.w #$ffe0,(-$497e,a5)
	move.w #$fff0,(-$497c,a5)
	moveq #$c,d0
	lea.l (-$497a,a5),a0

loc_08ddd6:
	move.w #$3fe,(a0)+
	move.w #$11,(a0)+
	move.w #$fff0,(a0)+
	lea.l (2,a0),a0
	dbra d0,loc_08ddd6
	moveq #$15,d0
	lea.l (-$4912,a5),a0

loc_08ddf0:
	move.w #$3ee,(a0)+
	move.w #$11,(a0)+
	lea.l (2,a0),a0
	move.w #$fff0,(a0)+
	dbra d0,loc_08ddf0
	lea.l (-$49b0,a5),a0
	move.l a0,($74,a6)
	move.b #$ff,($70,a6)
	move.b #$40,($71,a6)
	move.w #0,($72,a6)
	lea.l ($70,a6),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08de28:
	move.w ($10,a6),d0
	move.w d0,d1
	andi.w #$f,d0
	addi.w #$1e0,d0
	move.w d0,(-$4992,a5)
	move.w ($14,a6),d0
	move.w d0,d2
	andi.w #$f,d0
	addi.w #$1e0,d0
	move.w d0,(-$4982,a5)
	addq.w #8,d1
	sub.w ($290,a5),d1
	andi.w #$fff0,d1
	neg.w d1
	subq.w #8,d1
	sub.w ($294,a5),d2
	andi.w #$fff0,d2
	subi.w #$f0,d2
	moveq #$c,d0
	lea.l (-$497a,a5),a0
	bra.b loc_08de72

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_08de6e:
	addi.w #$10,d2

loc_08de72:
	cmpi.w #$ffe0,d2
	ble.b loc_08de7e
	cmpi.w #$10,d2
	blt.b loc_08de6e

loc_08de7e:
	move.w d2,(6,a0)
	lea.l (8,a0),a0
	dbra d0,loc_08de6e
	moveq #$15,d0
	lea.l (-$4912,a5),a0
	bra.b loc_08de96

loc_08de92:
	addi.w #$10,d1

loc_08de96:
	cmpi.w #$ffd8,d1
	ble.b loc_08dea2
	cmpi.w #$18,d1
	blt.b loc_08de92

loc_08dea2:
	move.w d1,(4,a0)
	lea.l (8,a0),a0
	dbra d0,loc_08de92
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08deb0:
	clr.b ($35,a6)
	bra.b loc_08dec2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08deb6:
	tst.b ($32,a6)
	bmi.b loc_08deec
	subq.b #1,($32,a6)
	bne.b loc_08deec

loc_08dec2:
	moveq #0,d0
	move.b ($35,a6),d0
	move.b loc_08deee(pc,d0.w),($35,a6)
	move.b loc_08deee+1(pc,d0.w),($32,a6)
	move.w loc_08deee+2(pc,d0.w),(-$49aa,a5)
	move.w loc_08deee+4(pc,d0.w),(-$49a8,a5)
	move.w loc_08deee+6(pc,d0.w),(-$49a2,a5)
	move.w loc_08deee+8(pc,d0.w),(-$49a0,a5)

loc_08deec:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08deee:
	dc.b $0a,$08
	dc.w $0140,$0211,$0143,$0211

	dc.b $14,$04
	dc.w $0149,$0251,$0146,$0251

	dc.b $1e,$05
	dc.w $014c,$0211,$019a,$0211

	dc.b $28,$06
	dc.w $019d,$0211,$01a0,$0211

	dc.b $32,$07
	dc.w $01a3,$0211,$01a6,$0211

	dc.b $3c,$08
	dc.w $01a9,$0211,$01ac,$0211

	dc.b $46,$09
	dc.w $034a,$0211,$034d,$0211

	dc.b $46,$ff
	dc.w $03aa,$0211,$03ad,$0211


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08df3e:
	add.w d1,d1
	move.w loc_08df4a(pc,d1.w),d0
	move.w loc_08df4a+2(pc,d1.w),d1
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08df4a:
	dc.w $0175,$038e
	dc.w $0088,$0396
	dc.w $0175,$038e
	dc.w $00a0,$0396
	dc.w $0158,$038e
	dc.w $0150,$0376
	dc.w $00b8,$038e
	dc.w $00b8,$038e
	dc.w $00ec,$0378
	dc.w $0105,$0383
	dc.w $0150,$0376
	dc.w $0150,$0376
	dc.w $0175,$038e
	dc.w $0175,$038e
	dc.w $00b1,$038c
	dc.w $0140,$0376
	dc.w $0130,$0396
	dc.w $0160,$037e
	dc.w $0158,$038e
	dc.w $0160,$037e
	dc.w $00b8,$038e
	dc.w $0000,$0000
	dc.w $0114,$0376
	dc.w $0000,$0000
	dc.w $0175,$038e
	dc.w $00b0,$035e
	dc.w $0175,$038e
	dc.w $00b1,$038c
	dc.w $00f8,$037b
	dc.w $0175,$038e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08dfc2:
	move.w (Main_stageid,a5),d0
	lsr.b #1,d0
	move.l #$c0a00400,d1
	btst d0,d1
	bne.b loc_08dfd8
	jmp loc_01b4ec

loc_08dfd8:
	rts

;==============================================
loc_08dfda:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08dfea(pc,d0.w),d1
	jmp loc_08dfea(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08dfea:
	dc.w loc_08dff2-loc_08dfea
	dc.w loc_08e092-loc_08dfea
	dc.w loc_08ec9a-loc_08dfea
	dc.w loc_08ec9a-loc_08dfea

;----------------------------------------------
loc_08dff2:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$a000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.l d0,($14,a6)
	move.l #$ffff0000,($44,a6)
	jsr loc_084c5a
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_08e03e
	tst.b ($101,a4)
	beq.b loc_08e03e
	addq.b #2,d0

loc_08e03e:
	lsl.w #3,d0
	move.w loc_08e072(pc,d0.w),($42,a6)
	move.w loc_08e072+2(pc,d0.w),($4a,a6)
	move.w loc_08e072+4(pc,d0.w),($40,a6)
	move.w loc_08e072+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	moveq #2,d0
	tst.w (Region,a5)
	beq.b loc_08e068
	addq.w #1,d0

loc_08e068:
	move.b ($102,a4),d1
	lsl.w #3,d1
	bra.w loc_08ecd8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e072:
	dc.w $fff8,$0018,$03c3,$ffc4
	dc.w $0188,$0168,$fc3d,$003c
	dc.w $fff8,$0028,$05c5,$ffa4
	dc.w $0188,$0158,$fa3b,$005c

;----------------------------------------------
loc_08e092:
	move.b (5,a6),d0
	move.w loc_08e0a6(pc,d0.w),d1
	jsr loc_08e0a6(pc,d1.w)
	bsr.b loc_08e0fe
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e0a6:
	dc.w loc_08e0ac-loc_08e0a6
	dc.w loc_08e0d0-loc_08e0a6
	dc.w loc_08e0e6-loc_08e0a6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e0ac:
	tst.b ($15f,a5)
	bne.b loc_08e0b8
	bsr.w loc_09020a
	beq.b loc_08e0ce

loc_08e0b8:
	addq.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e0ce:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e0d0:
	tst.b ($12,a5)
	bpl.b loc_08e0e4
	addq.b #2,(5,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_08e0e4:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e0e6:
	bsr.w loc_09020a
	beq.b loc_08e0fc
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e0fc:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08e0fe:
	move.w ($34,a6),d0
	move.l ($44,a6),d1
	add.l d1,($14,a6)

loc_08e10a:
	tst.w ($14,a6)
	bpl.b loc_08e116
	add.w d0,($14,a6)
	bra.b loc_08e10a

loc_08e116:
	cmp.w ($14,a6),d0
	bhi.b loc_08e122
	sub.w d0,($14,a6)
	bra.b loc_08e116

loc_08e122:
	rts

;==============================================
loc_08e124:
	move.b (4,a6),d0
	move.w loc_08e130(pc,d0.w),d1
	jmp loc_08e130(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e130:
	dc.w loc_08e138-loc_08e130
	dc.w loc_08e1e4-loc_08e130
	dc.w loc_08ec9a-loc_08e130
	dc.w loc_08ec9a-loc_08e130

;----------------------------------------------
loc_08e138:
	move.b (5,a6),d0
	move.w loc_08e144(pc,d0.w),d1
	jmp loc_08e144(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e144:
	dc.w loc_08e148-loc_08e144
	dc.w loc_08e1c4-loc_08e144

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e148:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($f,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w #$100,($10,a6)
	moveq #0,d0
	move.b ($a,a6),d0
	lsl.w #3,d0
	move.b loc_08e1b4+1(pc,d0.w),($e,a6)
	move.w loc_08e1b4+2(pc,d0.w),($18,a6)
	move.w loc_08e1b4+4(pc,d0.w),($14,a6)
	moveq #4,d0
	add.b ($a,a6),d0
	move.w (Main_stageid,a5),d1
	lsl.w #2,d1
	bsr.w loc_08eca0
	moveq #0,d0
	add.b ($a,a6),d0
	lea.l ($40,a6),a2
	bsr.w loc_08ecfe
	moveq #2,d0
	add.b ($a,a6),d0
	lea.l ($48,a6),a2
	bra.w loc_08ecfe

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e1b4:
	dc.b $00,$08
	dc.w $a000,$0380,$0000

	dc.b $00,$0c
	dc.w $6000,$0780,$0000

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e1c4:
	tst.b ($15f,a5)
	bne.w loc_08e226
	cmpi.b #1,($12,a5)
	bne.b loc_08e1e2
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.b #$10,($3a,a6)

loc_08e1e2:
	rts

;----------------------------------------------
loc_08e1e4:
	move.b (5,a6),d0
	move.w loc_08e206(pc,d0.w),d1
	jsr loc_08e206(pc,d1.w)
	lea.l ($40,a6),a2
	bsr.w loc_08ecf6
	lea.l ($48,a6),a2
	bsr.w loc_08ecf6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e206:
	dc.w loc_08e20a-loc_08e206
	dc.w loc_08e234-loc_08e206

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e20a:
	tst.b ($15f,a5)
	bne.w loc_08e226
	subq.b #1,($3a,a6)
	bne.b loc_08e224
	addq.b #2,(5,a6)
	move.b ($a,a6),d0
	bset.b d0,($13,a5)

loc_08e224:
	rts

loc_08e226:
	move.b #2,(4,a6)
	move.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e234:
	tst.b ($12,a5)
	bpl.b loc_08e24c
	addq.b #2,(4,a6)
	tst.b ($a,a6)
	bne.b loc_08e24c
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e24c:
	rts

;==============================================
loc_08e24e:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08e25e(pc,d0.w),d1
	jmp loc_08e25e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e25e:
	dc.w loc_08e266-loc_08e25e
	dc.w loc_08e304-loc_08e25e
	dc.w loc_08ec9a-loc_08e25e
	dc.w loc_08ec9a-loc_08e25e

;----------------------------------------------
loc_08e266:
	move.b (5,a6),d0
	move.w loc_08e272(pc,d0.w),d1
	jmp loc_08e272(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e272:
	dc.w loc_08e276-loc_08e272
	dc.w loc_08e2ea-loc_08e272

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e276:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($16,a6)
	jsr loc_084c5a
	lsl.w #2,d0
	move.w loc_08e2e2+2(pc,d0.w),($10,a6)
	move.w loc_08e2e2(pc,d0.w),d0
	move.w #$11e,($46,a6)
	move.w #$3e,($4e,a6)
	move.w #$e5a6,($44,a6)
	move.w #$1a5,($4c,a6)
	move.w ($46,a6),($14,a6)
	tst.w (Region,a5)
	beq.b loc_08e2d8
	addq.b #2,d0

loc_08e2d8:
	move.w (Main_stageid,a5),d1
	lsl.w #2,d1
	bra.w loc_08eca0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e2e2:
	dc.w $0000,$0078
	dc.w $0001,$0108

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e2ea:
	tst.b ($15f,a5)
	bne.w loc_08e342
	cmpi.b #2,($12,a5)
	bne.b loc_08e302
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_08e302:
	rts

;----------------------------------------------
loc_08e304:
	move.b (5,a6),d0
	move.w loc_08e316(pc,d0.w),d1
	jsr loc_08e316(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e316:
	dc.w loc_08e31c-loc_08e316
	dc.w loc_08e35a-loc_08e316
	dc.w loc_08e370-loc_08e316

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e31c:
	tst.b ($15f,a5)
	bne.w loc_08e342
	bsr.w loc_090238
	beq.b loc_08e340
	addq.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e340:
	rts

loc_08e342:
	move.b #2,(4,a6)
	move.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e35a:
	tst.b ($12,a5)
	bpl.b loc_08e36e
	addq.b #2,(5,a6)
	move.w ($46,a6),($4e,a6)
	clr.w ($44,a6)

loc_08e36e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e370:
	bsr.w loc_090238
	beq.b loc_08e386
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e386:
	rts

;==============================================
loc_08e388:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08e398(pc,d0.w),d1
	jmp loc_08e398(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e398:
	dc.w loc_08e3a0-loc_08e398
	dc.w loc_08e4ea-loc_08e398
	dc.w loc_08ec9a-loc_08e398
	dc.w loc_08ec9a-loc_08e398

;----------------------------------------------
loc_08e3a0:
	move.b (5,a6),d0
	move.w loc_08e3ac(pc,d0.w),d1
	jmp loc_08e3ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e3ac:
	dc.w loc_08e3b0-loc_08e3ac
	dc.w loc_08e4d0-loc_08e3ac

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e3b0:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	jsr loc_084c5a
	lsl.w #3,d0
	move.w loc_08e414(pc,d0.w),($42,a6)
	move.w loc_08e414+2(pc,d0.w),($4a,a6)
	move.w loc_08e414+4(pc,d0.w),($40,a6)
	move.w loc_08e414+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	move.b ($a,a6),d0
	add.w d0,d0
	move.w loc_08e40e(pc,d0.w),d1
	jmp loc_08e40e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e40e:
	dc.w loc_08e424-loc_08e40e
	dc.w loc_08e43c-loc_08e40e
	dc.w loc_08e4bc-loc_08e40e

loc_08e414:
	dc.w $ffe0,$0150,$2b4b,$fd4c
	dc.w $01a0,$0030,$d4b5,$02b4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e424:
	move.w #$80,($14,a6)
	btst #0,($14d,a5)
	bne.b loc_08e436
	addq.w #8,($14,a6)

loc_08e436:
	moveq #5,d0
	bra.w loc_08ecec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e43c:
	bsr.w loc_08ec76
	move.w d0,($14,a6)
	lea.l loc_09015a(pc),a0
	nop
	jsr loc_084c5a
	beq.b loc_08e456
	lea.l ($30,a0),a0

loc_08e456:
	move.w #$a,($5c,a6)
	move.w ($14c,a5),d0
	move.w d0,($60,a6)
	addq.w #1,d0
	move.w d0,($5e,a6)
	move.w #$a,($62,a6)
	move.l a0,($64,a6)
	movem.l loc_08e4a4(pc),d0-d5
	movem.l d0-d5,($68,a6)
	lea.l ($5c,a6),a0
	move.l a0,($54,a6)
	move.b #$ff,($50,a6)
	move.b #$40,($51,a6)
	move.w #0,($52,a6)
	lea.l ($50,a6),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e4a4:
	dc.w $07c2,$07c3,$07c4,$07c5
	dc.w $07c6,$07c7,$07c8,$07c9
	dc.w $07ca,$07cb,$07cc,$07cd

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e4bc:
	clr.l ($44,a6)
	move.l #$10000,($4c,a6)
	move.w #$10,($34,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e4d0:
	tst.b ($15f,a5)
	bne.w loc_08e52c
	cmpi.b #2,($12,a5)
	bne.b loc_08e4e8
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_08e4e8:
	rts

;----------------------------------------------
loc_08e4ea:
	move.b (5,a6),d0
	move.w loc_08e500(pc,d0.w),d1
	jsr loc_08e500(pc,d1.w)
	bsr.w loc_08e578
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e500:
	dc.w loc_08e506-loc_08e500
	dc.w loc_08e544-loc_08e500
	dc.w loc_08e55a-loc_08e500

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e506:
	tst.b ($15f,a5)
	bne.w loc_08e52c
	bsr.w loc_09020a
	beq.b loc_08e52a
	addq.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	move.b ($a,a6),d0
	bset.b d0,($13,a5)

loc_08e52a:
	rts
 
loc_08e52c:
	move.b #2,(4,a6)
	move.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e544:
	tst.b ($12,a5)
	bpl.b loc_08e558
	addq.b #2,(5,a6)
	move.w ($42,a6),($4a,a6)
	clr.w ($40,a6)

loc_08e558:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e55a:
	bsr.w loc_09020a
	beq.b loc_08e576
	addq.b #2,(4,a6)
	clr.b (5,a6)
	tst.b ($a,a6)
	bne.b loc_08e576
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e576:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08e578:
	cmpi.b #2,($a,a6)
	bne.b loc_08e5be
	move.w ($34,a6),d0
	move.l ($4c,a6),d1
	add.l d1,($44,a6)

loc_08e58c:
	tst.w ($44,a6)
	bpl.b loc_08e598
	add.w d0,($44,a6)
	bra.b loc_08e58c

loc_08e598:
	cmp.w ($44,a6),d0
	bhi.b loc_08e5a4
	sub.w d0,($44,a6)
	bra.b loc_08e598

loc_08e5a4:
	move.w ($44,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($14,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1
	moveq #4,d0
	bra.w loc_08ecd8

loc_08e5be:
	rts

;==============================================
loc_08e5c0:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08e5d0(pc,d0.w),d1
	jmp loc_08e5d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e5d0:
	dc.w loc_08e5d8-loc_08e5d0
	dc.w loc_08e69e-loc_08e5d0
	dc.w loc_08ec9a-loc_08e5d0
	dc.w loc_08ec9a-loc_08e5d0

;----------------------------------------------
loc_08e5d8:
	move.b (5,a6),d0
	move.w loc_08e5e4(pc,d0.w),d1
	jmp loc_08e5e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e5e4:
	dc.w loc_08e5e8-loc_08e5e4
	dc.w loc_08e682-loc_08e5e4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e5e8:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w #$1000,($3a,a6)
	jsr loc_084c5a
	add.w d0,d0
	move.w loc_08e67e(pc,d0.w),($10,a6)
	bsr.w loc_08ec76
	move.w d0,($14,a6)
	move.w #$a,($5c,a6)
	move.w ($14c,a5),d0
	move.w d0,($60,a6)
	addq.w #1,d0
	lsl.w #2,d0
	move.w d0,($5e,a6)
	move.w #$30c,($62,a6)
	move.l #loc_0901ba,($64,a6)
	lea.l ($5c,a6),a0
	move.l a0,($54,a6)
	move.b #$ff,($50,a6)
	move.b #$40,($51,a6)
	move.w #0,($52,a6)
	bsr.w loc_08e750
	lea.l ($50,a6),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e67e:
	dc.w $0150,$0030

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e682:
	tst.b ($15f,a5)
	bne.w loc_08e6f2
	cmpi.b #3,($12,a5)
	bne.w loc_08e69c
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_08e69c:
	rts

;----------------------------------------------
loc_08e69e:
	move.b (5,a6),d0
	move.w loc_08e6b0(pc,d0.w),d1
	jsr loc_08e6b0(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e6b0:
	dc.w loc_08e6b6-loc_08e6b0
	dc.w loc_08e70a-loc_08e6b0
	dc.w loc_08e738-loc_08e6b0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e6b6:
	tst.b ($15f,a5)
	bne.w loc_08e6f2
	subq.b #1,($3a,a6)
	bne.b loc_08e6de
	move.b #4,($3a,a6)
	addq.b #1,($3b,a6)
	moveq #1,d0
	add.w ($14c,a5),d0
	cmp.b ($3b,a6),d0
	bcc.b loc_08e6de
	move.b d0,($3b,a6)

loc_08e6de:
	bsr.w loc_08e750
	bne.b loc_08e6f0
	addq.b #2,(5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e6f0:
	rts

loc_08e6f2:
	move.b #2,(4,a6)
	move.b #2,(5,a6)
	add.w ($14c,a5),d0
	move.b d0,($3b,a6)
	bra.w loc_08e750

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e70a:
	tst.b ($12,a5)
	bpl.b loc_08e72e
	addq.b #2,(5,a6)
	moveq #0,d0
	jsr loc_084c5a
	lsl.w #2,d0
	move.w loc_08e730(pc,d0.w),($4a,a6)
	move.w loc_08e730+2(pc,d0.w),($48,a6)
	clr.w ($40,a6)

loc_08e72e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e730:
	dc.w $ffe0,$fd4c
	dc.w $01a0,$02b4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e738:
	bsr.w loc_09020a
	beq.b loc_08e74e
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e74e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08e750:
	lea.l (p1memory,a5),a0
	btst #0,(Active_Player_01,a5)
	bne.b loc_08e760
	lea.l (p2memory,a5),a0

loc_08e760:
	moveq #0,d4
	moveq #0,d5
	move.l ($140,a0),d6
	move.w ($14c,a5),d7
	lea.l (Arcade_Opp_List0,a5),a0
	lea.l ($68,a6),a1

loc_08e774:
	move.w #$7aa,d0
	moveq #0,d1
	move.b (a0)+,d1
	btst d1,d6
	beq.b loc_08e79a
	addq.w #1,d4
	cmp.b ($3b,a6),d5
	bcc.b loc_08e79a
	add.w d1,d1
	tst.w (Region,a5)
	beq.b loc_08e794
	addi.w #$40,d1

loc_08e794:
	move.w loc_08e7a4(pc,d1.w),d0
	addq.w #1,d5

loc_08e79a:
	move.w d0,(a1)+
	dbra d7,loc_08e774
	cmp.w d4,d5
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e7a4:
	dc.w $0868,$086c,$0870,$0874
	dc.w $0878,$087c,$0880,$0884
	dc.w $0888,$088c,$0890,$0894
	dc.w $0898,$089c,$08a0,$08a4
	dc.w $08a8,$08ac,$0878,$08ac
	dc.w $0880,$0864,$08b0,$096c
	dc.w $08b4,$08b8,$08bc,$08c0
	dc.w $08c4,$08c8,$29e4,$29e0
	dc.w $0868,$086c,$085c,$0860
	dc.w $0878,$087c,$0880,$0884
	dc.w $0888,$088c,$0864,$0894
	dc.w $0898,$089c,$08a0,$08a4
	dc.w $08a8,$08ac,$0878,$08ac
	dc.w $0880,$08c4,$08b0,$096c
	dc.w $08b4,$08b8,$08bc,$08c0
	dc.w $0890,$08c8,$29e4,$29e0

;==============================================
loc_08e824:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08e834(pc,d0.w),d1
	jmp loc_08e834(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e834:
	dc.w loc_08e83c-loc_08e834
	dc.w loc_08e942-loc_08e834
	dc.w loc_08ec9a-loc_08e834
	dc.w loc_08ec9a-loc_08e834

;----------------------------------------------
loc_08e83c:
	move.b (5,a6),d0
	move.w loc_08e848(pc,d0.w),d1
	jmp loc_08e848(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e848:
	dc.w loc_08e84c-loc_08e848
	dc.w loc_08e926-loc_08e848

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e84c:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	bsr.w loc_08ec76
	move.w (Arcade_Match_Var,a5),d1
	lsl.w #4,d1
	add.w d1,d0
	move.w d0,($14,a6)
	lea.l loc_0901ea(pc),a0
	nop
	jsr loc_084c5a
	beq.b loc_08e898
	lea.l ($10,a0),a0

loc_08e898:
	move.w #$c,($66,a6)
	move.w #8,($68,a6)
	move.w #3,($6a,a6)
	move.l a0,($6c,a6)
	move.w #$10b,($72,a6)
	move.w #$b,($76,a6)
	move.w #$30b,($7a,a6)
	move.w #$b,($7e,a6)
	bsr.w loc_08e9de
	lea.l ($66,a6),a0
	move.l a0,($62,a6)
	move.b #$ff,($5e,a6)
	move.b #$40,($5f,a6)
	move.w #0,($60,a6)
	moveq #0,d0
	jsr loc_084c5a
	lsl.w #3,d0
	move.w loc_08e916(pc,d0.w),($42,a6)
	move.w loc_08e916+2(pc,d0.w),($4a,a6)
	move.w loc_08e916+4(pc,d0.w),($40,a6)
	move.w loc_08e916+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	lea.l ($5e,a6),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e916:
	dc.w $01d0,$0150,$f800,$0000
	dc.w $ffb0,$0030,$0800,$0000

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e926:
	tst.b ($15f,a5)
	bne.w loc_08e980
	cmpi.b #4,($12,a5)
	bne.w loc_08e940
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_08e940:
	rts

;----------------------------------------------
loc_08e942:
	move.b (5,a6),d0
	move.w loc_08e954(pc,d0.w),d1
	jsr loc_08e954(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e954:
	dc.w loc_08e95a-loc_08e954
	dc.w loc_08e998-loc_08e954
	dc.w loc_08e9c6-loc_08e954

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e95a:
	tst.b ($15f,a5)
	bne.w loc_08e980
	bsr.w loc_09020a
	beq.b loc_08e97e
	addq.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e97e:
	rts

loc_08e980:
	move.b #2,(4,a6)
	move.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e998:
	tst.b ($12,a5)
	bpl.b loc_08e9bc
	addq.b #2,(5,a6)
	moveq #0,d0
	jsr loc_084c5a
	lsl.w #2,d0
	move.w loc_08e9be(pc,d0.w),($4a,a6)
	move.w loc_08e9be+2(pc,d0.w),($48,a6)
	clr.w ($40,a6)

loc_08e9bc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08e9be:
	dc.w $ffe0,$fd4c
	dc.w $01a0,$02b4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08e9c6:
	bsr.w loc_09020a
	beq.b loc_08e9dc
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.b (3,a6),d0
	bset.b d0,($13,a5)

loc_08e9dc:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08e9de:
	move.w (Arcade_Match_Var,a5),d1
	add.w d1,d1
	jsr loc_084c5a
	beq.b loc_08e9f0
	addi.w #$18,d1

loc_08e9f0:
	move.w loc_08ea40(pc,d1.w),($70,a6)
	movea.w ($36,a6),a3
	moveq #0,d0
	move.b ($102,a3),d0
	move.w d0,d1
	add.w d0,d0
	addi.w #$30,d0
	tst.w (Region,a5)
	beq.b loc_08ea12
	addi.w #$40,d0

loc_08ea12:
	move.w loc_08ea40(pc,d0.w),($78,a6)
	move.w #$b0,d0
	tst.w (Region,a5)
	beq.b loc_08ea24
	addq.w #4,d0

loc_08ea24:
	move.l loc_08ea40(pc,d0.w),d0
	move.w #$b8,d2
	btst d1,d0
	beq.b loc_08ea32
	addq.w #4,d2

loc_08ea32:
	move.w loc_08ea40(pc,d2.w),($74,a6)
	move.w loc_08ea40+2(pc,d2.w),($7c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ea40:
	dc.w $07d4,$07d6,$07d8,$07da
	dc.w $07dc,$07de,$07e4,$07e6
	dc.w $07e8,$07ea,$07ec,$07ee
	dc.w $04a0,$04a2,$04a4,$04a6
	dc.w $04a8,$04aa,$04ac,$04ae
	dc.w $07a0,$07a2,$08ba,$07bc
	dc.w $07f4,$07f8,$07fc,$0804
	dc.w $0808,$080c,$0814,$0818
	dc.w $081c,$0824,$0828,$082c
	dc.w $0834,$0838,$083c,$0840
	dc.w $0844,$0848,$0808,$0848
	dc.w $0814,$0810,$084c,$0000
	dc.w $0850,$0854,$0858,$07e0
	dc.w $07f0,$0800,$25ec,$25fc
	dc.w $07f4,$07f8,$0830,$0820
	dc.w $0808,$080c,$0814,$0818
	dc.w $081c,$0824,$0810,$082c
	dc.w $0834,$0838,$083c,$0840
	dc.w $0844,$0848,$0808,$0848
	dc.w $0814,$07f0,$084c,$0000
	dc.w $0850,$0854,$0858,$07e0
	dc.w $0828,$0800,$25ec,$25fc
	dc.w $1301,$e000,$0321,$e008
	dc.w $07b4,$07b4,$07b2,$07b3

;==============================================
loc_08eb00:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_08eb10(pc,d0.w),d1
	jmp loc_08eb10(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08eb10:
	dc.w loc_08eb18-loc_08eb10
	dc.w loc_08ec16-loc_08eb10
	dc.w loc_08ec9a-loc_08eb10
	dc.w loc_08ec9a-loc_08eb10

;----------------------------------------------
loc_08eb18:
	move.b (5,a6),d0
	move.w loc_08eb24(pc,d0.w),d1
	jmp loc_08eb24(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08eb24:
	dc.w loc_08eb28-loc_08eb24
	dc.w loc_08ebfc-loc_08eb24

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08eb28:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($c,a6)
	move.b #4,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	tst.b ($a,a6)
	bne.b loc_08ebc2
	jsr loc_084c5a
	moveq #0,d3
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_08eb7e
	move.b ($101,a4),d1
	add.b (Active_Player_01,a5),d1
	btst #0,d1
	bne.b loc_08eb7e
	addq.b #2,d0
	moveq #4,d3
	move.w #$ff04,($c,a6)

loc_08eb7e:
	lsl.w #2,d0
	move.b loc_08ebec+1(pc,d0.w),($b,a6)
	move.w loc_08ebec+2(pc,d0.w),($10,a6)
	move.w #$d0,($14,a6)
	move.b ($132,a4),d0
	add.b d0,d0
	add.b ($bb,a5),d0
	addq.b #8,d0
	moveq #0,d1
	movea.w ($38,a6),a4
	move.b ($102,a4),d1
	lsl.w #3,d1
	bsr.w loc_08ecc2
	moveq #0,d0
	move.b ($102,a4),d0
	move.b ($132,a4),d1
	move.b ($128,a4),d2
	jmp loc_01f75c

loc_08ebc2:
	move.b d0,($b,a6)
	move.l d0,($40,a6)
	move.w #$d0,($14,a6)
	move.w #$10,($34,a6)
	move.l #$ffff0000,($48,a6)
	move.b ($81,a5),d0
	andi.b #1,d0
	move.b d0,($3c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ebec:
	dc.b $00,$01,$00,$40,$00,$00,$01,$40
	dc.b $00,$01,$00,$80,$00,$00,$01,$00

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_08ebfc:
	tst.b ($15f,a5)
	bne.b loc_08ec0c
	cmpi.b #5,($12,a5)
	bne.w loc_08ec14

loc_08ec0c:
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_08ec14:
	rts

;----------------------------------------------
loc_08ec16:
	tst.b ($12,a5)
	bpl.b loc_08ec26
	tst.b ($13,a5)
	bpl.b loc_08ec26
	addq.b #2,(4,a6)

loc_08ec26:
	tst.b ($a,a6)
	beq.b loc_08ec70
	move.w ($34,a6),d0
	move.l ($48,a6),d1
	add.l d1,($40,a6)

loc_08ec38:
	tst.w ($40,a6)
	bpl.b loc_08ec44
	add.w d0,($40,a6)
	bra.b loc_08ec38

loc_08ec44:
	cmp.w ($40,a6),d0
	bgt.w loc_08ec52
	sub.w d0,($40,a6)
	bra.b loc_08ec44

loc_08ec52:
	move.w ($40,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($10,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1
	moveq #0,d0
	add.b ($3c,a6),d0
	bsr.w loc_08ecd8

loc_08ec70:
	jmp loc_01b4ec

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ec76:
	move.w ($14c,a5),d0
	add.w d0,d0
	move.w loc_08ec82(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ec82:
	dc.w $0080,$0078,$0070,$0068
	dc.w $0060,$0058,$0050,$0048
	dc.w $0040,$0038,$0030,$0028

;----------------------------------------------
loc_08ec9a:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08eca0:
	add.w d0,d0
	lea.l loc_2f357a,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ecb6:
	lea.l loc_2f357a,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ecc2:
	add.w d0,d0
	lea.l loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ecd8:
	add.w d0,d0
	lea.l loc_08ef60(pc),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ecec:
	lea.l loc_08ef60(pc),a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_08ecf6:
	subq.w #1,(2,a2)
	beq.b loc_08ed10
	rts

loc_08ecfe:
	move.w (Char_Sel_PalID,a5),d2
	lsl.w #2,d2
	add.w d0,d2
	add.w d2,d2
	move.w loc_08ed4e(pc,d2.w),(a2)
	clr.w (4,a2)

loc_08ed10:
	move.w (a2),d2
	move.w loc_08ed4e(pc,d2.w),(2,a2)
	move.w loc_08ed4e+2(pc,d2.w),d1

loc_08ed1c:
	move.w d2,d0
	add.w (4,a2),d0
	move.w loc_08ed4e+4(pc,d0.w),d0
	bpl.b loc_08ed2e
	clr.w (4,a2)
	bra.b loc_08ed1c

loc_08ed2e:
	addq.w #2,(4,a2)
	lea.l loc_35cc34,a0
	lea.l (a0,d0.w),a0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d1.w),a1
	moveq #0,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ed4e:
	dc.w loc_08ed76-loc_08ed4e;28
	dc.w loc_08ed96-loc_08ed4e;48
	dc.w loc_08eda6-loc_08ed4e;58
	dc.w loc_08edb8-loc_08ed4e;6a
	dc.w loc_08edd8-loc_08ed4e;8a
	dc.w loc_08edf8-loc_08ed4e;aa
	dc.w loc_08ee08-loc_08ed4e;ba
	dc.w loc_08ee1a-loc_08ed4e;cc

	dc.w loc_08ee3a-loc_08ed4e;ec
	dc.w loc_08ee5a-loc_08ed4e;10c
	dc.w loc_08ee6a-loc_08ed4e;11c
	dc.w loc_08ee7c-loc_08ed4e;12e
	dc.w loc_08ee9c-loc_08ed4e;14e
	dc.w loc_08eebc-loc_08ed4e;16e
	dc.w loc_08eecc-loc_08ed4e;17e
	dc.w loc_08eede-loc_08ed4e;190

	dc.w loc_08eefe-loc_08ed4e;1b0
	dc.w loc_08ef1e-loc_08ed4e;1d0
	dc.w loc_08ef2e-loc_08ed4e;1e0
	dc.w loc_08ef40-loc_08ed4e;1f2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ed76:
	dc.w $0004,$0240
	dc.w $0000,$0020,$0040,$0060
	dc.w $0080,$00a0,$00c0,$00e0
	dc.w $0100,$0120,$0140,$0160
	dc.w $0180,$ffff

loc_08ed96:
	dc.w $0004,$0260,$01a0,$01c0
	dc.w $01e0,$0200,$0220,$ffff

loc_08eda6:
	dc.w $0004,$0280,$0240,$0260
	dc.w $0280,$02a0,$02c0,$02e0
	dc.w $ffff

loc_08edb8:
	dc.w $0003,$02a0,$0300,$0320
	dc.w $0340,$0360,$0380,$03a0
	dc.w $03c0,$03e0,$0400,$0420
	dc.w $0440,$0460,$0480,$ffff

loc_08edd8:
	dc.w $0004,$0240,$04a0,$04c0
	dc.w $04e0,$0500,$0520,$0540
	dc.w $0560,$0580,$05a0,$05c0
	dc.w $05e0,$0600,$0620,$ffff

loc_08edf8:
	dc.w $0004,$0260,$0640,$0660
	dc.w $0680,$06a0,$06c0,$ffff

loc_08ee08:
	dc.w $0004,$0280,$06e0,$0700
	dc.w $0720,$0740,$0760,$0780
	dc.w $ffff

loc_08ee1a:
	dc.w $0003,$02a0,$07a0,$07c0
	dc.w $07e0,$0800,$0820,$0840
	dc.w $0860,$0880,$08a0,$08c0
	dc.w $08e0,$0900,$0920,$ffff

loc_08ee3a:
	dc.w $0004,$0240,$0940,$0960
	dc.w $0980,$09a0,$09c0,$09e0
	dc.w $0a00,$0a20,$0a40,$0a60
	dc.w $0a80,$0aa0,$0ac0,$ffff

loc_08ee5a:
	dc.w $0004,$0260,$0ae0,$0b00
	dc.w $0b20,$0b40,$0b60,$ffff

loc_08ee6a:
	dc.w $0004,$0280,$0b80,$0ba0
	dc.w $0bc0,$0be0,$0c00,$0c20
	dc.w $ffff

loc_08ee7c:
	dc.w $0003,$02a0,$0c40,$0c60
	dc.w $0c80,$0ca0,$0cc0,$0ce0
	dc.w $0d00,$0d20,$0d40,$0d60
	dc.w $0d80,$0da0,$0dc0,$ffff

loc_08ee9c:
	dc.w $0004,$0240,$0de0,$0e00
	dc.w $0e20,$0e40,$0e60,$0e80
	dc.w $0ea0,$0ec0,$0ee0,$0f00
	dc.w $0f20,$0f40,$0f60,$ffff

loc_08eebc:
	dc.w $0004,$0260,$0f80,$0fa0
	dc.w $0fc0,$0fe0,$1000,$ffff

loc_08eecc:
	dc.w $0004,$0280,$1020,$1040
	dc.w $1060,$1080,$10a0,$10c0
	dc.w $ffff

loc_08eede:
	dc.w $0003,$02a0,$10e0,$1100
	dc.w $1120,$1140,$1160,$1180
	dc.w $11a0,$11c0,$11e0,$1200
	dc.w $1220,$1240,$1260,$ffff

loc_08eefe:
	dc.w $0004,$0240,$1280,$12a0
	dc.w $12c0,$12e0,$1300,$1320
	dc.w $1340,$1360,$1380,$13a0
	dc.w $13c0,$13e0,$1400,$ffff

loc_08ef1e:
	dc.w $0004,$0260,$1420,$1440
	dc.w $1460,$1480,$14a0,$ffff

loc_08ef2e:
	dc.w $0004,$0280,$14c0,$14e0
	dc.w $1500,$1520,$1540,$1560
	dc.w $ffff

loc_08ef40:
	dc.w $0003,$02a0
	dc.w $1580,$15a0,$15c0,$15e0
	dc.w $1600,$1620,$1640,$1660
	dc.w $1680,$16a0,$16c0,$16e0
	dc.w $1700,$ffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ef60:
	dc.w loc_08ef6e-loc_08ef60
	dc.w loc_08f03e-loc_08ef60
	dc.w loc_08f1ee-loc_08ef60
	dc.w loc_08f2ee-loc_08ef60
	dc.w loc_08f3ee-loc_08ef60
	dc.w loc_08f41e-loc_08ef60
	dc.w $0000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ef6e:
	dc.w $0800,$01a0
	dc.l loc_08f426
	dc.w $0800,$01a0
	dc.l loc_08f43c
	dc.w $0800,$01a0
	dc.l loc_08f45a
	dc.w $0800,$01a0
	dc.l loc_08f478
	dc.w $0800,$01a0
	dc.l loc_08f496
	dc.w $0800,$01a0
	dc.l loc_08f4b4
	dc.w $0800,$01a0
	dc.l loc_08f4d2
	dc.w $0800,$01a0
	dc.l loc_08f4f0
	dc.w $0800,$01a0
	dc.l loc_08f50e
	dc.w $0800,$01a0
	dc.l loc_08f52c
	dc.w $0800,$01a0
	dc.l loc_08f54a
	dc.w $0800,$01a0
	dc.l loc_08f568
	dc.w $0800,$01a0
	dc.l loc_08f586
	dc.w $0800,$01a0
	dc.l loc_08f5a4
	dc.w $0800,$01a0
	dc.l loc_08f5c2
	dc.w $0800,$01a0
	dc.l loc_08f5e0
	dc.w $0800,$01a0
	dc.l loc_08f5f6
	dc.w $0800,$01a0
	dc.l loc_08f60c
	dc.w $0800,$01a0
	dc.l loc_08f62a
	dc.w $0800,$01a0
	dc.l loc_08f648
	dc.w $0800,$01a0
	dc.l loc_08f666
	dc.w $0800,$01a0
	dc.l loc_08f684
	dc.w $0800,$01a0
	dc.l loc_08f6a2
	dc.w $0800,$01a0
	dc.l loc_08f6c0
	dc.w $0800,$01a0
	dc.l loc_08f6de
	dc.w $0840,$01a0
	dc.l loc_08f6f4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f03e:
	dc.w $0800,$0360
	dc.l loc_08f70a
	dc.w $0800,$0360
	dc.l loc_08f720
	dc.w $0800,$0360
	dc.l loc_08f73e
	dc.w $0800,$0360
	dc.l loc_08f75c
	dc.w $0800,$0360
	dc.l loc_08f77a
	dc.w $0800,$0360
	dc.l loc_08f798
	dc.w $0800,$0360
	dc.l loc_08f7b6
	dc.w $0800,$0360
	dc.l loc_08f7d4
	dc.w $0800,$0360
	dc.l loc_08f7f2
	dc.w $0800,$0360
	dc.l loc_08f818
	dc.w $0800,$0360
	dc.l loc_08f83e
	dc.w $0800,$0360
	dc.l loc_08f85c
	dc.w $0800,$0360
	dc.l loc_08f87a
	dc.w $0800,$0360
	dc.l loc_08f898
	dc.w $0800,$0360
	dc.l loc_08f8b6
	dc.w $0800,$0360
	dc.l loc_08f8d4
	dc.w $0800,$0360
	dc.l loc_08f8f2
	dc.w $0800,$0360
	dc.l loc_08f910
	dc.w $0800,$0360
	dc.l loc_08f92e
	dc.w $0800,$0360
	dc.l loc_08f94c
	dc.w $0800,$0360
	dc.l loc_08f96a
	dc.w $0800,$0360
	dc.l loc_08f988
	dc.w $0800,$0360
	dc.l loc_08f9a6
	dc.w $0800,$0360
	dc.l loc_08f9c4
	dc.w $0800,$0360
	dc.l loc_08f9e2
	dc.w $0800,$0360
	dc.l loc_08fa00
	dc.w $0800,$0360
	dc.l loc_08fa1e
	dc.w $0800,$0360
	dc.l loc_08fa3c
	dc.w $0800,$0360
	dc.l loc_08fa5a
	dc.w $0800,$0360
	dc.l loc_08fa78
	dc.w $0800,$0360
	dc.l loc_08fa96
	dc.w $0800,$0360
	dc.l loc_08fab4
	dc.w $0800,$0360
	dc.l loc_08fad2
	dc.w $0800,$0360
	dc.l loc_08fae8
	dc.w $0800,$0360
	dc.l loc_08fafe
	dc.w $0800,$0360
	dc.l loc_08fb14
	dc.w $0800,$0360
	dc.l loc_08fb2a
	dc.w $0800,$0360
	dc.l loc_08fb40
	dc.w $0800,$0360
	dc.l loc_08fb56
	dc.w $0800,$0360
	dc.l loc_08fb6c
	dc.w $0800,$0360
	dc.l loc_08fb82
	dc.w $0800,$0360
	dc.l loc_08fba0
	dc.w $0800,$0360
	dc.l loc_08fbbe
	dc.w $0800,$0360
	dc.l loc_08fbdc
	dc.w $0800,$0360
	dc.l loc_08fbfa
	dc.w $0800,$0360
	dc.l loc_08fc18
	dc.w $0800,$0360
	dc.l loc_08fc36
	dc.w $0800,$0360
	dc.l loc_08fc54
	dc.w $0800,$0360
	dc.l loc_08fc72
	dc.w $0800,$0360
	dc.l loc_08fc88
	dc.w $0800,$0360
	dc.l loc_08fc9e
	dc.w $0800,$0360
	dc.l loc_08fcb4
	dc.w $0800,$0360
	dc.l loc_08fcca
	dc.w $0840,$0360
	dc.l loc_08fce0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f1ee:
	dc.w $0800,$0020
	dc.l loc_08fcf6
	dc.w $0800,$0020
	dc.l loc_08fd12
	dc.w $0800,$0030
	dc.l loc_08fd2e
	dc.w $0800,$0030
	dc.l loc_08fd46
	dc.w $0800,$0040
	dc.l loc_08fd5e
	dc.w $0800,$0030
	dc.l loc_08fd74
	dc.w $0800,$0030
	dc.l loc_08fd8c
	dc.w $0800,$0020
	dc.l loc_08fda4
	dc.w $0800,$0040
	dc.l loc_08fdc0
	dc.w $0800,$0030
	dc.l loc_08fdd6
	dc.w $0800,$0030
	dc.l loc_08fdee
	dc.w $0800,$0030
	dc.l loc_08fe06
	dc.w $0800,$0020
	dc.l loc_08fe1e
	dc.w $0800,$0040
	dc.l loc_08fe3a
	dc.w $0800,$0040
	dc.l loc_08fe50
	dc.w $0800,$0040
	dc.l loc_08fe66
	dc.w $0800,$0040
	dc.l loc_08fe7c
	dc.w $0800,$0020
	dc.l loc_08fe92
	dc.w $0800,$0040
	dc.l loc_08fd5e
	dc.w $0800,$0020
	dc.l loc_08fe92
	dc.w $0800,$0030
	dc.l loc_08fd8c
	dc.w $0800,$0040
	dc.l loc_08feae
	dc.w $0800,$0030
	dc.l loc_08fec4
	dc.w $0800,$0020
	dc.l loc_09010c
	dc.w $0800,$0040
	dc.l loc_08fedc
	dc.w $0800,$0040
	dc.l loc_08fef2
	dc.w $0800,$0040
	dc.l loc_08ff08
	dc.w $0800,$0030
	dc.l loc_08ff1e
	dc.w $0800,$0040
	dc.l loc_08ff36
	dc.w $0800,$0030
	dc.l loc_08ff4c
	dc.w $0800,$0020
	dc.l loc_08ff64
	dc.w $0840,$0020
	dc.l loc_08ff80

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f2ee:
	dc.w $0800,$0020
	dc.l loc_08fcf6
	dc.w $0800,$0020
	dc.l loc_08fd12
	dc.w $0800,$0030
	dc.l loc_08ff9c
	dc.w $0800,$0040
	dc.l loc_08ffb4
	dc.w $0800,$0040
	dc.l loc_08fd5e
	dc.w $0800,$0030
	dc.l loc_08fd74
	dc.w $0800,$0030
	dc.l loc_08fd8c
	dc.w $0800,$0020
	dc.l loc_08fda4
	dc.w $0800,$0040
	dc.l loc_08fdc0
	dc.w $0800,$0030
	dc.l loc_08fdd6
	dc.w $0800,$0040
	dc.l loc_08feae
	dc.w $0800,$0030
	dc.l loc_08fe06
	dc.w $0800,$0020
	dc.l loc_08fe1e
	dc.w $0800,$0040
	dc.l loc_08fe3a
	dc.w $0800,$0040
	dc.l loc_08fe50
	dc.w $0800,$0040
	dc.l loc_08fe66
	dc.w $0800,$0040
	dc.l loc_08fe7c
	dc.w $0800,$0020
	dc.l loc_08fe92
	dc.w $0800,$0040
	dc.l loc_08fd5e
	dc.w $0800,$0020
	dc.l loc_08fe92
	dc.w $0800,$0030
	dc.l loc_08fd8c
	dc.w $0800,$0040
	dc.l loc_08ff36
	dc.w $0800,$0030
	dc.l loc_08fec4
	dc.w $0800,$0020
	dc.l loc_09010c
	dc.w $0800,$0040
	dc.l loc_08fedc
	dc.w $0800,$0040
	dc.l loc_08fef2
	dc.w $0800,$0040
	dc.l loc_08ff08
	dc.w $0800,$0030
	dc.l loc_08ff1e
	dc.w $0800,$0030
	dc.l loc_08fdee
	dc.w $0800,$0030
	dc.l loc_08ff4c
	dc.w $0800,$0020
	dc.l loc_08ff64
	dc.w $0840,$0020
	dc.l loc_08ff80

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f3ee:
	dc.w $0800,$0060
	dc.l loc_08ffca
	dc.w $0800,$0060
	dc.l loc_08ffe8
	dc.w $0800,$0060
	dc.l loc_090006
	dc.w $0800,$0060
	dc.l loc_090024
	dc.w $0800,$0060
	dc.l loc_090042
	dc.w $0840,$0060
	dc.l loc_090068

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f41e:
	dc.w $ff40,$0000
	dc.l loc_09008e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f426:
	dc.w $0008,$0032,$0001
	dc.w $05c7,$180f,$0000,$fff0
	dc.w $05e0,$1e0f,$0090,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f43c:
	dc.w $0008,$0032,$0002
	dc.w $05ef,$100f,$fff0,$fff0
	dc.w $05c7,$180f,$0010,$fff0
	dc.w $05e0,$1d0f,$00a0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f45a:
	dc.w $0008,$0032,$0002
	dc.w $05ee,$110f,$fff0,$fff0
	dc.w $05c7,$180f,$0020,$fff0
	dc.w $05e0,$1c0f,$00b0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f478:
	dc.w $0008,$0032,$0002
	dc.w $05ed,$120f,$fff0,$fff0
	dc.w $05c7,$180f,$0030,$fff0
	dc.w $05e0,$1b0f,$00c0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f496:
	dc.w $0008,$0032,$0002
	dc.w $05ec,$130f,$fff0,$fff0
	dc.w $05c7,$180f,$0040,$fff0
	dc.w $05e0,$1a0f,$00d0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f4b4:
	dc.w $0008,$0032,$0002
	dc.w $05eb,$140f,$fff0,$fff0
	dc.w $05c7,$180f,$0050,$fff0
	dc.w $05e0,$190f,$00e0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f4d2:
	dc.w $0008,$0032,$0002
	dc.w $05ea,$150f,$fff0,$fff0
	dc.w $05c7,$180f,$0060,$fff0
	dc.w $05e0,$180f,$00f0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f4f0:
	dc.w $0008,$0032,$0002
	dc.w $05e9,$160f,$fff0,$fff0
	dc.w $05c7,$180f,$0070,$fff0
	dc.w $05e0,$170f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f50e:
	dc.w $0008,$0032,$0002
	dc.w $05e8,$170f,$fff0,$fff0
	dc.w $05c7,$180f,$0080,$fff0
	dc.w $05e0,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f52c:
	dc.w $0008,$0032,$0002
	dc.w $05e7,$180f,$fff0,$fff0
	dc.w $05c7,$180f,$0090,$fff0
	dc.w $05e0,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f54a:
	dc.w $0008,$0032,$0002
	dc.w $05e6,$190f,$fff0,$fff0
	dc.w $05c7,$180f,$00a0,$fff0
	dc.w $05e0,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f568:
	dc.w $0008,$0032,$0002
	dc.w $05e5,$1a0f,$fff0,$fff0
	dc.w $05c7,$180f,$00b0,$fff0
	dc.w $05e0,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f586:
	dc.w $0008,$0032,$0002
	dc.w $05e4,$1b0f,$fff0,$fff0
	dc.w $05c7,$180f,$00c0,$fff0
	dc.w $05e0,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f5a4:
	dc.w $0008,$0032,$0002
	dc.w $05e3,$1c0f,$fff0,$fff0
	dc.w $05c7,$180f,$00d0,$fff0
	dc.w $05e0,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f5c2:
	dc.w $0008,$0032,$0002
	dc.w $05e2,$1d0f,$fff0,$fff0
	dc.w $05c7,$180f,$00e0,$fff0
	dc.w $05e0,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f5e0:
	dc.w $0008,$0032,$0001
	dc.w $05e1,$1e0f,$fff0,$fff0
	dc.w $05c7,$180f,$00f0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f5f6:
	dc.w $0008,$0032,$0001
	dc.w $05e0,$1f0f,$fff0,$fff0
	dc.w $05c7,$170f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f60c:
	dc.w $0008,$0032,$0002
	dc.w $05cf,$100f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0000,$fff0
	dc.w $05c7,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f62a:
	dc.w $0008,$0032,$0002
	dc.w $05ce,$110f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0010,$fff0
	dc.w $05c7,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f648:
	dc.w $0008,$0032,$0002
	dc.w $05cd,$120f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0020,$fff0
	dc.w $05c7,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f666:
	dc.w $0008,$0032,$0002
	dc.w $05cc,$130f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0030,$fff0
	dc.w $05c7,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f684:
	dc.w $0008,$0032,$0002
	dc.w $05cb,$140f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0040,$fff0
	dc.w $05c7,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f6a2:
	dc.w $0008,$0032,$0002
	dc.w $05ca,$150f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0050,$fff0
	dc.w $05c7,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f6c0:
	dc.w $0008,$0032,$0002
	dc.w $05c9,$160f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0060,$fff0
	dc.w $05c7,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f6de:
	dc.w $0008,$0032,$0001
	dc.w $05c8,$170f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0070,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f6f4:
	dc.w $0008,$0032,$0001
	dc.w $05c7,$180f,$fff0,$fff0
	dc.w $05e0,$1f0f,$0080,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f70a:
	dc.w $0008,$0032,$0001
	dc.w $0562,$1d0f,$0000,$fff0
	dc.w $0580,$190f,$00e0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f720:
	dc.w $0008,$0032,$0002
	dc.w $05c6,$100f,$fff0,$fff0
	dc.w $0562,$1d0f,$0010,$fff0
	dc.w $0580,$180f,$00f0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f73e:
	dc.w $0008,$0032,$0002
	dc.w $05c5,$110f,$fff0,$fff0
	dc.w $0562,$1d0f,$0020,$fff0
	dc.w $0580,$170f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f75c:
	dc.w $0008,$0032,$0002
	dc.w $05c4,$120f,$fff0,$fff0
	dc.w $0562,$1d0f,$0030,$fff0
	dc.w $0580,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f77a:
	dc.w $0008,$0032,$0002
	dc.w $05c3,$130f,$fff0,$fff0
	dc.w $0562,$1d0f,$0040,$fff0
	dc.w $0580,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f798:
	dc.w $0008,$0032,$0002
	dc.w $05c2,$140f,$fff0,$fff0
	dc.w $0562,$1d0f,$0050,$fff0
	dc.w $0580,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f7b6:
	dc.w $0008,$0032,$0002
	dc.w $05c1,$150f,$fff0,$fff0
	dc.w $0562,$1d0f,$0060,$fff0
	dc.w $0580,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f7d4:
	dc.w $0008,$0032,$0002
	dc.w $05c0,$160f,$fff0,$fff0
	dc.w $0562,$1d0f,$0070,$fff0
	dc.w $0580,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f7f2:
	dc.w $0008,$0032,$0003
	dc.w $05af,$100f,$fff0,$fff0
	dc.w $05c0,$160f,$0000,$fff0
	dc.w $0562,$1d0f,$0080,$fff0
	dc.w $0580,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f818:
	dc.w $0008,$0032,$0003
	dc.w $05ae,$110f,$fff0,$fff0
	dc.w $05c0,$160f,$0010,$fff0
	dc.w $0562,$1d0f,$0090,$fff0
	dc.w $0580,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f83e:
	dc.w $0008,$0032,$0002
	dc.w $05ad,$120f,$fff0,$fff0
	dc.w $05c0,$160f,$0020,$fff0
	dc.w $0562,$1d0f,$00a0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f85c:
	dc.w $0008,$0032,$0002
	dc.w $05ac,$130f,$fff0,$fff0
	dc.w $05c0,$160f,$0030,$fff0
	dc.w $0562,$1c0f,$00b0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f87a:
	dc.w $0008,$0032,$0002
	dc.w $05ab,$140f,$fff0,$fff0
	dc.w $05c0,$160f,$0040,$fff0
	dc.w $0562,$1b0f,$00c0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f898:
	dc.w $0008,$0032,$0002
	dc.w $05aa,$150f,$fff0,$fff0
	dc.w $05c0,$160f,$0050,$fff0
	dc.w $0562,$1a0f,$00d0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f8b6:
	dc.w $0008,$0032,$0002
	dc.w $05a9,$160f,$fff0,$fff0
	dc.w $05c0,$160f,$0060,$fff0
	dc.w $0562,$190f,$00e0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f8d4:
	dc.w $0008,$0032,$0002
	dc.w $05a8,$170f,$fff0,$fff0
	dc.w $05c0,$160f,$0070,$fff0
	dc.w $0562,$180f,$00f0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f8f2:
	dc.w $0008,$0032,$0002
	dc.w $05a7,$180f,$fff0,$fff0
	dc.w $05c0,$160f,$0080,$fff0
	dc.w $0562,$170f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f910:
	dc.w $0008,$0032,$0002
	dc.w $05a6,$190f,$fff0,$fff0
	dc.w $05c0,$160f,$0090,$fff0
	dc.w $0562,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f92e:
	dc.w $0008,$0032,$0002
	dc.w $05a5,$1a0f,$fff0,$fff0
	dc.w $05c0,$160f,$00a0,$fff0
	dc.w $0562,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f94c:
	dc.w $0008,$0032,$0002
	dc.w $05a4,$1b0f,$fff0,$fff0
	dc.w $05c0,$160f,$00b0,$fff0
	dc.w $0562,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f96a:
	dc.w $0008,$0032,$0002
	dc.w $05a3,$1c0f,$fff0,$fff0
	dc.w $05c0,$160f,$00c0,$fff0
	dc.w $0562,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f988:
	dc.w $0008,$0032,$0002
	dc.w $05a2,$1d0f,$fff0,$fff0
	dc.w $05c0,$160f,$00d0,$fff0
	dc.w $0562,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f9a6:
	dc.w $0008,$0032,$0002
	dc.w $05a1,$1e0f,$fff0,$fff0
	dc.w $05c0,$160f,$00e0,$fff0
	dc.w $0562,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f9c4:
	dc.w $0008,$0032,$0002
	dc.w $05a0,$1f0f,$fff0,$fff0
	dc.w $05c0,$160f,$00f0,$fff0
	dc.w $0562,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08f9e2:
	dc.w $0008,$0032,$0002
	dc.w $058f,$100f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0000,$fff0
	dc.w $05c0,$160f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa00:
	dc.w $0008,$0032,$0002
	dc.w $058e,$110f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0010,$fff0
	dc.w $05c0,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa1e:
	dc.w $0008,$0032,$0002
	dc.w $058d,$120f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0020,$fff0
	dc.w $05c0,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa3c:
	dc.w $0008,$0032,$0002
	dc.w $058c,$130f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0030,$fff0
	dc.w $05c0,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa5a:
	dc.w $0008,$0032,$0002
	dc.w $058b,$140f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0040,$fff0
	dc.w $05c0,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa78:
	dc.w $0008,$0032,$0002
	dc.w $058a,$150f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0050,$fff0
	dc.w $05c0,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fa96:
	dc.w $0008,$0032,$0002
	dc.w $0589,$160f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0060,$fff0
	dc.w $05c0,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fab4:
	dc.w $0008,$0032,$0002
	dc.w $0588,$170f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0070,$fff0
	dc.w $05c0,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fad2:
	dc.w $0008,$0032,$0001
	dc.w $0587,$180f,$fff0,$fff0
	dc.w $05a0,$1f0f,$0080,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fae8:
	dc.w $0008,$0032,$0001
	dc.w $0586,$190f,$fff0,$fff0
	dc.w $05a0,$1e0f,$0090,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fafe:
	dc.w $0008,$0032,$0001
	dc.w $0585,$1a0f,$fff0,$fff0
	dc.w $05a0,$1d0f,$00a0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb14:
	dc.w $0008,$0032,$0001
	dc.w $0584,$1b0f,$fff0,$fff0
	dc.w $05a0,$1c0f,$00b0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb2a:
	dc.w $0008,$0032,$0001
	dc.w $0583,$1c0f,$fff0,$fff0
	dc.w $05a0,$1b0f,$00c0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb40:
	dc.w $0008,$0032,$0001
	dc.w $0582,$1d0f,$fff0,$fff0
	dc.w $05a0,$1a0f,$00d0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb56:
	dc.w $0008,$0032,$0001
	dc.w $0581,$1e0f,$fff0,$fff0
	dc.w $05a0,$190f,$00e0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb6c:
	dc.w $0008,$0032,$0001
	dc.w $0580,$1f0f,$fff0,$fff0
	dc.w $05a0,$180f,$00f0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fb82:
	dc.w $0008,$0032,$0002
	dc.w $056f,$100f,$fff0,$fff0
	dc.w $0580,$1f0f,$0000,$fff0
	dc.w $05a0,$170f,$0100,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fba0:
	dc.w $0008,$0032,$0002
	dc.w $056e,$110f,$fff0,$fff0
	dc.w $0580,$1f0f,$0010,$fff0
	dc.w $05a0,$160f,$0110,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fbbe:
	dc.w $0008,$0032,$0002
	dc.w $056d,$120f,$fff0,$fff0
	dc.w $0580,$1f0f,$0020,$fff0
	dc.w $05a0,$150f,$0120,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fbdc:
	dc.w $0008,$0032,$0002
	dc.w $056c,$130f,$fff0,$fff0
	dc.w $0580,$1f0f,$0030,$fff0
	dc.w $05a0,$140f,$0130,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fbfa:
	dc.w $0008,$0032,$0002
	dc.w $056b,$140f,$fff0,$fff0
	dc.w $0580,$1f0f,$0040,$fff0
	dc.w $05a0,$130f,$0140,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc18:
	dc.w $0008,$0032,$0002
	dc.w $056a,$150f,$fff0,$fff0
	dc.w $0580,$1f0f,$0050,$fff0
	dc.w $05a0,$120f,$0150,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc36:
	dc.w $0008,$0032,$0002
	dc.w $0569,$160f,$fff0,$fff0
	dc.w $0580,$1f0f,$0060,$fff0
	dc.w $05a0,$110f,$0160,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc54:
	dc.w $0008,$0032,$0002
	dc.w $0568,$170f,$fff0,$fff0
	dc.w $0580,$1f0f,$0070,$fff0
	dc.w $05a0,$100f,$0170,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc72:
	dc.w $0008,$0032,$0001
	dc.w $0567,$180f,$fff0,$fff0
	dc.w $0580,$1f0f,$0080,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc88:
	dc.w $0008,$0032,$0001
	dc.w $0566,$190f,$fff0,$fff0
	dc.w $0580,$1e0f,$0090,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fc9e:
	dc.w $0008,$0032,$0001
	dc.w $0565,$1a0f,$fff0,$fff0
	dc.w $0580,$1d0f,$00a0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fcb4:
	dc.w $0008,$0032,$0001
	dc.w $0564,$1b0f,$fff0,$fff0
	dc.w $0580,$1c0f,$00b0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fcca:
	dc.w $0008,$0032,$0001
	dc.w $0563,$1c0f,$fff0,$fff0
	dc.w $0580,$1b0f,$00c0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fce0:
	dc.w $0008,$0032,$0001
	dc.w $0562,$1d0f,$fff0,$fff0
	dc.w $0580,$1a0f,$00d0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fcf6:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $07a5,$07a5,$07a5,$07a5
	dc.w $07a5,$07a5,$07a5,$07a5

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd12:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $07a6,$07a6,$07a6,$07a6
	dc.w $07a6,$07a6,$07a6,$07a6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd2e:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $0775,$0775
	dc.w $0775,$0775
	dc.w $0775,$0775

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd46:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $076e,$076e
	dc.w $076e,$076e
	dc.w $076e,$076e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd5e:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0760,$0760
	dc.w $0760,$0760
	dc.w $0760

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd74:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $076f,$076f,$076f
	dc.w $076f,$076f,$076f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fd8c:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $0776,$0776,$0776
	dc.w $0776,$0776,$0776

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fda4:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fdc0:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0767,$0767
	dc.w $0767,$0767
	dc.w $0767

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fdd6:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $079e,$079e
	dc.w $079e,$079e
	dc.w $079e,$079e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fdee:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $079f,$079f
	dc.w $079f,$079f
	dc.w $079f,$079f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe06:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $0778,$0778
	dc.w $0778,$0778
	dc.w $0778,$0778

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe1e:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe3a:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0769,$0769
	dc.w $0769,$0769
	dc.w $0769

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe50:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0761,$0761
	dc.w $0761,$0761
	dc.w $0761

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe66:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0762,$0762
	dc.w $0762,$0762
	dc.w $0762

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe7c:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0763,$0763
	dc.w $0763,$0763
	dc.w $0763

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fe92:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $07a9,$07a9
	dc.w $07a9,$07a9
	dc.w $07a9,$07a9
	dc.w $07a9,$07a9

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08feae:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $072f,$072f
	dc.w $072f,$072f
	dc.w $072f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fec4:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $077a,$077a
	dc.w $077a,$077a
	dc.w $077a,$077a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fedc:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $0764,$0764
	dc.w $0764,$0764
	dc.w $0764

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08fef2:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $076b,$076b
	dc.w $076b,$076b
	dc.w $076b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff08:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $076c,$076c
	dc.w $076c,$076c
	dc.w $076c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff1e:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $07b0,$07b0
	dc.w $07b0,$07b0
	dc.w $07b0,$07b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff36:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $076d,$076d
	dc.w $076d,$076d
	dc.w $076d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff4c:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $07b1,$07b1
	dc.w $07b1,$07b1
	dc.w $07b1,$07b1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff64:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $2a2f,$2a2f
	dc.w $2a2f,$2a2f
	dc.w $2a2f,$2a2f
	dc.w $2a2f,$2a2f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff80:
	dc.w $000a,$0010,$0007,$1010
	dc.l loc_09010e
	dc.w $29ff,$29ff
	dc.w $29ff,$29ff
	dc.w $29ff,$29ff
	dc.w $29ff,$29ff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ff9c:
	dc.w $000a,$0012,$0005,$2010
	dc.l loc_09012e
	dc.w $073d,$073d
	dc.w $073d,$073d
	dc.w $073d,$073d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ffb4:
	dc.w $000a,$0014,$0004,$3010
	dc.l loc_090146
	dc.w $072e,$072e
	dc.w $072e,$072e
	dc.w $072e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ffca:
	dc.w $0008,$0060,$0002
	dc.w $0709,$530d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff70
	dc.w $0709,$230d,$ffe0,$ffd0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_08ffe8:
	dc.w $0008,$0060,$0002
	dc.w $0719,$430d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff60
	dc.w $0709,$330d,$ffe0,$ffc0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090006:
	dc.w $0008,$0060,$0002
	dc.w $0729,$330d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff50
	dc.w $0709,$430d,$ffe0,$ffb0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090024:
	dc.w $0008,$0060,$0002
	dc.w $0739,$230d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff40
	dc.w $0709,$530d,$ffe0,$ffa0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090042:
	dc.w $0008,$0060,$0003
	dc.w $0749,$130d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff30
	dc.w $0709,$530d,$ffe0,$ff90
	dc.w $0709,$030d,$ffe0,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090068:
	dc.w $0008,$0060,$0003
	dc.w $0759,$030d,$ffe0,$ff10
	dc.w $0709,$530d,$ffe0,$ff20
	dc.w $0709,$530d,$ffe0,$ff80
	dc.w $0709,$130d,$ffe0,$ffe0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09008e:
	dc.w $0008,$003c,$000e
	dc.w $07aa,$030a,$ffe0,$ff90
	dc.w $07aa,$030a,$ffe0,$ffa0
	dc.w $07aa,$030a,$ffe0,$ffb0
	dc.w $07aa,$030a,$ffe0,$ffc0
	dc.w $07aa,$030a,$ffe0,$ffd0
	dc.w $07aa,$030a,$ffe0,$ffe0
	dc.w $07aa,$030a,$ffe0,$fff0
	dc.w $07aa,$030a,$ffe0,$0000
	dc.w $07aa,$030a,$ffe0,$0010
	dc.w $07aa,$030a,$ffe0,$0020
	dc.w $07aa,$030a,$ffe0,$0030
	dc.w $07aa,$030a,$ffe0,$0040
	dc.w $07aa,$030a,$ffe0,$0050
	dc.w $07aa,$030a,$ffe0,$0060
	dc.w $07aa,$030a,$ffe0,$0070

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09010c:
	dc.w $0012

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09010e:
	dc.w $fff8,$ff10,$fff8,$ff30
	dc.w $fff8,$ff50,$fff8,$ff70
	dc.w $fff8,$ff90,$fff8,$ffb0
	dc.w $fff8,$ffd0,$fff8,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09012e:
	dc.w $fff8,$ff00,$fff8,$ff30
	dc.w $fff8,$ff60,$fff8,$ff90
	dc.w $fff8,$ffc0,$fff8,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090146:
	dc.w $fff8,$fef0
	dc.w $fff8,$ff30
	dc.w $fff8,$ff70
	dc.w $fff8,$ffb0
	dc.w $fff8,$fff0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09015a:
	dc.w $ffd0,$fff8
	dc.w $ffd0,$ffe8
	dc.w $ffd0,$ffd8
	dc.w $ffd0,$ffc8
	dc.w $ffd0,$ffb8
	dc.w $ffd0,$ffa8
	dc.w $ffd0,$ff98
	dc.w $ffd0,$ff88
	dc.w $ffd0,$ff78
	dc.w $ffd0,$ff68
	dc.w $ffd0,$ff58
	dc.w $ffd0,$ff48
	dc.w $0020,$fff8
	dc.w $0020,$ffe8
	dc.w $0020,$ffd8
	dc.w $0020,$ffc8
	dc.w $0020,$ffb8
	dc.w $0020,$ffa8
	dc.w $0020,$ff98
	dc.w $0020,$ff88
	dc.w $0020,$ff78
	dc.w $0020,$ff68
	dc.w $0020,$ff58
	dc.w $0020,$ff48

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0901ba:
	dc.w $ffe0,$fff8
	dc.w $ffe0,$ffe8
	dc.w $ffe0,$ffd8
	dc.w $ffe0,$ffc8
	dc.w $ffe0,$ffb8
	dc.w $ffe0,$ffa8
	dc.w $ffe0,$ff98
	dc.w $ffe0,$ff88
	dc.w $ffe0,$ff78
	dc.w $ffe0,$ff68
	dc.w $ffe0,$ff58
	dc.w $ffe0,$ff48

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0901ea:
	dc.w $ffb0,$fff8
	dc.w $ffd0,$fff8
	dc.w $ffe0,$fff8
	dc.w $0020,$fff8
	dc.w $0030,$fff8
	dc.w $ffd0,$fff8
	dc.w $ffe0,$fff8
	dc.w $0020,$fff8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09020a:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($48,a6),d0
	add.w ($40,a6),d0
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_090230
	eor.w d0,d1
	bmi.b loc_090234

loc_090230:
	moveq #1,d0
	rts

loc_090234:
	moveq #0,d0
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090238:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_09025e
	eor.w d0,d1
	bmi.b loc_090262

loc_09025e:
	moveq #1,d0
	rts

loc_090262:
	moveq #0,d0
	rts
