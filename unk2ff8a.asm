;==============================================
loc_02ff8a:
	moveq #0,d0
	move.b ($2a0,a6),d0
	tst.b ($2ad,a6)
	beq.b loc_02ff9a
	move.b ($2ae,a6),d0

loc_02ff9a:
	move.w loc_02ffaa(pc,d0.w),d1
	jsr loc_02ffaa(pc,d1.w)
	move.b ($2a0,a6),($2a1,a6)

loc_02ffa8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02ffaa:
	dc.w loc_03000e-loc_02ffaa;0064
	dc.w loc_030018-loc_02ffaa;006e
	dc.w loc_030018-loc_02ffaa;006e
	dc.w loc_0300ae-loc_02ffaa;0104
	dc.w loc_0300d4-loc_02ffaa;012a
	dc.w loc_0300ee-loc_02ffaa;0144
	dc.w loc_030110-loc_02ffaa;0166
	dc.w loc_03011a-loc_02ffaa;0170

	dc.w loc_03013c-loc_02ffaa;0192
	dc.w loc_0301b2-loc_02ffaa;0208
	dc.w loc_0301b2-loc_02ffaa;0208
	dc.w loc_0301b2-loc_02ffaa;0208
	dc.w loc_030204-loc_02ffaa;025a
	dc.w loc_030222-loc_02ffaa;0278
	dc.w loc_030250-loc_02ffaa;02a6
	dc.w loc_030250-loc_02ffaa;02a6

	dc.w loc_0303f2-loc_02ffaa;0448
	dc.w loc_03040c-loc_02ffaa;0462
	dc.w loc_030436-loc_02ffaa;048c
	dc.w loc_030436-loc_02ffaa;048c
	dc.w loc_030436-loc_02ffaa;048c
	dc.w loc_030462-loc_02ffaa;04b8
	dc.w loc_030472-loc_02ffaa;04c8
	dc.w loc_030486-loc_02ffaa;04dc

	dc.w loc_03049a-loc_02ffaa;04f0
	dc.w loc_03049a-loc_02ffaa;04f0
	dc.w loc_03049a-loc_02ffaa;04f0
	dc.w loc_03049a-loc_02ffaa;04f0
	dc.w loc_03049a-loc_02ffaa;04f0
	dc.w loc_0304c2-loc_02ffaa;0518
	dc.w loc_0304de-loc_02ffaa;0534
	dc.w loc_0304fc-loc_02ffaa;0552

	dc.w loc_03051a-loc_02ffaa;0570
	dc.w loc_03052a-loc_02ffaa;0580
	dc.w loc_030544-loc_02ffaa;059a
	dc.w loc_03056c-loc_02ffaa;05c2
	dc.w loc_030584-loc_02ffaa;05da
	dc.w loc_030584-loc_02ffaa;05da
	dc.w loc_030584-loc_02ffaa;05da
	dc.w loc_0305b2-loc_02ffaa;0608

	dc.w loc_0305e8-loc_02ffaa;063e
	dc.w loc_030620-loc_02ffaa;0676
	dc.w loc_03063c-loc_02ffaa;0692
	dc.w loc_030660-loc_02ffaa;06b6
	dc.w loc_030672-loc_02ffaa;06c8
	dc.w loc_030696-loc_02ffaa;06ec
	dc.w loc_0306ba-loc_02ffaa;0710
	dc.w loc_0306cc-loc_02ffaa;0722

	dc.w loc_0306ec-loc_02ffaa;0742
	dc.w loc_03070c-loc_02ffaa;0762

;==============================================
loc_03000e:
	cmp.b ($2a1,a6),d0
	bne.w loc_0303ca
	rts

;==============================================
loc_030018:
	move.b d0,d5
	subq.b #2,d5
	move.b ($271,a6),d0
	move.w loc_030028(pc,d0.w),d1
	jmp loc_030028(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030028:
	dc.w loc_030032-loc_030028
	dc.w loc_030048-loc_030028
	dc.w loc_03005e-loc_030028
	dc.w loc_03005e-loc_030028
	dc.w loc_030086-loc_030028

;----------------------------------------------
loc_030032:
	moveq #0,d0
	add.b d5,d0
	btst.b #0,($b4,a5)
	beq.w loc_0302b8
	moveq #1,d0
	add.b d5,d0
	bra.w loc_0302b8

;----------------------------------------------
loc_030048:
	moveq #$18,d0
	add.b d5,d0
	btst.b #0,($b4,a5)
	beq.w loc_0302b8
	moveq #$19,d0
	add.b d5,d0
	bra.w loc_0302b8

;----------------------------------------------
loc_03005e:
	btst.b #0,($b4,a5)
	bne.b loc_030076
	moveq #0,d0
	add.b d5,d0
	bsr.w loc_0302b8
	moveq #$18,d0
	add.b d5,d0
	bra.w loc_030300

loc_030076:
	moveq #1,d0
	add.b d5,d0
	bsr.w loc_0302b8
	moveq #$19,d0
	add.b d5,d0
	bra.w loc_030300

;----------------------------------------------
loc_030086:
	btst.b #0,($b4,a5)
	bne.b loc_03009e
	moveq #0,d0
	add.b d5,d0
	bsr.w loc_0302b8
	moveq #0,d0
	add.b d5,d0
	bra.w loc_030300

loc_03009e:
	moveq #1,d0
	add.b d5,d0
	bsr.w loc_0302b8
	moveq #1,d0
	add.b d5,d0
	bra.w loc_030300

;==============================================
loc_0300ae:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #$e,d0
	moveq #4,d1
	bsr.w loc_0302fa
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.b d0,d0
	add.b ($128,a6),d0
	addi.b #8,d0
	bra.w loc_0302b8

;==============================================
loc_0300d4:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #3,d1
	bsr.w loc_0303de
	bsr.w loc_0302c8
	bsr.w loc_0303be
	bra.w loc_0302c8

;==============================================
loc_0300ee:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	move.b ($128,a6),d0
	add.w d0,d0
	addq.w #4,d0
	moveq #3,d1
	bsr.w loc_0302fa
	bsr.w loc_0302c8
	bsr.w loc_0303be
	bra.w loc_0302c8

;==============================================
loc_030110:
	move.b #0,($2a0,a6)
	bra.w loc_0303ca

;==============================================
loc_03011a:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	movea.l ($150,a6),a1
	move.l #$fff0fff,d1
	bsr.w loc_030296
	cmpi.b #4,($271,a6)
	bcc.w loc_0302a6
	rts

;==============================================
loc_03013c:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	movea.l ($14c,a6),a0
	movea.l ($150,a6),a1
	bsr.w loc_030160
	cmpi.b #4,($271,a6)
	bcc.w loc_03015c
	rts

loc_03015c:
	bsr.w loc_030160

loc_030160:
	moveq #$f,d5

loc_030162:
	move.w (a0)+,d1
	move.w d1,d2
	move.w d1,d3
	move.w (a1),d0
	andi.w #$f000,d0
	andi.w #$f00,d1
	andi.w #$f0,d2
	andi.w #$f,d3
	addi.w #$200,d1
	cmpi.w #$1000,d1
	bcs.b loc_030188
	move.w #$f00,d1

loc_030188:
	addi.w #$20,d2
	cmpi.w #$100,d2
	bcs.b loc_030196
	move.w #$f0,d2

loc_030196:
	addi.w #2,d3
	cmpi.w #$10,d3
	bcs.b loc_0301a4
	move.w #$f,d3

loc_0301a4:
	or.w d1,d0
	or.w d2,d0
	or.w d3,d0
	move.w d0,(a1)+
	dbra d5,loc_030162
	rts

;==============================================
loc_0301b2:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	move.b d0,d5
	lsr.b #1,d5
	addi.b #$c,d5
	move.b ($271,a6),d0
	move.w loc_0301ce(pc,d0.w),d1
	jmp loc_0301ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0301ce:
	dc.w loc_0301d8-loc_0301ce
	dc.w loc_0301de-loc_0301ce
	dc.w loc_0301e8-loc_0301ce
	dc.w loc_0301e8-loc_0301ce
	dc.w loc_0301f8-loc_0301ce

;----------------------------------------------
loc_0301d8:
	move.b d5,d0
	bra.w loc_0302b8

;----------------------------------------------
loc_0301de:
	move.b d5,d0
	addi.b #7,d0
	bra.w loc_0302b8

;----------------------------------------------
loc_0301e8:
	move.b d5,d0
	bsr.w loc_0302b8
	move.b d5,d0
	addi.b #$d,d0
	bra.w loc_030300

;----------------------------------------------
loc_0301f8:
	move.b d5,d0
	bsr.w loc_0302b8
	move.b d5,d0
	bra.w loc_030300

;==============================================
loc_030204:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	movea.l ($150,a6),a1
	moveq #0,d1
	bsr.w loc_030296
	cmpi.b #4,($271,a6)
	bcc.w loc_0302a6
	rts

;==============================================
loc_030222:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	bsr.w loc_0303be
	bsr.w loc_0302c8
	movea.l ($150,a6),a1
	lea.l ($60,a1),a1
	move.l #$f000f00,d1
	bsr.w loc_030296
	cmpi.b #4,($271,a6)
	bcc.w loc_0302a6
	rts

;==============================================
loc_030250:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	movea.l ($150,a6),a1
	subi.b #$e,d0
	ext.w d0
	add.w d0,d0
	move.l loc_030276(pc,d0.w),d1
	bsr.w loc_030296
	tst.b ($271,a6)
	bne.w loc_030296
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030276:
	dc.l $0fff0fff,$0f000f00,$0fbd0fbd,$077e077e
	dc.l $00000000,$00f000f0,$0ff30ff3,$053f053f


;==============================================
loc_030296:
	move.l (a1),d0
	andi.l #$f000f000,d0
	or.l d1,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3

loc_0302a6:
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	rts

;==============================================
loc_0302b8:
	bsr.w loc_030306

loc_0302bc:
	moveq #0,d1

loc_0302be:
	movea.l ($150,a6),a1
	lsl.w #5,d1
	lea.l (a1,d1.w),a1

loc_0302c8:
	move.l (a1),d4
	andi.l #$f000f000,d4
	movem.l (a0)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a0)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	rts

;==============================================
loc_0302fa:
	bsr.w loc_030306
	bra.b loc_0302be

;==============================================
loc_030300:
	bsr.w loc_030306
	bra.b loc_0302c8

;==============================================
loc_030306:
	movea.l #loc_3329d4,a0
	moveq #0,d2
	move.b ($102,a6),d2
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
;Mainpalette
loc_030326:
	movea.l #loc_32c094,a0
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	bra.w loc_0302be

;==============================================
loc_030342:
	movea.l #loc_3329d4,a0
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	bra.w loc_0302be

;==============================================
loc_03035e:
	movea.l #loc_34a7b4,a0
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	bra.w loc_0302be

;==============================================
loc_03037a:
	movea.l #loc_34a7b4,a0
	moveq #0,d2
	move.b ($102,a6),d2
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	bra.w loc_0302bc

;==============================================
loc_03039c:
	movea.l #loc_34a7b4,a0
	moveq #0,d2
	move.b ($102,a6),d2
	add.w d2,d2
	move.w (a0,d2.w),d2
	andi.w #$ff,d0
	lsl.w #5,d0
	add.w d2,d0
	lea.l (a0,d0.w),a0
	bra.w loc_0302be

;==============================================
loc_0303be:
	movea.l ($14c,a6),a0
	movea.l ($150,a6),a1
	bra.w loc_0302c8

;==============================================
loc_0303ca:
	movea.l ($14c,a6),a0
	movea.l ($150,a6),a1
	bsr.w loc_0302c8
	bsr.w loc_0302c8
	bra.w loc_0302c8

;==============================================
loc_0303de:
	move.w d1,d2
	movea.l ($14c,a6),a0
	andi.w #$ff,d2
	lsl.w #5,d2
	lea.l (a0,d2.w),a0
	bra.w loc_0302be

;==============================================
loc_0303f2:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	moveq #0,d1
	bra.b loc_03039c

;==============================================
loc_03040c:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	addq.w #3,d0
	moveq #3,d1
	bsr.w loc_03039c
	bsr.w loc_0302c8
	bra.b loc_0303be

;==============================================
loc_030436:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	subi.b #$24,d0
	lsr.b #1,d0
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	add.w d1,d0
	add.w d1,d1
	add.w d1,d0
	moveq #1,d1
	bsr.w loc_03039c
	bra.w loc_0303be

;==============================================
loc_030462:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	moveq #1,d1
	bra.w loc_03039c

;==============================================
loc_030472:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #1,d0
	moveq #2,d1
	bsr.w loc_03039c
	bra.w loc_0303be

;==============================================
loc_030486:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	moveq #1,d1
	bsr.w loc_03039c
	bra.w loc_0303be

;==============================================
loc_03049a:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	subi.b #$30,d0
	lsr.b #1,d0
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	add.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #0,d1
	bra.w loc_03039c

;==============================================
loc_0304c2:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	moveq #0,d1
	bra.w loc_03039c

;==============================================
loc_0304de:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	addq.w #6,d0
	moveq #2,d1
	bra.w loc_03039c

;==============================================
loc_0304fc:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	lsl.w #2,d0
	moveq #0,d1
	bra.w loc_03039c

;==============================================
loc_03051a:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	moveq #1,d1
	bra.w loc_03039c

;==============================================
loc_03052a:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	move.b ($101,a6),d0
	andi.w #1,d0
	moveq #1,d1
	bsr.w loc_03039c
	bra.w loc_0303be

;==============================================
loc_030544:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #3,d1
	moveq #$a,d2
	bsr.w loc_030326
	bra.w loc_0302c8

;==============================================
loc_03056c:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	moveq #2,d1
	bsr.w loc_03039c
	bsr.w loc_0303be
	bra.w loc_0302c8

;==============================================
loc_030584:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	subi.b #$48,d0
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	add.w d1,d1
	add.w d1,d0
	add.w d1,d1
	add.w d1,d0
	addq.w #1,d0
	moveq #0,d1
	bsr.w loc_03039c
	bra.w loc_0302c8

;==============================================
loc_0305b2:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	bsr.w loc_0303be
	bsr.w loc_0302c8
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	add.w d1,d1
	add.w d1,d0
	addi.b #$2b,d0
	moveq #2,d1
	bsr.w loc_03039c
	bsr.w loc_0302c8
	bra.w loc_0302c8

;==============================================
loc_0305e8:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #1,d0
	moveq #1,d1
	moveq #$f,d2
	bsr.w loc_030326
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #3,d1
	moveq #$19,d2
	bsr.w loc_030326
	moveq #$c,d0
	moveq #4,d1
	moveq #$19,d2
	bra.w loc_03035e

;==============================================
loc_030620:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	movea.l #loc_339774,a0
	movea.l ($f0,a0),a0
	moveq #3,d1
	bsr.w loc_0302be
	bra.w loc_0303be

;==============================================
loc_03063c:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #1,d1
	moveq #1,d2
	bra.w loc_030326

;==============================================
loc_030660:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #$a,d0
	moveq #1,d1
	moveq #$a,d2
	bra.w loc_030326

;==============================================
loc_030672:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #1,d1
	moveq #$10,d2
	bra.w loc_030326

;==============================================
loc_030696:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d1
	move.b ($132,a6),d1
	addq.b #1,d1
	add.w d1,d1
	add.b ($128,a6),d1
	move.w d1,d0
	lsl.w #2,d1
	add.w d1,d0
	moveq #1,d1
	moveq #$d,d2
	bra.w loc_030326

;==============================================
loc_0306ba:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #$b,d0
	moveq #1,d1
	moveq #$a,d2
	bra.w loc_030326

;==============================================
loc_0306cc:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #$29,d0
	moveq #0,d1
	bsr.w loc_03039c
	moveq #$29,d0
	moveq #1,d1
	bsr.w loc_03039c
	moveq #0,d0
	moveq #2,d1
	bra.w loc_03039c

;==============================================
loc_0306ec:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #$2a,d0
	moveq #0,d1
	bsr.w loc_03039c
	moveq #$2a,d0
	moveq #1,d1
	bsr.w loc_03039c
	moveq #0,d0
	moveq #2,d1
	bra.w loc_03039c

;==============================================
loc_03070c:
	cmp.b ($2a1,a6),d0
	beq.w loc_02ffa8
	moveq #0,d0
	moveq #1,d1
	bra.w loc_03039c
