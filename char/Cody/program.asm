;##############################################
;Winposes
;##############################################
loc_064f6a:
	tst.b ($105,a5)
	bne.b loc_064f8a
	move.b ($2c4,a6),d0
	move.w loc_064f7c(pc,d0.w),d1
	jmp loc_064f7c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064f7c:
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c
	dc.w loc_064fc6-loc_064f7c

;==============================================
;
;==============================================
loc_064f8a:
	move.b ($2c4,a6),d0
	move.w loc_064f96(pc,d0.w),d1
	jmp loc_064f96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064f96:
	dc.w loc_064fa4-loc_064f96
	dc.w loc_064fc6-loc_064f96
	dc.w loc_064fc6-loc_064f96
	dc.w loc_064fc6-loc_064f96
	dc.w loc_064fc6-loc_064f96
	dc.w loc_065026-loc_064f96
	dc.w loc_0650f8-loc_064f96

;----------------------------------------------
;
;----------------------------------------------
loc_064fa4:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_064fb6(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064fb6:
	dc.b $0a,$02,$02,$04,$02,$02,$0a,$02
	dc.b $02,$0a,$02,$0a,$0a,$02,$0a,$0c

;----------------------------------------------
;
;----------------------------------------------
loc_064fc6:
	move.b (7,a6),d0
	move.w loc_064fd2(pc,d0.w),d1
	jmp loc_064fd2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064fd2:
	dc.w loc_064fd8-loc_064fd2
	dc.w loc_064ff0-loc_064fd2
	dc.w loc_06500c-loc_064fd2

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_064fd8:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_064ff0:
	tst.b ($124,a5)
	bne.w loc_0674a2
	tst.b ($11c,a5)
	bne.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #$26,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06500c:
	tst.b ($3a,a6)
	beq.b loc_065020
	subq.b #1,($3a,a6)
	bne.b loc_065020
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_065020:
	jmp loc_02a7ea

;----------------------------------------------
;
;----------------------------------------------
loc_065026:
	move.b (7,a6),d0
	move.w loc_065032(pc,d0.w),d1
	jmp loc_065032(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065032:
	dc.w loc_06503c-loc_065032
	dc.w loc_065052-loc_065032
	dc.w loc_06506e-loc_065032
	dc.w loc_0650a8-loc_065032
	dc.w loc_0650d6-loc_065032

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06503c:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	st.b ($26f,a6)
	moveq #$23,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065052:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06506c
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_06506c:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06506e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_067488
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	eori.b #1,($b,a6)
	move.l #$40000,($40,a6)
	move.l #$4000,($48,a6)
	moveq #0,d1
	jsr loc_092ed2
	move.w a4,($4e,a6)
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0650a8:
	bsr.w loc_0674de
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$40,d0
	cmpi.w #$200,d0
	bls.b loc_0650d0
	addq.b #2,(7,a6)
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0650d0:
	jmp loc_02a7ea
 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0650d6:
	jsr loc_01bd5c
	move.w #$ffc0,d0
	tst.b ($b,a6)
	beq.b loc_0650ea
	move.w #$1c0,d0

loc_0650ea:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
;
;----------------------------------------------
loc_0650f8:
	move.b (7,a6),d0
	move.w loc_065104(pc,d0.w),d1
	jmp loc_065104(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065104:
	dc.w loc_06503c-loc_065104
	dc.w loc_065052-loc_065104
	dc.w loc_06506e-loc_065104
	dc.w loc_0650a8-loc_065104
	dc.w loc_065118-loc_065104
	dc.w loc_065150-loc_065104
	dc.w loc_06518e-loc_065104
	dc.w loc_0651a6-loc_065104

	dc.w loc_0651ea-loc_065104
	dc.w loc_0651fe-loc_065104

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065118:
	tst.w ($4e,a6)
	bne.w loc_067488
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	move.l #$c0000,($40,a6)
	move.l #0,($48,a6)
	tst.b ($b,a6)
	bne.b loc_065148
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_065148:
	moveq #1,d1
	jmp loc_092ed2

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065150:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	jsr loc_01bd5c
	move.w #$c0,d0
	sub.w ($10,a6),d0
	add.w ($10,a3),d0
	move.w ($40,a6),d1
	eor.w d0,d1
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	moveq #$a,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06518e:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	clr.b ($a,a6)
	moveq #$1f,d0
	jmp loc_02a710

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0651a6:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_0651d2
	tst.b ($a,a6)
	bne.b loc_0651d2
	st.b ($a,a6)
	move.w ($38,a6),($4e,a6)
	jsr loc_080b70
	move.w ($4e,a6),($38,a6)
	move.w #$9280,(sub_palram,a5)

loc_0651d2:
	tst.b ($32,a6)
	bpl.w loc_0651e4
	addq.b #2,(7,a6)
	move.b #1,($32,a6)

loc_0651e4:
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0651ea:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #$26,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0651fe:
	jmp loc_02a7ea

;##############################################
;Intro
;##############################################
loc_065204:
	move.b (7,a6),d0
	move.w loc_065210(pc,d0.w),d1
	jmp loc_065210(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065210:
	dc.w loc_065226-loc_065210
	dc.w loc_065252-loc_065210
	dc.w loc_06526a-loc_065210
	dc.w loc_0652ae-loc_065210
	dc.w loc_0652d2-loc_065210
	dc.w loc_0652fc-loc_065210
	dc.w loc_065318-loc_065210
	dc.w loc_065342-loc_065210

	dc.w loc_065360-loc_065210
	dc.w loc_065390-loc_065210
	dc.w loc_0653a4-loc_065210

;----------------------------------------------
loc_065226:
	movea.w ($38,a6),a4
	cmpi.b #7,($102,a4)
	bne.b loc_06524c
	tst.b ($125,a6)
	sne.b d0
	tst.b ($125,a4)
	sne.b d1
	eor.b d0,d1
	bpl.b loc_06524c
	move.b #4,(7,a6)
	bra.w loc_06526a

loc_06524c:
	move.b #2,(7,a6)

;----------------------------------------------
loc_065252:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_06526a:
	addq.b #2,(7,a6)
	move.l ($10,a6),($4c,a6)
	jsr loc_01bd5c
	moveq #-$30,d0
	tst.b ($101,a6)
	beq.b loc_065286
	move.w #$1b0,d0

loc_065286:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.l #$20000,($40,a6)
	move.l #0,($48,a6)
	clr.b ($a,a6)
	bsr.w loc_06753e
	moveq #$1f,d0
	jmp loc_02a710

;----------------------------------------------
loc_0652ae:
	bsr.w loc_06750c
	tst.b ($32,a6)
	bpl.b loc_0652be
	move.b #1,($32,a6)

loc_0652be:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #2,d0
	jmp loc_02a708

;----------------------------------------------
loc_0652d2:
	bsr.w loc_0674de
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$fff0,d0
	cmpi.w #$160,d0
	bhi.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #$40,d0
	jmp loc_02a708

;----------------------------------------------
loc_0652fc:
	bsr.w loc_06750c
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	clr.b ($3b,a6)
	moveq #2,d0
	jmp loc_02a708

;----------------------------------------------
loc_065318:
	bsr.w loc_0674de
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$ffc0,d0
	cmpi.w #$100,d0
	bhi.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #$40,d0
	jmp loc_02a708

;----------------------------------------------
loc_065342:
	bsr.w loc_06750c
	jsr loc_02a7ea
	tst.b ($35,a6)
	ble.w loc_067488
	addq.b #2,(7,a6)
	moveq #$41,d0
	jmp loc_02a708

;----------------------------------------------
loc_065360:
	jsr loc_02a7ea
	tst.b ($35,a6)
	ble.b loc_065376
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_065376:
	tst.b ($33,a6)
	bpl.w loc_067488
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	moveq #$a,d0
	jmp loc_02a708

;----------------------------------------------
loc_065390:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #2,d0
	jmp loc_02a708

;----------------------------------------------
loc_0653a4:
	bsr.w loc_0674de
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$ffa0,d0
	cmpi.w #$c0,d0
	bhi.w loc_0674a2
	move.l #$02000000,(4,a6)
	move.l ($4c,a6),($10,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_0653d8:
	tst.b ($80,a6)
	bne.w loc_06558e
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_06547c
	tst.b ($1e4,a6)
	bmi.w loc_065710
	move.b (7,a6),d0
	move.w loc_065400(pc,d0.w),d1
	jmp loc_065400(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065400:
	dc.w loc_06540a-loc_065400
	dc.w loc_065476-loc_065400

loc_065404:
	dc.w $0030,$0038,$0028

;----------------------------------------------
loc_06540a:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_065404(pc,d1.w),d1
	move.w ($21c,a6),d2
	tst.b ($82,a6)
	bne.b loc_065458
	addq.b #1,($2ac,a6)
	cmpi.b #5,($2ac,a6)
	bcs.b loc_065458
	clr.b ($2ac,a6)
	moveq #$20,d0

loc_065458:
	cmp.w d2,d1
	bcc.b loc_06545e
	addq.b #1,d0

loc_06545e:
	cmpi.b #2,($82,a6)
	bne.b loc_065470
	btst #1,($83,a6)
	beq.b loc_065470
	moveq #$1e,d0

loc_065470:
	jmp loc_02a710

;----------------------------------------------
loc_065476:
	jmp loc_02f5ac

;==============================================
;Kicks Start
;==============================================
loc_06547c:
	move.b ($82,a6),d0
	move.w loc_065488(pc,d0.w),d1
	jmp loc_065488(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065488:
	dc.w loc_06548e-loc_065488
	dc.w loc_06548e-loc_065488
	dc.w loc_06548e-loc_065488

;----------------------------------------------
loc_06548e:
	move.b (7,a6),d0
	move.w loc_06549a(pc,d0.w),d1
	jmp loc_06549a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06549a:
	dc.w loc_0654a4-loc_06549a
	dc.w loc_065532-loc_06549a
	dc.w loc_065538-loc_06549a
	dc.w loc_06554e-loc_06549a
	dc.w loc_065580-loc_06549a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0654a4:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_06552c(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_0654e0
	addq.b #1,d0

loc_0654e0:
	cmpi.b #4,($82,a6)
	bne.b loc_065526
	btst #1,($83,a6)
	beq.b loc_065526
	move.b #4,(7,a6)
	move.l #$fffca000,($40,a6)
	move.l #0,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_065524
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_065524:
	moveq #$1f,d0

loc_065526:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06552c:
	dc.w $0030,$0038,$0028

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065532:
	jmp loc_02f5ac

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065538:
	tst.b ($35,a6)
	bne.b loc_065548
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_065548:
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06554e:
	jsr loc_02aa08
	bcc.b loc_06557a
	addq.b #2,(7,a6)
	move.b #1,($32,a6)
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)

loc_06557a:
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_065580:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Crouching
;==============================================
loc_06558e:
	move.b #1,($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_0655a4
	tst.b ($1e4,a6)
	bmi.w loc_065710

loc_0655a4:
	move.b (7,a6),d0
	move.w loc_0655b0(pc,d0.w),d1
	jmp loc_0655b0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0655b0:
	dc.w loc_0655bc-loc_0655b0
	dc.w loc_06563e-loc_0655b0
	dc.w loc_065644-loc_0655b0
	dc.w loc_065696-loc_0655b0
	dc.w loc_0656cc-loc_0655b0
	dc.w loc_065702-loc_0655b0

;----------------------------------------------
loc_0655bc:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($81,a6)
	bne.b loc_0655ee
	tst.b ($125,a6)
	bne.b loc_0655e6
	jsr loc_02dfbe
	beq.b loc_0655ee

loc_0655e6:
	tst.b ($1e5,a6)
	bne.w loc_065624

loc_0655ee:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_065612
	cmpi.b #2,($82,a6)
	bne.b loc_065612
	move.b #6,(7,a6)

loc_065612:
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_06561c
	moveq #$f,d0

loc_06561c:
	add.b d1,d0
	jmp loc_02a710

loc_065624:
	moveq #2,d0
	jsr loc_02ef6c
	move.b #4,(7,a6)
	clr.b ($a9,a6)
	moveq #$22,d0
	jmp loc_02a710

;----------------------------------------------
loc_06563e:
	jmp loc_02f5ac

;----------------------------------------------
loc_065644:
	tst.b ($1e4,a6)
	bpl.b loc_065688
	tst.b ($125,a6)
	bne.b loc_065674
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.b loc_065674
	clr.b (7,a6)
	btst #2,($11b,a6)
	seq.b d0
	add.b d0,d0
	addq.b #2,d0
	move.b d0,($80,a6)
	jmp loc_02a7ea

loc_065674:
	tst.b ($35,a6)
	beq.b loc_065688
	clr.b ($35,a6)
	moveq #$11,d0
	moveq #$55,d1
	moveq #0,d2
	bsr.w loc_0657f4

loc_065688:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;----------------------------------------------
loc_065696:
	jsr loc_02f5ac
	tst.b ($35,a6)
	bne.b loc_0656ca
	addq.b #2,(7,a6)
	move.b #$c,($3a,a6)
	move.l #$70000,($40,a6)
	move.l #$ffff9000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_0656ca
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0656ca:
	rts

;----------------------------------------------
loc_0656cc:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_0656ec
	addq.b #2,(7,a6)
	move.b #1,($32,a6)

loc_0656ec:
	move.b ($b4,a5),d0
	andi.b #3,d0
	bne.b loc_0656fc
	jsr loc_085a74

loc_0656fc:
	jmp loc_02a7ea

;----------------------------------------------
loc_065702:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	jmp loc_02bb26

;==============================================
;Knife
;==============================================
loc_065710:
	move.b (7,a6),d0
	move.w loc_06571c(pc,d0.w),d1
	jmp loc_06571c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06571c:
	dc.w loc_065722-loc_06571c
	dc.w loc_065776-loc_06571c
	dc.w loc_065644-loc_06571c

;----------------------------------------------
loc_065722:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	clr.b ($2c8,a6)
	moveq #$23,d3
	moveq #3,d0
	moveq #$57,d1
	moveq #0,d2
	tst.b ($80,a6)
	beq.b loc_065764
	move.b #1,($2c8,a6)
	moveq #$26,d3
	moveq #$c,d0
	moveq #$3d,d1

loc_065764:
	bsr.w loc_0657f4
	move.b ($82,a6),d0
	lsr.b #1,d0
	add.b d3,d0
	jmp loc_02a710

;----------------------------------------------
loc_065776:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_06577c:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	bne.b loc_0657ae
	tst.b ($1e4,a6)
	bmi.b loc_0657d0

loc_0657ae:
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_0657b8
	moveq #$18,d0

loc_0657b8:
	tst.b ($81,a6)
	beq.b loc_0657c0
	addq.w #3,d0

loc_0657c0:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

loc_0657d0:
	moveq #0,d0
	moveq #$5f,d1
	moveq #8,d2
	bsr.w loc_0657f4
	moveq #$29,d0
	tst.b ($3c,a6)
	beq.b loc_0657e4
	moveq #$2c,d0

loc_0657e4:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

loc_0657f4:
	jsr loc_01c2c8
	beq.b loc_06581a
	move.l #$01001c08,(a4)
	move.w a6,($36,a4)
	tst.b ($b,a6)
	beq.b loc_06580e
	neg.w d0

loc_06580e:
	move.w d0,($40,a4)
	move.w d1,($44,a4)
	move.w d2,($3a,a4)

loc_06581a:
	rts

;##############################################
;Special Move inputs
;##############################################
loc_06581c:
	jsr loc_02e096
	bne.w loc_0658d2

loc_065826:
	lea.l ($1a0,a6),a4
	jsr loc_02d6ba
	bne.w loc_065b4e

loc_065834:
	lea.l ($1a8,a6),a4
	jsr loc_02d69a
	bne.w loc_065bd2

loc_065842:
	lea.l ($188,a6),a4
	jsr loc_02d62a
	bne.w loc_065a68

loc_065850:
	lea.l ($198,a6),a4
	jsr loc_02d5ea
	bne.w loc_065ad6

loc_06585e:
	lea.l ($180,a6),a4
	jsr loc_02d60a
	bne.w loc_065a20

loc_06586c:
	lea.l ($190,a6),a4
	jsr loc_02d5f2
	bne.w loc_065aa8

loc_06587a:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_065936

loc_065888:
	lea.l ($1b0,a6),a4
	jsr loc_02d6ea
	bne.w loc_065b1e

loc_065896:
	jsr loc_02e0cc
	bne.w loc_0659bc

loc_0658a0:
	rts

;----------------------------------------------
;Move ID writes
;----------------------------------------------
loc_0658a2:
	tst.b ($bf,a5)
	bne.b loc_065888
	jsr loc_02ed00
	beq.b loc_065888
	move.l #$02000e00,(4,a6)
	clr.b ($aa,a6)
	btst #2,($83,a6)
	beq.b loc_0658ca
	move.b #2,($aa,a6)

loc_0658ca:
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_0658d2:
	tst.b ($28a,a6)
	bne.w loc_065826
	tst.b ($31,a6)
	bne.w loc_065910
	jsr loc_02ef54
	beq.w loc_065826
	jsr loc_02ecd8
	beq.w loc_065826
	move.l #$02001000,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_065910:
	tst.b ($b9,a6)
	bne.w loc_065826
	jsr loc_02ed28
	beq.w loc_065826
	move.l #$02001000,(4,a6)
	move.b #$12,($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_065936:
	jsr loc_02edf8
	beq.w loc_065888

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_065940:
	tst.b ($132,a6)
	bne.w loc_065982
	move.l #$02000e00,(4,a6)
	move.b #$14,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #$18,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_065982:
	move.l #$02000e00,(4,a6)
	move.b #$16,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$1a,($5f,a4)
	move.b #$1e,($25d,a6)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_0659bc:
	tst.b ($b9,a6)
	bne.b loc_0659ca
	tst.b (pl_taunt_count,a6)
	beq.w loc_0658a0

loc_0659ca:
	jsr loc_02ed00
	beq.w loc_0658a0
	move.l #$02000e00,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;==============================================
loc_0659ea:
	move.b #6,($aa,a1)
	bra.b loc_0659f8

loc_0659f2:
	move.b #4,($aa,a1)

loc_0659f8:
	move.l #$02000e00,(4,a1)
	move.b #1,($295,a1)
	clr.b ($a9,a6)
	clr.b ($a9,a1)
	clr.b ($216,a6)
	clr.b ($216,a1)
	clr.b ($5f,a6)
	clr.b ($5f,a1)
	rts

;----------------------------------------------
loc_065a20:
	tst.b ($b9,a6)
	bne.b loc_065a30
	tst.b ($238,a6)
	bne.w loc_06586c
	bra.b loc_065a3a

loc_065a30:
	cmpi.b #2,($238,a6)
	bcc.w loc_06586c

loc_065a3a:
	jsr loc_02ed00
	beq.w loc_06586c
	move.b #8,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f728

;----------------------------------------------
loc_065a68:
	tst.b ($132,a6)
	bmi.w loc_065850
	tst.b ($258,a6)
	bne.w loc_065850
	jsr loc_02eea6
	beq.w loc_065850
	move.b #$a,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	move.b #2,($82,a6)
	rts

;----------------------------------------------
loc_065aa8:
	jsr loc_02ed00
	beq.w loc_06587a
	move.b #$c,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_065ad6:
	tst.b ($b9,a6)
	bne.b loc_065ae6
	tst.b ($238,a6)
	bne.w loc_06585e
	bra.b loc_065af0

loc_065ae6:
	cmpi.b #2,($238,a6)
	bcc.w loc_06585e

loc_065af0:
	jsr loc_02ed00
	beq.w loc_06585e
	move.b #$e,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f728

;----------------------------------------------
loc_065b1e:
	tst.b ($132,a6)
	bmi.w loc_065896
	jsr loc_02ed00
	beq.w loc_065896
	move.b #$1c,($aa,a6)
	clr.b ($a9,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	rts

;----------------------------------------------
loc_065b4e:
	cmpi.b #1,($132,a6)
	beq.w loc_065834
	tst.b ($132,a6)
	bmi.b loc_065b92
	cmpi.w #$30,($11e,a6)
	bcs.w loc_065834
	jsr loc_02ecd8
	beq.w loc_065834
	move.b #$18,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

loc_065b92:
	cmpi.w #$90,($11e,a6)
	bcs.w loc_065834
	jsr loc_02ecd8
	beq.w loc_065834
	move.b #$1e,($aa,a6)
	move.l #$02001004,(4,a6)
	moveq #0,d0
	move.b d0,($a9,a6)
	move.l d0,($84,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;----------------------------------------------
loc_065bd2:
	tst.b ($132,a6)
	bne.w loc_065842
	cmpi.w #$30,($11e,a6)
	bcs.w loc_065842
	jsr loc_02ecd8
	beq.w loc_065842
	move.b #$1a,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$02001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;##############################################
;AI move Checks
;##############################################
loc_065c0e:
	move.b ($aa,a6),d0
	move.w loc_065c1a(pc,d0.w),d1
	jmp loc_065c1a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065c1a:
	dc.w loc_065c3a-loc_065c1a
	dc.w loc_065c3a-loc_065c1a
	dc.w loc_065c3a-loc_065c1a
	dc.w loc_065c3a-loc_065c1a
	dc.w loc_065c3e-loc_065c1a
	dc.w loc_065c42-loc_065c1a
	dc.w loc_065c3e-loc_065c1a
	dc.w loc_065c3e-loc_065c1a

	dc.w loc_065c3e-loc_065c1a
	dc.w loc_065c3e-loc_065c1a
	dc.w loc_065c6a-loc_065c1a
	dc.w loc_065c6a-loc_065c1a
	dc.w loc_065c80-loc_065c1a
	dc.w loc_065cac-loc_065c1a
	dc.w loc_065c3e-loc_065c1a
	dc.w loc_065c96-loc_065c1a

;==============================================
loc_065c3a:
	bra.w loc_065cc2

;==============================================
loc_065c3e:
	bra.w loc_065cbe

;==============================================
loc_065c42:
	cmpi.l #$02020202,(4,a6)
	bne.w loc_065cc2
	tst.b ($31,a6)
	bne.w loc_065cc2
	tst.b ($2ce,a6)
	bne.w loc_065cc2
	tst.b ($50,a6)
	bmi.w loc_065cc2
	bra.w loc_065cbe

;==============================================
loc_065c6a:
	tst.b ($132,a6)
	bmi.w loc_065cc2
	cmpi.w #$30,($11e,a6)
	bcs.w loc_065cc2
	bra.w loc_065cbe

;==============================================
loc_065c80:
	tst.b ($132,a6)
	bne.w loc_065cc2
	cmpi.w #$30,($11e,a6)
	bcs.w loc_065cc2
	bra.w loc_065cbe

;==============================================
loc_065c96:
	tst.b ($132,a6)
	bpl.w loc_065cc2
	cmpi.w #$90,($11e,a6)
	bcs.w loc_065cc2
	bra.w loc_065cbe

;==============================================
loc_065cac:
	tst.b ($132,a6)
	bne.w loc_065cc2
	cmpi.w #$30,($11e,a6)
	bcs.w loc_065cc2

;----------------------------------------------
loc_065cbe:
	moveq #1,d0
	rts

;----------------------------------------------
loc_065cc2:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming 1(Cpu)
;##############################################
loc_065cc6:
	move.b ($aa,a6),d0
	move.w loc_065cd2(pc,d0.w),d1
	jmp loc_065cd2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065cd2:
	dc.w loc_065d1e-loc_065cd2
	dc.w loc_065d4c-loc_065cd2
	dc.w loc_065d7c-loc_065cd2
	dc.w loc_065dbe-loc_065cd2;ec
	dc.w loc_065e02-loc_065cd2
	dc.w loc_065f3e-loc_065cd2
	dc.w loc_065fd4-loc_065cd2
	dc.w loc_0660a2-loc_065cd2

	dc.w loc_06630e-loc_065cd2
	dc.w loc_066350-loc_065cd2
	dc.w loc_0663d2-loc_065cd2
	dc.w loc_066488-loc_065cd2
	dc.w loc_0664b6-loc_065cd2
	dc.w loc_06665a-loc_065cd2
	dc.w loc_066932-loc_065cd2
	dc.w loc_0664b6-loc_065cd2

;##############################################
;Special Move Programming 2 (Player)
;##############################################
loc_065cf2:
	move.b ($aa,a6),d0
	move.w loc_065cfe(pc,d0.w),d1
	jmp loc_065cfe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065cfe:
	dc.w loc_065d1e-loc_065cfe;00 Special Dodge/Block
	dc.w loc_065d4c-loc_065cfe;02 Low Special Dodge/Block
	dc.w loc_065d7c-loc_065cfe;04 Stand Dodge start?
	dc.w loc_065dbe-loc_065cfe;06 Low Dodge Start?
	dc.w loc_065e02-loc_065cfe;08 Criminal Upper
	dc.w loc_065f3e-loc_065cfe;0a Bad Spray
	dc.w loc_065fd4-loc_065cfe;0c Ruffian Kick
	dc.w loc_0660a2-loc_065cfe;0e Bad Stone

	dc.w loc_06630e-loc_065cfe;10 Taunt
	dc.w loc_066350-loc_065cfe;12 Vism Activate
	dc.w loc_0663d2-loc_065cfe;14 Aism Alpha Counter
	dc.w loc_066488-loc_065cfe;16 Vism Alpha Counter
	dc.w loc_0664b6-loc_065cfe;18 Final Destruction
	dc.w loc_06665a-loc_065cfe;1a Dead End
	dc.w loc_066932-loc_065cfe;1c Feint Item Throw
	dc.w loc_0669d0-loc_065cfe;1e Final Fight Mode

;==============================================
;Special Dodge/Block
;==============================================
loc_065d1e:
	clr.b ($2c8,a6)
	move.b (7,a6),d0
	move.w loc_065d2e(pc,d0.w),d1
	jmp loc_065d2e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065d2e:
	dc.w loc_065d32-loc_065d2e
	dc.w loc_065d3e-loc_065d2e

;----------------------------------------------
loc_065d32:
	addq.b #2,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_065d3e:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Low Special Dodge/Block
;==============================================
loc_065d4c:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_065d5e(pc,d0.w),d1
	jmp loc_065d5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065d5e:
	dc.w loc_065d62-loc_065d5e
	dc.w loc_065d6e-loc_065d5e

;----------------------------------------------
loc_065d62:
	addq.b #2,(7,a6)
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_065d6e:
	tst.b ($33,a6)
	bmi.w loc_067496
	jmp loc_02a7ea

;==============================================
;Stand Dodge start?
;==============================================
loc_065d7c:
	clr.b ($2c8,a6)
	move.b (7,a6),d0
	move.w loc_065d8c(pc,d0.w),d1
	jmp loc_065d8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065d8c:
	dc.w loc_065d90-loc_065d8c
	dc.w loc_065db0-loc_065d8c

;----------------------------------------------
loc_065d90:
	addq.b #2,(7,a6)
	jsr RNGFunction
	andi.w #7,d0
	move.b loc_065da8(pc,d0.w),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065da8:
	dc.b $06,$07,$08,$07
	dc.b $06,$07,$06,$08

;----------------------------------------------
loc_065db0:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Low Dodge Start?
;==============================================
loc_065dbe:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_065dd0(pc,d0.w),d1
	jmp loc_065dd0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065dd0:
	dc.w loc_065dd4-loc_065dd0
	dc.w loc_065df4-loc_065dd0

;----------------------------------------------
loc_065dd4:
	addq.b #2,(7,a6)
	jsr RNGFunction
	andi.w #7,d0
	move.b loc_065dec(pc,d0.w),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065dec:
	dc.b $09,$0a,$09,$0a
	dc.b $09,$0a,$09,$0a

;----------------------------------------------
loc_065df4:
	tst.b ($33,a6)
	bmi.w loc_067496
	jmp loc_02a7ea

;==============================================
;Criminal Upper
;==============================================
loc_065e02:
	move.b (7,a6),d0
	move.w loc_065e0e(pc,d0.w),d1
	jmp loc_065e0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065e0e:
	dc.w loc_065e16-loc_065e0e
	dc.w loc_065e4a-loc_065e0e
	dc.w loc_065ed4-loc_065e0e
	dc.w loc_065f10-loc_065e0e

;----------------------------------------------
loc_065e16:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_065e4a:
	tst.b ($35,a6)
	beq.w loc_065ea8
	addq.b #2,(7,a6)
	move.b #3,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_065ea8
	addq.b #1,(a4)
	move.w #$2400,(2,a4)
	move.b #0,($bd,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	lsr.w #1,d0
	addq.w #2,d0
	move.w d0,($50,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$c,($bd,a4)
	move.b #0,($73,a4)
	bsr.w loc_0674a8
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_065eb2

loc_065ea8:
	jsr loc_02a7ea
	bra.w loc_065f24

;==============================================
loc_065eb2:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_065ece(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065ece:
	dc.w $0002,$0003,$0003

;----------------------------------------------
loc_065ed4:
	tst.b ($33,a6)
	bmi.b loc_065ef8
	tst.b ($3a,a6)
	beq.b loc_065eea
	subq.b #1,($3a,a6)
	bne.b loc_065f0a
	clr.b ($ce,a6)

loc_065eea:
	movea.w ($a4,a6),a4
	cmpi.l #$6000000,(4,a4)
	bne.b loc_065f04

loc_065ef8:
	addq.b #2,(7,a6)
	moveq #$1b,d0
	jsr loc_02a758

loc_065f04:
	jsr loc_02f6f8

loc_065f0a:
	jmp loc_02a7ea

;----------------------------------------------
loc_065f10:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_065f24:
	moveq #0,d0
	move.b ($34,a6),d0
	beq.b loc_065f3c
	clr.b ($34,a6)
	tst.b ($b,a6)
	bne.b loc_065f38
	neg.w d0

loc_065f38:
	add.w d0,($10,a6)

loc_065f3c:
	rts

;==============================================
;Bad Spray
;==============================================
loc_065f3e:
	move.b (7,a6),d0
	move.w loc_065f4a(pc,d0.w),d1
	jmp loc_065f4a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065f4a:
	dc.w loc_065f50-loc_065f4a
	dc.w loc_065f96-loc_065f4a
	dc.w loc_065fc6-loc_065f4a

;----------------------------------------------
loc_065f50:
	jsr loc_02aa08
	bcc.w loc_0674a2
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
	move.b #$a,($123,a5)
	jmp loc_00369c

;----------------------------------------------
loc_065f96:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$e,d0
	jmp loc_02a758

;----------------------------------------------
loc_065fc6:
	tst.b ($33,a6)
	bmi.w loc_067496
	jmp loc_02a7ea

;==============================================
;Ruffian Kick
;==============================================
loc_065fd4:
	move.b (7,a6),d0
	move.w loc_065fe0(pc,d0.w),d1
	jmp loc_065fe0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_065fe0:
	dc.w loc_065fe4-loc_065fe0
	dc.w loc_066048-loc_065fe0

;----------------------------------------------
loc_065fe4:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($2c8,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	bne.b loc_066002
	move.b #1,($ed,a6)

loc_066002:
	lsr.b #1,d0
	addq.b #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_06603c(pc,d0.w),($40,a6)
	tst.b ($b,a6)
	bne.b loc_06602a
	neg.l ($40,a6)

loc_06602a:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$12,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06603c:
	dc.l $0040000
	dc.l $0050000
	dc.l $0040000

;----------------------------------------------
loc_066048:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jsr loc_02a7ea
	move.b ($34,a6),d0
	beq.b loc_06606e
	clr.b ($34,a6)
	tst.b ($b,a6)
	bne.b loc_066068
	neg.b d0

loc_066068:
	ext.w d0
	add.w d0,($10,a6)

loc_06606e:
	tst.b ($35,a6)
	bpl.b loc_06607e
	andi.b #$7f,($35,a6)
	clr.b ($ce,a6)

loc_06607e:
	tst.b ($35,a6)
	beq.b loc_06609c
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.b ($b4,a5),d0
	andi.b #3,d0
	bne.b loc_06609c
	jsr loc_085a7e

loc_06609c:
	jmp loc_02f6f8

;==============================================
;Bad Stone
;==============================================
loc_0660a2:
	move.b (7,a6),d0
	move.w loc_0660ae(pc,d0.w),d1
	jmp loc_0660ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0660ae:
	dc.w loc_0660b8-loc_0660ae
	dc.w loc_06611e-loc_0660ae
	dc.w loc_066156-loc_0660ae
	dc.w loc_066200-loc_0660ae
	dc.w loc_066214-loc_0660ae

;----------------------------------------------
loc_0660b8:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	tst.b ($1e4,a6)
	bpl.b loc_0660f6
	move.b #8,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #$11,d0
	moveq #$55,d1
	moveq #8,d2
	bsr.w loc_0657f4
	moveq #$1c,d0
	jmp loc_02a758

loc_0660f6:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	move.b #4,($3a,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,($3b,a6)
	addi.b #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_06611e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_067488
	clr.b ($35,a6)
	move.b ($3b,a6),d0
	btst d0,(PL_Buttons,a6)
	beq.b loc_066142
	subq.b #1,($3a,a6)
	bne.w loc_067488

loc_066142:
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2d,d0
	jmp loc_02a758

;----------------------------------------------
loc_066156:
	tst.b ($35,a6)
	beq.w loc_0661e6
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	jsr loc_01c1c8
	beq.w loc_0661e6
	addq.b #1,(a4)
	move.w #$2100,(2,a4)
	bsr.w loc_0674a8
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.w #0,($50,a4)
	move.w ($64,a6),($64,a4)
	move.b ($3a,a6),($a,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0661ec
	jsr loc_01c2c8
	beq.b loc_0661e2
	move.l #$01001c02,(a4)
	move.w a6,($36,a4)
	move.w ($a4,a6),($38,a4)
	jsr loc_01c2c8
	beq.b loc_0661e2
	move.l #$01001c04,(a4)
	move.w a6,($36,a4)
	move.w ($a4,a6),($38,a4)

loc_0661e2:
	bsr.w loc_066298

loc_0661e6:
	jmp loc_02a7ea

;==============================================
loc_0661ec:
	move.b #$d,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_066200:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_066214:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_066282
	move.b #6,(7,a6)
	clr.b ($ce,a6)
	jsr loc_01c1c8
	beq.w loc_066282
	addq.b #1,(a4)
	move.w #$2106,(2,a4)
	bsr.w loc_0674a8
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.w #0,($50,a4)
	move.w ($64,a6),($64,a4)
	move.b #4,($a,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_066284
	move.b #1,($1e4,a6)
	bsr.w loc_066298

loc_066282:
	rts

;==============================================
loc_066284:
	move.b #$e,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;==============================================
loc_066298:
	tst.b ($b9,a6)
	beq.w loc_0662f8
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_0662f8
	jsr loc_01c1c8
	beq.w loc_0662f8
	addq.b #1,(a4)
	move.w #$2100,(2,a4)
	bsr.w loc_0674a8
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.w #0,($50,a4)
	move.w ($64,a6),($64,a4)
	move.b ($3a,a6),($a,a4)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_0662fa

loc_0662f8:
	rts

;==============================================
loc_0662fa:
	move.b #$d,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;==============================================
;Taunt
;==============================================
loc_06630e:
	move.b (7,a6),d0
	move.w loc_06631a(pc,d0.w),d1
	jmp loc_06631a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06631a:
	dc.w loc_06631e-loc_06631a
	dc.w loc_066342-loc_06631a

;----------------------------------------------
loc_06631e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_066332
	subq.b #1,(pl_taunt_count,a6)

loc_066332:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	moveq #$1a,d0
	jmp loc_02a758

;----------------------------------------------
loc_066342:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
loc_066350:
	move.b (7,a6),d0
	move.w loc_06635c(pc,d0.w),d1
	jmp loc_06635c(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06635c:
	dc.w loc_066362-loc_06635c
	dc.w loc_066382-loc_06635c
	dc.w loc_0663b6-loc_06635c

;----------------------------------------------
loc_066362:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_06637c
	moveq #$2f,d0

loc_06637c:
	jmp loc_02a708

;----------------------------------------------
loc_066382:
	tst.b ($34,a6)
	beq.b loc_0663b0
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b ($31,a6)
	beq.b loc_0663a6
	moveq #-3,d0
	moveq #$41,d1

loc_0663a6:
	jsr loc_097cd6
	bsr.w loc_067668

loc_0663b0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0663b6:
	subq.b #1,($3a,a6)
	bne.w loc_0674a2
	tst.b ($31,a6)
	beq.b loc_0663cc
	move.l #$02000602,(4,a6)

loc_0663cc:
	jmp loc_02f796

;==============================================
;Aism Alpha Counter
;==============================================
loc_0663d2:
	move.b (7,a6),d0
	move.w loc_0663de(pc,d0.w),d1
	jmp loc_0663de(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0663de:
	dc.w loc_0663e6-loc_0663de
	dc.w loc_066412-loc_0663de
	dc.w loc_066456-loc_0663de
	dc.w loc_06647a-loc_0663de

;----------------------------------------------
loc_0663e6:
	tst.b ($35,a6)
	beq.b loc_06640c
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_080e8e
	move.l #$80000,($40,a6)
	tst.b ($b,a6)
	bne.b loc_06640c
	neg.l ($40,a6)

loc_06640c:
	jmp loc_02a7ea

;----------------------------------------------
loc_066412:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_066426
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_066426:
	tst.b ($35,a6)
	beq.b loc_066454
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$24,d0
	jsr loc_02e3fe
	beq.b loc_066446
	moveq #$f,d0
	jsr loc_0038e4

loc_066446:
	moveq #$28,d0
	jsr loc_080b70
	jmp loc_02fa36

loc_066454:
	rts

;----------------------------------------------
loc_066456:
	tst.b ($35,a6)
	beq.b loc_06646e
	addq.b #2,(7,a6)
	tst.b ($67,a6)
	beq.b loc_06646e
	moveq #$24,d0
	jsr loc_02e7f2

loc_06646e:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06647a:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Vism Alpha Counter
;==============================================
loc_066488:
	move.b (7,a6),d0
	move.w loc_066494(pc,d0.w),d1
	jmp loc_066494(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066494:
	dc.w loc_066498-loc_066494
	dc.w loc_066498-loc_066494

;----------------------------------------------
loc_066498:
	tst.b ($33,a6)
	bmi.w loc_06748a
	tst.b ($35,a6)
	beq.b loc_0664b0
	clr.b ($35,a6)
	jsr loc_080e8e

loc_0664b0:
	jmp loc_02a7ea

;==============================================
;Final Destruction
;==============================================
loc_0664b6:
	move.b (7,a6),d0
	move.w loc_0664c2(pc,d0.w),d1
	jmp loc_0664c2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0664c2:
	dc.w loc_0664ce-loc_0664c2
	dc.w loc_0664fe-loc_0664c2
	dc.w loc_066526-loc_0664c2
	dc.w loc_066590-loc_0664c2
	dc.w loc_066612-loc_0664c2
	dc.w loc_06664c-loc_0664c2

;----------------------------------------------
loc_0664ce:
	addq.b #2,(7,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($5b,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1f,d0
	jmp loc_02a758

;----------------------------------------------
loc_0664fe:
	tst.b ($34,a6)
	beq.b loc_066520
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_066512
	moveq #1,d0

loc_066512:
	move.b d0,($ab,a6)
	moveq #-$1e,d0
	moveq #$51,d1
	jsr loc_082e36

loc_066520:
	jmp loc_02a7ea

;----------------------------------------------
loc_066526:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_066572
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06654c
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_06654c:
	move.b loc_066574(pc,d0.w),($25d,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_066578(pc,d0.w),($40,a6)
	move.l loc_066578+4(pc,d0.w),($48,a6)
	tst.b ($b,a6)
	bne.b loc_066572
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_066572:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066574:
	dc.b $0b,$0c,$0d,00

loc_066578:
	dc.l $00050000,$ffffa000
	dc.l $00060000,$ffff8000
	dc.l $00070000,$ffff6000

;----------------------------------------------
loc_066590:
	move.l ($40,a6),d1
	beq.b loc_0665c0
	btst #0,($35,a6)
	beq.b loc_0665a2
	add.l d1,($10,a6)

loc_0665a2:
	btst #1,($35,a6)
	beq.b loc_0665c0
	move.l ($48,a6),d0
	add.l d0,d1
	move.l d1,($40,a6)
	eor.l d0,d1
	bmi.b loc_0665c0
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_0665c0:
	tst.b ($33,a6)
	bmi.w loc_06748a
	cmpi.b #1,($5b,a6)
	bne.w loc_0674a2
	clr.b ($5b,a6)
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.w loc_0674a2
	tst.w ($50,a4)
	bmi.w loc_0674a2
	addq.b #2,(7,a6)
	moveq #$f,d0
	jsr loc_0038e4
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_06660e(pc,d0.w),($3a,a6)
	addi.b #$22,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06660e:
	dc.b $01,$02,$03,00

;----------------------------------------------
loc_066612:
	jsr loc_02a7ea
	move.b ($3c,a6),d0
	move.b ($34,a6),d1
	eor.b d1,d0
	move.b d0,($b,a6)
	tst.b ($35,a6)
	beq.b loc_06664a
	clr.b ($35,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_06664a
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$25,d0
	jmp loc_02a758

loc_06664a:
	rts

;----------------------------------------------
loc_06664c:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jmp loc_02a7ea

;==============================================
;Dead End
;==============================================
loc_06665a:
	move.b (7,a6),d0
	move.w loc_066666(pc,d0.w),d1
	jmp loc_066666(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066666:
	dc.w loc_06666e-loc_066666
	dc.w loc_06669e-loc_066666
	dc.w loc_0666c6-loc_066666
	dc.w loc_066702-loc_066666

;----------------------------------------------
loc_06666e:
	addq.b #2,(7,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($5b,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_06669e:
	tst.b ($34,a6)
	beq.b loc_0666c0
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0666b2
	moveq #1,d0

loc_0666b2:
	move.b d0,($ab,a6)
	moveq #-$1e,d0
	moveq #$51,d1
	jsr loc_082e36

loc_0666c0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0666c6:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_0666fc
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($34,a6)
	move.b d0,($ab,a6)
	move.b d0,($84,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_0666f6
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0666f6:
	move.b loc_0666fe(pc,d0.w),($25d,a6)

loc_0666fc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0666fe:
	dc.b $04,$14,$1b,00

;----------------------------------------------
loc_066702:
	jsr loc_02a7ea
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_066716(pc,d0.w),d1
	jmp loc_066716(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066716:
	dc.w loc_06671c-loc_066716
	dc.w loc_06671c-loc_066716
	dc.w loc_0667a8-loc_066716

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06671c:
	move.b ($84,a6),d0
	move.w loc_066728(pc,d0.w),d1
	jmp loc_066728(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066728:
	dc.w loc_066730-loc_066728
	dc.w loc_06675a-loc_066728
	dc.w loc_066786-loc_066728
	dc.w loc_06679e-loc_066728

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066730:
	addq.b #2,($84,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	jsr loc_01c2c8
	beq.b loc_066758
	move.l #$01001c00,(a4)
	move.w a6,($36,a4)

loc_066758:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06675a:
	tst.b ($35,a6)
	beq.b loc_06677e
	addq.b #2,($84,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_06677e:
	bsr.w loc_0668f0
	bra.w loc_0668ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066786:
	jsr loc_02aa08
	bcc.b loc_06679c
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	bra.w loc_066890

loc_06679c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06679e:
	tst.b ($33,a6)
	bmi.w loc_06748a
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0667a8:
	move.b ($84,a6),d0
	move.w loc_0667b4(pc,d0.w),d1
	jmp loc_0667b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0667b4:
	dc.w loc_0667c0-loc_0667b4
	dc.w loc_066800-loc_0667b4
	dc.w loc_066818-loc_0667b4
	dc.w loc_066844-loc_0667b4
	dc.w loc_0668ba-loc_0667b4
	dc.w loc_0668c4-loc_0667b4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0667c0:
	addq.b #2,($84,a6)
	move.b #2,($3a,a6)
	move.b #1,($31,a6)
	move.l #$40000,($40,a6)
	move.l #$800,($48,a6)
	move.l #$26000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_0667fe
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0667fe:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066800:
	jsr loc_02aa08
	bcc.b loc_066816
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	bra.w loc_066890

loc_066816:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066818:
	tst.b ($35,a6)
	beq.b loc_06683c
	addq.b #2,($84,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_06683c:
	bsr.w loc_0668f0
	bra.w loc_0668ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066844:
	jsr loc_02aa08
	bcs.w loc_066880
	tst.b ($35,a6)
	beq.b loc_06687e
	bgt.b loc_066868
	clr.b ($35,a6)
	tst.b ($3a,a6)
	bne.b loc_06687e
	moveq #$17,d0
	jmp loc_0038e4

loc_066868:
	clr.b ($35,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_06687e
	addq.b #2,($84,a6)
	moveq #$2b,d0
	jmp loc_02a758

loc_06687e:
	rts

loc_066880:
	move.b #$a,($84,a6)
	bsr.b loc_066890
	moveq #$2c,d0
	jmp loc_02a758

;==============================================
loc_066890:
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	jmp loc_00369c
 
;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0668ba:
	jsr loc_02aa08
	bcs.b loc_066880
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0668c4:
	tst.b ($33,a6)
	bmi.w loc_06748a
	rts

;==============================================
loc_0668ce:
	move.l ($40,a6),d0
	beq.b loc_0668ee
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	beq.b loc_0668ee
	add.l d1,($40,a6)
	eor.l d0,d1
	bmi.b loc_0668ee
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_0668ee:
	rts

;==============================================
loc_0668f0:
	moveq #0,d0
	move.b ($34,a6),d0
	beq.b loc_066918
	bpl.b loc_0668fc
	moveq #0,d0

loc_0668fc:
	lsl.w #3,d0
	move.l loc_06691a(pc,d0.w),($40,a6)
	move.l loc_06691a+4(pc,d0.w),($48,a6)
	tst.b ($b,a6)
	beq.b loc_066918
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_066918:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06691a:
	dc.l $00000000,$00000000
	dc.l $fffe0000,$00000000
	dc.l $fffc0000,$00008000

;==============================================
;Feint Item Throw
;==============================================
loc_066932:
	move.b (7,a6),d0
	move.w loc_06693e(pc,d0.w),d1
	jmp loc_06693e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06693e:
	dc.w loc_066944-loc_06693e
	dc.w loc_066988-loc_06693e
	dc.w loc_0669bc-loc_06693e

;----------------------------------------------
loc_066944:
	tst.b ($1e4,a6)
	bpl.b loc_06696c
	move.b #4,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #$11,d0
	moveq #$55,d1
	moveq #8,d2
	bsr.w loc_0657f4
	moveq #$31,d0
	jmp loc_02a758

loc_06696c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	move.b #4,($3a,a6)
	moveq #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_066988:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_067488
	clr.b ($35,a6)
	tst.b ($125,a6)
	bne.b loc_0669b0
	btst #7,(PL_Buttons,a6)
	beq.b loc_0669b0
	subq.b #1,($3a,a6)
	bne.w loc_067488

loc_0669b0:
	addq.b #2,(7,a6)
	moveq #$30,d0
	jmp loc_02a758

;----------------------------------------------
loc_0669bc:
	tst.b ($33,a6)
	bmi.w loc_06748a
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Final Fight Mode
;==============================================
loc_0669d0:
	move.b (7,a6),d0
	move.w loc_0669dc(pc,d0.w),d1
	jmp loc_0669dc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0669dc:
	dc.w loc_0669e2-loc_0669dc
	dc.w loc_067030-loc_0669dc
	dc.w loc_0670c6-loc_0669dc

;----------------------------------------------
loc_0669e2:
	subq.w #1,($3a,a6)
	bne.b loc_0669ec
	st.b ($1e9,a6)

loc_0669ec:
	moveq #0,d0
	tst.b ($a,a6)
	beq.b loc_066a02
	subq.b #1,($1e8,a6)
	bne.b loc_066a02
	move.b d0,($a,a6)
	move.b d0,($5b,a6)

loc_066a02:
	move.b ($84,a6),d0
	move.w loc_066a0e(pc,d0.w),d1
	jmp loc_066a0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066a0e:
	dc.w loc_066a1a-loc_066a0e
	dc.w loc_066ad8-loc_066a0e
	dc.w loc_066cb8-loc_066a0e
	dc.w loc_066d12-loc_066a0e
	dc.w loc_066ea8-loc_066a0e
	dc.w loc_066eaa-loc_066a0e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066a1a:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_066a28(pc,d0.w),d1
	jmp loc_066a28(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066a28:
	dc.w loc_066a30-loc_066a28
	dc.w loc_066a4a-loc_066a28
	dc.w loc_066a88-loc_066a28
	dc.w loc_066aba-loc_066a28

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066a30:
	addq.b #2,($85,a6)
	moveq #0,d0
	tst.b ($2c8,a6)
	beq.b loc_066a44
	move.b #4,($85,a6)
	moveq #1,d0

loc_066a44:
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066a4a:
	clr.b ($2c8,a6)
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066bf6
	bne.w loc_066c00
	bsr.w loc_066bc0
	bne.w loc_066bc8
	bsr.w loc_066b96
	bne.w loc_066b9e
	bsr.w loc_066c26
	bne.w loc_066c34
	jmp loc_02a7ea

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066a88:
	move.b #1,($2c8,a6)
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066be0
	bne.w loc_066bee
	bsr.w loc_066bf6
	bne.w loc_066c00
	bsr.w loc_066bc0
	beq.w loc_066ac0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066aba:
	jmp loc_02a7ea

;==============================================
loc_066ac0:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$204,($84,a6)
	move.b d0,($2c8,a6)
	moveq #4,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066ad8:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_066ae6(pc,d0.w),d1
	jmp loc_066ae6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066ae6:
	dc.w loc_066aee-loc_066ae6
	dc.w loc_066af2-loc_066ae6
	dc.w loc_066b46-loc_066ae6
	dc.w loc_066b4a-loc_066ae6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066aee:
	addq.b #2,($85,a6)

loc_066af2:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066bf6
	bne.w loc_066c00
	bsr.w loc_066b96
	bne.w loc_066b9e
	bsr.w loc_066bc0
	bne.b loc_066b38
	bsr.w loc_066c26
	bne.w loc_066c34
	addq.b #2,($85,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addq.w #4,d0
	jmp loc_02a708

loc_066b38:
	tst.b ($33,a6)
	bmi.w loc_066c8a
	jmp loc_02a7ea

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066b46:
	addq.b #2,($85,a6)

loc_066b4a:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066bf6
	bne.w loc_066c00
	bsr.w loc_066b96
	bne.w loc_066b9e
	bsr.w loc_066bc0
	beq.b loc_066b88
	clr.b ($85,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addq.w #7,d0
	jmp loc_02a708

loc_066b88:
	tst.b ($33,a6)
	bmi.w loc_066c60
	jmp loc_02a7ea

;==============================================
loc_066b96:
	btst #3,($371,a6)
	rts

;==============================================
loc_066b9e:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$600,($84,a6)
	move.b d0,($2c8,a6)
	move.b d0,($25d,a6)
	move.b #5,($23f,a6)
	moveq #$10,d0
	jmp loc_02a708

;==============================================
loc_066bc0:
	btst #2,($371,a6)
	rts

;==============================================
loc_066bc8:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$200,($84,a6)
	move.b d0,($2c8,a6)
	moveq #7,d0
	jmp loc_02a708

;==============================================
loc_066be0:
	move.b ($b,a6),d0
	andi.b #1,d0
	btst d0,($11b,a6)
	rts

;==============================================
loc_066bee:
	eori.b #1,($b,a6)
	rts

;==============================================
loc_066bf6:
	move.b ($378,a6),d0
	andi.w #$77,d0
	rts

;==============================================
loc_066c00:
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #$a00,($84,a6)
	move.b d0,($82,a6)
	move.b d0,($81,a6)
	bsr.b loc_066bc0
	beq.b loc_066c1a
	moveq #2,d0

loc_066c1a:
	move.b d0,($2c8,a6)
	move.b d0,($80,a6)
	bra.w loc_066eaa

;==============================================
loc_066c26:
	moveq #6,d1
	move.b ($11b,a6),d0
	andi.w #$f,d0
	btst d0,d1
	rts

;==============================================
loc_066c34:
	move.b #4,($84,a6)
	btst #1,($11b,a6)
	sne.b d0
	addq.b #1,d0
	move.b d0,($b,a6)
	move.l #$2c000,($40,a6)
	move.l #0,($48,a6)
	moveq #2,d0
	jmp loc_02a708

loc_066c60:
	tst.b ($1e9,a6)
	bne.w loc_06748a
	moveq #0,d0
	move.b d0,(7,a6)
	move.w d0,($84,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a9,a6)
	move.b d0,($247,a6)
	move.b d0,($257,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_066c8a:
	tst.b ($1e9,a6)
	bne.w loc_067496
	moveq #0,d0
	move.b d0,(7,a6)
	move.w #4,($84,a6)
	move.b #1,($2c8,a6)
	move.b d0,($a9,a6)
	move.b d0,($247,a6)
	move.b d0,($257,a6)
	moveq #1,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066cb8:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066bf6
	bne.w loc_066c00
	bsr.w loc_066b96
	bne.w loc_066b9e
	bsr.w loc_066bc0
	bne.w loc_066bc8
	bsr.w loc_066d08
	beq.w loc_066c60
	bsr.w loc_066cf6
	jmp loc_02a7ea

loc_066cf6:
	move.b ($b,a6),d0
	btst d0,($11b,a6)
	beq.b loc_066d04
	bsr.w loc_066c34


loc_066d04:
	bra.w loc_0674de

loc_066d08:
	move.b ($11b,a6),d0
	andi.b #3,d0
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066d12:
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_066d20(pc,d0.w),d1
	jmp loc_066d20(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066d20:
	dc.w loc_066d28-loc_066d20
	dc.w loc_066dc2-loc_066d20
	dc.w loc_066e3a-loc_066d20
	dc.w loc_066e6e-loc_066d20

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066d28:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	addq.b #2,($85,a6)
	clr.b ($2c8,a6)
	move.b #1,($31,a6)
	clr.b ($23f,a6)
	moveq #$12,d0
	clr.b ($3c,a6)
	move.b ($11b,a6),d1
	andi.w #3,d1
	beq.b loc_066d68
	moveq #$14,d0
	st.b ($3c,a6)
	move.b ($b,a6),d2
	btst d2,d1
	bne.b loc_066d68
	moveq #$13,d0
	move.b #1,($3c,a6)

loc_066d68:
	jsr loc_02a708
	moveq #0,d0
	move.b ($3c,a6),d0
	addq.b #1,d0
	lsl.w #4,d0
	move.l loc_066d92(pc,d0.w),($40,a6)
	move.l loc_066d92+4(pc,d0.w),($44,a6)
	move.l loc_066d92+8(pc,d0.w),($48,a6)
	move.l loc_066d92+$c(pc,d0.w),($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066d92:
	dc.l $fffb8000,$00072000,$fffffb00,$ffff9c00
	dc.l $00000000,$0006e000,$00000000,$ffff9c00
	dc.l $00038000,$00070000,$00000500,$ffff9c00

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066dc2:
	bsr.w loc_0674f8
	bpl.b loc_066dfe
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_066dfe
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	jsr loc_00369c
	bsr.w loc_066bf6
	bne.w loc_066c00
	addq.b #2,($85,a6)
	moveq #$11,d0
	jmp loc_02a708

loc_066dfe:
	bsr.w loc_066bf6
	bne.w loc_066e0c
	jmp loc_02a7ea

loc_066e0c:
	move.b #6,($85,a6)
	move.b #1,($a9,a6)
	clr.b ($d2,a6)
	bsr.w loc_067024
	move.b #0,($82,a6)
	move.b #2,($81,a6)
	move.b #4,($80,a6)
	moveq #$3a,d0
	jmp loc_02a758

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066e3a:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	bsr.w loc_066bf6
	bne.w loc_066c00
	tst.b ($33,a6)
	bpl.w loc_0674a2
	clr.b ($5b,a6)
	bsr.w loc_066bc0
	bne.w loc_066bc8
	bra.w loc_066c60

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066e6e:
	bsr.w loc_0674f8
	bpl.w loc_0674a2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0674a2
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	jsr loc_00369c
	move.b #4,($85,a6)
	moveq #$11,d0
	jmp loc_02a708

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066ea8:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066eaa:
	tst.b ($80,a6)
	bne.w loc_066f2c
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_06748a
	clr.b ($2c8,a6)
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_066ed8(pc,d0.w),d1
	jmp loc_066ed8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066ed8:
	dc.w loc_066edc-loc_066ed8
	dc.w loc_066f28-loc_066ed8

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066edc:
	addq.b #2,($85,a6)
	move.b #1,($a9,a6)
	tst.b ($5b,a6)
	bne.b loc_066ef2
	clr.b ($a,a6)
	bra.b loc_066f02

loc_066ef2:
	addq.b #1,($a,a6)
	andi.b #3,($a,a6)
	move.b #$20,($1e8,a6)

loc_066f02:
	bsr.w loc_067024
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_066f1c
	btst #1,d0
	sne.b d0
	addq.b #1,d0
	move.b d0,($b,a6)

loc_066f1c:
	moveq #$32,d0
	add.b ($a,a6),d0
	jmp loc_02a758

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_066f28:
	bra.w loc_066f6e

;==============================================
loc_066f2c:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($107,a5),d0
	or.b ($1e9,a6),d0
	bne.w loc_067496
	move.b #1,($2c8,a6)
	moveq #0,d0
	move.b ($85,a6),d0
	move.w loc_066f54(pc,d0.w),d1
	jmp loc_066f54(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_066f54:
	dc.w loc_066f58-loc_066f54
	dc.w loc_066f6e-loc_066f54

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066f58:
	addq.b #2,($85,a6)
	move.b #1,($a9,a6)
	bsr.w loc_067024
	moveq #$36,d0
	jmp loc_02a758

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_066f6e:
	tst.b ($33,a6)
	bmi.b loc_066f92
	tst.b ($35,a6)
	bpl.b loc_066f82
	bsr.w loc_066f9e
	bne.w loc_066f84

loc_066f82:
	bra.b loc_066f8c

loc_066f84:
	clr.b ($85,a6)
	st.b ($257,a6)

loc_066f8c:
	jmp loc_02a7ea

loc_066f92:
	tst.b ($80,a6)
	bne.w loc_066c8a
	bra.w loc_066c60

;==============================================
loc_066f9e:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($1e9,a6),d0
	bne.b loc_06701c
	move.b ($378,a6),d0
	andi.w #$77,d0
	beq.b loc_06701c
	move.b #0,($81,a6)
	clr.b ($80,a6)
	btst #2,($371,a6)
	beq.b loc_066fee
	cmpi.b #2,($a,a6)
	bne.b loc_066fe8
	moveq #$61,d0
	jsr loc_02e3e0
	beq.b loc_066fe8
	move.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($84,a6)
	bra.b loc_06701c

loc_066fe8:
	move.b #2,($80,a6)

loc_066fee:
	movea.w ($38,a6),a4
	move.b ($270,a4),d0
	beq.b loc_067014
	cmpi.b #1,d0
	bne.b loc_067004
	move.b #2,($270,a4)

loc_067004:
	cmpi.b #3,d0
	bne.b loc_067014
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_067014:
	moveq #1,d0
	move.b d0,($247,a6)
	rts

loc_06701c:
	moveq #0,d0
	move.b d0,($247,a6)
	rts

;==============================================
loc_067024:
	moveq #0,d0
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	rts

;----------------------------------------------
loc_067030:
	subq.w #1,($3a,a6)
	bne.b loc_06703a
	st.b ($1e9,a6)

loc_06703a:
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_067048(pc,d0.w),d1
	jmp loc_067048(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067048:
	dc.w loc_067050-loc_067048
	dc.w loc_067062-loc_067048
	dc.w loc_067084-loc_067048
	dc.w loc_0670a0-loc_067048

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_067050:
	addq.b #2,($84,a6)
	moveq #$1d,d0
	jsr loc_02a758
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_067062:
	tst.b ($35,a6)
	beq.b loc_067078
	addq.b #2,($84,a6)
	clr.b ($35,a6)
	moveq #$61,d0
	jmp loc_02e7f2

loc_067078:
	jsr loc_02a7ea
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_067084:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06709e
	addq.b #2,($84,a6)
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_06709e:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0670a0:
	tst.b ($33,a6)
	bpl.b loc_0670c0
	tst.b ($1e9,a6)
	bne.w loc_06748a
	moveq #0,d0
	move.b d0,(7,a6)
	move.l d0,($84,a6)
	move.b d0,($5b,a6)
	move.b d0,($a9,a6)

loc_0670c0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0670c6:
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_0670d4(pc,d0.w),d1
	jmp loc_0670d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0670d4:
	dc.w loc_0670da-loc_0670d4
	dc.w loc_06711a-loc_0670d4
	dc.w loc_067142-loc_0670d4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0670da:
	addq.b #2,($84,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b d0,($1e9,a6)
	move.b d0,($5b,a6)
	move.b d0,($a,a6)
	move.b ($82,a6),d0
	move.w loc_067114(pc,d0.w),($3a,a6)
	lsr.b #1,d0
	addi.w #$1f,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067114:
	dc.w $012c,$01a4,$0258

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06711a:
	tst.b ($34,a6)
	beq.b loc_06713c
	addq.b #2,($84,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06712e
	moveq #1,d0

loc_06712e:
	move.b d0,($ab,a6)
	moveq #-$1e,d0
	moveq #$51,d1
	jsr loc_082e36

loc_06713c:
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_067142:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_067178
	moveq #0,d0
	move.b d0,(7,a6)
	move.l d0,($84,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06716e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_06716e:
	move.b loc_06717a(pc,d0.w),($25d,a6)
	clr.b ($216,a6)

loc_067178:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06717a:
	dc.b $0a,$0b,$10,00

;##############################################
;Throws
;##############################################
loc_06717e:
	cmpi.b #4,($80,a6)
	beq.w loc_0673da
	move.b (7,a6),d0
	move.w loc_067194(pc,d0.w),d1
	jmp loc_067194(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067194:
	dc.w loc_0671a6-loc_067194
	dc.w loc_0671ba-loc_067194
	dc.w loc_06724c-loc_067194
	dc.w loc_06725a-loc_067194
	dc.w loc_06727c-loc_067194
	dc.w loc_06729a-loc_067194
	dc.w loc_0672e2-loc_067194
	dc.w loc_067336-loc_067194

	dc.w loc_0673a4-loc_067194

;----------------------------------------------
loc_0671a6:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_0671ba:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	moveq #$21,d0
	tst.b ($81,a6)
	beq.b loc_0671cc
	moveq #$22,d0

loc_0671cc:
	jsr loc_02e3fe
	beq.w loc_067240
	tst.b ($125,a6)
	beq.b loc_067200
	jsr loc_01bd5c
	clr.b ($b,a6)
	tst.b ($81,a6)
	beq.b loc_0671f0
	addq.b #1,($b,a6)

loc_0671f0:
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06721e
	bra.b loc_067224

loc_067200:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_067224
	clr.b ($b,a6)
	tst.b ($81,a6)
	beq.b loc_067218
	eori.w #3,d0

loc_067218:
	btst #1,d0
	beq.b loc_067224

loc_06721e:
	eori.b #1,($b,a6)

loc_067224:
	move.b #$a,(7,a6)
	moveq #$1e,d0
	tst.b ($81,a6)
	bne.b loc_06723a
	move.b #6,(7,a6)
	moveq #$1d,d0

loc_06723a:
	jmp loc_02a758

loc_067240:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06724c:
	tst.b ($33,a6)
	bpl.w loc_0674a2
	jmp loc_02baf2

;----------------------------------------------
loc_06725a:
	tst.b ($35,a6)
	beq.b loc_067270
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$21,d0
	jmp loc_02e7f2

loc_067270:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06727c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_067298
	move.b #4,(7,a6)
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_067298:
	rts

;----------------------------------------------
loc_06729a:
	jsr loc_02a7ea
	jsr loc_02fa36
	tst.b ($35,a6)
	beq.b loc_0672e0
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	addi.w #$1a,($14,a6)
	jsr loc_02faae
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #$2e,d0
	moveq #4,d1
	jmp loc_02a838

loc_0672e0:
	rts

;----------------------------------------------
loc_0672e2:
	jsr loc_02aa08
	movea.w ($38,a6),a4
	move.w ($64,a6),d0
	cmp.w ($14,a4),d0
	bcs.b loc_06732a
	addq.b #2,(7,a6)
	move.b #1,($32,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b #$10,($123,a5)
	moveq #$29,d0
	cmpi.b #4,($80,a6)
	bne.b loc_067324
	moveq #$2b,d0

loc_067324:
	jsr loc_02e970

loc_06732a:
	jsr loc_02a7ea
	jmp loc_02faae

;----------------------------------------------
loc_067336:
	tst.b ($35,a6)
	beq.b loc_067392
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($de,a6)
	move.l #$20000,($40,a6)
	move.l #$fffffb00,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_067378
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_067378:
	moveq #$22,d0
	cmpi.b #4,($80,a6)
	bne.b loc_067384
	moveq #$23,d0

loc_067384:
	jsr loc_02e7f2
	moveq #$14,d0
	jmp loc_02a708

loc_067392:
	jsr loc_02a7ea
	jsr loc_02a8c6
	jmp loc_02faae

;----------------------------------------------
loc_0673a4:
	jsr loc_02aa08
	bcc.w loc_0674a2
	move.b #4,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($de,a6)
	move.b d0,($31,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;==============================================
;Air Throw
;==============================================
loc_0673da:
	move.b (7,a6),d0
	move.w loc_0673e6(pc,d0.w),d1
	jmp loc_0673e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0673e6:
	dc.w loc_0673f4-loc_0673e6
	dc.w loc_067408-loc_0673e6
	dc.w loc_067478-loc_0673e6
	dc.w loc_06729a-loc_0673e6
	dc.w loc_0672e2-loc_0673e6
	dc.w loc_067336-loc_0673e6
	dc.w loc_0673a4-loc_0673e6

;----------------------------------------------
loc_0673f4:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_067408:
	jsr loc_02aa08
	bcs.w loc_06748a
	tst.b ($33,a6)
	bpl.w loc_0674a2
	moveq #$23,d0
	jsr loc_02e636
	beq.w loc_06746c
	tst.b ($125,a6)
	beq.b loc_067446
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06745a
	bra.b loc_06745e

loc_067446:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_06745e
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_06745e

loc_06745a:
	addq.b #1,($b,a6)

loc_06745e:
	move.b #6,(7,a6)
	moveq #$1e,d0
	jmp loc_02a758

loc_06746c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_067478:
	jsr loc_02aa08
	bcc.w loc_0674a2
	jmp loc_02baf2

;==============================================
loc_067488:
	rts

;==============================================
loc_06748a:
	move.b ($2c9,a6),($b,a6)
	jmp loc_02baf2

;==============================================
loc_067496:
	move.b ($2c9,a6),($b,a6)
	jmp loc_02bb26

;==============================================
loc_0674a2:
	jmp loc_02a7ea

;==============================================
loc_0674a8:
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.b ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	rts

;==============================================
loc_0674de:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0674ea
	neg.l d0

loc_0674ea:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_0674f8:
	bsr.b loc_0674de
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_06750c:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	cmp.b ($3b,a6),d0
	beq.b loc_06753c
	move.b d0,($3b,a6)
	beq.b loc_06753c
	addq.b #1,($a,a6)
	move.w ($38,a6),($1e6,a6)
	beq.b loc_06753c
	move.w a6,($38,a6)
	jsr loc_080b70
	move.w ($1e6,a6),($38,a6)

loc_06753c:
	rts

;==============================================
loc_06753e:
	cmpi.b #5,($6eb9,a5)
	bcs.w loc_067618
	jsr loc_01c2c8
	movea.w a4,a1
	jsr loc_01c2c8
	movea.w a4,a2
	jsr loc_01c2c8
	bsr.w loc_06761a
	move.l #$01001512,(a1)
	move.b #4,(9,a1)
	move.b #2,($a,a1)
	move.b #3,($3c,a1)
	move.b #1,($b,a1)
	move.w a6,($36,a1)
	move.l #$0100150e,(a2)
	move.b #4,(9,a2)
	move.b #3,($a,a2)
	move.b #4,($3c,a2)
	move.b #1,($b,a2)
	move.w a6,($36,a2)
	move.l #$0100150f,(a4)
	move.b #4,(9,a4)
	move.b #6,($a,a4)
	move.b #8,($3c,a4)
	move.b #1,($b,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$01001510,(a4)
	move.b #6,(9,a4)
	move.b #1,($a,a4)
	move.b #1,($3c,a4)
	move.b #1,($b,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$01001511,(a4)
	move.b #6,(9,a4)
	move.b #4,($a,a4)
	move.b #5,($3c,a4)
	move.b #1,($b,a4)
	move.w a6,($36,a4)

loc_067618:
	rts

;==============================================
loc_06761a:
	cmpa.w a1,a2
	bcs.b loc_067620
	exg.l a1,a2

loc_067620:
	cmpa.w a2,a4
	bcs.b loc_067626
	exg.l a2,a4

loc_067626:
	cmpa.w a1,a2
	bcs.b loc_06762c
	exg.l a1,a2

loc_06762c:
	rts

;##############################################
;
;##############################################
loc_06762e:
	move.b #0,($1e4,a6)
	tst.b ($13e,a5)
	bne.b loc_067650
	jsr loc_01c2c8
	beq.b loc_067650
	move.l #$01001c06,(a4)
	move.w a6,($36,a4)
	addq.b #1,($13e,a5)

loc_067650:
	jsr loc_01c368
	beq.b loc_067666
	move.l #$01001b00,(a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)

loc_067666:
	rts

;==============================================
loc_067668:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;##############################################
;
;##############################################
loc_06769e:
	dc.w loc_067702-loc_06769e
	dc.w loc_067702-loc_06769e
	dc.w loc_0676a4-loc_06769e

loc_0676a4:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02

loc_067702:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$07,$07,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $07,$07,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02
