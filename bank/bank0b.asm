;##############################################
loc_0b037a:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0b0388(pc,d0.w),d1
	jmp loc_0b0388(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0388:
	dc.w loc_0b0394-loc_0b0388
	dc.w loc_0b0394-loc_0b0388
	dc.w loc_0b040c-loc_0b0388
	dc.w loc_0b0490-loc_0b0388
	dc.w loc_0b04f0-loc_0b0388
	dc.w loc_0b06e2-loc_0b0388

;==============================================
loc_0b0394:
	move.b (4,a6),d0
	move.w loc_0b03a0(pc,d0.w),d1
	jmp loc_0b03a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b03a0:
	dc.w loc_0b03a8-loc_0b03a0
	dc.w loc_0b0402-loc_0b03a0
	dc.w loc_0b075e-loc_0b03a0
	dc.w loc_0b075e-loc_0b03a0

;----------------------------------------------
loc_0b03a8:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d0
	move.w loc_0b03fa(pc,d0.w),($10,a6)
	move.w loc_0b03fa+2(pc,d0.w),($14,a6)
	moveq #$10,d0
	add.b (3,a6),d0
	lea.l loc_2f2de8,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b03fa:
	dc.w $0150,$01b0
	dc.w $0060,$01c0

;----------------------------------------------
loc_0b0402:
	jsr loc_01b6b6
	bra.w loc_0b0764

;==============================================
loc_0b040c:
	move.b (4,a6),d0
	move.w loc_0b0418(pc,d0.w),d1
	jmp loc_0b0418(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0418:
	dc.w loc_0b0420-loc_0b0418
	dc.w loc_0b046a-loc_0b0418
	dc.w loc_0b075e-loc_0b0418
	dc.w loc_0b075e-loc_0b0418

;----------------------------------------------
loc_0b0420:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.b d0,($3c,a6)
	move.w #$50,($10,a6)
	move.w #$1a0,($14,a6)
	moveq #$12,d0
	lea.l loc_2f2de8,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0b046a:
	move.b (5,a6),d0
	move.w loc_0b047a(pc,d0.w),d1
	jsr loc_0b047a(pc,d1.w)
	bra.w loc_0b0764

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b047a:
	dc.w loc_0b047e-loc_0b047a
	dc.w loc_0b048a-loc_0b047a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b047e:
	tst.w ($12,a5)
	bpl.b loc_0b0488
	addq.b #2,(5,a6)

loc_0b0488:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b048a:
	jmp loc_01b6b6

;==============================================
loc_0b0490:
 	move.b (4,a6),d0
 	move.w loc_0b049c(pc,d0.w),d1
 	jmp loc_0b049c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b049c:
	dc.w loc_0b04a4-loc_0b049c
	dc.w loc_0b04ec-loc_0b049c
	dc.w loc_0b075e-loc_0b049c
	dc.w loc_0b075e-loc_0b049c

;----------------------------------------------
loc_0b04a4:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #$c,($e,a6)
	move.b d0,($f,a6)
	move.w #$6000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w #$6c0,($10,a6)
	move.w #$340,($14,a6)
	moveq #$f,d0
	lea.l loc_2f2de8,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0b04ec:
	bra.w loc_0b0764

;==============================================
loc_0b04f0:
	move.b (4,a6),d0
	move.w loc_0b04fc(pc,d0.w),d1
	jmp loc_0b04fc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b04fc:
	dc.w loc_0b0504-loc_0b04fc
	dc.w loc_0b053c-loc_0b04fc
	dc.w loc_0b075e-loc_0b04fc
	dc.w loc_0b075e-loc_0b04fc

;----------------------------------------------
loc_0b0504:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.b #$ff,($c,a6)
	move.w d0,($e,a6)
	move.w #$a000,($18,a6)
	move.w d0,($26,a6)
	bsr.w loc_0b0698
	jsr RNGFunction
	andi.w #$1f,d0
	addq.b #1,d0
	move.b d0,($3a,a6)
	rts

;----------------------------------------------
loc_0b053c:
	move.b (5,a6),d0
	move.w loc_0b0548(pc,d0.w),d1
	jmp loc_0b0548(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0548:
	dc.w loc_0b054c-loc_0b0548
	dc.w loc_0b0584-loc_0b0548

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b054c:
	movea.l ($60,a6),a0
	cmpi.w #$280,(a0)
	beq.b loc_0b0568
	move.b ($3c,a6),d0
	move.w ($12,a5),d1
	btst d0,d1
	beq.b loc_0b0568
	addq.b #2,(4,a6)
	bra.b loc_0b0582

loc_0b0568:
	subq.b #1,($3a,a6)
	bne.b loc_0b0582
	addq.b #2,(5,a6)
	bsr.w loc_0b05b0
	bsr.w loc_0b0672
	bsr.w loc_0b06b0
	bra.w loc_0b0764

loc_0b0582:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b0584:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($4a,a6),d0
	cmp.w ($10,a6),d0
	bgt.b loc_0b05ac
	clr.b (5,a6)
	jsr RNGFunction
	andi.b #$f,d0
	move.b d0,($3a,a6)

loc_0b05ac:
	bra.w loc_0b0764

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b05b0:
	move.b ($81,a5),d0
	add.b ($b5,a5),d0
	andi.w #1,d0
	add.w d0,d0
	move.w loc_0b05c6(pc,d0.w),d1
	jmp loc_0b05c6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b05c6:
	dc.w loc_0b05ca-loc_0b05c6
	dc.w loc_0b0636-loc_0b05c6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0b05ca:
	move.w #$2000,($1a,a6)
	jsr RNGFunction
	andi.w #$3f,d0
	moveq #0,d1
	move.b loc_0b05f6(pc,d0.w),d1
	lsl.w #3,d1
	moveq #$f,d0
	tst.w (Region,a5)
	beq.b loc_0b05ec
	addq.w #2,d0

loc_0b05ec:
	add.b (Dip_SFAlpha,a5),d0
	jmp loc_09877a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b05f6:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$12,$13
	dc.b $14,$15,$16,$17
	dc.b $18,$19,$1a,$1b
	dc.b $1c,$1d,$1e,$1f
	dc.b $20,$21,$22,$23
	dc.b $24,$25,$26,$27
	dc.b $28,$29,$2a,$2b
	dc.b $2c,$2d,$2e,$2f
	dc.b $30,$31,$32,$33
	dc.b $34,$35,$36,$37
	dc.b $38,$39,$3a,$32
	dc.b $33,$34,$3a,$39

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0b0636:
	move.w #$6000,($1a,a6)
	jsr RNGFunction
	move.w d0,d1
	andi.w #$1f,d1
	move.b loc_0b0652(pc,d1.w),d1
	moveq #$13,d0
	bra.w loc_0b0776

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0652:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$0a,$0b
	dc.b $0c,$0d,$0e,$0f
	dc.b $10,$11,$12,$13
	dc.b $14,$15,$16,$17
	dc.b $18,$19,$00,$02
	dc.b $04,$06,$08,$0a

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0672:
	moveq #0,d0
	move.b ($34,a6),d0
	move.w #$180,d1
	add.w d0,d1
	move.w d1,($4a,a6)
	neg.w d0
	move.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	move.w d0,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0698:
	moveq #0,d0
	move.b ($3c,a6),d0
	move.b loc_0b06a6(pc,d0.w),($d,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b06a6:
	dc.b $04,$05,$05,$06
	dc.b $06,$07,$07,$08
	dc.b $08,$09

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b06b0:
	jsr RNGFunction
	andi.w #$7f,d0
	moveq #0,d1
	move.b ($3c,a6),d1
	add.w d1,d1
	move.w loc_0b06ce(pc,d1.w),d1
	add.w d0,d1
	move.w d1,($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b06ce:
	dc.w $0980,$0a00,$0a80,$0b00
	dc.w $0b80,$0c00,$0c80,$0d00
	dc.w $0d80,$0e00

;==============================================
loc_0b06e2:
	move.b (4,a6),d0
	move.w loc_0b06ee(pc,d0.w),d1
	jmp loc_0b06ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b06ee:
	dc.w loc_0b06f6-loc_0b06ee
	dc.w loc_0b0752-loc_0b06ee
	dc.w loc_0b075e-loc_0b06ee
	dc.w loc_0b075e-loc_0b06ee

;----------------------------------------------
loc_0b06f6:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w #$10a,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($16,a6)
	move.w d0,($40,a6)
	move.w #$c0,($10,a6)
	move.b ($3c,a6),d0
	lsl.w #2,d0
	move.b loc_0b074a+1(pc,d0.w),($b,a6)
	move.w loc_0b074a+2(pc,d0.w),($14,a6)
	moveq #9,d0
	moveq #0,d1
	jsr loc_09877a
	bra.b loc_0b0764

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b074a:
	dc.w $0000,$0040
	dc.w $0002,$00c0

;----------------------------------------------
loc_0b0752:
	tst.w ($12,a5)
	bpl.b loc_0b0764
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_0b075e:
	jmp loc_01c32e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0764:
	tst.b ($a,a5)
	beq.b loc_0b0770
	jmp loc_01b4ec

loc_0b0770:
	clr.b (1,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0776:
	add.w d0,d0
	lsl.w #3,d1
	lea.l loc_2f2de8,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;##############################################
loc_0b078e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b079e(pc,d0.w),d1
	jmp loc_0b079e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b079e:
	dc.w loc_0b07a6-loc_0b079e
	dc.w loc_0b07c6-loc_0b079e
	dc.w loc_0b0802-loc_0b079e
	dc.w loc_0b0808-loc_0b079e

;==============================================
loc_0b07a6:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b07c6:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0802
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b081a
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0820
	jmp loc_01b6b6

;==============================================
loc_0b0802:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0808:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0814
	clr.w ($28,a4)

loc_0b0814:
	jmp loc_01c37e

loc_0b081a:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0820:
	move.b d0,($3c,a6)
	movea.l #loc_14ae86,a0
	jmp loc_01b6e0

;##############################################
loc_0b0830:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0840(pc,d0.w),d1
	jmp loc_0b0840(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0840:
	dc.w loc_0b0848-loc_0b0840
	dc.w loc_0b0868-loc_0b0840
	dc.w loc_0b08a4-loc_0b0840
	dc.w loc_0b08aa-loc_0b0840

;==============================================
loc_0b0848:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b0868:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b08a4
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b08bc
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b08c2
	jmp loc_01b6b6

;==============================================
loc_0b08a4:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b08aa:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b08b6
	clr.w ($28,a4)

loc_0b08b6:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b08bc:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b08c2:
	move.b d0,($3c,a6)
	movea.l #loc_157980,a0
	jmp loc_01b6e0

;##############################################
loc_0b08d2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b08e2(pc,d0.w),d1
	jmp loc_0b08e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b08e2:
	dc.w loc_0b08ea-loc_0b08e2
	dc.w loc_0b090a-loc_0b08e2
	dc.w loc_0b0938-loc_0b08e2
	dc.w loc_0b093e-loc_0b08e2

;==============================================
loc_0b08ea:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b090a:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0938
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0950
	bsr.w loc_0b0966
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0956
	jmp loc_01b6b6

;==============================================
loc_0b0938:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b093e:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b094a
	clr.w ($28,a4)

loc_0b094a:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0950:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0956:
	move.b d0,($3c,a6)
	movea.l #loc_1619fe,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0966:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	clr.b ($b,a6)
	tst.b ($b,a4)
	beq.b loc_0b0980
	subq.w #5,($10,a6)

loc_0b0980:
	rts

;##############################################
loc_0b0982:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0992(pc,d0.w),d1
	jmp loc_0b0992(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0992:
	dc.w loc_0b099a-loc_0b0992
	dc.w loc_0b09ba-loc_0b0992
	dc.w loc_0b09f6-loc_0b0992
	dc.w loc_0b09fc-loc_0b0992

;==============================================
loc_0b099a:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b09ba:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b09f6
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0a0e
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0a14
	jmp loc_01b6b6

;==============================================
loc_0b09f6:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b09fc:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0a08
	clr.w ($28,a4)

loc_0b0a08:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0a0e:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0a14:
	move.b d0,($3c,a6)
	movea.l #loc_16cb34,a0
	jmp loc_01b6e0

;##############################################
loc_0b0a24:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0a34(pc,d0.w),d1
	jmp loc_0b0a34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0a34:
	dc.w loc_0b0a3c-loc_0b0a34
	dc.w loc_0b0a5c-loc_0b0a34
	dc.w loc_0b0ad8-loc_0b0a34
	dc.w loc_0b0ade-loc_0b0a34

;==============================================
loc_0b0a3c:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(7,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b0a5c:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (7,a6),d0
	bne.b loc_0b0ad8
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0b0a78(pc,d0.w),d1
	jmp loc_0b0a78(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0a78:
	dc.w loc_0b0a7c-loc_0b0a78
	dc.w loc_0b0aaa-loc_0b0a78

;----------------------------------------------
loc_0b0a7c:
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0b00
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0b06
	jmp loc_01b6b6

;----------------------------------------------
loc_0b0aaa:
	movea.l ($1c,a4),a3
	move.b ($13,a3),d0
	beq.b loc_0b0b00
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0b22
	jmp loc_01b6b6


;==============================================
loc_0b0ad8:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0ade:
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b0ae8:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b0af2
	clr.w (a1)
	bra.b loc_0b0afa

loc_0b0af2:
	lea.l (2,a1),a1
	dbra d0,loc_0b0ae8


loc_0b0afa:
	jmp loc_01c37e

loc_0b0b00:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0b06:
	move.b d0,($3c,a6)
	lea.l loc_17befa,a0
	tst.b ($132,a4)
	bpl.b loc_0b0b1c
	lea.l loc_17bf3c,a0

loc_0b0b1c:
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0b22:
	move.b d0,($3c,a6)
	lea.l loc_17bf7e,a0
	jmp loc_01b6e0

;##############################################
loc_0b0b32:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0b42(pc,d0.w),d1
	jmp loc_0b0b42(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0b42:
	dc.w loc_0b0b4a-loc_0b0b42
	dc.w loc_0b0b6a-loc_0b0b42
	dc.w loc_0b0ba6-loc_0b0b42
	dc.w loc_0b0bac-loc_0b0b42

;==============================================
loc_0b0b4a:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b0b6a:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0ba6
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0bbe
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0bc4
	jmp loc_01b6b6

;==============================================
loc_0b0ba6:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0bac:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0bb8
	clr.w ($28,a4)

loc_0b0bb8:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0bbe:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0bc4:
	move.b d0,($3c,a6)
	movea.l #loc_18a5d2,a0
	jmp loc_01b6e0

;##############################################
loc_0b0bd4:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0be4(pc,d0.w),d1
	jmp loc_0b0be4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0be4:
	dc.w loc_0b0bec-loc_0b0be4
	dc.w loc_0b0c22-loc_0b0be4
	dc.w loc_0b0c5e-loc_0b0be4
	dc.w loc_0b0c64-loc_0b0be4

;==============================================
loc_0b0bec:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)
	movea.l #loc_196fb6,a0
	tst.b ($132,a4)
	bpl.b loc_0b0c1e
	movea.l #loc_19716e,a0

loc_0b0c1e:
	move.l a0,($40,a6)

loc_0b0c22:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0c5e
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0c76
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0c7c
	jmp loc_01b6b6

;==============================================
loc_0b0c5e:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0c64:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0c70
	clr.w ($28,a4)

loc_0b0c70:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0c76:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0c7c:
	move.b d0,($3c,a6)
	movea.l ($40,a6),a0
	jmp loc_01b6e0

;##############################################
loc_0b0c8a:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0c9a(pc,d0.w),d1
	jmp loc_0b0c9a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0c9a:
	dc.w loc_0b0ca2-loc_0b0c9a
	dc.w loc_0b0cc2-loc_0b0c9a
	dc.w loc_0b0cfe-loc_0b0c9a
	dc.w loc_0b0d04-loc_0b0c9a

;==============================================
loc_0b0ca2:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b0cc2:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0cfe
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0d16
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0d1c
	jmp loc_01b6b6

;==============================================
loc_0b0cfe:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0d04:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0d10
	clr.w ($28,a4)

loc_0b0d10:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0d16:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0d1c:
	move.b d0,($3c,a6)
	lea.l loc_1ab486,a0
	jmp loc_01b6e0

;##############################################
loc_0b0d2c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0d3c(pc,d0.w),d1
	jmp loc_0b0d3c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0d3c:
	dc.w loc_0b0d44-loc_0b0d3c
	dc.w loc_0b0d64-loc_0b0d3c
	dc.w loc_0b0da4-loc_0b0d3c
	dc.w loc_0b0daa-loc_0b0d3c

;==============================================
loc_0b0d44:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b0d64:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0da4
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.w loc_0b0dcc
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.w loc_0b0dd2
	jmp loc_01b6b6

;==============================================
loc_0b0da4:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0daa:
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b0db4:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b0dbe
	clr.w (a1)
	bra.b loc_0b0dc6

loc_0b0dbe:
	lea.l (2,a1),a1
	dbra d0,loc_0b0db4

loc_0b0dc6:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0dcc:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0dd2:
	move.b d0,($3c,a6)
	movea.l #loc_1b4836,a0
	jmp loc_01b6e0

;##############################################
loc_0b0de2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b0df2(pc,d0.w),d1
	jmp loc_0b0df2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0df2:
	dc.w loc_0b0dfa-loc_0b0df2
	dc.w loc_0b0e1e-loc_0b0df2
	dc.w loc_0b0e7a-loc_0b0df2
	dc.w loc_0b0e80-loc_0b0df2

;==============================================
loc_0b0dfa:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)
	clr.w ($3a,a6)

loc_0b0e1e:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b0e7a
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b0e92
	bsr.w loc_0b0eb4
	move.w ($c,a4),($c,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b0e98
	subq.b #1,($3a,a6)
	bpl.b loc_0b0e70
	move.b #0,($3a,a6)
	move.w ($c,a4),($c,a6)
	eori.b #1,($3b,a6)
	beq.b loc_0b0e70
	move.b #-1,($c,a6)
	addq.b #1,($d,a6)

loc_0b0e70:
	jsr loc_01b6b6
	bra.w loc_0b0ea8

;==============================================
loc_0b0e7a:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b0e80:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b0e8c
	clr.w ($2a,a4)

loc_0b0e8c:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0e92:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0e98:
	move.b d0,($3c,a6)
	movea.l #loc_1c0874,a0
	jsr loc_01b6e0

loc_0b0ea8:
	tst.b ($34,a6)
	beq.b loc_0b0eb2
	clr.b ($b,a6)

loc_0b0eb2:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b0eb4:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #0,d2
	move.b d0,d2
	lsl.w #2,d2
	move.w loc_0b0ee6(pc,d2.w),d1
	move.w loc_0b0ee6+2(pc,d2.w),d2
	move.b ($b,a4),($b,a6)
	bne.b loc_0b0ed8
	neg.w d1

loc_0b0ed8:
	add.w ($d4,a4),d1
	add.w d1,($10,a6)
	add.w d2,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b0ee6:
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$ffe4
	dc.w $0010,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$ffe8
	dc.w $0000,$ffe8
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $005d,$0045
	dc.w $005d,$0045
	dc.w $005d,$0045
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $fffc,$fff0
	dc.w $fffa,$ffec
	dc.w $fffc,$ffec
	dc.w $0031,$0052
	dc.w $0031,$0052
	dc.w $0031,$0052
	dc.w $0031,$0052
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0010,$0000
	dc.w $0010,$0000
	dc.w $0010,$0000
	dc.w $0008,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0040
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0000,$0000

;##############################################
loc_0b10ea:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b10fa(pc,d0.w),d1
	jmp loc_0b10fa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b10fa:
	dc.w loc_0b1102-loc_0b10fa
	dc.w loc_0b111a-loc_0b10fa
	dc.w loc_0b1164-loc_0b10fa
	dc.w loc_0b116a-loc_0b10fa

;==============================================
loc_0b1102:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	clr.b ($3c,a6)
	move.b ($d,a6),($40,a6)
	clr.b ($41,a6)

loc_0b111a:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b1164
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b117c
	bmi.b loc_0b117c
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b1182
	tst.b ($35,a6)
	beq.b loc_0b11a2
	move.b ($d,a4),($d,a6)

loc_0b115e:
	jmp loc_01b6b6


;==============================================
loc_0b1164:
	addq.b #2,(4,a6)
	rts
 
;==============================================
loc_0b116a:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b1176
	clr.w ($28,a4)

loc_0b1176:
	jmp loc_01c37e
 
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b117c:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1182:
	move.b #3,($3a,a6)
	move.b ($40,a6),($d,a6)
	clr.b ($41,a6)
	move.b d0,($3c,a6)
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b11a2:
	subq.b #1,($3a,a6)
	bne.b loc_0b11c0
	move.b #3,($3a,a6)
	move.b ($40,a6),d0
	eori.b #1,($41,a6)
	add.b ($41,a6),d0
	move.b d0,($d,a6)

loc_0b11c0:
	bra.b loc_0b115e

;##############################################
loc_0b11c2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b11d2(pc,d0.w),d1
	jmp loc_0b11d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b11d2:
	dc.w loc_0b11da-loc_0b11d2
	dc.w loc_0b11fa-loc_0b11d2
	dc.w loc_0b122e-loc_0b11d2
	dc.w loc_0b1234-loc_0b11d2

;==============================================
loc_0b11da:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b11fa:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b122e
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b1246
	bsr.w loc_0b125c
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b124c
	jmp loc_01b6b6

;==============================================
loc_0b122e:
	addq.b #2,(4,a6)
	rts

;==============================================s
loc_0b1234:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b1240
	clr.w ($28,a4)

loc_0b1240:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1246:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b124c:
	move.b d0,($3c,a6)
	movea.l #loc_1e3ca2,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b125c:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #$30,d1
	cmpi.b #$10,d0
	bne.b loc_0b127c
	tst.b ($b,a4)
	beq.b loc_0b1278
	neg.w d1

loc_0b1278:
	add.w d1,($10,a6)

loc_0b127c:
	rts

;##############################################
loc_0b127e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b128e(pc,d0.w),d1
	jmp loc_0b128e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b128e:
	dc.w loc_0b1296-loc_0b128e
	dc.w loc_0b12b6-loc_0b128e
	dc.w loc_0b12f2-loc_0b128e
	dc.w loc_0b12f8-loc_0b128e

;==============================================
loc_0b1296:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b12b6:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b12f2
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b1308
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b130e
	jmp loc_01b6b6

;==============================================
loc_0b12f2:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b12f8:
	lea.l ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b1302
	clr.w (a0)

loc_0b1302:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1308:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b130e:
	move.b d0,($3c,a6)
	movea.l #loc_1eda74,a0
	jmp loc_01b6e0

;##############################################
loc_0b131e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b132e(pc,d0.w),d1
	jmp loc_0b132e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b132e:
	dc.w loc_0b1336-loc_0b132e
	dc.w loc_0b1356-loc_0b132e
	dc.w loc_0b1392-loc_0b132e
	dc.w loc_0b1398-loc_0b132e

;==============================================
loc_0b1336:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b1356:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b1392
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b13aa
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b13b0
	jmp loc_01b6b6

;==============================================
loc_0b1392:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b1398:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b13a4
	clr.w ($28,a4)

loc_0b13a4:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b13aa:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b13b0:
	move.b d0,($3c,a6)
	movea.l #loc_1f6d9a,a0
	jmp loc_01b6e0

;##############################################
loc_0b13c0:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b13d0(pc,d0.w),d1
	jmp loc_0b13d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b13d0:
	dc.w loc_0b13d8-loc_0b13d0
	dc.w loc_0b13fe-loc_0b13d0
	dc.w loc_0b1440-loc_0b13d0
	dc.w loc_0b1446-loc_0b13d0

;==============================================
loc_0b13d8:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	moveq #0,d0
	move.b d0,($3c,a6)
	move.w d0,($3a,a6)


loc_0b13fe:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b1440
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b1458
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b145e
	jmp loc_01b6b6

;==============================================
loc_0b1440:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b1446:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b1452
	clr.w ($2a,a4)

loc_0b1452:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1458:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b145e:
	move.b d0,($3c,a6)
	movea.l #loc_2044b0,a0
	jmp loc_01b6e0

;##############################################
loc_0b146e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b147e(pc,d0.w),d1
	jmp loc_0b147e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b147e:
	dc.w loc_0b1486-loc_0b147e
	dc.w loc_0b14ac-loc_0b147e
	dc.w loc_0b14da-loc_0b147e
	dc.w loc_0b14e0-loc_0b147e

;==============================================
loc_0b1486:
	addq.b #2,(4,a6)
	move.w ($18,a4),($18,a6)
	move.w ($1a,a4),($1a,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b14ac:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b14da
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b14f2
	bsr.w loc_0b1508
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b14f8
	jmp loc_01b6b6

;==============================================
loc_0b14da:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b14e0:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b14ec
	clr.w ($2c,a4)

loc_0b14ec:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b14f2:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b14f8:
	move.b d0,($3c,a6)
	movea.l #loc_212ef0,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1508:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b d0,d1
	subq.b #1,d1
	add.w d1,d1
	add.w d1,d1
	move.w loc_0b153c(pc,d1.w),d2
	move.w loc_0b153c+2(pc,d1.w),d3
	tst.b ($b,a6)
	beq.b loc_0b1532
	neg.w d2

loc_0b1532:
	add.w d1,($10,a6)
	add.w d3,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b153c:
	dc.w $0009,$0071
	dc.w $ffdc,$006f
	dc.w $ffb3,$0031
	dc.w $ffb5,$0031
	dc.w $ffdc,$006f

;##############################################
loc_0b1550:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b1560(pc,d0.w),d1
	jmp loc_0b1560(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1560:
	dc.w loc_0b1568-loc_0b1560
	dc.w loc_0b1588-loc_0b1560
	dc.w loc_0b15c4-loc_0b1560
	dc.w loc_0b15ca-loc_0b1560

;==============================================
loc_0b1568:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b1588:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b15c4
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b15dc
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b15e2
	jmp loc_01b6b6

;==============================================
loc_0b15c4:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b15ca:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b15d6
	clr.w ($28,a4)

loc_0b15d6:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b15dc:
 	clr.b ($3c,a6)
 	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b15e2:
	move.b d0,($3c,a6)
	movea.l #loc_220fb0,a0
	jmp loc_01b6e0

;##############################################
loc_0b15f2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b1602(pc,d0.w),d1
	jmp loc_0b1602(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1602:
	dc.w loc_0b160a-loc_0b1602
	dc.w loc_0b1624-loc_0b1602
	dc.w loc_0b1666-loc_0b1602
	dc.w loc_0b166c-loc_0b1602

;==============================================
loc_0b160a:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b1624:
	clr.b (1,a6)
	cmpi.b #$11,($102,a4)
	beq.b loc_0b1638
	cmpi.b #$13,($102,a4)
	bne.b loc_0b1666

loc_0b1638:
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b168e
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b1694
	jmp loc_01b6b6

;==============================================
loc_0b1666:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b166c:
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b1676:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b1680
	clr.w (a1)
	bra.b loc_0b1688

loc_0b1680:
	lea.l (2,a1),a1
	dbra d0,loc_0b1676

loc_0b1688:
	jmp loc_01c37e


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b168e:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1694:
	move.b d0,($3c,a6)
	movea.l #loc_232030,a0
	jmp loc_01b6e0

;##############################################
loc_0b16a4:
	movea.w ($36,a6),a4
	movea.w ($38,a6),a3
	move.b (4,a6),d0
	move.w loc_0b16b8(pc,d0.w),d1
	jmp loc_0b16b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b16b8:
	dc.w loc_0b16c0-loc_0b16b8
	dc.w loc_0b170c-loc_0b16b8
	dc.w loc_0b172a-loc_0b16b8
	dc.w loc_0b172a-loc_0b16b8

;==============================================
loc_0b16c0:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	clr.b ($b,a6)
	clr.w ($c,a6)
	move.w ($18,a3),($18,a6)
	move.w #$6000,($1a,a6)
	move.b ($102,a3),(3,a6)
	move.b ($e,a3),($e,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #$20,d0
	tst.b ($101,a3)
	beq.b loc_0b1700
	moveq #$21,d0

loc_0b1700:
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0

loc_0b170c:
	move.b ($102,a3),d0
	cmp.b (3,a6),d0
	bne.b loc_0b172a
	tst.b ($107,a5)
	bne.b loc_0b172a
	movea.l ($40,a6),a0
	tst.b (a0)
	bne.b loc_0b172a
	jmp loc_01b6b6

;==============================================
loc_0b172a:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b1736
	clr.w ($28,a4)

loc_0b1736:
	jmp loc_01c37e

;##############################################
loc_0b173c:
	movea.w ($36,a6),a4
	move.w ($26,a4),($26,a6)
	move.b (4,a6),d0
	move.w loc_0b1752(pc,d0.w),d1
	jmp loc_0b1752(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1752:
	dc.w loc_0b175a-loc_0b1752
	dc.w loc_0b1784-loc_0b1752
	dc.w loc_0b18b8-loc_0b1752
	dc.w loc_0b18be-loc_0b1752

;==============================================
loc_0b175a:
	addq.b #2,(4,a6)
	move.b #8,($6c,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.w ($6a,a6)
	bsr.w loc_0b18f2

loc_0b1784:
	clr.b (1,a6)
	tst.b ($6a,a4)
	beq.b loc_0b17a8
	tst.b ($6f,a4)
	beq.b loc_0b17a8
	clr.b ($6f,a4)
	tst.b ($6c,a6)
	bne.b loc_0b17a4
	bsr.w loc_0b17ee
	bra.b loc_0b17a8

loc_0b17a4:
	subq.b #1,($6c,a6)

loc_0b17a8:
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_0b18b8
	movea.l ($1c,a4),a3
	move.w ($12,a3),d1
	move.b ($13,a3),d1
	tst.w d1
	beq.w loc_0b18ec
	moveq #0,d0
	add.w d1,d1
	add.w d1,d1
	lea.l loc_0b1910(pc),a0
	move.w (a0,d1.w),d0
	bsr.w loc_0b18d0
	tst.b ($6a,a4)
	beq.b loc_0b17e4
	move.b #1,(1,a6)

loc_0b17e4:
	cmp.w ($6a,a6),d0
	bne.w loc_0b18f2
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b17ee:
	jsr RNGFunction
	andi.w #3,d0
	bne.w loc_0b187e
	move.b ($35,a4),d0
	jsr loc_01c2c8
	beq.b loc_0b187e
	addq.b #1,(a4)
	move.w #$1c,(2,a4)
	move.w ($36,a6),($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.l ($18,a6),($18,a4)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	add.w d0,d0
	add.w d0,d0
	move.w loc_0b1880(pc,d0.w),d1
	move.w loc_0b1880+2(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_0b184e
	neg.w d1

loc_0b184e:
	add.w d1,($10,a4)
	add.w d2,($14,a4)
	movea.w ($36,a6),a4
	clr.b ($6a,a4)
	move.b #8,($6c,a6)
	movea.l #loc_13e498,a0
	exg.l a4,a6
	jsr loc_02ad68
	exg.l a4,a6
	movea.l #loc_141764,a0
	move.l a0,($e6,a4)

loc_0b187e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1880:
	dc.w $fff8,$0070
	dc.w $fffa,$004b
	dc.w $fff7,$0085
	dc.w $0017,$005e
	dc.w $fff9,$0052
	dc.w $ffda,$0050
	dc.w $0009,$0039
	dc.w $fff0,$0006
	dc.w $0016,$0036
	dc.w $fffa,$002a
	dc.w $ffd9,$0028
	dc.w $0008,$005b
	dc.w $0006,$0056
	dc.w $ffe2,$006f

;==============================================
loc_0b18b8:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b18be:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b18ca
	clr.w ($28,a4)

loc_0b18ca:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b18d0:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.w ($d4,a4),d1
	add.w d1,($10,a6)
	move.b ($b,a4),($b,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b18ec:
	clr.w ($6a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b18f2:
	move.w d0,($6a,a6)
	movea.l #loc_2b55b0,a0

loc_0b18fc:
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1910:
	dc.w $0000,$0000,$0001,$0001
	dc.w $0002,$0002,$0003,$0003
	dc.w $0004,$0004,$0005,$0001
	dc.w $0006,$0002,$0007,$0003
	dc.w $0008,$0004,$0009,$0005
	dc.w $000a,$0006,$000b,$0007
	dc.w $000c,$0008,$000d,$0009
	dc.w $000e,$000a,$000f,$000b
	dc.w $0010,$000c,$0011,$000d
	dc.w $0012,$000e,$0013,$000f
	dc.w $0014,$0010,$0015,$0011
	dc.w $0016,$0012,$0017,$0013
	dc.w $0018,$0014,$0019,$0015
	dc.w $001a,$0016,$001b,$0017
	dc.w $001c,$0018,$001d,$0019
	dc.w $001e,$001a,$001f,$001b
	dc.w $0020,$001c,$0021,$001d
	dc.w $0022,$001e,$0023,$001f
	dc.w $0024,$0020,$0025,$0021
	dc.w $0026,$0022,$0027,$0023
	dc.w $0028,$0024,$0029,$0025
	dc.w $002a,$0026,$002b,$0027
	dc.w $002c,$0028,$002d,$0029
	dc.w $002e,$002a,$002f,$002b
	dc.w $0030,$002c,$0031,$002d
	dc.w $0032,$002e,$0033,$002f
	dc.w $0034,$0030,$0035,$0031
	dc.w $0036,$0032,$0037,$0033
	dc.w $0038,$0034,$0039,$0035
	dc.w $003a,$0036,$003b,$0037
	dc.w $003c,$0038,$003d,$0039
	dc.w $003e,$003a,$003f,$003b
	dc.w $0040,$003c,$0041,$003d
	dc.w $0042,$003e,$0043,$003f
	dc.w $0044,$0040,$0045,$0041
	dc.w $0046,$0042,$0047,$0043
	dc.w $0048,$0044,$0049,$0045
	dc.w $004a,$0046,$004b,$0047
	dc.w $004c,$0048,$004d,$0049
	dc.w $004e,$004a,$004f,$004b
	dc.w $0050,$004c,$0051,$004d
	dc.w $0052,$004e,$0053,$004f
	dc.w $0054,$0050,$0055,$0051
	dc.w $0056,$0052,$0057,$0053
	dc.w $0058,$0057,$0059,$0054
	dc.w $005a,$0055,$0000,$0056
	dc.w $0058,$0057,$005b,$0058
	dc.w $005c,$0059,$005d,$005a
	dc.w $005e,$005b,$005f,$005c
	dc.w $0060,$005d,$0061,$005e
	dc.w $0062,$005f,$0063,$0060
	dc.w $0064,$0061,$0065,$0062
	dc.w $0066,$0063,$0067,$0064
	dc.w $0068,$0065,$0069,$0066
	dc.w $006a,$0067,$006b,$0068
	dc.w $006c,$0069,$006d,$006a
	dc.w $006e,$006b,$006f,$006c
	dc.w $0070,$006d,$0000,$006e
	dc.w $0071,$006f,$0072,$0070
	dc.w $0073,$0071,$0074,$0072
	dc.w $0075,$0073,$0076,$0074
	dc.w $0077,$0075,$0078,$0076
	dc.w $0079,$0077,$007a,$0078
	dc.w $007b,$0079,$007c,$007a
	dc.w $007d,$007b,$007e,$007c
	dc.w $007f,$007d,$0080,$007e
	dc.w $0081,$007f,$0082,$0080
	dc.w $0083,$0081,$0084,$0082
	dc.w $0085,$0083,$0086,$0084
	dc.w $0087,$0085,$0088,$0086
	dc.w $0089,$0087,$008a,$0088
	dc.w $008b,$0089,$008c,$008a
	dc.w $008d,$008b,$008e,$008c
	dc.w $008f,$008d,$0090,$008e
	dc.w $0091,$008f,$0092,$0090
	dc.w $0093,$0091,$0000,$0092
	dc.w $0015,$0093,$0094,$0094
	dc.w $0095,$0095,$0096,$0096
	dc.w $0097,$00ac,$0098,$0097
	dc.w $0099,$0098,$009a,$0098
	dc.w $009b,$0099,$009c,$009a
	dc.w $009d,$009b,$0000,$009c
	dc.w $009e,$009d,$009f,$009e
	dc.w $00a0,$009f,$00a1,$00a0
	dc.w $00a1,$00a1,$00a2,$00a2
	dc.w $00a3,$00a3,$00a4,$00a4
	dc.w $00a5,$00a5,$00a6,$00a6
	dc.w $00da,$00a7,$00a7,$00a8
	dc.w $00a8,$00a9,$00a9,$00aa
	dc.w $00aa,$00ab,$0097,$00ac
	dc.w $00ab,$00ad,$00ac,$00ae
	dc.w $00ad,$00af,$00ae,$00b0
	dc.w $00af,$00b1,$00b0,$00b2
	dc.w $00b1,$00b3,$00b2,$00b4
	dc.w $00b3,$00b5,$00b4,$00b3
	dc.w $00b5,$00b6,$00b6,$00b7
	dc.w $00b7,$00b8,$00b8,$00b9
	dc.w $00b9,$00ba,$00ba,$00bb
	dc.w $00bb,$00bc,$00bc,$00bd
	dc.w $00bd,$00be,$00be,$00bf
	dc.w $00bf,$00c0,$0000,$00c1
	dc.w $0000,$00c2,$00c0,$00c3
	dc.w $00c1,$00c4,$00c2,$00c5
	dc.w $00c3,$00c6,$00c4,$00c7
	dc.w $00c5,$00c8,$00c6,$00c9
	dc.w $00c7,$00ca,$0000,$00cb
	dc.w $00c8,$00cc,$00c9,$00cd
	dc.w $0000,$00ce,$00ca,$00cf
	dc.w $00dd,$00d0,$00de,$00d1
	dc.w $00cb,$00d2,$00cc,$00d3
	dc.w $00cd,$00d4,$00ce,$00d5
	dc.w $00cb,$00d6,$00cf,$00d5
	dc.w $00d0,$00d5,$00d1,$00d5
	dc.w $00d2,$00d7,$00d3,$00d8
	dc.w $00d4,$00d9,$00d5,$00da
	dc.w $00d6,$00db,$00d7,$00dc
	dc.w $00d8,$00dd,$00d9,$00de
	dc.w $00db,$00a6,$00dc,$00a6
	dc.w $00df,$00df,$00e0,$00e0
	dc.w $00e1,$00e1,$00e2,$00e2
	dc.w $00e3,$00e3,$00e4,$00e4
	dc.w $00e5,$00e5,$00e6,$00e6
	dc.w $00e7,$00e7,$00e8,$00e8
	dc.w $00e9,$00e9,$00ea,$00ea
	dc.w $00eb,$00eb,$00ec,$00ec
	dc.w $00ed,$00ed,$00ee,$00ee
	dc.w $00ef,$00ef,$00f0,$00f0
	dc.w $0100,$0103,$00f2,$00f9
	dc.w $00f3,$00fa,$00f4,$00fa
	dc.w $00f5,$00fb,$00f6,$00fa
	dc.w $00f7,$00fa,$00f8,$00fc
	dc.w $00f9,$00fd,$00fa,$00fe
	dc.w $00fb,$00ff,$00fc,$0100
	dc.w $00fd,$0101,$00fe,$0102
	dc.w $0101,$0000,$0102,$0000
	dc.w $0103,$00f3,$0104,$00f4
	dc.w $0105,$00f5,$0106,$00f6
	dc.w $0107,$00f7,$0108,$00f8
	dc.w $0000,$00dc,$00f9,$0104
	dc.w $00f8,$0105,$00f7,$0106
	dc.w $00f7,$0107,$00f7,$0108
	dc.w $00f7,$0000,$0109,$0000
	dc.w $0109,$0109,$0109,$010a
	dc.w $0109,$010b,$0109,$010c
	dc.w $0109,$010d,$0109,$010e
	dc.w $0109,$010f,$0109,$0110
	dc.w $010a,$008f,$010b,$0090
	dc.w $010c,$00da,$010d,$00db
	dc.w $010e,$0001,$010f,$0002
	dc.w $0110,$0003,$0111,$0004
	dc.w $0112,$0001,$0113,$0002
	dc.w $0114,$0003,$0115,$0004
	dc.w $0116,$0111,$0058,$0112
	dc.w $0117,$0113,$0118,$0114
	dc.w $0118,$0115,$0118,$0116
	dc.w $0119,$0117,$011a,$0118
	dc.w $011b,$0119,$011c,$011a
	dc.w $011c,$011b,$011d,$011c
	dc.w $011e,$011d,$011f,$011e
	dc.w $0120,$011f,$0121,$0120
	dc.w $0122,$0121,$0123,$0122
	dc.w $0124,$0123,$0125,$0124
	dc.w $00fd,$0102,$00fd,$0125
	dc.w $00fd,$0126,$00fd,$0127
	dc.w $00fd,$0128,$00fe,$0129
	dc.w $0126,$012a,$0127,$012b
	dc.w $0128,$012c,$0129,$012d
	dc.w $012a,$012e,$012b,$012f
	dc.w $012c,$0130,$012d,$0131
	dc.w $012e,$0132,$012f,$0133
	dc.w $0130,$0134,$0131,$0135
	dc.w $0132,$0136,$0133,$0137
	dc.w $0134,$0138,$0135,$0139
	dc.w $0136,$013a,$0137,$013b
	dc.w $0138,$013c,$0139,$013d
	dc.w $013a,$013e,$013b,$013f
	dc.w $013c,$0140,$013d,$0141
	dc.w $013e,$0142,$013f,$0143
	dc.w $0140,$0144,$0141,$0145
	dc.w $0142,$00b2,$0143,$0146
	dc.w $0144,$0147,$0145,$0148
	dc.w $0146,$0149,$0147,$014a
	dc.w $0148,$014b,$0149,$014c
	dc.w $014a,$014d,$014b,$014e
	dc.w $014c,$014f,$014d,$0150
	dc.w $014e,$0151,$014f,$0152
	dc.w $0150,$0153,$0151,$0154
	dc.w $0152,$0155,$0153,$0156
	dc.w $0154,$0157,$0155,$0074
	dc.w $0156,$0073,$0157,$0072
	dc.w $0000,$0158,$0158,$0159
	dc.w $0000,$0000,$0000,$0000

;##############################################
loc_0b1f10:
	movea.w ($36,a6),a4
	move.w ($26,a4),($26,a6)
	move.b (4,a6),d0
	move.w loc_0b1f26(pc,d0.w),d1
	jmp loc_0b1f26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b1f26:
	dc.w loc_0b1f2e-loc_0b1f26
	dc.w loc_0b1f52-loc_0b1f26
	dc.w loc_0b206e-loc_0b1f26
	dc.w loc_0b2074-loc_0b1f26

;==============================================
loc_0b1f2e:
	addq.b #2,(4,a6)
	move.b #$20,($6c,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	clr.w ($6a,a6)
	bsr.w loc_0b20a8

loc_0b1f52:
	clr.b (1,a6)
	tst.b ($6b,a4)
	beq.w loc_0b1f78
	tst.b ($70,a4)
	beq.b loc_0b1f78
	clr.b ($70,a4)
	tst.b ($6c,a6)
	bne.b loc_0b1f74
	bsr.w loc_0b1fc0
	bra.b loc_0b1f78

loc_0b1f74:
	subq.b #1,($6c,a6)

loc_0b1f78:
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_0b206e
	movea.l ($1c,a4),a3
	move.w ($12,a3),d1
	move.b ($13,a3),d1
	tst.w d1
	beq.w loc_0b20a2
	moveq #0,d0
	add.w d1,d1
	add.w d1,d1
	movea.l #loc_0b1910,a0
	move.w (2,a0,d1.w),d0
	bsr.w loc_0b2086
	tst.b ($6b,a4)
	beq.b loc_0b1fb6
	move.b #1,(1,a6)

loc_0b1fb6:
	cmp.w ($6a,a6),d0
	bne.w loc_0b20a8
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b1fc0:
	jsr RNGFunction
	andi.w #$f,d0
	bne.b loc_0b2034
	move.b ($35,a4),d0
	jsr loc_01c2c8
	beq.b loc_0b2034
	addq.b #1,(a4)
	move.w #$11c,(2,a4)
	move.w ($36,a6),($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.l ($18,a6),($18,a4)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	add.w d0,d0
	add.w d0,d0
	move.w loc_0b2036(pc,d0.w),d1
	move.w loc_0b2036+2(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_0b201e
	neg.w d1

loc_0b201e:
	add.w d1,($10,a4)
	add.w d2,($14,a4)
	movea.w ($36,a6),a4
	clr.b ($6b,a4)
	move.b #$20,($6c,a6)

loc_0b2034:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2036:
	dc.w $fff0,$005b
	dc.w $fffa,$004b
	dc.w $ffef,$006f
	dc.w $fff5,$005c
	dc.w $ffd2,$0061
	dc.w $ffc3,$0059
	dc.w $fff3,$004d
	dc.w $ffe8,$0043
	dc.w $fff6,$0039
	dc.w $ffd2,$003b
	dc.w $ffc2,$0033
	dc.w $fffd,$0058
	dc.w $ffcc,$0053
	dc.w $ffce,$0074

;==============================================
loc_0b206e:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b2074:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2080
	clr.w ($2a,a4)

loc_0b2080:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2086:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.w ($d4,a4),d1
	add.w d1,($10,a6)
	move.b ($b,a4),($b,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b20a2:
	clr.w ($6a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b20a8:
	move.w d0,($6a,a6)
	movea.l #loc_2b634e,a0
	jmp loc_0b18fc

;##############################################
loc_0b20b8:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b20c8(pc,d0.w),d1
	jmp loc_0b20c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b20c8:
	dc.w loc_0b20d0-loc_0b20c8
	dc.w loc_0b2114-loc_0b20c8
	dc.w loc_0b2140-loc_0b20c8
	dc.w loc_0b2146-loc_0b20c8

;==============================================
loc_0b20d0:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w ($18,a4),($18,a6)
	move.w #$2000,($1a,a6)
	move.b ($102,a4),(3,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b #0,($e,a6)
	move.b ($101,a4),d0
	add.w d0,d0
	move.w loc_0b210c(pc,d0.w),($10,a6)
	move.w loc_0b210c+4(pc,d0.w),($14,a6)
	bra.w loc_0b2158

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b210c:
	dc.w $0010,$0170
	dc.w $00ca,$00ca

;==============================================
loc_0b2114:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b2140
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_0b2144
	tst.b ($1a8,a4)
	bne.b loc_0b2136
	tst.b ($1b0,a4)
	beq.b loc_0b2144

loc_0b2136:
	move.b #1,(1,a6)
	bra.w loc_0b218e

;==============================================
loc_0b2140:
	addq.b #2,(4,a6)

loc_0b2144:
	rts

;==============================================
loc_0b2146:
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2152
	clr.w ($28,a4)

loc_0b2152:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2158:
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.w #$c,(a0)+
	move.l #$20001,(a0)+
	move.l #loc_0b2214,(a0)+
	move.w #$20,(a0)+
	move.w #$15,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+

loc_0b218e:
	lea.l ($62,a6),a0
	lea.l ($1a8,a4),a1
	bsr.b loc_0b21a0
	lea.l ($66,a6),a0
	lea.l ($1b0,a4),a1

loc_0b21a0:
	move.w (2,a1),d0
	moveq #0,d1
	cmpi.w #$20,d0
	bcs.b loc_0b21f6
	moveq #2,d1
	cmpi.w #$79,d0
	bcs.b loc_0b21f6
	moveq #4,d1
	cmpi.w #$f1,d0
	bcs.b loc_0b21f6
	moveq #6,d1
	cmpi.w #$1e1,d0
	bcs.b loc_0b21f6
	moveq #8,d1
	cmpi.w #$3c1,d0
	bcs.b loc_0b21f6
	moveq #$a,d1
	cmpi.w #$5a1,d0
	bcs.b loc_0b21f6
	moveq #$c,d1
	cmpi.w #$781,d0
	bcs.b loc_0b21f6
	moveq #$e,d1
	cmpi.w #$961,d0
	bcs.b loc_0b21f6
	moveq #$10,d1
	cmpi.w #$b41,d0
	bcs.b loc_0b21f6
	moveq #$12,d1
	cmpi.w #$d21,d0
	bcs.b loc_0b21f6
	moveq #$14,d1

loc_0b21f6:
	move.w loc_0b21fc(pc,d1.w),(a0)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b21fc:
	dc.w $0020,$03b1,$03b2,$03b3
	dc.w $03b4,$03b5,$03b6,$03b7
	dc.w $03b8,$03b9,$03bf,$0020

loc_0b2214
	dc.w $fff0,$fff8,$0000,$fff8

;##############################################
loc_0b221c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b222c(pc,d0.w),d1
	jmp loc_0b222c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b222c:
	dc.w loc_0b2234-loc_0b222c
	dc.w loc_0b225a-loc_0b222c
	dc.w loc_0b229a-loc_0b222c
	dc.w loc_0b22a0-loc_0b222c

;==============================================
loc_0b2234:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)
	move.b ($b,a4),($b,a6)

loc_0b225a:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.b loc_0b229a
	tst.b ($3a,a6)
	bne.b loc_0b227a
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.b loc_0b22de
	bra.b loc_0b2284

loc_0b227a:
	movea.l ($1c,a4),a3
	move.b ($13,a3),d0
	beq.b loc_0b22de

loc_0b2284:
	bsr.w loc_0b22ca
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b22e4
	jmp loc_01b6b6

;==============================================
loc_0b229a:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b22a0:
	tst.b ($3a,a6)
	bne.b loc_0b22b8
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b22b2
	clr.w ($28,a4)

loc_0b22b2:
	jmp loc_01c37e

loc_0b22b8:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b22c4
	clr.w ($2a,a4)

loc_0b22c4:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b22ca:
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b22de:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b22e4:
	move.b d0,($3c,a6)
	movea.l #loc_25a5c0,a0
	jmp loc_01b6e0

;##############################################
loc_0b22f4:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b2304(pc,d0.w),d1
	jmp loc_0b2304(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2304:
	dc.w loc_0b230c-loc_0b2304
	dc.w loc_0b2330-loc_0b2304
	dc.w loc_0b2398-loc_0b2304
	dc.w loc_0b239e-loc_0b2304

;==============================================
loc_0b230c:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)
	clr.w ($3a,a6)

loc_0b2330:
	clr.b (1,a6)
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_0b2398
	movea.l ($1c,a4),a3
	move.b ($12,a3),d0
	beq.w loc_0b23bc
	cmpi.b #$a0,d0
	bcc.b loc_0b235a
	tst.b ($1e4,a4)
	bpl.w loc_0b23bc

loc_0b235a:
	move.b #1,(1,a6)
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),d1
	add.w ($d4,a4),d1
	move.w d1,($10,a6)
	move.w ($14,a4),($14,a6)
	cmp.b ($3c,a6),d0
	bne.w loc_0b23c2
	tst.b ($ab,a4)
	bne.b loc_0b238e
	tst.b ($125,a5)
	bne.w loc_0b23d2

loc_0b238e:
	jsr loc_01b6b6
	bra.w loc_0b23d2

;==============================================
loc_0b2398:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b239e:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b23aa
	clr.w ($2a,a4)

loc_0b23aa:
	movea.w ($2c,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b23b6
	clr.w ($2c,a4)

loc_0b23b6:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b23bc:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b23c2:
	move.b d0,($3c,a6)
	movea.l #loc_276258,a0
	jsr loc_01b6e0

loc_0b23d2:
	move.w a6,($2a,a4)
	clr.w ($2c,a4)
	tst.b ($35,a6)
	beq.b loc_0b23e8
	clr.w ($2a,a4)
	move.w a6,($2c,a4)

loc_0b23e8:
	rts

;##############################################
loc_0b23ea:
	movea.w ($36,a6),a4
	movea.w ($36,a4),a3
	movea.w ($38,a4),a2
	move.b (4,a6),d0
	move.w loc_0b2402(pc,d0.w),d1
	jmp loc_0b2402(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2402:
	dc.w loc_0b240a-loc_0b2402
	dc.w loc_0b2452-loc_0b2402
	dc.w loc_0b2466-loc_0b2402
	dc.w loc_0b2466-loc_0b2402

;==============================================
loc_0b240a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #1,(1,a6)
	move.b d0,(9,a6)
	move.b ($b,a2),($b,a6)
	move.w d0,($c,a6)
	move.b ($e,a4),($e,a6)
	move.b ($f,a4),($f,a6)
	move.w ($1a,a3),($1a,a6)
	move.w ($18,a4),($18,a6)
	bsr.w loc_0b2488
	moveq #9,d0
	add.b (3,a6),d0
	movea.l #loc_232030,a0
	jmp loc_01b6e0

;==============================================
loc_0b2452:
	bsr.w loc_0b2488
	tst.b ($33,a6)
	bpl.b loc_0b2460
	addq.b #2,(4,a6)

loc_0b2460:
	jmp loc_01b6b6

;==============================================
loc_0b2466:
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b2470:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b247a
	clr.w (a1)
	bra.b loc_0b2482

loc_0b247a:
	lea.l (2,a1),a1
	dbra d0,loc_0b2470

loc_0b2482:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2488:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	tst.b (3,a6)
	beq.b loc_0b24a4
	addi.w #$fff4,($10,a6)
	addq.w #6,($14,a6)

loc_0b24a4:
	rts

;##############################################
loc_0b24a6:
	jsr loc_01c368
	beq.b loc_0b24de
	move.l #$1001f00,(a4)
	move.b #0,($a,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)
	jsr loc_01c368
	beq.b loc_0b24de
	move.l #$1001f00,(a4)
	move.b #1,($a,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)

loc_0b24de:
	rts

;##############################################
loc_0b24e0:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0b24f0(pc,d0.w),d1
	jmp loc_0b24f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b24f0:
	dc.w loc_0b24f8-loc_0b24f0
	dc.w loc_0b2518-loc_0b24f0
	dc.w loc_0b2566-loc_0b24f0
	dc.w loc_0b256c-loc_0b24f0

;==============================================
loc_0b24f8:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b (3,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($3c,a6)

loc_0b2518:
	clr.b (1,a6)
	tst.b (a4)
	beq.b loc_0b2566
	moveq #0,d0
	movea.l ($1c,a4),a3
	move.b (3,a3),d0
	beq.b loc_0b2596
	moveq #0,d1
	move.b ($a,a6),d1
	add.w d1,d1
	move.w loc_0b2562(pc,d1.w),d1
	move.b ($b,a4),($b,a6)
	beq.b loc_0b2542
	neg.w d1

loc_0b2542:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w ($14,a4),($14,a6)
	move.b #1,(1,a6)
	cmp.b ($3c,a6),d0
	bne.b loc_0b259c
	jmp loc_01b6b6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2562:
	dc.w $0010,$fff6

;==============================================
loc_0b2566:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0b256c:
	tst.b ($a,a6)
	bne.b loc_0b2584
	movea.w ($2c,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b257e
	clr.w ($2c,a4)

loc_0b257e:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2584:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2590
	clr.w ($2a,a4)

loc_0b2590:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2596:
	clr.b ($3c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b259c:
	move.b d0,($3c,a6)
	add.b d0,d0
	add.b ($a,a6),d0
	move.b loc_0b25b6(pc,d0.w),d0
	movea.l #loc_14ae86,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b25b6:
	dc.w $0000,$0410,$0511,$0612
	dc.w $0713,$0814,$0915,$0a16
	dc.w $0b17,$0c18,$0d19,$0e1a
	dc.w $0f1b

;##############################################
loc_0b25d0:
	move.b (4,a6),d0
	move.w loc_0b25dc(pc,d0.w),d1
	jmp loc_0b25dc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b25dc:
	dc.w loc_0b25e4-loc_0b25dc
	dc.w loc_0b2612-loc_0b25dc
	dc.w loc_0b265e-loc_0b25dc
	dc.w loc_0b265e-loc_0b25dc

;==============================================
loc_0b25e4:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($18,a4),($18,a6)
	move.b ($3c,a6),d0
	movea.l ($2b0,a4),a0
	jmp loc_01b6e0

;==============================================
loc_0b2612:
	tst.b ($12a,a5)
	bne.b loc_0b2656
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.b loc_0b2638
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0b2638:
	move.b #1,(1,a6)
	move.b ($b4,a5),d0
	add.b (3,a6),d0
	btst #0,d0
	bne.b loc_0b2650
	clr.b (1,a6)

loc_0b2650:
	jmp loc_01b692

loc_0b2656:
	move.b #4,(4,a6)
	rts

;==============================================
loc_0b265e:
	movea.w ($36,a6),a4
	lea.l ($2c,a4),a4
	tst.b (3,a6)
	beq.b loc_0b2670
	lea.l ($2e,a4),a4

loc_0b2670:
	movea.w (a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2678
	clr.w (a4)

loc_0b2678:
	jmp loc_01c37e

;##############################################
loc_0b267e:
	jsr loc_01c368
	beq.w loc_0b270e
	addq.b #1,(a4)
	move.w #$2000,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.b ($b,a6),($b,a4)
	move.b #$30,($3c,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)
	move.l #$50000,($40,a4)
	move.l #$ffffb000,($48,a4)
	jsr loc_01c368
	beq.w loc_0b270e
	addq.b #1,(a4)
	move.w #$2001,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.b ($b,a6),($b,a4)
	move.b #$30,($3c,a4)
	move.w a6,($36,a4)
	move.w a4,($2e,a6)
	move.l #$fffb0000,($40,a4)
	move.l #$5000,($48,a4)

loc_0b270e:
	rts

;##############################################
loc_0b2710:
	jsr loc_01c368
	beq.b loc_0b2766
	addq.b #1,(a4)
	move.w #$2000,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.b #$31,($3c,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)
	move.l #$a0000,($40,a4)
	move.l #$ffff6000,($48,a4)
	move.b ($b,a6),d0
	bne.b loc_0b275e
	neg.l ($40,a4)
	neg.l ($48,a4)

loc_0b275e:
	eori.b #1,d0
	move.b d0,($b,a4)

loc_0b2766:
	rts

;##############################################
loc_0b2768:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0b277a(pc,d0.w),d1
	jmp loc_0b277a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b277a:
	dc.w loc_0b2786-loc_0b277a
	dc.w loc_0b2786-loc_0b277a
	dc.w loc_0b281e-loc_0b277a
	dc.w loc_0b281e-loc_0b277a
	dc.w loc_0b2900-loc_0b277a
	dc.w loc_0b2982-loc_0b277a

;==============================================
loc_0b2786:
	move.b (4,a6),d0
	move.w loc_0b2792(pc,d0.w),d1
	jmp loc_0b2792(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2792:
	dc.w loc_0b279a-loc_0b2792
	dc.w loc_0b27b2-loc_0b2792
	dc.w loc_0b2a74-loc_0b2792
	dc.w loc_0b2a7a-loc_0b2792

;----------------------------------------------
loc_0b279a:
	addq.b #2,(4,a6)
	move.w ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2acc

loc_0b27b2:
	tst.b (1,a4)
	beq.w loc_0b2ac0
	movea.l ($1c,a4),a3
	move.w ($12,a3),d1
	tst.w d1
	beq.w loc_0b2ac0
	movea.w ($38,a4),a3
	cmpi.b #$1c,($102,a3)
	bne.w loc_0b2ac0
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	lsl.w #2,d1
	add.w d1,d0
	lea.l loc_0b1910,a0
	move.w (a0,d0.w),d0
	beq.w loc_0b2ac0
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($18,a4),($18,a6)
	move.b #1,(1,a6)
	cmp.w ($24,a6),d0
	bne.w loc_0b2a9c
	rts


;==============================================
loc_0b281e:
	move.b (4,a6),d0
	move.w loc_0b282a(pc,d0.w),d1
	jmp loc_0b282a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b282a:
	dc.w loc_0b2832-loc_0b282a
	dc.w loc_0b287e-loc_0b282a
	dc.w loc_0b2a74-loc_0b282a
	dc.w loc_0b2a7a-loc_0b282a

;----------------------------------------------
loc_0b2832:
	addq.b #2,(4,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($3a,a6)
	cmpi.b #3,(3,a6)
	bne.b loc_0b286e
	movea.w ($38,a4),a0
	move.b ($101,a0),($d,a6)
	sne.b ($c,a6)

loc_0b286e:
	bsr.w loc_0b2acc
	move.w ($34,a4),d1
	beq.w loc_0b2ac0
	bsr.w loc_0b28d8

;----------------------------------------------
loc_0b287e:
	tst.b (1,a4)
	beq.w loc_0b2ac0
	move.w ($34,a4),d1
	beq.w loc_0b2ac0
	move.b #1,(1,a6)
	cmp.w ($24,a6),d1
	beq.b loc_0b28a4
	move.w #$10,($3a,a6)
	bsr.w loc_0b28d8

loc_0b28a4:
	move.w ($3a,a6),d0
	beq.b loc_0b28b8
	subq.w #1,($3a,a6)
	btst #0,d0
	beq.b loc_0b28b6
	neg.w d0

loc_0b28b6:
	asr.w #1,d0

loc_0b28b8:
	add.w ($14,a4),d0
	move.w d0,($14,a6)
	moveq #-$30,d0
	movea.w ($38,a4),a0
	tst.b ($101,a0)
	beq.b loc_0b28ce
	neg.w d0

loc_0b28ce:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b28d8:
	move.w d1,($24,a6)
	cmpi.b #3,(3,a6)
	bne.b loc_0b28ea
	moveq #$10,d0
	bra.w loc_0b2aa0

loc_0b28ea:
	move.b ($34,a4),d0
	andi.w #$ff,d1
	tst.w (Region,a5)
	beq.b loc_0b28fc
	addi.w #$30,d1

loc_0b28fc:
	bra.w loc_0b2aac

;==============================================
loc_0b2900:
	move.b (4,a6),d0
	move.w loc_0b290c(pc,d0.w),d1
	jmp loc_0b290c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b290c:
	dc.w loc_0b2914-loc_0b290c
	dc.w loc_0b294a-loc_0b290c
	dc.w loc_0b2a74-loc_0b290c
	dc.w loc_0b2a7a-loc_0b290c

;----------------------------------------------
loc_0b2914:
	addq.b #2,(4,a6)
	movea.w ($38,a4),a0
	move.b ($101,a0),d0
	eori.b #1,d0
	move.b d0,($b,a6)
	move.w ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2acc
	move.b ($35,a4),d0
	bra.w loc_0b2a9c

;----------------------------------------------
loc_0b294a:
	tst.b (1,a4)
	beq.w loc_0b2ac0
	move.b #1,(1,a6)
	move.w ($c,a4),($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),d0
	subi.w #$18,d0
	move.w d0,($14,a6)
	move.b ($a,a4),d0
	cmp.b ($13,a5),d0
	bne.b loc_0b2980
	jmp loc_01b6b6

loc_0b2980:
	rts

;==============================================
loc_0b2982:
	move.b (4,a6),d0
	move.w loc_0b298e(pc,d0.w),d1
	jmp loc_0b298e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b298e:
	dc.w loc_0b2996-loc_0b298e
	dc.w loc_0b29d6-loc_0b298e
	dc.w loc_0b2a74-loc_0b298e
	dc.w loc_0b2a7a-loc_0b298e

;----------------------------------------------
loc_0b2996:
	addq.b #2,(4,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.w #$2000,($18,a6)
	move.w ($26,a4),($26,a6)
	move.b ($3c,a6),d0
	ext.w d0
	asl.w #4,d0
	move.b ($b,a4),($b,a6)
	bne.b loc_0b29c4
	neg.w d0

loc_0b29c4:
	move.w d0,($12,a6)
	move.w #$ffa0,($16,a6)
	movea.w ($38,a6),a3
	bra.w loc_0b2a44

;----------------------------------------------
loc_0b29d6:
	tst.b (1,a4)
	beq.w loc_0b2ac0
	move.b #1,(1,a6)
	move.w ($10,a4),d0
	add.w ($12,a6),d0
	move.w d0,($10,a6)
	move.w ($14,a4),d0
	add.w ($16,a6),d0
	move.w d0,($14,a6)
	jmp loc_01b692

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2a02:
	moveq #0,d0
	move.b ($132,a3),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($128,a3),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d0,d1
	lsl.w #5,d1
	move.b ($102,a3),d0
	add.w d0,d0
	lea.l loc_32c094,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.b ($d,a6),d0
	lsl.w #5,d0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d0.w),a1
	moveq #2,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2a44:
	moveq #0,d0
	move.b ($102,a3),d0
	jsr loc_02fc88
	add.w d0,d0
	lea.l CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	moveq #$10,d0
	move.b ($132,a3),d1
	lsl.b #5,d1
	bcs.b loc_0b2a68
	move.b d1,d0

loc_0b2a68:
	movea.l (a0,d0.w),a0
	moveq #$2a,d0
	jmp loc_01b6e0

;----------------------------------------------
loc_0b2a74:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_0b2a7a
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b2a84:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b2a8e
	clr.w (a1)
	bra.b loc_0b2a96

loc_0b2a8e:
	lea.l (2,a1),a1
	dbra d0,loc_0b2a84

loc_0b2a96:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2a9c:
	move.w d0,($24,a6)

loc_0b2aa0:
	movea.l ($40,a6),a0
	add.w d0,d0
	jmp loc_01b6e6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2aac:
	add.w d0,d0
	movea.l ($40,a6),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2ac0:
	moveq #0,d0
	move.b d0,(1,a6)
	move.w d0,($24,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2acc:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d0
	move.l loc_0b2adc(pc,d0.w),($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2adc:
	dc.l loc_2b55b0,loc_2b634e,loc_2f31b0
	dc.l loc_2f31b0,loc_2f31b0

;##############################################
loc_0b2af0:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_0b2b00(pc,d0.w),d1
	jmp loc_0b2b00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2b00:
	dc.w loc_0b2b08-loc_0b2b00
	dc.w loc_0b2b08-loc_0b2b00
	dc.w loc_0b2b9a-loc_0b2b00
	dc.w loc_0b2bf6-loc_0b2b00

;==============================================
loc_0b2b08:
	tst.b (a4)
	beq.w loc_0b2c5a
	move.b (4,a6),d0
	move.w loc_0b2b1a(pc,d0.w),d1
	jmp loc_0b2b1a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2b1a:
	dc.w loc_0b2b22-loc_0b2b1a
	dc.w loc_0b2b3a-loc_0b2b1a
	dc.w loc_0b2c54-loc_0b2b1a
	dc.w loc_0b2c5a-loc_0b2b1a

;----------------------------------------------
loc_0b2b22:
	addq.b #2,(4,a6)
	move.w ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2d0e

loc_0b2b3a:
	tst.b (1,a4)
	beq.w loc_0b2d02
	movea.l ($1c,a4),a3
	move.w ($12,a3),d1
	move.b ($13,a3),d1
	tst.w d1
	beq.w loc_0b2d02
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d1
	add.w d1,d0
	movea.l #loc_0b1910,a0
	move.w (a0,d0.w),d0
	beq.w loc_0b2d02
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($18,a4),($18,a6)
	move.b #1,(1,a6)
	cmp.w ($24,a6),d0
	bne.w loc_0b2cf2
	rts

;==============================================
loc_0b2b9a:
	tst.b (a4)
	beq.w loc_0b2c88
	move.b (4,a6),d0
	move.w loc_0b2bac(pc,d0.w),d1
	jmp loc_0b2bac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2bac:
	dc.w loc_0b2bb4-loc_0b2bac
	dc.w loc_0b2bf2-loc_0b2bac
	dc.w loc_0b2c54-loc_0b2bac
	dc.w loc_0b2c88-loc_0b2bac

;----------------------------------------------
loc_0b2bb4:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b ($e,a4),($e,a6)
	move.w #$113,($c,a6)
	movea.l (-$5c48,a5),a2
	move.b (8,a2),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0df892,a0
	move.l (a0,d0.w),($50,a6)
	bsr.w loc_0b2ce8

loc_0b2bf2:
	bra.w loc_0b2c9e

;==============================================
loc_0b2bf6:
	tst.b (a4)
	beq.w loc_0b2c88
	move.b (4,a6),d0
	move.w loc_0b2c08(pc,d0.w),d1
	jmp loc_0b2c08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2c08:
	dc.w loc_0b2c10-loc_0b2c08
	dc.w loc_0b2c48-loc_0b2c08
	dc.w loc_0b2c54-loc_0b2c08
	dc.w loc_0b2c88-loc_0b2c08

;----------------------------------------------
loc_0b2c10:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b ($e,a4),($e,a6)
	move.w ($64,a4),($64,a6)
	move.w d0,($c,a6)
	move.b ($3c,a6),d0
	lsl.w #2,d0
	movea.l #loc_0df892,a0
	move.l (a0,d0.w),($50,a6)

loc_0b2c48:
	bsr.w loc_0b2c9e
	move.w ($64,a6),($14,a6)
	rts

;----------------------------------------------
loc_0b2c54:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_0b2c5a:
	movea.w ($36,a6),a4
	tst.b (3,a6)
	bne.b loc_0b2c76
	movea.w ($28,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2c70
	clr.w ($28,a4)

loc_0b2c70:
	jmp loc_01c37e

loc_0b2c76:
	movea.w ($2a,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2c82
	clr.w ($2a,a4)

loc_0b2c82:
	jmp loc_01c37e

;----------------------------------------------
loc_0b2c88:
	movea.w ($36,a6),a4
	movea.w ($2c,a4),a0
	cmpa.w a6,a0
	bne.b loc_0b2c98
	clr.w ($2c,a4)

loc_0b2c98:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2c9e:
	movea.l ($1c,a4),a0
	move.b ($e,a0),d0
	sne.b (1,a6)
	beq.b loc_0b2ce6
	andi.w #$ff,d0
	lsl.w #2,d0
	movea.l ($50,a6),a0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0),d1
	add.w d0,d0
	movea.l #loc_2e514c,a0
	adda.w (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.b ($b,a4),($b,a6)
	beq.b loc_0b2cd8
	neg.w d1

loc_0b2cd8:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w ($14,a4),($14,a6)

loc_0b2ce6:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2ce8:
	andi.w #$f000,$90c27c
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2cf2:
	move.w d0,($24,a6)
	movea.l ($40,a6),a0
	add.w d0,d0
	jmp loc_01b6e6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2d02:
	moveq #0,d0
	move.b d0,(1,a6)
	move.w d0,($24,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2d0e:
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	move.l loc_0b2d1e(pc,d0.w),($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2d1e:
	dc.l loc_2b55b0,loc_2b634e,loc_2b55b0

;##############################################
loc_0b2d2a:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0b2d3c(pc,d0.w),d1
	jmp loc_0b2d3c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2d3c:
	dc.w loc_0b2d44-loc_0b2d3c
	dc.w loc_0b2dc2-loc_0b2d3c
	dc.w loc_0b2e30-loc_0b2d3c
	dc.w loc_0b2e30-loc_0b2d3c

;==============================================
loc_0b2d44:
	move.b (4,a6),d0
	move.w loc_0b2d50(pc,d0.w),d1
	jmp loc_0b2d50(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2d50:
	dc.w loc_0b2d58-loc_0b2d50
	dc.w loc_0b2d7c-loc_0b2d50
	dc.w loc_0b2ec0-loc_0b2d50
	dc.w loc_0b2ec8-loc_0b2d50

;----------------------------------------------
loc_0b2d58:
	addq.b #2,(4,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2f06

loc_0b2d7c:
	tst.b ($15,a5)
	bne.w loc_0b2ec0
	tst.b (1,a4)
	beq.w loc_0b2efa
	movea.l ($1c,a4),a0
	move.b ($12,a0),d0
	beq.w loc_0b2efa
	moveq #-$50,d1
	move.b ($b,a4),($b,a6)
	beq.b loc_0b2da4
	neg.w d1

loc_0b2da4:
	add.w ($10,a4),d1
	move.w d1,($10,a6)
	move.w ($14,a4),($14,a6)
	move.b #1,(1,a6)
	cmp.w ($24,a6),d0
	bne.w loc_0b2eea
	rts

;==============================================
loc_0b2dc2:
	move.b (4,a6),d0
	move.w loc_0b2dce(pc,d0.w),d1
	jmp loc_0b2dce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2dce:
	dc.w loc_0b2dd6-loc_0b2dce
	dc.w loc_0b2dfa-loc_0b2dce
	dc.w loc_0b2ec0-loc_0b2dce
	dc.w loc_0b2ec8-loc_0b2dce

;----------------------------------------------
loc_0b2dd6:
	addq.b #2,(4,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2f06

loc_0b2dfa:
	tst.b (1,a4)
	beq.w loc_0b2efa
	movea.l ($1c,a4),a0
	move.b ($12,a0),d0
	beq.w loc_0b2efa
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b #1,(1,a6)
	move.w ($e,a4),($e,a6)
	cmp.w ($24,a6),d0
	bne.w loc_0b2eea
	rts

;==============================================
loc_0b2e30:
	move.b (4,a6),d0
	move.w loc_0b2e3c(pc,d0.w),d1
	jmp loc_0b2e3c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2e3c:
	dc.w loc_0b2e44-loc_0b2e3c
	dc.w loc_0b2e68-loc_0b2e3c
	dc.w loc_0b2ec0-loc_0b2e3c
	dc.w loc_0b2ec8-loc_0b2e3c

;----------------------------------------------
loc_0b2e44:
	addq.b #2,(4,a6)
	move.w ($c,a4),($c,a6)
	move.w ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	clr.w ($24,a6)
	bsr.w loc_0b2f06

loc_0b2e68:
	tst.b (1,a4)
	beq.w loc_0b2efa
	movea.l ($1c,a4),a0
	move.w ($12,a0),d1
	beq.w loc_0b2efa
	moveq #0,d0
	move.b (3,a6),d0
	subq.b #2,d0
	add.w d0,d0
	lsl.w #2,d1
	add.w d1,d0
	lea.l loc_0b1910,a0
	move.w (a0,d0.w),d0
	beq.w loc_0b2efa
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b #1,(1,a6)
	move.w ($e,a4),($e,a6)
	cmp.w ($24,a6),d0
	bne.w loc_0b2eea
	rts

;----------------------------------------------
loc_0b2ec0:
	addq.b #2,(4,a6)
	bra.w loc_0b2efa
 
;----------------------------------------------
loc_0b2ec8:
	moveq #3,d0
	movea.w ($36,a6),a4
	lea.l ($28,a4),a1

loc_0b2ed2:
	movea.w (a1),a0
	cmpa.w a6,a0
	bne.b loc_0b2edc
	clr.w (a1)
	bra.b loc_0b2ee4

loc_0b2edc:
	lea.l (2,a1),a1
	dbra d0,loc_0b2ed2

loc_0b2ee4:
	jmp loc_01c37e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2eea:
	move.w d0,($24,a6)
	movea.l ($40,a6),a0
	add.w d0,d0
	jmp loc_01b6e6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2efa:
	moveq #0,d0
	move.b d0,(1,a6)
	move.w d0,($24,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2f06:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #2,d0
	move.l loc_0b2f16(pc,d0.w),($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2f16:
	dc.l loc_276258,loc_25a5c0
	dc.l loc_2b55b0,loc_2b634e

;##############################################
loc_0b2f26:
	move.b (4,a6),d0
	move.w loc_0b2f32(pc,d0.w),d1
	jmp loc_0b2f32(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2f32:
	dc.w loc_0b2f3a-loc_0b2f32
	dc.w loc_0b2f68-loc_0b2f32
	dc.w loc_0b2fda-loc_0b2f32
	dc.w loc_0b2fda-loc_0b2f32

;==============================================
loc_0b2f3a:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.b #1,(1,a6)
	move.w d0,($c,a6)
	btst #1,(3,a6)
	beq.b loc_0b2f64
	movea.w ($36,a6),a4
	move.l ($40,a4),($40,a6)

loc_0b2f64:
	bra.w loc_0b2fe2

;==============================================
loc_0b2f68:
	move.b (3,a6),d0
	move.w loc_0b2f74(pc,d0.w),d1
	jmp loc_0b2f74(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2f74:
	dc.w loc_0b2f7c-loc_0b2f74
	dc.w loc_0b2f7c-loc_0b2f74
	dc.w loc_0b2fb0-loc_0b2f74
	dc.w loc_0b2fb0-loc_0b2f74

;----------------------------------------------
loc_0b2f7c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l d0,($14,a6)
	cmpi.w #$190,($10,a6)
	ble.b loc_0b2fae
	addi.w #$fff0,($10,a6)
	addi.w #$fff0,($14,a6)
	movea.l ($52,a6),a0
	tst.b (a0)
	beq.b loc_0b2faa
	moveq #$7f,d0

loc_0b2fa6:
	cmp.b (a0)+,d0
	bne.b loc_0b2fa6

loc_0b2faa:
	move.l a0,($52,a6)

loc_0b2fae:
	rts

;----------------------------------------------
loc_0b2fb0:
	move.l ($40,a6),d0
	add.l d0,($14,a6)
	cmpi.w #$100,($14,a6)
	ble.b loc_0b2fd8
	addi.w #$fff0,($14,a6)
	movea.l ($52,a6),a0
	tst.b (a0)
	beq.b loc_0b2fd4
	moveq #$7f,d0

loc_0b2fd0:
	cmp.b (a0)+,d0
	bne.b loc_0b2fd0

loc_0b2fd4:
	move.l a0,($52,a6)

loc_0b2fd8:
	rts

;==============================================
loc_0b2fda:
	jmp loc_01c3c2
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b2fe2:
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_0b2ffc(pc,d0.w),(a0)+
	add.w d0,d0
	move.l loc_0b3004(pc,d0.w),(a0)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b2ffc:
	dc.w $0006,$000a,$000c,$000e

loc_0b3004:
	dc.l loc_0b30b8,loc_0b3675
	dc.l loc_0b30b4,loc_0b3671

;##############################################
loc_0b3014:
	cmpi.b #2,($6ebc,a5)
	bcs.b loc_0b3062
	jsr loc_01c3ac
	move.l #$1000002,(a4)
	move.w #$180,($10,a4)
	move.w #$c0,($14,a4)
	move.l #$10000,($40,a4)
	movea.w a4,a1
	jsr loc_01c3ac
	move.l #$1000000,(a4)
	move.w #$180,($10,a4)
	move.w #$c0,($14,a4)
	move.l #$10000,($40,a4)
	move.w a4,($36,a1)

loc_0b3062:
	rts

;##############################################
loc_0b3064:
	cmpi.b #2,($6ebc,a5)
	bcs.b loc_0b30b2
	jsr loc_01c3ac
	move.l #$1000006,(a4)
	move.w #$70,($10,a4)
	move.w #$f0,($14,a4)
	move.l #$10000,($40,a4)
	movea.w a4,a1
	jsr loc_01c3ac
	move.l #$1000004,(a4)
	move.w #$80,($10,a4)
	move.w #$f0,($14,a4)
	move.l #$10000,($40,a4)
	move.w a4,($36,a1)

loc_0b30b2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Credits Names
	include "EngTextdata/creditstext.asm"

;##############################################
loc_0b382e:
	tst.l ($36,a6)
	beq.w loc_0b3988
	move.b (4,a6),d0
	move.w loc_0b3842(pc,d0.w),d1
	jmp loc_0b3842(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b3842:
	dc.w loc_0b384a-loc_0b3842
	dc.w loc_0b3872-loc_0b3842
	dc.w loc_0b38f8-loc_0b3842
	dc.w loc_0b38f8-loc_0b3842

;==============================================
loc_0b384a:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($160,a5)
	move.b d0,(1,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.w d0,($c,a6)
	movea.l ($36,a6),a1
	bsr.w loc_0b391a
	bra.w loc_0b38fe

;==============================================
loc_0b3872:
	move.b #1,(1,a6)
	cmpi.b #2,($160,a5)
	beq.w loc_0b3b2e
	move.b (5,a6),d0
	move.w loc_0b3890(pc,d0.w),d1
	jsr loc_0b3890(pc,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b3890:
	dc.w loc_0b3896-loc_0b3890
	dc.w loc_0b38c2-loc_0b3890
	dc.w loc_0b38f6-loc_0b3890

;----------------------------------------------
loc_0b3896:
	subq.b #1,($3a,a6)
	bpl.b loc_0b38bc
	addq.b #2,(5,a6)
	move.b ($3b,a6),($32,a6)
	bpl.w loc_0b3988
	move.b #4,(5,a6)
	move.w ($42,a6),d0
	subq.w #1,d0
	move.w d0,($44,a6)
	rts

loc_0b38bc:
	clr.b (1,a6)
	rts

;----------------------------------------------
loc_0b38c2:
	tst.b ($160,a5)
	bne.b loc_0b38e4
	subq.b #1,($32,a6)
	bpl.b loc_0b38f6
	move.b ($3b,a6),($32,a6)
	addq.w #1,($44,a6)
	move.w ($42,a6),d0
	subq.w #1,d0
	cmp.w ($44,a6),d0
	bgt.b loc_0b38f6

loc_0b38e4:
	addq.b #2,(5,a6)
	st.b ($160,a5)
	move.w ($42,a6),d0
	subq.w #1,d0
	move.w d0,($44,a6)

loc_0b38f6:
	rts

;==============================================
loc_0b38f8:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b38fe:
	lea.l ($40,a6),a0
	move.l a0,($1c,a6)
	move.w #0,(a0)+
	swap d7
	move.l d7,(a0)+
	move.w #$1f,(a0)+
	lea.l ($100,a6),a2
	move.l a2,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b391a:
	lea.l ($4c,a6),a0
	lea.l ($100,a6),a2
	moveq #0,d7
	move.w #$2b60,d6
	moveq #$f,d5
	moveq #0,d3
	moveq #0,d4
	tst.w ($92,a5)
	beq.b loc_0b393a
	move.w #$280,d6
	moveq #8,d5

loc_0b393a:
	move.b (a1)+,d3
	ext.w d3
	bsr.w loc_0b3952
	moveq #0,d3
	moveq #$10,d4
	move.b (a1)+,d3
	cmpi.b #$70,d3
	beq.w loc_0b3988
	ext.w d3

loc_0b3952:
	tst.w ($92,a5)
	bne.w loc_0b398a
	moveq #2,d1

loc_0b395c:
	move.b (a1)+,d0
	lsl.l #8,d0
	dbra d1,loc_0b395c
	asr.l #4,d0
	asr.w #4,d0
	moveq #1,d1

loc_0b396a:
	swap d0
	tst.w d0
	beq.b loc_0b3986
	bpl.b loc_0b3974
	subq.w #8,d3

loc_0b3974:
	add.w d6,d0
	add.w d5,d3
	move.w d0,(a0)+
	move.w d3,(a2)+
	move.w d4,(a2)+
	addq.w #1,d7
	dbra d1,loc_0b396a
	bra.b loc_0b3952

loc_0b3986:
	suba.l d1,a1

loc_0b3988:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b398a:
	moveq #0,d0
	move.b (a1)+,d0
	beq.b loc_0b3988
	add.w d6,d0
	add.w d5,d3
	move.w d0,(a0)+
	move.w d3,(a2)+
	move.w d4,(a2)+
	addq.w #1,d7
	bra.b loc_0b398a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b399e:
	dc.w $0000,$0000,$000f,$0000
	dc.w $001e,$0000,$002d,$0000
	dc.w $003c,$0000,$004b,$0000
	dc.w $005a,$0000,$0069,$0000
	dc.w $0078,$0000,$0087,$0000
	dc.w $0096,$0000,$00a5,$0000
	dc.w $00b4,$0000,$00c3,$0000
	dc.w $00d2,$0000,$00e1,$0000
	dc.w $00f0,$0000,$00ff,$0000
	dc.w $0000,$0010,$000f,$0010
	dc.w $001e,$0010,$002d,$0010
	dc.w $003c,$0010,$004b,$0010
	dc.w $005a,$0010,$0069,$0010
	dc.w $0078,$0010,$0087,$0010
	dc.w $0096,$0010,$00a5,$0010
	dc.w $00b4,$0010,$00c3,$0010
	dc.w $00d2,$0010,$00e1,$0010
	dc.w $00f0,$0010,$00ff,$0010
	dc.w $0000,$0000,$0008,$0000
	dc.w $0010,$0000,$0018,$0000
	dc.w $0020,$0000,$0028,$0000
	dc.w $0030,$0000,$0038,$0000
	dc.w $0040,$0000,$0048,$0000
	dc.w $0050,$0000,$0058,$0000
	dc.w $0060,$0000,$0068,$0000
	dc.w $0070,$0000,$0078,$0000
	dc.w $0080,$0000,$0088,$0000
	dc.w $0090,$0000,$0098,$0000
	dc.w $00a0,$0000,$00a8,$0000
	dc.w $00b0,$0000,$00b8,$0000
	dc.w $00c0,$0000,$00c8,$0000
	dc.w $00d0,$0000,$00d8,$0000
	dc.w $00e0,$0000,$00e8,$0000
	dc.w $00f0,$0000,$00f8,$0000
	dc.w $0000,$0010,$0008,$0010
	dc.w $0010,$0010,$0018,$0010
	dc.w $0020,$0010,$0028,$0010
	dc.w $0030,$0010,$0038,$0010
	dc.w $0040,$0010,$0048,$0010
	dc.w $0050,$0010,$0058,$0010
	dc.w $0060,$0010,$0068,$0010
	dc.w $0070,$0010,$0078,$0010
	dc.w $0080,$0010,$0088,$0010
	dc.w $0090,$0010,$0098,$0010
	dc.w $00a0,$0010,$00a8,$0010
	dc.w $00b0,$0010,$00b8,$0010
	dc.w $00c0,$0010,$00c8,$0010
	dc.w $00d0,$0010,$00d8,$0010
	dc.w $00e0,$0010,$00e8,$0010
	dc.w $00f0,$0010,$00f8,$0010

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b3b2e:
	addq.b #2,(4,a6)
	clr.b (1,a6)
	rts

;##############################################
loc_0b3b38:
	move.b (4,a6),d0
	move.w loc_0b3b44(pc,d0.w),d1
	jmp loc_0b3b44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b3b44:
	dc.w loc_0b3b4c-loc_0b3b44
	dc.w loc_0b3c0a-loc_0b3b44
	dc.w loc_0b403a-loc_0b3b44
	dc.w loc_0b4044-loc_0b3b44

;==============================================
loc_0b3b4c:
	move.b (5,a6),d0
	move.w loc_0b3b58(pc,d0.w),d1
	jmp loc_0b3b58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b3b58:
	dc.w loc_0b3b5e-loc_0b3b58
	dc.w loc_0b3bde-loc_0b3b58
	dc.w loc_0b3bf2-loc_0b3b58

;----------------------------------------------
loc_0b3b5e:
	move.b #1,(1,a6)
	addq.b #2,(5,a6)
	move.w #$130,($14,a6)
	tst.w ($102,a5)
	beq.b loc_0b3b82
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.w #$100,($14,a6)

loc_0b3b82:
	moveq #0,d0
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.w d0,($10,a6)
	move.w d0,($c,a6)
	move.b d0,($2a,a6)
	move.b d0,(6,a6)
	move.b #2,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	lea.l ($40,a6),a0
	move.l a0,($1c,a6)
	move.w #4,($40,a6)
	move.w #$26,($42,a6)
	move.w #$2b,($44,a6)
	bsr.w loc_0b4050
	bsr.w loc_0b427c
	bsr.w loc_0b42e4
	bsr.w loc_0b434c
	moveq #0,d0
	bra.w loc_0b3f70

;----------------------------------------------
loc_0b3bde:
	cmpi.w #4,($c,a5)
	bne.b loc_0b3bf0
	addq.b #2,(5,a6)
	move.b #1,(1,a6)

loc_0b3bf0:
	rts

;----------------------------------------------
loc_0b3bf2:
	subq.w #2,($14,a6)
	cmpi.w #$100,($14,a6)
	bne.w loc_0b3c08
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_0b3c08:
	rts

;==============================================
loc_0b3c0a:
	move.b #1,(1,a6)
	movea.w (left_hud_pointer,a5),a4
	tst.b ($15d,a5)
	bne.w loc_0b3c34
	tst.b ($141,a5)
	beq.w loc_0b3c34
	tst.b ($130,a4)
	bne.w loc_0b3d04
	bsr.w loc_0b434c
	bra.w loc_0b3c88

loc_0b3c34:
	tst.b ($110,a5)
	bne.w loc_0b3c44
	tst.b ($125,a4)
	beq.w loc_0b3c4c

loc_0b3c44:
	bsr.w loc_0b427c
	bra.w loc_0b3c88

loc_0b3c4c:
	tst.b ($15d,a5)
	bne.w loc_0b3c5c
	tst.b ($130,a4)
	beq.w loc_0b3c76

loc_0b3c5c:
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.w loc_0b3d00
	btst #6,($80,a5)
	beq.w loc_0b3d04
	bsr.w loc_0b434c

loc_0b3c76:
	lea.l ($126,a6),a0
	move.l ($110,a4),d0
	rol.l #4,d0
	clr.b ($28,a6)
	bsr.w loc_0b4380

loc_0b3c88:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($15d,a5)
	bne.w loc_0b3cac
	tst.b ($141,a5)
	beq.w loc_0b3cac
	tst.b ($130,a4)
	bne.w loc_0b3d62
	bsr.w loc_0b434c
	bra.w loc_0b3e6e

loc_0b3cac:
	tst.b ($110,a5)
	bne.w loc_0b3cbc
	tst.b ($125,a4)
	beq.w loc_0b3cc4

loc_0b3cbc:
	bsr.w loc_0b42e4
	bra.w loc_0b3e6e

loc_0b3cc4:
	tst.b ($15d,a5)
	bne.w loc_0b3cd4
	tst.b ($130,a4)
	beq.w loc_0b3cee

loc_0b3cd4:
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.w loc_0b3d00
	btst #6,($80,a5)
	beq.w loc_0b3d62
	bsr.w loc_0b434c

loc_0b3cee:
	lea.l ($15e,a6),a0
	move.l ($110,a4),d0
	rol.l #4,d0
	clr.b ($28,a6)
	bsr.w loc_0b4380

loc_0b3d00:
	bra.w loc_0b3e6e

loc_0b3d04:
	bsr.w loc_0b427c
	bsr.w loc_0b434c
	movea.w (left_hud_pointer,a5),a4
	move.b ($130,a4),d1
	subq.b #1,d1
	bne.w loc_0b3d3e
	lea.l ($10e,a6),a0
	move.l #$630010,(4,a0)
	lea.l ($116,a6),a0
	move.l #$4d0010,(4,a0)
	move.l #$550010,($c,a0)
	bra.w loc_0b3dbc

loc_0b3d3e:
	lea.l ($10e,a6),a0
	move.l #$5b0010,(4,a0)
	lea.l ($116,a6),a0
	move.l #$450010,(4,a0)
	move.l #$4d0010,($c,a0)
	bra.w loc_0b3dbc

loc_0b3d62:
	bsr.w loc_0b42e4
	bsr.w loc_0b434c
	movea.w (right_hud_pointer,a5),a4
	move.b ($130,a4),d1
	subq.b #1,d1
	bne.w loc_0b3d9c
	lea.l ($10e,a6),a0
	move.l #$1280010,(4,a0)
	lea.l ($116,a6),a0
	move.l #$1110010,(4,a0)
	move.l #$1190010,($c,a0)
	bra.w loc_0b3dbc

loc_0b3d9c:
	lea.l ($10e,a6),a0
	move.l #$1200010,(4,a0)
	lea.l ($116,a6),a0
	move.l #$10a0010,(4,a0)
	move.l #$1120010,($c,a0)

loc_0b3dbc:
	lea.l ($10e,a6),a0
	moveq #0,d0
	move.l d0,d1
	move.w (Arcade_Match_Var,a5),d0
	addq.w #1,d0
	move.w d0,d1
	move.w #$60e,(a0)
	move.w #$116,(2,a0)
	tst.w (Region,a5)
	beq.b loc_0b3e16
	move.w #$334,(a0)
	move.w #$116,(2,a0)
	cmpi.w #1,d0
	beq.b loc_0b3e16
	move.w #$336,(a0)
	move.w #$116,(2,a0)
	cmpi.w #2,d0
	beq.b loc_0b3e16
	move.w #$338,(a0)
	move.w #$116,(2,a0)
	cmpi.w #3,d0
	beq.b loc_0b3e16
	move.w #$33a,(a0)
	move.w #$116,(2,a0)

loc_0b3e16:
	tst.b ($15d,a5)
	bne.w loc_0b3e42
	moveq #0,d0
	move.l d0,d1
	move.b ($130,a4),d0
	move.b d0,d1
	move.w #$a28,(a0)
	move.w #$116,(2,a0)
	subq.b #1,d1
	beq.w loc_0b3e42
	move.w #$a80,(a0)
	move.w #$216,(2,a0)

loc_0b3e42:
	move.w #$af5,d7
	jsr Hex_to_Decimal
	lea.l ($116,a6),a0
	move.w (-$5d28,a5),d0
	move.w d0,d1
	lsr.w #4,d0
	andi.w #$f,d0
	beq.w loc_0b3e64
	add.w d7,d0
	move.w d0,(a0)

loc_0b3e64:
	andi.w #$f,d1
	add.w d7,d1
	move.w d1,(8,a0)

loc_0b3e6e:
	tst.b ($107,a5)
	beq.w loc_0b404e
	moveq #0,d0
	move.b (6,a6),d0
	move.w loc_0b3e84(pc,d0.w),d1
	jmp loc_0b3e84(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b3e84:
	dc.w loc_0b3e8c-loc_0b3e84
	dc.w loc_0b3f6a-loc_0b3e84
	dc.w loc_0b3f6a-loc_0b3e84
	dc.w loc_0b3f70-loc_0b3e84

;----------------------------------------------
loc_0b3e8c:
	movea.w (left_hud_pointer,a5),a4
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d7
	move.b ($108,a5),d7
	subq.b #1,d7
	lea.l ($12a,a4),a2
	movea.w (right_hud_pointer,a5),a4
	tst.b ($ec,a4)
	beq.w loc_0b3eb4
	lea.l (a2,d7.w),a2
	moveq #0,d7

loc_0b3eb4:
	lea.l ($7e,a6),a4
	movea.l a4,a3

loc_0b3eba:
	move.b (a2)+,d0
	andi.b #$f,d0
	add.w d0,d0
	add.w d0,d0
	move.w (a4),d2
	cmpi.w #$2634,d2
	bne.w loc_0b3ee8
	lea.l loc_0b4400(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1),d1
	move.w (a4),d2
	cmp.w d1,d2
	beq.b loc_0b3ee8
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)
	addi.b #1,($2a,a6)

loc_0b3ee8:
	lea.l ($18,a3),a3
	movea.l a3,a4
	dbra d7,loc_0b3eba
	movea.w (right_hud_pointer,a5),a4
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d7
	move.b ($108,a5),d7
	subq.b #1,d7
	lea.l ($12a,a4),a2
	movea.w (left_hud_pointer,a5),a4
	tst.b ($ec,a4)
	beq.w loc_0b3f1a
	lea.l (a2,d7.w),a2
	moveq #0,d7

loc_0b3f1a:
	lea.l ($c6,a6),a4
	movea.l a4,a3

loc_0b3f20:
	move.b (a2)+,d0
	andi.b #$f,d0
	add.w d0,d0
	add.w d0,d0
	move.w (a4),d2
	cmpi.w #$2634,d2
	bne.w loc_0b3f4e
	lea.l loc_0b4400(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1),d1
	move.w (a4),d2
	cmp.w d1,d2
	beq.b loc_0b3f4e
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)
	addi.b #1,($2a,a6)

loc_0b3f4e:
	lea.l ($18,a3),a3
	movea.l a3,a4
	dbra d7,loc_0b3f20
	tst.b ($2a,a6)
	beq.w loc_0b3f68
	addq.b #2,(6,a6)
	clr.b ($2a,a6)

loc_0b3f68:
	rts

;----------------------------------------------
loc_0b3f6a:
	addq.b #2,(6,a6)
	rts

;----------------------------------------------
loc_0b3f70:
	movea.w (left_hud_pointer,a5),a4
	moveq #0,d0
	moveq #0,d1
	moveq #0,d7
	move.b ($108,a5),d7
	subq.b #1,d7
	lea.l ($12a,a4),a2
	movea.w (right_hud_pointer,a5),a4
	tst.b ($ec,a4)
	beq.w loc_0b3f96
	lea.l (a2,d7.w),a2
	moveq #0,d7

loc_0b3f96:
	lea.l ($7e,a6),a4
	movea.l a4,a3

loc_0b3f9c:
	move.b (a2)+,d0
	btst #6,d0
	beq.b loc_0b3faa
	move.w #$2636,(8,a4)

loc_0b3faa:
	btst #5,d0
	beq.b loc_0b3fb6
	move.w #$2635,($10,a4)

loc_0b3fb6:
	andi.b #$f,d0
	add.w d0,d0
	add.w d0,d0
	lea.l loc_0b43c0(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)
	lea.l ($18,a3),a3
	movea.l a3,a4
	dbra d7,loc_0b3f9c
	movea.w (right_hud_pointer,a5),a4
	moveq #0,d0
	moveq #0,d1
	moveq #0,d7
	move.b ($108,a5),d7
	subq.b #1,d7
	lea.l ($12a,a4),a2
	movea.w (left_hud_pointer,a5),a4
	tst.b ($ec,a4)
	beq.w loc_0b3ffa
	lea.l (a2,d7.w),a2
	moveq #0,d7

loc_0b3ffa:
	lea.l ($c6,a6),a4
	movea.l a4,a3

loc_0b4000:
	move.b (a2)+,d0
	btst #6,d0
	beq.b loc_0b400e
	move.w #$2636,(8,a4)

loc_0b400e:
	btst #5,d0
	beq.b loc_0b401a
	move.w #$2635,($10,a4)

loc_0b401a:
	andi.b #$f,d0
	add.w d0,d0
	add.w d0,d0
	lea.l loc_0b43c0(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)
	lea.l ($18,a3),a3
	movea.l a3,a4
	dbra d7,loc_0b4000
	rts

;==============================================
loc_0b403a:
	move.b #2,(4,a6)
	bra.w loc_0b4050

;==============================================
loc_0b4044:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b404a:
	clr.b (1,a6)

loc_0b404e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4050:
	lea.l ($66,a6),a4
	move.w #$27d0,(a4)+
	move.w #$111d,(a4)+
	move.w #$b0,(a4)+
	move.w #$18,(a4)+
	lea.l ($196,a6),a4
	move.w #$20,(a4)
	move.w #$1d,(2,a4)
	move.w #$b0,(4,a4)
	move.w #$28,(6,a4)
	tst.w (Dramatic_Mode_Type,a5)
	bne.b loc_0b4098
	movea.w (left_hud_pointer,a5),a3
	tst.b ($f0,a3)
	bne.b loc_0b4098
	move.w #$2940,(a4)
	move.w #$1d,(2,a4)

loc_0b4098:
	lea.l ($19e,a6),a4
	move.w #$20,(a4)
	move.w #$1d,(2,a4)
	move.w #$c0,(4,a4)
	move.w #$28,(6,a4)
	tst.w (Dramatic_Mode_Type,a5)
	bne.b loc_0b40cc
	movea.w (right_hud_pointer,a5),a3
	tst.b ($f0,a3)
	bne.b loc_0b40cc
	move.w #$2941,(a4)
	move.w #$1d,(2,a4)

loc_0b40cc:
	movea.w (left_hud_pointer,a5),a4
	lea.l ($46,a6),a4
	move.w #$2637,(a4)+
	move.w #$53b,(a4)+
	move.w #0,(a4)+
	move.w #$10,(a4)+
	move.w #$263d,(a4)+
	move.w #$13b,(a4)+
	move.w #0,(a4)+
	move.w #$20,(a4)+
	lea.l ($6e,a6),a4
	move.w #$2631,(a4)+
	move.w #$23b,(a4)+
	move.w #$90,(a4)+
	move.w #$10,(a4)+
	lea.l ($7e,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$a0,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$98,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$98,(a4)+
	move.w #$10,(a4)+
	lea.l ($96,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$90,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$88,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$88,(a4)+
	move.w #$10,(a4)+
	lea.l ($ae,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$80,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$78,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$78,(a4)+
	move.w #$10,(a4)+
	movea.w (right_hud_pointer,a5),a4
	lea.l ($56,a6),a4
	move.w #$2637,(a4)+
	move.w #$51c,(a4)+
	move.w #$120,(a4)+
	move.w #$10,(a4)+
	move.w #$263d,(a4)+
	move.w #$11c,(a4)+
	move.w #$160,(a4)+
	move.w #$20,(a4)+
	lea.l ($76,a6),a4
	move.w #$2631,(a4)+
	move.w #$21c,(a4)+
	move.w #$c0,(a4)+
	move.w #$10,(a4)+
	lea.l ($c6,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$d0,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$c8,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$c8,(a4)+
	move.w #$10,(a4)+
	lea.l ($de,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$e0,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$d8,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$d8,(a4)+
	move.w #$10,(a4)+
	lea.l ($f6,a6),a4
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$f0,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$e8,(a4)+
	move.w #$10,(a4)+
	move.w #$20,(a4)+
	move.w #$1d,(a4)+
	move.w #$e8,(a4)+
	move.w #$10,(a4)+

loc_0b427c:
	lea.l ($126,a6),a0
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$3b000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$44000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$4d000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$56000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$5f000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$68000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$71000f,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b42e4:
	lea.l ($15e,a6),a0
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$100000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$109000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$112000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$11b000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$124000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$12d000f,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$136000f,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b434c:
	lea.l ($10e,a6),a0
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$200010,(a0)+
	lea.l ($116,a6),a0
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$200010,(a0)+
	move.w #$20,(a0)+
	move.w #$16,(a0)+
	move.l #$200010,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4380:
	moveq #6,d7

loc_0b4382:
	move.w #$28e8,d6
	rol.l #4,d0
	move.l d0,d1
	andi.l #$f,d1
	bne.w loc_0b43aa
	tst.b ($28,a6)
	bne.w loc_0b43b0
	tst.b d7
	beq.w loc_0b43b0
	moveq #$20,d1
	moveq #0,d6
	bra.w loc_0b43b0

loc_0b43aa:
	move.b #1,($28,a6)

loc_0b43b0:
	add.w d6,d1
	move.w d1,(a0)
	adda.l #8,a0
	dbra d7,loc_0b4382
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b43c0:
	dc.w $2634,$001d,$2653,$0015,$2652,$0015,$2650,$0018
	dc.w $2651,$001d,$0020,$0010,$0020,$0010,$0020,$0010
	dc.w $2657,$0016,$2658,$0016,$2654,$0016,$2655,$0016
	dc.w $2656,$0016,$0020,$0010,$0020,$0010,$0020,$0010

loc_0b4400:
	dc.w $2634,$001d,$264f,$0015,$264f,$0015,$264f,$0018
	dc.w $264f,$001d,$0020,$0010,$0020,$0010,$0020,$0010
	dc.w $264f,$0016,$264f,$0016,$264f,$0016,$264f,$0016
	dc.w $264f,$0016,$0020,$0010,$0020,$0010,$0020,$0010

;##############################################
loc_0b4440:
	move.b (3,a6),d0
	move.w loc_0b444c(pc,d0.w),d1
	jmp loc_0b444c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b444c:
	dc.w loc_0b4450-loc_0b444c
	dc.w loc_0b45b0-loc_0b444c

;==============================================
loc_0b4450:
	move.b (4,a6),d0
	move.w loc_0b445c(pc,d0.w),d1
	jmp loc_0b445c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b445c:
	dc.w loc_0b446e-loc_0b445c
	dc.w loc_0b450c-loc_0b445c
	dc.w loc_0b4638-loc_0b445c
	dc.w loc_0b463c-loc_0b445c

;----------------------------------------------
loc_0b4464:
	st.b ($14,a5)
	move.b #$78,($15,a5)

loc_0b446e:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	move.b #2,(9,a6)
	move.b #4,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b d0,($b,a6)
	st.b ($c,a6)
	move.b d0,($d,a6)
	move.b d0,($59,a6)
	jsr loc_01bd5c
	move.w ($10,a3),($10,a6)
	move.w ($14,a3),($14,a6)
	addi.w #$e0,($10,a6)
	addi.w #$104,($14,a6)
	move.w #$fff8,($40,a6)
	jsr loc_01c2c8
	beq.b loc_0b44f4
	move.l #$1002300,(a4)
	move.w a6,($36,a4)
	move.b ($a,a6),($a,a4)
	jsr loc_01c2c8
	beq.b loc_0b44f4
	move.l #$1002302,(a4)
	move.w a6,($36,a4)
	move.b ($a,a6),($a,a4)

loc_0b44f4:
	bsr.w loc_0b4666
	tst.b (3,a6)
	bne.b loc_0b450a
	tst.b ($59,a6)
	beq.b loc_0b450a
	addi.w #$180,($10,a6)

loc_0b450a:
	rts

;----------------------------------------------
loc_0b450c:
	move.b (5,a6),d0
	move.w loc_0b4518(pc,d0.w),d1
	jmp loc_0b4518(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4518:
	dc.w loc_0b451e-loc_0b4518
	dc.w loc_0b4576-loc_0b4518
	dc.w loc_0b459a-loc_0b4518

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b451e:
	jsr loc_01bd5c
	move.w ($14,a3),d0
	addi.w #$d8,d0
	cmp.w ($14,a6),d0
	bcs.b loc_0b4574
	move.b #4,(5,a6)
	jsr loc_01c3ac
	beq.b loc_0b4574
	move.l #$1000302,(a4)
	subq.b #1,($a,a6)
	beq.b loc_0b4552
	move.l #$1000300,(a4)

loc_0b4552:
	move.b ($a,a6),($a,a4)
	tst.b ($59,a6)
	beq.b loc_0b4574
	move.b #2,(5,a6)
	st.b ($14,a5)
	move.b #$78,($15,a5)
	move.b #$30,($3a,a6)

loc_0b4574:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b4576:
	tst.b ($59,a6)
	beq.b loc_0b4582
	eori.b #$10,($d,a6)

loc_0b4582:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bne.b loc_0b4598
	addq.b #2,(5,a6)
	clr.b ($d,a6)

loc_0b4598:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b459a:
	jsr loc_01bd5c
	move.w ($14,a3),d0
	addq.w #4,d0
	cmp.w ($14,a6),d0
	bcc.w loc_0b4642
	rts

;==============================================
loc_0b45b0:
	move.b (4,a6),d0
	move.w loc_0b45bc(pc,d0.w),d1
	jmp loc_0b45bc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b45bc:
	dc.w loc_0b4464-loc_0b45bc
	dc.w loc_0b45c4-loc_0b45bc
	dc.w loc_0b4638-loc_0b45bc
	dc.w loc_0b463c-loc_0b45bc

;----------------------------------------------
loc_0b45c4:
	move.b (5,a6),d0
	move.w loc_0b45d0(pc,d0.w),d1
	jmp loc_0b45d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b45d0:
	dc.w loc_0b45d6-loc_0b45d0
	dc.w loc_0b4602-loc_0b45d0
	dc.w loc_0b4636-loc_0b45d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b45d6:
	addq.b #2,(5,a6)
	st.b ($16,a5)
	jsr loc_01c2c8
	beq.b loc_0b4602
	move.l #$1002304,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0b4602
	move.l #$100230a,(a4)
	move.w a6,($36,a4)

loc_0b4602:
	tst.b ($59,a6)
	beq.b loc_0b460e
	eori.b #$10,($d,a6)

loc_0b460e:
	jsr loc_01bd5c
	move.w ($14,a3),d0
	addi.w #$30,d0
	cmp.w ($14,a6),d0
	blt.b loc_0b4634
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	move.b #1,($14,a5)
	clr.b ($d,a6)

loc_0b4634:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b4636:
	rts

;----------------------------------------------
loc_0b4638:
	addq.b #2,(4,a6)

loc_0b463c:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4642
	move.b #4,(4,a6)
	rts

;##############################################
loc_0b464a:
	jsr loc_01c3ac
	beq.w loc_0b4664
	move.l #$1000300,(a4)
	move.w (-$5c44,a5),d0
	subq.w #2,d0
	move.b d0,($a,a4)

loc_0b4664:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4666:
	lea.l ($100,a6),a0
	move.l a0,($1c,a6)
	bsr.w loc_0b4824
	moveq #0,d0
	move.b ($a,a6),d0
	movea.l (-$5c48,a5),a1
	lsl.w #4,d0
	lea.l (a1,d0.w),a1
	move.b ($c,a1),($59,a6)
	clr.b ($c,a1)
	bsr.w loc_0b469c
	bsr.w loc_0b46ba
	bsr.w loc_0b4722
	bra.w loc_0b4700

loc_0b469c:
	lea.l loc_0b4a22(pc),a2
	moveq #0,d0
	move.b ($a,a6),d0
	lsl.w #3,d0
	lea.l (a2,d0.w),a2
	move.w (a2)+,($15a,a6)
	move.w (a2)+,($15e,a6)
	move.w (a2)+,($162,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b46ba:
	lea.l loc_0b493a(pc),a2
	lea.l loc_0b48d2(pc),a3
	moveq #0,d1
	move.b (4,a1),d1
	add.w d1,d1
	move.w (a2,d1.w),($166,a6)
	move.w (a3,d1.w),($16a,a6)
	moveq #0,d1
	move.b (5,a1),d1
	add.w d1,d1
	move.w (a2,d1.w),($16e,a6)
	move.w (a3,d1.w),($172,a6)
	moveq #0,d1
	move.b (6,a1),d1
	add.w d1,d1
	move.w (a2,d1.w),($176,a6)
	move.w (a3,d1.w),($17a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4700:
	movea.l #loc_0b49a2,a2
	tst.w (Region,a5)
	beq.b loc_0b4712
	movea.l #loc_0b49e2,a2

loc_0b4712:
	moveq #0,d1
	move.b (8,a1),d1
	add.w d1,d1
	move.w (a2,d1.w),($19a,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4722:
	cmpi.b #3,($f,a1)
	bcc.b loc_0b4766
	lea.l ($17e,a6),a0
	moveq #0,d2
	moveq #5,d6
	move.l (a1),d1
	rol.l #8,d1

loc_0b4736:
	move.w d1,d3
	andi.w #$f,d3
	bne.b loc_0b4746
	tst.w d2
	bne.b loc_0b4748
	moveq #$20,d3
	bra.b loc_0b474c

loc_0b4746:
	moveq #1,d2

loc_0b4748:
	addi.w #$350,d3

loc_0b474c:
	move.w d3,(a0)
	lea.l (4,a0),a0
	rol.l #4,d1
	dbra d6,loc_0b4736
	move.w d1,d3
	andi.w #$f,d3
	addi.w #$350,d3
	move.w d3,(a0)
	rts

loc_0b4766:
	lea.l ($17e,a6),a0
	move.w #$20,(a0)
	lea.l (4,a0),a0
	moveq #0,d1
	move.b ($b,a1),d1
	move.b loc_0b47c0(pc,d1.w),d1
	move.b d1,d2
	lsr.b #4,d1
	andi.w #$f,d1
	bne.b loc_0b478a
	moveq #$20,d1
	bra.b loc_0b478e

loc_0b478a:
	addi.w #$350,d1

loc_0b478e:
	move.w d1,(a0)
	lea.l (4,a0),a0
	andi.w #$f,d2
	addi.w #$350,d2
	move.w d2,(a0)
	lea.l (4,a0),a0
	move.w #$3d0,(a0)
	lea.l (4,a0),a0
	move.w #$3c2,(a0)
	lea.l (4,a0),a0
	move.w #$3c7,(a0)
	lea.l (4,a0),a0
	move.w #$3cc,(a0)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b47c0:
	dc.b $00,$01,$02,$03
	dc.b $04,$05,$06,$07
	dc.b $08,$09,$10,$11
	dc.b $12,$0d,$14,$15
	dc.b $16,$17,$18,$19
	dc.b $20,$21,$22,$17
	dc.b $24,$25,$26,$27
	dc.b $28,$29,$30,$31
	dc.b $32,$21,$34,$35
	dc.b $36,$37,$38,$39
	dc.b $40,$41,$42,$2b
	dc.b $44,$45,$46,$47
	dc.b $48,$49,$50,$51
	dc.b $52,$35,$54,$55
	dc.b $56,$57,$58,$59
	dc.b $60,$61,$62,$3f
	dc.b $64,$65,$66,$67
	dc.b $68,$69,$70,$71
	dc.b $72,$49,$74,$75
	dc.b $76,$77,$78,$79
	dc.b $80,$81,$82,$53
	dc.b $84,$85,$86,$87
	dc.b $88,$89,$90,$91
	dc.b $92,$5d,$94,$95
	dc.b $96,$97,$98,$99

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4824:
	lea.l loc_0b4b02(pc),a1
	move.w (a1)+,(a0)+
	moveq #5,d7

loc_0b482c:
	movem.l (a1)+,d0-d6/a2
	movem.l d0-d6/a2,(a0)
	lea.l ($20,a0),a0
	dbra d7,loc_0b482c
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b483e:
	dc.w $ff60,$fff8,$ff70,$fff8
	dc.w $ff80,$fff8,$ff90,$fff8
	dc.w $ffa0,$fff8,$ffb0,$fff8
	dc.w $ffc0,$fff8,$ffd0,$fff8
	dc.w $ffe0,$fff8,$fff0,$fff8
	dc.w $0000,$fff8,$0010,$fff8
	dc.w $0020,$fff8,$0030,$fff8
	dc.w $0040,$fff8,$0050,$fff8
	dc.w $0060,$fff8,$0070,$fff8
	dc.w $0080,$fff8,$0090,$fff8
	dc.w $ff68,$fff4,$ff70,$fff4
	dc.w $ff78,$fff4,$ff9b,$fff6
	dc.w $ff98,$fff4,$ffab,$fff6
	dc.w $ffa8,$fff4,$ffbb,$fff6
	dc.w $ffb8,$fff4,$ffd8,$fff4
	dc.w $ffe8,$fff4,$fff8,$fff4
	dc.w $0008,$fff4,$0018,$fff4
	dc.w $0028,$fff4,$0038,$fff4
	dc.w $0050,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b48d2:
	dc.w $035a,$035b,$035c,$035d
	dc.w $035e,$035f,$0360,$0361
	dc.w $0362,$0363,$0364,$0365
	dc.w $0366,$0367,$0368,$0369
	dc.w $036a,$036b,$036c,$036d
	dc.w $036e,$036f,$0370,$0371
	dc.w $0372,$0373,$0350,$0351
	dc.w $0352,$0353,$0354,$0355
	dc.w $0356,$0357,$0358,$0359
	dc.w $0374,$038b,$0399,$037f
	dc.w $037e,$0387,$0377,$0379
	dc.w $0384,$0020,$038d,$038e
	dc.w $0389,$0020,$0020,$0020

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b493a:
	dc.w $015a,$015b,$015c,$015d
	dc.w $015e,$015f,$0160,$0161
	dc.w $0162,$0163,$0164,$0165
	dc.w $0166,$0167,$0168,$0169
	dc.w $016a,$016b,$016c,$016d
	dc.w $016e,$016f,$0170,$0171
	dc.w $0172,$0173,$0150,$0151
	dc.w $0152,$0153,$0154,$0155
	dc.w $0156,$0157,$0158,$0159
	dc.w $0174,$018b,$0199,$017f
	dc.w $017e,$0187,$0177,$0179
	dc.w $0184,$0020,$018d,$018e
	dc.w $0189,$0020,$0020,$0020

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b49a2:
	dc.w $26f4,$26f8,$26fc,$2714
	dc.w $2718,$271c,$2734,$2738
	dc.w $273c,$2754,$2758,$275c
	dc.w $2774,$2778,$277c,$27d4
	dc.w $27d8,$27dc,$2718,$27dc
	dc.w $2734,$2800,$27e4,$2758
	dc.w $27e8,$27ec,$27f0,$27f4
	dc.w $27f8,$27fc,$2898,$289c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b49e2:
	dc.w $26f4,$26f8,$2808,$2804
	dc.w $2718,$271c,$2734,$2738
	dc.w $273c,$2754,$2800,$275c
	dc.w $2774,$2778,$277c,$27d4
	dc.w $27d8,$27dc,$2718,$27dc
	dc.w $2734,$27f8,$27e4,$2800
	dc.w $27e8,$27ec,$27f0,$27f4
	dc.w $2758,$27fc,$2898,$289c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4a22:
	dc.w $0351,$0020,$0334,$0335
	dc.w $0352,$0020,$0336,$0337
	dc.w $0353,$0020,$0338,$0339
	dc.w $0354,$0020,$033a,$033b
	dc.w $0355,$0020,$033a,$033b
	dc.w $0356,$0020,$033a,$033b
	dc.w $0357,$0020,$033a,$033b
	dc.w $0358,$0020,$033a,$033b
	dc.w $0359,$0020,$033a,$033b
	dc.w $02b1,$02b0,$033a,$033b
	dc.w $02b1,$02b1,$033a,$033b
	dc.w $02b1,$02b2,$033a,$033b
	dc.w $02b1,$02b3,$033a,$033b
	dc.w $02b1,$02b4,$033a,$033b
	dc.w $02b1,$02b5,$033a,$033b
	dc.w $02b1,$02b6,$033a,$033b
	dc.w $02b1,$02b7,$033a,$033b
	dc.w $02b1,$02b8,$033a,$033b
	dc.w $02b1,$02b9,$033a,$033b
	dc.w $02b2,$02b0,$033a,$033b
	dc.w $02b2,$02b1,$033a,$033b
	dc.w $02b2,$02b2,$033a,$033b
	dc.w $02b2,$02b3,$033a,$033b
	dc.w $02b2,$02b4,$033a,$033b
	dc.w $02b2,$02b5,$033a,$033b
	dc.w $02b2,$02b6,$033a,$033b
	dc.w $02b2,$02b7,$033a,$033b
	dc.w $02b2,$02b8,$033a,$033b

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4b02:
	dc.w $0008,$0028,$0024
	dc.l loc_0b483e
	dc.w $24cc,$000a,$24cd,$000a
	dc.w $24cd,$000a,$24cd,$000a
	dc.w $24cd,$000a,$24ce,$000a
	dc.w $24cf,$000a,$24dc,$000a
	dc.w $24dd,$000a,$24de,$000a
	dc.w $24df,$000a,$24ec,$000a
	dc.w $24ed,$000a,$24ee,$000a
	dc.w $24ef,$000a,$24fc,$000a
	dc.w $24fc,$000a,$24fc,$000a
	dc.w $24fc,$000a,$24fd,$000a
	dc.w $0020,$000b,$0020,$000b
	dc.w $0020,$010b,$0020,$000e
	dc.w $0020,$000c,$0020,$000e
	dc.w $0020,$000c,$0020,$000e
	dc.w $0020,$000c,$0020,$000d
	dc.w $0020,$000d,$0020,$000d
	dc.w $0020,$000d,$0020,$000d
	dc.w $0020,$000d,$0020,$000d
	dc.w $0020,$031f

;##############################################
loc_0b4ba0:
	tst.l ($36,a6)
	move.b (4,a6),d0
	move.w loc_0b4bb0(pc,d0.w),d1
	jmp loc_0b4bb0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4bb0:
	dc.w loc_0b4bb8-loc_0b4bb0
	dc.w loc_0b4be4-loc_0b4bb0
	dc.w loc_0b4c04-loc_0b4bb0
	dc.w loc_0b4c04-loc_0b4bb0

;==============================================
loc_0b4bb8:
	addq.b #2,(4,a6)
	addq.b #1,(1,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($10,a6)
	move.w #$100,($14,a6)
	move.w #$e000,($18,a6)
	lea.l ($22,a6),a0
	move.l a0,($1c,a6)
	move.w #4,($22,a6)

loc_0b4be4:
	tst.b ($183,a5)
	bne.b loc_0b4c02
	moveq #0,d7
	lea.l ($28,a6),a4
	bsr.w loc_0b4c0a
	bsr.w loc_0b4cd4
	move.w d7,($24,a6)
	subq.w #1,d7
	move.w d7,($26,a6)

loc_0b4c02:
	rts

;==============================================
loc_0b4c04:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4c0a:
	tst.b ($9c,a5)
	bne.w loc_0b4c7c
	tst.b ($9d,a5)
	bne.w loc_0b4c8c
	tst.b ($9e,a5)
	bne.b loc_0b4c3c
	lea.l ($70,a5),a3
	moveq #$33,d0
	tst.b (6,a3)
	bne.b loc_0b4c38
	move.b (2,a3),d0
	sub.b (1,a3),d0
	addi.w #$2a,d0

loc_0b4c38:
	bra.w loc_0b4d38

loc_0b4c3c:
	moveq #1,d6
	lea.l ($78,a5),a3

loc_0b4c42:
	moveq #$34,d0
	tst.b (6,a3)
	bne.b loc_0b4c6c
	move.b (2,a3),d0
	move.b (1,a3),d1
	beq.b loc_0b4c5e
	sub.b d1,d0
	add.b d0,d0
	addi.w #$46,d0
	bra.b loc_0b4c6c

loc_0b4c5e:
	btst #4,($80,a5)
	bne.b loc_0b4c72
	add.b d0,d0
	addi.w #$34,d0

loc_0b4c6c:
	add.b d6,d0
	bsr.w loc_0b4d38

loc_0b4c72:
	lea.l (-8,a3),a3
	dbra d6,loc_0b4c42

loc_0b4c7a:
	rts

loc_0b4c7c:
	btst #4,($80,a5)
	bne.b loc_0b4c7a
	move.w #$e,d0
	bra.w loc_0b4d38

loc_0b4c8c:
	tst.b ($9e,a5)
	bne.b loc_0b4ca2
	moveq #$33,d0
	cmpi.b #1,($76,a5)
	bhi.b loc_0b4c9e
	moveq #$2b,d0

loc_0b4c9e:
	bra.w loc_0b4d38

loc_0b4ca2:
	moveq #1,d6
	lea.l ($78,a5),a3

loc_0b4ca8:
	moveq #$34,d0
	cmpi.b #1,(6,a3)
	bhi.b loc_0b4cc4
	moveq #$48,d0
	tst.b (6,a3)
	bne.b loc_0b4cc4
	btst #4,($80,a5)
	bne.b loc_0b4cca
	moveq #$38,d0

loc_0b4cc4:
	add.w d6,d0
	bsr.w loc_0b4d38

loc_0b4cca:
	lea.l (-8,a3),a3
	dbra d6,loc_0b4ca8
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4cd4:
	tst.b ($9e,a5)
	bne.w loc_0b4d04
	lea.l ($70,a5),a3
	moveq #$19,d0
	tst.b ($9d,a5)
	bne.b loc_0b4cf4
	addq.b #2,d0
	cmpi.b #1,(2,a3)
	bls.b loc_0b4cf4
	addq.b #2,d0

loc_0b4cf4:
	cmpi.b #1,(6,a3)
	bls.b loc_0b4cfe
	addq.b #1,d0

loc_0b4cfe:
	bsr.b loc_0b4d38
	bra.w loc_0b4d86

loc_0b4d04:
	moveq #1,d5
	lea.l ($78,a5),a3

loc_0b4d0a:
	moveq #$1f,d0
	tst.b ($9d,a5)
	bne.b loc_0b4d1e
	addq.b #4,d0
	cmpi.b #1,(2,a3)
	bls.b loc_0b4d1e
	addq.b #4,d0

loc_0b4d1e:
	cmpi.b #1,(6,a3)
	bls.b loc_0b4d28
	addq.b #2,d0

loc_0b4d28:
	add.b d5,d0
	bsr.b loc_0b4d38
	bsr.b loc_0b4d86
	lea.l (-$8,a3),a3
	dbra d5,loc_0b4d0a
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4d38:
	add.w d0,d0
	lea.l loc_01cdd2,a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0

loc_0b4d48:
	moveq #0,d2
	move.b (a0)+,d2
	lsl.w #3,d2
	swap d2
	move.b (a0)+,d2
	add.w d2,d2
	andi.l #$1ff01ff,d2
	moveq #0,d1
	move.b (a0)+,d1

loc_0b4d5e:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_0b4d84
	cmpi.b #$7f,d0
	beq.b loc_0b4d48
	cmpi.b #$20,d0
	beq.b loc_0b4d7c
	addi.w #$200,d0
	move.w d0,(a4)+
	move.w d1,(a4)+
	move.l d2,(a4)+
	addq.w #1,d7

loc_0b4d7c:
	addi.l #$80000,d2
	bra.b loc_0b4d5e

loc_0b4d84:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b4d86:
	moveq #0,d0
	move.b (6,a3),d0
	bsr.b loc_0b4dcc
	move.b ($9c,a5),d0
	or.b ($9d,a5),d0
	bne.b loc_0b4dde
	cmpi.b #1,(2,a3)
	bls.b loc_0b4dde
	moveq #0,d0
	move.b #$28,d0
	bsr.b loc_0b4dc6
	moveq #0,d0
	move.b (1,a3),d0
	bsr.b loc_0b4dcc
	moveq #0,d0
	move.b #$2f,d0
	bsr.b loc_0b4dc6
	moveq #0,d0
	move.b (2,a3),d0
	bsr.b loc_0b4dcc
	moveq #0,d0
	move.b #$29,d0

loc_0b4dc6:
	addi.w #$200,d0
	bra.b loc_0b4dd0

loc_0b4dcc:
	addi.w #$230,d0

loc_0b4dd0:
	move.w d0,(a4)+
	move.w d1,(a4)+
	move.l d2,(a4)+
	addq.w #1,d7
	addi.l #$80000,d2

loc_0b4dde:
	rts

;##############################################
loc_0b4de0:
	jsr loc_01c3ac
	beq.b loc_0b4df0
	addq.b #1,(a4)
	move.b #4,(2,a4)

loc_0b4df0:
	rts

;##############################################
loc_0b4df2:
	move.b (4,a6),d0
	move.w loc_0b4dfe(pc,d0.w),d1
	jmp loc_0b4dfe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4dfe:
	dc.w loc_0b4e06-loc_0b4dfe
	dc.w loc_0b4eb4-loc_0b4dfe
	dc.w loc_0b5ea8-loc_0b4dfe
	dc.w loc_0b5ebc-loc_0b4dfe

;==============================================
loc_0b4e06:
	move.b (5,a6),d0
	move.w loc_0b4e12(pc,d0.w),d1
	jmp loc_0b4e12(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4e12:
	dc.w loc_0b4e18-loc_0b4e12
	dc.w loc_0b4e8a-loc_0b4e12
	dc.w loc_0b4e9e-loc_0b4e12

;----------------------------------------------
loc_0b4e18:
	move.b #1,(1,a6)
	addq.b #2,(5,a6)
	move.w #$d0,($14,a6)
	tst.w ($102,a5)
	beq.b loc_0b4e3c
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.w #$100,($14,a6)

loc_0b4e3c:
	moveq #0,d0
	move.b d0,(9,a6)
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.w d0,($10,a6)
	move.w d0,($c,a6)
	move.w d0,($3a,a6)
	move.l d0,($44,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.w #4,($50,a6)
	move.w #$2a,($52,a6)
	move.w #$25,($54,a6)
	bsr.w loc_0b60ba
	bsr.w loc_0b5ec8
	moveq #0,d0

loc_0b4e8a:
	cmpi.w #4,($c,a5)
	bne.b loc_0b4e9c
	addq.b #2,(5,a6)
	move.b #1,(1,a6)

loc_0b4e9c:
	rts

;----------------------------------------------
loc_0b4e9e:
	addq.w #2,($14,a6)
	cmpi.w #$100,($14,a6)
	bne.b loc_0b4eb2
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_0b4eb2:
	rts

;==============================================
loc_0b4eb4:
	move.b #1,(1,a6)
	subq.b #1,($3a,a6)
	bpl.w loc_0b4ee0
	move.b #3,($3a,a6)
	moveq #0,d0
	addq.b #1,($3b,a6)
	move.b ($3b,a6),d0
	cmpi.b #8,d0
	bne.w loc_0b4ee0
	moveq #0,d0
	move.b d0,($3b,a6)

loc_0b4ee0:
	subq.b #1,($44,a6)
	bpl.w loc_0b4f06
	move.b #2,($44,a6)
	moveq #0,d0
	addq.b #1,($45,a6)
	move.b ($45,a6),d0
	cmpi.b #8,d0
	bne.w loc_0b4f40
	moveq #0,d0
	move.b d0,($45,a6)

loc_0b4f06:
	subq.b #1,($48,a6)
	bpl.w loc_0b4f2c
	move.b #1,($48,a6)
	moveq #0,d0
	addq.b #1,($49,a6)
	move.b ($49,a6),d0
	cmpi.b #8,d0
	bne.w loc_0b4f40
	moveq #0,d0
	move.b d0,($49,a6)

loc_0b4f2c:
	subq.b #1,($46,a6)
	bpl.w loc_0b4f40
	eori.b #1,($47,a6)
	move.b #1,($46,a6)

loc_0b4f40:
	movea.w (left_hud_pointer,a5),a4
	tst.b ($f0,a4)
	bne.w loc_0b5684
	movea.w (left_hud_pointer,a5),a4
	move.w ($11e,a4),($28,a6)
	move.b ($132,a4),($2c,a6)
	cmpi.b #2,($123,a4)
	bne.b loc_0b4f6a
	move.b #$ff,($2c,a6)

loc_0b4f6a:
	tst.b ($f0,a4)
	bne.w loc_0b60b8
	moveq #0,d1
	move.w ($28,a6),d1
	lea.l loc_0b6924(pc),a4
	move.b (a4,d1.w),d1
	move.b d1,($2e,a6)
	tst.b ($2c,a6)
	beq.w loc_0b50e4
	bpl.w loc_0b53aa
	moveq #0,d0
	move.b ($2e,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b4fba
	tst.b ($42,a6)
	beq.b loc_0b4fba
	clr.b ($42,a6)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a
	bra.w loc_0b504a

loc_0b4fba:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b4fc6(pc,d0.w),d1
	jmp loc_0b4fc6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b4fc6:
	dc.w loc_0b5010-loc_0b4fc6
	dc.w loc_0b5010-loc_0b4fc6
	dc.w loc_0b4fce-loc_0b4fc6
	dc.w loc_0b4fea-loc_0b4fc6

;----------------------------------------------
loc_0b4fce:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b501a
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b501a
	bra.w loc_0b5068

;----------------------------------------------
loc_0b4fea:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	beq.b loc_0b5010
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b501a
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b501a
	bra.w loc_0b5068

;----------------------------------------------
loc_0b5010:
	movea.w (left_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.b loc_0b5068

loc_0b501a:
	move.b #1,($40,a6)
	movea.w (left_hud_pointer,a5),a4
	move.b ($b4,a5),d0
	andi.w #3,d0
	add.w d0,d0
	add.w d0,d0
	movea.l #$90c37a,a0
	moveq #0,d7
	lea.l loc_0b649a(pc),a1
	movea.l (a1,d0.w),a1
	bsr.w loc_0b6336
	move.w #$90,($28,a6)

loc_0b504a:
	lea.l ($126,a6),a4
	move.w #$20,(a4)
	move.w #$1b,(2,a4)
	move.w #$20,(8,a4)
	move.w #$1b,($a,a4)
	bra.w loc_0b50c2

loc_0b5068:
	tst.b ($40,a6)
	beq.w loc_0b5084
	clr.b ($40,a6)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b5084:
	moveq #0,d0
	move.b ($2e,a6),d0
	cmpi.b #3,d0
	bne.b loc_0b50c2
	move.b #1,($42,a6)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	bsr.w loc_0b6370
	lea.l ($126,a6),a4
	move.w #$265e,(a4)
	move.w #$11b,(2,a4)
	move.w #$2659,(8,a4)
	move.w #$41b,($a,a4)
	bra.w loc_0b50c2


loc_0b50c2:
	lea.l ($96,a6),a4
	bsr.w loc_0b5d84
	move.w #$3b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($28,a6),d1
	bsr.w loc_0b5e52
	bra.w loc_0b5684

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b50e4:
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a
	moveq #0,d0
	move.b ($2e,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b5128
	lea.l ($166,a6),a4
	move.w #$20,(a4)
	lea.l ($126,a6),a4
	move.w #$20,(a4)
	move.w #$20,(8,a4)
	move.w #$1d,($a,a4)
	move.w #$20,($10,a4)
	move.w #$1d,($12,a4)

loc_0b5128:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b5134(pc,d0.w),d1
	jmp loc_0b5134(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b5134:
	dc.w loc_0b517e-loc_0b5134
	dc.w loc_0b517e-loc_0b5134
	dc.w loc_0b513c-loc_0b5134
	dc.w loc_0b5158-loc_0b5134

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b513c:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b518e
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b518e
	bra.w loc_0b527a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5158:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	beq.b loc_0b517e
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b518e
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b518e
	bra.w loc_0b527a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b517e:
	movea.w (left_hud_pointer,a5),a3
	movea.w (left_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.w loc_0b527a

loc_0b518e:
	move.b #1,($40,a6)
	lea.l ($166,a6),a4
	move.w #$20,(a4)
	lea.l ($126,a6),a4
	move.w #$20,(a4)
	move.w #$20,(8,a4)
	move.w #$1d,($a,a4)
	move.w #$20,($10,a4)
	move.w #$1d,($12,a4)
	move.b ($2e,a6),d0
	cmpi.b #1,d0
	beq.w loc_0b5208
	cmpi.b #2,d0
	beq.w loc_0b51f0
	cmpi.b #3,d0
	bne.w loc_0b5220
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b645a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5230

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b51f0:
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b643a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5230

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5208:
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b641a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5230

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5220:
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b5230:
	movea.w (left_hud_pointer,a5),a4
	movea.w a3,a4
	moveq #0,d0
	move.w d0,d1
	move.b ($82,a4),d0
	add.b d0,d0
	move.b ($2e,a6),d1
	add.b d1,d0
	move.b d0,d1
	tst.b ($47,a6)
	beq.w loc_0b525a
	movea.l #$90c372,a0
	bsr.w loc_0b631a

loc_0b525a:
	lea.l ($96,a6),a4
	lea.l loc_0b654a(pc),a0
	bsr.w loc_0b5e78
	bsr.w loc_0b5d84
	move.w #$3b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	bra.w loc_0b5684

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b527a:
	tst.b ($40,a6)
	beq.w loc_0b5296
	clr.b ($40,a6)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b5296:
	move.b ($2e,a6),d0
	cmpi.b #1,d0
	beq.w loc_0b5352
	cmpi.b #2,d0
	beq.w loc_0b5318
	cmpi.b #3,d0
	bne.w loc_0b5388
	move.b #1,($42,a6)
	lea.l ($166,a6),a4
	move.w #$2696,(a4)+
	move.w #$1b,(a4)+
	move.w #$10,(a4)+
	move.w #$e0,(a4)+
	lea.l ($126,a6),a4
	move.w #$2692,(a4)
	move.b ($80,a5),d1
	andi.w #$3f,d1
	bne.w loc_0b5300
	move.w #$2698,(8,a4)
	move.w #$215,($a,a4)
	btst #6,($80,a5)
	beq.b loc_0b5300
	move.w #$269d,(8,a4)
	move.w #$215,($a,a4)

loc_0b5300:
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b645a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5388

loc_0b5318:
	move.b #1,($42,a6)
	lea.l ($166,a6),a4
	move.w #$2695,(a4)+
	move.w #$1b,(a4)+
	move.w #$10,(a4)+
	move.w #$e0,(a4)+
	lea.l ($126,a6),a4
	move.w #$2692,(a4)
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b643a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5388

loc_0b5352:
	move.b #1,($42,a6)
	lea.l ($166,a6),a4
	move.w #$2694,(a4)+
	move.w #$1b,(a4)+
	move.w #$10,(a4)+
	move.w #$e0,(a4)+
	lea.l ($126,a6),a4
	move.w #$2692,(a4)
	moveq #$f,d7
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	lea.l loc_0b641a(pc),a1
	bsr.w loc_0b6346

loc_0b5388:
	lea.l ($96,a6),a4
	bsr.w loc_0b5d84
	move.w #$3b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($28,a6),d1
	bsr.w loc_0b5e52
	bra.w loc_0b5684

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b53aa:
	movea.w (left_hud_pointer,a5),a4
	tst.b ($b9,a4)
	beq.w loc_0b547a
	move.b #1,($40,a6)
	lea.l ($166,a6),a4
	lea.l loc_0b6a48(pc),a1
	move.w ($28,a6),d0
	add.w d0,d0
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b ($b4,a5),d1
	andi.b #$1f,d1
	add.b d1,d1
	lea.l loc_0b6634(pc),a0
	lea.l (a0,d1.w),a0
	move.w (a0),d1
	addi.w #$293a,d1
	move.w d1,(a4)+
	move.w #$103b,(a4)+
	move.w (a1),(a4)+
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	bsr.w loc_0b6370
	lea.l ($126,a6),a4
	move.w ($28,a6),d0
	move.w d0,d1
	add.w d0,d0
	add.w d1,d0
	add.w d0,d0
	lea.l loc_0b8b22(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1)+,(a4)
	move.w #$1b,(2,a4)
	move.w #$fffe,(4,a4)
	move.w (a1)+,(8,a4)
	move.w #$1b,($a,a4)
	move.w #$8,($c,a4)
	move.w (a1)+,($10,a4)
	move.w #$1b,($12,a4)
	move.w #$17,($14,a4)
	move.w #$20,($18,a4)
	move.w #$1b,($1a,a4)
	lea.l ($96,a6),a4
	bsr.w loc_0b5d84
	move.w #$3b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($28,a6),d1
	lea.l loc_0b69b6(pc),a1
	move.b (a1,d1.w),d1
	bsr.w loc_0b5e52
	bra.w loc_0b5684

loc_0b547a:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b5486(pc,d0.w),d1
	jmp loc_0b5486(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b5486:
	dc.w loc_0b54d0-loc_0b5486
	dc.w loc_0b54d0-loc_0b5486
	dc.w loc_0b548e-loc_0b5486
	dc.w loc_0b54aa-loc_0b5486

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b548e:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b54da
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b54da
	bra.w loc_0b550e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b54aa:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	beq.b loc_0b54d0
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b54da
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b54da
	bra.w loc_0b550e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b54d0:
	movea.w (left_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.b loc_0b550e

loc_0b54da:
	move.b ($b4,a5),d0
	andi.w #3,d0
	add.w d0,d0
	add.w d0,d0
	movea.l #$90c378,a0
	moveq #1,d7
	lea.l loc_0b64aa(pc),a1
	movea.l (a1,d0.w),a1
	bsr.w loc_0b6336
	lea.l ($126,a6),a4
	move.w #$20,(8,a4)
	move.w #$15,($a,a4)
	bra.w loc_0b5638

loc_0b550e:
	moveq #0,d0
	move.b ($2e,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b5532
	clr.b ($42,a6)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a
	bra.w loc_0b553e

loc_0b5532:
	tst.b ($40,a6)
	beq.w loc_0b557a
	clr.b ($40,a6)

loc_0b553e:
	lea.l ($126,a6),a4
	move.w #$20,(a4)
	move.w #$1b,(2,a4)
	move.w #$20,(8,a4)
	move.w #$17,($a,a4)
	move.w #$20,($10,a4)
	move.w #$20,($18,a4)
	move.w #$1b,($1a,a4)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b557a:
	lea.l ($126,a6),a4
	move.w #$20,(a4)
	move.w #$1b,(2,a4)
	cmpi.w #$48,($28,a6)
	bcs.w loc_0b55c0
	lea.l ($126,a6),a4
	move.w #$293d,(a4)
	move.w #$111b,(2,a4)
	move.w #$ffff,(4,a4)
	move.w #$29cb,($18,a4)
	move.w #$11b,($1a,a4)
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	bsr.w loc_0b6358

loc_0b55c0:
	moveq #0,d0
	move.b ($2e,a6),d0
	cmpi.b #3,d0
	bne.b loc_0b5638
	move.b #1,($42,a6)
	lea.l ($126,a6),a4
	move.w #$29ae,(a4)
	move.w #$111b,(2,a4)
	move.w #$ffff,(4,a4)
	move.w #$20,($18,a4)
	move.w #$1b,($1a,a4)
	move.b ($80,a5),d1
	andi.w #$3f,d1
	bne.w loc_0b562a
	move.w #$26dd,(8,a4)
	move.w #$217,($a,a4)
	move.w #$50,($c,a4)
	btst #6,($80,a5)
	beq.b loc_0b562a
	move.w #$28f2,(8,a4)
	move.w #$417,($a,a4)
	move.w #$40,($c,a4)

loc_0b562a:
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	bsr.w loc_0b6370

loc_0b5638:
	lea.l ($166,a6),a4
	lea.l loc_0b6a48(pc),a1
	move.w ($28,a6),d0
	add.w d0,d0
	lea.l (a1,d0.w),a1
	move.w #$293a,d1
	move.w d1,(a4)+
	move.w #$103b,(a4)+
	move.w (a1),(a4)+
	lea.l ($96,a6),a4
	bsr.w loc_0b5d84
	move.w #$3b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($28,a6),d1
	bsr.w loc_0b5e52
	bra.w loc_0b5684

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5678:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($f0,a4)
	bne.w loc_0b60b8

loc_0b5684:
	movea.w (right_hud_pointer,a5),a4
	move.w ($11e,a4),($2a,a6)
	move.b ($132,a4),($2c,a6)
	cmpi.b #2,($123,a4)
	bne.b loc_0b56a2
	move.b #$ff,($2c,a6)

loc_0b56a2:
	tst.b ($f0,a4)
	bne.w loc_0b60b8
	move.w ($2a,a6),d1
	lea.l loc_0b6924(pc),a4
	move.b (a4,d1.w),d1
	move.b d1,($2f,a6)
	tst.b ($2c,a6)
	beq.w loc_0b5810
	bpl.w loc_0b5abe
	moveq #0,d0
	move.b ($2f,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b56f0
	tst.b ($43,a6)
	beq.b loc_0b56f0
	clr.b ($43,a6)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a
	bra.w loc_0b5780

loc_0b56f0:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b56fc(pc,d0.w),d1
	jmp loc_0b56fc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b56fc:
	dc.w loc_0b5746-loc_0b56fc
	dc.w loc_0b5704-loc_0b56fc
	dc.w loc_0b5746-loc_0b56fc
	dc.w loc_0b5720-loc_0b56fc

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5704:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5750
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5750
	bra.w loc_0b579e

loc_0b5720:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	bne.b loc_0b5746
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5750
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5750
	bra.w loc_0b579e

loc_0b5746:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.b loc_0b579e

loc_0b5750:
	move.b #1,($41,a6)
	movea.w (right_hud_pointer,a5),a4
	move.b ($b4,a5),d0
	andi.w #3,d0
	add.w d0,d0
	add.w d0,d0
	movea.l #$90c39a,a0
	moveq #0,d7
	lea.l loc_0b649a(pc),a1
	movea.l (a1,d0.w),a1
	bsr.w loc_0b6336
	move.w #$90,($2a,a6)

loc_0b5780:
	lea.l ($146,a6),a4
	move.w #$20,(a4)
	move.w #$1c,(2,a4)
	move.w #$20,($8,a4)
	move.w #$1c,($a,a4)
	bra.w loc_0b57f2

loc_0b579e:
	tst.b ($41,a6)
	beq.w loc_0b57ba
	clr.b ($41,a6)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b57ba:
	move.b ($2f,a6),d0
	cmpi.b #3,d0
	bne.b loc_0b57f2
	move.b #1,($43,a6)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	bsr.w loc_0b6370
	lea.l ($146,a6),a4
	move.w #$265e,(a4)
	move.w #$11c,(2,a4)
	move.w #$2659,(8,a4)
	move.w #$41c,($a,a4)

loc_0b57f2:
	lea.l ($de,a6),a4
	bsr.w loc_0b5dbc
	move.w #$1c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($2a,a6),d1
	bra.w loc_0b5e52

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5810:
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a
	moveq #0,d0
	move.b ($2f,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b5854
	lea.l ($16e,a6),a4
	move.w #$20,(a4)
	lea.l ($146,a6),a4
	move.w #$20,(a4)
	move.w #$20,(8,a4)
	move.w #$1d,($a,a4)
	move.w #$20,($10,a4)
	move.w #$1d,($12,a4)

loc_0b5854:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b5860(pc,d0.w),d1
	jmp loc_0b5860(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b5860:
	dc.w loc_0b58aa-loc_0b5860
	dc.w loc_0b5868-loc_0b5860
	dc.w loc_0b58aa-loc_0b5860
	dc.w loc_0b5884-loc_0b5860

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5868:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b58ba
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b58ba
	bra.w loc_0b599e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5884:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	bne.b loc_0b58aa
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b58ba
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b58ba
	bra.w loc_0b599e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b58aa:
	movea.w (right_hud_pointer,a5),a3
	movea.w (right_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.w loc_0b599e

loc_0b58ba:
	move.b #1,($41,a6)
	lea.l ($16e,a6),a4
	move.w #$20,(a4)
	lea.l ($146,a6),a4
	move.w #$20,(a4)
	move.w #$20,(8,a4)
	move.w #$1d,($a,a4)
	move.w #$20,($10,a4)
	move.w #$1d,($12,a4)
	move.b ($2f,a6),d0
	cmpi.b #1,d0
	beq.w loc_0b5934
	cmpi.b #2,d0
	beq.w loc_0b591c
	cmpi.b #3,d0
	bne.w loc_0b594c
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b645a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b595c

loc_0b591c:
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b643a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b595c

loc_0b5934:
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b641a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b595c

loc_0b594c:
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b595c:
	moveq #0,d0
	move.w d0,d1
	move.b ($82,a4),d0
	add.b d0,d0
	move.b ($2f,a6),d1
	add.b d1,d0
	move.b d0,d1
	tst.b ($47,a6)
	beq.w loc_0b5980
	movea.l #$90c392,a0
	bsr.w loc_0b631a

loc_0b5980:
	lea.l ($de,a6),a4
	lea.l loc_0b654a(pc),a0
	bsr.w loc_0b5e78
	bsr.w loc_0b5dbc
	move.w #$3c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b599e:
	tst.b ($41,a6)
	beq.w loc_0b59ba
	clr.b ($41,a6)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b59ba:
	move.b ($2f,a6),d0
	cmpi.b #1,d0
	beq.w loc_0b5a70
	cmpi.b #2,d0
	beq.w loc_0b5a3c
	cmpi.b #3,d0
	bne.w loc_0b5aa0
	move.b #1,($43,a6)
	lea.l ($16e,a6),a4
	move.w #$2696,(a4)+
	move.w #$1c,(a4)+
	move.w #$170,(a4)+
	move.w #$e0,(a4)+
	lea.l ($146,a6),a4
	move.w #$2692,(a4)
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.w loc_0b5a24
	move.w #$2698,(8,a4)
	move.w #$215,($a,a4)
	btst #6,($80,a5)
	beq.b loc_0b5a24
	move.w #$269d,(8,a4)
	move.w #$215,($a,a4)

loc_0b5a24:
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b645a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5aa0

loc_0b5a3c:
	lea.l ($16e,a6),a4
	move.w #$2695,(a4)+
	move.w #$1c,(a4)+
	move.w #$170,(a4)+
	move.w #$e0,(a4)+
	lea.l ($146,a6),a4
	move.w #$2692,(a4)
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b643a(pc),a1
	bsr.w loc_0b6346
	bra.w loc_0b5aa0

loc_0b5a70:
	lea.l ($16e,a6),a4
	move.w #$2694,(a4)+
	move.w #$1c,(a4)+
	move.w #$170,(a4)+
	move.w #$e0,(a4)+
	lea.l ($146,a6),a4
	move.w #$2692,(a4)
	moveq #$f,d7
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	lea.l loc_0b641a(pc),a1
	bsr.w loc_0b6346

loc_0b5aa0:
	lea.l ($de,a6),a4
	bsr.w loc_0b5dbc
	move.w #$1c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($2a,a6),d1
	bra.w loc_0b5e52

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5abe:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($b9,a4)
	beq.w loc_0b5b8a
	move.b #1,($41,a6)
	lea.l ($16e,a6),a4
	lea.l loc_0b6b6a(pc),a1
	move.w ($2a,a6),d0
	add.w d0,d0
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b ($b4,a5),d1
	andi.b #$1f,d1
	add.b d1,d1
	lea.l loc_0b6634(pc),a0
	lea.l (a0,d1.w),a0
	move.w (a0),d1
	addi.w #$293a,d1
	move.w d1,(a4)+
	move.w #$101c,(a4)+
	move.w (a1),(a4)+
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	bsr.w loc_0b6370
	lea.l ($146,a6),a4
	move.w ($2a,a6),d0
	move.w d0,d1
	add.w d0,d0
	add.w d1,d0
	add.w d0,d0
	lea.l loc_0b8b22(pc),a1
	lea.l (a1,d0.w),a1
	move.w (a1)+,(a4)
	move.w #$1c,(2,a4)
	move.w #$15e,(4,a4)
	move.w (a1)+,(8,a4)
	move.w #$1c,($a,a4)
	move.w #$168,($c,a4)
	move.w (a1)+,($10,a4)
	move.w #$1c,($12,a4)
	move.w #$178,($14,a4)
	move.w #$20,($18,a4)
	move.w #$1b,($1a,a4)
	lea.l ($de,a6),a4
	bsr.w loc_0b5dbc
	move.w #$1c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($2a,a6),d1
	lea.l loc_0b69b6(pc),a1
	move.b (a1,d1.w),d1
	bra.w loc_0b5e52

loc_0b5b8a:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b5b96(pc,d0.w),d1
	jmp loc_0b5b96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b5b96:
	dc.w loc_0b5be0-loc_0b5b96
	dc.w loc_0b5b9e-loc_0b5b96
	dc.w loc_0b5be0-loc_0b5b96
	dc.w loc_0b5bba-loc_0b5b96

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5b9e:
	lea.l (p3memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5bea
	lea.l (p4memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5bea
	bra.w loc_0b5c1e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5bba:
	move.b (Active_Player_01,a5),d0
	btst #0,d0
	bne.b loc_0b5be0
	lea.l (p1memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5bea
	lea.l (p2memory,a5),a3
	tst.b ($ab,a3)
	bmi.w loc_0b5bea
	bra.w loc_0b5c1e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b5be0:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($ab,a4)
	bpl.b loc_0b5c1e

loc_0b5bea:
	move.b ($b4,a5),d0
	andi.w #3,d0
	add.w d0,d0
	add.w d0,d0
	movea.l #$90c398,a0
	moveq #1,d7
	lea.l loc_0b64aa(pc),a1
	movea.l (a1,d0.w),a1
	bsr.w loc_0b6336
	lea.l ($146,a6),a4
	move.w #$20,(8,a4)
	move.w #$15,($a,a4)
	bra.w loc_0b5d48

loc_0b5c1e:
	moveq #0,d0
	move.b ($2f,a6),d0
	cmpi.b #3,d0
	beq.b loc_0b5c42
	clr.b ($43,a6)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a
	bra.w loc_0b5c4e

loc_0b5c42:
	tst.b ($41,a6)
	beq.w loc_0b5c8a
	clr.b ($41,a6)

loc_0b5c4e:
	lea.l ($146,a6),a4
	move.w #$20,(a4)
	move.w #$1b,(2,a4)
	move.w #$20,(8,a4)
	move.w #$17,($a,a4)
	move.w #$20,($10,a4)
	move.w #$20,($18,a4)
	move.w #$1b,($1a,a4)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	moveq #0,d0
	bsr.w loc_0b637a

loc_0b5c8a:
	lea.l ($146,a6),a4
	move.w #$20,(a4)
	move.w #$1c,(2,a4)
	cmpi.w #$48,($2a,a6)
	bcs.w loc_0b5cd0
	lea.l ($146,a6),a4
	move.w #$293d,(a4)
	move.w #$111c,(2,a4)
	move.w #$160,(4,a4)
	move.w #$29cb,($18,a4)
	move.w #$11c,($1a,a4)
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	bsr.w loc_0b6358

loc_0b5cd0:
	moveq #0,d0
	move.b ($2f,a6),d0
	cmpi.b #3,d0
	bne.b loc_0b5d48
	move.b #1,($43,a6)
	lea.l ($146,a6),a4
	move.w #$29ae,(a4)
	move.w #$111c,(2,a4)
	move.w #$162,(4,a4)
	move.w #$20,($18,a4)
	move.w #$1c,($1a,a4)
	move.b ($80,a5),d1
	andi.w #$3f,d1
	bne.w loc_0b5d3a
	move.w #$26dd,(8,a4)
	move.w #$217,($a,a4)
	move.w #$100,($c,a4)
	btst #6,($80,a5)
	beq.b loc_0b5d3a
	move.w #$28f2,(8,a4)
	move.w #$417,($a,a4)
	move.w #$f0,($c,a4)

loc_0b5d3a:
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	bsr.w loc_0b6370

loc_0b5d48:
	lea.l ($16e,a6),a4
	lea.l loc_0b6b6a(pc),a1
	move.w ($2a,a6),d0
	add.w d0,d0
	lea.l (a1,d0.w),a1
	move.w #$293a,d1
	move.w d1,(a4)+
	move.w #$101c,(a4)+
	move.w (a1),(a4)+
	lea.l ($de,a6),a4
	bsr.w loc_0b5dbc
	move.w #$1c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($2a,a6),d1
	bra.w loc_0b5e52

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5d84:
	move.w #$20,(4,a4)
	move.w #$30,($c,a4)
	move.w #$40,($14,a4)
	move.w #$50,($1c,a4)
	move.w #$60,($24,a4)
	move.w #$70,($2c,a4)
	move.w #$80,($34,a4)
	move.w #$90,($3c,a4)
	move.w #$a0,($44,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5dbc:
	move.w #$150,(4,a4)
	move.w #$140,($c,a4)
	move.w #$130,($14,a4)
	move.w #$120,($1c,a4)
	move.w #$110,($24,a4)
	move.w #$100,($2c,a4)
	move.w #$f0,($34,a4)
	move.w #$e0,($3c,a4)
	move.w #$d0,($44,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5df4:
	move.w #$e0,(6,a4)
	move.w #$e0,($e,a4)
	move.w #$e0,($16,a4)
	move.w #$e0,($1e,a4)
	move.w #$e0,($26,a4)
	move.w #$e0,($2e,a4)
	move.w #$e0,($36,a4)
	move.w #$e0,($3e,a4)
	move.w #$e0,($46,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5e2c:
	move.w d1,(2,a4)
	move.w d1,($a,a4)
	move.w d1,($12,a4)
	move.w d1,($1a,a4)
	move.w d1,($22,a4)
	move.w d1,($2a,a4)
	move.w d1,($32,a4)
	move.w d1,($3a,a4)
	move.w d1,($42,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5e52:
	lea.l loc_0b6c8c(pc),a0
	tst.b ($2c,a6)
	bmi.b loc_0b5e6a
	beq.b loc_0b5e64
	adda.l #$a32,a0

loc_0b5e64:
	adda.l #$a32,a0

loc_0b5e6a:
	move.w d1,d3
	bpl.w loc_0b5e72
	moveq #0,d1

loc_0b5e72:
	tst.w d1
	bpl.b loc_0b5e78
	moveq #0,d1

loc_0b5e78:
	add.w d1,d1
	move.w d1,d2
	lsl.w #3,d1
	add.w d2,d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,(a4)
	move.w (a0)+,(8,a4)
	move.w (a0)+,($10,a4)
	move.w (a0)+,($18,a4)
	move.w (a0)+,($20,a4)
	move.w (a0)+,($28,a4)
	move.w (a0)+,($30,a4)
	move.w (a0)+,($38,a4)
	move.w (a0)+,($40,a4)
	rts

;==============================================
loc_0b5ea8:
	move.b #2,(4,a6)
	movea.l #$90c360,a0
	bsr.w loc_0b62d4
	bra.w loc_0b60ba

;==============================================
loc_0b5ebc:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5ec2:
	clr.b (1,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b5ec8:
	movea.w (left_hud_pointer,a5),a4
	tst.b ($f0,a4)
	beq.w loc_0b5fc0
	lea.l ($56,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($76,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($96,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($126,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($166,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+

loc_0b5fc0:
	movea.w (right_hud_pointer,a5),a4
	tst.b ($f0,a4)
	beq.w loc_0b60b8
	lea.l ($66,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($86,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($de,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($146,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	move.l #$200000,(a3)+
	move.l #0,(a3)+
	lea.l ($16e,a6),a3
	move.l #$200000,(a3)+
	move.l #0,(a3)+

loc_0b60b8:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b60ba:
	moveq #0,d0
	move.l d0,d1
	movea.w (left_hud_pointer,a5),a4
	move.b ($ec,a4),d0
	movea.w (right_hud_pointer,a5),a4
	move.b ($ec,a4),d1
	add.b d1,d1
	add.b d1,d0
	lsl.b #3,d0
	lea.l loc_0b6764(pc),a1
	lea.l (a1,d0.w),a1
	lea.l ($176,a6),a4
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)+
	move.w #$b0,(a4)+
	move.w #$e0,(a4)
	lea.l ($17e,a6),a4
	move.w (a1)+,(a4)+
	move.w (a1)+,(a4)+
	move.w #$c0,(a4)+
	move.w #$e0,(a4)
	movea.w (left_hud_pointer,a5),a4
	move.w ($11e,a4),($28,a6)
	move.b ($132,a4),($2c,a6)
	cmpi.b #2,($123,a4)
	bne.b loc_0b611a
	move.b #$ff,($2c,a6)

loc_0b611a:
	movea.l #$90c360,a0
	jsr loc_0b62d4(pc)
	nop
	move.b ($102,a4),d0
	lea.l ($76,a6),a4
	lea.l loc_0b6784(pc),a0
	tst.b ($2c,a6)
	bmi.b loc_0b6146
	beq.b loc_0b6140
	adda.l #$10,a0

loc_0b6140:
	adda.l #$10,a0

loc_0b6146:
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	tst.b ($2c,a6)
	bmi.w loc_0b616a
	beq.w loc_0b6162
	lea.l loc_0b6674(pc),a3
	bra.w loc_0b616e

loc_0b6162:
	lea.l loc_0b669c(pc),a3
	bra.w loc_0b616e

loc_0b616a:
	lea.l loc_0b66c4(pc),a3

loc_0b616e:
	lea.l ($166,a6),a4
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	lea.l ($126,a6),a4
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	movea.w (left_hud_pointer,a5),a4
	moveq #0,d0
	lea.l loc_0b67e4(pc),a1
	move.b ($123,a4),d0
	bmi.w loc_0b61a2
	addq.l #1,d0
	lsl.l #4,d0
	adda.l d0,a1

loc_0b61a2:
	tst.b (Dip_SFAlpha,a5)
	beq.b loc_0b61ae
	adda.l #$50,a1

loc_0b61ae:
	lea.l ($56,a6),a4
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	lea.l ($166,a6),a4
	move.l #$200000,(a4)+
	move.l #$a000d8,(a4)+
	lea.l ($96,a6),a4
	bsr.w loc_0b5d84
	move.w #$1b,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($28,a6),d1
	bsr.w loc_0b5e52
	movea.w (right_hud_pointer,a5),a4
	move.w ($11e,a4),($2a,a6)
	move.b ($132,a4),($2c,a6)
	cmpi.b #2,($123,a4)
	bne.b loc_0b6206
	move.b #$ff,($2c,a6)

loc_0b6206:
	movea.l #$90c380,a0
	jsr loc_0b62d4(pc)
	nop
	move.b ($102,a4),d0
	lea.l ($86,a6),a4
	lea.l loc_0b67b4(pc),a0
	tst.b ($2c,a6)
	bmi.b loc_0b6232
	beq.b loc_0b622c
	adda.l #$10,a0

loc_0b622c:
	adda.l #$10,a0

loc_0b6232:
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	tst.b ($2c,a6)
	bmi.w loc_0b6256
	beq.w loc_0b624e
	lea.l loc_0b66ec(pc),a3
	bra.w loc_0b625a

loc_0b624e:
	lea.l loc_0b6714(pc),a3
	bra.w loc_0b625a

loc_0b6256:
	lea.l loc_0b673c(pc),a3

loc_0b625a:
	lea.l ($16e,a6),a4
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	lea.l ($146,a6),a4
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	move.l (a3)+,(a4)+
	movea.w (right_hud_pointer,a5),a4
	moveq #0,d0
	lea.l loc_0b6884(pc),a1
	move.b ($123,a4),d0
	bmi.w loc_0b628e
	addq.l #1,d0
	lsl.l #4,d0
	adda.l d0,a1

loc_0b628e:
	tst.b (Dip_SFAlpha,a5)
	beq.b loc_0b629a
	adda.l #$50,a1

loc_0b629a:
	lea.l ($66,a6),a4
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	move.l (a1)+,(a4)+
	lea.l ($16e,a6),a4
	move.l #$200000,(a4)+
	move.l #$d000d8,(a4)+
	lea.l ($de,a6),a4
	bsr.w loc_0b5dbc
	move.w #$3c,d1
	bsr.w loc_0b5e2c
	bsr.w loc_0b5df4
	moveq #0,d1
	move.w ($2a,a6),d1
	bra.w loc_0b5e52

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b62d4:
	tst.b ($2c,a6)
	bmi.b loc_0b62f0
	beq.b loc_0b62e6
	movea.l #loc_35f7b4,a1
	moveq #1,d7
	bra.b loc_0b62f8

loc_0b62e6:
	movea.l #loc_35f854,a1
	moveq #1,d7
	bra.b loc_0b62f8

loc_0b62f0:
	movea.l #loc_35f714,a1
	moveq #1,d7

loc_0b62f8:
	move.l (a0),d4
	andi.l #$f000f000,d4

loc_0b6300:
	movem.l (a1)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a0)
	lea.l ($10,a0),a0
	dbra d7,loc_0b6300
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b631a:
	lsl.w #4,d0
	lea.l loc_0b64ba(pc),a1
	lea.l (a1,d0.w),a1
	moveq #5,d7

loc_0b6326:
	move.w (a1)+,d0
	beq.w loc_0b632e
	move.w d0,(a0)

loc_0b632e:
	move.w (a0)+,d0
	dbra d7,loc_0b6326
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b6336:
	move.w #$f000,d4
	move.w (a1)+,d0
	or.w d4,d0
	move.w d0,(a0)+
	dbra d7,loc_0b6336
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b6346:
	moveq #0,d0
	move.b ($45,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (a1,d0.w),a1
	bra.w loc_0b63a8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b6358:
	moveq #0,d0
	move.b ($49,a6),d0
	add.w d0,d0
	add.w d0,d0
	lea.l loc_0b63da(pc),a1
	movea.l (a1,d0.w),a1
	moveq #$f,d7
	bra.w loc_0b63a8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b6370:
	moveq #0,d0
	move.b ($3b,a6),d0
	add.w d0,d0
	add.w d0,d0

loc_0b637a:
	tst.b ($2c,a6)
	bmi.b loc_0b639e
	beq.b loc_0b6390
	lea.l loc_0b63ba(pc),a1
	movea.l (a1,d0.w),a1
	moveq #$f,d7
	bra.w loc_0b63a8

loc_0b6390:
	lea.l loc_0b641a(pc),a1
	movea.l (a1,d0.w),a1
	moveq #$f,d7
	bra.w loc_0b63a8

loc_0b639e:
	lea.l loc_0b63fa(pc),a1
	movea.l (a1,d0.w),a1
	moveq #$f,d7

loc_0b63a8:
	move.w (a0),d4
	andi.w #$f000,d4
	move.w (a1)+,d0
	or.w d4,d0
	move.w d0,(a0)+
	dbra d7,loc_0b63a8
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b63ba:
	dc.l loc_35f7f4,loc_35f814,loc_35f7b4,loc_35f7d4
	dc.l loc_35f7f4,loc_35f814,loc_35f7b4,loc_35f7d4

loc_0b63da:
	dc.l loc_35f7f4,loc_35f814,loc_35f834,loc_35f814
	dc.l loc_35f7f4,loc_35f7d4,loc_35f7b4,loc_35f7d4

loc_0b63fa:
	dc.l loc_35f714,loc_35f734,loc_35f754,loc_35f774
	dc.l loc_35f794,loc_35f774,loc_35f754,loc_35f734

loc_0b641a:
	dc.l loc_35f854,loc_35f874,loc_35f854,loc_35f874
	dc.l loc_35f854,loc_35f874,loc_35f854,loc_35f874

loc_0b643a:
	dc.l loc_35f894,loc_35f934,loc_35f894,loc_35f934
	dc.l loc_35f894,loc_35f934,loc_35f894,loc_35f934

loc_0b645a:
	dc.l loc_35f8b4,loc_35f954,loc_35f8b4,loc_35f954
	dc.l loc_35f8b4,loc_35f954,loc_35f8b4,loc_35f954

loc_0b647a:
	dc.w $0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff
	dc.w $0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff,$0fff

loc_0b649a:
	dc.l loc_0b647a,loc_0b647a,loc_35f714,loc_35f714

loc_0b64aa:
	dc.l loc_0b647a,loc_0b647a,loc_35f7b4,loc_35f7b4

loc_0b64ba:
	dc.w $0000,$0000,$0000,$0000,$ffff,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff,$0000
	dc.w $ffff,$0000,$0000,$0000,$ffff,$0000
	dc.w $ffff,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff,$0000
	dc.w $ffff,$0000,$ffff,$0000,$0000,$0000

loc_0b654a:
	dc.w $2690,$2690,$2690,$26b0
	dc.w $26b0,$26b0,$26c0,$26c0
	dc.w $26c0,$2690,$2690,$2690
	dc.w $26a0,$26a0,$26a0,$26d0
	dc.w $26d0,$26d0,$2680,$2680
	dc.w $2680,$26b0,$26b0,$26b0
	dc.w $26d0,$26d0,$26d0,$2680
	dc.w $2680,$2680,$26a0,$26a0
	dc.w $26a0,$26c0,$26c0,$26c0
	dc.w $2690,$2690,$2690,$26a0
	dc.w $26a0,$26a0,$26c0,$26c0
	dc.w $26c0,$2680,$2680,$2680
	dc.w $26a0,$26a0,$26a0,$26d0
	dc.w $26d0,$26d0,$2680,$2680
	dc.w $2680,$26a0,$26a0,$26a0
	dc.w $26c0,$26c0,$26c0,$2680
	dc.w $2680,$2680,$26a0,$26a0
	dc.w $26a0,$26c0,$26c0,$26c0
	dc.w $2680,$2680,$2680,$26a0
	dc.w $26a0,$26a0,$26c0,$26c0
	dc.w $26c0,$2680,$2680,$2680
	dc.w $26a0,$26a0,$26a0,$26c0
	dc.w $26c0,$26c0,$2680,$2680
	dc.w $2680,$26a0,$26a0,$26a0
	dc.w $26c0,$26c0,$26c0,$2680
	dc.w $2680,$2680,$26a0,$26a0
	dc.w $26a0,$26c0,$26c0,$26c0
	dc.w $2680,$2680,$2680,$26a0
	dc.w $26a0,$26a0,$26c0,$26c0
	dc.w $26c0

loc_0b6634:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0001,$0001,$0001,$0001
	dc.w $0001,$0001,$0001,$0001
	dc.w $0002,$0002,$0002,$0002
	dc.w $0002,$0002,$0002,$0002
	dc.w $0001,$0001,$0001,$0001
	dc.w $0001,$0001,$0001,$0001

loc_0b6674:
	dc.w $0020,$001b,$0000,$0000
	dc.w $0020,$001b,$fffe,$00e0
	dc.w $0020,$001b,$0008,$00e0
	dc.w $0020,$001b,$0017,$00e0
	dc.w $0020,$001b,$fffe,$00d0

loc_0b669c:
	dc.w $0020,$001b,$0010,$00e0
	dc.w $0020,$001b,$0000,$00e0
	dc.w $0020,$0015,$0050,$00e0
	dc.w $0020,$0015,$0050,$00e5
	dc.w $0020,$001b,$0000,$0000

loc_0b66c4:
	dc.w $0020,$001b,$0000,$0000
	dc.w $0020,$001b,$0000,$00e0
	dc.w $0020,$001b,$0041,$00df
	dc.w $0020,$001b,$0000,$0000
	dc.w $0020,$001b,$0000,$0000

loc_0b66ec:
	dc.w $0020,$001c,$0000,$0000
	dc.w $0020,$001c,$015e,$00e0
	dc.w $0020,$001c,$0168,$00e0
	dc.w $0020,$001c,$0178,$00e0
	dc.w $0020,$001c,$015f,$00d0

loc_0b6714:
	dc.w $0020,$001c,$0170,$00e0
	dc.w $0020,$001c,$0160,$00e0
	dc.w $0020,$0015,$0100,$00e0
	dc.w $0020,$0015,$0100,$00e0
	dc.w $0020,$001c,$0000,$0000

loc_0b673c:
	dc.w $0020,$001c,$0000,$0000
	dc.w $0020,$001c,$0163,$00e0
	dc.w $0020,$001c,$00f1,$00df
	dc.w $0020,$001c,$0000,$0000
	dc.w $0020,$001c,$0000,$0000

loc_0b6764:
	dc.w $0020,$0016,$0020,$0016
	dc.w $2676,$0017,$2673,$0016
	dc.w $2672,$0016,$2677,$0017
	dc.w $2676,$0017,$2677,$0017

loc_0b6784:
	dc.w $2671,$003b,$0010,$00e0
	dc.w $2671,$001b,$00b0,$00e0
	dc.w $2691,$003b,$0010,$00e0
	dc.w $26d1,$003b,$00b0,$00e0
	dc.w $2751,$001b,$0010,$00e0
	dc.w $26f1,$003b,$00b0,$00e0

loc_0b67b4:
	dc.w $2671,$003c,$00c0,$00e0
	dc.w $2671,$001c,$0160,$00e0
	dc.w $26d1,$001c,$00c0,$00e0
	dc.w $2691,$001c,$0160,$00e0
	dc.w $26f1,$001c,$00c0,$00e0
	dc.w $2751,$003c,$0160,$00e0

loc_0b67e4:
	dc.w $2985,$041b,$ffff,$00cf
	dc.w $2995,$041b,$0000,$00e0
	dc.w $2980,$041b,$0000,$00cf
	dc.w $2990,$041b,$0000,$00e0
	dc.w $298a,$041b,$0000,$00cf
	dc.w $299a,$041b,$0000,$00e0
	dc.w $0020,$001b,$0000,$00cf
	dc.w $29d0,$041b,$0000,$00e0
	dc.w $0020,$001b,$0000,$00cf
	dc.w $29da,$041b,$0000,$00e0
	dc.w $2985,$041b,$ffff,$00cf
	dc.w $2995,$041b,$0000,$00e0
	dc.w $29aa,$031b,$0000,$00cf
	dc.w $29ba,$041b,$0000,$00e0
	dc.w $298a,$041b,$0000,$00cf
	dc.w $299a,$041b,$0000,$00e0
	dc.w $0020,$001b,$0000,$00cf
	dc.w $29d0,$041b,$0000,$00e0
	dc.w $0020,$001b,$0000,$00cf
	dc.w $29da,$041b,$0000,$00e0

loc_0b6884:
	dc.w $296b,$041c,$0130,$00cf
	dc.w $297b,$041c,$0130,$00e0
	dc.w $2966,$041c,$0130,$00cf
	dc.w $2976,$041c,$0130,$00e0
	dc.w $29a0,$041c,$0130,$00cf
	dc.w $29b0,$041c,$0130,$00e0
	dc.w $0020,$001c,$0130,$00cf
	dc.w $29b5,$041c,$0130,$00e0
	dc.w $0020,$001c,$0130,$00cf
	dc.w $29d5,$041c,$0130,$00e0
	dc.w $296b,$041c,$0130,$00cf
	dc.w $297b,$041c,$0130,$00e0
	dc.w $2961,$041c,$0130,$00cf
	dc.w $2971,$041c,$0130,$00e0
	dc.w $29a0,$041c,$0130,$00cf
	dc.w $29b0,$041c,$0130,$00e0
	dc.w $0020,$001c,$0130,$00cf
	dc.w $29b5,$041c,$0130,$00e0
	dc.w $0020,$001c,$0130,$00cf
	dc.w $29d5,$041c,$0130,$00e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b6924:
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $01,$01,$01,$01
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $03,$04

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b69b6:
	dc.b $00,$04,$04,$04
	dc.b $04,$08,$08,$08
	dc.b $08,$0c,$0c,$0c
	dc.b $0c,$10,$10,$10
	dc.b $10,$14,$14,$14
	dc.b $14,$18,$18,$18
	dc.b $18,$1c,$1c,$1c
	dc.b $1c,$20,$20,$20
	dc.b $20,$24,$24,$24
	dc.b $24,$28,$28,$28
	dc.b $28,$2c,$2c,$2c
	dc.b $2c,$30,$30,$30
	dc.b $30,$34,$34,$34
	dc.b $34,$38,$38,$38
	dc.b $38,$3c,$3c,$3c
	dc.b $3c,$40,$40,$40
	dc.b $40,$44,$44,$44
	dc.b $44,$48,$48,$48
	dc.b $48,$4c,$4c,$4c
	dc.b $4c,$50,$50,$50
	dc.b $50,$54,$54,$54
	dc.b $54,$58,$58,$58
	dc.b $58,$5c,$5c,$5c
	dc.b $5c,$60,$60,$60
	dc.b $60,$64,$64,$64
	dc.b $64,$68,$68,$68
	dc.b $68,$6c,$6c,$6c
	dc.b $6c,$70,$70,$70
	dc.b $70,$74,$74,$74
	dc.b $74,$78,$78,$78
	dc.b $78,$7c,$7c,$7c
	dc.b $7c,$80,$80,$80
	dc.b $80,$84,$84,$84
	dc.b $84,$88,$88,$88
	dc.b $88,$8c,$8c,$8c
	dc.b $8c,$90,$90,$90
	dc.b $90,$91

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b6a48:
	dc.w $00a8,$00a7,$00a6,$00a5
	dc.w $00a4,$00a3,$00a2,$00a1
	dc.w $00a0,$009f,$009e,$009d
	dc.w $009c,$009b,$009a,$0099
	dc.w $0098,$0097,$0096,$0095
	dc.w $0094,$0093,$0092,$0091
	dc.w $0090,$008f,$008e,$008d
	dc.w $008c,$008b,$008a,$0089
	dc.w $0088,$0087,$0086,$0085
	dc.w $0084,$0083,$0082,$0081
	dc.w $0080,$007f,$007e,$007d
	dc.w $007c,$007b,$007a,$0079
	dc.w $0078,$0077,$0076,$0075
	dc.w $0074,$0073,$0072,$0071
	dc.w $0070,$006f,$006e,$006d
	dc.w $006c,$006b,$006a,$0069
	dc.w $0068,$0067,$0066,$0065
	dc.w $0064,$0063,$0062,$0061
	dc.w $0060,$005f,$005e,$005d
	dc.w $005c,$005b,$005a,$0059
	dc.w $0058,$0057,$0056,$0055
	dc.w $0054,$0053,$0052,$0051
	dc.w $0050,$004f,$004e,$004d
	dc.w $004c,$004b,$004a,$0049
	dc.w $0048,$0047,$0046,$0045
	dc.w $0044,$0043,$0042,$0041
	dc.w $0040,$003f,$003e,$003d
	dc.w $003c,$003b,$003a,$0039
	dc.w $0038,$0037,$0036,$0035
	dc.w $0034,$0033,$0032,$0031
	dc.w $0030,$002f,$002e,$002d
	dc.w $002c,$002b,$002a,$0029
	dc.w $0028,$0027,$0026,$0025
	dc.w $0024,$0023,$0022,$0021
	dc.w $0020,$001f,$001e,$001d
	dc.w $001c,$001b,$001a,$0019
	dc.w $0018

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b6b6a:
	dc.w $00c8,$00c9,$00ca,$00cb
	dc.w $00cc,$00cd,$00ce,$00cf
	dc.w $00d0,$00d1,$00d2,$00d3
	dc.w $00d4,$00d5,$00d6,$00d7
	dc.w $00d8,$00d9,$00da,$00db
	dc.w $00dc,$00dd,$00de,$00df
	dc.w $00e0,$00e1,$00e2,$00e3
	dc.w $00e4,$00e5,$00e6,$00e7
	dc.w $00e8,$00e9,$00ea,$00eb
	dc.w $00ec,$00ed,$00ee,$00ef
	dc.w $00f0,$00f1,$00f2,$00f3
	dc.w $00f4,$00f5,$00f6,$00f7
	dc.w $00f8,$00f9,$00fa,$00fb
	dc.w $00fc,$00fd,$00fe,$00ff
	dc.w $0100,$0101,$0102,$0103
	dc.w $0104,$0105,$0106,$0107
	dc.w $0108,$0109,$010a,$010b
	dc.w $010c,$010d,$010e,$010f
	dc.w $0110,$0111,$0112,$0113
	dc.w $0114,$0115,$0116,$0117
	dc.w $0118,$0119,$011a,$011b
	dc.w $011c,$011d,$011e,$011f
	dc.w $0120,$0121,$0122,$0123
	dc.w $0124,$0125,$0126,$0127
	dc.w $0128,$0129,$012a,$012b
	dc.w $012c,$012d,$012e,$012f
	dc.w $0130,$0131,$0132,$0133
	dc.w $0134,$0135,$0136,$0137
	dc.w $0138,$0139,$013a,$013b
	dc.w $013c,$013d,$013e,$013f
	dc.w $1140,$0141,$0142,$0143
	dc.w $0144,$0145,$0146,$0147
	dc.w $0148,$0149,$014a,$014b
	dc.w $014c,$014d,$014e,$014f
	dc.w $0150,$0151,$0152,$0153
	dc.w $0154,$0155,$0156,$0157
	dc.w $0158

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;sometimes it's just better to use a file
loc_0b6c8c:
	incbin "bins/b6c8cdata.bin"

loc_0b8b22:
	incbin "bins/b8b22data.bin"

;##############################################
loc_0b8e88:
	move.b (4,a6),d0
	move.w loc_0b8e94(pc,d0.w),d1
	jmp loc_0b8e94(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b8e94:
	dc.w loc_0b8e9c-loc_0b8e94
	dc.w loc_0b8f64-loc_0b8e94
	dc.w loc_0b92d8-loc_0b8e94
	dc.w loc_0b92ee-loc_0b8e94


;==============================================
loc_0b8e9c:
	move.b (5,a6),d0
	move.w loc_0b8eae(pc,d0.w),d1
	jsr loc_0b8eae(pc,d1.w)
	moveq #0,d0
	bra.w loc_0b8f64

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b8eae:
	dc.w loc_0b8eb4-loc_0b8eae
	dc.w loc_0b8f3c-loc_0b8eae
	dc.w loc_0b8f50-loc_0b8eae

;----------------------------------------------
loc_0b8eb4:
	move.b #1,(1,a6)
	addq.b #2,(5,a6)
	move.w #$130,($14,a6)
	tst.w ($102,a5)
	beq.b loc_0b8ed8
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.w #$100,($14,a6)

loc_0b8ed8:
	moveq #0,d0
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.w d0,($10,a6)
	move.w d0,($3a,a6)
	move.w d0,($c,a6)
	move.b #2,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	lea.l ($40,a6),a0
	move.l a0,($1c,a6)
	move.w #$4,($40,a6)
	move.w #$3e,($42,a6)
	move.w #$2f,($44,a6)
	move.b (Active_Player_01,a5),($31,a6)
	lea.l (p1memory,a5),a1
	move.w a1,($34,a6)
	bsr.w loc_0b93d8
	bsr.w loc_0b9442
	bsr.w loc_0b958c
	bsr.w loc_0b9632
	bra.w loc_0b933e

loc_0b8f3c:
	cmpi.w #4,($c,a5)
	bne.b loc_0b8f4e
	addq.b #2,(5,a6)
	move.b #1,(1,a6)

loc_0b8f4e:
	rts

loc_0b8f50:
	subq.w #2,($14,a6)
	cmpi.w #$100,($14,a6)
	bne.w loc_0b8f62
	addq.b #2,(4,a6)

loc_0b8f62:
	rts

;==============================================
loc_0b8f64:
	move.b #1,(1,a6)
	movea.w (left_hud_pointer,a5),a4
	move.w ($50,a4),($28,a6)
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b8f80(pc,d0.w),d1
	jmp loc_0b8f80(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b8f80:
	dc.w loc_0b8fe4-loc_0b8f80
	dc.w loc_0b8fe4-loc_0b8f80
	dc.w loc_0b8f88-loc_0b8f80
	dc.w loc_0b8fa2-loc_0b8f80

;----------------------------------------------
loc_0b8f88:
	lea.l (p3memory,a5),a1
	lea.l (p4memory,a5),a2
	bsr.w loc_0b92fa
	move.w ($50,a3),($28,a6)
	clr.w ($2a,a6)
	bra.w loc_0b8fe4

;----------------------------------------------
loc_0b8fa2:
	move.b ($31,a6),d0
	btst #0,d0
	beq.b loc_0b8fda
	bsr.w loc_0b9646
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	bsr.w loc_0b92fa
	move.w ($50,a3),($28,a6)
	clr.w ($2a,a6)
	lea.l loc_0b996c(pc),a0
	lea.l ($46,a6),a1
	bsr.w loc_0b972c
	bsr.w loc_0b9506
	bra.w loc_0b8fe4

;----------------------------------------------
loc_0b8fda:
	lea.l (p3memory,a5),a3
	move.w ($50,a3),($28,a6)

loc_0b8fe4:
	lea.l ($96,a6),a4
	move.w #$1b,d1
	move.w #$20,d2
	btst #1,($b4,a5)
	beq.b loc_0b9000
	move.w #$5b,d1
	move.w #$1a,d2

loc_0b9000:
	bsr.w loc_0b9258
	bsr.w loc_0b9232
	move.w ($2a,a6),d1
	cmp.w ($28,a6),d1
	bne.w loc_0b901e
	move.w ($28,a6),($2a,a6)
	bra.w loc_0b9078

loc_0b901e:
	move.w ($2a,a6),d1
	move.w ($28,a6),d2
	bsr.w loc_0b92b8
	move.w d1,($2a,a6)
	move.w d1,d2
	cmp.w ($28,a6),d2
	bhi.w loc_0b904a
	movea.w (left_hud_pointer,a5),a4
	tst.b ($52,a4)
	bmi.w loc_0b904a
	move.w ($52,a4),($2a,a6)

loc_0b904a:
	lea.l ($96,a6),a4
	lea.l loc_0ba7de(pc),a0
	bsr.w loc_0b9282
	movea.w (left_hud_pointer,a5),a4
	move.w ($28,a6),d1
	cmp.w ($52,a4),d1
	beq.w loc_0b906c
	move.w ($28,a6),($52,a4)

loc_0b906c:
	lea.l ($de,a6),a4
	move.w ($28,a6),d1
	bsr.w loc_0b927e

loc_0b9078:
	movea.w (right_hud_pointer,a5),a4
	move.w ($50,a4),($2c,a6)
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b908e(pc,d0.w),d1
	jmp loc_0b908e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b908e:
	dc.w loc_0b90f2-loc_0b908e
	dc.w loc_0b9096-loc_0b908e
	dc.w loc_0b90f2-loc_0b908e
	dc.w loc_0b90b0-loc_0b908e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b9096:
	lea.l (p3memory,a5),a1
	lea.l (p4memory,a5),a2
	bsr.w loc_0b92fa
	move.w ($50,a3),($2c,a6)
	clr.w ($2e,a6)
	bra.w loc_0b90f2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b90b0:
	move.b ($31,a6),d0
	btst #0,d0
	bne.b loc_0b90e8
	bsr.w loc_0b9646
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	bsr.w loc_0b92fa
	move.w ($50,a3),($2c,a6)
	clr.w ($2e,a6)
	lea.l loc_0b9a7c(pc),a0
	lea.l ($4e,a6),a1
	bsr.w loc_0b972c
	bsr.w loc_0b953e
	bra.w loc_0b90f2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b90e8:
	lea.l (p3memory,a5),a3
	move.w ($50,a3),($28,a6)

loc_0b90f2:
	lea.l ($126,a6),a4
	move.w #$3c,d1
	move.w #$20,d2
	btst #1,($b4,a5)
	beq.b loc_0b910e
	move.w #$7c,d1
	move.w #$1a,d2

loc_0b910e:
	bsr.w loc_0b9258
	bsr.w loc_0b9232
	move.w ($2e,a6),d1
	cmp.w ($2c,a6),d1
	bne.w loc_0b912c
	move.w ($2c,a6),($2e,a6)
	bra.w loc_0b9186

loc_0b912c:
	move.w ($2e,a6),d1
	move.w ($2c,a6),d2
	bsr.w loc_0b92b8
	move.w d1,($2e,a6)
	move.w d1,d2
	cmp.w ($2c,a6),d2
	bhi.w loc_0b9158
	movea.w (right_hud_pointer,a5),a4
	tst.b ($52,a4)
	bmi.w loc_0b9158
	move.w ($52,a4),($2e,a6)

loc_0b9158:
	lea.l ($126,a6),a4
	lea.l loc_0ba7de(pc),a0
	bsr.w loc_0b9282
	movea.w (right_hud_pointer,a5),a4
	move.w ($2c,a6),d1
	cmp.w ($52,a4),d1
	beq.w loc_0b917a
	move.w ($2c,a6),($52,a4)

loc_0b917a:
	lea.l ($16e,a6),a4
	move.w ($2c,a6),d1
	bsr.w loc_0b927e

loc_0b9186:
	bra.w loc_0b9400

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b918a:
	move.w #$20,(4,a4)
	move.w #$30,($c,a4)
	move.w #$40,($14,a4)
	move.w #$50,($1c,a4)
	move.w #$60,($24,a4)
	move.w #$70,($2c,a4)
	move.w #$80,($34,a4)
	move.w #$90,($3c,a4)
	move.w #$a0,($44,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b91c2:
	move.w #$150,(4,a4)
	move.w #$140,($c,a4)
	move.w #$130,($14,a4)
	move.w #$120,($1c,a4)
	move.w #$110,($24,a4)
	move.w #$100,($2c,a4)
	move.w #$f0,($34,a4)
	move.w #$e0,($3c,a4)
	move.w #$d0,($44,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b91fa:
	move.w #$20,(6,a4)
	move.w #$20,($e,a4)
	move.w #$20,($16,a4)
	move.w #$20,($1e,a4)
	move.w #$20,($26,a4)
	move.w #$20,($2e,a4)
	move.w #$20,($36,a4)
	move.w #$20,($3e,a4)
	move.w #$20,($46,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9232:
	move.w d2,(6,a4)
	move.w d2,($e,a4)
	move.w d2,($16,a4)
	move.w d2,($1e,a4)
	move.w d2,($26,a4)
	move.w d2,($2e,a4)
	move.w d2,($36,a4)
	move.w d2,($3e,a4)
	move.w d2,($46,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9258:
	move.w d1,(2,a4)
	move.w d1,($a,a4)
	move.w d1,($12,a4)
	move.w d1,($1a,a4)
	move.w d1,($22,a4)
	move.w d1,($2a,a4)
	move.w d1,($32,a4)
	move.w d1,($3a,a4)
	move.w d1,($42,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b927e:
	lea.l loc_0b9dac(pc),a0

loc_0b9282:
	tst.w d1
	bpl.b loc_0b9288
	moveq #0,d1

loc_0b9288:
	add.w d1,d1
	move.w d1,d2
	lsl.w #3,d1
	add.w d2,d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,(a4)
	move.w (a0)+,(8,a4)
	move.w (a0)+,($10,a4)
	move.w (a0)+,($18,a4)
	move.w (a0)+,($20,a4)
	move.w (a0)+,($28,a4)
	move.w (a0)+,($30,a4)
	move.w (a0)+,($38,a4)
	move.w (a0)+,($40,a4)
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b92b8:
	tst.w d1
	bpl.w loc_0b92c2
	moveq #0,d1
	rts

loc_0b92c2:
	cmp.w d2,d1
	ble.w loc_0b92d6
	moveq #0,d3
	move.b ($b4,a5),d3
	andi.b #3,d3
	bne.b loc_0b92d6
	subq.w #1,d1

loc_0b92d6:
	rts

;==============================================
loc_0b92d8:
	move.b #2,(4,a6)
	bsr.w loc_0b93d8
	bsr.w loc_0b9442
	bsr.w loc_0b958c
	bra.w loc_0b933e

;==============================================
loc_0b92ee:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b92f4:
	clr.b (1,a6)
	rts

;----------------------------------------------
loc_0b92fa:
	tst.w ($50,a2)
	bmi.b loc_0b932e
	tst.w ($50,a1)
	bmi.b loc_0b9336
	movea.w ($34,a6),a3
	moveq #0,d0
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.w loc_0b932c
	movea.w a1,a3
	move.w a1,($34,a6)
	btst #6,($80,a5)
	beq.b loc_0b932c
	movea.w a2,a3
	move.w a2,($34,a6)

loc_0b932c:
	rts

loc_0b932e:
	movea.w a1,a3
	move.w a1,($34,a6)
	rts

loc_0b9336:
	movea.w a2,a3
	move.w a2,($34,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b933e:
	lea.l loc_0b97cc(pc),a0
	lea.l ($76,a6),a4
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	move.l (a0)+,(a4)+
	movea.w (left_hud_pointer,a5),a4
	move.w ($50,a4),($28,a6)
	move.w ($50,a4),d0
	cmpi.w #$90,d0
	beq.w loc_0b936e
	addq.w #1,d0

loc_0b936e:
	move.w d0,($2a,a6)
	lea.l ($96,a6),a4
	bsr.w loc_0b918a
	lea.l ($de,a6),a4
	bsr.w loc_0b918a
	move.w #$1d,d1
	bsr.w loc_0b9258
	bsr.w loc_0b91fa
	move.w ($28,a6),d1
	bsr.w loc_0b927e
	movea.w (right_hud_pointer,a5),a4
	move.w ($50,a4),($2c,a6)
	move.w ($50,a4),d0
	cmpi.w #$90,d0
	beq.w loc_0b93ae
	addq.w #1,d0

loc_0b93ae:
	move.w d0,($2e,a6)
	lea.l ($126,a6),a4
	bsr.w loc_0b91c2
	lea.l ($16e,a6),a4
	bsr.w loc_0b91c2
	move.w #$3d,d1
	bsr.w loc_0b9258
	bsr.w loc_0b91fa
	move.w ($28,a6),d1
	bsr.w loc_0b927e
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b93d8:
	lea.l ($66,a6),a0
	move.w #$1d,(2,a0)
	move.w #$b2,(4,a0)
	move.w #$1c,(6,a0)
	move.w #$1d,($a,a0)
	move.w #$bd,($c,a0)
	move.w #$1c,($e,a0)

loc_0b9400:
	move.w #$2615,d7
	moveq #0,d0
	move.b (clock_counter,a5),d0
	cmpi.b #$15,d0
	bcc.b loc_0b941c
	btst #2,($b4,a5)
	beq.b loc_0b941c
	move.w #$2615,d7

loc_0b941c:
	jsr Hex_to_Decimal
	lea.l ($66,a6),a0
	move.w (-$5d28,a5),d0
	move.w d0,d1
	lsr.w #4,d0
	andi.w #$f,d0
	add.w d7,d0
	move.w d0,(a0)
	andi.w #$f,d1
	add.w d7,d1
	move.w d1,(8,a0)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9442:
	lea.l ($56,a6),a1
	lea.l loc_0b97ec(pc),a0
	tst.w (Region,a5)
	beq.b loc_0b9454
	lea.l ($40,a0),a0

loc_0b9454:
	move.w #$316,d1
	moveq #$23,d3
	movea.w (left_hud_pointer,a5),a4
	move.w #$316,d1
	tst.b ($eb,a4)
	beq.b loc_0b946c
	move.w #$317,d1

loc_0b946c:
	moveq #0,d2
	move.b ($102,a4),d2
	cmpi.w #4,(Dramatic_Mode_Type,a5)
	bne.b loc_0b9488
	move.w #$280c,d0
	move.w #3,d2
	bsr.b loc_0b9500
	bra.w loc_0b94a0

loc_0b9488:
	add.w d2,d2
	lea.l loc_0b986c(pc),a2
	tst.w (Region,a5)
	beq.b loc_0b9498
	lea.l ($40,a2),a2

loc_0b9498:
	lea.l (a2,d2.w),a2
	move.w (a2),d2
	bsr.b loc_0b94f4

loc_0b94a0:
	lea.l loc_0b97ec(pc),a0
	tst.w (Region,a5)
	beq.b loc_0b94ae
	lea.l ($40,a0),a0

loc_0b94ae:
	lea.l (8,a1),a1
	movea.w (right_hud_pointer,a5),a4
	move.w #$316,d1
	tst.b ($eb,a4)
	beq.b loc_0b94c4
	move.w #$317,d1

loc_0b94c4:
	moveq #0,d2
	move.b ($102,a4),d2
	cmpi.w #2,(Dramatic_Mode_Type,a5)
	bne.b loc_0b94de
	move.w #$280c,d0
	move.w #$13f,d2
	bra.w loc_0b9500

loc_0b94de:
	add.w d2,d2
	lea.l loc_0b98ec(pc),a2
	tst.w (Region,a5)
	beq.b loc_0b94ee
	lea.l ($40,a2),a2

loc_0b94ee:
	lea.l (a2,d2.w),a2
	move.w (a2),d2

loc_0b94f4:
	moveq #0,d0
	move.b ($102,a4),d0
	add.w d0,d0
	move.w (a0,d0.w),d0

loc_0b9500:
	movem.w d0-d3,(a1)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9506:
	lea.l ($56,a6),a1
	lea.l loc_0b97ec(pc),a0
	tst.w (Region,a5)
	beq.b loc_0b9518
	lea.l ($40,a0),a0

loc_0b9518:
	move.w #$316,d1
	moveq #$23,d3
	moveq #0,d2
	move.b ($102,a3),d2
	add.w d2,d2
	lea.l loc_0b986c(pc),a2
	tst.w (Region,a5)
	beq.b loc_0b9534
	lea.l ($40,a0),a2

loc_0b9534:
	lea.l (a2,d2.w),a2
	move.w (a2),d2
	bra.w loc_0b957a

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b953e:
	lea.l ($56,a6),a1
	lea.l loc_0b97ec(pc),a0
	tst.w (Region,a5)
	beq.b loc_0b9550
	lea.l ($40,a0),a0

loc_0b9550:
	move.w #$316,d1
	moveq #$23,d3
	lea.l (8,a1),a1
	moveq #0,d2
	move.b ($102,a3),d2
	add.w d2,d2
	lea.l loc_0b98ec(pc),a2
	tst.w (Region,a5)
	beq.b loc_0b9570
	lea.l ($40,a2),a2

loc_0b9570:
	lea.l (a2,d2.w),a2
	move.w (a2),d2
	bra.w loc_0b957a

loc_0b957a:
	moveq #0,d0
	move.b ($102,a3),d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	movem.w d0-d3,(a1)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b958c:
	lea.l ($46,a6),a1
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b959c(pc,d0.w),d1
	jmp loc_0b959c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b959c:
	dc.w loc_0b95d0-loc_0b959c
	dc.w loc_0b95a4-loc_0b959c
	dc.w loc_0b95ba-loc_0b959c
	dc.w loc_0b95d0-loc_0b959c

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0b95a4:
	lea.l loc_0b996c(pc),a0
	movea.w (left_hud_pointer,a5),a4
	bsr.b loc_0b95e2
	lea.l loc_0b9a7c(pc),a0
	movea.w (right_hud_pointer,a5),a4
	moveq #$21,d0
	bra.b loc_0b95fa

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0b95ba:
	lea.l loc_0b996c(pc),a0
	movea.w (left_hud_pointer,a5),a4
	moveq #$21,d0
	bsr.b loc_0b95fa
	lea.l loc_0b9a7c(pc),a0
	movea.w (right_hud_pointer,a5),a4
	bra.b loc_0b95e2

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_0b95d0:
	lea.l loc_0b996c(pc),a0
	movea.w (left_hud_pointer,a5),a4
	bsr.b loc_0b95e2
	lea.l loc_0b9a7c(pc),a0
	movea.w (right_hud_pointer,a5),a4

loc_0b95e2:
	moveq #0,d0
	move.b (PL_charid,a4),d0
	cmpi.b #4,d0
	bne.w loc_0b95fa
	tst.b (PL_ism_choice,a4)
	bpl.b loc_0b95fa
	move.b #$20,d0

loc_0b95fa:
	lsl.w #3,d0
	lea.l (a0,d0.w),a0
	move.w (Dramatic_Mode_Type,a5),d0
	add.w d0,d0
	add.b ($101,a4),d0
	move.b loc_0b9622(pc,d0.w),($d,a4)
	move.b ($d,a4),d1
	andi.w #$1f,d1
	move.l (a0)+,d0
	or.w d1,d0
	move.l d0,(a1)+
	move.l (a0)+,(a1)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9622:
	dc.b $00,$05,$00,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$05,$0a,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9632:
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0b963e(pc,d0.w),d1
	jmp loc_0b963e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b963e:
	dc.w loc_0b9646-loc_0b963e
	dc.w loc_0b9646-loc_0b963e
	dc.w loc_0b9646-loc_0b963e
	dc.w loc_0b9668-loc_0b963e

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9646:
	lea.l ($1be,a6),a1
	move.l #$20,(a1)+
	move.l #0,(a1)+
	lea.l ($1b6,a6),a1
	move.l #$20,(a1)+
	move.l #0,(a1)+
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0b9668:
	move.b (Active_Player_01,a5),d0
	subq.b #2,d0
	btst #0,d0
	beq.b loc_0b9694
	lea.l ($1be,a6),a1
	lea.l loc_0b986c(pc),a2
	lea.l loc_0b97ec(pc),a0
	lea.l (p2memory,a5),a4
	bsr.w loc_0b9704
	lea.l ($1b6,a6),a1
	lea.l loc_0b9b8c(pc),a0
	bra.w loc_0b96b4

loc_0b9694:
	lea.l ($1be,a6),a1
	lea.l loc_0b98ec(pc),a2
	lea.l loc_0b97ec(pc),a0
	lea.l (p1memory,a5),a4
	bsr.w loc_0b9704
	lea.l ($1b6,a6),a1
	lea.l loc_0b9c9c(pc),a0
	bra.w loc_0b96b4

loc_0b96b4:
	moveq #0,d0
	move.b (PL_charid,a4),d0
	cmpi.b #4,d0
	bne.w loc_0b96cc
	tst.b (PL_ism_choice,a4)
	bpl.b loc_0b96cc
	move.b #$20,d0

loc_0b96cc:
	lsl.w #3,d0
	lea.l (a0,d0.w),a0
	move.w (Dramatic_Mode_Type,a5),d0
	add.w d0,d0
	add.b ($101,a4),d0
	move.b loc_0b96f4(pc,d0.w),($d,a4)
	move.b ($d,a4),d1
	andi.w #$1f,d1
	move.l (a0)+,d0
	or.w d1,d0
	move.l d0,(a1)+
	move.l (a0)+,(a1)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b96f4:
	dc.b $00,$05,$00,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$05,$0a,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b9704:
	tst.w (Region,a5)
	beq.w loc_0b9714
	lea.l ($40,a0),a0
	lea.l ($40,a0),a2

loc_0b9714:
	move.w #$316,d1
	moveq #$2b,d3
	moveq #0,d2
	move.b ($102,a4),d2
	add.w d2,d2
	lea.l (a2,d2.w),a2
	move.w (a2),d2
	bra.w loc_0b94f4

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b972c:
	moveq #0,d0
	move.l d0,d1
	move.b ($102,a3),d0
	cmpi.b #4,d0
	bne.w loc_0b9746
	tst.b ($132,a3)
	bpl.b loc_0b9746
	move.b #$20,d0

loc_0b9746:
	lsl.w #3,d0
	lea.l (a0,d0.w),a0
	move.w (Dramatic_Mode_Type,a5),d0
	add.w d0,d0
	add.b ($101,a3),d0
	move.b loc_0b976e(pc,d0.w),($d,a3)
	move.b ($d,a3),d1
	andi.w #$1f,d1
	move.l (a0)+,d0
	or.w d1,d0
	move.l d0,(a1)+
	move.l (a0)+,(a1)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b976e:
	dc.b $00,$05,$00,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$00,$05,$00
	dc.b $00,$05,$0a,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0b977e:
	movea.w (left_hud_pointer,a5),a4
	cmpi.b #$17,($102,a4)
	bne.b loc_0b97a4
	lea.l loc_0b9a0c(pc),a0
	movea.l ($1c,a4),a1
	tst.b ($12,a1)
	bpl.b loc_0b979c
	lea.l loc_0b9abc(pc),a0

loc_0b979c:
	lea.l ($46,a6),a1
	bsr.w loc_0b95fa

loc_0b97a4:
	movea.w (right_hud_pointer,a5),a4
	cmpi.b #$17,($102,a4)
	bne.b loc_0b97ca
	lea.l loc_0b9b1c(pc),a0
	movea.l ($1c,a4),a1
	tst.b ($12,a1)
	bpl.b loc_0b97c2
	lea.l loc_0b9bcc(pc),a0

loc_0b97c2:
	lea.l ($56,a6),a1
	bsr.w loc_0b95fa

loc_0b97ca:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b97cc:
	dc.w $2611,$003d,$0010,$0020
	dc.w $2611,$001d,$00b0,$0020
	dc.w $2611,$003d,$00c0,$0020
	dc.w $2611,$001d,$0160,$0020

loc_0b97ec:
	dc.w $26f4,$26f8,$26fc,$2714
	dc.w $2718,$271c,$2734,$2738
	dc.w $273c,$2754,$2758,$275c
	dc.w $2774,$2778,$277c,$27d4
	dc.w $27d8,$27dc,$2718,$27dc
	dc.w $2734,$2800,$27e4,$26f4
	dc.w $27e8,$27ec,$27f0,$27f4
	dc.w $27f8,$27fc,$2898,$289c
	dc.w $26f4,$26f8,$2808,$2804
	dc.w $2718,$271c,$2734,$2738
	dc.w $273c,$2754,$2800,$275c
	dc.w $2774,$2778,$277c,$27d4
	dc.w $27d8,$27dc,$2718,$27dc
	dc.w $2734,$27f8,$27e4,$26f4
	dc.w $27e8,$27ec,$27f0,$27f4
	dc.w $2758,$27fc,$2898,$289c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b986c:
	dc.w $fff1,$fff1,$fff6,$fff4
	dc.w $fffa,$fff4,$fff8,$fff0
	dc.w $fff9,$fff5,$fff5,$fff7
	dc.w $fff1,$fffd,$0001,$ffff
	dc.w $fffe,$fff1,$ffe2,$fff1
	dc.w $ffe2,$fffe,$fff9,$ffe2
	dc.w $ffff,$fffc,$fff9,$fff5
	dc.w $fffd,$fff7,$fff1,$fff0
	dc.w $fff1,$fff1,$fffa,$fffd
	dc.w $fffa,$fff4,$fff8,$fff0
	dc.w $fff9,$fff5,$fffe,$fff7
	dc.w $fff1,$fffd,$0001,$ffff
	dc.w $fffe,$fff1,$ffe2,$fff1
	dc.w $ffe2,$fffd,$fff9,$ffe2
	dc.w $ffff,$fffc,$fff9,$fff5
	dc.w $fff5,$fff7,$fff1,$fff0

loc_0b98ec:
	dc.w $014e,$014f,$0148,$014b
	dc.w $0145,$014b,$0146,$014f
	dc.w $0147,$014b,$014b,$0147
	dc.w $014f,$0142,$013f,$0141
	dc.w $0141,$014f,$001e,$014f
	dc.w $001e,$0142,$0147,$001e
	dc.w $0141,$0143,$0146,$014a
	dc.w $0143,$0148,$0151,$014f
	dc.w $014e,$014f,$0148,$0142
	dc.w $0145,$014b,$0146,$014f
	dc.w $0147,$014b,$0142,$0147
	dc.w $014f,$0142,$013f,$0141
	dc.w $0141,$014f,$001e,$014f
	dc.w $001e,$0143,$0147,$001e
	dc.w $0141,$0143,$0146,$014a
	dc.w $014b,$0148,$0151,$014f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b996c:
	dc.w $0400,$1220,$0000,$0010
	dc.w $0403,$1220,$0000,$0010
	dc.w $0406,$1220,$0000,$0010
	dc.w $0409,$1220,$0000,$0010
	dc.w $040c,$1220,$0000,$0010
	dc.w $0420,$1220,$0000,$0010
	dc.w $0423,$1220,$0000,$0010
	dc.w $0426,$1220,$0000,$0010
	dc.w $0429,$1220,$0000,$0010
	dc.w $042c,$1220,$0000,$0010
	dc.w $0440,$1220,$0000,$0010
	dc.w $0446,$1220,$0000,$0010
	dc.w $0449,$1220,$0000,$0010
	dc.w $044c,$1220,$0000,$0010
	dc.w $0460,$1220,$0000,$0010
	dc.w $0463,$1220,$0000,$0010
	dc.w $0466,$1220,$0000,$0010
	dc.w $0469,$1220,$0000,$0010
	dc.w $046c,$1220,$0000,$0010
	dc.w $0469,$1220,$0000,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9a0c:
	dc.w $0423,$1220,$0000,$0010
	dc.w $0480,$1220,$0000,$0010
	dc.w $0483,$1220,$0000,$0010
	dc.w $0400,$1220,$0000,$0010
	dc.w $0489,$1220,$0000,$0010
	dc.w $048c,$1220,$0000,$0010
	dc.w $0b43,$1220,$0000,$0010
	dc.w $0b46,$1220,$0000,$0010
	dc.w $0b49,$1220,$0000,$0010
	dc.w $0b4c,$1220,$0000,$0010
	dc.w $0b2c,$1220,$0000,$0010
	dc.w $0b29,$1220,$0000,$0010
	dc.w $046c,$1220,$0000,$0010
	dc.w $0486,$1220,$0000,$000f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9a7c:
	dc.w $0400,$1200,$0150,$0010
	dc.w $0403,$1200,$0150,$0010
	dc.w $0406,$1200,$0150,$0010
	dc.w $0409,$1200,$0150,$0010
	dc.w $040c,$1200,$0150,$0010
	dc.w $0420,$1200,$0150,$0010
	dc.w $0423,$1200,$0150,$0010
	dc.w $0426,$1200,$0150,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9abc:
	dc.w $0429,$1200,$0150,$0010
	dc.w $042c,$1200,$0150,$0010
	dc.w $0440,$1200,$0150,$0010
	dc.w $0446,$1200,$0150,$0010
	dc.w $0449,$1200,$0150,$0010
	dc.w $044c,$1200,$0150,$0010
	dc.w $0460,$1200,$0150,$0010
	dc.w $0463,$1200,$0150,$0010
	dc.w $0466,$1200,$0150,$0010
	dc.w $0469,$1200,$0150,$0010
	dc.w $046c,$1200,$0150,$0010
	dc.w $0469,$1200,$0150,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9b1c:
	dc.w $0423,$1200,$0150,$0010
	dc.w $0480,$1200,$0150,$0010
	dc.w $0483,$1200,$0150,$0010
	dc.w $0400,$1200,$0150,$0010
	dc.w $0489,$1200,$0150,$0010
	dc.w $048c,$1200,$0150,$0010
	dc.w $0b43,$1200,$0150,$0010
	dc.w $0b46,$1200,$0150,$0010
	dc.w $0b49,$1200,$0150,$0010
	dc.w $0b4c,$1200,$0150,$0010
	dc.w $0b2c,$1200,$0150,$0010
	dc.w $0b29,$1200,$0150,$0010
	dc.w $046c,$1200,$0150,$0010
	dc.w $0486,$1200,$0150,$000f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9b8c:
	dc.w $0400,$1220,$fff0,$0010
	dc.w $0403,$1220,$fff0,$0010
	dc.w $0406,$1220,$fff0,$0010
	dc.w $0409,$1220,$fff0,$0010
	dc.w $040c,$1220,$fff0,$0010
	dc.w $0420,$1220,$fff0,$0010
	dc.w $0423,$1220,$fff0,$0010
	dc.w $0426,$1220,$fff0,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9bcc:
	dc.w $0429,$1220,$fff0,$0010
	dc.w $042c,$1220,$fff0,$0010
	dc.w $0440,$1220,$fff0,$0010
	dc.w $0446,$1220,$fff0,$0010
	dc.w $0449,$1220,$fff0,$0010
	dc.w $044c,$1220,$fff0,$0010
	dc.w $0460,$1220,$fff0,$0010
	dc.w $0463,$1220,$fff0,$0010
	dc.w $0466,$1220,$fff0,$0010
	dc.w $0469,$1220,$fff0,$0010
	dc.w $046c,$1220,$fff0,$0010
	dc.w $0469,$1220,$fff0,$0010
	dc.w $0423,$1220,$fff0,$0010
	dc.w $0480,$1220,$fff0,$0010
	dc.w $0483,$1220,$fff0,$0010
	dc.w $0400,$1220,$fff0,$0010
	dc.w $0489,$1220,$fff0,$0010
	dc.w $048c,$1220,$fff0,$0010
	dc.w $0b43,$1220,$fff0,$0010
	dc.w $0b46,$1220,$fff0,$0010
	dc.w $0b49,$1220,$fff0,$0010
	dc.w $0b4c,$1220,$fff0,$0010
	dc.w $0b2c,$1220,$fff0,$0010
	dc.w $0b29,$1220,$fff0,$0010
	dc.w $046c,$1220,$fff0,$0010
	dc.w $0486,$1220,$fff0,$000f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9c9c:
	dc.w $0400,$1200,$0160,$0010
	dc.w $0403,$1200,$0160,$0010
	dc.w $0406,$1200,$0160,$0010
	dc.w $0409,$1200,$0160,$0010
	dc.w $040c,$1200,$0160,$0010
	dc.w $0420,$1200,$0160,$0010
	dc.w $0423,$1200,$0160,$0010
	dc.w $0426,$1200,$0160,$0010
	dc.w $0429,$1200,$0160,$0010
	dc.w $042c,$1200,$0160,$0010
	dc.w $0440,$1200,$0160,$0010
	dc.w $0446,$1200,$0160,$0010
	dc.w $0449,$1200,$0160,$0010
	dc.w $044c,$1200,$0160,$0010
	dc.w $0460,$1200,$0160,$0010
	dc.w $0463,$1200,$0160,$0010
	dc.w $0466,$1200,$0160,$0010
	dc.w $0469,$1200,$0160,$0010
	dc.w $046c,$1200,$0160,$0010
	dc.w $0469,$1200,$0160,$0010
	dc.w $0423,$1200,$0160,$0010
	dc.w $0480,$1200,$0160,$0010
	dc.w $0483,$1200,$0160,$0010
	dc.w $0400,$1200,$0160,$0010
	dc.w $0489,$1200,$0160,$0010
	dc.w $048c,$1200,$0160,$0010
	dc.w $0b43,$1200,$0160,$0010
	dc.w $0b46,$1200,$0160,$0010
	dc.w $0b49,$1200,$0160,$0010
	dc.w $0b4c,$1200,$0160,$0010
	dc.w $0b2c,$1200,$0160,$0010
	dc.w $0b29,$1200,$0160,$0010
	dc.w $046c,$1200,$0160,$0010
	dc.w $0486,$1200,$0160,$000f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0b9dac:
	incbin "bins/b9dacdata.bin"

loc_0ba7de:
	incbin "bins/ba7dedata.bin"

;##############################################
loc_0bb210:
	move.b (4,a6),d0
	move.w loc_0bb21c(pc,d0.w),d1
	jmp loc_0bb21c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bb21c:
	dc.w loc_0bb224-loc_0bb21c
	dc.w loc_0bb284-loc_0bb21c
	dc.w loc_0bb2a4-loc_0bb21c
	dc.w loc_0bb2a4-loc_0bb21c

;==============================================
loc_0bb224:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.w d0,($10,a6)
	move.w #$100,($14,a6)
	move.b #$10,($3a,a6)
	move.b #1,($3b,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	lea.l ($80,a6),a0
	move.l a0,($1c,a6)
	move.w #4,($80,a6)
	move.b ($3c,a6),d0
	lea.l ($86,a6),a4
	bsr.w loc_0bb2aa
	move.w d3,($82,a6)
	subq.w #1,d3
	move.w d3,($84,a6)
	moveq #0,d0

loc_0bb284:
	tst.b ($31,a6)
	beq.b loc_0bb2a2
	subq.b #1,($3a,a6)
	bne.b loc_0bb2a2
	move.b #$10,($3a,a6)
	eori.b #1,($3b,a6)
	eori.b #1,(1,a6)

loc_0bb2a2:
	rts

;==============================================
loc_0bb2a4:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bb2aa:
	movea.l #loc_01cdd2,a0
	tst.b (3,a6)
	beq.b loc_0bb2bc
	movea.l #loc_01deda,a0

loc_0bb2bc:
	add.w d0,d0
	adda.w (a0,d0.w),a0
	moveq #0,d3

loc_0bb2c4:
	moveq #0,d2
	move.b (a0)+,d2
	lsl.w #3,d2
	swap d2
	move.b (a0)+,d2
	add.w d2,d2
	andi.l #$3ff03ff,d2
	moveq #0,d1
	move.b (a0)+,d1
	move.w #$1f,d1

loc_0bb2de:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_0bb31a
	cmpi.b #$7f,d0
	beq.b loc_0bb2c4
	cmpi.b #$20,d0
	beq.b loc_0bb312
	tst.b (3,a6)
	beq.b loc_0bb306
	cmpi.b #$40,d0
	bne.b loc_0bb302
	move.w #$195,d0
	bra.b loc_0bb306

loc_0bb302:
	addi.w #$80,d0

loc_0bb306:
	addi.w #$200,d0
	move.w d0,(a4)+
	move.w d1,(a4)+
	move.l d2,(a4)+
	addq.w #1,d3

loc_0bb312:
	addi.l #$80000,d2
	bra.b loc_0bb2de

loc_0bb31a:
	rts

;##############################################
loc_0bb31c:
	move.b (4,a6),d0
	move.w loc_0bb328(pc,d0.w),d1
	jmp loc_0bb328(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bb328:
	dc.w loc_0bb330-loc_0bb328
	dc.w loc_0bb3dc-loc_0bb328
	dc.w loc_0bbac4-loc_0bb328
	dc.w loc_0bbace-loc_0bb328

;==============================================
loc_0bb330:
	move.b (5,a6),d0
	move.w loc_0bb33c(pc,d0.w),d1
	jmp loc_0bb33c(pc,d1.w)

;----------------------------------------------
loc_0bb33c:
	dc.w loc_0bb342-loc_0bb33c
	dc.w loc_0bb3b4-loc_0bb33c
	dc.w loc_0bb3c8-loc_0bb33c

;----------------------------------------------
loc_0bb342:
	move.b #1,(1,a6)
	addq.b #2,(5,a6)
	move.w #$130,($14,a6)
	tst.w ($102,a5)
	beq.b loc_0bb366
	addq.b #2,(4,a6)
	clr.b (5,a6)
	move.w #$100,($14,a6)
 
 loc_0bb366:
	moveq #0,d0
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.w d0,($c,a6)
	move.w d0,($10,a6)
	move.b #2,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.w #4,($50,a6)
	move.w #$36,($52,a6)
	move.w #$33,($54,a6)
	tst.w (Dramatic_Mode_Type,a5)
	bne.w loc_0bbada
	bra.w loc_0bbb1c

loc_0bb3b0:
	bra.w loc_0bbada

;----------------------------------------------
loc_0bb3b4:
	cmpi.w #4,($c,a5)
	bne.b loc_0bb3c6
	addq.b #2,(5,a6)
	move.b #1,(1,a6)

loc_0bb3c6:
	bra.b loc_0bb3dc

;----------------------------------------------
loc_0bb3c8:
	subq.w #2,($14,a6)
	cmpi.w #$100,($14,a6)
	bne.w loc_0bb3da
	addq.b #2,(4,a6)

;----------------------------------------------
loc_0bb3da:
	rts

;==============================================
loc_0bb3dc:
	move.b #1,(1,a6)
	tst.w (Dramatic_Mode_Type,a5)
	beq.b loc_0bb3ea
	rts

loc_0bb3ea:
	movea.w (left_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($24c,a3),d1
	add.w d1,d1
	lea.l loc_0bd72c(pc),a0
	move.w (a0,d1.w),d1
	subi.w #1,d1
	tst.b ($f0,a3)
	bne.w loc_0bb416
	lea.l ($56,a6),a4
	move.w #$2760,(a4)
	move.w d1,(4,a4)

loc_0bb416:
	subi.w #$22,d1
	lea.l ($1b6,a6),a4
	move.w #$2771,(a4)
	move.w d1,(4,a4)
	movea.w (right_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($24c,a3),d1
	add.w d1,d1
	lea.l loc_0bd84e(pc),a0
	move.w (a0,d1.w),d1
	tst.b ($f0,a3)
	bne.w loc_0bb44e
	lea.l ($5e,a6),a4
	move.w #$2760,(a4)
	move.w d1,(4,a4)

loc_0bb44e:
	addi.w #3,d1
	lea.l ($1be,a6),a4
	move.w #$2712,(a4)
	move.w d1,(4,a4)
	movea.w (left_hud_pointer,a5),a3
	tst.w ($50,a3)
	bmi.w loc_0bb6c8
	movea.w (right_hud_pointer,a5),a3
	tst.w ($50,a3)
	bmi.w loc_0bb6c8
	movea.w (left_hud_pointer,a5),a3
	tst.b ($2c7,a3)
	bne.w loc_0bb59a
	movea.w (right_hud_pointer,a5),a3
	tst.b ($2c7,a3)
	bne.w loc_0bb62e
	tst.b (Reset_GaurdTag,a5)
	bne.w loc_0bb4ae
	tst.b (7,a6)
	beq.w loc_0bb6c2
	moveq #0,d0
	moveq #0,d1
	move.b (Reset_GaurdTag,a5),d0
	cmp.b (7,a6),d0
	bne.w loc_0bb59a

loc_0bb4ae:
	movea.w (left_hud_pointer,a5),a3
	move.b ($24c,a3),d0
	cmpi.b #$11,d0
	bcs.w loc_0bb526
	move.b (Reset_GaurdTag,a5),d0
	andi.b #1,d0
	beq.w loc_0bb526
	movea.l #$90c3a0,a0
	bsr.w loc_0bbc9a
	lea.l ($66,a6),a4
	movea.w (left_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($296,a3),d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96
	movea.w (left_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($296,a3),d1
	add.w d1,d1
	lea.l loc_0bd72c(pc),a0
	move.w (a0,d1.w),d1
	subi.w #1,d1
	tst.b ($f0,a3)
	bne.w loc_0bb516
	lea.l ($56,a6),a4
	move.w #$2760,(a4)
	move.w d1,(4,a4)

loc_0bb516:
	subi.w #$22,d1
	lea.l ($1b6,a6),a4
	move.w #$2771,(a4)
	move.w d1,(4,a4)

loc_0bb526:
	movea.w (right_hud_pointer,a5),a3
	move.b ($24c,a3),d0
	cmpi.b #$11,d0
	bcs.w loc_0bb6c2
	move.b (Reset_GaurdTag,a5),d0
	andi.b #2,d0
	beq.w loc_0bb6c2
	movea.l #$90c3a0,a0
	bsr.w loc_0bbc9a
	lea.l ($9e,a6),a4
	movea.w (right_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($296,a3),d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96
	moveq #0,d1
	move.b ($296,a3),d1
	add.w d1,d1
	lea.l loc_0bd84e(pc),a0
	move.w (a0,d1.w),d1
	tst.b ($f0,a3)
	bne.w loc_0bb586
	lea.l ($5e,a6),a4
	move.w #$2711,(a4)
	move.w d1,(4,a4)

loc_0bb586:
	addi.w #3,d1
	lea.l ($1be,a6),a4
	move.w #$2712,(a4)
	move.w d1,(4,a4)
	bra.w loc_0bb6c2

loc_0bb59a:
	movea.w (left_hud_pointer,a5),a3
	move.b ($24c,a3),d0
	cmpi.b #$11,d0
	bcs.w loc_0bb61c
	movea.l #$90c3a0,a0
	movea.l #loc_35f8f4,a1
	moveq #1,d7
	bsr.w loc_0bbcd0
	movea.w (left_hud_pointer,a5),a3
	tst.b ($2c7,a3)
	bne.w loc_0bb5d4
	move.b (7,a6),d0
	andi.b #1,d0
	beq.w loc_0bb62e

loc_0bb5d4:
	movea.w (left_hud_pointer,a5),a4
	move.b ($24c,a4),($28,a6)
	jsr loc_01c2c8
	beq.w loc_0bb62e
	addq.b #1,(a4)
	move.b #$1f,(2,a4)
	move.b #0,($b,a4)
	moveq #0,d0
	lea.l loc_0bd72c(pc),a0
	move.b ($28,a6),d0
	add.w d0,d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,($10,a4)
	move.w #0,($12,a4)
	move.l #$d30000,($14,a4)
	move.w a6,($36,a4)

loc_0bb61c:
	lea.l ($66,a6),a4
	movea.w (left_hud_pointer,a5),a3
	moveq #0,d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96

loc_0bb62e:
	movea.w (right_hud_pointer,a5),a3
	move.b ($24c,a3),d0
	cmpi.b #$11,d0
	bcs.w loc_0bb6b0
	movea.l #$90c3a0,a0
	movea.l #loc_35f8f4,a1
	moveq #1,d7
	bsr.w loc_0bbcd0
	movea.w (right_hud_pointer,a5),a3
	tst.b ($2c7,a3)
	bne.w loc_0bb668
	move.b (7,a6),d0
	andi.b #2,d0
	beq.w loc_0bb6c2

loc_0bb668:
	movea.w (right_hud_pointer,a5),a4
	move.b ($24c,a4),($2a,a6)
	jsr loc_01c2c8
	beq.w loc_0bb6c2
	addq.b #1,(a4)
	move.b #$1f,(2,a4)
	move.b #1,($b,a4)
	moveq #0,d0
	lea.l loc_0bd84e(pc),a0
	move.b ($2a,a6),d0
	add.w d0,d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,($10,a4)
	move.w #0,($12,a4)
	move.l #$d30000,($14,a4)
	move.w a6,($36,a4)

loc_0bb6b0:
	lea.l ($9e,a6),a4
	movea.w (right_hud_pointer,a5),a3
	moveq #0,d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96

loc_0bb6c2:
	move.b (Reset_GaurdTag,a5),(7,a6)

loc_0bb6c8:
	movea.w (left_hud_pointer,a5),a3
	clr.b ($2c7,a3)
	movea.w (right_hud_pointer,a5),a3
	clr.b ($2c7,a3)
	movea.w (left_hud_pointer,a5),a3
	move.b ($24c,a3),($28,a6)
	move.b ($24d,a3),($29,a6)
	lea.l ($d6,a6),a4
	bsr.w loc_0bb9bc
	move.w #$3b,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.b ($28,a6),d1
	lea.l loc_0bc748(pc),a0
	bsr.w loc_0bba96
	movea.w (left_hud_pointer,a5),a3
	lea.l ($10e,a6),a4
	bsr.w loc_0bb9bc
	move.w #$3b,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.l d1,d2
	move.b ($28,a6),d1
	move.b ($29,a6),d2
	sub.b d2,d1
	movea.w (left_hud_pointer,a5),a4
	movea.l #$90c360,a0
	tst.b ($41,a6)
	beq.w loc_0bb75a
	subq.b #1,($41,a6)
	move.b ($41,a6),d0
	bsr.w loc_0bbd78
	lea.l ($10e,a6),a4
	bsr.w loc_0bba8a
	bra.w loc_0bb84a

loc_0bb75a:
	tst.b ($279,a4)
	beq.w loc_0bb774
	move.b ($279,a4),d0
	cmp.b ($40,a6),d0
	beq.w loc_0bb774
	move.b #8,($41,a6)

loc_0bb774:
	move.b ($279,a4),($40,a6)
	tst.w ($50,a3)
	bmi.w loc_0bb816
	move.b d1,d2
	subi.b #$11,d2
	bpl.w loc_0bb816
	bsr.w loc_0bbcf2
	lea.l ($10e,a6),a4
	bsr.w loc_0bba8a
	tst.b ($48,a6)
	bne.w loc_0bb7a6
	move.b #1,($48,a6)

loc_0bb7a6:
	moveq #0,d1
	move.l d1,d2
	move.l d1,d3
	move.b ($b4,a5),d1
	andi.b #$1f,d1
	move.b d1,d2
	move.b d1,d3
	add.b d1,d1
	lea.l loc_0bbe96(pc),a0
	lea.l (a0,d1.w),a0
	move.w (a0),d1
	lea.l ($1e6,a6),a4
	move.w d1,(a4)+
	move.w #$417,(a4)+
	move.w #$60,(a4)+
	move.w #$31,(a4)+
	add.b d2,d2
	lea.l loc_0bbf16(pc),a0
	lea.l (a0,d2.w),a0
	move.w (a0),d2
	lea.l ($1d6,a6),a4
	move.w d2,(a4)+
	move.w #$117,(a4)+
	move.w #$9f,(a4)+
	move.w #$28,(a4)+
	add.b d3,d3
	lea.l loc_0bbed6(pc),a0
	lea.l (a0,d3.w),a0
	move.w (a0),d3
	lea.l ($1c6,a6),a4
	move.w d3,(a4)+
	move.w #$117,(a4)+
	move.w #$98,(a4)+
	move.w #$2e,(a4)+
	bra.w loc_0bb84a

loc_0bb816:
	bsr.w loc_0bbd3a
	clr.b ($48,a6)
	lea.l ($1e6,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($1d6,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($1c6,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($10e,a6),a4
	bsr.w loc_0bba8a

loc_0bb84a:
	movea.w (right_hud_pointer,a5),a3
	move.b ($24c,a3),($2a,a6)
	move.b ($24d,a3),($2b,a6)
	lea.l ($146,a6),a4
	bsr.w loc_0bb9e8
	move.w #$1c,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.b ($2a,a6),d1
	lea.l loc_0bc748(pc),a0
	bsr.w loc_0bba96
	movea.w (right_hud_pointer,a5),a3
	lea.l ($17e,a6),a4
	bsr.w loc_0bb9e8
	move.w #$1c,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.l d1,d2
	move.b ($2a,a6),d1
	move.b ($2b,a6),d2
	sub.b d2,d1
	movea.w (right_hud_pointer,a5),a4
	movea.l #$90c380,a0
	tst.b ($43,a6)
	beq.w loc_0bb8cc
	subq.b #1,($43,a6)
	move.b ($43,a6),d0
	bsr.w loc_0bbd78
	lea.l ($17e,a6),a4
	bsr.w loc_0bba8a
	bra.w loc_0bb9ba

loc_0bb8cc:
	tst.b ($279,a4)
	beq.w loc_0bb8e6
	move.b ($279,a4),d0
	cmp.b ($42,a6),d0
	beq.w loc_0bb8e6
	move.b #8,($43,a6)

loc_0bb8e6:
	move.b ($279,a4),($42,a6)
	tst.w ($50,a3)
	bmi.w loc_0bb986
	move.b d1,d2
	subi.b #$11,d2
	bpl.w loc_0bb986
	bsr.w loc_0bbcf2
	lea.l ($17e,a6),a4
	bsr.w loc_0bba8a
	tst.b ($49,a6)
	bne.w loc_0bb918
	move.b #1,($49,a6)

loc_0bb918:
	moveq #0,d1
	move.l d1,d2
	move.l d1,d3
	move.b ($b4,a5),d1
	andi.b #$1f,d1
	move.b d1,d2
	move.b d1,d3
	add.b d1,d1
	lea.l loc_0bbe96(pc),a0
	lea.l (a0,d1.w),a0
	move.w (a0),d1
	lea.l ($1ee,a6),a4
	move.w d1,(a4)+
	move.w #$417,(a4)+
	move.w #$cc,(a4)+
	move.w #$31,(a4)+
	add.b d2,d2
	lea.l loc_0bbf16(pc),a0
	lea.l (a0,d2.w),a0
	move.w (a0),d2
	lea.l ($1de,a6),a4
	move.w d2,(a4)+
	move.w #$137,(a4)+
	move.w #$c1,(a4)+
	move.w #$28,(a4)+
	add.b d3,d3
	lea.l loc_0bbed6(pc),a0
	lea.l (a0,d3.w),a0
	move.w (a0),d3
	lea.l ($1ce,a6),a4
	move.w d3,(a4)+
	move.w #$137,(a4)+
	move.w #$c8,(a4)+
	move.w #$2e,(a4)+
	rts

loc_0bb986:
	bsr.w loc_0bbd3a
	clr.b ($49,a6)
	lea.l ($1ee,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($1de,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($1ce,a6),a4
	move.w #$20,(a4)+
	move.w #$17,(a4)+
	lea.l ($17e,a6),a4
	bsr.w loc_0bba8a

loc_0bb9ba:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bb9bc:
	move.w #$4e,(4,a4)
	move.w #$5e,($c,a4)
	move.w #$6e,($14,a4)
	move.w #$7e,($1c,a4)
	move.w #$8e,($24,a4)
	move.w #$9e,($2c,a4)
	move.w #$ae,($34,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bb9e8:
	move.w #$122,(4,a4)
	move.w #$112,($c,a4)
	move.w #$102,($14,a4)
	move.w #$f2,($1c,a4)
	move.w #$e2,($24,a4)
	move.w #$d2,($2c,a4)
	move.w #$c2,($34,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bba14:
	move.w #$28,(6,a4)
	move.w #$28,($e,a4)
	move.w #$28,($16,a4)
	move.w #$28,($1e,a4)
	move.w #$28,($26,a4)
	move.w #$28,($2e,a4)
	move.w #$28,($36,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bba40:
	move.w #$28,d2
	tst.b ($f0,a3)
	beq.w loc_0bba4e
	moveq #0,d2

loc_0bba4e:
	move.w d2,(6,a4)
	move.w d2,($e,a4)
	move.w d2,($16,a4)
	move.w d2,($1e,a4)
	move.w d2,($26,a4)
	move.w d2,($2e,a4)
	move.w d2,($36,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bba6c:
	move.w d1,(2,a4)
	move.w d1,($a,a4)
	move.w d1,($12,a4)
	move.w d1,($1a,a4)
	move.w d1,($22,a4)
	move.w d1,($2a,a4)
	move.w d1,($32,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bba8a:
	move.b d1,d3
	bpl.w loc_0bba92
	moveq #0,d1

loc_0bba92:
	lea.l loc_0bbf56(pc),a0

loc_0bba96:
	tst.b d1
	bpl.b loc_0bba9c
	moveq #0,d1

loc_0bba9c:
	add.w d1,d1
	move.w d1,d2
	lsl.w #3,d1
	add.w d2,d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,(a4)
	move.w (a0)+,(8,a4)
	move.w (a0)+,($10,a4)
	move.w (a0)+,($18,a4)
	move.w (a0)+,($20,a4)
	move.w (a0)+,($28,a4)
	move.w (a0)+,($30,a4)
	rts

;==============================================
loc_0bbac4:
	move.b #2,(4,a6)
	bra.w loc_0bb366

;==============================================
loc_0bbace:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbad4:
	clr.b (1,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbada:
	move.w #5,($52,a6)
	move.w #2,($54,a6)
	lea.l ($56,a6),a4
	move.w #$267d,(a4)
	move.w #$23b,(2,a4)
	move.w #$90,(4,a4)
	move.w #$28,(6,a4)
	lea.l ($5e,a6),a4
	move.w #$267d,(a4)
	move.w #$21c,(2,a4)
	move.w #$c0,(4,a4)
	move.w #$28,(6,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbb1c:
	movea.w (left_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($24c,a3),d1
	add.w d1,d1
	lea.l loc_0bd72c(pc),a0
	move.w (a0,d1.w),d1
	subq.w #1,d1
	lea.l ($56,a6),a4
	move.w #$2760,(a4)
	move.w #$1b,(2,a4)
	move.w d1,(4,a4)
	move.w #$28,(6,a4)
	tst.b ($f0,a3)
	beq.w loc_0bbb68
	move.w #$267d,(a4)
	move.w #$23b,(2,a4)
	move.w #$90,(4,a4)
	move.w #$28,(6,a4)

loc_0bbb68:
	subi.w #$10,d1
	lea.l ($1b6,a6),a4
	move.w #$2771,(a4)+
	move.w #$117,(a4)+
	move.w d1,(a4)+
	move.w #$28,d0
	tst.b ($f0,a3)
	beq.w loc_0bbb88
	moveq #0,d0

loc_0bbb88:
	move.w d0,(a4)+
	movea.w (right_hud_pointer,a5),a3
	moveq #0,d1
	move.b ($24c,a3),d1
	add.w d1,d1
	lea.l loc_0bd84e(pc),a0
	move.w (a0,d1.w),d1
	subi.w #$10,d1
	lea.l ($5e,a6),a4
	move.w #$2760,(a4)
	move.w #$1c,(2,a4)
	move.w d1,(4,a4)
	move.w #$28,(6,a4)
	tst.b ($f0,a3)
	beq.w loc_0bbbd8
	move.w #$267d,(a4)
	move.w #$21c,(2,a4)
	move.w #$c0,(4,a4)
	move.w #$28,(6,a4)

loc_0bbbd8:
	addi.w #3,d1
	lea.l ($1be,a6),a4
	move.w #$2712,(a4)+
	move.w #$117,(a4)+
	move.w d1,(a4)+
	move.w #$28,d0
	tst.b ($f0,a3)
	beq.w loc_0bbbf8
	moveq #0,d0

loc_0bbbf8:
	move.w d0,(a4)+
	movea.w (left_hud_pointer,a5),a3
	lea.l ($66,a6),a4
	bsr.w loc_0bb9bc
	move.w #$3d,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96
	movea.w (right_hud_pointer,a5),a3
	lea.l ($9e,a6),a4
	bsr.w loc_0bb9e8
	move.w #$1d,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #$0,d1
	lea.l loc_0bcf3a(pc),a0
	bsr.w loc_0bba96
	movea.w (left_hud_pointer,a5),a3
	move.b ($24c,a3),($28,a6)
	move.b ($24d,a3),($29,a6)
	lea.l ($10e,a6),a4
	bsr.w loc_0bb9bc
	move.w #$3b,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.b ($28,a6),d1
	bsr.w loc_0bba8a
	movea.w (right_hud_pointer,a5),a3
	move.w ($24c,a3),($2a,a6)
	move.b ($24d,a3),($2b,a6)
	lea.l ($17e,a6),a4
	bsr.w loc_0bb9e8
	move.w #$1c,d1
	bsr.w loc_0bba6c
	bsr.w loc_0bba40
	moveq #0,d1
	move.b ($2a,a6),d1
	bra.w loc_0bba8a

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbc9a:
	subq.b #1,($3a,a6)
	bpl.w loc_0bbcf0
	move.b #2,($3a,a6)
	moveq #0,d0
	addq.b #1,($3b,a6)
	move.b ($3b,a6),d0
	cmpi.b #2,d0
	bne.w loc_0bbcc0
	moveq #0,d0
	move.b d0,($3b,a6)

loc_0bbcc0:
	add.w d0,d0
	add.w d0,d0
	lea.l loc_0bbdca(pc),a1
	lea.l (a1,d0.w),a1
	movea.l (a1),a1
	moveq #1,d7

loc_0bbcd0:
	move.l (a0),d4
	andi.l #$f000f000,d4

loc_0bbcd8:
	movem.l (a1)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a0)
	lea.l ($10,a0),a0
	dbra d7,loc_0bbcd8

loc_0bbcf0:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbcf2:
	move.b ($b4,a5),d0
	andi.w #3,d0
	add.w d0,d0
	add.w d0,d0
	cmpi.b #2,($123,a4)
	beq.w loc_0bbd2c
	tst.b ($132,a4)
	bmi.b loc_0bbd2c
	beq.b loc_0bbd1e
	lea.l loc_0bbdda(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbd1e:
	lea.l loc_0bbdea(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbd2c:
	lea.l loc_0bbdfa(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbd3a:
	moveq #0,d0
	cmpi.b #2,($123,a4)
	beq.w loc_0bbd6a
	tst.b ($132,a4)
	bmi.b loc_0bbd6a
	beq.b loc_0bbd5c
	lea.l loc_0bbe2a(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbd5c:
	lea.l loc_0bbe2e(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbd6a:
	lea.l loc_0bbe32(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bbd78:
	andi.w #7,d0
	add.w d0,d0
	add.w d0,d0
	cmpi.b #2,($123,a4)
	beq.w loc_0bbdae
	tst.b ($132,a4)
	bmi.b loc_0bbdae
	beq.b loc_0bbda0
	lea.l loc_0bbe36(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbda0:
	lea.l loc_0bbe56(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7
	bra.w loc_0bbdb8

loc_0bbdae:
	lea.l loc_0bbe76(pc),a1
	movea.l (a1,d0.w),a1
	moveq #0,d7

loc_0bbdb8:
	move.w (a0),d4
	andi.w #$f000,d4
	move.w (a1)+,d0
	or.w d4,d0
	move.w d0,(a0)
	dbra d7,loc_0bbdb8
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbdca:
	dc.l loc_35f8f4,loc_35f914,loc_35f8f4,loc_33bc14

loc_0bbdda:
	dc.l loc_0bbe0a,loc_0bbe0a,loc_35f7b4,loc_35f7b4

loc_0bbdea:
	dc.l loc_0bbe0a,loc_0bbe0a,loc_35f854,loc_35f854

loc_0bbdfa:
	dc.l loc_0bbe0a,loc_0bbe0a,loc_35f714,loc_35f714


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe0a:
	dc.w $0fff,$0fff,$0fff,$0fff
	dc.w $0fff,$0fff,$0fff,$0fff
	dc.w $0fff,$0fff,$0fff,$0fff
	dc.w $0fff,$0fff,$0fff,$0fff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe2a:
	dc.l loc_35f7b4

loc_0bbe2e:
	dc.l loc_35f854

loc_0bbe32:
	dc.l loc_35f714

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe36:
	dc.l loc_35f7b4,loc_35f7b4,loc_33bc14+4,loc_33bc14+4
	dc.l loc_35f7b4,loc_35f7b4,loc_33bc14+4,loc_33bc14+4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe56:
	dc.l loc_35f854,loc_35f854,loc_33bc14+4,loc_33bc14+4
	dc.l loc_35f854,loc_35f854,loc_33bc14+4,loc_33bc14+4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe76:
	dc.l loc_35f714,loc_35f714,loc_33bc14+4,loc_33bc14+4
	dc.l loc_35f714,loc_35f714,loc_33bc14+4,loc_33bc14+4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbe96:
	dc.w $2917,$2917,$292b,$292b
	dc.w $2926,$2926,$292b,$292b
	dc.w $2917,$2917,$292b,$292b
	dc.w $2926,$2926,$292b,$292b
	dc.w $2917,$2917,$292b,$292b
	dc.w $2926,$2926,$292b,$292b
	dc.w $2917,$2917,$292b,$292b
	dc.w $2926,$2926,$292b,$292b

loc_0bbed6:
	dc.w $29c7,$29c7,$29c9,$29c9
	dc.w $29c5,$29c5,$29c9,$29c9
	dc.w $29c7,$29c7,$29c9,$29c9
	dc.w $29c5,$29c5,$29c9,$29c9
	dc.w $29c7,$29c7,$29c9,$29c9
	dc.w $29c5,$29c5,$29c9,$29c9
	dc.w $29c7,$29c7,$29c9,$29c9
	dc.w $29c5,$29c5,$29c9,$29c9

loc_0bbf16:
	dc.w $26f2,$26f2,$2732,$2732
	dc.w $26b1,$26b1,$2732,$2732
	dc.w $26f2,$26f2,$2732,$2732
	dc.w $26b1,$26b1,$2732,$2732
	dc.w $26f2,$26f2,$2732,$2732
	dc.w $26b1,$26b1,$2732,$2732
	dc.w $26f2,$26f2,$2732,$2732
	dc.w $26b1,$26b1,$2732,$2732

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bbf56:
	incbin "bins/bbf56data.bin"

loc_0bc748:
	incbin "bins/bc748data.bin"

loc_0bcf3a:
	incbin "bins/bcf3adata.bin"


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bd72c:
	dc.w $00be,$00bd,$00bc,$00bb
	dc.w $00ba,$00b9,$00b8,$00b7
	dc.w $00b6,$00b5,$00b4,$00b3
	dc.w $00b2,$00b1,$00b0,$00af
	dc.w $00ae,$00ad,$00ac,$00ab
	dc.w $00aa,$00a9,$00a8,$00a7
	dc.w $00a6,$00a5,$00a4,$00a3
	dc.w $00a2,$00a1,$00a0,$009f
	dc.w $009e,$009d,$009c,$009b
	dc.w $009a,$0099,$0098,$0097
	dc.w $0096,$0095,$0094,$0093
	dc.w $0092,$0091,$0090,$008f
	dc.w $008e,$008d,$008c,$008b
	dc.w $008a,$0089,$0088,$0087
	dc.w $0086,$0085,$0084,$0083
	dc.w $0082,$0081,$0080,$007f
	dc.w $007e,$007d,$007c,$007b
	dc.w $007a,$0079,$0078,$0077
	dc.w $0076,$0075,$0074,$0073
	dc.w $0072,$0071,$0070,$006f
	dc.w $006e,$006d,$006c,$006b
	dc.w $006a,$0069,$0068,$0067
	dc.w $0066,$0065,$0064,$0063
	dc.w $0062,$0061,$0060,$005f
	dc.w $005e,$005d,$005c,$005b
	dc.w $005a,$0059,$0058,$0057
	dc.w $0056,$0055,$0054,$0053
	dc.w $0052,$0051,$0050,$004f
	dc.w $004e,$004d,$004c,$004b
	dc.w $004a,$0049,$0048,$0047
	dc.w $0046,$0045,$0044,$0043
	dc.w $0042,$0041,$0040,$003f
	dc.w $003e,$003d,$003c,$003b
	dc.w $003a,$0039,$0038,$0037
	dc.w $0036,$0035,$0034,$0033
	dc.w $0032,$0031,$0030,$002f
	dc.w $002e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bd84e:
	dc.w $00c2,$00c3,$00c4,$00c5
	dc.w $00c6,$00c7,$00c8,$00c9
	dc.w $00ca,$00cb,$00cc,$00cd
	dc.w $00ce,$00cf,$00d0,$00d1
	dc.w $00d2,$00d3,$00d4,$00d5
	dc.w $00d6,$00d7,$00d8,$00d9
	dc.w $00da,$00db,$00dc,$00dd
	dc.w $00de,$00df,$00e0,$00e1
	dc.w $00e2,$00e3,$00e4,$00e5
	dc.w $00e6,$00e7,$00e8,$00e9
	dc.w $00ea,$00eb,$00ec,$00ed
	dc.w $00ee,$00ef,$00f0,$00f1
	dc.w $00f2,$00f3,$00f4,$00f5
	dc.w $00f6,$00f7,$00f8,$00f9
	dc.w $00fa,$00fb,$00fc,$00fd
	dc.w $00fe,$00ff,$0100,$0101
	dc.w $0102,$0103,$0104,$0105
	dc.w $0106,$0107,$0108,$0109
	dc.w $010a,$010b,$010c,$010d
	dc.w $010e,$010f,$0110,$0111
	dc.w $0112,$0113,$0114,$0115
	dc.w $0116,$0117,$0118,$0119
	dc.w $011a,$011b,$011c,$011d
	dc.w $011e,$011f,$0120,$0121
	dc.w $0122,$0123,$0124,$0125
	dc.w $0126,$0127,$0128,$0129
	dc.w $012a,$012b,$012c,$012d
	dc.w $012e,$012f,$0130,$0131
	dc.w $0132,$0133,$0134,$0135
	dc.w $0136,$0137,$0138,$0139
	dc.w $013a,$013b,$013c,$013d
	dc.w $013e,$013f,$0140,$0141
	dc.w $0142,$0143,$0144,$0145
	dc.w $0146,$0147,$0148,$0149
	dc.w $014a,$014b,$014c,$014d
	dc.w $014e,$014f,$0150,$0151
	dc.w $001e

;##############################################
loc_0bd970:
	move.b (4,a6),d0
	move.w loc_0bd97c(pc,d0.w),d1
	jmp loc_0bd97c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bd97c:
	dc.w loc_0bd984-loc_0bd97c
	dc.w loc_0bd9b8-loc_0bd97c
	dc.w loc_0bd9d2-loc_0bd97c
	dc.w loc_0bd9d2-loc_0bd97c

;==============================================
loc_0bd984:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	move.w #$e000,($18,a6)
	move.b #1,(1,a6)
	clr.w ($c,a6)
	move.l #$400000,($10,a6)
	move.l #$900000,($14,a6)
	clr.w ($50,a6)
	bsr.w loc_0bd9da
	bra.w loc_0bda0e

;==============================================
loc_0bd9b8:
	bsr.w loc_0bda5c
	bsr.w loc_0bda90
	bsr.w loc_0bdab2
	btst.b #$d,($51a,a5)
	beq.w loc_0bdb32
	bra.w loc_0bdaf0

;==============================================
loc_0bd9d2:
	jmp loc_01c3c2

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bd9d8:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bd9da:
	lea.l ($80,a6),a0
	move.l a0,($1c,a6)
	move.w #4,(a0)+
	move.l #$810001,(a0)+
	move.w #$2c10,(a0)+
	move.w #$7f1f,(a0)+
	move.w #0,(a0)+
	move.w #0,(a0)+
	move.w #$1f6,(a0)+
	move.w #0,(a0)+
	move.w #0,(a0)+
	move.w #0,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bda0e:
	movea.l ($36,a6),a0
	moveq #$20,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	move.l d0,d7
	movem.l d0-d7,(a0)
	lea.l ($20,a0),a0
	movem.l d0-d7,(a0)
	jsr loc_01c3ac
	beq.b loc_0bda5a
	addq.b #1,(a4)
	move.b #1,(2,a4)
	move.w #$40,($10,a4)
	move.w #$d0,($14,a4)
	move.w #$ff,($3a,a4)
	move.l ($36,a6),($36,a4)
	move.w a4,($64,a6)

loc_0bda5a:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bda5c:
	btst.b #8,($778,a5)
	beq.w loc_0bd9d8
	cmpi.w #$40,($50,a6)
	beq.w loc_0bd9d8
	movea.l ($36,a6),a0
	adda.w ($50,a6),a0
	move.w ($92,a6),d0
	lsr.w #4,d0
	add.w ($94,a6),d0
	add.w ($86,a6),d0
	move.w d0,(a0)
	addq.w #2,($50,a6)
	bra.w loc_0bdae0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bda90:
	btst.b #9,($778,a5)
	beq.w loc_0bd9d8
	subq.w #2,($50,a6)
	bpl.b loc_0bdaa4
	clr.w ($50,a6)

loc_0bdaa4:
	movea.l ($36,a6),a0
	adda.w ($50,a6),a0
	move.w #$20,(a0)
	bra.b loc_0bdae0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bdab2:
	btst.b #$a,($778,a5)
	beq.w loc_0bd9d8
	cmpi.w #$40,($50,a6)
	beq.w loc_0bd9d8
	movea.l ($36,a6),a0
	adda.w ($50,a6),a0
	move.w #$20,(a0)
	addq.w #2,($50,a6)
	bra.b loc_0bdae0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bdad8:
	btst.b #$c,($778,a5)
	beq.b loc_0bdaee

loc_0bdae0:
	movea.w ($64,a6),a4
	clr.l (4,a4)
	move.w #$ff,($3a,a4)

loc_0bdaee:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bdaf0:
	btst.b #3,($779,a5)
	bne.b loc_0bdb02
	btst.b #2,($779,a5)
	bne.b loc_0bdb1a
	rts

loc_0bdb02:
	move.w ($86,a6),d0
	addi.w #$80,d0
	cmpi.w #$2f80,d0
	ble.b loc_0bdb14
	move.w #$2f80,d0

loc_0bdb14:
	move.w d0,($86,a6)
	rts

loc_0bdb1a:
	move.w ($86,a6),d0
	addi.w #$ff80,d0
	cmpi.w #$2c10,d0
	bge.b loc_0bdb2c
	move.w #$2c10,d0

loc_0bdb2c:
	move.w d0,($86,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bdb32:
	moveq #0,d0
	move.b ($779,a5),d0
	beq.b loc_0bdb52
	lsl.w #2,d0
	move.w loc_0bdb54+2(pc,d0.w),d1
	bsr.w loc_0bdb94
	move.w loc_0bdb54(pc,d0.w),d0
	add.w d0,($92,a6)
	andi.w #$f0,($92,a6)

loc_0bdb52:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0bdb54:
	dc.w $0000,$0000
	dc.w $0010,$0000
	dc.w $fff0,$0000
	dc.w $0000,$0000
	dc.w $0000,$0010
	dc.w $0010,$0010
	dc.w $fff0,$0010
	dc.w $0000,$0010
	dc.w $0000,$fff0
	dc.w $0010,$fff0
	dc.w $fff0,$fff0
	dc.w $0000,$fff0
	dc.w $0000,$0000
	dc.w $0010,$0000
	dc.w $fff0,$0000
	dc.w $0000,$0000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0bdb94:
	beq.w loc_0bd9d8
	bpl.b loc_0bdbb8
	cmpi.w #0,($94,a6)
	bgt.b loc_0bdbb2
	cmpi.w #$2c10,($86,a6)
	ble.b loc_0bdbb0
	addi.w #$fff0,($86,a6)

loc_0bdbb0:
	rts

loc_0bdbb2:
	add.w d1,($94,a6)
	rts

loc_0bdbb8:
	cmpi.w #$70,($94,a6)
	blt.b loc_0bdbd0
	cmpi.w #$2f80,($86,a6)
	bge.b loc_0bdbce
	addi.w #$10,($86,a6)

loc_0bdbce:
	rts

loc_0bdbd0:
	add.w d1,($94,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Birdie sprite render offsets
;will have to revisit
;when i get the pointers from sprite tilemaps

;Birdie
;###############################################
loc_0bdbd6:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$fff4
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0000,$ff6c
    dc.w $0010,$ff6c
    dc.w $0010,$ff7c
    dc.w $0010,$ff8c
    dc.w $0010,$ffac
    dc.w $0020,$ff7c
    dc.w $0020,$ff9c
    dc.w $0020,$ffac

;###############################################
loc_0bdc3a:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$fff4
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0000,$ff6c
    dc.w $0000,$ff7c
    dc.w $0000,$ff9c
    dc.w $0010,$ffac
    dc.w $0020,$ff6c
    dc.w $0020,$ffac

;###############################################
loc_0bdc96:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffe4
    dc.w $fff0,$fff4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$ffd4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffc7,$ff77
    dc.w $ffc7,$ffa7
    dc.w $ffd7,$ff77
    dc.w $ffd7,$ff87
    dc.w $ffd7,$ffb7
    dc.w $ffe7,$ff77
    dc.w $ffe7,$ffb7
    dc.w $fff7,$ff87
    dc.w $fff7,$ff97
    dc.w $fff7,$ffb7
    dc.w $0007,$ffb7

;###############################################
loc_0bdcfa:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffc0,$ffb5
    dc.w $ffc0,$ffd5
    dc.w $ffc0,$ffe5
    dc.w $ffc0,$fff5
    dc.w $ffd0,$ffa5
    dc.w $ffd0,$ffc5
    dc.w $ffd0,$ffd5
    dc.w $ffd0,$ffe5
    dc.w $ffe0,$ffc5
    dc.w $ffe0,$ffd5
    dc.w $ffe0,$ffe5
    dc.w $ffe0,$fff5
    dc.w $fff0,$ffc5
    dc.w $fff0,$ffd5
    dc.w $fff0,$fff5
    dc.w $0000,$ffc5
    dc.w $0010,$ffb5

;###############################################
loc_0bdd6a:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffc1,$ffb3
    dc.w $ffc1,$ffd3
    dc.w $ffc1,$ffe3
    dc.w $ffc1,$fff3
    dc.w $ffd1,$ffa3
    dc.w $ffd1,$ffc3
    dc.w $ffd1,$ffd3
    dc.w $ffd1,$ffe3
    dc.w $ffe1,$ffc3
    dc.w $ffe1,$ffe3
    dc.w $ffe1,$fff3
    dc.w $fff1,$ffc3
    dc.w $fff1,$ffd3
    dc.w $fff1,$fff3
    dc.w $0001,$ffc3
    dc.w $0011,$ffb3

;###############################################
loc_0bddd6:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffe4
    dc.w $fff0,$fff4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$ffd4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffc0,$ffa0
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ff90
    dc.w $ffd0,$ffa0
    dc.w $ffd0,$ffb0
    dc.w $ffd0,$ffc0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffe0
    dc.w $fff0,$ffa0
    dc.w $0000,$ffc0
    dc.w $0010,$ffb0

;###############################################
loc_0bde42:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$fff4
    dc.w $ffd0,$ff6c
    dc.w $ffe0,$ff5c
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0010,$ff7c
    dc.w $0010,$ff8c
    dc.w $0010,$ffac
    dc.w $0020,$ff8c
    dc.w $0020,$ff9c
    dc.w $0020,$ffac
    dc.w $0030,$ff6c
    dc.w $0030,$ff8c

;###############################################
loc_0bdeae:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$fff4
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0000,$ff6c
    dc.w $0000,$ff7c
    dc.w $0000,$ff9c
    dc.w $0010,$ffac
    dc.w $0020,$ff6c
    dc.w $0020,$ffac
    dc.w $0030,$ff9c

;###############################################
loc_0bdf0e:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffe4
    dc.w $fff0,$fff4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$ffd4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffc7,$ff77
    dc.w $ffc7,$ffa7
    dc.w $ffd7,$ff77
    dc.w $ffd7,$ff87
    dc.w $ffd7,$ffb7
    dc.w $ffe7,$ff77
    dc.w $ffe7,$ffb7
    dc.w $fff7,$ff87
    dc.w $fff7,$ff97
    dc.w $fff7,$ffb7
    dc.w $fff7,$ffc7
    dc.w $0007,$ff87
    dc.w $0007,$ffb7
    dc.w $0027,$ff77
    dc.w $0027,$ff97

;###############################################
loc_0bdf82:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffa0,$ffe5
    dc.w $ffc0,$ffb5
    dc.w $ffc0,$ffd5
    dc.w $ffd0,$ffa5
    dc.w $ffd0,$ffc5
    dc.w $ffd0,$ffd5
    dc.w $ffd0,$ffe5
    dc.w $ffd0,$fff5
    dc.w $ffe0,$ffc5
    dc.w $ffe0,$ffd5
    dc.w $ffe0,$ffe5
    dc.w $fff0,$ffc5
    dc.w $fff0,$ffd5
    dc.w $fff0,$fff5
    dc.w $0000,$ffc5
    dc.w $0010,$ffb5

;###############################################
loc_0bdfee:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $fff0,$fff4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ff91,$fff3
    dc.w $ff91,$0003
    dc.w $ffc1,$ffb3
    dc.w $ffc1,$ffd3
    dc.w $ffc1,$ffe3
    dc.w $ffd1,$ffa3
    dc.w $ffd1,$ffc3
    dc.w $ffd1,$ffe3
    dc.w $ffe1,$ffe3
    dc.w $fff1,$ffc3
    dc.w $fff1,$ffd3
    dc.w $fff1,$fff3
    dc.w $0001,$ffc3
    dc.w $0011,$ffb3

;###############################################
loc_0be052:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffe4
    dc.w $fff0,$fff4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $0020,$ffd4
    dc.w $0020,$ffe4
    dc.w $0020,$fff4
    dc.w $ffa0,$fff0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffa0
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ff90
    dc.w $ffd0,$ffa0
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $fff0,$ffa0
    dc.w $0000,$ffc0
    dc.w $0010,$ffb0

;###############################################
loc_0be0be:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $ffd0,$ff6c
    dc.w $ffe0,$ff5c
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0010,$ff7c
    dc.w $0010,$ff8c
    dc.w $0010,$ffac
    dc.w $0020,$ff8c
    dc.w $0020,$ff9c
    dc.w $0020,$ffac
    dc.w $0030,$ff6c
    dc.w $0030,$ff8c

;###############################################
loc_0be122:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffd4
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffd4
    dc.w $0000,$ffb4
    dc.w $0000,$ffd4
    dc.w $0000,$ffe4
    dc.w $0010,$ffb4
    dc.w $0010,$ffe4
    dc.w $0010,$fff4
    dc.w $ffe0,$ff7c
    dc.w $ffe0,$ffac
    dc.w $fff0,$ffbc
    dc.w $0000,$ff6c
    dc.w $0000,$ff7c
    dc.w $0000,$ff9c
    dc.w $0010,$ffac
    dc.w $0020,$ff6c
    dc.w $0020,$ffac
    dc.w $0030,$ff9c

;###############################################
loc_0be17a:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffd0,$0004
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $ffe0,$0004
    dc.w $fff0,$ffc4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0020,$ffd4
    dc.w $ffc7,$ff77
    dc.w $ffc7,$ffa7
    dc.w $ffd7,$ff77
    dc.w $ffd7,$ff87
    dc.w $ffd7,$ffb7
    dc.w $ffe7,$ff77
    dc.w $ffe7,$ffb7
    dc.w $fff7,$ff87
    dc.w $fff7,$ff97
    dc.w $fff7,$ffb7
    dc.w $fff7,$ffc7
    dc.w $0007,$ff87
    dc.w $0007,$ffb7
    dc.w $0027,$ff77
    dc.w $0027,$ff97

;###############################################
loc_0be1e2:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffd0,$0004
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $ffa0,$ffe5
    dc.w $ffc0,$ffb5
    dc.w $ffc0,$ffd5
    dc.w $ffd0,$ffa5
    dc.w $ffd0,$ffc5
    dc.w $ffd0,$ffd5
    dc.w $ffd0,$ffe5
    dc.w $ffd0,$fff5
    dc.w $ffe0,$ffc5
    dc.w $ffe0,$ffd5
    dc.w $ffe0,$ffe5
    dc.w $fff0,$ffc5
    dc.w $fff0,$ffd5
    dc.w $fff0,$fff5
    dc.w $0000,$ffc5
    dc.w $0010,$ffb5

;###############################################
loc_0be24a:
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$ffe4
    dc.w $ffd0,$fff4
    dc.w $ffd0,$0004
    dc.w $ffe0,$ffe4
    dc.w $fff0,$ffc4
    dc.w $fff0,$ffd4
    dc.w $0000,$ffc4
    dc.w $0010,$fff4
    dc.w $0020,$ffe4
    dc.w $ff91,$fff3
    dc.w $ff91,$0003
    dc.w $ffc1,$ffb3
    dc.w $ffc1,$ffd3
    dc.w $ffc1,$ffe3
    dc.w $ffd1,$ffa3
    dc.w $ffd1,$ffc3
    dc.w $ffd1,$ffe3
    dc.w $ffe1,$ffe3
    dc.w $fff1,$ffc3
    dc.w $fff1,$ffd3
    dc.w $fff1,$fff3
    dc.w $0001,$ffc3
    dc.w $0011,$ffb3

;###############################################
loc_0be2aa:
    dc.w $ffd0,$ffb4
    dc.w $ffd0,$ffd4
    dc.w $ffd0,$fff4
    dc.w $ffd0,$0004
    dc.w $ffe0,$ffc4
    dc.w $ffe0,$ffe4
    dc.w $ffe0,$0004
    dc.w $fff0,$ffc4
    dc.w $0000,$ffe4
    dc.w $0010,$ffe4
    dc.w $0020,$ffd4
    dc.w $ffa0,$fff0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffa0
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ff90
    dc.w $ffd0,$ffa0
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $fff0,$ffa0
    dc.w $0000,$ffc0
    dc.w $0010,$ffb0

;Bison
;###############################################
loc_0be30a:
    dc.w $ff80,$ffb0
    dc.w $ff80,$ffc0
    dc.w $ff90,$ff90
    dc.w $ff90,$ffa0
    dc.w $ff90,$ffb0
    dc.w $ff90,$ffd0
    dc.w $ff90,$ffe0
    dc.w $ffa0,$ff80
    dc.w $ffa0,$ffa0
    dc.w $ffa0,$fff0
    dc.w $ffb0,$ff80
    dc.w $ffb0,$fff0
    dc.w $ffc0,$ffa0
    dc.w $ffc0,$ffb0
    dc.w $ffc0,$ffd0
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $0030,$ff90
    dc.w $0030,$ffe0
    dc.w $0040,$ffa0
    dc.w $0040,$ffd0
    dc.w $0050,$ffb0
    dc.w $0050,$ffc0
    dc.w $0090,$ffb0
    dc.w $0090,$ffc0


;Dhalsim
;###############################################
loc_0be37e:
    dc.w $ff70,$ffb0
    dc.w $ff80,$ffb0
    dc.w $ff90,$ffb0
    dc.w $ffa0,$ffb0
    dc.w $ffb0,$ffb0
    dc.w $ffc0,$ffb0
    dc.w $ffd0,$ffb0
    dc.w $ffe0,$ffb0
    dc.w $fff0,$ffb0
    dc.w $0000,$ffb0
    dc.w $0010,$ffb0
    dc.w $0020,$ffb0
    dc.w $0030,$ffb0
    dc.w $0040,$ffb0
    dc.w $0050,$ffb0
    dc.w $0060,$ffb0
    dc.w $0070,$ffb0
    dc.w $0080,$ffb0

;###############################################
loc_0be3c6:
    dc.w $ff70,$ffb0
    dc.w $ff80,$ffb0
    dc.w $ff90,$ffb0
    dc.w $ffb0,$ffb0
    dc.w $ffd0,$ffb0
    dc.w $ffe0,$ffb0
    dc.w $0000,$ffb0
    dc.w $0010,$ffb0
    dc.w $0040,$ffb0
    dc.w $0050,$ffb0
    dc.w $0060,$ffb0
    dc.w $0080,$ffb0

;###############################################
loc_0be3f6:
    dc.w $ff78,$ffe5
    dc.w $ff88,$ffe5
    dc.w $ff98,$ffe5
    dc.w $ffa8,$ffe5
    dc.w $ffb8,$ffe5
    dc.w $ffc8,$ffe5
    dc.w $ffd8,$ffe5
    dc.w $ffe8,$ffe5
    dc.w $fff8,$ffe5
    dc.w $0008,$ffe5
    dc.w $0018,$ffe5
    dc.w $0028,$ffe5
    dc.w $0038,$ffe5
    dc.w $0048,$ffe5
    dc.w $0058,$ffe5
    dc.w $0068,$ffe5
    dc.w $0078,$ffe5
    dc.w $0088,$ffe5

;###############################################
loc_0be43e:
    dc.w $ff78,$ffe1
    dc.w $ff88,$ffe1
    dc.w $ff98,$ffe1
    dc.w $ffa8,$ffe1
    dc.w $ffe8,$ffe1
    dc.w $0008,$ffe1
    dc.w $0018,$ffe1
    dc.w $0028,$ffe1
    dc.w $0048,$ffe1
    dc.w $0058,$ffe1
    dc.w $0068,$ffe1
    dc.w $0088,$ffe1

;###############################################
loc_0be46e:
    dc.w $ff70,$ffd8
    dc.w $ff80,$ffd8
    dc.w $ff90,$ffd8
    dc.w $ffa0,$ffd8
    dc.w $ffb0,$ffd8
    dc.w $ffc0,$ffd8
    dc.w $ffd0,$ffd8
    dc.w $ffe0,$ffd8
    dc.w $fff0,$ffd8
    dc.w $0000,$ffd8
    dc.w $0010,$ffd8
    dc.w $0020,$ffd8
    dc.w $0030,$ffd8
    dc.w $0040,$ffd8
    dc.w $0050,$ffd8
    dc.w $0060,$ffd8
    dc.w $0070,$ffd8
    dc.w $0080,$ffd8

;###############################################
loc_0be4b6:
    dc.w $ff70,$ffd8
    dc.w $ff80,$ffd8
    dc.w $ff90,$ffd8
    dc.w $ffa0,$ffd8
    dc.w $ffe0,$ffd8
    dc.w $0000,$ffd8
    dc.w $0010,$ffd8
    dc.w $0020,$ffd8
    dc.w $0040,$ffd8
    dc.w $0050,$ffd8
    dc.w $0060,$ffd8
    dc.w $0080,$ffd8

;Rose
;###############################################
loc_0be4e6:
    dc.w $ff19,$ffb6
    dc.w $ff59,$ffb6
    dc.w $ff69,$ffb6
    dc.w $ff79,$ffb6
    dc.w $ff89,$ffb6
    dc.w $ff99,$ffb6
    dc.w $ffb9,$ff96
    dc.w $ffb9,$ffa6
    dc.w $ffc9,$ffb6
    dc.w $ffc9,$fff6
    dc.w $ffd9,$ffc6
    dc.w $ffd9,$ffd6
    dc.w $ffd9,$ffe6
    dc.w $ffe9,$ff96
    dc.w $ffe9,$ffb6
    dc.w $ffe9,$ffc6
    dc.w $fff9,$ff96
    dc.w $fff9,$ffa6
    dc.w $fff9,$ffb6
    dc.w $fff9,$ffc6
    dc.w $0009,$ffa6
    dc.w $0019,$fff6

;Sodom
;###############################################
loc_0be53e:
    dc.w $ffd0,$ffc6
    dc.w $ffd0,$ffd6
    dc.w $ffd0,$fff6
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffc6
    dc.w $ffe0,$fff6
    dc.w $fff0,$ffb6
    dc.w $0000,$fff6
    dc.w $0010,$ffc6
    dc.w $0010,$ffd6
    dc.w $0010,$fff6
    dc.w $ffc1,$ffeb
    dc.w $ffd1,$ffdb
    dc.w $ffe1,$ffcb
    dc.w $fff1,$ffcb
    dc.w $fff1,$ffdb
    dc.w $0001,$fffb

;###############################################
loc_0be586:
    dc.w $ffc0,$ffd6
    dc.w $ffd0,$ffe6
    dc.w $ffd0,$fff6
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffd6
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffc6
    dc.w $fff0,$fff6
    dc.w $0000,$ffc6
    dc.w $0000,$ffd6
    dc.w $0000,$ffe6
    dc.w $0000,$fff6
    dc.w $0010,$ffd6
    dc.w $0020,$fff6
    dc.w $ffbc,$ffe6
    dc.w $ffbc,$fff6
    dc.w $ffcc,$ffd6
    dc.w $ffec,$ffc6
    dc.w $ffec,$ffd6
    dc.w $fffc,$fff6

;###############################################
loc_0be5da:
    dc.w $ffb0,$ff96
    dc.w $ffb0,$ffa6
    dc.w $ffc0,$ff96
    dc.w $ffd0,$ff96
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ffc6
    dc.w $fff0,$ff96
    dc.w $fff0,$ffa6
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffc6
    dc.w $0000,$ff96
    dc.w $0000,$ffa6
    dc.w $0000,$ffb6
    dc.w $0010,$ff96
    dc.w $0010,$ffb6
    dc.w $0010,$ffd6
    dc.w $ffb3,$ff96
    dc.w $ffb3,$ffa6
    dc.w $ffc3,$ffd6
    dc.w $0013,$ff96
    dc.w $0023,$ffc6

;###############################################
loc_0be62e:
    dc.w $ffc0,$ffd7
    dc.w $ffd0,$ffe7
    dc.w $ffe0,$ffa7
    dc.w $ffe0,$ffb7
    dc.w $ffe0,$ffd7
    dc.w $ffe0,$fff7
    dc.w $fff0,$ffb7
    dc.w $fff0,$ffc7
    dc.w $0000,$ffc7
    dc.w $0000,$ffd7
    dc.w $0000,$ffe7
    dc.w $0000,$fff7
    dc.w $0010,$ffd7
    dc.w $0020,$fff7
    dc.w $ffbc,$ffe7
    dc.w $ffbc,$fff7
    dc.w $ffcc,$ffd7
    dc.w $ffec,$ffc7
    dc.w $ffec,$ffd7
    dc.w $fffc,$fff7

;###############################################
loc_0be67e:
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffc6
    dc.w $fff0,$ff96
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffd6
    dc.w $0000,$ff76
    dc.w $0000,$ff96
    dc.w $0020,$ff96
    dc.w $0020,$ffa6
    dc.w $0020,$ffc6
    dc.w $0040,$ff86
    dc.w $ffe6,$ff86
    dc.w $fff6,$ff86
    dc.w $0026,$ff96

;###############################################
loc_0be6ba:
    dc.w $ff90,$ff76
    dc.w $ff90,$ff86
    dc.w $ffb0,$ff76
    dc.w $ffc0,$ff96
    dc.w $ffd0,$ff96
    dc.w $ffe0,$ff76
    dc.w $ffe0,$ffb6
    dc.w $fff0,$ff86
    dc.w $fff0,$ffc6
    dc.w $0000,$ffc6
    dc.w $0010,$ffb6
    dc.w $0020,$ffa6
    dc.w $ff83,$ff86
    dc.w $ff93,$ff76
    dc.w $ffb3,$ff86
    dc.w $ffc3,$ff86

;###############################################
loc_0be6fa:
    dc.w $ffc0,$ff86
    dc.w $ffc0,$ff96
    dc.w $ffd0,$ff96
    dc.w $ffe0,$ff76
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ff96
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $fff0,$ff86
    dc.w $fff0,$ffa6
    dc.w $fff0,$ffd6
    dc.w $0000,$ff86
    dc.w $0000,$ffd6
    dc.w $ffb5,$ff93
    dc.w $ffb5,$ffa3
    dc.w $ffc5,$ff83
    dc.w $ffc5,$ffa3

;###############################################
loc_0be73e:
    dc.w $ffc0,$ff96
    dc.w $ffc0,$ffa6
    dc.w $ffc0,$fff6
    dc.w $ffd0,$ffa6
    dc.w $ffd0,$ffd6
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ff96
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffc6
    dc.w $fff0,$ff96
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffd6
    dc.w $0000,$ff96
    dc.w $0000,$ffb6
    dc.w $0000,$ffc6
    dc.w $0000,$ffe6
    dc.w $0010,$ffe6
    dc.w $ffb5,$ffa3
    dc.w $ffb5,$ffb3
    dc.w $ffc5,$ff93
    dc.w $ffc5,$ffb3

;###############################################
loc_0be796:
    dc.w $ffb0,$ff8c
    dc.w $ffb0,$ff9c
    dc.w $ffc0,$ff9c
    dc.w $ffc0,$ffac
    dc.w $ffc0,$ffcc
    dc.w $ffd0,$ff7c
    dc.w $ffd0,$ff8c
    dc.w $ffd0,$ff9c
    dc.w $ffd0,$ffac
    dc.w $ffd0,$ffbc
    dc.w $ffe0,$ff8c
    dc.w $ffe0,$ffbc
    dc.w $ffe0,$ffdc
    dc.w $fff0,$ff8c
    dc.w $fff0,$ffac
    dc.w $0000,$ffdc
    dc.w $0010,$ffcc
    dc.w $0010,$ffdc
    dc.w $0020,$fffc
    dc.w $ffa5,$ff99
    dc.w $ffa5,$ffa9
    dc.w $ffb5,$ff89
    dc.w $ffb5,$ffa9

;###############################################
loc_0be7f2:
    dc.w $ff90,$ff96
    dc.w $ffa0,$ff96
    dc.w $ffa0,$ffa6
    dc.w $ffb0,$ffa6
    dc.w $ffc0,$ff96
    dc.w $ffc0,$ffd6
    dc.w $ffd0,$ff96
    dc.w $ffd0,$ffc6
    dc.w $ffe0,$ffc6
    dc.w $ffe0,$ffd6
    dc.w $fff0,$ffa6
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffc6
    dc.w $fff0,$ffe6
    dc.w $0000,$ffb6
    dc.w $0000,$ffc6
    dc.w $0010,$ffe6
    dc.w $0020,$fff6
    dc.w $ff8c,$ff6e
    dc.w $ff8c,$ff7e
    dc.w $ff8c,$ff8e
    dc.w $ff9c,$ff8e

;###############################################
loc_0be84a:
    dc.w $ffc0,$ff96
    dc.w $ffc0,$ffa6
    dc.w $ffc0,$fff6
    dc.w $ffd0,$ffa6
    dc.w $ffd0,$ffd6
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ff96
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffc6
    dc.w $fff0,$ff96
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffd6
    dc.w $0000,$ff96
    dc.w $0000,$ffb6
    dc.w $0000,$ffc6
    dc.w $0000,$ffe6
    dc.w $0010,$ffe6
    dc.w $ff93,$ff90
    dc.w $ffb3,$ff90
    dc.w $ffc3,$ff90

;###############################################
loc_0be89e:
    dc.w $ffc0,$ffd6
    dc.w $ffc0,$ffe6
    dc.w $ffd0,$ff96
    dc.w $ffd0,$ffa6
    dc.w $ffd0,$ffc6
    dc.w $ffd0,$ffd6
    dc.w $ffe0,$ffa6
    dc.w $ffe0,$ffb6
    dc.w $ffe0,$ffc6
    dc.w $ffe0,$ffd6
    dc.w $ffe0,$ffe6
    dc.w $fff0,$ff86
    dc.w $fff0,$ffb6
    dc.w $fff0,$ffc6
    dc.w $fff0,$ffd6
    dc.w $fff0,$ffe6
    dc.w $0000,$ffa6
    dc.w $0000,$ffb6
    dc.w $0000,$ffd6
    dc.w $0010,$ff86
    dc.w $0010,$ff96
    dc.w $0010,$ffe6
    dc.w $0010,$fff6
    dc.w $ffc2,$ff87
    dc.w $ffe2,$ff87
    dc.w $fff2,$ff87

;###############################################
loc_0be906:
    dc.w $ffa0,$ffb7
    dc.w $ffa0,$ffd7
    dc.w $ffb0,$ffa7
    dc.w $ffb0,$ffc7
    dc.w $ffc0,$ffa7
    dc.w $ffc0,$ffd7
    dc.w $ffd0,$ffc7
    dc.w $ffe0,$fff7
    dc.w $fff0,$ffb7
    dc.w $0010,$ffd7
    dc.w $0010,$ffe7
    dc.w $ffa0,$ffd3
    dc.w $ffb0,$ffe3
    dc.w $ffc0,$ffe3
    dc.w $ffc0,$fff3
    dc.w $ffd0,$fff3

;###############################################
loc_0be946:
    dc.w $ffa0,$ffb8
    dc.w $ffa0,$ffd8
    dc.w $ffb0,$ffa8
    dc.w $ffb0,$ffc8
    dc.w $ffc0,$ffa8
    dc.w $ffc0,$ffd8
    dc.w $ffd0,$ffc8
    dc.w $ffd0,$ffd8
    dc.w $ffe0,$ffc8
    dc.w $fff0,$ffb8
    dc.w $fff0,$fff8
    dc.w $0000,$ffd8
    dc.w $0000,$ffe8
    dc.w $ffa0,$ffd4
    dc.w $ffb0,$ffe4
    dc.w $ffc0,$ffe4
    dc.w $ffc0,$fff4
    dc.w $ffd0,$fff4

;###############################################
loc_0be98e:
    dc.w $ffa0,$ffb7
    dc.w $ffa0,$ffd7
    dc.w $ffb0,$ffa7
    dc.w $ffb0,$ffc7
    dc.w $ffc0,$ffa7
    dc.w $ffc0,$ffd7
    dc.w $ffd0,$ffc7
    dc.w $ffd0,$ffd7
    dc.w $ffe0,$ffc7
    dc.w $fff0,$ffb7
    dc.w $0010,$ffd7
    dc.w $0010,$ffe7
    dc.w $ffa0,$ffd3
    dc.w $ffb0,$ffe3
    dc.w $ffc0,$ffe3
    dc.w $ffc0,$fff3
    dc.w $ffd0,$fff3

;###############################################
loc_0be9d2:
    dc.w $ffd0,$ff86
    dc.w $ffd0,$fff6
    dc.w $ffe0,$ff86
    dc.w $ffe0,$ff96
    dc.w $ffe0,$ffc6
    dc.w $ffe0,$ffd6
    dc.w $fff0,$ffb6
    dc.w $0000,$ff86
    dc.w $0000,$ffd6
    dc.w $0000,$ffe6
    dc.w $0010,$ffb6
    dc.w $0020,$ffd6
    dc.w $0030,$ffd6
    dc.w $ffe1,$ffa6
    dc.w $fff1,$ffa6
    dc.w $0001,$ffc6
    dc.w $0031,$ffb6
    dc.w $0031,$ffd6

;Rolento
;###############################################
loc_0bea1a:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffd9
    dc.w $ff90,$ffc9
    dc.w $ff90,$ffd9
    dc.w $ff90,$ffe9
    dc.w $ffa0,$ffc9
    dc.w $ffa0,$ffd9
    dc.w $ffa0,$ffe9
    dc.w $ffb0,$ffc9

;###############################################
loc_0bea56:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffc9
    dc.w $ff90,$ffc9
    dc.w $ff90,$ffd9
    dc.w $ffb0,$ffc9

;###############################################
loc_0bea82:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffc9
    dc.w $ff70,$ffd9
    dc.w $ff90,$ffd9
    dc.w $ff90,$ffe9
    dc.w $ffa0,$ffd9
    dc.w $ffc0,$ffd9

;###############################################
loc_0beab6:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffc9
    dc.w $ff70,$ffe9
    dc.w $ff80,$ffc9
    dc.w $ffc0,$ffc9

;###############################################
loc_0beae2:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffc9
    dc.w $ff90,$ffd9
    dc.w $ffa0,$ffe9
    dc.w $ffb0,$ffc9

;###############################################
loc_0beb0e:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffe9
    dc.w $ff80,$ffc9
    dc.w $ffc0,$ffc9
    dc.w $ffc0,$ffe9

;###############################################
loc_0beb3a:
    dc.w $ff98,$ffd3
    dc.w $ffa8,$ffd3
    dc.w $ffa8,$ffe3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$fff3
    dc.w $fff8,$ffe3
    dc.w $0018,$ffd3
    dc.w $ff70,$ffd9
    dc.w $ff80,$ffd9
    dc.w $ff90,$ffd9
    dc.w $ffa0,$ffd9
    dc.w $ffb0,$ffd9
    dc.w $ff98,$ffd3

;###############################################
loc_0beb6e:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffdb
    dc.w $ffc8,$ffcb
    dc.w $ffc8,$ffdb
    dc.w $ffc8,$ffeb
    dc.w $ffd8,$ffcb
    dc.w $ffd8,$ffdb
    dc.w $ffd8,$ffeb
    dc.w $ffe8,$ffcb

;###############################################
loc_0bebb2:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffcb
    dc.w $ffc8,$ffdb
    dc.w $ffd8,$ffeb
    dc.w $ffe8,$ffcb

;###############################################
loc_0bebe6:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffcb
    dc.w $ffa8,$ffdb
    dc.w $ffc8,$ffdb
    dc.w $ffc8,$ffeb
    dc.w $ffd8,$ffdb
    dc.w $fff8,$ffdb

;###############################################
loc_0bec22:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffeb
    dc.w $ffb8,$ffcb
    dc.w $fff8,$ffcb
    dc.w $fff8,$ffeb

;###############################################
loc_0bec56:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffcb
    dc.w $ffc8,$ffcb
    dc.w $ffc8,$ffdb
    dc.w $ffe8,$ffcb

;###############################################
loc_0bec8a:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffcb
    dc.w $ffa8,$ffeb
    dc.w $ffb8,$ffcb
    dc.w $fff8,$ffcb

;###############################################
loc_0becbe:
    dc.w $ffc8,$ffb3
    dc.w $ffc8,$ffd3
    dc.w $ffc8,$ffe3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $0008,$ff93
    dc.w $0008,$ffb3
    dc.w $0008,$ffd3
    dc.w $0018,$ffb3
    dc.w $0018,$ffc3
    dc.w $ffa8,$ffdb
    dc.w $ffb8,$ffdb
    dc.w $ffc8,$ffdb
    dc.w $ffd8,$ffdb
    dc.w $ffe8,$ffdb
    dc.w $ffc8,$ffd3
    dc.w $ffc8,$ffe3

;###############################################
loc_0bed02:
    dc.w $ff75,$ffad
    dc.w $ff95,$ffad
    dc.w $ff95,$ffbd
    dc.w $ffa5,$ffad
    dc.w $ff98,$ffb3
    dc.w $ffa8,$ffc3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $fff8,$ffb3

;###############################################
loc_0bed3e:
    dc.w $ff78,$ffb7
    dc.w $ffa8,$ffb7
    dc.w $ffa8,$ffc7
    dc.w $ffc8,$ffc7
    dc.w $ffa8,$ffb3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3

;###############################################
loc_0bed6e:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffca
    dc.w $ffc1,$ffba
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0beda2:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffba
    dc.w $ffb1,$ffba
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0bedd6:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffba
    dc.w $ffd1,$ffba
    dc.w $ffd1,$ffca
    dc.w $ffe1,$ffba
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0bee12:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffba
    dc.w $ffa1,$ffca
    dc.w $ffc1,$ffba
    dc.w $ffd1,$ffba
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0bee4e:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffb1,$ffba
    dc.w $fff1,$ffca
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0bee82:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffba
    dc.w $ffc1,$ffba
    dc.w $ffc1,$ffca
    dc.w $ffd1,$ffba
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0beebe:
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$ffc3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $ffa1,$ffba
    dc.w $ffd1,$ffba
    dc.w $ffd1,$ffca
    dc.w $fff1,$ffca
    dc.w $ffb8,$ffc3
    dc.w $ffc8,$ffc3

;###############################################
loc_0beefa:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $fff8,$ffe3
    dc.w $ffd1,$ff9e
    dc.w $0001,$ff9e
    dc.w $0001,$ffae
    dc.w $0021,$ffae

;###############################################
loc_0bef26:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ffa0
    dc.w $ffe1,$ff90

;###############################################
loc_0bef52:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ff90
    dc.w $ffd1,$ff90

;###############################################
loc_0bef7e:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ff90
    dc.w $fff1,$ff90
    dc.w $fff1,$ffa0
    dc.w $0001,$ff90

;###############################################
loc_0befb2:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ff90
    dc.w $ffc1,$ffa0
    dc.w $ffe1,$ff90
    dc.w $fff1,$ff90

;###############################################
loc_0befe6:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffd1,$ff90
    dc.w $0011,$ffa0

;###############################################
loc_0bf012:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ff90
    dc.w $ffe1,$ff90
    dc.w $ffe1,$ffa0
    dc.w $fff1,$ff90

;###############################################
loc_0bf046:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffa3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0008,$ffa3
    dc.w $0008,$ffe3
    dc.w $ffc1,$ff90
    dc.w $fff1,$ff90
    dc.w $fff1,$ffa0
    dc.w $0011,$ffa0

;###############################################
loc_0bf07a:
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$ffe3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ff93
    dc.w $ffc8,$ffe3
    dc.w $ffe8,$ffe3
    dc.w $fff8,$ff93
    dc.w $fff8,$ffa3
    dc.w $ffa6,$ff99
    dc.w $ffa6,$ffa9
    dc.w $ffc6,$ff89
    dc.w $ffc6,$ff99
    dc.w $ffd6,$ff99
    dc.w $fff6,$ff99

;###############################################
loc_0bf0b2:
    dc.w $ffa8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffc3
    dc.w $ffd8,$ffc3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffe3
    dc.w $ff73,$ff9c
    dc.w $ff83,$ff9c
    dc.w $ffc3,$ff9c
    dc.w $ffc3,$ffbc

;###############################################
loc_0bf0de:
    dc.w $ff8a,$ffba
    dc.w $ffaa,$ffba
    dc.w $ffaa,$ffca
    dc.w $ffaa,$ffda
    dc.w $ffba,$ffba
    dc.w $ffba,$ffca
    dc.w $ffba,$ffda
    dc.w $ffca,$ffca
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf126:
    dc.w $ff8a,$ffba
    dc.w $ffaa,$ffca
    dc.w $ffaa,$ffda
    dc.w $ffca,$ffba
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf15e:
    dc.w $ff8a,$ffca
    dc.w $ff8a,$ffda
    dc.w $ffaa,$ffba
    dc.w $ffaa,$ffca
    dc.w $ffba,$ffca
    dc.w $ffda,$ffca
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf19e:
    dc.w $ff8a,$ffba
    dc.w $ff8a,$ffda
    dc.w $ff9a,$ffba
    dc.w $ffda,$ffda
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf1d6:
    dc.w $ff8a,$ffba
    dc.w $ffaa,$ffca
    dc.w $ffba,$ffba
    dc.w $ffca,$ffba
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf20e:
    dc.w $ff8a,$ffba
    dc.w $ff9a,$ffba
    dc.w $ffda,$ffba
    dc.w $ffda,$ffda
    dc.w $ffa8,$ffb3
    dc.w $ffa8,$ffd3
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffd3
    dc.w $ffb8,$fff3
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $ffe8,$fff3
    dc.w $fff8,$fff3

;###############################################
loc_0bf246:
    dc.w $ffcb,$ff9b
    dc.w $ffeb,$ff8b
    dc.w $ffc8,$ffc3
    dc.w $ffd8,$ffb3
    dc.w $ffe8,$ff93
    dc.w $ffe8,$ffa3
    dc.w $ffe8,$ffb3
    dc.w $ffe8,$ffd3
    dc.w $fff8,$ffa3
    dc.w $fff8,$ffe3
    dc.w $fff8,$fff3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3
    dc.w $0028,$fff3

;###############################################
loc_0bf27e:
    dc.w $ffe7,$ff8e
    dc.w $fff7,$ff8e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf29a:
    dc.w $ffe7,$ff8e
    dc.w $0017,$ff8e
    dc.w $0017,$ff9e
    dc.w $0027,$ff8e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf2be:
    dc.w $ffe7,$ff8e
    dc.w $ffe7,$ff9e
    dc.w $0007,$ff8e
    dc.w $0017,$ff8e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf2e2:
    dc.w $ffe7,$ff9e
    dc.w $0007,$ff8e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf2fe:
    dc.w $fff7,$ff8e
    dc.w $0037,$ff9e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf31a:
    dc.w $ffe7,$ff8e
    dc.w $0007,$ff8e
    dc.w $0007,$ff9e
    dc.w $0017,$ff8e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf33e:
    dc.w $ffe7,$ff8e
    dc.w $0017,$ff8e
    dc.w $0017,$ff9e
    dc.w $0037,$ff9e
    dc.w $ffc8,$ffb3
    dc.w $ffd8,$ffa3
    dc.w $ffe8,$ffe3
    dc.w $0008,$ff93
    dc.w $0008,$ffb3

;###############################################
loc_0bf362:
    dc.w $ffb8,$ffb3
    dc.w $ffc8,$ffa3
    dc.w $ffd8,$ffa3
    dc.w $0008,$ffa3
    dc.w $0008,$ffb3
    dc.w $ffde,$ffb2
    dc.w $ffee,$ffb2
    dc.w $fff8,$ffb3
    dc.w $fff8,$ffc3
    dc.w $0008,$ffb3

;###############################################
loc_0bf38a:
    dc.w $ff91,$ff96
    dc.w $ff91,$ffa6
    dc.w $ffb1,$ffa6
    dc.w $ffb1,$ffb6
    dc.w $ffc1,$ffa6
    dc.w $ffe1,$ffa6
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf3be:
    dc.w $ff91,$ff96
    dc.w $ff91,$ffb6
    dc.w $ffa1,$ff96
    dc.w $ffe1,$ff96
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf3ea:
    dc.w $ff91,$ffa6
    dc.w $ffb1,$ff96
    dc.w $ffb1,$ffa6
    dc.w $ffb1,$ffb6
    dc.w $ffc1,$ff96
    dc.w $ffc1,$ffa6
    dc.w $ffc1,$ffb6
    dc.w $ffd1,$ff96
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf426:
    dc.w $ff91,$ff96
    dc.w $ffb1,$ffa6
    dc.w $ffc1,$ffb6
    dc.w $ffd1,$ff96
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf452:
    dc.w $ff91,$ffb6
    dc.w $ffa1,$ff96
    dc.w $ffe1,$ff96
    dc.w $ffe1,$ffb6
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf47e:
    dc.w $ff91,$ff96
    dc.w $ffb1,$ff96
    dc.w $ffb1,$ffa6
    dc.w $ffd1,$ff96
    dc.w $ffb8,$ffa3
    dc.w $ffb8,$ffb3
    dc.w $ffb8,$fff3
    dc.w $ffc8,$ffb3
    dc.w $0008,$ffc3
    dc.w $0018,$ffc3
    dc.w $0018,$ffe3

;###############################################
loc_0bf4aa:
    dc.w $ff88,$ffc3
    dc.w $ff98,$ffc3
    dc.w $ff98,$ffd3
    dc.w $ff8c,$ffc2
    dc.w $ff9c,$ffc2
    dc.w $ff9c,$ffd2
    dc.w $ff91,$ffc2
    dc.w $ffa1,$ffc2
    dc.w $ffa1,$ffd2

;###############################################
loc_0bf4ce:
    dc.w $ff80,$ffcb
    dc.w $ff90,$ffcb
    dc.w $ff90,$ffdb
    dc.w $ff84,$ffca
    dc.w $ff94,$ffca
    dc.w $ff94,$ffda
    dc.w $ff88,$ffc8
    dc.w $ff98,$ffc8
    dc.w $ff98,$ffd8

;###############################################
loc_0bf4f2:
    dc.w $ff76,$ff9d
    dc.w $ff76,$ffad
    dc.w $ff7a,$ff9d
    dc.w $ff7a,$ffad
    dc.w $ff7e,$ff9d
    dc.w $ff7e,$ffad

;###############################################
loc_0bf50a:
    dc.w $ff94,$ffc2
    dc.w $ffa4,$ffa2
    dc.w $ffa4,$ffb2
    dc.w $ffb4,$ffb2
    dc.w $ff89,$ff94
    dc.w $ff99,$ffa4
    dc.w $ff99,$ffb4
    dc.w $ffa9,$ffa4
    dc.w $ff87,$ffa1
    dc.w $ff87,$ffc1
    dc.w $ff97,$ffb1
    dc.w $ffa7,$ffa1
    dc.w $ffa7,$ffb1
    dc.w $ffb7,$ffb1

;###############################################
loc_0bf542:
    dc.w $ff94,$ffa2
    dc.w $ffa4,$ffb2
    dc.w $ffa4,$ffc2
    dc.w $ffb4,$ffb2
    dc.w $ff89,$ff94
    dc.w $ff89,$ffb4
    dc.w $ffa9,$ffa4
    dc.w $ffb9,$ff94
    dc.w $ff87,$ffc1
    dc.w $ff97,$ffa1
    dc.w $ff97,$ffb1
    dc.w $ffa7,$ffb1

;###############################################
loc_0bf572:
    dc.w $ff94,$ffa2
    dc.w $ff94,$ffc2
    dc.w $ffb4,$ffb2
    dc.w $ffc4,$ffa2
    dc.w $ff89,$ff94
    dc.w $ff89,$ffb4
    dc.w $ff99,$ffa4
    dc.w $ffa9,$ff94
    dc.w $ffa9,$ffa4
    dc.w $ffb9,$ffa4
    dc.w $ff87,$ffa1
    dc.w $ff97,$ffb1
    dc.w $ff97,$ffc1
    dc.w $ffa7,$ffb1

;###############################################
loc_0bf5aa:
    dc.w $ff94,$ffa2
    dc.w $ff94,$ffc2
    dc.w $ffa4,$ffb2
    dc.w $ffb4,$ffa2
    dc.w $ffb4,$ffb2
    dc.w $ffc4,$ffb2
    dc.w $ff89,$ffb4
    dc.w $ff99,$ff94
    dc.w $ff99,$ffa4
    dc.w $ffa9,$ffa4
    dc.w $ff87,$ffa1
    dc.w $ff87,$ffc1
    dc.w $ffa7,$ffb1
    dc.w $ffb7,$ffa1

;###############################################
loc_0bf5e2:
    dc.w $ffac,$ffa5
    dc.w $ffac,$ffb5
    dc.w $ff9e,$ffa5
    dc.w $ff9e,$ffb5
    dc.w $ffae,$ffb5
    dc.w $ff9f,$ffb2
    dc.w $ff9f,$ffc2
    dc.w $ffaf,$ffb2

;###############################################
loc_0bf602:
    dc.w $ff9c,$ffb2
    dc.w $ff94,$ffb5
    dc.w $ffa0,$ffb3
    dc.w $ffa0,$ffc3

;###############################################
loc_0bf612:
    dc.w $ffaa,$ffaf
    dc.w $ffaa,$ffbf
    dc.w $ffba,$ffaf
    dc.w $ffa0,$ffb3
    dc.w $ffa0,$ffc3
    dc.w $ff9c,$ffb3
    dc.w $ff9c,$ffc3

;###############################################
loc_0bf62e:
    dc.w $ffa4,$ffb2
    dc.w $ffa4,$ffc2
    dc.w $ffa0,$ffb3
    dc.w $ffa0,$ffc3
    dc.w $ff9c,$ffb3
    dc.w $ff9c,$ffc3

;###############################################
loc_0bf646:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $0008,$fffe
    dc.w $0008,$000e
    dc.w $ffe8,$fffe
    dc.w $ffe8,$0006
    dc.w $ffe8,$0016
    dc.w $fff8,$fff6
    dc.w $fff8,$0016

;###############################################
loc_0bf66a:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $0008,$fffe
    dc.w $0008,$000e
    dc.w $ffe8,$fffe
    dc.w $fff3,$fffe

;###############################################
loc_0bf682:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $ffe8,$001e
    dc.w $fff8,$000e
    dc.w $fff8,$001e
    dc.w $0008,$000e
    dc.w $ffe8,$000e
    dc.w $fff8,$fffe
    dc.w $0008,$000e
    dc.w $fff3,$000e
    dc.w $fff3,$001e
    dc.w $0003,$000e

;###############################################
loc_0bf6b2:
    dc.w $ffe8,$0000
    dc.w $ffe8,$0010
    dc.w $ffe8,$0020
    dc.w $fff8,$0010
    dc.w $fff8,$0020
    dc.w $0008,$0020
    dc.w $ffe8,$0011
    dc.w $fff8,$0001
    dc.w $0008,$0011
    dc.w $fff8,$0020
    dc.w $fff8,$0030

;###############################################
loc_0bf6de:
    dc.w $ffe8,$0000
    dc.w $ffe8,$0010
    dc.w $fff8,$0010
    dc.w $fff8,$0020
    dc.w $fff8,$0030
    dc.w $0008,$0010
    dc.w $ffe8,$0010
    dc.w $fff8,$0000
    dc.w $0008,$0010
    dc.w $fff4,$0044
    dc.w $fff4,$0054

;###############################################
loc_0bf70a:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $fff8,$000e
    dc.w $fff8,$001e
    dc.w $fff8,$002e
    dc.w $0008,$000e
    dc.w $ffe8,$000e
    dc.w $fff8,$fffe
    dc.w $0008,$000e
    dc.w $fff4,$0042
    dc.w $fff4,$0052

;###############################################
loc_0bf736:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $fff8,$000e
    dc.w $fff8,$001e
    dc.w $fff8,$002e
    dc.w $0008,$000e
    dc.w $ffe8,$000e
    dc.w $fff8,$fffe
    dc.w $0008,$000e
    dc.w $fff4,$0041
    dc.w $fff4,$0051

;###############################################
loc_0bf762:
    dc.w $ffe8,$0000
    dc.w $ffe8,$0010
    dc.w $ffe8,$0020
    dc.w $fff8,$0010
    dc.w $fff8,$0030
    dc.w $0008,$0010
    dc.w $ffe8,$0010
    dc.w $fff8,$0000
    dc.w $0008,$0010
    dc.w $fff4,$0044
    dc.w $fff4,$0054

;###############################################
loc_0bf78e:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $ffe8,$001e
    dc.w $fff8,$000e
    dc.w $fff8,$002e
    dc.w $0008,$000e
    dc.w $ffe8,$000e
    dc.w $fff8,$fffe
    dc.w $0008,$000e
    dc.w $fff4,$0042
    dc.w $fff4,$0052

;###############################################
loc_0bf7ba:
    dc.w $ffe8,$fffe
    dc.w $ffe8,$000e
    dc.w $ffe8,$001e
    dc.w $fff8,$000e
    dc.w $fff8,$002e
    dc.w $0008,$000e
    dc.w $ffe8,$000e
    dc.w $fff8,$fffe
    dc.w $0008,$000e
    dc.w $fff4,$0041
    dc.w $fff4,$0051

;###############################################
loc_0bf7e6:
    dc.w $ff08,$fff3
    dc.w $ff18,$fff3
    dc.w $ff38,$ffe3
    dc.w $ff68,$ffd3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $fff8,$ffb3
    dc.w $0008,$ffa3

;###############################################
loc_0bf806:
    dc.w $ff08,$fff3
    dc.w $ff38,$ffe3
    dc.w $ff38,$fff3
    dc.w $ff68,$ffd3
    dc.w $ff68,$ffe3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $0008,$ffa3

;###############################################
loc_0bf826:
    dc.w $fef8,$fff3
    dc.w $ff08,$fff3
    dc.w $ff28,$ffe3
    dc.w $ff28,$fff3
    dc.w $ff38,$ffe3
    dc.w $ff58,$ffd3
    dc.w $ffd8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $fff8,$ffb3

;###############################################
loc_0bf84a:
    dc.w $fef8,$fff3
    dc.w $ff28,$ffe3
    dc.w $ff28,$fff3
    dc.w $ff58,$ffd3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $fff8,$ffb3

;###############################################
loc_0bf866:
    dc.w $fee8,$fff3
    dc.w $fef8,$fff3
    dc.w $ff18,$ffe3
    dc.w $ff58,$ffd3
    dc.w $ff58,$ffe3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3

;###############################################
loc_0bf882:
    dc.w $fee8,$fff3
    dc.w $fef8,$fff3
    dc.w $ff18,$ffe3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $fff8,$ffb3
    dc.w $0008,$ffa3

;###############################################
loc_0bf89e:
    dc.w $fed8,$fff3
    dc.w $fee8,$fff3
    dc.w $ff18,$ffe3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $0008,$ffa3

;###############################################
loc_0bf8b6:
    dc.w $fed8,$fff3
    dc.w $fef8,$fff3
    dc.w $ff08,$ffe3
    dc.w $ff08,$fff3
    dc.w $ff48,$ffd3
    dc.w $ff48,$ffe3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3

;###############################################
loc_0bf8d6:
    dc.w $fec8,$fff3
    dc.w $fed8,$fff3
    dc.w $fee8,$fff3
    dc.w $fef8,$fff3
    dc.w $ff08,$ffe3
    dc.w $ff08,$fff3
    dc.w $ff38,$ffd3
    dc.w $ff48,$ffd3
    dc.w $fff8,$ffa3
    dc.w $0008,$ffa3

;###############################################
loc_0bf8fe:
    dc.w $fec8,$fff3
    dc.w $fed8,$fff3
    dc.w $fef8,$ffe3
    dc.w $ff08,$ffe3
    dc.w $ff38,$ffd3
    dc.w $fff8,$ffa3

;###############################################
loc_0bf916:
    dc.w $feb8,$fff3
    dc.w $fec8,$fff3
    dc.w $fef8,$ffe3
    dc.w $fef8,$fff3
    dc.w $ff38,$ffd3
    dc.w $fff8,$ffa3

;###############################################
loc_0bf92e:
    dc.w $feb8,$fff3
    dc.w $fec8,$fff3
    dc.w $fed8,$fff3
    dc.w $fee8,$ffe3
    dc.w $fef8,$ffe3
    dc.w $ff38,$ffd3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $0008,$ffa3

;###############################################
loc_0bf952:
    dc.w $fea8,$fff3
    dc.w $fee8,$ffe3
    dc.w $ff28,$ffd3
    dc.w $ffe8,$ffb3
    dc.w $fff8,$ffa3
    dc.w $0008,$ffa3

;###############################################
loc_0bf96a:
    dc.w $fea8,$fff3
    dc.w $fee8,$ffe3
    dc.w $fee8,$fff3
    dc.w $ff38,$ffd3
    dc.w $ffe8,$ffa3
    dc.w $0008,$ffa3

;Hitsparks
;###############################################
loc_0bf982:
    dc.w $ff70,$ffe0
    dc.w $ff70,$0000
    dc.w $ff80,$ffc0
    dc.w $ff80,$ffd0
    dc.w $ff80,$ffe0
    dc.w $ff80,$0010
    dc.w $ff80,$0020
    dc.w $ff80,$0030
    dc.w $ff90,$ffb0
    dc.w $ff90,$0040
    dc.w $ffa0,$ffa0
    dc.w $ffa0,$0050
    dc.w $ffc0,$ff90
    dc.w $ffc0,$0060
    dc.w $0000,$ff90
    dc.w $0000,$0060
    dc.w $0030,$ffa0
    dc.w $0030,$0050
    dc.w $0050,$ffb0
    dc.w $0050,$0040
    dc.w $0060,$ffc0
    dc.w $0060,$0030
    dc.w $0070,$ffd0
    dc.w $0070,$ffe0
    dc.w $0070,$0010
    dc.w $0070,$0020
    dc.w $0080,$ffe0
    dc.w $0080,$0000

;###############################################
loc_0bf9f2:
    dc.w $ff70,$ffd0
    dc.w $ff70,$0000
    dc.w $ff80,$ffb0
    dc.w $ff80,$ffc0
    dc.w $ff80,$0030
    dc.w $ff80,$0040
    dc.w $ff90,$ffa0
    dc.w $ff90,$0050
    dc.w $ffb0,$ff90
    dc.w $ffb0,$0060
    dc.w $ffe0,$ff80
    dc.w $ffe0,$ff90
    dc.w $ffe0,$0060
    dc.w $ffe0,$0070
    dc.w $0000,$ff80
    dc.w $0000,$0070
    dc.w $0010,$ff90
    dc.w $0010,$0060
    dc.w $0020,$ff90
    dc.w $0020,$0060
    dc.w $0040,$ffa0
    dc.w $0040,$0050
    dc.w $0060,$ffb0
    dc.w $0060,$0040
    dc.w $0070,$ffc0
    dc.w $0070,$0030
    dc.w $0080,$ffd0
    dc.w $0080,$0000

;###############################################
loc_0bfa62:
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0000
    dc.w $ff60,$0010
    dc.w $ff70,$ffc0
    dc.w $ff70,$0010
    dc.w $ff80,$ffb0
    dc.w $ff80,$ffc0
    dc.w $ff80,$0030
    dc.w $ff80,$0040
    dc.w $ff90,$ffa0
    dc.w $ff90,$0050
    dc.w $ffa0,$ff90
    dc.w $ffa0,$0060
    dc.w $ffd0,$ff80
    dc.w $ffd0,$ff90
    dc.w $ffd0,$0060
    dc.w $ffd0,$0070
    dc.w $0000,$ff80
    dc.w $0000,$0070
    dc.w $0020,$ff90
    dc.w $0020,$0060
    dc.w $0030,$ff90
    dc.w $0030,$0060
    dc.w $0050,$ffa0
    dc.w $0050,$0050
    dc.w $0060,$ffb0
    dc.w $0060,$0040
    dc.w $0070,$ffc0
    dc.w $0070,$0030
    dc.w $0080,$ffc0
    dc.w $0080,$0010
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0000
    dc.w $0090,$0010

;###############################################
loc_0bfaf2:
    dc.w $ff60,$ffd0
    dc.w $ff60,$0000
    dc.w $ff70,$ffb0
    dc.w $ff70,$0020
    dc.w $ff80,$ffa0
    dc.w $ff80,$ffb0
    dc.w $ff80,$0040
    dc.w $ff80,$0050
    dc.w $ff90,$ff90
    dc.w $ff90,$0060
    dc.w $ffb0,$ff80
    dc.w $ffb0,$0070
    dc.w $ffc0,$ff80
    dc.w $ffc0,$0070
    dc.w $0000,$ff80
    dc.w $0000,$0070
    dc.w $0040,$ff80
    dc.w $0040,$ff90
    dc.w $0040,$0060
    dc.w $0040,$0070
    dc.w $0060,$ffa0
    dc.w $0060,$0050
    dc.w $0070,$ffb0
    dc.w $0070,$0040
    dc.w $0080,$ffb0
    dc.w $0080,$0020
    dc.w $0090,$ffd0
    dc.w $0090,$0000

;###############################################
loc_0bfb62:
    dc.w $ff50,$ffe0
    dc.w $ff50,$0000
    dc.w $ff60,$ffc0
    dc.w $ff60,$0010
    dc.w $ff70,$ffa0
    dc.w $ff70,$ffb0
    dc.w $ff70,$0030
    dc.w $ff70,$0050
    dc.w $ff80,$ffa0
    dc.w $ff80,$0050
    dc.w $ff90,$ff90
    dc.w $ff90,$ffa0
    dc.w $ff90,$0050
    dc.w $ff90,$0060
    dc.w $ffa0,$ff80
    dc.w $ffa0,$0070
    dc.w $ffb0,$ff80
    dc.w $ffb0,$0070
    dc.w $ffd0,$ff70
    dc.w $ffd0,$0080
    dc.w $ffe0,$ff70
    dc.w $ffe0,$0080
    dc.w $0000,$ff70
    dc.w $0000,$0080
    dc.w $0020,$ff70
    dc.w $0020,$ff80
    dc.w $0020,$0070
    dc.w $0020,$0080
    dc.w $0050,$ff80
    dc.w $0050,$ff90
    dc.w $0050,$0060
    dc.w $0050,$0070
    dc.w $0060,$ffa0
    dc.w $0060,$0050
    dc.w $0070,$ffa0
    dc.w $0070,$0050
    dc.w $0080,$ffa0
    dc.w $0080,$ffb0
    dc.w $0080,$0030
    dc.w $0080,$0050
    dc.w $0090,$ffc0
    dc.w $0090,$0010
    dc.w $00a0,$ffe0
    dc.w $00a0,$0000

;###############################################
loc_0bfc12:
    dc.w $ff50,$ffe0
    dc.w $ff50,$0000
    dc.w $ff60,$ffc0
    dc.w $ff60,$0020
    dc.w $ff70,$ffb0
    dc.w $ff70,$ffc0
    dc.w $ff70,$0030
    dc.w $ff70,$0040
    dc.w $ff80,$ffa0
    dc.w $ff80,$0050
    dc.w $ff90,$ff90
    dc.w $ff90,$0060
    dc.w $ffa0,$ff80
    dc.w $ffa0,$0070
    dc.w $ffd0,$ff70
    dc.w $ffd0,$0080
    dc.w $0000,$ff70
    dc.w $0000,$0080
    dc.w $0020,$ff80
    dc.w $0020,$0070
    dc.w $0050,$ff90
    dc.w $0050,$0060
    dc.w $0070,$ffa0
    dc.w $0070,$0050
    dc.w $0080,$ffb0
    dc.w $0080,$ffc0
    dc.w $0080,$0030
    dc.w $0080,$0040
    dc.w $0090,$ffc0
    dc.w $0090,$0020
    dc.w $00a0,$ffe0
    dc.w $00a0,$0000

;###############################################
loc_0bfc92:
    dc.w $ff40,$ffe8
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff50,$ffe8
    dc.w $ff50,$fff8
    dc.w $ff50,$0008
    dc.w $ff60,$ffe8
    dc.w $ff60,$fff8
    dc.w $ff60,$0008
    dc.w $ff70,$ffe8
    dc.w $ff70,$fff8
    dc.w $ff70,$0008
    dc.w $ff80,$ffe8
    dc.w $ff80,$fff8
    dc.w $ff80,$0008
    dc.w $ff90,$ffe8
    dc.w $ff90,$fff8
    dc.w $ff90,$0008
    dc.w $ffa0,$ffe8
    dc.w $ffa0,$fff8
    dc.w $ffa0,$0008
    dc.w $ffb0,$ffe8
    dc.w $ffb0,$fff8
    dc.w $ffb0,$0008
    dc.w $ffc0,$ffe8
    dc.w $ffc0,$fff8
    dc.w $ffc0,$0008
    dc.w $ffd0,$ffe8
    dc.w $ffd0,$fff8
    dc.w $ffd0,$0008
    dc.w $ffe0,$ffe8
    dc.w $ffe0,$fff8
    dc.w $ffe0,$0008
    dc.w $fff0,$ffe8
    dc.w $fff0,$fff8
    dc.w $fff0,$0008
    dc.w $0000,$ffe8
    dc.w $0000,$fff8
    dc.w $0000,$0008
    dc.w $0010,$ffe8
    dc.w $0010,$fff8
    dc.w $0010,$0008
    dc.w $0020,$ffe8
    dc.w $0020,$fff8
    dc.w $0020,$0008
    dc.w $0030,$ffe8
    dc.w $0030,$fff8
    dc.w $0030,$0008
    dc.w $0040,$ffe8
    dc.w $0040,$fff8
    dc.w $0040,$0008
    dc.w $0050,$ffe8
    dc.w $0050,$fff8
    dc.w $0050,$0008
    dc.w $0060,$ffe8
    dc.w $0060,$fff8
    dc.w $0060,$0008
    dc.w $0070,$ffe8
    dc.w $0070,$fff8
    dc.w $0070,$0008
    dc.w $0080,$ffe8
    dc.w $0080,$fff8
    dc.w $0080,$0008
    dc.w $0090,$ffe8
    dc.w $0090,$fff8
    dc.w $0090,$0008
    dc.w $00a0,$ffe8
    dc.w $00a0,$fff8
    dc.w $00a0,$0008
    dc.w $00b0,$ffe8
    dc.w $00b0,$fff8
    dc.w $00b0,$0008

;###############################################
loc_0bfdb2:
    dc.w $ff40,$fff8
    dc.w $ff50,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $ffc0,$fff8
    dc.w $ffd0,$fff8
    dc.w $ffe0,$fff8
    dc.w $fff0,$fff8
    dc.w $0000,$fff8
    dc.w $0010,$fff8
    dc.w $0020,$fff8
    dc.w $0030,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00a0,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0bfe12:
    dc.w $ff40,$fff8
    dc.w $ff70,$fff8
    dc.w $ffa0,$ffe8
    dc.w $0050,$0008
    dc.w $0070,$fff8

;###############################################
loc_0bfe26:
    dc.w $ff40,$fff8
    dc.w $ff70,$fff8
    dc.w $ff90,$0008
    dc.w $ffa0,$ffe8
    dc.w $ffe0,$ffe8
    dc.w $ffe0,$0008
    dc.w $0030,$fff8
    dc.w $0050,$fff8
    dc.w $0050,$0008
    dc.w $0080,$ffe8
    dc.w $00b0,$fff8

;###############################################
loc_0bfe52:
    dc.w $ff50,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$0008
    dc.w $ffa0,$ffe8
    dc.w $ffb0,$fff8
    dc.w $ffd0,$fff8
    dc.w $ffe0,$ffe8
    dc.w $ffe0,$0018
    dc.w $fff0,$fff8
    dc.w $0050,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$ffe8
    dc.w $00b0,$fff8

;###############################################
loc_0bfe86:
    dc.w $ff90,$fff8
    dc.w $ffa0,$ffe8
    dc.w $ffb0,$fff8
    dc.w $ffd0,$fff8
    dc.w $0080,$ffe8
    dc.w $0090,$fff8

;###############################################
loc_0bfe9e:
    dc.w $ff30,$ff60
    dc.w $ff50,$ff70
    dc.w $ff60,$ff80
    dc.w $ff60,$ff90
    dc.w $ff70,$ff80
    dc.w $ff70,$ffa0
    dc.w $ff80,$ffa0
    dc.w $ff90,$ffa0
    dc.w $ff90,$ffb0
    dc.w $ffa0,$ffb0
    dc.w $ffc0,$0020
    dc.w $ffd0,$ff80
    dc.w $ffd0,$ffa0
    dc.w $ffd0,$ffd0
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$0010
    dc.w $ffe0,$ff90
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$0000
    dc.w $fff0,$ffc0
    dc.w $fff0,$ffd0
    dc.w $fff0,$fff0
    dc.w $0000,$0000
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0010,$0050
    dc.w $0010,$0060
    dc.w $0020,$ffd0
    dc.w $0020,$0010
    dc.w $0020,$0020
    dc.w $0020,$0050
    dc.w $0020,$0060
    dc.w $0050,$0040
    dc.w $0060,$0040
    dc.w $0060,$0050
    dc.w $0070,$0050
    dc.w $0070,$0060
    dc.w $0080,$0050
    dc.w $0080,$0070
    dc.w $0090,$0070
    dc.w $00a0,$0070
    dc.w $00b0,$0080

;###############################################
loc_0bff6a:
    dc.w $ff60,$ff80
    dc.w $ff60,$ff90
    dc.w $ff70,$ff80
    dc.w $ff70,$ffa0
    dc.w $ff80,$ffa0
    dc.w $ff90,$ffa0
    dc.w $ff90,$ffb0
    dc.w $ff90,$0050
    dc.w $ffa0,$ffb0
    dc.w $ffa0,$ffc0
    dc.w $ffa0,$0040
    dc.w $ffb0,$ffc0
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$0030
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$0020
    dc.w $ffd0,$ff90
    dc.w $ffd0,$ffa0
    dc.w $ffd0,$ffd0
    dc.w $ffd0,$0010
    dc.w $ffd0,$0020
    dc.w $ffe0,$ff90
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0000
    dc.w $fff0,$ff70
    dc.w $0000,$fff0
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0010,$0050
    dc.w $0010,$0060
    dc.w $0020,$ffd0
    dc.w $0020,$0020
    dc.w $0020,$0050
    dc.w $0020,$0060
    dc.w $0030,$ffc0
    dc.w $0030,$ffd0
    dc.w $0030,$0020
    dc.w $0040,$ffb0
    dc.w $0040,$0020
    dc.w $0040,$0030
    dc.w $0050,$ffa0
    dc.w $0050,$0030
    dc.w $0050,$0040
    dc.w $0060,$0040
    dc.w $0060,$0050
    dc.w $0070,$0050
    dc.w $0070,$0060
    dc.w $0080,$0050
    dc.w $0080,$0070
    dc.w $0090,$0070

;###############################################
loc_0c004e:
    dc.w $ff30,$ffa0
    dc.w $ff40,$ffa0
    dc.w $ff60,$fff0
    dc.w $ff70,$ffb0
    dc.w $ff70,$ffc0
    dc.w $ff80,$ffb0
    dc.w $ff80,$fff0
    dc.w $ff90,$ffa0
    dc.w $ff90,$ffb0
    dc.w $ff90,$ffd0
    dc.w $ff90,$0050
    dc.w $ffa0,$ffb0
    dc.w $ffa0,$ffc0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0040
    dc.w $ffb0,$ffc0
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$0030
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0020
    dc.w $ffd0,$ffa0
    dc.w $ffd0,$ffd0
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0010
    dc.w $ffd0,$0020
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$0000
    dc.w $ffe0,$0010
    dc.w $fff0,$ffa0
    dc.w $0000,$fff0
    dc.w $0000,$0000
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0010,$0050
    dc.w $0020,$ffd0
    dc.w $0020,$ffe0
    dc.w $0020,$0000
    dc.w $0020,$0010
    dc.w $0020,$0020
    dc.w $0020,$0050
    dc.w $0030,$ffc0
    dc.w $0030,$ffd0
    dc.w $0030,$0000
    dc.w $0030,$0020
    dc.w $0040,$ffb0
    dc.w $0040,$0020
    dc.w $0040,$0030
    dc.w $0050,$ffa0
    dc.w $0050,$0020
    dc.w $0050,$0040
    dc.w $0060,$0000
    dc.w $0060,$0020
    dc.w $0060,$0030
    dc.w $0060,$0040
    dc.w $0060,$0050
    dc.w $0070,$0040
    dc.w $0080,$0000
    dc.w $0080,$0040
    dc.w $0090,$0040
    dc.w $00c0,$0050

;###############################################
loc_0c0166:
    dc.w $ff30,$0000
    dc.w $ff60,$fff0
    dc.w $ff70,$ffb0
    dc.w $ff70,$ffc0
    dc.w $ff80,$ffb0
    dc.w $ff80,$fff0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffc0
    dc.w $ffa0,$ffd0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0000
    dc.w $ffb0,$ffe0
    dc.w $ffb0,$0030
    dc.w $ffc0,$ffc0
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0020
    dc.w $ffd0,$ffd0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffd0,$0020
    dc.w $ffe0,$ffa0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0010
    dc.w $fff0,$ffc0
    dc.w $fff0,$ffd0
    dc.w $0000,$fff0
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0000
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0010,$0050
    dc.w $0020,$ffd0
    dc.w $0020,$ffe0
    dc.w $0020,$0000
    dc.w $0020,$0020
    dc.w $0030,$ffc0
    dc.w $0030,$ffd0
    dc.w $0030,$fff0
    dc.w $0030,$0000
    dc.w $0030,$0020
    dc.w $0040,$0010
    dc.w $0040,$0020
    dc.w $0050,$0030
    dc.w $0060,$fff0
    dc.w $0060,$0000
    dc.w $0060,$0020
    dc.w $0060,$0030
    dc.w $0070,$0040
    dc.w $0080,$0000
    dc.w $0080,$0040

;###############################################
loc_0c025e:
    dc.w $ff30,$0010
    dc.w $ff50,$0000
    dc.w $ff60,$0000
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$0000
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0000
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffc0,$fff0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0010
    dc.w $fff0,$ffc0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $fff0,$fff0
    dc.w $fff0,$0000
    dc.w $0000,$fff0
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0020,$0000
    dc.w $0030,$0000
    dc.w $0030,$0010
    dc.w $0040,$0010
    dc.w $0040,$0020
    dc.w $0050,$fff0
    dc.w $0060,$fff0
    dc.w $0070,$ffe0
    dc.w $00a0,$ffe0
    dc.w $00a0,$fff0

;###############################################
loc_0c0316:
    dc.w $ff30,$0010
    dc.w $ff50,$0000
    dc.w $ff60,$0000
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff80,$0030
    dc.w $ff90,$0000
    dc.w $ff90,$0020
    dc.w $ffa0,$0000
    dc.w $ffb0,$0010
    dc.w $ffb0,$0030
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0000
    dc.w $ffc0,$0070
    dc.w $ffc0,$0080
    dc.w $ffc0,$0090
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffd0,$0040
    dc.w $ffd0,$0050
    dc.w $ffd0,$0060
    dc.w $ffd0,$0090
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0030
    dc.w $ffe0,$0040
    dc.w $fff0,$ffc0
    dc.w $fff0,$ffd0
    dc.w $0000,$fff0
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ff80
    dc.w $0010,$ff90
    dc.w $0010,$ffa0
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0010,$0030
    dc.w $0020,$ff60
    dc.w $0020,$ff70
    dc.w $0020,$ffb0
    dc.w $0030,$ff60
    dc.w $0030,$ff80
    dc.w $0030,$fff0
    dc.w $0040,$fff0
    dc.w $0060,$fff0
    dc.w $0070,$ffe0
    dc.w $0070,$0010
    dc.w $00a0,$ffe0
    dc.w $00a0,$fff0

;###############################################
loc_0c03f2:
    dc.w $ff60,$0000
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$0000
    dc.w $ffa0,$0000
    dc.w $ffb0,$0010
    dc.w $ffc0,$0000
    dc.w $ffc0,$0070
    dc.w $ffc0,$0080
    dc.w $ffc0,$0090
    dc.w $ffd0,$0000
    dc.w $ffd0,$0040
    dc.w $ffd0,$0050
    dc.w $ffd0,$0060
    dc.w $ffd0,$0090
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0020
    dc.w $ffe0,$0030
    dc.w $ffe0,$0040
    dc.w $fff0,$ffc0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $fff0,$0020
    dc.w $fff0,$0030
    dc.w $0000,$ffc0
    dc.w $0000,$ffd0
    dc.w $0000,$0020
    dc.w $0000,$0030
    dc.w $0010,$ff80
    dc.w $0010,$ff90
    dc.w $0010,$ffa0
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $0010,$ffd0
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $0020,$ff60
    dc.w $0020,$ff70
    dc.w $0020,$ffb0
    dc.w $0020,$fff0
    dc.w $0020,$0000
    dc.w $0030,$ff60
    dc.w $0030,$ff80
    dc.w $0030,$fff0
    dc.w $0040,$fff0
    dc.w $0060,$fff0
    dc.w $0070,$ffe0

;###############################################
loc_0c04b6:
    dc.w $ff90,$0000
    dc.w $ff90,$0080
    dc.w $ffa0,$0000
    dc.w $ffa0,$0060
    dc.w $ffa0,$0070
    dc.w $ffb0,$0050
    dc.w $ffc0,$0000
    dc.w $ffc0,$0040
    dc.w $ffd0,$0000
    dc.w $ffd0,$0040
    dc.w $ffd0,$0050
    dc.w $ffd0,$0060
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$0000
    dc.w $ffe0,$0020
    dc.w $ffe0,$0030
    dc.w $ffe0,$0040
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $fff0,$fff0
    dc.w $fff0,$0010
    dc.w $fff0,$0020
    dc.w $fff0,$0030
    dc.w $0000,$ffc0
    dc.w $0000,$ffd0
    dc.w $0000,$ffe0
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0010,$ff90
    dc.w $0010,$ffa0
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $0010,$ffd0
    dc.w $0010,$fff0
    dc.w $0010,$0020
    dc.w $0020,$ffb0
    dc.w $0020,$fff0
    dc.w $0030,$ff90
    dc.w $0030,$ffb0
    dc.w $0030,$fff0
    dc.w $0040,$ff80
    dc.w $0040,$fff0
    dc.w $0050,$ff70
    dc.w $0050,$ff90
    dc.w $0060,$fff0

;###############################################
loc_0c056a:
    dc.w $ff30,$0030
    dc.w $ff30,$0040
    dc.w $ff40,$0040
    dc.w $ff60,$0020
    dc.w $ff70,$0030
    dc.w $ff90,$0010
    dc.w $ffa0,$0010
    dc.w $ffa0,$0020
    dc.w $ffc0,$0000
    dc.w $ffc0,$0040
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffd0,$0020
    dc.w $ffd0,$0030
    dc.w $ffe0,$0000
    dc.w $ffe0,$0010
    dc.w $ffe0,$0020
    dc.w $ffe0,$0030
    dc.w $ffe0,$0070
    dc.w $fff0,$ffe0
    dc.w $fff0,$fff0
    dc.w $fff0,$0020
    dc.w $fff0,$0040
    dc.w $fff0,$0050
    dc.w $0000,$ff60
    dc.w $0000,$ff90
    dc.w $0000,$ffb0
    dc.w $0000,$ffd0
    dc.w $0000,$ffe0
    dc.w $0000,$0010
    dc.w $0010,$ffc0
    dc.w $0010,$ffd0
    dc.w $0010,$fff0
    dc.w $0020,$ffb0
    dc.w $0020,$ffd0
    dc.w $0020,$ffe0
    dc.w $0020,$fff0
    dc.w $0030,$ffb0
    dc.w $0030,$ffe0
    dc.w $0030,$fff0
    dc.w $0050,$ffd0
    dc.w $0060,$ffd0
    dc.w $0060,$ffe0
    dc.w $0080,$ffc0
    dc.w $0090,$ffc0
    dc.w $00b0,$ffb0
    dc.w $00c0,$ffb0

;###############################################
loc_0c0626:
    dc.w $fff0,$ff00
    dc.w $0000,$ff10
    dc.w $0010,$ff00
    dc.w $0010,$ff20
    dc.w $0020,$ff10
    dc.w $0020,$ff30
    dc.w $0030,$ff20
    dc.w $0030,$ff40
    dc.w $0040,$ff20
    dc.w $0040,$ff30
    dc.w $0040,$ff50
    dc.w $0050,$ff20
    dc.w $0050,$ff30
    dc.w $0050,$ff40
    dc.w $0050,$ff60
    dc.w $0060,$ff40
    dc.w $0060,$ff50
    dc.w $0060,$ff70
    dc.w $0070,$ff50
    dc.w $0070,$ff60
    dc.w $0070,$ff80
    dc.w $0080,$ff60
    dc.w $0080,$ff70
    dc.w $0080,$ff90
    dc.w $0090,$ff70
    dc.w $0090,$ff80
    dc.w $0090,$ffa0
    dc.w $00a0,$ff70
    dc.w $00a0,$ff80
    dc.w $00a0,$ff90
    dc.w $00a0,$ffb0
    dc.w $00b0,$ff80
    dc.w $00b0,$ff90
    dc.w $00b0,$ffa0
    dc.w $00b0,$ffc0
    dc.w $00c0,$ff90
    dc.w $00c0,$ffa0
    dc.w $00c0,$ffb0
    dc.w $00c0,$ffd0
    dc.w $00d0,$ffa0
    dc.w $00d0,$ffb0
    dc.w $00d0,$ffc0
    dc.w $00d0,$ffe0
    dc.w $00e0,$ffb0
    dc.w $00e0,$ffc0
    dc.w $00e0,$ffd0
    dc.w $00e0,$fff0
    dc.w $00f0,$ffb0
    dc.w $00f0,$ffc0
    dc.w $00f0,$ffd0
    dc.w $00f0,$ffe0
    dc.w $0100,$ffb0
    dc.w $0100,$ffc0
    dc.w $0100,$ffd0
    dc.w $0100,$ffe0
    dc.w $0100,$fff0
    dc.w $0110,$ffd0
    dc.w $0110,$ffe0
    dc.w $0110,$fff0
    dc.w $0120,$ffe0
    dc.w $0120,$fff0
    dc.w $0130,$fff0

;###############################################
loc_0c071e:
    dc.w $fff0,$ff00
    dc.w $fff0,$fff0
    dc.w $0000,$ff00
    dc.w $0010,$ff10
    dc.w $0010,$fff0
    dc.w $0020,$ff00
    dc.w $0030,$ff20
    dc.w $0040,$ff20
    dc.w $0050,$ff10
    dc.w $0050,$ff30
    dc.w $0050,$0000
    dc.w $0060,$ff20
    dc.w $0060,$ff30
    dc.w $0070,$ff20
    dc.w $0080,$ff30
    dc.w $0080,$ff40
    dc.w $0090,$ff30
    dc.w $00a0,$ff30
    dc.w $00a0,$ff40
    dc.w $00a0,$ff50
    dc.w $00b0,$ff40
    dc.w $00c0,$ff40
    dc.w $00c0,$ff60
    dc.w $00d0,$ff40
    dc.w $00d0,$ff50
    dc.w $00e0,$ff40
    dc.w $00e0,$ff50
    dc.w $00e0,$ff70
    dc.w $00f0,$ff50
    dc.w $00f0,$ff60
    dc.w $0100,$ff50
    dc.w $0100,$ff60
    dc.w $0100,$ff80
    dc.w $0110,$ff50
    dc.w $0110,$ff60
    dc.w $0110,$ff70
    dc.w $0120,$ff60
    dc.w $0120,$ff70
    dc.w $0120,$ff90
    dc.w $0130,$ff60
    dc.w $0130,$ff70
    dc.w $0130,$ff80
    dc.w $0140,$ff60
    dc.w $0140,$ff70
    dc.w $0140,$ff80
    dc.w $0140,$ffa0
    dc.w $0150,$ff70
    dc.w $0150,$ff80
    dc.w $0150,$ff90
    dc.w $0150,$ffa0
    dc.w $0160,$ff70
    dc.w $0160,$ff80
    dc.w $0160,$ff90
    dc.w $0170,$ff70
    dc.w $0170,$ff80
    dc.w $0170,$ff90
    dc.w $0170,$ffa0
    dc.w $0170,$ffb0

;###############################################
loc_0c0806:
    dc.w $fff0,$ff00
    dc.w $0010,$ff00
    dc.w $0030,$ff20
    dc.w $0040,$0000
    dc.w $0050,$ff10
    dc.w $0050,$ff30
    dc.w $0050,$0000
    dc.w $0060,$ff20
    dc.w $0060,$ff30
    dc.w $0070,$ff20
    dc.w $0070,$0000
    dc.w $0080,$ff30
    dc.w $0080,$ff40
    dc.w $0090,$ff30
    dc.w $00a0,$ff30
    dc.w $00a0,$ff50
    dc.w $00b0,$ff40
    dc.w $00c0,$ff40
    dc.w $00c0,$ff60
    dc.w $00d0,$ff40
    dc.w $00d0,$ff50
    dc.w $00e0,$ff40
    dc.w $00e0,$ff50
    dc.w $00e0,$ff70
    dc.w $00e0,$0000
    dc.w $00f0,$ff50
    dc.w $00f0,$ff60
    dc.w $0100,$ff50
    dc.w $0100,$ff60
    dc.w $0100,$ff80
    dc.w $0110,$ff40
    dc.w $0110,$ff50
    dc.w $0110,$ff60
    dc.w $0110,$ff70
    dc.w $0110,$0000
    dc.w $0120,$ff60
    dc.w $0120,$ff70
    dc.w $0120,$ff90
    dc.w $0130,$ff60
    dc.w $0130,$ff70
    dc.w $0130,$ff80
    dc.w $0140,$ff50
    dc.w $0140,$ff60
    dc.w $0140,$ff70
    dc.w $0140,$ff80
    dc.w $0140,$ffa0
    dc.w $0150,$ff70
    dc.w $0150,$ff80
    dc.w $0150,$ff90
    dc.w $0150,$ffa0
    dc.w $0160,$ff70
    dc.w $0160,$ff80
    dc.w $0160,$ff90
    dc.w $0170,$ff70
    dc.w $0170,$ff80
    dc.w $0170,$ff90
    dc.w $0170,$ffa0
    dc.w $0170,$ffb0

;###############################################
loc_0c08ee:
    dc.w $fff0,$ff00
    dc.w $0010,$ff00
    dc.w $0030,$ff20
    dc.w $0050,$ff10
    dc.w $0050,$ff30
    dc.w $0060,$ff20
    dc.w $0060,$ff30
    dc.w $0070,$ff20
    dc.w $0080,$ff30
    dc.w $0080,$ff40
    dc.w $0090,$ff30
    dc.w $00a0,$ff30
    dc.w $00a0,$ff50
    dc.w $00b0,$ff40
    dc.w $00c0,$ff40
    dc.w $00c0,$ff60
    dc.w $00d0,$ff40
    dc.w $00d0,$ff50
    dc.w $00e0,$ff40
    dc.w $00e0,$ff50
    dc.w $00e0,$ff70
    dc.w $00f0,$ff50
    dc.w $00f0,$ff60
    dc.w $0100,$ff50
    dc.w $0100,$ff60
    dc.w $0100,$ff80
    dc.w $0110,$ff40
    dc.w $0110,$ff50
    dc.w $0110,$ff60
    dc.w $0110,$ff70
    dc.w $0120,$ff60
    dc.w $0120,$ff70
    dc.w $0120,$ff90
    dc.w $0130,$ff60
    dc.w $0130,$ff70
    dc.w $0130,$ff80
    dc.w $0140,$ff60
    dc.w $0140,$ff70
    dc.w $0140,$ff80
    dc.w $0140,$ffa0
    dc.w $0150,$ff70
    dc.w $0150,$ff80
    dc.w $0150,$ff90
    dc.w $0160,$ff70
    dc.w $0160,$ff80
    dc.w $0160,$ff90
    dc.w $0170,$ff70
    dc.w $0170,$ff80
    dc.w $0170,$ff90
    dc.w $0170,$ffa0
    dc.w $0170,$ffb0

;Karin
;###############################################
loc_0c09ba:
    dc.w $ffb6,$ffb1
    dc.w $ffc6,$ffc1
    dc.w $ffc6,$ffe1
    dc.w $ffc6,$fff1
    dc.w $ffd6,$ffd1
    dc.w $ffe6,$ff91
    dc.w $ffe6,$ffa1
    dc.w $ffe6,$ffc1
    dc.w $fff6,$ffb1
    dc.w $fff6,$ffc1
    dc.w $0006,$ffa1
    dc.w $0016,$ffb1
    dc.w $0016,$ffc1
    dc.w $0026,$fff1
    dc.w $0036,$ffe1
    dc.w $ffcb,$ff97
    dc.w $ffcb,$ffa7

;###############################################
loc_0c09fe:
    dc.w $ffb6,$ffb2
    dc.w $ffc6,$ffc2
    dc.w $ffd6,$fff2
    dc.w $ffe6,$ff92
    dc.w $ffe6,$ffa2
    dc.w $ffe6,$ffc2
    dc.w $ffe6,$ffd2
    dc.w $fff6,$ffb2
    dc.w $fff6,$ffc2
    dc.w $0006,$ffa2
    dc.w $0016,$ffb2
    dc.w $0016,$ffc2
    dc.w $0016,$fff2
    dc.w $0026,$ffe2
    dc.w $ffcb,$ff98
    dc.w $ffcb,$ffa8

;###############################################
loc_0c0a3e:
    dc.w $ffb6,$ffb3
    dc.w $ffc6,$ffc3
    dc.w $ffe6,$ff93
    dc.w $ffe6,$ffa3
    dc.w $ffe6,$ffc3
    dc.w $ffe6,$ffd3
    dc.w $fff6,$ffb3
    dc.w $fff6,$ffc3
    dc.w $0006,$ffa3
    dc.w $0016,$ffb3
    dc.w $0016,$ffc3
    dc.w $ffcb,$ff99
    dc.w $ffcb,$ffa9

;###############################################
loc_0c0a72:
    dc.w $ffb6,$ffb2
    dc.w $ffc6,$ffc2
    dc.w $ffe6,$ff92
    dc.w $ffe6,$ffa2
    dc.w $ffe6,$ffc2
    dc.w $ffe6,$ffd2
    dc.w $ffe6,$fff2
    dc.w $fff6,$ffb2
    dc.w $fff6,$ffc2
    dc.w $fff6,$ffe2
    dc.w $0006,$ffa2
    dc.w $0016,$ffb2
    dc.w $0016,$ffc2
    dc.w $ffcb,$ff98
    dc.w $ffcb,$ffa8

;###############################################
loc_0c0aae:
    dc.w $ffb6,$ffb1
    dc.w $ffc6,$ffc1
    dc.w $ffd6,$fff1
    dc.w $ffe6,$ff91
    dc.w $ffe6,$ffa1
    dc.w $ffe6,$ffc1
    dc.w $ffe6,$ffd1
    dc.w $fff6,$ffb1
    dc.w $fff6,$ffc1
    dc.w $0006,$ffa1
    dc.w $0016,$ffb1
    dc.w $0016,$ffc1
    dc.w $0016,$fff1
    dc.w $0026,$ffe1
    dc.w $ffcb,$ff97
    dc.w $ffcb,$ffa7

;###############################################
loc_0c0aee:
    dc.w $ffa5,$ffb4
    dc.w $ffa5,$ffc4
    dc.w $ffb5,$ffb4
    dc.w $ffd5,$ffd4
    dc.w $ffd5,$fff4
    dc.w $ffe5,$ffa4
    dc.w $0015,$ffb4
    dc.w $0015,$ffc4
    dc.w $0015,$ffd4
    dc.w $0025,$ffe4
    dc.w $ffba,$ffa0
    dc.w $ffba,$ffb0

;###############################################
loc_0c0b1e:
    dc.w $ffa5,$ffbc
    dc.w $ffa5,$ffcc
    dc.w $ffb5,$ffbc
    dc.w $ffd5,$ffdc
    dc.w $ffd5,$fffc
    dc.w $ffe5,$ffac
    dc.w $ffe5,$fffc
    dc.w $0005,$fffc
    dc.w $0015,$ffbc
    dc.w $0015,$ffcc
    dc.w $0015,$ffdc
    dc.w $0015,$ffec
    dc.w $ffba,$ffa8
    dc.w $ffba,$ffb8

;###############################################
loc_0c0b56:
    dc.w $ffc6,$ffc1
    dc.w $ffc6,$ffe1
    dc.w $ffc6,$fff1
    dc.w $ffd6,$ffb1
    dc.w $ffd6,$ffd1
    dc.w $ffe6,$ff91
    dc.w $ffe6,$ffa1
    dc.w $ffe6,$ffc1
    dc.w $0006,$ffa1
    dc.w $0006,$ffb1
    dc.w $0016,$ffb1
    dc.w $0016,$ffc1
    dc.w $0026,$fff1
    dc.w $0036,$ffe1
    dc.w $ffc6,$ffc9

;###############################################
loc_0c0b92:
    dc.w $ffc6,$ffc2
    dc.w $ffd6,$ffb2
    dc.w $ffd6,$fff2
    dc.w $ffe6,$ff92
    dc.w $ffe6,$ffa2
    dc.w $ffe6,$ffc2
    dc.w $ffe6,$ffd2
    dc.w $0006,$ffa2
    dc.w $0006,$ffb2
    dc.w $0016,$ffb2
    dc.w $0016,$ffc2
    dc.w $0016,$fff2
    dc.w $0026,$ffe2
    dc.w $ffc6,$ffca

;###############################################
loc_0c0bca:
    dc.w $ffc6,$ffc3
    dc.w $ffd6,$ffb3
    dc.w $ffe6,$ff93
    dc.w $ffe6,$ffa3
    dc.w $ffe6,$ffc3
    dc.w $ffe6,$ffd3
    dc.w $0006,$ffa3
    dc.w $0006,$ffb3
    dc.w $0016,$ffb3
    dc.w $0016,$ffc3
    dc.w $ffc6,$ffcb

;###############################################
loc_0c0bf6:
    dc.w $ffc6,$ffc2
    dc.w $ffd6,$ffb2
    dc.w $ffe6,$ff92
    dc.w $ffe6,$ffa2
    dc.w $ffe6,$ffc2
    dc.w $ffe6,$ffd2
    dc.w $ffe6,$fff2
    dc.w $fff6,$ffe2
    dc.w $0006,$ffa2
    dc.w $0006,$ffb2
    dc.w $0016,$ffb2
    dc.w $0016,$ffc2
    dc.w $ffc6,$ffca

;###############################################
loc_0c0c2a:
    dc.w $ffc6,$ffc1
    dc.w $ffd6,$ffb1
    dc.w $ffd6,$fff1
    dc.w $ffe6,$ff91
    dc.w $ffe6,$ffa1
    dc.w $ffe6,$ffc1
    dc.w $ffe6,$ffd1
    dc.w $0006,$ffa1
    dc.w $0006,$ffb1
    dc.w $0016,$ffb1
    dc.w $0016,$ffc1
    dc.w $0016,$fff1
    dc.w $0026,$ffe1
    dc.w $ffc6,$ffc9

;###############################################
loc_0c0c62:
    dc.w $ffd5,$ffbc
    dc.w $ffd5,$ffdc
    dc.w $ffd5,$ffec
    dc.w $ffd5,$fffc
    dc.w $ffe5,$ffac
    dc.w $ffe5,$ffbc
    dc.w $ffe5,$ffcc
    dc.w $ffe5,$ffec
    dc.w $fff5,$ffcc
    dc.w $fff5,$ffdc
    dc.w $fff5,$fffc
    dc.w $0005,$ffbc
    dc.w $0005,$ffcc
    dc.w $0005,$fffc
    dc.w $0015,$ffbc
    dc.w $0015,$ffcc
    dc.w $0015,$ffdc
    dc.w $0015,$ffec
    dc.w $ffde,$ffdc
    dc.w $ffde,$ffec
    dc.w $ffee,$ffdc

;###############################################
loc_0c0cb6:
    dc.w $ffd5,$ffbc
    dc.w $ffd5,$ffdc
    dc.w $ffd5,$ffec
    dc.w $ffd5,$fffc
    dc.w $ffe5,$ffac
    dc.w $ffe5,$ffbc
    dc.w $ffe5,$ffcc
    dc.w $ffe5,$ffec
    dc.w $fff5,$ffcc
    dc.w $fff5,$ffdc
    dc.w $fff5,$fffc
    dc.w $0005,$ffbc
    dc.w $0005,$ffcc
    dc.w $0005,$fffc
    dc.w $0015,$ffbc
    dc.w $0015,$ffcc
    dc.w $0015,$ffdc
    dc.w $0015,$ffec
    dc.w $ffde,$ffec

;###############################################
loc_0c0d02:
    dc.w $ffd5,$ffbc
    dc.w $ffd5,$ffdc
    dc.w $ffd5,$ffec
    dc.w $ffd5,$fffc
    dc.w $ffe5,$ffac
    dc.w $ffe5,$ffcc
    dc.w $ffe5,$ffec
    dc.w $fff5,$ffcc
    dc.w $fff5,$ffdc
    dc.w $fff5,$fffc
    dc.w $0005,$ffbc
    dc.w $0005,$ffcc
    dc.w $0005,$fffc
    dc.w $0015,$ffbc
    dc.w $0015,$ffcc
    dc.w $0015,$ffdc
    dc.w $0015,$ffec
    dc.w $ffde,$ffec

;###############################################
loc_0c0d4a:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0003,$ff54
    dc.w $0013,$ff44

;###############################################
loc_0c0d7e:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $ffff,$ff54
    dc.w $000f,$ff44
    dc.w $000f,$ff54
    dc.w $000f,$ff64
    dc.w $000f,$ffa4
    dc.w $001f,$ff54
    dc.w $001f,$ff64
    dc.w $001f,$ff94

;###############################################
loc_0c0dca:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $fffb,$ff54
    dc.w $000b,$ff44
    dc.w $000b,$ff54
    dc.w $000b,$ff64
    dc.w $000b,$ffa4
    dc.w $001b,$ff54
    dc.w $001b,$ff74
    dc.w $001b,$ff84
    dc.w $001b,$ff94

;###############################################
loc_0c0e1a:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $000d,$ff44
    dc.w $000d,$ff94
    dc.w $000d,$ffa4
    dc.w $001d,$ff34
    dc.w $001d,$ff94
    dc.w $002d,$ff94

;###############################################
loc_0c0e5e:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0016,$ff43
    dc.w $0026,$ff33
    dc.w $0026,$ff73
    dc.w $0026,$ff83
    dc.w $0026,$ff93
    dc.w $0026,$ffa3

;###############################################
loc_0c0ea2:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c0ee6:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0010,$ff9e
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c0f2e:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0000,$ff9e
    dc.w $0000,$ffae
    dc.w $0010,$ff9e
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c0f7e:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $0000,$ff5e
    dc.w $0000,$ff9e
    dc.w $0000,$ffae
    dc.w $0010,$ff5e
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c0fd2:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $fff0,$ff5e
    dc.w $0000,$ff4e
    dc.w $0000,$ffae
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c1022:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $ffe0,$ff7e
    dc.w $fff0,$ff5e
    dc.w $0000,$ff9e
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;###############################################
loc_0c1072:
    dc.w $ffc4,$ffca
    dc.w $ffd4,$ff8a
    dc.w $ffd4,$ffda
    dc.w $ffe4,$ff5a
    dc.w $ffe4,$ff6a
    dc.w $fff4,$ff4a
    dc.w $0004,$ff3a
    dc.w $0004,$fffa
    dc.w $0024,$ff6a
    dc.w $0024,$ff7a
    dc.w $0024,$ff8a
    dc.w $ffe0,$ff8e
    dc.w $fff0,$ff5e
    dc.w $0000,$ff5e
    dc.w $0000,$ff6e
    dc.w $0014,$ff43
    dc.w $0024,$ff33
    dc.w $0024,$ff73
    dc.w $0024,$ff83
    dc.w $0024,$ff93
    dc.w $0024,$ffa3

;scene
;###############################################
loc_0c10c6:
    dc.w $ff80,$0008
    dc.w $ff80,$0018
    dc.w $0000,$0028
    dc.w $0030,$0038
    dc.w $ffb0,$ffc0
    dc.w $ffb0,$0020
    dc.w $ffb0,$0030
    dc.w $ffc0,$ffa0
    dc.w $ffc0,$ffc0
    dc.w $ffe0,$0030
    dc.w $fff0,$ff90
    dc.w $fff0,$ffb0
    dc.w $0000,$0030
    dc.w $0010,$ff80
    dc.w $0020,$ffd0
    dc.w $0030,$ff80
    dc.w $0030,$ffd0
    dc.w $0030,$0000

;###############################################
loc_0c110e:
    dc.w $ff50,$0030
    dc.w $ffd0,$0030
    dc.w $0040,$0030
    dc.w $00c0,$0030
    dc.w $ffc0,$fff0
    dc.w $ffd0,$ffe0
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$0010
    dc.w $ffe0,$0020
    dc.w $0000,$ffe0
    dc.w $0000,$0020
    dc.w $0020,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$0000
    dc.w $ffe0,$0020
    dc.w $fff0,$ffc0
    dc.w $fff0,$0000
    dc.w $fff0,$0030
    dc.w $0010,$0000
    dc.w $0030,$0030

;###############################################
loc_0c1162:
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0000
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$0030
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$0010
    dc.w $ffe0,$0030
    dc.w $fff0,$ffe0
    dc.w $fff0,$fff0
    dc.w $fff0,$0030
    dc.w $0000,$ffe0
    dc.w $0000,$fff0
    dc.w $0010,$ffe0
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0010,$0030
    dc.w $ff90,$fff8
    dc.w $ffb0,$0038
    dc.w $ffc0,$ffe8
    dc.w $ffc0,$fff8
    dc.w $ffc0,$0008
    dc.w $ffc0,$0018
    dc.w $ffd0,$ffe8
    dc.w $ffd0,$fff8
    dc.w $ffd0,$0008
    dc.w $ffd0,$0018
    dc.w $ffe0,$0018
    dc.w $fff0,$fff8
    dc.w $fff0,$0008
    dc.w $fff0,$0038
    dc.w $0000,$ffe8
    dc.w $0000,$fff8
    dc.w $0010,$ffd8
    dc.w $0010,$fff8
    dc.w $0010,$0018
    dc.w $0020,$fff8
    dc.w $0020,$0008
    dc.w $0020,$0018
    dc.w $0030,$ffe8
    dc.w $0040,$0008
    dc.w $0040,$0018

;###############################################
loc_0c1206:
    dc.w $ff90,$ffe0
    dc.w $ffb0,$ffd0
    dc.w $ffc0,$ffc0
    dc.w $ffc0,$fff0
    dc.w $ffe0,$ffc0
    dc.w $0000,$ffe0
    dc.w $0010,$ffd0
    dc.w $0010,$fff0
    dc.w $ff90,$0030
    dc.w $ffa0,$ffe0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0020
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$ffe0
    dc.w $ffb0,$0010
    dc.w $ffc0,$ffc0
    dc.w $ffc0,$fff0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0020
    dc.w $ffe0,$0010
    dc.w $fff0,$0030
    dc.w $0000,$ffd0
    dc.w $0010,$fff0
    dc.w $0020,$ffc0
    dc.w $0040,$ffc0
    dc.w $ff88,$0000
    dc.w $ff88,$0030
    dc.w $ff98,$fff0
    dc.w $ff98,$0020
    dc.w $ff98,$0030
    dc.w $ffa8,$ffe0
    dc.w $ffc8,$ffe0
    dc.w $ffe8,$ffc0
    dc.w $fff8,$ffd0
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $ffa0,$0000
    dc.w $ffc0,$fff0
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$0010
    dc.w $ffe0,$ffc0

;###############################################
loc_0c12aa:
    dc.w $ff80,$fff0
    dc.w $ff90,$ffe0
    dc.w $ffb0,$0010
    dc.w $ffc0,$ffd0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ffd0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffd0,$0020
    dc.w $ffe0,$fff0
    dc.w $fff0,$ffc0
    dc.w $fff0,$0010
    dc.w $fff0,$0020
    dc.w $fff0,$0030
    dc.w $0000,$ffd0
    dc.w $0000,$ffe0
    dc.w $0000,$0020
    dc.w $0010,$ffd0
    dc.w $0010,$0000
    dc.w $0030,$0000
    dc.w $0030,$0010
    dc.w $0030,$0020
    dc.w $0070,$0000
    dc.w $ff70,$ffe0
    dc.w $ff70,$0000
    dc.w $ff80,$ffd0
    dc.w $ff80,$0030
    dc.w $ff90,$ffc0
    dc.w $ffb0,$ffc0
    dc.w $0010,$ffc0
    dc.w $0010,$0030
    dc.w $0020,$0030
    dc.w $0040,$ffc0
    dc.w $0040,$ffe0
    dc.w $0040,$0000
    dc.w $0040,$0010
    dc.w $0050,$ffe0
    dc.w $0060,$ffd0

;###############################################
loc_0c1346:
    dc.w $ffb0,$ffc0
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$0010
    dc.w $ffb0,$0020
    dc.w $ffb0,$0030
    dc.w $ffc0,$ffd0
    dc.w $ffd0,$0000
    dc.w $ffe0,$fff0
    dc.w $fff0,$0000
    dc.w $fff0,$0020
    dc.w $0000,$fff0
    dc.w $0000,$0000
    dc.w $0010,$ffc0
    dc.w $0010,$fff0
    dc.w $0030,$ffd0
    dc.w $0030,$0020
    dc.w $0050,$ffe0
    dc.w $0050,$0030
    dc.w $ff70,$0030
    dc.w $ff90,$ffc0
    dc.w $ff90,$0020
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$0030
    dc.w $ffd0,$fff0
    dc.w $ffe0,$ffe0
    dc.w $fff0,$ffd0
    dc.w $0000,$0000
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0010,$0020
    dc.w $0020,$0010
    dc.w $0030,$ffd0
    dc.w $0030,$fff0
    dc.w $0030,$0030
    dc.w $0060,$ffe0
    dc.w $0060,$0020
    dc.w $0090,$ffd0
    dc.w $0090,$0030

;###############################################
loc_0c13de:
    dc.w $0000,$ffb8
    dc.w $0000,$fff8
    dc.w $0000,$0018
    dc.w $0000,$0028
    dc.w $0000,$0038
    dc.w $0000,$0048
    dc.w $0010,$ffb8
    dc.w $0010,$ffc8
    dc.w $0010,$ffd8
    dc.w $0010,$ffe8
    dc.w $0020,$fff8
    dc.w $0020,$0048
    dc.w $0030,$0048
    dc.w $0040,$fff8
    dc.w $0040,$0008
    dc.w $0040,$0018
    dc.w $0040,$0028
    dc.w $0040,$0038
    dc.w $0040,$0048
    dc.w $0050,$0008
    dc.w $0050,$0018
    dc.w $0050,$0028
    dc.w $0050,$0038
    dc.w $0050,$0048
    dc.w $0060,$fff8
    dc.w $0060,$0038
    dc.w $0070,$0028
    dc.w $0090,$0028
    dc.w $00a0,$fff8
    dc.w $00a0,$0008
    dc.w $00a0,$0018
    dc.w $00a0,$0038
    dc.w $00a0,$0048
    dc.w $00b0,$0008
    dc.w $00b0,$0018
    dc.w $00b0,$0028
    dc.w $00b0,$0038
    dc.w $00b0,$0048
    dc.w $00c0,$fff8
    dc.w $00c0,$0008
    dc.w $00c0,$0018
    dc.w $00c0,$0028
    dc.w $00c0,$0038
    dc.w $00c0,$0048
    dc.w $00d0,$fff8
    dc.w $00d0,$0008
    dc.w $00d0,$0018
    dc.w $00d0,$0028
    dc.w $00d0,$0038
    dc.w $00d0,$0048
    dc.w $00e0,$0018
    dc.w $00e0,$0028
    dc.w $00e0,$0038
    dc.w $00e0,$0048
    dc.w $00f0,$0018
    dc.w $00f0,$0048
    dc.w $ff00,$0018
    dc.w $ff00,$0048
    dc.w $ff10,$0008
    dc.w $ff10,$0018
    dc.w $ff10,$0028
    dc.w $ff10,$0038
    dc.w $ff10,$0048
    dc.w $ff20,$fff8
    dc.w $ff20,$0018
    dc.w $ff20,$0028
    dc.w $ff20,$0038
    dc.w $ff20,$0048
    dc.w $ff30,$fff8
    dc.w $ff30,$0008
    dc.w $ff30,$0018
    dc.w $ff30,$0028
    dc.w $ff30,$0038
    dc.w $ff30,$0048
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff40,$0018
    dc.w $ff40,$0028
    dc.w $ff40,$0038
    dc.w $ff40,$0048
    dc.w $ff50,$0008
    dc.w $ff50,$0018
    dc.w $ff50,$0038
    dc.w $ff50,$0048
    dc.w $ff60,$fff8
    dc.w $ff60,$0028
    dc.w $ff60,$0038
    dc.w $ff70,$0028
    dc.w $ff90,$0028
    dc.w $ffa0,$fff8
    dc.w $ffa0,$0008
    dc.w $ffa0,$0018
    dc.w $ffa0,$0038
    dc.w $ffa0,$0048
    dc.w $ffb0,$0008
    dc.w $ffb0,$0018
    dc.w $ffb0,$0028
    dc.w $ffb0,$0038
    dc.w $ffb0,$0048
    dc.w $ffc0,$fff8
    dc.w $ffc0,$0048
    dc.w $ffd0,$ffb8
    dc.w $ffd0,$ffc8
    dc.w $ffd0,$ffd8
    dc.w $ffd0,$0048
    dc.w $ffe0,$ffe8
    dc.w $ffe0,$fff8
    dc.w $fff0,$ffb8
    dc.w $fff0,$0018
    dc.w $fff0,$0028
    dc.w $fff0,$0038
    dc.w $fff0,$0048
    dc.w $ffc0,$ffb8
    dc.w $ffc0,$ffc8
    dc.w $ffd0,$ffa8
    dc.w $ffd0,$ffc8
    dc.w $ffd0,$ffd8
    dc.w $ffd0,$ffe8
    dc.w $ffd0,$fff8
    dc.w $ffd0,$0008
    dc.w $ffd0,$0018
    dc.w $ffe0,$ffa8
    dc.w $ffe0,$ffe8
    dc.w $ffe0,$fff8
    dc.w $ffe0,$0028
    dc.w $ffe0,$0038
    dc.w $ffe0,$0048
    dc.w $fff0,$ffb8
    dc.w $fff0,$ffe8
    dc.w $fff0,$0028
    dc.w $fff0,$0038
    dc.w $fff0,$0048
    dc.w $0000,$ffa8
    dc.w $0000,$0038
    dc.w $0000,$0048
    dc.w $0010,$ffb8
    dc.w $0010,$ffd8
    dc.w $0010,$0028
    dc.w $0010,$0038
    dc.w $0010,$0048
    dc.w $0020,$ffa8
    dc.w $0020,$ffe8
    dc.w $0020,$fff8
    dc.w $0020,$0008
    dc.w $0020,$0018
    dc.w $0030,$ffc8

;###############################################
loc_0c1626:
    dc.w $ffc0,$ffc0
    dc.w $ffd0,$0030
    dc.w $fff0,$ffe0
    dc.w $fff0,$0000
    dc.w $fff0,$0030
    dc.w $0000,$0030
    dc.w $0010,$0000
    dc.w $0010,$0020
    dc.w $ffd0,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffc0
    dc.w $fff0,$0020
    dc.w $0000,$0010
    dc.w $0030,$0010
    dc.w $0030,$0020
    dc.w $0030,$0030
    dc.w $0040,$0020
    dc.w $0040,$0030
    dc.w $0050,$0020
    dc.w $0050,$0030
    dc.w $0060,$0010
    dc.w $0060,$0020
    dc.w $0060,$0030
    dc.w $0070,$0010
    dc.w $0070,$0020
    dc.w $0070,$0030
    dc.w $0080,$0010
    dc.w $0080,$0020
    dc.w $0080,$0030
    dc.w $0090,$ffd0
    dc.w $0090,$0000
    dc.w $0090,$0010
    dc.w $0090,$0020
    dc.w $0090,$0030
    dc.w $00a0,$0000
    dc.w $00a0,$0010
    dc.w $00a0,$0020
    dc.w $00a0,$0030
    dc.w $00b0,$ffc0
    dc.w $00b0,$0000
    dc.w $00b0,$0010
    dc.w $00b0,$0020
    dc.w $00b0,$0030
    dc.w $ffe0,$ffc0
    dc.w $ffe0,$0030
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0030,$0020
    dc.w $ff40,$0000
    dc.w $ff40,$0010
    dc.w $ff40,$0020
    dc.w $ff40,$0030
    dc.w $ff50,$0010
    dc.w $ff50,$0020
    dc.w $ff60,$0000
    dc.w $ff60,$0030
    dc.w $ff70,$0030
    dc.w $ff90,$0030
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0020
    dc.w $ffb0,$fff0
    dc.w $ffb0,$0000
    dc.w $ffb0,$0010
    dc.w $ffb0,$0020
    dc.w $ffb0,$0030
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0030
    dc.w $ffd0,$ffd0
    dc.w $ffe0,$ffc0
    dc.w $fff0,$0030
    dc.w $0000,$ffe0
    dc.w $0000,$0030
    dc.w $0010,$fff0
    dc.w $0010,$0000
    dc.w $0010,$0020

;###############################################
loc_0c1752:
    dc.w $ff90,$fff0
    dc.w $ff90,$0020
    dc.w $ffa0,$fff0
    dc.w $ffb0,$ffc0
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0020
    dc.w $ffd0,$ffc0
    dc.w $0000,$fff0
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0010,$0010
    dc.w $0020,$0020
    dc.w $0020,$0030
    dc.w $0030,$ffe0
    dc.w $0030,$0010
    dc.w $0040,$fff0
    dc.w $0040,$0000
    dc.w $0050,$fff0
    dc.w $0060,$fff0
    dc.w $ffa8,$ffd8
    dc.w $ffc8,$ffd8
    dc.w $ffc8,$ffe8
    dc.w $ffc8,$fff8
    dc.w $ffd8,$ffd8
    dc.w $ffd8,$0018
    dc.w $ffe8,$0018
    dc.w $fff8,$0018
    dc.w $0018,$0018
    dc.w $0028,$ffe8
    dc.w $0038,$0008
    dc.w $ff98,$0010
    dc.w $ffa8,$0030
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0020
    dc.w $ffb8,$0030
    dc.w $ffc8,$0010
    dc.w $0028,$0010
    dc.w $0048,$0020
    dc.w $0048,$0030

;###############################################
loc_0c17ee:
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0020
    dc.w $ffc8,$ffe0
    dc.w $ffc8,$0020
    dc.w $ffd8,$0030
    dc.w $ffe8,$ffd0
    dc.w $0008,$0020
    dc.w $0038,$ffe0
    dc.w $ffd8,$ffd0
    dc.w $ffe8,$ffc0
    dc.w $ffe8,$0010
    dc.w $fff8,$fff0
    dc.w $0008,$0000
    dc.w $ffe0,$fff0
    dc.w $fff0,$0000
    dc.w $0000,$0010
    dc.w $0000,$0030
    dc.w $0010,$0000

;###############################################
loc_0c1836:
    dc.w $ff98,$ffd0
    dc.w $ff98,$fff0
    dc.w $ffa8,$fff0
    dc.w $ffb8,$ffe0
    dc.w $ffd8,$0020
    dc.w $ffd8,$0030
    dc.w $ffe8,$ffc0
    dc.w $ffe8,$0000
    dc.w $fff8,$0020
    dc.w $0008,$0020
    dc.w $0018,$ffd0
    dc.w $0028,$ffe0
    dc.w $0048,$ffd0
    dc.w $ffa8,$ffd8
    dc.w $ffb8,$ffc8
    dc.w $ffb8,$ffd8
    dc.w $ffb8,$fff8
    dc.w $ffc8,$0008
    dc.w $ffd8,$ffc8
    dc.w $0028,$ffd8
    dc.w $0028,$0008
    dc.w $0038,$ffe8
    dc.w $0048,$fff8
    dc.w $0058,$ffe8
    dc.w $ffa8,$ffe0
    dc.w $ffa8,$fff0
    dc.w $ffb8,$fff0
    dc.w $ffd8,$ffe0
    dc.w $ffe8,$0000
    dc.w $0048,$ffe0

;###############################################
loc_0c18ae:
    dc.w $ff60,$0030
    dc.w $ff70,$0000
    dc.w $ff80,$ffe0
    dc.w $ff90,$ffd0
    dc.w $ff90,$fff0
    dc.w $ff90,$0010
    dc.w $ff90,$0020
    dc.w $ff90,$0030
    dc.w $ff90,$0040
    dc.w $ffa0,$ffc0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0000
    dc.w $ffa0,$0010
    dc.w $ffa0,$0020
    dc.w $ffa0,$0030
    dc.w $ffb0,$ffb0
    dc.w $ffb0,$fff0
    dc.w $ffb0,$0000
    dc.w $ffb0,$0010
    dc.w $ffb0,$0020
    dc.w $ffb0,$0030
    dc.w $ffc0,$0000
    dc.w $ffc0,$0030
    dc.w $fff0,$fff0
    dc.w $fff0,$0030
    dc.w $0000,$fff0
    dc.w $0000,$0030
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $0010,$ffd0
    dc.w $0010,$ffe0
    dc.w $0020,$ffc0
    dc.w $0030,$ffc0
    dc.w $0030,$ffe0
    dc.w $0040,$ffc0
    dc.w $0040,$ffe0
    dc.w $0040,$0030
    dc.w $0050,$ffe0
    dc.w $0050,$0000
    dc.w $0050,$0020
    dc.w $0050,$0030
    dc.w $0060,$ffc0
    dc.w $0060,$ffe0
    dc.w $0060,$0000
    dc.w $0060,$0010
    dc.w $0060,$0020
    dc.w $0060,$0030
    dc.w $0070,$0000
    dc.w $0070,$0010
    dc.w $0070,$0020
    dc.w $0070,$0030
    dc.w $0080,$ffd0
    dc.w $0080,$0000
    dc.w $0090,$0040

;###############################################
loc_0c1986:
    dc.w $ffb8,$ffe0
    dc.w $ffb8,$0010
    dc.w $ffb8,$0020
    dc.w $ffc8,$ffc0
    dc.w $ffc8,$0010
    dc.w $ffd8,$ffd0
    dc.w $ffe8,$0000
    dc.w $fff8,$ffd0
    dc.w $0008,$ffc0
    dc.w $0018,$fff0
    dc.w $0028,$ffe0
    dc.w $0038,$ffd0
    dc.w $ffb8,$0020
    dc.w $ffc8,$ffe0
    dc.w $ffc8,$0010
    dc.w $ffd8,$ffd0
    dc.w $ffe8,$ffe0
    dc.w $ffe8,$0030
    dc.w $0018,$fff0
    dc.w $ffd0,$fff9

;###############################################
loc_0c19d6:
    dc.w $fff5,$0000
    dc.w $0005,$ffe0
    dc.w $0015,$ffc0
    dc.w $0015,$0000
    dc.w $0015,$0010
    dc.w $0025,$ffe0
    dc.w $0025,$fff0
    dc.w $0035,$ffd0
    dc.w $0035,$0010
    dc.w $0035,$0020
    dc.w $ff9b,$0010
    dc.w $ffab,$0000
    dc.w $ffab,$0020
    dc.w $ffbb,$fff0
    dc.w $ffbb,$0010
    dc.w $ffbb,$0020
    dc.w $ffcb,$fff0
    dc.w $ffdb,$0000
    dc.w $ffdb,$0010
    dc.w $ffdb,$0030
    dc.w $ffeb,$0010
    dc.w $ffeb,$0030
    dc.w $000b,$0020
    dc.w $001b,$0020
    dc.w $ffd0,$0000
    dc.w $ffe0,$0020
    dc.w $fff0,$0000
    dc.w $0000,$0020
    dc.w $0020,$ffd0

;###############################################
loc_0c1a4a:
    dc.w $ff78,$fff8
    dc.w $ff88,$0018
    dc.w $ff98,$ffe8
    dc.w $ff98,$0018
    dc.w $ffb8,$0008
    dc.w $ffc8,$fff8
    dc.w $ffd8,$fff8
    dc.w $ffd8,$0038
    dc.w $ffe8,$0018
    dc.w $ffe8,$0028
    dc.w $fff8,$0008
    dc.w $0018,$0028
    dc.w $0038,$0028
    dc.w $0048,$0018
    dc.w $0048,$0028
    dc.w $0098,$0018

;###############################################
loc_0c1a8a:
    dc.w $fff5,$0000
    dc.w $0005,$ffe0
    dc.w $0015,$ffc0
    dc.w $0015,$0000
    dc.w $0015,$0010
    dc.w $0025,$ffe0
    dc.w $0025,$fff0
    dc.w $0035,$ffd0
    dc.w $0035,$0010
    dc.w $0035,$0020
    dc.w $ffd0,$0000
    dc.w $ffd0,$0020
    dc.w $ffe0,$0020
    dc.w $fff0,$0000
    dc.w $0000,$0020
    dc.w $0020,$ffd0

;###############################################
loc_0c1aca:
    dc.w $ff50,$0000
    dc.w $ff60,$0000
    dc.w $ffb0,$0000
    dc.w $ffc0,$0000
    dc.w $0010,$0000
    dc.w $0020,$0000
    dc.w $0030,$0000
    dc.w $0040,$0000
    dc.w $0050,$0000
    dc.w $0060,$0000
    dc.w $0070,$0000
    dc.w $0080,$0000
    dc.w $0090,$0000
    dc.w $00a0,$0000
    dc.w $00b0,$0000
    dc.w $00c0,$0000

;###############################################
loc_0c1b0a:
    dc.w $ffb0,$ffd0
    dc.w $ffc0,$ffc0
    dc.w $ffd0,$0010
    dc.w $ffe0,$0010
    dc.w $ffe0,$0020
    dc.w $0000,$0010
    dc.w $0010,$0030
    dc.w $0040,$ffe0
    dc.w $ffe0,$ffe8
    dc.w $fff0,$ffe8
    dc.w $fff0,$fff8
    dc.w $0020,$ffd8

;###############################################
loc_0c1b3a:
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0010
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff90,$ffe0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ffe0
    dc.w $0020,$ffe0
    dc.w $0030,$ffe0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0050,$ffe0
    dc.w $0070,$ffe0
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0010
    dc.w $0050,$fff0
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$fff0

;###############################################
loc_0c1b9a:
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0010
    dc.w $ff70,$ffe0
    dc.w $ffc0,$ffe0
    dc.w $ffc0,$fff0
    dc.w $ffd0,$ffe0
    dc.w $0020,$ffe0
    dc.w $0030,$ffe0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0010
    dc.w $0050,$ffe0
    dc.w $0050,$fff0
    dc.w $0050,$0000
    dc.w $0060,$ffe0
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$ffe0
    dc.w $ff90,$0000
    dc.w $ffa0,$ffe0
    dc.w $ffa0,$fff0

;###############################################
loc_0c1c02:
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0010
    dc.w $ff70,$ffe0
    dc.w $ff90,$ffe0
    dc.w $ff90,$fff0
    dc.w $ff90,$0000
    dc.w $ff90,$0010
    dc.w $ffa0,$0000
    dc.w $ffb0,$fff0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$ffe0
    dc.w $0020,$ffe0
    dc.w $0030,$ffe0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0050,$fff0
    dc.w $0050,$0000
    dc.w $0050,$0010
    dc.w $0060,$0000
    dc.w $0070,$ffe0
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0010
    dc.w $0050,$ffe0
    dc.w $0050,$0000
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$ffe0
    dc.w $ff90,$0000

;###############################################
loc_0c1c82:
    dc.w $ff60,$fff0
    dc.w $ff60,$0000
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff80,$ffe0
    dc.w $ff80,$0010
    dc.w $ff90,$0000
    dc.w $ffa0,$0000
    dc.w $ffc0,$fff0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0040,$0000
    dc.w $0060,$0000
    dc.w $0060,$0010
    dc.w $0070,$0000
    dc.w $0080,$ffe0
    dc.w $0080,$fff0
    dc.w $0090,$fff0
    dc.w $0050,$ffe0
    dc.w $0050,$fff0
    dc.w $0060,$ffe0
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$ffe0
    dc.w $ff90,$fff0
    dc.w $ffa0,$ffe0

;###############################################
loc_0c1cf2:
    dc.w $ff60,$fff0
    dc.w $ff70,$ffe0
    dc.w $ff80,$ffe0
    dc.w $ff80,$0000
    dc.w $ff90,$0000
    dc.w $ff90,$0010
    dc.w $ffa0,$0000
    dc.w $ffc0,$fff0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0040,$0000
    dc.w $0060,$0000
    dc.w $0060,$0010
    dc.w $0070,$0000
    dc.w $0080,$ffe0
    dc.w $0080,$fff0
    dc.w $0050,$ffe0
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$ffe0

;###############################################
loc_0c1d4a:
    dc.w $ff60,$0000
    dc.w $ff80,$fff0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffe0
    dc.w $ffd0,$0010
    dc.w $fff0,$ffb0
    dc.w $0000,$ffb0
    dc.w $0000,$fff0
    dc.w $0000,$0010
    dc.w $0010,$ffe0
    dc.w $0040,$ffe0
    dc.w $0080,$0000

;###############################################
loc_0c1d7a:
    dc.w $ff40,$fff0
    dc.w $ff40,$0000
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0000
    dc.w $ffd0,$fff0
    dc.w $0010,$fff0
    dc.w $0010,$0000
    dc.w $0020,$0000
    dc.w $0040,$fff0
    dc.w $0060,$ffe0
    dc.w $0070,$0000
    dc.w $00b0,$ffd0

;###############################################
loc_0c1daa:
    dc.w $ff40,$ff90
    dc.w $ff40,$ffa0
    dc.w $ff50,$ff90
    dc.w $ff50,$ffa0
    dc.w $ff60,$ff90
    dc.w $ff60,$ffa0
    dc.w $ff70,$ff90
    dc.w $ff70,$ffa0
    dc.w $ff80,$ff90
    dc.w $ff80,$ffa0
    dc.w $ff90,$ff90
    dc.w $ff90,$ffa0
    dc.w $ffa0,$ff90
    dc.w $ffa0,$ffa0
    dc.w $ffb0,$ff90
    dc.w $ffb0,$ffa0
    dc.w $ffc0,$ff90
    dc.w $ffc0,$ffa0
    dc.w $ffd0,$ff90
    dc.w $ffd0,$ffa0
    dc.w $ffe0,$ff90
    dc.w $ffe0,$ffa0
    dc.w $fff0,$ff90
    dc.w $fff0,$ffa0
    dc.w $0000,$ff90
    dc.w $0000,$ffa0
    dc.w $0010,$ff90
    dc.w $0010,$ffa0
    dc.w $0020,$ff90
    dc.w $0020,$ffa0
    dc.w $0030,$ff90
    dc.w $0030,$ffa0
    dc.w $0040,$ff90
    dc.w $0040,$ffa0
    dc.w $0050,$ff90
    dc.w $0050,$ffa0
    dc.w $0060,$ff90
    dc.w $0060,$ffa0
    dc.w $0070,$ff90
    dc.w $0070,$ffa0
    dc.w $0080,$ff90
    dc.w $0080,$ffa0
    dc.w $0090,$ff90
    dc.w $0090,$ffa0
    dc.w $00a0,$ff90
    dc.w $00a0,$ffa0
    dc.w $00b0,$ff90
    dc.w $00b0,$ffa0
    dc.w $ff40,$0030
    dc.w $ff40,$0040
    dc.w $ff40,$0050
    dc.w $ff40,$0060
    dc.w $ff50,$0030
    dc.w $ff50,$0040
    dc.w $ff50,$0050
    dc.w $ff50,$0060
    dc.w $ff60,$0030
    dc.w $ff60,$0040
    dc.w $ff60,$0050
    dc.w $ff60,$0060
    dc.w $ff70,$0030
    dc.w $ff70,$0040
    dc.w $ff70,$0050
    dc.w $ff70,$0060
    dc.w $ff80,$0030
    dc.w $ff80,$0040
    dc.w $ff80,$0050
    dc.w $ff80,$0060
    dc.w $ff90,$0030
    dc.w $ff90,$0040
    dc.w $ff90,$0050
    dc.w $ff90,$0060
    dc.w $ffa0,$0030
    dc.w $ffa0,$0040
    dc.w $ffa0,$0050
    dc.w $ffa0,$0060
    dc.w $ffb0,$0030
    dc.w $ffb0,$0040
    dc.w $ffb0,$0050
    dc.w $ffb0,$0060
    dc.w $ffc0,$0030
    dc.w $ffc0,$0040
    dc.w $ffc0,$0050
    dc.w $ffc0,$0060
    dc.w $ffd0,$0030
    dc.w $ffd0,$0040
    dc.w $ffd0,$0050
    dc.w $ffd0,$0060
    dc.w $ffe0,$0030
    dc.w $ffe0,$0040
    dc.w $ffe0,$0050
    dc.w $ffe0,$0060
    dc.w $fff0,$0030
    dc.w $fff0,$0040
    dc.w $fff0,$0050
    dc.w $fff0,$0060
    dc.w $0000,$0030
    dc.w $0000,$0040
    dc.w $0000,$0050
    dc.w $0000,$0060
    dc.w $0010,$0030
    dc.w $0010,$0040
    dc.w $0010,$0050
    dc.w $0010,$0060
    dc.w $0020,$0030
    dc.w $0020,$0040
    dc.w $0020,$0050
    dc.w $0020,$0060
    dc.w $0030,$0030
    dc.w $0030,$0040
    dc.w $0030,$0050
    dc.w $0030,$0060
    dc.w $0040,$0030
    dc.w $0040,$0040
    dc.w $0040,$0050
    dc.w $0040,$0060
    dc.w $0050,$0030
    dc.w $0050,$0040
    dc.w $0050,$0050
    dc.w $0050,$0060
    dc.w $0060,$0030
    dc.w $0060,$0040
    dc.w $0060,$0050
    dc.w $0060,$0060
    dc.w $0070,$0030
    dc.w $0070,$0040
    dc.w $0070,$0050
    dc.w $0070,$0060
    dc.w $0080,$0030
    dc.w $0080,$0040
    dc.w $0080,$0050
    dc.w $0080,$0060
    dc.w $0090,$0030
    dc.w $0090,$0040
    dc.w $0090,$0050
    dc.w $0090,$0060
    dc.w $00a0,$0030
    dc.w $00a0,$0040
    dc.w $00a0,$0050
    dc.w $00a0,$0060
    dc.w $00b0,$0030
    dc.w $00b0,$0040
    dc.w $00b0,$0050
    dc.w $00b0,$0060

;###############################################
loc_0c1fea:
    dc.w $ff62,$ffd1
    dc.w $ff72,$0001
    dc.w $ff82,$0011
    dc.w $ff92,$ffd1
    dc.w $ff92,$ffe1
    dc.w $ffb2,$ffd1
    dc.w $ffe2,$0021
    dc.w $0042,$ffd1
    dc.w $0052,$ffd1
    dc.w $0072,$ffd1
    dc.w $0072,$0001
    dc.w $0072,$0011

;###############################################
loc_0c201a:
    dc.w $ff60,$0000
    dc.w $ff80,$fff0
    dc.w $ff90,$0020
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0030
    dc.w $fff0,$fff0
    dc.w $fff0,$0030
    dc.w $0060,$fff0
    dc.w $0070,$fff0
    dc.w $0070,$0030
    dc.w $0080,$ffe0
    dc.w $0090,$0020

;###############################################
loc_0c2056:
    dc.w $ff60,$0000
    dc.w $ff70,$0020
    dc.w $ff80,$0020
    dc.w $ff90,$fff0
    dc.w $ffa0,$fff0
    dc.w $ffb0,$0000
    dc.w $ffb0,$0010
    dc.w $ffd0,$0000
    dc.w $fff0,$ffe0
    dc.w $fff0,$0020
    dc.w $0030,$ffe0
    dc.w $0080,$0010
    dc.w $0090,$0010
    dc.w $00a0,$0020
    dc.w $00a0,$0030

;###############################################
loc_0c2092:
    dc.w $ff60,$0000
    dc.w $ff80,$fff0
    dc.w $ff80,$0020
    dc.w $ffa0,$0000
    dc.w $ffc0,$0000
    dc.w $0000,$0000
    dc.w $0010,$0000
    dc.w $0010,$0010
    dc.w $0020,$0010
    dc.w $0050,$0030
    dc.w $0060,$ffe0
    dc.w $0070,$ffe0
    dc.w $0080,$ffe0
    dc.w $0080,$0020
    dc.w $0090,$ffd0
    dc.w $00a0,$ffd0

;###############################################
loc_0c20d2:
    dc.w $ff60,$0000
    dc.w $ff80,$fff0
    dc.w $ff90,$0020
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0000
    dc.w $ffc0,$0010
    dc.w $ffd0,$ffe0
    dc.w $0030,$0030
    dc.w $0050,$fff0
    dc.w $0050,$0000
    dc.w $0060,$fff0
    dc.w $0090,$ffe0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2106:
    dc.w $ff60,$0000
    dc.w $ff90,$fff0
    dc.w $ff90,$0020
    dc.w $ffa0,$0020
    dc.w $ffc0,$ffe0
    dc.w $ffc0,$0010
    dc.w $fff0,$ffd0
    dc.w $0010,$0010
    dc.w $0030,$fff0
    dc.w $0040,$fff0
    dc.w $0050,$0030
    dc.w $0060,$0030
    dc.w $0070,$0000
    dc.w $0080,$0010

;###############################################
loc_0c213e:
    dc.w $ff58,$fff0
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$0000
    dc.w $ff98,$0000
    dc.w $ffb8,$fff0
    dc.w $ffc8,$fff0
    dc.w $ffd8,$fff0
    dc.w $ffe8,$fff0
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0048,$0000
    dc.w $0058,$fff0
    dc.w $0068,$fff0
    dc.w $0098,$fff0
    dc.w $0098,$0000

;###############################################
loc_0c219e:
    dc.w $ff58,$fff0
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffb8,$fff0
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0048,$0000
    dc.w $0058,$fff0
    dc.w $0068,$fff0
    dc.w $0098,$fff0
    dc.w $0098,$0000

;###############################################
loc_0c2212:
    dc.w $ff28,$fff0
    dc.w $ff28,$0000
    dc.w $ff38,$fff0
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$0000
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0058,$fff0
    dc.w $0058,$0000
    dc.w $0068,$fff0
    dc.w $0068,$0000
    dc.w $0078,$fff0
    dc.w $0088,$fff0
    dc.w $0098,$0000
    dc.w $00a8,$fff0
    dc.w $00b8,$fff0
    dc.w $00b8,$0000
    dc.w $00c8,$fff0

;###############################################
loc_0c22aa:
    dc.w $ff28,$fff0
    dc.w $ff28,$0000
    dc.w $ff38,$fff0
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0058,$fff0
    dc.w $0058,$0000
    dc.w $0068,$fff0
    dc.w $0078,$fff0
    dc.w $0078,$0000
    dc.w $0088,$fff0
    dc.w $00a8,$fff0
    dc.w $00b8,$fff0
    dc.w $00b8,$0000
    dc.w $00c8,$fff0

;###############################################
loc_0c2336:
    dc.w $ff48,$fff0
    dc.w $ff48,$0000
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffd8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0048,$fff0
    dc.w $0048,$0000
    dc.w $0058,$fff0
    dc.w $0058,$0000
    dc.w $0088,$fff0
    dc.w $0088,$0000
    dc.w $0098,$fff0
    dc.w $0098,$0000
    dc.w $00a8,$fff0
    dc.w $00a8,$0000

;###############################################
loc_0c23b6:
    dc.w $ff48,$fff0
    dc.w $ff48,$0000
    dc.w $ff58,$fff0
    dc.w $ff68,$fff0
    dc.w $ff78,$fff0
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0048,$fff0
    dc.w $0048,$0000
    dc.w $0058,$fff0
    dc.w $0088,$fff0
    dc.w $0088,$0000
    dc.w $0098,$fff0
    dc.w $0098,$0000
    dc.w $00a8,$fff0
    dc.w $00a8,$0000

;###############################################
loc_0c2426:
    dc.w $ff60,$fff0
    dc.w $ff60,$0000
    dc.w $ff70,$fff0
    dc.w $ff70,$0000
    dc.w $ff80,$fff0
    dc.w $ff90,$fff0
    dc.w $ffd0,$fff0
    dc.w $ffe0,$fff0
    dc.w $fff0,$fff0
    dc.w $0000,$fff0
    dc.w $0010,$fff0
    dc.w $0020,$fff0
    dc.w $0020,$0000
    dc.w $0030,$fff0
    dc.w $0030,$0000
    dc.w $0040,$fff0
    dc.w $0040,$0000
    dc.w $0050,$fff0
    dc.w $0050,$0000
    dc.w $0060,$fff0
    dc.w $0060,$0000
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $0080,$fff0
    dc.w $0090,$fff0
    dc.w $0090,$0000

;###############################################
loc_0c248e:
    dc.w $ff60,$fff0
    dc.w $ff60,$0000
    dc.w $ff70,$fff0
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff90,$fff0
    dc.w $ffd0,$fff0
    dc.w $ffe0,$fff0
    dc.w $fff0,$fff0
    dc.w $0000,$fff0
    dc.w $0010,$fff0
    dc.w $0020,$fff0
    dc.w $0020,$0000
    dc.w $0030,$fff0
    dc.w $0030,$0000
    dc.w $0040,$fff0
    dc.w $0040,$0000
    dc.w $0050,$fff0
    dc.w $0060,$fff0
    dc.w $0060,$0000
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $0080,$fff0
    dc.w $0090,$fff0
    dc.w $0090,$0000

;###############################################
loc_0c24f2:
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0018,$fff0
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0078,$fff0

;###############################################
loc_0c2552:
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $0028,$fff0
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $0078,$fff0

;###############################################
loc_0c259a:
    dc.w $ff40,$ffe0
    dc.w $ff40,$fff0
    dc.w $ff50,$ffe0
    dc.w $ff50,$fff0
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff80,$ffe0
    dc.w $ff80,$fff0
    dc.w $ff90,$ffe0
    dc.w $ffa0,$ffe0
    dc.w $ffb0,$ffe0
    dc.w $ffc0,$ffe0
    dc.w $ffe0,$ffe0
    dc.w $0000,$ffe0
    dc.w $0000,$fff0
    dc.w $0010,$fff0
    dc.w $0020,$ffe0
    dc.w $0030,$fff0
    dc.w $0040,$ffe0
    dc.w $0060,$ffe0
    dc.w $0060,$fff0
    dc.w $0070,$ffe0
    dc.w $0080,$ffe0
    dc.w $0080,$fff0
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $00a0,$ffe0
    dc.w $00a0,$fff0
    dc.w $00b0,$ffe0
    dc.w $00b0,$fff0

;###############################################
loc_0c261a:
    dc.w $ff40,$0000
    dc.w $ff40,$0010
    dc.w $ff50,$0000
    dc.w $ff50,$0010
    dc.w $ff60,$0000
    dc.w $ff60,$0010
    dc.w $ff70,$0000
    dc.w $ff70,$0010
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$0000
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffe0,$0000
    dc.w $ffe0,$0010
    dc.w $fff0,$0000
    dc.w $0000,$0000
    dc.w $0020,$0000
    dc.w $0020,$0010
    dc.w $0030,$0000
    dc.w $0080,$0000
    dc.w $0080,$0010
    dc.w $0090,$0000
    dc.w $0090,$0010
    dc.w $00a0,$0000
    dc.w $00a0,$0010
    dc.w $00b0,$0000
    dc.w $00b0,$0010

;###############################################
loc_0c268a:
    dc.w $ff48,$fff0
    dc.w $ff48,$0000
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $00b8,$0000

;###############################################
loc_0c2712:
    dc.w $ff48,$fff0
    dc.w $ff48,$0000
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0

;###############################################
loc_0c2796:
    dc.w $ff48,$fff0
    dc.w $ff48,$0000
    dc.w $ff58,$fff0
    dc.w $ff58,$0000
    dc.w $ff68,$fff0
    dc.w $ff68,$0000
    dc.w $ff78,$fff0
    dc.w $ff78,$0000
    dc.w $ff88,$fff0
    dc.w $ff88,$0000
    dc.w $ff98,$fff0
    dc.w $ff98,$0000
    dc.w $ffa8,$fff0
    dc.w $ffa8,$0000
    dc.w $ffb8,$fff0
    dc.w $ffb8,$0000
    dc.w $ffc8,$fff0
    dc.w $ffc8,$0000
    dc.w $ffd8,$fff0
    dc.w $ffd8,$0000
    dc.w $ffe8,$fff0
    dc.w $ffe8,$0000
    dc.w $fff8,$fff0
    dc.w $fff8,$0000
    dc.w $0008,$fff0
    dc.w $0008,$0000
    dc.w $0018,$fff0
    dc.w $0018,$0000
    dc.w $0028,$fff0
    dc.w $0028,$0000
    dc.w $0038,$fff0
    dc.w $0038,$0000
    dc.w $0048,$fff0
    dc.w $00a8,$0000

;###############################################
loc_0c281e:
    dc.w $0000,$ffb0
    dc.w $0000,$ffc0
    dc.w $0000,$ffe0
    dc.w $0000,$fff0
    dc.w $0020,$ffb0
    dc.w $0000,$ffb0
    dc.w $006d,$ffe8

;###############################################
loc_0c283a:
    dc.w $0000,$ffe0
    dc.w $0000,$fff0
    dc.w $0010,$ffd0
    dc.w $0020,$ffc0
    dc.w $0030,$ffc0
    dc.w $0040,$ffc0
    dc.w $0050,$ffd0
    dc.w $0030,$ffb0
    dc.w $0050,$ffb0
    dc.w $0050,$ffc0
    dc.w $0060,$ffd0
    dc.w $0070,$ffc0
    dc.w $0050,$ffe8

;###############################################
loc_0c286e:
    dc.w $0000,$fff0
    dc.w $0020,$ffe0
    dc.w $0040,$ffd0
    dc.w $0050,$ffd0
    dc.w $0050,$ffe0
    dc.w $0060,$ffe0
    dc.w $0060,$ffd0
    dc.w $0070,$ffe0
    dc.w $0070,$fff0
    dc.w $0080,$ffd0
    dc.w $0080,$fff0
    dc.w $0058,$fff8

;###############################################
loc_0c289e:
    dc.w $0000,$0000
    dc.w $0020,$0000
    dc.w $0040,$0020
    dc.w $0050,$0020
    dc.w $0060,$0020
    dc.w $0070,$0000
    dc.w $0070,$0010
    dc.w $0080,$0000
    dc.w $0080,$0020
    dc.w $0048,$0000

;###############################################
loc_0c28c6:
    dc.w $0000,$0000
    dc.w $0000,$0010
    dc.w $0010,$0000
    dc.w $0020,$0030
    dc.w $0030,$0010
    dc.w $0030,$0020
    dc.w $0030,$0030
    dc.w $0040,$0030
    dc.w $0030,$0030
    dc.w $0030,$0040
    dc.w $0050,$0040
    dc.w $0060,$0020
    dc.w $0070,$0020
    dc.w $0038,$0000

;###############################################
loc_0c28fe:
    dc.w $0000,$0000
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0000,$0040
    dc.w $0010,$0010
    dc.w $0020,$0020
    dc.w $0020,$0030
    dc.w $0020,$0040
    dc.w $0000,$0040
    dc.w $0028,$ffe0

;###############################################
loc_0c2926:
    dc.w $ffd0,$0020
    dc.w $ffd0,$0030
    dc.w $ffd0,$0040
    dc.w $ffe0,$0010
    dc.w $ffe0,$0020
    dc.w $ffe0,$0040
    dc.w $fff0,$0000
    dc.w $fff0,$0010
    dc.w $ffc0,$0040
    dc.w $ffa8,$0018

;###############################################
loc_0c294e:
    dc.w $ff90,$0020
    dc.w $ffa0,$0020
    dc.w $ffb0,$0010
    dc.w $ffe0,$0000
    dc.w $ffe0,$0010
    dc.w $fff0,$0010
    dc.w $ff80,$0020
    dc.w $ff90,$0020
    dc.w $ffa0,$0030
    dc.w $ffc0,$0030
    dc.w $ffc0,$0040
    dc.w $fff0,$fffb

loc_0c297e:
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$0020
    dc.w $ffa0,$0010
    dc.w $ffb0,$0010
    dc.w $ff70,$0000
    dc.w $ff70,$0020
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$0020
    dc.w $fffd,$fff3

;###############################################
loc_0c29aa:
    dc.w $ff80,$ffe0
    dc.w $ff80,$fff0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffe0
    dc.w $ffb0,$ffd0
    dc.w $ffb0,$ffe0
    dc.w $ff70,$ffd0
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff80,$ffd0
    dc.w $ff80,$fff0
    dc.w $ffe4,$fffe

;###############################################
loc_0c29da:
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffc0
    dc.w $ffb0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$fff0
    dc.w $ff80,$ffc0
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffb0
    dc.w $ffb0,$ffb0
    dc.w $ffc0,$ffc0
    dc.w $ffb0,$ffe8

;###############################################
loc_0c2a0e:
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffc0
    dc.w $ffb0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$fff0
    dc.w $ff80,$ffc0
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffb0
    dc.w $ffb0,$ffb0
    dc.w $ffc0,$ffc0
    dc.w $ffa9,$ffea

;###############################################
loc_0c2a42:
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffc0
    dc.w $ffb0,$ffc0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$fff0
    dc.w $ff80,$ffc0
    dc.w $ff90,$ffc0
    dc.w $ff90,$ffd0
    dc.w $ffa0,$ffb0
    dc.w $ffb0,$ffb0
    dc.w $ffc0,$ffc0
    dc.w $ff98,$ffe0

;###############################################
loc_0c2a76:
    dc.w $ffd0,$ffb0
    dc.w $ffd0,$ffc0
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffe0
    dc.w $fff0,$fff0
    dc.w $ffc0,$ffb0
    dc.w $000c,$0000


;Stage objects
;###############################################
loc_0c2a92:
    dc.w $fff8,$001b
    dc.w $0017,$ffed
    dc.w $0027,$ffed
    dc.w $ffe7,$ffed
    dc.w $fff7,$ffed
    dc.w $ffef,$ffe0
    dc.w $ffff,$ffe0
    dc.w $0000,$ffd0

;###############################################
loc_0c2ab2:
    dc.w $fff8,$000b
    dc.w $0017,$ffed
    dc.w $0027,$fffd
    dc.w $ffe7,$ffed
    dc.w $ffef,$ffe0
    dc.w $ffef,$fff0
    dc.w $ffff,$fff0
    dc.w $0000,$ffd0

;###############################################
loc_0c2ad2:
    dc.w $fff8,$000b
    dc.w $0017,$ffed
    dc.w $0027,$fffd
    dc.w $ffe7,$ffed
    dc.w $ffef,$ffe0
    dc.w $0000,$ffd0

;###############################################
loc_0c2aea:
    dc.w $fff8,$000b
    dc.w $0017,$ffed
    dc.w $0027,$fffd
    dc.w $ffe7,$ffed
    dc.w $ffef,$ffe0
    dc.w $ffef,$fff0
    dc.w $ffff,$fff0
    dc.w $fff0,$ffd0
    dc.w $0000,$ffd0

;###############################################
loc_0c2b0e:
    dc.w $ffa8,$0008
    dc.w $ffc8,$0008
    dc.w $ffc8,$0018
    dc.w $ffd8,$fff8
    dc.w $ff70,$0018
    dc.w $ffd0,$fff8
    dc.w $ffd0,$0008
    dc.w $ffd0,$0028
    dc.w $0040,$fff8
    dc.w $0040,$0028

;###############################################
loc_0c2b36:
    dc.w $ff88,$ffd3
    dc.w $ff88,$ffe3
    dc.w $ff98,$ffc3
    dc.w $ffa8,$ffb3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$ffd3
    dc.w $ffc8,$ffe3
    dc.w $ffd8,$ffd3
    dc.w $ffd8,$ffe3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $fff8,$ffd3
    dc.w $fff8,$ffe3
    dc.w $0008,$ffd3
    dc.w $0018,$ffd3
    dc.w $0028,$ffd3
    dc.w $0048,$ffc3
    dc.w $0048,$ffd3
    dc.w $0048,$ffe3
    dc.w $0058,$ffc3
    dc.w $0058,$ffd3
    dc.w $0058,$ffe3
    dc.w $0068,$ffc3
    dc.w $0068,$ffd3
    dc.w $0068,$ffe3
    dc.w $ffc8,$ff8b
    dc.w $ffc8,$ffbb
    dc.w $ffd8,$ffbb

;###############################################
loc_0c2ba6:
    dc.w $ff88,$ffd3
    dc.w $ff88,$ffe3
    dc.w $ff98,$ffc3
    dc.w $ffa8,$ffb3
    dc.w $ffc8,$ffc3
    dc.w $ffc8,$ffd3
    dc.w $ffc8,$ffe3
    dc.w $ffd8,$ffd3
    dc.w $ffd8,$ffe3
    dc.w $ffe8,$ffd3
    dc.w $ffe8,$ffe3
    dc.w $fff8,$ffd3
    dc.w $fff8,$ffe3
    dc.w $0008,$ffd3
    dc.w $0018,$ffd3
    dc.w $0028,$ffd3
    dc.w $0048,$ffc3
    dc.w $0048,$ffd3
    dc.w $0048,$ffe3
    dc.w $0058,$ffc3
    dc.w $0058,$ffd3
    dc.w $0058,$ffe3
    dc.w $0068,$ffc3
    dc.w $0068,$ffd3
    dc.w $0068,$ffe3
    dc.w $ffc8,$ff8b
    dc.w $ffc8,$ff9b
    dc.w $ffc8,$ffab
    dc.w $ffc8,$ffbb
    dc.w $ffd8,$ff8b
    dc.w $ffd8,$ffbb

;###############################################
loc_0c2c22:
    dc.w $fff0,$ffa0
    dc.w $fff0,$ffb0
    dc.w $0000,$ffa0
    dc.w $0010,$ffb0
    dc.w $ff50,$ffe0
    dc.w $ff60,$ffa0
    dc.w $ff70,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $0010,$ffd0
    dc.w $0070,$ffe0
    dc.w $0090,$ffa0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2c5a:
    dc.w $ffe0,$ffb0
    dc.w $fff0,$ffb0
    dc.w $0010,$ffb0
    dc.w $ff50,$ffe0
    dc.w $ff60,$ffa0
    dc.w $ff70,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $0010,$ffd0
    dc.w $0070,$ffe0
    dc.w $0090,$ffa0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2c8e:
    dc.w $ffe0,$ffb0
    dc.w $fff0,$ffb0
    dc.w $0010,$ffb0
    dc.w $0010,$ffc0
    dc.w $ff50,$ffe0
    dc.w $ff60,$ffa0
    dc.w $ff70,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $0010,$ffd0
    dc.w $0070,$ffe0
    dc.w $0090,$ffa0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2cc6:
    dc.w $ffe0,$ffb0
    dc.w $fff0,$ffb0
    dc.w $fff0,$ffd0
    dc.w $ff50,$ffe0
    dc.w $ff60,$ffa0
    dc.w $ff70,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $0010,$ffd0
    dc.w $0070,$ffe0
    dc.w $0090,$ffa0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2cfa:
    dc.w $ffe0,$ffb0
    dc.w $ffe0,$ffc0
    dc.w $fff0,$ffb0
    dc.w $fff0,$ffd0
    dc.w $ff50,$ffe0
    dc.w $ff60,$ffa0
    dc.w $ff70,$ffe0
    dc.w $ffe0,$ffd0
    dc.w $fff0,$ffd0
    dc.w $fff0,$ffe0
    dc.w $0010,$ffd0
    dc.w $0070,$ffe0
    dc.w $0090,$ffa0
    dc.w $00a0,$ffe0

;###############################################
loc_0c2d32:
    dc.w $0009,$0050
    dc.w $0009,$0060
    dc.w $0019,$0020
    dc.w $0019,$0040
    dc.w $0019,$0060
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2d6e:
    dc.w $0009,$0050
    dc.w $0009,$0060
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0060
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2daa:
    dc.w $0009,$0050
    dc.w $0009,$0060
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0019,$0060
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2de2:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2e16:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0049,$0050
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2e4e:
    dc.w $0009,$0050
    dc.w $0009,$0060
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2e7e:
    dc.w $0009,$0050
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2eb2:
    dc.w $0009,$0050
    dc.w $0019,$0020
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2ee6:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2f16:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2f3e:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0049,$0050
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c2f72:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070
    dc.w $0036,$0070

;###############################################
loc_0c2fa2:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0006,$0070
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c2fe2:
    dc.w $0019,$0020
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0070
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c301a:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c3052:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c3082:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0049,$0050
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c30ba:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0070
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c30f6:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0006,$0070
    dc.w $0016,$0060
    dc.w $0036,$0060
    dc.w $0036,$0070

;###############################################
loc_0c312e:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070
    dc.w $0036,$0070

;###############################################
loc_0c3166:
    dc.w $0019,$0020
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0020
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0039,$0020
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c319a:
    dc.w $0019,$0030
    dc.w $0019,$0040
    dc.w $0019,$0050
    dc.w $0029,$0010
    dc.w $0029,$0030
    dc.w $0029,$0050
    dc.w $0039,$0000
    dc.w $0039,$0010
    dc.w $0049,$0020
    dc.w $0006,$0060
    dc.w $0026,$0070

;###############################################
loc_0c31c6:
    dc.w $ff28,$0000
    dc.w $ff78,$0000
    dc.w $ff78,$0010
    dc.w $ff88,$0000
    dc.w $ff88,$0010
    dc.w $ff98,$0000
    dc.w $ff98,$0010
    dc.w $ffa8,$0000
    dc.w $ffb8,$0000
    dc.w $ffd8,$0000
    dc.w $ffd8,$0010
    dc.w $ffe8,$0000
    dc.w $ffe8,$0010
    dc.w $fff8,$0000
    dc.w $fff8,$0010
    dc.w $0008,$0000
    dc.w $0008,$0010
    dc.w $0018,$0000
    dc.w $0018,$0010
    dc.w $0028,$0000
    dc.w $0048,$0000
    dc.w $0058,$0000
    dc.w $0058,$0010
    dc.w $0068,$0000
    dc.w $0068,$0010
    dc.w $0078,$0000
    dc.w $0078,$0010
    dc.w $0088,$0000

;###############################################
loc_0c3236:
    dc.w $007f,$ffa8
    dc.w $ffdc,$ffa2
    dc.w $ffec,$ffa2
    dc.w $ffd7,$ffc7
    dc.w $ffd7,$ffd7
    dc.w $0007,$ffc7
    dc.w $0017,$ffe7

;###############################################
loc_0c3252:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $0003,$fffd
    dc.w $0003,$000d
    dc.w $0013,$000d

;###############################################
loc_0c326a:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $fff3,$fffd
    dc.w $fff3,$000d
    dc.w $0003,$fffd

;###############################################
loc_0c3282:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $fff3,$000d
    dc.w $0003,$000d
    dc.w $0013,$fffd

;###############################################
loc_0c329a:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $fff3,$000d
    dc.w $0003,$001d
    dc.w $0013,$fffd
    dc.w $0013,$000d

;###############################################
loc_0c32b6:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $fff3,$000d
    dc.w $0013,$001d

;###############################################
loc_0c32ca:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $0003,$fffd

;###############################################
loc_0c32da:
    dc.w $ffab,$fff5
    dc.w $ffbb,$ffe5
    dc.w $002b,$ffe5
    dc.w $0003,$fffd
    dc.w $0003,$000d

;###############################################
loc_0c32ee:
    dc.w $ffb2,$0010
    dc.w $ffc2,$0010
    dc.w $ffc0,$ffa0
    dc.w $ffd0,$ffd0
    dc.w $ffe0,$ffb0
    dc.w $fff0,$ffd0
    dc.w $001e,$ffb2
    dc.w $001e,$ffc2
    dc.w $0010,$0030

;###############################################
loc_0c3312:
    dc.w $fff3,$ffd8
    dc.w $0013,$ffd8
    dc.w $ffe1,$ffab
    dc.w $000f,$ffe8

;###############################################
loc_0c3322:
    dc.w $fffd,$fff0
    dc.w $ffe5,$ffe0

;###############################################
loc_0c332a:
    dc.w $0007,$fff8
    dc.w $fff0,$ffe8

;###############################################
loc_0c3332:
    dc.w $ffd8,$ffc0
    dc.w $ffe8,$ffb0
    dc.w $fff6,$fff0

;###############################################
loc_0c333e:
    dc.w $ffc9,$ffe8
    dc.w $ffc1,$ffe0
    dc.w $0009,$fff0
    dc.w $0028,$ffe8

;###############################################
loc_0c334e:
    dc.w $ffc9,$ffe8
    dc.w $0030,$ffe8
    dc.w $0008,$ffe8
    dc.w $ffe0,$ffd8

;###############################################
loc_0c335e:
    dc.w $ffc9,$ffe8
    dc.w $fff9,$ffd8
    dc.w $0009,$ffe8
    dc.w $ffe0,$ffd8

;###############################################
loc_0c336e:
    dc.w $ffc9,$ffe8
    dc.w $fff9,$ffd8
    dc.w $ffe9,$fff0
    dc.w $0009,$ffe8
    dc.w $ffe0,$ffd8

;###############################################
loc_0c3382:
    dc.w $fff9,$ffd8
    dc.w $ffe9,$fff0
    dc.w $ffd0,$ffe8
    dc.w $ffe0,$ffd8
    dc.w $0009,$ffe8

;###############################################
loc_0c3396:
    dc.w $fff9,$ffd8
    dc.w $0029,$ffe0
    dc.w $ffe9,$fff0
    dc.w $ffd0,$ffe8
    dc.w $ffe0,$ffd8
    dc.w $0009,$ffe8

;###############################################
loc_0c33ae:
    dc.w $fff9,$ffd8
    dc.w $0029,$ffe0
    dc.w $ffe9,$fff0
    dc.w $ffd0,$ffe8

;###############################################
loc_0c33be:
    dc.w $0029,$ffe0
    dc.w $0009,$fff0
    dc.w $ffc1,$ffe0
    dc.w $ffe9,$fff0
    dc.w $0028,$ffe8
    dc.w $ffd0,$ffe8

;###############################################
loc_0c33d6:
    dc.w $0029,$ffe0
    dc.w $0009,$fff0
    dc.w $ffc1,$ffe0
    dc.w $0028,$ffe8
    dc.w $ffd0,$ffe8

;###############################################
loc_0c33ea:
    dc.w $0029,$ffe0
    dc.w $0009,$fff0
    dc.w $ffc1,$ffe0
    dc.w $0030,$ffe8

;###############################################
loc_0c33fa:
    dc.w $ff60,$fff0
    dc.w $ffe0,$ffe0
    dc.w $0000,$ffd0
    dc.w $0030,$ffe0
    dc.w $0060,$fff0
    dc.w $fff0,$ffd0
    dc.w $ff90,$fff0
    dc.w $0020,$ffe0

;###############################################
loc_0c341a:
    dc.w $ffe8,$ffe4
    dc.w $ffd4,$fff5

;###############################################
loc_0c3422:
    dc.w $ff40,$0040
    dc.w $ff70,$0040
    dc.w $ff70,$0090
    dc.w $ff80,$0030
    dc.w $ff80,$0040
    dc.w $ffa0,$0020
    dc.w $ffa0,$0080
    dc.w $ffb0,$0010
    dc.w $ffb0,$0070
    dc.w $ffc0,$0000
    dc.w $ffc0,$0030
    dc.w $ffc0,$0050
    dc.w $ffd0,$fff0
    dc.w $ffe0,$0010
    dc.w $ffe0,$0040
    dc.w $fff0,$0000
    dc.w $fff0,$0040
    dc.w $0010,$0040
    dc.w $0020,$fff0
    dc.w $0020,$0030
    dc.w $0030,$0000
    dc.w $0040,$0010
    dc.w $0050,$0020
    dc.w $0050,$0030
    dc.w $0050,$0080
    dc.w $0050,$0090
    dc.w $0070,$0040
    dc.w $0080,$0040
    dc.w $0090,$0040
    dc.w $ffd0,$0040
    dc.w $fff0,$0020
    dc.w $fff0,$0030
    dc.w $0000,$0020

;###############################################
loc_0c34a6:
    dc.w $ffd4,$ffee
    dc.w $ffec,$ffec
    dc.w $0016,$ffed

;###############################################
loc_0c34b2:
    dc.w $fffb,$ffde
    dc.w $ffe4,$ffe8
    dc.w $ffe4,$fff8
    dc.w $fff4,$ffe8

;###############################################
loc_0c34c2:
    dc.w $ffd0,$0032
    dc.w $ffe0,$0012
    dc.w $0000,$0012
    dc.w $0000,$0022
    dc.w $0010,$0012
    dc.w $fff0,$0000
    dc.w $fff0,$0020
    dc.w $fff0,$0030
    dc.w $0000,$0020
    dc.w $0010,$0000
    dc.w $0010,$0010

;###############################################
loc_0c34ee:
    dc.w $ffd0,$0032
    dc.w $ffe0,$0012
    dc.w $0000,$0012
    dc.w $0000,$0022
    dc.w $0010,$0012
    dc.w $fff0,$0000
    dc.w $fff0,$0030
    dc.w $0000,$0000
    dc.w $0000,$0010
    dc.w $0000,$0020
    dc.w $0010,$0000
    dc.w $0010,$0010

;###############################################
loc_0c351e:
    dc.w $ffd0,$0032
    dc.w $ffe0,$0012
    dc.w $0000,$0012
    dc.w $0000,$0022
    dc.w $0010,$0012
    dc.w $ffe0,$0010
    dc.w $fff0,$0000
    dc.w $fff0,$0010
    dc.w $fff0,$0030
    dc.w $0000,$0000
    dc.w $0010,$0000
    dc.w $0010,$0010

;###############################################
loc_0c354e:
    dc.w $ffa0,$ffac
    dc.w $ffb2,$ffd0
    dc.w $0012,$ffea
    dc.w $0028,$0005
    dc.w $0048,$0010
    dc.w $0058,$0020

;scene
;###############################################
loc_0c3566:
    dc.w $ff40,$ffe8
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff50,$ffe8
    dc.w $ff50,$fff8
    dc.w $ff50,$0008
    dc.w $ff60,$ffe8
    dc.w $ff60,$0008
    dc.w $ff70,$0008
    dc.w $ff80,$ffe8
    dc.w $ff80,$fff8
    dc.w $ff90,$ffe8
    dc.w $0030,$ffe8
    dc.w $0030,$fff8
    dc.w $0030,$0008
    dc.w $0060,$ffe8
    dc.w $0060,$fff8
    dc.w $0060,$0008
    dc.w $0070,$ffe8
    dc.w $0070,$fff8
    dc.w $0070,$0008
    dc.w $0080,$ffe8
    dc.w $0080,$fff8
    dc.w $0080,$0008
    dc.w $0090,$ffe8
    dc.w $0090,$fff8
    dc.w $0090,$0008
    dc.w $00a0,$ffe8
    dc.w $00a0,$fff8
    dc.w $00a0,$0008
    dc.w $00b0,$ffe8
    dc.w $00b0,$fff8
    dc.w $00b0,$0008

;###############################################
loc_0c35ea:
    dc.w $ff40,$ffe8
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff50,$ffe8
    dc.w $ff50,$fff8
    dc.w $ff50,$0008
    dc.w $ff60,$ffe8
    dc.w $ff60,$0008
    dc.w $ff70,$0008
    dc.w $ff80,$ffe8
    dc.w $0030,$ffe8
    dc.w $0030,$fff8
    dc.w $0030,$0008
    dc.w $0060,$ffe8
    dc.w $0060,$fff8
    dc.w $0060,$0008
    dc.w $0070,$ffe8
    dc.w $0070,$fff8
    dc.w $0070,$0008
    dc.w $0080,$ffe8
    dc.w $0080,$fff8
    dc.w $0080,$0008
    dc.w $0090,$ffe8
    dc.w $0090,$fff8
    dc.w $0090,$0008
    dc.w $00a0,$ffe8
    dc.w $00a0,$fff8
    dc.w $00a0,$0008
    dc.w $00b0,$ffe8
    dc.w $00b0,$fff8
    dc.w $00b0,$0008

;###############################################
loc_0c3666:
    dc.w $ff40,$fff0
    dc.w $ff40,$0000
    dc.w $ff50,$ffe0
    dc.w $ff50,$fff0
    dc.w $ff50,$0010
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0010
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff70,$0010
    dc.w $ff80,$ffe0
    dc.w $ff90,$ffe0
    dc.w $ff90,$0010
    dc.w $ffa0,$ffe0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0010
    dc.w $ffb0,$ffe0
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$0010
    dc.w $fff0,$ffe0
    dc.w $fff0,$0000
    dc.w $fff0,$0010
    dc.w $0000,$ffe0
    dc.w $0000,$0010
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0010
    dc.w $0020,$ffe0
    dc.w $0020,$fff0
    dc.w $0020,$0010
    dc.w $0030,$0010
    dc.w $0040,$ffe0
    dc.w $0040,$fff0
    dc.w $0040,$0010
    dc.w $0050,$ffe0
    dc.w $0050,$fff0
    dc.w $0050,$0010
    dc.w $0060,$ffe0
    dc.w $0060,$fff0
    dc.w $0060,$0000
    dc.w $0070,$ffe0
    dc.w $0070,$fff0
    dc.w $0070,$0010
    dc.w $0080,$ffe0
    dc.w $0080,$fff0
    dc.w $0080,$0010
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0000
    dc.w $0090,$0010
    dc.w $00a0,$ffe0
    dc.w $00a0,$0000
    dc.w $00b0,$fff0
    dc.w $00b0,$0000

;###############################################
loc_0c3752:
    dc.w $ff80,$fff1
    dc.w $0080,$fff1

;###############################################
loc_0c375a:
    dc.w $ff40,$ffe8
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff50,$ffe8
    dc.w $ff50,$fff8
    dc.w $ff50,$0008
    dc.w $ff60,$ffe8
    dc.w $ff60,$fff8
    dc.w $ff60,$0008
    dc.w $ff70,$ffe8
    dc.w $ff70,$fff8
    dc.w $ff70,$0008
    dc.w $ff80,$ffe8
    dc.w $ff80,$fff8
    dc.w $ff80,$0008
    dc.w $ff90,$ffe8
    dc.w $ff90,$fff8
    dc.w $ff90,$0008
    dc.w $ffa0,$ffe8
    dc.w $ffa0,$fff8
    dc.w $ffa0,$0008
    dc.w $ffb0,$ffe8
    dc.w $ffb0,$0008
    dc.w $ffc0,$0008
    dc.w $ffd0,$ffe8
    dc.w $ffd0,$fff8
    dc.w $ffe0,$ffe8
    dc.w $0080,$ffe8
    dc.w $0080,$fff8
    dc.w $0080,$0008
    dc.w $00b0,$ffe8
    dc.w $00b0,$fff8
    dc.w $00b0,$0008

loc_0c37de:
    dc.w $ff40,$ffe8
    dc.w $ff40,$fff8
    dc.w $ff40,$0008
    dc.w $ff50,$ffe8
    dc.w $ff50,$fff8
    dc.w $ff50,$0008
    dc.w $ff60,$ffe8
    dc.w $ff60,$fff8
    dc.w $ff60,$0008
    dc.w $ff70,$ffe8
    dc.w $ff70,$fff8
    dc.w $ff70,$0008
    dc.w $ff80,$ffe8
    dc.w $ff80,$fff8
    dc.w $ff80,$0008
    dc.w $ff90,$ffe8
    dc.w $ff90,$fff8
    dc.w $ff90,$0008
    dc.w $ffa0,$ffe8
    dc.w $ffa0,$fff8
    dc.w $ffa0,$0008
    dc.w $ffb0,$ffe8
    dc.w $ffb0,$0008
    dc.w $ffc0,$0008
    dc.w $ffd0,$ffe8
    dc.w $0080,$ffe8
    dc.w $0080,$fff8
    dc.w $0080,$0008
    dc.w $00b0,$ffe8
    dc.w $00b0,$fff8
    dc.w $00b0,$0008

;###############################################
loc_0c385a:
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $ffc0,$fff8
    dc.w $ffd0,$fff8
    dc.w $ffe0,$fff8
    dc.w $fff0,$fff8
    dc.w $0000,$fff8
    dc.w $0010,$fff8
    dc.w $0020,$fff8
    dc.w $0030,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8

;###############################################
loc_0c38aa:
    dc.w $ff40,$fff8
    dc.w $ff50,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $ffc0,$fff8
    dc.w $ffd0,$fff8
    dc.w $ffe0,$fff8
    dc.w $0010,$fff8
    dc.w $0020,$fff8
    dc.w $0030,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00a0,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0c3902:
    dc.w $ff40,$fff8
    dc.w $ff50,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $ffc0,$fff8
    dc.w $ffd0,$fff8
    dc.w $0020,$fff8
    dc.w $0030,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00a0,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0c3952:
    dc.w $ff40,$fff8
    dc.w $ff50,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $ffc0,$fff8
    dc.w $0030,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00a0,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0c399a:
    dc.w $ff40,$fff8
    dc.w $ff50,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff80,$fff8
    dc.w $ff90,$fff8
    dc.w $ffa0,$fff8
    dc.w $ffb0,$fff8
    dc.w $0040,$fff8
    dc.w $0050,$fff8
    dc.w $0060,$fff8
    dc.w $0070,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00a0,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0c39da:
    dc.w $ff40,$fff8
    dc.w $ff60,$fff8
    dc.w $ff70,$fff8
    dc.w $ff90,$fff8
    dc.w $0060,$fff8
    dc.w $0080,$fff8
    dc.w $0090,$fff8
    dc.w $00b0,$fff8

;###############################################
loc_0c39fa:
    dc.w $ff60,$ffe0
    dc.w $ff60,$fff0
    dc.w $ff60,$0000
    dc.w $ff60,$0010
    dc.w $ff70,$ffe0
    dc.w $ff70,$fff0
    dc.w $ff70,$0000
    dc.w $ff70,$0010
    dc.w $ff80,$ffe0
    dc.w $ff80,$fff0
    dc.w $ff80,$0000
    dc.w $ff80,$0010
    dc.w $ff90,$ffe0
    dc.w $ff90,$fff0
    dc.w $ff90,$0000
    dc.w $ff90,$0010
    dc.w $ffa0,$ffe0
    dc.w $ffa0,$fff0
    dc.w $ffa0,$0000
    dc.w $ffa0,$0010
    dc.w $ffb0,$ffe0
    dc.w $ffb0,$fff0
    dc.w $ffb0,$0000
    dc.w $ffb0,$0010
    dc.w $ffc0,$ffe0
    dc.w $ffc0,$fff0
    dc.w $ffc0,$0000
    dc.w $ffc0,$0010
    dc.w $ffd0,$ffe0
    dc.w $ffd0,$fff0
    dc.w $ffd0,$0000
    dc.w $ffd0,$0010
    dc.w $ffe0,$ffe0
    dc.w $ffe0,$fff0
    dc.w $ffe0,$0000
    dc.w $ffe0,$0010
    dc.w $fff0,$ffe0
    dc.w $fff0,$fff0
    dc.w $fff0,$0000
    dc.w $fff0,$0010
    dc.w $0000,$ffe0
    dc.w $0000,$fff0
    dc.w $0000,$0000
    dc.w $0000,$0010
    dc.w $0010,$ffe0
    dc.w $0010,$fff0
    dc.w $0010,$0000
    dc.w $0010,$0010
    dc.w $0020,$ffe0
    dc.w $0020,$fff0
    dc.w $0020,$0000
    dc.w $0020,$0010
    dc.w $0030,$ffe0
    dc.w $0030,$fff0
    dc.w $0030,$0000
    dc.w $0030,$0010
    dc.w $0040,$ffe0
    dc.w $0040,$fff0
    dc.w $0040,$0000
    dc.w $0040,$0010
    dc.w $0050,$ffe0
    dc.w $0050,$fff0
    dc.w $0050,$0000
    dc.w $0050,$0010
    dc.w $0060,$ffe0
    dc.w $0060,$fff0
    dc.w $0060,$0000
    dc.w $0060,$0010
    dc.w $0070,$ffe0
    dc.w $0070,$fff0
    dc.w $0070,$0000
    dc.w $0070,$0010
    dc.w $0080,$ffe0
    dc.w $0080,$fff0
    dc.w $0080,$0000
    dc.w $0080,$0010
    dc.w $0090,$ffe0
    dc.w $0090,$fff0
    dc.w $0090,$0000
    dc.w $0090,$0010
