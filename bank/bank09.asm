;##############################################
loc_090266:
	move.b (4,a6),d0
	move.w loc_090272(pc,d0.w),d1
	jmp loc_090272(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090272:
	dc.w loc_09027a-loc_090272
	dc.w loc_09029a-loc_090272
	dc.w loc_0902d8-loc_090272
	dc.w loc_0902d8-loc_090272

;==============================================
loc_09027a:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	jsr loc_080434
	jmp loc_080470

;==============================================
loc_09029a:
	movea.w ($36,a6),a4
	tst.b ($b9,a4)
	beq.b loc_0902d0
	tst.b ($25c,a4)
	bne.b loc_0902d6
	subq.b #1,($3a,a6)
	bpl.b loc_0902ca
	clr.b ($3a,a6)
	jsr loc_080434
	jsr loc_080470
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_0902d6

loc_0902ca:
	jmp loc_01b4ec

loc_0902d0:
	move.b #4,(4,a6)

loc_0902d6:
	rts

;==============================================
loc_0902d8:
	jmp loc_01c2de

;##############################################
loc_0902de:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0902ec(pc,d0.w),d1
	jmp loc_0902ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0902ec:
	dc.w loc_090312-loc_0902ec
	dc.w loc_090312-loc_0902ec
	dc.w loc_090312-loc_0902ec
	dc.w loc_0903fa-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_09048e-loc_0902ec
	dc.w loc_0905ce-loc_0902ec
	dc.w loc_0906a2-loc_0902ec
	dc.w loc_090798-loc_0902ec
	dc.w loc_09080c-loc_0902ec
	dc.w loc_09080c-loc_0902ec
	dc.w loc_09080c-loc_0902ec
	dc.w loc_09080c-loc_0902ec
	dc.w loc_09080c-loc_0902ec

;==============================================
loc_090312:
	move.b (4,a6),d0
	move.w loc_09031e(pc,d0.w),d1
	jmp loc_09031e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09031e:
	dc.w loc_090326-loc_09031e
	dc.w loc_0903c2-loc_09031e
	dc.w loc_090986-loc_09031e
	dc.w loc_090986-loc_09031e

;----------------------------------------------
loc_090326:
	addq.b #2,(4,a6)
	moveq #0,d0
	movea.w ($36,a6),a4
	move.b #4,(9,a6)
	move.b ($101,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w ($c,a4),($c,a6)
	clr.b ($31,a6)
	move.l ($18,a4),($18,a6)
	jsr loc_01bd5c
	jsr RNGFunction
	andi.w #$1f,d0
	subi.w #$10,d0
	move.w #$ffd0,d1
	tst.b ($b,a6)
	beq.b loc_09037a
	move.w #$1b0,d1

loc_09037a:
	add.w ($10,a3),d1
	add.w d1,d0
	move.w d0,($50,a6)
	move.w d0,($58,a6)
	jsr RNGFunction
	andi.w #$3f,d0
	addi.w #$48,d0
	move.w d0,($54,a6)
	move.w d0,($60,a6)
	bsr.w loc_090c32
	lea.l loc_1ab486,a1
	move.w ($a,a1),d0
	move.w ($c,a1),d1
	lea.l (a1,d0.w),a0
	lea.l (a1,d1.w),a1
	move.l a0,($32,a6)
	move.l a1,($5c,a6)
	rts

;----------------------------------------------
loc_0903c2:
	bsr.w loc_090a58
	moveq #4,d0
	cmp.w ($54,a6),d0
	blt.b loc_0903d8
	ori.b #1,($31,a6)
	move.w d0,($54,a6)

loc_0903d8:
	moveq #$28,d0
	cmp.w ($60,a6),d0
	blt.b loc_0903ea
	ori.b #2,($31,a6)
	move.w d0,($60,a6)

loc_0903ea:
	cmpi.b #3,($31,a6)
	bne.b loc_0903f6
	addq.b #2,(4,a6)

loc_0903f6:
	bra.w loc_090b08

;==============================================
loc_0903fa:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_09040a(pc,d0.w),d1
	jmp loc_09040a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09040a:
	dc.w loc_090412-loc_09040a
	dc.w loc_09044c-loc_09040a
	dc.w loc_090986-loc_09040a
	dc.w loc_090986-loc_09040a

;----------------------------------------------
loc_090412:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b ($b,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w ($c,a4),($c,a6)
	move.l ($18,a4),($18,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($1c,a4),($1c,a6)

;----------------------------------------------
loc_09044c:
	move.b (5,a6),d0
	move.w loc_090458(pc,d0.w),d1
	jmp loc_090458(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090458:
	dc.w loc_09045c-loc_090458
	dc.w loc_090480-loc_090458

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_09045c:
	subq.b #1,($3a,a6)
	bpl.b loc_09047e
	addq.b #2,(5,a6)
	move.b #$10,($3a,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.l ($1c,a4),($1c,a6)

loc_09047e:
	rts

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
loc_090480:
	subq.b #1,($3a,a6)
	bmi.w loc_09098c
	jmp loc_01b4d0

;==============================================
loc_09048e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0904a4(pc,d0.w),d1
	jsr loc_0904a4(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0904a4:
	dc.w loc_0904ac-loc_0904a4
	dc.w loc_090558-loc_0904a4
	dc.w loc_090986-loc_0904a4
	dc.w loc_090986-loc_0904a4

;----------------------------------------------
loc_0904ac:
	addq.b #2,(4,a6)
	move.b ($b,a4),d0
	eor.b d0,($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w ($c,a4),($c,a6)
	move.l ($18,a4),($18,a6)
	move.w ($64,a4),($64,a6)
	move.b ($101,a4),($59,a6)
	move.l ($10,a4),($10,a6)
	move.l #$1000000,($14,a6)
	move.l #0,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #0,d0
	move.b (3,a6),d0
	subq.b #4,d0
	move.b loc_090530(pc,d0.w),($3a,a6)
	add.w d0,d0
	move.w loc_090538(pc,d0.w),d1
	tst.b ($101,a4)
	beq.b loc_090516
	neg.w d1

loc_090516:
	add.w d1,($10,a6)
	move.w loc_090548(pc,d0.w),d1
	add.w d1,($64,a6)
	moveq #3,d0
	movea.l #loc_1ab486,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090530:
	dc.b $00,$08,$10,$18,$20,$28,$30,$00

loc_090538:
	dc.w $ffef,$0027,$ffc8,$0000
	dc.w $0013,$ffdb,$fffe,$0000

loc_090548:
	dc.w $fff7,$fffc,$0000,$0006
	dc.w $003c,$003f,$0046,$0000

;----------------------------------------------
loc_090558:
	move.b (5,a6),d0
	move.w loc_090564(pc,d0.w),d1
	jmp loc_090564(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090564:
	dc.w loc_09056c-loc_090564
	dc.w loc_090578-loc_090564
	dc.w loc_0905a2-loc_090564
	dc.w loc_0905bc-loc_090564

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09056c:
	subq.b #1,($3a,a6)
	bmi.b loc_090574
	rts

loc_090574:
	addq.b #2,(5,a6)

loc_090578:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0905a0
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	addi.b #8,($123,a5)

loc_0905a0:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0905a2:
	move.b ($a,a4),d0
	cmp.b ($a,a6),d0
	bne.b loc_0905bc
	addq.b #2,(7,a6)
	move.b #1,($32,a6)
	jsr loc_01b6b6

loc_0905bc:
	move.b ($a,a4),d0
	bmi.w loc_090994
	cmp.b ($3c,a6),d0
	beq.w loc_090994
	rts

;==============================================
loc_0905ce:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0905de(pc,d0.w),d1
	jmp loc_0905de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0905de:
	dc.w loc_0905e6-loc_0905de
	dc.w loc_090656-loc_0905de
	dc.w loc_090986-loc_0905de
	dc.w loc_090986-loc_0905de

;----------------------------------------------
loc_0905e6:
	addq.b #2,(4,a6)
	moveq #0,d0
	cmpi.b #6,(9,a6)
	scs.b d0
	addq.b #1,d0
	move.b ($b,a4),d1
	eor.b d0,d1
	move.b d1,($b,a6)
	move.w ($64,a4),d0
	addi.w #$ffd8,d0
	move.w d0,($64,a6)
	move.l ($10,a6),($70,a6)
	move.l ($10,a6),($78,a6)
	move.l ($14,a6),($74,a6)
	move.l ($14,a6),($7c,a6)
	move.b #1,($3e,a6)
	move.b #1,($3f,a6)
	bsr.w loc_090b54
	movea.l #loc_1ab486,a1
	move.w ($a,a1),d0
	move.w ($c,a1),d1
	lea.l (a1,d0.w),a0
	lea.l (a1,d1.w),a1
	move.l a0,($58,a6)
	move.l a1,($5c,a6)
	bra.w loc_090aba

;----------------------------------------------
loc_090656:
	bsr.w loc_0909ea
	tst.b ($3e,a6)
	beq.b loc_090674
	tst.w ($44,a6)
	bpl.b loc_090674
	move.w ($64,a6),d0
	cmp.w ($74,a6),d0
	blt.b loc_090674
	clr.b ($3e,a6)

loc_090674:
	tst.b ($3f,a6)
	beq.b loc_09068e
	tst.w ($46,a6)
	bpl.b loc_09068e
	move.w ($64,a6),d0
	cmp.w ($7c,a6),d0
	blt.b loc_09068e
	clr.b ($3f,a6)

loc_09068e:
	tst.b ($3e,a6)
	bne.b loc_09069e
	tst.b ($3f,a6)
	bne.b loc_09069e
	addq.b #2,(4,a6)

loc_09069e:
	bra.w loc_090aba

;==============================================
loc_0906a2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0906b2(pc,d0.w),d1
	jmp loc_0906b2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0906b2:
	dc.w loc_0906ba-loc_0906b2
	dc.w loc_090724-loc_0906b2
	dc.w loc_090986-loc_0906b2
	dc.w loc_090986-loc_0906b2

;----------------------------------------------
loc_0906ba:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b ($b,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w #$116,($c,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	addq.w #4,d0
	move.w d0,($14,a6)
	jsr loc_01bd5c
	moveq #$5e,d0
	tst.b ($101,a4)
	beq.b loc_090708
	move.w #$122,d0

loc_090708:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.b #$52,($3a,a6)
	moveq #2,d0
	movea.l #loc_090d08,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_090724:
	move.b (5,a6),d0
	move.w loc_090730(pc,d0.w),d1
	jmp loc_090730(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090730:
	dc.w loc_090734-loc_090730
	dc.w loc_090784-loc_090730

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090734:
	subq.b #1,($3a,a6)
	bpl.b loc_090776
	addq.b #2,(5,a6)
	move.b #$20,($3a,a6)
	move.b #0,($e,a6)
	moveq #0,d0
	move.b ($101,a4),d0
	lsl.w #2,d0
	move.w loc_09077c(pc,d0.w),($10,a6)
	move.w loc_09077c+2(pc,d0.w),($14,a6)
	jsr loc_01c2c8
	beq.b loc_090776
	move.l #$100150d,(a4)
	move.b ($3a,a6),($3a,a4)
	move.w a6,($36,a4)

loc_090776:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09077c:
	dc.w $002b,$00ca
	dc.w $0154,$00ca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090784:
	subq.b #1,($3a,a6)
	bpl.b loc_090792
	move.l #$4000000,(4,a6)

loc_090792:
	jmp loc_01b4ec

;==============================================
loc_090798:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0907a8(pc,d0.w),d1
	jmp loc_0907a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0907a8:
	dc.w loc_0907b0-loc_0907a8
	dc.w loc_0907f8-loc_0907a8
	dc.w loc_090986-loc_0907a8
	dc.w loc_090986-loc_0907a8

;----------------------------------------------
loc_0907b0:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.b #0,($e,a6)
	move.w ($26,a4),($26,a6)
	move.w d0,($c,a6)
	move.w ($18,a4),($18,a6)
	move.w #$2000,($1a,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #0,d0
	movea.w ($36,a4),a0
	add.b ($101,a0),d0
	movea.l #loc_090d08,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0907f8:
	subq.b #1,($3a,a6)
	bpl.b loc_090806
	move.l #$4000000,(4,a6)

loc_090806:
	jmp loc_01b4ec

;==============================================
loc_09080c:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_090822(pc,d0.w),d1
	jsr loc_090822(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090822:
	dc.w loc_09082a-loc_090822
	dc.w loc_0908ce-loc_090822
	dc.w loc_090986-loc_090822
	dc.w loc_090986-loc_090822

;----------------------------------------------
loc_09082a:
	addq.b #2,(4,a6)
	movea.w ($38,a4),a0
	move.b ($b,a4),d0
	eor.b d0,($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w ($c,a0),($c,a6)
	move.l ($18,a0),($18,a6)
	move.b ($101,a4),($59,a6)
	jsr loc_01bd5c
	move.w ($10,a3),($10,a6)
	tst.b ($101,a4)
	beq.b loc_090870
	addi.w #$180,($10,a6)

loc_090870:
	move.w ($64,a4),($64,a6)
	move.w ($64,a4),($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	subi.b #$e,d0
	add.w d0,d0
	move.w loc_0908be(pc,d0.w),d1
	move.w loc_0908ae(pc,d0.w),d0
	tst.b ($101,a4)
	beq.b loc_090898
	neg.w d0

loc_090898:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	moveq #3,d0
	movea.l #loc_1ab486,a0
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0908ae:
	dc.w $0050,$0080,$0020,$0048
	dc.w $004c,$0000,$0000,$0000

loc_0908be:
	dc.w $fff8,$fffc,$0000,$0004
	dc.w $0040,$0000,$0000,$0000

;----------------------------------------------
loc_0908ce:
	move.b (5,a6),d0
	move.w loc_0908da(pc,d0.w),d1
	jmp loc_0908da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0908da:
	dc.w loc_0908e0-loc_0908da
	dc.w loc_0908fc-loc_0908da
	dc.w loc_090924-loc_0908da

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0908e0:
	move.b ($a,a4),d0
	cmp.b ($a,a6),d0
	bne.b loc_0908fa
	addq.b #2,(5,a6)
	move.b #1,($32,a6)
	jsr loc_01b6b6

loc_0908fa:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0908fc:
	move.b ($a,a4),d0
	cmp.b ($3c,a6),d0
	bne.b loc_090922
	addq.b #2,(5,a6)
	cmpi.b #$f,(3,a6)
	beq.b loc_09091c
	jsr loc_00382c
	bsr.w loc_090994

loc_09091c:
	move.b #0,(9,a6)

loc_090922:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090924:
	movea.l ($1c,a4),a0
	move.b ($10,a0),d0
	beq.b loc_090956
	subq.b #3,d0
	andi.w #3,d0
	lsl.w #2,d0
	move.w loc_090976+2(pc,d0.w),d1
	move.w loc_090976(pc,d0.w),d0
	tst.b ($101,a4)
	bne.b loc_090946
	neg.w d0

loc_090946:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)

loc_090956:
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	cmpi.w #$180,d0
	bls.b loc_090974
	jsr loc_00382c
	bsr.w loc_090994

loc_090974:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090976:
	dc.w $ffe2,$002b,$0013,$0038
	dc.w $0044,$0050,$0064,$0070

;----------------------------------------------
loc_090986:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09098c:
	move.b #4,(4,a6)

loc_090992:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090994:
	cmpi.b #5,(3,a6)
	bne.b loc_0909a0
	bsr.w loc_0909d4

loc_0909a0:
	clr.l (4,a6)
	moveq #0,d0
	move.b (3,a6),d0
	andi.w #$1f,d0
	move.b loc_0909bc(pc,d0.w),($a,a6)
	move.b #$b,(3,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0909bc:
	dc.b $00,$00,$00,$00,$00,$01,$02,$03
	dc.b $04,$05,$06,$00,$00,$00,$07,$08
	dc.b $09,$0a,$0b,$00,$00,$00,$00,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0909d4:
	jsr loc_01c2c8
	beq.b loc_0909e8
	move.l #$100150c,(a4)
	move.w ($36,a6),($36,a4)

loc_0909e8:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0909ea:
	tst.b ($3e,a6)
	beq.b loc_090a20
	move.w ($40,a6),d0
	tst.b ($101,a4)
	beq.b loc_0909fc
	neg.w d0

loc_0909fc:
	ext.l d0
	lsl.l #8,d0
	add.l d0,($70,a6)
	move.w ($48,a6),d0
	add.w d0,($40,a6)
	move.w ($44,a6),d0
	ext.l d0
	lsl.l #8,d0
	add.l d0,($74,a6)
	move.w ($4c,a6),d0
	add.w d0,($44,a6)

loc_090a20:
	tst.b ($3f,a6)
	beq.b loc_090a56
	move.w ($42,a6),d0
	tst.b ($101,a4)
	beq.b loc_090a32
	neg.w d0

loc_090a32:
	ext.l d0
	lsl.l #8,d0
	add.l d0,($78,a6)
	move.w ($4a,a6),d0
	add.w d0,($42,a6)
	move.w ($46,a6),d0
	ext.l d0
	lsl.l #8,d0
	add.l d0,($7c,a6)
	move.w ($4e,a6),d0
	add.w d0,($46,a6)

loc_090a56:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090a58:
	btst #0,($31,a6)
	bne.b loc_090a88
	move.w ($40,a6),d0
	ext.l d0
	lsl.l #8,d0
	add.l d0,($50,a6)
	move.w ($44,a6),d0
	ext.l d0
	lsl.l #8,d0
	add.l d0,($54,a6)
	move.w ($48,a6),d0
	add.w d0,($40,a6)
	move.w ($4c,a6),d0
	add.w d0,($44,a6)

loc_090a88:
	btst #1,($31,a6)
	bne.b loc_090ab8
	move.w ($42,a6),d1
	ext.l d1
	lsl.l #8,d1
	add.l d1,($58,a6)
	move.w ($46,a6),d1
	ext.l d1
	lsl.l #8,d1
	add.l d1,($60,a6)
	move.w ($4a,a6),d1
	add.w d1,($42,a6)
	move.w ($4e,a6),d1
	add.w d1,($46,a6)

loc_090ab8:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090aba:
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.w #1,d0
	beq.b loc_090ae8
	tst.b ($3e,a6)
	beq.w loc_090992
	move.l ($58,a6),($1c,a6)
	move.l ($70,a6),($10,a6)
	move.l ($74,a6),($14,a6)
	jmp loc_01b4d0

loc_090ae8:
	tst.b ($3f,a6)
	beq.w loc_090992
	move.l ($5c,a6),($1c,a6)
	move.l ($78,a6),($10,a6)
	move.l ($7c,a6),($14,a6)
	jmp loc_01b4d0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090b08:
	move.b ($80,a5),d0
	add.b ($b5,a5),d0
	andi.w #1,d0
	beq.b loc_090b32
	btst #0,($31,a6)
	bne.b loc_090b52
	move.l ($32,a6),($1c,a6)
	move.l ($50,a6),($10,a6)
	move.l ($54,a6),($14,a6)
	bra.b loc_090b4c

loc_090b32:
	btst #1,($31,a6)
	bne.b loc_090b52
	move.l ($5c,a6),($1c,a6)
	move.l ($58,a6),($10,a6)
	move.l ($60,a6),($14,a6)

loc_090b4c:
	jmp loc_01b4d0

loc_090b52:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090b54:
	moveq #0,d0
	move.b ($a,a6),d0
	lsl.w #4,d0
	lea.l loc_090b72(pc,d0.w),a0
	move.l (a0)+,($40,a6)
	move.l (a0)+,($44,a6)
	move.l (a0)+,($48,a6)
	move.l (a0)+,($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090b72:
	dc.l $ff00fe80,$018000c0,$00080000,$ffd8ffd0
	dc.l $05c006f0,$02c000e0,$fff80000,$ffd8ffd0
	dc.l $fa80f930,$02400100,$00080000,$ffd8ffd0
	dc.l $014003b0,$02000120,$fff80000,$ffd8ffd0
	dc.l $03000400,$044000d0,$fff80000,$ffd0ffc8
	dc.l $fe00fd00,$048000f0,$00080000,$ffd0ffc8
	dc.l $00800100,$04c00110,$fff80000,$ffd0ffc8
	dc.l $04000500,$02000100,$fff80000,$ffd8ffd0
	dc.l $03000100,$03000080,$fff80000,$ffd8ffd0
	dc.l $03000400,$03000200,$fff80000,$ffd8ffd0
	dc.l $01000080,$06000480,$00000000,$ffd8ffd0
	dc.l $028002c0,$04000100,$fff80000,$ffd0ffc8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_090c32:
	jsr RNGFunction
	andi.w #$70,d0
	move.b d0,($3c,a6)
	move.w loc_090c88(pc,d0.w),($40,a6)
	move.w loc_090c88+2(pc,d0.w),($48,a6)
	move.w loc_090c88+4(pc,d0.w),($44,a6)
	move.w loc_090c88+6(pc,d0.w),($4c,a6)
	move.w loc_090c88+8(pc,d0.w),($42,a6)
	move.w loc_090c88+$a(pc,d0.w),($4a,a6)
	move.w loc_090c88+$c(pc,d0.w),($46,a6)
	move.w loc_090c88+$e(pc,d0.w),($4e,a6)
	tst.b ($b,a6)
	beq.b loc_090c86
	neg.w ($40,a6)
	neg.w ($48,a6)
	neg.w ($42,a6)
	neg.w ($4a,a6)

loc_090c86:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090c88:
	dc.w $0620,$fff8,$0310,$ffd0,$0710,$0000,$00c0,$ffc8
	dc.w $0640,$fff8,$0320,$ffd0,$0730,$0000,$00d0,$ffc8
	dc.w $0660,$fff8,$0330,$ffd0,$0750,$0000,$00e0,$ffc8
	dc.w $0680,$fff8,$0340,$ffd0,$0770,$0000,$00f0,$ffc8
	dc.w $06a0,$fff8,$0340,$ffd0,$0790,$0000,$00d0,$ffc8
	dc.w $06c0,$fff8,$0330,$ffd0,$07b0,$0000,$00e0,$ffc8
	dc.w $06e0,$fff8,$0320,$ffd0,$07d0,$0000,$00f0,$ffc8
	dc.w $0700,$fff8,$0310,$ffd0,$07f0,$0000,$0100,$ffc8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090d08:
	dc.w loc_090d10-loc_090d08
	dc.w loc_090d18-loc_090d08
	dc.w loc_090d20-loc_090d08
	dc.w $0000

loc_090d10:
	dc.w $0140,$0000
	dc.l loc_090d28

loc_090d18:
	dc.w $0140,$0000
	dc.l loc_090d66

loc_090d20:
	dc.w $0140,$0000
	dc.l loc_090da4

loc_090d28:
	dc.w $0008,$0007,$0006
	dc.w $03e1,$001f,$fff8,$ffe8
	dc.w $03e1,$001f,$fff8,$fff8
	dc.w $03f1,$001f,$fff8,$fff8
	dc.w $03f1,$001f,$ffe8,$fff8
	dc.w $0247,$0015,$000c,$0000
	dc.w $0255,$0015,$0014,$0000
	dc.w $024d,$0015,$001c,$0000

loc_090d66:
	dc.w $0008,$0007,$0006
	dc.w $03e1,$001f,$fff8,$ffe8
	dc.w $03e1,$001f,$fff8,$fff8
	dc.w $03f1,$001f,$fff8,$fff8
	dc.w $03f1,$001f,$ffe8,$fff8
	dc.w $0247,$0015,$ffdc,$0000
	dc.w $0255,$0015,$ffe4,$0000
	dc.w $024d,$0015,$ffec,$0000

loc_090da4:
	dc.w $0008,$0004,$0003
	dc.w $0294,$0016,$ffff,$ffff
	dc.w $0294,$0016,$0000,$ffff
	dc.w $0294,$0016,$0000,$0000
	dc.w $0293,$0016,$ffff,$0000

;##############################################
loc_090dca:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_091512
	move.b ($31,a6),d0
	move.w loc_090de6(pc,d0.w),d1
	jmp loc_090de6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090de6:
	dc.w loc_090df4-loc_090de6
	dc.w loc_090e54-loc_090de6
	dc.w loc_090f50-loc_090de6
	dc.w loc_091032-loc_090de6
	dc.w loc_0912c4-loc_090de6
	dc.w loc_0912f4-loc_090de6
	dc.w loc_09140a-loc_090de6

;==============================================
loc_090df4:
	move.b (4,a6),d0
	move.w loc_090e00(pc,d0.w),d1
	jmp loc_090e00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090e00:
	dc.w loc_090e08-loc_090e00
	dc.w loc_090e1a-loc_090e00
	dc.w loc_091512-loc_090e00
	dc.w loc_091516-loc_090e00

;----------------------------------------------
loc_090e08:
	addq.b #2,(4,a6)
	move.b #$ff,($50,a6)
	move.b #4,(9,a6)
	rts

;----------------------------------------------
loc_090e1a:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	movea.l ($1c,a4),a0
	move.b ($13,a0),d0
	cmp.b ($50,a6),d0
	beq.b loc_090e48
	move.b d0,($50,a6)
	bsr.w loc_09151c
	jmp loc_01b4ec

loc_090e48:
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_090e54:
	move.b (4,a6),d0
	move.w loc_090e60(pc,d0.w),d1
	jmp loc_090e60(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090e60:
	dc.w loc_090e68-loc_090e60
	dc.w loc_090ecc-loc_090e60
	dc.w loc_091512-loc_090e60
	dc.w loc_091516-loc_090e60

;----------------------------------------------
loc_090e68:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	subi.w #$10,($14,a6)
	jsr loc_01bd5c
	move.b #0,($b,a6)
	move.w #$1e0,d1
	movea.w ($36,a6),a4
	movea.w ($38,a4),a4
	move.w ($10,a4),d0
	sub.w ($10,a3),d0
	cmpi.w #$c0,d0
	bcs.b loc_090ea8
	move.w #$ffa0,d1
	move.b #1,($b,a6)

loc_090ea8:
	move.w ($10,a3),($10,a6)
	add.w d1,($10,a6)
	move.l #$80000,($40,a6)
	move.w #$b,($3a,a6)
	moveq #$13,d0
	bsr.w loc_09151c
	jmp loc_01b4d0

;----------------------------------------------
loc_090ecc:
	movea.w ($36,a6),a4
	tst.b ($23b,a4)
	bne.w loc_090eea
	move.b (5,a6),d0
	move.w loc_090ef4(pc,d0.w),d1
	jsr loc_090ef4(pc,d1.w)
	jmp loc_01b4d0

loc_090eea:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090ef4:
	dc.w loc_090efa-loc_090ef4
	dc.w loc_090f1c-loc_090ef4
	dc.w loc_090f2e-loc_090ef4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090efa:
	subq.w #1,($3a,a6)
	bne.b loc_090f0a
	addq.b #2,(5,a6)
	move.b #$78,($3a,a6)

loc_090f0a:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_090f16
	neg.l d0

loc_090f16:
	add.l d0,($10,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090f1c:
	subq.b #1,($3a,a6)
	bne.b loc_090f2c
	addq.b #2,(5,a6)
	move.b #$10,($3a,a6)

loc_090f2c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090f2e:
	subq.b #1,($3a,a6)
	bne.b loc_090f3c
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_090f3c:
	move.l #$80000,d0
	tst.b ($b,a6)
	beq.b loc_090f4a
	neg.l d0

loc_090f4a:
	add.l d0,($10,a6)
	rts

;==============================================
loc_090f50:
	move.b (4,a6),d0
	move.w loc_090f5c(pc,d0.w),d1
	jmp loc_090f5c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090f5c:
	dc.w loc_090f64-loc_090f5c
	dc.w loc_090fbc-loc_090f5c
	dc.w loc_091512-loc_090f5c
	dc.w loc_091516-loc_090f5c

;----------------------------------------------
loc_090f64:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	subi.w #$10,($14,a6)
	move.b #$10,($3a,a6)
	jsr loc_01bd5c
	move.b #0,($b,a6)
	move.w #$1e0,d1
	moveq #-$a,d2
	movea.w ($36,a6),a4
	tst.b ($101,a4)
	bne.b loc_090fa2
	move.w #$ffa0,d1
	move.b #1,($b,a6)
	neg.w d2

loc_090fa2:
	move.w ($10,a3),($10,a6)
	add.w d1,($10,a6)
	move.w d2,($40,a6)
	moveq #$13,d0
	bsr.w loc_09151c
	jmp loc_01b4d0

;----------------------------------------------
loc_090fbc:
	move.b (5,a6),d0
	move.w loc_090fc8(pc,d0.w),d1
	jmp loc_090fc8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_090fc8:
	dc.w loc_090fce-loc_090fc8
	dc.w loc_090ff4-loc_090fc8
	dc.w loc_091016-loc_090fc8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090fce:
	subq.b #1,($3a,a6)
	bne.b loc_090fde
	addq.b #2,(5,a6)
	move.b #$3c,($3a,a6)

loc_090fde:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	movea.w ($36,a6),a4
	add.w d0,($10,a4)
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_090ff4:
	subq.b #1,($3a,a6)
	bne.b loc_091010
	addq.b #2,(5,a6)
	move.b #4,($3a,a6)
	move.w ($40,a6),d0
	add.w d0,d0
	neg.w d0
	move.w d0,($40,a6)

loc_091010:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091016:
	subq.b #1,($3a,a6)
	bne.b loc_091024
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_091024:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	jmp loc_01b4d0

;==============================================
loc_091032:
	move.b (4,a6),d0
	move.w loc_09103e(pc,d0.w),d1
	jmp loc_09103e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09103e:
	dc.w loc_091046-loc_09103e
	dc.w loc_09105c-loc_09103e
	dc.w loc_091512-loc_09103e
	dc.w loc_091516-loc_09103e

;----------------------------------------------
loc_091046:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.w #$258,($3a,a6)
	moveq #$30,d0
	bra.w loc_09151c

;----------------------------------------------
loc_09105c:
	move.b ($3c,a6),d0
	add.w d0,d0
	move.w loc_0910a4(pc,d0.w),d1
	jsr loc_0910a4(pc,d1.w)
	movea.w ($38,a6),a4
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)
	moveq #0,d0
	movea.l #loc_26889c,a0
	move.b ($35,a6),d0
	addi.b #$37,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a4)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0910a4:
	dc.w loc_0910ac-loc_0910a4
	dc.w loc_091128-loc_0910a4
	dc.w loc_0911bc-loc_0910a4
	dc.w loc_091260-loc_0910a4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0910ac:
	move.b (5,a6),d0
	move.w loc_0910b8(pc,d0.w),d1
	jmp loc_0910b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0910b8:
	dc.w loc_0910bc-loc_0910b8
	dc.w loc_091100-loc_0910b8

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0910bc:
	addq.b #2,(5,a6)
	move.w #$78,($3a,a6)
	movea.w ($36,a6),a4
	jsr loc_01bd5c
	moveq #-$60,d0
	move.l #$50000,d2
	move.b ($b,a4),d1
	beq.b loc_0910e4
	move.w #$240,d0
	neg.l d2

loc_0910e4:
	move.w ($10,a3),($10,a6)
	add.w d0,($10,a6)
	move.l d2,($40,a6)
	eori.b #1,d1
	move.b d1,($b,a6)
	moveq #$30,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_091100:
	subq.w #1,($3a,a6)
	bne.b loc_09111a
	addq.b #2,(4,a6)
	clr.b (5,a6)
	movea.w ($38,a6),a4
	addq.b #2,(4,a4)
	clr.b (5,a4)

loc_09111a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091128:
	move.b (5,a6),d0
	move.w loc_091134(pc,d0.w),d1
	jmp loc_091134(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091134:
	dc.w loc_09113c-loc_091134
	dc.w loc_09117a-loc_091134
	dc.w loc_0911a4-loc_091134
	dc.w loc_0911b6-loc_091134

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_09113c:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	jsr loc_01bd5c
	moveq #-$60,d0
	move.l #$50000,d2
	move.b ($b,a4),d1
	beq.b loc_09115e
	move.w #$240,d0
	neg.l d2

loc_09115e:
	move.w ($10,a3),($10,a6)
	add.w d0,($10,a6)
	move.l d2,($40,a6)
	eori.b #1,d1
	move.b d1,($b,a6)
	moveq #$30,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_09117a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	movea.w ($36,a6),a4
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bhi.w loc_091528
	addq.b #2,(5,a6)
	moveq #$31,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0911a4:
	tst.b ($33,a6)
	bpl.w loc_091528
	addq.b #2,(5,a6)
	moveq #$33,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0911b6:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0911bc:
	move.b (5,a6),d0
	move.w loc_0911c8(pc,d0.w),d1
	jmp loc_0911c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0911c8:
	dc.w loc_0911d0-loc_0911c8
	dc.w loc_09120e-loc_0911c8
	dc.w loc_091238-loc_0911c8
	dc.w loc_091252-loc_0911c8

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0911d0:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	jsr loc_01bd5c
	moveq #-$60,d0
	move.l #$50000,d2
	move.b ($b,a4),d1
	beq.b loc_0911f2
	move.w #$240,d0
	neg.l d2

loc_0911f2:
	move.w ($10,a3),($10,a6)
	add.w d0,($10,a6)
	move.l d2,($40,a6)
	eori.b #1,d1
	move.b d1,($b,a6)
	moveq #$3d,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_09120e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	movea.w ($36,a6),a4
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	addi.w #$20,d0
	cmpi.w #$40,d0
	bhi.w loc_091528
	addq.b #2,(5,a6)
	moveq #$36,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_091238:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($33,a6)
	bpl.w loc_091528
	addq.b #2,(5,a6)
	moveq #$30,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_091252:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091260:
	move.b (6,a6),d0
	move.w loc_09126c(pc,d0.w),d1
	jmp loc_09126c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09126c:
	dc.w loc_091274-loc_09126c
	dc.w loc_09127e-loc_09126c
	dc.w loc_091296-loc_09126c
	dc.w loc_0912a8-loc_09126c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_091274:
	addq.b #2,(6,a6)
	moveq #$31,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_09127e:
	tst.b ($33,a6)
	bpl.w loc_091528
	addq.b #2,(6,a6)
	move.w #$78,($3a,a6)
	moveq #$34,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_091296:
	subq.w #1,($3a,a6)
	bne.w loc_091528
	addq.b #2,(6,a6)
	moveq #$32,d0
	bra.w loc_09151c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0912a8:
	tst.b ($33,a6)
	bpl.w loc_091528
	clr.b (5,a6)
	clr.b (6,a6)
	move.w #$12c,($3a,a6)
	moveq #$30,d0
	bra.w loc_09151c

;==============================================
loc_0912c4:
	move.b (4,a6),d0
	move.w loc_0912d0(pc,d0.w),d1
	jmp loc_0912d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0912d0:
	dc.w loc_0912d8-loc_0912d0
	dc.w loc_0912e8-loc_0912d0
	dc.w loc_091512-loc_0912d0
	dc.w loc_091516-loc_0912d0

;----------------------------------------------
loc_0912d8:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	moveq #$37,d0
	bra.w loc_09151c

;----------------------------------------------
loc_0912e8:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0912f4:
	move.b (4,a6),d0
	move.w loc_091300(pc,d0.w),d1
	jmp loc_091300(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091300:
	dc.w loc_091308-loc_091300
	dc.w loc_09137a-loc_091300
	dc.w loc_091512-loc_091300
	dc.w loc_091516-loc_091300

;----------------------------------------------
loc_091308:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	subi.w #$10,($14,a6)
	jsr loc_01bd5c
	move.b #0,($b,a6)
	move.w #$1e0,d1
	moveq #-$22,d2
	movea.w ($36,a6),a4
	tst.b ($b,a4)
	bne.b loc_091340
	move.w #$ffa0,d1
	move.b #1,($b,a6)
	neg.w d2

loc_091340:
	move.w ($10,a3),($10,a6)
	add.w d1,($10,a6)
	move.w ($10,a6),($10,a4)
	add.w d2,($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$39,($14,a4)
	move.l #$40000,($40,a6)
	move.w #$1e,($3a,a6)
	moveq #$13,d0
	bsr.w loc_09151c
	jmp loc_01b4d0

;----------------------------------------------
loc_09137a:
	movea.w ($36,a6),a4
	tst.b ($23b,a4)
	bne.w loc_091398
	move.b (5,a6),d0
	move.w loc_0913a2(pc,d0.w),d1
	jsr loc_0913a2(pc,d1.w)
	jmp loc_01b4d0

loc_091398:
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0913a2:
	dc.w loc_0913a8-loc_0913a2
	dc.w loc_0913d6-loc_0913a2
	dc.w loc_0913e8-loc_0913a2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0913a8:
	subq.w #1,($3a,a6)
	bne.b loc_0913b8
	addq.b #2,(5,a6)
	move.b #$78,($3a,a6)

loc_0913b8:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0913c4
	neg.l d0

loc_0913c4:
	add.l d0,($10,a6)
	add.l d0,($10,a4)
	movea.w ($38,a4),a0
	add.w d0,($10,a0)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0913d6:
	subq.b #1,($3a,a6)
	bne.b loc_0913e6
	addq.b #2,(5,a6)
	move.b #$10,($3a,a6)

loc_0913e6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0913e8:
	subq.b #1,($3a,a6)
	bne.b loc_0913f6
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_0913f6:
	move.l #$100000,d0
	tst.b ($b,a6)
	beq.b loc_091404
	neg.l d0

loc_091404:
	add.l d0,($10,a6)
	rts

;==============================================
loc_09140a:
	move.b (4,a6),d0
	move.w loc_091416(pc,d0.w),d1
	jmp loc_091416(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091416:
	dc.w loc_09141e-loc_091416
	dc.w loc_09142e-loc_091416
	dc.w loc_091512-loc_091416
	dc.w loc_091516-loc_091416

;----------------------------------------------
loc_09141e:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	moveq #$3a,d0
	bra.w loc_09151c

;----------------------------------------------
loc_09142e:
	move.b (5,a6),d0
	move.w loc_09143a(pc,d0.w),d1
	jmp loc_09143a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09143a:
	dc.w loc_091442-loc_09143a
	dc.w loc_0914a8-loc_09143a
	dc.w loc_0914d6-loc_09143a
	dc.w loc_0914f4-loc_09143a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091442:
	movea.w ($38,a6),a4
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	tst.b ($34,a4)
	beq.b loc_091494
	addq.b #2,(5,a6)
	move.l #0,($44,a6)
	move.l #$ffff8000,($4c,a6)
	movea.w ($36,a6),a3
	move.w ($10,a3),($10,a6)
	addi.w #$10,($14,a6)
	move.b ($b,a3),($b,a6)
	moveq #$3b,d0
	bsr.w loc_09151c
	jmp loc_01b4d0

loc_091494:
	moveq #$39,d0
	tst.b ($35,a4)
	beq.b loc_09149e
	moveq #$3a,d0

loc_09149e:
	bsr.w loc_09151c
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0914a8:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0914d0
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	moveq #$3c,d0
	bsr.w loc_09151c

loc_0914d0:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0914d6:
	tst.b ($33,a6)
	bpl.b loc_0914e8
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	addq.b #2,(7,a4)

loc_0914e8:
	jsr loc_01b6b6
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0914f4:
	movea.w ($36,a6),a4
	tst.b ($34,a4)
	beq.b loc_091506
	addq.b #2,(4,a6)
	clr.b (5,a6)

loc_091506:
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_091512:
	addq.b #2,(4,a6)

loc_091516:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09151c:
	movea.l #loc_26889c,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091528:
	jmp loc_01b6b6

;##############################################
loc_09152e:
	movea.w ($38,a6),a4
	move.b (4,a6),d0
	move.w loc_09153e(pc,d0.w),d1
	jmp loc_09153e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09153e:
	dc.w loc_091546-loc_09153e
	dc.w loc_0915b0-loc_09153e
	dc.w loc_091678-loc_09153e
	dc.w loc_0916c6-loc_09153e

;==============================================
loc_091546:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #4,(9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b ($e,a4),($e,a6)
	move.b ($f,a4),($f,a6)
	move.w #$2000,($1a,a6)
	move.w ($18,a4),($18,a6)
	move.l d0,($20,a6)
	move.w d0,($24,a6)
	move.b #1,($30,a6)
	move.b ($59,a4),($59,a6)
	lea.l ($60,a6),a0
	move.l a0,($1c,a6)
	lea.l ($70,a6),a1
	move.l a1,($64,a6)
	bsr.w loc_091842
	bsr.w loc_0916cc
	jsr loc_003886
	move.b ($284,a4),d0
	move.b d0,($3a,a6)
	bra.w loc_091728

;==============================================
loc_0915b0:
	bsr.w loc_0916cc
	tst.w ($284,a4)
	beq.b loc_091602
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_091602
	move.b ($284,a4),d0
	cmp.b ($3a,a6),d0
	beq.b loc_0915ee
	clr.b (5,a6)
	move.b d0,($3a,a6)
	bsr.w loc_091842
	bsr.w loc_091832
	jsr loc_003886
	bsr.w loc_091728
	bra.b loc_0915fc

loc_0915ee:
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_09160a(pc,d0.w),d1
	jsr loc_09160a(pc,d1.w)

loc_0915fc:
	jmp loc_01b4d0

loc_091602:
	addq.b #2,(4,a6)
	bra.w loc_09183a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09160a:
	dc.w loc_091610-loc_09160a
	dc.w loc_091640-loc_09160a
	dc.w loc_091676-loc_09160a

;----------------------------------------------
loc_091610:
	subq.b #1,($3b,a6)
	bne.b loc_09163e
	cmpi.b #1,($6ebb,a5)
	bcs.b loc_09163e
	addq.b #2,(5,a6)
	move.b #$c,($3b,a6)
	jsr loc_01c368
	addq.b #1,(a4)
	move.w #$1e00,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2e,a6)

loc_09163e:
	rts

;----------------------------------------------
loc_091640:
	subq.b #1,($3b,a6)
	bne.b loc_09164e
	addq.b #2,(5,a6)
	bra.w loc_09178e

loc_09164e:
	cmpi.b #6,($3b,a6)
	bne.b loc_091674
	tst.b ($284,a4)
	bne.b loc_091674
	jsr loc_01c368
	beq.b loc_091674
	addq.b #1,(a4)
	move.w #$1e01,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2c,a6)

loc_091674:
	rts

;----------------------------------------------
loc_091676:
	rts

;==============================================
loc_091678:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	movea.w ($36,a4),a0
	cmpa.w a6,a0
	bne.b loc_09168c
	clr.w ($36,a4)

loc_09168c:
	tst.w ($2c,a6)
	beq.b loc_0916a8
	movea.w ($2c,a6),a4
	movea.w ($36,a4),a0
	cmpa.w a6,a0
	bne.b loc_0916a8
	move.b #6,(4,a4)
	clr.w ($2c,a6)

loc_0916a8:
	tst.w ($2e,a6)
	beq.b loc_0916c4
	movea.w ($2e,a6),a4
	movea.w ($36,a4),a0
	cmpa.w a6,a0
	bne.b loc_0916c4
	move.b #6,(4,a4)
	clr.w ($2e,a6)

loc_0916c4:
	rts

;==============================================
loc_0916c6:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0916cc:
	moveq #0,d0
	move.b ($102,a4),d0
	add.w d0,d0
	move.w loc_0916e8(pc,d0.w),d0
	add.w ($14,a4),d0
	move.w ($10,a4),($10,a6)
	move.w d0,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0916e8:
	dc.w $005e,$005e,$005e,$0063
	dc.w $0053,$0068,$0070,$0061
	dc.w $0068,$0063,$005b,$0075
	dc.w $005e,$005a,$0061,$0062
	dc.w $006b,$005b,$0000,$0062
	dc.w $0000,$0066,$0055,$0000
	dc.w $0057,$0060,$0058,$0062
	dc.w $0066,$0052,$0055,$0055

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091728:
	move.b #5,($3b,a6)
	move.b ($3a,a6),d0
	bsr.w loc_0917b8
	move.b d0,d1
	lea.l ($70,a6),a1
	lsr.b #3,d1
	add.b d0,d0
	andi.w #$1e,d0
	andi.w #$1e,d1
	bne.b loc_091758
	move.b #1,($31,a6)
	movem.l loc_0917a0(pc),d2-d4
	bra.b loc_091764

loc_091758:
	move.b #2,($31,a6)
	movem.l loc_0917ac(pc),d2-d4

loc_091764:
	movem.l d2-d4,(a1)
	move.w loc_091776(pc,d0.w),($7c,a6)
	move.w loc_091776(pc,d1.w),($7e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091776:
	dc.w $097d,$08d5,$08e5,$08f5
	dc.w $0905,$0915,$0925,$0935
	dc.w $0945,$0955,$097e,$0000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09178e:
	clr.b ($31,a6)
	lea.l ($70,a6),a1
	move.w loc_09179e(pc),(a1)
	bra.w loc_09183a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09179e:
	dc.w $0012

loc_0917a0:
	dc.w $000a,$0001,$0000,$0015
	dc.l loc_091826

loc_0917ac:
	dc.w $000a,$0002,$0001,$0015
	dc.l loc_09182a

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0917b8:
	andi.w #$ff,d0
	move.b loc_0917c2(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0917c2:
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

loc_091826:
	dc.w $fff8,$fff0

loc_09182a:
	dc.w $ffff,$fff0
	dc.w $fff1,$fff0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091832:
	move.b #2,($2a0,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09183a:
	move.b #0,($2a0,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091842:
	moveq #0,d0
	moveq #0,d1
	move.w ($288,a4),d0
	move.b ($284,a4),d1
	jsr loc_01bbe4
	moveq #0,d1
	cmp.w ($50,a4),d0
	bls.b loc_091860
	move.w #$117,d1

loc_091860:
	move.w d1,($c,a6)
	rts

;##############################################
loc_091866:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_091876(pc,d0.w),d1
	jmp loc_091876(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091876:
	dc.w loc_09187e-loc_091876
	dc.w loc_0918c6-loc_091876
	dc.w loc_091cce-loc_091876
	dc.w loc_091cce-loc_091876

;==============================================
loc_09187e:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b #1,($30,a6)
	move.b ($f,a4),($f,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	move.b (3,a6),d0
	beq.b loc_0918c4
	addq.b #1,($d,a6)
	moveq #$c,d0
	jsr loc_02fc88

loc_0918c4:
	moveq #0,d0

;==============================================
loc_0918c6:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0918d4(pc,d0.w),d1
	jmp loc_0918d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0918d4:
	dc.w loc_0918dc-loc_0918d4
	dc.w loc_091928-loc_0918d4
	dc.w loc_091a38-loc_0918d4
	dc.w loc_091be2-loc_0918d4

;----------------------------------------------
loc_0918dc:
	move.b (5,a6),d0
	move.w loc_0918e8(pc,d0.w),d1
	jmp loc_0918e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0918e8:
	dc.w loc_0918ec-loc_0918e8
	dc.w loc_091910-loc_0918e8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0918ec:
	addq.b #2,(5,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b #$31,d0
	movea.l ($2b0,a4),a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091910:
	btst #0,($35,a4)
	beq.b loc_091922
	addq.b #2,(4,a6)
	clr.b (5,a6)
	rts

loc_091922:
	jmp loc_01b4d0

;----------------------------------------------
loc_091928:
	move.b (5,a6),d0
	move.w loc_091934(pc,d0.w),d1
	jmp loc_091934(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091934:
	dc.w loc_09193c-loc_091934
	dc.w loc_09195e-loc_091934
	dc.w loc_09199e-loc_091934
	dc.w loc_0919ec-loc_091934

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09193c:
	addq.b #2,(5,a6)
	moveq #6,d0
	tst.b ($b,a6)
	bne.b loc_09194a
	neg.l d0

loc_09194a:
	moveq #0,d1
	bsr.w loc_091ce6
	move.w #$244,d0
	bsr.w loc_091cd4
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09195e:
	btst #0,($35,a4)
	beq.b loc_091998
	addq.b #2,(5,a6)
	moveq #-$19,d0
	tst.b ($b,a6)
	bne.b loc_091974
	neg.l d0

loc_091974:
	moveq #-3,d1
	bsr.w loc_091ce6
	move.w #$a0,d0
	bsr.w loc_091cd4
	jsr loc_01c2c8
	beq.b loc_0919e6
	addq.b #1,(a4)
	move.w #$1802,(2,a4)
	move.w ($36,a6),($36,a4)

loc_091998:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09199e:
	btst #0,($35,a4)
	bne.b loc_0919e6
	addq.b #2,(5,a6)
	moveq #-$44,d0;bc
	move.l #$fff80000,d2
	moveq #0,d3
	tst.b ($b,a6)
	bne.b loc_0919c0
	neg.l d0
	neg.l d2
	neg.l d3

loc_0919c0:
	move.l d2,($40,a6)
	move.l d3,($48,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	moveq #$38,d1
	bsr.w loc_091ce6
	move.w #$c8,d0
	bsr.w loc_091cd4

loc_0919e6:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0919ec:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_091a1c
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_091a1c
	addq.b #2,(4,a6)

loc_091a1c:
	jsr loc_01b490
	move.b ($b5,a5),d2
	add.b ($b4,a5),d2
	andi.w #1,d2
	beq.b loc_091a36
	jmp loc_01b4d0

loc_091a36:
	rts

;----------------------------------------------
loc_091a38:
	move.b (5,a6),d0
	move.w loc_091a44(pc,d0.w),d1
	jmp loc_091a44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091a44:
	dc.w loc_091a4a-loc_091a44
	dc.w loc_091a72-loc_091a44
	dc.w loc_091b16-loc_091a44

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091a4a:
	addq.b #2,(5,a6)
	moveq #$e,d0
	tst.b ($b,a6)
	bne.b loc_091a58
	neg.l d0

loc_091a58:
	moveq #$e,d1
	bsr.w loc_091ce6
	moveq #3,d0
	lea.l loc_1eda74,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091a72:
	tst.b ($35,a4)
	bne.w loc_091b10
	moveq #0,d0
	addq.b #2,(5,a6)
	move.w d0,(6,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.l #$40000,d0
	move.l #$110000,d1
	move.w #$340,d2
	move.w #$2c0,d3
	move.w #$0,d4
	move.w #$0,d5
	tst.b ($b,a6)
	bne.b loc_091aba
	neg.l d0
	neg.l d1
	neg.l d2
	neg.l d3
	neg.l d4
	neg.l d5

loc_091aba:
	move.w d2,($40,a6)
	move.w d3,($42,a6)
	move.w d4,($48,a6)
	move.w d5,($4a,a6)
	move.w #$500,($44,a6)
	move.w #$400,($46,a6)
	move.w #$ff60,($4c,a6)
	move.w #$ff60,($4e,a6)
	move.l #$340000,d2
	move.l #$4d0000,d3
	add.l ($10,a6),d0
	add.l ($10,a6),d1
	add.l ($14,a6),d2
	add.l ($14,a6),d3
	move.l d0,($50,a6)
	move.l d1,($54,a6)
	move.l d2,($58,a6)
	move.l d3,($5c,a6)
	bra.b loc_091b16

loc_091b10:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091b16:
	jsr loc_01b6b6
	move.w ($64,a4),d1
	tst.b (6,a6)
	bne.b loc_091b5e
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($50,a6)
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($58,a6)
	move.w ($48,a6),d0
	add.w d0,($40,a6)
	move.w ($4c,a6),d0
	add.w d0,($44,a6)
	cmp.w ($58,a6),d1
	bcs.b loc_091b5e
	move.b #$ff,(6,a6)
	move.w d1,($58,a6)

loc_091b5e:
	tst.b (7,a6)
	bne.b loc_091b9c
	move.w ($42,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($54,a6)
	move.w ($46,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($5c,a6)
	move.w ($4a,a6),d0
	add.w d0,($42,a6)
	move.w ($4e,a6),d0
	add.w d0,($46,a6)
	cmp.w ($5c,a6),d1
	bcs.b loc_091b9c
	move.b #-1,(7,a6)
	move.w d1,($5c,a6)

loc_091b9c:
	move.w ($50,a6),d0
	move.w ($58,a6),d1
	move.b (6,a6),d2
	move.b ($b5,a5),d3
	add.b ($b4,a5),d3
	andi.b #1,d3
	beq.b loc_091bc2
	move.w ($54,a6),d0
	move.w ($5c,a6),d1
	move.b (7,a6),d2

loc_091bc2:
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	cmpi.w #$ffff,(6,a6)
	bne.b loc_091bd6
	addq.b #2,(4,a6)

loc_091bd6:
	tst.b d2
	bne.b loc_091be0
	jmp loc_01b4d0

loc_091be0:
	rts

;----------------------------------------------
loc_091be2:
	move.b (5,a6),d0
	move.w loc_091bee(pc,d0.w),d1
	jmp loc_091bee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091bee:
	dc.w loc_091bf6-loc_091bee
	dc.w loc_091c20-loc_091bee
	dc.w loc_091c4c-loc_091bee
	dc.w loc_091c9e-loc_091bee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091bf6:
	addq.b #2,(5,a6)
	eori.b #1,($b,a6)
	moveq #$2f,d0
	add.w d0,d0
	movea.l #loc_1e95d2,a0
	adda.w (a0,d0.w),a0
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	jsr loc_01b4d0
	bra.w loc_091cf8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091c20:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	tst.b ($35,a4)
	bpl.b loc_091c42
	addq.b #2,(5,a6)
	move.l #0,($44,a6)
	move.l #$ffffe800,($4c,a6)

loc_091c42:
	jsr loc_01b4d0
	bra.w loc_091cf8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091c4c:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	tst.b (9,a0)
	beq.b loc_091c98
	addq.b #2,(5,a6)
	move.l #$80000,d0
	tst.b ($b,a6)
	beq.b loc_091c7c
	neg.l d0

loc_091c7c:
	move.l d0,($40,a6)
	move.l #$0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffffc800,($4c,a6)

loc_091c98:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091c9e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	cmpi.w #$100,($14,a6)
	bcs.b loc_091cc2
	addq.b #2,(4,a6)

loc_091cc2:
	jsr loc_01b692
	jmp loc_01b4d0

;==============================================
loc_091cce:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091cd4:
	lea.l loc_1e95d2,a0
	add.w (a0),d0
	lea.l (a0,d0.w),a0
	move.l a0,($1c,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091ce6:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091cf8:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	moveq #0,d0
	move.b ($10,a0),d0
	lsl.w #2,d0
	move.w loc_091d2a+2(pc,d0.w),d1
	move.w loc_091d2a(pc,d0.w),d0
	tst.b ($b,a4)
	beq.b loc_091d18
	neg.w d0

loc_091d18:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091d2a:
	dc.w $0000,$0000
	dc.w $ffbd,$0012
	dc.w $ffc1,$001f

;##############################################
loc_091d36:
	move.b (3,a6),d0
	add.b d0,d0
	move.w loc_091d44(pc,d0.w),d1
	jmp loc_091d44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091d44:
	dc.w loc_091d4a-loc_091d44
	dc.w loc_091d4a-loc_091d44
	dc.w loc_091dec-loc_091d44

;==============================================
loc_091d4a:
	move.b (4,a6),d0
	move.w loc_091d56(pc,d0.w),d1
	jmp loc_091d56(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091d56
	dc.w loc_091d5e-loc_091d56
	dc.w loc_091db6-loc_091d56
	dc.w loc_091f3a-loc_091d56
	dc.w loc_091f40-loc_091d56

;----------------------------------------------
loc_091d5e:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.b #1,($30,a6)
	move.b (3,a6),d0
	lsl.w #3,d0
	movea.l loc_091da6(pc,d0.w),a0
	move.w loc_091da6+4(pc,d0.w),d1
	move.w loc_091da6+6(pc,d0.w),d0
	move.l #$10000,d2
	tst.b ($b,a6)
	bne.b loc_091d90
	neg.w d1
	neg.l d2

loc_091d90:
	add.w ($10,a6),d1
	move.w d1,($10,a6)
	move.w d1,($4c,a6)
	move.l d2,($40,a6)
	jmp loc_01b6e0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091da6:
	dc.l loc_2e50a0
	dc.w $0080,$000f

	dc.l loc_17befa
	dc.w $0000,$0000

;----------------------------------------------
loc_091db6:
	tst.b ($125,a5)
	bne.b loc_091dda
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d0
	sub.w ($4c,a6),d0
	addi.w #$20,d0
	cmpi.w #$40,d0
	bcs.b loc_091dda
	addq.b #2,(4,a6)

loc_091dda:
	jsr loc_01b6b6
	jsr loc_01b490
	jmp loc_01b4d0

;==============================================
loc_091dec:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_091dfc(pc,d0.w),d1
	jmp loc_091dfc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091dfc:
	dc.w loc_091e04-loc_091dfc
	dc.w loc_091e3c-loc_091dfc
	dc.w loc_091f3a-loc_091dfc
	dc.w loc_091f40-loc_091dfc

;----------------------------------------------
loc_091e04:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b ($102,a4),(7,a6)
	move.b #4,(9,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b d0,($f,a6)
	move.l ($18,a4),($18,a6)
	move.w d0,($26,a6)
	move.b d0,($3a,a6)
	subq.b #2,($d,a6)
	clr.b ($a,a6)

loc_091e3c:
	move.b ($102,a4),d0
	cmp.b (7,a6),d0
	bne.w loc_091f3a
	move.b (5,a6),d0
	move.w loc_091e64(pc,d0.w),d1
	jsr loc_091e64(pc,d1.w)
	btst #0,($3a,a6)
	bne.b loc_091e62
	jmp loc_01b4d0

loc_091e62:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091e64:
	dc.w loc_091e68-loc_091e64
	dc.w loc_091ef8-loc_091e64

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091e68:
	move.b ($35,a4),d0
	bne.b loc_091ea6
	addq.b #2,(5,a6)
	clr.b ($3b,a6)
	move.l #$40000,d0
	moveq #0,d1
	tst.b ($b,a6)
	beq.b loc_091e86
	neg.l d0

loc_091e86:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.w ($64,a4),($64,a6)
	bra.b loc_091ee6

loc_091ea6:
	move.w d0,d2
	subi.w #$d,d2
	lsl.w #2,d2
	move.w loc_091ee8(pc,d2.w),d1
	move.w loc_091ee8+2(pc,d2.w),d2
	move.b ($b,a4),($b,a6)
	beq.b loc_091ec0
	neg.w d1

loc_091ec0:
	add.w ($10,a4),d1
	add.w ($14,a4),d2
	move.w d1,($10,a6)
	move.w d2,($14,a6)
	cmp.b ($a,a6),d0
	beq.b loc_091ee6
	move.b d0,($a,a6)
	lea.l loc_17bf7e,a0
	jmp loc_01b6e0

loc_091ee6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091ee8:
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $ffff,$fffa
	dc.w $0025,$0027

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091ef8:
	bsr.b loc_091f46
	bpl.b loc_091f30
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_091f30
	move.w d0,($14,a6)
	clr.w ($16,a6)
	tst.b ($3b,a6)
	bne.b loc_091f26
	move.l ($44,a6),d0
	neg.l d0
	asr.l #1,d0
	move.l d0,($44,a6)
	addq.b #1,($3b,a6)
	bra.b loc_091f30

loc_091f26:
	addq.b #2,(4,a6)
	move.b #0,($2a0,a4)

loc_091f30:
	subq.b #1,($3a,a6)
	jmp loc_01b6b6

;----------------------------------------------
loc_091f3a:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_091f40:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_091f46:
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
loc_091f68:
	move.b (4,a6),d0
	move.w loc_091f74(pc,d0.w),d1
	jmp loc_091f74(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091f74:
	dc.w loc_091f7c-loc_091f74
	dc.w loc_091fa8-loc_091f74
	dc.w loc_09224e-loc_091f74
	dc.w loc_09224e-loc_091f74

;==============================================
loc_091f7c:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.w d0,($26,a6)
	move.b #0,($e,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_092268
	move.b ($3c,a6),d0
	bsr.w loc_09225c
	bsr.w loc_092792
	moveq #0,d0

loc_091fa8:
	move.b (5,a6),d0
	move.w loc_091fb4(pc,d0.w),d1
	jmp loc_091fb4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091fb4:
	dc.w loc_091fca-loc_091fb4
	dc.w loc_091fde-loc_091fb4
	dc.w loc_09201e-loc_091fb4
	dc.w loc_09203a-loc_091fb4
	dc.w loc_092082-loc_091fb4
	dc.w loc_0920bc-loc_091fb4
	dc.w loc_09210e-loc_091fb4
	dc.w loc_092140-loc_091fb4

	dc.w loc_092170-loc_091fb4
	dc.w loc_0921c0-loc_091fb4
	dc.w loc_0921f2-loc_091fb4

;----------------------------------------------
loc_091fca:
	tst.b ($16,a5)
	bmi.w loc_092254
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_091fde:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.b (6,a6),d0
	move.w loc_091ff8(pc,d0.w),d1
	jsr loc_091ff8(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_091ff8:
	dc.w loc_091ffc-loc_091ff8
	dc.w loc_092012-loc_091ff8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_091ffc:
	subq.w #1,($3a,a6)
	bpl.b loc_092010
	addq.b #2,(6,a6)
	move.w #$40,($3a,a6)
	bra.w loc_0926ee

loc_092010:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_092012:
	subq.w #1,($3a,a6)
	bmi.w loc_092254
	bra.w loc_092770

;----------------------------------------------
loc_09201e:
	tst.b ($16,a5)
	bmi.w loc_092254
	subq.w #1,($3a,a6)
	bpl.b loc_092038
	jsr loc_01b6b6
	jmp loc_01b4ec

loc_092038:
	rts

;----------------------------------------------
loc_09203a:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.b (6,a6),d0
	move.w loc_092054(pc,d0.w),d1
	jsr loc_092054(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092054:
	dc.w loc_092058-loc_092054
	dc.w loc_092060-loc_092054

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_092058:
	addq.b #2,(6,a6)
	bra.w loc_0926ee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_092060:
	bsr.w loc_092770
	subq.w #1,($3a,a6)
	bpl.b loc_092080
	move.w #$100,($3a,a6)
	move.l #$ffc00000,($10,a6)
	move.l #$800000,($14,a6)

loc_092080:
	rts

;----------------------------------------------
loc_092082:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.b (6,a6),d0
	move.w loc_0920a2(pc,d0.w),d1
	jsr loc_0920a2(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0920a2:
	dc.w loc_0920a6-loc_0920a2
	dc.w loc_0920ba-loc_0920a2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0920a6:
	subq.b #1,($3b,a6)
	bpl.b loc_0920ba
	addq.b #2,(6,a6)
	move.b ($3a,a6),d0
	ext.w d0
	add.w d0,($14,a6)

loc_0920ba:
	rts

;----------------------------------------------
loc_0920bc:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.b (6,a6),d0
	move.w loc_0920d0(pc,d0.w),d1
	jmp loc_0920d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0920d0:
	dc.w loc_0920d4-loc_0920d0
	dc.w loc_0920fa-loc_0920d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0920d4:
	subq.w #1,($3a,a6)
	bpl.b loc_0920f8
	addq.b #2,(6,a6)
	moveq #$e,d0
	jsr loc_02fc88
	moveq #0,d0
	move.b ($3c,a6),d0
	movea.l #loc_2044b0,a0
	jmp loc_01b6e0

loc_0920f8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0920fa:
	tst.b ($33,a6)
	bmi.w loc_092254
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_09210e:
	tst.b ($16,a5)
	bmi.w loc_092254
	subq.b #1,($3b,a6)
	bpl.b loc_09212c
	move.b #2,($3b,a6)
	subq.w #1,($2a,a5)
	andi.w #$ff,($2a,a5)

loc_09212c:
	subq.b #1,($3a,a6)
	bpl.b loc_09213e
	move.b #$f,($3a,a6)
	eori.w #1,($28,a5)

loc_09213e:
	rts

;----------------------------------------------
loc_092140:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.w (INP_P2_repeat,a5),d0
	not.w d0
	and.w (INP_P2,a5),d0
	btst #8,d0
	beq.b loc_09216a
	jsr loc_01b6b6
	moveq #0,d0
	move.b ($34,a6),d0
	jsr loc_01fd3a

loc_09216a:
	jmp loc_01b4ec

;----------------------------------------------
loc_092170:
	tst.b ($16,a5)
	bmi.w loc_092254
	subq.b #1,($3a,a6)
	bpl.b loc_0921a6
	move.b #3,($3a,a6)
	moveq #0,d0
	move.b ($3b,a6),d0
	addq.b #1,d0
	cmpi.b #6,d0
	bcs.b loc_092194
	moveq #0,d0

loc_092194:
	move.b d0,($3b,a6)
	lsl.w #2,d0
	move.w loc_0921a8(pc,d0.w),($26,a5)
	move.w loc_0921a8+2(pc,d0.w),($28,a5)

loc_0921a6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0921a8:
	dc.w $0000,$0310
	dc.w $0000,$0290
	dc.w $0180,$0310
	dc.w $0170,$0290
	dc.w $0080,$0210
	dc.w $0080,$0190

;----------------------------------------------
loc_0921c0:
	tst.b ($16,a5)
	bmi.w loc_092254
	move.b (6,a6),d0
	move.w loc_0921da(pc,d0.w),d1
	jsr loc_0921da(pc,d1.w)
	jmp loc_01b6f8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0921da:
	dc.w loc_0921de-loc_0921da
	dc.w loc_0921f0-loc_0921da

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0921de:
	addq.b #2,(6,a6)
	move.b ($3c,a6),d0
	lea.l loc_0929fe(pc),a0
	jmp loc_01b722

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0921f0:
	rts

;----------------------------------------------
loc_0921f2:
	tst.b ($16,a5)
	bmi.w loc_092254
	subq.b #1,($32,a6)
	bne.b loc_092222
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_092212
	bmi.b loc_092218
	btst #6,d0
	bne.b loc_09221e

loc_092212:
	lea.l (8,a0),a0
	bra.b loc_092228

loc_092218:
	movea.l (8,a0),a0
	bra.b loc_092228

loc_09221e:
	st.b ($33,a6)

loc_092222:
	jmp loc_01b4ec

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_092228:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	tst.b ($35,a6)
	bne.b loc_09224c
	move.b ($3a,a6),d0
	move.b d0,($32,a6)
	subq.b #1,d0
	cmpi.b #2,d0
	bcc.b loc_092248
	moveq #2,d0

loc_092248:
	move.b d0,($3a,a6)

loc_09224c:
	rts

;==============================================
loc_09224e:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_092254:
	move.b #4,(4,a6)
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09225c:
	movea.l #loc_2f4284,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_092268:
	moveq #0,d0
	move.b (3,a6),d0
	lsl.w #4,d0
	move.w loc_0922ae(pc,d0.w),($10,a6)
	move.w loc_0922ae+2(pc,d0.w),($14,a6)
	move.w loc_0922ae+4(pc,d0.w),($18,a6)
	move.b loc_0922ae+6(pc,d0.w),($3c,a6)
	move.b loc_0922ae+7(pc,d0.w),(9,a6)
	move.b loc_0922ae+8(pc,d0.w),(5,a6)
	move.b loc_0922ae+9(pc,d0.w),($40,a6)
	move.w loc_0922ae+$a(pc,d0.w),($3a,a6)
	move.w loc_0922ae+$c(pc,d0.w),($c,a6)
	move.b loc_0922ae+$e(pc,d0.w),($41,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0922ae:
	dc.w $00c0,$00b0,$a000
	dc.b $3f,$02,$00,$00
	dc.w $0000,$0000
	dc.b $20,$00

	dc.w $00c0,$00b0,$a000
	dc.b $0b,$04,$00,$00
	dc.w $0000,$0000
	dc.b $04,$00

	dc.w $0060,$00b0,$a000
	dc.b $0c,$02,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00b0,$a000
	dc.b $12,$02,$00,$00
	dc.w $0000,$0000
	dc.b $07,$00

	dc.w $00c0,$0090,$a000
	dc.b $40,$02,$00,$00
	dc.w $0000,$0000
	dc.b $1b,$00

	dc.w $00c0,$00c0,$a000
	dc.b $41,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0048,$00b8,$a000
	dc.b $42,$06,$00,$00
	dc.w $0000,$0000
	dc.b $1f,$00

	dc.w $0148,$00b8,$a000
	dc.b $43,$06,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00d0,$a000
	dc.b $44,$06,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00a0,$a000
	dc.b $45,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00a0,$a000
	dc.b $46,$02,$14,$00
	dc.w $0700,$0000
	dc.b $00,$00

	dc.w $00c0,$00d0,$a000
	dc.b $47,$02,$08,$00
	dc.w $030a,$0000
	dc.b $00,$00

	dc.w $00c0,$00d0,$a000
	dc.b $48,$02,$08,$00
	dc.w $030a,$0000
	dc.b $00,$00

	dc.w $00c0,$00d0,$a000
	dc.b $49,$04,$08,$00
	dc.w $f50a,$0000
	dc.b $26,$00

	dc.w $00b0,$00c0,$6000
	dc.b $4a,$00,$02,$01
	dc.w $0040,$0000
	dc.b $00,$00

	dc.w $0100,$00c0,$6000
	dc.b $4b,$00,$02,$02
	dc.w $0040,$0000
	dc.b $00,$00

	dc.w $00d0,$00c0,$6000
	dc.b $4c,$02,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00d0,$00c0,$6000
	dc.b $4d,$06,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00d0,$00d0,$6000
	dc.b $4e,$04,$02,$03
	dc.w $0040,$0000
	dc.b $00,$00

	dc.w $00d0,$0090,$6000
	dc.b $4f,$04,$02,$04
	dc.w $0040,$0000
	dc.b $00,$00

	dc.w $00c0,$00c0,$6000
	dc.b $50,$04,$00,$00
	dc.w $0000,$0000
	dc.b $25,$00

	dc.w $00b0,$00b0,$a000
	dc.b $0a,$02,$00,$00
	dc.w $0000,$ff05
	dc.b $00,$00

	dc.w $ffc0,$00a0,$6000
	dc.b $51,$04,$06,$05
	dc.w $0100,$0000
	dc.b $27,$00

	dc.w $00d0,$00b0,$e000
	dc.b $52,$06,$04,$00
	dc.w $00c2,$0000
	dc.b $1e,$00

	dc.w $00c0,$00c0,$a000
	dc.b $50,$06,$00,$00
	dc.w $0000,$0000
	dc.b $25,$00

	dc.w $0000,$0000,$e000
	dc.b $54,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00b8,$00b0,$a000
	dc.b $55,$04,$00,$00
	dc.w $0000,$0000
	dc.b $28,$00

	dc.w $00c8,$00b0,$a000
	dc.b $56,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c8,$00b0,$a000
	dc.b $57,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0090,$0047,$e000
	dc.b $58,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0080,$0040,$e000
	dc.b $59,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0070,$0039,$e000
	dc.b $5a,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0060,$0032,$e000
	dc.b $5b,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0050,$0028,$e000
	dc.b $5c,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0100,$0047,$e000
	dc.b $58,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0108,$0040,$e000
	dc.b $59,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0110,$0039,$e000
	dc.b $5a,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0118,$0032,$e000
	dc.b $5b,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0120,$0028,$e000
	dc.b $5c,$04,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$0080,$e000
	dc.b $5d,$00,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c8,$00a0,$e000
	dc.b $51,$02,$0a,$00
	dc.w $00b8,$ff01
	dc.b $00,$00

	dc.w $00e8,$0090,$e000
	dc.b $52,$02,$0a,$00
	dc.w $00ba,$ff01
	dc.b $00,$00

	dc.w $00b8,$00e0,$e000
	dc.b $51,$02,$0a,$00
	dc.w $00bc,$ff01
	dc.b $00,$00

	dc.w $0108,$00a0,$e000
	dc.b $52,$02,$0a,$00
	dc.w $00b8,$ff01
	dc.b $00,$00

	dc.w $00d8,$00b0,$e000
	dc.b $51,$02,$0a,$00
	dc.w $00ba,$ff01
	dc.b $00,$00

	dc.w $0000,$0000,$e000
	dc.b $00,$00,$0c,$00
	dc.w $0305,$0000
	dc.b $00,$00

	dc.w $00c0,$00a0,$e000
	dc.b $6f,$00,$0e,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00b0,$a000
	dc.b $1b,$04,$00,$00
	dc.w $0000,$0000
	dc.b $30,$00

	dc.w $0000,$0000,$e000
	dc.b $00,$00,$10,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0000,$0000,$e000
	dc.b $00,$00,$12,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0000,$0000,$e000
	dc.b $01,$00,$12,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $0000,$0000,$e000
	dc.b $02,$00,$12,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$00b0,$a000
	dc.b $1a,$02,$00,$00
	dc.w $0000,$0000
	dc.b $0b,$00

	dc.w $00c0,$00a8,$a000
	dc.b $31,$02,$00,$00
	dc.w $0000,$0000
	dc.b $15,$00

	dc.w $00c0,$00b0,$a000
	dc.b $29,$02,$00,$00
	dc.w $0000,$0000
	dc.b $0f,$00

	dc.w $00b0,$00b0,$a000
	dc.b $38,$02,$00,$00
	dc.w $0000,$0000
	dc.b $18,$00

	dc.w $00c0,$00c0,$a000
	dc.b $2b,$04,$00,$00
	dc.w $0000,$0000
	dc.b $32,$00

	dc.w $00b0,$0090,$a000
	dc.b $33,$02,$00,$00
	dc.w $0000,$ff02
	dc.b $33,$00

	dc.w $00c0,$00b0,$a000
	dc.b $2c,$02,$00,$00
	dc.w $0000,$0000
	dc.b $34,$00

	dc.w $00c0,$00b0,$a000
	dc.b $30,$02,$00,$00
	dc.w $0000,$ff03
	dc.b $35,$00

	dc.w $00c0,$00b0,$a000
	dc.b $19,$02,$00,$00
	dc.w $0000,$0000
	dc.b $0b,$00

	dc.w $0082,$0040,$e000
	dc.b $5e,$00,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00c0,$0090,$a000
	dc.b $5f,$04,$00,$00
	dc.w $0000,$0000
	dc.b $29,$00

	dc.w $00c0,$00a0,$a000
	dc.b $60,$04,$00,$00
	dc.w $0000,$0000
	dc.b $23,$00

	dc.w $00c0,$00a0,$a000
	dc.b $61,$04,$00,$00
	dc.w $0000,$0000
	dc.b $24,$00

	dc.w $0040,$0070,$a000
	dc.b $62,$02,$00,$00
	dc.w $0000,$0000
	dc.b $31,$00

	dc.w $0140,$0070,$a000
	dc.b $63,$02,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

	dc.w $00b0,$0070,$a000
	dc.b $64,$02,$00,$00
	dc.w $0000,$0000
	dc.b $00,$00

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0926ee:
	moveq #0,d0
	move.b ($40,a6),d0
	lsl.w #4,d0
	move.l loc_092710(pc,d0.w),($40,a6)
	move.l loc_092710+4(pc,d0.w),($44,a6)
	move.l loc_092710+8(pc,d0.w),($48,a6)
	move.l loc_092710+$c(pc,d0.w),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092710:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $fffe0000,$00000000,$00000000,$00000000
	dc.l $00020000,$00000000,$00000000,$00000000
	dc.l $00000000,$00010000,$00000000,$00000000
	dc.l $00000000,$ffff0000,$00000000,$00000000
	dc.l $00010000,$ffffd000,$00000000,$00000000

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_092770:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_092792:
	moveq #0,d0
	move.b ($41,a6),d0
	beq.b loc_0927cc
	lsl.w #3,d0
	move.w loc_0927ce(pc,d0.w),d1
	move.w loc_0927ce+2(pc,d0.w),d2
	move.w loc_0927ce+4(pc,d0.w),d3
	move.w loc_0927ce+6(pc,d0.w),d7
	movea.l #loc_339774,a0
	lsl.w #2,d1
	movea.l (a0,d1.w),a0
	lea.l (a0,d2.w),a0
	lea.l MainpaletteDirect,a1
	lea.l (a1,d3.w),a1
	jmp loc_01fd9e

loc_0927cc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0927ce:
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0001,$0000,$0000,$001d
	dc.w $0002,$0000,$0000,$001d
	dc.w $0003,$0000,$0000,$001d
	dc.w $0004,$0000,$0000,$001d
	dc.w $0005,$0000,$0000,$001d
	dc.w $0006,$0000,$0000,$001d
	dc.w $0007,$0000,$0000,$001d
	dc.w $0008,$0000,$0000,$001d
	dc.w $0009,$0000,$0000,$001d
	dc.w $000a,$0000,$0000,$001d
	dc.w $000b,$0000,$0000,$001d
	dc.w $000c,$0000,$0000,$001d
	dc.w $000d,$0000,$0000,$001d
	dc.w $000e,$0000,$0000,$001d
	dc.w $000f,$0000,$0000,$001d
	dc.w $0010,$0000,$0000,$001d
	dc.w $0011,$0000,$0000,$001d
	dc.w $0016,$0000,$0000,$001d
	dc.w $0018,$0000,$0000,$001d
	dc.w $0019,$0000,$0000,$001d
	dc.w $001a,$0000,$0000,$001d
	dc.w $001b,$0000,$0000,$001d
	dc.w $001c,$0000,$0000,$001d
	dc.w $001d,$0000,$0000,$001d
	dc.w $001e,$0000,$0000,$001d
	dc.w $0030,$0000,$0000,$001d
	dc.w $0031,$0000,$0000,$001d
	dc.w $0032,$0000,$0000,$001d
	dc.w $0033,$0000,$0000,$001d
	dc.w $0034,$0000,$0000,$001d
	dc.w $0035,$0000,$0000,$001d
	dc.w $0038,$0000,$0000,$001d
	dc.w $0039,$0000,$0000,$001d
	dc.w $003a,$0000,$0000,$001d
	dc.w $003b,$0000,$0000,$001d
	dc.w $003c,$0000,$0000,$001d
	dc.w $003d,$0000,$0000,$001d
	dc.w $003e,$0000,$0000,$001d
	dc.w $003f,$0000,$0000,$001d
	dc.w $0040,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $0000,$0000,$0000,$001d
	dc.w $000a,$00e0,$00e0,$0003
	dc.w $0031,$0020,$0020,$0000
	dc.w $0010,$0000,$0000,$0003
	dc.w $001a,$0040,$0080,$0003
	dc.w $0010,$0080,$0080,$0001
	dc.w $0018,$0060,$00c0,$0001
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

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0929fe:
	dc.w loc_092a04-loc_0929fe
	dc.w loc_092aa8-loc_0929fe
	dc.w loc_092b8c-loc_0929fe

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092a04:
	dc.w $0400,$0000
	dc.l loc_092ba8
	dc.w $0400,$0000
	dc.l loc_092bae
	dc.w $0400,$0000
	dc.l loc_092bb4
	dc.w $0400,$0000
	dc.l loc_092bba
	dc.w $0400,$0000
	dc.l loc_092bc0
	dc.w $0400,$0000
	dc.l loc_092bc6
	dc.w $0400,$0000
	dc.l loc_092bcc
	dc.w $0400,$0000
	dc.l loc_092bd2
	dc.w $0400,$0000
	dc.l loc_092bd8
	dc.w $0400,$0000
	dc.l loc_092bde
	dc.w $0400,$0000
	dc.l loc_092be4
	dc.w $0400,$0000
	dc.l loc_092bea
	dc.w $0400,$0000
	dc.l loc_092bf0
	dc.w $0400,$0000
	dc.l loc_092bf6
	dc.w $0400,$0000
	dc.l loc_092bfc
	dc.w $0400,$0000
	dc.l loc_092c02
	dc.w $0400,$0000
	dc.l loc_092c08
	dc.w $0400,$0000
	dc.l loc_092c0e
	dc.w $0400,$0000
	dc.l loc_092c14
	dc.w $0480,$0000
	dc.l loc_092c1a
	dc.l loc_092a04

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092aa8:
	dc.w $0400,$0000
	dc.l loc_092c20
	dc.w $0400,$0000
	dc.l loc_092c38
	dc.w $0400,$0000
	dc.l loc_092c50
	dc.w $0400,$0000
	dc.l loc_092c68
	dc.w $0400,$0000
	dc.l loc_092c80
	dc.w $0400,$0000
	dc.l loc_092c98
	dc.w $0400,$0000
	dc.l loc_092cb0
	dc.w $0400,$0000
	dc.l loc_092cc8
	dc.w $0400,$0000
	dc.l loc_092ce0
	dc.w $0400,$0000
	dc.l loc_092cf8
	dc.w $0400,$0000
	dc.l loc_092d10
	dc.w $0400,$0000
	dc.l loc_092d28
	dc.w $0400,$0000
	dc.l loc_092d40
	dc.w $0400,$0000
	dc.l loc_092d58
	dc.w $0400,$0000
	dc.l loc_092d70
	dc.w $0400,$0000
	dc.l loc_092d88
	dc.w $0400,$0000
	dc.l loc_092da0
	dc.w $0400,$0000
	dc.l loc_092db8
	dc.w $0400,$0000
	dc.l loc_092dd0
	dc.w $0400,$0000
	dc.l loc_092de8
	dc.w $0400,$0000
	dc.l loc_092e00
	dc.w $0400,$0000
	dc.l loc_092e18
	dc.w $0400,$0000
	dc.l loc_092e30
	dc.w $0400,$0000
	dc.l loc_092e48
	dc.w $0400,$0000
	dc.l loc_092e60
	dc.w $0400,$0000
	dc.l loc_092e78
	dc.w $0400,$0000
	dc.l loc_092e90
	dc.w $0480,$0000
	dc.l loc_092ea8
	dc.l loc_092aa8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092b8c:
	dc.w $0400,$0000
	dc.l loc_092ec0
	dc.w $0400,$0000
	dc.l loc_092ec6
	dc.w $0480,$0000
	dc.l loc_092ecc
	dc.l loc_092b8c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092ba8:
	dc.w $0c00,$0024,$0381

loc_092bae:
	dc.w $0c00,$0024,$03a1

loc_092bb4:
	dc.w $0c00,$0024,$03c1

loc_092bba:
	dc.w $0c00,$0024,$03e1

loc_092bc0:
	dc.w $0c00,$0024,$0401

loc_092bc6:
	dc.w $0c00,$0024,$0421

loc_092bcc:
	dc.w $0c00,$0024,$0441

loc_092bd2:
	dc.w $0c00,$0024,$0461

loc_092bd8:
	dc.w $0c00,$0024,$0481

loc_092bde:
	dc.w $0c00,$0024,$04a1

loc_092be4:
	dc.w $0c00,$0024,$04c1

loc_092bea:
	dc.w $0c00,$0024,$04e1

loc_092bf0:
	dc.w $0c00,$0024,$0501

loc_092bf6:
	dc.w $0c00,$0024,$0521

loc_092bfc:
	dc.w $0c00,$0024,$0541

loc_092c02:
	dc.w $0c00,$0024,$0561

loc_092c08:
	dc.w $0c00,$0024,$0581

loc_092c0e:
	dc.w $0c00,$0024,$05a1

loc_092c14:
	dc.w $0c00,$0024,$05c1

loc_092c1a:
	dc.w $0c00,$0024,$05e1


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092c20:
	dc.w $0080
	dc.w $0018,$04c0,$00a0
	dc.w $0018,$0840,$00c0
	dc.w $0018,$0140,$0fe0
	dc.w $0024,$0001

loc_092c38:
	dc.w $0080
	dc.w $0018,$04e0,$00a0
	dc.w $0018,$0860,$00c0
	dc.w $0018,$0160,$0fe0
	dc.w $0024,$0021

loc_092c50:
	dc.w $0080
	dc.w $0018,$0500,$00a0
	dc.w $0018,$0880,$00c0
	dc.w $0018,$0180,$0fe0
	dc.w $0024,$0041

loc_092c68:
	dc.w $0080
	dc.w $0018,$0520,$00a0
	dc.w $0018,$08a0,$00c0
	dc.w $0018,$01a0,$0fe0
	dc.w $0024,$0061

loc_092c80:
	dc.w $0080
	dc.w $0018,$0540,$00a0
	dc.w $0018,$08c0,$00c0
	dc.w $0018,$01c0,$0fe0
	dc.w $0024,$0081

loc_092c98:
	dc.w $0080
	dc.w $0018,$0560,$00a0
	dc.w $0018,$08e0,$00c0
	dc.w $0018,$01e0,$0fe0
	dc.w $0024,$00a1

loc_092cb0:
	dc.w $0080
	dc.w $0018,$0580,$00a0
	dc.w $0018,$0900,$00c0
	dc.w $0018,$0200,$0fe0
	dc.w $0024,$00c1

loc_092cc8:
	dc.w $0080
	dc.w $0018,$05a0,$00a0
	dc.w $0018,$0920,$00c0
	dc.w $0018,$0220,$0fe0
	dc.w $0024,$00e1

loc_092ce0:
	dc.w $0080
	dc.w $0018,$05c0,$00a0
	dc.w $0018,$0940,$00c0
	dc.w $0018,$0240,$0fe0
	dc.w $0024,$0101

loc_092cf8:
	dc.w $0080
	dc.w $0018,$05e0,$00a0
	dc.w $0018,$0960,$00c0
	dc.w $0018,$0260,$0fe0
	dc.w $0024,$0121

loc_092d10:
	dc.w $0080
	dc.w $0018,$0600,$00a0
	dc.w $0018,$0980,$00c0
	dc.w $0018,$0280,$0fe0
	dc.w $0024,$0141

loc_092d28:
	dc.w $0080
	dc.w $0018,$0620,$00a0
	dc.w $0018,$09a0,$00c0
	dc.w $0018,$02a0,$0fe0
	dc.w $0024,$0161

loc_092d40:
	dc.w $0080
	dc.w $0018,$0640,$00a0
	dc.w $0018,$09c0,$00c0
	dc.w $0018,$02c0,$0fe0
	dc.w $0024,$0181

loc_092d58:
	dc.w $0080
	dc.w $0018,$0660,$00a0
	dc.w $0018,$09e0,$00c0
	dc.w $0018,$02e0,$0fe0
	dc.w $0024,$01a1

loc_092d70:
	dc.w $0080
	dc.w $0018,$0680,$00a0
	dc.w $0018,$0a00,$00c0
	dc.w $0018,$0300,$0fe0
	dc.w $0024,$01c1

loc_092d88:
	dc.w $0080
	dc.w $0018,$06a0,$00a0
	dc.w $0018,$0a20,$00c0
	dc.w $0018,$0320,$0fe0
	dc.w $0024,$01e1

loc_092da0:
	dc.w $0080
	dc.w $0018,$06c0,$00a0
	dc.w $0018,$0a40,$00c0
	dc.w $0018,$0340,$0fe0
	dc.w $0024,$0201

loc_092db8:
	dc.w $0080
	dc.w $0018,$06e0,$00a0
	dc.w $0018,$0a60,$00c0
	dc.w $0018,$0360,$0fe0
	dc.w $0024,$0221

loc_092dd0:
	dc.w $0080
	dc.w $0018,$0700,$00a0
	dc.w $0018,$0a80,$00c0
	dc.w $0018,$0380,$0fe0
	dc.w $0024,$0241

loc_092de8:
	dc.w $0080
	dc.w $0018,$0720,$00a0
	dc.w $0018,$0aa0,$00c0
	dc.w $0018,$03a0,$0fe0
	dc.w $0024,$0261

loc_092e00:
	dc.w $0080
	dc.w $0018,$0740,$00a0
	dc.w $0018,$0ac0,$00c0
	dc.w $0018,$03c0,$0fe0
	dc.w $0024,$0281

loc_092e18:
	dc.w $0080
	dc.w $0018,$0760,$00a0
	dc.w $0018,$0ae0,$00c0
	dc.w $0018,$03e0,$0fe0
	dc.w $0024,$02a1

loc_092e30:
	dc.w $0080
	dc.w $0018,$0780,$00a0
	dc.w $0018,$0b00,$00c0
	dc.w $0018,$0400,$0fe0
	dc.w $0024,$02c1

loc_092e48:
	dc.w $0080
	dc.w $0018,$07a0,$00a0
	dc.w $0018,$0b20,$00c0
	dc.w $0018,$0420,$0fe0
	dc.w $0024,$02e1

loc_092e60:
	dc.w $0080
	dc.w $0018,$07c0,$00a0
	dc.w $0018,$0b40,$00c0
	dc.w $0018,$0440,$0fe0
	dc.w $0024,$0301

loc_092e78:
	dc.w $0080
	dc.w $0018,$07e0,$00a0
	dc.w $0018,$0b60,$00c0
	dc.w $0018,$0460,$0fe0
	dc.w $0024,$0321

loc_092e90:
	dc.w $0080
	dc.w $0018,$0800,$00a0
	dc.w $0018,$0b80,$00c0
	dc.w $0018,$0480,$0fe0
	dc.w $0024,$0341

loc_092ea8:
	dc.w $0080
	dc.w $0018,$0820,$00a0
	dc.w $0018,$0ba0,$00c0
	dc.w $0018,$04a0,$0fe0
	dc.w $0024,$0361

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092ec0:
	dc.w $0000
	dc.w $0018,$0c41

loc_092ec6:
	dc.w $0000
	dc.w $0018,$0c61

loc_092ecc:
	dc.w $0000
	dc.w $0018,$0c81

;##############################################
loc_092ed2:
	jsr loc_01c2c8
	beq.b loc_092ef6
	addq.b #1,(a4)
	move.b ($b,a6),($b,a4)
	move.b #$1b,(2,a4)
	move.b d1,(3,a4)
	move.b ($59,a6),($59,a4)
	move.w a6,($36,a4)

loc_092ef6:
	rts

;##############################################
loc_092ef8:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_092f0a(pc,d0.w),d1
	jmp loc_092f0a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092f0a:
	dc.w loc_092f0e-loc_092f0a
	dc.w loc_093046-loc_092f0a

;==============================================
loc_092f0e:
	move.b (4,a6),d0
	move.w loc_092f1a(pc,d0.w),d1
	jmp loc_092f1a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092f1a:
	dc.w loc_092f22-loc_092f1a
	dc.w loc_092f8a-loc_092f1a
	dc.w loc_09317c-loc_092f1a
	dc.w loc_093182-loc_092f1a

;----------------------------------------------
loc_092f22:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #1,($30,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	move.w #$180,d0
	tst.b ($b,a6)
	beq.b loc_092f56
	neg.w d0

loc_092f56:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($64,a4),($14,a6)
	move.l #$40000,($40,a6)
	move.l #0,($48,a6)
	move.b #$a3,d0
	movea.l #loc_276258,a0
	jsr loc_01b6e0
	jmp loc_0a51b6

;----------------------------------------------
loc_092f8a:
	tst.b ($12a,a5)
	bne.w loc_093190
	move.b (5,a6),d0
	move.w loc_092f9e(pc,d0.w),d1
	jmp loc_092f9e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_092f9e:
	dc.w loc_092fa6-loc_092f9e
	dc.w loc_092ff2-loc_092f9e
	dc.w loc_093008-loc_092f9e
	dc.w loc_093028-loc_092f9e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_092fa6:
	jsr loc_01b6b6
	bsr.w loc_093196
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	subi.w #$40,d0
	cmpi.w #$100,d0
	bhi.b loc_092fec
	addq.b #2,(5,a6)
	move.l #$4000,($48,a6)
	moveq #$24,d0
	jsr loc_00390e
	move.b #$a4,d0
	movea.l #loc_276258,a0
	jsr loc_01b6e0

loc_092fec:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_092ff2:
	jsr loc_01b6b6
	tst.b ($35,a6)
	beq.b loc_093002
	addq.b #2,(5,a6)

loc_093002:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093008:
	bsr.w loc_093196
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$50,d0
	cmpi.w #$220,d0
	bls.b loc_093028
	addq.b #2,(4,a6)

loc_093028:
	tst.b ($35,a6)
	beq.b loc_09303a
	clr.b ($35,a6)
	moveq #$25,d0
	jsr loc_00390e

loc_09303a:
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_093046:
	move.b (4,a6),d0
	move.w loc_093052(pc,d0.w),d1
	jmp loc_093052(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093052:
	dc.w loc_09305a-loc_093052
	dc.w loc_0930d4-loc_093052
	dc.w loc_09317c-loc_093052
	dc.w loc_093182-loc_093052

;----------------------------------------------
loc_09305a:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #1,($30,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	jsr loc_01bd5c
	move.w #$fea0,d0
	tst.b ($b,a6)
	bne.b loc_093096
	move.w #$2e0,d0

loc_093096:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.w ($64,a4),($14,a6)
	move.l #$c0000,($40,a6)
	move.l #0,($48,a6)
	move.l #0,($44,a6)
	move.l #0,($4c,a6)
	move.b #$ac,d0
	movea.l #loc_276258,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0930d4:
	tst.b ($12a,a5)
	bne.w loc_093190
	move.b (5,a6),d0
	move.w loc_0930e8(pc,d0.w),d1
	jmp loc_0930e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0930e8:
	dc.w loc_0930ec-loc_0930e8
	dc.w loc_093150-loc_0930e8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0930ec:
	movea.w ($36,a6),a4
	tst.b ($35,a6)
	beq.b loc_093102
	clr.b ($35,a6)
	moveq #$25,d0
	jsr loc_00390e

loc_093102:
	movea.l ($1c,a4),a0
	tst.b (9,a0)
	beq.b loc_093140
	addq.b #2,(5,a6)
	move.l #$fff60000,($40,a6)
	move.l #$0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	move.w #$a5,d0
	movea.l #loc_276258,a0
	jsr loc_01b6e0

loc_093140:
	bsr.w loc_0931b0
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093150:
	bsr.w loc_0931b0
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$50,d0
	cmpi.w #$220,d0
	bls.b loc_093170
	addq.b #2,(4,a6)

loc_093170:
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_09317c:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_093182:
	movea.w ($36,a6),a4
	clr.w ($4e,a4)
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093190:
	addq.b #2,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093196:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0931a2
	neg.l d0

loc_0931a2:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0931b0:
	bsr.b loc_093196
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;##############################################
loc_0931c4:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0931d4(pc,d0.w),d1
	jmp loc_0931d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0931d4:
	dc.w loc_0931dc-loc_0931d4
	dc.w loc_09335a-loc_0931d4
	dc.w loc_093718-loc_0931d4
	dc.w loc_093718-loc_0931d4

;==============================================
loc_0931dc:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.b #2,(9,a6)
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
	move.w loc_09322a(pc,d0.w),d1
	jmp loc_09322a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09322a:
	dc.w loc_093238-loc_09322a
	dc.w loc_093240-loc_09322a
	dc.w loc_093286-loc_09322a
	dc.w loc_0932cc-loc_09322a
	dc.w loc_0932f4-loc_09322a
	dc.w loc_093310-loc_09322a
	dc.w loc_09332c-loc_09322a

;----------------------------------------------
loc_093238:
	move.b #$ab,d0
	bra.w loc_09371e

;----------------------------------------------
loc_093240:
	move.l #$fffc0000,($40,a6)
	move.l #$500,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$fffe8000,($4c,a6)
	move.w #$fff6,($50,a6)
	move.w #$3,($52,a6)
	tst.b ($b,a6)
	bne.b loc_09327e
	neg.l ($40,a6)
	neg.l ($48,a6)
	neg.w ($50,a6)

loc_09327e:
	move.b #$a8,d0
	bra.w loc_09371e

;----------------------------------------------
loc_093286:
	move.l #$fffd8000,($40,a6)
	move.l #$500,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffff2000,($4c,a6)
	move.w #6,($50,a6)
	move.w #6,($52,a6)
	tst.b ($b,a6)
	bne.b loc_0932c4
	neg.l ($40,a6)
	neg.l ($48,a6)
	neg.w ($50,a6)

loc_0932c4:
	move.b #$a9,d0
	bra.w loc_09371e

;----------------------------------------------
loc_0932cc:
	clr.b ($b,a6)
	clr.b ($30,a6)
	move.w ($36,a6),($38,a6)
	move.w ($288,a5),d0
	addi.w #$c0,d0
	move.w d0,($10,a6)
	move.w ($64,a4),($14,a6)
	move.w #$9f,d0
	bra.w loc_09371e

;----------------------------------------------
loc_0932f4:
	clr.b ($30,a6)
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	move.b #$aa,d0
	bra.w loc_09371e

;----------------------------------------------
loc_093310:
	clr.b ($30,a6)
	movea.w ($38,a6),a3
	move.w ($10,a3),($10,a6)
	move.w ($14,a3),($14,a6)
	move.b #$aa,d0
	bra.w loc_09371e

;----------------------------------------------
loc_09332c:
	move.w #$119,($c,a6)
	moveq #$1b,d0
	jsr loc_02fc88
	move.w ($44,a6),d0
	move.w ($4c,a6),d1
	tst.b ($b,a4)
	beq.b loc_09334a
	neg.w d0

loc_09334a:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	move.b #$aa,d0
	bra.w loc_09371e

;==============================================
loc_09335a:
	tst.b ($12a,a5)
	bne.w loc_09372a
	move.b (3,a6),d0
	move.w loc_09336e(pc,d0.w),d1
	jmp loc_09336e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09336e:
	dc.w loc_09337c-loc_09336e
	dc.w loc_0933a6-loc_09336e
	dc.w loc_0933a6-loc_09336e
	dc.w loc_093470-loc_09336e
	dc.w loc_093698-loc_09336e
	dc.w loc_0936c4-loc_09336e
	dc.w loc_0936e4-loc_09336e

;----------------------------------------------
loc_09337c:
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_09372a
	move.b ($125,a5),d0
	or.b (pause_flag,a5),d0
	bne.b loc_0933a0
	tst.b ($33,a6)
	bmi.w loc_09372a
	jsr loc_01b6b6

loc_0933a0:
	jmp loc_01b4d0

;----------------------------------------------
loc_0933a6:
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_09372a
	move.b (5,a6),d0
	move.w loc_0933be(pc,d0.w),d1
	jmp loc_0933be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0933be:
	dc.w loc_0933c6-loc_0933be
	dc.w loc_093408-loc_0933be
	dc.w loc_09340c-loc_0933be
	dc.w loc_093446-loc_0933be

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0933c6:
	movea.w ($38,a6),a3
	cmpi.b #6,(4,a3)
	bne.b loc_0933d8
	move.b #6,(4,a6)

loc_0933d8:
	cmpi.b #4,(4,a3)
	bne.b loc_0933e4
	addq.b #2,(5,a6)

loc_0933e4:
	move.w ($50,a6),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.w ($52,a6),d0
	add.w ($14,a3),d0
	move.w d0,($14,a6)

loc_0933fc:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093408:
	addq.b #2,(5,a6)

loc_09340c:
	bsr.w loc_093730
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_093436
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_093436:
	jsr loc_01b6b6
	btst #0,($b4,a5)
	bne.b loc_0933fc
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093446:
	bsr.w loc_093730
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_093460
	move.l #$6000000,(4,a6)
	clr.w ($16,a6)

loc_093460:
	jsr loc_01b6b6
	btst #0,($b4,a5)
	bne.b loc_0933fc
	rts

;----------------------------------------------
loc_093470:
	movea.w ($38,a6),a4
	move.b ($5f,a6),d0
	cmp.b ($102,a4),d0
	beq.b loc_093498
	movea.w ($38,a6),a0
	cmp.b ($102,a0),d0
	bne.w loc_093690
	move.w a0,($36,a6)
	moveq #0,d0
	move.l d0,(4,a6)
	bra.w loc_0931c4

loc_093498:
	move.b (5,a6),d0
	move.w loc_0934a4(pc,d0.w),d1
	jmp loc_0934a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0934a4:
	dc.w loc_0934ac-loc_0934a4
	dc.w loc_093578-loc_0934a4
	dc.w loc_093640-loc_0934a4
	dc.w loc_093678-loc_0934a4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0934ac:
	lea.l (p1memory,a5),a4
	bsr.w Cdy_Knife_loc_check
	bne.w loc_093506
	lea.l (p2memory,a5),a4
	bsr.w Cdy_Knife_loc_check
	bne.w loc_093506
	tst.w (Dramatic_Mode_Type,a5)
	beq.b loc_0934e2
	lea.l (p3memory,a5),a4
	bsr.w Cdy_Knife_loc_check
	bne.w loc_093506
	lea.l (p4memory,a5),a4
	bsr.w Cdy_Knife_loc_check
	bne.w loc_093506

loc_0934e2:
	move.b ($b4,a5),d0
	bne.b loc_093500
	jsr loc_01c2c8
	beq.b loc_093500
	move.l #$1001c0a,(a4)
	move.w ($36,a6),($36,a4)
	move.w a6,($38,a4)

loc_093500:
	jmp loc_01b4d0

loc_093506:
	addq.b #2,(5,a6)
	bsr.w loc_093550
	move.w a4,($38,a6)
	st.b ($1e4,a4)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;93518
Cdy_Knife_loc_check:
;Check if player is active
	tst.b (a4)
	beq.b loc_09354c

;If player is using Cody
	cmpi.b #Cody_id,(PL_Charid,a4)
	bne.b loc_09354c
	clr.b (PL_codyover_knf,a4)
	move.w (PL_X,a6),d0;Opponent X location
	sub.w (PL_X,a4),d0;Cody Player X location
	addi.w #$28,d0
	cmpi.w #$50,d0
	bhi.b loc_09354c
	st.b (PL_codyover_knf,a4)
	movea.l (PL_Anim_Pnt,a4),a0
	tst.b ($13,a0)
	beq.b loc_09354c
	moveq #1,d0
	rts

loc_09354c:
	moveq #0,d0
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093550:
	lea.l (p1memory,a5),a0
	bsr.b loc_093566
	lea.l (p2memory,a5),a0
	bsr.b loc_093566
	lea.l (p3memory,a5),a0
	bsr.b loc_093566
	lea.l (p4memory,a5),a0

loc_093566:
	tst.b (a0)
	beq.b loc_093576
	cmpi.b #Cody_id,(PL_charid,a4)
	bne.b loc_093576
	clr.b ($1e5,a0)

loc_093576:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093578:
	cmpi.b #1,($1e4,a4)
	beq.w loc_0935d0
	movea.l ($1c,a4),a0
	tst.b ($d,a0)
	bne.b loc_0935ce
	cmpi.w #$200,(4,a4)
	bne.w loc_0935d8
	cmpi.b #$e,(6,a4)
	bne.b loc_0935b2
	cmpi.b #$10,($aa,a4)
	beq.w loc_0935e0
	cmpi.b #$14,($aa,a4)
	beq.w loc_0935e0

loc_0935b2:
	cmpi.b #$10,(6,a4)
	bne.b loc_0935ce
	cmpi.b #$18,($aa,a4)
	beq.w loc_0935e0
	cmpi.b #$1e,($aa,a4)
	beq.w loc_0935e0

loc_0935ce:
	rts

loc_0935d0:
	move.b #6,(5,a6)
	rts

loc_0935d8:
	moveq #$22,d0
	jsr loc_00390e

loc_0935e0:
	clr.b ($1e4,a4)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$40,($14,a6)

loc_0935f6:
	move.b #4,(5,a6)
	move.b ($b,a4),($b,a6)
	move.l #$fffc0000,($40,a6)
	move.l #$500,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff0000,($4c,a6)
	jsr loc_01bd68
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	cmpi.w #$c0,d0
	bge.b loc_09363e
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_09363e:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093640:
	bsr.w loc_093730
	movea.w ($38,a6),a4
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_09366c
	clr.b (5,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.w #$9f,d0
	bsr.w loc_09371e
	jmp loc_01b4d0

loc_09366c:
	jsr loc_01b6b6
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093678:
	tst.b ($1e4,a4)
	bne.b loc_09368e
	move.w ($1e0,a4),($10,a6)
	move.w ($1e2,a4),($14,a6)
	bra.w loc_0935f6

loc_09368e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093690:
	subq.b #1,($13e,a5)
	bra.w loc_09372a

;----------------------------------------------
loc_093698:
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_09372a
	subq.b #1,($3a,a6)
	bpl.b loc_0936c2
	clr.b ($3a,a6)
	tst.b ($33,a6)
	bmi.w loc_09372a
	jsr loc_01b6b6
	jmp loc_01b4d0

loc_0936c2:
	rts

;----------------------------------------------
loc_0936c4:
	move.b ($102,a4),d0
	cmp.b ($5f,a6),d0
	bne.w loc_09372a
	tst.b ($33,a6)
	bmi.w loc_09372a
	jsr loc_01b6b6
	jmp loc_01b4d0

;----------------------------------------------
loc_0936e4:
	move.w ($44,a6),d0
	move.w ($4c,a6),d1
	tst.b ($b,a6)
	beq.b loc_0936f4
	neg.w d0

loc_0936f4:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	tst.b ($33,a6)
	bmi.w loc_09372a
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_093718:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09371e:
	movea.l #loc_276258,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09372a:
	addq.b #2,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093730:
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
loc_093752:
	move.b (4,a6),d0
	move.w loc_09375e(pc,d0.w),d1
	jmp loc_09375e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09375e:
	dc.w loc_093766-loc_09375e
	dc.w loc_093790-loc_09375e
	dc.w loc_0937ae-loc_09375e
	dc.w loc_0937ae-loc_09375e

;==============================================
loc_093766:
	addq.b #2,(4,a6)
	clr.w ($c,a6)
	move.b #1,($30,a6)
	move.w #$6000,($1a,a6)
	move.l #$40000,($44,a6)
	moveq #$23,d0
	lea.l loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_093790:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	tst.b ($33,a6)
	bpl.b loc_0937a2
	addq.b #2,(4,a6)

loc_0937a2:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0937ae:
	jmp loc_01c2de

;##############################################
loc_0937b4:
	jsr loc_01c2c8
	beq.b loc_09380c
	move.l #$1001d00,(a4)
	move.b ($e,a6),($e,a4)
	move.w ($18,a6),($18,a4)
	move.b (9,a6),(9,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	jsr RNGFunction
	andi.w #$f,d0
	addi.w #$5c,d0
	move.b ($b,a6),($b,a4)
	bne.b loc_0937f8
	neg.w d0

loc_0937f8:
	add.w d0,($10,a4)
	jsr RNGFunction
	andi.w #$f,d0
	add.w d0,($14,a4)
	moveq #1,d0

loc_09380c:
	rts

;##############################################
loc_09380e:
	move.b (4,a6),d0
	move.w loc_09381a(pc,d0.w),d1
	jmp loc_09381a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09381a:
	dc.w loc_093822-loc_09381a
	dc.w loc_0938d0-loc_09381a
	dc.w loc_09392c-loc_09381a
	dc.w loc_09392c-loc_09381a

;==============================================
loc_093822:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b ($102,a4),($31,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.b ($26,a4),($26,a6)
	move.b #2,(9,a6)
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_093874(pc,d0.w),d1
	jsr loc_093874(pc,d1.w)
	moveq #0,d0
	bra.w loc_0938d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093874:
	dc.w loc_09387a-loc_093874
	dc.w loc_09388e-loc_093874
	dc.w loc_0938b2-loc_093874

;----------------------------------------------
loc_09387a:
	move.b #2,($3c,a6)
	moveq #$15,d0
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_09388e:
	move.b #4,(9,a6)
	move.b #1,($3c,a6)
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	moveq #$47,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0938b2:
	move.w ($14,a4),($14,a6)
	move.b ($d,a6),($3c,a6)
	clr.b ($5b,a6)
	moveq #$43,d0
	movea.l #loc_1cf38a,a0
	jmp loc_01b6e0

;==============================================
loc_0938d0:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b ($31,a6),d0
	bne.w loc_093932
	move.b (3,a6),d0
	move.w loc_0938f2(pc,d0.w),d1
	jsr loc_0938f2(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0938f2:
	dc.w loc_0938f8-loc_0938f2
	dc.w loc_0938f8-loc_0938f2
	dc.w loc_09390a-loc_0938f2

;----------------------------------------------
loc_0938f8:
	move.b ($3c,a6),d0
	cmp.b ($3c,a4),d0
	beq.w loc_093932
	jmp loc_01b6b6

;----------------------------------------------
loc_09390a:
	tst.b ($33,a6)
	bmi.w loc_093932
	move.b ($3c,a6),($d,a6)
	eori.b #1,($5b,a6)
	move.b ($5b,a6),d0
	add.b d0,($d,a6)
	jmp loc_01b6b6

;==============================================
loc_09392c:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093932:
	move.b #4,(4,a6)
	rts

;##############################################
loc_09393a:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_09394a(pc,d0.w),d1
	jmp loc_09394a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09394a:
	dc.w loc_093952-loc_09394a
	dc.w loc_09399a-loc_09394a
	dc.w loc_0939b0-loc_09394a
	dc.w loc_0939b0-loc_09394a

;==============================================
loc_093952:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.w ($c,a4),($c,a6)
	move.b #1,($d,a6)
	move.b ($e,a4),($e,a6)
	move.b ($f,a4),($f,a6)
	move.l ($18,a4),($18,a6)
	move.w ($26,a4),($26,a6)
	move.w #$6000,($1a,a6)
	moveq #0,d0
	movea.l #loc_2f4092,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;==============================================
loc_09399a:
	tst.b ($33,a6)
	bpl.b loc_0939a4
	addq.b #2,(4,a6)

loc_0939a4:
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_0939b0:
	jmp loc_01c2de

;##############################################
loc_0939b6:
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	cmp.b (3,a6),d0
	bne.w loc_093a4c
	move.b (4,a6),d0
	move.w loc_0939d8(pc,d0.w),d1
	jsr loc_0939d8(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0939d8:
	dc.w loc_0939e0-loc_0939d8
	dc.w loc_093a1c-loc_0939d8
	dc.w loc_093a4c-loc_0939d8
	dc.w loc_093a50-loc_0939d8

;==============================================
loc_0939e0:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($102,a4),(3,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	moveq #2,d0
	movea.l #loc_282f36,a0
	jmp loc_01b6e0

;==============================================
loc_093a1c:
	cmpi.w #$208,(4,a4)
	beq.w loc_093a3a
	cmpi.w #$200,(4,a4)
	bne.w loc_093a4c
	cmpi.b #$e,(6,a4)
	bne.w loc_093a4c

loc_093a3a:
	move.b ($35,a4),d0
	addq.b #2,d0
	movea.l #loc_282f36,a0
	jmp loc_01b6e0

;==============================================
loc_093a4c:
	addq.b #2,(4,a6)

;==============================================
loc_093a50:
	jmp loc_01c2de

;##############################################
loc_093a56:
	move.b (4,a6),d0
	move.w loc_093a62(pc,d0.w),d1
	jmp loc_093a62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093a62:
	dc.w loc_093a6a-loc_093a62
	dc.w loc_093a7c-loc_093a62
	dc.w loc_093b1c-loc_093a62
	dc.w loc_093b1c-loc_093a62

;==============================================
loc_093a6a:
	addq.b #2,(4,a6)
	moveq #0,d0
	movea.l #loc_212ef0,a0
	jmp loc_01b6e0

;==============================================
loc_093a7c:
	move.b (5,a6),d0
	move.w loc_093a88(pc,d0.w),d1
	jmp loc_093a88(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093a88:
	dc.w loc_093a8e-loc_093a88
	dc.w loc_093aa2-loc_093a88
	dc.w loc_093ae0-loc_093a88

;----------------------------------------------
loc_093a8e:
	movea.w ($36,a6),a4
	tst.b ($35,a4)
	beq.b loc_093aa0
	addq.b #2,(5,a6)
	bra.w loc_093ada

loc_093aa0:
	rts

;----------------------------------------------
loc_093aa2:
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_093ada
	addq.b #2,(5,a6)
	move.b #$1a,($3a,a6)
	move.l #$8000,d0
	tst.b ($b,a6)
	beq.b loc_093ac6
	neg.l d0

loc_093ac6:
	move.l d0,($40,a6)
	move.l #0,($44,a6)
	move.l #$fffff000,($4c,a6)

loc_093ada:
	jmp loc_01b4d0

;----------------------------------------------
loc_093ae0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	subq.b #1,($3a,a6)
	bne.b loc_093b04
	addq.b #2,(4,a6)
	rts

loc_093b04:
	move.b ($3a,a6),d0
	cmpi.b #$12,d0
	bcc.b loc_093b16
	andi.b #1,d0
	beq.b loc_093b16
	rts

loc_093b16:
	jmp loc_01b4d0

;==============================================
loc_093b1c:
	jmp loc_01c2de

;##############################################
loc_093b22:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_093b32(pc,d0.w),d1
	jmp loc_093b32(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093b32:
	dc.w loc_093b3a-loc_093b32
	dc.w loc_093d00-loc_093b32
	dc.w loc_093d3a-loc_093b32
	dc.w loc_093d74-loc_093b32

;==============================================
loc_093b3a:
	move.b (4,a6),d0
	move.w loc_093b46(pc,d0.w),d1
	jmp loc_093b46(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093b46:
	dc.w loc_093b4e-loc_093b46
	dc.w loc_093bc6-loc_093b46
	dc.w loc_093e44-loc_093b46
	dc.w loc_093e44-loc_093b46

;----------------------------------------------
loc_093b4e:
	addq.b #2,(4,a6)
	bsr.w loc_093ec8
	move.b #4,(9,a6)
	jsr loc_01bd5c
	moveq #$30,d0
	tst.b ($101,a4)
	beq.b loc_093b6e
	move.w #$150,d0

loc_093b6e:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	addq.w #8,d0
	move.w d0,($14,a6)
	move.l #0,($40,a6)
	move.l #0,($48,a6)
	move.l #$ffffc000,($44,a6)
	move.l #$400,($4c,a6)
	move.b #$20,($3a,a6)
	move.b #4,($3b,a6)
	bsr.w loc_093e72
	jsr loc_0035a8
	moveq #$11,d0
	bsr.w loc_093e52
	jmp loc_01b4ec

;----------------------------------------------
loc_093bc6:
	move.b (5,a6),d0
	move.w loc_093bd8(pc,d0.w),d1
	jsr loc_093bd8(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093bd8:
	dc.w loc_093bde-loc_093bd8
	dc.w loc_093c0a-loc_093bd8
	dc.w loc_093c64-loc_093bd8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093bde:
	bsr.w loc_093ea6
	bsr.w loc_093cb0
	bsr.w loc_093c8c
	bsr.w loc_093cd2
	jsr loc_01b6b6
	tst.b ($35,a6)
	beq.b loc_093c08
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	move.b #1,($a,a4)

loc_093c08:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093c0a:
	bsr.w loc_093ea6
	bsr.w loc_093cb0
	bsr.w loc_093c8c
	bsr.w loc_093cd2
	tst.b ($33,a6)
	bpl.b loc_093c5e
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	st.b ($a,a4)
	move.l #$fffe0000,d0
	move.l #$fffff800,d1
	tst.b ($b,a6)
	bne.b loc_093c42
	neg.l d0
	neg.l d1

loc_093c42:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #0,($44,a6)
	move.l #$2000,($4c,a6)
	bsr.w loc_093cc2

loc_093c5e:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_093c64:
	bsr.w loc_093ea6
	bsr.w loc_093c8c
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	subi.w #$ffc0,d0
	cmpi.w #$200,d0
	bhi.w loc_093e4a
	jmp loc_01b6b6

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093c8c:
	move.w ($50,a6),d0
	beq.b loc_093c9a
	movea.w d0,a0
	move.w ($10,a6),($10,a0)

loc_093c9a:
	move.w ($52,a6),d0
	beq.b loc_093cae
	movea.w d0,a0
	move.w ($10,a6),($10,a0)
	move.w ($14,a6),($14,a0)

loc_093cae:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093cb0:
	subq.b #1,($3a,a6)
	bne.b loc_093cc0
	neg.l ($4c,a6)
	move.b #$20,($3a,a6)

loc_093cc0:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093cc2:
	moveq #7,d7

loc_093cc4:
	move.w d7,d0
	lsl.w #4,d0
	bsr.w loc_093ce8
	dbra d7,loc_093cc4
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093cd2:
	jsr RNGFunction
	andi.w #$7e,d0
	subq.b #1,($3b,a6)
	bpl.b loc_093cfe
	move.b #4,($3b,a6)

loc_093ce8:
	jsr loc_01c2c8
	beq.b loc_093cfe
	move.l #$1002206,(a4)
	move.w d0,($3c,a4)
	move.w a6,($36,a4)

loc_093cfe:
	rts

;==============================================
loc_093d00:
	move.b (4,a6),d0
	move.w loc_093d12(pc,d0.w),d1
	jsr loc_093d12(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093d12:
	dc.w loc_093d1a-loc_093d12
	dc.w loc_093d2e-loc_093d12
	dc.w loc_093e44-loc_093d12
	dc.w loc_093e44-loc_093d12

;----------------------------------------------
loc_093d1a:
	addq.b #2,(4,a6)
	bsr.w loc_093ec8
	move.b #6,(9,a6)
	moveq #$12,d0
	bra.w loc_093e52

;----------------------------------------------
loc_093d2e:
	tst.b (a4)
	beq.w loc_093e4a
	jmp loc_01b6b6

;==============================================
loc_093d3a:
	move.b (4,a6),d0
	move.w loc_093d4c(pc,d0.w),d1
	jsr loc_093d4c(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093d4c:
	dc.w loc_093d54-loc_093d4c
	dc.w loc_093d68-loc_093d4c
	dc.w loc_093e44-loc_093d4c
	dc.w loc_093e44-loc_093d4c

;----------------------------------------------
loc_093d54:
	addq.b #2,(4,a6)
	bsr.w loc_093ec8
	move.b #6,(9,a6)
	moveq #$13,d0
	bra.w loc_093e52

;----------------------------------------------
loc_093d68:
	tst.b (a4)
	beq.w loc_093e4a
	jmp loc_01b6b6

;==============================================
loc_093d74:
	move.b (4,a6),d0
	move.w loc_093d80(pc,d0.w),d1
	jmp loc_093d80(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093d80:
	dc.w loc_093d88-loc_093d80
	dc.w loc_093e1c-loc_093d80
	dc.w loc_093e44-loc_093d80
	dc.w loc_093e44-loc_093d80

;----------------------------------------------
loc_093d88:
	addq.b #2,(4,a6)
	bsr.w loc_093ec8
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	move.w ($3c,a6),d0
	move.w d0,d1
	andi.w #$70,d1
	movea.l #loc_093ef4,a0
	move.l (a0,d1.w),($40,a6)
	move.l (4,a0,d1.w),($48,a6)
	move.l (8,a0,d1.w),($44,a6)
	move.l ($c,a0,d1.w),($4c,a6)
	add.w d0,d0
	movea.l #loc_093f74,a0
	move.w (2,a0,d0.w),d1
	addi.w #0,d1
	move.w (a0,d0.w),d0
	addi.w #$ffe8,d0
	tst.b ($b,a6)
	bne.b loc_093dea
	neg.w d0
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_093dea:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	add.w ($64,a4),d1
	move.w d1,($14,a6)
	move.b #2,(9,a6)
	moveq #$16,d0
	cmp.w ($64,a4),d1
	bcs.b loc_093e10
	move.b #4,(9,a6)
	moveq #$15,d0

loc_093e10:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_093e1c:
	bsr.w loc_093ea6
	tst.b ($33,a6)
	bmi.w loc_093e4a
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_093e50
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_093e44:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093e4a:
	move.b #4,(4,a6)

loc_093e50:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093e52:
	movea.l #loc_290590,a0
	jmp loc_01b6e0

;##############################################
loc_093e5e:
	jsr loc_01c2c8
	beq.b loc_093e70
	move.l #$1002200,(a4)
	move.w a6,($36,a4)

loc_093e70:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093e72:
	move.l #$1002202,d1
	bsr.b loc_093e96
	beq.b loc_093e94
	move.w a4,($50,a6)
	move.w ($64,a6),($14,a4)
	move.l #$1002204,d1
	bsr.b loc_093e96
	beq.b loc_093e94
	move.w a4,($52,a6)

loc_093e94:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093e96:
	jsr loc_01c2c8
	beq.b loc_093ea4
	move.l d1,(a4)
	move.w a6,($36,a4)

loc_093ea4:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093ea6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_093ec8:
	move.b ($b,a4),($b,a6)
	move.b #1,($30,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093ef4:
	dc.l $00010000,$fffffb00,$ffff0000,$00001000
	dc.l $00028000,$fffff200,$ffff4000,$00001800
	dc.l $00040000,$ffffed00,$ffff8000,$00001800
	dc.l $00060000,$ffffe000,$ffffc000,$00002000
	dc.l $00060000,$ffffe000,$00000000,$00002000
	dc.l $00040000,$ffffed00,$00000000,$00001800
	dc.l $00028000,$fffff200,$00000000,$00001800
	dc.l $00010000,$fffffb00,$00000000,$00001000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_093f74:
	dc.w $005a,$ffea,$005c,$ffea
	dc.w $005e,$ffeb,$0060,$ffec
	dc.w $0062,$ffec,$0064,$ffed
	dc.w $0066,$ffed,$0068,$ffee
	dc.w $006a,$ffef,$006c,$ffef
	dc.w $006d,$fff0,$006f,$fff1
	dc.w $0070,$fff1,$0072,$fff2
	dc.w $0073,$fff3,$0074,$fff4
	dc.w $0076,$fff4,$0077,$fff5
	dc.w $0078,$fff6,$0079,$fff6
	dc.w $007a,$fff7,$007b,$fff8
	dc.w $007c,$fff9,$007c,$fff9
	dc.w $007d,$fffa,$007e,$fffb
	dc.w $007e,$fffc,$007e,$fffd
	dc.w $007f,$fffd,$007f,$fffe
	dc.w $007f,$ffff,$007f,$0000
	dc.w $0080,$0000,$007f,$0000
	dc.w $007f,$0001,$007f,$0002
	dc.w $007f,$0003,$007e,$0003
	dc.w $007e,$0004,$007e,$0005
	dc.w $007d,$0006,$007c,$0007
	dc.w $007c,$0007,$007b,$0008
	dc.w $007a,$0009,$0079,$000a
	dc.w $0078,$000a,$0077,$000b
	dc.w $0076,$000c,$0074,$000c
	dc.w $0073,$000d,$0072,$000e
	dc.w $0070,$000f,$006f,$000f
	dc.w $006d,$0010,$006c,$0011
	dc.w $006a,$0011,$0068,$0012
	dc.w $0066,$0013,$0064,$0013
	dc.w $0062,$0014,$0060,$0014
	dc.w $005e,$0015,$005c,$0016

;##############################################
;Render something on Hi-score
loc_094074:
	move.b (3,a6),d0
	move.w loc_094080(pc,d0.w),d1
	jmp loc_094080(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094080:
	dc.w loc_094092-loc_094080
	dc.w loc_094122-loc_094080
	dc.w loc_0941f6-loc_094080
	dc.w loc_0942a4-loc_094080
	dc.w loc_0942a4-loc_094080
	dc.w loc_09433e-loc_094080
	dc.w loc_094468-loc_094080
	dc.w loc_0944e2-loc_094080

	dc.w loc_09451a-loc_094080

;==============================================
loc_094092:
	movea.w ($36,a6),a4
	tst.b (a4)
	beq.w loc_09460c
	move.b (4,a6),d0
	move.w loc_0940ae(pc,d0.w),d1
	jsr loc_0940ae(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0940ae:
	dc.w loc_0940b6-loc_0940ae
	dc.w loc_094104-loc_0940ae
	dc.w loc_09460c-loc_0940ae
	dc.w loc_09460c-loc_0940ae

;----------------------------------------------
loc_0940b6:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	move.w ($18,a4),($18,a6)
	move.w #$2000,($1a,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w #$fff0,($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$70,($10,a6)
	addi.w #$c,($14,a6)
	moveq #0,d0
	movea.l #loc_0948ce,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_094104:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$80,($10,a6)
	addi.w #8,($14,a6)
	jmp loc_01b6b6

;==============================================
loc_094122:
	movea.w ($36,a6),a4
	tst.b (a4)
	beq.w loc_09460c
	move.b (4,a6),d0
	move.w loc_09413e(pc,d0.w),d1
	jsr loc_09413e(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09413e:
	dc.w loc_094146-loc_09413e
	dc.w loc_0941dc-loc_09413e
	dc.w loc_09460c-loc_09413e
	dc.w loc_09460c-loc_09413e

;----------------------------------------------
loc_094146:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$70,($10,a6)
	addi.w #$c,($14,a6)
	move.b #1,($c,a6)
	move.b ($a,a6),d0
	lea.l loc_094c5a(pc),a0
	move.b (a0,d0.w),($d,a6)
	lsl.w #4,d0
	movea.l (-$5c48,a5),a0
	lea.l (a0,d0.w),a0
	move.b (8,a0),d0
	move.b d0,($31,a6)
	ext.w d0
	move.b loc_0941bc(pc,d0.w),d0
	movea.l #loc_301fa2,a0
	jsr loc_01b6e0
	bra.w loc_094800

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0941bc:
	dc.b $20,$21,$22,$23
	dc.b $24,$25,$26,$27
	dc.b $28,$29,$2a,$2b
	dc.b $2c,$2d,$2e,$2f
	dc.b $30,$31,$24,$31
	dc.b $26,$2a,$32,$2a
	dc.b $33,$34,$35,$36
	dc.b $37,$38,$2a,$2a

;----------------------------------------------
loc_0941dc:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$80,($10,a6)
	addi.w #8,($14,a6)
	rts

;==============================================
loc_0941f6:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_094206(pc,d0.w),d1
	jmp loc_094206(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094206:
	dc.w loc_09420e-loc_094206
	dc.w loc_094286-loc_094206
	dc.w loc_09460c-loc_094206
	dc.w loc_09460c-loc_094206

;----------------------------------------------
loc_09420e:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w d0,($c,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$1b,($10,a6)
	addi.w #$60,($14,a6)
	movea.l (-$5c48,a5),a0
	move.b ($f,a0),d0
	move.b loc_094280(pc,d0.w),d0
	addi.w #$c,d0
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_094262
	addq.w #1,d0

loc_094262:
	moveq #0,d1
	move.b (8,a0),d1
	lsl.w #3,d1
	add.w d0,d0
	movea.l #loc_301fa2,a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094280:
	dc.b $00,$02,$04
	dc.b $00,$02,$04

;----------------------------------------------
loc_094286:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$1b,($10,a6)
	addi.w #$60,($14,a6)
	jmp loc_01b4ec

;==============================================
loc_0942a4:
	move.b (4,a6),d0
	move.w loc_0942b6(pc,d0.w),d1
	jsr loc_0942b6(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0942b6:
	dc.w loc_0942be-loc_0942b6
	dc.w loc_0942fe-loc_0942b6
	dc.w loc_09460c-loc_0942b6
	dc.w loc_09460c-loc_0942b6

;----------------------------------------------
loc_0942be:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w #$fff0,($c,a6)
	move.b d0,($b,a6)
	move.b #0,($3a,a6)
	add.b (3,a6),d0
	lsr.w #1,d0
	addq.w #2,d0
	movea.l #loc_2f3a88,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0942fe:
	move.b (5,a6),d0
	move.w loc_09430a(pc,d0.w),d1
	jmp loc_09430a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09430a:
	dc.w loc_094310-loc_09430a
	dc.w loc_09431c-loc_09430a
	dc.w loc_09433c-loc_09430a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094310:
	subq.b #1,($3a,a6)
	bmi.b loc_094318
	rts

loc_094318:
	addq.b #2,(5,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09431c:
	bsr.w loc_09461e
	move.w ($30,a6),d0
	sub.w ($10,a6),d0
	move.w ($40,a6),d1
	eor.w d0,d1
	bpl.b loc_09433a
	addq.b #2,(5,a6)
	move.w ($30,a6),($10,a6)

loc_09433a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09433c:
	rts

;==============================================
;1st Place Winquote Portrait
loc_09433e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_094354(pc,d0.w),d1
	jsr loc_094354(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094354:
	dc.w loc_094362-loc_094354
	dc.w loc_094416-loc_094354
	dc.w loc_09460c-loc_094354
	dc.w loc_09460c-loc_094354

loc_09435c:
	dc.b $ff,$00,$01
	dc.b $ff,$00,$01

;----------------------------------------------
loc_094362:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w ($18,a4),($18,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w #$ff0f,($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$a0,($10,a6)
	addi.w #$14,($14,a6)
	movea.l (-$5c48,a5),a2
	move.b (8,a2),($31,a6)
	move.b (9,a2),($3c,a6)
	move.b ($f,a2),d0
	move.b loc_09435c(pc,d0.w),($a,a6)
	jsr loc_01c368
	beq.b loc_0943fe
	move.l #$1002204,(a4)
	move.w a4,($2c,a6)
	move.w a6,($36,a4)
	cmpi.b #$1c,($31,a6)
	bne.b loc_0943fe
	jsr loc_01c368
	beq.b loc_0943fe
	move.l #$1002200,(a4)
	move.w a4,($28,a6)
	move.w a6,($36,a4)
	jsr loc_01c368
	beq.b loc_0943fe
	move.l #$1002202,(a4)
	move.w a4,($2a,a6)
	move.w a6,($36,a4)

loc_0943fe:
	bsr.w loc_094718
	bsr.w loc_09470e
	bsr.w loc_094744
	moveq #0,d0
	movea.l ($50,a6),a0
	jmp loc_01b6e0

;----------------------------------------------
loc_094416:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$a0,($10,a6)
	addi.w #$14,($14,a6)
	move.b (5,a6),d0
	move.w loc_09443a(pc,d0.w),d1
	jmp loc_09443a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09443a:
	dc.w loc_09443e-loc_09443a
	dc.w loc_094462-loc_09443a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09443e:
	tst.b ($14,a5)
	ble.w loc_094618
	addq.b #2,(5,a6)
	moveq #0,d0

loc_09444c:
	move.b ($31,a6),d0
	lea.l loc_0948ae(pc),a0
	move.b (a0,d0.w),d0
	movea.l ($50,a6),a0
	jmp loc_01b6e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094462:
	jmp loc_01b692

;==============================================
loc_094468:
	move.b (4,a6),d0
	move.w loc_09447a(pc,d0.w),d1
	jsr loc_09447a(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09447a:
	dc.w loc_094482-loc_09447a
	dc.w loc_0944c4-loc_09447a
	dc.w loc_09460c-loc_09447a
	dc.w loc_09460c-loc_09447a

;----------------------------------------------
loc_094482:
	bsr.w loc_094788

loc_094486:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #0,($e,a6)
	clr.b ($b,a6)
	movea.l (-$5c48,a5),a0
	move.b ($f,a0),d0
	addq.b #1,d0
	tst.b (Dip_SFAlpha,a5)
	beq.b loc_0944b8
	addq.b #6,d0

loc_0944b8:
	movea.l #loc_0948ce,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0944c4:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($34,a6),d0
	cmp.w ($10,a6),d0
	bge.b loc_0944dc
	neg.w d0
	add.w d0,($10,a6)

loc_0944dc:
	jmp loc_01b6b6

;==============================================
loc_0944e2:
	move.b (4,a6),d0
	move.w loc_0944f4(pc,d0.w),d1
	jsr loc_0944f4(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0944f4:
	dc.w loc_094486-loc_0944f4
	dc.w loc_0944fc-loc_0944f4
	dc.w loc_09460c-loc_0944f4
	dc.w loc_09460c-loc_0944f4

;----------------------------------------------
loc_0944fc:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #0,($10,a6)
	bge.b loc_094514
	move.w ($34,a6),d0
	add.w d0,($10,a6)

loc_094514:
	jmp loc_01b6b6

;==============================================
loc_09451a:
	tst.b ($8c,a5)
	bne.b loc_094536
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_094538(pc,d0.w),d1
	jsr loc_094538(pc,d1.w)
	jmp loc_01b4ec

loc_094536:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094538:
	dc.w loc_094540-loc_094538
	dc.w loc_0945d2-loc_094538
	dc.w loc_09460c-loc_094538
	dc.w loc_09460c-loc_094538

;----------------------------------------------
loc_094540:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.b #0,($e,a6)
	move.w #$ff08,($c,a6)
	move.w #$100,($10,a6)
	move.w #$50,($14,a6)
	move.b ($101,a4),($b,a6)
	beq.b loc_094574
	move.w #$80,($10,a6)

loc_094574:
	move.b ($102,a4),($31,a6)
	move.b ($128,a4),($3c,a6)
	move.b ($132,a4),($a,a6)
	cmpi.b #$1c,($31,a6)
	bne.b loc_0945ba
	jsr loc_01c368
	beq.b loc_0945ba
	move.l #$1002200,(a4)
	move.w a4,($28,a6)
	move.w a6,($36,a4)
	jsr loc_01c368
	beq.b loc_0945ba
	move.l #$1002202,(a4)
	move.w a4,($2a,a6)
	move.w a6,($36,a4)

loc_0945ba:
	bsr.w loc_094718
	bsr.w loc_09470e
	bsr.w loc_0947ba
	moveq #0,d0
	movea.l ($50,a6),a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0945d2:
	move.b (5,a6),d0
	move.w loc_0945de(pc,d0.w),d1
	jmp loc_0945de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0945de:
	dc.w loc_0945e2-loc_0945de
	dc.w loc_094606-loc_0945de

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0945e2:
	tst.b ($112,a5)
	bpl.w loc_094618
	addq.b #2,(5,a6)
	moveq #0,d0
	move.b ($31,a6),d0
	lea.l loc_0948ae(pc),a0
	move.b (a0,d0.w),d0
	movea.l ($50,a6),a0
	jmp loc_01b6e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094606:
	jmp loc_01b692

;----------------------------------------------
loc_09460c:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094612:
	addq.b #2,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094618:
	jmp loc_01b692

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09461e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094630:
	bsr.b loc_09461e
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;##############################################
loc_094644:
	cmpi.b #4,($6eb9,a5)
	bcs.w loc_09470c
	jsr loc_01c2c8
	move.l #$1002306,(a4)
	move.l #$ffc00000,($10,a4)
	move.l #$800000,($14,a4)
	move.l #$40000,($40,a4)
	move.l #$fffff000,($48,a4)
	move.w #$30,($30,a4)
	jsr loc_01c2c8
	move.l #$1002308,(a4)
	move.l #$1b00000,($10,a4)
	move.l #$800000,($14,a4)
	move.l #$fffc0000,($40,a4)
	move.l #$1000,($48,a4)
	move.w #$140,($30,a4)
	jsr loc_01c2c8
	move.l #$100230c,(a4)
	move.w #0,($10,a4)
	move.w #$18,($14,a4)
	move.w #$2,($40,a4)
	move.w #$109,($c,a4)
	jsr loc_01c2c8
	move.l #$100230e,(a4)
	move.w #$1a0,d0
	movea.l (-$5c48,a5),a0
	cmpi.b #3,($f,a0)
	bcs.b loc_0946f6
	move.w #$160,d0

loc_0946f6:
	move.w d0,($10,a4)
	move.w #$e8,($14,a4)
	move.w #$fffe,($40,a4)
	move.w #$109,($c,a4)

loc_09470c:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09470e:
	move.b ($31,a6),d0
	jmp loc_02fc88

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094718:
	move.b ($31,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	move.b ($a,a6),d0
	addq.b #1,d0
	ext.w d0
	move.b loc_094740(pc,d0.w),d0
	movea.l (a0,d0.w),a0
	move.l a0,($50,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094740:
	move.b d0,d0
	move.l d0,d0

loc_094744:
	movea.l #loc_32c094,a0
	move.b ($31,a6),d0
	ext.w d0
	add.w d0,d0
	adda.w (a0,d0.w),a0
	moveq #0,d0
	movea.l (-$5c48,a5),a1
	move.b ($f,a1),d0
	move.b loc_094782(pc,d0.w),d0
	add.b ($3c,a6),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	lsl.w #5,d0
	lea.l (a0,d0.w),a0
	movea.l #$90c1e0,a1
	moveq #4,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094782:
	dc.b $00,$02,$04
	dc.b $00,$02,$04

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094788:
	moveq #0,d0
	movea.l (-$5c48,a5),a1
	move.b ($f,a1),d0
	add.w d0,d0
	move.w loc_0947ae(pc,d0.w),d0
	movea.l #loc_35cc34,a0
	adda.w d0,a0
	movea.l #$90c120,a1
	moveq #0,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0947ae:
	dc.w $2480,$24a0,$24c0
	dc.w $2480,$24a0,$24c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0947ba:
	movea.l #loc_32c094,a0
	moveq #0,d0
	move.b ($31,a6),d0
	add.w d0,d0
	adda.w (a0,d0.w),a0
	moveq #0,d0
	move.b ($a,a6),d0
	addq.b #1,d0
	add.w d0,d0
	add.b ($3c,a6),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	lsl.w #5,d0
	lea.l (a0,d0.w),a0
	lea.l MainpaletteDirect,a1
	moveq #0,d0
	move.b ($d,a6),d0
	lsl.w #5,d0
	lea.l (a1,d0.w),a1
	moveq #4,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_094800:
	move.b ($d,a6),d0
	ext.w d0
	lsl.w #5,d0
	movea.l #MainpaletteDirect,a1
	lea.l (a1,d0.w),a1
	moveq #0,d0
	movea.l (-$5c48,a5),a0
	move.b ($f,a0),d0
	add.b d0,d0
	movea.l #loc_35bb94,a0
	adda.w loc_094862(pc,d0.w),a0
	move.b ($31,a6),d0
	ext.w d0
	add.w d0,d0
	adda.w loc_09486e(pc,d0.w),a0
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
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094862:
	dc.w $0360,$0a60,$0d80
	dc.w $0360,$0a60,$0d80

loc_09486e:
	dc.w $0000,$0020,$0040,$0060
	dc.w $0080,$00a0,$00c0,$00e0
	dc.w $0100,$0120,$0140,$0160
	dc.w $0180,$01a0,$01c0,$01e0
	dc.w $0200,$0220,$0080,$0220
	dc.w $00c0,$0140,$0240,$0140
	dc.w $0260,$0280,$02a0,$02c0
	dc.w $02e0,$0300,$0140,$0140

loc_0948ae:
	dc.b $23,$25,$23,$23
	dc.b $24,$25,$24,$23
	dc.b $25,$23,$23,$23
	dc.b $25,$27,$23,$23
	dc.b $23,$23,$24,$23
	dc.b $24,$24,$27,$23
	dc.b $24,$24,$23,$26
	dc.b $25,$23,$23,$23

loc_0948ce:
	dc.w loc_0948ea-loc_0948ce;001c
	dc.w loc_0948fe-loc_0948ce;0030
	dc.w loc_094906-loc_0948ce;0038
	dc.w loc_09490e-loc_0948ce;0040
	dc.w loc_094916-loc_0948ce;0048
	dc.w loc_09491e-loc_0948ce;0050
	dc.w loc_094926-loc_0948ce;0058
	dc.w loc_0948fe-loc_0948ce;0030
	dc.w loc_09492e-loc_0948ce;0060
	dc.w loc_09490e-loc_0948ce;0040
	dc.w loc_094916-loc_0948ce;0048
	dc.w loc_094936-loc_0948ce;0068
	dc.w loc_094926-loc_0948ce;0058
	dc.w $0000

loc_0948ea:
	dc.w $0100,$0000
	dc.l loc_09493e
	dc.w $0180,$0000
	dc.l loc_094954
	dc.l loc_0948ea

loc_0948fe:
	dc.w $0140,$01a0
	dc.l loc_09496a

loc_094906:
	dc.w $0140,$01a0
	dc.l loc_0949c0

loc_09490e:
	dc.w $0140,$01a0
	dc.l loc_094a16

loc_094916:
	dc.w $0140,$0160
	dc.l loc_094ac2

loc_09491e:
	dc.w $0140,$0160
	dc.l loc_094b28

loc_094926:
	dc.w $0140,$0160
	dc.l loc_094b8e

loc_09492e:
	dc.w $0140,$01a0
	dc.l loc_094a6c

loc_094936:
	dc.w $0140,$0160
	dc.l loc_094bf4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09493e:
	dc.w $0008,$0006,$0001
	dc.w $25c8,$021e,$ffd0,$fff8
	dc.w $25c8,$021e,$0000,$fff8

loc_094954:
	dc.w $0008,$0006,$0001
	dc.w $25c8,$023e,$ffd0,$fff8
	dc.w $25c8,$023e,$0000,$fff8

loc_09496a:
	dc.w $0008,$0034,$0009
	dc.w $28c4,$0100,$fe60,$fff8
	dc.w $28cc,$0300,$fe80,$fff8
	dc.w $28d0,$0000,$fec0,$fff8
	dc.w $28e0,$0700,$fed0,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c4,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28e0,$0700,$0070,$fff8
	dc.w $28d5,$0a00,$00f0,$fff8

loc_0949c0:
	dc.w $0008,$0034,$0009
	dc.w $28c6,$0100,$fe60,$fff8
	dc.w $28cc,$0300,$fe80,$fff8
	dc.w $28d0,$0000,$fec0,$fff8
	dc.w $28e0,$0700,$fed0,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c6,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28e0,$0700,$0070,$fff8
	dc.w $28d5,$0a00,$00f0,$fff8

loc_094a16:
	dc.w $0008,$0034,$0009
	dc.w $28c8,$0100,$fe60,$fff8
	dc.w $28cc,$0300,$fe80,$fff8
	dc.w $28d0,$0000,$fec0,$fff8
	dc.w $28e0,$0700,$fed0,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c8,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28e0,$0700,$0070,$fff8
	dc.w $28d5,$0a00,$00f0,$fff8

loc_094a6c:
	dc.w $0008,$0034,$0009
	dc.w $28ca,$0100,$fe60,$fff8
	dc.w $28cc,$0300,$fe80,$fff8
	dc.w $28d0,$0000,$fec0,$fff8
	dc.w $28e0,$0700,$fed0,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28ca,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28e0,$0700,$0070,$fff8
	dc.w $28d5,$0a00,$00f0,$fff8

loc_094ac2:
	dc.w $0008,$0030,$000b
	dc.w $28c4,$0100,$fea0,$fff8
	dc.w $28cc,$0300,$fec0,$fff8
	dc.w $28d0,$0000,$ff00,$fff8
	dc.w $28d1,$0300,$ff10,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c4,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28d1,$0300,$0070,$fff8
	dc.w $28d5,$0a00,$00b0,$fff8
	dc.w $28c4,$0100,$0160,$fff8
	dc.w $28cc,$0100,$0180,$fff8

loc_094b28:
	dc.w $0008,$0030,$000b
	dc.w $28c6,$0100,$fea0,$fff8
	dc.w $28cc,$0300,$fec0,$fff8
	dc.w $28d0,$0000,$ff00,$fff8
	dc.w $28d1,$0300,$ff10,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c6,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28d1,$0300,$0070,$fff8
	dc.w $28d5,$0a00,$00b0,$fff8
	dc.w $28c6,$0100,$0160,$fff8
	dc.w $28cc,$0100,$0180,$fff8

loc_094b8e:
	dc.w $0008,$0030,$000b
	dc.w $28c8,$0100,$fea0,$fff8
	dc.w $28cc,$0300,$fec0,$fff8
	dc.w $28d0,$0000,$ff00,$fff8
	dc.w $28d1,$0300,$ff10,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28c8,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28d1,$0300,$0070,$fff8
	dc.w $28d5,$0a00,$00b0,$fff8
	dc.w $28c8,$0100,$0160,$fff8
	dc.w $28cc,$0100,$0180,$fff8

loc_094bf4:
	dc.w $0008,$0030,$000b
	dc.w $28ca,$0100,$fea0,$fff8
	dc.w $28cc,$0300,$fec0,$fff8
	dc.w $28d0,$0000,$ff00,$fff8
	dc.w $28d1,$0300,$ff10,$fff8
	dc.w $28d5,$0a00,$ff50,$fff8
	dc.w $28ca,$0100,$0000,$fff8
	dc.w $28cc,$0300,$0020,$fff8
	dc.w $28d0,$0000,$0060,$fff8
	dc.w $28d1,$0300,$0070,$fff8
	dc.w $28d5,$0a00,$00b0,$fff8
	dc.w $28ca,$0100,$0160,$fff8
	dc.w $28cc,$0100,$0180,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094c5a:
	dc.b $14,$15,$16,$17,$18,$19
	dc.b $14,$15,$16,$17,$18,$19
	dc.b $14,$15,$16,$17,$18,$19
	dc.b $14,$15,$16,$17,$18,$19
	dc.b $14,$15,$16,$17,$18,$19

;##############################################
loc_094c78:
	move.b (3,a6),d0
	move.w loc_094c84(pc,d0.w),d1
	jmp loc_094c84(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094c84:
	dc.w loc_094c94-loc_094c84
	dc.w loc_094d72-loc_094c84
	dc.w loc_094e00-loc_094c84
	dc.w loc_094ee4-loc_094c84
	dc.w loc_094fc2-loc_094c84
	dc.w loc_095048-loc_094c84
	dc.w loc_095048-loc_094c84
	dc.w loc_095192-loc_094c84

;==============================================
loc_094c94:
	move.b (4,a6),d0
	move.w loc_094ca0(pc,d0.w),d1
	jmp loc_094ca0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094ca0:
	dc.w loc_094ca8-loc_094ca0
	dc.w loc_094d24-loc_094ca0
	dc.w loc_095242-loc_094ca0
	dc.w loc_095242-loc_094ca0

;----------------------------------------------
loc_094ca8:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($64,a4),($64,a6)
	move.w ($c,a4),($c,a6)
	move.w #$ffba,d0
	move.b ($b,a4),($b,a6)
	beq.b loc_094cdc
	neg.w d0

loc_094cdc:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($14,a4),d0
	addi.w #$57,d0
	move.w d0,($14,a6)
	move.l #$10000,($40,a6)
	move.l #0,($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	moveq #0,d0
	movea.l #loc_23cd80,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;----------------------------------------------
loc_094d24:
	move.b (5,a6),d0
	move.w loc_094d30(pc,d0.w),d1
	jmp loc_094d30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094d30:
	dc.w loc_094d36-loc_094d30
	dc.w loc_094d64-loc_094d30
	dc.w loc_094d70-loc_094d30

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094d36:
	bsr.w loc_09526a
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_094d52
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	move.b #$10,($3a,a6)

loc_094d52:
	tst.b ($35,a6)
	bne.b loc_094d5e
	jsr loc_01b6b6

loc_094d5e:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094d64:
	jsr loc_01b6b6
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094d70:
	rts

;==============================================
loc_094d72:
	move.b (4,a6),d0
	move.w loc_094d7e(pc,d0.w),d1
	jmp loc_094d7e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094d7e:;609662
	dc.w loc_094d86-loc_094d7e
	dc.w loc_094d24-loc_094d7e
	dc.w loc_095242-loc_094d7e
	dc.w loc_095242-loc_094d7e

;----------------------------------------------
loc_094d86:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($64,a4),($64,a6)
	move.w ($c,a4),($c,a6)
	moveq #$46,d0
	move.b ($b,a4),($b,a6)
	beq.b loc_094db8
	neg.w d0

loc_094db8:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($14,a4),d0
	addi.w #$57,d0
	move.w d0,($14,a6)
	move.l #$ffff0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	moveq #1,d0
	movea.l #loc_23cd80,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;==============================================
loc_094e00:
	move.b (4,a6),d0
	move.w loc_094e0c(pc,d0.w),d1
	jmp loc_094e0c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094e0c:
	dc.w loc_094e14-loc_094e0c
	dc.w loc_094e66-loc_094e0c
	dc.w loc_095242-loc_094e0c
	dc.w loc_095242-loc_094e0c

;----------------------------------------------
loc_094e14:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #4,(9,a6)
	move.b ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	jsr loc_01bd5c
	moveq #8,d0
	move.b ($b,a4),($b,a6)
	bne.b loc_094e46
	neg.w d0

loc_094e46:
	add.w ($10,a3),d0
	addi.w #$c0,d0
	move.w d0,($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #2,d0
	movea.l #loc_23cd80,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_094e66:
	move.b (5,a6),d0
	move.w loc_094e72(pc,d0.w),d1
	jmp loc_094e72(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094e72:
	dc.w loc_094e78-loc_094e72
	dc.w loc_094e9a-loc_094e72
	dc.w loc_094eba-loc_094e72

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094e78:
	movea.w ($36,a6),a4
	tst.b ($35,a4)
	bpl.b loc_094e98
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	subi.w #$ff50,d0
	cmpi.w #$160,d0
	bhi.b loc_094e98
	addq.b #2,(5,a6)

loc_094e98:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094e9a:
	addq.b #2,(5,a6)
	move.l #$c0000,($40,a6)
	move.l #0,($48,a6)
	jsr loc_01b6b6
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094eba:
	bsr.w loc_095250
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	subi.w #$ffc0,d0
	cmpi.w #$200,d0
	bhi.w loc_09524a
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_094ee4:
	move.b (4,a6),d0
	move.w loc_094ef0(pc,d0.w),d1
	jmp loc_094ef0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094ef0:
	dc.w loc_094ef8-loc_094ef0
	dc.w loc_094f4a-loc_094ef0
	dc.w loc_095242-loc_094ef0
	dc.w loc_095242-loc_094ef0

;----------------------------------------------
loc_094ef8:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #4,(9,a6)
	move.b ($e,a4),($e,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	jsr loc_01bd5c
	moveq #$40,d0
	move.b ($b,a4),($b,a6)
	beq.b loc_094f2a
	neg.w d0

loc_094f2a:
	add.w ($10,a3),d0
	addi.w #$c0,d0
	move.w d0,($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #3,d0
	movea.l #loc_23cd80,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_094f4a:
	move.b (5,a6),d0
	move.w loc_094f56(pc,d0.w),d1
	jmp loc_094f56(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094f56:
	dc.w loc_094f5c-loc_094f56
	dc.w loc_094f88-loc_094f56
	dc.w loc_094fa4-loc_094f56

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094f5c:
	movea.w ($36,a6),a4
	tst.b ($35,a4)
	bpl.b loc_094f82
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	subi.w #$ff90,d0
	cmpi.w #$e0,d0
	bhi.b loc_094f82
	addq.b #2,(5,a6)
	jsr loc_01b6b6

loc_094f82:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094f88:
	tst.b ($33,a6)
	bpl.b loc_094f98
	addq.b #2,(5,a6)
	move.b #$20,($3a,a6)

loc_094f98:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_094fa4:
	subq.b #1,($3a,a6)
	bmi.w loc_09524a
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_095248
	jmp loc_01b4ec

;==============================================
loc_094fc2:
	move.b (4,a6),d0
	move.w loc_094fce(pc,d0.w),d1
	jmp loc_094fce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_094fce:
	dc.w loc_094fd6-loc_094fce
	dc.w loc_095030-loc_094fce
	dc.w loc_095242-loc_094fce
	dc.w loc_095242-loc_094fce

;----------------------------------------------
loc_094fd6:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b d0,($c,a6)
	moveq #$30,d0
	tst.b ($b,a4)
	beq.b loc_095004
	neg.w d0

loc_095004:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($64,a4),($14,a6)
	move.l #0,($44,a6)
	move.l #$3000,($4c,a6)
	moveq #$15,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_095030:
	bsr.w loc_09526c
	tst.b ($33,a6)
	bmi.w loc_09524a
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_095048:
	move.b (4,a6),d0
	move.w loc_095054(pc,d0.w),d1
	jmp loc_095054(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095054:
	dc.w loc_09505c-loc_095054
	dc.w loc_0950a4-loc_095054
	dc.w loc_095242-loc_095054
	dc.w loc_095242-loc_095054

;----------------------------------------------
loc_09505c:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b d0,($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #$48,d0
	cmpi.b #$a,(3,a6)
	beq.b loc_095098
	moveq #$49,d0

loc_095098:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0950a4:
	movea.w ($36,a6),a4
	move.b (5,a6),d0
	move.w loc_0950b4(pc,d0.w),d1
	jmp loc_0950b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0950b4:
	dc.w loc_0950b8-loc_0950b4
	dc.w loc_0950ca-loc_0950b4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0950b8:
	tst.b ($34,a4)
	beq.w loc_095248
	addq.b #2,(5,a6)
	move.b #$3c,($3b,a6)

loc_0950ca:
	tst.b ($34,a4)
	bmi.w loc_09524a
	cmpi.w #$200,(4,a4)
	bne.w loc_09524a
	cmpi.b #$10,(6,a4)
	bne.w loc_09524a
	subq.b #1,($3b,a6)
	bmi.w loc_09524a
	jsr loc_01b6b6
	moveq #0,d0
	move.b ($35,a6),d0
	move.w loc_09512c(pc,d0.w),d1
	move.w loc_09512c+2(pc,d0.w),d0
	move.b ($34,a6),($b,a6)
	tst.b ($b,a4)
	beq.b loc_095116
	neg.w d1
	eori.b #1,($b,a6)

loc_095116:
	add.w ($10,a4),d1
	add.w ($14,a4),d0
	move.w d1,($10,a6)
	move.w d0,($14,a6)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09512c:
	dc.w $ff90,$0037
	dc.w $ff99,$0056
	dc.w $ffaf,$0038
	dc.w $ffc1,$004c
	dc.w $ffdc,$003f

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095140:
	move.b (4,a6),d0
	move.w loc_09514c(pc,d0.w),d1
	jmp loc_09514c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09514c:
	dc.w loc_095154-loc_09514c
	dc.w loc_0950a4-loc_09514c
	dc.w loc_095242-loc_09514c
	dc.w loc_095242-loc_09514c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095154:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #2,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.b d0,($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #$49,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_095192:
	move.b (4,a6),d0
	move.w loc_09519e(pc,d0.w),d1
	jmp loc_09519e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09519e:
	dc.w loc_0951a6-loc_09519e
	dc.w loc_0951f4-loc_09519e
	dc.w loc_095242-loc_09519e
	dc.w loc_095242-loc_09519e

;----------------------------------------------
loc_0951a6:
	addq.b #2,(4,a6)
	movea.w ($36,a6),a4
	move.b #0,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w ($18,a4),($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.w ($10,a4),($40,a6)
	move.w d0,($3a,a6)
	moveq #$f,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0951f4:
	movea.w ($36,a6),a4
	tst.w ($40,a4)
	bmi.w loc_09524a
	cmpi.w #$200,(4,a4)
	bne.w loc_09524a
	cmpi.b #$10,(6,a4)
	bne.w loc_09524a
	moveq #$50,d0
	tst.b ($b,a4)
	beq.b loc_09521e
	neg.w d0

loc_09521e:
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_095248
	jmp loc_01b4ec

;----------------------------------------------
loc_095242:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095248:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09524a:
	addq.b #2,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095250:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_09525c
	neg.l d0

loc_09525c:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09526a:
	bsr.b loc_095250

loc_09526c:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;##############################################
loc_09527e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_09528e(pc,d0.w),d1
	jmp loc_09528e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09528e:
	dc.w loc_095296-loc_09528e
	dc.w loc_0952b4-loc_09528e
	dc.w loc_0952e8-loc_09528e
	dc.w loc_09530e-loc_09528e

;==============================================
loc_095296:
	addq.b #2,(4,a6)
	move.b #$20,($3b,a6)
	move.b #1,($30,a6)
	moveq #$c,d0
	movea.l #loc_212eae,a0
	jsr loc_01b6e0

loc_0952b4:
	tst.b ($125,a5)
	bne.b loc_0952e2
	tst.b ($5f,a4)
	bne.b loc_0952e2
	subq.b #1,($3b,a6)
	bne.b loc_0952d8
	addq.b #2,(4,a6)
	moveq #$11,d0
	movea.l #loc_212eae,a0
	jsr loc_01b6e0

loc_0952d8:
	bsr.w loc_095314
	jsr loc_01b692

loc_0952e2:
	jmp loc_01b4d0

;==============================================
loc_0952e8:
	tst.b ($125,a5)
	bne.b loc_0952e2
	tst.b ($5f,a4)
	bne.b loc_095308
	jsr loc_01b692
	bsr.w loc_095314
	tst.b ($33,a6)
	bpl.b loc_095308
	addq.b #2,(4,a6)

loc_095308:
	jmp loc_01b4d0

;==============================================
loc_09530e:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095314:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	rts

;##############################################
loc_095326:
	move.b (3,a6),d0
	move.w loc_095332(pc,d0.w),d1
	jmp loc_095332(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095332:
	dc.w loc_09534a-loc_095332
	dc.w loc_09534a-loc_095332
	dc.w loc_09534c-loc_095332
	dc.w loc_095456-loc_095332
	dc.w loc_0955c6-loc_095332
	dc.w loc_095646-loc_095332
	dc.w loc_0956ca-loc_095332
	dc.w loc_095756-loc_095332

	dc.w loc_0957c6-loc_095332
	dc.w loc_09598c-loc_095332
	dc.w loc_095a78-loc_095332
	dc.w loc_095b62-loc_095332

;==============================================
loc_09534a:
	rts

;==============================================
loc_09534c:
	move.b (4,a6),d0
	move.w loc_095358(pc,d0.w),d1
	jmp loc_095358(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095358:
	dc.w loc_095360-loc_095358
	dc.w loc_0953b8-loc_095358
	dc.w loc_095b92-loc_095358
	dc.w loc_095b96-loc_095358

;----------------------------------------------
loc_095360:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.w #$e000,($18,a6)
	move.w #0,($1a,a6)
	move.b #0,($e,a6)
	move.b #1,($b,a6)
	move.w #$ff00,($c,a6)
	clr.b ($59,a6)
	move.b #1,($30,a6)
	move.w #$ffe0,($10,a6)
	move.w #$40,($14,a6)
	move.w #4,($40,a6)
	bsr.w loc_0961c0
	moveq #$22,d0
	movea.l #loc_1e9472,a0
	movea.l (a0),a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0953b8:
	move.b (5,a6),d0
	move.w loc_0953d2(pc,d0.w),d1
	jsr loc_0953d2(pc,d1.w)
	tst.b ($12,a5)
	bmi.w loc_095ba0
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0953d2:
	dc.w loc_0953d8-loc_0953d2
	dc.w loc_095414-loc_0953d2
	dc.w loc_09543e-loc_0953d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0953d8:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$c0,($10,a6)
	blt.b loc_09540e
	addq.b #2,(5,a6)
	move.w #$c0,($10,a6)
	move.w #$c0,($3a,a6)
	bsr.w loc_0961ee
	moveq #$20,d0
	movea.l #loc_1e9472,a0
	movea.l (8,a0),a0
	jsr loc_01b6e0

loc_09540e:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095414:
	subq.w #1,($3a,a6)
	bpl.b loc_095438
	addq.b #2,(5,a6)
	move.w #$fffe,($40,a6)
	clr.b ($b,a6)
	moveq #$1f,d0
	movea.l #loc_1e9472,a0
	movea.l (a0),a0
	jsr loc_01b6e0

loc_095438:
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09543e:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$ffe0,($10,a6)
	blt.w loc_095b9c
	jmp loc_01b692

;==============================================
loc_095456:
	move.b (4,a6),d0
	move.w loc_095462(pc,d0.w),d1
	jmp loc_095462(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095462:
	dc.w loc_09546a-loc_095462
	dc.w loc_0954c6-loc_095462
	dc.w loc_095b92-loc_095462
	dc.w loc_095b96-loc_095462

;----------------------------------------------
loc_09546a:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	move.w #$e000,($18,a6)
	move.w #0,($1a,a6)
	move.b #0,($e,a6)
	move.b #0,($b,a6)
	move.w #$ff05,($c,a6)
	move.b #1,($30,a6)
	move.w #$1a0,($10,a6)
	move.w #$40,($14,a6)
	move.w #$fff8,($40,a6)
	move.w #$d0,($3a,a6)
	bsr.w loc_0961a6
	moveq #$29,d0
	movea.l #loc_15c5cc,a0
	movea.l (8,a0),a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0954c6:
	move.b (5,a6),d0
	move.w loc_0954e0(pc,d0.w),d1
	jsr loc_0954e0(pc,d1.w)
	tst.b ($12,a5)
	bmi.w loc_095ba0
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0954e0:
	dc.w loc_0954e8-loc_0954e0
	dc.w loc_09554a-loc_0954e0
	dc.w loc_095582-loc_0954e0
	dc.w loc_0955c4-loc_0954e0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0954e8:
	subq.w #1,($3a,a6)
	bpl.w loc_09552a
	addq.b #2,(5,a6)
	bsr.w loc_0961fc
	cmpi.b #3,($6eb9,a5)
	bcs.b loc_09552a
	bsr.w loc_09552c
	move.w #$c,($3a,a4)
	addq.b #4,($c,a4)
	bsr.w loc_09552c
	move.w #8,($3a,a4)
	addq.b #4,($c,a4)
	bsr.w loc_09552c
	move.w #4,($3a,a4)
	addq.b #3,($c,a4)

loc_09552a:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09552c:
	jsr loc_01c2c8
	move.l #$100260c,(a4)
	move.b #4,(9,a4)
	move.w ($c,a6),($c,a4)
	move.w a6,($36,a4)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09554a:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$e0,($10,a6)
	bgt.b loc_095580
	addq.b #2,(5,a6)
	move.w #$e0,($10,a6)
	move.w #$30,($3a,a6)
	bsr.w loc_09620a
	moveq #5,d0
	movea.l #loc_15c5cc,a0
	movea.l (8,a0),a0
	jmp loc_01b6e0

loc_095580:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095582:
	subq.w #1,($3a,a6)
	bpl.b loc_0955c4
	addq.b #2,(5,a6)
	move.w #$140,($10,a6)
	move.b #1,($b,a6)
	jsr loc_01c2c8
	beq.w loc_0955ac
	move.l #$100260e,(a4)
	move.w a6,($36,a4)

loc_0955ac:
	moveq #$2a,d0
	movea.l #loc_15c5cc,a0
	movea.l (8,a0),a0
	jsr loc_01b6e0
	jmp loc_01b692

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0955c4:
	rts

;==============================================
loc_0955c6:
	move.b (4,a6),d0
	move.w loc_0955d2(pc,d0.w),d1
	jmp loc_0955d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0955d2:
	dc.w loc_0955da-loc_0955d2
	dc.w loc_09560c-loc_0955d2
	dc.w loc_095b92-loc_0955d2
	dc.w loc_095b96-loc_0955d2

;----------------------------------------------
loc_0955da:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #0,($e,a6)
	move.b #0,($b,a6)
	moveq #0,d0
	add.b ($a,a6),d0
	movea.l #loc_09622e,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_09560c:
	move.b (5,a6),d0
	move.w loc_095618(pc,d0.w),d1
	jmp loc_095618(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095618:
	dc.w loc_09561c-loc_095618
	dc.w loc_095628-loc_095618

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09561c:
	subq.b #1,($3a,a6)
	bpl.b loc_095626
	addq.b #2,(5,a6)

loc_095626:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095628:
	tst.b ($12,a5)
	bmi.w loc_095b9c
	tst.b ($a,a6)
	bne.b loc_095640
	btst #4,($f,a5)
	beq.w loc_095ba0

loc_095640:
	jmp loc_01b4ec

;==============================================
loc_095646:
	move.b (4,a6),d0
	move.w loc_095658(pc,d0.w),d1
	jsr loc_095658(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095658:
	dc.w loc_095660-loc_095658
	dc.w loc_0956bc-loc_095658
	dc.w loc_095b92-loc_095658
	dc.w loc_095b96-loc_095658

;----------------------------------------------
loc_095660:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b #0,($e,a6)
	move.b #1,($30,a6)
	move.w d0,($c,a6)
	jsr RNGFunction
	andi.w #$3f,d0
	addi.w #$a0,d0
	move.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$7f,d0
	addi.w #$40,d0
	move.w d0,($14,a6)
	bsr.w loc_0961da
	moveq #3,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0956bc:
	tst.b ($33,a6)
	bmi.w loc_095b9c
	jmp loc_01b6b6

;==============================================
loc_0956ca:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0956da(pc,d0.w),d1
	jmp loc_0956da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0956da:
	dc.w loc_0956e2-loc_0956da
	dc.w loc_095718-loc_0956da
	dc.w loc_095b92-loc_0956da
	dc.w loc_095b96-loc_0956da

;----------------------------------------------
loc_0956e2:
	addq.b #2,(4,a6)
	move.l ($18,a4),($18,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.w ($40,a4),($40,a6)
	move.l ($1c,a4),($1c,a6)
	move.l ($32,a4),($32,a6)
	rts

;----------------------------------------------
loc_095718:
	move.b (5,a6),d0
	move.w loc_095732(pc,d0.w),d1
	jsr loc_095732(pc,d1.w)
	tst.b ($12,a5)
	bmi.w loc_095ba0
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095732:
	dc.w loc_095736-loc_095732
	dc.w loc_095742-loc_095732

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095736:
	subq.w #1,($3a,a6)
	bpl.b loc_095740
	addq.b #2,(5,a6)

loc_095740:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095742:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$e0,($10,a6)
	ble.w loc_095b9c
	rts

;==============================================
loc_095756:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_095766(pc,d0.w),d1
	jmp loc_095766(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095766:
	dc.w loc_09576e-loc_095766
	dc.w loc_0957a2-loc_095766
	dc.w loc_095b92-loc_095766
	dc.w loc_095b96-loc_095766

;----------------------------------------------
loc_09576e:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($e,a4),($e,a6)
	clr.b ($b,a6)
	move.b #1,($30,a6)
	moveq #7,d0
	movea.l #loc_1619fe,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0957a2:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	tst.b ($b,a4)
	beq.b loc_0957b8
	subq.w #5,($10,a6)

loc_0957b8:
	tst.b ($12,a5)
	bmi.w loc_095ba0
	jmp loc_01b4ec

;==============================================
loc_0957c6:
	move.b (4,a6),d0
	move.w loc_0957d2(pc,d0.w),d1
	jmp loc_0957d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0957d2:
	dc.w loc_0957da-loc_0957d2
	dc.w loc_0958ee-loc_0957d2
	dc.w loc_095b92-loc_0957d2
	dc.w loc_095b96-loc_0957d2

;----------------------------------------------
loc_0957da:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #0,($e,a6)
	move.b #0,($b,a6)
	move.w d0,($c,a6)
	bsr.w loc_09585c
	moveq #0,d0
	move.w ($48,a6),d0
	sub.w ($10,a6),d0
	swap d0
	asr.l #4,d0
	move.l d0,($40,a6)
	moveq #0,d0
	move.w ($4c,a6),d0
	sub.w ($14,a6),d0
	swap d0
	asr.l #4,d0
	move.l d0,($44,a6)
	move.b #$10,($3b,a6)
	lea.l ($60,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.w #8,(a0)+
	move.l #$10000,(a0)+
	move.w ($38,a6),(a0)+
	move.w #$1f,(a0)+
	move.l #$fff8fff8,(a0)+
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09585c:
	jsr RNGFunction
	andi.w #6,d0
	move.w loc_09586e(pc,d0.w),d0
	jmp loc_09586e(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09586e:
	dc.w loc_095876-loc_09586e
	dc.w loc_095896-loc_09586e
	dc.w loc_0958b6-loc_09586e
	dc.w loc_0958d2-loc_09586e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095876:
	move.w ($4c,a6),d0
	addi.w #$e0,d0
	move.w d0,($14,a6)
	jsr RNGFunction
	andi.w #$1ff,d0
	subi.w #$40,d0
	move.w d0,($10,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095896:
	move.w ($4c,a6),d0
	addi.w #$ff20,d0
	move.w d0,($14,a6)
	jsr RNGFunction
	andi.w #$1ff,d0
	subi.w #$40,d0
	move.w d0,($10,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0958b6:
	move.w ($48,a6),d0
	addi.w #$fe80,d0
	move.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	move.w d0,($14,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0958d2:
	move.w ($48,a6),d0
	addi.w #$180,d0
	move.w d0,($10,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	move.w d0,($14,a6)
	rts

;----------------------------------------------
loc_0958ee:
	move.b (5,a6),d0
	move.w loc_095900(pc,d0.w),d1
	jsr loc_095900(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095900:
	dc.w loc_095908-loc_095900
	dc.w loc_095914-loc_095900
	dc.w loc_095942-loc_095900
	dc.w loc_09596a-loc_095900

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095908:
	subq.b #1,($3a,a6)
	bpl.b loc_095912
	addq.b #2,(5,a6)

loc_095912:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095914:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	subq.b #1,($3b,a6)
	bne.b loc_095940
	addq.b #2,(5,a6)
	move.w ($48,a6),($10,a6)
	move.w ($4c,a6),($14,a6)
	move.w #$10,($3a,a6)

loc_095940:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095942:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w ($48,a6),d1
	add.w loc_09596c(pc,d0.w),d1
	move.w d1,($10,a6)
	move.w ($4c,a6),d1
	add.w loc_09597c(pc,d0.w),d1
	move.w d1,($14,a6)
	move.w d0,($3a,a6)
	bne.b loc_09596a
	addq.b #2,(5,a6)

loc_09596a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09596c:
	dc.w $0000,$0001
	dc.w $ffff,$0002
	dc.w $fffe,$0003
	dc.w $fffd,$0004

loc_09597c:
	dc.w $0000,$ffff
	dc.w $0001,$0002
	dc.w $fffe,$fffd
	dc.w $0003,$0004

;==============================================
loc_09598c:
	move.b (4,a6),d0
	move.w loc_095998(pc,d0.w),d1
	jmp loc_095998(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095998:
	dc.w loc_0959a0-loc_095998
	dc.w loc_0959ec-loc_095998
	dc.w loc_095b92-loc_095998
	dc.w loc_095b96-loc_095998

;----------------------------------------------
loc_0959a0:
	addq.b #2,(4,a6)
	move.b d0,(9,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #0,($e,a6)
	move.b #0,($b,a6)
	move.w #$11f,($c,a6)
	move.w #$c0,($10,a6)
	move.w #$160,($14,a6)
	move.w #$fff0,($44,a6)
	move.w #$90,($3a,a6)
	moveq #1,d0
	movea.l #loc_09622e,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0959ec:
	move.b (5,a6),d0
	move.w loc_0959f8(pc,d0.w),d1
	jmp loc_0959f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0959f8:
	dc.w loc_095a00-loc_0959f8
	dc.w loc_095a0c-loc_0959f8
	dc.w loc_095a36-loc_0959f8
	dc.w loc_095a72-loc_0959f8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095a00:
	subq.w #2,($3a,a6)
	bpl.b loc_095a0a
	addq.b #2,(5,a6)

loc_095a0a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095a0c:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	cmpi.w #$80,($14,a6)
	bcc.b loc_095a30
	addq.b #2,(5,a6)
	move.w #$20,($3a,a6)
	move.w #$9280,(sub_palram,a5)
	bsr.w loc_096218

loc_095a30:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095a36:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w loc_095a52(pc,d0.w),($14,a6)
	move.w d0,($3a,a6)
	bne.b loc_095a4c
	addq.b #2,(5,a6)

loc_095a4c:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095a52:
	dc.w $0080,$0081,$007f,$0082
	dc.w $007e,$0083,$007d,$0084
	dc.w $007c,$0085,$007b,$0086
	dc.w $007a,$0087,$0079,$0088

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095a72:
	jmp loc_01b4ec

;==============================================
loc_095a78:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_095a88(pc,d0.w),d1
	jmp loc_095a88(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095a88:
	dc.w loc_095a90-loc_095a88
	dc.w loc_095b4e-loc_095a88
	dc.w loc_095b92-loc_095a88
	dc.w loc_095b96-loc_095a88

;----------------------------------------------
loc_095a90:
	addq.b #2,(4,a6)
	move.b d0,($59,a6)
	move.b #2,(9,a6)
	move.w #$e000,($18,a6)
	move.b #0,($e,a6)
	move.b #1,($30,a6)
	move.b ($102,a4),d0
	jsr loc_02fc88
	cmpi.b #$1c,($102,a4)
	bne.b loc_095aee
	jsr loc_01c368
	beq.b loc_095aee
	move.l #$1002200,(a4)
	move.w a4,($28,a6)
	move.w a6,($36,a4)
	jsr loc_01c368
	beq.b loc_095aee
	move.l #$1002202,(a4)
	move.w a4,($2a,a6)
	move.w a6,($36,a4)

loc_095aee:
	moveq #0,d0
	movea.w ($36,a6),a4
	move.b ($102,a4),d0
	lsl.w #2,d0
	movea.l #CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	move.b ($132,a4),d0
	addq.b #1,d0
	add.b d0,d0
	move.w loc_095b28(pc,d0.w),d0
	movea.l (a0,d0.w),a0
	move.b ($102,a4),d0
	move.b loc_095b2e(pc,d0.w),d0
	jsr loc_01b6e0
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095b28:
	dc.w $0010,$0000,$0020

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095b2e:
	dc.b $23,$25,$23,$26
	dc.b $25,$25,$24,$25
	dc.b $25,$28,$23,$25
	dc.b $25,$27,$23,$25
	dc.b $23,$23,$25,$23
	dc.b $25,$24,$27,$23
	dc.b $23,$24,$23,$26
	dc.b $26,$24,$27,$27

;----------------------------------------------
loc_095b4e:
	tst.b ($124,a5)
	beq.w loc_095b92
	jsr loc_01b692
	jmp loc_01b4ec

;==============================================
loc_095b62:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_095b72(pc,d0.w),d1
	jmp loc_095b72(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095b72:
	dc.w loc_095b7a-loc_095b72
	dc.w loc_095b84-loc_095b72
	dc.w loc_095b92-loc_095b72
	dc.w loc_095b96-loc_095b72

;----------------------------------------------
loc_095b7a:
	bsr.w loc_0955da
	jmp loc_01b4ec

;----------------------------------------------
loc_095b84:
	tst.b ($124,a5)
	beq.w loc_095b9c
	jmp loc_01b4ec

;----------------------------------------------
loc_095b92:
	addq.b #2,(4,a6)

loc_095b96:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095b9c:
	addq.b #2,(4,a6)

loc_095ba0:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_095ba2:
	andi.w #$f,d0
	add.w d0,d0
	move.w loc_095bb0(pc,d0.w),d1
	jmp loc_095bb0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_095bb0:
	dc.w loc_095bbe-loc_095bb0
	dc.w loc_095bec-loc_095bb0
	dc.w loc_095c6a-loc_095bb0
	dc.w loc_096046-loc_095bb0
	dc.w loc_09606a-loc_095bb0
	dc.w loc_096098-loc_095bb0
	dc.w loc_096118-loc_095bb0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095bbe:
	jsr loc_01c2c8
	beq.b loc_095bea
	move.l #$1002608,(a4)
	move.b #2,($a,a4)
	move.b #0,($3a,a4)
	move.w #$20,($10,a4)
	move.w #$c0,($14,a4)
	move.w #$115,($c,a4)

loc_095bea:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095bec:
	cmpi.b #3,($6eb9,a5)
	bcs.b loc_095c68
	jsr loc_01c2c8
	move.l #$1002604,(a4)
	jsr loc_01c2c8
	move.l #$1002606,(a4)
	jsr loc_01c2c8
	move.l #$1002608,(a4)
	move.b #2,($a,a4)
	move.b #0,($3a,a4)
	move.w #$20,($10,a4)
	move.w #$c0,($14,a4)
	move.w #$11f,($c,a4)
	tst.w (Region,a5)
	bne.b loc_095c68
	jsr loc_01c2c8
	beq.b loc_095c68
	move.l #$1002608,(a4)
	move.b #0,($a,a4)
	move.b #$20,($3a,a4)
	move.w #$c0,($10,a4)
	move.w #$100,($14,a4)
	move.w #$11f,($c,a4)

loc_095c68:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_095c6a:
	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36c,($38,a4)
	move.w #$20,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$26,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36d,($38,a4)
	move.w #$30,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$3e,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36b,($38,a4)
	move.w #$40,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$28,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35e,($38,a4)
	move.w #$50,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$3c,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35e,($38,a4)
	move.w #$60,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$2a,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36d,($38,a4)
	move.w #$70,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$3a,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35f,($38,a4)
	move.w #$90,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$2c,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$362,($38,a4)
	move.w #$a0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$38,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$360,($38,a4)
	move.w #$b0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$2e,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$361,($38,a4)
	move.w #$c0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$36,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36d,($38,a4)
	move.w #$d0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$30,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35e,($38,a4)
	move.w #$e0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$34,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36b,($38,a4)
	move.w #$f0,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$32,($3a,a4)
	tst.w (Region,a5)
	bne.w loc_095f46

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$373,($38,a4)
	move.w #$110,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #0,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35e,($38,a4)
	move.w #$120,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$24,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$36b,($38,a4)
	move.w #$130,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$22,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$368,($38,a4)
	move.w #$140,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$20,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$353,($38,a4)
	move.w #$150,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$10,($3a,a4)
	bra.w loc_096036

loc_095f46:
	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35a,($38,a4)
	move.w #$110,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #0,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$365,($38,a4)
	move.w #$120,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$24,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$369,($38,a4)
	move.w #$130,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$22,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$361,($38,a4)
	move.w #$140,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$20,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$35a,($38,a4)
	move.w #$150,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$1e,($3a,a4)

	jsr loc_01c2c8
	beq.w loc_096044
	move.l #$1002610,(a4)
	move.w #$353,($38,a4)
	move.w #$160,($48,a4)
	move.w #$c8,($4c,a4)
	move.b #$10,($3a,a4)

loc_096036:
	jsr loc_01c2c8
	beq.b loc_096044
	move.l #$1002612,(a4)

loc_096044:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096046:
	jsr loc_01c2c8
	beq.w loc_095ba0
	move.l #$100260a,(a4)
	clr.b ($59,a4)
	jsr loc_0032a4
	move.l #$202,d1
	bra.w loc_096224

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09606a:
	jsr loc_01c2c8
	beq.b loc_096096
	move.l #$1002608,(a4)
	move.b #3,($a,a4)
	move.b #0,($3a,a4)
	move.w #$60,($10,a4)
	move.w #$80,($14,a4)
	move.w #$115,($c,a4)

loc_096096:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096098:
	tst.b ($15d,a5)
	beq.b loc_0960c2
	cmpi.b #1,($6eb9,a5)
	bcs.b loc_0960c0
	movea.w ($13a,a5),a6
	bsr.w loc_096100
	move.w ($c,a6),($c,a4)
	move.b #0,($b,a4)
	move.w #$c0,($10,a4)

loc_0960c0:
	rts

loc_0960c2:
	cmpi.b #2,($6eb9,a5)
	bcs.b loc_0960fe
	lea.l (p1memory,a5),a6
	bsr.w loc_096100
	move.w #$ff00,($c,a4)
	move.b #1,($b,a4)
	move.w #$80,($10,a4)
	lea.l (p2memory,a5),a6
	bsr.w loc_096100
	move.w #$ff05,($c,a4)
	move.b #0,($b,a4)
	move.w #$100,($10,a4)

loc_0960fe:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096100:
	jsr loc_01c2c8
	move.l #$1002614,(a4)
	move.w #$28,($14,a4)
	move.w a6,($36,a4)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096118:
	jsr loc_01c2c8
	beq.b loc_096176
	move.l #$1002616,(a4)
	move.w #$115,($c,a4)
	move.b #4,($a,a4)
	move.b #1,($30,a4)
	move.w #$c0,($10,a4)
	move.w #$80,($14,a4)
	tst.b ($15d,a5)
	beq.b loc_096178
	jsr loc_01c2c8
	beq.b loc_096176
	move.l #$1002616,(a4)
	move.w #$115,($c,a4)
	move.b #5,($a,a4)
	move.b #1,($30,a4)
	move.w #$58,($10,a4)
	move.w #$50,($14,a4)

loc_096176:
	rts

loc_096178:
	jsr loc_01c2c8
	beq.b loc_0961a4
	move.l #$1002616,(a4)
	move.w #$115,($c,a4)
	move.b #6,($a,a4)
	move.b #1,($30,a4)
	move.w #$48,($10,a4)
	move.w #$50,($14,a4)

loc_0961a4:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0961a6:
	movea.l #loc_32c094,a0
	moveq #4,d0
	adda.w (a0,d0.w),a0
	movea.l #$90c0a0,a1
	moveq #4,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0961c0:
	movea.l #loc_32c094,a0
	moveq #$18,d0
	adda.w (a0,d0.w),a0
	movea.l #MainpaletteDirect,a1
	moveq #4,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0961da:
	movea.l #loc_33bb14,a0
	movea.l #$90c2a0,a1
	moveq #0,d7
	jmp loc_01b7c0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0961ee:
	jsr loc_0032a4
	move.l #$497,d1
	bra.b loc_096224

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0961fc:
	jsr loc_0032a4
	move.l #$253,d1
	bra.b loc_096224

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09620a:
	jsr loc_0032a4
	move.l #$73e,d1
	bra.b loc_096224

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096218:
	jsr loc_0032a4
	move.l #$23c,d1

loc_096224:
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09622e:
	dc.w loc_09623e-loc_09622e
	dc.w loc_096246-loc_09622e
	dc.w loc_09624e-loc_09622e
	dc.w loc_096256-loc_09622e
	dc.w loc_09625e-loc_09622e
	dc.w loc_096266-loc_09622e
	dc.w loc_09626e-loc_09622e
	dc.w $0000

loc_09623e:
	dc.w $0140,$0000
	dc.l loc_096276

loc_096246:
	dc.w $0140,$0000
	dc.l loc_0962be

loc_09624e:
	dc.w $0140,$0000
	dc.l loc_096312

loc_096256:
	dc.w $0140,$0000
	dc.l loc_09638a

loc_09625e:
	dc.w $0140,$0000
	dc.l loc_0963d8

loc_096266:
	dc.w $0140,$0000
	dc.l loc_09647a

loc_09626e:
	dc.w $0140,$0000
	dc.l loc_09649e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096276:
	dc.w $000a,$000a,$0009,$001f
	dc.l loc_096296

	dc.w $2b70,$2b99,$2b62,$2b7f,$2beb
	dc.w $2bc9,$2bd3,$2bcd,$2bd4,$2e4a

loc_096296:
	dc.w $ffa0,$0080,$ffb0,$0080
	dc.w $ffc0,$0080,$ffd0,$0080
	dc.w $fff0,$0080,$0000,$0080
	dc.w $0010,$0080,$0020,$0080
	dc.w $0030,$0080,$0040,$0080

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0962be:
	dc.w $000a,$000c,$000b,$0000
	dc.l loc_0962e2
	dc.w $035c,$0368,$0366,$0362,$0367,$0360
	dc.w $036c,$0368,$0368,$0367,$0374,$0374

loc_0962e2:
	dc.w $ff98,$fff8,$ffa8,$fff8
	dc.w $ffb8,$fff8,$ffc8,$fff8
	dc.w $ffd8,$fff8,$ffe8,$fff8
	dc.w $0008,$fff8,$0018,$fff8
	dc.w $0028,$fff8,$0038,$fff8
	dc.w $0048,$fff8,$0054,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096312:
	dc.w $000a,$0012,$0011,$0000
	dc.l loc_096342
	dc.w $036d,$0361,$035a,$0367,$0364,$0372
	dc.w $0368,$036e,$035f,$0368,$036b,$0369
	dc.w $0365,$035a,$0372,$0362,$0367,$0360

loc_096342:
	dc.w $0000,$0000,$0010,$0000
	dc.w $0020,$0000,$0030,$0000
	dc.w $0040,$0000,$0058,$0000
	dc.w $0068,$0000,$0078,$0000
	dc.w $0098,$0000,$00a8,$0000
	dc.w $00b8,$0000,$00d8,$0000
	dc.w $00e8,$0000,$00f8,$0000
	dc.w $0108,$0000,$0118,$0000
	dc.w $0128,$0000,$0138,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09638a:
	dc.w $000a,$000b,$000a,$0000
	dc.l loc_0963ac
	dc.w $03c9,$03cb,$03be,$03cc,$03be,$03c7
	dc.w $03cd,$03be,$03bd,$03bb,$03d2

loc_0963ac:
	dc.w $0000,$0000,$0010,$0000
	dc.w $0020,$0000,$0030,$0000
	dc.w $0040,$0000,$0050,$0000
	dc.w $0060,$0000,$0070,$0000
	dc.w $0080,$0000,$00a0,$0000
	dc.w $00b0,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0963d8:
	dc.w $000a,$0019,$0018,$0000
	dc.l loc_096416
	dc.w $035c,$0368,$0367,$0360,$036b
	dc.w $035a,$036d,$036e,$0365,$035a
	dc.w $036d,$0362,$0368,$0367,$036c
	dc.w $0374,$0374,$035a,$0365,$0365
	dc.w $035c,$0365,$035a,$035e,$036b

loc_096416:
	dc.w $ff80,$ffc0,$ff90,$ffc0
	dc.w $ffa0,$ffc0,$ffb0,$ffc0
	dc.w $ffc0,$ffc0,$ffd0,$ffc0
	dc.w $ffe0,$ffc0,$fff0,$ffc0
	dc.w $0000,$ffc0,$0010,$ffc0
	dc.w $0020,$ffc0,$0030,$ffc0
	dc.w $0040,$ffc0,$0050,$ffc0
	dc.w $0060,$ffc0,$0070,$ffc0
	dc.w $0080,$ffc0,$ffc0,$0040
	dc.w $ffd0,$0040,$ffe0,$0040
	dc.w $0000,$0040,$0010,$0040
	dc.w $0020,$0040,$0030,$0040
	dc.w $0040,$0040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09647a:
	dc.w $000a,$000c,$000b,$0000
	dc.l loc_0964c6
	dc.w $036c,$036e,$036b,$036f,$0362,$036f
	dc.w $035a,$0365,$0366,$0368,$035d,$035e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09649e:
	dc.w $000a,$000e,$000d,$0000
	dc.l loc_0964c6
	dc.w $035d,$036b,$035a,$0366,$035a,$036d,$0362
	dc.w $035c,$035b,$035a,$036d,$036d,$0365,$035e

loc_0964c6:
	dc.w $0000,$fff8,$0010,$fff8
	dc.w $0020,$fff8,$0030,$fff8
	dc.w $0040,$fff8,$0050,$fff8
	dc.w $0060,$fff8,$0070,$fff8
	dc.w $0090,$fff8,$00a0,$fff8
	dc.w $00b0,$fff8,$00c0,$fff8
	dc.w $00d0,$fff8,$00e0,$fff8

;##############################################
loc_0964fe:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_09650e(pc,d0.w),d1
	jmp loc_09650e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09650e:
	dc.w loc_09652e-loc_09650e
	dc.w loc_09665a-loc_09650e
	dc.w loc_0966a0-loc_09650e
	dc.w loc_0966ee-loc_09650e
	dc.w loc_0967fa-loc_09650e
	dc.w loc_0968ce-loc_09650e
	dc.w loc_0968ce-loc_09650e
	dc.w loc_0968ce-loc_09650e

	dc.w loc_0968ce-loc_09650e
	dc.w loc_0968ce-loc_09650e
	dc.w loc_096944-loc_09650e
	dc.w loc_096aa0-loc_09650e
	dc.w loc_096b12-loc_09650e
	dc.w loc_096bc0-loc_09650e
	dc.w loc_096cda-loc_09650e
	dc.w loc_096d24-loc_09650e

;==============================================
loc_09652e:
	move.b (4,a6),d0
	move.w loc_09653a(pc,d0.w),d1
	jmp loc_09653a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09653a:
	dc.w loc_096542-loc_09653a
	dc.w loc_096598-loc_09653a
	dc.w loc_096d82-loc_09653a
	dc.w loc_096d82-loc_09653a

;----------------------------------------------
loc_096542:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #$4,(9,a6)
	move.w #$a,($3a,a6)
	jsr loc_01bd5c
	moveq #$10,d0
	move.l #$ffff8000,d1
	tst.b ($b,a4)
	bne.b loc_096570
	move.w #$170,d0
	neg.l d1

loc_096570:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.w #$20,($14,a6)
	move.w #$20,($44,a6)
	move.l d1,($40,a6)
	bsr.w loc_096d9c
	moveq #$d,d0
	bsr.w loc_096d90
	jmp loc_01b4ec

;----------------------------------------------
loc_096598:
	move.b (5,a6),d0
	move.w loc_0965a4(pc,d0.w),d1
	jmp loc_0965a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0965a4:
	dc.w loc_0965ac-loc_0965a4
	dc.w loc_0965bc-loc_0965a4
	dc.w loc_09660e-loc_0965a4
	dc.w loc_096648-loc_0965a4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0965ac:
	subq.w #1,($3a,a6)
	bpl.b loc_0965b6
	addq.b #2,(5,a6)

loc_0965b6:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0965bc:
	tst.b ($35,a6)
	bmi.b loc_0965e4
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	moveq #0,d0
	move.b ($35,a6),d0
	add.w ($44,a6),d0
	move.w d0,($14,a6)
	jsr loc_01b6b6
	jmp loc_01b4ec

loc_0965e4:
	addq.b #2,(5,a6)
	move.b #1,($1f0,a4)
	move.w #$40,($3a,a6)
	move.w ($44,a6),($14,a6)
	move.l ($40,a6),d1
	add.l d1,d1
	add.l d1,($40,a6)
	bsr.w loc_096de6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09660e:
	subq.w #1,($3a,a6)
	bmi.w loc_096d88
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($10,a6),d1
	jsr loc_01bd5c
	sub.w ($10,a3),d1
	subi.w #$ffa0,d1
	cmpi.w #$240,d1
	bhi.b loc_096642
	jsr loc_01b6b6
	jmp loc_01b4ec

loc_096642:
	addq.b #2,(5,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096648:
	subq.w #1,($3a,a6)
	bmi.w loc_096d88
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;==============================================
loc_09665a:
	move.b (4,a6),d0
	move.w loc_096666(pc,d0.w),d1
	jmp loc_096666(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096666:
	dc.w loc_09666e-loc_096666
	dc.w loc_096688-loc_096666
	dc.w loc_096d82-loc_096666
	dc.w loc_096d82-loc_096666

;----------------------------------------------
loc_09666e:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #6,(9,a6)
	move.w ($14,a4),($14,a6)
	moveq #$e,d0
	bra.w loc_096d90

;----------------------------------------------
loc_096688:
	tst.b (a4)
	beq.w loc_096d88
	move.w ($10,a4),($10,a6)
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_0966a0:
	move.b (4,a6),d0
	move.w loc_0966ac(pc,d0.w),d1
	jmp loc_0966ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0966ac:
	dc.w loc_0966b4-loc_0966ac
	dc.w loc_0966c8-loc_0966ac
	dc.w loc_096d82-loc_0966ac
	dc.w loc_096d82-loc_0966ac

;----------------------------------------------
loc_0966b4:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #4,(9,a6)
	moveq #$f,d0
	bra.w loc_096d90

;----------------------------------------------
loc_0966c8:
	tst.b ($35,a4)
	bpl.w loc_096d8e
	tst.b (a4)
	beq.w loc_096d88
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_0966ee:
	move.b (4,a6),d0
	move.w loc_0966fa(pc,d0.w),d1
	jmp loc_0966fa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0966fa:
	dc.w loc_096702-loc_0966fa
	dc.w loc_09676a-loc_0966fa
	dc.w loc_096d82-loc_0966fa
	dc.w loc_096d82-loc_0966fa

;----------------------------------------------
loc_096702:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #2,(9,a6)
	move.b #$78,($3b,a6)
	move.w #$28,($64,a6)
	moveq #$28,d2
	tst.b ($b,a6)
	bne.b loc_09672a
	neg.w d2
	neg.l ($40,a6)

loc_09672a:
	add.w ($10,a4),d2
	move.w d2,($10,a6)
	jsr RNGFunction
	andi.w #$3f,d0
	addi.w #$60,d0
	move.w d0,($14,a6)
	clr.l ($48,a6)
	move.l #$ffffc000,($4c,a6)
	andi.w #3,d0
	move.b d0,($3a,a6)
	jsr RNGFunction
	andi.w #7,d0
	add.b ($5b,a6),d0
	bra.w loc_096d90

;----------------------------------------------
loc_09676a:
	move.b (5,a6),d0
	move.w loc_096776(pc,d0.w),d1
	jmp loc_096776(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096776:
	dc.w loc_09677a-loc_096776
	dc.w loc_0967b0-loc_096776

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09677a:
	subq.b #1,($3b,a6)
	bmi.w loc_096d88
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0967a4
	move.w d0,($14,a6)
	addq.b #2,(5,a6)
	move.l ($44,a6),d0
	neg.l d0
	lsr.l #1,d0
	move.l d0,($44,a6)

loc_0967a4:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0967b0:
	subq.b #1,($3b,a6)
	bmi.w loc_096d88
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0967de
	move.w d0,($14,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_096d88
	move.l ($44,a6),d0
	neg.l d0
	lsr.l #1,d0
	move.l d0,($44,a6)

loc_0967de:
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_096d8e
	jmp loc_01b4ec

;==============================================
loc_0967fa:
	move.b (4,a6),d0
	move.w loc_096806(pc,d0.w),d1
	jmp loc_096806(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096806:
	dc.w loc_09680e-loc_096806
	dc.w loc_096888-loc_096806
	dc.w loc_096d82-loc_096806
	dc.w loc_096d82-loc_096806

;----------------------------------------------
loc_09680e:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #2,(9,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),d0
	addi.w #$48,d0
	move.w d0,($14,a6)
	move.b ($3a,a6),d1
	ext.w d1
	lea.l loc_096f40(pc),a0
	move.w (a0,d1.w),d0
	add.w ($64,a4),d0
	move.w d0,($64,a6)
	add.w d1,d1
	lea.l loc_096ee0(pc),a0
	move.l (a0,d1.w),d0
	movea.w ($38,a4),a3
	add.l ($10,a3),d0
	sub.l ($10,a6),d0
	lsr.l #6,d0
	move.l d0,($40,a6)
	lea.l loc_096f70(pc),a0
	move.l (a0,d1.w),($44,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$42,d0
	add.b ($3b,a6),d0
	bsr.w loc_096d90
	jmp loc_01b4ec

;----------------------------------------------
loc_096888:
	move.b (5,a6),d0
	move.w loc_09689a(pc,d0.w),d1
	jsr loc_09689a(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09689a:
	dc.w loc_09689e-loc_09689a
	dc.w loc_0968cc-loc_09689a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09689e:
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0968c6
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	jsr RNGFunction
	andi.w #3,d0
	addi.w #$3e,d0
	bra.w loc_096d90

loc_0968c6:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0968cc:
	rts

;==============================================
loc_0968ce:
	move.b (4,a6),d0
	move.w loc_0968da(pc,d0.w),d1
	jmp loc_0968da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0968da:
	dc.w loc_09680e-loc_0968da
	dc.w loc_0968e2-loc_0968da
	dc.w loc_096d82-loc_0968da
	dc.w loc_096d82-loc_0968da

;----------------------------------------------
loc_0968e2:
	move.b (5,a6),d0
	move.w loc_0968ee(pc,d0.w),d1
	jmp loc_0968ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0968ee:
	dc.w loc_0968f2-loc_0968ee
	dc.w loc_09693e-loc_0968ee

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0968f2:
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_096932
	addq.b #2,(5,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l ($44,a6),d0
	asr.l #2,d0
	neg.l d0
	move.l d0,($44,a6)
	moveq #$42,d0
	add.b ($3b,a6),d0
	bsr.w loc_096d90
	jmp loc_01b4ec

loc_096932:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09693e:
	jmp loc_01b4ec

;==============================================
loc_096944:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_096954(pc,d0.w),d1
	jmp loc_096954(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096954:
	dc.w loc_09695c-loc_096954
	dc.w loc_0969c6-loc_096954
	dc.w loc_096d82-loc_096954
	dc.w loc_096d82-loc_096954

;----------------------------------------------
loc_09695c:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #2,(9,a6)
	movea.l #loc_096fd0,a0
	move.b ($3b,a6),d0
	ext.w d0
	add.w d0,d0
	adda.w (a0,d0.w),a0
	move.b ($3a,a6),d1
	ext.w d1
	add.w d1,d1
	tst.b ($101,a4)
	beq.b loc_09698e
	addi.w #$18,d1

loc_09698e:
	jsr loc_01bd5c
	move.w ($10,a3),d0
	add.w (a0,d1.w),d0
	move.w d0,($10,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	add.w ($c,a0,d1.w),d0
	move.w d0,($14,a6)
	moveq #0,d0
	move.b ($3b,a6),d0
	move.b loc_0969be(pc,d0.w),d0
	bra.w loc_096d90

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0969be:
	dc.b $60,$68,$78,$70
	dc.b $68,$80,$80,$80

;----------------------------------------------
loc_0969c6:
	move.b (5,a6),d0
	move.w loc_0969d2(pc,d0.w),d1
	jmp loc_0969d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0969d2:
	dc.w loc_0969d6-loc_0969d2
	dc.w loc_096a5e-loc_0969d2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0969d6:
	tst.b ($1f0,a4)
	beq.b loc_096a28
	addq.b #2,(5,a6)
	move.b ($3b,a6),d0
	lsl.w #3,d0
	move.l loc_096a2e(pc,d0.w),($40,a6)
	move.l loc_096a2e+4(pc,d0.w),($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa800,($4c,a6)
	jsr RNGFunction
	andi.l #$1ffff,d0
	add.l d0,($40,a6)
	jsr RNGFunction
	andi.l #$1ffff,d0
	add.l d0,($44,a6)
	move.b #2,($3b,a6)

loc_096a28:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096a2e:
	dc.l $fffd0000,$00040000
	dc.l $ffff0000,$00040000
	dc.l $00010000,$00040000
	dc.l $fffc0000,$00040000
	dc.l $00020000,$00040000
	dc.l $00010000,$00040000

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096a5e:
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_096a84
	move.w d0,($14,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_096d88
	move.l ($44,a6),d0
	neg.l d0
	lsr.l #1,d0
	move.l d0,($44,a6)

loc_096a84:
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_096d8e
	jmp loc_01b4ec

;==============================================
loc_096aa0:
	move.b (4,a6),d0
	move.w loc_096aac(pc,d0.w),d1
	jmp loc_096aac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096aac:
	dc.w loc_096ab4-loc_096aac
	dc.w loc_096ad6-loc_096aac
	dc.w loc_096d82-loc_096aac
	dc.w loc_096d82-loc_096aac

;----------------------------------------------
loc_096ab4:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #4,(9,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.w #$88,d0
	bra.w loc_096d90

;----------------------------------------------
loc_096ad6:
	move.b (5,a6),d0
	move.w loc_096ae2(pc,d0.w),d1
	jmp loc_096ae2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096ae2:
	dc.w loc_096ae6-loc_096ae2
	dc.w loc_096af2-loc_096ae2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096ae6:
	tst.b ($35,a4)
	beq.w loc_096d8e
	addq.b #2,(5,a6)

loc_096af2:
	move.b ($b,a4),($b,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	tst.b ($35,a4)
	ble.w loc_096d88
	jmp loc_01b4ec

;==============================================
loc_096b12:
	move.b (4,a6),d0
	move.w loc_096b1e(pc,d0.w),d1
	jmp loc_096b1e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096b1e:
	dc.w loc_096b26-loc_096b1e
	dc.w loc_096b98-loc_096b1e
	dc.w loc_096d82-loc_096b1e
	dc.w loc_096d82-loc_096b1e

;----------------------------------------------
loc_096b26:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #2,(9,a6)
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),($14,a6)
	move.l #$40000,($40,a6)
	move.l #$ffffed00,($48,a6)
	move.l #$ffff8000,($44,a6)
	move.l #$1800,($4c,a6)
	jsr RNGFunction
	andi.w #$f,d0
	add.b d0,($4a,a6)
	add.b d0,($4e,a6)
	tst.b ($b,a6)
	beq.b loc_096b8a
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_096b8a:
	moveq #$16,d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_096b98:
	bsr.w loc_096e92
	tst.b ($33,a6)
	bmi.w loc_096d88
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_096d8e
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_096bc0:
	move.b (4,a6),d0
	move.w loc_096bcc(pc,d0.w),d1
	jmp loc_096bcc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096bcc:
	dc.w loc_096bd4-loc_096bcc
	dc.w loc_096c20-loc_096bcc
	dc.w loc_096d82-loc_096bcc
	dc.w loc_096d82-loc_096bcc

;----------------------------------------------
loc_096bd4:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	move.b #2,(9,a6)
	jsr RNGFunction
	andi.w #$1f,d0
	move.b d0,($3b,a6)
	jsr RNGFunction
	andi.w #$ff,d0
	ext.w d0
	add.w ($10,a4),d0
	move.w d0,($10,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	addi.w #$e8,d0
	move.w d0,($14,a6)
	move.b #2,($3a,a6)
	moveq #$11,d0
	bra.w loc_096d90

;----------------------------------------------
loc_096c20:
	move.b (5,a6),d0
	move.w loc_096c2c(pc,d0.w),d1
	jmp loc_096c2c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096c2c:
	dc.w loc_096c32-loc_096c2c
	dc.w loc_096c5a-loc_096c2c
	dc.w loc_096c90-loc_096c2c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096c32:
	subq.b #1,($3b,a6)
	bpl.b loc_096c58
	addq.b #2,(5,a6)
	move.b #$78,($3b,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffa800,($4c,a6)

loc_096c58:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096c5a:
	subq.b #1,($3b,a6)
	bmi.w loc_096d88
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_096c84
	move.w d0,($14,a6)
	addq.b #2,(5,a6)
	move.l ($44,a6),d0
	neg.l d0
	lsr.l #1,d0
	move.l d0,($44,a6)

loc_096c84:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_096c90:
	subq.b #1,($3b,a6)
	bmi.w loc_096d88
	bsr.w loc_096e92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_096cbe
	move.w d0,($14,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_096d88
	move.l ($44,a6),d0
	neg.l d0
	lsr.l #1,d0
	move.l d0,($44,a6)

loc_096cbe:
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_096d8e
	jmp loc_01b4ec

;==============================================
loc_096cda:
	move.b (4,a6),d0
	move.w loc_096ce6(pc,d0.w),d1
	jmp loc_096ce6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096ce6:
	dc.w loc_096cee-loc_096ce6
	dc.w loc_096d10-loc_096ce6
	dc.w loc_096d82-loc_096ce6
	dc.w loc_096d82-loc_096ce6

;----------------------------------------------
loc_096cee:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	clr.w ($c,a6)
	move.w #$6000,($1a,a6)
	move.b ($3c,a6),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_096d10:
	tst.b ($33,a6)
	bmi.w loc_096d88
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_096d24:
	move.b (4,a6),d0
	move.w loc_096d30(pc,d0.w),d1
	jmp loc_096d30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096d30:
	dc.w loc_096d38-loc_096d30
	dc.w loc_096d68-loc_096d30
	dc.w loc_096d82-loc_096d30
	dc.w loc_096d82-loc_096d30

;----------------------------------------------
loc_096d38:
	addq.b #2,(4,a6)
	bsr.w loc_096eb4
	clr.w ($c,a6)
	move.b #6,(9,a6)
	move.w #$6000,($1a,a6)
	movea.w ($36,a4),a0
	move.w ($64,a0),($14,a6)
	moveq #$16,d0
	movea.l #loc_2e514c,a0
	jsr loc_01b6e0

;----------------------------------------------
loc_096d68:
	move.w ($10,a4),($10,a6)
	tst.b (a4)
	beq.w loc_096d88
	tst.b ($124,a5)
	bne.w loc_096d8e
	jmp loc_01b4ec

;----------------------------------------------
loc_096d82:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096d88:
	move.b #4,(4,a6)

loc_096d8e:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096d90:
	movea.l #loc_25a5c0,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096d9c:
	bsr.b loc_096dcc
	beq.b loc_096dca
	move.w a6,($36,a4)
	movea.w a4,a3
	bsr.b loc_096dcc
	beq.b loc_096dca
	move.w a6,($36,a4)
	move.b #2,(3,a3)
	move.b #4,(3,a4)
	cmpa.w a4,a3
	bcc.b loc_096dca
	move.b #2,(3,a4)
	move.b #4,(3,a3)

loc_096dca:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096dcc:
	jsr loc_01c2c8
	beq.b loc_096ddc
	addq.b #1,(a4)
	move.b #$27,(2,a4)

loc_096ddc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096dde:
	dc.b $60,$68,$78,$70
	dc.b $68,$80,$80,$80

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096de6:
	movea.w ($36,a6),a4
	move.b ($132,a4),d0
	ext.w d0
	addq.w #1,d0
	add.w d0,d0
	add.b ($128,a4),d0
	move.b loc_096dde(pc,d0.w),d6
	moveq #3,d5

loc_096dfe:
	bsr.b loc_096dcc
	beq.b loc_096e40
	move.b #6,(3,a4)
	move.b d6,($5b,a4)
	move.w a6,($36,a4)
	jsr RNGFunction
	andi.w #6,d0
	move.w d5,d1
	lsl.w #3,d1
	add.w d1,d0
	move.w loc_096e42(pc,d0.w),($40,a4)
	jsr RNGFunction
	andi.w #6,d0
	move.w d5,d1
	lsl.w #3,d1
	add.w d1,d0
	move.w loc_096e6a(pc,d0.w),($44,a4)
	dbra d5,loc_096dfe

loc_096e40:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096e42:
	dc.w $0001,$0002,$0002,$0001
	dc.w $0002,$0004,$0003,$0004
	dc.w $0002,$0003,$0002,$0004
	dc.w $0001,$0002,$0002,$0003
	dc.w $0001,$0000,$0002,$0001

loc_096e6a:
	dc.w $0002,$0003,$0002,$0003
	dc.w $0002,$0001,$0000,$0003
	dc.w $0000,$0001,$0000,$0000
	dc.w $0002,$0000,$0001,$0000
	dc.w $0000,$0001,$0000,$ffff

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096e92:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_096eb4:
	move.b ($b,a4),($b,a6)
	move.b #1,($30,a6)
	move.l ($18,a4),($18,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	move.b ($e,a4),($e,a6)
	move.w ($26,a4),($26,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096ee0:
	dc.l $00000000,$00100000
	dc.l $00080000,$fff00000
	dc.l $fff80000,$00000000
	dc.l $00200000,$00180000
	dc.l $00100000,$00080000
	dc.l $ffe00000,$ffe80000
	dc.l $fff00000,$fff80000
	dc.l $00000000,$00300000
	dc.l $00280000,$00200000
	dc.l $00180000,$00100000
	dc.l $00080000,$00080000
	dc.l $00080000,$00080000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096f40:
	dc.w $0010,$0010,$0018,$0010
	dc.w $0018,$0020,$0010,$0018
	dc.w $0020,$0028,$0010,$0018
	dc.w $0020,$0028,$0030,$0010
	dc.w $0018,$0020,$0028,$0030
	dc.w $0038,$0038,$0038,$0038

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096f70:
	dc.l $0009c000,$0009c000
	dc.l $0009e000,$0009c000
	dc.l $0009e000,$000a0000
	dc.l $0009c000,$0009e000
	dc.l $000a0000,$000a2000
	dc.l $0009c000,$0009e000
	dc.l $000a0000,$000a2000
	dc.l $000a4000,$0009c000
	dc.l $0009e000,$000a0000
	dc.l $000a2000,$000a4000
	dc.l $000a6000,$000a6000
	dc.l $000a6000,$000a6000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_096fd0:
	dc.w $000c,$003c,$006c,$000c
	dc.w $006c,$003c,$0048,$0060
	dc.w $0078,$0054,$006c,$0060
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028,$0108,$0120
	dc.w $0138,$0114,$012c,$0120
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028,$0040,$0060
	dc.w $0080,$0050,$0070,$0060
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028,$0100,$0120
	dc.w $0140,$0110,$0130,$0120
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028,$0050,$0060
	dc.w $0070,$0058,$0068,$0060
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028,$0110,$0120
	dc.w $0130,$0118,$0128,$0120
	dc.w $0008,$0008,$0008,$0018
	dc.w $0018,$0028

;##############################################
loc_09706c:
	move.b (4,a6),d0
	move.w loc_097078(pc,d0.w),d1
	jmp loc_097078(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097078:
	dc.w loc_097080-loc_097078
	dc.w loc_0970c2-loc_097078
	dc.w loc_09710e-loc_097078
	dc.w loc_09710e-loc_097078

;==============================================
loc_097080:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.w #$ff02,($c,a6)
	move.b #2,(9,a6)
	move.b #1,($30,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.b #3,($3a,a6)
	movea.w ($36,a6),a4
	lea.l ($40,a6),a3
	moveq #3,d6

loc_0970b4:
	bsr.w loc_097114
	bsr.w loc_09714a
	dbra d6,loc_0970b4
	rts

;==============================================
loc_0970c2:
	move.b ($3a,a6),d0
	addq.b #1,d0
	andi.w #3,d0
	move.b d0,($3a,a6)
	lsl.w #4,d0
	lea.l ($40,a6,d0.w),a3
	bsr.w loc_097212
	tst.b (5,a3)
	bpl.b loc_0970e8
	move.b #4,(4,a6)
	rts

loc_0970e8:
	move.w ($8,a3),d0
	add.w d0,($c,a3)
	move.w ($a,a3),d0
	add.w d0,($e,a3)
	move.w ($c,a3),($10,a6)
	move.w ($e,a3),($14,a6)
	move.l (a3),($1c,a6)
	jmp loc_01b4ec

;==============================================
loc_09710e:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097114:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_097138(pc,d0.w),d0
	movea.l #loc_2e50a0,a0
	jsr loc_01b6e0
	move.l ($1c,a6),(a3)+
	move.l ($32,a6),(a3)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097138:
	dc.b $20,$20,$20,$20
	dc.b $21,$21,$21,$21
	dc.b $21,$21,$21,$22
	dc.b $22,$22,$22,$22
	dc.b $22,$22

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09714a:
	moveq #0,d0
	move.b (3,a6),d0
	move.w loc_097158(pc,d0.w),d1
	jmp loc_097158(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097158:
	dc.w loc_09715e-loc_097158
	dc.w loc_0971b0-loc_097158
	dc.w loc_0971d2-loc_097158

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09715e:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$1c,d0
	move.w loc_097190(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_097176
	neg.w d2

loc_097176:
	move.w d2,(a3)+
	move.w loc_097190+2(pc,d0.w),(a3)+
	andi.w #$f,d1
	add.w ($10,a6),d1
	move.w d1,(a3)+
	move.w ($14,a6),(a3)
	addi.w #$30,(a3)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097190:
	dc.w $0001,$fffe
	dc.w $0002,$fffc
	dc.w $0003,$fffe
	dc.w $0001,$fffc
	dc.w $0002,$fffe
	dc.w $0003,$fffc
	dc.w $0001,$fffa
	dc.w $0002,$fffa

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0971b0:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$1c,d0
	clr.w (a3)+
	move.w loc_097190+2(pc,d0.w),(a3)+
	andi.w #7,d1
	add.w ($10,a6),d1
	move.w d1,(a3)+
	move.w ($14,a6),(a3)+
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0971d2:
	jsr RNGFunction
	move.w d0,d1
	andi.w #$e,d0
	move.w loc_097202(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_0971ea
	neg.w d2

loc_0971ea:
	move.w d2,(a3)+
	clr.w (a3)+
	move.w ($10,a6),(a3)+
	andi.w #$f,d1
	addi.w #$40,d1
	add.w ($14,a6),d1
	move.w d1,(a3)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097202:
	dc.w $0001,$0002,$0003,$0004
	dc.w $0005,$0006,$0003,$0004

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097212:
	movea.l (a3),a0
	move.b (1,a0),d0
	beq.b loc_097222
	bmi.b loc_097228
	btst #6,d0
	bne.b loc_09722e

loc_097222:
	lea.l (8,a0),a0
	bra.b loc_097234

loc_097228:
	movea.l (8,a0),a0
	bra.b loc_097234

loc_09722e:
	st.b ($33,a3)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097234:
	move.l a0,(a3)
	move.l (a0),(4,a3)
	rts

;##############################################
loc_09723c:
	move.b ($b4,a5),d1
	andi.b #3,d1
	bne.b loc_097272
	jsr loc_01c2c8
	beq.b loc_097272
	addq.b #1,(a4)
	move.w #$2800,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_097272:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097274:
	move.b ($b4,a5),d1
	andi.b #7,d1
	bne.b loc_0972aa
	jsr loc_01c2c8
	beq.b loc_0972aa
	addq.b #1,(a4)
	move.w #$2802,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_0972aa:
	rts

;##############################################
loc_0972ac:
	move.b ($b4,a5),d1
	andi.b #3,d1
	bne.b loc_0972e2
	jsr loc_01c2c8
	beq.b loc_0972e2
	addq.b #1,(a4)
	move.w #$2804,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_0972e2:
	rts

;##############################################
loc_0972e4:
	move.b (4,a6),d0
	move.w loc_0972f0(pc,d0.w),d1
	jmp loc_0972f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0972f0:
	dc.w loc_0972f8-loc_0972f0
	dc.w loc_097528-loc_0972f0
	dc.w loc_0977ae-loc_0972f0
	dc.w loc_0977b4-loc_0972f0

;==============================================
loc_0972f8:
	addq.b #2,(4,a6)
	clr.b ($5b,a6)
	move.b (3,a6),d0
	move.w loc_09730c(pc,d0.w),d1
	jmp loc_09730c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09730c:
	dc.w loc_09732a-loc_09730c
	dc.w loc_09732a-loc_09730c
	dc.w loc_097324-loc_09730c
	dc.w loc_09739c-loc_09730c
	dc.w loc_0973b0-loc_09730c
	dc.w loc_0973bc-loc_09730c
	dc.w loc_0973d0-loc_09730c
	dc.w loc_097412-loc_09730c

	dc.w loc_097428-loc_09730c
	dc.w loc_09747c-loc_09730c
	dc.w loc_0974c4-loc_09730c
	dc.w loc_0974d0-loc_09730c

;----------------------------------------------
loc_097324:
	move.b #1,($30,a6)

loc_09732a:
	move.b #4,(9,a6)
	move.b #2,($38,a6)
	clr.b ($39,a6)
	move.b (3,a6),d0
	lsl.w #3,d0
	move.l loc_09736c(pc,d0.w),($40,a6)
	move.l loc_09736c+4(pc,d0.w),($44,a6)
	move.l loc_09736c+8(pc,d0.w),($48,a6)
	move.l loc_09736c+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_097366
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_097366:
	moveq #2,d0
	bra.w loc_0977ba

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09736c:
	dc.l $00008000,$00005000,$fffff800,$fffffb00
	dc.l $ffff8000,$00005000,$00000800,$fffffb00
	dc.l $00050000,$00000000,$ffff8000,$ffffc000

;----------------------------------------------
loc_09739c:
	move.b #4,(9,a6)
	moveq #4,d0
	movea.l #loc_1c0994,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_0973b0:
	move.b #2,(9,a6)
	moveq #0,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_0973bc:
	move.b #2,(9,a6)
	moveq #9,d0
	jsr loc_02fc88
	moveq #1,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_0973d0:
	move.b #2,(9,a6)
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #-7,d0
	move.b ($b,a4),($b,a6)
	bne.b loc_0973f2
	neg.w d0

loc_0973f2:
	add.w d0,($10,a6)
	subq.w #5,($14,a6)
	jsr RNGFunction
	andi.b #$1f,d0
	addi.b #$a,d0
	move.b d0,($3c,a6)
	moveq #3,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_097412:
	move.b #2,(9,a6)
	jsr RNGFunction
	andi.b #3,d0
	addq.b #4,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_097428:
	moveq #0,d0
	move.b #2,(9,a6)
	move.b #$10,($3a,a6)
	move.w #$60,d0
	move.l #$fff40000,($40,a6)
	move.l #$c000,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_097462
	neg.w d0
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_097462:
	add.w d0,($10,a6)
	moveq #0,d0
	movea.l #loc_17befa,a0
	jsr loc_01b6e0
	moveq #4,d0
	jmp loc_02fc88

;----------------------------------------------
loc_09747c:
	move.b #2,(9,a6)
	move.l #$ffff0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	moveq #$38,d0
	moveq #$49,d1
	tst.b ($b,a6)
	beq.b loc_0974b6
	neg.w d0
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0974b6:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	moveq #9,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_0974c4:
	move.b #2,(9,a6)
	moveq #$b,d0
	bra.w loc_0977ba

;----------------------------------------------
loc_0974d0:
	move.b #2,(9,a6)
	movea.w ($36,a6),a4
	movea.w ($38,a4),a1
	move.w ($10,a1),($10,a6)
	move.w ($64,a1),($14,a6)
	moveq #$40,d0
	move.l #$20000,d1
	moveq #0,d2
	tst.b ($b,a1)
	bne.b loc_097500
	neg.w d0
	neg.l d1
	neg.l d2

loc_097500:
	add.w d0,($10,a6)
	addi.w #$40,($14,a6)
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$c,d0
	bra.w loc_0977ba

;==============================================
loc_097528:
	tst.b ($12a,a5)
	bne.w loc_0977c6
	tst.b ($125,a5)
	bne.b loc_097542
	move.b (3,a6),d0
	move.w loc_09754e(pc,d0.w),d1
	jsr loc_09754e(pc,d1.w)

loc_097542:
	tst.b ($5b,a6)
	bne.b loc_0975a2
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09754e:
	dc.w loc_097566-loc_09754e
	dc.w loc_097566-loc_09754e
	dc.w loc_0975fa-loc_09754e
	dc.w loc_097678-loc_09754e
	dc.w loc_097688-loc_09754e
	dc.w loc_097688-loc_09754e
	dc.w loc_097698-loc_09754e
	dc.w loc_0976c0-loc_09754e

	dc.w loc_0976e0-loc_09754e
	dc.w loc_097728-loc_09754e
	dc.w loc_097760-loc_09754e
	dc.w loc_097762-loc_09754e

;----------------------------------------------
loc_097566:
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_0975a2
	movea.w ($36,a6),a4
	subq.b #1,($38,a6)
	bpl.b loc_097596
	move.b #2,($38,a6)
	move.w ($c,a4),($c,a6)
	eori.b #1,($39,a6)
	beq.b loc_097596
	st.b ($c,a6)
	addq.b #1,($d,a6)

loc_097596:
	move.b (6,a6),d0
	move.w loc_0975a4(pc,d0.w),d1
	jmp loc_0975a4(pc,d1.w)

loc_0975a2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0975a4:
	dc.w loc_0975aa-loc_0975a4
	dc.w loc_0975c0-loc_0975a4
	dc.w loc_0975ea-loc_0975a4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0975aa:
	addq.b #2,(6,a6)
	move.b #$1f,($3a,a6)
	move.b #$1f,($3b,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0975c0:
	tst.b ($10e,a5)
	beq.b loc_0975cc
	tst.b ($35,a4)
	beq.b loc_0975d6

loc_0975cc:
	addq.b #2,(6,a6)
	moveq #8,d0
	bra.w loc_0977ba

loc_0975d6:
	bsr.w loc_0977ce
	bsr.w loc_0977f0
	jsr loc_097274
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0975ea:
	tst.b ($33,a6)
	bpl.b loc_0975f4
	addq.b #2,(4,a6)

loc_0975f4:
	jmp loc_01b6b6

;----------------------------------------------
loc_0975fa:
	movea.w ($36,a6),a4
	subq.b #1,($38,a6)
	bpl.b loc_097620
	move.b #2,($38,a6)
	move.w ($c,a4),($c,a6)
	eori.b #1,($39,a6)
	beq.b loc_097620
	st.b ($c,a6)
	addq.b #1,($d,a6)

loc_097620:
	move.b (6,a6),d0
	move.w loc_09762c(pc,d0.w),d1
	jmp loc_09762c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09762c:
	dc.w loc_097632-loc_09762c
	dc.w loc_097642-loc_09762c
	dc.w loc_097664-loc_09762c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097632:
	addq.b #2,(6,a6)
	move.b #$a,($3a,a6)
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097642:
	subq.b #1,($3a,a6)
	bpl.b loc_09765e
	addq.b #2,(6,a6)
	move.b #$13,($3a,a6)
	move.b #$f,($3b,a6)
	move.b #$1d,($31,a6)

loc_09765e:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097664:
	bsr.w loc_0977ce
	bsr.w loc_097812
	jsr loc_097274
	jmp loc_01b6b6

;----------------------------------------------
loc_097678:
	tst.b ($33,a6)
	bpl.b loc_097682
	addq.b #2,(4,a6)

loc_097682:
	jmp loc_01b692

;----------------------------------------------
loc_097688:
	tst.b ($33,a6)
	bpl.b loc_097692
	addq.b #2,(4,a6)

loc_097692:
	jmp loc_01b6b6

;----------------------------------------------
loc_097698:
	subq.b #1,($3c,a6)
	bpl.b loc_0976b4
	jsr RNGFunction
	andi.b #$1f,d0
	addi.b #8,d0
	move.b d0,($3c,a6)
	bsr.w loc_097942

loc_0976b4:
	jsr loc_097274
	jmp loc_01b6b6

;----------------------------------------------
loc_0976c0:
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	tst.b ($33,a6)
	bpl.b loc_0976da
	addq.b #2,(4,a6)

loc_0976da:
	jmp loc_01b6b6

;----------------------------------------------
loc_0976e0:
	move.b (6,a6),d0
	move.w loc_0976ec(pc,d0.w),d1
	jmp loc_0976ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0976ec:
	dc.w loc_0976f0-loc_0976ec
	dc.w loc_09770a-loc_0976ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0976f0:
	subq.b #1,($3a,a6)
	bpl.b loc_097700
	addq.b #2,(6,a6)
	move.b #8,($3a,a6)

loc_097700:
	bsr.w loc_0977ce
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09770a:
	subq.b #1,($3a,a6)
	bpl.b loc_097714
	addq.b #2,(4,a6)

loc_097714:
	btst #0,($3a,a6)
	beq.b loc_097722
	eori.b #1,($5b,a6)

loc_097722:
	jmp loc_01b6b6

;----------------------------------------------
loc_097728:
	move.b (6,a6),d0
	move.w loc_097734(pc,d0.w),d1
	jmp loc_097734(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097734:
	dc.w loc_097738-loc_097734
	dc.w loc_09775e-loc_097734

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097738:
	bsr.w loc_0977ce
	movea.w ($36,a6),a4
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_097758
	addq.b #2,(6,a6)
	move.w d0,($14,a6)
	moveq #$a,d0
	bra.w loc_0977ba

loc_097758:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_09775e:
	rts

;----------------------------------------------
loc_097760:
	rts

;----------------------------------------------
loc_097762:
	move.b (6,a6),d0
	move.w loc_09776e(pc,d0.w),d1
	jmp loc_09776e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09776e:
	dc.w loc_097772-loc_09776e
	dc.w loc_097798-loc_09776e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097772:
	bsr.w loc_0977ce
	movea.w ($36,a6),a4
	move.w ($64,a4),d0
	cmp.w ($14,a6),d0
	bcs.b loc_097792
	addq.b #2,(6,a6)
	move.w d0,($14,a6)
	move.b #$17,($3a,a6)

loc_097792:
	jmp loc_01b6b6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_097798:
	subq.b #1,($3a,a6)
	bmi.w loc_0977c6
	move.b ($b4,a5),d0
	andi.b #1,d0
	move.b d0,($5b,a6)
	rts

;==============================================
loc_0977ae:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_0977b4:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0977ba:
	movea.l #loc_1c0978,a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0977c6:
	move.b #4,(4,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0977ce:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0977f0:
	subq.b #1,($3a,a6)
	bpl.b loc_097800
	move.b #$1f,($3a,a6)
	neg.l ($48,a6)

loc_097800:
	subq.b #1,($3b,a6)
	bpl.b loc_097810
	move.b #$1f,($3b,a6)
	neg.l ($4c,a6)

loc_097810:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097812:
	subq.b #1,($3a,a6)
	bpl.b loc_097828
	move.b #$13,($3a,a6)
	neg.l ($48,a6)
	eori.b #6,(9,a6)

loc_097828:
	subq.b #1,($3b,a6)
	bpl.b loc_097838
	move.b #$1f,($3b,a6)
	neg.l ($4c,a6)

loc_097838:
	subq.b #1,($31,a6)
	bpl.b loc_09784a
	move.b #$27,($31,a6)
	eori.b #6,(9,a6)

loc_09784a:
	rts

;##############################################
loc_09784c:
	jsr loc_01c2c8
	beq.w loc_0978ee
	addq.b #1,(a4)
	move.w #$2900,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$ffce,d0
	move.b ($b,a6),($b,a4)
	bne.b loc_097894
	neg.w d0

loc_097894:
	add.w d0,($10,a4)
	addi.w #$54,($14,a4)
	jsr loc_01c2c8
	beq.b loc_0978ee
	addq.b #1,(a4)
	move.w #$2902,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$32,d0
	move.b ($b,a6),($b,a4)
	bne.b loc_0978e4
	neg.w d0

loc_0978e4:
	add.w d0,($10,a4)
	addi.w #$54,($14,a4)

loc_0978ee:
	rts

;##############################################
loc_0978f0:
	jsr loc_01c2c8
	beq.b loc_097940
	addq.b #1,(a4)
	move.w #$2904,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$31,d0
	move.b ($b,a6),($b,a4)
	bne.b loc_097936
	neg.w d0

loc_097936:
	add.w d0,($10,a4)
	addi.w #$52,($14,a4)

loc_097940:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097942:
	jsr loc_01c2c8
	beq.b loc_097980
	addq.b #1,(a4)
	move.w #$290e,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_097980:
	rts

;##############################################
loc_097982:
	jsr loc_01c2c8
	beq.b loc_0979e8
	addq.b #1,(a4)
	move.w #$2908,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	moveq #0,d0
	movea.w ($36,a6),a3
	move.b ($1e1,a3),d0
	addq.b #2,d0
	andi.b #$e,d0
	move.b d0,($1e1,a3)
	move.b loc_0979ea(pc,d0.w),d1
	move.b loc_0979ea+1(pc,d0.w),d2
	ext.w d1
	ext.w d2
	move.b ($b,a6),($b,a4)
	beq.b loc_0979d8
	neg.w d1

loc_0979d8:
	add.w ($10,a6),d1
	add.w ($14,a6),d2
	move.w d1,($10,a4)
	move.w d2,($14,a4)

loc_0979e8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0979ea:
	dc.b $11,$f2
	dc.b $0f,$fc
	dc.b $22,$0f
	dc.b $18,$00
	dc.b $12,$0f
	dc.b $0e,$05
	dc.b $29,$f4
	dc.b $1f,$04

;##############################################
loc_0979fa:
	jsr loc_01c2c8
	beq.b loc_097a3c
	addq.b #1,(a4)
	move.w #$290a,(2,a4)
	move.b ($e,a6),($e,a4)
	movea.w ($36,a6),a0
	move.w ($c,a0),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)

loc_097a3c:
	rts

;##############################################
loc_097a3e:
	jsr loc_01c2c8
	beq.b loc_097a7c
	addq.b #1,(a4)
	move.w #$2910,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)

loc_097a7c:
	rts

;##############################################
loc_097a7e:
	jsr loc_01c2c8
	beq.b loc_097abc
	addq.b #1,(a4)
	move.w #$2912,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)

loc_097abc:
	rts

;##############################################
loc_097abe:
	jsr loc_01c2c8
	beq.b loc_097afc
	addq.b #1,(a4)
	move.w #$2914,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)

loc_097afc:
	rts

;##############################################
loc_097afe:
	jsr loc_01c2c8
	beq.b loc_097b3c
	addq.b #1,(a4)
	move.w #$2916,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)

loc_097b3c:
	rts

;##############################################
loc_097b3e:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_097b4e(pc,d0.w),d1
	jmp loc_097b4e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097b4e:
	dc.w loc_097b56-loc_097b4e
	dc.w loc_097b9e-loc_097b4e
	dc.w loc_097c08-loc_097b4e
	dc.w loc_097c08-loc_097b4e

;==============================================
loc_097b56:
	addq.b #2,(4,a6)
	move.w ($1a,a4),($1a,a6)
	move.w ($18,a4),($18,a6)
	move.b #6,(9,a6)
	move.b ($e,a4),($e,a6)
	move.w ($c,a4),($c,a6)
	move.b ($b,a4),($b,a6)
	clr.b ($3c,a6)
	clr.b ($3a,a6)
	moveq #8,d0
	add.b (3,a6),d0
	movea.l #loc_1b4836,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;==============================================
loc_097b9e:
	move.b (3,a6),d0
	add.b d0,d0
	move.w loc_097bac(pc,d0.w),d1
	jmp loc_097bac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097bac:
	dc.w loc_097bb0-loc_097bac
	dc.w loc_097bf2-loc_097bac

;----------------------------------------------
loc_097bb0:
	tst.b ($aa,a4)
	beq.b loc_097bbc
	addq.b #2,(4,a6)
	bra.b loc_097bd6

loc_097bbc:
	cmpi.b #$e,(6,a4)
	beq.b loc_097bca
	addq.b #2,(4,a6)
	bra.b loc_097bd6

loc_097bca:
	cmpi.b #8,(7,a4)
	bne.b loc_097bd6
	addq.b #2,(4,a6)

loc_097bd6:
	move.w ($10,a4),($10,a6)
	jsr loc_01b6b6
	eori.b #1,($3a,a6)
	beq.b loc_097bf0
	jmp loc_01b4ec

loc_097bf0:
	rts

;----------------------------------------------
loc_097bf2:
	tst.b ($33,a6)
	bpl.b loc_097bfc
	addq.b #2,(4,a6)

loc_097bfc:
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_097c08:
	jmp loc_01c2de

;##############################################
loc_097c0e:
	move.b (4,a6),d0
	move.w loc_097c1a(pc,d0.w),d1
	jmp loc_097c1a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097c1a:
	dc.w loc_097c22-loc_097c1a
	dc.w loc_097c80-loc_097c1a
	dc.w loc_097cca-loc_097c1a
	dc.w loc_097cd0-loc_097c1a

;==============================================
loc_097c22:
	addq.b #2,(4,a6)
	move.w #$6000,($1a,a6)
	move.b #1,($30,a6)
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_097c40(pc,d0.w),d1
	jmp loc_097c40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097c40:
	dc.w loc_097c46-loc_097c40
	dc.w loc_097c56-loc_097c40
	dc.w loc_097c66-loc_097c40

;----------------------------------------------
loc_097c46:
	move.b #2,(9,a6)
	bsr.w loc_097da8
	moveq #$25,d0
	bra.w loc_097c74

;----------------------------------------------
loc_097c56:
	move.b #4,(9,a6)
	bsr.w loc_097da8
	moveq #$26,d0
	bra.w loc_097c74

;----------------------------------------------
loc_097c66:
	move.b #2,(9,a6)
	jsr loc_0037b8
	moveq #$27,d0

loc_097c74:
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;==============================================
loc_097c80:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_097c94(pc,d0.w),d1
	jsr loc_097c94(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097c94:
	dc.w loc_097c9a-loc_097c94
	dc.w loc_097c9a-loc_097c94
	dc.w loc_097cae-loc_097c94

;----------------------------------------------
loc_097c9a:
	movea.w ($36,a6),a4
	tst.b ($ab,a4)
	bne.b loc_097ca8
	addq.b #2,(4,a6)

loc_097ca8:
	jmp loc_01b6b6

;----------------------------------------------
loc_097cae:
	tst.b ($33,a6)
	bpl.b loc_097cb8
	addq.b #2,(4,a6)

loc_097cb8:
	tst.b ($35,a6)
	beq.b loc_097cc4
	jsr loc_0037a6

loc_097cc4:
	jmp loc_01b6b6

;==============================================
loc_097cca:
	addq.b #2,(4,a6)
	rts

;==============================================
loc_097cd0:
	jmp loc_01c2de

;##############################################
loc_097cd6:
	jsr loc_01c2c8
	beq.w loc_097da2
	addq.b #1,(a4)
	move.w #$2b02,(2,a4)
	move.w ($18,a6),($18,a4)
	move.b ($e,a6),($e,a4)
	move.b ($26,a6),($26,a4)
	move.b ($59,a6),($59,a4)
	move.w a6,($36,a4)
	move.b ($b,a6),($b,a4)
	beq.b loc_097d0e
	neg.w d0

loc_097d0e:
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)
	tst.b ($31,a6)
	bne.w loc_097da2
	jsr loc_01c2c8
	beq.b loc_097da2
	addq.b #1,(a4)
	move.w #$2b00,(2,a4)
	move.w ($18,a6),($18,a4)
	move.b ($e,a6),($e,a4)
	move.b ($26,a6),($26,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	move.b ($59,a6),($59,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_097da2
	addq.b #1,(a4)
	move.w #$2b01,(2,a4)
	move.w ($18,a6),($18,a4)
	move.b ($e,a6),($e,a4)
	move.b ($26,a6),($26,a4)
	move.b ($b,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	move.b ($59,a6),($59,a4)
	move.w a6,($36,a4)

loc_097da2:
	jmp loc_003814

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097da8:
	movea.w ($36,a6),a4
	moveq #0,d0
	move.b ($102,a4),d0
	add.w d0,d0
	move.w loc_097dc6(pc,d0.w),d0
	tst.b ($b,a4)
	beq.b loc_097dc0
	neg.w d0

loc_097dc0:
	add.w d0,($10,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097dc6:
	dc.w $000b,$fff9,$0009,$fff1
	dc.w $fffa,$ffe0,$000c,$fff5
	dc.w $fff9,$ffff,$0000,$fff6
	dc.w $ffee,$fffa,$fff8,$0006
	dc.w $fff7,$0004,$fffa,$0006
	dc.w $0009,$fffa,$000f,$000b
	dc.w $0000,$fff6,$fff9,$000b
	dc.w $fffa,$fffa,$000f,$000f

;##############################################
loc_097e06:
	move.b (4,a6),d0
	move.w loc_097e12(pc,d0.w),d1
	jmp loc_097e12(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097e12:
	dc.w loc_097e1a-loc_097e12
	dc.w loc_097e34-loc_097e12
	dc.w loc_097e82-loc_097e12
	dc.w loc_097e82-loc_097e12

;==============================================
loc_097e1a:
	addq.b #2,(4,a6)
	move.b #1,($30,a6)
	move.b (3,a6),d0
	movea.l #loc_157980,a0
	jmp loc_01b6e0

;==============================================
loc_097e34:
	tst.b ($33,a6)
	bpl.b loc_097e3e
	addq.b #2,(4,a6)

loc_097e3e:
	movea.w ($36,a6),a4
	moveq #-$18,d3
	cmpi.b #7,(3,a6)
	beq.b loc_097e4e
	moveq #$14,d3

loc_097e4e:
	tst.b ($b,a6)
	beq.b loc_097e56
	neg.w d3

loc_097e56:
	add.w ($10,a4),d3
	move.w d3,($10,a6)
	jsr loc_01b6b6
	move.b ($b4,a5),d0
	add.b ($101,a4),d0
	add.b (3,a6),d0
	btst #0,d0
	beq.b loc_097e7c
	jmp loc_01b4ec

loc_097e7c:
	clr.b (1,a6)
	rts

;==============================================
loc_097e82:
	jmp loc_01c2de

;##############################################
loc_097e88:
	jsr loc_01c2c8
	beq.b loc_097ee4
	addq.b #1, (a4)
	move.b #$2c,(2,a4)
	move.b d2,(3,a4)
	move.b ($e,a6),($e,a4)
	move.b #2,(9,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.w ($18,a6),($18,a4)
	move.w ($1a,a6),($1a,a4)
	moveq #-$18,d0
	cmpi.b #7,d2
	beq.b loc_097ec8
	moveq #$14,d0

loc_097ec8:
	moveq #$74,d1
	move.b ($b,a6),($b,a4)
	beq.b loc_097ed4
	neg.w d0

loc_097ed4:
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	add.w ($14,a6),d1
	move.w d1,($14,a4)

loc_097ee4:
	rts

;##############################################
loc_097ee6:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_097ef4(pc,d0.w),d1
	jmp loc_097ef4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097ef4:
	dc.w loc_097ef8-loc_097ef4
	dc.w loc_097f46-loc_097ef4

;==============================================
loc_097ef8:
	move.b (4,a6),d0
	move.w loc_097f04(pc,d0.w),d1
	jmp loc_097f04(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097f04:
	dc.w loc_097f0c-loc_097f04
	dc.w loc_097f32-loc_097f04
	dc.w loc_097f9a-loc_097f04
	dc.w loc_097f9a-loc_097f04

;----------------------------------------------
loc_097f0c:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_097fd0

loc_097f20:
	moveq #0,d0
	move.b ($31,a6),d0
	movea.l #loc_2e50a0,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_097f32:
	bsr.w loc_097fa8
	bne.w loc_097fa0
	jsr loc_01b6b6
	jmp loc_01b4d0

;==============================================
loc_097f46:
	move.b (4,a6),d0
	move.w loc_097f52(pc,d0.w),d1
	jmp loc_097f52(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_097f52:
	dc.w loc_097f5a-loc_097f52
	dc.w loc_097f70-loc_097f52
	dc.w loc_097f9a-loc_097f52
	dc.w loc_097f9a-loc_097f52

;----------------------------------------------
loc_097f5a:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	bsr.w loc_097fd0
	bra.b loc_097f20

;----------------------------------------------
loc_097f70:
	subq.b #1,($3a,a6)
	bpl.b loc_097f98
	tst.b ($33,a6)
	bpl.b loc_097f8c
	bsr.w loc_097fa8
	bne.w loc_097fa0
	move.b ($3b,a6),($3a,a6)
	bra.b loc_097f20

loc_097f8c:
	jsr loc_01b6b6
	jmp loc_01b4d0

loc_097f98:
	rts

;----------------------------------------------
loc_097f9a:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097fa0:
	move.b #4,(4,a6)
	rts


;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_097fa8:
	cmpi.w #$20e,($404,a5)
	beq.b loc_097fcc
	cmpi.w #$20e,($804,a5)
	beq.b loc_097fcc
	cmpi.w #$20e,($c04,a5)
	beq.b loc_097fcc
	cmpi.w #$20e,($1004,a5)
	beq.b loc_097fcc
	moveq #1,d0
	rts

loc_097fcc:
	moveq #0,d0
	rts

loc_097fd0:
	moveq #0,d0
	move.b ($3c,a6),d0
	lsl.w #4,d0
	move.w loc_09800a(pc,d0.w),($10,a6)
	move.w loc_09800a+2(pc,d0.w),($14,a6)
	move.b loc_09800a+4(pc,d0.w),($b,a6)
	move.b loc_09800a+5(pc,d0.w),(9,a6)
	move.b loc_09800a+6(pc,d0.w),($e,a6)
	move.b loc_09800a+7(pc,d0.w),($31,a6)
	move.w loc_09800a+8(pc,d0.w),($c,a6)
	move.w loc_09800a+$a(pc,d0.w),($3a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09800a:
	dc.w $01e0,$0010
	dc.b $00,$00,$08,$4c
	dc.w $0000,$0000
	dc.w $0000,$0000

	dc.w $02a0,$0010
	dc.b $00,$00,$08,$4d
	dc.w $0000,$0000
	dc.w $0000,$0000

	dc.w $0340,$0010
	dc.b $01,$00,$08,$4e
	dc.w $0000,$0000
	dc.w $0000,$0000

	dc.w $0220,$0010
	dc.b $00,$00,$08,$44
	dc.w $0000,$0008
	dc.w $0000,$0000

	dc.w $02a0,$0010
	dc.b $00,$00,$08,$44
	dc.w $0000,$1820
	dc.w $0000,$0000

	dc.w $02e0,$0010
	dc.b $00,$00,$08,$44
	dc.w $0000,$3004
	dc.w $0000,$0000

;##############################################
loc_09806a:
	move.b (4,a6),d0
	move.w loc_098076(pc,d0.w),d1
	jmp loc_098076(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098076:
	dc.w loc_09807e-loc_098076
	dc.w loc_09811e-loc_098076
	dc.w loc_098166-loc_098076
	dc.w loc_098166-loc_098076

;==============================================
loc_09807e:
	addq.b #2,(4,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.b #1,($30,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.w d0,($c,a6)
	move.b d0,($e,a6)
	move.b d0,($b,a6)
	move.w d0,($26,a6)
	move.w #$ffd8,($10,a6)
	move.w #$60,($14,a6)
	move.b #$f,($3a,a6)
	lea.l ($40,a6),a0
	move.l a0,($1c,a6)
	lea.l ($50,a6),a1
	move.l a1,($44,a6)
	move.w #$a,($50,a6)
	move.w #$b,($52,a6)
	move.w #$b,($54,a6)
	move.w #$1f,($56,a6)
	lea.l loc_098172(pc),a0
	move.l a0,($58,a6)
	lea.l ($5c,a6),a4
	moveq #0,d0
	move.w (-$4862,a5),d0
	bsr.b loc_098102
	move.w (-$4860,a5),d0
	bsr.b loc_098102
	move.w (-$485e,a5),d0
 
loc_098102:
	jsr Hex_to_Decimal
	move.w (-$5d28,a5),d0
	moveq #3,d2

loc_09810e:
	move.w d0,d1
	andi.w #$f,d1
	move.w d1,(a4)+
	ror.w #4,d0
	dbra d2,loc_09810e
	rts

;==============================================
loc_09811e:
	move.b (5,a6),d0
	move.w loc_098130(pc,d0.w),d1
	jsr loc_098130(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098130:
	dc.w loc_098136-loc_098130
	dc.w loc_098146-loc_098130
	dc.w loc_098158-loc_098130

;----------------------------------------------
loc_098136:
	addq.w #4,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_098144
	addq.b #2,(5,a6)

loc_098144:
	rts

;----------------------------------------------
loc_098146:
	tst.b ($10e,a5)
	bne.b loc_098156
	addq.b #2,(5,a6)
	move.b #7,($3a,a6)

loc_098156:
	rts

;----------------------------------------------
loc_098158:
	subq.w #8,($10,a6)
	subq.b #1,($3a,a6)
	bmi.w loc_09816c
	rts

;==============================================
loc_098166:
	jmp loc_01c2de

;----------------------------------------------
loc_09816c:
	addq.b #2,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098172:
	dc.w $0000,$0000,$0008,$0000
	dc.w $0010,$0000,$0018,$0000
	dc.w $0000,$0008,$0008,$0008
	dc.w $0010,$0008,$0018,$0008
	dc.w $0000,$0010,$0008,$0010
	dc.w $0010,$0010,$0018,$0010

;##############################################
loc_0981a2:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_0981b8(pc,d0.w),d1
	jsr loc_0981b8(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0981b8:
	dc.w loc_0981c0-loc_0981b8
	dc.w loc_098218-loc_0981b8
	dc.w loc_09838c-loc_0981b8
	dc.w loc_09838c-loc_0981b8

;==============================================
loc_0981c0:
	addq.b #2,(4,a6)
	move.b #$52,($2a0,a4)
	move.b #6,(9,a6)
	move.b ($101,a4),($101,a6)
	move.w ($c,a4),($c,a6)
	subq.b #1,($c,a6)
	addq.b #3,($d,a6)
	move.l ($18,a4),($18,a6)
	move.b #$60,($18,a6)
	move.b #8,($e,a6)
	move.b ($f,a4),($f,a6)
	move.w ($26,a4),($26,a6)
	move.w #$6000,($1a,a6)
	movea.l #loc_2f4284,a0
	move.w #$50,d0
	jmp loc_01b6e0

;==============================================
loc_098218:
	move.b (5,a6),d0
	move.w loc_09822a(pc,d0.w),d1
	jsr loc_09822a(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09822a:
	dc.w loc_098232-loc_09822a
	dc.w loc_098256-loc_09822a
	dc.w loc_09829e-loc_09822a
	dc.w loc_098360-loc_09822a

;----------------------------------------------
loc_098232:
	addq.b #2,(5,a6)
	move.w #$220,($10,a6)
	move.w #$100,($14,a6)
	tst.b ($101,a6)
	beq.b loc_09824e
	move.w #$2e0,($10,a6)

loc_09824e:
	move.b #3,(3,a6)
	rts

;----------------------------------------------
loc_098256:
	addq.b #2,(5,a6)
	move.l #$8000,($40,a6)
	move.l #$ffffe000,($48,a6)
	move.l #$fffb4000,($44,a6)
	move.l #$3000,($4c,a6)
	tst.b ($101,a6)
	beq.b loc_098290
	move.l #$ffff8000,($40,a6)
	move.l #$2000,($48,a6)

loc_098290:
	move.b #$7f,($3a,a6)
	move.b #$22,($3b,a6)
	rts

;----------------------------------------------
loc_09829e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	subq.b #1,($3b,a6)
	bpl.w loc_09835e
	move.b #0,($3b,a6)
	move.b #$e0,($18,a6)
	subq.b #1,($3a,a6)
	bpl.w loc_09835e
	addq.b #2,(5,a6)
	move.b #$70,($3a,a6)
	move.w #$340,($10,a6)
	move.w #$90,($14,a6)
	move.l #0,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.l #0,($44,a6)
	move.l #$c00,($4c,a6)
	tst.b ($101,a6)
	bne.w loc_09833a
	eori.b #1,($b,a6)
	move.w #$170,($10,a6)
	move.w #$90,($14,a6)
	move.l #0,($40,a6)
	move.l #$4000,($48,a6)

loc_09833a:
	move.w ($c,a4),($c,a6)
	subq.b #1,($c,a6)
	addq.b #2,($d,a6)
	move.b #$60,($18,a6)
	movea.l #loc_2f4284,a0
	move.w #$67,d0
	jmp loc_01b6e0

loc_09835e:
	rts

;----------------------------------------------
loc_098360:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_09838a
	addq.b #2,(4,a6)

loc_09838a:
	rts

;==============================================
loc_09838c:
	jmp loc_01c2de

;##############################################
loc_098392:
	move.b (4,a6),d0
	move.w loc_09839e(pc,d0.w),d1
	jmp loc_09839e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09839e:
	dc.w loc_0983a6-loc_09839e
	dc.w loc_098502-loc_09839e
	dc.w loc_09858e-loc_09839e
	dc.w loc_09858e-loc_09839e

;==============================================
loc_0983a6:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($9,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.b #8,($e,a6)
	move.b d0,($f,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($26,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_0983ec(pc,d0.w),d1
	jsr loc_0983ec(pc,d1.w)
	bra.w loc_098798

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0983ec:
	dc.w loc_0983f8-loc_0983ec
	dc.w loc_0983f8-loc_0983ec
	dc.w loc_0983f8-loc_0983ec
	dc.w loc_09847c-loc_0983ec
	dc.w loc_09847c-loc_0983ec
	dc.w loc_09847c-loc_0983ec

;----------------------------------------------
loc_0983f8:
	move.b (3,a6),d0
	add.w d0,d0
	move.w d0,d1
	add.b ($3c,a6),d0
	lsl.w #3,d0
	move.w loc_098440(pc,d0.w),($42,a6)
	move.w loc_098440+2(pc,d0.w),($4a,a6)
	move.w loc_098440+4(pc,d0.w),($40,a6)
	move.w loc_098440+6(pc,d0.w),($48,a6)
	move.w ($42,a6),($10,a6)
	add.w d1,d1
	move.w loc_098470(pc,d1.w),($44,a6)
	move.w loc_098470+2(pc,d1.w),($4c,a6)
	clr.w ($46,a6)
	move.l ($44,a6),($14,a6)
	bra.w loc_098594

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098440:
	dc.w $ffff,$01a7,$5e38,$f439
	dc.w $0401,$0259,$a1c8,$0bc7
	dc.w $0080,$01b8,$4555,$f756
	dc.w $0380,$0248,$baab,$08aa
	dc.w $0100,$01c0,$2aaa,$faab
	dc.w $0300,$0240,$d556,$0555

loc_098470:
	dc.w $0000,$ff40
	dc.w $0000,$ff80
	dc.w $0080,$0000

;----------------------------------------------
loc_09847c:
	move.b (3,a6),d0
	subq.b #3,d0
	add.w d0,d0
	move.w d0,d1
	add.b ($3c,a6),d0
	lsl.w #3,d0
	move.w loc_0984c6(pc,d0.w),($46,a6)
	move.w loc_0984c6+2(pc,d0.w),($4e,a6)
	move.w loc_0984c6+4(pc,d0.w),($44,a6)
	move.w loc_0984c6+6(pc,d0.w),($4c,a6)
	move.w ($46,a6),($14,a6)
	add.w d1,d1
	move.w loc_0984f6(pc,d1.w),($40,a6)
	move.w loc_0984f6+2(pc,d1.w),($48,a6)
	clr.w ($42,a6)
	move.l ($40,a6),($10,a6)
	bra.w loc_098594

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0984c6:
	dc.w $0088,$00e8,$0000,$00cd
	dc.w $0078,$0018,$0000,$ff34
	dc.w $0080,$00d8,$0000,$00ab
	dc.w $0080,$0028,$0000,$ff56
	dc.w $0080,$00d0,$0000,$0097
	dc.w $0080,$0030,$0000,$ff6a

loc_0984f6:
	dc.w $0000,$ff40
	dc.w $0000,$ff80
	dc.w $00c0,$0000

;==============================================
loc_098502:
	move.b (3,a6),d0
	add.w d0,d0
	move.w loc_098518(pc,d0.w),d1
	jsr loc_098518(pc,d1.w)
	bsr.w loc_09860a
	bra.w loc_098798

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098518:
	dc.w loc_098524-loc_098518
	dc.w loc_098524-loc_098518
	dc.w loc_098524-loc_098518
	dc.w loc_098558-loc_098518
	dc.w loc_098558-loc_098518
	dc.w loc_098558-loc_098518

;----------------------------------------------
loc_098524:
	move.b (5,a6),d0
	move.w loc_098530(pc,d0.w),d1
	jmp loc_098530(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098530:
	dc.w loc_098534-loc_098530
	dc.w loc_098556-loc_098530

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_098534:
	bsr.w loc_0a01a8
	beq.b loc_098556
	addq.b #2,(5,a6)
	move.w ($4a,a6),($10,a6)
	clr.w ($12,a6)
	move.b (3,a6),d0
	add.b d0,d0
	add.b ($3c,a6),d0
	bset.b d0,($17,a5)

loc_098556:
	rts

;----------------------------------------------
loc_098558:
	move.b (5,a6),d0
	move.w loc_098564(pc,d0.w),d1
	jmp loc_098564(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098564:
	dc.w loc_098568-loc_098564
	dc.w loc_09858c-loc_098564

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_098568:
	bsr.w loc_0a01d6
	beq.b loc_09858c
	addq.b #2,(5,a6)
	move.w ($4e,a6),($14,a6)
	clr.w ($16,a6)
	move.b (3,a6),d0
	subq.b #3,d0
	add.b d0,d0
	add.b ($3c,a6),d0
	bset.b d0,($17,a5)

loc_09858c:
	rts

;==============================================
loc_09858e:
	jmp loc_01c2de

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_098594:
	moveq #0,d0
	move.b (3,a6),d0
	add.b d0,d0
	move.w loc_0985a4(pc,d0.w),d1
	jmp loc_0985a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0985a4:
	dc.w loc_0985b0-loc_0985a4
	dc.w loc_0985b6-loc_0985a4
	dc.w loc_0985cc-loc_0985a4
	dc.w loc_0985dc-loc_0985a4
	dc.w loc_0985e2-loc_0985a4
	dc.w loc_0985f8-loc_0985a4

;----------------------------------------------
loc_0985b0:
	moveq #0,d1
	bra.w loc_098662

;----------------------------------------------
loc_0985b6:
	moveq #0,d0
	tst.b (Region,a5)
	beq.b loc_0985c0
	addq.w #1,d0

loc_0985c0:
	moveq #0,d1
	move.b ($dc,a5),d1
	lsl.w #3,d1
	bra.w loc_09877a

;----------------------------------------------
loc_0985cc:
	move.b ($3c,a6),d0
	eori.b #1,d0
	move.b d0,($b,a6)
	bra.w loc_098696

;----------------------------------------------
loc_0985dc:
	moveq #0,d1
	bra.w loc_098712

;----------------------------------------------
loc_0985e2:
	moveq #4,d0
	tst.b (Region,a5)
	beq.b loc_0985ec
	addq.w #1,d0

loc_0985ec:
	moveq #0,d1
	move.b ($dc,a5),d1
	lsl.w #3,d1
	bra.w loc_09877a

;----------------------------------------------
loc_0985f8:
	move.b ($3c,a6),d0
	add.b d0,d0
	eori.b #2,d0
	move.b d0,($b,a6)
	bra.w loc_098744

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09860a:
	moveq #0,d0
	move.b (3,a6),d0
	add.b d0,d0
	move.w loc_09861a(pc,d0.w),d1
	jmp loc_09861a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09861a:
	dc.w loc_098626-loc_09861a
	dc.w loc_09866c-loc_09861a
	dc.w loc_098696-loc_09861a
	dc.w loc_0986d6-loc_09861a
	dc.w loc_09871a-loc_09861a
	dc.w loc_098744-loc_09861a

;----------------------------------------------
loc_098626:
	move.w ($34,a6),d0
	move.w ($4c,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($44,a6)

loc_098636:
	tst.w ($44,a6)
	bpl.b loc_098642
	add.w d0,($44,a6)
	bra.b loc_098636

loc_098642:
	cmp.w ($44,a6),d0
	bgt.b loc_09864e
	sub.w d0,($44,a6)
	bra.b loc_098642

loc_09864e:
	move.w ($44,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($14,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1

loc_098662:
	moveq #2,d0
	add.b (Dip_SFAlpha,a5),d0
	bra.w loc_09877a

;----------------------------------------------
loc_09866c:
	move.w ($34,a6),d0
	move.w ($4c,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($14,a6)

loc_09867c:
	tst.w ($14,a6)
	bpl.b loc_098688
	add.w d0,($14,a6)
	bra.b loc_09867c

loc_098688:
	cmp.w ($14,a6),d0
	bhi.b loc_098694
	sub.w d0,($14,a6)
	bra.b loc_098688

loc_098694:
	rts

;----------------------------------------------
loc_098696:
	moveq #8,d0
	moveq #0,d1
	tst.b ($3c,a6)
	bne.b loc_0986ae
	move.w ($10,a6),d2
	sub.w ($290,a5),d2
	ble.w loc_09877a
	bra.b loc_0986be

loc_0986ae:
	move.w ($290,a5),d2
	addi.w #$180,d2
	sub.w ($10,a6),d2
	ble.w loc_09877a

loc_0986be:
	moveq #$28,d1
	cmpi.w #$180,d2
	bhi.w loc_09877a
	subq.w #1,d2
	lsr.w #3,d2
	move.w d2,d1
	andi.w #$38,d1
	bra.w loc_09877a

;----------------------------------------------
loc_0986d6:
	move.w ($34,a6),d0
	move.w ($48,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($40,a6)

loc_0986e6:
	tst.w ($40,a6)
	bpl.b loc_0986f2
	add.w d0,($40,a6)
	bra.b loc_0986e6

loc_0986f2:
	cmp.w ($40,a6),d0
	bgt.b loc_0986fe
	sub.w d0,($40,a6)
	bra.b loc_0986f2

loc_0986fe:
	move.w ($40,a6),d1
	move.w d1,d0
	andi.w #$f,d0
	move.w d0,($10,a6)
	andi.w #$7f0,d1
	lsr.w #1,d1

loc_098712:
	moveq #6,d0
	add.b (Dip_SFAlpha,a5),d0
	bra.b loc_09877a

;----------------------------------------------
loc_09871a:
	move.w ($34,a6),d0
	move.w ($48,a6),d1
	ext.l d1
	asl.l #8,d1
	add.l d1,($10,a6)

loc_09872a:
	tst.w ($10,a6)
	bpl.b loc_098736
	add.w d0,($10,a6)
	bra.b loc_09872a

loc_098736:
	cmp.w ($10,a6),d0
	bhi.b loc_098742
	sub.w d0,($10,a6)
	bra.b loc_098736

loc_098742:
	rts

;----------------------------------------------
loc_098744:
	moveq #9,d0
	moveq #0,d1
	tst.b ($3c,a6)
	beq.b loc_09875a
	move.w ($14,a6),d2
	sub.w ($294,a5),d2
	ble.b loc_09877a
	bra.b loc_098768

loc_09875a:
	move.w ($294,a5),d2
	addi.w #$100,d2
	sub.w ($14,a6),d2
	ble.b loc_09877a

loc_098768:
	moveq #$18,d1
	cmpi.w #$100,d2
	bhi.b loc_09877a
	subq.w #1,d2
	lsr.w #3,d2
	move.w d2,d1
	andi.w #$18,d1

loc_09877a:
	add.w d0,d0
	lea.l loc_0987aa(pc),a0
	add.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jmp loc_01b6ee

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_09878e:
	lea.l loc_0987aa(pc),a0
	jmp loc_01b6e0

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_098798:
	tst.b ($a,a5)
	bne.b loc_0987a4
	jmp loc_01b4d0

loc_0987a4:
	clr.b (1,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0987aa:
	dc.w loc_0987d2-loc_0987aa
	dc.w loc_0988c2-loc_0987aa
	dc.w loc_0989b2-loc_0987aa
	dc.w loc_098a9a-loc_0987aa

	dc.w loc_098b8a-loc_0987aa
	dc.w loc_098c7a-loc_0987aa
	dc.w loc_098d6a-loc_0987aa
	dc.w loc_098e52-loc_0987aa

	dc.w loc_098f42-loc_0987aa
	dc.w loc_098f72-loc_0987aa
	dc.w loc_098f92-loc_0987aa
	dc.w loc_098f9a-loc_0987aa

	dc.w loc_098fb2-loc_0987aa
	dc.w loc_098fca-loc_0987aa
	dc.w loc_0990ba-loc_0987aa
	dc.w loc_0991aa-loc_0987aa

	dc.w loc_099382-loc_0987aa
	dc.w loc_09955a-loc_0987aa
	dc.w loc_099732-loc_0987aa
	dc.w $0000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0987d2:
	dc.w $0800,$0020
	dc.l loc_09990a
	dc.w $0800,$0020
	dc.l loc_099926
	dc.w $0800,$0030
	dc.l loc_099942
	dc.w $0800,$0030
	dc.l loc_09995a
	dc.w $0800,$0040
	dc.l loc_099972
	dc.w $0800,$0030
	dc.l loc_099988
	dc.w $0800,$0030
	dc.l loc_0999a0
	dc.w $0800,$0020
	dc.l loc_0999b8
	dc.w $0800,$0040
	dc.l loc_0999d4
	dc.w $0800,$0030
	dc.l loc_0999ea
	dc.w $0800,$0030
	dc.l loc_099a02
	dc.w $0800,$0030
	dc.l loc_099a1a
	dc.w $0800,$0020
	dc.l loc_099a32
	dc.w $0800,$0040
	dc.l loc_099a4e
	dc.w $0800,$0040
	dc.l loc_099a64
	dc.w $0800,$0040
	dc.l loc_099a7a
	dc.w $0800,$0040
	dc.l loc_099a90
	dc.w $0800,$0020
	dc.l loc_099aa6
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0020
	dc.l loc_099aa6
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_099ac2
	dc.w $0800,$0030
	dc.l loc_099ad8
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_099af0
	dc.w $0800,$0040
	dc.l loc_099b06
	dc.w $0800,$0040
	dc.l loc_099b1c
	dc.w $0800,$0030
	dc.l loc_099b32
	dc.w $0800,$0040
	dc.l loc_099b4a
	dc.w $0840,$0030
	dc.l loc_099b60

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0988c2:
	dc.w $0800,$0020
	dc.l loc_09990a
	dc.w $0800,$0020
	dc.l loc_099926
	dc.w $0800,$0030
	dc.l loc_099b78
	dc.w $0800,$0040
	dc.l loc_099b90
	dc.w $0800,$0040
	dc.l loc_099972
	dc.w $0800,$0030
	dc.l loc_099988
	dc.w $0800,$0030
	dc.l loc_0999a0
	dc.w $0800,$0020
	dc.l loc_0999b8
	dc.w $0800,$0040
	dc.l loc_0999d4
	dc.w $0800,$0030
	dc.l loc_0999ea
	dc.w $0800,$0040
	dc.l loc_099ac2
	dc.w $0800,$0030
	dc.l loc_099a1a
	dc.w $0800,$0020
	dc.l loc_099a32
	dc.w $0800,$0040
	dc.l loc_099a4e
	dc.w $0800,$0040
	dc.l loc_099a64
	dc.w $0800,$0040
	dc.l loc_099a7a
	dc.w $0800,$0040
	dc.l loc_099a90
	dc.w $0800,$0020
	dc.l loc_099aa6
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0020
	dc.l loc_099aa6
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_099b4a
	dc.w $0800,$0030
	dc.l loc_099ad8
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_099af0
	dc.w $0800,$0040
	dc.l loc_099b06
	dc.w $0800,$0040
	dc.l loc_099b1c
	dc.w $0800,$0030
	dc.l loc_099b32
	dc.w $0800,$0030
	dc.l loc_099a02
	dc.w $0840,$0030
	dc.l loc_099b60

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0989b2:
	dc.w $0800,$01d0
	dc.l loc_099ba6
	dc.w $0800,$01d0
	dc.l loc_099bee
	dc.w $0800,$01d0
	dc.l loc_099c36
	dc.w $0800,$01d0
	dc.l loc_099c7e
	dc.w $0800,$01d0
	dc.l loc_099cc6
	dc.w $0800,$01d0
	dc.l loc_099d0e
	dc.w $0800,$01d0
	dc.l loc_099d56
	dc.w $0800,$01d0
	dc.l loc_099d9e
	dc.w $0800,$01d0
	dc.l loc_099de6
	dc.w $0800,$01d0
	dc.l loc_099e2e
	dc.w $0800,$01d0
	dc.l loc_099e76
	dc.w $0800,$01d0
	dc.l loc_099ebe
	dc.w $0800,$01d0
	dc.l loc_099f06
	dc.w $0800,$01d0
	dc.l loc_099f4e
	dc.w $0800,$01d0
	dc.l loc_099f96
	dc.w $0800,$01d0
	dc.l loc_099fde
	dc.w $0800,$01d0
	dc.l loc_09a026
	dc.w $0800,$01d0
	dc.l loc_09a06e
	dc.w $0800,$01d0
	dc.l loc_09a0b6
	dc.w $0800,$01d0
	dc.l loc_09a0fe
	dc.w $0800,$01d0
	dc.l loc_09a146
	dc.w $0800,$01d0
	dc.l loc_09a18e
	dc.w $0800,$01d0
	dc.l loc_09a1d6
	dc.w $0800,$01d0
	dc.l loc_09a21e
	dc.w $0800,$01d0
	dc.l loc_09a266
	dc.w $0800,$01d0
	dc.l loc_09a2ae
	dc.w $0800,$01d0
	dc.l loc_09a2f6
	dc.w $0800,$01d0
	dc.l loc_09a33e
	dc.w $0840,$01d0
	dc.l loc_09a386

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098a9a:
	dc.w $0800,$01e0
	dc.l loc_099ba6
	dc.w $0800,$01e0
	dc.l loc_09a3ce
	dc.w $0800,$01e0
	dc.l loc_09a416
	dc.w $0800,$01e0
	dc.l loc_09a45e
	dc.w $0800,$01e0
	dc.l loc_09a4a6
	dc.w $0800,$01e0
	dc.l loc_09a4ee
	dc.w $0800,$01e0
	dc.l loc_09a536
	dc.w $0800,$01e0
	dc.l loc_09a57e
	dc.w $0800,$01e0
	dc.l loc_09a5c6
	dc.w $0800,$01e0
	dc.l loc_09a60e
	dc.w $0800,$01e0
	dc.l loc_09a656
	dc.w $0800,$01e0
	dc.l loc_09a69e
	dc.w $0800,$01e0
	dc.l loc_09a6e6
	dc.w $0800,$01e0
	dc.l loc_09a72e
	dc.w $0800,$01e0
	dc.l loc_09a776
	dc.w $0800,$01e0
	dc.l loc_09a7be
	dc.w $0800,$01e0
	dc.l loc_09a806
	dc.w $0800,$01e0
	dc.l loc_09a84e
	dc.w $0800,$01e0
	dc.l loc_09a896
	dc.w $0800,$01e0
	dc.l loc_09a8de
	dc.w $0800,$01e0
	dc.l loc_09a926
	dc.w $0800,$01e0
	dc.l loc_09a96e
	dc.w $0800,$01e0
	dc.l loc_09a9b6
	dc.w $0800,$01e0
	dc.l loc_09a9fe
	dc.w $0800,$01e0
	dc.l loc_09aa46
	dc.w $0800,$01e0
	dc.l loc_09a266
	dc.w $0800,$01e0
	dc.l loc_09a2ae
	dc.w $0800,$01e0
	dc.l loc_09a2f6
	dc.w $0800,$01e0
	dc.l loc_09a33e
	dc.w $0840,$01e0
	dc.l loc_09a386

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098b8a:
	dc.w $0800,$0040
	dc.l loc_09aa8e
	dc.w $0800,$0040
	dc.l loc_09ab04
	dc.w $0800,$0058
	dc.l loc_09ab7a
	dc.w $0800,$0050
	dc.l loc_09abf8
	dc.w $0800,$006c
	dc.l loc_09ac6e
	dc.w $0800,$0050
	dc.l loc_09ace4
	dc.w $0800,$0068
	dc.l loc_09ad5a
	dc.w $0800,$0040
	dc.l loc_09add0
	dc.w $0800,$005c
	dc.l loc_09ae46
	dc.w $0800,$0050
	dc.l loc_09aec4
	dc.w $0800,$0050
	dc.l loc_09af3a
	dc.w $0800,$0064
	dc.l loc_09afb0
	dc.w $0800,$0040
	dc.l loc_09b01e
	dc.w $0800,$0074
	dc.l loc_09b094
	dc.w $0800,$007c
	dc.l loc_09b112
	dc.w $0800,$007c
	dc.l loc_09b190
	dc.w $0800,$007c
	dc.l loc_09b20e
	dc.w $0800,$0040
	dc.l loc_09b28c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_09b28c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0074
	dc.l loc_09b302
	dc.w $0800,$0060
	dc.l loc_09b380
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$007c
	dc.l loc_09b3ee
	dc.w $0800,$0070
	dc.l loc_09b46c
	dc.w $0800,$005c
	dc.l loc_09b4e2
	dc.w $0800,$0054
	dc.l loc_09b560
	dc.w $0800,$0074
	dc.l loc_09b5d6
	dc.w $0840,$0058
	dc.l loc_09b654

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098c7a:
	dc.w $0800,$0040
	dc.l loc_09aa8e
	dc.w $0800,$0040
	dc.l loc_09ab04
	dc.w $0800,$0064
	dc.l loc_09b6d2
	dc.w $0800,$0078
	dc.l loc_09b740
	dc.w $0800,$006c
	dc.l loc_09ac6e
	dc.w $0800,$0050
	dc.l loc_09ace4
	dc.w $0800,$0068
	dc.l loc_09ad5a
	dc.w $0800,$0040
	dc.l loc_09add0
	dc.w $0800,$005c
	dc.l loc_09ae46
	dc.w $0800,$0050
	dc.l loc_09aec4
	dc.w $0800,$0074
	dc.l loc_09b302
	dc.w $0800,$0064
	dc.l loc_09afb0
	dc.w $0800,$0040
	dc.l loc_09b01e
	dc.w $0800,$0074
	dc.l loc_09b094
	dc.w $0800,$007c
	dc.l loc_09b112
	dc.w $0800,$007c
	dc.l loc_09b190
	dc.w $0800,$007c
	dc.l loc_09b20e
	dc.w $0800,$0040
	dc.l loc_09b28c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_09b28c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0074
	dc.l loc_09b5d6
	dc.w $0800,$0060
	dc.l loc_09b380
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$007c
	dc.l loc_09b3ee
	dc.w $0800,$0070
	dc.l loc_09b46c
	dc.w $0800,$005c
	dc.l loc_09b4e2
	dc.w $0800,$0054
	dc.l loc_09b560
	dc.w $0800,$0050
	dc.l loc_09af3a
	dc.w $0840,$0058
	dc.l loc_09b654

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098d6a:
	dc.w $0800,$01d0
	dc.l loc_09b7be
	dc.w $0800,$01d0
	dc.l loc_09b814
	dc.w $0800,$01d0
	dc.l loc_09b86a
	dc.w $0800,$01d0
	dc.l loc_09b8c0
	dc.w $0800,$01d0
	dc.l loc_09b916
	dc.w $0800,$01d0
	dc.l loc_09b96c
	dc.w $0800,$01d0
	dc.l loc_09b9c2
	dc.w $0800,$01d0
	dc.l loc_09ba18
	dc.w $0800,$01d0
	dc.l loc_09ba6e
	dc.w $0800,$01d0
	dc.l loc_09babc
	dc.w $0800,$01d0
	dc.l loc_09bb0a
	dc.w $0800,$01d0
	dc.l loc_09bb58
	dc.w $0800,$01d0
	dc.l loc_09bba6
	dc.w $0800,$01d0
	dc.l loc_09bbf4
	dc.w $0800,$01d0
	dc.l loc_09bc4a
	dc.w $0800,$01d0
	dc.l loc_09bca0
	dc.w $0800,$01d0
	dc.l loc_09bcf6
	dc.w $0800,$01d0
	dc.l loc_09bd4c
	dc.w $0800,$01d0
	dc.l loc_09bda2
	dc.w $0800,$01d0
	dc.l loc_09bdf8
	dc.w $0800,$01d0
	dc.l loc_09be4e
	dc.w $0800,$01d0
	dc.l loc_09bea4
	dc.w $0800,$01d0
	dc.l loc_09befa
	dc.w $0800,$01d0
	dc.l loc_09bf50
	dc.w $0800,$01d0
	dc.l loc_09bfa6
	dc.w $0800,$01d0
	dc.l loc_09bff4
	dc.w $0800,$01d0
	dc.l loc_09c042
	dc.w $0800,$01d0
	dc.l loc_09c090
	dc.w $0840,$01d0
	dc.l loc_09c0de

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098e52:
	dc.w $0800,$01e0
	dc.l loc_09c12c
	dc.w $0800,$01e0
	dc.l loc_09c182
	dc.w $0800,$01e0
	dc.l loc_09c1e0
	dc.w $0800,$01e0
	dc.l loc_09c23e
	dc.w $0800,$01e0
	dc.l loc_09c29c
	dc.w $0800,$01e0
	dc.l loc_09c2fa
	dc.w $0800,$01e0
	dc.l loc_09c350
	dc.w $0800,$01e0
	dc.l loc_09c3a6
	dc.w $0800,$01e0
	dc.l loc_09c3fc
	dc.w $0800,$01e0
	dc.l loc_09c44a
	dc.w $0800,$01e0
	dc.l loc_09c498
	dc.w $0800,$01e0
	dc.l loc_09c4e6
	dc.w $0800,$01e0
	dc.l loc_09c53c
	dc.w $0800,$01e0
	dc.l loc_09c592
	dc.w $0800,$01e0
	dc.l loc_09c5e8
	dc.w $0800,$01e0
	dc.l loc_09c646
	dc.w $0800,$01e0
	dc.l loc_09c6a4
	dc.w $0800,$01e0
	dc.l loc_09c702
	dc.w $0800,$01e0
	dc.l loc_09c760
	dc.w $0800,$01e0
	dc.l loc_09c7be
	dc.w $0800,$01e0
	dc.l loc_09c81c
	dc.w $0800,$01e0
	dc.l loc_09c87a
	dc.w $0800,$01e0
	dc.l loc_09c8d8
	dc.w $0800,$01e0
	dc.l loc_09c936
	dc.w $0800,$01e0
	dc.l loc_09c994
	dc.w $0800,$01e0
	dc.l loc_09c9ea
	dc.w $0800,$01e0
	dc.l loc_09ca40
	dc.w $0800,$01e0
	dc.l loc_09ca96
	dc.w $0800,$01e0
	dc.l loc_09caec
	dc.w $0840,$01e0
	dc.l loc_09cb42

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098f42:
	dc.w $0800,$0040
	dc.l loc_09cb98
	dc.w $0800,$0080
	dc.l loc_09cbb2
	dc.w $0800,$00c0
	dc.l loc_09cbdc
	dc.w $0800,$0100
	dc.l loc_09cc16
	dc.w $0800,$0140
	dc.l loc_09cc60
	dc.w $0840,$0180
	dc.l loc_09ccba

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098f72:
	dc.w $0800,$0010
	dc.l loc_09cd24
	dc.w $0800,$0020
	dc.l loc_09cd46
	dc.w $0800,$0030
	dc.l loc_09cd80
	dc.w $0840,$00e0
	dc.l loc_09cdd2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098f92:
	dc.w $ff40,$0000
	dc.l loc_09ce3c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098f9a:
	dc.w $0800,$0000
	dc.l loc_09ce82
	dc.w $0800,$0000
	dc.l loc_09d548
	dc.w $0840,$0000
	dc.l loc_09dc86

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098fb2:
	dc.w $0800,$0000
	dc.l loc_09e2ec
	dc.w $0800,$0000
	dc.l loc_09e9ca
	dc.w $0840,$0000
	dc.l loc_09f010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_098fca:
	dc.w $0800,$0040
	dc.l loc_09f68e
	dc.w $0800,$0040
	dc.l loc_09f6cc
	dc.w $0800,$0058
	dc.l loc_09f70a
	dc.w $0800,$0050
	dc.l loc_09f740
	dc.w $0800,$006c
	dc.l loc_09f776
	dc.w $0800,$0050
	dc.l loc_09f7a4
	dc.w $0800,$0068
	dc.l loc_09f7da
	dc.w $0800,$0040
	dc.l loc_09f808
	dc.w $0800,$005c
	dc.l loc_09f846
	dc.w $0800,$0050
	dc.l loc_09f87c
	dc.w $0800,$0050
	dc.l loc_09f8b2
	dc.w $0800,$0064
	dc.l loc_09f8e8
	dc.w $0800,$0040
	dc.l loc_09f916
	dc.w $0800,$0074
	dc.l loc_09f954
	dc.w $0800,$007c
	dc.l loc_09f982
	dc.w $0800,$007c
	dc.l loc_09f9b0
	dc.w $0800,$007c
	dc.l loc_09f9de
	dc.w $0800,$0040
	dc.l loc_09fa0c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_09fa0c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0074
	dc.l loc_09fa4a
	dc.w $0800,$0060
	dc.l loc_09fa78
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$007c
	dc.l loc_09faa6
	dc.w $0800,$0070
	dc.l loc_09fad4
	dc.w $0800,$005c
	dc.l loc_09fb02
	dc.w $0800,$0054
	dc.l loc_09fb38
	dc.w $0800,$0074
	dc.l loc_09fb6e
	dc.w $0840,$0058
	dc.l loc_09fb9c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0990ba:
	dc.w $0800,$0040
	dc.l loc_09f68e
	dc.w $0800,$0040
	dc.l loc_09f6cc
	dc.w $0800,$0064
	dc.l loc_09fbd2
	dc.w $0800,$0078
	dc.l loc_09fc00
	dc.w $0800,$006c
	dc.l loc_09f776
	dc.w $0800,$0050
	dc.l loc_09f7a4
	dc.w $0800,$0068
	dc.l loc_09f7da
	dc.w $0800,$0040
	dc.l loc_09f808
	dc.w $0800,$005c
	dc.l loc_09f846
	dc.w $0800,$0050
	dc.l loc_09f87c
	dc.w $0800,$0074
	dc.l loc_09fa4a
	dc.w $0800,$0064
	dc.l loc_09f8e8
	dc.w $0800,$0040
	dc.l loc_09f916
	dc.w $0800,$0074
	dc.l loc_09f954
	dc.w $0800,$007c
	dc.l loc_09f982
	dc.w $0800,$007c
	dc.l loc_09f9b0
	dc.w $0800,$007c
	dc.l loc_09f9de
	dc.w $0800,$0040
	dc.l loc_09fa0c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0040
	dc.l loc_09fa0c
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$0074
	dc.l loc_09fb6e
	dc.w $0800,$0060
	dc.l loc_09fa78
	dc.w $0800,$0020
	dc.l loc_0a000a
	dc.w $0800,$007c
	dc.l loc_09faa6
	dc.w $0800,$0070
	dc.l loc_09fad4
	dc.w $0800,$005c
	dc.l loc_09fb02
	dc.w $0800,$0054
	dc.l loc_09fb38
	dc.w $0800,$0050
	dc.l loc_09f8b2
	dc.w $0840,$0058
	dc.l loc_09fb9c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0991aa:
	dc.w $0800,$2000
	dc.l loc_09fc2e
	dc.w $0800,$2001
	dc.l loc_09fc3c
	dc.w $0800,$3002
	dc.l loc_09fc4a
	dc.w $0800,$3003
	dc.l loc_09fc58
	dc.w $0800,$3004
	dc.l loc_09fc66
	dc.w $0800,$3005
	dc.l loc_09fc74
	dc.w $0800,$3006
	dc.l loc_09fc82
	dc.w $0800,$2007
	dc.l loc_09fc90
	dc.w $0800,$3008
	dc.l loc_09fc9e
	dc.w $0800,$3009
	dc.l loc_09fcac
	dc.w $0800,$300a
	dc.l loc_09fcba
	dc.w $0800,$300b
	dc.l loc_09fcc8
	dc.w $0800,$200c
	dc.l loc_09fcd6
	dc.w $0800,$400d
	dc.l loc_09fce4
	dc.w $0800,$400e
	dc.l loc_09fcf2
	dc.w $0800,$400f
	dc.l loc_09fd00
	dc.w $0800,$4010
	dc.l loc_09fd0e
	dc.w $0800,$2011
	dc.l loc_09fd1c
	dc.w $0800,$3012
	dc.l loc_09fd38
	dc.w $0800,$4013
	dc.l loc_09fd46
	dc.w $0800,$4014
	dc.l loc_09fd54
	dc.w $0800,$3015
	dc.l loc_09fd62
	dc.w $0800,$3016
	dc.l loc_09fd70
	dc.w $0800,$4017
	dc.l loc_09fd7e
	dc.w $0800,$3018
	dc.l loc_09fd8c
	dc.w $0800,$1019
	dc.l loc_09fdb6
	dc.w $0800,$101a
	dc.l loc_09fdc4
	dc.w $0800,$201b
	dc.l loc_09fdd2
	dc.w $0800,$201c
	dc.l loc_09fde0
	dc.w $0800,$201d
	dc.l loc_09fdee
	dc.w $0800,$201e
	dc.l loc_09fdfc
	dc.w $0800,$201f
	dc.l loc_09fe0a
	dc.w $0800,$1020
	dc.l loc_09fe18
	dc.w $0800,$2021
	dc.l loc_09fe26
	dc.w $0800,$2022
	dc.l loc_09fe34
	dc.w $0800,$2023
	dc.l loc_09fe42
	dc.w $0800,$2024
	dc.l loc_09fe50
	dc.w $0800,$1025
	dc.l loc_09fe5e
	dc.w $0800,$2026
	dc.l loc_09fe6c
	dc.w $0800,$3027
	dc.l loc_09fe7a
	dc.w $0800,$3028
	dc.l loc_09fe88
	dc.w $0800,$3029
	dc.l loc_09fe96
	dc.w $0800,$102a
	dc.l loc_09fea4
	dc.w $0800,$202b
	dc.l loc_09fec0
	dc.w $0800,$302c
	dc.l loc_09fece
	dc.w $0800,$202d
	dc.l loc_09fedc
	dc.w $0800,$202e
	dc.l loc_09feea
	dc.w $0800,$202f
	dc.l loc_09fef8
	dc.w $0800,$2030
	dc.l loc_09ff06
	dc.w $0800,$2031
	dc.l loc_09ff14
	dc.w $0800,$e032
	dc.l loc_09ff3e
	dc.w $0800,$6033
	dc.l loc_09ff72
	dc.w $0800,$7034
	dc.l loc_09ff88
	dc.w $0800,$c035
	dc.l loc_09ff96
	dc.w $0800,$7036
	dc.l loc_09ffac
	dc.w $0800,$8037
	dc.l loc_09ffc2
	dc.w $0800,$8038
	dc.l loc_09ffd8
	dc.w $0800,$8039
	dc.l loc_09ffee
	dc.w $0840,$503a
	dc.l loc_09fffc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_099382:
	dc.w $0800,$2000
	dc.l loc_09fc2e
	dc.w $0800,$2001
	dc.l loc_09fc3c
	dc.w $0800,$3002
	dc.l loc_09fc4a
	dc.w $0800,$3003
	dc.l loc_09fc58
	dc.w $0800,$3004
	dc.l loc_09fc66
	dc.w $0800,$3005
	dc.l loc_09fc74
	dc.w $0800,$3006
	dc.l loc_09fc82
	dc.w $0800,$2007
	dc.l loc_09fc90
	dc.w $0800,$3008
	dc.l loc_09fc9e
	dc.w $0800,$3009
	dc.l loc_09fcac
	dc.w $0800,$300a
	dc.l loc_09fcba
	dc.w $0800,$300b
	dc.l loc_09fcc8
	dc.w $0800,$200c
	dc.l loc_09fcd6
	dc.w $0800,$400d
	dc.l loc_09fce4
	dc.w $0800,$400e
	dc.l loc_09fcf2
	dc.w $0800,$400f
	dc.l loc_09fd00
	dc.w $0800,$4010
	dc.l loc_09fd0e
	dc.w $0800,$2011
	dc.l loc_09fd1c
	dc.w $0800,$3012
	dc.l loc_09fd38
	dc.w $0800,$4013
	dc.l loc_09fd46
	dc.w $0800,$4014
	dc.l loc_09fd54
	dc.w $0800,$3015
	dc.l loc_09fd62
	dc.w $0800,$3016
	dc.l loc_09fd70
	dc.w $0800,$4017
	dc.l loc_09fd7e
	dc.w $0800,$3018
	dc.l loc_09fd8c
	dc.w $0800,$1019
	dc.l loc_09fdb6
	dc.w $0800,$101a
	dc.l loc_09fdc4
	dc.w $0800,$201b
	dc.l loc_09fdd2
	dc.w $0800,$201c
	dc.l loc_09fde0
	dc.w $0800,$201d
	dc.l loc_09fdee
	dc.w $0800,$201e
	dc.l loc_09fdfc
	dc.w $0800,$201f
	dc.l loc_09fe0a
	dc.w $0800,$1020
	dc.l loc_09fe18
	dc.w $0800,$2021
	dc.l loc_09fe26
	dc.w $0800,$2022
	dc.l loc_09fe34
	dc.w $0800,$2023
	dc.l loc_09fe42
	dc.w $0800,$2024
	dc.l loc_09fe50
	dc.w $0800,$1025
	dc.l loc_09fe5e
	dc.w $0800,$2026
	dc.l loc_09fe6c
	dc.w $0800,$3027
	dc.l loc_09fe7a
	dc.w $0800,$3028
	dc.l loc_09fe88
	dc.w $0800,$3029
	dc.l loc_09fe96
	dc.w $0800,$102a
	dc.l loc_09fea4
	dc.w $0800,$202b
	dc.l loc_09fec0
	dc.w $0800,$302c
	dc.l loc_09fece
	dc.w $0800,$202d
	dc.l loc_09fedc
	dc.w $0800,$202e
	dc.l loc_09feea
	dc.w $0800,$202f
	dc.l loc_09fef8
	dc.w $0800,$2030
	dc.l loc_09ff06
	dc.w $0800,$2031
	dc.l loc_09ff14
	dc.w $0800,$f032
	dc.l loc_09ff54
	dc.w $0800,$6033
	dc.l loc_09ff72
	dc.w $0800,$7034
	dc.l loc_09ff88
	dc.w $0800,$c035
	dc.l loc_09ff96
	dc.w $0800,$7036
	dc.l loc_09ffac
	dc.w $0800,$8037
	dc.l loc_09ffc2
	dc.w $0800,$8038
	dc.l loc_09ffd8
	dc.w $0800,$8039
	dc.l loc_09ffee
	dc.w $0840,$503a
	dc.l loc_09fffc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09955a:
	dc.w $0800,$2000
	dc.l loc_09fc2e
	dc.w $0800,$2001
	dc.l loc_09fc3c
	dc.w $0800,$3002
	dc.l loc_09fd9a
	dc.w $0800,$4003
	dc.l loc_09fda8
	dc.w $0800,$3004
	dc.l loc_09fc66
	dc.w $0800,$3005
	dc.l loc_09fc74
	dc.w $0800,$3006
	dc.l loc_09fc82
	dc.w $0800,$2007
	dc.l loc_09fc90
	dc.w $0800,$3008
	dc.l loc_09fc9e
	dc.w $0800,$3009
	dc.l loc_09fcac
	dc.w $0800,$400a
	dc.l loc_09fd2a
	dc.w $0800,$300b
	dc.l loc_09fcc8
	dc.w $0800,$200c
	dc.l loc_09fcd6
	dc.w $0800,$400d
	dc.l loc_09fce4
	dc.w $0800,$400e
	dc.l loc_09fcf2
	dc.w $0800,$400f
	dc.l loc_09fd00
	dc.w $0800,$4010
	dc.l loc_09fd0e
	dc.w $0800,$2011
	dc.l loc_09fd1c
	dc.w $0800,$3012
	dc.l loc_09fd38
	dc.w $0800,$4013
	dc.l loc_09fd46
	dc.w $0800,$4014
	dc.l loc_09fd54
	dc.w $0800,$3015
	dc.l loc_09fd62
	dc.w $0800,$3016
	dc.l loc_09fd70
	dc.w $0800,$3017
	dc.l loc_09fcba
	dc.w $0800,$3018
	dc.l loc_09fd8c
	dc.w $0800,$1019
	dc.l loc_09fdb6
	dc.w $0800,$101a
	dc.l loc_09fdc4
	dc.w $0800,$201b
	dc.l loc_09ff22
	dc.w $0800,$201c
	dc.l loc_09ff30
	dc.w $0800,$201d
	dc.l loc_09fdee
	dc.w $0800,$201e
	dc.l loc_09fdfc
	dc.w $0800,$201f
	dc.l loc_09fe0a
	dc.w $0800,$1020
	dc.l loc_09fe18
	dc.w $0800,$2021
	dc.l loc_09fe26
	dc.w $0800,$2022
	dc.l loc_09fe34
	dc.w $0800,$2023
	dc.l loc_09feb2
	dc.w $0800,$2024
	dc.l loc_09fe50
	dc.w $0800,$1025
	dc.l loc_09fe5e
	dc.w $0800,$2026
	dc.l loc_09fe6c
	dc.w $0800,$3027
	dc.l loc_09fe7a
	dc.w $0800,$3028
	dc.l loc_09fe88
	dc.w $0800,$3029
	dc.l loc_09fe96
	dc.w $0800,$102a
	dc.l loc_09fea4
	dc.w $0800,$202b
	dc.l loc_09fec0
	dc.w $0800,$302c
	dc.l loc_09fece
	dc.w $0800,$202d
	dc.l loc_09fedc
	dc.w $0800,$202e
	dc.l loc_09feea
	dc.w $0800,$202f
	dc.l loc_09fef8
	dc.w $0800,$2030
	dc.l loc_09fe42
	dc.w $0800,$2031
	dc.l loc_09ff14
	dc.w $0800,$e032
	dc.l loc_09ff3e
	dc.w $0800,$6033
	dc.l loc_09ff72
	dc.w $0800,$7034
	dc.l loc_09ff88
	dc.w $0800,$c035
	dc.l loc_09ff96
	dc.w $0800,$7036
	dc.l loc_09ffac
	dc.w $0800,$8037
	dc.l loc_09ffc2
	dc.w $0800,$8038
	dc.l loc_09ffd8
	dc.w $0800,$8039
	dc.l loc_09ffee
	dc.w $0840,$503a
	dc.l loc_09fffc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_099732:
	dc.w $0800,$2000
	dc.l loc_09fc2e
	dc.w $0800,$2001
	dc.l loc_09fc3c
	dc.w $0800,$3002
	dc.l loc_09fd9a
	dc.w $0800,$4003
	dc.l loc_09fda8
	dc.w $0800,$3004
	dc.l loc_09fc66
	dc.w $0800,$3005
	dc.l loc_09fc74
	dc.w $0800,$3006
	dc.l loc_09fc82
	dc.w $0800,$2007
	dc.l loc_09fc90
	dc.w $0800,$3008
	dc.l loc_09fc9e
	dc.w $0800,$3009
	dc.l loc_09fcac
	dc.w $0800,$400a
	dc.l loc_09fd2a
	dc.w $0800,$300b
	dc.l loc_09fcc8
	dc.w $0800,$200c
	dc.l loc_09fcd6
	dc.w $0800,$400d
	dc.l loc_09fce4
	dc.w $0800,$400e
	dc.l loc_09fcf2
	dc.w $0800,$400f
	dc.l loc_09fd00
	dc.w $0800,$4010
	dc.l loc_09fd0e
	dc.w $0800,$2011
	dc.l loc_09fd1c
	dc.w $0800,$3012
	dc.l loc_09fd38
	dc.w $0800,$4013
	dc.l loc_09fd46
	dc.w $0800,$4014
	dc.l loc_09fd54
	dc.w $0800,$3015
	dc.l loc_09fd62
	dc.w $0800,$3016
	dc.l loc_09fd70
	dc.w $0800,$3017
	dc.l loc_09fcba
	dc.w $0800,$3018
	dc.l loc_09fd8c
	dc.w $0800,$1019
	dc.l loc_09fdb6
	dc.w $0800,$101a
	dc.l loc_09fdc4
	dc.w $0800,$201b
	dc.l loc_09ff22
	dc.w $0800,$201c
	dc.l loc_09ff30
	dc.w $0800,$201d
	dc.l loc_09fdee
	dc.w $0800,$201e
	dc.l loc_09fdfc
	dc.w $0800,$201f
	dc.l loc_09fe0a
	dc.w $0800,$1020
	dc.l loc_09fe18
	dc.w $0800,$2021
	dc.l loc_09fe26
	dc.w $0800,$2022
	dc.l loc_09fe34
	dc.w $0800,$2023
	dc.l loc_09feb2
	dc.w $0800,$2024
	dc.l loc_09fe50
	dc.w $0800,$1025
	dc.l loc_09fe5e
	dc.w $0800,$2026
	dc.l loc_09fe6c
	dc.w $0800,$3027
	dc.l loc_09fe7a
	dc.w $0800,$3028
	dc.l loc_09fe88
	dc.w $0800,$3029
	dc.l loc_09fe96
	dc.w $0800,$102a
	dc.l loc_09fea4
	dc.w $0800,$202b
	dc.l loc_09fec0
	dc.w $0800,$302c
	dc.l loc_09fece
	dc.w $0800,$202d
	dc.l loc_09fedc
	dc.w $0800,$202e
	dc.l loc_09feea
	dc.w $0800,$202f
	dc.l loc_09fef8
	dc.w $0800,$2030
	dc.l loc_09fe42
	dc.w $0800,$2031
	dc.l loc_09ff14
	dc.w $0800,$f032
	dc.l loc_09ff54
	dc.w $0800,$6033
	dc.l loc_09ff72
	dc.w $0800,$7034
	dc.l loc_09ff88
	dc.w $0800,$c035
	dc.l loc_09ff96
	dc.w $0800,$7036
	dc.l loc_09ffac
	dc.w $0800,$8037
	dc.l loc_09ffc2
	dc.w $0800,$8038
	dc.l loc_09ffd8
	dc.w $0800,$8039
	dc.l loc_09ffee
	dc.w $0840,$503a
	dc.l loc_09fffc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09990a:
	dc.w $000a,$0010,$0007,$1001
	dc.l loc_0a000c
	dc.w $07a5,$07a5,$07a5,$07a5
	dc.w $07a5,$07a5,$07a5,$07a5

loc_099926:
	dc.w $000a,$0010,$0007,$1001
	dc.l loc_0a000c
	dc.w $07a6,$07a6,$07a6,$07a6
	dc.w $07a6,$07a6,$07a6,$07a6

loc_099942:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $0775,$0775
	dc.w $0775,$0775
	dc.w $0775,$0775

loc_09995a:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $076e,$076e,$076e
	dc.w $076e,$076e,$076e

loc_099972:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0760,$0760
	dc.w $0760,$0760
	dc.w $0760

loc_099988:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $076f,$076f,$076f
	dc.w $076f,$076f,$076f

loc_0999a0:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $0776,$0776,$0776
	dc.w $0776,$0776,$0776

loc_0999b8:
	dc.w $000a,$0010,$0007,$1001
	dc.l loc_0a000c
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7
	dc.w $07a7,$07a7

loc_0999d4:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0767,$0767,$0767
	dc.w $0767,$0767

loc_0999ea:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $079e,$079e,$079e
	dc.w $079e,$079e,$079e

loc_099a02:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $079f,$079f,$079f
	dc.w $079f,$079f,$079f

loc_099a1a:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $0778,$0778,$0778
	dc.w $0778,$0778,$0778

loc_099a32:
	dc.w $000a,$0010,$0007,$1001
	dc.l loc_0a000c
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8
	dc.w $07a8,$07a8

loc_099a4e:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0769,$0769,$0769
	dc.w $0769,$0769

loc_099a64:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0761,$0761,$0761
	dc.w $0761,$0761

loc_099a7a:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0762,$0762,$0762
	dc.w $0762,$0762

loc_099a90:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0763,$0763,$0763
	dc.w $0763,$0763

loc_099aa6:
	dc.w $000a,$0010,$0007,$1001
	dc.l loc_0a000c
	dc.w $07a9,$07a9,$07a9,$07a9
	dc.w $07a9,$07a9,$07a9,$07a9

loc_099ac2:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $072f,$072f,$072f
	dc.w $072f,$072f

loc_099ad8:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $077a,$077a,$077a
	dc.w $077a,$077a,$077a

loc_099af0:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $0764,$0764,$0764
	dc.w $0764,$0764

loc_099b06:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $076b,$076b,$076b
	dc.w $076b,$076b

loc_099b1c:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $076c,$076c,$076c
	dc.w $076c,$076c

loc_099b32:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $07b0,$07b0,$07b0
	dc.w $07b0,$07b0,$07b0

loc_099b4a:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $076d,$076d,$076d
	dc.w $076d,$076d

loc_099b60:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $07b1,$07b1,$07b1
	dc.w $07b1,$07b1,$07b1

loc_099b78:
	dc.w $000a,$0012,$0005,$2001
	dc.l loc_0a002c
	dc.w $073d,$073d,$073d
	dc.w $073d,$073d,$073d

loc_099b90:
	dc.w $000a,$0014,$0004,$3001
	dc.l loc_0a0044
	dc.w $072e,$072e,$072e
	dc.w $072e,$072e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_099ba6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $288c,$288d,$2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d,$2876,$288d
	dc.w $2877,$288d,$2878,$288d,$2879,$288d,$287a,$288d
	dc.w $287b,$288d,$287c,$288d,$287d,$288d

loc_099bee:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $288b,$288d,$288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d,$2875,$288d
	dc.w $2876,$288d,$2877,$288d,$2878,$288d,$2879,$288d
	dc.w $287a,$288d,$287b,$288d,$287c,$288d

loc_099c36:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $288a,$288d,$288b,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d,$2874,$288d
	dc.w $2875,$288d,$2876,$288d,$2877,$288d,$2878,$288d
	dc.w $2879,$288d,$287a,$288d,$287b,$288d

loc_099c7e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2889,$288d,$288a,$288d,$288b,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d,$2877,$288d
	dc.w $2878,$288d,$2879,$288d,$287a,$288d

loc_099cc6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2888,$288d,$2889,$288d,$288a,$288d,$288b,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d,$2876,$288d
	dc.w $2877,$288d,$2878,$288d,$2879,$288d

loc_099d0e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2887,$288d,$2888,$288d,$2889,$288d,$288a,$288d
	dc.w $288b,$288d,$288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d,$2875,$288d
	dc.w $2876,$288d,$2877,$288d,$2878,$288d

loc_099d56:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2886,$288d,$2887,$288d,$2888,$288d,$2889,$288d
	dc.w $288a,$288d,$288b,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d,$2874,$288d
	dc.w $2875,$288d,$2876,$288d,$2877,$288d

loc_099d9e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2885,$288d,$2886,$288d,$2887,$288d,$2888,$288d
	dc.w $2889,$288d,$288a,$288d,$288b,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d

loc_099de6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2884,$288d,$2885,$288d,$2886,$288d,$2887,$288d
	dc.w $2888,$288d,$2889,$288d,$288a,$288d,$288b,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d

loc_099e2e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2883,$288d,$2884,$288d,$2885,$288d,$2886,$288d
	dc.w $2887,$288d,$2888,$288d,$2889,$288d,$288a,$288d
	dc.w $288b,$288d,$288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d

loc_099e76:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2882,$288d,$2883,$288d,$2884,$288d,$2885,$288d
	dc.w $2886,$288d,$2887,$288d,$2888,$288d,$2889,$288d
	dc.w $288a,$288d,$288b,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d

loc_099ebe:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2881,$288d,$2882,$288d,$2883,$288d,$2884,$288d
	dc.w $2885,$288d,$2886,$288d,$2887,$288d,$2888,$288d
	dc.w $2889,$288d,$288a,$288d,$288b,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d

loc_099f06:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2880,$288d,$2881,$288d,$2882,$288d,$2883,$288d
	dc.w $2884,$288d,$2885,$288d,$2886,$288d,$2887,$288d
	dc.w $2888,$288d,$2889,$288d,$288a,$288d,$288b,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d

loc_099f4e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287f,$288d,$2880,$288d,$2881,$288d,$2882,$288d
	dc.w $2883,$288d,$2884,$288d,$2885,$288d,$2886,$288d
	dc.w $2887,$288d,$2888,$288d,$2889,$288d,$288a,$288d
	dc.w $288b,$288d,$288c,$288d,$2870,$288d

loc_099f96:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287e,$288d,$287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$2883,$288d,$2884,$288d,$2885,$288d
	dc.w $2886,$288d,$2887,$288d,$2888,$288d,$2889,$288d
	dc.w $288a,$288d,$288b,$288d,$288c,$288d

loc_099fde:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287d,$288d,$287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$2883,$288d,$2884,$288d
	dc.w $2885,$288d,$2886,$288d,$2887,$288d,$2888,$288d
	dc.w $2889,$288d,$288a,$288d,$288b,$288d

loc_09a026:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287c,$288d,$287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d,$2883,$288d
	dc.w $2884,$288d,$2885,$288d,$2886,$288d,$2887,$288d
	dc.w $2888,$288d,$2889,$288d,$288a,$288d

loc_09a06e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287b,$288d,$287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d,$2882,$288d
	dc.w $2883,$288d,$2884,$288d,$2885,$288d,$2886,$288d
	dc.w $2887,$288d,$2888,$288d,$2889,$288d

loc_09a0b6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287a,$288d,$287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$2883,$288d,$2884,$288d,$2885,$288d
	dc.w $2886,$288d,$2887,$288d,$2888,$288d

loc_09a0fe:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2879,$288d,$287a,$288d,$287b,$288d,$287c,$288d
	dc.w $287d,$288d,$287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$2883,$288d,$2884,$288d
	dc.w $2885,$288d,$2886,$288d,$2887,$288d

loc_09a146:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2878,$288d,$2879,$288d,$287a,$288d,$287b,$288d
	dc.w $287c,$288d,$287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d,$2883,$288d
	dc.w $2884,$288d,$2885,$288d,$2886,$288d

loc_09a18e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2877,$288d,$2878,$288d,$2879,$288d,$287a,$288d
	dc.w $287b,$288d,$287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d,$2882,$288d
	dc.w $2883,$288d,$2884,$288d,$2885,$288d

loc_09a1d6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2876,$288d,$2877,$288d,$2878,$288d,$2879,$288d
	dc.w $287a,$288d,$287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$2883,$288d,$2884,$288d

loc_09a21e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2875,$288d,$2876,$288d,$2877,$288d,$2878,$288d
	dc.w $2879,$288d,$287a,$288d,$287b,$288d,$287c,$288d
	dc.w $287d,$288d,$287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$2883,$288d

loc_09a266:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2874,$288d,$2875,$288d,$2876,$288d,$2877,$288d
	dc.w $2878,$288d,$2879,$288d,$287a,$288d,$287b,$288d
	dc.w $287c,$288d,$287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d

loc_09a2ae:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2873,$288d,$2874,$288d,$2875,$288d,$2876,$288d
	dc.w $2877,$288d,$2878,$288d,$2879,$288d,$287a,$288d
	dc.w $287b,$288d,$287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d

loc_09a2f6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2872,$288d,$2873,$288d,$2874,$288d,$2875,$288d
	dc.w $2876,$288d,$2877,$288d,$2878,$288d,$2879,$288d
	dc.w $287a,$288d,$287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d

loc_09a33e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2871,$288d,$2872,$288d,$2873,$288d,$2874,$288d
	dc.w $2875,$288d,$2876,$288d,$2877,$288d,$2878,$288d
	dc.w $2879,$288d,$287a,$288d,$287b,$288d,$287c,$288d
	dc.w $287d,$288d,$287e,$288d,$287f,$288d

loc_09a386:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2870,$288d,$2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d,$2877,$288d
	dc.w $2878,$288d,$2879,$288d,$287a,$288d,$287b,$288d
	dc.w $287c,$288d,$287d,$288d,$287e,$288d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09a3ce:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2897,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d
	dc.w $2877,$288d,$2878,$288d,$2879,$288d
	dc.w $287a,$288d,$287b,$288d,$287c,$288d

loc_09a416:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2896,$288d,$2897,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d
	dc.w $2876,$288d,$2877,$288d,$2878,$288d
	dc.w $2879,$288d,$287a,$288d,$287b,$288d

loc_09a45e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2895,$288d,$2896,$288d,$2897,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d
	dc.w $2875,$288d,$2876,$288d,$2877,$288d
	dc.w $2878,$288d,$2879,$288d,$287a,$288d

loc_09a4a6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2894,$288d,$2895,$288d,$2896,$288d
	dc.w $2897,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d
	dc.w $2877,$288d,$2878,$288d,$2879,$288d

loc_09a4ee:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2893,$288d,$2894,$288d,$2895,$288d
	dc.w $2896,$288d,$2897,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d
	dc.w $2876,$288d,$2877,$288d,$2878,$288d

loc_09a536:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2892,$288d,$2893,$288d,$2894,$288d
	dc.w $2895,$288d,$2896,$288d,$2897,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d
	dc.w $2875,$288d,$2876,$288d,$2877,$288d

loc_09a57e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2891,$288d,$2892,$288d,$2893,$288d
	dc.w $2894,$288d,$2895,$288d,$2896,$288d
	dc.w $2897,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d
	dc.w $2874,$288d,$2875,$288d,$2876,$288d

loc_09a5c6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2890,$288d,$2891,$288d,$2892,$288d
	dc.w $2893,$288d,$2894,$288d,$2895,$288d
	dc.w $2896,$288d,$2897,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d
	dc.w $2873,$288d,$2874,$288d,$2875,$288d

loc_09a60e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $288f,$288d,$2890,$288d,$2891,$288d
	dc.w $2892,$288d,$2893,$288d,$2894,$288d
	dc.w $2895,$288d,$2896,$288d,$2897,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d
	dc.w $2872,$288d,$2873,$288d,$2874,$288d

loc_09a656:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $288e,$288d,$288f,$288d,$2890,$288d
	dc.w $2891,$288d,$2892,$288d,$2893,$288d
	dc.w $2894,$288d,$2895,$288d,$2896,$288d
	dc.w $2897,$288d,$288c,$288d,$2870,$288d
	dc.w $2871,$288d,$2872,$288d,$2873,$288d

loc_09a69e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2882,$288d,$288e,$288d,$288f,$288d
	dc.w $2890,$288d,$2891,$288d,$2892,$288d
	dc.w $2893,$288d,$2894,$288d,$2895,$288d
	dc.w $2896,$288d,$2897,$288d,$288c,$288d
	dc.w $2870,$288d,$2871,$288d,$2872,$288d

loc_09a6e6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2881,$288d,$2882,$288d,$288e,$288d
	dc.w $288f,$288d,$2890,$288d,$2891,$288d
	dc.w $2892,$288d,$2893,$288d,$2894,$288d
	dc.w $2895,$288d,$2896,$288d,$2897,$288d
	dc.w $288c,$288d,$2870,$288d,$2871,$288d

loc_09a72e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2880,$288d,$2881,$288d,$2882,$288d
	dc.w $288e,$288d,$288f,$288d,$2890,$288d
	dc.w $2891,$288d,$2892,$288d,$2893,$288d
	dc.w $2894,$288d,$2895,$288d,$2896,$288d
	dc.w $2897,$288d,$288c,$288d,$2870,$288d

loc_09a776:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$288e,$288d,$288f,$288d
	dc.w $2890,$288d,$2891,$288d,$2892,$288d
	dc.w $2893,$288d,$2894,$288d,$2895,$288d
	dc.w $2896,$288d,$2897,$288d,$288c,$288d

loc_09a7be:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$288e,$288d
	dc.w $288f,$288d,$2890,$288d,$2891,$288d
	dc.w $2892,$288d,$2893,$288d,$2894,$288d
	dc.w $2895,$288d,$2896,$288d,$2897,$288d

loc_09a806:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d
	dc.w $288e,$288d,$288f,$288d,$2890,$288d
	dc.w $2891,$288d,$2892,$288d,$2893,$288d
	dc.w $2894,$288d,$2895,$288d,$2896,$288d

loc_09a84e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$288e,$288d,$288f,$288d
	dc.w $2890,$288d,$2891,$288d,$2892,$288d
	dc.w $2893,$288d,$2894,$288d,$2895,$288d

loc_09a896:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$288e,$288d
	dc.w $288f,$288d,$2890,$288d,$2891,$288d
	dc.w $2892,$288d,$2893,$288d,$2894,$288d

loc_09a8de:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $287a,$288d,$287b,$288d,$287c,$288d
	dc.w $287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d
	dc.w $288e,$288d,$288f,$288d,$2890,$288d
	dc.w $2891,$288d,$2892,$288d,$2893,$288d

loc_09a926:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2879,$288d,$287a,$288d,$287b,$288d
	dc.w $287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$288e,$288d,$288f,$288d
	dc.w $2890,$288d,$2891,$288d,$2892,$288d

loc_09a96e:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2878,$288d,$2879,$288d,$287a,$288d
	dc.w $287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$288e,$288d
	dc.w $288f,$288d,$2890,$288d,$2891,$288d

loc_09a9b6:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2877,$288d,$2878,$288d,$2879,$288d
	dc.w $287a,$288d,$287b,$288d,$287c,$288d
	dc.w $287d,$288d,$287e,$288d,$287f,$288d
	dc.w $2880,$288d,$2881,$288d,$2882,$288d
	dc.w $288e,$288d,$288f,$288d,$2890,$288d

loc_09a9fe:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2876,$288d,$2877,$288d,$2878,$288d
	dc.w $2879,$288d,$287a,$288d,$287b,$288d
	dc.w $287c,$288d,$287d,$288d,$287e,$288d
	dc.w $287f,$288d,$2880,$288d,$2881,$288d
	dc.w $2882,$288d,$288e,$288d,$288f,$288d

loc_09aa46:
	dc.w $000a,$001e,$001d,$0002
	dc.l loc_0a0058
	dc.w $2875,$288d,$2876,$288d,$2877,$288d
	dc.w $2878,$288d,$2879,$288d,$287a,$288d
	dc.w $287b,$288d,$287c,$288d,$287d,$288d
	dc.w $287e,$288d,$287f,$288d,$2880,$288d
	dc.w $2881,$288d,$2882,$288d,$288e,$288d

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09aa8e:
	dc.w $0008,$0038,$000d
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2a90,$0301,$ffc0,$fff7
	dc.w $2a90,$0301,$0000,$fff7
	dc.w $2a90,$0301,$0040,$fff7
	dc.w $2a90,$0301,$0080,$fff7
	dc.w $2a90,$0301,$00c0,$fff7
	dc.w $2a90,$0301,$0100,$fff7
	dc.w $2a90,$0301,$0140,$fff7

loc_09ab04:
	dc.w $0008,$0038,$000d
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2a80,$0301,$ffc0,$fff7
	dc.w $2a80,$0301,$0000,$fff7
	dc.w $2a80,$0301,$0040,$fff7
	dc.w $2a80,$0301,$0080,$fff7
	dc.w $2a80,$0301,$00c0,$fff7
	dc.w $2a80,$0301,$0100,$fff7
	dc.w $2a80,$0301,$0140,$fff7

loc_09ab7a:
	dc.w $0008,$003f,$000e
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0301,$0160,$fff7
	dc.w $2ab6,$0001,$01a0,$fff7
	dc.w $2a94,$0401,$ffa8,$fff7
	dc.w $2a94,$0401,$0000,$fff7
	dc.w $2a94,$0401,$0058,$fff7
	dc.w $2a94,$0401,$00b0,$fff7
	dc.w $2a94,$0401,$0108,$fff7
	dc.w $2a94,$0401,$0160,$fff7

loc_09abf8:
	dc.w $0008,$003c,$000d
	dc.w $2ab6,$0301,$ffb0,$fff7
	dc.w $2ab6,$0301,$fff0,$fff7
	dc.w $2ab6,$0301,$0030,$fff7
	dc.w $2ab6,$0301,$0070,$fff7
	dc.w $2ab6,$0301,$00b0,$fff7
	dc.w $2ab6,$0301,$00f0,$fff7
	dc.w $2ab6,$0301,$0130,$fff7
	dc.w $2ab6,$0101,$0170,$fff7
	dc.w $2a54,$0401,$ffb0,$fff7
	dc.w $2a54,$0401,$0000,$fff7
	dc.w $2a54,$0401,$0050,$fff7
	dc.w $2a54,$0401,$00a0,$fff7
	dc.w $2a54,$0401,$00f0,$fff7
	dc.w $2a54,$0401,$0140,$fff7

loc_09ac6e:
	dc.w $0008,$0040,$000d
	dc.w $2ab6,$0301,$ff90,$fff7
	dc.w $2ab6,$0301,$ffd0,$fff7
	dc.w $2ab6,$0301,$0010,$fff7
	dc.w $2ab6,$0301,$0050,$fff7
	dc.w $2ab6,$0301,$0090,$fff7
	dc.w $2ab6,$0301,$00d0,$fff7
	dc.w $2ab6,$0301,$0110,$fff7
	dc.w $2ab6,$0301,$0150,$fff7
	dc.w $2ab6,$0101,$0190,$fff7
	dc.w $2ab0,$0501,$ff94,$fff7
	dc.w $2ab0,$0501,$0000,$fff7
	dc.w $2ab0,$0501,$006c,$fff7
	dc.w $2ab0,$0501,$00d8,$fff7
	dc.w $2ab0,$0501,$0144,$fff7

loc_09ace4:
	dc.w $0008,$003c,$000d
	dc.w $2ab6,$0301,$ffb0,$fff7
	dc.w $2ab6,$0301,$fff0,$fff7
	dc.w $2ab6,$0301,$0030,$fff7
	dc.w $2ab6,$0301,$0070,$fff7
	dc.w $2ab6,$0301,$00b0,$fff7
	dc.w $2ab6,$0301,$00f0,$fff7
	dc.w $2ab6,$0301,$0130,$fff7
	dc.w $2ab6,$0101,$0170,$fff7
	dc.w $2a84,$0401,$ffb0,$fff7
	dc.w $2a84,$0401,$0000,$fff7
	dc.w $2a84,$0401,$0050,$fff7
	dc.w $2a84,$0401,$00a0,$fff7
	dc.w $2a84,$0401,$00f0,$fff7
	dc.w $2a84,$0401,$0140,$fff7

loc_09ad5a:
	dc.w $0008,$003f,$000d
	dc.w $2ab6,$0301,$ff90,$fff7
	dc.w $2ab6,$0301,$ffd0,$fff7
	dc.w $2ab6,$0301,$0010,$fff7
	dc.w $2ab6,$0301,$0050,$fff7
	dc.w $2ab6,$0301,$0090,$fff7
	dc.w $2ab6,$0301,$00d0,$fff7
	dc.w $2ab6,$0301,$0110,$fff7
	dc.w $2ab6,$0301,$0150,$fff7
	dc.w $2ab6,$0001,$0190,$fff7
	dc.w $2a10,$0501,$ff98,$fff7
	dc.w $2a10,$0501,$0000,$fff7
	dc.w $2a10,$0501,$0068,$fff7
	dc.w $2a10,$0501,$00d0,$fff7
	dc.w $2a10,$0501,$0138,$fff7

loc_09add0:
	dc.w $0008,$0038,$000d
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2a70,$0301,$ffc0,$fff7
	dc.w $2a70,$0301,$0000,$fff7
	dc.w $2a70,$0301,$0040,$fff7
	dc.w $2a70,$0301,$0080,$fff7
	dc.w $2a70,$0301,$00c0,$fff7
	dc.w $2a70,$0301,$0100,$fff7
	dc.w $2a70,$0301,$0140,$fff7

loc_09ae46:
	dc.w $0008,$0040,$000e
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0301,$0160,$fff7
	dc.w $2ab6,$0101,$01a0,$fff7
	dc.w $2a74,$0401,$ffa4,$fff7
	dc.w $2a74,$0401,$0000,$fff7
	dc.w $2a74,$0401,$005c,$fff7
	dc.w $2a74,$0401,$00b8,$fff7
	dc.w $2a74,$0401,$0114,$fff7
	dc.w $2a74,$0401,$0170,$fff7

loc_09aec4:
	dc.w $0008,$003c,$000d
	dc.w $2ab6,$0301,$ffb0,$fff7
	dc.w $2ab6,$0301,$fff0,$fff7
	dc.w $2ab6,$0301,$0030,$fff7
	dc.w $2ab6,$0301,$0070,$fff7
	dc.w $2ab6,$0301,$00b0,$fff7
	dc.w $2ab6,$0301,$00f0,$fff7
	dc.w $2ab6,$0301,$0130,$fff7
	dc.w $2ab6,$0101,$0170,$fff7
	dc.w $2a60,$0401,$ffb0,$fff7
	dc.w $2a60,$0401,$0000,$fff7
	dc.w $2a60,$0401,$0050,$fff7
	dc.w $2a60,$0401,$00a0,$fff7
	dc.w $2a60,$0401,$00f0,$fff7
	dc.w $2a60,$0401,$0140,$fff7

loc_09af3a:
	dc.w $0008,$003c,$000d
	dc.w $2ab6,$0301,$ffb0,$fff7
	dc.w $2ab6,$0301,$fff0,$fff7
	dc.w $2ab6,$0301,$0030,$fff7
	dc.w $2ab6,$0301,$0070,$fff7
	dc.w $2ab6,$0301,$00b0,$fff7
	dc.w $2ab6,$0301,$00f0,$fff7
	dc.w $2ab6,$0301,$0130,$fff7
	dc.w $2ab6,$0101,$0170,$fff7
	dc.w $2a44,$0401,$ffb0,$fff7
	dc.w $2a44,$0401,$0000,$fff7
	dc.w $2a44,$0401,$0050,$fff7
	dc.w $2a44,$0401,$00a0,$fff7
	dc.w $2a44,$0401,$00f0,$fff7
	dc.w $2a44,$0401,$0140,$fff7

loc_09afb0:
	dc.w $0008,$003e,$000c
	dc.w $2ab6,$0301,$ff90,$fff7
	dc.w $2ab6,$0301,$ffd0,$fff7
	dc.w $2ab6,$0301,$0010,$fff7
	dc.w $2ab6,$0301,$0050,$fff7
	dc.w $2ab6,$0301,$0090,$fff7
	dc.w $2ab6,$0301,$00d0,$fff7
	dc.w $2ab6,$0301,$0110,$fff7
	dc.w $2ab6,$0301,$0150,$fff7
	dc.w $2a6a,$0501,$ff9c,$fff7
	dc.w $2a6a,$0501,$0000,$fff7
	dc.w $2a6a,$0501,$0064,$fff7
	dc.w $2a6a,$0501,$00c8,$fff7
	dc.w $2a6a,$0501,$012c,$fff7

loc_09b01e:
	dc.w $0008,$0038,$000d
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2a50,$0301,$ffc0,$fff7
	dc.w $2a50,$0301,$0000,$fff7
	dc.w $2a50,$0301,$0040,$fff7
	dc.w $2a50,$0301,$0080,$fff7
	dc.w $2a50,$0301,$00c0,$fff7
	dc.w $2a50,$0301,$0100,$fff7
	dc.w $2a50,$0301,$0140,$fff7

loc_09b094:
	dc.w $0008,$0048,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0001,$01c0,$fff7
	dc.w $2a99,$0601,$ff8c,$fff7
	dc.w $2a99,$0601,$0000,$fff7
	dc.w $2a99,$0601,$0074,$fff7
	dc.w $2a99,$0601,$00e8,$fff7
	dc.w $2a99,$0601,$015c,$fff7

loc_09b112:
	dc.w $0008,$004a,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0201,$01c0,$fff7
	dc.w $2a89,$0601,$ff84,$fff7
	dc.w $2a89,$0601,$0000,$fff7
	dc.w $2a89,$0601,$007c,$fff7
	dc.w $2a89,$0601,$00f8,$fff7
	dc.w $2a89,$0601,$0174,$fff7

loc_09b190:
	dc.w $0008,$004a,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0201,$01c0,$fff7
	dc.w $2a79,$0601,$ff84,$fff7
	dc.w $2a79,$0601,$0000,$fff7
	dc.w $2a79,$0601,$007c,$fff7
	dc.w $2a79,$0601,$00f8,$fff7
	dc.w $2a79,$0601,$0174,$fff7

loc_09b20e:
	dc.w $0008,$004a,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0201,$01c0,$fff7
	dc.w $2a49,$0601,$ff84,$fff7
	dc.w $2a49,$0601,$0000,$fff7
	dc.w $2a49,$0601,$007c,$fff7
	dc.w $2a49,$0601,$00f8,$fff7
	dc.w $2a49,$0601,$0174,$fff7

loc_09b28c:
	dc.w $0008,$0038,$000d
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2a40,$0301,$ffc0,$fff7
	dc.w $2a40,$0301,$0000,$fff7
	dc.w $2a40,$0301,$0040,$fff7
	dc.w $2a40,$0301,$0080,$fff7
	dc.w $2a40,$0301,$00c0,$fff7
	dc.w $2a40,$0301,$0100,$fff7
	dc.w $2a40,$0301,$0140,$fff7

loc_09b302:
	dc.w $0008,$0048,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0001,$01c0,$fff7
	dc.w $2a37,$0601,$ff8c,$fff7
	dc.w $2a37,$0601,$0000,$fff7
	dc.w $2a37,$0601,$0074,$fff7
	dc.w $2a37,$0601,$00e8,$fff7
	dc.w $2a37,$0601,$015c,$fff7

loc_09b380:
	dc.w $0008,$003c,$000c
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0101,$0160,$fff7
	dc.w $2a59,$0501,$ffa0,$fff7
	dc.w $2a59,$0501,$0000,$fff7
	dc.w $2a59,$0501,$0060,$fff7
	dc.w $2a59,$0501,$00c0,$fff7
	dc.w $2a59,$0501,$0120,$fff7

loc_09b3ee:
	dc.w $0008,$004a,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0201,$01c0,$fff7
	dc.w $2a16,$0601,$ff84,$fff7
	dc.w $2a16,$0601,$0000,$fff7
	dc.w $2a16,$0601,$007c,$fff7
	dc.w $2a16,$0601,$00f8,$fff7
	dc.w $2a16,$0601,$0174,$fff7

loc_09b46c:
	dc.w $0008,$0046,$000d
	dc.w $2ab6,$0301,$ff90,$fff7
	dc.w $2ab6,$0301,$ffd0,$fff7
	dc.w $2ab6,$0301,$0010,$fff7
	dc.w $2ab6,$0301,$0050,$fff7
	dc.w $2ab6,$0301,$0090,$fff7
	dc.w $2ab6,$0301,$00d0,$fff7
	dc.w $2ab6,$0301,$0110,$fff7
	dc.w $2ab6,$0301,$0150,$fff7
	dc.w $2ab6,$0201,$0190,$fff7
	dc.w $2a27,$0601,$ff90,$fff7
	dc.w $2a27,$0601,$0000,$fff7
	dc.w $2a27,$0601,$0070,$fff7
	dc.w $2a27,$0601,$00e0,$fff7
	dc.w $2a27,$0601,$0150,$fff7

loc_09b4e2:
	dc.w $0008,$0040,$000e
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0301,$0160,$fff7
	dc.w $2ab6,$0101,$01a0,$fff7
	dc.w $2aab,$0401,$ffa4,$fff7
	dc.w $2aab,$0401,$0000,$fff7
	dc.w $2aab,$0401,$005c,$fff7
	dc.w $2aab,$0401,$00b8,$fff7
	dc.w $2aab,$0401,$0114,$fff7
	dc.w $2aab,$0401,$0170,$fff7

loc_09b560:
	dc.w $0008,$003e,$000d
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0301,$0160,$fff7
	dc.w $2a65,$0401,$ffac,$fff7
	dc.w $2a65,$0401,$0000,$fff7
	dc.w $2a65,$0401,$0054,$fff7
	dc.w $2a65,$0401,$00a8,$fff7
	dc.w $2a65,$0401,$00fc,$fff7
	dc.w $2a65,$0401,$0150,$fff7

loc_09b5d6:
	dc.w $0008,$0048,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0001,$01c0,$fff7
	dc.w $2a20,$0601,$ff8c,$fff7
	dc.w $2a20,$0601,$0000,$fff7
	dc.w $2a20,$0601,$0074,$fff7
	dc.w $2a20,$0601,$00e8,$fff7
	dc.w $2a20,$0601,$015c,$fff7

loc_09b654:
	dc.w $0008,$003f,$000e
	dc.w $2ab6,$0301,$ffa0,$fff7
	dc.w $2ab6,$0301,$ffe0,$fff7
	dc.w $2ab6,$0301,$0020,$fff7
	dc.w $2ab6,$0301,$0060,$fff7
	dc.w $2ab6,$0301,$00a0,$fff7
	dc.w $2ab6,$0301,$00e0,$fff7
	dc.w $2ab6,$0301,$0120,$fff7
	dc.w $2ab6,$0301,$0160,$fff7
	dc.w $2ab6,$0001,$01a0,$fff7
	dc.w $2aa6,$0401,$ffa8,$fff7
	dc.w $2aa6,$0401,$0000,$fff7
	dc.w $2aa6,$0401,$0058,$fff7
	dc.w $2aa6,$0401,$00b0,$fff7
	dc.w $2aa6,$0401,$0108,$fff7
	dc.w $2aa6,$0401,$0160,$fff7

loc_09b6d2:
	dc.w $0008,$003e,$000c
	dc.w $2ab6,$0301,$ff90,$fff7
	dc.w $2ab6,$0301,$ffd0,$fff7
	dc.w $2ab6,$0301,$0010,$fff7
	dc.w $2ab6,$0301,$0050,$fff7
	dc.w $2ab6,$0301,$0090,$fff7
	dc.w $2ab6,$0301,$00d0,$fff7
	dc.w $2ab6,$0301,$0110,$fff7
	dc.w $2ab6,$0301,$0150,$fff7
	dc.w $2aa0,$0501,$ff9c,$fff7
	dc.w $2aa0,$0501,$0000,$fff7
	dc.w $2aa0,$0501,$0064,$fff7
	dc.w $2aa0,$0501,$00c8,$fff7
	dc.w $2aa0,$0501,$012c,$fff7

loc_09b740:
	dc.w $0008,$0049,$000e
	dc.w $2ab6,$0301,$ff80,$fff7
	dc.w $2ab6,$0301,$ffc0,$fff7
	dc.w $2ab6,$0301,$0000,$fff7
	dc.w $2ab6,$0301,$0040,$fff7
	dc.w $2ab6,$0301,$0080,$fff7
	dc.w $2ab6,$0301,$00c0,$fff7
	dc.w $2ab6,$0301,$0100,$fff7
	dc.w $2ab6,$0301,$0140,$fff7
	dc.w $2ab6,$0301,$0180,$fff7
	dc.w $2ab6,$0101,$01c0,$fff7
	dc.w $2a30,$0601,$ff88,$fff7
	dc.w $2a30,$0601,$0000,$fff7
	dc.w $2a30,$0601,$0078,$fff7
	dc.w $2a30,$0601,$00f0,$fff7
	dc.w $2a30,$0601,$0168,$fff7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09b7be:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $067c,$0002,$fff0,$fff8
	dc.w $0660,$0f02,$0000,$fff8
	dc.w $0670,$0702,$0100,$fff8

loc_09b814:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $067b,$0102,$fff0,$fff8
	dc.w $0660,$0f02,$0010,$fff8
	dc.w $0670,$0602,$0110,$fff8

loc_09b86a:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $067a,$0202,$fff0,$fff8
	dc.w $0660,$0f02,$0020,$fff8
	dc.w $0670,$0502,$0120,$fff8

loc_09b8c0:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0679,$0302,$fff0,$fff8
	dc.w $0660,$0f02,$0030,$fff8
	dc.w $0670,$0402,$0130,$fff8

loc_09b916:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0678,$0402,$fff0,$fff8
	dc.w $0660,$0f02,$0040,$fff8
	dc.w $0670,$0302,$0140,$fff8

loc_09b96c:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0677,$0502,$fff0,$fff8
	dc.w $0660,$0f02,$0050,$fff8
	dc.w $0670,$0202,$0150,$fff8

loc_09b9c2:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0676,$0602,$fff0,$fff8
	dc.w $0660,$0f02,$0060,$fff8
	dc.w $0670,$0102,$0160,$fff8

loc_09ba18:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0675,$0702,$fff0,$fff8
	dc.w $0660,$0f02,$0070,$fff8
	dc.w $0670,$0002,$0170,$fff8

loc_09ba6e:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0674,$0802,$fff0,$fff8
	dc.w $0660,$0f02,$0080,$fff8

loc_09babc:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0673,$0902,$fff0,$fff8
	dc.w $0660,$0e02,$0090,$fff8

loc_09bb0a:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0672,$0a02,$fff0,$fff8
	dc.w $0660,$0d02,$00a0,$fff8

loc_09bb58:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0671,$0b02,$fff0,$fff8
	dc.w $0660,$0c02,$00b0,$fff8

loc_09bba6:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0670,$0c02,$fff0,$fff8
	dc.w $0660,$0b02,$00c0,$fff8

loc_09bbf4:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066f,$0002,$fff0,$fff8
	dc.w $0670,$0c02,$0000,$fff8
	dc.w $0660,$0a02,$00d0,$fff8

loc_09bc4a:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066e,$0102,$fff0,$fff8
	dc.w $0670,$0c02,$0010,$fff8
	dc.w $0660,$0902,$00e0,$fff8

loc_09bca0:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066d,$0202,$fff0,$fff8
	dc.w $0670,$0c02,$0020,$fff8
	dc.w $0660,$0802,$00f0,$fff8

loc_09bcf6:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066c,$0302,$fff0,$fff8
	dc.w $0670,$0c02,$0030,$fff8
	dc.w $0660,$0702,$0100,$fff8

loc_09bd4c:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066b,$0402,$fff0,$fff8
	dc.w $0670,$0c02,$0040,$fff8
	dc.w $0660,$0602,$0110,$fff8

loc_09bda2:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066a,$0502,$fff0,$fff8
	dc.w $0670,$0c02,$0050,$fff8
	dc.w $0660,$0502,$0120,$fff8

loc_09bdf8:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0669,$0602,$fff0,$fff8
	dc.w $0670,$0c02,$0060,$fff8
	dc.w $0660,$0402,$0130,$fff8

loc_09be4e:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0668,$0702,$fff0,$fff8
	dc.w $0670,$0c02,$0070,$fff8
	dc.w $0660,$0302,$0140,$fff8

loc_09bea4:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0667,$0802,$fff0,$fff8
	dc.w $0670,$0c02,$0080,$fff8
	dc.w $0660,$0202,$0150,$fff8

loc_09befa:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0666,$0902,$fff0,$fff8
	dc.w $0670,$0c02,$0090,$fff8
	dc.w $0660,$0102,$0160,$fff8

loc_09bf50:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0665,$0a02,$fff0,$fff8
	dc.w $0670,$0c02,$00a0,$fff8
	dc.w $0660,$0002,$0170,$fff8

loc_09bfa6:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0664,$0b02,$fff0,$fff8
	dc.w $0670,$0c02,$00b0,$fff8

loc_09bff4:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0663,$0c02,$fff0,$fff8
	dc.w $0670,$0b02,$00c0,$fff8

loc_09c042:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0662,$0d02,$fff0,$fff8
	dc.w $0670,$0a02,$00d0,$fff8

loc_09c090:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0661,$0e02,$fff0,$fff8
	dc.w $0670,$0902,$00e0,$fff8

loc_09c0de:
	dc.w $0008,$0032,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0660,$0f02,$fff0,$fff8
	dc.w $0670,$0802,$00f0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09c12c:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0660,$0f02,$0000,$fff8
	dc.w $0670,$0202,$0100,$fff8
	dc.w $0653,$0402,$0130,$fff8

loc_09c182:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $065c,$0002,$fff0,$fff8
	dc.w $0660,$0f02,$0010,$fff8
	dc.w $0670,$0202,$0110,$fff8
	dc.w $0653,$0302,$0140,$fff8

loc_09c1e0:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $065b,$0102,$fff0,$fff8
	dc.w $0660,$0f02,$0020,$fff8
	dc.w $0670,$0202,$0120,$fff8
	dc.w $0653,$0202,$0150,$fff8

loc_09c23e:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $065a,$0202,$fff0,$fff8
	dc.w $0660,$0f02,$0030,$fff8
	dc.w $0670,$0202,$0130,$fff8
	dc.w $0653,$0102,$0160,$fff8

loc_09c29c:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0659,$0302,$fff0,$fff8
	dc.w $0660,$0f02,$0040,$fff8
	dc.w $0670,$0202,$0140,$fff8
	dc.w $0653,$0002,$0170,$fff8

loc_09c2fa:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0658,$0402,$fff0,$fff8
	dc.w $0660,$0f02,$0050,$fff8
	dc.w $0670,$0202,$0150,$fff8

loc_09c350:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0657,$0502,$fff0,$fff8
	dc.w $0660,$0f02,$0060,$fff8
	dc.w $0670,$0102,$0160,$fff8

loc_09c3a6:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0656,$0602,$fff0,$fff8
	dc.w $0660,$0f02,$0070,$fff8
	dc.w $0670,$0002,$0170,$fff8

loc_09c3fc:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0655,$0702,$fff0,$fff8
	dc.w $0660,$0f02,$0080,$fff8

loc_09c44a:
	dc.w $0008,$0031,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0654,$0802,$fff0,$fff8
	dc.w $0660,$0e02,$0090,$fff8

loc_09c498:
	dc.w $0008,$0031,$0008
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0653,$0902,$fff0,$fff8
	dc.w $0660,$0d02,$00a0,$fff8

loc_09c4e6:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0672,$0002,$fff0,$fff8
	dc.w $0653,$0902,$0000,$fff8
	dc.w $0660,$0c02,$00b0,$fff8

loc_09c53c:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0671,$0102,$fff0,$fff8
	dc.w $0653,$0902,$0010,$fff8
	dc.w $0660,$0b02,$00c0,$fff8

loc_09c592:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0670,$0202,$fff0,$fff8
	dc.w $0653,$0902,$0020,$fff8
	dc.w $0660,$0a02,$00d0,$fff8

loc_09c5e8:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066f,$0002,$fff0,$fff8
	dc.w $0670,$0202,$0000,$fff8
	dc.w $0653,$0902,$0030,$fff8
	dc.w $0660,$0902,$00e0,$fff8

loc_09c646:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066e,$0102,$fff0,$fff8
	dc.w $0670,$0202,$0010,$fff8
	dc.w $0653,$0902,$0040,$fff8
	dc.w $0660,$0802,$00f0,$fff8

loc_09c6a4:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066d,$0202,$fff0,$fff8
	dc.w $0670,$0202,$0020,$fff8
	dc.w $0653,$0902,$0050,$fff8
	dc.w $0660,$0702,$0100,$fff8

loc_09c702:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066c,$0302,$fff0,$fff8
	dc.w $0670,$0202,$0030,$fff8
	dc.w $0653,$0902,$0060,$fff8
	dc.w $0660,$0602,$0110,$fff8

loc_09c760:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066b,$0402,$fff0,$fff8
	dc.w $0670,$0202,$0040,$fff8
	dc.w $0653,$0902,$0070,$fff8
	dc.w $0660,$0502,$0120,$fff8

loc_09c7be:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $066a,$0502,$fff0,$fff8
	dc.w $0670,$0202,$0050,$fff8
	dc.w $0653,$0902,$0080,$fff8
	dc.w $0660,$0402,$0130,$fff8

loc_09c81c:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0669,$0602,$fff0,$fff8
	dc.w $0670,$0202,$0060,$fff8
	dc.w $0653,$0902,$0090,$fff8
	dc.w $0660,$0302,$0140,$fff8

loc_09c87a:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0668,$0702,$fff0,$fff8
	dc.w $0670,$0202,$0070,$fff8
	dc.w $0653,$0902,$00a0,$fff8
	dc.w $0660,$0202,$0150,$fff8

loc_09c8d8:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0667,$0802,$fff0,$fff8
	dc.w $0670,$0202,$0080,$fff8
	dc.w $0653,$0902,$00b0,$fff8
	dc.w $0660,$0102,$0160,$fff8

loc_09c936:
	dc.w $0008,$0031,$000a
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0666,$0902,$fff0,$fff8
	dc.w $0670,$0202,$0090,$fff8
	dc.w $0653,$0902,$00c0,$fff8
	dc.w $0660,$0002,$0170,$fff8

loc_09c994:
	dc.w $0008,$0031,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0665,$0a02,$fff0,$fff8
	dc.w $0670,$0202,$00a0,$fff8
	dc.w $0653,$0902,$00d0,$fff8

loc_09c9ea:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0664,$0b02,$fff0,$fff8
	dc.w $0670,$0202,$00b0,$fff8
	dc.w $0653,$0902,$00e0,$fff8

loc_09ca40:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0663,$0c02,$fff0,$fff8
	dc.w $0670,$0202,$00c0,$fff8
	dc.w $0653,$0802,$00f0,$fff8

loc_09ca96:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0662,$0d02,$fff0,$fff8
	dc.w $0670,$0202,$00d0,$fff8
	dc.w $0653,$0702,$0100,$fff8

loc_09caec:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0661,$0e02,$fff0,$fff8
	dc.w $0670,$0202,$00e0,$fff8
	dc.w $0653,$0602,$0110,$fff8

loc_09cb42:
	dc.w $0008,$0032,$0009
	dc.w $24c8,$0302,$fff0,$fff8
	dc.w $24c8,$0302,$0030,$fff8
	dc.w $24c8,$0302,$0070,$fff8
	dc.w $24c8,$0302,$00b0,$fff8
	dc.w $24c8,$0302,$00f0,$fff8
	dc.w $24c8,$0302,$0130,$fff8
	dc.w $24c8,$0002,$0170,$fff8
	dc.w $0660,$0f02,$fff0,$fff8
	dc.w $0670,$0202,$00f0,$fff8
	dc.w $0653,$0502,$0120,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09cb98:
	dc.w $000c,$0038,$0003
	dc.l loc_0a00d0
	dc.w $2400,$2300
	dc.w $2400,$3300
	dc.w $2400,$3300
	dc.w $2400,$2300

loc_09cbb2:
	dc.w $000c,$0070,$0007
	dc.l loc_0a00d0
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300

loc_09cbdc:
	dc.w $000c,$00a8,$000b
	dc.l loc_0a00d0
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300

loc_09cc16:
	dc.w $000c,$00e0,$000f
	dc.l loc_0a00d0
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300

loc_09cc60:
	dc.w $000c,$0118,$0013
	dc.l loc_0a00d0
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300

loc_09ccba:
	dc.w $000c,$0150,$0017
	dc.l loc_0a00d0
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300
	dc.w $2400,$2300,$2400,$3300
	dc.w $2400,$3300,$2400,$2300

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09cd24:
	dc.w $000c,$0060,$0005
	dc.l loc_0a0130
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300

loc_09cd46:
	dc.w $000c,$00c0,$000b
	dc.l loc_0a0130
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300

loc_09cd80:
	dc.w $000c,$0120,$0011
	dc.l loc_0a0130
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300

loc_09cdd2:
	dc.w $000c,$0150,$0017
	dc.l loc_0a0130
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$3300,$2400,$3300
	dc.w $2400,$1300,$2400,$1300
	dc.w $2400,$1300,$2400,$1300
	dc.w $2400,$1300,$2400,$1300

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09ce3c:
	dc.w $0008,$0070,$0007
	dc.w $2404,$2306,$ffc0,$ff90
	dc.w $2404,$2306,$0000,$ff90
	dc.w $2404,$3306,$ffc0,$ffc0
	dc.w $2404,$3306,$0000,$ffc0
	dc.w $2404,$3306,$ffc0,$0000
	dc.w $2404,$3306,$0000,$0000
	dc.w $2404,$2306,$ffc0,$0040
	dc.w $2404,$2306,$0000,$0040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09ce82:
	dc.w $0008,$01dc,$00d7
	dc.w $6e62,$0100,$ff40,$ff90
	dc.w $6e63,$0000,$ff60,$ff90
	dc.w $6e63,$0200,$ff70,$ff90
	dc.w $2400,$0300,$ffa0,$ff90
	dc.w $2400,$0300,$ffe0,$ff90
	dc.w $2400,$0300,$0020,$ff90
	dc.w $6e65,$0020,$0060,$ff90
	dc.w $6e64,$0020,$0070,$ff90
	dc.w $6e63,$0000,$0080,$ff90
	dc.w $6e63,$0000,$0090,$ff90
	dc.w $6e63,$0000,$00a0,$ff90
	dc.w $6e62,$0020,$00b0,$ff90
	dc.w $6e66,$0100,$ff40,$ffa0
	dc.w $6e68,$0100,$ff90,$ffa0
	dc.w $2400,$0200,$ffb0,$ffa0
	dc.w $2400,$0300,$ffe0,$ffa0
	dc.w $2400,$0200,$0020,$ffa0
	dc.w $6e69,$0020,$0050,$ffa0
	dc.w $6e68,$0020,$0060,$ffa0
	dc.w $6e67,$0020,$00a0,$ffa0
	dc.w $6e66,$0020,$00b0,$ffa0
	dc.w $2400,$0000,$ff40,$ffb0
	dc.w $6e6a,$0100,$ff50,$ffb0
	dc.w $6e6c,$0100,$ffa0,$ffb0
	dc.w $2400,$0300,$ffc0,$ffb0
	dc.w $2400,$0300,$0000,$ffb0
	dc.w $6e6d,$0020,$0040,$ffb0
	dc.w $6e6c,$0020,$0050,$ffb0
	dc.w $6e6b,$0020,$0090,$ffb0
	dc.w $6e6a,$0020,$00a0,$ffb0
	dc.w $2400,$0000,$00b0,$ffb0
	dc.w $2400,$0100,$ff40,$ffc0
	dc.w $6e6e,$0100,$ff60,$ffc0
	dc.w $6e70,$0000,$ffb0,$ffc0
	dc.w $6ee5,$0000,$ffc0,$ffc0
	dc.w $2400,$0200,$ffd0,$ffc0
	dc.w $2400,$0200,$0000,$ffc0
	dc.w $6ee5,$0020,$0030,$ffc0
	dc.w $6e70,$0020,$0040,$ffc0
	dc.w $6e6f,$0020,$0080,$ffc0
	dc.w $6e6e,$0020,$0090,$ffc0
	dc.w $2400,$0100,$00a0,$ffc0
	dc.w $2400,$0300,$ff40,$ffd0
	dc.w $6e71,$0000,$ff80,$ffd0
	dc.w $15a0,$0040,$ff90,$ffd0
	dc.w $6ee6,$0100,$ffc0,$ffd0
	dc.w $2400,$0300,$ffe0,$ffd0
	dc.w $6ee7,$0020,$0020,$ffd0
	dc.w $6ee6,$0020,$0030,$ffd0
	dc.w $15a0,$0060,$0060,$ffd0
	dc.w $6e71,$0020,$0070,$ffd0
	dc.w $2400,$0300,$0080,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $2400,$0000,$ff80,$ffe0
	dc.w $6e72,$0100,$ff90,$ffe0
	dc.w $6ee8,$0100,$ffd0,$ffe0
	dc.w $2400,$0100,$fff0,$ffe0
	dc.w $6ee9,$0020,$0010,$ffe0
	dc.w $6ee8,$0020,$0020,$ffe0
	dc.w $6e73,$0020,$0050,$ffe0
	dc.w $6e72,$0020,$0060,$ffe0
	dc.w $2400,$0000,$0070,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $2400,$0100,$ff80,$fff0
	dc.w $6e74,$0100,$ffa0,$fff0
	dc.w $0080,$0020,$ffe0,$fff0
	dc.w $6eea,$0000,$fff0,$fff0
	dc.w $6eea,$0020,$0000,$fff0
	dc.w $0080,$0000,$0010,$fff0
	dc.w $6e75,$0020,$0040,$fff0
	dc.w $6e74,$0020,$0050,$fff0
	dc.w $2400,$0100,$0060,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $2400,$0100,$ff80,$0000
	dc.w $6e74,$0140,$ffa0,$0000
	dc.w $0080,$0060,$ffe0,$0000
	dc.w $6eea,$0040,$fff0,$0000
	dc.w $6eea,$0060,$0000,$0000
	dc.w $0080,$0040,$0010,$0000
	dc.w $6e75,$0060,$0040,$0000
	dc.w $6e74,$0060,$0050,$0000
	dc.w $2400,$0100,$0060,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $2400,$0000,$ff80,$0010
	dc.w $6e72,$0140,$ff90,$0010
	dc.w $6ee8,$0140,$ffd0,$0010
	dc.w $2400,$0100,$fff0,$0010
	dc.w $6ee9,$0060,$0010,$0010
	dc.w $6ee8,$0060,$0020,$0010
	dc.w $6e73,$0060,$0050,$0010
	dc.w $6e72,$0060,$0060,$0010
	dc.w $2400,$0000,$0070,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0300,$ff40,$0020
	dc.w $6e71,$0040,$ff80,$0020
	dc.w $15a0,$0000,$ff90,$0020
	dc.w $6ee6,$0140,$ffc0,$0020
	dc.w $2400,$0300,$ffe0,$0020
	dc.w $6ee7,$0060,$0020,$0020
	dc.w $6ee6,$0060,$0030,$0020
	dc.w $15a0,$0020,$0060,$0020
	dc.w $6e71,$0060,$0070,$0020
	dc.w $2400,$0300,$0080,$0020
	dc.w $2400,$0100,$ff40,$0030
	dc.w $6e6e,$0140,$ff60,$0030
	dc.w $6e70,$0040,$ffb0,$0030
	dc.w $6ee5,$0040,$ffc0,$0030
	dc.w $2400,$0200,$ffd0,$0030
	dc.w $2400,$0200,$0000,$0030
	dc.w $6ee5,$0060,$0030,$0030
	dc.w $6e70,$0060,$0040,$0030
	dc.w $6e6f,$0060,$0080,$0030
	dc.w $6e6e,$0060,$0090,$0030
	dc.w $2400,$0100,$00a0,$0030
	dc.w $2400,$0000,$ff40,$0040
	dc.w $6e6a,$0140,$ff50,$0040
	dc.w $6e6c,$0140,$ffa0,$0040
	dc.w $2400,$0300,$ffc0,$0040
	dc.w $2400,$0300,$0000,$0040
	dc.w $6e6d,$0060,$0040,$0040
	dc.w $6e6c,$0060,$0050,$0040
	dc.w $6e6b,$0060,$0090,$0040
	dc.w $6e6a,$0060,$00a0,$0040
	dc.w $2400,$0000,$00b0,$0040
	dc.w $6e66,$0140,$ff40,$0050
	dc.w $6e68,$0140,$ff90,$0050
	dc.w $2400,$0200,$ffb0,$0050
	dc.w $2400,$0300,$ffe0,$0050
	dc.w $2400,$0200,$0020,$0050
	dc.w $6e69,$0060,$0050,$0050
	dc.w $6e68,$0060,$0060,$0050
	dc.w $6e67,$0060,$00a0,$0050
	dc.w $6e66,$0060,$00b0,$0050
	dc.w $6e62,$0040,$ff40,$0060
	dc.w $6e63,$0060,$ff50,$0060
	dc.w $6e63,$0060,$ff60,$0060
	dc.w $6e63,$0060,$ff70,$0060
	dc.w $6e64,$0140,$ff80,$0060
	dc.w $2400,$0300,$ffa0,$0060
	dc.w $2400,$0300,$ffe0,$0060
	dc.w $2400,$0300,$0020,$0060
	dc.w $6e65,$0060,$0060,$0060
	dc.w $6e64,$0060,$0070,$0060
	dc.w $6e63,$0060,$0080,$0060
	dc.w $6e63,$0060,$0090,$0060
	dc.w $6e63,$0060,$00a0,$0060
	dc.w $6e62,$0060,$00b0,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $7321,$0e00,$ff50,$0018
	dc.w $7330,$0600,$0040,$0018
	dc.w $7337,$0400,$ff50,$0028
	dc.w $001e,$0000,$ffa0,$0028
	dc.w $733c,$0200,$ffb0,$0028
	dc.w $001e,$0000,$ffe0,$0028
	dc.w $733f,$0000,$fff0,$0028
	dc.w $7340,$0000,$0000,$0028
	dc.w $001e,$0000,$0010,$0028
	dc.w $7341,$0100,$0020,$0028
	dc.w $7343,$0500,$0050,$0028
	dc.w $7349,$0600,$ff50,$0038
	dc.w $7350,$0100,$ffc0,$0038
	dc.w $734e,$0000,$ffe0,$0038
	dc.w $7352,$0100,$fff0,$0038
	dc.w $734e,$0000,$0010,$0038
	dc.w $7354,$0800,$0020,$0038

loc_09d548:
	dc.w $0008,$01f0,$00e6
	dc.w $6e63,$0000,$ff40,$ff90
	dc.w $6e63,$0000,$ff50,$ff90
	dc.w $6e63,$0000,$ff60,$ff90
	dc.w $6e63,$0000,$ff70,$ff90
	dc.w $6e63,$0000,$ff80,$ff90
	dc.w $6e63,$0000,$ff90,$ff90
	dc.w $6e63,$0000,$ffa0,$ff90
	dc.w $6e63,$0000,$ffb0,$ff90
	dc.w $6e63,$0000,$ffc0,$ff90
	dc.w $6e63,$0000,$ffd0,$ff90
	dc.w $6e63,$0000,$ffe0,$ff90
	dc.w $6e63,$0000,$fff0,$ff90
	dc.w $6e63,$0000,$0000,$ff90
	dc.w $6e63,$0000,$0010,$ff90
	dc.w $6e63,$0000,$0020,$ff90
	dc.w $6e63,$0000,$0030,$ff90
	dc.w $6e63,$0000,$0040,$ff90
	dc.w $6e63,$0000,$0050,$ff90
	dc.w $6e63,$0000,$0060,$ff90
	dc.w $6e63,$0000,$0070,$ff90
	dc.w $6e63,$0000,$0080,$ff90
	dc.w $6e63,$0000,$0090,$ff90
	dc.w $6e63,$0000,$00a0,$ff90
	dc.w $7087,$0000,$00b0,$ff90
	dc.w $6e63,$0060,$ff40,$ffa0
	dc.w $6e63,$0060,$ff50,$ffa0
	dc.w $6e63,$0060,$ff60,$ffa0
	dc.w $6e63,$0060,$ff70,$ffa0
	dc.w $6e63,$0060,$ff80,$ffa0
	dc.w $6e63,$0060,$ff90,$ffa0
	dc.w $6e63,$0060,$ffa0,$ffa0
	dc.w $6e63,$0060,$ffb0,$ffa0
	dc.w $6e63,$0060,$ffc0,$ffa0
	dc.w $6e63,$0060,$ffd0,$ffa0
	dc.w $6e63,$0060,$ffe0,$ffa0
	dc.w $6e63,$0060,$fff0,$ffa0
	dc.w $6e63,$0060,$0000,$ffa0
	dc.w $6e63,$0060,$0010,$ffa0
	dc.w $6e63,$0060,$0020,$ffa0
	dc.w $6e63,$0060,$0030,$ffa0
	dc.w $7088,$0100,$0040,$ffa0
	dc.w $708a,$0100,$00a0,$ffa0
	dc.w $2400,$0300,$ff40,$ffb0
	dc.w $2400,$0300,$ff80,$ffb0
	dc.w $2400,$0300,$ffc0,$ffb0
	dc.w $2400,$0200,$0000,$ffb0
	dc.w $7027,$0000,$0030,$ffb0
	dc.w $708c,$0000,$0040,$ffb0
	dc.w $708d,$0100,$0080,$ffb0
	dc.w $2400,$0100,$00a0,$ffb0
	dc.w $2400,$0300,$ff40,$ffc0
	dc.w $2400,$0300,$ff80,$ffc0
	dc.w $2400,$0300,$ffc0,$ffc0
	dc.w $2400,$0000,$0000,$ffc0
	dc.w $6e6e,$0040,$0010,$ffc0
	dc.w $7028,$0100,$0020,$ffc0
	dc.w $708f,$0000,$0070,$ffc0
	dc.w $7090,$0000,$0080,$ffc0
	dc.w $2400,$0200,$0090,$ffc0
	dc.w $2400,$0300,$ff40,$ffd0
	dc.w $2400,$0300,$ff80,$ffd0
	dc.w $2400,$0300,$ffc0,$ffd0
	dc.w $702a,$0100,$0000,$ffd0
	dc.w $6ee8,$0040,$0050,$ffd0
	dc.w $7091,$0000,$0060,$ffd0
	dc.w $6e65,$0040,$0070,$ffd0
	dc.w $2400,$0300,$0080,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $2400,$0300,$ff80,$ffe0
	dc.w $2400,$0100,$ffc0,$ffe0
	dc.w $6e65,$0020,$ffe0,$ffe0
	dc.w $702c,$0100,$fff0,$ffe0
	dc.w $7092,$0100,$0040,$ffe0
	dc.w $2400,$0100,$0060,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $2400,$0300,$ff80,$fff0
	dc.w $2400,$0000,$ffc0,$fff0
	dc.w $702e,$0100,$ffd0,$fff0
	dc.w $0c0e,$0000,$0020,$fff0
	dc.w $7030,$0000,$0030,$fff0
	dc.w $6e69,$0040,$0040,$fff0
	dc.w $2400,$0200,$0050,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $2400,$0300,$ff80,$0000
	dc.w $7031,$0100,$ffc0,$0000
	dc.w $7033,$0100,$0010,$0000
	dc.w $2400,$0000,$0030,$0000
	dc.w $2400,$0300,$0040,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $2400,$0100,$ff80,$0010
	dc.w $6fac,$0100,$ffa0,$0010
	dc.w $7035,$0100,$0000,$0010
	dc.w $2400,$0100,$0020,$0010
	dc.w $2400,$0300,$0040,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0300,$ff40,$0020
	dc.w $2400,$0000,$ff80,$0020
	dc.w $6fae,$0100,$ff90,$0020
	dc.w $7037,$0100,$ffe0,$0020
	dc.w $2400,$0300,$0000,$0020
	dc.w $2400,$0300,$0040,$0020
	dc.w $2400,$0300,$0080,$0020
	dc.w $2400,$0200,$ff40,$0030
	dc.w $6fb0,$0100,$ff70,$0030
	dc.w $702b,$0060,$ffd0,$0030
	dc.w $7039,$0000,$ffe0,$0030
	dc.w $2400,$0000,$fff0,$0030
	dc.w $2400,$0300,$0000,$0030
	dc.w $2400,$0300,$0040,$0030
	dc.w $2400,$0300,$0080,$0030
	dc.w $2400,$0100,$ff40,$0040
	dc.w $6fb2,$0100,$ff60,$0040
	dc.w $6fb4,$0000,$ffb0,$0040
	dc.w $703a,$0000,$ffc0,$0040
	dc.w $6e6e,$0020,$ffd0,$0040
	dc.w $2400,$0100,$ffe0,$0040
	dc.w $2400,$0300,$0000,$0040
	dc.w $2400,$0300,$0040,$0040
	dc.w $2400,$0300,$0080,$0040
	dc.w $6fb5,$0100,$ff40,$0050
	dc.w $0c0e,$0060,$ff60,$0050
	dc.w $6fb7,$0000,$ffb0,$0050
	dc.w $6e63,$0000,$ffc0,$0050
	dc.w $6e63,$0000,$ffd0,$0050
	dc.w $6e63,$0000,$ffe0,$0050
	dc.w $6e63,$0000,$fff0,$0050
	dc.w $6e63,$0000,$0000,$0050
	dc.w $6e63,$0000,$0010,$0050
	dc.w $6e63,$0000,$0020,$0050
	dc.w $6e63,$0000,$0030,$0050
	dc.w $6e63,$0000,$0040,$0050
	dc.w $6e63,$0000,$0050,$0050
	dc.w $6e63,$0000,$0060,$0050
	dc.w $6e63,$0000,$0070,$0050
	dc.w $6e63,$0000,$0080,$0050
	dc.w $6e63,$0000,$0090,$0050
	dc.w $6e63,$0000,$00a0,$0050
	dc.w $7094,$0000,$00b0,$0050
	dc.w $6fb8,$0000,$ff40,$0060
	dc.w $6e63,$0060,$ff50,$0060
	dc.w $6e63,$0060,$ff60,$0060
	dc.w $6e63,$0060,$ff70,$0060
	dc.w $6e63,$0060,$ff80,$0060
	dc.w $6e63,$0060,$ff90,$0060
	dc.w $6e63,$0060,$ffa0,$0060
	dc.w $6e63,$0060,$ffb0,$0060
	dc.w $6e63,$0060,$ffc0,$0060
	dc.w $6e63,$0060,$ffd0,$0060
	dc.w $6e63,$0060,$ffe0,$0060
	dc.w $6e63,$0060,$fff0,$0060
	dc.w $6e63,$0060,$0000,$0060
	dc.w $6e63,$0060,$0010,$0060
	dc.w $6e63,$0060,$0020,$0060
	dc.w $6e63,$0060,$0030,$0060
	dc.w $6e63,$0060,$0040,$0060
	dc.w $6e63,$0060,$0050,$0060
	dc.w $6e63,$0060,$0060,$0060
	dc.w $6e63,$0060,$0070,$0060
	dc.w $6e63,$0060,$0080,$0060
	dc.w $6e63,$0060,$0090,$0060
	dc.w $6e63,$0060,$00a0,$0060
	dc.w $7094,$0040,$00b0,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $7321,$0e00,$ff50,$0018
	dc.w $7330,$0600,$0040,$0018
	dc.w $7337,$0400,$ff50,$0028
	dc.w $001e,$0000,$ffa0,$0028
	dc.w $733c,$0200,$ffb0,$0028
	dc.w $001e,$0000,$ffe0,$0028
	dc.w $733f,$0000,$fff0,$0028
	dc.w $7340,$0000,$0000,$0028
	dc.w $001e,$0000,$0010,$0028
	dc.w $7341,$0100,$0020,$0028
	dc.w $7343,$0500,$0050,$0028
	dc.w $7349,$0600,$ff50,$0038
	dc.w $7350,$0100,$ffc0,$0038
	dc.w $734e,$0000,$ffe0,$0038
	dc.w $7352,$0100,$fff0,$0038
	dc.w $734e,$0000,$0010,$0038
	dc.w $7354,$0800,$0020,$0038

loc_09dc86:
	dc.w $0008,$01e2,$00cb
	dc.w $70f9,$0000,$ff40,$ff90
	dc.w $6e63,$0000,$ff50,$ff90
	dc.w $6e63,$0000,$ff60,$ff90
	dc.w $6e63,$0000,$ff70,$ff90
	dc.w $70fa,$0000,$ff80,$ff90
	dc.w $2400,$0300,$ff90,$ff90
	dc.w $2400,$0300,$ffd0,$ff90
	dc.w $2400,$0300,$0010,$ff90
	dc.w $2400,$0100,$0050,$ff90
	dc.w $70fa,$0020,$0070,$ff90
	dc.w $6e63,$0000,$0080,$ff90
	dc.w $6e63,$0000,$0090,$ff90
	dc.w $6e63,$0000,$00a0,$ff90
	dc.w $70f9,$0020,$00b0,$ff90
	dc.w $70fb,$0100,$ff40,$ffa0
	dc.w $0080,$0020,$ff80,$ffa0
	dc.w $70fd,$0000,$ff90,$ffa0
	dc.w $2400,$0300,$ffa0,$ffa0
	dc.w $2400,$0300,$ffe0,$ffa0
	dc.w $2400,$0300,$0020,$ffa0
	dc.w $70fd,$0020,$0060,$ffa0
	dc.w $0080,$0000,$0070,$ffa0
	dc.w $70fc,$0020,$00a0,$ffa0
	dc.w $70fb,$0020,$00b0,$ffa0
	dc.w $2400,$0000,$ff40,$ffb0
	dc.w $70fe,$0100,$ff50,$ffb0
	dc.w $70ff,$0060,$ff90,$ffb0
	dc.w $7100,$0000,$ffa0,$ffb0
	dc.w $2400,$0300,$ffb0,$ffb0
	dc.w $2400,$0300,$fff0,$ffb0
	dc.w $2400,$0100,$0030,$ffb0
	dc.w $7100,$0020,$0050,$ffb0
	dc.w $70ff,$0040,$0060,$ffb0
	dc.w $70ff,$0020,$0090,$ffb0
	dc.w $70fe,$0020,$00a0,$ffb0
	dc.w $2400,$0000,$00b0,$ffb0
	dc.w $2400,$0100,$ff40,$ffc0
	dc.w $7101,$0000,$ff60,$ffc0
	dc.w $0080,$0040,$ff70,$ffc0
	dc.w $7102,$0100,$ffa0,$ffc0
	dc.w $2400,$0300,$ffc0,$ffc0
	dc.w $2400,$0300,$0000,$ffc0
	dc.w $7103,$0020,$0040,$ffc0
	dc.w $7102,$0020,$0050,$ffc0
	dc.w $0080,$0060,$0080,$ffc0
	dc.w $7101,$0020,$0090,$ffc0
	dc.w $2400,$0100,$00a0,$ffc0
	dc.w $2400,$0200,$ff40,$ffd0
	dc.w $7104,$0000,$ff70,$ffd0
	dc.w $7105,$0000,$ffb0,$ffd0
	dc.w $7174,$0000,$ffc0,$ffd0
	dc.w $2400,$0200,$ffd0,$ffd0
	dc.w $2400,$0200,$0000,$ffd0
	dc.w $7174,$0020,$0030,$ffd0
	dc.w $7105,$0020,$0040,$ffd0
	dc.w $7104,$0020,$0080,$ffd0
	dc.w $2400,$0200,$0090,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $7106,$0000,$ff80,$ffe0
	dc.w $7175,$0100,$ffc0,$ffe0
	dc.w $2400,$0300,$ffe0,$ffe0
	dc.w $7176,$0020,$0020,$ffe0
	dc.w $7175,$0020,$0030,$ffe0
	dc.w $7106,$0020,$0070,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $6e6e,$0000,$ff80,$fff0
	dc.w $7107,$0000,$ff90,$fff0
	dc.w $7177,$0100,$ffd0,$fff0
	dc.w $2400,$0100,$fff0,$fff0
	dc.w $7178,$0020,$0010,$fff0
	dc.w $7177,$0020,$0020,$fff0
	dc.w $7107,$0020,$0060,$fff0
	dc.w $6e6e,$0020,$0070,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $2400,$0000,$ff80,$0000
	dc.w $6e6a,$0000,$ff90,$0000
	dc.w $7108,$0000,$ffa0,$0000
	dc.w $7179,$0000,$ffe0,$0000
	dc.w $6e65,$0000,$fff0,$0000
	dc.w $6e65,$0020,$0000,$0000
	dc.w $7179,$0020,$0010,$0000
	dc.w $7108,$0020,$0050,$0000
	dc.w $6e6a,$0020,$0060,$0000
	dc.w $2400,$0000,$0070,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $2400,$0100,$ff80,$0010
	dc.w $7109,$0100,$ffa0,$0010
	dc.w $717a,$0000,$fff0,$0010
	dc.w $717a,$0020,$0000,$0010
	dc.w $710a,$0020,$0040,$0010
	dc.w $7109,$0020,$0050,$0010
	dc.w $2400,$0100,$0060,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0300,$ff40,$0020
	dc.w $2400,$0200,$ff80,$0020
	dc.w $710b,$0000,$ffb0,$0020
	dc.w $717b,$0000,$ffc0,$0020
	dc.w $717b,$0020,$0030,$0020
	dc.w $710b,$0020,$0040,$0020
	dc.w $2400,$0200,$0050,$0020
	dc.w $2400,$0300,$0080,$0020
	dc.w $2400,$0300,$ff40,$0030
	dc.w $2400,$0300,$ff80,$0030
	dc.w $70fb,$0100,$ffc0,$0030
	dc.w $70fc,$0020,$0020,$0030
	dc.w $70fb,$0020,$0030,$0030
	dc.w $2400,$0300,$0040,$0030
	dc.w $2400,$0300,$0080,$0030
	dc.w $2400,$0300,$ff40,$0040
	dc.w $2400,$0300,$ff80,$0040
	dc.w $2400,$0000,$ffc0,$0040
	dc.w $70fe,$0100,$ffd0,$0040
	dc.w $70ff,$0020,$0010,$0040
	dc.w $70fe,$0020,$0020,$0040
	dc.w $2400,$0000,$0030,$0040
	dc.w $2400,$0300,$0040,$0040
	dc.w $2400,$0300,$0080,$0040
	dc.w $2400,$0300,$ff40,$0050
	dc.w $2400,$0300,$ff80,$0050
	dc.w $2400,$0100,$ffc0,$0050
	dc.w $7101,$0000,$ffe0,$0050
	dc.w $0080,$0040,$fff0,$0050
	dc.w $0080,$0060,$0000,$0050
	dc.w $7101,$0020,$0010,$0050
	dc.w $2400,$0100,$0020,$0050
	dc.w $2400,$0300,$0040,$0050
	dc.w $2400,$0300,$0080,$0050
	dc.w $2400,$0300,$ff40,$0060
	dc.w $2400,$0300,$ff80,$0060
	dc.w $2400,$0200,$ffc0,$0060
	dc.w $7104,$0000,$fff0,$0060
	dc.w $7104,$0020,$0000,$0060
	dc.w $2400,$0200,$0010,$0060
	dc.w $2400,$0300,$0040,$0060
	dc.w $2400,$0300,$0080,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $7321,$0e00,$ff50,$0018
	dc.w $7330,$0600,$0040,$0018
	dc.w $7337,$0400,$ff50,$0028
	dc.w $001e,$0000,$ffa0,$0028
	dc.w $733c,$0200,$ffb0,$0028
	dc.w $001e,$0000,$ffe0,$0028
	dc.w $733f,$0000,$fff0,$0028
	dc.w $7340,$0000,$0000,$0028
	dc.w $001e,$0000,$0010,$0028
	dc.w $7341,$0100,$0020,$0028
	dc.w $7343,$0500,$0050,$0028
	dc.w $7349,$0600,$ff50,$0038
	dc.w $7350,$0100,$ffc0,$0038
	dc.w $734e,$0000,$ffe0,$0038
	dc.w $7352,$0100,$fff0,$0038
	dc.w $734e,$0000,$0010,$0038
	dc.w $7354,$0800,$0020,$0038

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09e2ec:
	dc.w $0008,$01dd,$00da
	dc.w $6e62,$0100,$ff40,$ff90
	dc.w $6e63,$0000,$ff60,$ff90
	dc.w $6e63,$0200,$ff70,$ff90
	dc.w $2400,$0300,$ffa0,$ff90
	dc.w $2400,$0300,$ffe0,$ff90
	dc.w $2400,$0300,$0020,$ff90
	dc.w $6e65,$0020,$0060,$ff90
	dc.w $6e64,$0020,$0070,$ff90
	dc.w $6e63,$0000,$0080,$ff90
	dc.w $6e63,$0000,$0090,$ff90
	dc.w $6e63,$0000,$00a0,$ff90
	dc.w $6e62,$0020,$00b0,$ff90
	dc.w $6e66,$0100,$ff40,$ffa0
	dc.w $6e68,$0100,$ff90,$ffa0
	dc.w $2400,$0200,$ffb0,$ffa0
	dc.w $2400,$0300,$ffe0,$ffa0
	dc.w $2400,$0200,$0020,$ffa0
	dc.w $6e69,$0020,$0050,$ffa0
	dc.w $6e68,$0020,$0060,$ffa0
	dc.w $6e67,$0020,$00a0,$ffa0
	dc.w $6e66,$0020,$00b0,$ffa0
	dc.w $2400,$0000,$ff40,$ffb0
	dc.w $6e6a,$0100,$ff50,$ffb0
	dc.w $6e6c,$0100,$ffa0,$ffb0
	dc.w $2400,$0300,$ffc0,$ffb0
	dc.w $2400,$0300,$0000,$ffb0
	dc.w $6e6d,$0020,$0040,$ffb0
	dc.w $6e6c,$0020,$0050,$ffb0
	dc.w $6e6b,$0020,$0090,$ffb0
	dc.w $6e6a,$0020,$00a0,$ffb0
	dc.w $2400,$0000,$00b0,$ffb0
	dc.w $2400,$0100,$ff40,$ffc0
	dc.w $6e6e,$0100,$ff60,$ffc0
	dc.w $6e70,$0000,$ffb0,$ffc0
	dc.w $6ee5,$0000,$ffc0,$ffc0
	dc.w $2400,$0200,$ffd0,$ffc0
	dc.w $2400,$0200,$0000,$ffc0
	dc.w $6ee5,$0020,$0030,$ffc0
	dc.w $6e70,$0020,$0040,$ffc0
	dc.w $6e6f,$0020,$0080,$ffc0
	dc.w $6e6e,$0020,$0090,$ffc0
	dc.w $2400,$0100,$00a0,$ffc0
	dc.w $2400,$0300,$ff40,$ffd0
	dc.w $6e71,$0000,$ff80,$ffd0
	dc.w $15a0,$0040,$ff90,$ffd0
	dc.w $6ee6,$0100,$ffc0,$ffd0
	dc.w $2400,$0300,$ffe0,$ffd0
	dc.w $6ee7,$0020,$0020,$ffd0
	dc.w $6ee6,$0020,$0030,$ffd0
	dc.w $15a0,$0060,$0060,$ffd0
	dc.w $6e71,$0020,$0070,$ffd0
	dc.w $2400,$0300,$0080,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $2400,$0000,$ff80,$ffe0
	dc.w $6e72,$0100,$ff90,$ffe0
	dc.w $6ee8,$0100,$ffd0,$ffe0
	dc.w $2400,$0100,$fff0,$ffe0
	dc.w $6ee9,$0020,$0010,$ffe0
	dc.w $6ee8,$0020,$0020,$ffe0
	dc.w $6e73,$0020,$0050,$ffe0
	dc.w $6e72,$0020,$0060,$ffe0
	dc.w $2400,$0000,$0070,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $2400,$0100,$ff80,$fff0
	dc.w $6e74,$0100,$ffa0,$fff0
	dc.w $0080,$0020,$ffe0,$fff0
	dc.w $6eea,$0000,$fff0,$fff0
	dc.w $6eea,$0020,$0000,$fff0
	dc.w $0080,$0000,$0010,$fff0
	dc.w $6e75,$0020,$0040,$fff0
	dc.w $6e74,$0020,$0050,$fff0
	dc.w $2400,$0100,$0060,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $2400,$0100,$ff80,$0000
	dc.w $6e74,$0140,$ffa0,$0000
	dc.w $0080,$0060,$ffe0,$0000
	dc.w $6eea,$0040,$fff0,$0000
	dc.w $6eea,$0060,$0000,$0000
	dc.w $0080,$0040,$0010,$0000
	dc.w $6e75,$0060,$0040,$0000
	dc.w $6e74,$0060,$0050,$0000
	dc.w $2400,$0100,$0060,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $2400,$0000,$ff80,$0010
	dc.w $6e72,$0140,$ff90,$0010
	dc.w $6ee8,$0140,$ffd0,$0010
	dc.w $2400,$0100,$fff0,$0010
	dc.w $6ee9,$0060,$0010,$0010
	dc.w $6ee8,$0060,$0020,$0010
	dc.w $6e73,$0060,$0050,$0010
	dc.w $6e72,$0060,$0060,$0010
	dc.w $2400,$0000,$0070,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0300,$ff40,$0020
	dc.w $6e71,$0040,$ff80,$0020
	dc.w $15a0,$0000,$ff90,$0020
	dc.w $6ee6,$0140,$ffc0,$0020
	dc.w $2400,$0300,$ffe0,$0020
	dc.w $6ee7,$0060,$0020,$0020
	dc.w $6ee6,$0060,$0030,$0020
	dc.w $15a0,$0020,$0060,$0020
	dc.w $6e71,$0060,$0070,$0020
	dc.w $2400,$0300,$0080,$0020
	dc.w $2400,$0100,$ff40,$0030
	dc.w $6e6e,$0140,$ff60,$0030
	dc.w $6e70,$0040,$ffb0,$0030
	dc.w $6ee5,$0040,$ffc0,$0030
	dc.w $2400,$0200,$ffd0,$0030
	dc.w $2400,$0200,$0000,$0030
	dc.w $6ee5,$0060,$0030,$0030
	dc.w $6e70,$0060,$0040,$0030
	dc.w $6e6f,$0060,$0080,$0030
	dc.w $6e6e,$0060,$0090,$0030
	dc.w $2400,$0100,$00a0,$0030
	dc.w $2400,$0000,$ff40,$0040
	dc.w $6e6a,$0140,$ff50,$0040
	dc.w $6e6c,$0140,$ffa0,$0040
	dc.w $2400,$0300,$ffc0,$0040
	dc.w $2400,$0300,$0000,$0040
	dc.w $6e6d,$0060,$0040,$0040
	dc.w $6e6c,$0060,$0050,$0040
	dc.w $6e6b,$0060,$0090,$0040
	dc.w $6e6a,$0060,$00a0,$0040
	dc.w $2400,$0000,$00b0,$0040
	dc.w $6e66,$0140,$ff40,$0050
	dc.w $6e68,$0140,$ff90,$0050
	dc.w $2400,$0200,$ffb0,$0050
	dc.w $2400,$0300,$ffe0,$0050
	dc.w $2400,$0200,$0020,$0050
	dc.w $6e69,$0060,$0050,$0050
	dc.w $6e68,$0060,$0060,$0050
	dc.w $6e67,$0060,$00a0,$0050
	dc.w $6e66,$0060,$00b0,$0050
	dc.w $6e62,$0040,$ff40,$0060
	dc.w $6e63,$0060,$ff50,$0060
	dc.w $6e63,$0060,$ff60,$0060
	dc.w $6e63,$0060,$ff70,$0060
	dc.w $6e64,$0140,$ff80,$0060
	dc.w $2400,$0300,$ffa0,$0060
	dc.w $2400,$0300,$ffe0,$0060
	dc.w $2400,$0300,$0020,$0060
	dc.w $6e65,$0060,$0060,$0060
	dc.w $6e64,$0060,$0070,$0060
	dc.w $6e63,$0060,$0080,$0060
	dc.w $6e63,$0060,$0090,$0060
	dc.w $6e63,$0060,$00a0,$0060
	dc.w $6e62,$0060,$00b0,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $738f,$0000,$ff50,$0018
	dc.w $7390,$0500,$ff60,$0018
	dc.w $732a,$0000,$ffc0,$0018
	dc.w $7396,$0300,$ffd0,$0018
	dc.w $7395,$0000,$0010,$0018
	dc.w $732a,$0000,$0020,$0018
	dc.w $739a,$0500,$0030,$0018
	dc.w $73a0,$0100,$0090,$0018
	dc.w $73a2,$0600,$ff50,$0028
	dc.w $001e,$0000,$ffc0,$0028
	dc.w $73a9,$0400,$ffd0,$0028
	dc.w $001e,$0000,$0020,$0028
	dc.w $73ae,$0100,$0030,$0028
	dc.w $73b0,$0500,$0050,$0028
	dc.w $73b6,$0600,$ff50,$0038
	dc.w $734e,$0000,$ffc0,$0038
	dc.w $73bd,$0200,$ffd0,$0038
	dc.w $73c0,$0100,$0000,$0038
	dc.w $734e,$0000,$0020,$0038
	dc.w $73c2,$0700,$0030,$0038

loc_09e9ca:
	dc.w $0008,$01d5,$00c7
	dc.w $2400,$0300,$ff40,$ff90
	dc.w $2400,$0300,$ff80,$ff90
	dc.w $2400,$0200,$ffc0,$ff90
	dc.w $7104,$0040,$fff0,$ff90
	dc.w $7104,$0060,$0000,$ff90
	dc.w $2400,$0200,$0010,$ff90
	dc.w $2400,$0300,$0040,$ff90
	dc.w $2400,$0300,$0080,$ff90
	dc.w $2400,$0300,$ff40,$ffa0
	dc.w $2400,$0300,$ff80,$ffa0
	dc.w $2400,$0100,$ffc0,$ffa0
	dc.w $7101,$0040,$ffe0,$ffa0
	dc.w $0080,$0000,$fff0,$ffa0
	dc.w $0080,$0020,$0000,$ffa0
	dc.w $7101,$0060,$0010,$ffa0
	dc.w $2400,$0100,$0020,$ffa0
	dc.w $2400,$0300,$0040,$ffa0
	dc.w $2400,$0300,$0080,$ffa0
	dc.w $2400,$0300,$ff40,$ffb0
	dc.w $2400,$0300,$ff80,$ffb0
	dc.w $2400,$0000,$ffc0,$ffb0
	dc.w $70fe,$0140,$ffd0,$ffb0
	dc.w $70ff,$0060,$0010,$ffb0
	dc.w $70fe,$0060,$0020,$ffb0
	dc.w $2400,$0000,$0030,$ffb0
	dc.w $2400,$0300,$0040,$ffb0
	dc.w $2400,$0300,$0080,$ffb0
	dc.w $2400,$0300,$ff40,$ffc0
	dc.w $2400,$0300,$ff80,$ffc0
	dc.w $70fb,$0140,$ffc0,$ffc0
	dc.w $70fc,$0060,$0020,$ffc0
	dc.w $70fb,$0060,$0030,$ffc0
	dc.w $2400,$0300,$0040,$ffc0
	dc.w $2400,$0300,$0080,$ffc0
	dc.w $2400,$0300,$ff40,$ffd0
	dc.w $2400,$0200,$ff80,$ffd0
	dc.w $710b,$0040,$ffb0,$ffd0
	dc.w $717b,$0040,$ffc0,$ffd0
	dc.w $717b,$0060,$0030,$ffd0
	dc.w $710b,$0060,$0040,$ffd0
	dc.w $2400,$0200,$0050,$ffd0
	dc.w $2400,$0300,$0080,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $2400,$0100,$ff80,$ffe0
	dc.w $7109,$0140,$ffa0,$ffe0
	dc.w $717a,$0040,$fff0,$ffe0
	dc.w $717a,$0060,$0000,$ffe0
	dc.w $710a,$0060,$0040,$ffe0
	dc.w $7109,$0060,$0050,$ffe0
	dc.w $2400,$0100,$0060,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $2400,$0000,$ff80,$fff0
	dc.w $6e6a,$0040,$ff90,$fff0
	dc.w $7108,$0040,$ffa0,$fff0
	dc.w $7179,$0040,$ffe0,$fff0
	dc.w $6e65,$0040,$fff0,$fff0
	dc.w $6e65,$0060,$0000,$fff0
	dc.w $7179,$0060,$0010,$fff0
	dc.w $7108,$0060,$0050,$fff0
	dc.w $6e6a,$0060,$0060,$fff0
	dc.w $2400,$0000,$0070,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $6e6e,$0040,$ff80,$0000
	dc.w $7107,$0040,$ff90,$0000
	dc.w $7177,$0140,$ffd0,$0000
	dc.w $2400,$0100,$fff0,$0000
	dc.w $7178,$0060,$0010,$0000
	dc.w $7177,$0060,$0020,$0000
	dc.w $7107,$0060,$0060,$0000
	dc.w $6e6e,$0060,$0070,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $7106,$0040,$ff80,$0010
	dc.w $7175,$0140,$ffc0,$0010
	dc.w $2400,$0300,$ffe0,$0010
	dc.w $7176,$0060,$0020,$0010
	dc.w $7175,$0060,$0030,$0010
	dc.w $7106,$0060,$0070,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0200,$ff40,$0020
	dc.w $7104,$0040,$ff70,$0020
	dc.w $7105,$0040,$ffb0,$0020
	dc.w $7174,$0040,$ffc0,$0020
	dc.w $2400,$0200,$ffd0,$0020
	dc.w $2400,$0200,$0000,$0020
	dc.w $7174,$0060,$0030,$0020
	dc.w $7105,$0060,$0040,$0020
	dc.w $7104,$0060,$0080,$0020
	dc.w $2400,$0200,$0090,$0020
	dc.w $2400,$0100,$ff40,$0030
	dc.w $7101,$0040,$ff60,$0030
	dc.w $0080,$0000,$ff70,$0030
	dc.w $7102,$0140,$ffa0,$0030
	dc.w $2400,$0300,$ffc0,$0030
	dc.w $2400,$0300,$0000,$0030
	dc.w $7103,$0060,$0040,$0030
	dc.w $7102,$0060,$0050,$0030
	dc.w $0080,$0020,$0080,$0030
	dc.w $7101,$0060,$0090,$0030
	dc.w $2400,$0100,$00a0,$0030
	dc.w $2400,$0000,$ff40,$0040
	dc.w $70fe,$0140,$ff50,$0040
	dc.w $70ff,$0060,$0090,$0040
	dc.w $70fe,$0060,$00a0,$0040
	dc.w $2400,$0000,$00b0,$0040
	dc.w $70fb,$0140,$ff40,$0050
	dc.w $0080,$0060,$ff80,$0050
	dc.w $70fd,$0040,$ff90,$0050
	dc.w $2400,$0300,$ffa0,$0050
	dc.w $2400,$0300,$ffe0,$0050
	dc.w $2400,$0300,$0020,$0050
	dc.w $70fd,$0060,$0060,$0050
	dc.w $0080,$0040,$0070,$0050
	dc.w $70fc,$0060,$00a0,$0050
	dc.w $70fb,$0060,$00b0,$0050
	dc.w $70f9,$0040,$ff40,$0060
	dc.w $6e63,$0060,$ff50,$0060
	dc.w $6e63,$0060,$ff60,$0060
	dc.w $6e63,$0060,$ff70,$0060
	dc.w $70fa,$0040,$ff80,$0060
	dc.w $2400,$0300,$ff90,$0060
	dc.w $2400,$0300,$ffd0,$0060
	dc.w $2400,$0300,$0010,$0060
	dc.w $2400,$0100,$0050,$0060
	dc.w $70fa,$0060,$0070,$0060
	dc.w $6e63,$0060,$0080,$0060
	dc.w $6e63,$0060,$0090,$0060
	dc.w $6e63,$0060,$00a0,$0060
	dc.w $70f9,$0060,$00b0,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $738f,$0000,$ff50,$0018
	dc.w $7390,$0500,$ff60,$0018
	dc.w $732a,$0000,$ffc0,$0018
	dc.w $7396,$0300,$ffd0,$0018
	dc.w $7395,$0000,$0010,$0018
	dc.w $732a,$0000,$0020,$0018
	dc.w $739a,$0500,$0030,$0018
	dc.w $73a0,$0100,$0090,$0018
	dc.w $73a2,$0600,$ff50,$0028
	dc.w $001e,$0000,$ffc0,$0028
	dc.w $73a9,$0400,$ffd0,$0028
	dc.w $001e,$0000,$0020,$0028
	dc.w $73ae,$0100,$0030,$0028
	dc.w $73b0,$0500,$0050,$0028
	dc.w $73b6,$0600,$ff50,$0038
	dc.w $734e,$0000,$ffc0,$0038
	dc.w $73bd,$0200,$ffd0,$0038
	dc.w $73c0,$0100,$0000,$0038
	dc.w $734e,$0000,$0020,$0038
	dc.w $73c2,$0700,$0030,$0038

loc_09f010:
	dc.w $0008,$01e3,$00ce
	dc.w $70f9,$0000,$ff40,$ff90
	dc.w $6e63,$0000,$ff50,$ff90
	dc.w $6e63,$0000,$ff60,$ff90
	dc.w $6e63,$0000,$ff70,$ff90
	dc.w $70fa,$0000,$ff80,$ff90
	dc.w $2400,$0300,$ff90,$ff90
	dc.w $2400,$0300,$ffd0,$ff90
	dc.w $2400,$0300,$0010,$ff90
	dc.w $2400,$0100,$0050,$ff90
	dc.w $70fa,$0020,$0070,$ff90
	dc.w $6e63,$0000,$0080,$ff90
	dc.w $6e63,$0000,$0090,$ff90
	dc.w $6e63,$0000,$00a0,$ff90
	dc.w $70f9,$0020,$00b0,$ff90
	dc.w $70fb,$0100,$ff40,$ffa0
	dc.w $0080,$0020,$ff80,$ffa0
	dc.w $70fd,$0000,$ff90,$ffa0
	dc.w $2400,$0300,$ffa0,$ffa0
	dc.w $2400,$0300,$ffe0,$ffa0
	dc.w $2400,$0300,$0020,$ffa0
	dc.w $70fd,$0020,$0060,$ffa0
	dc.w $0080,$0000,$0070,$ffa0
	dc.w $70fc,$0020,$00a0,$ffa0
	dc.w $70fb,$0020,$00b0,$ffa0
	dc.w $2400,$0000,$ff40,$ffb0
	dc.w $70fe,$0100,$ff50,$ffb0
	dc.w $70ff,$0060,$ff90,$ffb0
	dc.w $7100,$0000,$ffa0,$ffb0
	dc.w $2400,$0300,$ffb0,$ffb0
	dc.w $2400,$0300,$fff0,$ffb0
	dc.w $2400,$0100,$0030,$ffb0
	dc.w $7100,$0020,$0050,$ffb0
	dc.w $70ff,$0040,$0060,$ffb0
	dc.w $70ff,$0020,$0090,$ffb0
	dc.w $70fe,$0020,$00a0,$ffb0
	dc.w $2400,$0000,$00b0,$ffb0
	dc.w $2400,$0100,$ff40,$ffc0
	dc.w $7101,$0000,$ff60,$ffc0
	dc.w $0080,$0040,$ff70,$ffc0
	dc.w $7102,$0100,$ffa0,$ffc0
	dc.w $2400,$0300,$ffc0,$ffc0
	dc.w $2400,$0300,$0000,$ffc0
	dc.w $7103,$0020,$0040,$ffc0
	dc.w $7102,$0020,$0050,$ffc0
	dc.w $0080,$0060,$0080,$ffc0
	dc.w $7101,$0020,$0090,$ffc0
	dc.w $2400,$0100,$00a0,$ffc0
	dc.w $2400,$0200,$ff40,$ffd0
	dc.w $7104,$0000,$ff70,$ffd0
	dc.w $7105,$0000,$ffb0,$ffd0
	dc.w $7174,$0000,$ffc0,$ffd0
	dc.w $2400,$0200,$ffd0,$ffd0
	dc.w $2400,$0200,$0000,$ffd0
	dc.w $7174,$0020,$0030,$ffd0
	dc.w $7105,$0020,$0040,$ffd0
	dc.w $7104,$0020,$0080,$ffd0
	dc.w $2400,$0200,$0090,$ffd0
	dc.w $2400,$0300,$ff40,$ffe0
	dc.w $7106,$0000,$ff80,$ffe0
	dc.w $7175,$0100,$ffc0,$ffe0
	dc.w $2400,$0300,$ffe0,$ffe0
	dc.w $7176,$0020,$0020,$ffe0
	dc.w $7175,$0020,$0030,$ffe0
	dc.w $7106,$0020,$0070,$ffe0
	dc.w $2400,$0300,$0080,$ffe0
	dc.w $2400,$0300,$ff40,$fff0
	dc.w $6e6e,$0000,$ff80,$fff0
	dc.w $7107,$0000,$ff90,$fff0
	dc.w $7177,$0100,$ffd0,$fff0
	dc.w $2400,$0100,$fff0,$fff0
	dc.w $7178,$0020,$0010,$fff0
	dc.w $7177,$0020,$0020,$fff0
	dc.w $7107,$0020,$0060,$fff0
	dc.w $6e6e,$0020,$0070,$fff0
	dc.w $2400,$0300,$0080,$fff0
	dc.w $2400,$0300,$ff40,$0000
	dc.w $2400,$0000,$ff80,$0000
	dc.w $6e6a,$0000,$ff90,$0000
	dc.w $7108,$0000,$ffa0,$0000
	dc.w $7179,$0000,$ffe0,$0000
	dc.w $6e65,$0000,$fff0,$0000
	dc.w $6e65,$0020,$0000,$0000
	dc.w $7179,$0020,$0010,$0000
	dc.w $7108,$0020,$0050,$0000
	dc.w $6e6a,$0020,$0060,$0000
	dc.w $2400,$0000,$0070,$0000
	dc.w $2400,$0300,$0080,$0000
	dc.w $2400,$0300,$ff40,$0010
	dc.w $2400,$0100,$ff80,$0010
	dc.w $7109,$0100,$ffa0,$0010
	dc.w $717a,$0000,$fff0,$0010
	dc.w $717a,$0020,$0000,$0010
	dc.w $710a,$0020,$0040,$0010
	dc.w $7109,$0020,$0050,$0010
	dc.w $2400,$0100,$0060,$0010
	dc.w $2400,$0300,$0080,$0010
	dc.w $2400,$0300,$ff40,$0020
	dc.w $2400,$0200,$ff80,$0020
	dc.w $710b,$0000,$ffb0,$0020
	dc.w $717b,$0000,$ffc0,$0020
	dc.w $717b,$0020,$0030,$0020
	dc.w $710b,$0020,$0040,$0020
	dc.w $2400,$0200,$0050,$0020
	dc.w $2400,$0300,$0080,$0020
	dc.w $2400,$0300,$ff40,$0030
	dc.w $2400,$0300,$ff80,$0030
	dc.w $70fb,$0100,$ffc0,$0030
	dc.w $70fc,$0020,$0020,$0030
	dc.w $70fb,$0020,$0030,$0030
	dc.w $2400,$0300,$0040,$0030
	dc.w $2400,$0300,$0080,$0030
	dc.w $2400,$0300,$ff40,$0040
	dc.w $2400,$0300,$ff80,$0040
	dc.w $2400,$0000,$ffc0,$0040
	dc.w $70fe,$0100,$ffd0,$0040
	dc.w $70ff,$0020,$0010,$0040
	dc.w $70fe,$0020,$0020,$0040
	dc.w $2400,$0000,$0030,$0040
	dc.w $2400,$0300,$0040,$0040
	dc.w $2400,$0300,$0080,$0040
	dc.w $2400,$0300,$ff40,$0050
	dc.w $2400,$0300,$ff80,$0050
	dc.w $2400,$0100,$ffc0,$0050
	dc.w $7101,$0000,$ffe0,$0050
	dc.w $0080,$0040,$fff0,$0050
	dc.w $0080,$0060,$0000,$0050
	dc.w $7101,$0020,$0010,$0050
	dc.w $2400,$0100,$0020,$0050
	dc.w $2400,$0300,$0040,$0050
	dc.w $2400,$0300,$0080,$0050
	dc.w $2400,$0300,$ff40,$0060
	dc.w $2400,$0300,$ff80,$0060
	dc.w $2400,$0200,$ffc0,$0060
	dc.w $7104,$0000,$fff0,$0060
	dc.w $7104,$0020,$0000,$0060
	dc.w $2400,$0200,$0010,$0060
	dc.w $2400,$0300,$0040,$0060
	dc.w $2400,$0300,$0080,$0060
	dc.w $725c,$0300,$ff50,$ffb8
	dc.w $7260,$0000,$ff90,$ffb8
	dc.w $725d,$0000,$ffa0,$ffb8
	dc.w $7260,$0020,$ffb0,$ffb8
	dc.w $7261,$0700,$ffc0,$ffb8
	dc.w $725d,$0000,$0040,$ffb8
	dc.w $7269,$0200,$0050,$ffb8
	dc.w $725d,$0000,$0080,$ffb8
	dc.w $726c,$0100,$0090,$ffb8
	dc.w $726e,$0100,$ff50,$ffc8
	dc.w $7270,$0200,$ff70,$ffc8
	dc.w $0014,$0000,$ffa0,$ffc8
	dc.w $7272,$0060,$ffb0,$ffc8
	dc.w $7273,$0700,$ffc0,$ffc8
	dc.w $0014,$0000,$0040,$ffc8
	dc.w $727b,$0200,$0050,$ffc8
	dc.w $0014,$0000,$0080,$ffc8
	dc.w $727e,$0000,$0090,$ffc8
	dc.w $727f,$0000,$ff50,$ffd8
	dc.w $7280,$0000,$ff60,$ffd8
	dc.w $7280,$0200,$ff70,$ffd8
	dc.w $7280,$0000,$ffa0,$ffd8
	dc.w $7282,$0020,$ffb0,$ffd8
	dc.w $7283,$0400,$ffc0,$ffd8
	dc.w $7286,$0000,$0010,$ffd8
	dc.w $7288,$0100,$0020,$ffd8
	dc.w $7280,$0000,$0040,$ffd8
	dc.w $7280,$0000,$0050,$ffd8
	dc.w $728a,$0000,$0060,$ffd8
	dc.w $0293,$0020,$0070,$ffd8
	dc.w $7280,$0000,$0080,$ffd8
	dc.w $728b,$0000,$0090,$ffd8
	dc.w $72b8,$0000,$ff40,$ffe8
	dc.w $7266,$0100,$ff50,$ffe8
	dc.w $72b9,$0600,$ff70,$ffe8
	dc.w $72c0,$0900,$ffe0,$ffe8
	dc.w $725d,$0000,$0080,$ffe8
	dc.w $72ca,$0200,$0090,$ffe8
	dc.w $72cd,$0200,$ff40,$fff8
	dc.w $72d0,$0f00,$ff70,$fff8
	dc.w $72e0,$0400,$0070,$fff8
	dc.w $72e5,$0100,$ff40,$0008
	dc.w $72e7,$0800,$ff70,$0008
	dc.w $72f0,$0000,$0000,$0008
	dc.w $72ee,$0020,$0010,$0008
	dc.w $72ed,$0000,$0020,$0008
	dc.w $72f1,$0600,$0030,$0008
	dc.w $72e6,$0020,$00a0,$0008
	dc.w $7283,$0020,$00b0,$0008
	dc.w $738f,$0000,$ff50,$0018
	dc.w $7390,$0500,$ff60,$0018
	dc.w $732a,$0000,$ffc0,$0018
	dc.w $7396,$0300,$ffd0,$0018
	dc.w $7395,$0000,$0010,$0018
	dc.w $732a,$0000,$0020,$0018
	dc.w $739a,$0500,$0030,$0018
	dc.w $73a0,$0100,$0090,$0018
	dc.w $73a2,$0600,$ff50,$0028
	dc.w $001e,$0000,$ffc0,$0028
	dc.w $73a9,$0400,$ffd0,$0028
	dc.w $001e,$0000,$0020,$0028
	dc.w $73ae,$0100,$0030,$0028
	dc.w $73b0,$0500,$0050,$0028
	dc.w $73b6,$0600,$ff50,$0038
	dc.w $734e,$0000,$ffc0,$0038
	dc.w $73bd,$0200,$ffd0,$0038
	dc.w $73c0,$0100,$0000,$0038
	dc.w $734e,$0000,$0020,$0038
	dc.w $73c2,$0700,$0030,$0038

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09f68e:
	dc.w $0008,$001c,$0006
	dc.w $2a90,$0301,$ffc0,$fff7
	dc.w $2a90,$0301,$0000,$fff7
	dc.w $2a90,$0301,$0040,$fff7
	dc.w $2a90,$0301,$0080,$fff7
	dc.w $2a90,$0301,$00c0,$fff7
	dc.w $2a90,$0301,$0100,$fff7
	dc.w $2a90,$0301,$0140,$fff7

loc_09f6cc:
	dc.w $0008,$001c,$0006
	dc.w $2a80,$0301,$ffc0,$fff7
	dc.w $2a80,$0301,$0000,$fff7
	dc.w $2a80,$0301,$0040,$fff7
	dc.w $2a80,$0301,$0080,$fff7
	dc.w $2a80,$0301,$00c0,$fff7
	dc.w $2a80,$0301,$0100,$fff7
	dc.w $2a80,$0301,$0140,$fff7

loc_09f70a:
	dc.w $0008,$001e,$0005
	dc.w $2a94,$0401,$ffa8,$fff7
	dc.w $2a94,$0401,$0000,$fff7
	dc.w $2a94,$0401,$0058,$fff7
	dc.w $2a94,$0401,$00b0,$fff7
	dc.w $2a94,$0401,$0108,$fff7
	dc.w $2a94,$0401,$0160,$fff7

loc_09f740:
	dc.w $0008,$001e,$0005
	dc.w $2a54,$0401,$ffb0,$fff7
	dc.w $2a54,$0401,$0000,$fff7
	dc.w $2a54,$0401,$0050,$fff7
	dc.w $2a54,$0401,$00a0,$fff7
	dc.w $2a54,$0401,$00f0,$fff7
	dc.w $2a54,$0401,$0140,$fff7

loc_09f776:
	dc.w $0008,$001e,$0004
	dc.w $2ab0,$0501,$ff94,$fff7
	dc.w $2ab0,$0501,$0000,$fff7
	dc.w $2ab0,$0501,$006c,$fff7
	dc.w $2ab0,$0501,$00d8,$fff7
	dc.w $2ab0,$0501,$0144,$fff7

loc_09f7a4:
	dc.w $0008,$001e,$0005
	dc.w $2a84,$0401,$ffb0,$fff7
	dc.w $2a84,$0401,$0000,$fff7
	dc.w $2a84,$0401,$0050,$fff7
	dc.w $2a84,$0401,$00a0,$fff7
	dc.w $2a84,$0401,$00f0,$fff7
	dc.w $2a84,$0401,$0140,$fff7

loc_09f7da:
	dc.w $0008,$001e,$0004
	dc.w $2a10,$0501,$ff98,$fff7
	dc.w $2a10,$0501,$0000,$fff7
	dc.w $2a10,$0501,$0068,$fff7
	dc.w $2a10,$0501,$00d0,$fff7
	dc.w $2a10,$0501,$0138,$fff7

loc_09f808:
	dc.w $0008,$001c,$0006
	dc.w $2a70,$0301,$ffc0,$fff7
	dc.w $2a70,$0301,$0000,$fff7
	dc.w $2a70,$0301,$0040,$fff7
	dc.w $2a70,$0301,$0080,$fff7
	dc.w $2a70,$0301,$00c0,$fff7
	dc.w $2a70,$0301,$0100,$fff7
	dc.w $2a70,$0301,$0140,$fff7

loc_09f846:
	dc.w $0008,$001e,$0005
	dc.w $2a74,$0401,$ffa4,$fff7
	dc.w $2a74,$0401,$0000,$fff7
	dc.w $2a74,$0401,$005c,$fff7
	dc.w $2a74,$0401,$00b8,$fff7
	dc.w $2a74,$0401,$0114,$fff7
	dc.w $2a74,$0401,$0170,$fff7

loc_09f87c:
	dc.w $0008,$001e,$0005
	dc.w $2a60,$0401,$ffb0,$fff7
	dc.w $2a60,$0401,$0000,$fff7
	dc.w $2a60,$0401,$0050,$fff7
	dc.w $2a60,$0401,$00a0,$fff7
	dc.w $2a60,$0401,$00f0,$fff7
	dc.w $2a60,$0401,$0140,$fff7

loc_09f8b2:
	dc.w $0008,$001e,$0005
	dc.w $2a44,$0401,$ffb0,$fff7
	dc.w $2a44,$0401,$0000,$fff7
	dc.w $2a44,$0401,$0050,$fff7
	dc.w $2a44,$0401,$00a0,$fff7
	dc.w $2a44,$0401,$00f0,$fff7
	dc.w $2a44,$0401,$0140,$fff7

loc_09f8e8:
	dc.w $0008,$001e,$0004
	dc.w $2a6a,$0501,$ff9c,$fff7
	dc.w $2a6a,$0501,$0000,$fff7
	dc.w $2a6a,$0501,$0064,$fff7
	dc.w $2a6a,$0501,$00c8,$fff7
	dc.w $2a6a,$0501,$012c,$fff7

loc_09f916:
	dc.w $0008,$001c,$0006
	dc.w $2a50,$0301,$ffc0,$fff7
	dc.w $2a50,$0301,$0000,$fff7
	dc.w $2a50,$0301,$0040,$fff7
	dc.w $2a50,$0301,$0080,$fff7
	dc.w $2a50,$0301,$00c0,$fff7
	dc.w $2a50,$0301,$0100,$fff7
	dc.w $2a50,$0301,$0140,$fff7

loc_09f954:
	dc.w $0008,$0023,$0004
	dc.w $2a99,$0601,$ff8c,$fff7
	dc.w $2a99,$0601,$0000,$fff7
	dc.w $2a99,$0601,$0074,$fff7
	dc.w $2a99,$0601,$00e8,$fff7
	dc.w $2a99,$0601,$015c,$fff7

loc_09f982:
	dc.w $0008,$0023,$0004
	dc.w $2a89,$0601,$ff84,$fff7
	dc.w $2a89,$0601,$0000,$fff7
	dc.w $2a89,$0601,$007c,$fff7
	dc.w $2a89,$0601,$00f8,$fff7
	dc.w $2a89,$0601,$0174,$fff7

loc_09f9b0:
	dc.w $0008,$0023,$0004
	dc.w $2a79,$0601,$ff84,$fff7
	dc.w $2a79,$0601,$0000,$fff7
	dc.w $2a79,$0601,$007c,$fff7
	dc.w $2a79,$0601,$00f8,$fff7
	dc.w $2a79,$0601,$0174,$fff7

loc_09f9de:
	dc.w $0008,$0023,$0004
	dc.w $2a49,$0601,$ff84,$fff7
	dc.w $2a49,$0601,$0000,$fff7
	dc.w $2a49,$0601,$007c,$fff7
	dc.w $2a49,$0601,$00f8,$fff7
	dc.w $2a49,$0601,$0174,$fff7

loc_09fa0c:
	dc.w $0008,$001c,$0006
	dc.w $2a40,$0301,$ffc0,$fff7
	dc.w $2a40,$0301,$0000,$fff7
	dc.w $2a40,$0301,$0040,$fff7
	dc.w $2a40,$0301,$0080,$fff7
	dc.w $2a40,$0301,$00c0,$fff7
	dc.w $2a40,$0301,$0100,$fff7
	dc.w $2a40,$0301,$0140,$fff7

loc_09fa4a:
	dc.w $0008,$0023,$0004
	dc.w $2a37,$0601,$ff8c,$fff7
	dc.w $2a37,$0601,$0000,$fff7
	dc.w $2a37,$0601,$0074,$fff7
	dc.w $2a37,$0601,$00e8,$fff7
	dc.w $2a37,$0601,$015c,$fff7

loc_09fa78:
	dc.w $0008,$001e,$0004
	dc.w $2a59,$0501,$ffa0,$fff7
	dc.w $2a59,$0501,$0000,$fff7
	dc.w $2a59,$0501,$0060,$fff7
	dc.w $2a59,$0501,$00c0,$fff7
	dc.w $2a59,$0501,$0120,$fff7

loc_09faa6:
	dc.w $0008,$0023,$0004
	dc.w $2a16,$0601,$ff84,$fff7
	dc.w $2a16,$0601,$0000,$fff7
	dc.w $2a16,$0601,$007c,$fff7
	dc.w $2a16,$0601,$00f8,$fff7
	dc.w $2a16,$0601,$0174,$fff7

loc_09fad4:
	dc.w $0008,$0023,$0004
	dc.w $2a27,$0601,$ff90,$fff7
	dc.w $2a27,$0601,$0000,$fff7
	dc.w $2a27,$0601,$0070,$fff7
	dc.w $2a27,$0601,$00e0,$fff7
	dc.w $2a27,$0601,$0150,$fff7

loc_09fb02:
	dc.w $0008,$001e,$0005
	dc.w $2aab,$0401,$ffa4,$fff7
	dc.w $2aab,$0401,$0000,$fff7
	dc.w $2aab,$0401,$005c,$fff7
	dc.w $2aab,$0401,$00b8,$fff7
	dc.w $2aab,$0401,$0114,$fff7
	dc.w $2aab,$0401,$0170,$fff7

loc_09fb38:
	dc.w $0008,$001e,$0005
	dc.w $2a65,$0401,$ffac,$fff7
	dc.w $2a65,$0401,$0000,$fff7
	dc.w $2a65,$0401,$0054,$fff7
	dc.w $2a65,$0401,$00a8,$fff7
	dc.w $2a65,$0401,$00fc,$fff7
	dc.w $2a65,$0401,$0150,$fff7

loc_09fb6e:
	dc.w $0008,$0023,$0004
	dc.w $2a20,$0601,$ff8c,$fff7
	dc.w $2a20,$0601,$0000,$fff7
	dc.w $2a20,$0601,$0074,$fff7
	dc.w $2a20,$0601,$00e8,$fff7
	dc.w $2a20,$0601,$015c,$fff7

loc_09fb9c:
	dc.w $0008,$001e,$0005
	dc.w $2aa6,$0401,$ffa8,$fff7
	dc.w $2aa6,$0401,$0000,$fff7
	dc.w $2aa6,$0401,$0058,$fff7
	dc.w $2aa6,$0401,$00b0,$fff7
	dc.w $2aa6,$0401,$0108,$fff7
	dc.w $2aa6,$0401,$0160,$fff7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09fbd2:
	dc.w $0008,$001e,$0004
	dc.w $2aa0,$0501,$ff9c,$fff7
	dc.w $2aa0,$0501,$0000,$fff7
	dc.w $2aa0,$0501,$0064,$fff7
	dc.w $2aa0,$0501,$00c8,$fff7
	dc.w $2aa0,$0501,$012c,$fff7

loc_09fc00:
	dc.w $0008,$0023,$0004
	dc.w $2a30,$0601,$ff88,$fff7
	dc.w $2a30,$0601,$0000,$fff7
	dc.w $2a30,$0601,$0078,$fff7
	dc.w $2a30,$0601,$00f0,$fff7
	dc.w $2a30,$0601,$0168,$fff7

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_09fc2e:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $2a90,$0300

loc_09fc3c:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $2a80,$0300

loc_09fc4a:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a94,$0400

loc_09fc58:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a54,$0400

loc_09fc66:
	dc.w $000c,$0006,$0000
	dc.l loc_0a0198
	dc.w $2ab0,$0500

loc_09fc74:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a84,$0400

loc_09fc82:
	dc.w $000c,$0006,$0000
	dc.l loc_0a0198
	dc.w $2a10,$0500

loc_09fc90:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $2a70,$0300

loc_09fc9e:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a74,$0400

loc_09fcac:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a60,$0400

loc_09fcba:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a44,$0400

loc_09fcc8:
	dc.w $000c,$0006,$0000
	dc.l loc_0a0198
	dc.w $2a6a,$0500

loc_09fcd6:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $2a50,$0300

loc_09fce4:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a99,$0600

loc_09fcf2:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a89,$0600

loc_09fd00:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a79,$0600

loc_09fd0e:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a49,$0600

loc_09fd1c:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $2a40,$0300

loc_09fd2a:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a37,$0600

loc_09fd38:
	dc.w $000c,$0006,$0000
	dc.l loc_0a0198
	dc.w $2a59,$0500

loc_09fd46:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a16,$0600

loc_09fd54:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a27,$0600

loc_09fd62:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2aab,$0400

loc_09fd70:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2a65,$0400

loc_09fd7e:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a20,$0600

loc_09fd8c:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $2aa6,$0400

loc_09fd9a:
	dc.w $000c,$0006,$0000
	dc.l loc_0a0198
	dc.w $2aa0,$0500

loc_09fda8:
	dc.w $000c,$0007,$0000
	dc.l loc_0a019c
	dc.w $2a30,$0600

loc_09fdb6:
	dc.w $000c,$0002,$0000
	dc.l loc_0a01a0
	dc.w $0696,$0100

loc_09fdc4:
	dc.w $000c,$0002,$0000
	dc.l loc_0a01a0
	dc.w $0698,$0100

loc_09fdd2:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $069a,$0200

loc_09fde0:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $069d,$0200

loc_09fdee:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06a0,$0300

loc_09fdfc:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $06a4,$0200

loc_09fe0a:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06a7,$0300

loc_09fe18:
	dc.w $000c,$0002,$0000
	dc.l loc_0a01a0
	dc.w $06ab,$0100

loc_09fe26:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06b0,$0300

loc_09fe34:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $06ad,$0200

loc_09fe42:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $06b4,$0200

loc_09fe50:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06b7,$0300

loc_09fe5e:
	dc.w $000c,$0002,$0000
	dc.l loc_0a01a0
	dc.w $06e4,$0100

loc_09fe6c:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06bb,$0300

loc_09fe7a:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $06c1,$0400

loc_09fe88:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $06c6,$0400

loc_09fe96:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $06cb,$0400

loc_09fea4:
	dc.w $000c,$0002,$0000
	dc.l loc_0a01a0
	dc.w $06d0,$0100

loc_09feb2:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06f0,$0300

loc_09fec0:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06d2,$0300

loc_09fece:
	dc.w $000c,$0005,$0000
	dc.l loc_0a0194
	dc.w $06d6,$0400

loc_09fedc:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06db,$0300

loc_09feea:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06e0,$0300

loc_09fef8:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $06ed,$0200

loc_09ff06:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06e6,$0300

loc_09ff14:
	dc.w $000c,$0003,$0000
	dc.l loc_0a01a4
	dc.w $06ea,$0200

loc_09ff22:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06f8,$0300

loc_09ff30:
	dc.w $000c,$0004,$0000
	dc.l loc_0a0190
	dc.w $06f4,$0300

loc_09ff3e:
	dc.w $0008,$001c,$0001
	dc.w $0660,$0f00,$ff20,$fff8
	dc.w $0670,$0b00,$0020,$fff8

loc_09ff54:
	dc.w $0008,$001d,$0002
	dc.w $0660,$0f00,$ff18,$fff8
	dc.w $0670,$0200,$0018,$fff8
	dc.w $0653,$0900,$0048,$fff8

loc_09ff72:
	dc.w $0008,$0018,$0001
	dc.w $05c7,$1800,$ffa0,$fff0
	dc.w $05e0,$1200,$0030,$fff0

loc_09ff88:
	dc.w $0008,$001a,$0000
	dc.w $05e3,$1c00,$ff98,$fff0

loc_09ff96:
	dc.w $0008,$002e,$0001
	dc.w $0562,$1d00,$ff48,$fff0
	dc.w $0580,$1800,$0028,$fff0

loc_09ffac:
	dc.w $0008,$001c,$0001
	dc.w $0589,$1600,$ff90,$fff0
	dc.w $05a0,$1600,$0000,$fff0

loc_09ffc2:
	dc.w $0008,$0020,$0001
	dc.w $05a7,$1800,$ff80,$fff0
	dc.w $05c0,$1600,$0010,$fff0

loc_09ffd8:
	dc.w $0008,$000e,$0001
	dc.w $0b30,$0500,$ff88,$fff8
	dc.w $0b60,$0700,$fff8,$fff8

loc_09ffee:
	dc.w $0008,$000f,$0000
	dc.w $0b70,$0e00,$ff88,$fff8

loc_09fffc:
	dc.w $0008,$000a,$0000
	dc.w $0680,$0900,$ffb0,$fff8


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a000a:
	dc.w $0012

loc_0a000c:
	dc.w $fff7,$fff0,$fff7,$ffd0
	dc.w $fff7,$ffb0,$fff7,$ff90
	dc.w $fff7,$ff70,$fff7,$ff50
	dc.w $fff7,$ff30,$fff7,$ff10

loc_0a002c:
	dc.w $fff7,$fff0,$fff7,$ffc0
	dc.w $fff7,$ff90,$fff7,$ff60
	dc.w $fff7,$ff30,$fff7,$ff00

loc_0a0044:
	dc.w $fff7,$fff0,$fff7,$ffb0
	dc.w $fff7,$ff70,$fff7,$ff30
	dc.w $fff7,$fef0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0058:
	dc.w $fff7,$fff0,$0007,$fff0
	dc.w $fff7,$ffe0,$0007,$ffe0
	dc.w $fff7,$ffd0,$0007,$ffd0
	dc.w $fff7,$ffc0,$0007,$ffc0
	dc.w $fff7,$ffb0,$0007,$ffb0
	dc.w $fff7,$ffa0,$0007,$ffa0
	dc.w $fff7,$ff90,$0007,$ff90
	dc.w $fff7,$ff80,$0007,$ff80
	dc.w $fff7,$ff70,$0007,$ff70
	dc.w $fff7,$ff60,$0007,$ff60
	dc.w $fff7,$ff50,$0007,$ff50
	dc.w $fff7,$ff40,$0007,$ff40
	dc.w $fff7,$ff30,$0007,$ff30
	dc.w $fff7,$ff20,$0007,$ff20
	dc.w $fff7,$ff10,$0007,$ff10

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a00d0:
	dc.w $0000,$ff90,$0000,$ffc0
	dc.w $0000,$0000,$0000,$0040
	dc.w $0040,$ff90,$0040,$ffc0
	dc.w $0040,$0000,$0040,$0040
	dc.w $0080,$ff90,$0080,$ffc0
	dc.w $0080,$0000,$0080,$0040
	dc.w $00c0,$ff90,$00c0,$ffc0
	dc.w $00c0,$0000,$00c0,$0040
	dc.w $0100,$ff90,$0100,$ffc0
	dc.w $0100,$0000,$0100,$0040
	dc.w $0140,$ff90,$0140,$ffc0
	dc.w $0140,$0000,$0140,$0040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0130:
	dc.w $ff40,$0000,$ff80,$0000
	dc.w $ffc0,$0000,$0000,$0000
	dc.w $0040,$0000,$0080,$0000
	dc.w $ff40,$0040,$ff80,$0040
	dc.w $ffc0,$0040,$0000,$0040
	dc.w $0040,$0040,$0080,$0040
	dc.w $ff40,$0080,$ff80,$0080
	dc.w $ffc0,$0080,$0000,$0080
	dc.w $0040,$0080,$0080,$0080
	dc.w $ff40,$00c0,$ff80,$00c0
	dc.w $ffc0,$00c0,$0000,$00c0
	dc.w $0040,$00c0,$0080,$00c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0a0190:
	dc.w $ffe0,$fff8

loc_0a0194:
	dc.w $ffd8,$fff8

loc_0a0198:
	dc.w $ffd0,$fff8

loc_0a019c:
	dc.w $ffc8,$fff8

loc_0a01a0:
	dc.w $fff0,$fff8

loc_0a01a4:
	dc.w $ffe8,$fff8

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a01a8:
	move.w ($40,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($10,a6)
	move.w ($48,a6),d0
	add.w ($40,a6),d0
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	sub.w ($4a,a6),d1
	beq.b loc_0a01ce
	eor.w d0,d1
	bmi.b loc_0a01d2

loc_0a01ce:
	moveq #1,d0
	rts

loc_0a01d2:
	moveq #0,d0
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_0a01d6:
	move.w ($44,a6),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,($14,a6)
	move.w ($4c,a6),d0
	add.w ($44,a6),d0
	move.w d0,($44,a6)
	move.w ($14,a6),d1
	sub.w ($4e,a6),d1
	beq.b loc_0a01fc
	eor.w d0,d1
	bmi.b loc_0a0200

loc_0a01fc:
	moveq #1,d0
	rts

loc_0a0200:
	moveq #0,d0
	rts
