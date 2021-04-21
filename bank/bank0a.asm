;##############################################
loc_0a0204:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a0212(pc,d0.w),d1
	jmp loc_0a0212(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0212:
	dc.w loc_0a0216-loc_0a0212
	dc.w loc_0a0240-loc_0a0212

;==============================================
loc_0a0216:
	move.b (4,a6),d0
	move.w loc_0a0222(pc,d0.w),d1
	jmp loc_0a0222(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0222:
	dc.w loc_0a022a-loc_0a0222
	dc.w loc_0a023a-loc_0a0222
	dc.w loc_0a0382-loc_0a0222
	dc.w loc_0a0382-loc_0a0222

;----------------------------------------------
loc_0a022a:
	addq.b #2,(4,a6)
	moveq #0,d0
	lea.l loc_0a039a(pc),a0
	jmp loc_01b722

;----------------------------------------------
loc_0a023a:
	jmp loc_01b6f8

;==============================================
loc_0a0240:
	move.b (4,a6),d0
	move.w loc_0a024c(pc,d0.w),d1
	jmp loc_0a024c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a024c:
	dc.w loc_0a0254-loc_0a024c
	dc.w loc_0a02ae-loc_0a024c
	dc.w loc_0a0382-loc_0a024c
	dc.w loc_0a0382-loc_0a024c

;----------------------------------------------
loc_0a0254:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.l #$1980000,($10,a6)
	move.l #$100000,($40,a6)
	move.l #$18000,($48,a6)
	move.l d0,($14,a6)
	move.l #$18000,($4c,a6)
	moveq #0,d0
	tst.w (Region,a5)
	beq.b loc_0a029e
	addq.w #1,d0

loc_0a029e:
	moveq #0,d1
	move.b ($3c,a6),d1
	lsl.w #3,d1
	jsr loc_09877a
	moveq #0,d0

loc_0a02ae:
	move.b (5,a6),d0
	move.w loc_0a02c8(pc,d0.w),d1
	jsr loc_0a02c8(pc,d1.w)
	bsr.w loc_0a0332
	jsr loc_01b490
	bra.w loc_0a0388

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a02c8:
	dc.w loc_0a02ce-loc_0a02c8
	dc.w loc_0a02fc-loc_0a02c8
	dc.w loc_0a0310-loc_0a02c8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a02ce:
	move.l ($40,a6),d0
	sub.l d0,($10,a6)
	move.l ($48,a6),d0
	sub.l d0,($40,a6)
	cmpi.l #$20000,($40,a6)
	bhi.b loc_0a02fa
	addq.b #2,(5,a6)
	move.l #$20000,($40,a6)
	move.b #$c,($3a,a6)

loc_0a02fa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a02fc:
	move.l ($40,a6),d0
	sub.l d0,($10,a6)
	subq.b #1,($3a,a6)
	bne.b loc_0a030e
	addq.b #2,(5,a6)

loc_0a030e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0310:
	move.l ($40,a6),d0
	sub.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	cmpi.w #$ffe8,($10,a6)
	bgt.b loc_0a0330
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_0a0330:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a0332:
	move.l ($4c,a6),d1
	add.l d1,($14,a6)
	move.w ($34,a6),d0

loc_0a033e:
	tst.w ($14,a6)
	bpl.b loc_0a034a
	add.w d0,($14,a6)
	bra.b loc_0a033e

loc_0a034a:
	cmp.w ($14,a6),d0
	bhi.b loc_0a0356
	sub.w d0,($14,a6)
	bra.b loc_0a034a

loc_0a0356:
	moveq #2,d1
	move.w #$6000,d2
	move.w #0,d3
	move.b ($17,a5),d0
	cmp.b ($3c,a6),d0
	bne.b loc_0a0374
	moveq #0,d1
	move.w #$e000,d2
	move.w #$ff01,d3

loc_0a0374:
	move.b d1,($9,a6)
	move.w d2,($18,a6)
	move.w d3,($c,a6)
	rts

;----------------------------------------------
loc_0a0382:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a0388:
	tst.b ($a,a5)
	bne.b loc_0a0394
	jmp loc_01b4d0

loc_0a0394:
	clr.b (1,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a039a:
	dc.w loc_0a039c-loc_0a039a

loc_0a039c:
	dc.w $0300,$0000
	dc.l loc_0a03c0
	dc.w $0300,$0000
	dc.l loc_0a03c6
	dc.w $0300,$0000
	dc.l loc_0a03cc
	dc.w $0380,$0000
	dc.l loc_0a03d2
	dc.l loc_0a039c

loc_0a03c0:
	dc.w $0460,$002c,$0081

loc_0a03c6:
	dc.w $0460,$002c,$00a1

loc_0a03cc:
	dc.w $0460,$002c,$00c1

loc_0a03d2:
	dc.w $0460,$002c,$00e1

;##############################################
loc_0a03d8:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a03e6(pc,d0.w),d1
	jmp loc_0a03e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a03e6:
	dc.w loc_0a03f6-loc_0a03e6
	dc.w loc_0a0532-loc_0a03e6
	dc.w loc_0a061e-loc_0a03e6
	dc.w loc_0a06c6-loc_0a03e6
	dc.w loc_0a07aa-loc_0a03e6
	dc.w loc_0a0860-loc_0a03e6
	dc.w loc_0a091e-loc_0a03e6
	dc.w loc_0a0984-loc_0a03e6

;==============================================
loc_0a03f6:
	move.b (4,a6),d0
	move.w loc_0a0402(pc,d0.w),d1
	jmp loc_0a0402(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0402:
	dc.w loc_0a040a-loc_0a0402
	dc.w loc_0a0468-loc_0a0402
	dc.w loc_0a0a72-loc_0a0402
	dc.w loc_0a0a78-loc_0a0402

;----------------------------------------------
loc_0a040a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($c,a6)
	move.w #$e000,($18,a6)
	move.w d0,($26,a6)
	move.b ($17,a5),d0
	eori.b #1,d0
	move.b d0,($b,a6)
	bsr.w loc_0a04a0
	move.b ($dc,a5),d0
	move.b d0,($3c,a6)
	jsr loc_02fc88
	move.b ($dc,a5),d0
	lsl.w #2,d0
	lea.l CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	movea.l (a0),a0
	moveq #$2c,d0
	jsr loc_01b6e0
	bra.w loc_0a0a7e

;----------------------------------------------
loc_0a0468:
	move.b (5,a6),d0
	move.w loc_0a0474(pc,d0.w),d1
	jmp loc_0a0474(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0474:
	dc.w loc_0a0478-loc_0a0474
	dc.w loc_0a049c-loc_0a0474

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0478:
	tst.b ($15,a5)
	beq.b loc_0a049c
	addq.b #2,(5,a6)
	clr.b ($e,a6)
	move.w #$a000,($18,a6)
	move.w ($290,a5),d0
	sub.w d0,($10,a6)
	move.w ($294,a5),d0
	sub.w d0,($14,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a049c:
	bra.w loc_0a0a7e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a04a0:
	moveq #0,d0
	move.b d0,($14,a6)
	move.b ($16,a5),d0
	add.w d0,d0
	move.w loc_0a0512(pc,d0.w),($10,a6)
	move.b loc_0a0512+2(pc,d0.w),($15,a6)
	move.b loc_0a0512+3(pc,d0.w),d0
	subq.b #1,d0
	bcs.b loc_0a04ea
	moveq #0,d1

loc_0a04c2:
	jsr loc_01c368
	beq.b loc_0a04ea
	addq.b #1,(a4)
	move.b #$23,(2,a4)
	move.b d0,(3,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6,d1.w)
	cmpi.b #2,d0
	bne.b loc_0a04ea
	addq.b #1,d0
	addq.w #2,d1
	bra.b loc_0a04c2

loc_0a04ea:
	moveq #0,d0
	move.b ($dc,a5),d0
	add.w d0,d0
	lea.l loc_32c094,a0
	move.w #$140,d1
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	lea.l MainpaletteDirect,a1
	moveq #4,d7
	jmp loc_01b7ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0512:
	dc.w $0220
	dc.b $38,$00

	dc.w $02e0
	dc.b $28,$00

	dc.w $02e0
	dc.b $28,$01

	dc.w $02e0
	dc.b $28,$02

	dc.w $0220
	dc.b $28,$00

	dc.w $0220
	dc.b $28,$00

	dc.w $02e0
	dc.b $48,$03

	dc.w $0220
	dc.b $38,$00

;==============================================
loc_0a0532:
	move.b (4,a6),d0
	move.w loc_0a053e(pc,d0.w),d1
	jmp loc_0a053e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a053e:
	dc.w loc_0a0546-loc_0a053e
	dc.w loc_0a05a0-loc_0a053e
	dc.w loc_0a0a72-loc_0a053e
	dc.w loc_0a0a78-loc_0a053e

;----------------------------------------------
loc_0a0546:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$ff05,($c,a6)
	move.w #$e000,($18,a6)
	move.w d0,($26,a6)
	move.b ($17,a5),($b,a6)
	bsr.w loc_0a05ac
	move.b ($dd,a5),d0
	move.b d0,($3c,a6)
	jsr loc_02fc88
	move.b ($dd,a5),d0
	lsl.w #2,d0
	lea.l CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	movea.l (a0),a0
	moveq #$2c,d0
	jsr loc_01b6e0
	bra.w loc_0a0a7e

;----------------------------------------------
loc_0a05a0:
	tst.b ($15,a5)
	bne.w loc_0a0a72
	bra.w loc_0a0a7e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a05ac:
	moveq #0,d0
	move.b ($16,a5),d0
	add.w d0,d0
	move.w loc_0a05fe(pc,d0.w),($10,a6)
	move.w loc_0a05fe+2(pc,d0.w),($14,a6)
	moveq #0,d0
	move.b ($dd,a5),d0
	add.w d0,d0
	move.w #$140,d1
	lea.l loc_32c094,a0
	add.w (a0,d0.w),d1
	cmpi.b #$c,($dd,a5)
	bne.b loc_0a05ec
	move.w #$140,d1
	lea.l loc_3329d4,a0
	add.w ($18,a0),d1

loc_0a05ec:
	lea.l (a0,d1.w),a0
	lea.l $90c0a0,a1
	moveq #0,d7
	jmp loc_01b7ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a05fe:
	dc.w $0250,$0048
	dc.w $02a0,$0030
	dc.w $0270,$0048
	dc.w $0290,$0040
	dc.w $02f0,$0040
	dc.w $0300,$0028
	dc.w $02a0,$0028
	dc.w $0250,$0028

;==============================================
loc_0a061e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a062e(pc,d0.w),d1
	jmp loc_0a062e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a062e:
	dc.w loc_0a0636-loc_0a062e
	dc.w loc_0a0676-loc_0a062e
	dc.w loc_0a0a72-loc_0a062e
	dc.w loc_0a0a78-loc_0a062e

;----------------------------------------------
loc_0a0636:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.b ($3c,a4),d0
	lsl.w #2,d0
	lea.l loc_0df892,a0
	move.l (a0,d0.w),($60,a6)

;----------------------------------------------
loc_0a0676:
	tst.b ($15,a5)
	bne.w loc_0a0a72
	moveq #0,d1
	movea.l ($1c,a4),a0
	move.b ($e,a0),d1
	beq.b loc_0a06c4
	lsl.w #2,d1
	movea.l ($60,a6),a0
	move.w (a0,d1.w),d0
	move.w (2,a0,d1.w),d1
	tst.b ($b,a4)
	beq.b loc_0a06a0
	neg.w d1

loc_0a06a0:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w #$28,($14,a6)
	lea.l loc_2e514c,a0
	jsr loc_01b6e0
	tst.b (1,a4)
	beq.b loc_0a06c4
	bra.w loc_0a0a7e

loc_0a06c4:
	rts

;==============================================
loc_0a06c6:
	move.b (4,a6),d0
	move.w loc_0a06d2(pc,d0.w),d1
	jmp loc_0a06d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a06d2:
	dc.w loc_0a06da-loc_0a06d2
	dc.w loc_0a074a-loc_0a06d2
	dc.w loc_0a0a72-loc_0a06d2
	dc.w loc_0a0a78-loc_0a06d2

;----------------------------------------------
loc_0a06da:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w #$106,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.b ($3c,a6),d0
	add.b d0,d0
	move.b d0,($b,a6)
	lsl.w #2,d0
	move.w loc_0a073a(pc,d0.w),($46,a6)
	move.w loc_0a073a+2(pc,d0.w),($4e,a6)
	move.w loc_0a073a+4(pc,d0.w),($44,a6)
	move.w loc_0a073a+6(pc,d0.w),($4c,a6)
	move.w #$c0,($10,a6)
	move.w ($46,a6),($14,a6)
	moveq #9,d0
	jsr loc_09878e
	bra.w loc_0a0a7e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a073a:
	dc.w $0030,$0050,$071c,$ff1d
	dc.w $00d0,$00b0,$f8e4,$00e4

;----------------------------------------------
loc_0a074a:
	move.b (5,a6),d0
	move.w loc_0a075a(pc,d0.w),d1
	jsr loc_0a075a(pc,d1.w)
	bra.w loc_0a0a7e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a075a:
	dc.w loc_0a0760-loc_0a075a
	dc.w loc_0a0772-loc_0a075a
	dc.w loc_0a07a8-loc_0a075a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0760:
	tst.b ($15,a5)
	beq.b loc_0a0770
	addq.b #2,(5,a6)
	move.w #$a000,($18,a6)

loc_0a0770:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0772:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	beq.b loc_0a079a
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_0a079a
	eor.w d0,d1
	bmi.b loc_0a07a8

loc_0a079a:
	addq.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)

loc_0a07a8:
	rts

;==============================================
loc_0a07aa:
	move.b (4,a6),d0
	move.w loc_0a07b6(pc,d0.w),d1
	jmp loc_0a07b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a07b6:
	dc.w loc_0a07be-loc_0a07b6
	dc.w loc_0a0846-loc_0a07b6
	dc.w loc_0a0a72-loc_0a07b6
	dc.w loc_0a0a78-loc_0a07b6

;----------------------------------------------
loc_0a07be:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.b ($17,a5),d0
	move.b d0,($b,a6)
	eori.b #1,d0
	add.b d0,d0
	move.b d0,($d,a6)
	sne.b ($c,a6)
	move.b ($16,a5),d0
	add.w d0,d0
	move.w loc_0a0826(pc,d0.w),($10,a6)
	move.w loc_0a0826+2(pc,d0.w),($14,a6)
	bne.b loc_0a0814
	addq.b #2,(4,a6)

loc_0a0814:
	moveq #5,d0
	lea.l loc_2e50a0,a0
	jsr loc_01b6e0
	bra.w loc_0a0a7e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0826:
	dc.w $0238,$0090
	dc.w $0298,$0058
	dc.w $0278,$0078
	dc.w $02a0,$0058
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $02b0,$0070
	dc.w $0250,$0078

;----------------------------------------------
loc_0a0846:
	tst.b ($15,a5)
	bne.w loc_0a0a72
	tst.b ($33,a6)
	bmi.w loc_0a0a72
	jsr loc_01b6b6
	bra.w loc_0a0a7e

;==============================================
loc_0a0860:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a0870(pc,d0.w),d1
	jmp loc_0a0870(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0870:
	dc.w loc_0a0878-loc_0a0870
	dc.w loc_0a08f6-loc_0a0870
	dc.w loc_0a0a72-loc_0a0870
	dc.w loc_0a0a78-loc_0a0870

;----------------------------------------------
loc_0a0878:
	tst.b ($15,a5)
	beq.b loc_0a08ee
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b ($b,a4),($b,a6)
	move.b #$ff,($c,a6)
	move.w ($e,a4),($e,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($18,a4),($18,a6)
	move.l ($1c,a4),($1c,a6)
	move.w d0,($26,a6)
	move.b ($3c,a6),d0
	andi.b #$f,d0
	move.w d0,d1
	add.b ($d,a4),d0
	addq.b #3,d0
	move.b d0,($d,a6)
	add.w d1,d1
	move.w loc_0a08f0(pc,d1.w),d1
	move.b ($3c,a6),d0
	lsr.b #4,d0
	move.b ($b,a4),d2
	eor.b d2,d0
	beq.b loc_0a08e2
	neg.w d1

loc_0a08e2:
	move.w d1,($40,a6)
	clr.l ($48,a6)
	bra.w loc_0a0a7e

loc_0a08ee:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a08f0:
	dc.w $0200
	dc.w $0400
	dc.w $0600

;----------------------------------------------
loc_0a08f6:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($48,a6)
	move.w ($48,a6),d0
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	bra.w loc_0a0a7e

;==============================================
loc_0a091e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a092e(pc,d0.w),d1
	jmp loc_0a092e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a092e:
	dc.w loc_0a0936-loc_0a092e
	dc.w loc_0a0980-loc_0a092e
	dc.w loc_0a0a72-loc_0a092e
	dc.w loc_0a0a78-loc_0a092e

;----------------------------------------------
loc_0a0936:
	cmpi.b #2,($15,a5)
	bne.b loc_0a097e
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$1c0,($10,a6)
	move.w #$380,($14,a6)
	move.w #$a000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	moveq #$a,d0
	jmp loc_09878e

loc_0a097e:
	rts

;----------------------------------------------
loc_0a0980:
	bra.w loc_0a0a7e

;==============================================
loc_0a0984:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a0994(pc,d0.w),d1
	jmp loc_0a0994(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0994:
	dc.w loc_0a099c-loc_0a0994
	dc.w loc_0a0a2a-loc_0a0994
	dc.w loc_0a0a72-loc_0a0994
	dc.w loc_0a0a78-loc_0a0994

;----------------------------------------------
loc_0a099c:
	cmpi.b #2,($15,a5)
	bne.b loc_0a0a18
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$a000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.b ($3c,a6),d0
	move.b d0,d1
	addi.b #7,d1
	move.b d1,($d,a6)
	move.b #1,($c,a6)
	lsl.w #3,d0
	move.w loc_0a0a1a(pc,d0.w),($46,a6)
	move.w loc_0a0a1a+2(pc,d0.w),($4e,a6)
	move.w loc_0a0a1a+4(pc,d0.w),($44,a6)
	move.w loc_0a0a1a+6(pc,d0.w),($4c,a6)
	move.w #0,($10,a6)
	move.w ($46,a6),($14,a6)
	moveq #4,d0
	tst.w (Region,a5)
	beq.b loc_0a0a0a
	addq.b #1,d0

loc_0a0a0a:
	moveq #0,d1
	move.b ($dc,a5),d1
	lsl.w #3,d1
	jmp loc_09877a

loc_0a0a18:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0a1a:
	dc.w $00f5,$00bd,$f38f,$018e
	dc.w $000a,$0042,$0c71,$fe72

;----------------------------------------------
loc_0a0a2a:
	move.b (5,a6),d0
	move.w loc_0a0a3a(pc,d0.w),d1
	jsr loc_0a0a3a(pc,d1.w)
	bra.w loc_0a0a7e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0a3a:
	dc.w loc_0a0a3e-loc_0a0a3a
	dc.w loc_0a0a70-loc_0a0a3a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0a3e:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	beq.b loc_0a0a66
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_0a0a66
	eor.w d0,d1
	bmi.b loc_0a0a70

loc_0a0a66:
	addq.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)

loc_0a0a70:
	rts


;----------------------------------------------
loc_0a0a72:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_0a0a78:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a0a7e:
	tst.b ($a,a5)
	bne.b loc_0a0a8a
	jmp loc_01b4d0

loc_0a0a8a:
	clr.b (1,a6)
	rts

;##############################################
loc_0a0a90:
	move.b (4,a6),d0
	move.w loc_0a0a9c(pc,d0.w),d1
	jmp loc_0a0a9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0a9c:
	dc.w loc_0a0aa4-loc_0a0a9c
	dc.w loc_0a0b14-loc_0a0a9c
	dc.w loc_0a0b94-loc_0a0a9c
	dc.w loc_0a0b94-loc_0a0a9c

;==============================================
loc_0a0aa4:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($9,a6)
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.b (3,a6),d0
	lsl.w #2,d0
	move.w loc_0a0af0(pc,d0.w),($12,a6)
	move.w loc_0a0af0+2(pc,d0.w),($16,a6)
	moveq #0,d0
	move.b ($16,a5),d0
	add.b ($17,a5),d0
	lsl.b #2,d0
	add.b (3,a6),d0
	move.b loc_0a0afc(pc,d0.w),($a,a6)
	bra.b loc_0a0b14

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0af0:
	dc.w $00c0,$00c8
	dc.w $00c0,$0080
	dc.w $00c0,$0038

loc_0a0afc:
	dc.b $0a,$0b,$0c,$00
	dc.b $0d,$01,$0e,$00
	dc.b $00,$01,$02,$00
	dc.b $17,$18,$19,$00
	dc.b $03,$04,$03,$00
	dc.b $05,$06,$07,$00

;==============================================
loc_0a0b14:
	moveq #$14,d0
	moveq #0,d1
	moveq #0,d2
	move.w #$101,d3
	move.b ($15,a5),d6
	cmp.b (3,a6),d6
	bne.b loc_0a0b46
	jsr RNGFunction
	move.w d0,d1
	lsr.w #4,d1
	andi.w #7,d1
	subq.w #4,d1
	move.w d0,d2
	andi.w #7,d2
	subq.w #4,d2
	moveq #$13,d0
	move.w #$100,d3

loc_0a0b46:
	tst.b ($3c,a6)
	beq.b loc_0a0b50
	move.w #$102,d3

loc_0a0b50:
	move.w d3,($c,a6)
	add.w ($12,a6),d1
	move.w d1,($10,a6)
	add.w ($16,a6),d2
	move.w d2,($14,a6)
	moveq #0,d1
	move.b ($a,a6),d1
	lsl.w #3,d1
	add.w d0,d0
	lea.l loc_2f2de8,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jsr loc_01b6ee
	tst.b ($a,a5)
	bne.b loc_0a0b8e
	jmp loc_01b4d0

loc_0a0b8e:
	clr.b (1,a6)
	rts

;==============================================
loc_0a0b94:
	jmp loc_01c2de

;##############################################
loc_0a0b9a:
	move.b (4,a6),d0
	move.w loc_0a0ba6(pc,d0.w),d1
	jmp loc_0a0ba6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0ba6:
	dc.w loc_0a0bae-loc_0a0ba6
	dc.w loc_0a0c5c-loc_0a0ba6
	dc.w loc_0a0c90-loc_0a0ba6
	dc.w loc_0a0c90-loc_0a0ba6

;==============================================
loc_0a0bae:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($f,a6)
	move.w #$a000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.b d0,($3c,a6)
	moveq #0,d0
	move.b (3,a6),d0
	cmpi.b #8,d0
	bne.b loc_0a0bea
	move.w #$100,($c,a6)

loc_0a0bea:
	lsl.w #3,d0
	move.w loc_0a0c14(pc,d0.w),($10,a6)
	move.w loc_0a0c14+2(pc,d0.w),($14,a6)
	move.w loc_0a0c14+4(pc,d0.w),($44,a6)
	move.b loc_0a0c14+7(pc,d0.w),($e,a6)
	move.b loc_0a0c14+6(pc,d0.w),d0
	lea.l loc_2f2de8,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0c14:
	dc.w $0070,$0020,$0060
	dc.b $17,$08

	dc.w $0110,$0020,$0060
	dc.b $17,$08

	dc.w $0011,$0020,$0060
	dc.b $15,$08

	dc.w $0147,$0020,$0060
	dc.b $16,$08

	dc.w $00c0,$0070,$0030
	dc.b $18,$08

	dc.w $00c0,$0270,$0060
	dc.b $19,$08

	dc.w $03c0,$0180,$0000
	dc.b $1a,$0c

	dc.w $02d8,$00f0,$0000
	dc.b $1b,$0c

	dc.w $05c0,$0040,$0040
	dc.b $1c,$0c

;==============================================
loc_0a0c5c:
	move.b (3,a6),d0
	cmpi.b #8,d0
	beq.b loc_0a0c6c
	btst d0,($17,a5)
	beq.b loc_0a0c8a

loc_0a0c6c:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	jsr loc_01b6b6
	tst.b ($a,a5)
	bne.b loc_0a0c8a
	jmp loc_01b4d0

loc_0a0c8a:
	clr.b (1,a6)
	rts

;==============================================
loc_0a0c90:
	jmp loc_01c2de

;##############################################
loc_0a0c96:
	move.b (4,a6),d0
	move.w loc_0a0ca2(pc,d0.w),d1
	jmp loc_0a0ca2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0ca2:
	dc.w loc_0a0caa-loc_0a0ca2
	dc.w loc_0a0cea-loc_0a0ca2
	dc.w loc_0a0cfc-loc_0a0ca2
	dc.w loc_0a0cfc-loc_0a0ca2

;==============================================
loc_0a0caa:
	addq.b #2,(4,a6)
	moveq #0,d1
	move.b d1,(9,a6)
	move.w d1,($c,a6)
	move.w d1,($e,a6)
	move.w #$2000,(gfxram16x16,a5)
	move.w #$e000,($18,a6)
	move.w d1,($26,a6)
	move.w #$c0,($10,a6)
	move.w #$80,($14,a6)
	move.b (3,a6),d1
	lsl.w #3,d1
	moveq #$b,d0
	add.b ($89,a5),d0
	jsr loc_09877a

loc_0a0cea:
	tst.b ($a,a5)
	bne.b loc_0a0cf6
	jmp loc_01b4d0

loc_0a0cf6:
	clr.b (1,a6)
	rts

;==============================================
loc_0a0cfc:
	jmp loc_01c2de

;##############################################
loc_0a0d02:
	move.b (4,a6),d0
	move.w loc_0a0d0e(pc,d0.w),d1
	jmp loc_0a0d0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0d0e:
	dc.w loc_0a0d16-loc_0a0d0e
	dc.w loc_0a0d16-loc_0a0d0e
	dc.w loc_0a0d16-loc_0a0d0e
	dc.w loc_0a0d1c-loc_0a0d0e

;==============================================
loc_0a0d16:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0a0d1c:
	jmp loc_01c2de

;##############################################
;Title Screen
loc_0a0d22:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a0d30(pc,d0.w),d1
	jmp loc_0a0d30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0d30:
	dc.w loc_0a0d46-loc_0a0d30
	dc.w loc_0a0d46-loc_0a0d30
	dc.w loc_0a0d46-loc_0a0d30
	dc.w loc_0a0d46-loc_0a0d30

	dc.w loc_0a12ca-loc_0a0d30
	dc.w loc_0a12ca-loc_0a0d30
	dc.w loc_0a12ca-loc_0a0d30
	dc.w loc_0a1384-loc_0a0d30

	dc.w loc_0a14f2-loc_0a0d30
	dc.w loc_0a15d8-loc_0a0d30
	dc.w loc_0a18b0-loc_0a0d30

;==============================================
loc_0a0d46:
	move.b ($a,a6),d0
	add.w d0,d0
	move.w loc_0a0d54(pc,d0.w),d1
	jmp loc_0a0d54(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0d54:
	dc.w loc_0a0d5c-loc_0a0d54
	dc.w loc_0a0dac-loc_0a0d54
	dc.w loc_0a0dfe-loc_0a0d54
	dc.w loc_0a0d5c-loc_0a0d54

;----------------------------------------------
loc_0a0d5c:
	move.b (4,a6),d0
	move.w loc_0a0d68(pc,d0.w),d1
	jmp loc_0a0d68(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0d68:
	dc.w loc_0a0d70-loc_0a0d68
	dc.w loc_0a0da6-loc_0a0d68
	dc.w loc_0a21ee-loc_0a0d68
	dc.w loc_0a21ee-loc_0a0d68

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0d70:
	addq.b #2,(4,a6)
	move.b ($3c,a6),d0
	add.b d0,d0
	move.b d0,(9,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	move.b (3,a6),d0
	bset d0,($17,a5)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258

loc_0a0da6:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a0dac:
	move.b (4,a6),d0
	move.w loc_0a0db8(pc,d0.w),d1
	jmp loc_0a0db8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0db8:
	dc.w loc_0a0dc0-loc_0a0db8
	dc.w loc_0a0dee-loc_0a0db8
	dc.w loc_0a21ee-loc_0a0db8
	dc.w loc_0a21ee-loc_0a0db8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0dc0:
	addq.b #2,(4,a6)
	move.b ($3c,a6),d0
	add.b d0,d0
	move.b d0,(9,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258

loc_0a0dee:
	btst #1,($14,a5)
	beq.b loc_0a0dfc
	jmp loc_01b4ec

loc_0a0dfc:
	rts

;----------------------------------------------
loc_0a0dfe:
	move.b (4,a6),d0
	move.w loc_0a0e0a(pc,d0.w),d1
	jmp loc_0a0e0a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0e0a:
	dc.w loc_0a0e12-loc_0a0e0a
	dc.w loc_0a0e84-loc_0a0e0a
	dc.w loc_0a21ee-loc_0a0e0a
	dc.w loc_0a21ee-loc_0a0e0a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0e12:
	addq.b #2,(4,a6)
	move.b ($3c,a6),d0
	move.b d0,($d,a6)
	sne.b ($c,a6)
	add.b d0,d0
	move.b d0,(9,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w d0,($26,a6)
	move.w d0,($24,a6)
	move.b #8,($3a,a6)
	move.b ($89,a5),d0
	lsl.w #2,d0
	add.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a0e74(pc,d0.w),($10,a6)
	move.w #$80,($14,a6)
	bsr.w loc_0a12b2
	bsr.w loc_0a2258
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0e74:
	dc.w $00f0,$0090
	dc.w $0030,$0150
	dc.w $0090,$00f0
	dc.w $0150,$0030

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a0e84:
	move.b (5,a6),d0
	move.w loc_0a0e9a(pc,d0.w),d1
	jsr loc_0a0e9a(pc,d1.w)
	bsr.w loc_0a1274
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0e9a:
	dc.w loc_0a0ea6-loc_0a0e9a
	dc.w loc_0a1036-loc_0a0e9a
	dc.w loc_0a10bc-loc_0a0e9a
	dc.w loc_0a1156-loc_0a0e9a
	dc.w loc_0a120c-loc_0a0e9a
	dc.w loc_0a1234-loc_0a0e9a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a0ea6:
	move.b ($3c,a6),d0
	add.b d0,d0
	move.w loc_0a0eb4(pc,d0.w),d1
	jmp loc_0a0eb4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0eb4:
	dc.w loc_0a0ebc-loc_0a0eb4
	dc.w loc_0a0f0a-loc_0a0eb4
	dc.w loc_0a0f0a-loc_0a0eb4
	dc.w loc_0a0f0a-loc_0a0eb4

;x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-
loc_0a0ebc:
	subq.b #1,($3a,a6)
	bne.b loc_0a0f08
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w d0,($40,a6)
	move.w d0,($44,a6)
	move.b ($89,a5),d0
	lsl.w #2,d0
	add.b (3,a6),d0
	lsl.w #5,d0
	add.w ($26,a6),d0
	move.w loc_0a0f36(pc,d0.w),($4a,a6)
	move.w loc_0a0f36+2(pc,d0.w),($4e,a6)
	move.w loc_0a0f36+4(pc,d0.w),($48,a6)
	move.w loc_0a0f36+6(pc,d0.w),($4c,a6)
	tst.w ($48,a6)
	sne.b ($42,a6)
	tst.w ($4c,a6)
	sne.b ($46,a6)

loc_0a0f08:
	rts

;x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-
loc_0a0f0a:
	move.b (3,a6),d0
	btst d0,($17,a5)
	beq.b loc_0a0f1a
	addq.b #2,(4,a6)
	bra.b loc_0a0f34

loc_0a0f1a:
	bsr.w loc_0a1236
	cmpi.b #3,($3c,a6)
	bne.b loc_0a0f34
	tst.b (7,a6)
	bpl.b loc_0a0f34
	move.b (3,a6),d0
	bset d0,($14,a5)

loc_0a0f34:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0f36:
	dc.w $00f0,$00b6,$0000,$00b2
	dc.w $0030,$00b6,$fd8a,$0000
	dc.w $0150,$00b6,$03b2,$0000
	dc.w $0046,$00b6,$fc97,$0000
	dc.w $0090,$004a,$0000,$ff4f
	dc.w $0150,$004a,$0277,$0000
	dc.w $0046,$004a,$fc97,$0000
	dc.w $0046,$008f,$0000,$00e3
	dc.w $0030,$0024,$0000,$fed3
	dc.w $0094,$0024,$0149,$0000
	dc.w $0094,$00dc,$0000,$025c
	dc.w $0094,$008f,$0000,$ff04
	dc.w $0150,$00dc,$0000,$012e
	dc.w $00e2,$00dc,$fe97,$0000
	dc.w $00e2,$0024,$0000,$fda5
	dc.w $00e2,$008f,$0000,$0160
	dc.w $0090,$0064,$0000,$ffa5
	dc.w $0150,$0064,$0277,$0000
	dc.w $0078,$0064,$fd3c,$0000
	dc.w $0078,$008f,$0000,$008e
	dc.w $00f0,$009c,$0000,$005c
	dc.w $00f0,$002c,$0000,$fe91
	dc.w $00a0,$002c,$fefa,$0000
	dc.w $00a0,$008f,$0000,$0145
	dc.w $0150,$00d4,$0000,$0114
	dc.w $0090,$00d4,$fd8a,$0000
	dc.w $00c8,$00d4,$00b8,$0000
	dc.w $00c8,$008f,$0000,$ff1e
	dc.w $0030,$002c,$0000,$feed
	dc.w $0030,$009c,$0000,$0170
	dc.w $00f0,$009c,$0277,$0000
	dc.w $00f0,$008f,$0000,$ffd6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a1036:
	tst.b ($42,a6)
	beq.b loc_0a106a
	move.w ($40,a6),d0
	add.w ($48,a6),d0
	move.w d0,($40,a6)
	move.w d0,d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($10,a6)
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_0a1060
	eor.w d0,d1
	bmi.b loc_0a106a

loc_0a1060:
	bset #0,(6,a6)
	clr.w ($12,a6)

loc_0a106a:
	tst.b ($46,a6)
	beq.b loc_0a109e
	move.w ($44,a6),d0
	add.w ($4c,a6),d0
	move.w d0,($44,a6)
	move.w d0,d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($14,a6)
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_0a1094
	eor.w d0,d1
	bmi.b loc_0a109e

loc_0a1094:
	bset #1,(6,a6)
	clr.w ($16,a6)

loc_0a109e:
	tst.b (6,a6)
	beq.b loc_0a10ba
	addq.b #2,(5,a6)
	clr.b (6,a6)
	move.b #2,($3a,a6)
	move.b (3,a6),d0
	bset d0,($15,a5)

loc_0a10ba:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a10bc:
	tst.b ($42,a6)
	beq.b loc_0a10d6
	move.w ($40,a6),d0
	add.w ($48,a6),d0
	move.w d0,($40,a6)
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)

loc_0a10d6:
	tst.b ($46,a6)
	beq.b loc_0a10f0
	move.w ($44,a6),d0
	add.w ($4c,a6),d0
	move.w d0,($44,a6)
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)

loc_0a10f0:
	subq.b #1,($3a,a6)
	bne.b loc_0a1154
	addq.b #2,(5,a6)
	move.b #2,($3b,a6)
	tst.b ($42,a6)
	beq.b loc_0a112a
	move.w ($48,a6),d1
	move.w ($40,a6),d0
	beq.b loc_0a112a
	bpl.b loc_0a1118
	neg.w d0
	moveq #0,d2
	bra.b loc_0a111c

loc_0a1118:
	neg.w d1
	moveq #-1,d2

loc_0a111c:
	asl.w #1,d1
	move.w d0,($40,a6)
	move.w d1,($48,a6)
	move.b d2,($43,a6)

loc_0a112a:
	tst.b ($46,a6)
	beq.b loc_0a1154
	move.w ($4c,a6),d1
	move.w ($44,a6),d0
	beq.b loc_0a1154
	bgt.b loc_0a1142
	neg.w d0
	moveq #0,d2
	bra.b loc_0a1146

loc_0a1142:
	neg.w d1
	moveq #-1,d2

loc_0a1146:
	asl.w #1,d1
	move.w d0,($44,a6)
	move.w d1,($4c,a6)
	move.b d2,($47,a6)

loc_0a1154:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a1156:
	tst.b ($42,a6)
	beq.b loc_0a11a2
	move.w ($40,a6),d0
	add.w ($48,a6),d0
	move.w d0,($40,a6)
	tst.b ($43,a6)
	beq.b loc_0a1170
	neg.w d0

loc_0a1170:
	move.w d0,d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($10,a6)
	tst.w ($40,a6)
	bpl.b loc_0a11a2
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_0a118e
	eor.w d0,d1
	bmi.b loc_0a11a2

loc_0a118e:
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	neg.w ($40,a6)
	bset #0,(6,a6)

loc_0a11a2:
	tst.b ($46,a6)
	beq.b loc_0a11ee
	move.w ($44,a6),d0
	add.w ($4c,a6),d0
	move.w d0,($44,a6)
	tst.b ($47,a6)
	beq.b loc_0a11bc
	neg.w d0

loc_0a11bc:
	move.w d0,d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($14,a6)
	tst.w ($44,a6)
	bpl.b loc_0a11ee
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_0a11da
	eor.w d0,d1
	bmi.b loc_0a11ee

loc_0a11da:
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	neg.w ($44,a6)
	bset #1,(6,a6)

loc_0a11ee:
	tst.b (6,a6)
	beq.b loc_0a120a
	clr.b (6,a6)
	subq.b #1,($3b,a6)
	bne.b loc_0a120a
	addq.b #2,(5,a6)
	move.b (3,a6),d0
	bset d0,($16,a5)

loc_0a120a:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a120c:
	tst.b ($16,a5)
	bne.b loc_0a1234
	addq.w #8,($26,a6)
	cmpi.w #$20,($26,a6)
	bcc.b loc_0a122a
	clr.b (5,a6)
	move.b #2,($3a,a6)
	bra.b loc_0a1234

loc_0a122a:
	addq.b #2,(5,a6)
	move.b #1,(7,a6)

loc_0a1234:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1236:
	tst.b (7,a6)
	bmi.b loc_0a1272
	movea.w ($36,a6),a4
	move.w ($24,a4),d0
	lea.l ($60,a4),a0
	addi.w #$fff0,d0
	andi.w #$1c,d0
	move.w (a0,d0.w),($10,a6)
	move.w (2,a0,d0.w),($14,a6)
	addq.w #4,d0
	andi.w #$1c,d0
	cmpi.l #-1,(a0,d0.w)
	bne.b loc_0a1272
	move.b #1,(7,a6)

loc_0a1272:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1274:
	move.w ($24,a6),d0
	addq.w #4,d0
	andi.w #$1c,d0
	tst.b (7,a6)
	bmi.b loc_0a12ac
	lea.l ($60,a6),a0
	move.w ($10,a6),(a0,d0.w)
	move.w ($14,a6),(2,a0,d0.w)
	tst.b (7,a6)
	beq.b loc_0a12ac
	move.w d0,d1
	moveq #-1,d2
	addq.w #4,d1
	andi.w #$1c,d1
	move.l d2,(a0,d1.w)
	move.b d2,(7,a6)

loc_0a12ac:
	move.w d0,($24,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a12b2:
	move.w ($10,a6),d0
	move.w ($14,a6),d1
	moveq #7,d2
	lea.l ($60,a6),a0

loc_0a12c0:
	move.w d0,(a0)+
	move.w d1,(a0)+
	dbra d2,loc_0a12c0
	rts

;==============================================
loc_0a12ca:
	move.b ($a,a6),d0
	add.w d0,d0
	move.w loc_0a12d8(pc,d0.w),d1
	jmp loc_0a12d8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a12d8:
	dc.w loc_0a12e0-loc_0a12d8
	dc.w loc_0a1328-loc_0a12d8
	dc.w loc_0a12e0-loc_0a12d8
	dc.w loc_0a12e0-loc_0a12d8

;----------------------------------------------
loc_0a12e0:
	move.b (4,a6),d0
	move.w loc_0a12ec(pc,d0.w),d1
	jmp loc_0a12ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a12ec:
	dc.w loc_0a12f4-loc_0a12ec
	dc.w loc_0a1322-loc_0a12ec
	dc.w loc_0a21ee-loc_0a12ec
	dc.w loc_0a21ee-loc_0a12ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a12f4:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #6,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a1322:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a1328:
	move.b (4,a6),d0
	move.w loc_0a1334(pc,d0.w),d1
	jmp loc_0a1334(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1334:
	dc.w loc_0a133c-loc_0a1334
	dc.w loc_0a136a-loc_0a1334
	dc.w loc_0a21ee-loc_0a1334
	dc.w loc_0a21ee-loc_0a1334

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a133c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #6,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258

loc_0a136a:
	moveq #0,d0
	cmpi.b #4,(3,a6)
	beq.b loc_0a1376
	moveq #1,d0

loc_0a1376:
	btst d0,($14,a5)
	beq.b loc_0a1382
	jmp loc_01b4ec

loc_0a1382:
	rts

;==============================================
loc_0a1384:
	move.b ($a,a6),d0
	add.w d0,d0
	move.w loc_0a1392(pc,d0.w),d1
	jmp loc_0a1392(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1392:
	dc.w loc_0a139a-loc_0a1392
	dc.w loc_0a1438-loc_0a1392
	dc.w loc_0a139a-loc_0a1392
	dc.w loc_0a139a-loc_0a1392

;----------------------------------------------
loc_0a139a:
	move.b (4,a6),d0
	move.w loc_0a13a6(pc,d0.w),d1
	jmp loc_0a13a6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a13a6:
	dc.w loc_0a13ae-loc_0a13a6
	dc.w loc_0a13de-loc_0a13a6
	dc.w loc_0a21ee-loc_0a13a6
	dc.w loc_0a21ee-loc_0a13a6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a13ae:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #6,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258
	moveq #0,d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a13de:
	move.b (5,a6),d0
	move.w loc_0a13f0(pc,d0.w),d1
	jsr loc_0a13f0(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a13f0:
	dc.w loc_0a13f4-loc_0a13f0
	dc.w loc_0a1412-loc_0a13f0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a13f4:
	cmpi.b #$f,($17,a5)
	bne.b loc_0a1436
	addq.b #2,(5,a6)
	move.l ($32,a6),($40,a6)
	move.l ($1c,a6),($44,a6)
	bsr.w loc_0a14d6
	bra.b loc_0a141a

loc_0a1412:
	bsr.b loc_0a141a
	jsr loc_01b6f8

loc_0a141a:
	move.l ($40,a6),d0
	move.l ($32,a6),($40,a6)
	move.l d0,($32,a6)
	move.l ($44,a6),d0
	move.l ($1c,a6),($44,a6)
	move.l d0,($1c,a6)

loc_0a1436:
	rts

;----------------------------------------------
loc_0a1438:
	move.b (4,a6),d0
	move.w loc_0a1444(pc,d0.w),d1
	jmp loc_0a1444(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1444:
	dc.w loc_0a144c-loc_0a1444
	dc.w loc_0a147c-loc_0a1444
	dc.w loc_0a21ee-loc_0a1444
	dc.w loc_0a21ee-loc_0a1444

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0a144c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #6,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bsr.w loc_0a2258
	moveq #0,d0

loc_0a147c:
	move.b (5,a6),d0
	move.w loc_0a1488(pc,d0.w),d1
	jmp loc_0a1488(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0a1488:
	dc.w loc_0a148c-loc_0a1488
	dc.w loc_0a14ac-loc_0a1488

;x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-
loc_0a148c:
	btst #2,($14,a5)
	beq.b loc_0a14aa
	addq.b #2,(5,a6)
	move.l ($32,a6),($40,a6)
	move.l ($1c,a6),($44,a6)
	bsr.w loc_0a14d6
	bra.b loc_0a14b4

loc_0a14aa:
	rts

;x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-
loc_0a14ac:
	bsr.b loc_0a14b4
	jsr loc_01b6f8

loc_0a14b4:
	move.l ($40,a6),d0
	move.l ($32,a6),($40,a6)
	move.l d0,($32,a6)
	move.l ($44,a6),d0
	move.l ($1c,a6),($44,a6)
	move.l d0,($1c,a6)
	jmp loc_01b4ec

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a14d6:
	moveq #0,d0
	tst.b ($bf,a5)
	bne.b loc_0a14e4
	move.b (game_unlock,a5),d0
	lsl.w #2,d0

loc_0a14e4:
	add.b ($a,a6),d0
	lea.l loc_0a22e4(pc),a0
	jmp loc_01b722

;==============================================
loc_0a14f2:
	move.b (4,a6),d0
	move.w loc_0a14fe(pc,d0.w),d1
	jmp loc_0a14fe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a14fe:
	dc.w loc_0a1506-loc_0a14fe
	dc.w loc_0a1532-loc_0a14fe
	dc.w loc_0a21ee-loc_0a14fe
	dc.w loc_0a21ee-loc_0a14fe

;----------------------------------------------
loc_0a1506:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	bsr.w loc_0a21f4
	bra.w loc_0a2258

;----------------------------------------------
loc_0a1532:
	move.b (5,a6),d0
	move.w loc_0a1544(pc,d0.w),d1
	jsr loc_0a1544(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1544:
	dc.w loc_0a154c-loc_0a1544
	dc.w loc_0a156a-loc_0a1544
	dc.w loc_0a1598-loc_0a1544
	dc.w loc_0a15d6-loc_0a1544

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a154c:
	cmpi.b #$f,($17,a5)
	bne.b loc_0a1568
	addq.b #2,(5,a6)
	move.w #0,($44,a6)
	move.w #$80,($4c,a6)
	clr.w ($16,a6)

loc_0a1568:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a156a:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w d0,($44,a6)
	cmpi.w #$60,($14,a6)
	bcs.b loc_0a1596
	addq.b #2,(5,a6)
	move.w #$60,($16,a6)
	move.b #$10,($3a,a6)

loc_0a1596:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a1598:
	subq.b #1,($3a,a6)
	bne.b loc_0a15a2
	addq.b #2,(5,a6)

loc_0a15a2:
	move.b ($3a,a6),d0
	add.w d0,d0
	move.w loc_0a15b6(pc,d0.w),d0
	add.w ($16,a6),d0
	move.w d0,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a15b6:
	dc.w $0000,$0001,$ffff,$0001
	dc.w $ffff,$0002,$fffe,$0003
	dc.w $fffd,$0004,$fffb,$0006
	dc.w $fff5,$0011,$ffe8,$0020

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a15d6:
	rts

;==============================================
loc_0a15d8:
	move.b (4,a6),d0
	move.w loc_0a15e4(pc,d0.w),d1
	jmp loc_0a15e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a15e4:
	dc.w loc_0a15ec-loc_0a15e4
	dc.w loc_0a17b8-loc_0a15e4
	dc.w loc_0a21ee-loc_0a15e4
	dc.w loc_0a21ee-loc_0a15e4

;----------------------------------------------
loc_0a15ec:
	move.b (5,a6),d0
	move.w loc_0a15f8(pc,d0.w),d1
	jmp loc_0a15f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a15f8:
	dc.w loc_0a15fc-loc_0a15f8
	dc.w loc_0a1640-loc_0a15f8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a15fc:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b ($3c,a6),d0
	move.b loc_0a1634(pc,d0.w),($3a,a6)
	tst.b ($3a,a6)
	beq.b loc_0a1646
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1634:
	dc.b $00,$04,$08,$0c
	dc.b $10,$14,$18,$1c
	dc.b $20,$24,$28,$2c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a1640:
	subq.b #1,($3a,a6)
	bne.b loc_0a16a6

loc_0a1646:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($52,a6)
	move.b ($3c,a6),d0
	tst.b ($89,a5)
	beq.b loc_0a1664
	addq.w #6,d0

loc_0a1664:
	lsl.w #4,d0
	move.w loc_0a16a8(pc,d0.w),($20,a6)
	move.w loc_0a16a8+2(pc,d0.w),($22,a6)
	move.w loc_0a16a8+4(pc,d0.w),($40,a6)
	move.w loc_0a16a8+6(pc,d0.w),($48,a6)
	move.w loc_0a16a8+8(pc,d0.w),($44,a6)
	move.w loc_0a16a8+$a(pc,d0.w),($4c,a6)
	move.w loc_0a16a8+$c(pc,d0.w),($4a,a6)
	move.w loc_0a16a8+$e(pc,d0.w),($3a,a6)
	move.w ($20,a6),($10,a6)
	move.w ($22,a6),($50,a6)
	bra.w loc_0a181e

loc_0a16a6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a16a8:
	dc.w $01b8,$005d,$f813,$007e,$0800,$ff80,$fff8,$0030
	dc.w $0206,$004a,$f78d,$0090,$f800,$0080,$0046,$002d
	dc.w $0254,$0041,$f6f4,$00a5,$0800,$ff80,$0094,$002a
	dc.w $02a2,$0064,$f643,$00bf,$f800,$0080,$00e2,$0027
	dc.w $02f0,$0028,$f576,$00e0,$0800,$ff80,$0130,$0024
	dc.w $033e,$0080,$f484,$010b,$f800,$0080,$017e,$0021
	dc.w $01c0,$0083,$f813,$007e,$0800,$ff80,$0000,$0030
	dc.w $01e8,$0070,$f78d,$0090,$f800,$0080,$0028,$002d
	dc.w $0210,$0067,$f6f4,$00a5,$0800,$ff80,$0050,$002a
	dc.w $0238,$008a,$f643,$00bf,$f800,$0080,$0078,$0027
	dc.w $0260,$004e,$f576,$00e0,$0800,$ff80,$00a0,$0024
	dc.w $0288,$000a,$f484,$010b,$f800,$0080,$00c8,$0021
	dc.w $02b0,$0033,$f362,$0143,$0800,$ff80,$00f0,$001e
	dc.w $02d8,$0021,$f200,$018e,$f800,$0080,$0118,$001b
	dc.w $0300,$001c,$f048,$01f7,$0800,$ff80,$0140,$0018
	dc.w $0328,$0037,$ee15,$028f,$f800,$0080,$0168,$0015
	dc.w $0350,$0008,$eb2a,$0379,$0800,$ff80,$0190,$0012

;----------------------------------------------
loc_0a17b8:
	move.b (5,a6),d0
	move.w loc_0a17ce(pc,d0.w),d1
	jsr loc_0a17ce(pc,d1.w)
	bsr.w loc_0a181e
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a17ce:
	dc.w loc_0a17d4-loc_0a17ce
	dc.w loc_0a17e4-loc_0a17ce
	dc.w loc_0a1812-loc_0a17ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a17d4:
	bsr.w loc_0a1852
	subq.w #1,($3a,a6)
	bne.b loc_0a17e2
	addq.b #2,(5,a6)

loc_0a17e2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a17e4:
	bsr.w loc_0a186c
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_0a17fa
	move.w ($40,a6),d0
	eor.w d0,d1
	bmi.b loc_0a1810

loc_0a17fa:
	addq.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	move.b ($3c,a6),d0
	moveq #0,d1
	bset d0,d1
	or.w d1,($14,a5)

loc_0a1810:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a1812:
	tst.w ($14,a5)
	bne.b loc_0a181c
	addq.b #2,(4,a6)

loc_0a181c:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a181e:
	moveq #0,d3
	move.w ($50,a6),d3
	moveq #$27,d2
	jsr loc_01bbbe
	addi.w #$100,d0
	move.w d0,($14,a6)
	move.w d3,d1
	lsl.w #3,d1
	moveq #1,d0
	add.b ($89,a5),d0
	add.w d0,d0
	lea.l loc_0a2b90(pc),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1852:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($50,a6)
	bra.b loc_0a1894

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a186c:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($48,a6),d0
	add.w d0,($40,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($50,a6)
	move.w ($4c,a6),d0
	add.w d0,($44,a6)

loc_0a1894:
	move.w #$9c,d1
	move.w ($50,a6),d0

loc_0a189c:
	bpl.b loc_0a18a2
	add.w d1,d0
	bra.b loc_0a189c

loc_0a18a2:
	cmp.w d1,d0
	blt.b loc_0a18aa
	sub.w d1,d0
	bra.b loc_0a18a2

loc_0a18aa:
	move.w d0,($50,a6)
	rts

;==============================================
loc_0a18b0:
	move.b (4,a6),d0
	move.w loc_0a18bc(pc,d0.w),d1
	jmp loc_0a18bc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a18bc:
	dc.w loc_0a18c4-loc_0a18bc
	dc.w loc_0a191e-loc_0a18bc
	dc.w loc_0a21ee-loc_0a18bc
	dc.w loc_0a21ee-loc_0a18bc

;----------------------------------------------
loc_0a18c4:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w #$ff01,($c,a6)
	move.w d0,($e,a6)
	move.w d0,($26,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b #$10,($3a,a6)
	move.w #$c0,($10,a6)
	move.w #$80,($14,a6)
	bsr.w loc_0a19f6
	bsr.w loc_0a1a4c
	bsr.w loc_0a1a96
	bsr.w loc_0a1e16
	moveq #3,d0
	add.b ($89,a5),d0
	lea.l loc_0a2b90(pc),a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a191e:
	move.b (5,a6),d0
	move.w loc_0a1938(pc,d0.w),d1
	jsr loc_0a1938(pc,d1.w)
	bsr.w loc_0a1a96
	bsr.w loc_0a1e16
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1938:
	dc.w loc_0a193c-loc_0a1938
	dc.w loc_0a1948-loc_0a1938

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a193c:
	subq.b #1,($3a,a6)
	bne.b loc_0a1946
	addq.b #2,(5,a6)

loc_0a1946:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a1948:
	moveq #5,d6
	tst.b ($89,a5)
	beq.b loc_0a1952
	moveq #$a,d6

loc_0a1952:
	moveq #0,d4
	lea.l (-$447c,a5),a0

loc_0a1958:
	move.w (4,a0),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,(a0)
	move.w (6,a0),d0
	add.w d0,(4,a0)
	move.w (a0),d0
	addi.w #$100,d0
	cmpi.w #$200,d0
	bls.b loc_0a198a
	moveq #0,d0
	move.w #$101,(a0)
	move.w d0,(2,a0)
	move.w d0,(4,a0)
	move.w d0,(6,a0)
	bset d6,d4

loc_0a198a:
	lea.l (8,a0),a0
	dbra d6,loc_0a1958
	moveq #5,d6
	moveq #0,d5
	lea.l (-$4424,a5),a1

loc_0a199a:
	move.w (4,a1),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,(a1)
	move.w (6,a1),d0
	add.w d0,(4,a1)
	move.w (a1),d0
	addi.w #$a0,d0
	cmpi.w #$140,d0
	bls.b loc_0a19cc
	moveq #0,d0
	move.w #$a1,(a1)
	move.w d0,(2,a1)
	move.w d0,(4,a1)
	move.w d0,(6,a1)
	bset d6,d5

loc_0a19cc:
	lea.l (8,a1),a1
	dbra d6,loc_0a199a
	cmpi.w #$3f,d5
	beq.b loc_0a19ec
	move.w #$3f,d5
	tst.b ($89,a5)
	beq.b loc_0a19e8
	move.w #$7ff,d5

loc_0a19e8:
	cmp.w d5,d4
	bne.b loc_0a19f4

loc_0a19ec:
	addq.b #2,(4,a6)
	st.b ($14,a5)

loc_0a19f4:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a19f6:
	moveq #0,d5
	moveq #5,d6
	tst.b ($89,a5)
	beq.b loc_0a1a04
	moveq #$c,d5
	moveq #$a,d6

loc_0a1a04:
	lea.l (-$447c,a5),a0

loc_0a1a08:
	moveq #0,d1
	move.w d1,(2,a0)
	move.w d1,(4,a0)
	move.w loc_0a1a2a(pc,d5.w),d0
	move.w d0,(a0)
	asl.w #5,d0
	move.w d0,(6,a0)
	addq.w #2,d5
	lea.l (8,a0),a0
	dbra d6,loc_0a1a08
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1a2a:
	dc.w $ff34,$ff82,$ffd0,$001e
	dc.w $006c,$00ba,$ff3a,$ff62
	dc.w $ff8a,$ffb2,$ffda,$0002
	dc.w $002a,$0052,$007a,$00a2
	dc.w $00ca


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1a4c:
	moveq #0,d5
	tst.b ($89,a5)
	beq.b loc_0a1a56
	moveq #$c,d5

loc_0a1a56:
	moveq #5,d6
	lea.l (-$4424,a5),a1

loc_0a1a5c:
	moveq #0,d1
	move.w d1,(2,a1)
	move.w d1,(4,a1)
	move.w loc_0a1a7e(pc,d5.w),d1
	move.w d1,(a1)
	asl.w #5,d1
	move.w d1,(6,a1)
	addq.w #2,d5
	lea.l (8,a1),a1
	dbra d6,loc_0a1a5c
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a1a7e:
	dc.w $ffa3,$ffca
	dc.w $fff1,$0018
	dc.w $003f,$0066
	dc.w $ffa4,$ffcb
	dc.w $fff2,$0019
	dc.w $0040,$0067

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1a96:
	tst.b ($89,a5)
	bne.w loc_0a1bce
	move.w (-$447c,a5),d0
	subi.w #$24,d0
	lea.l (-$485c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4844,a5),a0
	bsr.w loc_0a216e
	lea.l (-$482c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4814,a5),a0
	bsr.w loc_0a216e
	lea.l (-$47fc,a5),a0
	bsr.w loc_0a216e
	lea.l (-$47e4,a5),a0
	bsr.w loc_0a216e
	move.w (-$4474,a5),d0
	subi.w #$24,d0
	lea.l (-$47cc,a5),a0
	bsr.w loc_0a216e
	lea.l (-$47b4,a5),a0
	bsr.w loc_0a216e
	lea.l (-$479c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4784,a5),a0
	bsr.w loc_0a216e
	move.w (-$446c,a5),d0
	subi.w #$24,d0
	lea.l (-$476c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4754,a5),a0
	bsr.w loc_0a216e
	lea.l (-$473c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4724,a5),a0
	bsr.w loc_0a216e
	lea.l (-$470c,a5),a0
	bsr.w loc_0a216e
	move.w (-$4464,a5),d0
	subi.w #$24,d0
	lea.l (-$46f4,a5),a0
	bsr.w loc_0a216e
	lea.l (-$46dc,a5),a0
	bsr.w loc_0a216e
	lea.l (-$46c4,a5),a0
	bsr.w loc_0a216e
	lea.l (-$46ac,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4694,a5),a0
	bsr.w loc_0a216e
	move.w (-$445c,a5),d0
	subi.w #$24,d0
	lea.l (-$467c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4664,a5),a0
	bsr.w loc_0a216e
	lea.l (-$464c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4634,a5),a0
	bsr.w loc_0a216e
	lea.l (-$461c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4604,a5),a0
	bsr.w loc_0a216e
	move.w (-$4454,a5),d0
	subi.w #$24,d0
	lea.l (-$45ec,a5),a0
	bsr.w loc_0a216e
	lea.l (-$45d4,a5),a0
	bsr.w loc_0a216e
	lea.l (-$45bc,a5),a0
	bsr.w loc_0a216e
	lea.l (-$45a4,a5),a0
	bsr.w loc_0a216e
	lea.l (-$458c,a5),a0
	bsr.w loc_0a216e
	lea.l (-$4574,a5),a0
	bra.w loc_0a216e

loc_0a1bce:
	move.w (-$447c,a5),d0
	subi.w #$12,d0
	lea.l (-$485c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$484c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$483c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$482c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$481c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$480c,a5),a0
	bsr.w loc_0a21b2
	move.w (-$4474,a5),d0
	subi.w #$12,d0
	lea.l (-$47fc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$47ec,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$47dc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$47cc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$47bc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$47ac,a5),a0
	bsr.w loc_0a21b2
	move.w (-$446c,a5),d0
	subi.w #$12,d0
	lea.l (-$479c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$478c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$477c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$476c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$475c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$474c,a5),a0
	bsr.w loc_0a21b2
	move.w (-$4464,a5),d0
	subi.w #$12,d0
	lea.l (-$473c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$472c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$471c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$470c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$46fc,a5),a0
	bsr.w loc_0a21b2
	move.w (-$445c,a5),d0
	subi.w #$12,d0
	lea.l (-$46ec,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$46dc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$46cc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$46bc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$46ac,a5),a0
	bsr.w loc_0a21b2
	move.w (-$4454,a5),d0
	subi.w #$12,d0
	lea.l (-$469c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$468c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$467c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$466c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$465c,a5),a0
	bsr.w loc_0a21b2
	move.w (-$444c,a5),d0
	subi.w #$12,d0
	lea.l (-$464c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$463c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$462c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$461c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$460c,a5),a0
	bsr.w loc_0a21b2
	move.w (-$4444,a5),d0
	subi.w #$12,d0
	lea.l (-$45fc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$45ec,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$45dc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$45cc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$45bc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$45ac,a5),a0
	bsr.w loc_0a21b2
	move.w (-$443c,a5),d0
	subi.w #$12,d0
	lea.l (-$459c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$458c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$457c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$456c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$455c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$454c,a5),a0
	bsr.w loc_0a21b2
	move.w (-$4434,a5),d0
	subi.w #$12,d0
	lea.l (-$453c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$452c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$451c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$450c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$44fc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$44ec,a5),a0
	bsr.w loc_0a21b2
	move.w (-$442c,a5),d0
	subi.w #$12,d0
	lea.l (-$44dc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$44cc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$44bc,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$44ac,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$449c,a5),a0
	bsr.w loc_0a21b2
	lea.l (-$448c,a5),a0
	bra.w loc_0a21b2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a1e16:
	tst.b ($89,a5)
	bne.w loc_0a1f4e

	move.w (-$4424,a5),d0
	subi.w #$11,d0
	lea.l (-$485c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$47cc,a5),a0
	bsr.w loc_0a2184
	lea.l (-$476c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$46f4,a5),a0
	bsr.w loc_0a2184
	lea.l (-$467c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$45ec,a5),a0
	bsr.w loc_0a2184
	move.w (-$441c,a5),d0
	subi.w #$11,d0
	lea.l (-$4844,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4754,a5),a0
	bsr.w loc_0a2184
	lea.l (-$46dc,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4664,a5),a0
	bsr.w loc_0a2184
	lea.l (-$45d4,a5),a0
	bsr.w loc_0a2184
	move.w (-$4414,a5),d0
	subi.w #$11,d0
	lea.l (-$482c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$464c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$45bc,a5),a0
	bsr.w loc_0a2184
	move.w (-$440c,a5),d0
	subi.w #$11,d0
	lea.l (-$4814,a5),a0
	bsr.w loc_0a2184
	lea.l (-$47b4,a5),a0
	bsr.w loc_0a2184
	lea.l (-$473c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$46c4,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4634,a5),a0
	bsr.w loc_0a2184
	lea.l (-$45a4,a5),a0
	bsr.w loc_0a2184
	move.w (-$4404,a5),d0
	subi.w #$11,d0
	lea.l (-$47fc,a5),a0
	bsr.w loc_0a2184
	lea.l (-$479c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4724,a5),a0
	bsr.w loc_0a2184
	lea.l (-$46ac,a5),a0
	bsr.w loc_0a2184
	lea.l (-$461c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$458c,a5),a0
	bsr.w loc_0a2184
	move.w (-$43fc,a5),d0
	subi.w #$11,d0
	lea.l (-$47e4,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4784,a5),a0
	bsr.w loc_0a2184
	lea.l (-$470c,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4694,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4604,a5),a0
	bsr.w loc_0a2184
	lea.l (-$4574,a5),a0
	bra.w loc_0a2184

loc_0a1f4e:
	move.w (-$4424,a5),d0
	subi.w #$11,d0
	lea.l (-$485c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47fc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$479c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$473c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46ec,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$469c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$464c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45fc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$459c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$453c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44dc,a5),a0
	bsr.w loc_0a21c8
	move.w (-$441c,a5),d0
	subi.w #$11,d0
	lea.l (-$484c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47ec,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$478c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$472c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46dc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$468c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$463c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45ec,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$458c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$452c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44cc,a5),a0
	bsr.w loc_0a21c8
	move.w (-$4414,a5),d0
	subi.w #$11,d0
	lea.l (-$483c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47dc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$477c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45dc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$457c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$451c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44bc,a5),a0
	bsr.w loc_0a21c8
	move.w (-$440c,a5),d0
	subi.w #$11,d0
	lea.l (-$482c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47cc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$476c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$471c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46cc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$467c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$462c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45cc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$456c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$450c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44ac,a5),a0
	bsr.w loc_0a21c8
	move.w (-$4404,a5),d0
	subi.w #$11,d0
	lea.l (-$481c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47bc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$475c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$470c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46bc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$466c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$461c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45bc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$455c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44fc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$449c,a5),a0
	bsr.w loc_0a21c8
	move.w (-$43fc,a5),d0
	subi.w #$11,d0
	lea.l (-$480c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$47ac,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$474c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46fc,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$46ac,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$465c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$460c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$45ac,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$454c,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$44ec,a5),a0
	bsr.w loc_0a21c8
	lea.l (-$448c,a5),a0
	bra.w loc_0a21c8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a216e:
	moveq #5,d6

loc_0a2170:
	move.w d6,d1
	lsl.w #2,d1
	move.w loc_0a219a(pc,d1.w),d2
	add.w d0,d2
	move.w d2,(a0,d1.w)
	dbra d6,loc_0a2170
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a2184:
	moveq #5,d6

loc_0a2186:
	move.w d6,d1
	lsl.w #2,d1
	move.w loc_0a219a+2(pc,d1.w),d2
	add.w d0,d2
	move.w d2,(2,a0,d1.w)
	dbra d6,loc_0a2186
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a219a:
	dc.w $0000,$0000,$0000
	dc.w $0020,$0010,$0020
	dc.w $0020,$0020,$0030
	dc.w $0020,$0040,$0020

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a21b2:
	moveq #3,d6

loc_0a21b4:
	move.w d6,d1
	lsl.w #2,d1
	move.w loc_0a21de(pc,d1.w),d2
	add.w d0,d2
	move.w d2,(a0,d1.w)
	dbra d6,loc_0a21b4
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a21c8:
	moveq #3,d6

loc_0a21ca:
	move.w d6,d1
	lsl.w #2,d1
	move.w loc_0a21de+2(pc,d1.w),d2
	add.w d0,d2
	move.w d2,(2,a0,d1.w)
	dbra d6,loc_0a21ca
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a21de:
	dc.w $0000,$0000
	dc.w $0010,$0000
	dc.w $0000,$0020
	dc.w $0010,$0020

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a21ee:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a21f4:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	add.b ($89,a5),d0
	lsl.w #2,d0
	move.w loc_0a2210(pc,d0.w),($10,a6)
	move.w loc_0a2210+2(pc,d0.w),($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2210:
	dc.w $0046,$00b6
	dc.w $0078,$008f
	dc.w $0046,$008f
	dc.w $00a0,$008f
	dc.w $0094,$008f
	dc.w $00c8,$008f
	dc.w $00e2,$008f
	dc.w $00f0,$008f
	dc.w $00ac,$00ad
	dc.w $00a5,$00ab
	dc.w $0058,$00a3
	dc.w $0040,$009f
	dc.w $0098,$0088
	dc.w $00b0,$0088
	dc.w $00f0,$0090
	dc.w $00f0,$0090
	dc.w $00c0,$0000
	dc.w $00c0,$0000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a2258:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	add.b ($89,a5),d0
	lsl.w #2,d0
	move.w loc_0a229c(pc,d0.w),d1
	movea.l loc_0a228c(pc,d1.w),a0
	move.w loc_0a228c+6(pc,d1.w),($1a,a6)
	move.w loc_0a229c+2(pc,d0.w),d0
	bne.b loc_0a2286
	tst.w d1
	bne.b loc_0a2286
	tst.w (Region,a5)
	beq.b loc_0a2286
	moveq #1,d0

loc_0a2286:
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a228c:
	dc.l loc_2f2de8
	dc.w $0000,$6000
	dc.l loc_0a2b90
	dc.w $0000,$2000

loc_0a229c:
	dc.w $0000,$0002,$0000,$0007
	dc.w $0000,$0003,$0000,$0008
	dc.w $0000,$0004,$0000,$0009
	dc.w $0000,$0005,$0000,$000a
	dc.w $0000,$0000,$0000,$0001
	dc.w $0000,$000c,$0000,$0006
	dc.w $0000,$000d,$0000,$000e
	dc.w $0000,$000b,$0000,$000b
	dc.w $0008,$0000,$0008,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a22e4:;
	dc.w loc_0a230c-loc_0a22e4
	dc.w loc_0a23c0-loc_0a22e4
	dc.w loc_0a2434-loc_0a22e4
	dc.w loc_0a2434-loc_0a22e4

	dc.w loc_0a2330-loc_0a22e4
	dc.w loc_0a23c0-loc_0a22e4
	dc.w loc_0a2458-loc_0a22e4
	dc.w loc_0a2458-loc_0a22e4

	dc.w loc_0a2354-loc_0a22e4
	dc.w loc_0a23c0-loc_0a22e4
	dc.w loc_0a247c-loc_0a22e4
	dc.w loc_0a247c-loc_0a22e4

	dc.w loc_0a2378-loc_0a22e4
	dc.w loc_0a23c0-loc_0a22e4
	dc.w loc_0a24a0-loc_0a22e4
	dc.w loc_0a24a0-loc_0a22e4

	dc.w loc_0a239c-loc_0a22e4
	dc.w loc_0a23c0-loc_0a22e4
	dc.w loc_0a24c4-loc_0a22e4
	dc.w loc_0a24c4-loc_0a22e4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a230c:
	dc.w $0100,$0000
	dc.l loc_0a24e8
	dc.w $0100,$0000
	dc.l loc_0a2512
	dc.w $0100,$0000
	dc.l loc_0a253c
	dc.w $0180,$0000
	dc.l loc_0a2566
	dc.l loc_0a23c0

loc_0a2330:
	dc.w $0100,$0000
	dc.l loc_0a24e8
	dc.w $0100,$0000
	dc.l loc_0a2590
	dc.w $0100,$0000
	dc.l loc_0a25ba
	dc.w $0180,$0000
	dc.l loc_0a25e4
	dc.l loc_0a23c0

loc_0a2354:
	dc.w $0100,$0000
	dc.l loc_0a24e8
	dc.w $0100,$0000
	dc.l loc_0a260e
	dc.w $0100,$0000
	dc.l loc_0a2638
	dc.w $0180,$0000
	dc.l loc_0a2662
	dc.l loc_0a23c0

loc_0a2378:
	dc.w $0100,$0000
	dc.l loc_0a24e8
	dc.w $0100,$0000
	dc.l loc_0a268c
	dc.w $0100,$0000
	dc.l loc_0a26b6
	dc.w $0180,$0000
	dc.l loc_0a26e0
	dc.l loc_0a23c0

loc_0a239c:
	dc.w $0100,$0000
	dc.l loc_0a24e8
	dc.w $0100,$0000
	dc.l loc_0a270a
	dc.w $0100,$0000
	dc.l loc_0a2734
	dc.w $0180,$0000
	dc.l loc_0a275e
	dc.l loc_0a23c0

loc_0a23c0:
	dc.w $0400,$0000
	dc.l loc_0a2ae8
	dc.w $0400,$0000
	dc.l loc_0a2af4
	dc.w $0400,$0000
	dc.l loc_0a2b00
	dc.w $0400,$0000
	dc.l loc_0a2b0c
	dc.w $0400,$0000
	dc.l loc_0a2b18
	dc.w $0400,$0000
	dc.l loc_0a2b24
	dc.w $0400,$0000
	dc.l loc_0a2b30
	dc.w $0400,$0000
	dc.l loc_0a2b3c
	dc.w $0400,$0000
	dc.l loc_0a2b48
	dc.w $0400,$0000
	dc.l loc_0a2b54
	dc.w $0400,$0000
	dc.l loc_0a2b60
	dc.w $0400,$0000
	dc.l loc_0a2b6c
	dc.w $0400,$0000
	dc.l loc_0a2b78
	dc.w $0480,$0000
	dc.l loc_0a2b84
	dc.l loc_0a23c0

loc_0a2434:
	dc.w $0400,$0000
	dc.l loc_0a2788
	dc.w $0200,$0000
	dc.l loc_0a27be
	dc.w $0200,$0000
	dc.l loc_0a27f4
	dc.w $0280,$0000
	dc.l loc_0a282a
	dc.l loc_0a23c0

loc_0a2458:
	dc.w $0400,$0000
	dc.l loc_0a2788
	dc.w $0200,$0000
	dc.l loc_0a2860
	dc.w $0200,$0000
	dc.l loc_0a2896
	dc.w $0280,$0000
	dc.l loc_0a28cc
	dc.l loc_0a23c0

loc_0a247c:
	dc.w $0400,$0000
	dc.l loc_0a2788
	dc.w $0200,$0000
	dc.l loc_0a2902
	dc.w $0200,$0000
	dc.l loc_0a2938
	dc.w $0280,$0000
	dc.l loc_0a296e
	dc.l loc_0a23c0

loc_0a24a0:
	dc.w $0400,$0000
	dc.l loc_0a2788
	dc.w $0200,$0000
	dc.l loc_0a29a4
	dc.w $0200,$0000
	dc.l loc_0a29da
	dc.w $0280,$0000
	dc.l loc_0a2a10
	dc.l loc_0a23c0

loc_0a24c4:
	dc.w $0400,$0000
	dc.l loc_0a2788
	dc.w $0200,$0000
	dc.l loc_0a2a46
	dc.w $0200,$0000
	dc.l loc_0a2a7c
	dc.w $0280,$0000
	dc.l loc_0a2ab2
	dc.l loc_0a23c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a24e8:
	dc.w $0020,$0028,$0000
	dc.w $0040,$0028,$0080
	dc.w $0060,$0028,$0100
	dc.w $0400,$002c,$0000
	dc.w $0800,$0030,$05c0
	dc.w $0820,$0030,$0640
	dc.w $0c00,$0034,$0001

loc_0a2512:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0021

loc_0a253c:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0041

loc_0a2566:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0061

loc_0a2590:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0101

loc_0a25ba:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0121

loc_0a25e4:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0141

loc_0a260e:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0161

loc_0a2638:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0181

loc_0a2662:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$01a1

loc_0a268c:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$01c1

loc_0a26b6:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$01e1

loc_0a26e0:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0201

loc_0a270a:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0221

loc_0a2734:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0241

loc_0a275e:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0261

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2788:
	dc.w $0020,$0028,$0000
	dc.w $0040,$0028,$0080
	dc.w $0060,$0028,$0100
	dc.w $0080,$0028,$0180
	dc.w $0100,$0028,$0200
	dc.w $0400,$002c,$0000
	dc.w $0800,$0030,$05c0
	dc.w $0820,$0030,$0640
	dc.w $0c00,$0034,$0001

loc_0a27be:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0080,$0028,$01a0
	dc.w $0100,$0028,$0220
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0021

loc_0a27f4:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0080,$0028,$01c0
	dc.w $0100,$0028,$0240
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0041

loc_0a282a:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0080,$0028,$01e0
	dc.w $0100,$0028,$0260
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0061

loc_0a2860:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0080,$0028,$01a0
	dc.w $0100,$0028,$0220
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0101

loc_0a2896:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0080,$0028,$01c0
	dc.w $0100,$0028,$0240
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0121

loc_0a28cc:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0080,$0028,$01e0
	dc.w $0100,$0028,$0260
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0141

loc_0a2902:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0080,$0028,$01a0
	dc.w $0100,$0028,$0220
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0161

loc_0a2938:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0080,$0028,$01c0
	dc.w $0100,$0028,$0240
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0181

loc_0a296e:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0080,$0028,$01e0
	dc.w $0100,$0028,$0260
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$01a1

loc_0a29a4:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0080,$0028,$01a0
	dc.w $0100,$0028,$0220
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$01c1

loc_0a29da:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0080,$0028,$01c0
	dc.w $0100,$0028,$0240
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$01e1

loc_0a2a10:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0080,$0028,$01e0
	dc.w $0100,$0028,$0260
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0201

loc_0a2a46:
	dc.w $0020,$0028,$0020
	dc.w $0040,$0028,$00a0
	dc.w $0060,$0028,$0120
	dc.w $0080,$0028,$01a0
	dc.w $0100,$0028,$0220
	dc.w $0400,$002c,$0020
	dc.w $0800,$0030,$05e0
	dc.w $0820,$0030,$0660
	dc.w $0c00,$0034,$0221

loc_0a2a7c:
	dc.w $0020,$0028,$0040
	dc.w $0040,$0028,$00c0
	dc.w $0060,$0028,$0140
	dc.w $0080,$0028,$01c0
	dc.w $0100,$0028,$0240
	dc.w $0400,$002c,$0040
	dc.w $0800,$0030,$0600
	dc.w $0820,$0030,$0680
	dc.w $0c00,$0034,$0241

loc_0a2ab2:
	dc.w $0020,$0028,$0060
	dc.w $0040,$0028,$00e0
	dc.w $0060,$0028,$0160
	dc.w $0080,$0028,$01e0
	dc.w $0100,$0028,$0260
	dc.w $0400,$002c,$0060
	dc.w $0800,$0030,$0620
	dc.w $0820,$0030,$06a0
	dc.w $0c00,$0034,$0261

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2ae8:
	dc.w $0800,$0030,$0080
	dc.w $0820,$0030,$0241

loc_0a2af4:
	dc.w $0800,$0030,$00a0
	dc.w $0820,$0030,$0261

loc_0a2b00:
	dc.w $0800,$0030,$00c0
	dc.w $0820,$0030,$0281

loc_0a2b0c:
	dc.w $0800,$0030,$00e0
	dc.w $0820,$0030,$02a1

loc_0a2b18:
	dc.w $0800,$0030,$0100
	dc.w $0820,$0030,$02c1

loc_0a2b24:
	dc.w $0800,$0030,$0120
	dc.w $0820,$0030,$02e1

loc_0a2b30:
	dc.w $0800,$0030,$0140
	dc.w $0820,$0030,$0301

loc_0a2b3c:
	dc.w $0800,$0030,$0160
	dc.w $0820,$0030,$0321

loc_0a2b48:
	dc.w $0800,$0030,$0180
	dc.w $0820,$0030,$0341

loc_0a2b54:
	dc.w $0800,$0030,$01a0
	dc.w $0820,$0030,$0361

loc_0a2b60:
	dc.w $0800,$0030,$01c0
	dc.w $0820,$0030,$0381

loc_0a2b6c:
	dc.w $0800,$0030,$01e0
	dc.w $0820,$0030,$03a1

loc_0a2b78:
	dc.w $0800,$0030,$0200
	dc.w $0820,$0030,$03c1

loc_0a2b84:
	dc.w $0800,$0030,$0220
	dc.w $0820,$0030,$03e1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2b90:
	dc.w loc_0a2b9c-loc_0a2b90
	dc.w loc_0a2ba4-loc_0a2b90
	dc.w loc_0a2bc4-loc_0a2b90
	dc.w loc_0a2be4-loc_0a2b90
	dc.w loc_0a2bec-loc_0a2b90
	dc.w $0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2b9c:
	dc.w $ff40,$0000
	dc.l loc_0a2bf4

loc_0a2ba4:
	dc.w $0800,$0000
	dc.l loc_0a2cc2
	dc.w $0800,$0000
	dc.l loc_0a2d74
	dc.w $0800,$0000
	dc.l loc_0a2e26
	dc.w $ff40,$0000
	dc.l loc_0a2ed8

loc_0a2bc4:
	dc.w $0800,$0000
	dc.l loc_0a2f8a
	dc.w $0800,$0000
	dc.l loc_0a2fdc
	dc.w $0800,$0000
	dc.l loc_0a302a
	dc.w $ff40,$0000
	dc.l loc_0a307c

loc_0a2be4:
	dc.w $ff40,$0000
	dc.l loc_0a30ca

loc_0a2bec:
	dc.w $ff40,$0000
	dc.l loc_0a33d4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2bf4:
	dc.w $0008,$0035,$0018
	dc.w $2400,$0301,$ff40,$fff8
	dc.w $2400,$0301,$ff80,$fff8
	dc.w $2400,$0301,$ffc0,$fff8
	dc.w $2400,$0301,$0000,$fff8
	dc.w $2400,$0301,$0040,$fff8
	dc.w $2400,$0301,$0080,$fff8
	dc.w $03c5,$001f,$ff70,$fff4
	dc.w $03c8,$001f,$ff7d,$fff4
	dc.w $03bc,$001f,$ff8d,$fff4
	dc.w $03ba,$001f,$ff9c,$fff4
	dc.w $03cd,$001f,$ffac,$fff4
	dc.w $03c2,$001f,$ffb7,$fff4
	dc.w $03c8,$001f,$ffc2,$fff4
	dc.w $03c7,$001f,$ffd2,$fff4
	dc.w $03cd,$001f,$ffe9,$fff4
	dc.w $03be,$001f,$fff9,$fff4
	dc.w $03cc,$001f,$0007,$fff4
	dc.w $03cd,$001f,$0016,$fff4
	dc.w $03cf,$001f,$002e,$fff4
	dc.w $03be,$001f,$003e,$fff4
	dc.w $03cb,$001f,$004c,$fff4
	dc.w $03cc,$001f,$005b,$fff4
	dc.w $03c2,$001f,$0065,$fff4
	dc.w $03c8,$001f,$0070,$fff4
	dc.w $03c7,$001f,$0080,$fff4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2cc2:
	dc.w $0002,$0069,$0029
	dc.l loc_0a37be
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004

loc_0a2d74:
	dc.w $0002,$0069,$0029
	dc.l loc_0a37be
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008

loc_0a2e26:
	dc.w $0002,$0069,$0029
	dc.l loc_0a37be
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004

loc_0a2ed8:
	dc.w $0002,$0069,$0029
	dc.l loc_0a37be
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a2f8a:
	dc.w $0002,$003f,$0011
	dc.l loc_0a3866
	dc.w $da4b,$2004,$da4c,$1104
	dc.w $da31,$0104,$da60,$1204
	dc.w $da63,$0204,$da4b,$2008
	dc.w $da6c,$1108,$da31,$0108
	dc.w $da73,$1208,$da63,$0208
	dc.w $da4b,$2004,$da4c,$1104
	dc.w $da31,$0104,$da60,$1204
	dc.w $da63,$0204,$da4b,$2008
	dc.w $da6c,$1108,$da31,$0108

loc_0a2fdc:
	dc.w $0002,$003f,$0010
	dc.l loc_0a38ae
	dc.w $da60,$1204,$da63,$0204
	dc.w $da4b,$2008,$da6c,$1108
	dc.w $da31,$0108,$da73,$1208
	dc.w $da63,$0208,$da4b,$2004
	dc.w $da4c,$1104,$da31,$0104
	dc.w $da60,$1204,$da63,$0204
	dc.w $da4b,$2008,$da6c,$1108
	dc.w $da31,$0108,$da73,$1208
	dc.w $da63,$0208

loc_0a302a:
	dc.w $0002,$003f,$0011
	dc.l loc_0a3866
	dc.w $da4b,$2008,$da6c,$1108
	dc.w $da31,$0108,$da73,$1208
	dc.w $da63,$0208,$da4b,$2004
	dc.w $da4c,$1104,$da31,$0104
	dc.w $da60,$1204,$da63,$0204
	dc.w $da4b,$2008,$da6c,$1108
	dc.w $da31,$0108,$da73,$1208
	dc.w $da63,$0208,$da4b,$2004
	dc.w $da4c,$1104,$da31,$0104

loc_0a307c:
	dc.w $0002,$003f,$0010
	dc.l loc_0a38ae
	dc.w $da73,$1208,$da63,$0208
	dc.w $da4b,$2004,$da4c,$1104
	dc.w $da31,$0104,$da60,$1204
	dc.w $da63,$0204,$da4b,$2008
	dc.w $da6c,$1108,$da31,$0108
	dc.w $da73,$1208,$da63,$0208
	dc.w $da4b,$2004,$da4c,$1104
	dc.w $da31,$0104,$da60,$1204
	dc.w $da63,$0204


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a30ca:
	dc.w $0002,$021c,$00bf
	dc.l $ff37a4
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004
	dc.w $da10,$1404,$d9f0,$0004
	dc.w $d9f0,$0004,$d9f0,$0004
	dc.w $d9f0,$0004,$da0c,$0004
	dc.w $da25,$1404,$da0e,$0004
	dc.w $da0e,$0004,$da0e,$0004
	dc.w $da0e,$0004,$da0d,$0004
	dc.w $da2a,$1408,$d9f0,$0008
	dc.w $d9f0,$0008,$d9f0,$0008
	dc.w $d9f0,$0008,$da0c,$0008
	dc.w $da07,$1404,$d9ef,$0004
	dc.w $d9ef,$0004,$d9ef,$0004
	dc.w $d9ef,$0004,$d9e0,$0004

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a33d4:
	dc.w $0002,$022e,$00f7
	dc.l $ff37a4
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108
	dc.w $da73,$1008,$da74,$1108
	dc.w $da63,$0008,$da64,$0108
	dc.w $da4b,$1004,$da4c,$1104
	dc.w $da6b,$0004,$da31,$0104
	dc.w $da60,$1004,$da61,$1104
	dc.w $da63,$0004,$da64,$0104
	dc.w $da4b,$1008,$da6c,$1108
	dc.w $da6b,$0008,$da31,$0108

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a37be:
	dc.w $ffd8,$0010,$ffd8,$0030
	dc.w $ffe8,$0030,$fff8,$0030
	dc.w $0008,$0030,$0018,$0030
	dc.w $ffd8,$0037,$ffd8,$0057
	dc.w $ffe8,$0057,$fff8,$0057
	dc.w $0008,$0057,$0018,$0057
	dc.w $ffd8,$005e,$ffd8,$007e
	dc.w $ffe8,$007e,$fff8,$007e
	dc.w $0008,$007e,$0018,$007e
	dc.w $ffd8,$0085,$ffd8,$00a5
	dc.w $ffe8,$00a5,$fff8,$00a5
	dc.w $0008,$00a5,$0018,$00a5
	dc.w $ffd8,$00ac,$ffd8,$00cc
	dc.w $ffe8,$00cc,$fff8,$00cc
	dc.w $0008,$00cc,$0018,$00cc
	dc.w $ffd8,$00d3,$ffd8,$00f3
	dc.w $ffe8,$00f3,$fff8,$00f3
	dc.w $0008,$00f3,$0018,$00f3
	dc.w $ffd8,$00fa,$ffd8,$011a
	dc.w $ffe8,$011a,$fff8,$011a
	dc.w $0008,$011a,$0018,$011a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3866:
	dc.w $ffe8,$0010,$fff8,$0010
	dc.w $fff8,$0030,$ffe8,$0037
	dc.w $ffe8,$0057,$ffe8,$005e
	dc.w $fff8,$005e,$fff8,$007e
	dc.w $ffe8,$0085,$ffe8,$00a5
	dc.w $ffe8,$00ac,$fff8,$00ac
	dc.w $fff8,$00cc,$ffe8,$00d3
	dc.w $ffe8,$00f3,$ffe8,$00fa
	dc.w $fff8,$00fa,$fff8,$011a

loc_0a38ae:
	dc.w $ffe8,$0010,$ffe8,$0030
	dc.w $ffe8,$0037,$fff8,$0037
	dc.w $fff8,$0057,$ffe8,$005e
	dc.w $ffe8,$007e,$ffe8,$0085
	dc.w $fff8,$0085,$fff8,$00a5
	dc.w $ffe8,$00ac,$ffe8,$00cc
	dc.w $ffe8,$00d3,$fff8,$00d3
	dc.w $fff8,$00f3,$ffe8,$00fa
	dc.w $ffe8,$011a

;##############################################
loc_0a38f2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a3902(pc,d0.w),d1
	jmp loc_0a3902(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3902:
	dc.w loc_0a390a-loc_0a3902
	dc.w loc_0a3960-loc_0a3902
	dc.w loc_0a39aa-loc_0a3902
	dc.w loc_0a39aa-loc_0a3902

;==============================================
loc_0a390a:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #0,($e,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a3930(pc,d0.w),d1
	jmp loc_0a3930(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3930:
	dc.w loc_0a3934-loc_0a3930
	dc.w loc_0a3934-loc_0a3930

;----------------------------------------------
loc_0a3934:
	move.b #2,(9,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	moveq #1,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;==============================================
loc_0a3960:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a3974(pc,d0.w),d1
	jmp loc_0a3974(pc,d1.w)

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;????
loc_0a396e:
	addq.b #2,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3974:
	dc.w loc_0a3978-loc_0a3974
	dc.w loc_0a3990-loc_0a3974

;----------------------------------------------
loc_0a3978:
	move.b (5,a6),d0
	move.w loc_0a3984(pc,d0.w),d1
	jmp loc_0a3984(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3984:
	dc.w loc_0a398a-loc_0a3984
	dc.w loc_0a398a-loc_0a3984
	dc.w loc_0a398a-loc_0a3984

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a398a:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3990:
	move.b (5,a6),d0
	move.w loc_0a39a2(pc,d0.w),d1
	jsr loc_0a39a2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a39a2:
	dc.w loc_0a39a8-loc_0a39a2
	dc.w loc_0a39a8-loc_0a39a2
	dc.w loc_0a39a8-loc_0a39a2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a39a8:
	rts

;==============================================
loc_0a39aa:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a39b0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;##############################################
loc_0a39d2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a39e2(pc,d0.w),d1
	jmp loc_0a39e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a39e2:
	dc.w loc_0a39ea-loc_0a39e2
	dc.w loc_0a3c48-loc_0a39e2
	dc.w loc_0a3f60-loc_0a39e2
	dc.w loc_0a3f60-loc_0a39e2

;==============================================
loc_0a39ea:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a3a2e(pc,d0.w),d1
	jmp loc_0a3a2e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3a2e:
	dc.w loc_0a3a42-loc_0a3a2e
	dc.w loc_0a3a56-loc_0a3a2e
	dc.w loc_0a3a8e-loc_0a3a2e
	dc.w loc_0a3aac-loc_0a3a2e
	dc.w loc_0a3aca-loc_0a3a2e
	dc.w loc_0a3b1a-loc_0a3a2e
	dc.w loc_0a3b34-loc_0a3a2e
	dc.w loc_0a3b5e-loc_0a3a2e

	dc.w loc_0a3b88-loc_0a3a2e
	dc.w loc_0a3c1c-loc_0a3a2e

;----------------------------------------------
loc_0a3a42:
	move.b #2,(9,a6)
	moveq #1,d0
	movea.l #loc_245ad6,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3a56:
	move.b #2,(9,a6)
	addq.b #4,($d,a6)
	moveq #$a,d0
	jsr loc_02fc88
	move.w #$80,d0
	eori.b #1,($b,a6)
	beq.b loc_0a3a76
	neg.w d0

loc_0a3a76:
	add.w d0,($10,a6)
	addi.w #$20,($14,a6)
	moveq #$42,d0
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3a8e:
	move.b #2,(9,a6)
	move.w #$6000,($1a,a6)
	clr.b ($c,a6)
	moveq #$25,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3aac:
	move.b #4,(9,a6)
	move.w #$6000,($1a,a6)
	clr.b ($c,a6)
	moveq #$26,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3aca:
	move.b #2,(9,a6)
	move.w ($64,a4),d0
	addi.w #$70,d0
	move.w d0,($14,a6)
	move.l #$fffe0000,($44,a6)
	move.l #$fffff000,($4c,a6)
	move.b ($3c,a6),d0
	andi.w #6,d0
	move.w loc_0a3b12(pc,d0.w),d0
	tst.b ($b,a4)
	beq.b loc_0a3b00
	neg.w d0

loc_0a3b00:
	add.w d0,($10,a6)
	moveq #1,d0
	movea.l #loc_29ef6c,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3b12:
	dc.w $0007,$002a,$001d,$0036

;----------------------------------------------
loc_0a3b1a:
	move.b #2,(9,a6)
	move.b #$40,($3a,a6)
	moveq #2,d0
	movea.l #loc_29ef6c,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3b34:
	move.b #4,(9,a6)
	movea.w ($38,a4),a0
	move.w ($10,a0),($10,a6)
	move.w ($14,a0),($14,a6)
	addi.w #$40,($14,a6)
	moveq #3,d0
	movea.l #loc_29ef6c,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3b5e:
	move.b #2,(9,a6)
	movea.w ($38,a4),a0
	move.w ($10,a0),($10,a6)
	move.w ($14,a0),($14,a6)
	addi.w #$40,($14,a6)
	moveq #4,d0
	movea.l #loc_29ef6c,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a3b88:
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$fffe0000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d1
	move.b ($3c,a6),d1
	lsl.w #3,d1
	move.b loc_0a3bdc(pc,d1.w),d0
	move.b loc_0a3bdc+1(pc,d1.w),(9,a6)
	move.w loc_0a3bdc+2(pc,d1.w),($3a,a6)
	move.w loc_0a3bdc+4(pc,d1.w),d2
	tst.b ($b,a6)
	beq.b loc_0a3bc6
	neg.w d2

loc_0a3bc6:
	add.w d2,($10,a6)
	addi.w #$e0,($14,a6)
	movea.l #loc_29ef6c,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3bdc:
	dc.b $05,$02
	dc.w $001c,$ffc0,$0000

	dc.b $06,$02
	dc.w $0018,$ffd0,$0000

	dc.b $07,$02
	dc.w $0010,$ffe0,$0000

	dc.b $08,$02
	dc.w $0004,$fff0,$0000

	dc.b $09,$04
	dc.w $0008,$0010,$0000

	dc.b $0a,$04
	dc.w $0014,$0020,$0000

	dc.b $0b,$04
	dc.w $0000,$0030,$0000

	dc.b $0c,$04
	dc.w $000c,$0040,$0000

;----------------------------------------------
loc_0a3c1c:
	move.b #4,(9,a6)
	addq.b #4,($d,a6)
	move.w ($14,a4),($14,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	moveq #$a,d0
	jsr loc_02fc88
	moveq #$49,d0
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

;==============================================
loc_0a3c48:
	tst.b ($12a,a5)
	bne.b loc_0a3c5c
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a3c62(pc,d0.w),d1
	jmp loc_0a3c62(pc,d1.w)

loc_0a3c5c:
	addq.b #2,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3c62:
	dc.w loc_0a3c76-loc_0a3c62
	dc.w loc_0a3d0a-loc_0a3c62
	dc.w loc_0a3dfc-loc_0a3c62
	dc.w loc_0a3dfc-loc_0a3c62
	dc.w loc_0a3e34-loc_0a3c62
	dc.w loc_0a3e6c-loc_0a3c62
	dc.w loc_0a3e94-loc_0a3c62
	dc.w loc_0a3e94-loc_0a3c62

	dc.w loc_0a3ea8-loc_0a3c62
	dc.w loc_0a3f10-loc_0a3c62

;----------------------------------------------
loc_0a3c76:
	move.b (5,a6),d0
	move.w loc_0a3c82(pc,d0.w),d1
	jmp loc_0a3c82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3c82:
	dc.w loc_0a3c88-loc_0a3c82
	dc.w loc_0a3cc4-loc_0a3c82
	dc.w loc_0a3ce4-loc_0a3c82

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3c88:
	tst.b ($35,a4)
	beq.b loc_0a3cc2
	addq.b #2,(5,a6)
	move.b #$13,($3a,a6)
	moveq #0,d0
	move.l #$20000,($40,a6)
	move.l d0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_0a3cc2
	neg.l ($40,a6)
	bra.b loc_0a3cc4

loc_0a3cc2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3cc4:
	subq.b #1,($3a,a6)
	bpl.b loc_0a3cd4
	addq.b #2,(5,a6)
	move.b #$28,($3a,a6)

loc_0a3cd4:
	bsr.w loc_0a3f66
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3ce4:
	subq.b #1,($3a,a6)
	bmi.w loc_0a3c5c
	bsr.w loc_0a3f66
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($101,a4),d0
	btst #0,d0
	bne.b loc_0a3cc2
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3d0a:
	move.b (5,a6),d0
	move.w loc_0a3d1c(pc,d0.w),d1
	jsr loc_0a3d1c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3d1c:
	dc.w loc_0a3d22-loc_0a3d1c
	dc.w loc_0a3d38-loc_0a3d1c
	dc.w loc_0a3d52-loc_0a3d1c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3d22:
	jsr loc_01b6b6
	tst.b ($35,a6)
	beq.b loc_0a3d36
	addq.b #2,(5,a6)
	subq.b #1,($d,a6)

loc_0a3d36:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3d38:
	tst.b ($33,a6)
	bpl.b loc_0a3d4c
	addq.b #2,(5,a6)
	move.b #1,($3a,a6)
	clr.b ($3c,a6)

loc_0a3d4c:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3d52:
	subq.b #1,($3a,a6)
	bpl.b loc_0a3d76
	move.b #1,($3a,a6)
	move.b ($3c,a6),d0
	addq.b #1,d0
	andi.w #$1f,d0
	move.b d0,($3c,a6)
	lsl.w #2,d0
	move.l loc_0a3d7c(pc,d0.w),d0
	add.l d0,($14,a6)

loc_0a3d76:
	jmp loc_01b6b6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3d7c:
	dc.l $00020000,$0001f5c0
	dc.l $0001d880,$0001a960
	dc.l $000169e0,$00011c20
	dc.l $0000c380,$000063c0
	dc.l $00000000,$ffff9c40
	dc.l $ffff3c80,$fffee3e0
	dc.l $fffe9620,$fffe56a0
	dc.l $fffe2780,$fffe0a40
	dc.l $fffe0000,$fffe0a40
	dc.l $fffe2780,$fffe56a0
	dc.l $fffe9620,$fffee3e0
	dc.l $ffff3c80,$ffff9c40
	dc.l $00000000,$000063c0
	dc.l $0000c380,$00011c20
	dc.l $000169e0,$0001a960
	dc.l $0001d880,$0001f5c0

;----------------------------------------------
loc_0a3dfc:
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02000e00,d0
	bne.w loc_0a3c5c
	jsr loc_01b6b6
	tst.b ($34,a6)
	beq.b loc_0a3e2e
	clr.b ($34,a6)
	moveq #-$c,d0
	tst.b ($b,a6)
	beq.b loc_0a3e2a
	neg.w d0

loc_0a3e2a:
	add.w d0,($10,a6)

loc_0a3e2e:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3e34:
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000e00,d0
	bne.w loc_0a3c5c
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	tst.b ($33,a6)
	bmi.w loc_0a3c5c
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3e6c:
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000e00,d0
	bne.w loc_0a3c5c
	subq.b #1,($3a,a6)
	bmi.w loc_0a3c5c
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3e94:
	tst.b ($33,a6)
	bmi.w loc_0a3c5c
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3ea8:
	move.b (5,a6),d0
	move.w loc_0a3eb4(pc,d0.w),d1
	jmp loc_0a3eb4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3eb4:
	dc.w loc_0a3eba-loc_0a3eb4
	dc.w loc_0a3ede-loc_0a3eb4
	dc.w loc_0a3efc-loc_0a3eb4


;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3eba:
	subq.w #1,($3a,a6)
	bpl.b loc_0a3edc
	bsr.w loc_0a3f66
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0a3ed6
	addq.b #2,(5,a6)
	move.w d0,($14,a6)

loc_0a3ed6:
	jmp loc_01b4ec

loc_0a3edc:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3ede:
	cmpi.b #1,($35,a4)
	bne.b loc_0a3ef0
	addq.b #2,(5,a6)
	move.b #1,($32,a6)

loc_0a3ef0:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a3efc:
	tst.b ($33,a6)
	bmi.w loc_0a3c5c
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a3f10:
	movea.w ($36,a6),a3
	tst.b (a3)
	beq.w loc_0a3c5c
	movea.w ($36,a3),a4
	jsr loc_07bdb4
	bne.b loc_0a3f52
	subq.w #1,($3a,a6)
	bpl.b loc_0a3f52
	tst.b ($35,a6)
	bmi.b loc_0a3f3a
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_0a3f3a:
	jsr loc_01b6b6
	move.b ($d,a4),d0
	add.b ($34,a6),d0
	move.b d0,($d,a6)
	jsr loc_01b490

loc_0a3f52:
	tst.w ($3a,a6)
	bpl.b loc_0a3f5e
	jmp loc_01b4d0

loc_0a3f5e:
	rts

;==============================================
loc_0a3f60:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a3f66:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;##############################################
;Cammy Uses this
loc_0a3f88:
	jsr loc_01c2c8
	beq.b loc_0a3f9c
	addq.b #1,(a4)
	move.w #$3900,(2,a4)
	move.w a6,($36,a4)

loc_0a3f9c:
	rts

;##############################################
;Juni,Juli,Cammy Uses this
loc_0a3f9e:
	jsr loc_01c2c8
	beq.b loc_0a3fb2
	addq.b #1,(a4)
	move.w #$3901,(2,a4)
	move.w a6,($36,a4)

loc_0a3fb2:
	rts

;##############################################
loc_0a3fb4:
	move.b (4,a6),d0
	move.w loc_0a3fc0(pc,d0.w),d1
	jmp loc_0a3fc0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a3fc0:
	dc.w loc_0a3fc8-loc_0a3fc0
	dc.w loc_0a417c-loc_0a3fc0
	dc.w loc_0a42f4-loc_0a3fc0
	dc.w loc_0a42f4-loc_0a3fc0

;==============================================
loc_0a3fc8:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.w ($c,a4),($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($e,a4),($e,a6)
	move.b #6,(9,a6)
	move.l ($18,a4),($18,a6)
	move.b ($b,a4),($b,a6)
	move.w ($64,a4),($64,a6)
	bsr.b loc_0a4076
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a4012(pc,d0.w),d1
	jmp loc_0a4012(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4012:
	dc.w loc_0a4024-loc_0a4012
	dc.w loc_0a4048-loc_0a4012
	dc.w loc_0a4050-loc_0a4012
	dc.w loc_0a4050-loc_0a4012
	dc.w loc_0a4056-loc_0a4012
	dc.w loc_0a4050-loc_0a4012
	dc.w loc_0a4050-loc_0a4012
	dc.w loc_0a4068-loc_0a4012

	dc.w loc_0a406c-loc_0a4012

;----------------------------------------------
loc_0a4024:
	clr.b ($3c,a6)

loc_0a4028:
	moveq #$11,d0
	add.b (3,a6),d0

loc_0a402e:
	movea.l #loc_196fb6,a0
	cmpi.b #6,($102,a4)
	beq.b loc_0a4042
	movea.l #loc_19716e,a0

loc_0a4042:
	jmp loc_01b6e0

;----------------------------------------------
loc_0a4048:
	move.b #$10,($3c,a6)
	bra.b loc_0a4028

;----------------------------------------------
loc_0a4050:
	bsr.w loc_0a4098
	bra.b loc_0a4028

;----------------------------------------------
loc_0a4056:
	addi.w #$10,($64,a6)
	move.b #$18,($3a,a6)
	bsr.w loc_0a4098
	bra.b loc_0a4028

;----------------------------------------------
loc_0a4068:
	moveq #$16,d0
	bra.b loc_0a402e

;----------------------------------------------
loc_0a406c:
	move.b #2,(9,a6)
	moveq #$1a,d0
	bra.b loc_0a402e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4076:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d0
	move.w loc_0a40c8(pc,d0.w),d1
	move.w loc_0a40c8+2(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_0a408e
	neg.w d1

loc_0a408e:
	add.w d1,($10,a6)
	add.w d2,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4098:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #4,d0
	move.l loc_0a40ec(pc,d0.w),($40,a6)
	move.l loc_0a40ec+4(pc,d0.w),($48,a6)
	move.l loc_0a40ec+8(pc,d0.w),($44,a6)
	move.l loc_0a40ec+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	beq.b loc_0a40c6
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0a40c6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a40c8:
	dc.w $ffd3,$007e
	dc.w $ffce,$0082
	dc.w $0044,$002c
	dc.w $ffd0,$0060
	dc.w $0030,$0070
	dc.w $ffce,$001e
	dc.w $ffd1,$0077
	dc.w $ffe6,$0022
	dc.w $ffe9,$005e

loc_0a40ec:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $0000c000,$00000000,$00020000,$ffffe800
	dc.l $ffff4000,$00000000,$00020000,$ffffe800
	dc.l $00020000,$00000000,$00020000,$ffffc000
	dc.l $00000000,$00000000,$fffd8000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$fffd8000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000

;==============================================
loc_0a417c:
	tst.b ($12a,a5)
	bne.b loc_0a4190
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a4198(pc,d0.w),d1
	jmp loc_0a4198(pc,d1.w)

loc_0a4190:
	move.b #4,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4198:
	dc.w loc_0a41aa-loc_0a4198
	dc.w loc_0a41aa-loc_0a4198
	dc.w loc_0a41d0-loc_0a4198
	dc.w loc_0a41d0-loc_0a4198

	dc.w loc_0a4252-loc_0a4198
	dc.w loc_0a4274-loc_0a4198
	dc.w loc_0a42be-loc_0a4198
	dc.w loc_0a4274-loc_0a4198

	dc.w loc_0a42b6-loc_0a4198

;----------------------------------------------
loc_0a41aa:
	moveq #1,d0
	addq.b #1,($3c,a6)
	andi.b #$1f,($3c,a6)
	btst #4,($3c,a6)
	beq.b loc_0a41c0
	neg.w d0

loc_0a41c0:
	add.w d0,($14,a6)
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_0a41d0:
	move.b (5,a6),d0
	move.w loc_0a41e2(pc,d0.w),d1
	jsr loc_0a41e2(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a41e2:
	dc.w loc_0a41e8-loc_0a41e2
	dc.w loc_0a422a-loc_0a41e2
	dc.w loc_0a4250-loc_0a41e2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a41e8:
	bsr.w loc_0a42ca
	bgt.b loc_0a4224
	move.l #$2000,($40,a6)
	move.b (3,a6),d0
	andi.w #1,d0
	move.b ($b,a6),d1
	eor.b d1,d0
	beq.b loc_0a420a
	neg.l ($40,a6)

loc_0a420a:
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	move.l #$1c000,($44,a6)
	move.l #$ffffe800,($4c,a6)

loc_0a4224:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a422a:
	bsr.w loc_0a42ca
	bgt.b loc_0a424a
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	move.b (3,a6),d0
	andi.w #1,d0
	addi.w #$18,d0
	bsr.w loc_0a402e

loc_0a424a:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4250:
	rts

;----------------------------------------------
loc_0a4252:
	bsr.b loc_0a42ca
	bgt.b loc_0a425a
	addq.b #2,(4,a6)

loc_0a425a:
	subq.b #1,($3a,a6)
	bpl.b loc_0a426e
	clr.b ($3a,a6)
	btst #0,($b4,a5)
	bne.b loc_0a426e
	rts

loc_0a426e:
	jmp loc_01b4d0

;----------------------------------------------
loc_0a4274:
	move.b (5,a6),d0
	move.w loc_0a4286(pc,d0.w),d1
	jsr loc_0a4286(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4286:
	dc.w loc_0a428a-loc_0a4286
	dc.w loc_0a42ac-loc_0a4286

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a428a:
	bsr.b loc_0a42ca
	bgt.b loc_0a42aa
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	move.b #8,($3a,a6)
	move.b #1,($32,a6)
	jmp loc_01b6b6

loc_0a42aa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a42ac:
	subq.b #1,($3a,a6)
	bmi.w loc_0a4190
	rts

;----------------------------------------------
loc_0a42b6:
	tst.b ($33,a6)
	bmi.w loc_0a4190

loc_0a42be:
	jsr loc_01b6b6
	jmp loc_01b4d0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a42ca:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	rts

;==============================================
loc_0a42f4:
	jmp loc_01c2de

;##############################################
loc_0a42fa:
	move.b (4,a6),d0
	move.w loc_0a4306(pc,d0.w),d1
	jmp loc_0a4306(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4306:
	dc.w loc_0a430e-loc_0a4306
	dc.w loc_0a443a-loc_0a4306
	dc.w loc_0a4884-loc_0a4306
	dc.w loc_0a4884-loc_0a4306

;==============================================
loc_0a430e:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	move.b ($59,a4),($59,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a433e(pc,d0.w),d1
	jmp loc_0a433e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a433e:
	dc.w loc_0a4350-loc_0a433e
	dc.w loc_0a4356-loc_0a433e
	dc.w loc_0a436c-loc_0a433e
	dc.w loc_0a435c-loc_0a433e
	dc.w loc_0a435c-loc_0a433e
	dc.w loc_0a439c-loc_0a433e
	dc.w loc_0a43aa-loc_0a433e
	dc.w loc_0a43da-loc_0a433e
	dc.w loc_0a4400-loc_0a433e

;----------------------------------------------
loc_0a4350:
	move.b #1,($30,a6)

loc_0a4356:
	move.b ($e,a4),($e,a6)

loc_0a435c:
	move.b ($3c,a6),d0

loc_0a4360:
	movea.l #loc_2044b0,a0
	jmp loc_01b6e0

loc_0a436c:
	move.b ($e,a4),($e,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #6,d0
	move.l d0,($40,a6)
	clr.l ($48,a6)
	move.l #$30000,($44,a6)
	move.l #$ffff6000,($4c,a6)
	moveq #$4f,d0
	bra.b loc_0a4360

;----------------------------------------------
loc_0a439c:
	move.b ($e,a4),($e,a6)
	move.b #$28,($3a,a6)
	bra.b loc_0a435c

;----------------------------------------------
loc_0a43aa:
	move.b ($e,a4),($e,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #7,d0
	move.l d0,($40,a6)
	clr.l ($48,a6)
	move.l #$30000,($44,a6)
	move.l #$ffff6000,($4c,a6)
	moveq #$4f,d0
	bra.b loc_0a4360

;----------------------------------------------
loc_0a43da:
	move.b ($e,a4),($e,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffff6000,($4c,a6)
	moveq #$4f,d0
	bra.w loc_0a4360

;----------------------------------------------
loc_0a4400:
	move.b ($e,a4),($e,a6)
	clr.w ($c,a6)
	clr.b ($b,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b ($3a,a6),d0
	move.w loc_0a4434(pc,d0.w),($3a,a6)
	move.b ($59,a6),d0
	addi.b #$22,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4434:
	dc.w $0810,$0737,$044c

;==============================================
loc_0a443a:
	tst.b ($12a,a5)
	bne.b loc_0a445a
	tst.b ($125,a5)
	bne.b loc_0a4454
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a4460(pc,d0.w),d1
	jsr loc_0a4460(pc,d1.w)


loc_0a4454:
	jmp loc_01b4ec

loc_0a445a:
	addq.b #2,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4460:
	dc.w loc_0a4472-loc_0a4460
	dc.w loc_0a44a2-loc_0a4460
	dc.w loc_0a44b2-loc_0a4460
	dc.w loc_0a4592-loc_0a4460
	dc.w loc_0a45b8-loc_0a4460
	dc.w loc_0a45be-loc_0a4460
	dc.w loc_0a471a-loc_0a4460
	dc.w loc_0a481a-loc_0a4460
	dc.w loc_0a4854-loc_0a4460

;----------------------------------------------
loc_0a4472:
	move.b (5,a6),d0
	move.w loc_0a447e(pc,d0.w),d1
	jmp loc_0a447e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a447e:
	dc.w loc_0a4484-loc_0a447e
	dc.w loc_0a448a-loc_0a447e
	dc.w loc_0a4492-loc_0a447e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4484:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a448a:
	addq.b #2,(5,a6)
	bra.w loc_0a435c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4492:
	tst.b ($33,a6)
	bpl.b loc_0a449c
	addq.b #2,(4,a6)

loc_0a449c:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a44a2:
	tst.b ($33,a6)
	bpl.b loc_0a44ac
	addq.b #2,(4,a6)

loc_0a44ac:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a44b2:
	move.b (5,a6),d0
	move.w loc_0a44be(pc,d0.w),d1
	jmp loc_0a44be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a44be:
	dc.w loc_0a44c4-loc_0a44be
	dc.w loc_0a450e-loc_0a44be
	dc.w loc_0a4558-loc_0a44be

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a44c4:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a4508
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #6,d0
	move.l d0,($40,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_0a4508:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a450e:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a4552
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #7,d0
	move.l d0,($40,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_0a4552:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4558:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a458c
	addq.b #2,(4,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	jsr loc_0797d8
	jsr loc_079816
	jmp loc_079816

loc_0a458c:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a4592:
	move.b (5,a6),d0
	move.w loc_0a459e(pc,d0.w),d1
	jmp loc_0a459e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a459e:
	dc.w loc_0a45a2-loc_0a459e
	dc.w loc_0a45b8-loc_0a459e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a45a2:
	movea.w ($36,a6),a4
	tst.b ($33,a4)
	bpl.b loc_0a45b8
	addq.b #2,(5,a6)
	addq.b #2,($3c,a6)
	bra.w loc_0a435c

;----------------------------------------------
loc_0a45b8:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a45be:
	move.b (5,a6),d0
	move.w loc_0a45ca(pc,d0.w),d1
	jmp loc_0a45ca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a45ca:
	dc.w loc_0a45d0-loc_0a45ca
	dc.w loc_0a463e-loc_0a45ca
	dc.w loc_0a464c-loc_0a45ca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a45d0:
	subq.b #1,($3a,a6)
	bpl.b loc_0a4634
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	movea.w ($38,a4),a1
	tst.b ($2ca,a1)
	bne.b loc_0a45f6
	addq.b #2,(5,a6)
	move.b #$18,($3a,a6)
	bra.w loc_0a46b6

loc_0a45f6:
	jsr RNGFunction
	andi.w #$3f,d0
	subi.w #$20,d0
	add.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$3f,d0
	subi.w #$20,d0
	add.w d0,($14,a6)
	move.b ($b5,a5),d0
	andi.b #1,d0
	addi.b #$51,d0
	move.b d0,($3c,a6)
	bsr.w loc_0a435c
	jmp loc_003840

loc_0a4634:
	bsr.w loc_0a4660
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a463e:
	tst.b ($33,a6)
	bmi.w loc_0a445a
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a464c:
	subq.b #1,($3a,a6)
	bmi.w loc_0a445a
	jsr loc_01b0c4
	jmp loc_01b6b6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4660:
	movea.w ($36,a6),a3
	movea.w ($38,a3),a4
	moveq #0,d0
	move.b ($102,a4),d0
	movea.l #loc_1200d4,a0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	movea.l ($1c,a3),a1
	move.b ($10,a1),d0
	lsl.w #3,d0
	move.w (a0,d0.w),d1
	move.w (2,a0,d0.w),d2
	add.w ($40,a6),d1
	move.b ($b,a4),($b,a6)
	beq.b loc_0a46a0
	neg.w d1

loc_0a46a0:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	add.w ($44,a6),d2
	add.w ($14,a4),d2
	move.w d2,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a46b6:
	move.b ($b5,a5),d0
	andi.w #3,d0
	lsl.w #4,d0
	move.l loc_0a46da(pc,d0.w),($40,a6)
	move.l loc_0a46da+4(pc,d0.w),($48,a6)
	move.l loc_0a46da+8(pc,d0.w),($44,a6)
	move.l loc_0a46da+$c(pc,d0.w),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a46da:
	dc.l $00030000,$fffff000,$000a0000,$ffff8000
	dc.l $00060000,$00002000,$000b0000,$ffff8000
	dc.l $fffd0000,$ffffd000,$000c0000,$ffff8000
	dc.l $fffa0000,$00001000,$00080000,$ffff8000

;----------------------------------------------
loc_0a471a:
	move.b (5,a6),d0
	move.w loc_0a4726(pc,d0.w),d1
	jmp loc_0a4726(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4726:
	dc.w loc_0a472e-loc_0a4726
	dc.w loc_0a4778-loc_0a4726
	dc.w loc_0a47c2-loc_0a4726
	dc.w loc_0a480a-loc_0a4726

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a472e:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a4772
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #7,d0
	move.l d0,($40,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_0a4772:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4778:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a47bc
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a4),a1
	move.l ($10,a1),d0
	sub.l ($10,a4),d0
	asr.l #8,d0
	move.l d0,($40,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_0a47bc:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a47c2:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a4804
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.w d0,($c,a6)
	move.w #$6000,($1a,a6)
	moveq #$16,d0
	movea.l #loc_2e50a0,a0
	jsr loc_01b6e0
	jmp loc_003840

loc_0a4804:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a480a:
	tst.b ($33,a6)
	bpl.b loc_0a4814
	addq.b #2,(4,a6)

loc_0a4814:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a481a:
	jsr loc_01b0c4
	movea.w ($36,a6),a4
	move.w ($14,a6),d0
	cmp.w ($64,a4),d0
	bge.b loc_0a484e
	addq.b #2,(4,a6)
	move.w ($64,a4),($14,a6)
	clr.w ($16,a6)
	jsr loc_0797d8
	jsr loc_079816
	jmp loc_079816

loc_0a484e:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a4854:
	tst.b ($107,a5)
	bne.w loc_0a445a
	subq.b #1,($3a,a6)
	bpl.b loc_0a4882
	subq.b #1,($3b,a6)
	bmi.w loc_0a445a
	jsr loc_01bd68
	move.w ($14,a3),d0
	addi.w #$e0,d0
	move.w d0,($14,a6)
	jmp loc_01b6b6

loc_0a4882:
	rts

;==============================================
loc_0a4884:
	jmp loc_01c2de

;##############################################
loc_0a488a:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a489a(pc,d0.w),d1
	jmp loc_0a489a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a489a:
	dc.w loc_0a48a2-loc_0a489a
	dc.w loc_0a48f0-loc_0a489a
	dc.w loc_0a4906-loc_0a489a
	dc.w loc_0a4906-loc_0a489a

;==============================================
loc_0a48a2:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	move.w ($64,a4),($64,a6)
	moveq #0,d0
	movea.l #loc_2509c4,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;==============================================
loc_0a48f0:
	tst.b ($33,a6)
	bpl.b loc_0a48fa
	addq.b #2,(4,a6)

loc_0a48fa:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0a4906:
	jmp loc_01c2de

;##############################################
loc_0a490c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a491c(pc,d0.w),d1
	jmp loc_0a491c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a491c:
	dc.w loc_0a4924-loc_0a491c
	dc.w loc_0a4a2c-loc_0a491c
	dc.w loc_0a4b84-loc_0a491c
	dc.w loc_0a4b84-loc_0a491c

;==============================================
loc_0a4924:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.b ($102,a4),($5f,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($26,a4),($26,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_0a496c(pc,d0.w),d1
	jmp loc_0a496c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a496c:
	dc.w loc_0a4978-loc_0a496c
	dc.w loc_0a4990-loc_0a496c
	dc.w loc_0a49b2-loc_0a496c
	dc.w loc_0a49c2-loc_0a496c
	dc.w loc_0a49d6-loc_0a496c
	dc.w loc_0a49e6-loc_0a496c

;----------------------------------------------
loc_0a4978:
	bsr.w loc_0a4a08
	move.b #0,(9,a6)
	moveq #1,d0
	movea.l #loc_212ef0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a4990:
	bsr.w loc_0a4a08
	addq.b #3,($d,a6)
	move.b #4,(9,a6)
	move.w #$89,d0

loc_0a49a2:
	move.b d0,($3c,a6)
	movea.l #loc_25a5c0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a49b2:
	bsr.w loc_0a4a08
	move.b #4,(9,a6)
	move.w #$8b,d0
	bra.b loc_0a49a2

;----------------------------------------------
loc_0a49c2:
	bsr.w loc_0a4a08
	addq.b #3,($d,a6)
	move.b #4,(9,a6)
	move.w #$89,d0
	bra.b loc_0a49a2

;----------------------------------------------
loc_0a49d6:
	bsr.w loc_0a4a08
	move.b #4,(9,a6)
	move.w #$8b,d0
	bra.b loc_0a49a2

;----------------------------------------------
loc_0a49e6:
	bsr.w loc_0a4a08
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	move.b #2,(9,a6)
	moveq #$15,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4a08:
	move.b ($31,a6),d0
	jsr loc_02fc88
	move.w ($40,a6),d0
	move.w ($44,a6),d1
	tst.b ($b,a6)
	beq.b loc_0a4a22
	neg.w d0

loc_0a4a22:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	rts

;==============================================
loc_0a4a2c:
	tst.b ($12a,a5)
	bne.w loc_0a4b8a
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_0a4b8a
	move.b (3,a6),d0
	move.w loc_0a4a4c(pc,d0.w),d1
	jmp loc_0a4a4c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4a4c:
	dc.w loc_0a4a58-loc_0a4a4c
	dc.w loc_0a4a88-loc_0a4a4c
	dc.w loc_0a4a88-loc_0a4a4c
	dc.w loc_0a4ada-loc_0a4a4c
	dc.w loc_0a4a58-loc_0a4a4c
	dc.w loc_0a4b70-loc_0a4a4c

;----------------------------------------------
loc_0a4a58:
	move.b (5,a6),d0
	move.w loc_0a4a64(pc,d0.w),d1
	jmp loc_0a4a64(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4a64:
	dc.w loc_0a4a68-loc_0a4a64
	dc.w loc_0a4a74-loc_0a4a64

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4a68:
	tst.b ($35,a4)
	beq.b loc_0a4a72
	addq.b #2,(5,a6)

loc_0a4a72:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4a74:
	tst.b ($35,a4)
	beq.w loc_0a4b8a
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a4a88:
	move.b (5,a6),d0
	move.w loc_0a4a94(pc,d0.w),d1
	jmp loc_0a4a94(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4a94:
	dc.w loc_0a4a9a-loc_0a4a94
	dc.w loc_0a4aa6-loc_0a4a94
	dc.w loc_0a4ac6-loc_0a4a94

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4a9a:
	tst.b ($35,a4)
	beq.b loc_0a4aa4
	addq.b #2,(5,a6)

loc_0a4aa4:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4aa6:
	tst.b ($35,a4)
	bne.b loc_0a4aba
	addq.b #2,(5,a6)
	move.b ($3c,a6),d0
	addq.b #1,d0
	bsr.w loc_0a49a2

loc_0a4aba:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4ac6:
	tst.b ($33,a6)
	bmi.w loc_0a4b8a
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a4ada:
	move.b (5,a6),d0
	move.w loc_0a4ae6(pc,d0.w),d1
	jmp loc_0a4ae6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4ae6:
	dc.w loc_0a4af0-loc_0a4ae6
	dc.w loc_0a4afc-loc_0a4ae6
	dc.w loc_0a4b24-loc_0a4ae6
	dc.w loc_0a4b4e-loc_0a4ae6
	dc.w loc_0a4b6a-loc_0a4ae6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4af0:
	tst.b ($35,a4)
	beq.b loc_0a4afa
	addq.b #2,(5,a6)

loc_0a4afa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4afc:
	tst.b ($35,a4)
	bne.b loc_0a4b18
	addq.b #2,(5,a6)
	move.b #1,($3a,a6)
	subq.b #3,($d,a6)
	move.w #$8d,d0
	bsr.w loc_0a49a2

loc_0a4b18:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4b24:
	tst.b ($33,a6)
	bpl.b loc_0a4b42
	subq.b #1,($3a,a6)
	bpl.b loc_0a4b42
	addq.b #2,(5,a6)
	move.b #1,($3a,a6)
	move.w #$8e,d0
	bsr.w loc_0a49a2

loc_0a4b42:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4b4e:
	tst.b ($33,a6)
	bpl.b loc_0a4b5e
	subq.b #1,($3a,a6)
	bpl.b loc_0a4b5e
	addq.b #2,(5,a6)

loc_0a4b5e:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4b6a:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a4b70:
	tst.b ($33,a6)
	bmi.w loc_0a4b8a
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_0a4b84:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4b8a:
	addq.b #2,(4,a6)
	rts

;##############################################
loc_0a4b90:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a4ba0(pc,d0.w),d1
	jmp loc_0a4ba0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4ba0:
	dc.w loc_0a4ba8-loc_0a4ba0
	dc.w loc_0a4d9e-loc_0a4ba0
	dc.w loc_0a4fa4-loc_0a4ba0
	dc.w loc_0a4faa-loc_0a4ba0

;==============================================
loc_0a4ba8:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.b ($102,a4),($5f,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($26,a4),($26,a6)
	move.b ($59,a4),($59,a6)
	jsr loc_01bd68
	move.w ($10,a3),d0
	addi.w #$c0,d0
	move.w d0,($10,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_0a4c08(pc,d0.w),d1
	jmp loc_0a4c08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4c08:
	dc.w loc_0a4c16-loc_0a4c08
	dc.w loc_0a4c3e-loc_0a4c08
	dc.w loc_0a4c8c-loc_0a4c08
	dc.w loc_0a4cb8-loc_0a4c08
	dc.w loc_0a4ce6-loc_0a4c08
	dc.w loc_0a4d2c-loc_0a4c08
	dc.w loc_0a4d5a-loc_0a4c08

;----------------------------------------------
loc_0a4c16:
	move.b #4,(9,a6)
	move.w #$60,($3a,a6)
	move.w ($10,a4),($10,a6)
	moveq #8,d0
	bsr.b loc_0a4c32
	jmp loc_0a51b6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4c32:
	movea.l #loc_290590,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a4c3e:
	move.b #2,(9,a6)
	move.w #$40,($3a,a6)
	move.l #$80000,($40,a6)
	move.l #0,($48,a6)
	move.l #$30000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	move.w #$fea0,d0
	tst.b ($b,a6)
	bne.b loc_0a4c7e
	neg.l ($40,a6)
	neg.l ($48,a6)
	neg.w d0

loc_0a4c7e:
	add.w d0,($10,a6)
	addi.w #$38,($14,a6)
	moveq #$b,d0
	bra.b loc_0a4c32

;----------------------------------------------
loc_0a4c8c:
	move.b #4,(9,a6)
	move.l #$40000,($40,a6)
	move.w #$ff00,d0
	tst.b ($b,a6)
	bne.b loc_0a4caa
	neg.l ($40,a6)
	neg.w d0

loc_0a4caa:
	add.w d0,($10,a6)
	moveq #0,d0
	bsr.b loc_0a4c32
	jmp loc_0a51b6

;----------------------------------------------
loc_0a4cb8:
	move.b #2,(9,a6)
	move.l #$40000,($40,a6)
	move.w #$ff00,d0
	tst.b ($b,a6)
	bne.b loc_0a4cd6
	neg.l ($40,a6)
	neg.w d0

loc_0a4cd6:
	add.w d0,($10,a6)
	moveq #3,d0
	bsr.w loc_0a4c32
	jmp loc_0a51b6

;----------------------------------------------
loc_0a4ce6:
	move.b #4,(9,a6)
	clr.w ($3a,a6)
	move.l #$40000,($40,a6)
	move.w #$ff00,d0
	tst.b ($b,a6)
	bne.b loc_0a4d08
	neg.l ($40,a6)
	neg.w d0

loc_0a4d08:
	add.w d0,($10,a6)
	jsr loc_01c2c8
	beq.b loc_0a4d20
	move.l #$1003e0a,(a4)
	move.w ($36,a6),($36,a4)

loc_0a4d20:
	moveq #6,d0
	bsr.w loc_0a4c32
	jmp loc_0a51b6

;----------------------------------------------
loc_0a4d2c:
	move.b #4,(9,a6)
	move.w #$60,($3a,a6)
	move.l #$a0000,($40,a6)
	move.w #$ff00,d0
	tst.b ($b,a6)
	bne.b loc_0a4d50
	neg.l ($40,a6)
	neg.w d0

loc_0a4d50:
	add.w d0,($10,a6)
	moveq #7,d0
	bra.w loc_0a4c32

;----------------------------------------------
loc_0a4d5a:
	clr.b (9,a6)
	move.b ($59,a6),d0
	add.b d0,d0
	move.b d0,($d,a6)
	sne.b ($c,a6)
	move.w #$6000,($1a,a6)
	move.w ($10,a4),($10,a6)
	addi.w #$60,($14,a6)
	eori.b #1,($59,a6)
	movea.w ($38,a6),a4
	moveq #$1e,d0
	jsr loc_00390e
	moveq #1,d0
	lea.l loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_0a4d9e:
	tst.b ($12a,a5)
	bne.w loc_0a4fb0
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_0a4fb0
	move.b (3,a6),d0
	move.w loc_0a4dca(pc,d0.w),d1
	jsr loc_0a4dca(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4dca:
	dc.w loc_0a4dd8-loc_0a4dca
	dc.w loc_0a4e58-loc_0a4dca
	dc.w loc_0a4ece-loc_0a4dca
	dc.w loc_0a4f1e-loc_0a4dca
	dc.w loc_0a4f72-loc_0a4dca
	dc.w loc_0a4f72-loc_0a4dca
	dc.w loc_0a4f9c-loc_0a4dca

;----------------------------------------------
loc_0a4dd8:
	move.b (5,a6),d0
	move.w loc_0a4de4(pc,d0.w),d1
	jmp loc_0a4de4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4de4:
	dc.w loc_0a4dea-loc_0a4de4
	dc.w loc_0a4e1c-loc_0a4de4
	dc.w loc_0a4e46-loc_0a4de4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4dea:
	subq.w #1,($3a,a6)
	bpl.b loc_0a4e1a
	addq.b #2,(5,a6)
	move.b #$30,($3a,a6)
	jsr loc_01c2c8
	beq.b loc_0a4e14
	addq.b #1,(a4)
	move.w #$3e0c,(2,a4)
	move.w a6,($36,a4)
	move.w ($36,a6),($38,a4)

loc_0a4e14:
	moveq #9,d0
	bra.w loc_0a4c32

loc_0a4e1a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4e1c:
	subq.b #1,($3a,a6)
	bpl.b loc_0a4e44
	addq.b #2,(5,a6)
	move.b #$30,($3a,a6)
	move.l #$fffc0000,($40,a6)
	tst.b ($b,a6)
	bne.b loc_0a4e3e
	neg.l ($40,a6)

loc_0a4e3e:
	moveq #$a,d0
	bra.w loc_0a4c32

loc_0a4e44:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4e46:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_0a4fb0
	rts
 
;----------------------------------------------
loc_0a4e58:
	move.b (5,a6),d0
	move.w loc_0a4e64(pc,d0.w),d1
	jmp loc_0a4e64(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4e64:
	dc.w loc_0a4e6a-loc_0a4e64
	dc.w loc_0a4e7c-loc_0a4e64
	dc.w loc_0a4ec0-loc_0a4e64

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4e6a:
	subq.w #1,($3a,a6)
	bpl.b loc_0a4e7a
	addq.b #2,(5,a6)
	move.b #$1f,($3a,a6)

loc_0a4e7a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4e7c:
	subq.b #1,($3a,a6)
	bpl.b loc_0a4eba
	addq.b #2,(5,a6)
	move.b #$30,($3a,a6)
	move.l #$10000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_0a4eba
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0a4eba:
	jmp loc_01b0c4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4ec0:
	subq.b #1,($3a,a6)
	bmi.w loc_0a4fb0
	jmp loc_01b0c4

;----------------------------------------------
loc_0a4ece:
	move.b (5,a6),d0
	move.w loc_0a4eda(pc,d0.w),d1
	jmp loc_0a4eda(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4eda:
	dc.w loc_0a4ee0-loc_0a4eda
	dc.w loc_0a4f0c-loc_0a4eda
	dc.w loc_0a4f1c-loc_0a4eda

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4ee0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bhi.b loc_0a4f0a
	addq.b #2,(5,a6)
	move.b #8,($3a,a6)
	moveq #1,d0
	bra.w loc_0a4c32

loc_0a4f0a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4f0c:
	subq.b #1,($3a,a6)
	bpl.b loc_0a4f1c
	addq.b #2,(5,a6)
	moveq #2,d0
	bra.w loc_0a4c32

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4f1c:
	rts

;----------------------------------------------
loc_0a4f1e:
	move.b (5,a6),d0
	move.w loc_0a4f2a(pc,d0.w),d1
	jmp loc_0a4f2a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4f2a:
	dc.w loc_0a4f30-loc_0a4f2a
	dc.w loc_0a4f60-loc_0a4f2a
	dc.w loc_0a4f70-loc_0a4f2a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4f30:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	movea.w ($38,a4),a1
	move.w ($10,a6),d0
	sub.w ($10,a1),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bhi.b loc_0a4f5e
	addq.b #2,(5,a6)
	move.b #8,($3a,a6)
	moveq #4,d0
	bra.w loc_0a4c32

loc_0a4f5e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4f60:
	subq.b #1,($3a,a6)
	bpl.b loc_0a4f70
	addq.b #2,(5,a6)
	moveq #5,d0
	bra.w loc_0a4c32

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a4f70:
	rts

;----------------------------------------------
loc_0a4f72:
	subq.w #1,($3a,a6)
	bpl.b loc_0a4f9a
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_01bd68
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$50,d0
	cmpi.w #$220,d0
	bhi.w loc_0a4fb0

loc_0a4f9a:
	rts

;----------------------------------------------
loc_0a4f9c:
	tst.b ($33,a6)
	bmi.b loc_0a4fb0
	rts

;==============================================
loc_0a4fa4:
	addq.b #2,(4,a6)
	rts

;==============================================s
loc_0a4faa:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a4fb0:
	move.b #4,(4,a6)
	rts

;##############################################
loc_0a4fb8:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a4fc8(pc,d0.w),d1
	jmp loc_0a4fc8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a4fc8:
	dc.w loc_0a4fd0-loc_0a4fc8
	dc.w loc_0a4ff6-loc_0a4fc8
	dc.w loc_0a5026-loc_0a4fc8
	dc.w loc_0a502c-loc_0a4fc8

;==============================================
loc_0a4fd0:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)
	move.b #$22,($3a,a6)

loc_0a4ff6:
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0a5026
	subq.b #1,($3a,a6)
	bmi.w loc_0a5026
	move.b ($35,a4),d0
	beq.b loc_0a5032
	bmi.b loc_0a5026
	bsr.w loc_0a504a
	cmp.b ($3c,a6),d0
	bne.b loc_0a5038
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0a5026:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0a502c:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5032:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5038:
	move.b d0,($3c,a6)
	subq.b #1,d0
	movea.l #loc_161a10,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a504a:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	clr.b ($b,a6)
	tst.b ($b,a4)
	beq.b loc_0a5066
	subi.w #$18,($10,a6)

loc_0a5066:
	rts

;##############################################
loc_0a5068:
	move.b (4,a6),d0
	move.w loc_0a5074(pc,d0.w),d1
	jmp loc_0a5074(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5074:
	dc.w loc_0a507c-loc_0a5074
	dc.w loc_0a508c-loc_0a5074
	dc.w loc_0a50bc-loc_0a5074
	dc.w loc_0a50bc-loc_0a5074

;==============================================
loc_0a507c:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.b #6,(9,a6)

loc_0a508c:
	movea.w ($36,a6),a4
	tst.b ($5f,a4)
	beq.b loc_0a50b4
	move.l ($1c,a4),($1c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	jmp loc_01b4ec

loc_0a50b4:
	move.b #4,(4,a6)
	rts

;==============================================
loc_0a50bc:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a50c2:
	jsr loc_01c2c8
	beq.b loc_0a510a
	addq.b #1,(a4)
	move.b #$40,(2,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)
	move.w ($18,a6),($18,a4)
	move.w ($1a,a6),($1a,a4)
	move.w ($c,a6),($c,a4)
	addq.b #3,($d,a4)
	move.w ($26,a6),($26,a4)
	move.w ($e,a6),($e,a4)
	move.w a6,($36,a4)

loc_0a510a:
	rts

;##############################################
loc_0a510c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0a511c(pc,d0.w),d1
	jmp loc_0a511c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a511c:
	dc.w loc_0a5124-loc_0a511c
	dc.w loc_0a5166-loc_0a511c
	dc.w loc_0a51aa-loc_0a511c
	dc.w loc_0a51b0-loc_0a511c

;==============================================
loc_0a5124:
	addq.b #2,(4,a6)
	clr.w ($c,a6)
	move.b #6,(9,a6)
	move.b ($e,a4),($e,a6)
	move.b ($f,a4),($f,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.w ($26,a4),($26,a6)
	move.w ($14,a4),($14,a6)
	move.b ($30,a4),($30,a6)
	movea.l ($1c,a4),a0
	move.b (2,a0),d0
	bra.b loc_0a5182

;==============================================
loc_0a5166:
	cmpi.b #4,(4,a4)
	bcs.b loc_0a5172
	addq.b #2,(4,a6)

loc_0a5172:
	movea.l ($1c,a4),a0
	move.b (2,a0),d0
	beq.b loc_0a51a4
	cmp.b (3,a6),d0
	beq.b loc_0a5192

loc_0a5182:
	move.b d0,(3,a6)
	movea.l #loc_2e514c,a0
	jsr loc_01b6e0

loc_0a5192:
	move.w ($10,a4),($10,a6)
	tst.b (1,a4)
	beq.b loc_0a51a4
	jmp loc_01b4d0

loc_0a51a4:
	clr.b (1,a6)
	rts

;==============================================
loc_0a51aa:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0a51b0:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a51b6:
	jsr loc_01c2c8
	beq.b loc_0a51ca
	addq.b #1,(a4)
	move.b #$41,(2,a4)
	move.w a6,($36,a4)

loc_0a51ca:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a51cc:
	lsl.w #2,d0
	move.l loc_0a51e2(pc,d0.w),d0
	jsr loc_01c2c8
	beq.b loc_0a51e0
	move.l d0,(a4)
	move.w a6,($36,a4)

loc_0a51e0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a51e2:
	dc.l $01004200
	dc.l $01004202
	dc.l $01004204
	dc.l $01004206
	dc.l $01004208

;##############################################
loc_0a51f6:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_0a5206(pc,d0.w),d1
	jmp loc_0a5206(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5206:
	dc.w loc_0a5210-loc_0a5206
	dc.w loc_0a535e-loc_0a5206
	dc.w loc_0a5440-loc_0a5206
	dc.w loc_0a550c-loc_0a5206
	dc.w loc_0a55aa-loc_0a5206

;==============================================
loc_0a5210:
	move.b (4,a6),d0
	move.w loc_0a521c(pc,d0.w),d1
	jmp loc_0a521c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a521c:
	dc.w loc_0a5224-loc_0a521c
	dc.w loc_0a5270-loc_0a521c
	dc.w loc_0a5696-loc_0a521c
	dc.w loc_0a569a-loc_0a521c

;----------------------------------------------
loc_0a5224:
	moveq #1,d0
	bsr.w loc_0a56a6
	move.b #2,(9,a6)
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	movea.l #loc_119582,a0
	adda.w (a0),a0
	move.l a0,($54,a6)
	moveq #0,d0
	movea.l ($74,a6),a0
	jsr loc_01b6e0
	movea.l ($1c,a6),a0
	move.l a0,($50,a6)
	move.w #$140,d0
	adda.w d0,a0
	move.l a0,($1c,a6)
	jmp loc_01b4ec

;----------------------------------------------
loc_0a5270:
	move.b (5,a6),d0
	move.w loc_0a527c(pc,d0.w),d1
	jmp loc_0a527c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a527c:
	dc.w loc_0a5280-loc_0a527c
	dc.w loc_0a533a-loc_0a527c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5280:
	tst.b ($35,a4)
	bne.w loc_0a52fa
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	move.b ($b,a4),d0
	eori.b #1,d0
	move.b d0,($b,a6)
	move.w #$140,d0
	movea.l ($1c,a4),a0
	move.b ($10,a0),d1
	beq.b loc_0a52e8
	movea.l ($54,a6),a0
	lsl.w #3,d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,d1
	move.w (a0)+,d2
	tst.b ($b,a4)
	beq.b loc_0a52c4
	neg.w d1

loc_0a52c4:
	add.w d1,($10,a6)
	add.w d2,($14,a6)
	move.w (a0)+,d1
	spl.b d2
	addq.b #2,d2
	add.b d2,d2
	move.b d2,(9,a6)
	move.b ($b,a4),d2
	andi.w #3,d1
	eor.w d1,d2
	move.b d2,($b,a6)
	move.w (a0)+,d0

loc_0a52e8:
	movea.l ($50,a6),a0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	jmp loc_01b4ec

loc_0a52fa:
	addq.b #2,(5,a6)
	move.l #$c0000,d0
	moveq #0,d1
	tst.b ($b,a4)
	beq.b loc_0a5310
	neg.l d0
	neg.l d1

loc_0a5310:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$38000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$1d,d0
	movea.l ($74,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a533a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	bra.w loc_0a54e6

;==============================================
loc_0a535e:
	move.b (4,a6),d0
	move.w loc_0a536a(pc,d0.w),d1
	jmp loc_0a536a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a536a:
	dc.w loc_0a5372-loc_0a536a
	dc.w loc_0a53bc-loc_0a536a
	dc.w loc_0a5696-loc_0a536a
	dc.w loc_0a569a-loc_0a536a

;----------------------------------------------
loc_0a5372:
	moveq #$a,d0
	bsr.w loc_0a56a6
	moveq #$30,d1
	bsr.w loc_0a571a
	addi.w #$20,($14,a6)
	move.l #0,($40,a6)
	move.l #0,($48,a6)
	move.l #$ffff8000,($44,a6)
	move.l #$400,($4c,a6)
	move.b #$40,($3a,a6)
	moveq #$22,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;----------------------------------------------
loc_0a53bc:
	move.b (5,a6),d0
	move.w loc_0a53c8(pc,d0.w),d1
	jmp loc_0a53c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a53c8:
	dc.w loc_0a53cc-loc_0a53c8
	dc.w loc_0a53fa-loc_0a53c8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a53cc:
	bsr.w loc_0a5764
	bsr.w loc_0a5778
	cmpi.w #4,($c,a5)
	bcs.w loc_0a573c
	addq.b #2,(5,a6)
	move.w #$1e,($3a,a6)
	move.w ($10,a6),($40,a6)
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a53fa:
	move.w ($3a,a6),d0
	move.w loc_0a5420(pc,d0.w),d1
	add.w ($40,a6),d1
	move.w d1,($10,a6)
	subq.w #2,d0
	beq.w loc_0a56a0
	move.w d0,($3a,a6)
	jsr loc_01b692
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5420:
	dc.w $001e,$ffe4
	dc.w $001a,$ffe8
	dc.w $0016,$ffec
	dc.w $0012,$fff0
	dc.w $000e,$fff4
	dc.w $000a,$fff8
	dc.w $0006,$fffc
	dc.w $0002,$0000

;==============================================
loc_0a5440:
	move.b (4,a6),d0
	move.w loc_0a544c(pc,d0.w),d1
	jmp loc_0a544c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a544c:
	dc.w loc_0a5454-loc_0a544c
	dc.w loc_0a5472-loc_0a544c
	dc.w loc_0a5696-loc_0a544c
	dc.w loc_0a569a-loc_0a544c

;----------------------------------------------
loc_0a5454:
	moveq #$10,d0
	bsr.w loc_0a56a6
	moveq #$28,d1
	bsr.w loc_0a571a
	moveq #0,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;----------------------------------------------
loc_0a5472:
	move.b (5,a6),d0
	move.w loc_0a547e(pc,d0.w),d1
	jmp loc_0a547e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a547e:
	dc.w loc_0a5484-loc_0a547e
	dc.w loc_0a54a4-loc_0a547e
	dc.w loc_0a54e2-loc_0a547e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5484:
	cmpi.w #4,($c,a5)
	bcs.w loc_0a573c
	addq.b #2,(5,a6)
	moveq #$10,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a54a4:
	tst.b ($33,a6)
	bpl.w loc_0a573c
	addq.b #2,(5,a6)
	move.l #$fffc0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$78000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$14,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a54e2:
	bsr.w loc_0a5764

loc_0a54e6:
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$50,d0
	cmpi.w #$220,d0
	bhi.w loc_0a56a0
	jsr loc_01b692
	jmp loc_01b4ec

;==============================================
loc_0a550c:
	move.b (4,a6),d0
	move.w loc_0a5518(pc,d0.w),d1
	jmp loc_0a5518(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5518:
	dc.w loc_0a5520-loc_0a5518
	dc.w loc_0a553e-loc_0a5518
	dc.w loc_0a5696-loc_0a5518
	dc.w loc_0a569a-loc_0a5518

;----------------------------------------------
loc_0a5520:
	moveq #$d,d0
	bsr.w loc_0a56a6
	moveq #$30,d1
	bsr.w loc_0a571a
	moveq #0,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;----------------------------------------------
loc_0a553e:
	move.b (5,a6),d0
	move.w loc_0a554a(pc,d0.w),d1
	jmp loc_0a554a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a554a:
	dc.w loc_0a5550-loc_0a554a
	dc.w loc_0a5576-loc_0a554a
	dc.w loc_0a54e2-loc_0a554a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5550:
	cmpi.w #4,($c,a5)
	bcs.w loc_0a573c
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$a,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5576:
	tst.b ($33,a6)
	bpl.w loc_0a573c
	addq.b #2,(5,a6)
	moveq #0,d0
	move.l #$40000,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #2,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;==============================================s
loc_0a55aa:
	move.b (4,a6),d0
	move.w loc_0a55b6(pc,d0.w),d1
	jmp loc_0a55b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a55b6:
	dc.w loc_0a55be-loc_0a55b6
	dc.w loc_0a5604-loc_0a55b6
	dc.w loc_0a5696-loc_0a55b6
	dc.w loc_0a569a-loc_0a55b6

;----------------------------------------------
loc_0a55be:
	moveq #$a,d0
	bsr.w loc_0a56a6
	movea.w ($36,a6),a4
	moveq #$30,d0
	tst.b ($b,a4)
	beq.b loc_0a55d2
	neg.w d0
 
loc_0a55d2:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($64,a6),($14,a6)
	addi.w #$20,($14,a6)
	move.w #$1e,($3a,a6)
	move.w ($10,a6),($40,a6)
	moveq #$22,d0
	movea.l ($70,a6),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;----------------------------------------------
loc_0a5604:
	move.b (5,a6),d0
	move.w loc_0a5610(pc,d0.w),d1
	jmp loc_0a5610(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5610:
	dc.w loc_0a5614-loc_0a5610
	dc.w loc_0a5682-loc_0a5610

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0a5614:
	move.w ($3a,a6),d0
	move.w loc_0a5662(pc,d0.w),d1
	add.w ($40,a6),d1
	move.w d1,($10,a6)
	subq.w #2,d0
	move.w d0,($3a,a6)
	bne.b loc_0a5656
	addq.b #2,(5,a6)
	move.l #0,($40,a6)
	move.l #0,($48,a6)
	move.l #$ffff8000,($44,a6)
	move.l #$400,($4c,a6)
	move.b #$40,($3a,a6)

loc_0a5656:
	jsr loc_01b692
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5662:
	dc.w $0000,$0002
	dc.w $fffc,$0006
	dc.w $fff8,$000a
	dc.w $fff4,$000e
	dc.w $fff0,$0012
	dc.w $ffec,$0016
	dc.w $ffe8,$001a
	dc.w $ffe4,$001e

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0a5682:
	bsr.w loc_0a5764
	bsr.w loc_0a5778
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0a5696:
	addq.b #2,(4,a6)

loc_0a569a:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a56a0:
	addq.b #2,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a56a6:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.w #$e000,($18,a6)
	move.b ($e,a4),($e,a6)
	move.b #1,($30,a6)
	move.w ($64,a4),($64,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	addq.b #1,($d,a6)
	move.w d0,d1
	move.w d0,d2
	jsr loc_02fc88
	movea.l #CharAniPNTtable,a0
	lsl.w #2,d1
	movea.l (a0,d1.w),a0
	move.l (a0)+,($70,a6)
	move.l (a0)+,($74,a6)
	move.l (a0)+,($78,a6)
	move.l (a0)+,($7c,a6)
	jsr loc_01c368
	beq.b loc_0a5718
	move.l #$1002206,(a4)
	move.b d2,($3c,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)

loc_0a5718:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a571a:
	jsr loc_01bd5c
	tst.b ($b,a6)
	bne.b loc_0a572c
	neg.w d1
	addi.w #$180,d1

loc_0a572c:
	add.w ($10,a3),d1
	move.w d1,($10,a6)
	move.w ($64,a6),($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a573c:
	jsr loc_01b692
	jmp loc_01b4ec

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5748:
	move.l ($40,a6),d0
	btst #0,($b,a6)
	bne.b loc_0a5756
	neg.l d0

loc_0a5756:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5764:
	bsr.b loc_0a5748
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5778:
	subq.b #1,($3a,a6)
	bne.b loc_0a5788
	neg.l ($4c,a6)
	move.b #$40,($3a,a6)

loc_0a5788:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a578a:
	cmpi.w #$1e,(stageid,a5)
	bne.w loc_0a57f4
	tst.w ($138,a5)
	bne.w loc_0a57f4
	moveq #0,d6
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	cmpi.b #$f,($102,a1)
	bne.b loc_0a57b2
	ori.b #1,d6

loc_0a57b2:
	cmpi.b #$f,($102,a2)
	bne.b loc_0a57be
	ori.b #2,d6

loc_0a57be:
	tst.b d6
	beq.b loc_0a57f4
	cmpi.b #3,d6
	bne.b loc_0a57d2
	tst.b ($130,a2)
	beq.b loc_0a57da
	lea.l (a2),a1
	bra.b loc_0a57da

loc_0a57d2:
	cmpi.b #1,d6
	beq.b loc_0a57da
	lea.l (a2),a1

loc_0a57da:
	jsr loc_01c2c8
	beq.b loc_0a57f4
	addq.b #1,(a4)
	move.b #$46,(2,a4)
	move.w a1,($36,a4)
	move.b ($101,a1),($5a,a4)

loc_0a57f4:
	rts

;##############################################
loc_0a57f6:
	move.b (4,a6),d0
	move.w loc_0a5802(pc,d0.w),d1
	jmp loc_0a5802(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5802:
	dc.w loc_0a580a-loc_0a5802
	dc.w loc_0a587a-loc_0a5802
	dc.w loc_0a5a90-loc_0a5802
	dc.w loc_0a5a96-loc_0a5802

;==============================================
loc_0a580a:
	movea.w ($36,a6),a4
	tst.b (1,a4)
	bne.b loc_0a5816
	rts

loc_0a5816:
	addq.b #2,(4,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b #6,(9,a6)
	move.l ($18,a4),($18,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addq.w #6,($14,a6)
	move.w #$30,d0
	tst.b ($b,a4)
	bne.b loc_0a584e
	neg.w d0

loc_0a584e:
	add.w d0,($10,a6)
	move.b ($102,a4),(3,a6)
	move.b #1,($f,a6)
	move.b #1,($3a,a6)
	clr.b ($b,a6)
	clr.b ($3c,a6)
	jsr loc_0a51b6
	moveq #0,d0
	bsr.w loc_0a5a9c
	moveq #0,d0

loc_0a587a:
	tst.b ($12a,a5)
	bne.b loc_0a58aa
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0a58aa
	tst.b ($125,a5)
	bne.b loc_0a58a4
	movea.w ($36,a6),a4
	move.b (5,a6),d0
	move.w loc_0a58b2(pc,d0.w),d1
	jsr loc_0a58b2(pc,d1.w)

loc_0a58a4:
	jmp loc_01b4d0

loc_0a58aa:
	move.b #4,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a58b2:
	dc.w loc_0a58ba-loc_0a58b2
	dc.w loc_0a58fc-loc_0a58b2
	dc.w loc_0a5954-loc_0a58b2
	dc.w loc_0a59ac-loc_0a58b2

;----------------------------------------------
loc_0a58ba:
	move.b (6,a6),d0
	move.w loc_0a58c6(pc,d0.w),d1
	jmp loc_0a58c6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a58c6:
	dc.w loc_0a58ca-loc_0a58c6
	dc.w loc_0a58d2-loc_0a58c6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a58ca:
	addq.b #2,(6,a6)
	bra.w loc_0a59ee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a58d2:
	bsr.w loc_0a5a76
	bne.w loc_0a5a7e
	bsr.w loc_0a5a5a
	bne.w loc_0a5a6a
	bsr.w loc_0a5a10
	bne.w loc_0a5a26
	bsr.w loc_0a5a32
	bne.w loc_0a5a4e
	bsr.w loc_0a59ee
	jmp loc_01b6b6

;----------------------------------------------
loc_0a58fc:
	move.b (6,a6),d0
	move.w loc_0a5908(pc,d0.w),d1
	jmp loc_0a5908(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5908:
	dc.w loc_0a590c-loc_0a5908
	dc.w loc_0a5926-loc_0a5908

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a590c:
	subq.b #1,($3a,a6)
	bpl.b loc_0a5920
	addq.b #2,(6,a6)
	clr.b ($b,a6)
	moveq #2,d0
	bra.w loc_0a5a9c

loc_0a5920:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5926:
	tst.b ($33,a6)
	bmi.w loc_0a59e2
	bsr.w loc_0a5a76
	bne.w loc_0a5a7e
	bsr.w loc_0a5a10
	bne.w loc_0a594e
	bsr.w loc_0a5a5a
	bne.w loc_0a594e
	bsr.w loc_0a5a32
	bne.w loc_0a5a4e

loc_0a594e:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a5954:
	move.b (6,a6),d0
	move.w loc_0a5960(pc,d0.w),d1
	jmp loc_0a5960(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5960:
	dc.w loc_0a5964-loc_0a5960
	dc.w loc_0a597e-loc_0a5960

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a5964:
	subq.b #1,($3a,a6)
	bpl.b loc_0a5978
	addq.b #2,(6,a6)
	clr.b ($b,a6)
	moveq #3,d0
	bra.w loc_0a5a9c

loc_0a5978:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a597e:
	tst.b ($33,a6)
	bmi.w loc_0a59e2
	bsr.w loc_0a5a76
	bne.w loc_0a5a7e
	bsr.w loc_0a5a32
	bne.w loc_0a59a6
	bsr.w loc_0a5a5a
	bne.w loc_0a59a6
	bsr.w loc_0a5a10
	bne.w loc_0a5a26

loc_0a59a6:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a59ac:
	move.b (6,a6),d0
	move.w loc_0a59b8(pc,d0.w),d1
	jmp loc_0a59b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a59b8:
	dc.w loc_0a59bc-loc_0a59b8
	dc.w loc_0a59dc-loc_0a59b8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a59bc:
	tst.b ($11c,a5)
	bne.b loc_0a59dc
	addq.b #2,(6,a6)
	moveq #5,d0
	cmpa.w ($13a,a5),a4
	bne.b loc_0a59d8
	moveq #$1f,d0
	jsr loc_00390e
	moveq #4,d0

loc_0a59d8:
	bra.w loc_0a5a9c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a59dc:
	jmp loc_01b6b6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a59e2:
	move.l #$2000000,(4,a6)
	bra.w loc_0a5aa8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a59ee:
	moveq #0,d0
	move.w ($10,a4),d1
	cmp.w ($10,a6),d1
	bcc.b loc_0a59fc
	addq.b #1,d0

loc_0a59fc:
	cmp.b ($3c,a6),d0
	beq.b loc_0a5a0e
	move.b d0,($3c,a6)
	addi.b #0,d0
	bra.w loc_0a5a9c

loc_0a5a0e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a10:
	movea.w ($38,a4),a0
	cmpi.w #$202,(4,a0)
	beq.b loc_0a5a88
	cmpi.w #$206,(4,a0)
	beq.b loc_0a5a88
	bra.b loc_0a5a8c

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a26:
	move.l #$2020000,(4,a6)
	bra.w loc_0a5aa8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a32:
	cmpi.w #$202,(4,a4)
	bne.b loc_0a5a44
	cmpi.b #$ff,($55,a4)
	bne.b loc_0a5a88
	bra.b loc_0a5a4c

loc_0a5a44:
	cmpi.w #$206,(4,a4)
	beq.b loc_0a5a88

loc_0a5a4c:
	bra.b loc_0a5a8c

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a4e:
	move.l #$2040000,(4,a6)
	bra.w loc_0a5aa8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a5a:
	bsr.b loc_0a5a10
	beq.w loc_0a5a8c
	bsr.b loc_0a5a32
	beq.w loc_0a5a8c
	bra.w loc_0a5a88

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a6a:
	move.l #$2020000,(4,a6)
	bra.w loc_0a5aa8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a76:
	tst.b ($107,a5)
	beq.b loc_0a5a8c
	bra.b loc_0a5a88

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a7e:
	move.l #$2060000,(4,a6)
	rts

loc_0a5a88:
	moveq #1,d0
	rts

loc_0a5a8c:
	moveq #0,d0
	rts

;==============================================
loc_0a5a90:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0a5a96:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5a9c:
	movea.l #loc_212ef6,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5aa8:
	jsr RNGFunction
	andi.b #$3c,d0
	move.b d0,($3a,a6)
	rts

;##############################################
loc_0a5ab8:
	move.b (4,a6),d0
	move.w loc_0a5ac4(pc,d0.w),d1
	jmp loc_0a5ac4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5ac4:
	dc.w loc_0a5acc-loc_0a5ac4
	dc.w loc_0a5b30-loc_0a5ac4
	dc.w loc_0a5bbe-loc_0a5ac4
	dc.w loc_0a5bbe-loc_0a5ac4

;==============================================
loc_0a5acc:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a5adc
	rts

loc_0a5adc:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a5af0(pc,d0.w),d1
	jmp loc_0a5af0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5af0:
	dc.w loc_0a5af6-loc_0a5af0
	dc.w loc_0a5b04-loc_0a5af0
	dc.w loc_0a5b14-loc_0a5af0

;----------------------------------------------
loc_0a5af6:
	moveq #0,d0
	move.b ($70,a6),d0
	lea.l loc_0a5d0a(pc),a0
	bra.w loc_0a5bf6

;----------------------------------------------
loc_0a5b04:
	tst.b ($7f,a6)
	beq.w loc_0a5b14
	tst.b ($bb,a5)
	bne.w loc_0a5bc4

loc_0a5b14:
	moveq #0,d0
	move.w d0,($3a,a6)
	move.b d0,($31,a6)
	move.b ($70,a6),d0
	lea.l loc_081522,a0
	lea.l ($50,a6),a4
	bra.w loc_0a5cc8

;==============================================
loc_0a5b30:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a5bc4
	tst.b ($182,a5)
	beq.w loc_0a5b48
	rts

loc_0a5b48:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a5b58(pc,d0.w),d1
	jmp loc_0a5b58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5b58:
	dc.w loc_0a5b5e-loc_0a5b58
	dc.w loc_0a5b62-loc_0a5b58
	dc.w loc_0a5b6a-loc_0a5b58

;----------------------------------------------
loc_0a5b5e:
	bra.w loc_0a5bcc

;----------------------------------------------
loc_0a5b62:
	lea.l ($50,a6),a4
	bra.w loc_0a5ce2

;----------------------------------------------
loc_0a5b6a:
	tst.b ($31,a6)
	bne.w loc_0a5ba8
	subq.b #1,($3b,a6)
	bpl.b loc_0a5ba8
	moveq #0,d0
	move.b ($3a,a6),d0
	move.b loc_0a5bb0(pc,d0.w),($3b,a6)
	move.b loc_0a5bb0+1(pc,d0.w),d1
	bpl.b loc_0a5b92
	st.b ($31,a6)
	bra.w loc_0a5ba8

loc_0a5b92:
	addq.b #2,($3a,a6)
	jsr loc_01c2c8
	beq.b loc_0a5ba8
	move.l #$1000600,(a4)
	move.b d1,(3,a4)

loc_0a5ba8:
	lea.l ($50,a6),a4
	bra.w loc_0a5ce2


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5bb0:
	dc.b $04,$0e
	dc.b $02,$0b
	dc.b $04,$10
	dc.b $03,$0d
	dc.b $04,$0f
	dc.b $05,$0c
	dc.b $ff,$ff

;==============================================
loc_0a5bbe:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5bc4:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5bcc:
	subq.b #1,($32,a6)
	bne.b loc_0a5bf4
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_0a5be4
	bmi.b loc_0a5bea
	btst #6,d0
	bne.b loc_0a5bf0

loc_0a5be4:
	lea.l (8,a0),a0
	bra.b loc_0a5c04

loc_0a5bea:
	movea.l (8,a0),a0
	bra.b loc_0a5c04

loc_0a5bf0:
	st.b ($33,a6)

loc_0a5bf4:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5bf6:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_0a5c04:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	moveq #0,d5
	move.b ($7e,a6),d5
	lsl.w #5,d5

loc_0a5c14:
	movea.l (4,a0),a2
	moveq #0,d0
	moveq #0,d1
	move.w (palrampointer,a5),d1
	cmpi.w #$9220,d1
	beq.w loc_0a5c8e
	cmpi.w #$9240,d1
	beq.w loc_0a5c8e
	cmpi.w #$9280,d1
	beq.w loc_0a5c8e
	cmpi.w #$92a0,d1
	beq.w loc_0a5c8e
	lsl.l #8,d1
	movea.l d1,a3
	move.w (stageid,a5),d3

loc_0a5c48:
	move.w (a2)+,d0
	cmpi.w #$400,d0
	bcc.b loc_0a5c52
	add.w d5,d0

loc_0a5c52:
	lea.l (a3,d0.w),a1
	move.w (a1),d1
	andi.w #$f000,d1
	move.w (a2)+,d0
	movea.l loc_0a5c90(pc,d0.w),a0
	cmpi.w #$10,d0
	bcc.b loc_0a5c70
	move.w (a0,d3.w),d0
	lea.l (a0,d0.w),a0

loc_0a5c70:
	move.w (a2)+,d0
	move.w d0,d6
	andi.l #$ffe0,d0
	adda.l d0,a0
	moveq #$f,d2

loc_0a5c7e:
	move.w (a0)+,d0
	or.w d1,d0
	move.w d0,(a1)+
	dbra d2,loc_0a5c7e
	btst #0,d6
	beq.b loc_0a5c48

loc_0a5c8e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5c90:
	dc.l loc_34c514,loc_361354,loc_362a14,loc_363ef4
	dc.l loc_35fdb4,loc_364d14,loc_3606b4,loc_3629f4
	dc.l loc_363ed4,loc_366e94,loc_35bb94,loc_362854
	dc.l loc_363574,loc_364894

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5cc8:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_0a5cd6:
	move.l a0,(4,a4)
	move.l (a0),(a4)
	moveq #0,d5
	bra.w loc_0a5c14

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a5ce2:
	subq.b #1,(a4)
	bne.b loc_0a5d08
	movea.l (4,a4),a0
	move.b (1,a0),d0
	beq.b loc_0a5cf8
	bmi.b loc_0a5cfe
	btst #6,d0
	bne.b loc_0a5d04

loc_0a5cf8:
	lea.l (8,a0),a0
	bra.b loc_0a5cd6

loc_0a5cfe:
	movea.l (8,a0),a0
	bra.b loc_0a5cd6

loc_0a5d04:
	st.b (1,a4)

loc_0a5d08:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5d0a:
	dc.w loc_0a5d14-loc_0a5d0a
	dc.w loc_0a5db8-loc_0a5d0a
	dc.w loc_0a5e9c-loc_0a5d0a
	dc.w loc_0a5eb8-loc_0a5d0a
	dc.w loc_0a5ef4-loc_0a5d0a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5d14:
	dc.w $0400,$0000
	dc.l loc_0a5f18

	dc.w $0400,$0000
	dc.l loc_0a5f1e

	dc.w $0400,$0000
	dc.l loc_0a5f24

	dc.w $0400,$0000
	dc.l loc_0a5f2a

	dc.w $0400,$0000
	dc.l loc_0a5f30

	dc.w $0400,$0000
	dc.l loc_0a5f36

	dc.w $0400,$0000
	dc.l loc_0a5f3c

	dc.w $0400,$0000
	dc.l loc_0a5f42

	dc.w $0400,$0000
	dc.l loc_0a5f48

	dc.w $0400,$0000
	dc.l loc_0a5f4e

	dc.w $0400,$0000
	dc.l loc_0a5f54

	dc.w $0400,$0000
	dc.l loc_0a5f5a

	dc.w $0400,$0000
	dc.l loc_0a5f60

	dc.w $0400,$0000
	dc.l loc_0a5f66

	dc.w $0400,$0000
	dc.l loc_0a5f6c

	dc.w $0400,$0000
	dc.l loc_0a5f72

	dc.w $0400,$0000
	dc.l loc_0a5f78

	dc.w $0400,$0000
	dc.l loc_0a5f7e

	dc.w $0400,$0000
	dc.l loc_0a5f84

	dc.w $0480,$0000
	dc.l loc_0a5f8a

	dc.l loc_0a5d14

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5db8:
	dc.w $0400,$0000
	dc.l loc_0a5f90

	dc.w $0400,$0000
	dc.l loc_0a5fa8

	dc.w $0400,$0000
	dc.l loc_0a5fc0

	dc.w $0400,$0000
	dc.l loc_0a5fd8

	dc.w $0400,$0000
	dc.l loc_0a5ff0

	dc.w $0400,$0000
	dc.l loc_0a6008

	dc.w $0400,$0000
	dc.l loc_0a6020

	dc.w $0400,$0000
	dc.l loc_0a6038

	dc.w $0400,$0000
	dc.l loc_0a6050

	dc.w $0400,$0000
	dc.l loc_0a6068

	dc.w $0400,$0000
	dc.l loc_0a6080

	dc.w $0400,$0000
	dc.l loc_0a6098

	dc.w $0400,$0000
	dc.l loc_0a60b0

	dc.w $0400,$0000
	dc.l loc_0a60c8

	dc.w $0400,$0000
	dc.l loc_0a60e0

	dc.w $0400,$0000
	dc.l loc_0a60f8

	dc.w $0400,$0000
	dc.l loc_0a6110

	dc.w $0400,$0000
	dc.l loc_0a6128

	dc.w $0400,$0000
	dc.l loc_0a6140

	dc.w $0400,$0000
	dc.l loc_0a6158

	dc.w $0400,$0000
	dc.l loc_0a6170

	dc.w $0400,$0000
	dc.l loc_0a6188

	dc.w $0400,$0000
	dc.l loc_0a61a0

	dc.w $0400,$0000
	dc.l loc_0a61b8

	dc.w $0400,$0000
	dc.l loc_0a61d0

	dc.w $0400,$0000
	dc.l loc_0a61e8

	dc.w $0400,$0000
	dc.l loc_0a6200

	dc.w $0480,$0000
	dc.l loc_0a6218

	dc.l loc_0a5db8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5e9c:
	dc.w $0400,$0000
	dc.l loc_0a6230

	dc.w $0400,$0000
	dc.l loc_0a6236

	dc.w $0480,$0000
	dc.l loc_0a623c
	dc.l loc_0a5e9c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5eb8:
	dc.w $0400,$0000
	dc.l loc_0a6242
	dc.w $0400,$0000
	dc.l loc_0a6248
	dc.w $0400,$0000
	dc.l loc_0a624e
	dc.w $0400,$0000
	dc.l loc_0a6254
	dc.w $0400,$0000
	dc.l loc_0a625a
	dc.w $0800,$0000
	dc.l loc_0a6260

loc_0a5ee8:
	dc.w $0480,$0000
	dc.l loc_0a6266
	dc.l loc_0a5ee8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5ef4:
	dc.w $0300,$0000
	dc.l loc_0a626c
	dc.w $0300,$0000
	dc.l loc_0a6272
	dc.w $0300,$0000
	dc.l loc_0a6278
	dc.w $0380,$0000
	dc.l loc_0a627e
	dc.l loc_0a5ef4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5f18:
	dc.w $0c00,$0024,$0381

loc_0a5f1e:
	dc.w $0c00,$0024,$03a1

loc_0a5f24:
	dc.w $0c00,$0024,$03c1

loc_0a5f2a:
	dc.w $0c00,$0024,$03e1

loc_0a5f30:
	dc.w $0c00,$0024,$0401

loc_0a5f36:
	dc.w $0c00,$0024,$0421

loc_0a5f3c:
	dc.w $0c00,$0024,$0441

loc_0a5f42:
	dc.w $0c00,$0024,$0461

loc_0a5f48:
	dc.w $0c00,$0024,$0481

loc_0a5f4e:
	dc.w $0c00,$0024,$04a1

loc_0a5f54:
	dc.w $0c00,$0024,$04c1

loc_0a5f5a:
	dc.w $0c00,$0024,$04e1

loc_0a5f60:
	dc.w $0c00,$0024,$0501

loc_0a5f66:
	dc.w $0c00,$0024,$0521

loc_0a5f6c:
	dc.w $0c00,$0024,$0541

loc_0a5f72:
	dc.w $0c00,$0024,$0561

loc_0a5f78:
	dc.w $0c00,$0024,$0581

loc_0a5f7e:
	dc.w $0c00,$0024,$05a1

loc_0a5f84:
	dc.w $0c00,$0024,$05c1

loc_0a5f8a:
	dc.w $0c00,$0024,$05e1


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a5f90:
	dc.w $0000,$0018,$04c0,$0020
	dc.w $0018,$0840,$0040,$0018
	dc.w $0140,$0fe0,$0024,$0001

loc_0a5fa8:
	dc.w $0000,$0018,$04e0,$0020
	dc.w $0018,$0860,$0040,$0018
	dc.w $0160,$0fe0,$0024,$0021

loc_0a5fc0:
	dc.w $0000,$0018,$0500,$0020
	dc.w $0018,$0880,$0040,$0018
	dc.w $0180,$0fe0,$0024,$0041

loc_0a5fd8:
	dc.w $0000,$0018,$0520,$0020
	dc.w $0018,$08a0,$0040,$0018
	dc.w $01a0,$0fe0,$0024,$0061

loc_0a5ff0:
	dc.w $0000,$0018,$0540,$0020
	dc.w $0018,$08c0,$0040,$0018
	dc.w $01c0,$0fe0,$0024,$0081

loc_0a6008:
	dc.w $0000,$0018,$0560,$0020
	dc.w $0018,$08e0,$0040,$0018
	dc.w $01e0,$0fe0,$0024,$00a1

loc_0a6020:
	dc.w $0000,$0018,$0580,$0020
	dc.w $0018,$0900,$0040,$0018
	dc.w $0200,$0fe0,$0024,$00c1

loc_0a6038:
	dc.w $0000,$0018,$05a0,$0020
	dc.w $0018,$0920,$0040,$0018
	dc.w $0220,$0fe0,$0024,$00e1

loc_0a6050:
	dc.w $0000,$0018,$05c0,$0020
	dc.w $0018,$0940,$0040,$0018
	dc.w $0240,$0fe0,$0024,$0101

loc_0a6068:
	dc.w $0000,$0018,$05e0,$0020
	dc.w $0018,$0960,$0040,$0018
	dc.w $0260,$0fe0,$0024,$0121

loc_0a6080:
	dc.w $0000,$0018,$0600,$0020
	dc.w $0018,$0980,$0040,$0018
	dc.w $0280,$0fe0,$0024,$0141

loc_0a6098:
	dc.w $0000,$0018,$0620,$0020
	dc.w $0018,$09a0,$0040,$0018
	dc.w $02a0,$0fe0,$0024,$0161

loc_0a60b0:
	dc.w $0000,$0018,$0640,$0020
	dc.w $0018,$09c0,$0040,$0018
	dc.w $02c0,$0fe0,$0024,$0181

loc_0a60c8:
	dc.w $0000,$0018,$0660,$0020
	dc.w $0018,$09e0,$0040,$0018
	dc.w $02e0,$0fe0,$0024,$01a1

loc_0a60e0:
	dc.w $0000,$0018,$0680,$0020
	dc.w $0018,$0a00,$0040,$0018
	dc.w $0300,$0fe0,$0024,$01c1

loc_0a60f8:
	dc.w $0000,$0018,$06a0,$0020
	dc.w $0018,$0a20,$0040,$0018
	dc.w $0320,$0fe0,$0024,$01e1

loc_0a6110:
	dc.w $0000,$0018,$06c0,$0020
	dc.w $0018,$0a40,$0040,$0018
	dc.w $0340,$0fe0,$0024,$0201

loc_0a6128:
	dc.w $0000,$0018,$06e0,$0020
	dc.w $0018,$0a60,$0040,$0018
	dc.w $0360,$0fe0,$0024,$0221

loc_0a6140:
	dc.w $0000,$0018,$0700,$0020
	dc.w $0018,$0a80,$0040,$0018
	dc.w $0380,$0fe0,$0024,$0241

loc_0a6158:
	dc.w $0000,$0018,$0720,$0020
	dc.w $0018,$0aa0,$0040,$0018
	dc.w $03a0,$0fe0,$0024,$0261

loc_0a6170:
	dc.w $0000,$0018,$0740,$0020
	dc.w $0018,$0ac0,$0040,$0018
	dc.w $03c0,$0fe0,$0024,$0281

loc_0a6188:
	dc.w $0000,$0018,$0760,$0020
	dc.w $0018,$0ae0,$0040,$0018
	dc.w $03e0,$0fe0,$0024,$02a1

loc_0a61a0:
	dc.w $0000,$0018,$0780,$0020
	dc.w $0018,$0b00,$0040,$0018
	dc.w $0400,$0fe0,$0024,$02c1

loc_0a61b8:
	dc.w $0000,$0018,$07a0,$0020
	dc.w $0018,$0b20,$0040,$0018
	dc.w $0420,$0fe0,$0024,$02e1

loc_0a61d0:
	dc.w $0000,$0018,$07c0,$0020
	dc.w $0018,$0b40,$0040,$0018
	dc.w $0440,$0fe0,$0024,$0301

loc_0a61e8:
	dc.w $0000,$0018,$07e0,$0020
	dc.w $0018,$0b60,$0040,$0018
	dc.w $0460,$0fe0,$0024,$0321

loc_0a6200:
	dc.w $0000,$0018,$0800,$0020
	dc.w $0018,$0b80,$0040,$0018
	dc.w $0480,$0fe0,$0024,$0341

loc_0a6218:
	dc.w $0000,$0018,$0820,$0020
	dc.w $0018,$0ba0,$0040,$0018
	dc.w $04a0,$0fe0,$0024,$0361

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6230:
	dc.w $0000,$0018,$0c41

loc_0a6236:
	dc.w $0000,$0018,$0c61

loc_0a623c:
	dc.w $0000,$0018,$0c81

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6242:
	dc.w $0260,$0018,$0001

loc_0a6248:
	dc.w $0260,$0018,$0021

loc_0a624e:
	dc.w $0260,$0018,$0041

loc_0a6254:
	dc.w $0260,$0018,$0061

loc_0a625a:
	dc.w $0260,$0018,$0081

loc_0a6260:
	dc.w $0040,$0018,$00a1

loc_0a6266:
	dc.w $0040,$0018,$00c1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a626c:
	dc.w $0840,$002c,$0081

loc_0a6272:
	dc.w $0840,$002c,$00a1

loc_0a6278:
	dc.w $0840,$002c,$00c1

loc_0a627e:
	dc.w $0840,$002c,$00e1

;##############################################
loc_0a6284:
	move.b (4,a6),d0
	move.w loc_0a6290(pc,d0.w),d1
	jmp loc_0a6290(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6290:
	dc.w loc_0a6298-loc_0a6290
	dc.w loc_0a63f2-loc_0a6290
	dc.w loc_0a714a-loc_0a6290
	dc.w loc_0a714a-loc_0a6290

;==============================================
loc_0a6298:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a62a8
	rts

loc_0a62a8:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	bsr.w loc_0a7164
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a62d2(pc,d0.w),d1
	jsr loc_0a62d2(pc,d1.w)
	moveq #0,d0
	bra.w loc_0a63f2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a62d2:
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a632e-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a6328-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a632e-loc_0a62d2
	dc.w loc_0a632e-loc_0a62d2
	dc.w loc_0a6344-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a6346-loc_0a62d2
	dc.w loc_0a6346-loc_0a62d2
	dc.w loc_0a6384-loc_0a62d2

	dc.w loc_0a6396-loc_0a62d2
	dc.w loc_0a63a8-loc_0a62d2
	dc.w loc_0a63b0-loc_0a62d2
	dc.w loc_0a631a-loc_0a62d2

	dc.w loc_0a631a-loc_0a62d2
	dc.w loc_0a63c6-loc_0a62d2
	dc.w loc_0a63dc-loc_0a62d2
	dc.w loc_0a6344-loc_0a62d2

;----------------------------------------------
loc_0a631a:
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	bra.w loc_0a7158

;----------------------------------------------
loc_0a6328:
	clr.w ($3a,a6)
	rts

;----------------------------------------------
loc_0a632e:
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a6344:
	rts

;----------------------------------------------
loc_0a6346:
	clr.b ($3c,a6)
	move.b ($7b,a6),($60,a6)
	beq.b loc_0a6358
	ori.b #1,($3c,a6)

loc_0a6358:
	move.b ($7c,a6),($61,a6)
	beq.b loc_0a6366
	ori.b #2,($3c,a6)

loc_0a6366:
	move.b ($7d,a6),($62,a6)
	beq.b loc_0a6374
	ori.b #4,($3c,a6)

loc_0a6374:
	move.b ($7e,a6),($63,a6)
	beq.b loc_0a6382
	ori.b #8,($3c,a6)

loc_0a6382:
	rts

;----------------------------------------------
loc_0a6384:
	move.w #$6000,($1a,a6)
	movea.l #loc_0a7276,a0
	jmp loc_01b6ee

;----------------------------------------------
loc_0a6396:
	move.w #$6000,($1a,a6)
	movea.l #loc_0a72b4,a0
	jmp loc_01b6ee

;----------------------------------------------
loc_0a63a8:
	move.b #1,($3c,a6)
	rts

;----------------------------------------------
loc_0a63b0:
	move.b #8,($3b,a6)
	move.b #8,($3a,a6)
	tst.b ($bb,a5)
	bne.w loc_0a7150
	rts

;----------------------------------------------
loc_0a63c6:
	move.w #$6000,($1a,a6)
	movea.l #loc_2ed818,a0;Load Ken Stage Objects
	move.b ($70,a6),d0
	jmp loc_01b6e0

;----------------------------------------------
loc_0a63dc:
	move.w #$2000,($1a,a6)
	movea.l #loc_0987aa,a0
	move.b ($70,a6),d0
	jmp loc_01b6e0

;==============================================
loc_0a63f2:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a6400(pc,d0.w),d1
	jmp loc_0a6400(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6400:
	dc.w loc_0a6448-loc_0a6400
	dc.w loc_0a6462-loc_0a6400
	dc.w loc_0a650a-loc_0a6400
	dc.w loc_0a6532-loc_0a6400
	dc.w loc_0a6574-loc_0a6400
	dc.w loc_0a65ba-loc_0a6400
	dc.w loc_0a661a-loc_0a6400
	dc.w loc_0a6662-loc_0a6400
	dc.w loc_0a66b6-loc_0a6400
	dc.w loc_0a671a-loc_0a6400
	dc.w loc_0a6758-loc_0a6400
	dc.w loc_0a67ba-loc_0a6400
	dc.w loc_0a6818-loc_0a6400
	dc.w loc_0a68b2-loc_0a6400
	dc.w loc_0a690c-loc_0a6400
	dc.w loc_0a697a-loc_0a6400
	dc.w loc_0a6a3e-loc_0a6400
	dc.w loc_0a6af6-loc_0a6400
	dc.w loc_0a6b5a-loc_0a6400
	dc.w loc_0a6bc2-loc_0a6400
	dc.w loc_0a6bfc-loc_0a6400
	dc.w loc_0a6c82-loc_0a6400
	dc.w loc_0a6ca4-loc_0a6400
	dc.w loc_0a6cf6-loc_0a6400
	dc.w loc_0a6d32-loc_0a6400
	dc.w loc_0a6d82-loc_0a6400
	dc.w loc_0a6dbc-loc_0a6400
	dc.w loc_0a6448-loc_0a6400
	dc.w loc_0a6448-loc_0a6400
	dc.w loc_0a6ecc-loc_0a6400
	dc.w loc_0a6f36-loc_0a6400
	dc.w loc_0a6fe4-loc_0a6400
	dc.w loc_0a7072-loc_0a6400
	dc.w loc_0a70b2-loc_0a6400
	dc.w loc_0a70b2-loc_0a6400
	dc.w loc_0a70e4-loc_0a6400

;----------------------------------------------
loc_0a6448:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a6462:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6482(pc,d0.w),d1
	jsr loc_0a6482(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6482:
	dc.w loc_0a6488-loc_0a6482
	dc.w loc_0a649a-loc_0a6482
	dc.w loc_0a6508-loc_0a6482

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6488:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6498
	addq.b #2,(5,a6)

loc_0a6498:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a649a:
	jsr loc_01b0c4
	moveq #0,d2
	move.l ($40,a6),d0
	add.l ($48,a6),d0
	beq.b loc_0a64d0
	st.b d2
	move.w ($10,a6),d0
	move.w ($72,a6),d1
	tst.w ($40,a6)
	bpl.b loc_0a64be
	exg.l d0,d1

loc_0a64be:
	cmp.w d0,d1
	bgt.b loc_0a64d0
	move.w ($72,a6),($10,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_0a64d0:
	move.l ($44,a6),d0
	add.l ($4c,a6),d0
	beq.b loc_0a64fe
	st.b d2
	move.w ($14,a6),d0
	move.w ($74,a6),d1
	tst.w ($44,a6)
	bpl.b loc_0a64ec
	exg.l d0,d1

loc_0a64ec:
	cmp.w d0,d1
	bgt.b loc_0a64fe
	move.w ($74,a6),($14,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)

loc_0a64fe:
	tst.b d2
	bne.b loc_0a6506
	addq.b #2,(5,a6)

loc_0a6506:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6508:
	rts

;----------------------------------------------
loc_0a650a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bge.b loc_0a6530
	jsr loc_01b6b6
	jmp loc_01b4ec

loc_0a6530:
	rts

;----------------------------------------------
loc_0a6532:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6552(pc,d0.w),d1
	jsr loc_0a6552(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6552:
	dc.w loc_0a6556-loc_0a6552
	dc.w loc_0a656a-loc_0a6552

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6556:
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a656a:
	bsr.w loc_0a71cc
	jmp loc_01b6b6

;----------------------------------------------
loc_0a6574:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a659a(pc,d0.w),d1
	jsr loc_0a659a(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a659a:
	dc.w loc_0a659e-loc_0a659a
	dc.w loc_0a65b8-loc_0a659a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a659e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bge.w loc_0a65b8
	addq.b #2,(5,a6)
	move.w ($74,a6),d0
	add.w d0,($14,a6)

loc_0a65b8:
	rts

;----------------------------------------------
loc_0a65ba:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a65d4(pc,d0.w),d1
	jmp loc_0a65d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a65d4:
	dc.w loc_0a65d8-loc_0a65d4
	dc.w loc_0a6606-loc_0a65d4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a65d8:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	bge.w loc_0a6604
	addq.b #2,(5,a6)
	moveq #$e,d0
	jsr loc_02fc88
	moveq #0,d0
	move.b ($70,a6),d0
	movea.l #loc_2044b0,a0
	jmp loc_01b6e0

loc_0a6604:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6606:
	tst.b ($33,a6)
	bmi.w loc_0a7150
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a661a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	tst.b (5,a6)
	bne.b loc_0a6638
	addq.b #2,(5,a6)
	move.w #$20f,($3a,a6)

loc_0a6638:
	subq.b #1,($3b,a6)
	bpl.b loc_0a664e
	move.b #2,($3b,a6)
	subq.w #1,($2a,a5)
	andi.w #$ff,($2a,a5)

loc_0a664e:
	subq.b #1,($3a,a6)
	bpl.b loc_0a6660
	move.b #$f,($3a,a6)
	eori.w #1,($28,a5)

loc_0a6660:
	rts

;----------------------------------------------
loc_0a6662:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6682(pc,d0.w),d1
	jsr loc_0a6682(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6682:
	dc.w loc_0a6686-loc_0a6682
	dc.w loc_0a6692-loc_0a6682

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6686:
	addq.b #2,(5,a6)
	move.w #$100,($3a,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6692:
	jsr loc_01b0c4
	subq.w #1,($3a,a6)
	bpl.b loc_0a66b4
	move.w #$100,($3a,a6)
	move.l #$ffc00000,($10,a6)
	move.l #$800000,($14,a6)

loc_0a66b4:
	rts

;----------------------------------------------
loc_0a66b6:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	tst.b (5,a6)
	bne.b loc_0a66d2
	addq.b #2,(5,a6)
	clr.w ($3a,a6)

loc_0a66d2:
	subq.b #1,($3a,a6)
	bpl.b loc_0a6700
	move.b #3,($3a,a6)
	moveq #0,d0
	move.b ($3b,a6),d0
	addq.b #1,d0
	cmpi.b #6,d0
	bcs.b loc_0a66ee
	moveq #0,d0

loc_0a66ee:
	move.b d0,($3b,a6)
	lsl.w #2,d0
	move.w loc_0a6702(pc,d0.w),($26,a5)
	move.w loc_0a6702+2(pc,d0.w),($28,a5)

loc_0a6700:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6702:
	dc.w $0000,$0310
	dc.w $0000,$0290
	dc.w $0180,$0310
	dc.w $0170,$0290
	dc.w $0080,$0210
	dc.w $0080,$0190

;----------------------------------------------
loc_0a671a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	jsr loc_01b0c4
	cmpi.w #$1a0,($10,a6)
	blt.b loc_0a6740
	bra.w loc_0a7150
	move.w #$f0,($10,a6)

loc_0a6740:
	cmpi.w #$110,($14,a6)
	blt.b loc_0a6752
	bra.w loc_0a7150
	move.w #$58,($14,a6)

loc_0a6752:
	jmp loc_01b4ec

;----------------------------------------------
loc_0a6758:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	subq.b #1,($32,a6)
	bne.b loc_0a678e
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_0a677e
	bmi.b loc_0a6784
	btst #6,d0
	bne.b loc_0a678a

loc_0a677e:
	lea.l (8,a0),a0
	bra.b loc_0a6794

loc_0a6784:
	movea.l (8,a0),a0
	bra.b loc_0a6794

loc_0a678a:
	st.b ($33,a6)

loc_0a678e:
	jmp loc_01b4ec

loc_0a6794:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	tst.b ($35,a6)
	bne.b loc_0a67b8
	move.b ($3a,a6),d0
	move.b d0,($32,a6)
	subq.b #1,d0
	cmpi.b #2,d0
	bcc.b loc_0a67b4
	moveq #2,d0

loc_0a67b4:
	move.b d0,($3a,a6)

loc_0a67b8:
	rts

;----------------------------------------------
loc_0a67ba:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a67da(pc,d0.w),d1
	jsr loc_0a67da(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a67da:
	dc.w loc_0a67e0-loc_0a67da
	dc.w loc_0a67fe-loc_0a67da
	dc.w loc_0a6816-loc_0a67da

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a67e0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a67fc
	addq.b #2,(5,a6)
	move.b ($d,a6),($3a,a6)
	move.b ($7e,a6),($d,a6)

loc_0a67fc:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a67fe:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a67fc
	addq.b #2,(5,a6)
	move.b ($3a,a6),($d,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6816:
	rts

;----------------------------------------------
loc_0a6818:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6838(pc,d0.w),d1
	jsr loc_0a6838(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6838:
	dc.w loc_0a6840-loc_0a6838
	dc.w loc_0a6858-loc_0a6838
	dc.w loc_0a6878-loc_0a6838
	dc.w loc_0a68ac-loc_0a6838

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6840:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6856
	addq.b #2,(5,a6)
	move.b ($7e,a6),($3a,a6)

loc_0a6856:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6858:
	jsr loc_01b0c4
	subq.b #1,($3a,a6)
	bpl.b loc_0a6876
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)
	neg.l ($48,a6)
	neg.l ($4c,a6)

loc_0a6876:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6878:
	jsr loc_01b0c4
	bsr.w loc_0a7202
	bsr.w loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a68aa
	addq.b #2,(5,a6)
	move.l #$4000,($44,a6)
	move.l #$fffffe00,($4c,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a68aa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a68ac:
	bsr.w loc_0a71cc
	rts

;----------------------------------------------
loc_0a68b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a68d2(pc,d0.w),d1
	jsr loc_0a68d2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a68d2:
	dc.w loc_0a68d8-loc_0a68d2
	dc.w loc_0a68f0-loc_0a68d2
	dc.w loc_0a690a-loc_0a68d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a68d8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a68ee
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)

loc_0a68ee:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a68f0:
	jsr loc_01b0c4
	bsr.w loc_0a7202
	bsr.w loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a6908
	addq.b #2,(5,a6)

loc_0a6908:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a690a:
	rts

;----------------------------------------------
loc_0a690c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a692c(pc,d0.w),d1
	jsr loc_0a692c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a692c:
	dc.w loc_0a6932-loc_0a692c
	dc.w loc_0a6948-loc_0a692c
	dc.w loc_0a6974-loc_0a692c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6932:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6946
	addq.b #2,(5,a6)
	clr.b ($3c,a6)

loc_0a6946:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6948:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	btst #1,($3c,a6)
	beq.b loc_0a6972
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($48,a6),($4c,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a6972:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6974:
	jmp loc_0a71cc(pc)
	nop

;----------------------------------------------
loc_0a697a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a699a(pc,d0.w),d1
	jsr loc_0a699a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a699a:
	dc.w loc_0a69a4-loc_0a699a
	dc.w loc_0a69b6-loc_0a699a
	dc.w loc_0a69e0-loc_0a699a
	dc.w loc_0a6a04-loc_0a699a
	dc.w loc_0a6a24-loc_0a699a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a69a4:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a69b4
	addq.b #2,(5,a6)

loc_0a69b4:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a69b6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	sub.w ($10,a6),d0
	bpl.b loc_0a69ca
	neg.w d0

loc_0a69ca:
	cmpi.w #$30,d0
	bhi.b loc_0a69da
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a69da:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a69e0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bsr.w loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0a69fe
	addq.b #2,(5,a6)

loc_0a69fe:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6a04:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6a1e
	addq.b #2,(5,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0a6a1e:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6a24:
	jsr loc_01b0c4
	bsr.w loc_0a723c
	btst #1,($3c,a6)
	bne.w loc_0a7150
	jmp loc_01b6b6

;----------------------------------------------
loc_0a6a3e:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6a5e(pc,d0.w),d1
	jsr loc_0a6a5e(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6a5e:
	dc.w loc_0a6a68-loc_0a6a5e
	dc.w loc_0a6a7a-loc_0a6a5e
	dc.w loc_0a6aba-loc_0a6a5e
	dc.w loc_0a6acc-loc_0a6a5e
	dc.w loc_0a6ae4-loc_0a6a5e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6a68:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6a78
	addq.b #2,(5,a6)

loc_0a6a78:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6a7a:
	jsr loc_01b0c4
	cmpi.w #$ffc0,($14,a6)
	bgt.b loc_0a6ab8
	addq.b #2,(5,a6)
	move.w ($72,a6),($10,a6)
	move.w ($74,a6),($14,a6)
	move.l #$10000,($40,a6)
	move.l #$fffffe00,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$fffff800,($4c,a6)

loc_0a6ab8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6aba:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6aca
	addq.b #2,(5,a6)

loc_0a6aca:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6acc:
	jsr loc_01b0c4
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6ae2
	addq.b #2,(5,a6)

loc_0a6ae2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6ae4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	rts

;----------------------------------------------
loc_0a6af6:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6b16(pc,d0.w),d1
	jsr loc_0a6b16(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6b16:
	dc.w loc_0a6b1c-loc_0a6b16
	dc.w loc_0a6b38-loc_0a6b16
	dc.w loc_0a6b54-loc_0a6b16

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6b1c:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6b32
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)

loc_0a6b32:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6b38:
	jsr loc_01b0c4
	jsr loc_0a7202(pc)
	nop
	jsr loc_0a723c(pc)
	nop
	tst.b ($3c,a6)
	bne.b loc_0a6b54
	addq.b #2,(5,a6)

loc_0a6b54:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a6b5a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6b7a(pc,d0.w),d1
	jsr loc_0a6b7a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6b7a:
	dc.w loc_0a6b80-loc_0a6b7a
	dc.w loc_0a6b98-loc_0a6b7a
	dc.w loc_0a6bbc-loc_0a6b7a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6b80:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6b96
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a6b96:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6b98:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202(pc)
	nop
	tst.b ($3c,a6)
	bne.b loc_0a6bba
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a6bba:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6bbc:
	jmp loc_0a71cc(pc)
	nop

;----------------------------------------------
loc_0a6bc2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	addq.b #1,($3a,a6)
	moveq #0,d0
	moveq #0,d1
	move.b ($7d,a6),d0
	ext.w d0
	move.b ($7e,a6),d1
	ext.w d1
	move.b ($3a,a6),d2
	andi.b #1,d2
	bne.b loc_0a6bf2
	neg.w d0
	neg.w d1

loc_0a6bf2:
	add.w d0,($28,a5)
	add.w d1,($2c,a5)
	rts

;----------------------------------------------
loc_0a6bfc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6c1c(pc,d0.w),d1
	jsr loc_0a6c1c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6c1c:
	dc.w loc_0a6c24-loc_0a6c1c
	dc.w loc_0a6c36-loc_0a6c1c
	dc.w loc_0a6c4e-loc_0a6c1c
	dc.w loc_0a6c80-loc_0a6c1c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6c24:
	addq.b #2,(5,a6)
	movea.l #loc_2f2de8,a0
	moveq #$f,d0
	jmp loc_01b6e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6c36:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6c4c
	addq.b #2,(5,a6)
	andi.w #$f000,($72,a6)

loc_0a6c4c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6c4e:
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a1
	move.w #$f000,d0
	lea.l (a1),a1
	moveq #0,d1
	move.b ($d,a6),d1
	lsl.w #5,d1
	lea.l (a1,d1.w),a1
	move.w (a1),d1
	andi.w #$f000,d1
	cmp.w ($72,a6),d1
	beq.b loc_0a6c7c
	moveq #0,d6
	bra.w loc_0a6ea4

loc_0a6c7c:
	addq.b #2,(5,a6)

loc_0a6c80:
	rts

;----------------------------------------------
loc_0a6c82:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	tst.b ($33,a6)
	bmi.w loc_0a7150
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_0a6ca4:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6cc4(pc,d0.w),d1
	jsr loc_0a6cc4(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6cc4:
	dc.w loc_0a6cca-loc_0a6cc4
	dc.w loc_0a6cd4-loc_0a6cc4
	dc.w loc_0a6cf0-loc_0a6cc4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6cca:
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)

loc_0a6cd4:
	jsr loc_01b0c4
	jsr loc_0a7202(pc)
	nop
	jsr loc_0a723c(pc)
	nop
	tst.b ($3c,a6)
	bne.b loc_0a6cf0
	addq.b #2,(5,a6)

loc_0a6cf0:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a6cf6:
	moveq #0,d0
	move.b ($70,a6),d0
	moveq #8,d1
	moveq #0,d2
	move.w (palrampointer,a5),d2
	lsl.l #8,d2
	movea.l d2,a0
	movea.l a0,a1
	lea.l (a0),a0
	bsr.w loc_0a7120
	movea.l a1,a0
	lea.l ($400,a0),a0
	bsr.w loc_0a7124
	movea.l a1,a0
	lea.l ($800,a0),a0
	bsr.w loc_0a7124
	movea.l a1,a0
	lea.l ($c00,a0),a0
	bsr.w loc_0a7124
	bra.w loc_0a7150

;----------------------------------------------
loc_0a6d32:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6d52(pc,d0.w),d1
	jsr loc_0a6d52(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6d52:
	dc.w loc_0a6d56-loc_0a6d52
	dc.w loc_0a6d78-loc_0a6d52

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6d56:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6d72
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	bra.b loc_0a6d78

loc_0a6d72:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6d78:
	bsr.w loc_0a71cc
	jmp loc_01b6b6

;----------------------------------------------
loc_0a6d82:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	move.w #$f000,d0
	move.w #0,d1
	bsr.w loc_0a6df6
	bsr.w loc_0a6e1c
	bsr.w loc_0a6e44
	bsr.w loc_0a6e6c
	tst.b ($3c,a6)
	beq.w loc_0a7150
	rts

;----------------------------------------------
loc_0a6dbc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	move.w #$1000,d0
	move.w #$f000,d1
	bsr.w loc_0a6df6
	bsr.w loc_0a6e1c
	bsr.w loc_0a6e44
	bsr.w loc_0a6e6c
	tst.b ($3c,a6)
	beq.w loc_0a7150
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a6df6:
	btst #0,($3c,a6)
	beq.b loc_0a6e1a
	subq.b #1,($60,a6)
	bgt.b loc_0a6e1a
	move.b ($7b,a6),($60,a6)
	movea.l a0,a1
	lea.l (a1),a1
	bsr.w loc_0a6e94
	bne.b loc_0a6e1a
	andi.b #$e,($3c,a6)

loc_0a6e1a:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0a6e1c:
	btst #1,($3c,a6)
	beq.b loc_0a6e42
	subq.b #1,($61,a6)
	bgt.b loc_0a6e42
	move.b ($7c,a6),($61,a6)
	movea.l a0,a1
	lea.l ($400,a1),a1
	bsr.w loc_0a6e98
	bne.b loc_0a6e42
	andi.b #$d,($3c,a6)

loc_0a6e42:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0a6e44:
	btst #2,($3c,a6)
	beq.b loc_0a6e6a
	subq.b #1,($62,a6)
	bgt.b loc_0a6e6a
	move.b ($7d,a6),($62,a6)
	movea.l a0,a1
	lea.l ($800,a1),a1
	bsr.w loc_0a6e98
	bne.b loc_0a6e6a
	andi.b #$b,($3c,a6)

loc_0a6e6a:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0a6e6c:
	btst #3,($3c,a6)
	beq.b loc_0a6e92
	subq.b #1,($63,a6)
	bgt.b loc_0a6e92
	move.b ($7e,a6),($63,a6)
	movea.l a0,a1
	lea.l ($c00,a1),a1
	bsr.w loc_0a6e98
	bne.b loc_0a6e92
	andi.b #7,($3c,a6)

loc_0a6e92:
	rts

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0a6e94:
	moveq #$1b,d6
	bra.b loc_0a6e9a

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
loc_0a6e98:
	moveq #$1f,d6

loc_0a6e9a:
	move.w (a1),d2
	andi.w #$f000,d2
	cmp.w d1,d2
	beq.b loc_0a6eca

loc_0a6ea4:
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	add.w d0,(a1)+
	dbra d6,loc_0a6ea4
	moveq #1,d2

loc_0a6eca:
	rts

;----------------------------------------------
loc_0a6ecc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a6ee6(pc,d0.w),d1
	jmp loc_0a6ee6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a6ee6:
	dc.w loc_0a6eec-loc_0a6ee6
	dc.w loc_0a6f0a-loc_0a6ee6
	dc.w loc_0a6f28-loc_0a6ee6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6eec:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a6efc
	addq.b #2,(5,a6)

loc_0a6efc:
	move.w ($2a0,a5),($290,a5)
	move.w ($2a4,a5),($294,a5)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a6f0a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	swap d0
	add.w d0,($2a0,a5)
	jsr loc_0a7202(pc)
	nop
	tst.b ($3c,a6)
	bne.b loc_0a6f28
	addq.b #2,(5,a6)

loc_0a6f28:
	move.w ($2a0,a5),($290,a5)
	move.w ($2a4,a5),($294,a5)
	rts

;----------------------------------------------
loc_0a6f36:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	subq.b #1,($3a,a6)
	bpl.w loc_0a6fe2
	move.b ($3b,a6),($3a,a6)
	jsr RNGFunction
	andi.w #$7f,d0
	addi.w #$60,d0
	move.w d0,d2
	jsr RNGFunction
	andi.w #3,d0
	addi.b #8,d0
	movea.l #loc_05dbb4,a0
	add.w d0,d0
	add.w d0,d0
	move.w (a0,d0.w),d3
	move.w (2,a0,d0.w),d4
	asr.w #2,d3
	asr.w #2,d4
	jsr RNGFunction
	andi.w #3,d0
	addi.w #$1c,d0
	jsr loc_01c2c8
	beq.b loc_0a6fe2
	move.w #$100,(a4)
	move.w #$4909,(2,a4)
	move.b (9,a6),(9,a4)
	move.b d0,($70,a4)
	move.w #$f0,($10,a4)
	move.w d2,($14,a4)
	move.b #$ff,($c,a4)
	move.b ($d,a6),($d,a4)
	move.w ($18,a6),($18,a4)
	move.w ($78,a6),($78,a4)
	move.w d3,($40,a4)
	move.w d4,($44,a4)
	clr.w ($48,a4)
	clr.w ($4c,a4)

loc_0a6fe2:
	rts

;----------------------------------------------
loc_0a6fe4:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a7004(pc,d0.w),d1
	jsr loc_0a7004(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7004:
	dc.w loc_0a7008-loc_0a7004
	dc.w loc_0a7070-loc_0a7004

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7008:
	addq.b #2,(5,a6)
	tst.b ($bb,a5)
	beq.b loc_0a7070
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	moveq #0,d0
	move.b ($d,a6),d0
	addi.b #$b,d0
	lsl.w #5,d0
	lea.l (a0,d0.w),a0
	movea.l #loc_339774,a1
	movea.l ($28,a1),a1
	lea.l ($220,a1),a1
	moveq #3,d6
	move.l (a0),d4
	andi.l #$f000f000,d4

loc_0a7044:
	movem.l (a1)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a0)
	lea.l ($10,a0),a0
	movem.l (a1)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a0)
	lea.l ($10,a0),a0
	dbra d6,loc_0a7044

loc_0a7070:
	rts

;----------------------------------------------
loc_0a7072:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a7092(pc,d0.w),d1
	jsr loc_0a7092(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7092:
	dc.w loc_0a7096-loc_0a7092
	dc.w loc_0a70ac-loc_0a7092

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7096:
	addq.b #2,(5,a6)
	tst.b ($bb,a5)
	beq.b loc_0a70ac
	move.w ($72,a6),($10,a6)
	move.w ($74,a6),($14,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a70ac:
	jmp loc_01b6b6

;----------------------------------------------
loc_0a70b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7150
	move.b (5,a6),d0
	move.w loc_0a70d2(pc,d0.w),d1
	jsr loc_0a70d2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a70d2:
	dc.w loc_0a70d6-loc_0a70d2
	dc.w loc_0a70e2-loc_0a70d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a70d6:
	addq.b #2,(5,a6)
	tst.b ($bb,a5)
	beq.w loc_0a7150

loc_0a70e2:
	rts

;----------------------------------------------
loc_0a70e4:
	moveq #0,d0
	move.b ($70,a6),d0
	moveq #0,d1
	moveq #0,d2
	move.w (palrampointer,a5),d2
	lsl.l #8,d2
	movea.l d2,a0
	movea.l a0,a1
	lea.l (a0),a0
	bsr.w loc_0a7120
	movea.l a1,a0
	lea.l ($400,a0),a0
	bsr.w loc_0a7124
	movea.l a1,a0
	lea.l ($800,a0),a0
	bsr.w loc_0a7124
	movea.l a1,a0
	lea.l ($c00,a0),a0
	bsr.w loc_0a7124
	bra.w loc_0a7150

loc_0a7120:
	moveq #$1b,d6
	bra.b loc_0a7126

loc_0a7124:
	moveq #$1f,d6

loc_0a7126:
	moveq #$f,d5

loc_0a7128:
	move.w (a0),d2
	ror.w d1,d2
	move.w d2,d3
	moveq #$f,d4
	and.w d4,d3
	sub.b d3,d4
	cmp.b d0,d4
	bmi.b loc_0a713a
	move.b d0,d4

loc_0a713a:
	add.b d4,d2
	rol.w d1,d2
	move.w d2,(a0)+
	dbra d5,loc_0a7128
	dbra d6,loc_0a7126
	rts

;==============================================
loc_0a714a:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7150:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7158:
	movea.l #loc_2f4284,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7164:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($44,a6)
	move.w ($48,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($48,a6)
	move.w ($4c,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($4c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7196:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($40,a6),d0
	move.l ($54,a6),d1
	tst.w ($48,a6)
	bpl.b loc_0a71b8
	neg.l d0
	neg.l d1

loc_0a71b8:
	cmp.l d0,d1
	bgt.b loc_0a71ca
	move.l ($54,a6),($40,a6)
	neg.l ($48,a6)
	neg.l ($54,a6)

loc_0a71ca:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a71cc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($44,a6),d0
	move.l ($50,a6),d1
	tst.b ($4c,a6)
	bpl.b loc_0a71ee
	neg.l d0
	neg.l d1

loc_0a71ee:
	cmp.l d0,d1
	bgt.b loc_0a7200
	move.l ($50,a6),($44,a6)
	neg.l ($4c,a6)
	neg.l ($50,a6)

loc_0a7200:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7202:
	btst #0,($3c,a6)
	beq.b loc_0a7234
	move.l ($40,a6),d0
	or.l ($48,a6),d0
	beq.b loc_0a722e
	move.w ($10,a6),d0
	move.w ($72,a6),d1
	tst.w ($40,a6)
	bpl.b loc_0a7224
	exg.l d0,d1

loc_0a7224:
	cmp.w d0,d1
	bgt.b loc_0a7238
	move.w ($72,a6),($10,a6)

loc_0a722e:
	bclr.b #0,($3c,a6)

loc_0a7234:
	moveq #1,d0
	rts

loc_0a7238:
	moveq #0,d0
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a723c:
	btst #1,($3c,a6)
	beq.b loc_0a726e
	move.l ($44,a6),d0
	or.l ($4c,a6),d0
	beq.b loc_0a7268
	move.w ($14,a6),d0
	move.w ($74,a6),d1
	tst.w ($44,a6)
	bpl.b loc_0a725e
	exg.l d0,d1

loc_0a725e:
	cmp.w d0,d1
	bgt.b loc_0a7272
	move.w ($74,a6),($14,a6)

loc_0a7268:
	bclr.b #1,($3c,a6)

loc_0a726e:
	moveq #1,d0
	rts

loc_0a7272:
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7276:
	dc.w $ff40,$0000
	dc.l loc_0a727e

loc_0a727e:
	dc.w $0008,$0018,$0005
	dc.w $2400,$031c,$ff40,$0010
	dc.w $2400,$031c,$ff80,$0010
	dc.w $2400,$031c,$ffc0,$0010
	dc.w $2400,$031c,$0000,$0010
	dc.w $2400,$031c,$0040,$0010
	dc.w $2400,$031c,$0080,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a72b4:
	dc.w $ff40,$0000
	dc.l loc_0a72bc

loc_0a72bc:
	dc.w $0008,$0023,$0005
	dc.w $2400,$3314,$ffe0,$0000
	dc.w $2400,$0314,$ffe0,$0040
	dc.w $2400,$0314,$ffe0,$0050
	dc.w $2400,$0314,$ffe0,$0060
	dc.w $2400,$3014,$0020,$0000
	dc.w $2400,$2014,$0020,$0040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a72f2:
	dc.w $ff40,$0000
	dc.l loc_0a72fa

loc_0a72fa:
	dc.w $0002,$0000,$0000
	dc.l loc_0a7374
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100
	dc.w $d5c3,$0100,$d5c5,$0100

loc_0a7374:
	dc.w $0000,$0000,$0012,$0000
	dc.w $0008,$0008,$001a,$0008
	dc.w $0010,$0010,$0022,$0010
	dc.w $0018,$0018,$002a,$0018
	dc.w $0020,$0020,$0032,$0020
	dc.w $0028,$0028,$003a,$0028
	dc.w $0030,$0030,$0042,$0030
	dc.w $0038,$0038,$004a,$0038
	dc.w $0040,$0040,$0052,$0040
	dc.w $0048,$0048,$005a,$0048
	dc.w $0050,$0050,$0062,$0050
	dc.w $0058,$0058,$006a,$0058
	dc.w $0060,$0060,$0072,$0060
	dc.w $0068,$0068,$007a,$0068
	dc.w $0000,$1000,$031e,$0fae
	dc.w $061c,$0ec4,$08e1,$0d4b
	dc.w $0b4f,$0b4f,$0d4b,$08e1
	dc.w $0ec4,$061c,$0fae,$031e
	dc.w $1000,$0000,$0fae,$fce2
	dc.w $0ec4,$f9e4,$0d4b,$f71f
	dc.w $0b4f,$f4b1,$08e1,$f2b5
	dc.w $061c,$f13c,$031e,$f052
	dc.w $0000,$f000,$fce2,$f052
	dc.w $f9e4,$f13c,$f71f,$f2b5
	dc.w $f4b1,$f4b1,$f2b5,$f71f
	dc.w $f13c,$f9e4,$f052,$fce2
	dc.w $f000,$0000,$f052,$031e
	dc.w $f13c,$061c,$f2b5,$08e1
	dc.w $f4b1,$0b4f,$f71f,$0d4b
	dc.w $f9e4,$0ec4,$fce2,$0fae

;##############################################
loc_0a7464:
	move.b (4,a6),d0
	move.w loc_0a7470(pc,d0.w),d1
	jmp loc_0a7470(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7470:
	dc.w loc_0a7478-loc_0a7470
	dc.w loc_0a74aa-loc_0a7470
	dc.w loc_0a7518-loc_0a7470
	dc.w loc_0a7518-loc_0a7470

;==============================================
loc_0a7478:
	addq.b #2,(4,a6)
	move.w #6,($3a,a6)
	moveq #0,d0
	add.b ($bb,a5),d0
	addq.b #2,d0
	ext.w d0
	moveq #0,d1
	move.b ($70,a6),d1
	lsl.w #3,d1
	add.w d0,d0
	lea.l loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;==============================================
loc_0a74aa:
	move.b (5,a6),d0
	move.w loc_0a74b8(pc,d0.w),d1
	jsr loc_0a74b8(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a74b8:
	dc.w loc_0a74be-loc_0a74b8
	dc.w loc_0a74f0-loc_0a74b8
	dc.w loc_0a74fa-loc_0a74b8

;----------------------------------------------
loc_0a74be:
	tst.b ($78,a6)
	beq.w loc_0a74d4
	move.w ($1c8,a5),d0
	cmp.b ($78,a6),d0
	bcc.w loc_0a74d4
	rts

loc_0a74d4:
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b ($70,a6),d0
	move.b #0,d1
	move.b #0,d2
	move.b ($d,a6),d3
	jsr loc_01f75c

loc_0a74f0:
	bsr.w loc_0a751e
	jmp loc_01b4ec

;----------------------------------------------
loc_0a74fa:
	tst.b ($79,a6)
	beq.w loc_0a7512
	move.w ($1c8,a5),d0
	cmp.b ($79,a6),d0
	bcs.w loc_0a7512
	addq.b #2,(4,a6)

loc_0a7512:
	jmp loc_01b4ec

;==============================================
loc_0a7518:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a751e:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	tst.w ($40,a6)
	bmi.w loc_0a7542
	cmp.w ($72,a6),d0
	bge.w loc_0a754c
	bra.w loc_0a754a

loc_0a7542:
	cmp.w ($72,a6),d0
	ble.w loc_0a754c

loc_0a754a:
	rts

loc_0a754c:
	move.w ($72,a6),($10,a6)
	addq.b #2,(5,a6)
	bra.b loc_0a754a

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a7558:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a755a:
	move.b #4,(4,a6)
	rts

;##############################################
;Character Endings
loc_0a7562:
	move.b (4,a6),d0
	move.w loc_0a756e(pc,d0.w),d1
	jmp loc_0a756e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a756e
	dc.w loc_0a7576-loc_0a756e
	dc.w loc_0a75c6-loc_0a756e
	dc.w loc_0aa5c4-loc_0a756e
	dc.w loc_0aa5c4-loc_0a756e

;==============================================
loc_0a7576:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0a7586
	rts

loc_0a7586:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	bsr.w loc_0aa5d2
	moveq #0,d0
	move.b ($76,a6),d0
	beq.w loc_0a75b0
	jsr loc_0aadac
	moveq #0,d0
	bra.w loc_0a75c6

loc_0a75b0:
	move.b ($7f,a6),d0
	jsr loc_02fc88
	moveq #0,d0
	move.b ($70,a6),d0
	bsr.w loc_0aa630
	moveq #0,d0

loc_0a75c6:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0a75d4(pc,d0.w),d1
	jmp loc_0a75d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a75d4:
	dc.w loc_0a7670-loc_0a75d4
	dc.w loc_0a768a-loc_0a75d4
	dc.w loc_0a76cc-loc_0a75d4
	dc.w loc_0a76fe-loc_0a75d4
	dc.w loc_0a7732-loc_0a75d4
	dc.w loc_0a77c6-loc_0a75d4
	dc.w loc_0a7872-loc_0a75d4
	dc.w loc_0a78dc-loc_0a75d4

	dc.w loc_0a7994-loc_0a75d4
	dc.w loc_0a7a06-loc_0a75d4
	dc.w loc_0a7a88-loc_0a75d4
	dc.w loc_0a7ada-loc_0a75d4
	dc.w loc_0a7b5c-loc_0a75d4
	dc.w loc_0a7be2-loc_0a75d4
	dc.w loc_0a7c82-loc_0a75d4
	dc.w loc_0a7d72-loc_0a75d4

	dc.w loc_0a7e3a-loc_0a75d4
	dc.w loc_0a7ece-loc_0a75d4
	dc.w loc_0a7fea-loc_0a75d4
	dc.w loc_0a808e-loc_0a75d4
	dc.w loc_0a80ce-loc_0a75d4
	dc.w loc_0a8134-loc_0a75d4
	dc.w loc_0a8190-loc_0a75d4
	dc.w loc_0a81f0-loc_0a75d4

	dc.w loc_0a828c-loc_0a75d4
	dc.w loc_0a8308-loc_0a75d4
	dc.w loc_0a845c-loc_0a75d4
	dc.w loc_0a84b2-loc_0a75d4
	dc.w loc_0a8508-loc_0a75d4
	dc.w loc_0a8576-loc_0a75d4
	dc.w loc_0a865c-loc_0a75d4
	dc.w loc_0a8706-loc_0a75d4

	dc.w loc_0a88b2-loc_0a75d4
	dc.w loc_0a89a4-loc_0a75d4
	dc.w loc_0a8a64-loc_0a75d4
	dc.w loc_0a8b48-loc_0a75d4
	dc.w loc_0a8b96-loc_0a75d4
	dc.w loc_0a8c36-loc_0a75d4
	dc.w loc_0a8cf8-loc_0a75d4
	dc.w loc_0a8d46-loc_0a75d4

	dc.w loc_0a8e12-loc_0a75d4
	dc.w loc_0a8ecc-loc_0a75d4
	dc.w loc_0a8f3e-loc_0a75d4
	dc.w loc_0a8f86-loc_0a75d4
	dc.w loc_0a9028-loc_0a75d4
	dc.w loc_0a9180-loc_0a75d4
	dc.w loc_0a9268-loc_0a75d4
	dc.w loc_0a92ea-loc_0a75d4

	dc.w loc_0a932e-loc_0a75d4
	dc.w loc_0a9378-loc_0a75d4
	dc.w loc_0a9444-loc_0a75d4
	dc.w loc_0a94aa-loc_0a75d4
	dc.w loc_0a9506-loc_0a75d4
	dc.w loc_0a9598-loc_0a75d4
	dc.w loc_0a95ee-loc_0a75d4
	dc.w loc_0a964c-loc_0a75d4

	dc.w loc_0a969c-loc_0a75d4
	dc.w loc_0a9798-loc_0a75d4
	dc.w loc_0a981c-loc_0a75d4
	dc.w loc_0a98b2-loc_0a75d4
	dc.w loc_0a9a28-loc_0a75d4
	dc.w loc_0a9b1c-loc_0a75d4
	dc.w loc_0a9baa-loc_0a75d4
	dc.w loc_0a9c8a-loc_0a75d4

	dc.w loc_0a9d62-loc_0a75d4
	dc.w loc_0a9dc2-loc_0a75d4
	dc.w loc_0a9e60-loc_0a75d4
	dc.w loc_0a9f56-loc_0a75d4
	dc.w loc_0a9ffc-loc_0a75d4
	dc.w loc_0aa04c-loc_0a75d4
	dc.w loc_0aa0fe-loc_0a75d4
	dc.w loc_0aa172-loc_0a75d4

	dc.w loc_0aa1da-loc_0a75d4
	dc.w loc_0aa360-loc_0a75d4
	dc.w loc_0aa47c-loc_0a75d4
	dc.w loc_0aa4c6-loc_0a75d4
	dc.w loc_0aa572-loc_0a75d4
	dc.w loc_0aa5a6-loc_0a75d4

;----------------------------------------------
loc_0a7670:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0a768a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a76aa(pc,d0.w),d1
	jsr loc_0a76aa(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a76aa:
	dc.w loc_0a76ae-loc_0a76aa
	dc.w loc_0a76c0-loc_0a76aa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a76ae:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.b loc_0a76bc
	rts

loc_0a76bc:
	addq.b #2,(5,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a76c0:
	jsr loc_01b0c4
	jmp loc_01b692

;----------------------------------------------
loc_0a76cc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	tst.b (5,a6)
	bne.b loc_0a76f2
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.b loc_0a76ee
	rts

loc_0a76ee:
	addq.b #2,(5,a6)

loc_0a76f2:
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0a76fe:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	tst.b (5,a6)
	bne.b loc_0a7720
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a7720:
	jsr loc_0a71cc
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0a7732:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7752(pc,d0.w),d1
	jsr loc_0a7752(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7752:
	dc.w loc_0a775a-loc_0a7752
	dc.w loc_0a7778-loc_0a7752
	dc.w loc_0a778a-loc_0a7752
	dc.w loc_0a77a8-loc_0a7752

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a775a:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7778:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a778a:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a77a8:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a77c6:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a77e6(pc,d0.w),d1
	jsr loc_0a77e6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a77e6:
	dc.w loc_0a77f0-loc_0a77e6
	dc.w loc_0a7808-loc_0a77e6
	dc.w loc_0a7828-loc_0a77e6
	dc.w loc_0a784c-loc_0a77e6
	dc.w loc_0a786c-loc_0a77e6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a77f0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7806
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a7806:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7808:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7828:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($74,a6),($72,a6)
	move.b #1,($3c,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a784c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a786c:
	jmp loc_01b692

;----------------------------------------------
loc_0a7872:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7892(pc,d0.w),d1
	jsr loc_0a7892(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7892:
	dc.w loc_0a7896-loc_0a7892
	dc.w loc_0a78bc-loc_0a7892

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7896:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	bne.b loc_0a78b4
	neg.l ($40,a6)

loc_0a78b4:
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a78bc:
	jsr loc_01b0c4
	move.w ($10,a6),d0
	sub.w ($290,a5),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a78dc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a78fc(pc,d0.w),d1
	jsr loc_0a78fc(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a78fc:
	dc.w loc_0a7908-loc_0a78fc
	dc.w loc_0a791a-loc_0a78fc
	dc.w loc_0a7934-loc_0a78fc
	dc.w loc_0a7950-loc_0a78fc
	dc.w loc_0a7960-loc_0a78fc
	dc.w loc_0a798a-loc_0a78fc

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7908:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7918
	addq.b #2,(5,a6)

loc_0a7918:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a791a:
	tst.b ($33,a6)
	bpl.b loc_0a792e
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a792e:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7934:
	bsr.w loc_0a71cc
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7950:
	tst.b ($33,a6)
	bpl.b loc_0a795a
	addq.b #2,(5,a6)

loc_0a795a:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7960:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7988
	addq.b #2,(5,a6)
	move.w ($72,a6),($10,a6)
	move.w ($74,a6),($14,a6)
	move.b #4,(9,a6)
	moveq #$42,d0
	bra.w loc_0aa630

loc_0a7988:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a798a:
	bsr.w loc_0a71cc
	jmp loc_01b692

;----------------------------------------------
loc_0a7994:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a79b8(pc,d0.w),d1
	jsr loc_0a79b8(pc,d1.w)
	bsr.w loc_0aa83c
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a79b8:
	dc.w loc_0a79be-loc_0a79b8
	dc.w loc_0a79d6-loc_0a79b8
	dc.w loc_0a79ee-loc_0a79b8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a79be:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a79d6:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a79ee:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bge.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a7a06:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7a2a(pc,d0.w),d1
	jsr loc_0a7a2a(pc,d1.w)
	bsr.w loc_0aa83c
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7a2a:
	dc.w loc_0a7a32-loc_0a7a2a
	dc.w loc_0a7a4a-loc_0a7a2a
	dc.w loc_0a7a6a-loc_0a7a2a
	dc.w loc_0a7a82-loc_0a7a2a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7a32:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7a48
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a7a48:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7a4a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7a6a:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7a82:
	jmp loc_01b692

;----------------------------------------------
loc_0a7a88:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7aa2(pc,d0.w),d1
	jmp loc_0a7aa2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7aa2:
	dc.w loc_0a7aa6-loc_0a7aa2
	dc.w loc_0a7ac8-loc_0a7aa2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7aa6:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7abc
	addq.b #2,(5,a6)
	move.w #$28,($3a,a6)

loc_0a7abc:
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7ac8:
	subq.w #1,($3a,a6)
	bmi.w loc_0aa5ca
	eori.b #1,(1,a6)
	bne.b loc_0a7abc
	rts

;----------------------------------------------
loc_0a7ada:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7afa(pc,d0.w),d1
	jsr loc_0a7afa(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7afa:
	dc.w loc_0a7b00-loc_0a7afa
	dc.w loc_0a7b14-loc_0a7afa
	dc.w loc_0a7b46-loc_0a7afa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7b00:
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7b14:
	bsr.w loc_0a71cc
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7b40
	addq.b #2,(5,a6)
	move.w ($72,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($44,a6)
	move.w ($74,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($4c,a6)

loc_0a7b40:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7b46:
	jsr loc_01b0c4
	cmpi.w #$100,($14,a6)
	bge.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a7b5c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7b7c(pc,d0.w),d1
	jsr loc_0a7b7c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7b7c:
	dc.w loc_0a7b82-loc_0a7b7c
	dc.w loc_0a7b9a-loc_0a7b7c
	dc.w loc_0a7bd8-loc_0a7b7c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7b82:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7b98
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)

loc_0a7b98:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7b9a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a7bd2
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($48,a6),($4c,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a7bd2:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7bd8:
	bsr.w loc_0a71cc
	jmp loc_01b692

;----------------------------------------------
loc_0a7be2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7c02(pc,d0.w),d1
	jsr loc_0a7c02(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7c02:
	dc.w loc_0a7c0a-loc_0a7c02
	dc.w loc_0a7c22-loc_0a7c02
	dc.w loc_0a7c42-loc_0a7c02
	dc.w loc_0a7c64-loc_0a7c02

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7c0a:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7c20
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a7c20:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7c22:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7c42:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	neg.l ($40,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7c64:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a7c82:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7ca2(pc,d0.w),d1
	jsr loc_0a7ca2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7ca2:
	dc.w loc_0a7cb0-loc_0a7ca2
	dc.w loc_0a7cc2-loc_0a7ca2
	dc.w loc_0a7cee-loc_0a7ca2
	dc.w loc_0a7d00-loc_0a7ca2
	dc.w loc_0a7d1c-loc_0a7ca2
	dc.w loc_0a7d3c-loc_0a7ca2
	dc.w loc_0a7d54-loc_0a7ca2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7cb0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7cc0
	addq.b #2,(5,a6)

loc_0a7cc0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7cc2:
	tst.b ($33,a6)
	bpl.b loc_0a7cce
	addq.b #2,(5,a6)
	bra.b loc_0a7cf6

loc_0a7cce:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_0a7ce8
	addq.b #2,(5,a6)
	moveq #$d,d0
	move.b ($7e,a6),d1
	jsr loc_0aab44

loc_0a7ce8:
	jmp loc_0aa6c4(pc)
	nop

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7cee:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4

loc_0a7cf6:
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7d00:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7d16
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a7d16:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7d1c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7d3c:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7d54:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a7d72:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7d8c(pc,d0.w),d1
	jmp loc_0a7d8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7d8c:
	dc.w loc_0a7d96-loc_0a7d8c
	dc.w loc_0a7db8-loc_0a7d8c
	dc.w loc_0a7dda-loc_0a7d8c
	dc.w loc_0a7dfe-loc_0a7d8c
	dc.w loc_0a7e24-loc_0a7d8c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7d96:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7dac
	addq.b #2,(5,a6)
	move.b ($7b,a6),($3a,a6)

loc_0a7dac:
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7db8:
	subq.b #1,($3a,a6)
	bpl.b loc_0a7dac
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)
	move.b #0,($b,a6)
	moveq #$42,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7dda:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0a7dac
	addq.b #2,(5,a6)
	bsr.w loc_0aa604
	moveq #$43,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7dfe:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0a7dac
	addq.b #2,(5,a6)
	move.w #$40,($3a,a6)
	moveq #$44,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7e24:
	subq.w #1,($3a,a6)
	bmi.w loc_0aa5ca
	move.w ($3a,a6),d0
	btst #0,d0
	beq.w loc_0a7dac
	rts

;----------------------------------------------
loc_0a7e3a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7e5a(pc,d0.w),d1
	jsr loc_0a7e5a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7e5a:
	dc.w loc_0a7e62-loc_0a7e5a
	dc.w loc_0a7e80-loc_0a7e5a
	dc.w loc_0a7e92-loc_0a7e5a
	dc.w loc_0a7eb0-loc_0a7e5a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7e62:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7e80:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7e92:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7eb0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a7ece:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a7eee(pc,d0.w),d1
	jsr loc_0a7eee(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a7eee:
	dc.w loc_0a7efc-loc_0a7eee
	dc.w loc_0a7f14-loc_0a7eee
	dc.w loc_0a7f34-loc_0a7eee
	dc.w loc_0a7f4c-loc_0a7eee
	dc.w loc_0a7f74-loc_0a7eee
	dc.w loc_0a7faa-loc_0a7eee
	dc.w loc_0a7fe0-loc_0a7eee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7efc:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a7f12
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a7f12:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7f14:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7f34:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7f4c:
	tst.b ($34,a6)
	beq.b loc_0a7f6e
	addq.b #2,(5,a6)
	move.b #4,($32,a6)
	move.l ($48,a6),($40,a6)
	move.w ($74,a6),($72,a6)
	move.b #1,($3c,a6)

loc_0a7f6e:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7f74:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$c,d0
	move.b ($7e,a6),d1
	jsr loc_0aab44
	clr.b ($59,a6)
	move.w #2,($3a,a6)
	moveq #$46,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7faa:
	jsr loc_01b692
	bsr.w loc_0a888e
	move.b ($34,a6),d0
	andi.b #1,d0
	eori.b #1,d0
	move.b d0,($b,a6)
	tst.b ($35,a6)
	beq.b loc_0a7fde
	clr.b ($35,a6)
	subq.w #1,($3a,a6)
	bne.b loc_0a7fde
	addq.b #2,(5,a6)
	moveq #$47,d0
	bra.w loc_0aa630

loc_0a7fde:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a7fe0:
	bsr.w loc_0a888e
	jmp loc_01b692

;----------------------------------------------
loc_0a7fea:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a800a(pc,d0.w),d1
	jsr loc_0a800a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a800a:
	dc.w loc_0a8012-loc_0a800a
	dc.w loc_0a8034-loc_0a800a
	dc.w loc_0a8062-loc_0a800a
	dc.w loc_0a8078-loc_0a800a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8012:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a802e
	addq.b #2,(5,a6)
	move.w #$40,($3a,a6)
	move.b ($d,a6),($5f,a6)

loc_0a802e:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8034:
	move.b ($5f,a6),d0
	move.w ($3a,a6),d1
	btst #1,d1
	bne.b loc_0a8046
	move.b ($7e,a6),d0

loc_0a8046:
	move.b d0,($d,a6)
	subq.w #1,($3a,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),($d,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8062:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8072
	addq.b #2,(5,a6)

loc_0a8072:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8078:
	jsr loc_01b0c4
	cmpi.w #$100,($14,a6)
	bge.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a808e:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a80ae(pc,d0.w),d1
	jsr loc_0a80ae(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a80ae:
	dc.w loc_0a80b2-loc_0a80ae
	dc.w loc_0a80c8-loc_0a80ae

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a80b2:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a80c8
	addq.b #2,(5,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a80c8:
	jmp loc_01b692

;----------------------------------------------
loc_0a80ce:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a80ee(pc,d0.w),d1
	jsr loc_0a80ee(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a80ee:
	dc.w loc_0a80f4-loc_0a80ee
	dc.w loc_0a811c-loc_0a80ee
	dc.w loc_0a812e-loc_0a80ee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a80f4:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8116
	addq.b #2,(5,a6)
	tst.b ($10d,a5)
	bne.b loc_0a8122
	move.b ($6a,a6),($b,a6)
	moveq #$43,d0
	bra.w loc_0aa630

loc_0a8116:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a811c:
	tst.b ($33,a6)
	bpl.b loc_0a812e

loc_0a8122:
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a812e:
	jmp loc_01b692

;----------------------------------------------
loc_0a8134:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8154(pc,d0.w),d1
	jsr loc_0a8154(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8154:
	dc.w loc_0a815a-loc_0a8154
	dc.w loc_0a8170-loc_0a8154
	dc.w loc_0a818e-loc_0a8154

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a815a:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a816a
	addq.b #2,(5,a6)

loc_0a816a:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8170:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8188
	addq.b #2,(5,a6)

loc_0a8188:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a818e:
	rts

;----------------------------------------------
loc_0a8190:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a81b0(pc,d0.w),d1
	jsr loc_0a81b0(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a81b0:
	dc.w loc_0a81b4-loc_0a81b0
	dc.w loc_0a81ce-loc_0a81b0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a81b4:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	clr.w ($3a,a6)
	bra.w loc_0a81d6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a81ce:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4

loc_0a81d6:
	addq.w #1,($3a,a6)
	andi.w #3,($3a,a6)
	move.w ($3a,a6),d0
	move.b loc_0a81ec(pc,d0.w),d0
	bra.w loc_0aa630

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a81ec:
	dc.b $43,$44,$45,$46

;----------------------------------------------
loc_0a81f0:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8210(pc,d0.w),d1
	jsr loc_0a8210(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8210:
	dc.w loc_0a8218-loc_0a8210
	dc.w loc_0a8238-loc_0a8210
	dc.w loc_0a8248-loc_0a8210
	dc.w loc_0a8272-loc_0a8210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8218:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)
	move.l ($44,a6),($50,a6)
	bra.b loc_0a8286

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8238:
	tst.b ($35,a6)
	bne.b loc_0a8242
	addq.b #2,(5,a6)

loc_0a8242:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8248:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0a8268
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_01b692

loc_0a8268:
	tst.b ($35,a6)
	beq.w loc_0aa6c4
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8272:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	move.b #2,(5,a6)
	move.l ($50,a6),($44,a6)

loc_0a8286:
	moveq #$47,d0
	bra.w loc_0aa630

;----------------------------------------------
loc_0a828c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a82ac(pc,d0.w),d1
	jsr loc_0a82ac(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a82ac:
	dc.w loc_0a82b2-loc_0a82ac
	dc.w loc_0a82d0-loc_0a82ac
	dc.w loc_0a82fe-loc_0a82ac

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a82b2:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)
	moveq #$2a,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a82d0:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a82f8
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a82f8:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a82fe:
	bsr.w loc_0a71cc
	jmp loc_01b692

;----------------------------------------------
loc_0a8308:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8328(pc,d0.w),d1
	jsr loc_0a8328(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8328:
	dc.w loc_0a8336-loc_0a8328
	dc.w loc_0a834e-loc_0a8328
	dc.w loc_0a838a-loc_0a8328
	dc.w loc_0a83ac-loc_0a8328
	dc.w loc_0a83cc-loc_0a8328
	dc.w loc_0a8408-loc_0a8328
	dc.w loc_0a8452-loc_0a8328

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8336:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a834c
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)

loc_0a834c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a834e:
	jsr loc_01b0c4
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a8384
	addq.b #2,(5,a6)
	move.w #$100,($3a,a6)
	move.l #$6000,($44,a6)
	move.l #$fffffe00,($4c,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a8384:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a838a:
	bsr.w loc_0a71cc
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a83a6
	addq.b #2,(5,a6)
	move.l #$20000,($40,a6)

loc_0a83a6:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a83ac:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bls.b loc_0a83c6
	addq.b #2,(5,a6)

loc_0a83c6:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a83cc:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)
	move.l #$fff80000,($40,a6)
	move.l #$800,($48,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	move.w #$1f0,($10,a6)
	moveq #$4b,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8408:
	jsr loc_01b0c4
	tst.l ($48,a6)
	beq.b loc_0a8422
	cmpi.l #$fffe0000,($40,a6)
	blt.b loc_0a8422
	clr.l ($48,a6)

loc_0a8422:
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0a844c
	addq.b #2,(5,a6)
	move.l #$10000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l ($40,a6),($54,a6)
	neg.l ($54,a6)

loc_0a844c:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8452:
	bsr.w loc_0a7196
	jmp loc_01b692

;----------------------------------------------
loc_0a845c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a847c(pc,d0.w),d1
	jsr loc_0a847c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a847c:
	dc.w loc_0a8482-loc_0a847c
	dc.w loc_0a849a-loc_0a847c
	dc.w loc_0a84ac-loc_0a847c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8482:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a849a:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a84ac:
	jmp loc_01b692

;----------------------------------------------
loc_0a84b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a84d2(pc,d0.w),d1
	jsr loc_0a84d2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a84d2:
	dc.w loc_0a84d8-loc_0a84d2
	dc.w loc_0a84f0-loc_0a84d2
	dc.w loc_0a8502-loc_0a84d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a84d8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$45,d0
	bra.w loc_0aa630
 
;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a84f0:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8502:
	jmp loc_01b692

;----------------------------------------------
loc_0a8508:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8528(pc,d0.w),d1
	jsr loc_0a8528(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8528:
	dc.w loc_0a852e-loc_0a8528
	dc.w loc_0a854a-loc_0a8528
	dc.w loc_0a8570-loc_0a8528

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a852e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8544
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)

loc_0a8544:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a854a:
	jsr loc_01b0c4
	jsr loc_0a7202
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8570:
	jmp loc_01b692

;----------------------------------------------
loc_0a8576:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8596(pc,d0.w),d1
	jsr loc_0a8596(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8596:
	dc.w loc_0a859e-loc_0a8596
	dc.w loc_0a85ba-loc_0a8596
	dc.w loc_0a8608-loc_0a8596
	dc.w loc_0a8632-loc_0a8596

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a859e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	clr.b ($5b,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a85ba:
	jsr loc_01b692
	btst #1,($35,a6)
	beq.b loc_0a85d4
	bclr.b #1,($35,a6)
	move.b #4,($32,a6)

loc_0a85d4:
	btst #2,($35,a6)
	beq.b loc_0a85ee
	moveq #0,d0
	move.b ($34,a6),d0
	tst.b ($b,a6)
	bne.b loc_0a85ea
	neg.w d0

loc_0a85ea:
	add.w d0,($10,a6)

loc_0a85ee:
	tst.b ($5b,a6)
	bne.b loc_0a8602
	btst #3,($35,a6)
	beq.b loc_0a8600
	addq.b #2,(5,a6)

loc_0a8600:
	rts

loc_0a8602:
	addq.b #2,(5,a6)
	bra.b loc_0a8618

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8608:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($5b,a6)
	beq.w loc_0aa6c4

loc_0a8618:
	addq.b #2,(5,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8632:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0a863e
	neg.l d0

loc_0a863e:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0a8656
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0a8656:
	jmp loc_01b692

;----------------------------------------------
loc_0a865c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a867c(pc,d0.w),d1
	jsr loc_0a867c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a867c:
	dc.w loc_0a8684-loc_0a867c
	dc.w loc_0a868e-loc_0a867c
	dc.w loc_0a86c4-loc_0a867c
	dc.w loc_0a8704-loc_0a867c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8684:
	addq.b #2,(5,a6)
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a868e:
	movea.w ($36,a6),a4
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	bpl.b loc_0a869e
	neg.w d0

loc_0a869e:
	cmpi.w #$30,d0
	bhi.w loc_0aa6c4
	addq.b #2,(5,a6)
	st.b ($5b,a4)
	moveq #$45,d0
	bsr.w loc_0aa630
	moveq #0,d0
	move.b d0,($3a,a6)
	move.b ($7e,a6),d1
	jmp loc_0aab44

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a86c4:
	movea.w ($36,a6),a4
	move.b ($35,a4),d1
	beq.b loc_0a8704
	bmi.b loc_0a8700
	clr.b ($35,a4)
	moveq #$46,d0
	btst #1,d1
	beq.b loc_0a86de
	moveq #$47,d0

loc_0a86de:
	bsr.w loc_0aa630
	addq.b #1,($3a,a6)
	cmpi.b #5,($3a,a6)
	bls.b loc_0a86f2
	clr.b ($3a,a6)

loc_0a86f2:
	move.b ($3a,a6),d0
	move.b ($7e,a6),d1
	jmp loc_0aab44

loc_0a8700:
	addq.b #2,(5,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8704:
	rts

;----------------------------------------------
loc_0a8706:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8726(pc,d0.w),d1
	jsr loc_0a8726(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8726:
	dc.w loc_0a8738-loc_0a8726
	dc.w loc_0a875e-loc_0a8726
	dc.w loc_0a8786-loc_0a8726
	dc.w loc_0a87a0-loc_0a8726
	dc.w loc_0a87c2-loc_0a8726
	dc.w loc_0a8804-loc_0a8726
	dc.w loc_0a8842-loc_0a8726
	dc.w loc_0a8876-loc_0a8726

	dc.w loc_0a8888-loc_0a8726

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8738:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)
	clr.b ($5f,a6)
	clr.b ($59,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a875e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	move.w ($72,a6),d1
	tst.b ($b,a6)
	bne.b loc_0a8776
	exg.l d0,d1

loc_0a8776:
	cmp.w d0,d1
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8786:
	tst.b ($35,a6)
	beq.b loc_0a879a
	addq.b #2,(5,a6)
	clr.b ($35,a6)
	move.b #4,($32,a6)

loc_0a879a:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a87a0:
	tst.b ($5f,a6)
	beq.b loc_0a87ac
	subq.b #1,($5f,a6)
	rts

loc_0a87ac:
	jsr loc_01b692
	bsr.w loc_0a888e
	tst.b ($35,a6)
	beq.b loc_0a87c0
	addq.b #2,(5,a6)

loc_0a87c0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a87c2:
	tst.b ($5f,a6)
	beq.b loc_0a87ce
	subq.b #1,($5f,a6)
	rts

loc_0a87ce:
	jsr loc_01b692
	bsr.w loc_0a888e
	tst.b ($35,a6)
	bne.b loc_0a8802
	addq.b #2,(5,a6)
	move.l #$30000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_0a8802:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8804:
	tst.w ($40,a6)
	bmi.b loc_0a8838
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0a8826
	neg.l d0

loc_0a8826:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_01b692

loc_0a8838:
	addq.b #2,(5,a6)
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8842:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0a886c
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_01b692

loc_0a886c:
	tst.b ($35,a6)
	beq.w loc_0aa6c4
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8876:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8888:
	jmp loc_01b692

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a888e:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	cmp.b ($59,a6),d0
	beq.b loc_0a88b0
	move.b d0,($59,a6)
	beq.b loc_0a88b0
	move.b ($7e,a6),d1
	jmp loc_0aab90


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a88ac:
	clr.b ($59,a6)

loc_0a88b0:
	rts

;----------------------------------------------
loc_0a88b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a88d2(pc,d0.w),d1
	jsr loc_0a88d2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a88d2:
	dc.w loc_0a88e0-loc_0a88d2
	dc.w loc_0a88f4-loc_0a88d2
	dc.w loc_0a8942-loc_0a88d2
	dc.w loc_0aa3fa-loc_0a88d2
	dc.w loc_0aa42e-loc_0a88d2
	dc.w loc_0aa448-loc_0a88d2
	dc.w loc_0aa470-loc_0a88d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a88e0:
	addq.b #2,(5,a6)
	clr.b ($59,a6)
	move.w ($14,a6),($64,a6)
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a88f4:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	moveq #0,d1
	move.b (9,a0),d1
	beq.w loc_0aa6c4
	cmp.b ($59,a6),d1
	beq.w loc_0aa6c4
	move.b d1,($59,a6)
	movea.l #loc_11c65a,a1
	move.w (8,a1),d2
	lea.l (a1,d2.w),a1
	move.w d1,d2
	lsl.w #5,d2
	lea.l (a1,d2.w),a1
	move.b ($d,a1),d2
	cmpi.b #$d,d2
	beq.w loc_0a897a
	moveq #$46,d0
	btst #1,d1
	bne.b loc_0a893e
	moveq #$47,d0

loc_0a893e:
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8942:
	jsr loc_01b0c4
	tst.w ($44,a6)
	bmi.b loc_0a8970
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	moveq #0,d0
	move.b (9,a0),d1
	beq.w loc_0aa6c4
	cmp.b ($59,a6),d1
	beq.w loc_0aa6c4
	move.b d1,($59,a6)
	bra.w loc_0a897e

loc_0a8970:
	addq.b #2,(5,a6)
	jmp loc_01b692

loc_0a897a:
	addq.b #2,(5,a6)

loc_0a897e:
	move.l #$40000,($40,a6)
	move.l #0,($48,a6)
	move.l #$5c000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$51,d0
	bra.w loc_0aa630

;----------------------------------------------
loc_0a89a4:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a89c4(pc,d0.w),d1
	jsr loc_0a89c4(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a89c4:
	dc.w loc_0a89cc-loc_0a89c4
	dc.w loc_0a89e4-loc_0a89c4
	dc.w loc_0a8a22-loc_0a89c4
	dc.w loc_0a8a5e-loc_0a89c4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a89cc:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a89e4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8a06
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8a06:
	cmp.w d0,d1
	bgt.b loc_0a8a1c
	addq.b #2,(5,a6)
	move.w d2,($10,a6)
	eori.b #1,($b,a6)
	neg.l ($40,a6)

loc_0a8a1c:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8a22:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8a44
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8a44:
	cmp.w d0,d1
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w d2,($10,a6)
	eori.b #1,($b,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8a5e:
	jmp loc_01b692

;----------------------------------------------
loc_0a8a64:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8a84(pc,d0.w),d1
	jsr loc_0a8a84(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8a84:
	dc.w loc_0a8a92-loc_0a8a84
	dc.w loc_0a8aaa-loc_0a8a84
	dc.w loc_0a8ae8-loc_0a8a84
	dc.w loc_0a8b24-loc_0a8a84
	dc.w loc_0a8aaa-loc_0a8a84
	dc.w loc_0a8ae8-loc_0a8a84
	dc.w loc_0a8b42-loc_0a8a84

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8a92:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8aaa:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8acc
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8acc:
	cmp.w d0,d1
	bgt.b loc_0a8ae2
	addq.b #2,(5,a6)
	move.w d2,($10,a6)
	eori.b #1,($b,a6)
	neg.l ($40,a6)

loc_0a8ae2:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8ae8:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8b0a
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8b0a:
	cmp.w d0,d1
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w d2,($10,a6)
	eori.b #1,($b,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8b24:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l ($44,a6),($40,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8b42:
	jmp loc_01b692

;----------------------------------------------
loc_0a8b48:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8b78
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8b78:
	cmp.w d0,d1
	bgt.b loc_0a8b8a
	move.w d2,($10,a6)
	eori.b #1,($b,a6)
	neg.l ($40,a6)

loc_0a8b8a:
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0a8b96:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8bb6(pc,d0.w),d1
	jsr loc_0a8bb6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8bb6:
	dc.w loc_0a8bbe-loc_0a8bb6
	dc.w loc_0a8be6-loc_0a8bb6
	dc.w loc_0a8bfe-loc_0a8bb6
	dc.w loc_0a8c2c-loc_0a8bb6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8bbe:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8be0
	addq.b #2,(5,a6)
	tst.b ($10d,a5)
	bne.b loc_0a8bee
	move.b ($6a,a6),($b,a6)
	moveq #$43,d0
	bra.w loc_0aa630

loc_0a8be0:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8be6:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4

loc_0a8bee:
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8bfe:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a8c26
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a8c26:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8c2c:
	bsr.w loc_0a71cc
	jmp loc_01b692

;----------------------------------------------
loc_0a8c36:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8c56(pc,d0.w),d1
	jsr loc_0a8c56(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8c56:
	dc.w loc_0a8c5e-loc_0a8c56
	dc.w loc_0a8c82-loc_0a8c56
	dc.w loc_0a8c92-loc_0a8c56
	dc.w loc_0a8cde-loc_0a8c56

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8c5e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8c80
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	move.w ($14,a6),($64,a6)
	moveq #$42,d0
	bra.w loc_0aa630

loc_0a8c80:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8c82:
	tst.b ($35,a6)
	beq.b loc_0a8c8c
	addq.b #2,(5,a6)

loc_0a8c8c:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8c92:
	jsr loc_01b0c4
	move.w ($72,a6),d0
	move.w ($10,a6),d1
	move.w d0,d2
	tst.b ($b,a6)
	beq.b loc_0a8cb2
	move.w ($10,a6),d0
	move.w ($74,a6),d1
	move.w d1,d2

loc_0a8cb2:
	cmp.w d0,d1
	bgt.b loc_0a8cc0
	eori.b #1,($b,a6)
	neg.l ($40,a6)

loc_0a8cc0:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8cde:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	move.b #4,(5,a6)
	move.l ($50,a6),($44,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;----------------------------------------------
loc_0a8cf8:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8d18(pc,d0.w),d1
	jsr loc_0a8d18(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8d18:
	dc.w loc_0a8d1c-loc_0a8d18
	dc.w loc_0a8d3e-loc_0a8d18

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8d1c:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l #loc_1257f4,($6a,a6)
	move.l #loc_24cd3c,($60,a6)

loc_0a8d3e:
	movea.w ($36,a6),a4
	bra.w loc_0aa6ca

;----------------------------------------------
loc_0a8d46:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8d66(pc,d0.w),d1
	jsr loc_0a8d66(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8d66:
	dc.w loc_0a8d74-loc_0a8d66
	dc.w loc_0a8d7c-loc_0a8d66
	dc.w loc_0a8d94-loc_0a8d66
	dc.w loc_0a8daa-loc_0a8d66
	dc.w loc_0a8dc4-loc_0a8d66
	dc.w loc_0a8dec-loc_0a8d66
	dc.w loc_0a8e0c-loc_0a8d66

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8d74:
	addq.b #2,(5,a6)
	clr.b ($5b,a6)

loc_0a8d7c:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$48,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8d94:
	tst.b ($35,a6)
	beq.b loc_0a8da4
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a8da4:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8daa:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0a8dc2
	addq.b #2,(5,a6)

loc_0a8dc2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8dc4:
	btst #1,($35,a6)
	beq.b loc_0a8de6
	addq.b #2,(5,a6)
	st.b ($5b,a6)
	move.b #4,($5f,a6)
	moveq #6,d0
	move.b ($7e,a6),d1
	jsr loc_0aab44

loc_0a8de6:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8dec:
	tst.b ($5f,a6)
	beq.b loc_0a8dfa
	subq.b #1,($5f,a6)
	beq.b loc_0a8dfa
	rts

loc_0a8dfa:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8e0c:
	jmp loc_01b692

;----------------------------------------------
loc_0a8e12:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8e32(pc,d0.w),d1
	jsr loc_0a8e32(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8e32:
	dc.w loc_0a8e3e-loc_0a8e32
	dc.w loc_0a8e5a-loc_0a8e32
	dc.w loc_0a8e6c-loc_0a8e32
	dc.w loc_0a8e8e-loc_0a8e32
	dc.w loc_0a8ea4-loc_0a8e32
	dc.w loc_0a8ec6-loc_0a8e32

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8e3e:
	movea.w ($36,a6),a4
	tst.b ($5b,a4)
	beq.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #4,($5f,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8e5a:
	subq.b #1,($5f,a6)
	bpl.b loc_0a8e6a
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)

loc_0a8e6a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8e6c:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w #3,($3a,a6)
	moveq #$46,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8e8e:
	subq.w #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	bsr.w loc_0aa604
	moveq #$47,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8ea4:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($64,a6),($14,a6)
	moveq #$48,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8ec6:
	jmp loc_01b692

;----------------------------------------------
loc_0a8ecc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8eec(pc,d0.w),d1
	jsr loc_0a8eec(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8eec:
	dc.w loc_0a8ef4-loc_0a8eec
	dc.w loc_0a8efc-loc_0a8eec
	dc.w loc_0a8f14-loc_0a8eec
	dc.w loc_0a8f3c-loc_0a8eec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8ef4:
	addq.b #2,(5,a6)
	clr.b ($5b,a6)

loc_0a8efc:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8f12
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a8f12:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8f14:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0a8f3c
	addq.b #2,(5,a6)
	st.b ($5b,a6)
	moveq #7,d0
	move.b ($7e,a6),d1
	jmp loc_0aab44

loc_0a8f3c:
	rts

;----------------------------------------------
loc_0a8f3e:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8f5e(pc,d0.w),d1
	jsr loc_0a8f5e(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8f5e:
	dc.w loc_0a8f62-loc_0a8f5e
	dc.w loc_0a8f82-loc_0a8f5e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8f62:
	movea.w ($36,a6),a4
	tst.b ($5b,a4)
	beq.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l ($40,a6),($54,a6)
	neg.l ($54,a6)
	moveq #$47,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8f82:
	bra.w loc_0a7196

;----------------------------------------------
loc_0a8f86:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a8fa6(pc,d0.w),d1
	jsr loc_0a8fa6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a8fa6:
	dc.w loc_0a8fae-loc_0a8fa6
	dc.w loc_0a8fc6-loc_0a8fa6
	dc.w loc_0a8fe6-loc_0a8fa6
	dc.w loc_0a900a-loc_0a8fa6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8fae:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a8fc4
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a8fc4:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8fc6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a8fe6:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	move.l ($48,a6),($40,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a900a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a9028:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9048(pc,d0.w),d1
	jsr loc_0a9048(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9048:
	dc.w loc_0a9058-loc_0a9048
	dc.w loc_0a9070-loc_0a9048
	dc.w loc_0a9090-loc_0a9048
	dc.w loc_0a90aa-loc_0a9048
	dc.w loc_0a90d8-loc_0a9048
	dc.w loc_0a9132-loc_0a9048
	dc.w loc_0a9144-loc_0a9048
	dc.w loc_0a9162-loc_0a9048

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9058:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a906e
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a906e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9070:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9090:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$45,d0
	jmp loc_0aa630(pc)
	nop

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a90aa:
	tst.b ($35,a6)
	beq.b loc_0a90d2
	addq.b #2,(5,a6)
	clr.b ($35,a6)
	move.l ($48,a6),($40,a6)
	clr.w ($3a,a6)
	clr.b ($5b,a6)
	move.w ($74,a6),($72,a6)
	move.b #1,($3c,a6)

loc_0a90d2:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a90d8:
	tst.b ($3c,a6)
	beq.b loc_0a90ec
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202

loc_0a90ec:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_0a911c
	cmp.b ($5b,a6),d0
	beq.b loc_0a911c
	move.b d0,($5b,a6)
	move.w ($3a,a6),d0
	addi.w #8,d0
	move.b ($7e,a6),d1
	jsr loc_0aab44
	addq.w #1,($3a,a6)
	andi.w #3,($3a,a6)

loc_0a911c:
	tst.b ($35,a6)
	beq.b loc_0a912c
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)

loc_0a912c:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9132:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9144:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l ($44,a6),($40,a6)
	moveq #$46,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9162:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a9180:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a91a0(pc,d0.w),d1
	jsr loc_0a91a0(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a91a0:
	dc.w loc_0a91ae-loc_0a91a0
	dc.w loc_0a91c0-loc_0a91a0
	dc.w loc_0a91e0-loc_0a91a0
	dc.w loc_0a9208-loc_0a91a0
	dc.w loc_0a9228-loc_0a91a0
	dc.w loc_0a9242-loc_0a91a0
	dc.w loc_0a9262-loc_0a91a0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a91ae:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a91be
	addq.b #2,(5,a6)

loc_0a91be:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a91c0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a91e0:
	tst.b ($35,a6)
	beq.b loc_0a9202
	addq.b #2,(5,a6)
	move.w ($14,a6),($64,a6)
	move.w ($72,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	subi.w #$28,($10,a6)

loc_0a9202:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9208:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9228:
	tst.b ($35,a6)
	beq.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l #$10000,($44,a6)
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9242:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	moveq #$46,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9262:
	jmp loc_01b692

;----------------------------------------------
loc_0a9268:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9288(pc,d0.w),d1
	jsr loc_0a9288(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9288:
	dc.w loc_0a9290-loc_0a9288
	dc.w loc_0a92ac-loc_0a9288
	dc.w loc_0a92d2-loc_0a9288
	dc.w loc_0a92e4-loc_0a9288

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9290:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a92a6
	addq.b #2,(5,a6)
	move.w #$60,($3a,a6)

loc_0a92a6:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a92ac:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$47,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a92d2:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a92e4:
	jmp loc_01b692

;----------------------------------------------
loc_0a92ea:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a930a(pc,d0.w),d1
	jsr loc_0a930a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a930a:
	dc.w loc_0a930e-loc_0a930a
	dc.w loc_0a9328-loc_0a930a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a930e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9328:
	jmp loc_01b692

;----------------------------------------------
loc_0a932e:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a934e(pc,d0.w),d1
	jsr loc_0a934e(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a934e:
	dc.w loc_0a9352-loc_0a934e
	dc.w loc_0a936c-loc_0a934e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9352
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a936c:
	jsr loc_01b0c4
	jmp loc_01b692

;----------------------------------------------
loc_0a9378:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9398(pc,d0.w),d1
	jsr loc_0a9398(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9398:
	dc.w loc_0a93a0-loc_0a9398
	dc.w loc_0a93b8-loc_0a9398
	dc.w loc_0a93f8-loc_0a9398
	dc.w loc_0a941e-loc_0a9398

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a93a0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a93b6
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a93b6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a93b8:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0a93f2
	addq.b #2,(5,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$8000,($48,a6)
	move.l ($40,a6),($54,a6)
	neg.l ($54,a6)

loc_0a93f2:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a93f8:
	bsr.w loc_0a7196
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a9418
	addq.b #2,(5,a6)
	move.l ($44,a6),($40,a6)
	move.l ($4c,a6),($48,a6)

loc_0a9418:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a941e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.w ($10,a6),d0
	addi.w #$b0,d0
	cmpi.w #$2e0,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a9444:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9464(pc,d0.w),d1
	jsr loc_0a9464(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9464:
	dc.w loc_0a9468-loc_0a9464
	dc.w loc_0a9488-loc_0a9464

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9468:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #4,($3a,a6)
	move.b #0,($3b,a6)
	bra.b loc_0a9496

loc_0a9488:
	subq.b #1,($3a,a6)
	bpl.w loc_0aa6c4
	move.b #4,($3a,a6)

loc_0a9496:
	addq.b #1,($3b,a6)
	moveq #$46,d0
	btst #0,($3b,a6)
	beq.b loc_0a94a6
	moveq #$47,d0

loc_0a94a6:
	bra.w loc_0aa630

;----------------------------------------------
loc_0a94aa:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a94ca(pc,d0.w),d1
	jsr loc_0a94ca(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a94ca:
	dc.w loc_0a94ce-loc_0a94ca
	dc.w loc_0a94f2-loc_0a94ca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a94ce:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	cmpi.w #$100,($14,a6)
	blt.b loc_0a94f0
	addq.b #2,(5,a6)
	jsr RNGFunction
	andi.w #$1f,d0
	move.w d0,($3a,a6)

loc_0a94f0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a94f2:
	subq.w #1,($3a,a6)
	bpl.b loc_0a9504
	move.b #0,(5,a6)
	move.w #0,($14,a6)

loc_0a9504:
	rts

;----------------------------------------------
loc_0a9506:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9526(pc,d0.w),d1
	jsr loc_0a9526(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9526:
	dc.w loc_0a952e-loc_0a9526
	dc.w loc_0a954c-loc_0a9526
	dc.w loc_0a955e-loc_0a9526
	dc.w loc_0a9572-loc_0a9526

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a952e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$4f,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a954c:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$50,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a955e:
	tst.b ($33,a6)
	bpl.b loc_0a956c
	addq.b #2,(5,a6)
	clr.b ($3a,a6)

loc_0a956c:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9572:
	subq.b #1,($3a,a6)
	bpl.b loc_0a9592
	move.b ($7e,a6),($3a,a6)
	move.w ($72,a6),d0
	move.w ($74,a6),d1
	move.b ($7c,a6),d2
	move.b ($7d,a6),d3
	bsr.w loc_0aa85e

loc_0a9592:
	jmp loc_01b692

;----------------------------------------------
loc_0a9598:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a95b8(pc,d0.w),d1
	jsr loc_0a95b8(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a95b8:
	dc.w loc_0a95be-loc_0a95b8
	dc.w loc_0a95c8-loc_0a95b8
	dc.w loc_0a95ea-loc_0a95b8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a95be:
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)

loc_0a95c8:
	jsr loc_01b0c4
	jsr loc_0a7202
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.b loc_0a95e4
	addq.b #2,(5,a6)

loc_0a95e4:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a95ea:
	bra.w loc_0aa5ca

;----------------------------------------------
loc_0a95ee:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a960e(pc,d0.w),d1
	jsr loc_0a960e(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a960e:
	dc.w loc_0a9614-loc_0a960e
	dc.w loc_0a9622-loc_0a960e
	dc.w loc_0a9632-loc_0a960e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9614:
	addq.b #2,(5,a6)
	subq.b #1,($7e,a6)
	move.b ($7e,a6),($3a,a6)

loc_0a9622:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a9638
	addq.b #2,(5,a6)

loc_0a9632:
	jsr loc_01b0c4

loc_0a9638:
	subq.b #1,($3a,a6)
	bpl.b loc_0a964a
	move.b ($7e,a6),($3a,a6)
	jmp loc_01b692

loc_0a964a:
	rts

;----------------------------------------------
loc_0a964c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a966c(pc,d0.w),d1
	jsr loc_0a966c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a966c:
	dc.w loc_0a9670-loc_0a966c
	dc.w loc_0a9676-loc_0a966c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9670:
	addq.b #2,(5,a6)
	bra.b loc_0a967c

loc_0a9676:
	subq.b #1,($3a,a6)
	bpl.b loc_0a9696

loc_0a967c:
	move.b ($7e,a6),($3a,a6)
	move.w ($72,a6),d0
	move.w ($74,a6),d1
	move.b ($7c,a6),d2
	move.b ($7d,a6),d3
	bsr.w loc_0aa85e

loc_0a9696:
	jmp loc_01b692

;----------------------------------------------
loc_0a969c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a96bc(pc,d0.w),d1
	jsr loc_0a96bc(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a96bc:
	dc.w loc_0a96c8-loc_0a96bc
	dc.w loc_0a96e2-loc_0a96bc
	dc.w loc_0a96fa-loc_0a96bc
	dc.w loc_0a9746-loc_0a96bc
	dc.w loc_0a9784-loc_0a96bc
	dc.w loc_0a9792-loc_0a96bc

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a96c8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a96dc
	addq.b #2,(5,a6)
	clr.b ($67,a6)

loc_0a96dc:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a96e2:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a96f8
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

loc_0a96f8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a96fa:
	tst.b ($35,a6)
	beq.b loc_0a9740
	addq.b #2,(5,a6)
	moveq #$a,d0
	moveq #$58,d1
	move.b ($7e,a6),d2
	jsr loc_082f20
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	movea.l a0,a1
	bsr.w loc_0aa7bc
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6

loc_0a9740:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9746:
	tst.b ($35,a6)
	bne.b loc_0a977e
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	movea.l a0,a1
	bsr.w loc_0aa7fc
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806

loc_0a977e:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9784:
	tst.b ($35,a6)
	beq.b loc_0a9792
	addq.b #2,(5,a6)
	st.b ($67,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9792:
	jmp loc_01b692

;----------------------------------------------
loc_0a9798:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a97b8(pc,d0.w),d1
	jsr loc_0a97b8(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a97b8:
	dc.w loc_0a97c0-loc_0a97b8
	dc.w loc_0a97e6-loc_0a97b8
	dc.w loc_0a9804-loc_0a97b8
	dc.w loc_0a9814-loc_0a97b8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a97c0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a97e0
	addq.b #2,(5,a6)
	move.l #loc_111048,($6a,a6)
	move.l #loc_1cb32a,($60,a6)

loc_0a97e0:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a97e6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a97fe
	addq.b #2,(5,a6)

loc_0a97fe:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9804:
	movea.w ($36,a6),a4
	tst.b ($67,a4)
	bne.b loc_0a9810
	rts

loc_0a9810:
	addq.b #2,(5,a6)

loc_0a9814:
	movea.w ($36,a6),a4
	bra.w loc_0aa6ca

;----------------------------------------------
loc_0a981c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a983c(pc,d0.w),d1
	jsr loc_0a983c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a983c:
	dc.w loc_0a9844-loc_0a983c
	dc.w loc_0a985c-loc_0a983c
	dc.w loc_0a987c-loc_0a983c
	dc.w loc_0a9894-loc_0a983c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9844:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a985a
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a985a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a985c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a987c:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9894:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a98b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a98d2(pc,d0.w),d1
	jsr loc_0a98d2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a98d2:
	dc.w loc_0a98e2-loc_0a98d2
	dc.w loc_0a98fa-loc_0a98d2
	dc.w loc_0a9920-loc_0a98d2
	dc.w loc_0a994a-loc_0a98d2
	dc.w loc_0a99c4-loc_0a98d2
	dc.w loc_0a99de-loc_0a98d2
	dc.w loc_0a99f6-loc_0a98d2
	dc.w loc_0a9a08-loc_0a98d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a98e2:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a98f8
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a98f8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a98fa:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($72,a6),($10,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9920:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	clr.w ($5e,a6)
	move.b #1,($3c,a6)
	bsr.w loc_0a997c
	bne.w loc_0a99b8
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a994a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	addq.w #2,($5e,a6)
	bsr.w loc_0a997c
	bne.w loc_0a99b8
	move.b ($7e,a6),($3a,a6)
	moveq #$43,d0
	bra.w loc_0aa630

loc_0a997c:
	move.w ($5e,a6),d0
	move.w loc_0a99ac(pc,d0.w),d0
	bmi.w loc_0a99a8
	move.w d0,($72,a6)
	moveq #$1,d1
	move.l ($48,a6),d2
	sub.w ($10,a6),d0
	bpl.b loc_0a999c
	moveq #0,d1
	neg.l d2

loc_0a999c:
	move.b d1,($b,a6)
	move.l d2,($40,a6)
	moveq #0,d0
	rts

loc_0a99a8:
	moveq #$1,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a99ac:
	dc.w $0040,$0090,$00f0,$0140,$00c0,$ffff

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a99b8:
	move.b #$a,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a99c4:
	subq.b #1,($3a,a6)
	bpl.b loc_0a99dc
	move.b #6,(5,a6)
	move.b #1,($3c,a6)
	moveq #$42,d0
	bra.w loc_0aa630

loc_0a99dc:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a99de:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a99f6:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9a08:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	cmpi.w #$100,($14,a6)
	bge.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a9a28:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9a48(pc,d0.w),d1
	jsr loc_0a9a48(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9a48:
	dc.w loc_0a9a56-loc_0a9a48
	dc.w loc_0a9a6e-loc_0a9a48
	dc.w loc_0a9a8c-loc_0a9a48
	dc.w loc_0a9aaa-loc_0a9a48
	dc.w loc_0a9adc-loc_0a9a48
	dc.w loc_0a9af8-loc_0a9a48
	dc.w loc_0a9b16-loc_0a9a48

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9a56:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a9a6c
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a9a6c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9a6e:
	jsr loc_01b0c4
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9a8c:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w #4,($3a,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9aaa:
	subq.w #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffffc800,($4c,a6)
	moveq #$45,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9adc:
	jsr loc_01b0c4
	tst.w ($44,a6)
	bpl.b loc_0a9af2
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)

loc_0a9af2:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9af8:
	jsr loc_01b0c4
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$43,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9b16:
	jmp loc_01b692

;----------------------------------------------
loc_0a9b1c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9b3c(pc,d0.w),d1
	jsr loc_0a9b3c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9b3c:
	dc.w loc_0a9b44-loc_0a9b3c
	dc.w loc_0a9b64-loc_0a9b3c
	dc.w loc_0a9b8a-loc_0a9b3c
	dc.w loc_0a9ba4-loc_0a9b3c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9b44:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #3,($3c,a6)
	move.b ($7c,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9b64:
	jsr loc_01b0c4
	jsr loc_0a7202
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7d,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9b8a:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9ba4:
	jmp loc_01b692

;----------------------------------------------
loc_0a9baa:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9bca(pc,d0.w),d1
	jsr loc_0a9bca(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9bca:
	dc.w loc_0a9bd8-loc_0a9bca
	dc.w loc_0a9bf0-loc_0a9bca
	dc.w loc_0a9c10-loc_0a9bca
	dc.w loc_0a9c2e-loc_0a9bca
	dc.w loc_0a9c50-loc_0a9bca
	dc.w loc_0a9c66-loc_0a9bca
	dc.w loc_0a9c84-loc_0a9bca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9bd8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a9bee
	addq.b #2,(5,a6)
	move.b #1,($3c,a6)

loc_0a9bee:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9bf0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$44,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9c10:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w #4,($3a,a6)
	moveq #$48,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9c2e:
	subq.w #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l ($48,a6),($40,a6)
	clr.l ($48,a6)
	move.b #2,($3c,a6)
	moveq #$49,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9c50:
	jsr loc_01b0c4
	tst.w ($44,a6)
	bpl.b loc_0a9c60
	addq.b #2,(5,a6)

loc_0a9c60:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9c66:
	jsr loc_01b0c4
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$4b,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9c84:
	jmp loc_01b692

;----------------------------------------------
loc_0a9c8a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9caa(pc,d0.w),d1
	jsr loc_0a9caa(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9caa:
	dc.w loc_0a9cb6-loc_0a9caa
	dc.w loc_0a9cda-loc_0a9caa
	dc.w loc_0a9cf2-loc_0a9caa
	dc.w loc_0a9d08-loc_0a9caa
	dc.w loc_0a9d26-loc_0a9caa
	dc.w loc_0a9d44-loc_0a9caa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9cb6:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	move.w #4,($3a,a6)
	moveq #$48,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9cda:
	subq.w #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)
	moveq #$49,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9cf2:
	jsr loc_01b0c4
	tst.w ($44,a6)
	bpl.b loc_0a9d02
	addq.b #2,(5,a6)

loc_0a9d02:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9d08:
	jsr loc_01b0c4
	jsr loc_0a723c
	tst.b ($3c,a6)
	bne.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$4a,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9d26:
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.w ($72,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	moveq #$47,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9d44:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bhi.w loc_0aa5ca
	jmp loc_01b692

;----------------------------------------------
loc_0a9d62:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9d82(pc,d0.w),d1
	jsr loc_0a9d82(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9d82:
	dc.w loc_0a9d88-loc_0a9d82
	dc.w loc_0a9da2-loc_0a9d82
	dc.w loc_0a9dbc-loc_0a9d82

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9d88:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7d,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9da2:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9dbc:
	jmp loc_01b692

;----------------------------------------------
loc_0a9dc2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9de2(pc,d0.w),d1
	jsr loc_0a9de2(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9de2:
	dc.w loc_0a9de8-loc_0a9de2
	dc.w loc_0a9df6-loc_0a9de2
	dc.w loc_0a9e34-loc_0a9de2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9de8:
	addq.b #2,(5,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0a9df6:
	bsr.w loc_0a71cc
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0a9e32
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($48,a6),($4c,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	move.b ($d,a6),($31,a6)
	move.w #4,($3a,a6)
	moveq #$55,d0
	bra.w loc_0aa630

loc_0a9e32:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9e34:
	tst.b ($3a,a6)
	beq.b loc_0a9e48
	subq.b #1,($3b,a6)
	bpl.b loc_0a9e54
	move.b ($7e,a6),($d,a6)
	bra.b loc_0a9e54

loc_0a9e48:
	move.b ($31,a6),($d,a6)
	move.b #3,($3b,a6)

loc_0a9e54:
	jsr loc_0a71cc
	jmp loc_01b692

;----------------------------------------------
loc_0a9e60:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9e80(pc,d0.w),d1
	jsr loc_0a9e80(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9e80:
	dc.w loc_0a9e8a-loc_0a9e80
	dc.w loc_0a9ea2-loc_0a9e80
	dc.w loc_0a9eee-loc_0a9e80
	dc.w loc_0a9f2c-loc_0a9e80
	dc.w loc_0a9f3c-loc_0a9e80

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9e8a:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$42,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9ea2:
	tst.b ($35,a6)
	beq.b loc_0a9ee8
	addq.b #2,(5,a6)
	moveq #0,d0
	moveq #$5c,d1
	move.b ($7e,a6),d2
	jsr loc_082f20
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	movea.l a0,a1
	bsr.w loc_0aa7bc
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa7c6

loc_0a9ee8:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9eee:
	tst.b ($35,a6)
	bne.b loc_0a9f26
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w (palrampointer,a5),d0
	lsl.l #8,d0
	movea.l d0,a0
	movea.l a0,a1
	bsr.w loc_0aa7fc
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806
	lea.l ($400,a0),a0
	movea.l a0,a1
	bsr.w loc_0aa806

loc_0a9f26:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9f2c:
	tst.b ($35,a6)
	beq.b loc_0a9f36
	addq.b #2,(5,a6)

loc_0a9f36:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9f3c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$70,d0
	cmpi.w #$260,d0
	bhi.w loc_0aa5ca
	rts

;----------------------------------------------
loc_0a9f56:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0a9f76(pc,d0.w),d1
	jsr loc_0a9f76(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a9f76:
	dc.w loc_0a9f80-loc_0a9f76
	dc.w loc_0a9f90-loc_0a9f76
	dc.w loc_0a9faa-loc_0a9f76
	dc.w loc_0a9fc2-loc_0a9f76
	dc.w loc_0a9fe2-loc_0a9f76

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9f80:
	addq.b #2,(5,a6)
	move.b ($7e,a6),($3a,a6)
	move.b #8,($e,a6)

loc_0a9f90:
	subq.b #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),($3a,a6)
	move.b ($7b,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9faa:
	subq.b #1,($3a,a6)
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7d,a6),d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9fc2:
	subq.b #1,($3a,a6)
	bpl.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.b ($7e,a6),($3a,a6)
	move.b ($7c,a6),d0
	bra.w loc_0aa630

loc_0a9fdc:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0a9fe2:
	subq.b #1,($3a,a6)
	tst.b ($33,a6)
	bpl.w loc_0aa6c4
	move.b #2,(5,a6)
	move.b ($7d,a6),d0
	bra.w loc_0aa630

;----------------------------------------------
loc_0a9ffc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa016(pc,d0.w),d1
	jmp loc_0aa016(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa016:
	dc.w loc_0aa01a-loc_0aa016
	dc.w loc_0aa022-loc_0aa016

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa01a:
	addq.b #2,(5,a6)
	clr.w ($3a,a6)

loc_0aa022:
	addq.b #1,($3a,a6)
	andi.b #3,($3a,a6)
	bne.b loc_0aa04a
	moveq #$69,d2
	jsr RNGFunction
	andi.b #1,d0
	bne.b loc_0aa03e
	moveq #$6a,d2

loc_0aa03e:
	move.w d2,d0
	move.b ($7e,a6),d1
	jsr loc_0aab90

loc_0aa04a:
	rts

;----------------------------------------------
loc_0aa04c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa070(pc,d0.w),d1
	jsr loc_0aa070(pc,d1.w)
	bsr.w loc_0aa756
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa070:
	dc.w loc_0aa078-loc_0aa070
	dc.w loc_0aa094-loc_0aa070
	dc.w loc_0aa0b0-loc_0aa070
	dc.w loc_0aa0f4-loc_0aa070

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa078:
	addq.b #2,(5,a6)
	move.l #$ff3c18,($60,a6)
	move.l #$ff3c14,($5c,a6)
	clr.w (-$43ec,a5)
	bsr.w loc_0aa732

loc_0aa094:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	clr.b ($5b,a6)
	moveq #$41,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa0b0:
	jsr loc_01b692
	btst #1,($35,a6)
	beq.b loc_0aa0ca
	bclr.b #1,($35,a6)
	move.b #4,($32,a6)

loc_0aa0ca:
	btst #2,($35,a6)
	beq.b loc_0aa0e6
	moveq #0,d0
	move.b ($34,a6),d0
	clr.b d0
	tst.b ($b,a6)
	bne.b loc_0aa0e2
	neg.w d0

loc_0aa0e2:
	add.w d0,($10,a6)

loc_0aa0e6:
	btst #3,($35,a6)
	beq.b loc_0aa0f2
	addq.b #2,(5,a6)

loc_0aa0f2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa0f4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;----------------------------------------------
loc_0aa0fe:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa118(pc,d0.w),d1
	jmp loc_0aa118(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa118:
	dc.w loc_0aa11e-loc_0aa118
	dc.w loc_0aa15c-loc_0aa118
	dc.w loc_0aa168-loc_0aa118

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa11e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aa15a
	addq.b #2,(5,a6)
	move.b ($7d,a6),($3a,a6)
	move.l #$ff3c18,($60,a6)
	move.l #$ff3c14,($5c,a6)
	tst.b ($7e,a6)
	beq.b loc_0aa15a
	move.l #$ff3d18,($60,a6)
	move.l #$ff3c16,($5c,a6)

loc_0aa15a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa15c:
	subq.b #1,($3a,a6)
	bmi.b loc_0aa164
	rts

loc_0aa164:
	addq.b #2,(5,a6)

loc_0aa168:
	bsr.w loc_0aa782
	jmp loc_01b4ec

;----------------------------------------------
loc_0aa172:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa196(pc,d0.w),d1
	jsr loc_0aa196(pc,d1.w)
	bsr.w loc_0aa756
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa196:
	dc.w loc_0aa19c-loc_0aa196
	dc.w loc_0aa1b8-loc_0aa196
	dc.w loc_0aa1d0-loc_0aa196

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa19c:
	addq.b #2,(5,a6)
	move.l #$ff3d18,($60,a6)
	move.l #$ff3c16,($5c,a6)
	clr.w (-$43ea,a5)
	bsr.w loc_0aa732

loc_0aa1b8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa1d0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;----------------------------------------------
loc_0aa1da:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa1f4(pc,d0.w),d1
	jmp loc_0aa1f4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa1f4:
	dc.w loc_0aa204-loc_0aa1f4
	dc.w loc_0aa21c-loc_0aa1f4
	dc.w loc_0aa2cc-loc_0aa1f4
	dc.w loc_0aa240-loc_0aa1f4
	dc.w loc_0aa2e2-loc_0aa1f4
	dc.w loc_0aa2e8-loc_0aa1f4
	dc.w loc_0aa318-loc_0aa1f4
	dc.w loc_0aa328-loc_0aa1f4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa204:
	addq.b #2,(5,a6)
	clr.w ($3a,a6)
	clr.b (1,a6)
	st.b ($67,a6)
	move.w #$a,($3a,a6)
	bra.b loc_0aa26a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa21c:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aa264
	addq.b #2,(5,a6)
	move.w #$ffff,d0
	bsr.w loc_0aa344
	move.b #1,(1,a6)
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa240:
	moveq #0,d0
	move.b ($7c,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aa264
	addq.b #2,(5,a6)
	move.w #$ffff,d0
	bsr.w loc_0aa344
	move.b #1,(1,a6)
	jmp loc_01b4ec

loc_0aa264:
	jsr loc_01b692

loc_0aa26a:
	tst.b ($35,a6)
	bmi.b loc_0aa2a2
	beq.b loc_0aa28e
	tst.b ($34,a6)
	beq.b loc_0aa28e
	clr.b ($34,a6)
	move.w #$a,($3a,a6)
	moveq #$66,d0
	move.b ($7e,a6),d1
	jsr loc_0aab90

loc_0aa28e:
	bsr.w loc_0aa334
	move.b ($35,a6),(1,a6)
	beq.b loc_0aa2a0
	jmp loc_01b4ec

loc_0aa2a0:
	rts

loc_0aa2a2:
	move.b #$a,(5,a6)
	move.w #$ffff,d0
	bsr.w loc_0aa344
	move.w ($60,a6),($2c,a5)
	move.b ($7d,a6),($d,a6)
	clr.b ($67,a6)
	move.w ($14,a6),($64,a6)
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa2cc:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aa2dc
	addq.b #2,(5,a6)

loc_0aa2dc:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa2e2:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa2e8:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0aa30c
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	moveq #$46,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

loc_0aa30c:
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa318:
	tst.b ($33,a6)
	bpl.b loc_0aa328
	addq.b #2,(5,a6)
	moveq #$40,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa328:
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa334:
	move.w ($3a,a6),d0
	beq.b loc_0aa340
	subq.w #2,d0
	move.w d0,($3a,a6)

loc_0aa340:
	move.w loc_0aa356(pc,d0.w),d0

loc_0aa344:
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a0
	lea.l ($fe0,a0),a0
	move.w d0,(a0)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa356:
	dc.w $f000,$ff00,$ffff,$ffff,$ffff

;----------------------------------------------
loc_0aa360:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa37a(pc,d0.w),d1
	jmp loc_0aa37a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa37a:
	dc.w loc_0aa386-loc_0aa37a
	dc.w loc_0aa39a-loc_0aa37a
	dc.w loc_0aa3fa-loc_0aa37a
	dc.w loc_0aa42e-loc_0aa37a
	dc.w loc_0aa448-loc_0aa37a
	dc.w loc_0aa470-loc_0aa37a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa386:
	addq.b #2,(5,a6)
	move.l #loc_111048,($6a,a6)
	move.l #loc_1cb32a,($60,a6)

loc_0aa39a:
	movea.w ($36,a6),a4
	tst.b ($67,a4)
	bne.b loc_0aa3e6
	addq.b #2,(5,a6)
	move.b #1,(1,a6)
	move.b ($7e,a6),($d,a6)
	move.l #$20000,($40,a6)
	move.l #0,($48,a6)
	move.l #$88000,($44,a6)
	move.l #$ffffd000,($4c,a6)
	move.w ($14,a6),($64,a6)
	moveq #$51,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

loc_0aa3e6:
	bsr.w loc_0aa6ca
	move.b (1,a4),(1,a6)
	beq.b loc_0aa3f8
	jmp loc_01b4ec

loc_0aa3f8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa3fa:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0aa422
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$52,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

loc_0aa422:
	jsr loc_01b692
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa42e:
	tst.b ($33,a6)
	bpl.b loc_0aa422
	addq.b #2,(5,a6)
	bsr.w loc_0aa604
	moveq #$53,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa448:
	jsr loc_01b0c4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0aa422
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$54,d0
	bsr.w loc_0aa630
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa470:
	jsr loc_01b692
	jmp loc_01b4ec

;----------------------------------------------
loc_0aa47c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa49c(pc,d0.w),d1
	jsr loc_0aa49c(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa49c:
	dc.w loc_0aa4a0-loc_0aa49c
	dc.w loc_0aa4c2-loc_0aa49c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa4a0:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.w loc_0aa6c4
	addq.b #2,(5,a6)
	move.l ($40,a6),($54,a6)
	neg.l ($54,a6)
	moveq #$47,d0
	bra.w loc_0aa630

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa4c2:
	bra.w loc_0a7196

;----------------------------------------------
loc_0aa4c6:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa4e0(pc,d0.w),d1
	jmp loc_0aa4e0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa4e0:
	dc.w loc_0aa4e6-loc_0aa4e0
	dc.w loc_0aa4ec-loc_0aa4e0
	dc.w loc_0aa504-loc_0aa4e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa4e6:
	addq.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa4ec:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	move.w ($c,a4),($c,a6)
	move.b ($d,a4),($38,a6)
	clr.b ($39,a6)

loc_0aa504:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0aa570
	bmi.b loc_0aa570
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	cmp.b ($3c,a6),d0
	beq.b loc_0aa54c
	move.b #3,($3a,a6)
	move.b ($38,a6),($d,a6)
	clr.b ($39,a6)
	move.b d0,($3c,a6)
	movea.l #loc_1cf38a,a0
	jsr loc_01b6e0

loc_0aa54c:
	subq.b #1,($3a,a6)
	bpl.b loc_0aa56a
	move.b #3,($3a,a6)
	move.b ($38,a6),d0
	eori.b #1,($39,a6)
	add.b ($39,a6),d0
	move.b d0,($d,a6)

loc_0aa56a:
	jmp loc_01b4ec

loc_0aa570:
	rts

;----------------------------------------------
loc_0aa572:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	move.b (5,a6),d0
	move.w loc_0aa592(pc,d0.w),d1
	jsr loc_0aa592(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa592:
	dc.w loc_0aa596-loc_0aa592
	dc.w loc_0aa5a0-loc_0aa592

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aa596:
	addq.b #2,(5,a6)
	move.b #8,($e,a6)

loc_0aa5a0:
	jmp loc_01b692

;----------------------------------------------
loc_0aa5a6:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aa5ca
	jsr loc_01b692
	bsr.w loc_0aa83c
	jmp loc_01b4ec

;==============================================
loc_0aa5c4:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa5ca:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa5d2:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($44,a6)
	move.w ($48,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($48,a6)
	move.w ($4c,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($4c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa604:
	move.l #$28000,d0
	moveq #0,d1
	tst.b ($b,a6)
	beq.b loc_0aa616
	neg.l d0
	neg.l d1

loc_0aa616:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$28000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa630:
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w d1,d1
	movea.l loc_0aa644(pc,d1.w),a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa644:
	dc.l loc_146218,loc_152dd4,loc_15c5fc,loc_167ce0
	dc.l loc_1713d8,loc_1856a6,loc_18effc,loc_1a5f1c
	dc.l loc_1af816,loc_1bb422,loc_1ca20e,loc_1de8ae
	dc.l loc_1e94a2,loc_1f1142,loc_1fe392,loc_20d396
	dc.l loc_21be14,loc_229478,loc_146218,loc_146218
	dc.l loc_146218,loc_146218,loc_23fe30,loc_146218
	dc.l loc_24be3a,loc_254b6c,loc_262374,loc_270f46
	dc.l loc_27dc7a,loc_28a2a4,loc_298f3c,loc_2a82a0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa6c4:
	jmp loc_01b692

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa6ca:
	moveq #0,d0
	movea.l ($1c,a4),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	movea.l ($6a,a6),a0
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	tst.b ($b,a4)
	beq.b loc_0aa6f6
	neg.w d0

loc_0aa6f6:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	moveq #0,d1
	tst.b (a0)+
	bpl.b loc_0aa70e
	moveq #4,d1

loc_0aa70e:
	move.b d1,(9,a6)
	move.b (a0)+,d0
	move.b ($b,a4),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a6)
	move.w (a0),d0
	movea.l ($60,a6),a0
	lea.l (a0,d0.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa732:
	movea.l ($60,a6),a0
	moveq #$1f,d6

loc_0aa738:
	move.l ($1c,a6),(a0)
	move.b ($b,a6),(a0)
	move.w ($10,a6),(4,a0)
	move.w ($14,a6),(6,a0)
	lea.l (8,a0),a0
	dbra d6,loc_0aa738
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa756:
	movea.l ($60,a6),a0
	movea.l ($5c,a6),a1
	addi.w #8,(a1)
	andi.w #$00ff,(a1)
	move.w (a1),d0
	move.l ($1c,a6),(a0,d0.w)
	move.b ($b,a6),(a0,d0.w)
	move.w ($10,a6),(4,a0,d0.w)
	move.w ($14,a6),(6,a0,d0.w)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa782:
	movea.l ($60,a6),a0
	movea.l ($5c,a6),a1
	move.w (a1),d0
	moveq #0,d1
	move.b ($7d,a6),d1
	lsl.w #3,d1
	sub.w d1,d0
	andi.w #$ff,d0
	move.b (a0,d0.w),($b,a6)
	move.l (a0,d0.w),d1
	andi.l #$00ffffff,d1
	move.l d1,($1c,a6)
	move.w (4,a0,d0.w),($10,a6)
	move.w (6,a0,d0.w),($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa7bc:
	moveq #4,d6
	lea.l ($a0,a1),a1
	bra.w loc_0aa7c8

loc_0aa7c6:
	moveq #$1f,d6

loc_0aa7c8:
	move.l #$3fff3fff,d5

loc_0aa7ce:
	movem.l (a1),d0-d3
	and.l d5,d0
	and.l d5,d1
	and.l d5,d2
	and.l d5,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a1),d0-d3
	and.l d5,d0
	and.l d5,d1
	and.l d5,d2
	and.l d5,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d6,loc_0aa7ce
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa7fc:
	moveq #4,d6
	lea.l ($a0,a1),a1
	bra.w loc_0aa808

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa806:
	moveq #$1f,d6

loc_0aa808:
	move.l #$f000f000,d5

loc_0aa80e:
	movem.l (a1),d0-d3
	or.l d5,d0
	or.l d5,d1
	or.l d5,d2
	or.l d5,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a1),d0-d3
	or.l d5,d0
	or.l d5,d1
	or.l d5,d2
	or.l d5,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d6,loc_0aa80e
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa83c:
	movea.l #$ff3c0c,a0
	movea.l ($1c,a6),a1
	move.w ($12,a1),d0
	move.b ($13,a1),d0
	move.w d0,(a0)+
	move.w ($10,a6),(a0)+
	move.w ($14,a6),(a0)+
	move.b ($b,a6),(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa85e:
	jsr loc_01c2c8
	beq.b loc_0aa8da
	move.l #$1004b35,(a4)
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)
	move.b ($b,a6),($b,a4)
	move.w ($18,a6),($18,a4)
	move.b #1,($c,a4)
	move.b d3,($d,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$a,($7f,a4)
	move.b #$4c,($70,a4)
	andi.w #$00ff,d2
	lsl.w #4,d2
	move.w loc_0aa8dc(pc,d2.w),($72,a4)
	move.w loc_0aa8dc+2(pc,d2.w),($74,a4)
	move.w loc_0aa8dc+4(pc,d2.w),($40,a4)
	move.w loc_0aa8dc+6(pc,d2.w),($44,a4)
	move.w loc_0aa8dc+8(pc,d2.w),($48,a4)
	move.w loc_0aa8dc+$a(pc,d2.w),($4c,a4)
	move.b loc_0aa8dc+$c(pc,d2.w),(9,a4)

loc_0aa8da:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa8dc:
	dc.w $0110,$0090,$0400,$fe00,$0000,$0000,$0200,$0000
	dc.w $0120,$0000,$0400,$0000,$0000,$0000,$0200,$0000
	dc.w $0058,$0000,$fc00,$0000,$0000,$0000,$0200,$0000

;##############################################
loc_0aa90c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0aa91c(pc,d0.w),d1
	jmp loc_0aa91c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa91c:
	dc.w loc_0aa924-loc_0aa91c
	dc.w loc_0aa94a-loc_0aa91c
	dc.w loc_0aaa06-loc_0aa91c
	dc.w loc_0aaa06-loc_0aa91c

;==============================================
loc_0aa924:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.b loc_0aa932
	rts

loc_0aa932:
	addq.b #2,(4,a6)
	move.b #0,($e,a6)
	clr.w ($6a,a6)
	moveq #$1c,d0
	jsr loc_02fc88
	moveq #0,d0

loc_0aa94a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aaa0c
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0aa966(pc,d0.w),d1
	jmp loc_0aa966(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aa966:
	dc.w loc_0aa96a-loc_0aa966
	dc.w loc_0aa99c-loc_0aa966

;----------------------------------------------
loc_0aa96a:
	movea.l #$ff3c0c,a1
	move.w (a1)+,d0
	tst.w d0
	beq.w loc_0aa9cc
	add.w d0,d0
	add.w d0,d0
	movea.l #loc_0b1910,a0
	move.w (a0,d0.w),d0
	bsr.w loc_0aa9d2
	cmp.w ($6a,a6),d0
	beq.w loc_0aa996
	bsr.w loc_0aa9e0

loc_0aa996:
	jmp loc_01b4ec

;----------------------------------------------
loc_0aa99c:
	movea.l #$ff3c0c,a1
	move.w (a1)+,d0
	tst.w d0
	beq.w loc_0aa9cc
	add.w d0,d0
	add.w d0,d0
	movea.l #loc_0b1910,a0
	move.w (2,a0,d0.w),d0
	bsr.w loc_0aa9d2
	cmp.w ($6a,a6),d0
	beq.b loc_0aa9c6
	bsr.w loc_0aa9e8

loc_0aa9c6:
	jmp loc_01b4ec

loc_0aa9cc:
	clr.w ($6a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa9d2:
	move.w (a1)+,($10,a6)
	move.w (a1)+,($14,a6)
	move.b (a1)+,($b,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aa9e0:
	movea.l #loc_2b55b0,a0
	bra.b loc_0aa9ee

loc_0aa9e8:
	movea.l #loc_2b634e,a0

loc_0aa9ee:
	move.w d0,($6a,a6)
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

;==============================================
loc_0aaa06:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aaa0c:
	move.b #4,(4,a6)
	rts

;##############################################
loc_0aaa14:
	move.b (4,a6),d0
	move.w loc_0aaa20(pc,d0.w),d1
	jmp loc_0aaa20(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aaa20:
	dc.w loc_0aaa28-loc_0aaa20
	dc.w loc_0aaafe-loc_0aaa20
	dc.w loc_0aab36-loc_0aaa20
	dc.w loc_0aab36-loc_0aaa20

;==============================================
loc_0aaa28:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0aaa50(pc,d0.w),d1
	jmp loc_0aaa50(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aaa50:
	dc.w loc_0aaa58-loc_0aaa50
	dc.w loc_0aaa7e-loc_0aaa50
	dc.w loc_0aaa94-loc_0aaa50
	dc.w loc_0aaac8-loc_0aaa50

;----------------------------------------------
loc_0aaa58:
	moveq #$e,d0
	jsr loc_02fc88
	moveq #0,d0
	move.b d0,($b,a6)
	move.b ($70,a6),d0
	andi.w #1,d0
	addi.b #$51,d0
	movea.l #loc_2044b0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0aaa7e:
	movea.w ($36,a6),a4
	move.w ($10,a4),d0
	add.w d0,($10,a6)
	move.w ($14,a4),d0
	add.w d0,($14,a6)
	bra.b loc_0aaa58

;----------------------------------------------
loc_0aaa94:
	movea.w ($36,a6),a4
	move.w ($10,a4),d0
	add.w d0,($10,a6)
	move.w ($14,a4),d0
	add.w d0,($14,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.b ($70,a6),d0
	addi.b #0,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0aaac8:
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b ($70,a6),d0
	lsr.b #1,d0
	move.b loc_0aaae6(pc,d0.w),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aaae6:
	dc.b $01,$02,$03,$05
	dc.b $05,$05,$0a,$24
	dc.b $10,$15,$16,$1e
	dc.b $41,$00,$04,$09
	dc.b $43,$06,$07,$08
	dc.b $1f,$00,$00,$00

;==============================================
loc_0aaafe:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aab3c
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0aab1a(pc,d0.w),d1
	jmp loc_0aab1a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aab1a:
	dc.w loc_0aab22-loc_0aab1a
	dc.w loc_0aab22-loc_0aab1a
	dc.w loc_0aab22-loc_0aab1a
	dc.w loc_0aab22-loc_0aab1a

;----------------------------------------------
loc_0aab22:
	tst.b ($33,a6)
	bmi.w loc_0aab3c
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_0aab36:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aab3c:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aab44:
	andi.w #$ff,d0
	lsl.w #3,d0
	lea.l loc_0aac3c(pc),a3
	lea.l (a3,d0.w),a3
	jsr loc_01c2c8
	beq.b loc_0aab8e
	move.w #$100,(a4)
	move.b #$4d,(2,a4)
	move.w (a3),($10,a4)
	move.w (2,a3),($14,a4)
	move.b (4,a3),(3,a4)
	move.b (5,a3),($70,a4)
	move.b #1,($c,a4)
	move.b d1,($d,a4)
	move.w a6,($36,a4)
	move.b ($79,a6),($79,a4)

loc_0aab8e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aab90:
	jsr loc_01c2c8
	beq.w loc_0aac3a
	move.w #$100,(a4)
	move.b #$4d,(2,a4)
	move.b #3,(3,a4)
	move.b ($79,a6),($79,a4)
	move.b #1,($c,a4)
	andi.b #$1f,d1
	move.b d1,($d,a4)
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w d1,d1
	movea.l #loc_0dd012,a3
	movea.l (a3,d1.w),a3
	movea.l (a3),a3
	move.w (8,a3),d1
	lea.l (a3,d1.w),a3
	andi.w #$ff,d0
	lsl.w #5,d0
	lea.l (a3,d0.w),a3
	move.b ($14,a3),($70,a4)
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
	move.b ($b,a6),($b,a4)
	andi.b #1,($b,a4)
	beq.b loc_0aac22
	neg.w d1

loc_0aac22:
	add.w ($10,a6),d1
	add.w ($14,a6),d2
	move.w d1,($10,a4)
	move.w d2,($14,a4)
	move.b ($b,a3),d0
	eor.b d0,($b,a4)

loc_0aac3a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aac3c:
	dc.w $fff0,$0018,$020a,$0000
	dc.w $fff5,$0045,$020a,$0000
	dc.w $ffe6,$002c,$020a,$0000
	dc.w $fffb,$0059,$020a,$0000
	dc.w $0009,$0024,$020a,$0000
	dc.w $fff6,$0030,$020a,$0000
	dc.w $ff9d,$0047,$020a,$0000
	dc.w $0037,$002f,$020a,$0000
	dc.w $ffb5,$006e,$020a,$0000
	dc.w $004c,$004c,$020a,$0000
	dc.w $ffbb,$0049,$020a,$0000
	dc.w $003f,$0072,$020a,$0000
	dc.w $0032,$0051,$020a,$0000
	dc.w $007a,$005f,$020a,$0000

;##############################################
loc_0aacac:
	move.b (4,a6),d0
	move.w loc_0aacb8(pc,d0.w),d1
	jmp loc_0aacb8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aacb8:
	dc.w loc_0aacc0-loc_0aacb8
	dc.w loc_0aad14-loc_0aacb8
	dc.w loc_0aad9e-loc_0aacb8
	dc.w loc_0aad9e-loc_0aacb8

;==============================================
loc_0aacc0:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.b loc_0aacce
	rts

loc_0aacce:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$2000,($1a,a6)
	moveq #$e,d0
	cmpi.w #8,(Region,a5)
	bne.b loc_0aacf4
	moveq #$f,d0

loc_0aacf4:
	movea.l #loc_301fa2,a0
	jsr loc_01b6e0
	moveq #0,d0
	move.b ($70,a6),d0
	lsl.w #3,d0
	movea.l ($1c,a6),a0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)

;==============================================
loc_0aad14:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0aad28(pc,d0.w),d1
	jsr loc_0aad28(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aad28:
	dc.w loc_0aad2c-loc_0aad28
	dc.w loc_0aad2c-loc_0aad28

;----------------------------------------------
loc_0aad2c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aada4
	move.b (5,a6),d0
	move.w loc_0aad46(pc,d0.w),d1
	jmp loc_0aad46(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aad46:
	dc.w loc_0aad4c-loc_0aad46
	dc.w loc_0aad86-loc_0aad46
	dc.w loc_0aad9c-loc_0aad46

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aad4c:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aad84
	addq.b #2,(5,a6)
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	move.w ($48,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($48,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b #1,($3c,a6)

loc_0aad84:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aad86:
	jsr loc_01b0c4
	jsr loc_0a7202
	tst.b ($3c,a6)
	bne.b loc_0aad9c
	addq.b #2,(5,a6)

loc_0aad9c:
	rts

;==============================================
loc_0aad9e:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aada4:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aadac:
	movea.w ($13a,a5),a0
	move.b ($b,a0),d1
	cmpi.b #1,d0
	beq.w loc_0aadc4
	movea.w ($13c,a5),a0
	eori.b #1,d1

loc_0aadc4:
	move.w ($10,a0),($10,a6)
	move.w ($14,a0),($14,a6)
	move.b ($b,a0),($b,a6)
	move.b ($1a,a0),($1a,a6)
	move.b ($d,a0),($d,a6)
	move.b ($e,a0),($e,a6)
	move.w ($26,a0),($26,a6)
	move.l ($32,a0),($32,a6)
	move.l ($1c,a0),($1c,a6)
	move.b d1,($6a,a6)
	clr.b (1,a0)
	rts

;##############################################
loc_0aae04:
	move.b (4,a6),d0
	move.w loc_0aae10(pc,d0.w),d1
	jmp loc_0aae10(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aae10:
	dc.w loc_0aae18-loc_0aae10
	dc.w loc_0ab45c-loc_0aae10
	dc.w loc_0abe48-loc_0aae10
	dc.w loc_0abe48-loc_0aae10

;==============================================
loc_0aae18:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aae28
	rts

loc_0aae28:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0aae38(pc,d0.w),d1
	jmp loc_0aae38(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aae38:
	dc.w loc_0aae6a-loc_0aae38
	dc.w loc_0aae78-loc_0aae38
	dc.w loc_0aaec4-loc_0aae38
	dc.w loc_0aaf2a-loc_0aae38
	dc.w loc_0aaf8c-loc_0aae38
	dc.w loc_0aafac-loc_0aae38
	dc.w loc_0ab04e-loc_0aae38
	dc.w loc_0ab072-loc_0aae38

	dc.w loc_0ab0a0-loc_0aae38
	dc.w loc_0ab0b2-loc_0aae38
	dc.w loc_0ab0c8-loc_0aae38
	dc.w loc_0ab0f0-loc_0aae38
	dc.w loc_0ab0f8-loc_0aae38
	dc.w loc_0ab0f0-loc_0aae38
	dc.w loc_0ab26c-loc_0aae38
	dc.w loc_0ab28c-loc_0aae38

	dc.w loc_0ab2c4-loc_0aae38
	dc.w loc_0ab36c-loc_0aae38
	dc.w loc_0ab398-loc_0aae38
	dc.w loc_0ab3be-loc_0aae38
	dc.w loc_0ab188-loc_0aae38
	dc.w loc_0ab0a0-loc_0aae38
	dc.w loc_0ab3e2-loc_0aae38
	dc.w loc_0ab406-loc_0aae38

	dc.w loc_0ab452-loc_0aae38

;----------------------------------------------
loc_0aae6a:
	addq.b #2,(4,a6)
	move.w #$60,($3a,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0aae78:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	move.w ($2a,a5),($310,a5)
	move.w ($2c,a5),($314,a5)
	moveq #0,d0
	move.w d0,($312,a5)
	move.w d0,($316,a5)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0aaec4:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	move.b #8,($e,a6)
	move.w ($26,a5),($290,a5)
	move.w ($28,a5),($294,a5)
	move.w ($2a,a5),($310,a5)
	move.w ($2c,a5),($314,a5)
	moveq #0,d0
	move.w d0,($292,a5)
	move.w d0,($296,a5)
	move.w d0,($312,a5)
	move.w d0,($316,a5)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0aaf2a:
	addq.b #2,(4,a6)
	bsr.w loc_0abf4c
	move.w #$fff,($58,a6)
	move.w ($40,a6),($54,a6)
	moveq #0,d0
	move.b ($7f,a6),d0
	add.w d0,d0
	add.w d0,d0
	lea.l loc_351f14,a1
	movea.l (a1,d0.w),a1
	moveq #0,d1
	move.b ($7e,a6),d1
	lsl.w #5,d1
	lsl.w #3,d1
	lea.l (a1,d1.w),a1
	move.l a1,($50,a6)
	moveq #$c,d0
	movea.l #loc_301fa2,a0
	jsr loc_01b6e0
	moveq #0,d1
	move.b ($70,a6),d1
	lsl.w #3,d1
	movea.l ($1c,a6),a0
	lea.l (a0,d1.w),a0
	move.l a0,($1c,a6)
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0aaf8c:
	addq.b #2,(4,a6)
	move.w #$2000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_0987aa,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0aafac:
	addq.b #2,(4,a6)
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	moveq #0,d1
	move.b ($40,a6),d1
	lsl.w #4,d1
	move.w d1,($50,a6)
	moveq #0,d1
	move.b ($41,a6),d1
	lsl.w #4,d1
	move.w d1,($52,a6)
	moveq #0,d1
	move.b ($44,a6),d1
	lsl.w #4,d1
	move.w d1,($54,a6)
	moveq #0,d1
	move.b ($45,a6),d1
	lsl.w #4,d1
	move.w d1,($56,a6)
	moveq #0,d1
	move.b ($10,a6),d1
	lsl.w #4,d1
	move.w d1,($40,a6)
	moveq #0,d1
	move.b ($11,a6),d1
	lsl.w #4,d1
	move.w d1,($42,a6)
	moveq #0,d1
	move.b ($14,a6),d1
	lsl.w #4,d1
	move.w d1,($44,a6)
	moveq #0,d1
	move.b ($15,a6),d1
	lsl.w #4,d1
	move.w d1,($46,a6)
	moveq #0,d1
	move.b ($72,a6),d1
	lsl.w #4,d1
	move.w d1,($48,a6)
	moveq #0,d1
	move.b ($73,a6),d1
	lsl.w #4,d1
	move.w d1,($4a,a6)
	moveq #0,d1
	move.b ($74,a6),d1
	lsl.w #4,d1
	move.w d1,($4c,a6)
	moveq #0,d1
	move.b ($75,a6),d1
	lsl.w #4,d1
	move.w d1,($4e,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab04e:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_0abfd6
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab072:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_0abfd6
	move.l ($48,a6),($50,a6)
	neg.l ($50,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab0a0:
	addq.b #2,(4,a6)
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab0b2:
	addq.b #2,(4,a6)
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	clr.b ($3b,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab0c8:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	moveq #$a,d0
	jsr loc_02fc88
	moveq #0,d0
	movea.l #loc_1ca20e,a0
	jsr loc_01b6e0
	move.w #$700,($3a,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab0f0:
	addq.b #2,(4,a6)
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab0f8:
	tst.b ($7e,a6)
	bne.w loc_0ab188
	jsr loc_01c2c8
	beq.w loc_0ab188
	move.l #$1004f14,(a4)
	move.w a6,($36,a4)
	move.b ($7f,a6),($7f,a4)
	move.w ($78,a6),($78,a4)
	move.b ($70,a6),($70,a4)
	move.b ($c,a6),($c,a4)
	move.b ($d,a6),($d,a4)
	move.b (9,a6),(9,a4)
	move.b #0,($7d,a4)
	move.b #0,($7e,a4)
	jsr loc_01c2c8
	beq.w loc_0ab188
	move.l #$1004f14,(a4)
	move.w a6,($36,a4)
	move.b ($7f,a6),($7f,a4)
	move.w ($78,a6),($78,a4)
	move.b ($70,a6),($70,a4)
	move.b ($c,a6),($c,a4)
	move.b ($d,a6),($d,a4)
	move.b (9,a6),(9,a4)
	move.b #1,($7d,a4)
	move.b #0,($7e,a4)

;----------------------------------------------
loc_0ab188:
	addq.b #2,(4,a6)
	move.w ($40,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($40,a6)
	move.w ($44,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($44,a6)
	move.w #$6000,($1a,a6)
	lea.l loc_2f40ce,a0
	moveq #0,d0
	move.b ($70,a6),d0
	tst.b ($7e,a6)
	beq.w loc_0ab1ca
	movea.l #loc_2e50a0,a0
	move.w #$6000,($1a,a6)

loc_0ab1ca:
	jsr loc_01b6e0
	move.l ($10,a6),($50,a6)
	move.l ($14,a6),($54,a6)
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w d1,d1
	move.w loc_0ab21e(pc,d1.w),($48,a6)
	move.w loc_0ab21e+2(pc,d1.w),($4c,a6)
	moveq #0,d0
	cmpi.b #$14,(3,a6)
	bne.w loc_0ab45c
	tst.b ($7e,a6)
	bne.w loc_0ab45c
	bsr.w loc_0ab23e
	tst.b ($7d,a6)
	beq.w loc_0ab21a
	neg.w ($48,a6)
	neg.w ($4c,a6)

loc_0ab21a:
	bra.w loc_0ab45c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab21e:
	dc.w $0000,$0002
	dc.w $0002,$0001
	dc.w $0002,$0000
	dc.w $0002,$ffff
	dc.w $0000,$fffe
	dc.w $fffe,$ffff
	dc.w $fffe,$0000
	dc.w $fffe,$0001

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ab23e:
	move.w loc_0ab24c(pc,d1.w),($48,a6)
	move.w loc_0ab24c+2(pc,d1.w),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab24c:
	dc.w $0000,$0004
	dc.w $0004,$0000
	dc.w $0004,$0000
	dc.w $0004,$0000
	dc.w $0000,$fffc
	dc.w $fffc,$0000
	dc.w $fffc,$0000
	dc.w $fffc,$0000

;----------------------------------------------
loc_0ab26c:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f2de8,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab28c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	move.w #$c0,($10,a6)
	move.w #$20,($14,a6)
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab2c4:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)
	movea.w ($13c,a5),a4
	move.w ($1a,a4),($1a,a6)
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	bsr.w loc_0ab30a
	add.w d1,d1
	movea.l #CharAniPNTtable,a0
	movea.l (a0,d1.w),a0
	movea.l (4,a0),a0
	moveq #$24,d0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ab30a:
	movea.l #loc_32c094,a0
	move.w (a0,d1.w),d2
	lea.l (a0,d2.w),a0
	lea.l ($140,a0),a0
	moveq #0,d2
	move.w (palrampointer,a5),d2
	lsl.l #8,d2
	movea.l d2,a1
	moveq #0,d2
	move.b ($d,a6),d2
	lsl.w #5,d2
	lea.l (a1,d2.w),a1
	move.l (a1),d0
	andi.l #$f000f000,d0
	movem.l (a0)+,d2-d5
	or.l d0,d2
	or.l d0,d3
	or.l d0,d4
	or.l d0,d5
	movem.l d2-d5,(a1)
	lea.l ($10,a1),a1
	move.l (a1),d0
	andi.l #$f000f000,d0
	movem.l (a0)+,d2-d5
	or.l d0,d2
	or.l d0,d3
	or.l d0,d4
	or.l d0,d5
	movem.l d2-d5,(a1)
	lea.l ($10,a1),a1
	rts

;----------------------------------------------
loc_0ab36c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab398:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2ed7ae,a0
	move.w (a0),d1
	lea.l (a0,d1.w),a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab3be:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	move.w #$6000,($1a,a6)
	move.b ($70,a6),d0
	movea.l #loc_2f4284,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab3e2:
	addq.b #2,(4,a6)
	moveq #$e,d0
	jsr loc_02fc88
	moveq #0,d0
	move.b ($70,a6),d0
	movea.l #loc_2044b0,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab406:
	addq.b #2,(4,a6)
	bsr.w loc_0abfd6
	move.w ($14,a6),($16,a6)
	move.b ($d,a6),($6b,a6)
	moveq #2,d0
	bsr.w loc_0aadac
	move.w ($16,a6),($14,a6)
	move.b ($6a,a6),($b,a6)
	move.b ($6b,a6),($d,a6)
	moveq #$a,d0
	jsr loc_02fc88
	moveq #0,d0
	move.b ($70,a6),d0
	movea.l #loc_1ca20e,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ab45c

;----------------------------------------------
loc_0ab452:
	tst.b ($bb,a5)
	beq.w loc_0abf72
	moveq #0,d0

;==============================================
loc_0ab45c:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0ab46c(pc,d0.w),d1
	jmp loc_0ab46c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab46c:
	dc.w loc_0ab49e-loc_0ab46c
	dc.w loc_0ab4ce-loc_0ab46c
	dc.w loc_0ab502-loc_0ab46c
	dc.w loc_0ab53c-loc_0ab46c
	dc.w loc_0ab5a8-loc_0ab46c
	dc.w loc_0ab5bc-loc_0ab46c
	dc.w loc_0ab5fe-loc_0ab46c
	dc.w loc_0ab64c-loc_0ab46c

	dc.w loc_0ab782-loc_0ab46c
	dc.w loc_0ab818-loc_0ab46c
	dc.w loc_0ab8d2-loc_0ab46c
	dc.w loc_0ab96a-loc_0ab46c
	dc.w loc_0ab9e0-loc_0ab46c
	dc.w loc_0aba6c-loc_0ab46c
	dc.w loc_0abb36-loc_0ab46c
	dc.w loc_0abb4a-loc_0ab46c

	dc.w loc_0abb88-loc_0ab46c
	dc.w loc_0abbaa-loc_0ab46c
	dc.w loc_0abb36-loc_0ab46c
	dc.w loc_0abc04-loc_0ab46c
	dc.w loc_0abc54-loc_0ab46c
	dc.w loc_0abc84-loc_0ab46c
	dc.w loc_0abd76-loc_0ab46c
	dc.w loc_0abda4-loc_0ab46c

	dc.w loc_0abe32-loc_0ab46c

;----------------------------------------------
loc_0ab49e:
	subq.b #1,($3b,a6)
	bmi.w loc_0abf72
	addq.b #1,($3a,a6)
	andi.b #3,($3a,a6)
	bne.w loc_0ab4cc
	moveq #$69,d2
	jsr RNGFunction
	andi.w #1,d0
	bne.w loc_0ab4c6
	moveq #$6a,d2

loc_0ab4c6:
	move.w d2,d0
	bra.w loc_0ac008

loc_0ab4cc:
	rts

;----------------------------------------------
loc_0ab4ce:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($40,a6),d1
	add.l d1,($310,a5)
	move.w ($310,a5),($2a,a5)
	bsr.w loc_0abf7a
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_0ab502:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.l ($44,a6),d0
	sub.l d0,($294,a5)
	move.w ($294,a5),($28,a5)
	move.l ($40,a6),d1
	add.l d1,($310,a5)
	move.w ($310,a5),($2a,a5)
	bsr.w loc_0abf7a
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_0ab53c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab55c(pc,d0.w),d1
	jsr loc_0ab55c(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab55c:
	dc.w loc_0ab566-loc_0ab55c
	dc.w loc_0ab578-loc_0ab55c
	dc.w loc_0ab582-loc_0ab55c
	dc.w loc_0ab59c-loc_0ab55c
	dc.w loc_0ab5a6-loc_0ab55c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab566:
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab574

loc_0ab572:
	rts

loc_0ab574:
	addq.b #2,(5,a6)

loc_0ab578:
	bsr.w loc_0abea6
	bne.b loc_0ab572
	addq.b #2,(5,a6)

loc_0ab582:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab592
	rts

loc_0ab592:
	move.w #$f,($58,a6)
	addq.b #2,(5,a6)

loc_0ab59c:
	bsr.w loc_0abe4e
	bne.b loc_0ab572
	addq.b #2,(5,a6)

loc_0ab5a6:
	rts

;----------------------------------------------
loc_0ab5a8:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	jmp loc_01b4d0

;----------------------------------------------
loc_0ab5bc:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	subq.b #1,($3a,a6)
	bpl.w loc_0ab5fc
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	moveq #0,d1
	move.b ($3b,a6),d1
	addq.w #4,d1
	cmpi.w #$18,d1
	blt.b loc_0ab5ec
	moveq #0,d1

loc_0ab5ec:
	move.b d1,($3b,a6)
	move.w ($40,a6,d1.w),($26,a5)
	move.w ($42,a6,d1.w),($28,a5)

loc_0ab5fc:
	rts

;----------------------------------------------
loc_0ab5fe:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab61e(pc,d0.w),d1
	jsr loc_0ab61e(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab61e:
	dc.w loc_0ab622-loc_0ab61e
	dc.w loc_0ab63a-loc_0ab61e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab622:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab636
	jmp loc_01b0c4

loc_0ab636:
	addq.b #2,(5,a6)

loc_0ab63a:
	move.l ($40,a6),d1
	add.l d1,($10,a6)
	move.l ($44,a6),d1
	add.l d1,($14,a6)
	rts

;----------------------------------------------
loc_0ab64c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab66c(pc,d0.w),d1
	jsr loc_0ab66c(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab66c:
	dc.w loc_0ab674-loc_0ab66c
	dc.w loc_0ab6ac-loc_0ab66c
	dc.w loc_0ab6d0-loc_0ab66c
	dc.w loc_0ab776-loc_0ab66c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab674:
	move.w ($10,a6),d1
	move.w ($72,a6),d2
	tst.l ($40,a6)
	bpl.w loc_0ab686
	exg.l d1,d2

loc_0ab686:
	cmp.w d1,d2
	ble.w loc_0ab6a8
	move.l ($40,a6),d1
	add.l d1,($10,a6)
	move.l ($44,a6),d1
	add.l d1,($14,a6)
	move.l ($48,a6),d1
	add.l d1,($14,a6)
	bra.w loc_0abfa8

loc_0ab6a8:
	addq.b #2,(5,a6)

loc_0ab6ac:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab6c6
	move.l ($48,a6),d1
	add.l d1,($14,a6)
	bra.w loc_0abfa8

loc_0ab6c6:
	addq.b #2,(5,a6)
	move.w #$b,($3a,a6)

loc_0ab6d0:
	subq.b #1,($3a,a6)
	bpl.w loc_0ab766
	move.b #4,($3a,a6)
	subq.b #1,($3b,a6)
	bmi.w loc_0ab772
	jsr loc_01c2c8
	beq.w loc_0ab766
	addq.b #1,(a4)
	move.w #$4d02,(2,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b #$50,($70,a4)
	move.b #0,($d,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)
	move.w #$ffeb,($10,a4)
	move.w #$ffea,($14,a4)
	jsr loc_01c2c8
	beq.w loc_0ab766
	addq.b #1,(a4)
	move.w #$4d02,(2,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b #$50,($70,a4)
	move.b #0,($d,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)
	move.w #$15,($10,a4)
	move.w #$ffea,($14,a4)

loc_0ab766:
	move.l ($48,a6),d1
	add.l d1,($14,a6)
	bra.w loc_0abfa8

loc_0ab772:
	addq.b #2,(5,a6)

loc_0ab776:
	move.l ($48,a6),d1
	add.l d1,($14,a6)
	bra.w loc_0abfa8

;----------------------------------------------
loc_0ab782:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	subq.b #1,($3a,a6)
	bpl.w loc_0ab816
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	moveq #0,d6
	move.b ($7e,a6),d6
	movea.l #loc_05dbb4,a0
	jsr RNGFunction
	andi.w #$3f,d0
	move.w d0,d3
	add.w d0,d0
	add.w d0,d0
	move.w (a0,d0.w),d4
	asr.w #4,d4
	asr.w d6,d4
	jsr RNGFunction
	andi.w #$3f,d0
	add.w d0,d3
	add.w d0,d0
	add.w d0,d0
	move.w (2,a0,d0.w),d5
	asr.w #4,d5
	asr.w d6,d5
	andi.w #1,d3
	jsr loc_01c2c8
	beq.w loc_0ab816
	addq.b #1,(a4)
	move.w #$4d01,(2,a4)
	move.w d4,($10,a4)
	move.w d5,($14,a4)
	move.w a6,($36,a4)
	move.b d3,($70,a4)
	move.b #$ff,($c,a4)
	move.b ($d,a6),($d,a4)
	move.b ($79,a6),($79,a4)

loc_0ab816:
	rts

;----------------------------------------------
loc_0ab818:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab832(pc,d0.w),d1
	jmp loc_0ab832(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab832:
	dc.w loc_0ab836-loc_0ab832
	dc.w loc_0ab84a-loc_0ab832

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab836:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab846
	rts

loc_0ab846:
	addq.b #2,(5,a6)

loc_0ab84a:
	subq.b #1,($3a,a6)
	bpl.w loc_0ab8b0
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	moveq #0,d1
	move.b ($3b,a6),d1
	addq.b #4,($3b,a6)
	cmpi.b #$20,($3b,a6)
	bgt.w loc_0abf72
	jsr loc_01c2c8
	beq.w loc_0ab8b0
	addq.b #1,(a4)
	move.w #$4d02,(2,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b ($70,a6),($70,a4)
	move.b ($d,a6),($d,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)
	move.w loc_0ab8b2(pc,d1.w),($10,a4)
	move.w loc_0ab8b2+2(pc,d1.w),($14,a4)

loc_0ab8b0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab8b2:
	dc.w $0168,$00c0
	dc.w $014a,$00bc
	dc.w $0120,$00b8
	dc.w $0104,$00b0
	dc.w $00ce,$00c4
	dc.w $00a2,$00c8
	dc.w $0058,$00b0
	dc.w $0028,$00cc

;----------------------------------------------
loc_0ab8d2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab8f2(pc,d0.w),d1
	jsr loc_0ab8f2(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab8f2:
	dc.w loc_0ab8f8-loc_0ab8f2
	dc.w loc_0ab910-loc_0ab8f2
	dc.w loc_0ab95c-loc_0ab8f2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab8f8:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ab90c
	jmp loc_01b692

loc_0ab90c:
	addq.b #2,(5,a6)

loc_0ab910:
	subq.b #1,($3a,a6)
	bpl.w loc_0ab942
	move.b #5,($3a,a6)
	moveq #0,d1
	move.b ($3b,a6),d1
	addq.b #1,($3b,a6)
	cmpi.b #8,($3b,a6)
	bgt.w loc_0ab958
	move.b loc_0ab950(pc,d1.w),d0
	movea.l #loc_1ca3b4,a0
	jsr loc_01b6e0

loc_0ab942:
	move.l ($40,a6),d1
	add.l d1,($10,a6)
	jmp loc_01b692

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab950:
	dc.b $01,$04,$02,$05
	dc.b $03,$06,$03,$06

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab958:
	addq.b #2,(5,a6)

loc_0ab95c:
	move.l ($40,a6),d1
	add.l d1,($10,a6)
	jmp loc_01b692

;----------------------------------------------
loc_0ab96a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0ab984(pc,d0.w),d1
	jmp loc_0ab984(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ab984:
	dc.w loc_0ab988-loc_0ab984
	dc.w loc_0ab9de-loc_0ab984

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ab988:
	lea.l loc_0ac146(pc),a1
	moveq #0,d5
	moveq #5,d6
	cmpi.b #6,($6eb9,a5)
	blt.w loc_0ab9de
	addq.b #2,(5,a6)

loc_0ab99e:
	jsr loc_01c2c8
	beq.w loc_0ab9de
	addq.b #1,(a4)
	move.w #$4d01,(2,a4)
	move.w (a1,d5.w),($10,a4)
	move.w (2,a1,d5.w),($14,a4)
	move.w a6,($36,a4)
	move.b #$51,($70,a4)
	move.b #$ff,($c,a4)
	move.b ($d,a6),($d,a4)
	move.b ($79,a6),($79,a4)
	addq.w #4,d5
	dbra d6,loc_0ab99e

loc_0ab9de:
	rts

;----------------------------------------------
loc_0ab9e0:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0aba00(pc,d0.w),d1
	jsr loc_0aba00(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aba00:
	dc.w loc_0aba04-loc_0aba00
	dc.w loc_0aba44-loc_0aba00

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aba04:
	move.w ($50,a6),d1
	move.w ($72,a6),d2
	move.l ($40,a6),d3
	bpl.w loc_0aba16
	exg.l d1,d2

loc_0aba16:
	cmp.w d1,d2
	blt.w loc_0aba40
	move.w ($54,a6),d1
	move.w ($74,a6),d2
	move.l ($44,a6),d4
	bpl.w loc_0aba2e
	exg.l d1,d2

loc_0aba2e:
	cmp.w d1,d2
	blt.w loc_0aba40
	add.l d3,($50,a6)
	add.l d4,($54,a6)
	bra.w loc_0aba44

loc_0aba40:
	addq.b #2,(5,a6)

loc_0aba44:
	move.w ($48,a6),d1
	move.w ($4c,a6),d2
	eori.b #1,($3a,a6)
	beq.w loc_0aba5a
	neg.w d1
	neg.w d2

loc_0aba5a:
	add.w ($50,a6),d1
	add.w ($54,a6),d2
	move.w d1,($10,a6)
	move.w d2,($14,a6)
	rts

;----------------------------------------------
loc_0aba6c:
	addq.b #2,(4,a6)
	movea.l (-$5162,a5),a1
	moveq #-1,d0
	moveq #-1,d1
	moveq #-1,d2
	moveq #-1,d3
	moveq #-1,d4
	moveq #-1,d5
	moveq #-1,d6
	movea.l d0,a2
	bsr.w loc_0abae0
	moveq #-1,d0
	moveq #-1,d1
	moveq #-1,d2
	moveq #-1,d3
	moveq #-1,d4
	moveq #-1,d5
	moveq #-1,d6
	movea.l d0,a2
	moveq #$b,d7

loc_0aba9a:
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_0aba9a
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abae0:
	moveq #$1c,d7
	bsr.w loc_0abb28
	movea.l #loc_33bff4,a0
	bsr.w loc_0abaf8
	lea.l ($20,a0),a0
	bsr.w loc_0abaf8

loc_0abaf8:
	move.l #$f000f000,d4
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

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abb28:
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_0abb28
	rts

;----------------------------------------------
loc_0abb36:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	jmp loc_01b4d0

;----------------------------------------------
loc_0abb4a:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0abb6a(pc,d0.w),d1
	jsr loc_0abb6a(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0abb6a:
	dc.w loc_0abb6e-loc_0abb6a
	dc.w loc_0abb86-loc_0abb6a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abb6e:
	addq.w #6,($14,a6)
	cmpi.w #$80,($14,a6)
	bge.w loc_0abb82
	subq.w #4,(-$50ce,a5)
	rts

loc_0abb82:
	addq.b #2,(5,a6)

loc_0abb86:
	rts

;----------------------------------------------
loc_0abb88:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.l ($44,a6),d1
	add.l d1,($14,a6)
	jsr loc_0abf7a(pc)
	nop
	jmp loc_01b4d0

;----------------------------------------------
loc_0abbaa:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0abbc4(pc,d0.w),d1
	jmp loc_0abbc4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0abbc4:
	dc.w loc_0abbca-loc_0abbc4
	dc.w loc_0abbe2-loc_0abbc4
	dc.w loc_0abbfe-loc_0abbc4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abbca:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abbde

loc_0abbd8:
	jmp loc_01b4d0

loc_0abbde:
	addq.b #2,(5,a6)

loc_0abbe2:
	moveq #0,d0
	move.b ($7b,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abbfa
	eori.b #1,($3a,a6)
	beq.b loc_0abbd8
	rts

loc_0abbfa:
	addq.b #2,(5,a6)

loc_0abbfe:
	jmp loc_01b4d0

;----------------------------------------------
loc_0abc04:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0abc24(pc,d0.w),d1
	jsr loc_0abc24(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0abc24:
	dc.w loc_0abc28-loc_0abc24
	dc.w loc_0abc3c-loc_0abc24

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abc28:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abc38
	rts

loc_0abc38:
	addq.b #2,(5,a6)

loc_0abc3c:
	move.l ($44,a6),d1
	add.l d1,($14,a6)
	move.l ($40,a6),d1
	add.l d1,($214,a5)
	move.w ($214,a5),($24,a5)
	rts

;----------------------------------------------
loc_0abc54:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	movea.w ($36,a6),a0
	move.w ($10,a0),d1
	add.w ($4c,a6),d1
	move.w d1,($10,a6)
	move.w ($14,a0),d1
	add.w ($48,a6),d1
	move.w d1,($14,a6)
	jmp loc_01b4d0

;----------------------------------------------
loc_0abc84:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	subq.b #1,($3a,a6)
	bpl.w loc_0abd74
	move.b ($7f,a6),($3a,a6)
	subq.b #1,($3a,a6)
	movea.w ($36,a6),a0
	cmpi.w #$4f07,(2,a0)
	bne.w loc_0abf72
	move.w ($10,a0),d2
	move.w ($14,a0),d3
	moveq #0,d4
	jsr loc_01c2c8
	beq.w loc_0ab816
	addq.b #1,(a4)
	move.w #$4f16,(2,a4)
	move.w d2,($10,a4)
	move.w d3,($14,a4)
	addi.w #$c,($10,a4)
	subi.w #$10,($14,a4)
	move.b #$53,($70,a4)
	move.b #$ff,($c,a4)
	move.b ($7e,a6),($d,a4)
	move.b ($79,a6),($79,a4)
	move.b (9,a6),(9,a4)
	move.l #$ffff8000,($44,a4)
	move.l #$ffffb800,($4c,a4)
	move.l d4,($40,a4)
	move.l d4,($48,a4)
	jsr loc_01c2c8
	beq.w loc_0ab816
	addq.b #1,(a4)
	move.w #$4f16,(2,a4)
	move.w d2,($10,a4)
	move.w d3,($14,a4)
	subi.w #$c,($10,a4)
	subi.w #$10,($14,a4)
	move.b #$53,($70,a4)
	move.b #$ff,($c,a4)
	move.b ($7e,a6),($d,a4)
	move.b ($79,a6),($79,a4)
	move.b (9,a6),(9,a4)
	move.l #$ffff8000,($44,a4)
	move.l #$ffffb800,($4c,a4)
	move.l d4,($40,a4)
	move.l d4,($48,a4)

loc_0abd74:
	rts

;----------------------------------------------
loc_0abd76:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.l ($44,a6),d1
	add.l ($4c,a6),d1
	move.l d1,($44,a6)
	add.l d1,($14,a6)
	cmpi.w #$60,($14,a6)
	blt.w loc_0abf72
	jmp loc_01b4d0

;----------------------------------------------
loc_0abda4:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0abf72
	move.b (5,a6),d0
	move.w loc_0abdc4(pc,d0.w),d1
	jsr loc_0abdc4(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0abdc4:
	dc.w loc_0abdca-loc_0abdc4
	dc.w loc_0abde2-loc_0abdc4
	dc.w loc_0abe20-loc_0abdc4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abdca:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0abde0
	addq.b #2,(5,a6)
	move.b #2,($3c,a6)

loc_0abde0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abde2:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($74,a6),d1
	cmp.w ($14,a6),d1
	ble.w loc_0abe1a
	addq.b #2,(5,a6)
	move.l ($40,a6),($44,a6)
	move.l ($48,a6),($4c,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l ($44,a6),($50,a6)
	neg.l ($50,a6)

loc_0abe1a:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0abe20:
	add.l ($44,a6),d1
	add.l d1,($14,a6)
	bsr.w loc_0abf7a
	jmp loc_01b692

;----------------------------------------------
loc_0abe32:
	move.w #$200,($290,a5)
	move.w #$200,($26,a5)
	move.w #$200,($4e,a5)
	bra.w loc_0abf72

;==============================================
loc_0abe48:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abe4e:
	move.w #$f,d7
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a0
	lea.l ($200,a0),a1
	moveq #7,d5

loc_0abe62:
	moveq #$f,d6

loc_0abe64:
	move.w (a1),d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_0abe70
	addq.w #1,d0

loc_0abe70:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_0abe7c
	addq.w #1,d0

loc_0abe7c:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_0abe88
	addq.w #1,d0

loc_0abe88:
	ror.w #4,d0
	move.w d0,d1
	and.w d7,d1
	cmp.w d7,d1
	beq.b loc_0abe94
	addq.w #1,d0

loc_0abe94:
	ror.w #4,d0
	move.w d0,(a1)+
	dbra d6,loc_0abe64
	dbra d5,loc_0abe62
	subq.w #1,($54,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abea6:
	move.w ($54,a6),d4
	move.w d4,($56,a6)
	add.w d4,($58,a6)
	move.b ($58,a6),($5a,a6)
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a0
	lea.l ($200,a0),a1
	movea.l ($50,a6),a0
	bsr.b loc_0abed2
	tst.b ($58,a6)
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abed2:
	moveq #7,d7

loc_0abed4:
	swap d7
	move.w #$f,d7

loc_0abeda:
	move.w (a1),d0
	move.w d0,d1
	andi.w #$f00,d1
	move.w d0,d2
	andi.w #$f0,d2
	move.w d0,d3
	andi.w #$f,d3
	move.w (a0)+,d5
	swap d0
	move.w #0,d0
	move.b ($5a,a6),d0
	move.w d5,d6
	andi.w #$f,d6
	bsr.b loc_0abf36
	move.w d6,d3
	lsl.w #4,d0
	move.w d5,d6
	andi.w #$f0,d6
	bsr.b loc_0abf36
	move.w d6,d2
	lsl.w #4,d0
	move.w d5,d6
	andi.w #$f00,d6
	bsr.b loc_0abf36
	move.w d6,d1
	swap d0
	andi.w #$f000,d0
	or.w d1,d0
	or.w d2,d0
	or.w d3,d0
	move.w d0,(a1)+
	dbra d7,loc_0abeda
	swap d7
	dbra d7,loc_0abed4
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abf36:
	tst.w ($56,a6)
	bmi.b loc_0abf44
	cmp.w d6,d0
	bcc.b loc_0abf4a
	move.w d0,d6
	bra.b loc_0abf4a

loc_0abf44:
	cmp.w d6,d0
	bls.b loc_0abf4a
	move.w d0,d6

loc_0abf4a:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abf4c:
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a1
	lea.l ($200,a1),a1
	moveq #$f,d6

loc_0abf5c:
	moveq #-1,d0
	moveq #-1,d1
	moveq #-1,d2
	moveq #-1,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d6,loc_0abf5c
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abf72:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abf7a:
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($44,a6),d0
	move.l ($50,a6),d1
	tst.b ($4c,a6)
	bpl.b loc_0abf94
	neg.l d0
	neg.l d1

loc_0abf94:
	cmp.l d0,d1
	bgt.b loc_0abfa6
	move.l ($50,a6),($44,a6)
	neg.l ($4c,a6)
	neg.l ($50,a6)

loc_0abfa6:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abfa8:
	move.l ($4c,a6),d0
	add.l d0,($48,a6)
	move.l ($48,a6),d0
	move.l ($50,a6),d1
	tst.b ($4c,a6)
	bpl.b loc_0abfc2
	neg.l d0
	neg.l d1

loc_0abfc2:
	cmp.l d0,d1
	bgt.b loc_0abfd4
	move.l ($50,a6),($48,a6)
	neg.l ($4c,a6)
	neg.l ($50,a6)

loc_0abfd4:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0abfd6:
	move.w ($40,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($40,a6)
	move.w ($44,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($44,a6)
	move.w ($48,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($48,a6)
	move.w ($4c,a6),d1
	ext.l d1
	asl.l #8,d1
	move.l d1,($4c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ac008:
	andi.w #$ff,d0
	lsl.w #5,d0
	lea.l loc_104aaa,a3
	adda.w (8,a3),a3
	lea.l (a3,d0.w),a3
	jsr loc_01c2c8
	beq.w loc_0ac082
	move.l #$1004d02,(a4)
	move.w a6,($36,a4)
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
	move.b ($b,a6),($b,a4)
	andi.b #1,($b,a4)
	move.w d1,($10,a4)
	move.w d2,($14,a4)
	move.b ($70,a6),($70,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b ($d,a6),($d,a4)

loc_0ac082:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ac084:
	moveq #4,d6
	moveq #0,d5
	lea.l loc_0ac128(pc),a1

loc_0ac08c:
	jsr loc_01c2c8
	beq.w loc_0ac126
	addq.b #1,(a4)
	move.w #$4900,(2,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b #0,($d,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)
	move.w (a1,d5.w),d1
	move.w (2,a1,d5.w),($14,a4)
	move.b (5,a1,d5.w),($70,a4)
	add.w ($10,a6),d1
	move.w d1,($10,a4)
	jsr loc_01c2c8
	beq.w loc_0ac126
	addq.b #1,(a4)
	move.w #$4900,(2,a4)
	move.w ($78,a6),($78,a4)
	move.b #$ff,($c,a4)
	move.b #0,($d,a4)
	move.b ($b,a6),($b,a4)
	move.w a6,($36,a4)
	move.w (a1,d5.w),d1
	move.w (2,a1,d5.w),($14,a4)
	move.b (5,a1,d5.w),($70,a4)
	neg.w d1
	add.w ($10,a6),d1
	move.w d1,($10,a4)
	eori.b #1,($b,a4)
	addq.w #6,d5
	dbra d6,loc_0ac08c

loc_0ac126:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac128:
	dc.w $0050,$0078,$005c,$0048
	dc.w $0088,$005b,$0040,$0094
	dc.w $005a,$0038,$009c,$0059
	dc.w $0030,$00a0,$0058

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac146:
	dc.w $ffd1,$001c
	dc.w $0008,$0034
	dc.w $0000,$000c
	dc.w $ffe0,$fff4
	dc.w $0038,$0004
	dc.w $0020,$ffec

;##############################################
loc_0ac15e:
	move.b (4,a6),d0
	move.w loc_0ac16a(pc,d0.w),d1
	jmp loc_0ac16a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac16a:
	dc.w loc_0ac172-loc_0ac16a
	dc.w loc_0ac40a-loc_0ac16a
	dc.w loc_0aca50-loc_0ac16a
	dc.w loc_0aca50-loc_0ac16a

;==============================================
loc_0ac172:
	moveq #0,d0
	move.b ($78,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0ac182
	rts

loc_0ac182:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0ac192(pc,d0.w),d1
	jmp loc_0ac192(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac192:
	dc.w loc_0ac1c0-loc_0ac192
	dc.w loc_0ac1c0-loc_0ac192
	dc.w loc_0ac1e8-loc_0ac192
	dc.w loc_0ac228-loc_0ac192
	dc.w loc_0ac258-loc_0ac192
	dc.w loc_0ac288-loc_0ac192
	dc.w loc_0ac288-loc_0ac192
	dc.w loc_0ac2b0-loc_0ac192

	dc.w loc_0ac2e8-loc_0ac192
	dc.w loc_0ac2e8-loc_0ac192
	dc.w loc_0ac2e8-loc_0ac192
	dc.w loc_0ac1e8-loc_0ac192
	dc.w loc_0ac2e8-loc_0ac192
	dc.w loc_0ac288-loc_0ac192
	dc.w loc_0ac2fe-loc_0ac192
	dc.w loc_0ac2e8-loc_0ac192

	dc.w loc_0ac336-loc_0ac192
	dc.w loc_0ac2e8-loc_0ac192
	dc.w loc_0ac36e-loc_0ac192
	dc.w loc_0ac1e8-loc_0ac192
	dc.w loc_0ac1c0-loc_0ac192
	dc.w loc_0ac39a-loc_0ac192
	dc.w loc_0ac3d2-loc_0ac192

;----------------------------------------------
loc_0ac1c0:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	bsr.w loc_0acd4a
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac1e8:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_0acdae
	moveq #0,d0
	move.b ($70,a6),d0
	add.w d0,d0
	movea.l #loc_2e50a0,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

loc_0ac222:
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac228:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b ($7f,a6),d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	bsr.w loc_0acd56
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac258:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	move.b ($7f,a6),d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	bsr.w loc_0acd82
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac288:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	bsr.w loc_0acd4a
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac2b0:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #$e,d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	movea.l #loc_2044b0,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac2e8:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.w #0,($3a,a6)
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac2fe:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #$1a,d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	movea.l #loc_26889c,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac336:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #$1a,d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	movea.l #loc_26889c,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac36e:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #$1a,d0
	jsr loc_02fc88
	move.b ($70,a6),d0
	bsr.w loc_0acd4a
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac39a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #6,d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	movea.l #loc_196fb6,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ac40a

;----------------------------------------------
loc_0ac3d2:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	moveq #$1d,d0
	jsr loc_02fc88
	bsr.w loc_0acdae
	move.b ($70,a6),d0
	movea.l #loc_290590,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.w loc_0ac40a

;==============================================
loc_0ac40a:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0ac41a(pc,d0.w),d1
	jmp loc_0ac41a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac41a:
	dc.w loc_0ac448-loc_0ac41a
	dc.w loc_0ac448-loc_0ac41a
	dc.w loc_0ac54c-loc_0ac41a
	dc.w loc_0ac644-loc_0ac41a
	dc.w loc_0ac644-loc_0ac41a
	dc.w loc_0ac54c-loc_0ac41a
	dc.w loc_0ac578-loc_0ac41a
	dc.w loc_0ac6ca-loc_0ac41a

	dc.w loc_0ac706-loc_0ac41a
	dc.w loc_0ac75e-loc_0ac41a
	dc.w loc_0ac7b2-loc_0ac41a
	dc.w loc_0ac4f4-loc_0ac41a
	dc.w loc_0ac80c-loc_0ac41a
	dc.w loc_0ac874-loc_0ac41a
	dc.w loc_0ac54c-loc_0ac41a
	dc.w loc_0ac8f8-loc_0ac41a

	dc.w loc_0ac6ca-loc_0ac41a
	dc.w loc_0ac950-loc_0ac41a
	dc.w loc_0ac9a8-loc_0ac41a
	dc.w loc_0ac520-loc_0ac41a
	dc.w loc_0ac9ee-loc_0ac41a
	dc.w loc_0ac6ca-loc_0ac41a
	dc.w loc_0ac54c-loc_0ac41a

;----------------------------------------------
loc_0ac448:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac468(pc,d0.w),d1
	jsr loc_0ac468(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac468:
	dc.w loc_0ac46e-loc_0ac468
	dc.w loc_0ac480-loc_0ac468
	dc.w loc_0ac4f2-loc_0ac468

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac46e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0ac47e
	addq.b #2,(5,a6)

loc_0ac47e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac480:
	jsr loc_01b0c4
	move.b #3,($3c,a6)
	bsr.w loc_0a7202
	bsr.w loc_0a723c
	tst.b ($3c,a6)
	beq.b loc_0ac4ec
	tst.b (3,a6)
	beq.w loc_0ac4ce
	move.w ($80,a5),d0
	andi.w #1,d0
	beq.w loc_0ac4be
	subi.w #8,($10,a6)
	subi.w #8,($14,a6)
	bra.w loc_0ac4ca

loc_0ac4be:
	addi.w #8,($10,a6)
	addi.w #8,($14,a6)

loc_0ac4ca:
	bra.w loc_0ac4ea

loc_0ac4ce:
	move.w ($80,a5),d0
	andi.w #1,d0
	beq.w loc_0ac4e4
	subi.w #8,($14,a6)
	bra.w loc_0ac4ea

loc_0ac4e4:
	addi.w #8,($14,a6)

loc_0ac4ea:
	rts

loc_0ac4ec:
	addq.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac4f2:
	rts

;----------------------------------------------
loc_0ac4f4:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac51a(pc,d0.w),d1
	jsr loc_0ac51a(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac51a:
	dc.w loc_0ac59e-loc_0ac51a
	dc.w loc_0ac620-loc_0ac51a
	dc.w loc_0ac61e-loc_0ac51a

;----------------------------------------------
loc_0ac520:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac546(pc,d0.w),d1
	jsr loc_0ac546(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac546:
	dc.w loc_0ac59e-loc_0ac546
	dc.w loc_0ac62a-loc_0ac546
	dc.w loc_0ac61e-loc_0ac546

;----------------------------------------------
loc_0ac54c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac572(pc,d0.w),d1
	jsr loc_0ac572(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac572:
	dc.w loc_0ac59e-loc_0ac572
	dc.w loc_0ac5b0-loc_0ac572
	dc.w loc_0ac61e-loc_0ac572

;----------------------------------------------
loc_0ac578:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac598(pc,d0.w),d1
	jsr loc_0ac598(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac598:
	dc.w loc_0ac59e-loc_0ac598
	dc.w loc_0ac5b0-loc_0ac598
	dc.w loc_0ac61e-loc_0ac598

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac59e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0ac5ae
	addq.b #2,(5,a6)

loc_0ac5ae:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac5b0:
	jsr loc_01b0c4
	moveq #0,d2
	move.l ($40,a6),d0
	add.l ($48,a6),d0
	beq.b loc_0ac5e6
	st.b d2
	move.w ($10,a6),d0
	move.w ($72,a6),d1
	tst.w ($40,a6)
	bpl.b loc_0ac5d4
	exg.l d0,d1

loc_0ac5d4:
	cmp.w d0,d1
	bgt.b loc_0ac5e6
	move.w ($72,a6),($10,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_0ac5e6:
	move.l ($44,a6),d0
	add.l ($4c,a6),d0
	beq.b loc_0ac614
	st.b d2
	move.w ($14,a6),d0
	move.w ($74,a6),d1
	tst.w ($44,a6)
	bpl.b loc_0ac602
	exg.l d0,d1

loc_0ac602:
	cmp.w d0,d1
	bgt.b loc_0ac614
	move.w ($74,a6),($14,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)

loc_0ac614:
	tst.b d2
	bne.b loc_0ac61c
	addq.b #2,(5,a6)

loc_0ac61c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac61e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac620:
	tst.b ($33,a6)
	bmi.w loc_0aca56
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac62a:
	addi.l #$10000,($10,a6)
	addi.l #$8000,($14,a6)
	tst.b ($33,a6)
	bmi.w loc_0aca56
	rts

;----------------------------------------------
loc_0ac644:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac66a(pc,d0.w),d1
	jsr loc_0ac66a(pc,d1.w)
	jsr loc_01b692
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac66a:
	dc.w loc_0ac670-loc_0ac66a
	dc.w loc_0ac682-loc_0ac66a
	dc.w loc_0ac6c8-loc_0ac66a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac670:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0ac680
	addq.b #2,(5,a6)

loc_0ac680:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac682:
	jsr loc_01b0c4
	moveq #0,d2
	move.w ($10,a6),d0
	move.w ($72,a6),d1
	tst.w ($40,a6)
	bpl.b loc_0ac69a
	exg.l d0,d1

loc_0ac69a:
	cmp.w d0,d1
	bgt.b loc_0ac6b2
	move.w ($72,a6),($10,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	addi.l #1,d2

loc_0ac6b2:
	tst.b d2
	beq.b loc_0ac6c6
	move.w ($72,a6),($10,a6)
	move.w ($74,a6),($14,a6)
	addq.b #2,(5,a6)

loc_0ac6c6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac6c8:
	rts

;----------------------------------------------
loc_0ac6ca:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac6f0(pc,d0.w),d1
	jsr loc_0ac6f0(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac6f0:
	dc.w loc_0ac6f6-loc_0ac6f0
	dc.w loc_0ac6fa-loc_0ac6f0
	dc.w loc_0ac704-loc_0ac6f0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac6f6:
	addq.b #2,(5,a6)

loc_0ac6fa:
	tst.b ($33,a6)
	bmi.w loc_0aca56
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac704:
	rts

;----------------------------------------------
loc_0ac706:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac722(pc,d0.w),d1
	jsr loc_0ac722(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac722:
	dc.w loc_0ac728-loc_0ac722
	dc.w loc_0ac734-loc_0ac722
	dc.w loc_0ac75c-loc_0ac722

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac728:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac734:
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	cmpi.b #$c,d0
	bne.w loc_0ac75a
	bsr.w loc_0aca5c
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)

loc_0ac75a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac75c:
	rts

;----------------------------------------------
loc_0ac75e:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac77a(pc,d0.w),d1
	jsr loc_0ac77a(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac77a:
	dc.w loc_0ac780-loc_0ac77a
	dc.w loc_0ac78c-loc_0ac77a
	dc.w loc_0ac7b0-loc_0ac77a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac780:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac78c:
	move.b ($3a,a6),d0
	cmpi.b #$14,d0
	bne.w loc_0ac7ae
	bsr.w loc_0acbb4
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)

loc_0ac7ae:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac7b0:
	rts

;----------------------------------------------
loc_0ac7b2:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac7ce(pc,d0.w),d1
	jsr loc_0ac7ce(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac7ce:
	dc.w loc_0ac7d4-loc_0ac7ce
	dc.w loc_0ac7e0-loc_0ac7ce
	dc.w loc_0ac808-loc_0ac7ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac7d4:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac7e0:
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	cmpi.b #$c,d0
	bne.w loc_0ac806
	bsr.w loc_0acbb4
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)

loc_0ac806:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac808:
	rts
	rts

;----------------------------------------------
loc_0ac80c:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac828(pc,d0.w),d1
	jsr loc_0ac828(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac828:
	dc.w loc_0ac82e-loc_0ac828
	dc.w loc_0ac83a-loc_0ac828
	dc.w loc_0ac872-loc_0ac828

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac82e:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac83a:
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	cmpi.b #8,d0
	beq.w loc_0ac86c
	andi.w #1,d0
	tst.w d0
	beq.w loc_0ac86a
	bsr.w loc_0acb50
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)

loc_0ac86a:
	rts

loc_0ac86c:
	addq.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac872:
	rts

;----------------------------------------------
loc_0ac874:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac894(pc,d0.w),d1
	jsr loc_0ac894(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac894:
	dc.w loc_0ac89a-loc_0ac894
	dc.w loc_0ac8ac-loc_0ac894
	dc.w loc_0ac8da-loc_0ac894

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac89a:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0ac8aa
	addq.b #2,(5,a6)

loc_0ac8aa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac8ac:
	jsr loc_01b0c4
	move.w ($14,a6),d0
	move.w ($74,a6),d1
	tst.w ($44,a6)
	bpl.b loc_0ac8c2
	exg.l d0,d1

loc_0ac8c2:
	cmp.w d0,d1
	bgt.b loc_0ac8d8
	move.w ($74,a6),($14,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	addq.b #2,(5,a6)

loc_0ac8d8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac8da:
	move.w ($80,a5),d0
	andi.w #2,d0
	beq.w loc_0ac8f0
	subi.w #2,($14,a6)
	bra.w loc_0ac8f6

loc_0ac8f0:
	addi.w #2,($14,a6)

loc_0ac8f6:
	rts

;----------------------------------------------
loc_0ac8f8:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac914(pc,d0.w),d1
	jsr loc_0ac914(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac914:
	dc.w loc_0ac91a-loc_0ac914
	dc.w loc_0ac926-loc_0ac914
	dc.w loc_0ac94e-loc_0ac914

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac91a:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac926:
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	cmpi.b #$10,d0
	bne.w loc_0ac75a
	bsr.w loc_0acc2e
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac94e:
	rts

;----------------------------------------------
loc_0ac950:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac96c(pc,d0.w),d1
	jsr loc_0ac96c(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac96c:
	dc.w loc_0ac972-loc_0ac96c
	dc.w loc_0ac97e-loc_0ac96c
	dc.w loc_0ac9a6-loc_0ac96c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac972:
	moveq #0,d0
	move.w #0,($3a,a6)
	addq.b #2,(5,a6)

loc_0ac97e:
	addq.b #1,($3a,a6)
	move.b ($3a,a6),d0
	cmpi.b #$1e,d0
	bne.w loc_0ac9a4
	bsr.w loc_0acca8
	addi.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	move.b #0,($3a,a6)

loc_0ac9a4:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac9a6:
	rts

;----------------------------------------------
loc_0ac9a8:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0ac9ce(pc,d0.w),d1
	jsr loc_0ac9ce(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ac9ce:
	dc.w loc_0ac9d4-loc_0ac9ce
	dc.w loc_0ac9d8-loc_0ac9ce
	dc.w loc_0ac9ec-loc_0ac9ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac9d4:
	addq.b #2,(5,a6)

loc_0ac9d8:
	jsr loc_01b0c4
	move.w ($14,a6),d0
	cmpi.w #$60,d0
	ble.w loc_0aca56
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ac9ec:
	rts

;----------------------------------------------
loc_0ac9ee:
	moveq #0,d0
	move.b ($79,a6),d0
	cmp.w ($1c8,a5),d0
	ble.w loc_0aca56
	move.b (5,a6),d0
	move.w loc_0aca08(pc,d0.w),d1
	jmp loc_0aca08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aca08:
	dc.w loc_0aca0e-loc_0aca08
	dc.w loc_0aea20-loc_0aca08
	dc.w loc_0aca4e-loc_0aca08

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aca0e:
	moveq #0,d0
	move.b ($7a,a6),d0
	cmp.w ($1c8,a5),d0
	bgt.b loc_0aca1e
	addq.b #2,(5,a6)

loc_0aca1e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aea20:
	jsr loc_01b0c4
	move.b #3,($3c,a6)
	bsr.w loc_0a7202
	bsr.w loc_0a723c
	move.w ($80,a5),d0
	andi.w #1,d0
	beq.w loc_0aca46
	jsr loc_01b4ec

loc_0aca46:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aca48:
	addq.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aca4e:
	rts

;==============================================
loc_0aca50:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aca56:
	addq.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aca5c:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #7,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0ace60(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w (2,a2),($14,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($14,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acad6:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #7,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0ace80(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w (2,a2),($14,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($14,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acb50:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #7,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0acea0(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w (2,a2),($14,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($79,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acbb4:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #$b,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0ace80(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w (2,a2),($14,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($14,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acc2e:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #$15,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0acec0(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w (2,a2),($14,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($14,a4)
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acca8:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b #$50,(2,a4)
	move.b #$12,(3,a4)
	move.b ($b,a6),($b,a4)
	move.b ($70,a6),($70,a4)
	move.b ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.b ($d,a6),($d,a4)
	moveq #0,d0
	move.b ($3b,a6),d0
	asl.w #2,d0
	lea.l loc_0acee0(pc),a2
	adda.w d0,a2
	move.w (a2),($10,a4)
	move.w #$100,($14,a4)
	jsr RNGFunction
	andi.w #$1f,d0
	add.w d0,($10,a4)
	move.w #0,($40,a4)
	move.w #0,($44,a4)
	move.w #0,($48,a4)
	move.w #0,($4c,a4)
	jsr RNGFunction
	andi.w #1,d0
	bne.w loc_0acd30
	move.w #$fffc,($44,a4)
	bra.w loc_0acd36

loc_0acd30:
	move.w #$fffa,($44,a4)

loc_0acd36:
	move.l ($78,a6),($78,a4)
	move.l ($7c,a6),($7c,a4)
	move.b #$ff,($c,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acd4a:
	movea.l #loc_2f4284,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acd56:
	moveq #0,d0
	move.b ($70,a6),d0
	add.w d0,d0
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w d1,d1
	movea.l loc_0acde0(pc,d1.w),a0
	movea.l (4,a0),a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acd82:
	moveq #0,d0
	move.b ($70,a6),d0
	add.w d0,d0
	moveq #0,d1
	move.b ($7f,a6),d1
	add.w d1,d1
	add.w d1,d1
	movea.l loc_0acde0(pc,d1.w),a0
	movea.l ($c,a0),a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0acdae:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($44,a6)
	move.w ($48,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($48,a6)
	move.w ($48,a6),d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($48,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0acde0:
	dc.l loc_1461e8,loc_152da4,loc_15c5cc,loc_167cb0
	dc.l loc_1713a8,loc_185676,loc_18efcc,loc_1a5eec
	dc.l loc_1af7e6,loc_1bb3f2,loc_1ca1de,loc_1de87e
	dc.l loc_1e9472,loc_1f1112,loc_1fe362,loc_20d366
	dc.l loc_21bde4,loc_229418,loc_1461e8,loc_229448
	dc.l loc_1461e8,loc_2387ec,loc_23fe00,loc_1461e8
	dc.l loc_24be0a,loc_254b3c,loc_262344,loc_270f16
	dc.l loc_27dc4a,loc_28a274,loc_298f0c,loc_2a8270

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ace60:
	dc.w $0050,$00c0,$0100,$0090
	dc.w $0080,$00a0,$0140,$00b0
	dc.w $00a0,$0090,$0150,$00a0
	dc.w $0060,$00c8,$0120,$00a8

loc_0ace80:
	dc.w $00c0,$00c0,$0100,$0090
	dc.w $0080,$00a0,$0140,$00b0
	dc.w $00a0,$0090,$0150,$00a0
	dc.w $0060,$00c8,$0120,$00a8

loc_0acea0:
	dc.w $0040,$00b0,$0050,$00d0
	dc.w $0060,$0090,$0070,$00f0
	dc.w $0070,$0080,$0080,$00e0
	dc.w $0090,$00a0,$00a0,$00c0

loc_0acec0:
	dc.w $00c0,$00c0,$0080,$00a0
	dc.w $0120,$00b0,$00a0,$00d0
	dc.w $0100,$0090,$00f0,$00c8
	dc.w $00e0,$00a8,$00b0,$00b8

loc_0acee0:
	dc.w $00c0,$0000,$0060,$0000
	dc.w $00a0,$0000,$0080,$0000
	dc.w $0120,$0000,$0020,$0000
	dc.w $0100,$0000,$0040,$0000

;##############################################
;last on loc_03333c
loc_0acf00:
	move.b (4,a6),d0
	move.w loc_0acf0c(pc,d0.w),d1
	jmp loc_0acf0c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0acf0c:
	dc.w loc_0acf14-loc_0acf0c
	dc.w loc_0acf4a-loc_0acf0c
	dc.w loc_0ad014-loc_0acf0c
	dc.w loc_0ad018-loc_0acf0c

;==============================================
loc_0acf14:
	addq.b #2,(4,a6)
	move.l #$20000,($44,a6)
	move.l #$fffff000,($4c,a6)
	movea.w ($36,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #6,d0
	move.l d0,($40,a6)
	moveq #$11,d0
	movea.l #loc_1f6d9a,a0
	jsr loc_01b6e0
	moveq #0,d0

loc_0acf4a:
	tst.b ($12a,a5)
	beq.b loc_0acf5a
	move.l #$4000000,(4,a6)
	rts

loc_0acf5a:
	move.b (5,a6),d0
	move.w loc_0acf6c(pc,d0.w),d1
	jsr loc_0acf6c(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0acf6c:
	dc.w loc_0acf74-loc_0acf6c
	dc.w loc_0acfae-loc_0acf6c
	dc.w loc_0acfca-loc_0acf6c
	dc.w loc_0ad00e-loc_0acf6c

;----------------------------------------------
loc_0acf74:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	movea.w ($36,a6),a4
	move.w ($64,a4),d0
	addi.w #$55,d0
	cmp.w ($14,a6),d0
	bcs.b loc_0acfa8
	addq.b #2,(5,a6)
	move.b #4,($3b,a6)

loc_0acfa8:
	jmp loc_01b6b6

;----------------------------------------------
loc_0acfae:
	subq.b #1,($3b,a6)
	bne.b loc_0acfc8
	addq.b #2,(5,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffe000,($4c,a6)

loc_0acfc8:
	rts

;----------------------------------------------
loc_0acfca:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	movea.w ($36,a6),a4
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0ad008
	addq.b #2,(5,a6)
	move.w ($64,a4),($14,a6)
	moveq #$12,d0
	movea.l #loc_1f6d9a,a0
	jmp loc_01b6e0

loc_0ad008:
	jmp loc_01b6b6

;----------------------------------------------
loc_0ad00e:
	jmp loc_01b6b6

;==============================================
loc_0ad014:
	addq.b #2,(4,a6)

loc_0ad018:
	jmp loc_01c2de

;==============================================
loc_0ad01e:
	move.w (8,a5),d0
	move.w loc_0ad042(pc,d0.w),d1
	jsr loc_0ad042(pc,d1.w)
	jsr loc_03330e
	jsr loc_033522
	jsr loc_0336d6
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad042:
	dc.w loc_0ad056-loc_0ad042
	dc.w loc_0ad0c4-loc_0ad042
	dc.w loc_0ad1ec-loc_0ad042

;----------------------------------------------
loc_0ad048:
	tst.b ($168,a5)
	bne.b loc_0ad056
	tst.b ($15d,a5)
	beq.w loc_0ad1ec

loc_0ad056:
	addq.w #2,(8,a5)
	moveq #0,d0
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jsr loc_01b0e6
	jsr loc_01bdd0
	jsr loc_01fae2
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	move.w #0,($2a,a5)
	move.w #$700,($2c,a5)
	move.l #MainpaletteDirect,($e0,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	move.w #$1e0e,($32,a5)
	move.w #$4261,($3a,a5)
	jmp loc_01738a

;----------------------------------------------
loc_0ad0c4:
	move.w ($c,a5),d0
	move.w loc_0ad0d4(pc,d0.w),d1
	jsr loc_0ad0d4(pc,d1.w)
	bra.w loc_0ad436

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad0d4:
	dc.w loc_0ad0e0-loc_0ad0d4
	dc.w loc_0ad120-loc_0ad0d4
	dc.w loc_0ad152-loc_0ad0d4
	dc.w loc_0ad18c-loc_0ad0d4
	dc.w loc_0ad1c8-loc_0ad0d4
	dc.w loc_0ad1da-loc_0ad0d4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad0e0:
	addq.w #2,($c,a5)
	moveq #1,d0
	jsr loc_095ba2
	move.w #$f0,($e,a5)
	move.w #Mainpalette,(palrampointer,a5)
	bsr.w loc_0ad48e
	bsr.w loc_0ad49e
	lea.l $900864,a1
	bsr.w loc_0ad456
	moveq #1,d1
	bsr.w loc_0ad472
	bsr.w loc_0ad4be
	bsr.w loc_0ad4e8
	moveq #8,d0
	jmp loc_0039e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad120:
	subq.w #1,($e,a5)
	bpl.b loc_0ad150
	addq.w #2,($c,a5)
	move.w #$3c,($e,a5)
	move.w #$360e,($32,a5)
	move.w #$6241,($3a,a5)
	bsr.w loc_0ad4da
	st.b ($12,a5)
	move.w ($16,a5),d0
	beq.b loc_0ad150
	movea.w d0,a4
	clr.b (1,a4)

loc_0ad150:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad152:
	subq.w #1,($e,a5)
	bpl.b loc_0ad178
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w #$f0,($e,a5)
	clr.b ($12,a5)
	bsr.w loc_0ad4e8
	move.b #7,($12b,a5)
	jmp loc_0810a8

loc_0ad178:
	move.w ($e,a5),d0
	andi.w #3,d0
	bne.b loc_0ad18a
	moveq #3,d0
	jmp loc_095ba2

loc_0ad18a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad18c:
	subq.w #1,($e,a5)
	bpl.b loc_0ad1c6
	addq.w #2,($c,a5)
	clr.b ($124,a5)
	moveq #2,d0
	jsr loc_095ba2
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	move.w #$f0,($e,a5)
	bsr.w loc_0ad4e8
	move.w ($16,a5),d0
	beq.b loc_0ad1c6
	movea.w d0,a4
	move.b #1,(1,a4)

loc_0ad1c6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad1c8:
	subq.w #1,($e,a5)
	bpl.b loc_0ad1d8
	addq.w #2,($c,a5)
	move.w #$3c,($e,a5)

loc_0ad1d8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad1da:
	subq.w #1,($e,a5)
	bpl.b loc_0ad1ea
	addq.w #2,(8,a5)
	move.w #$92a0,(palrampointer,a5)

loc_0ad1ea:
	rts

;----------------------------------------------
loc_0ad1ec:
	jsr loc_01b0e6
	jmp loc_00adde

;==============================================
;English Credits
loc_0ad1f8:
	move.w (8,a5),d0
	move.w loc_0ad21c(pc,d0.w),d1
	jsr loc_0ad21c(pc,d1.w)
	jsr loc_03330e
	jsr loc_033522
	jsr loc_0336d6
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad21c:
	dc.w loc_0ad048-loc_0ad21c
	dc.w loc_0ad222-loc_0ad21c
	dc.w loc_0ad1ec-loc_0ad21c

;----------------------------------------------
loc_0ad222:
	move.w ($c,a5),d0
	move.w loc_0ad232(pc,d0.w),d1
	jsr loc_0ad232(pc,d1.w)
	bra.w loc_0ad436

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad232:
	dc.w loc_0ad242-loc_0ad232
	dc.w loc_0ad2da-loc_0ad232
	dc.w loc_0ad314-loc_0ad232
	dc.w loc_0ad34a-loc_0ad232
	dc.w loc_0ad382-loc_0ad232
	dc.w loc_0ad3a0-loc_0ad232
	dc.w loc_0ad3f6-loc_0ad232
	dc.w loc_0ad412-loc_0ad232

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad242:
	addq.w #2,($c,a5)
	move.w #$168,($e,a5)
	move.w #Mainpalette,(palrampointer,a5)
	bsr.w loc_0ad49e
	bsr.w loc_0ad48e
	bsr.w loc_0ad4be
	bsr.w loc_0ad4e8
	moveq #5,d0
	jsr loc_095ba2
	moveq #6,d0
	jsr loc_095ba2
	bsr.w loc_0ad2b8
	bne.b loc_0ad290
	move.b #4,($148,a5)
	move.b #7,($12b,a5)
	jsr loc_0810a8
	jmp loc_01fb16

loc_0ad290:
	movea.w ($13a,a5),a6
	moveq #0,d0
	move.b ($132,a6),d0
	addq.b #1,d0
	move.b loc_0ad2b4(pc,d0.w),($148,a5)
	move.b #0,($12b,a5)
	jsr loc_0810a8
	jmp loc_01fb16

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad2b4:
	dc.b $06,$04,$08,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad2b8:
	tst.b ($15d,a5)
	beq.b loc_0ad2ca
	movea.w ($13a,a5),a6
	cmpi.b #2,($102,a6)
	rts

loc_0ad2ca:
	cmpi.b #2,($502,a5)
	beq.b loc_0ad2d8
	cmpi.b #2,($902,a5)

loc_0ad2d8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad2da:
	subq.w #1,($e,a5)
	bpl.w loc_0ad434
	addq.w #2,($c,a5)
	move.w #$1e,($e,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	clr.b ($124,a5)
	bsr.w loc_0ad4e8
	move.w #$92a0,(palrampointer,a5)
	moveq #2,d0
	jsr loc_0039e0
	jmp loc_017366

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad314:
	subq.w #1,($e,a5)
	bpl.w loc_0ad434
	addq.w #2,($c,a5)
	move.w #$1e,($e,a5)
	move.w #$40,($26,a5)
	move.w #$300,($28,a5)
	move.w #$40,($2a,a5)
	move.w #$700,($2c,a5)
	jsr loc_01e256
	jmp loc_01f07a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad34a:
	subq.w #1,($e,a5)
	bpl.w loc_0ad434
	addq.w #2,($c,a5)
	move.w #$d5c,($e,a5)
	jsr loc_0b3064
	movea.l #loc_33bff4,a0
	movea.l #$90c3a0,a1
	moveq #0,d7
	jsr loc_01b7c0
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_01738a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad382:
	subq.w #1,($e,a5)
	bpl.w loc_0ad434
	addq.w #2,($c,a5)
	move.w #$1e,($e,a5)
	move.w #$92a0,(palrampointer,a5)
	jmp loc_017366

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad3a0:
	subq.w #1,($e,a5)
	bpl.w loc_0ad434
	addq.w #2,($c,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$b4,($e,a5)
	move.w #$40,($26,a5)
	move.w #$100,($28,a5)
	move.w #$40,($2a,a5)
	move.w #$700,($2c,a5)
	lea.l $900850,a1
	bsr.w loc_0ad456
	moveq #0,d1
	bsr.w loc_0ad472
	moveq #0,d0
	jsr loc_095ba2
	moveq #4,d0
	jsr loc_095ba2
	jmp loc_01738a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad3f6:
	subq.w #1,($e,a5)
	bpl.b loc_0ad434
	addq.w #2,($c,a5)
	move.w #$12c,($e,a5)
	move.l #$da0000,d0
	jmp loc_00322e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad412:
	subq.w #1,($e,a5)
	bpl.b loc_0ad434
	addq.w #2,(8,a5)
	moveq #0,d0
	move.w d0,($a,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jmp loc_00adde

loc_0ad434:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad436:
	move.b ($60,a5),d1
	moveq #1,d0
	cmpi.b #1,(Active_Player,a5)
	beq.b loc_0ad446
	moveq #2,d0

loc_0ad446:
	and.w d0,d1
	beq.b loc_0ad454
	move.w #4,(8,a5)
	clr.b ($124,a5)

loc_0ad454:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad456:
	moveq #0,d1
	jsr loc_004914
	movea.l #loc_340174,a0
	movea.l #$90c420,a1
	moveq #0,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad472:
	jsr loc_01c3ac
	beq.b loc_0ad48c
	move.l #$1000801,(a4)
	clr.b ($31,a4)
	move.b d1,($3c,a4)
	move.w a4,($16,a5)

loc_0ad48c:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad48e:
	moveq #$f,d0
	moveq #0,d1
	lea.l $904000,a1
	jmp loc_01baa8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad49e:
	moveq #$f,d0
	moveq #0,d1
	lea.l Cps0BackG0,a1
	jmp loc_01ba92

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad4ae:
	moveq #$f,d0
	moveq #0,d1
	lea.l Cps0BackG0,a1
	jmp loc_01babc

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad4be:
	moveq #$43,d0
	lea.l $908000,a1
	jsr loc_0190d2
	moveq #$44,d0
	lea.l $908100,a1
	jmp loc_0190d2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad4da:
	movea.l #$90cfe0,a1
	move.l #$fff0fff,d0
	bra.b loc_0ad4fa

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad4e8:
	movea.l #$90cfe0,a1
	moveq #0,d0
	bra.b loc_0ad4fa

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ad4f2:
	movea.l #$90cbe0,a1
	moveq #0,d0

loc_0ad4fa:
	move.l (a1),d7
	andi.l #$f000f000,d7
	or.l d7,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	move.l d0,d7
	movem.l d0-d7,(a1)
	rts

;==============================================
loc_0ad518:
	move.b (4,a6),d0
	move.w loc_0ad524(pc,d0.w),d1
	jmp loc_0ad524(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad524:
	dc.w loc_0ad52c-loc_0ad524
	dc.w loc_0ad54c-loc_0ad524
	dc.w loc_0ad560-loc_0ad524
	dc.w loc_0ad560-loc_0ad524

;----------------------------------------------
loc_0ad52c:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w d0,($40,a6)
	move.b (3,a6),d0
	bsr.b loc_0ad566
	bra.b loc_0ad54e

;----------------------------------------------
loc_0ad54c:
	bsr.b loc_0ad57e

loc_0ad54e:
	move.w ($40,a6),d6
	bne.b loc_0ad55a
	jmp loc_01b4ec

loc_0ad55a:
	jmp loc_01b4b0

;----------------------------------------------
loc_0ad560:
	jmp loc_01c32e

;-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
loc_0ad566:
	move.w (stageid,a5),d1
	movea.l #loc_2ed7ae,a0
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6e0

;-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
loc_0ad57e:
	move.b ($125,a5),d0
	or.b (-$7ecc,a6),d0
	bne.b loc_0ad58e
	jmp loc_01b6b6

loc_0ad58e:
	rts

;==============================================
loc_0ad590:
	move.b (4,a6),d0
	move.w loc_0ad59c(pc,d0.w),d1
	jmp loc_0ad59c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad59c:
	dc.w loc_0ad5a4-loc_0ad59c
	dc.w loc_0ad5f0-loc_0ad59c
	dc.w loc_0ad608-loc_0ad59c
	dc.w loc_0ad608-loc_0ad59c

;----------------------------------------------
loc_0ad5a4:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w d0,($40,a6)
	move.b (3,a6),d0
	cmpi.w #8,(Region,a5)
	bne.b loc_0ad5d2
	cmpi.b #8,($e,a6)
	bne.b loc_0ad5d2
	addq.b #1,d0

loc_0ad5d2:
	jsr loc_0ad566
	cmpi.w #8,(Region,a5)
	bne.b loc_0ad5ee
	cmpi.b #8,($e,a6)
	beq.b loc_0ad5ee
	addi.w #$100,($14,a6)

loc_0ad5ee:
	bra.b loc_0ad5f6

;----------------------------------------------
loc_0ad5f0:
	jsr loc_0ad57e

loc_0ad5f6:
	move.w ($40,a6),d6
	bne.b loc_0ad602
	jmp loc_01b4ec

loc_0ad602:
	jmp loc_01b4b0

;----------------------------------------------
loc_0ad608:
	jmp loc_01c32e

;==============================================
loc_0ad60e:
	move.b (4,a6),d0
	move.w loc_0ad61a(pc,d0.w),d1
	jmp loc_0ad61a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad61a:
	dc.w loc_0ad622-loc_0ad61a
	dc.w loc_0ad65e-loc_0ad61a
	dc.w loc_0ad6d6-loc_0ad61a
	dc.w loc_0ad6d6-loc_0ad61a

;----------------------------------------------
loc_0ad622:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	move.b ($b,a6),($46,a6)
	moveq #0,d0
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.l ($10,a6),($48,a6)
	move.l ($14,a6),($4c,a6)
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w d0,($44,a6)
	move.b (3,a6),d0
	jsr loc_0ad566
	bra.b loc_0ad69a

;----------------------------------------------
loc_0ad65e:
	move.l ($288,a5),d1
	sub.l ($2a0,a5),d1
	sub.l ($398,a5),d1
	move.l ($28c,a5),d2
	sub.l ($2a4,a5),d2
	move.b ($46,a6),d0
	andi.w #$7f,d0
	add.w d0,d0
	move.w loc_0ad6ac(pc,d0.w),d0
	jsr loc_0ad6ac(pc,d0.w)
	add.l ($48,a6),d1
	move.l d1,($10,a6)
	add.l ($4c,a6),d2
	move.l d2,($14,a6)
	jsr loc_0ad57e

loc_0ad69a:
	move.w ($44,a6),d6
	bne.b loc_0ad6a6
	jmp loc_01b4ec

loc_0ad6a6:
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad6ac:
	dc.w loc_0ad6dc-loc_0ad6ac
	dc.w loc_0ad6e8-loc_0ad6ac
	dc.w loc_0ad6f4-loc_0ad6ac
	dc.w loc_0ad700-loc_0ad6ac
	dc.w loc_0ad718-loc_0ad6ac
	dc.w loc_0ad724-loc_0ad6ac
	dc.w loc_0ad740-loc_0ad6ac
	dc.w loc_0ad758-loc_0ad6ac

	dc.w loc_0ad774-loc_0ad6ac
	dc.w loc_0ad780-loc_0ad6ac
	dc.w loc_0ad798-loc_0ad6ac
	dc.w loc_0ad7b4-loc_0ad6ac
	dc.w loc_0ad7d0-loc_0ad6ac
	dc.w loc_0ad7e4-loc_0ad6ac
	dc.w loc_0ad800-loc_0ad6ac
	dc.w loc_0ad814-loc_0ad6ac

	dc.w loc_0ad828-loc_0ad6ac
	dc.w loc_0ad82a-loc_0ad6ac
	dc.w loc_0ad83e-loc_0ad6ac
	dc.w loc_0ad852-loc_0ad6ac
	dc.w loc_0ad86e-loc_0ad6ac

;----------------------------------------------
loc_0ad6d6:
	jmp loc_01c32e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad6dc:
	moveq #0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad6e6
	moveq #0,d2

loc_0ad6e6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad6e8:
	asr.l #4,d1
	tst.b ($46,a6)
	bmi.b loc_0ad6f2
	asr.l #4,d2

loc_0ad6f2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad6f4:
	asr.l #3,d1
	tst.b ($46,a6)
	bmi.b loc_0ad6fe
	asr.l #3,d2

loc_0ad6fe:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad700:
	move.l d1,d0
	add.l d0,d1
	add.l d0,d1
	asr.l #4,d1
	tst.b ($46,a6)
	bmi.b loc_0ad716
	move.l d2,d0
	add.l d0,d2
	add.l d0,d2
	asr.l #4,d2

loc_0ad716:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad718:
	asr.l #2,d1
	tst.b ($46,a6)
	bmi.b loc_0ad722
	asr.l #2,d2

loc_0ad722:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad724:
	move.l d1,d0
	add.l d0,d0
	add.l d0,d0
	add.l d0,d1
	asr.l #4,d1
	tst.b ($46,a6)
	bmi.b loc_0ad73e
	move.l d2,d0
	add.l d0,d0
	add.l d0,d0
	add.l d0,d2
	asr.l #4,d2

loc_0ad73e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad740:
	move.l d1,d0
	add.l d0,d1
	add.l d0,d1
	asr.l #3,d1
	tst.b ($46,a6)
	bmi.b loc_0ad756
	move.l d2,d0
	add.l d0,d2
	add.l d0,d2
	asr.l #3,d2

loc_0ad756:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad758:
	move.l d1,d0
	asr.l #1,d0
	sub.l d0,d1
	asr.l #3,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad772
	move.l d2,d0
	asr.l #1,d0
	sub.l d0,d2
	asr.l #3,d0
	sub.l d0,d2

loc_0ad772:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad774:
	asr.l #1,d1
	tst.b ($46,a6)
	bmi.b loc_0ad77e
	asr.l #1,d2

loc_0ad77e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad780:
	move.l d1,d0
	asr.l #4,d0
	asr.l #1,d1
	add.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad796
	move.l d2,d0
	asr.l #4,d0
	asr.l #1,d2
	add.l d0,d2

loc_0ad796:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad798:
	move.l d1,d0
	add.l d0,d0
	add.l d0,d0
	add.l d0,d1
	asr.l #3,d1
	tst.b ($46,a6)
	bmi.b loc_0ad7b2
	move.l d2,d0
	add.l d0,d0
	add.l d0,d0
	add.l d0,d2
	asr.l #3,d2

loc_0ad7b2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad7b4:
	move.l d1,d0
	asr.l #2,d0
	sub.l d0,d1
	asr.l #2,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad7ce
	move.l d2,d0
	asr.l #2,d0
	sub.l d0,d2
	asr.l #2,d0
	sub.l d0,d2

loc_0ad7ce:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad7d0:
	move.l d1,d0
	asr.l #2,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad7e2
	move.l d2,d0
	asr.l #2,d0
	sub.l d0,d2

loc_0ad7e2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad7e4:
	move.l d1,d0
	asr.l #3,d0
	sub.l d0,d1
	asr.l #1,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad7fe
	move.l d2,d0
	asr.l #3,d0
	sub.l d0,d2
	asr.l #1,d0
	sub.l d0,d2

loc_0ad7fe:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad800:
	move.l d1,d0
	asr.l #3,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad812
	move.l d2,d0
	asr.l #3,d0
	sub.l d0,d2

loc_0ad812:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad814:
	move.l d1,d0
	asr.l #4,d0
	sub.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad826
	move.l d2,d0
	asr.l #4,d0
	sub.l d0,d2

loc_0ad826:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad828:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad82a:
	move.l d1,d0
	asr.l #4,d0
	add.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad83c
	move.l d2,d0
	asr.l #4,d0
	add.l d0,d2

loc_0ad83c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad83e:
	move.l d1,d0
	asr.l #3,d0
	add.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad850
	move.l d2,d0
	asr.l #3,d0
	add.l d0,d2

loc_0ad850:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad852:
	move.l d1,d0
	asr.l #3,d0
	add.l d0,d1
	asr.l #1,d0
	add.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad850
	move.l d2,d0
	asr.l #3,d0
	add.l d0,d2
	asr.l #1,d0
	add.l d0,d2
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad86e:
	move.l d1,d0
	asr.l #2,d0
	add.l d0,d1
	tst.b ($46,a6)
	bmi.b loc_0ad850
	move.l d2,d0
	asr.l #2,d0
	add.l d0,d2
	rts

;==============================================
loc_0ad882:
	move.b (4,a6),d0
	move.w loc_0ad88e(pc,d0.w),d1
	jmp loc_0ad88e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad88e:
	dc.w loc_0ad896-loc_0ad88e
	dc.w loc_0ad8d6-loc_0ad88e
	dc.w loc_0ad8e0-loc_0ad88e
	dc.w loc_0ad8e0-loc_0ad88e

;----------------------------------------------
loc_0ad896:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	bsr.b loc_0ad8e6
	move.b ($3b,a6),d0
	jsr loc_0ad566
	move.l ($1c,a6),($44,a6)
	move.l ($32,a6),($4c,a6)
	move.b ($3a,a6),d0
	jsr loc_0ad566
	move.l ($1c,a6),($40,a6)
	move.l ($32,a6),($48,a6)
	clr.b ($3c,a6)

loc_0ad8d6:
	bsr.w loc_0ada3e
	jmp loc_01b4ec

;----------------------------------------------
loc_0ad8e0:
	jmp loc_01c32e


;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ad8e6:
	move.w ($10,a6),($50,a6)
	move.w ($14,a6),($52,a6)
	move.b (9,a6),($31,a6)
	move.b ($3c,a6),($3a,a6)
	move.b ($e,a6),($3d,a6)
	move.w ($18,a6),($3e,a6)
	move.w ($26,a6),($12,a6)
	cmpi.b #5,(3,a6)
	bne.b loc_0ad924
	cmpi.w #8,(Region,a5)
	bne.b loc_0ad924
	addq.b #1,($3a,a6)

loc_0ad924:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #4,d0
	move.w loc_0ad95e(pc,d0.w),($64,a6)
	move.w loc_0ad95e+2(pc,d0.w),($54,a6)
	move.w loc_0ad95e+4(pc,d0.w),($56,a6)
	move.b loc_0ad95e+6(pc,d0.w),($58,a6)
	move.b loc_0ad95e+7(pc,d0.w),($3b,a6)
	move.b loc_0ad95e+8(pc,d0.w),($59,a6)
	move.w loc_0ad95e+$a(pc,d0.w),($5a,a6)
	move.w loc_0ad95e+$c(pc,d0.w),($16,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ad95e:
	dc.w $01e0,$03d0,$0030,$0203
	dc.b $08,$00
	dc.w $e000,$0008,$0000

	dc.w $0230,$03b0,$0070,$0203
	dc.b $08,$00
	dc.w $e000,$000e,$0000

	dc.w $0160,$0390,$0100,$0201
	dc.b $08,$00
	dc.w $e000,$0008,$0000

	dc.w $01c0,$03a0,$00a0,$0203
	dc.b $08,$00
	dc.w $a000,$0069,$0000

	dc.w $01c0,$03b0,$0020,$0002
	dc.b $08,$00
	dc.w $e000,$0000,$0000

	dc.w $01f0,$0390,$00d0,$0204
	dc.b $08,$00
	dc.w $e000,$0008,$0000

	dc.w $01a8,$0398,$0040,$0205
	dc.b $08,$00
	dc.w $e000,$0000,$0000

	dc.w $0180,$0328,$0015,$0001
	dc.b $08,$00
	dc.w $e000,$ffee,$0000

	dc.w $0180,$0328,$0015,$0204
	dc.b $08,$00
	dc.w $e000,$fff1,$0000

	dc.w $01d8,$03a8,$0018,$0002
	dc.b $08,$00
	dc.w $e000,$ffee,$0000

	dc.w $01d8,$03a8,$0018,$0205
	dc.b $08,$00
	dc.w $e000,$fff1,$0000

	dc.w $01c0,$0358,$0098,$0205
	dc.b $04,$00
	dc.w $a000,$0000,$0000

	dc.w $01c0,$03a0,$0038,$0205
	dc.b $08,$00
	dc.w $e000,$0014,$0000

	dc.w $0180,$0380,$0050,$0201
	dc.b $08,$00
	dc.w $e000,$00c0,$0000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ada3e:
	moveq #0,d1
	move.w ($290,a5),d0
	cmp.w ($64,a6),d0
	ble.b loc_0ada4c
	moveq #1,d1

loc_0ada4c:
	cmp.b ($3c,a6),d1
	beq.b loc_0ada5a
	move.b d1,($3c,a6)
	beq.b loc_0ada60
	bra.b loc_0ada92

loc_0ada5a:
	jmp loc_0ad57e

loc_0ada60:
	move.l ($40,a6),($1c,a6)
	move.l ($48,a6),($32,a6)
	move.w ($50,a6),($10,a6)
	move.w ($52,a6),($14,a6)
	move.b ($31,a6),(9,a6)
	move.b ($3d,a6),($e,a6)
	move.w ($3e,a6),($18,a6)
	move.w ($12,a6),($26,a6)
	rts

loc_0ada92:
	move.l ($44,a6),($1c,a6)
	move.l ($4c,a6),($32,a6)
	move.w ($54,a6),($10,a6)
	move.w ($56,a6),($14,a6)
	move.b ($58,a6),(9,a6)
	move.b ($59,a6),($e,a6)
	move.w ($5a,a6),($18,a6)
	move.w ($16,a6),($26,a6)
	rts

;==============================================
loc_0adac4:
	move.b (4,a6),d0
	move.w loc_0adad0(pc,d0.w),d1
	jmp loc_0adad0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adad0:
	dc.w loc_0adad8-loc_0adad0
	dc.w loc_0adaea-loc_0adad0
	dc.w loc_0adafc-loc_0adad0
	dc.w loc_0adafc-loc_0adad0

;----------------------------------------------
loc_0adad8:
	addq.b #2,(4,a6)
	move.b (3,a6),d0
	lea.l loc_0adb02(pc),a0
	jmp loc_01b722

;----------------------------------------------
loc_0adaea:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0adafa
	jmp loc_01b6f8

loc_0adafa:
	rts

;----------------------------------------------
loc_0adafc:
	jmp loc_01c32e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adb02:
	dc.w loc_0adb10-loc_0adb02
	dc.w loc_0adb24-loc_0adb02
	dc.w loc_0adb88-loc_0adb02
	dc.w loc_0adb9c-loc_0adb02
	dc.w loc_0adbd0-loc_0adb02
	dc.w loc_0adbe4-loc_0adb02
	dc.w loc_0adc08-loc_0adb02

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adb10:
	dc.w $0600,$0000
	dc.l loc_0adc1c
	dc.w $0680,$0000
	dc.l loc_0adc34
	dc.l loc_0adb10


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adb24:
	dc.w $1000,$0000
	dc.l loc_0adc4c

	dc.w $0400,$0000
	dc.l loc_0adc52

	dc.w $0400,$0000
	dc.l loc_0adc4c

	dc.w $0400,$0000
	dc.l loc_0adc52

	dc.w $3000,$0000
	dc.l loc_0adc4c

	dc.w $0400,$0000
	dc.l loc_0adc52

	dc.w $0400,$0000
	dc.l loc_0adc4c

	dc.w $0400,$0000
	dc.l loc_0adc52

	dc.w $1800,$0000
	dc.l loc_0adc4c

	dc.w $0400,$0000
	dc.l loc_0adc52

	dc.w $0400,$0000
	dc.l loc_0adc4c

	dc.w $0480,$0000
	dc.l loc_0adc52

	dc.l loc_0adb24


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adb88:
	dc.w $8000,$0000
	dc.l loc_0adc58
	dc.w $8080,$0000
	dc.l loc_0adc5e
	dc.l loc_0adb88

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adb9c:
	dc.w $0600,$0000
	dc.l loc_0adc64
	dc.w $0600,$0000
	dc.l loc_0adc7c
	dc.w $0600,$0000
	dc.l loc_0adc94
	dc.w $0600,$0000
	dc.l loc_0adcac
	dc.w $0600,$0000
	dc.l loc_0adcc4
	dc.w $0680,$0000
	dc.l loc_0adcdc
	dc.l loc_0adb9c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adbd0:
	dc.w $0200,$0000
	dc.l loc_0adcf4
	dc.w $0280,$0000
	dc.l loc_0add0c
	dc.l loc_0adbd0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adbe4:
	dc.w $0600,$0000
	dc.l loc_0add24
	dc.w $0600,$0000
	dc.l loc_0add30
	dc.w $0600,$0000
	dc.l loc_0add3c
	dc.w $0680,$0000
	dc.l loc_0add48
	dc.l loc_0adbe4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adc08:
	dc.w $2000,$0000
	dc.l loc_0add54
	dc.w $2080,$0000
	dc.l loc_0add5a
	dc.l loc_0adc08

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adc1c:
	dc.w $01e0,$0000,$0000
	dc.w $0240,$0000,$0020
	dc.w $04a0,$0004,$0000
	dc.w $0860,$0008,$0001

loc_0adc34:
	dc.w $01e0,$0000,$0040
	dc.w $0240,$0000,$0060
	dc.w $04a0,$0004,$0020
	dc.w $0860,$0008,$0021

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adc4c:
	dc.w $01e0,$0000,$0001

loc_0adc52:
	dc.w $01e0,$0000,$0021


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adc58:
	dc.w $0200,$0000,$0041

loc_0adc5e:
	dc.w $0200,$0000,$0061


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adc64:
	dc.w $04c0,$0004,$0000
	dc.w $04e0,$0004,$00c0
	dc.w $0500,$0004,$0180
	dc.w $0520,$0004,$0241

loc_0adc7c:
	dc.w $04c0,$0004,$0020
	dc.w $04e0,$0004,$00e0
	dc.w $0500,$0004,$01a0
	dc.w $0520,$0004,$0261

loc_0adc94:
	dc.w $04c0,$0004,$0040
	dc.w $04e0,$0004,$0100
	dc.w $0500,$0004,$01c0
	dc.w $0520,$0004,$0281

loc_0adcac:
	dc.w $04c0,$0004,$0060
	dc.w $04e0,$0004,$0120
	dc.w $0500,$0004,$01e0
	dc.w $0520,$0004,$02a1

loc_0adcc4:
	dc.w $04c0,$0004,$0080
	dc.w $04e0,$0004,$0140
	dc.w $0500,$0004,$0200
	dc.w $0520,$0004,$02c1

loc_0adcdc:
	dc.w $04c0,$0004,$00a0
	dc.w $04e0,$0004,$0160
	dc.w $0500,$0004,$0220
	dc.w $0520,$0004,$02e1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adcf4:
	dc.w $0240,$0000,$0060
	dc.w $0260,$0000,$0000
	dc.w $0560,$0004,$0000
	dc.w $06c0,$0004,$0041

loc_0add0c:
	dc.w $0240,$0000,$0080
	dc.w $0260,$0000,$0020
	dc.w $0560,$0004,$0020
	dc.w $06c0,$0004,$0061

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0add24:
	dc.w $0c80,$000c,$0000
	dc.w $0ca0,$000c,$0081

loc_0add30:
	dc.w $0c80,$000c,$0020
	dc.w $0ca0,$000c,$00a1

loc_0add3c:
	dc.w $0c80,$000c,$0040
	dc.w $0ca0,$000c,$00c1

loc_0add48:
	dc.w $0c80,$000c,$0060
	dc.w $0ca0,$000c,$00e1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0add54:
	dc.w $01e0,$0000,$0001

loc_0add5a:
	dc.w $01e0,$0000,$0021

;==============================================
loc_0add60:
	move.b (4,a6),d0
	move.w loc_0add6c(pc,d0.w),d1
	jmp loc_0add6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0add6c:
	dc.w loc_0add74-loc_0add6c
	dc.w loc_0addd2-loc_0add6c
	dc.w loc_0adde4-loc_0add6c
	dc.w loc_0adde4-loc_0add6c

;----------------------------------------------
loc_0add74:
	addq.b #2,(4,a6)
	st.b (1,a6)
	moveq #0,d0
	move.b ($e,a6),d0
	subq.w #4,d0
	movea.l loc_0addae(pc,d0.w),a0
	add.w d0,d0
	movea.l loc_0addba(pc,d0.w),a1
	move.l loc_0addba+4(pc,d0.w),($40,a6)
	tst.b ($3c,a6)
	beq.b loc_0adda8
	cmpi.w #8,(Region,a5)
	bne.b loc_0adda8
	addi.w #$100,($14,a6)

loc_0adda8:
	move.b (3,a6),d0
	jmp (a1)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0addae:
	dc.l loc_3b2e54
	dc.l loc_3b3344
	dc.l loc_3c7624

loc_0addba:
	dc.l loc_01b82a,loc_01b800
	dc.l loc_01b8a8,loc_01b87e
	dc.l loc_01b926,loc_01b8fc

;----------------------------------------------
loc_0addd2:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0adde2
	movea.l ($40,a6),a0
	jmp (a0)

loc_0adde2:
	rts

;----------------------------------------------
loc_0adde4:
	jmp loc_01c32e

;==============================================
loc_0addea:
	move.b (4,a6),d0
	move.w loc_0addf6(pc,d0.w),d1
	jmp loc_0addf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0addf6:
	dc.w loc_0addfe-loc_0addf6
	dc.w loc_0ade2a-loc_0addf6
	dc.w loc_0ade56-loc_0addf6
	dc.w loc_0ade56-loc_0addf6

;----------------------------------------------
loc_0addfe:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	moveq #0,d0
	move.w d0,($c,a6)
	move.l ($10,a6),($48,a6)
	move.l ($14,a6),($4c,a6)
	move.b (3,a6),d0
	jsr loc_0ad566
	jmp loc_01b4ec

;----------------------------------------------
loc_0ade2a:
	move.l ($288,a5),d1
	sub.l ($2a0,a5),d1
	sub.l ($398,a5),d1
	asr.l #1,d1
	add.l ($48,a6),d1
	move.l d1,($10,a6)
	move.l ($30c,a5),d2
	sub.l ($324,a5),d2
	add.l ($4c,a6),d2
	move.l d2,($14,a6)
	jmp loc_01b4ec

;----------------------------------------------
loc_0ade56:
	jmp loc_01c32e

;==============================================
loc_0ade5c:
	move.b (4,a6),d0
	move.w loc_0ade68(pc,d0.w),d1
	jmp loc_0ade68(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ade68:
	dc.w loc_0ade70-loc_0ade68
	dc.w loc_0ade80-loc_0ade68
	dc.w loc_0aded2-loc_0ade68
	dc.w loc_0aded2-loc_0ade68

;----------------------------------------------
loc_0ade70:
	addq.b #2,(4,a6)
	st.b (1,a6)
	st.b ($3c,a6)
	clr.b ($32,a6)

loc_0ade80:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aded0
	tst.b ($32,a6)
	bne.b loc_0adecc
	lea.l (p1memory,a5),a1
	move.w ($10,a1),d0
	lea.l (p2memory,a5),a2
	cmp.w ($10,a2),d0
	ble.b loc_0adea4
	lea.l (a2),a1

loc_0adea4:
	moveq #0,d0
	move.w ($10,a1),d1
	sub.w ($10,a6),d1
	cmpi.w #$30,d1
	bge.b loc_0adeb6
	moveq #1,d0

loc_0adeb6:
	cmp.b ($3c,a6),d0
	beq.b loc_0aded0
	move.b d0,($3c,a6)
	lea.l loc_3c7624,a0
	jmp loc_01b926

loc_0adecc:
	subq.b #1,($32,a6)

loc_0aded0:
	rts

;----------------------------------------------
loc_0aded2:
	jmp loc_01c32e

;==============================================
loc_0aded8:
	move.b (4,a6),d0
	move.w loc_0adee4(pc,d0.w),d1
	jmp loc_0adee4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adee4:
	dc.w loc_0adeec-loc_0adee4
	dc.w loc_0adef8-loc_0adee4
	dc.w loc_0adf2c-loc_0adee4
	dc.w loc_0adf2c-loc_0adee4

;----------------------------------------------
loc_0adeec:
	addq.b #2,(4,a6)
	st.b (1,a6)
	bra.w loc_0adf32

;----------------------------------------------
loc_0adef8:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0adf2a
	subq.b #1,($32,a6)
	bne.b loc_0adf2a
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_0adf1a
	bmi.b loc_0adf20
	btst #6,d0
	bne.b loc_0adf26

loc_0adf1a:
	lea.l (8,a0),a0
	bra.b loc_0adf40

loc_0adf20:
	movea.l (8,a0),a0
	bra.b loc_0adf40

loc_0adf26:
	st.b ($33,a6)

loc_0adf2a:
	rts

;----------------------------------------------
loc_0adf2c:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0adf32:
	movea.l #loc_3c7624,a0
	move.w (4,a0),d0
	lea.l (a0,d0.w),a0

loc_0adf40:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	move.w #0,d1
	move.w (gfxram32x32,a5),d1
	lsl.l #8,d1
	move.w ($2a,a5),d0
	andi.l #$380,d0
	addi.l #$3810,d0
	add.l d0,d1
	movea.l d1,a2
	movea.l (4,a0),a0
	move.w (a0)+,d5
	move.w (a0)+,d5
	move.w (a0)+,d6

loc_0adf70:
	lea.l (a2),a1
	move.w d5,d4

loc_0adf74:
	movem.w (a0)+,d0-d1
	addi.w #$b00,d0
	movem.w d0-d1,(a1)
	movem.w d0-d1,($80,a1)
	movem.w d0-d1,($100,a1)
	movem.w d0-d1,($180,a1)
	lea.l (4,a1),a1
	dbra d4,loc_0adf74
	lea.l ($20,a2),a2
	dbra d6,loc_0adf70
	rts

;==============================================
loc_0adfa4:
	move.b (4,a6),d0
	move.w loc_0adfb0(pc,d0.w),d1
	jmp loc_0adfb0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0adfb0:
	dc.w loc_0adfb8-loc_0adfb0
	dc.w loc_0adfe4-loc_0adfb0
	dc.w loc_0ae01a-loc_0adfb0
	dc.w loc_0ae01a-loc_0adfb0

;----------------------------------------------
loc_0adfb8:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	moveq #0,d0
	move.w d0,($c,a6)
	move.l ($10,a6),($48,a6)
	move.l ($14,a6),($4c,a6)
	move.b (3,a6),d0
	jsr loc_0ad566
	jmp loc_01b4d0

;----------------------------------------------
loc_0adfe4:
	move.l ($288,a5),d1
	sub.l ($2a0,a5),d1
	sub.l ($398,a5),d1
	move.l ($30c,a5),d2
	sub.l ($324,a5),d2
	move.l d1,d0
	asr.l #3,d0
	sub.l d0,d1
	move.l d2,d0
	asr.l #4,d0
	sub.l d0,d2
	add.l ($48,a6),d1
	move.l d1,($10,a6)
	add.l ($4c,a6),d2
	move.l d2,($14,a6)
	jmp loc_01b4d0

;----------------------------------------------
loc_0ae01a:
	jmp loc_01c32e

;==============================================
loc_0ae020:
	move.b (4,a6),d0
	move.w loc_0ae02c(pc,d0.w),d1
	jmp loc_0ae02c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae02c:
	dc.w loc_0ae034-loc_0ae02c
	dc.w loc_0ae09a-loc_0ae02c
	dc.w loc_0ae126-loc_0ae02c
	dc.w loc_0ae126-loc_0ae02c

;----------------------------------------------
loc_0ae034:
	tst.b (3,a6)
	beq.b loc_0ae07e
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.l #$80000,($44,a6)
	move.l #$800,($4c,a6)
	bsr.w loc_0ae12c
	move.w ($3a,a6),d0
	lsr.w #3,d0
	move.w d0,($3a,a6)
	cmpi.w #8,(Region,a5)
	bne.b loc_0ae074
	move.b #4,(4,a6)

loc_0ae074:
	move.b (3,a6),d0
	jmp loc_0ad566

loc_0ae07e:
	move.b #4,(4,a6)
	tst.w (Region,a5)
	beq.b loc_0ae098
	move.b (3,a6),d0
	lea.l loc_0ae156(pc),a0
	jmp loc_01b722

loc_0ae098:
	rts

;----------------------------------------------
loc_0ae09a:
	move.b (5,a6),d0
	move.w loc_0ae0a6(pc,d0.w),d1
	jmp loc_0ae0a6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae0a6:
	dc.w loc_0ae0ac-loc_0ae0a6
	dc.w loc_0ae0c2-loc_0ae0a6
	dc.w loc_0ae0ee-loc_0ae0a6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae0ac:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae0c0
	subq.w #1,($3a,a6)
	bne.b loc_0ae0c0
	addq.b #2,(5,a6)

loc_0ae0c0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae0c2:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae0ec
	addq.b #2,(5,a6)
	move.l ($44,a6),d0
	move.l ($4c,a6),d1
	cmpi.w #$280,($10,a6)
	bcs.b loc_0ae0e4
	neg.l d0
	neg.l d1

loc_0ae0e4:
	move.l d0,($40,a6)
	move.l d1,($48,a6)

loc_0ae0ec:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae0ee:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae11c
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.w ($10,a6),d0
	subi.w #$30,d0
	cmpi.w #$5a0,d0
	bcs.b loc_0ae11c
	clr.b (5,a6)
	bra.b loc_0ae12c

loc_0ae11c:
	move.w #$e0,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0ae126:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ae12c:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$e,d0
	andi.w #$3f,d1
	add.w loc_0ae146(pc,d0.w),d1
	move.w d1,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae146:
	dc.w $0384,$03fc,$0384,$03c0
	dc.w $0384,$0348,$0384,$030c

loc_0ae156:
	dc.w $0002,$ff40,$0000
	dc.l loc_0ae160

loc_0ae160:
	dc.w $04a0,$0004,$0081

;==============================================
loc_0ae166:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0ae174(pc,d0.w),d1
	jmp loc_0ae174(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae174:
	dc.w loc_0ae178-loc_0ae174
	dc.w loc_0ae1ec-loc_0ae174

;----------------------------------------------
loc_0ae178:
	move.b (4,a6),d0
	move.w loc_0ae184(pc,d0.w),d1
	jmp loc_0ae184(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae184:
	dc.w loc_0ae18c-loc_0ae184
	dc.w loc_0ae1aa-loc_0ae184
	dc.w loc_0ae224-loc_0ae184
	dc.w loc_0ae22a-loc_0ae184

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae18c:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.w #$140,($3a,a6)
	moveq #0,d0
	jsr loc_0ad566
	bra.b loc_0ae1e4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae1aa:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae1e4
	tst.b ($35,a6)
	beq.b loc_0ae1be
	subq.w #1,($3a,a6)

loc_0ae1be:
	tst.b ($33,a6)
	bpl.b loc_0ae1de
	move.b (3,a6),d0
	tst.w ($3a,a6)
	bgt.b loc_0ae1d6
	move.w #$140,($3a,a6)
	addq.b #1,d0

loc_0ae1d6:
	jsr loc_0ad566
	bra.b loc_0ae1e4

loc_0ae1de:
	jsr loc_0ad57e

loc_0ae1e4:
	moveq #0,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0ae1ec:
	move.b (4,a6),d0
	move.w loc_0ae1f8(pc,d0.w),d1
	jmp loc_0ae1f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae1f8:
	dc.w loc_0ae200-loc_0ae1f8
	dc.w loc_0ae21c-loc_0ae1f8
	dc.w loc_0ae224-loc_0ae1f8
	dc.w loc_0ae22a-loc_0ae1f8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae200:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	tst.w (Region,a5)
	beq.b loc_0ae224
	moveq #5,d0
	jsr loc_0ad566

loc_0ae21c:
	moveq #$10,d6
	jmp loc_01b4b0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae224:
	addq.b #2,(4,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae22a:
	jmp loc_01c32e

;==============================================
loc_0ae230:
	move.b (4,a6),d0
	move.w loc_0ae23c(pc,d0.w),d1
	jmp loc_0ae23c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae23c:
	dc.w loc_0ae244-loc_0ae23c
	dc.w loc_0ae280-loc_0ae23c
	dc.w loc_0ae3d8-loc_0ae23c
	dc.w loc_0ae3d8-loc_0ae23c

;----------------------------------------------
loc_0ae244:
	addq.b #2,(4,a6)
	moveq #7,d7
	lea.l ($60,a6),a4

loc_0ae24e:
	move.b d7,d0
	lea.l loc_0ae3de(pc),a0
	jsr loc_01b722
	move.b ($32,a6),(a4)
	clr.b (1,a4)
	lea.l (2,a4),a4
	dbra d7,loc_0ae24e
	cmpi.w #8,(Region,a5)
	bne.b loc_0ae27e
	moveq #8,d0
	lea.l loc_0ae3de(pc),a0
	jmp loc_01b722

loc_0ae27e:
	rts

;----------------------------------------------
loc_0ae280:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae2d6
	moveq #7,d7
	lea.l ($60,a6),a4

loc_0ae290:
	subq.b #1,(a4)
	bne.b loc_0ae2ce
	move.b (1,a4),d1
	addq.b #1,d1
	andi.w #$1f,d1

loc_0ae29e:
	move.w d7,d0
	lsl.w #5,d0
	add.w d1,d0
	move.b loc_0ae2d8(pc,d0.w),d0
	bpl.b loc_0ae2ae
	moveq #0,d1
	bra.b loc_0ae29e

loc_0ae2ae:
	move.b d1,(1,a4)
	lsl.w #3,d0
	move.w d7,d1
	add.w d1,d1
	lea.l loc_0ae3de(pc),a0
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	jsr loc_01b730
	move.b ($32,a6),(a4)

loc_0ae2ce:
	lea.l (2,a4),a4
	dbra d7,loc_0ae290

loc_0ae2d6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae2d8:
	dc.b $00,$06,$00,$06,$01,$07,$01,$07
	dc.b $02,$08,$02,$08,$03,$09,$03,$09
	dc.b $04,$0a,$04,$0a,$05,$0b,$05,$0b
	dc.b $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b $00,$02,$01,$03,$00,$02,$01,$03
	dc.b $00,$02,$01,$03,$00,$02,$01,$03
	dc.b $00,$02,$01,$03,$00,$02,$01,$03
	dc.b $00,$02,$01,$03,$00,$02,$01,$03
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$03,$04,$03,$02,$01
	dc.b $00,$01,$02,$03,$04,$03,$02,$01
	dc.b $00,$01,$02,$03,$04,$03,$02,$01
	dc.b $00,$01,$02,$03,$04,$03,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$00,$01,$00,$01,$00,$01
	dc.b $00,$01,$00,$01,$00,$01,$00,$01
	dc.b $00,$01,$00,$01,$00,$01,$00,$01
	dc.b $00,$01,$00,$01,$00,$01,$00,$01

;----------------------------------------------
loc_0ae3d8:
	jmp loc_01c32e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae3de:
	dc.w loc_0ae3f0-loc_0ae3de
	dc.w loc_0ae450-loc_0ae3de
	dc.w loc_0ae470-loc_0ae3de
	dc.w loc_0ae488-loc_0ae3de
	dc.w loc_0ae4a0-loc_0ae3de
	dc.w loc_0ae4b8-loc_0ae3de
	dc.w loc_0ae4e0-loc_0ae3de
	dc.w loc_0ae4f8-loc_0ae3de

	dc.w loc_0ae508-loc_0ae3de


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae3f0:
	dc.w $0c00,$0000
	dc.l loc_0ae510
	dc.w $0c00,$0000
	dc.l loc_0ae522
	dc.w $0c00,$0000
	dc.l loc_0ae534
	dc.w $0c00,$0000
	dc.l loc_0ae546
	dc.w $0c00,$0000
	dc.l loc_0ae558
	dc.w $0c00,$0000
	dc.l loc_0ae56a
	dc.w $0c00,$0000
	dc.l loc_0ae57c
	dc.w $0c00,$0000
	dc.l loc_0ae58e
	dc.w $0c00,$0000
	dc.l loc_0ae5a0
	dc.w $0c00,$0000
	dc.l loc_0ae5b2
	dc.w $0c00,$0000
	dc.l loc_0ae5c4
	dc.w $0c40,$0000
	dc.l loc_0ae5d6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae450:
	dc.w $0100,$0000
	dc.l loc_0ae5e8
	dc.w $0100,$0000
	dc.l loc_0ae612
	dc.w $0100,$0000
	dc.l loc_0ae63c
	dc.w $0140,$0000
	dc.l loc_0ae65a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae470:
	dc.w $0e00,$0000
	dc.l loc_0ae678
	dc.w $0e00,$0000
	dc.l loc_0ae684
	dc.w $0e40,$0000
	dc.l loc_0ae690

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae488:
	dc.w $0b00,$0000
	dc.l loc_0ae69c
	dc.w $0b00,$0000
	dc.l loc_0ae6a2
	dc.w $0b40,$0000
	dc.l loc_0ae6a8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae4a0:
	dc.w $1000,$0000
	dc.l loc_0ae6ae
	dc.w $1000,$0000
	dc.l loc_0ae6ba
	dc.w $1040,$0000
	dc.l loc_0ae6c6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae4b8:
	dc.w $0f00,$0000
	dc.l loc_0ae6d2
	dc.w $0800,$0000
	dc.l loc_0ae6d8
	dc.w $0800,$0000
	dc.l loc_0ae6de
	dc.w $0800,$0000
	dc.l loc_0ae6e4
	dc.w $0f40,$0000
	dc.l loc_0ae6ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae4e0:
	dc.w $0700,$0000
	dc.l loc_0ae6f0
	dc.w $0700,$0000
	dc.l loc_0ae6f6
	dc.w $0740,$0000
	dc.l loc_0ae6fc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae4f8:
	dc.w $0400,$0000
	dc.l loc_0ae702
	dc.w $0440,$0000
	dc.l loc_0ae70e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae508:
	dc.w $ff40,$0000
	dc.l loc_0ae71a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae510:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0001

loc_0ae522:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0021

loc_0ae534:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0041

loc_0ae546:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0140
	dc.w $0460,$0004,$0061

loc_0ae558:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0081

loc_0ae56a:
	dc.w $0420,$0004,$0100
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$00a1

loc_0ae57c:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0681

loc_0ae58e:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$06a1

loc_0ae5a0:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$06c1

loc_0ae5b2:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0760
	dc.w $0460,$0004,$06e1

loc_0ae5c4:
	dc.w $0420,$0004,$00e0
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0701

loc_0ae5d6:
	dc.w $0420,$0004,$0740
	dc.w $0440,$0004,$0120
	dc.w $0460,$0004,$0721

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae5e8:
	dc.w $0480,$0004,$0460
	dc.w $04a0,$0004,$04a0
	dc.w $04c0,$0004,$04e0
	dc.w $0540,$0004,$0520
	dc.w $0560,$0004,$0560
	dc.w $09a0,$0008,$0000
	dc.w $0ee0,$000c,$0001

loc_0ae612:
	dc.w $0480,$0004,$0480
	dc.w $04a0,$0004,$04c0
	dc.w $04c0,$0004,$0500
	dc.w $0540,$0004,$0540
	dc.w $0560,$0004,$0580
	dc.w $09a0,$0008,$0020
	dc.w $0ee0,$000c,$0021

loc_0ae63c:
	dc.w $0500,$0004,$03e0
	dc.w $0520,$0004,$0420
	dc.w $0660,$0004,$05e0
	dc.w $0ac0,$0008,$0040
	dc.w $0f80,$000c,$0041

loc_0ae65a:
	dc.w $0500,$0004,$0400
	dc.w $0520,$0004,$0440
	dc.w $0660,$0004,$0600
	dc.w $0ac0,$0008,$0060
	dc.w $0f80,$000c,$0061

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae678:
	dc.w $05a0,$0004,$0260
	dc.w $05c0,$0004,$02c1

loc_0ae684:
	dc.w $05a0,$0004,$0280
	dc.w $05c0,$0004,$02e1

loc_0ae690:
	dc.w $05a0,$0004,$02a0
	dc.w $05c0,$0004,$0301

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae69c:
	dc.w $05e0,$0004,$0321

loc_0ae6a2:
	dc.w $05e0,$0004,$0341

loc_0ae6a8:
	dc.w $05e0,$0004,$0361


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae6ae:
	dc.w $0600,$0004,$0380
	dc.w $0680,$0004,$0621

loc_0ae6ba:
	dc.w $0600,$0004,$03a0
	dc.w $0680,$0004,$0641

loc_0ae6c6:
	dc.w $0600,$0004,$03c0
	dc.w $0680,$0004,$0661

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae6d2:
	dc.w $0620,$0004,$01c1

loc_0ae6d8:
	dc.w $0620,$0004,$01e1

loc_0ae6de:
	dc.w $0620,$0004,$0201

loc_0ae6e4:
	dc.w $0620,$0004,$0221

loc_0ae6ea:
	dc.w $0620,$0004,$0241

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae6f0:
	dc.w $0640,$0004,$0161

loc_0ae6f6:
	dc.w $0640,$0004,$0181

loc_0ae6fc:
	dc.w $0640,$0004,$01a1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae702:
	dc.w $0220,$0000,$0000
	dc.w $0240,$0000,$0041

loc_0ae70e:
	dc.w $0220,$0000,$0020
	dc.w $0240,$0000,$0061

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae71a:
	dc.w $0960,$0008,$0081

;==============================================
loc_0ae720:
	move.b (4,a6),d0
	move.w loc_0ae72c(pc,d0.w),d1
	jmp loc_0ae72c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae72c:
	dc.w loc_0ae734-loc_0ae72c
	dc.w loc_0ae756-loc_0ae72c
	dc.w loc_0ae75e-loc_0ae72c
	dc.w loc_0ae75e-loc_0ae72c

;----------------------------------------------
loc_0ae734:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.b (3,a6),d0
	cmpi.w #0,(Region,a5)
	beq.b loc_0ae750
	addq.b #1,d0

loc_0ae750:
	jsr loc_0ad566

loc_0ae756:
	moveq #$30,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0ae75e:
	jmp loc_01c32e

;==============================================
loc_0ae764:
	move.b (4,a6),d0
	move.w loc_0ae770(pc,d0.w),d1
	jmp loc_0ae770(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae770:
	dc.w loc_0ae778-loc_0ae770
	dc.w loc_0ae7b2-loc_0ae770
	dc.w loc_0ae82c-loc_0ae770
	dc.w loc_0ae82c-loc_0ae770

;----------------------------------------------
loc_0ae778:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b (3,a6),($31,a6)
	move.b ($b,a6),(3,a6)
	move.b #1,($f,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.w d0,($3a,a6)
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w d0,($40,a6)
	move.b ($31,a6),d0
	jsr loc_0ad566
	bra.b loc_0ae7c0

;----------------------------------------------
loc_0ae7b2:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0ae7ca(pc,d0.w),d1
	jsr loc_0ae7ca(pc,d1.w)

loc_0ae7c0:
	move.w ($40,a6),d6
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae7ca:
	dc.w loc_0ae7ce-loc_0ae7ca
	dc.w loc_0ae7f8-loc_0ae7ca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae7ce:
	move.w ($34,a6),d2
	beq.b loc_0ae7ec
	clr.w ($34,a6)
	jsr RNGFunction
	add.b ($81,a5),d0
	andi.w #$ff,d0
	add.w d2,d0
	move.w d0,($3a,a6)

loc_0ae7ec:
	tst.w ($3a,a6)
	beq.b loc_0ae816
	subq.w #1,($3a,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae7f8:
	tst.b ($33,a6)
	bpl.b loc_0ae816
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_0ae81c(pc,d0.w),d0
	add.b ($31,a6),d0
	jmp loc_0ad566

loc_0ae816:
	jmp loc_0ad57e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae81c:
	dc.b $01,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00

;----------------------------------------------
loc_0ae82c:
	jmp loc_01c32e

;==============================================
loc_0ae832:
	move.b (4,a6),d0
	move.w loc_0ae83e(pc,d0.w),d1
	jmp loc_0ae83e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae83e:
	dc.w loc_0ae846-loc_0ae83e
	dc.w loc_0ae85e-loc_0ae83e
	dc.w loc_0ae87a-loc_0ae83e
	dc.w loc_0ae87a-loc_0ae83e

;----------------------------------------------
loc_0ae846:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.b (3,a6),d0
	jsr loc_0ad566

loc_0ae85e:
	move.b ($b5,a5),d0
	add.b ($b4,a5),d0
	andi.b #1,d0
	beq.b loc_0ae874
	moveq #$20,d6
	jmp loc_01b4b0

loc_0ae874:
	clr.b (1,a6)
	rts

;----------------------------------------------
loc_0ae87a:
	jmp loc_01c32e

;==============================================
loc_0ae880:
	move.b (4,a6),d0
	move.w loc_0ae88c(pc,d0.w),d1
	jmp loc_0ae88c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae88c:
	dc.w loc_0ae894-loc_0ae88c
	dc.w loc_0ae8a8-loc_0ae88c
	dc.w loc_0ae922-loc_0ae88c
	dc.w loc_0ae922-loc_0ae88c

;----------------------------------------------
loc_0ae894:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	bsr.w loc_0ae928
	bra.b loc_0ae8be

;----------------------------------------------
loc_0ae8a8:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0ae8be
	move.b (5,a6),d0
	move.w loc_0ae8c6(pc,d0.w),d1
	jsr loc_0ae8c6(pc,d1.w)

loc_0ae8be:
	moveq #$60,d6
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae8c6:
	dc.w loc_0ae8ca-loc_0ae8c6
	dc.w loc_0ae8f0-loc_0ae8c6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae8ca:
	tst.b ($33,a6)
	bpl.b loc_0ae8ea
	jsr RNGFunction
	andi.w #8,d0
	bne.b loc_0ae928
	addq.b #2,(5,a6)
	move.l ($1c,a6),($40,a6)
	bra.w loc_0ae930

loc_0ae8ea:
	jmp loc_0ad57e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0ae8f0:
	tst.b ($33,a6)
	bpl.b loc_0ae908
	jsr RNGFunction
	andi.w #$20,d0
	bne.b loc_0ae930
	clr.b (5,a6)
	bra.b loc_0ae928

loc_0ae908:
	move.l ($44,a6),($1c,a6)
	jsr loc_01b6f8
	move.l ($1c,a6),($44,a6)
	move.l ($40,a6),($1c,a6)
	rts

;----------------------------------------------
loc_0ae922:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ae928:
	moveq #0,d0
	jmp loc_0ad566

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0ae930:
	moveq #0,d0
	lea.l loc_0ae94a(pc),a0
	jsr loc_01b722
	move.l ($1c,a6),($44,a6)
	move.l ($40,a6),($1c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae94a:
	dc.w loc_0ae94c-loc_0ae94a

loc_0ae94c:
	dc.w $0800,$0000
	dc.l loc_0ae992
	dc.w $0800,$0000
	dc.l loc_0ae998
	dc.w $0800,$0000
	dc.l loc_0ae99e
	dc.w $0800,$0000
	dc.l loc_0ae9a4
	dc.w $0800,$0000
	dc.l loc_0ae99e
	dc.w $0800,$0000
	dc.l loc_0ae998
	dc.w $0800,$0000
	dc.l loc_0ae992
	dc.w $0840,$0000
	dc.l loc_0ae98c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae98c:
	dc.w $0200,$0000,$0001

loc_0ae992:
	dc.w $0200,$0000,$0021

loc_0ae998:
	dc.w $0200,$0000,$0041

loc_0ae99e:
	dc.w $0200,$0000,$0061

loc_0ae9a4:
	dc.w $0200,$0000,$0081

;==============================================
loc_0ae9aa:
	move.b (4,a6),d0
	move.w loc_0ae9b6(pc,d0.w),d1
	jmp loc_0ae9b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0ae9b6:
	dc.w loc_0ae9be-loc_0ae9b6
	dc.w loc_0ae9e0-loc_0ae9b6
	dc.w loc_0aead8-loc_0ae9b6
	dc.w loc_0aead8-loc_0ae9b6

;----------------------------------------------
loc_0ae9be:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	jsr RNGFunction
	andi.w #$1f,d0
	addq.w #8,d0
	move.w d0,($50,a6)
	bra.w loc_0aeb18

;----------------------------------------------
loc_0ae9e0:
	move.b (5,a6),d0
	move.w loc_0aea24(pc,d0.w),d1
	jsr loc_0aea24(pc,d1.w)
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aea22
	subq.w #1,($50,a6)
	bne.b loc_0aea22
	jsr RNGFunction
	andi.w #$1f,d0
	addq.w #8,d0
	move.w d0,($50,a6)
	jsr loc_01c318
	beq.b loc_0aea22
	addq.b #1,(a4)
	move.b #$12,(2,a4)
	move.w ($1a,a6),($1a,a4)

loc_0aea22:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aea24:
	dc.w loc_0aea2a-loc_0aea24
	dc.w loc_0aea8c-loc_0aea24
	dc.w loc_0aeaba-loc_0aea24

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aea2a:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aea5e
	subq.w #1,($3a,a6)
	bne.b loc_0aea5e
	addq.b #2,(5,a6)
	bsr.w loc_0aeade
	move.b d0,($3c,a6)
	add.w d0,d0
	move.w loc_0aea60(pc,d0.w),d0
	jsr loc_0aea60(pc,d0.w)
	move.w d0,($10,a6)
	move.b ($3c,a6),d0
	jmp loc_0ad566

loc_0aea5e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aea60:
	dc.w loc_0aea66-loc_0aea60
	dc.w loc_0aea7c-loc_0aea60
	dc.w loc_0aea7c-loc_0aea60

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0aea66:
	jsr RNGFunction
	andi.w #$ff,d0
	add.w d0,d0
	subi.w #$40,d0
	add.w ($290,a5),d0
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0aea7c:
	jsr RNGFunction
	andi.w #$ff,d0
	addi.w #$200,d0
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aea8c:
	tst.b ($33,a6)
	bpl.b loc_0aeaae
	addq.b #2,(5,a6)
	jsr RNGFunction
	add.b ($81,a5),d0
	andi.w #1,d0
	lea.l loc_0aeb42(pc),a0
	jmp loc_01b722

loc_0aeaae:
	jsr loc_0ad57e
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aeaba:
	tst.b ($33,a6)
	bpl.b loc_0aeac6
	clr.b (5,a6)
	bra.b loc_0aeb18

loc_0aeac6:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aead6
	jmp loc_01b6f8

loc_0aead6:
	rts

;----------------------------------------------
loc_0aead8:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aeade:
	add.b ($81,a5),d0
	andi.w #$f,d0
	move.b loc_0aeafc(pc,d0.w),d0
	move.w d0,d1
	lsl.w #2,d1
	move.w loc_0aeb0c(pc,d1.w),($14,a6)
	move.w loc_0aeb0c+2(pc,d1.w),($18,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeafc:
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $01,$01,$01,$01
	dc.b $02,$02,$02,$02

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeb0c:
	dc.w $0030,$e000
	dc.w $0038,$e000
	dc.w $0048,$a000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aeb18:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$e,d0
	andi.w #$1f,d1
	add.w loc_0aeb32(pc,d0.w),d1
	move.w d1,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeb32:
	dc.w $0080,$00a0,$00c0,$00e0
	dc.w $0100,$0120,$0140,$0160

loc_0aeb42:
	dc.w loc_0aeb46-loc_0aeb42
	dc.w loc_0aeb86-loc_0aeb42

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeb46:
	dc.w $0300,$0000
	dc.l loc_0aeba6
	dc.w $0300,$0000
	dc.l loc_0aebd0
	dc.w $0300,$0000
	dc.l loc_0aebfa
	dc.w $0300,$0000
	dc.l loc_0aec24
	dc.w $0400,$0000
	dc.l loc_0aeba6
	dc.w $0500,$0000
	dc.l loc_0aebd0
	dc.w $0600,$0000
	dc.l loc_0aebfa
	dc.w $0740,$0000
	dc.l loc_0aec24

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeb86:
	dc.w $0800,$0000
	dc.l loc_0aeba6
	dc.w $0800,$0000
	dc.l loc_0aebd0
	dc.w $0800,$0000
	dc.l loc_0aebfa
	dc.w $0840,$0000
	dc.l loc_0aec24

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aeba6:
	dc.w $0200,$0000,$0000
	dc.w $0400,$0004,$0000
	dc.w $0800,$0008,$0000
	dc.w $0820,$0008,$0020
	dc.w $0840,$0008,$0040
	dc.w $0860,$0008,$0060
	dc.w $0c00,$000c,$0001

loc_0aebd0:
	dc.w $0200,$0000,$0020
	dc.w $0400,$0004,$0020
	dc.w $0800,$0008,$0080
	dc.w $0820,$0008,$00a0
	dc.w $0840,$0008,$00c0
	dc.w $0860,$0008,$00e0
	dc.w $0c00,$000c,$0021

loc_0aebfa:
	dc.w $0200,$0000,$0040
	dc.w $0400,$0004,$0040
	dc.w $0800,$0008,$0100
	dc.w $0820,$0008,$0120
	dc.w $0840,$0008,$0140
	dc.w $0860,$0008,$0160
	dc.w $0c00,$000c,$0041

loc_0aec24:
	dc.w $0200,$0000,$0060
	dc.w $0400,$0004,$0060
	dc.w $0800,$0008,$0180
	dc.w $0820,$0008,$01a0
	dc.w $0840,$0008,$01c0
	dc.w $0860,$0008,$01e0
	dc.w $0c00,$000c,$0061

;==============================================
loc_0aec4e:
	move.b (4,a6),d0
	move.w loc_0aec5a(pc,d0.w),d1
	jmp loc_0aec5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aec5a:
	dc.w loc_0aec62-loc_0aec5a
	dc.w loc_0aeca8-loc_0aec5a
	dc.w loc_0aecfe-loc_0aec5a
	dc.w loc_0aecfe-loc_0aec5a

;----------------------------------------------
loc_0aec62:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b #1,($f,a6)
	move.w d0,($26,a6)
	move.l d0,($48,a6)
	move.l #$ffffc000,($4c,a6)
	move.l #$24000,($60,a6)
	bsr.b loc_0aed04
	moveq #3,d0
	add.b ($3c,a6),d0
	jmp loc_0ad566

;----------------------------------------------
loc_0aeca8:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aecf6
	move.l ($10,a6),d0
	add.l ($40,a6),d0
	add.l ($48,a6),d0
	move.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($48,a6),d0
	bpl.b loc_0aecd2
	neg.l d0

loc_0aecd2:
	cmp.l ($60,a6),d0
	bcs.b loc_0aecdc
	neg.l ($4c,a6)

loc_0aecdc:
	move.l ($4c,a6),d0
	add.l d0,($48,a6)
	jsr loc_0ad57e
	cmpi.w #$108,($14,a6)
	ble.b loc_0aecf6
	addq.b #2,(4,a6)

loc_0aecf6:
	moveq #8,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0aecfe:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aed04:
	jsr RNGFunction
	andi.w #$ff,d0
	add.w d0,d0
	subi.w #$40,d0
	add.w ($290,a5),d0
	move.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$1f,d0
	addi.w #$60,d0
	move.w d0,($14,a6)
	jsr RNGFunction
	move.w d0,d1
	andi.w #2,d0
	moveq #0,d2
	move.b ($81,a5),d3
	andi.w #3,d3
	bne.b loc_0aed4a
	moveq #0,d0
	moveq #1,d2

loc_0aed4a:
	move.b d2,($3c,a6)
	move.w loc_0aed66(pc,d0.w),($18,a6)
	andi.w #$18,d1
	move.w loc_0aed6a(pc,d1.w),($40,a6)
	move.w loc_0aed6a+4(pc,d1.w),($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aed66:
	dc.w $e000,$6000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aed6a:
	dc.w $0002,$7000,$0001,$2000
	dc.w $0002,$d000,$0001,$4000
	dc.w $0003,$2000,$0001,$6000
	dc.w $0003,$7000,$0001,$8000

;==============================================
loc_0aed8a:
	move.b (4,a6),d0
	move.w loc_0aed96(pc,d0.w),d1
	jmp loc_0aed96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aed96:
	dc.w loc_0aed9e-loc_0aed96
	dc.w loc_0aedc6-loc_0aed96
	dc.w loc_0aedec-loc_0aed96
	dc.w loc_0aedec-loc_0aed96

;----------------------------------------------
loc_0aed9e:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.w ($10,a6),d0
	move.w d0,($50,a6)
	addi.w #$200,d0
	move.w d0,($54,a6)
	move.b (3,a6),d0
	jsr loc_0ad566

loc_0aedc6:
	move.w ($50,a6),d0
	move.w d0,d1
	addi.w #$40,d1
	cmp.w ($290,a5),d1
	bgt.b loc_0aedda
	move.w ($54,a6),d0

loc_0aedda:
	move.w d0,($10,a6)
	jsr loc_0ad57e
	moveq #$3f,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0aedec:
	jmp loc_01c32e

;==============================================
loc_0aedf2:
	move.b (4,a6),d0
	move.w loc_0aedfe(pc,d0.w),d1
	jmp loc_0aedfe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aedfe:
	dc.w loc_0aee06-loc_0aedfe
	dc.w loc_0aee32-loc_0aedfe
	dc.w loc_0aee86-loc_0aedfe
	dc.w loc_0aee86-loc_0aedfe

;----------------------------------------------
loc_0aee06:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #1,($f,a6)
	clr.w ($c,a6)
	move.b #8,($3c,a6)
	move.b (3,a6),d0
	jsr loc_0ad566
	move.l ($1c,a6),($40,a6)
	bsr.b loc_0aee8c
	bsr.b loc_0aeea0
	bra.b loc_0aee3e

;----------------------------------------------
loc_0aee32:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0aee3e
	bsr.b loc_0aee46

loc_0aee3e
	moveq #$20,d6
	jmp loc_01b4b0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aee46:
	tst.w ($3a,a6)
	beq.b loc_0aee64
	subq.w #1,($3a,a6)
	beq.b loc_0aee7a
	tst.b ($32,a6)
	bne.b loc_0aee5e
	bsr.b loc_0aeeb4
	beq.b loc_0aee62
	bra.b loc_0aee8c

loc_0aee5e:
	subq.b #1,($32,a6)

loc_0aee62:
	rts

loc_0aee64:
	tst.b ($33,a6)
	bpl.b loc_0aee74
	move.b #8,($3c,a6)
	bsr.b loc_0aee8c
	bra.b loc_0aeea0

loc_0aee74:
	jmp loc_0ad57e

loc_0aee7a:
	moveq #1,d0
	add.b (3,a6),d0
	jmp loc_0ad566

;----------------------------------------------
loc_0aee86:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aee8c:
	moveq #0,d0
	move.b ($3c,a6),d0
	movea.l ($40,a6),a0
	lea.l (a0,d0.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aeea0:
	jsr RNGFunction
	andi.w #$1ff,d0
	addi.w #$40,d0
	move.w d0,($3a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aeeb4:
	lea.l (p1memory,a5),a1
	move.w ($10,a1),d1
	sub.w ($10,a6),d1
	bpl.b loc_0aeec4
	neg.l d1

loc_0aeec4:
	lea.l (p2memory,a5),a2
	move.w ($10,a2),d2
	sub.w ($10,a6),d2
	bpl.b loc_0aeed4
	neg.l d2

loc_0aeed4:
	cmp.w d1,d2
	bhi.b loc_0aeeda
	lea.l (a2),a1

loc_0aeeda:
	moveq #0,d0
	move.w ($10,a1),d1
	sub.w ($10,a6),d1
	moveq #-$80,d2
	moveq #2,d3

loc_0aeee8:
	cmp.w d2,d1
	blt.b loc_0aeef6
	addq.w #8,d0
	addi.w #$80,d2
	dbra d3,loc_0aeee8

loc_0aeef6:
	moveq #8,d1
	cmp.b ($3c,a6),d0
	beq.b loc_0aef08
	bhi.b loc_0aef02
	moveq #-8,d1

loc_0aef02:
	add.b d1,($3c,a6)
	moveq #1,d0

loc_0aef08:
	rts

;==============================================
loc_0aef0a:
	move.b (4,a6),d0
	move.w loc_0aef16(pc,d0.w),d1
	jmp loc_0aef16(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aef16:
	dc.w loc_0aef1e-loc_0aef16
	dc.w loc_0aef34-loc_0aef16
	dc.w loc_0aef76-loc_0aef16
	dc.w loc_0aef76-loc_0aef16

;----------------------------------------------
loc_0aef1e:
	addq.b #2,(4,a6)
	move.w d0,($c,a6)
	move.b #1,($f,a6)
	move.w #$43,($14,a6)
	bra.b loc_0aef7c

;----------------------------------------------
loc_0aef34:
	move.b (5,a6),d0
	move.w loc_0aef40(pc,d0.w),d1
	jmp loc_0aef40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aef40:
	dc.w loc_0aef44-loc_0aef40
	dc.w loc_0aef5c-loc_0aef40

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aef44:
	subq.b #1,($3a,a6)
	bne.b loc_0aef5a
	addq.b #2,(5,a6)
	bsr.b loc_0aef9c
	moveq #5,d0
	jsr loc_0ad566
	bra.b loc_0aef6e

loc_0aef5a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aef5c:
	tst.b ($33,a6)
	bpl.b loc_0aef68
	clr.b (5,a6)
	bra.b loc_0aef7c

loc_0aef68:
	jsr loc_0ad57e

loc_0aef6e:
	moveq #$20,d6
	jmp loc_01b4b0

;----------------------------------------------
loc_0aef76:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aef7c:
	jsr RNGFunction
	andi.w #$f,d0
	move.b ($81,a5),d1
	andi.w #3,d1
	add.b loc_0aef98(pc,d1.w),d0
	move.b d0,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aef98:
	dc.b $08,$18,$28,$38

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aef9c:
	jsr RNGFunction
	andi.w #2,d0
	move.w ($22,a5),d1
	andi.w #$1e0,d1
	lsr.w #3,d1
	add.w d1,d0
	move.w loc_0aefba(pc,d0.w),($10,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aefba:
	dc.w $0020,$0100,$0020,$0100
	dc.w $0100,$0180,$0100,$0180
	dc.w $0100,$0180,$0100,$0180
	dc.w $0100,$0180,$0100,$0180
	dc.w $0180,$0020,$0180,$0020
	dc.w $0180,$0020,$0180,$0020
	dc.w $0180,$0020,$0020,$0100
	dc.w $0020,$0100,$0020,$0100

;==============================================
loc_0aeffa:
	move.b (4,a6),d0
	move.w loc_0af006(pc,d0.w),d1
	jmp loc_0af006(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af006:
	dc.w loc_0af00e-loc_0af006
	dc.w loc_0af032-loc_0af006
	dc.w loc_0af096-loc_0af006
	dc.w loc_0af096-loc_0af006

;----------------------------------------------
loc_0af00e:
	addq.b #2,(4,a6)
	move.w (stageid,a5),d0
	lea.l loc_361354,a0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($40,a6)
	bsr.b loc_0af09c
	movem.l d1-d4,($70,a6)
	bra.b loc_0af036

loc_0af032:
	bsr.w loc_0af2b2

loc_0af036:
	lea.l ($60,a6),a0
	lea.l CPS0PaletteDirect,a1
	moveq #$c,d7

loc_0af042:
	move.b (a0)+,d0
	move.b d0,d1
	andi.w #$f0,d1
	cmpi.w #$f0,d1
	beq.b loc_0af056
	add.w d1,d1
	bsr.b loc_0af076
	bra.b loc_0af05a

loc_0af056:
	lea.l ($20,a1),a1

loc_0af05a:
	move.b d0,d1
	andi.w #$f,d1
	cmpi.w #$f,d1
	beq.b loc_0af06c
	lsl.w #5,d1
	bsr.b loc_0af076
	bra.b loc_0af070

loc_0af06c:
	lea.l ($20,a1),a1

loc_0af070:
	dbra d7,loc_0af042
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af076:
	movea.l ($40,a6),a2
	lea.l (a2,d1.w),a2
	moveq #$f,d3

loc_0af080:
	move.w (a1),d1
	andi.w #$f000,d1
	move.w (a2)+,d2
	andi.w #$fff,d2
	or.w d2,d1
	move.w d1,(a1)+
	dbra d3,loc_0af080
	rts

;----------------------------------------------
loc_0af096:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af09c:
	move.w ($250,a5),d0
	andi.w #$1f0,d0
	movem.l loc_0af0b2(pc,d0.w),d1-d4
	movem.l d1-d4,($60,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af0b2:
	dc.l $00000123,$456789ab,$bbbbbbbb,$00ffffff
	dc.l $00000012,$3456789a,$bbbbbbbb,$b0ffffff
	dc.l $00000001,$23456789,$abbbbbbb,$b0ffffff
	dc.l $00000000,$12345678,$9abbbbbb,$bbffffff
	dc.l $00000000,$01234567,$89abbbbb,$bbffffff
	dc.l $b0000000,$00123456,$789abbbb,$bbffffff
	dc.l $bb000000,$00012345,$6789abbb,$bbffffff
	dc.l $bbb00000,$00001234,$56789bbb,$bbffffff
	dc.l $bbbb0000,$00000123,$45678abb,$bbffffff
	dc.l $bbbbb000,$00000012,$345679bb,$bbffffff
	dc.l $bbbbbb00,$00000001,$234568ab,$bbffffff
	dc.l $bbbbbbb0,$00000000,$1234579b,$bbffffff
	dc.l $bbbbbbbb,$00000000,$0123468a,$bbffffff
	dc.l $bbbbbbbb,$b0000000,$00123579,$bbffffff
	dc.l $bbbbbbbb,$bb000000,$00012468,$abffffff
	dc.l $bbbbbbbb,$bbb00000,$00001357,$9bffffff
	dc.l $bbbbbbbb,$bbbb0000,$00000246,$8affffff
	dc.l $bbbbbbbb,$bbbbb000,$00000135,$79ffffff
	dc.l $abbbbbbb,$bbbbbb00,$00000024,$68ffffff
	dc.l $9abbbbbb,$bbbbbbb0,$00000013,$57ffffff
	dc.l $89abbbbb,$bbbbbbbb,$00000002,$46ffffff
	dc.l $789abbbb,$bbbbbbbb,$b0000001,$35ffffff
	dc.l $6789abbb,$bbbbbbbb,$bb000000,$24ffffff
	dc.l $56789abb,$bbbbbbbb,$bbb00000,$13ffffff
	dc.l $456789ab,$bbbbbbbb,$bbbb0000,$02ffffff
	dc.l $3456789a,$bbbbbbbb,$bbbbb000,$01ffffff
	dc.l $23456789,$abbbbbbb,$bbbbb000,$00ffffff
	dc.l $12345678,$9abbbbbb,$bbbbbb00,$00ffffff
	dc.l $01234567,$89abbbbb,$bbbbbb00,$00ffffff
	dc.l $00123456,$789abbbb,$bbbbbbb0,$00ffffff
	dc.l $00012345,$6789abbb,$bbbbbbb0,$00ffffff
	dc.l $00001234,$56789abb,$bbbbbbbb,$00ffffff

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af2b2:
	bsr.w loc_0af09c
	lea.l ($60,a6),a0
	lea.l ($70,a6),a1
	moveq #$c,d7

loc_0af2c0:
	move.b (a0),d0
	move.b d0,d2
	andi.b #$f0,d2
	andi.b #$f,d0
	move.b (a1),d1
	move.b d1,d3
	andi.b #$f0,d3
	andi.b #$f,d1
	cmp.b d2,d3
	beq.b loc_0af2e0
	move.b d2,d3
	bra.b loc_0af2e4

loc_0af2e0:
	move.w #$f0,d2

loc_0af2e4:
	cmp.b d0,d1
	beq.b loc_0af2ec
	move.b d0,d1
	bra.b loc_0af2ee

loc_0af2ec:
	moveq #$f,d0

loc_0af2ee:
	or.b d2,d0
	or.b d3,d1
	move.b d0,(a0)+
	move.b d1,(a1)+
	dbra d7,loc_0af2c0
	rts

;==============================================
loc_0af2fc:
	move.b (4,a6),d0
	move.w loc_0af308(pc,d0.w),d1
	jmp loc_0af308(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af308:
	dc.w loc_0af310-loc_0af308
	dc.w loc_0af31e-loc_0af308
	dc.w loc_0af35e-loc_0af308
	dc.w loc_0af35e-loc_0af308

;----------------------------------------------
loc_0af310:
	addq.b #2,(4,a6)
	lea.l loc_0af364(pc),a0
	jmp loc_01b730

;----------------------------------------------
loc_0af31e:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0af358
	move.w ($34,a6),d2
	beq.b loc_0af34c
	clr.w ($34,a6)
	jsr RNGFunction
	add.b ($81,a5),d0
	btst #0,d0
	bne.b loc_0af34c
	andi.w #$ff,d0
	add.w d2,d0
	move.w d0,($3a,a6)

loc_0af34c:
	tst.w ($3a,a6)
	bne.b loc_0af358
	jmp loc_01b6f8

loc_0af358:
	subq.w #1,($3a,a6)
	rts

;----------------------------------------------
loc_0af35e
	jmp loc_01c32e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af364:
	dc.w $0200,$0020
	dc.l loc_0af388
	dc.w $0200,$0000
	dc.l loc_0af38e
	dc.w $0200,$0000
	dc.l loc_0af394
	dc.w $0280,$0000
	dc.l loc_0af38e
	dc.l loc_0af364

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af388:
	dc.w $0ce0,$000c,$0001

loc_0af38e:
	dc.w $0ce0,$000c,$0021

loc_0af394:
	dc.w $0ce0,$000c,$0041

;==============================================
loc_0af39a:
	move.b (4,a6),d0
	move.w loc_0af3a6(pc,d0.w),d1
	jmp loc_0af3a6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af3a6:
	dc.w loc_0af3ae-loc_0af3a6
	dc.w loc_0af3b8-loc_0af3a6
	dc.w loc_0af3da-loc_0af3a6
	dc.w loc_0af3da-loc_0af3a6

;----------------------------------------------
loc_0af3ae:
	addq.b #$2,(4,a6)
	move.w #$ffff,($3a,a6)

loc_0af3b8:
	moveq #0,d0
	cmpi.w #$1c0,($290,a5)
	bcs.b loc_0af3c4
	moveq #1,d0

loc_0af3c4:
	cmp.w ($3a,a6),d0
	beq.b loc_0af3d8
	move.w d0,($3a,a6)
	lea.l loc_0af3e0(pc),a0
	jmp loc_01b722

loc_0af3d8:
	rts

;----------------------------------------------
loc_0af3da:
	jmp loc_01c32e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af3e0:
	dc.w loc_0af3e4-loc_0af3e0
	dc.w loc_0af3ec-loc_0af3e0

loc_0af3e4:
	dc.w $ff40,$0000
	dc.l loc_0af3f4

loc_0af3ec:
	dc.w $ff40,$0000
	dc.l loc_0af400

loc_0af3f4:
	dc.w $0bc0,$0008,$0000
	dc.w $0be0,$0008,$0021

loc_0af400:
	dc.w $0bc0,$0008,$0040
	dc.w $0be0,$0008,$0061

;==============================================
loc_0af40c:
	move.b (4,a6),d0
	move.w loc_0af418(pc,d0.w),d1
	jmp loc_0af418(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af418:
	dc.w loc_0af420-loc_0af418
	dc.w loc_0af43e-loc_0af418
	dc.w loc_0af492-loc_0af418
	dc.w loc_0af492-loc_0af418

;----------------------------------------------
loc_0af420:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #1,($f,a6)
	move.w d0,($c,a6)
	move.b d0,($3c,a6)
	bsr.b loc_0af498
	moveq #6,d0
	jmp loc_0ad566

loc_0af43e:
	move.b (5,a6),d0
	move.w loc_0af450(pc,d0.w),d1
	jsr loc_0af450(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af450:
	dc.w loc_0af454-loc_0af450
	dc.w loc_0af46a-loc_0af450

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af454:
	tst.b ($33,a6)
	bpl.b loc_0af48c
	subq.b #1,($3a,a6)
	bne.b loc_0af480
	addq.b #2,(5,a6)
	addq.b #1,($3c,a6)
	bra.b loc_0af480

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af46a:
	tst.b ($33,a6)
	bpl.b loc_0af48c
	clr.b (5,a6)
	addq.b #1,($3c,a6)
	andi.b #3,($3c,a6)
	bsr.b loc_0af498

loc_0af480:
	moveq #6,d0
	add.b ($3c,a6),d0
	jmp loc_0ad566

loc_0af48c:
	jmp loc_0ad57e

;----------------------------------------------
loc_0af492:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af498:
	jsr RNGFunction
	andi.b #7,d0
	move.b loc_0af4aa(pc,d0.w),($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af4aa:
	dc.b $08,$09,$0a,$0a
	dc.b $0a,$0a,$0b,$0c

;==============================================
loc_0af4b2:
	move.b (4,a6),d0
	move.w loc_0af4be(pc,d0.w),d1
	jmp loc_0af4be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af4be:
	dc.w loc_0af4c6-loc_0af4be
	dc.w loc_0af4f6-loc_0af4be
	dc.w loc_0af546-loc_0af4be
	dc.w loc_0af546-loc_0af4be

;----------------------------------------------
loc_0af4c6:
	addq.b #2,(4,a6)
	st.b (1,a6)
	moveq #3,d0
	movea.l #loc_3c7624,a0
	jsr loc_01b926
	moveq #0,d0
	lea.l ($40,a6),a2
	bsr.b loc_0af554
	moveq #1,d0
	lea.l ($48,a6),a2
	bsr.b loc_0af554
	move.w ($360,a5),d0
	move.w d0,($3a,a6)
	bra.b loc_0af536

;----------------------------------------------
loc_0af4f6:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0af544
	move.b ($35a,a5),d0
	cmp.b ($14,a6),d0
	beq.b loc_0af51a
	move.b d0,($14,a6)
	movea.l ($1c,a6),a0
	jsr loc_01b93c
	bra.b loc_0af520

loc_0af51a:
	jsr loc_01b8fc

loc_0af520:
	lea.l ($40,a6),a2
	bsr.b loc_0af54c
	lea.l ($48,a6),a2
	bsr.b loc_0af54c
	move.w ($3a,a6),d0
	cmp.w ($64,a6),d0
	beq.b loc_0af53e

loc_0af536:
	move.w d0,($64,a6)
	bsr.w loc_0af600

loc_0af53e:
	move.w ($360,a5),($3a,a6)

loc_0af544:
	rts

;----------------------------------------------
loc_0af546:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af54c:
	subq.w #1,(2,a2)
	beq.b loc_0af55e
	rts

loc_0af554:
	add.w d0,d0
	move.w loc_0af5a0(pc,d0.w),(a2)
	clr.w (4,a2)

loc_0af55e:
	move.w (a2),d2
	move.w loc_0af5a0(pc,d2.w),(2,a2)
	move.w loc_0af5a0+2(pc,d2.w),d1

loc_0af56a:
	move.w d2,d0
	add.w (4,a2),d0
	move.w loc_0af5a0+4(pc,d0.w),d0
	bpl.b loc_0af57c
	clr.w (4,a2)
	bra.b loc_0af56a

loc_0af57c:
	addq.w #2,(4,a2)
	lea.l loc_363ef4,a0
	add.w ($20,a0),d0
	lea.l (a0,d0.w),a0
	lea.l Cps2PaletteDirect,a1
	lea.l (a1,d1.w),a1
	moveq #0,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af5a0:
	dc.w $0004,$002e,$0001,$0140
	dc.w $0000,$0020,$0040,$0060
	dc.w $0080,$00a0,$00c0,$00e0
	dc.w $0100,$0120,$0100,$00e0
	dc.w $00c0,$00a0,$0080,$0060
	dc.w $0040,$0020,$ffff,$0002
	dc.w $0160,$0140,$0160,$0180
	dc.w $01a0,$01c0,$01e0,$0200
	dc.w $0220,$0240,$0260,$0280
	dc.w $02a0,$0280,$0260,$0240
	dc.w $0220,$0200,$01e0,$01c0
	dc.w $01a0,$0180,$0160,$ffff

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af600:
	lsr.w #2,d0
	move.w loc_0af646(pc,d0.w),d0
	lea.l loc_0af646(pc,d0.w),a2
	lea.l MainpaletteDirect,a3
	moveq #2,d5

loc_0af612:
	move.w (a2)+,d0
	lea.l (a3,d0.w),a1
	move.w (a2)+,d0
	movea.l loc_0af636(pc,d0.w),a0
	move.w (a2)+,d0
	add.w ($20,a0),d0
	lea.l (a0,d0.w),a0
	move.w (a2)+,d7
	jsr loc_01b7c0
	dbra d5,loc_0af612
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af636:
	dc.l loc_34c514,loc_361354
	dc.l loc_362a14,loc_363ef4

loc_0af646:
	dc.w loc_0af666-loc_0af646
	dc.w loc_0af64e-loc_0af646
	dc.w loc_0af666-loc_0af646
	dc.w loc_0af67e-loc_0af646

loc_0af64e:
	dc.w $01e0,$0000,$0000
	dc.w $0005,$0400,$0004
	dc.w $0000,$0002,$0800
	dc.w $0008,$0000,$000c

loc_0af666:
	dc.w $01e0,$0000,$00c0
	dc.w $0005,$0400,$0004
	dc.w $0060,$0002,$0800
	dc.w $0008,$01a0,$000c

loc_0af67e:
	dc.w $01e0,$0000,$0180
	dc.w $0005,$0400,$0004
	dc.w $00c0,$0002,$0800
	dc.w $0008,$0340,$000c

;==============================================
loc_0af696:
	move.b (4,a6),d0
	move.w loc_0af6a2(pc,d0.w),d1
	jmp loc_0af6a2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af6a2:
	dc.w loc_0af6aa-loc_0af6a2
	dc.w loc_0af6dc-loc_0af6a2
	dc.w loc_0af734-loc_0af6a2
	dc.w loc_0af734-loc_0af6a2

;----------------------------------------------
loc_0af6aa:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b ($b,a6),(3,a6)
	move.b #1,($f,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #3,($31,a6)
	bsr.w loc_0af73a
	bsr.w loc_0af74e
	moveq #8,d0
	jsr loc_0ad566
	moveq #0,d0

;----------------------------------------------
loc_0af6dc:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0af6f2
	move.b (5,a6),d0
	move.w loc_0af6fa(pc,d0.w),d1
	jsr loc_0af6fa(pc,d1.w)

loc_0af6f2:
	moveq #0,d6
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af6fa:
	dc.w loc_0af6fe-loc_0af6fa
	dc.w loc_0af720-loc_0af6fa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af6fe:
	subq.w #1,($3a,a6)
	bpl.b loc_0af70c
	addq.b #2,(5,a6)
	bsr.w loc_0af73a

loc_0af70c:
	subq.b #1,($31,a6)
	bpl.b loc_0af71c
	move.b #3,($31,a6)
	bsr.w loc_0af74e

loc_0af71c:
	bra.w loc_0af75e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af720:
	subq.w #1,($3a,a6)
	bpl.b loc_0af732
	clr.b (5,a6)
	bsr.w loc_0af73a
	bra.w loc_0af74e

loc_0af732:
	rts

;----------------------------------------------
loc_0af734:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af73a:
	jsr RNGFunction
	andi.w #$ff,d0
	addi.w #$7f,d0
	move.w d0,($3a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af74e:
	jsr RNGFunction
	andi.w #$f,d0
	move.b d0,($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af75e:
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #3,d0
	move.l loc_0af798(pc,d0.w),d1
	move.l loc_0af798+4(pc,d0.w),d2
	move.w ($10,a6),d0
	subi.w #$3b0,d0
	cmpi.w #$50,d0
	bhi.b loc_0af77e
	neg.l d1

loc_0af77e:
	move.w ($14,a6),d0
	subi.w #$40,d0
	cmpi.w #$80,d0
	bhi.b loc_0af78e
	neg.l d2

loc_0af78e:
	add.l d1,($10,a6)
	add.l d2,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af798:
	dc.l $00000000,$00010000
	dc.l $000061c0,$0000ec40
	dc.l $0000b4f0,$0000b4f0
	dc.l $0000ec40,$000061c0
	dc.l $00010000,$00000000
	dc.l $0000ec40,$ffff9e40
	dc.l $0000b4f0,$ffff4b10
	dc.l $000061c0,$ffff13c0
	dc.l $00000000,$ffff0000
	dc.l $ffff9e40,$ffff13c0
	dc.l $ffff4b10,$ffff4b10
	dc.l $ffff13c0,$ffff9e40
	dc.l $ffff0000,$00000000
	dc.l $ffff13c0,$000061c0
	dc.l $ffff4b10,$0000b4f0
	dc.l $ffff9e40,$0000ec40

;==============================================
loc_0af818:
	move.b (4,a6),d0
	move.w loc_0af824(pc,d0.w),d1
	jmp loc_0af824(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af824:
	dc.w loc_0af82c-loc_0af824
	dc.w loc_0af8a6-loc_0af824
	dc.w loc_0af94e-loc_0af824
	dc.w loc_0af94e-loc_0af824

;----------------------------------------------
loc_0af82c:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	move.l ($10,a6),($48,a6)
	move.l ($14,a6),($4c,a6)
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w d0,($44,a6)
	moveq #0,d0
	move.w d0,($c,a6)
	move.w d0,($46,a6)
	move.b (3,a6),d0
	lsl.w #3,d0
	move.l loc_0af886(pc,d0.w),($50,a6)
	move.l loc_0af886+4(pc,d0.w),($40,a6)
	jsr RNGFunction
	andi.w #1,d0
	move.w d0,($54,a6)
	bsr.w loc_0af9a0
	move.b (3,a6),d0
	bsr.w loc_0af954
	moveq #0,d0
	bra.b loc_0af8a6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af886:
	dc.l $00000000,$00000000
	dc.l $00000000,$00000000
	dc.l $01e00000,$fffff000
	dc.l $00b00000,$fffffc00

;----------------------------------------------
loc_0af8a6:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0af8be
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0af8c8(pc,d0.w),d1
	jsr loc_0af8c8(pc,d1.w)

loc_0af8be:
	move.w ($44,a6),d6
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af8c8:
	dc.w loc_0af8d0-loc_0af8c8
	dc.w loc_0af8d0-loc_0af8c8
	dc.w loc_0af8ea-loc_0af8c8
	dc.w loc_0af912-loc_0af8c8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af8d0:
	tst.w ($3a,a6)
	bne.b loc_0af8e2
	eori.w #1,($54,a6)
	bsr.w loc_0af9a0
	bra.b loc_0af8e6

loc_0af8e2:
	subq.w #1,($3a,a6)

loc_0af8e6:
	bra.w loc_0afa0e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af8ea:
	tst.w ($46,a6)
	bne.b loc_0af90a
	move.l ($40,a6),d0
	add.l d0,($50,a6)
	cmpi.w #$1e0,($50,a6)
	bls.b loc_0af90e
	neg.l ($40,a6)
	bsr.b loc_0af954
	bsr.b loc_0af976
	bra.b loc_0af90e

loc_0af90a:
	subq.w #1,($46,a6)

loc_0af90e:
	bra.w loc_0afa0e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0af912:
	tst.w ($46,a6)
	bne.b loc_0af946
	move.l ($40,a6),d0
	add.l d0,($50,a6)
	cmpi.w #$d0,($50,a6)
	bne.b loc_0af934
	jsr RNGFunction
	andi.w #7,d0
	beq.b loc_0af942

loc_0af934:
	cmpi.w #$1e0,($50,a6)
	bls.b loc_0af94a
	neg.l ($40,a6)
	bsr.b loc_0af954

loc_0af942:
	bsr.b loc_0af976
	bra.b loc_0af94a

loc_0af946:
	subq.w #1,($46,a6)

loc_0af94a:
	bra.w loc_0af9cc

;----------------------------------------------
loc_0af94e:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af954:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	tst.b ($40,a6)
	bmi.b loc_0af964
	addq.w #1,d0

loc_0af964:
	move.b loc_0af96e(pc,d0.w),d0
	jmp loc_0ad566

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af96e:
	dc.b $00,$00,$01,$01
	dc.b $02,$03,$05,$06

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af976:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$e,d0
	andi.w #$3f,d1
	add.w loc_0af990(pc,d0.w),d1
	move.w d1,($46,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af990:
	dc.w $0040,$0080,$00c0,$0100
	dc.w $0140,$0180,$01c0,$0200

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af9a0:
	jsr RNGFunction
	moveq #0,d1
	move.b (3,a6),d1
	lsl.w #2,d1
	and.w loc_0af9bc(pc,d1.w),d0
	add.w loc_0af9bc+2(pc,d1.w),d0
	move.w d0,($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0af9bc:
	dc.w $003f,$0080,$003f,$00c0
	dc.w $0000,$0000,$0000,$0000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0af9cc:
	move.l ($288,a5),d1
	sub.l ($2a0,a5),d1
	sub.l ($398,a5),d1
	move.l ($28c,a5),d2
	sub.l ($2a4,a5),d2
	move.l d1,d0
	asr.l #3,d0
	sub.l d0,d1
	asr.l #1,d0
	sub.l d0,d1
	move.l d2,d0
	asr.l #3,d0
	sub.l d0,d2
	asr.l #2,d0
	sub.l d0,d2
	add.l ($48,a6),d1
	add.l ($50,a6),d1
	move.l d1,($10,a6)
	add.l ($4c,a6),d2
	sub.l ($54,a6),d2
	move.l d2,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0afa0e:
	move.l ($288,a5),d1
	sub.l ($2a0,a5),d1
	sub.l ($398,a5),d1
	move.l ($28c,a5),d2
	sub.l ($2a4,a5),d2
	move.l d1,d0
	asr.l #3,d0
	sub.l d0,d1
	move.l d2,d0
	asr.l #3,d0
	sub.l d0,d2
	add.l ($48,a6),d1
	add.l ($50,a6),d1
	move.l d1,($10,a6)
	add.l ($4c,a6),d2
	sub.l ($54,a6),d2
	move.l d2,($14,a6)
	rts

;==============================================
loc_0afa48:
	move.b (4,a6),d0
	move.w loc_0afa54(pc,d0.w),d1
	jmp loc_0afa54(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afa54:
	dc.w loc_0afa5c-loc_0afa54
	dc.w loc_0afa80-loc_0afa54
	dc.w loc_0afb32-loc_0afa54
	dc.w loc_0afb32-loc_0afa54

;----------------------------------------------
loc_0afa5c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b ($b,a6),(3,a6)
	move.b #1,($f,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	moveq #$b,d0
	jsr loc_0ad566
	moveq #0,d0

loc_0afa80:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0afa96
	move.b (5,a6),d0
	move.w loc_0afa9e(pc,d0.w),d1
	jsr loc_0afa9e(pc,d1.w)

loc_0afa96:
	moveq #$58,d6
	jmp loc_01b4b0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afa9e:
	dc.w loc_0afaa6-loc_0afa9e
	dc.w loc_0afad6-loc_0afa9e
	dc.w loc_0afaec-loc_0afa9e
	dc.w loc_0afb1c-loc_0afa9e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0afaa6:
	addq.b #2,(5,a6)
	move.l #$3000000,($10,a6)
	move.l #$f00000,($14,a6)
	move.l #$ffff6000,($40,a6)
	move.l #$ffffee00,($44,a6)
	bsr.w loc_0afb4a
	moveq #9,d0
	jmp loc_0ad566

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0afad6:
	cmpi.w #$40,($10,a6)
	bcc.b loc_0afae2
	addq.b #2,(5,a6)

loc_0afae2:
	bsr.w loc_0afb38
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0afaec:
	addq.b #2,(5,a6)
	move.l #$400000,($10,a6)
	move.l #$a10000,($14,a6)
	move.l #$a000,($40,a6)
	move.l #$1200,($44,a6)
	bsr.w loc_0afb4a
	moveq #$a,d0
	jmp loc_0ad566

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0afb1c:
	cmpi.w #$300,($10,a6)
	bcs.b loc_0afae2
	clr.b (5,a6)
	bsr.w loc_0afb38
	jmp loc_01b6b6

;----------------------------------------------
loc_0afb32:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0afb38:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0afb4a:
	movea.l #loc_34c514,a0
	move.w ($22,a0),d0
	moveq #0,d1
	move.b ($3c,a6),d1
	addq.b #1,d1
	andi.b #3,d1
	move.b d1,($3c,a6)
	lsl.w #5,d1
	add.w d1,d0
	lea.l (a0,d0.w),a0
	lea.l $90c220,a1
	jmp loc_02f41c

;==============================================
loc_0afb78:
	move.b (4,a6),d0
	move.w loc_0afb84(pc,d0.w),d1
	jmp loc_0afb84(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afb84:
	dc.w loc_0afb8c-loc_0afb84
	dc.w loc_0afbbc-loc_0afb84
	dc.w loc_0afbea-loc_0afb84
	dc.w loc_0afbea-loc_0afb84

;----------------------------------------------
loc_0afb8c:
	tst.b ($107,a5)
	beq.b loc_0afbe8
	tst.b ($11c,a5)
	bne.b loc_0afbe8
	addq.b #2,(4,a6)
	st.b (1,a6)
	cmpi.w #8,(Region,a5)
	bne.b loc_0afbae
	addi.w #$100,($14,a6)

loc_0afbae:
	move.b (3,a6),d0
	lea.l loc_0afbf0(pc),a0
	jmp loc_01b722

;----------------------------------------------
loc_0afbbc:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_0afbe8
	jsr loc_01b6f8
	tst.b ($35,a6)
	beq.b loc_0afbe8
	clr.b ($35,a6)
	movea.l #loc_3b2e54,a0
	move.w (a0),d0
	lea.l (a0,d0.w),a0
	jmp loc_01b840

loc_0afbe8:
	rts

;----------------------------------------------
loc_0afbea:
	jmp loc_01c32e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afbf0:
	dc.w loc_0afbf4-loc_0afbf0
	dc.w loc_0afc60-loc_0afbf0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afbf4:
	dc.w $0800,$0000
	dc.l loc_0afcc4
	dc.w $0800,$0000
	dc.l loc_0afcdc
	dc.w $0800,$0000
	dc.l loc_0afcf4
	dc.w $0800,$0000
	dc.l loc_0afd0c
	dc.w $0800,$0000
	dc.l loc_0afd24
	dc.w $0800,$0000
	dc.l loc_0afd3c
	dc.w $0800,$0001
	dc.l loc_0afd54
	dc.w $0800,$0000
	dc.l loc_0afd60
	dc.w $0800,$0000
	dc.l loc_0afd6c
	dc.w $0800,$0000
	dc.l loc_0afd78
	dc.w $0800,$0000
	dc.l loc_0afd84

loc_0afc4c:
	dc.w $0800,$0000
	dc.l loc_0afd90
	dc.w $0880,$0000
	dc.l loc_0afd9c
	dc.l loc_0afc4c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afc60:
	dc.w $0400,$0000
	dc.l loc_0afda8
	dc.w $0400,$0000
	dc.l loc_0afdf0
	dc.w $0400,$0000
	dc.l loc_0afdba
	dc.w $0400,$0000
	dc.l loc_0afe08
	dc.w $0400,$0000
	dc.l loc_0afdcc
	dc.w $0400,$0000
	dc.l loc_0afe20
	dc.w $0400,$0000
	dc.l loc_0afdde
	dc.w $0400,$0000
	dc.l loc_0afdf0
	dc.w $0400,$0000
	dc.l loc_0afdcc
	dc.w $0400,$0000
	dc.l loc_0afe08
	dc.w $0400,$0000
	dc.l loc_0afdba
	dc.w $0480,$0000
	dc.l loc_0afe20
	dc.l loc_0afc60

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afcc4:
	dc.w $0400,$0004,$0000
	dc.w $0420,$0004,$0020
	dc.w $0440,$0004,$0040
	dc.w $0460,$0004,$0061

loc_0afcdc:
	dc.w $0400,$0004,$0080
	dc.w $0420,$0004,$00a0
	dc.w $0440,$0004,$00c0
	dc.w $0460,$0004,$00e1

loc_0afcf4:
	dc.w $0400,$0004,$0100
	dc.w $0420,$0004,$0120
	dc.w $0440,$0004,$0140
	dc.w $0460,$0004,$0161

loc_0afd0c:
	dc.w $0400,$0004,$0180
	dc.w $0420,$0004,$01a0
	dc.w $0440,$0004,$01c0
	dc.w $0460,$0004,$01e1

loc_0afd24:
	dc.w $0400,$0004,$0200
	dc.w $0420,$0004,$0220
	dc.w $0440,$0004,$0240
	dc.w $0460,$0004,$0261

loc_0afd3c:
	dc.w $0400,$0004,$0280
	dc.w $0420,$0004,$02a0
	dc.w $0440,$0004,$02c0
	dc.w $0460,$0004,$02e1

loc_0afd54:
	dc.w $0400,$0004,$0300
	dc.w $0460,$0004,$0321

loc_0afd60:
	dc.w $0400,$0004,$0340
	dc.w $0460,$0004,$0361

loc_0afd6c:
	dc.w $0400,$0004,$0380
	dc.w $0460,$0004,$03a1

loc_0afd78:
	dc.w $0400,$0004,$03c0
	dc.w $0460,$0004,$03e1

loc_0afd84:
	dc.w $0400,$0004,$0400
	dc.w $0460,$0004,$0421

loc_0afd90:
	dc.w $0400,$0004,$0440
	dc.w $0460,$0004,$0461

loc_0afd9c:
	dc.w $0400,$0004,$0480
	dc.w $0460,$0004,$04a1

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afda8:
	dc.w $0240,$0000,$0100
	dc.w $0260,$0000,$0000
	dc.w $0280,$0000,$0081

loc_0afdba:
	dc.w $0240,$0000,$0120
	dc.w $0260,$0000,$0020
	dc.w $0280,$0000,$00a1

loc_0afdcc:
	dc.w $0240,$0000,$0140
	dc.w $0260,$0000,$0040
	dc.w $0280,$0000,$00c1

loc_0afdde:
	dc.w $0240,$0000,$0160
	dc.w $0260,$0000,$0060
	dc.w $0280,$0000,$00e1

loc_0afdf0:
	dc.w $0520,$0004,$04c0
	dc.w $0540,$0004,$0520
	dc.w $0940,$0008,$0000
	dc.w $0960,$0008,$0061

loc_0afe08:
	dc.w $0520,$0004,$04e0
	dc.w $0540,$0004,$0540
	dc.w $0940,$0008,$0020
	dc.w $0960,$0008,$0081

loc_0afe20:
	dc.w $0520,$0004,$0500
	dc.w $0540,$0004,$0560
	dc.w $0940,$0008,$0040
	dc.w $0960,$0008,$00a1

;==============================================
loc_0afe38:
	move.b (4,a6),d0
	move.w loc_0afe44(pc,d0.w),d1
	jmp loc_0afe44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afe44:
	dc.w loc_0afe4c-loc_0afe44
	dc.w loc_0afe5a-loc_0afe44
	dc.w loc_0aff4e-loc_0afe44
	dc.w loc_0aff4e-loc_0afe44

;----------------------------------------------
loc_0afe4c:
	addq.b #2,(4,a6)
	move.b #1,($f,a6)
	clr.w ($c,a6)

loc_0afe5a:
	bsr.w loc_0aff54
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_0afe72(pc,d0.w),d1
	jsr loc_0afe72(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afe72:
	dc.w loc_0afe76-loc_0afe72
	dc.w loc_0aff14-loc_0afe72

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0afe76:
	move.b (6,a6),d0
	move.w loc_0afe82(pc,d0.w),d1
	jmp loc_0afe82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afe82:
	dc.w loc_0afe8a-loc_0afe82
	dc.w loc_0afeb2-loc_0afe82
	dc.w loc_0afefa-loc_0afe82
	dc.w loc_0aff0e-loc_0afe82

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0afe8a:
	addq.b #2,(6,a6)
	move.w #$160,($10,a6)
	move.w #$30,($14,a6)
	moveq #0,d0
	lea.l loc_0aff78(pc),a0
	jsr loc_01b722
	moveq #4,d0
	move.b d0,($3c,a6)
	jmp loc_0ad566

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0afeb2:
	tst.b ($107,a5)
	bne.b loc_0afef6
	tst.b ($35,a6)
	beq.b loc_0afed0
	jsr RNGFunction
	andi.b #$1f,d0
	add.b d0,($32,a6)
	clr.b ($35,a6)

loc_0afed0:
	tst.b ($33,a6)
	bpl.w loc_0aff72
	jsr RNGFunction
	andi.b #3,d0
	bne.w loc_0aff72
	eori.b #1,($3c,a6)
	move.b ($3c,a6),d0
	jmp loc_0ad566

loc_0afef6:
	addq.b #2,(6,a6)

loc_0afefa:
	tst.b ($11c,a5)
	bne.w loc_0aff72
	addq.b #2,(6,a6)
	moveq #6,d0
	jmp loc_0ad566

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0aff0e:
	jmp loc_0ad57e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0aff14:
	move.b (6,a6),d0
	move.w loc_0aff20(pc,d0.w),d1
	jmp loc_0aff20(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aff20:
	dc.w loc_0aff24-loc_0aff20
	dc.w loc_0aff48-loc_0aff20

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0aff24:
	addq.b #2,(6,a6)
	move.w #$390,($10,a6)
	move.w #$80,($14,a6)
	moveq #1,d0
	lea.l loc_0aff78(pc),a0
	jsr loc_01b722
	moveq #7,d0
	jmp loc_0ad566

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0aff48:
	jmp loc_0ad57e

;----------------------------------------------
loc_0aff4e:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aff54
	moveq #0,d1
	move.w ($290,a5),d0
	cmpi.w #$1c0,d0
	ble.b loc_0aff62
	moveq #2,d1

loc_0aff62:
	cmp.b (5,a6),d1
	beq.b loc_0aff70
	move.b d1,(5,a6)
	clr.b (6,a6)

loc_0aff70:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0aff72:
	jmp loc_0ad57e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0aff78:
	dc.w loc_0aff7c-loc_0aff78
	dc.w loc_0aff84-loc_0aff78

loc_0aff7c:
	dc.w $ff40,$0000
	dc.l loc_0aff8c

loc_0aff84:
	dc.w $ff40,$0000
	dc.l loc_0aff92

loc_0aff8c:
	dc.w $0200,$0000,$0181

loc_0aff92:
	dc.w $0200,$0000,$01a1

;##############################################
loc_0aff98:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0affa6(pc,d0.w),d1
	jmp loc_0affa6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0affa6:
	dc.w loc_0affb0-loc_0affa6
	dc.w loc_0affb0-loc_0affa6
	dc.w loc_0b019e-loc_0affa6
	dc.w loc_0b025c-loc_0affa6
	dc.w loc_0b030c-loc_0affa6

;==============================================
loc_0affb0:
	move.b (4,a6),d0
	move.w loc_0affbc(pc,d0.w),d1
	jmp loc_0affbc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0affbc:
	dc.w loc_0affc4-loc_0affbc
	dc.w loc_0affec-loc_0affbc
	dc.w loc_0b0362-loc_0affbc
	dc.w loc_0b0362-loc_0affbc

;----------------------------------------------
loc_0affc4:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($c,a6)
	move.w d0,($e,a6)
	move.w #$6000,($18,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.b (3,a6),d0
	move.b d0,($b,a6)

loc_0affec:
	move.b (5,a6),d0
	move.w loc_0afffc(pc,d0.w),d1
	jsr loc_0afffc(pc,d1.w)
	bra.w loc_0b0368

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0afffc:
	dc.w loc_0b0000-loc_0afffc
	dc.w loc_0b004a-loc_0afffc

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b0000
	addq.b #2,(5,a6)
	move.b (3,a6),d0
	lsl.w #3,d0
	move.w loc_0b003a(pc,d0.w),($10,a6)
	move.w loc_0b003a+2(pc,d0.w),($14,a6)
	move.w loc_0b003a+4(pc,d0.w),($40,a6)
	move.b ($3c,a6),d0
	jsr loc_02fc88
	add.w d0,d0
	lea.l CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	move.l ($c,a0),($60,a6)
	bra.b loc_0b007a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b003a:
	dc.w $01c0,$0090,$fc00,$0000
	dc.w $ffc0,$0020,$0400,$0000

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b004a:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	addi.w #$48,d0
	cmpi.w #$210,d0
	bls.b loc_0b0068
	addq.b #2,(4,a6)

loc_0b0068:
	tst.b ($33,a6)
	bpl.b loc_0b0098
	addq.b #1,($3a,a6)
	cmpi.b #6,($3a,a6)
	bcs.b loc_0b007e

loc_0b007a:
	clr.b ($3a,a6)

loc_0b007e:
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #3,d0
	add.b ($3a,a6),d0
	move.b loc_0b009e(pc,d0.w),d0
	movea.l ($60,a6),a0
	jmp loc_01b6e0

loc_0b0098:
	jmp loc_01b692

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b009e:
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $00,$01,$02,$03,$04,$05,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00
	dc.b $01,$03,$05,$07,$09,$0b,$00,$00

;----------------------------------------------
loc_0b019e:
	move.b (4,a6),d0
	move.w loc_0b01aa(pc,d0.w),d1
	jmp loc_0b01aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b01aa:
	dc.w loc_0b01b2-loc_0b01aa
	dc.w loc_0b020e-loc_0b01aa
	dc.w loc_0b0362-loc_0b01aa
	dc.w loc_0b0362-loc_0b01aa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b01b2:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w #$100,($c,a6)
	move.w d0,($e,a6)
	move.w #$6000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.l d0,($40,a6)
	move.w d0,($10,a6)
	move.b ($3c,a6),d0
	lsl.w #2,d0
	move.w loc_0b0202(pc,d0.w),($14,a6)
	move.w loc_0b0202+2(pc,d0.w),($48,a6)
	moveq #5,d0
	add.b ($89,a5),d0
	moveq #0,d1
	jmp loc_08733e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0202:
	dc.w $00e8,$fe00
	dc.w $0080,$fe00
	dc.w $0018,$fe00

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b020e:
	move.w ($34,a6),d0
	move.w ($48,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($40,a6)

loc_0b021e:
	tst.w ($40,a6)
	bpl.b loc_0b022a
	add.w d0,($40,a6)
	bra.b loc_0b021e

loc_0b022a:
	cmp.w ($40,a6),d0
	bgt.w loc_0b0238
	sub.w d0,($40,a6)
	bra.b loc_0b022a

loc_0b0238:
	move.w ($40,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($10,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1
	moveq #5,d0
	add.b ($89,a5),d0
	jsr loc_08733e
	bra.w loc_0b0368

;==============================================
loc_0b025c:
	move.b (4,a6),d0
	move.w loc_0b0268(pc,d0.w),d1
	jmp loc_0b0268(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0268:
	dc.w loc_0b0270-loc_0b0268
	dc.w loc_0b02d8-loc_0b0268
	dc.w loc_0b0362-loc_0b0268
	dc.w loc_0b0362-loc_0b0268

;----------------------------------------------
loc_0b0270:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w #$100,($c,a6)
	move.w d0,($e,a6)
	move.w #$6000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.l d0,($40,a6)
	move.w d0,($10,a6)
	move.b ($a,a6),d0
	lsl.w #2,d0
	move.w loc_0b02c8(pc,d0.w),($14,a6)
	move.w loc_0b02c8+2(pc,d0.w),($48,a6)
	moveq #$d,d0
	tst.w (Region,a5)
	beq.b loc_0b02bc
	addq.w #1,d0

loc_0b02bc:
	move.b ($3c,a6),d1
	lsl.w #3,d1
	jmp loc_09877a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b02c8:
	dc.w $00dc,$0100
	dc.w $008b,$0100
	dc.w $0074,$0100
	dc.w $0023,$0100

;----------------------------------------------
loc_0b02d8:
	move.w ($34,a6),d0
	move.w ($48,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($40,a6)

loc_0b02e8:
	tst.w ($40,a6)
	bpl.b loc_0b02f4
	add.w d0,($40,a6)
	bra.b loc_0b02e8

loc_0b02f4:
	cmp.w ($40,a6),d0
	bgt.w loc_0b0302
	sub.w d0,($40,a6)
	bra.b loc_0b02f4

loc_0b0302:
	move.w ($40,a6),($10,a6)
	bra.w loc_0b0368

;==============================================
loc_0b030c:
	move.b (4,a6),d0
	move.w loc_0b0318(pc,d0.w),d1
	jmp loc_0b0318(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0318:
	dc.w loc_0b0320-loc_0b0318
	dc.w loc_0b035e-loc_0b0318
	dc.w loc_0b0362-loc_0b0318
	dc.w loc_0b0362-loc_0b0318

;----------------------------------------------
loc_0b0320:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w #$100,($c,a6)
	move.w d0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w #$c0,($10,a6)
	move.w #$f0,($14,a6)
	moveq #9,d0
	moveq #$18,d1
	jsr loc_09877a

loc_0b035e:
	bra.w loc_0b0368

;----------------------------------------------
loc_0b0362:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0368:
	tst.b ($a,a5)
	beq.b loc_0b0374
	jmp loc_01b4d0

loc_0b0374:
	clr.b (1,a6)
	rts
