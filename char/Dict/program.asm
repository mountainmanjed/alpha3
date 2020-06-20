;##############################################################################
;
;##############################################################################
loc_046dfa:
	jsr loc_01c368
	beq.b loc_046e40
	addq.b #1,(a4)
	move.b #$a,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	st.b ($3c,a4)
	move.b ($b,a6),($b,a4)
	move.b ($e,a6),($e,a4)
	move.b ($c,a6),($c,a4)
	move.b ($d,a6),($d,a4)
	move.b ($102,a6),($3,a4)

loc_046e40:
	rts

;##############################################################################
;
;##############################################################################
loc_046e42:
	move.b (6,a6),d0
	move.w loc_046e4e(pc,d0.w),d1
	jmp loc_046e4e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_046e4e:
	dc.w loc_046e60-loc_046e4e
	dc.w loc_046ef2-loc_046e4e
	dc.w loc_046f58-loc_046e4e
	dc.w loc_046f8a-loc_046e4e
	dc.w loc_046ff2-loc_046e4e
	dc.w loc_04700a-loc_046e4e
	dc.w loc_04701e-loc_046e4e
	dc.w loc_047032-loc_046e4e

	dc.w loc_04705c-loc_046e4e

;===============================================================================
loc_046e60:
	tst.b ($15d,a6)
	bne.b loc_046e80
	movea.w ($38,a6),a4
	cmpi.b #$16,($102,a4)
	bne.b loc_046e80
	move.b #8,(6,a6)
	moveq #$33,d0
	jmp loc_02a708

loc_046e80:
	addq.b #2,(6,a6)
	clr.b ($3c,a6)
	clr.b ($48,a6)
	move.b #1,($31,a6)
	move.l #$ffff4000,($44,a6)
	move.w ($64,a6),($14,a6)
	addi.w #$30,($14,a6)
	tst.b ($15d,a6)
	beq.b loc_046ef2
	movea.w ($38,a6),a4
	cmpi.b #9,($102,a4)
	bne.b loc_046ecc
	move.w ($10,a6),($4a,a6)
	moveq #$30,d0
	tst.b ($b,a6)
	beq.b loc_046ec8
	neg.w d0

loc_046ec8:
	add.w d0,($10,a6)

loc_046ecc:
	move.w ($64,a6),($14,a6)
	addi.w #$60,($14,a6)
	moveq #$32,d0
	jsr loc_02a708
	jsr loc_01c2c8
	beq.b loc_046ef2
	move.l #$1001e02,(a4)
	move.w a6,($36,a4)

;===============================================================================
loc_046ef2:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($14,a6),d0
	subi.w #$28,d0
	cmp.w ($64,a6),d0
	bcc.b loc_046f38
	addq.b #2,(6,a6)
	move.b #1,($3c,a6)
	tst.b ($15d,a6)
	beq.b loc_046f38
	jsr loc_01c2c8
	beq.b loc_046f2a
	move.l #$1001e04,(a4)
	move.w a6,($36,a4)

loc_046f2a:
	jsr loc_02c0ac
	moveq #$34,d0
	jmp loc_02a708

loc_046f38:
	tst.b ($15d,a6)
	beq.b loc_046f52
	jsr loc_02c0ac
	eori.b #1,($48,a6)
	move.b ($48,a6),d0
	add.b d0,($d,a6)

loc_046f52
	jmp loc_02a7ea

;===============================================================================
loc_046f58:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($14,a6),d0
	subi.w #$20,d0
	cmp.w ($64,a6),d0
	bcc.b loc_046f84
	addq.b #2,(6,a6)
	jsr loc_01c2c8
	beq.b loc_046f84
	move.l #$1001e00,(a4)
	move.w a6,($36,a4)

loc_046f84:
	jmp loc_02a7ea

;===============================================================================
loc_046f8a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($14,a6),d0
	subi.w #$10,d0
	cmp.w ($64,a6),d0
	bcc.w loc_048d36
	addq.b #2,(6,a6)
	move.b #2,($3c,a6)
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	tst.b ($15d,a6)
	beq.b loc_046fea
	movea.w ($38,a6),a4
	cmpi.b #9,($102,a4)
	bne.b loc_046fe2
	move.b #$a,(6,a6)
	moveq #$19,d0
	jmp loc_02a758

loc_046fe2:
	moveq #$17,d0
	jsr loc_0038e4

loc_046fea:
	moveq #$31,d0
	jmp loc_02a708

;===============================================================================
loc_046ff2:
	tst.b ($33,a6)
	bpl.w loc_048d36
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;===============================================================================
loc_04700a:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(6,a6)
	moveq #$35,d0
	jmp loc_02a708

;===============================================================================
loc_04701e:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(6,a6)
	moveq #$36,d0
	jmp loc_02a708

;===============================================================================
loc_047032:
	tst.b ($35,a6)
	beq.b loc_047042
	clr.b ($35,a6)
	move.b #$3e,($2a0,a6)

loc_047042:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(6,a6)
	move.w ($4a,a6),($10,a6)
	moveq #$1c,d0
	jmp loc_02a758

;===============================================================================
loc_04705c:
	tst.b ($35,a6)
	beq.b loc_04706c
	clr.b ($35,a6)
	move.b #0,($2a0,a6)

loc_04706c:
	tst.b ($33,a6)
	bpl.w loc_048d36
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################################################
;
;##############################################################################
loc_047084:
	move.b (6,a6),d0
	move.w loc_047090(pc,d0.w),d1
	jmp loc_047090(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047090:
	dc.w loc_047096-loc_047090
	dc.w loc_0470a8-loc_047090
	dc.w loc_047100-loc_047090

;==============================================================================
loc_047096:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================================================
loc_0470a8:
	tst.b ($124,a5)
	bne.b loc_0470e4
	tst.b ($11c,a5)
	bne.b loc_0470e4
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.b loc_0470d6
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_0470ea(pc,d0.w),d0

loc_0470d6:
	move.b d0,($3c,a6)
	move.b loc_0470fa(pc,d0.w),d0
	jmp loc_02a708

loc_0470e4:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0470ea:
	dc.b $00,$00,$00,$00,$01,$01,$01,$01
	dc.b $02,$02,$02,$02,$00,$00,$01,$02

loc_0470fa:
	dc.b $23,$24,$25
	dc.b $23,$24,$25

;==============================================================================
loc_047100:
	move.b ($3c,a6),d0
	add.w d0,d0
	move.w loc_04710e(pc,d0.w),d1
	jmp loc_04710e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04710e:
	dc.w loc_04711a-loc_04710e
	dc.w loc_04711a-loc_04710e
	dc.w loc_047136-loc_04710e
	dc.w loc_04711a-loc_04710e
	dc.w loc_04711a-loc_04710e
	dc.w loc_047136-loc_04710e

;------------------------------------------------------------------------------
loc_04711a:
	jsr loc_02a7ea

loc_047120:
	tst.b ($3a,a6)
	beq.b loc_047134
	subq.b #1,($3a,a6)
	bne.b loc_047134
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_047134:
	rts

;------------------------------------------------------------------------------
loc_047136:
	move.b (7,a6),d0
	move.w loc_047142(pc,d0.w),d1
	jmp loc_047142(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047142:
	dc.w loc_047146-loc_047142
	dc.w loc_04718c-loc_047142

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_047146:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	bne.b loc_04715e
	clr.b ($35,a6)
	move.b #$3e,($2a0,a6)

loc_04715e:
	cmpi.b #2,($35,a6)
	bne.b loc_04718a
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.b ($3b,a6)
	move.w ($64,a6),($14,a6)
	addi.w #$20,($14,a6)
	move.b #1,($31,a6)
	move.b #0,($2a0,a6)

loc_04718a:
	bra.b loc_047120

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04718c:
	jsr loc_02a7ea
	addq.b #1,($3b,a6)
	andi.b #$3f,($3b,a6)
	jsr RNGFunction
	andi.w #1,d0
	beq.b loc_0471ac
	move.w #$40,d0

loc_0471ac:
	add.b ($3b,a6),d0
	add.w d0,d0
	move.w loc_0471c2(pc,d0.w),d0
	swap d0
	asr.l #8,d0
	add.l d0,($14,a6)
	bra.w loc_047120

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0471c2:
	dc.w $0040,$0040,$0040,$0040,$0080,$0080,$0080,$0080
	dc.w $0100,$0100,$0100,$0100,$0180,$0180,$0180,$0180
	dc.w $0180,$0180,$0180,$0180,$0100,$0100,$0100,$0100
	dc.w $0080,$0080,$0080,$0080,$0040,$0040,$0040,$0040
	dc.w $ffc0,$ffc0,$ffc0,$ffc0,$ff80,$ff80,$ff80,$ff80
	dc.w $ff00,$ff00,$ff00,$ff00,$fe80,$fe80,$fe80,$fe80
	dc.w $fe80,$fe80,$fe80,$fe80,$ff00,$ff00,$ff00,$ff00
	dc.w $ff80,$ff80,$ff80,$ff80,$ffc0,$ffc0,$ffc0,$ffc0
	dc.w $0020,$0020,$0020,$0020,$0040,$0040,$0040,$0040
	dc.w $0080,$0080,$0080,$0080,$0100,$0100,$0100,$0100
	dc.w $0100,$0100,$0100,$0100,$0080,$0080,$0080,$0080
	dc.w $0040,$0040,$0040,$0040,$0020,$0020,$0020,$0020
	dc.w $ffe0,$ffe0,$ffe0,$ffe0,$ff80,$ff80,$ff80,$ff80
	dc.w $ff80,$ff80,$ff80,$ff80,$ff00,$ff00,$ff00,$ff00
	dc.w $ff00,$ff00,$ff00,$ff00,$ff80,$ff80,$ff80,$ff80
	dc.w $ff80,$ff80,$ff80,$ff80,$ffe0,$ffe0,$ffe0,$ffe0

;##############################################################################
;Normals
;##############################################################################
loc_0472c2:
	tst.b ($80,a6)
	bne.w loc_0473d6
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_047356
	move.b (7,a6),d0
	move.w loc_0472e2(pc,d0.w),d1
	jmp loc_0472e2(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0472e2:
	dc.w loc_0472e6-loc_0472e2
	dc.w loc_047350-loc_0472e2

;==============================================================================
loc_0472e6:
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
	bne.b loc_047326
	cmpi.b #1,($132,a6)
	bne.b loc_047326
	btst.b #0,($83,a6)
	bne.b loc_04733a
	bra.b loc_047338

loc_047326:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_04734a(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_04733a

loc_047338:
	addq.b #1,d0

loc_04733a:
	tst.b ($15d,a6)
	beq.b loc_047344
	addi.b #$1e,d0

loc_047344:
	jmp loc_02a710
	
;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04734a:
	dc.w $0030,$0028,$0040

;==============================================================================
loc_047350:
	jmp loc_02f5ac

;==============================================================================
;
;==============================================================================
loc_047356:
	move.b (7,a6),d0
	move.w loc_047362(pc,d0.w),d1
	jmp loc_047362(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047362:
	dc.w loc_047366-loc_047362
	dc.w loc_0473d0-loc_047362

;------------------------------------------------------------------------------
loc_047366:
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
	bne.b loc_0473a6
	cmpi.b #1,($132,a6)
	bne.b loc_0473a6
	btst.b #0,($83,a6)
	bne.b loc_0473ba
	bra.b loc_0473b8

loc_0473a6:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_0473ca(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_0473ba

loc_0473b8:
	addq.b #1,d0

loc_0473ba:
	tst.b ($15d,a6)
	beq.b loc_0473c4
	addi.b #$1e,d0

loc_0473c4:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0473ca:
	dc.w $0030,$0040,$0030

;------------------------------------------------------------------------------
loc_0473d0:
	jmp loc_02f5ac

;==============================================================================
;
;==============================================================================
loc_0473d6
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_0473e8(pc,d0.w),d1
	jmp loc_0473e8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0473e8:
	dc.w loc_0473f2-loc_0473e8
	dc.w loc_047440-loc_0473e8
	dc.w loc_047446-loc_0473e8
	dc.w loc_047474-loc_0473e8
	dc.w loc_0474a0-loc_0473e8

;------------------------------------------------------------------------------
loc_0473f2:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_04742e
	moveq #$f,d0
	cmpi.b #4,($82,a6)
	bne.b loc_04742e
	move.b #4,(7,a6)

loc_04742e:
	add.b d1,d0
	tst.b ($15d,a6)
	beq.b loc_04743a
	addi.b #$1e,d0
 
loc_04743a:
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_047440:
	jmp loc_02f5ac

;------------------------------------------------------------------------------
loc_047446:
	tst.b ($35,a6)
	beq.b loc_04746e
	addq.b #2,(7,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_04746e
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_04746e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_047474:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.b loc_04749e
	addq.b #2,(7,a6)
	clr.w ($12,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_04749e:
	rts

;------------------------------------------------------------------------------
loc_0474a0:
	tst.b ($33,a6)
	bmi.b loc_0474ac
	jmp loc_02a7ea

loc_0474ac:
	jmp loc_02bb26

;##############################################################################
;
;##############################################################################
loc_0474b2:
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
	beq.b loc_0474e2
	moveq #$18,d0

loc_0474e2:
	tst.b ($81,a6)
	beq.b loc_0474ea
	addq.w #3,d0

loc_0474ea:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.w d1,d0
	tst.b ($15d,a6)
	beq.b loc_0474fe
	addi.b #$1e,d0

loc_0474fe:
	jmp loc_02a710

;##############################################################################
;Special Move Inputs
;##############################################################################
loc_047504:
	jsr loc_02e096
	bne.w loc_047598

loc_04750e:
	lea.l ($1b0,a6),a4
	jsr loc_02d76a
	bne.w loc_0477be

loc_04751c:
	lea.l ($1a8,a6),a4
	jsr loc_02d762
	bne.w loc_04777e

loc_04752a:
	lea.l ($198,a6),a4
	jsr loc_02d682
	bne.w loc_047732

loc_047538:
	lea.l ($1a0,a6),a4
	jsr loc_02d68a
	bne.w loc_047758

loc_047546:
	lea.l ($1c0,a6),a4
	jsr loc_02d73a
	bne.w loc_047654

loc_047554:
	lea.l ($190,a6),a4
	jsr loc_02d732
	bne.w loc_0475fa

loc_047562:
	lea.l ($188,a6),a4
	jsr loc_02d742
	bne.w loc_047626

loc_047570:
	lea.l ($180,a6),a4
	jsr loc_02d72a
	bne.w loc_0476b2

loc_04757e:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_047800

loc_04758c:
	jsr loc_02e0cc
	bne.w loc_047682

loc_047596:
	rts
;==============================================================================
;Move ID writes
;==============================================================================
loc_047598:
	tst.b ($28a,a6)
	bne.w loc_04750e
	tst.b ($31,a6)
	bne.b loc_0475d4
	jsr loc_02ef54
	beq.w loc_04750e
	jsr loc_02ecd8
	beq.w loc_04750e
	move.l #$2001000,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_0475d4:
	tst.b ($b9,a6)
	bne.w loc_04750e
	jsr loc_02ed28
	beq.w loc_04750e
	move.l #$2001000,(4,a6)
	move.b #$14,($aa,a6)
	jmp loc_02f980

;==============================================================================
loc_0475fa:
	jsr loc_02ed00
	beq.w loc_047562
	move.l #$2000e00,(4,a6)
	clr.b ($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;==============================================================================
loc_047626:
	jsr loc_02ed00
	beq.w loc_047570
	move.l #$2000e00,(4,a6)
	move.b #2,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;==============================================================================
loc_047654:
	jsr loc_02ed00
	beq.w loc_047554
	move.l #$2000e00,(4,a6)
	move.b #$c,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;==============================================================================
loc_047682:
	tst.b ($b9,a6)
	bne.b loc_047690
	tst.b ($bc,a6)
	beq.w loc_047596

loc_047690:
	jsr loc_02ed00
	beq.w loc_047596
	move.l #$2000e00,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	bra.w loc_048d3c

;==============================================================================
loc_0476b2:
	tst.b ($132,a6)
	bmi.w loc_047704
	tst.b ($b9,a6)
	bne.b loc_0476cc
	tst.b ($238,a6)
	bne.w loc_04757e
	bra.w loc_0476d6

loc_0476cc:
	cmpi.b #2,($238,a6)
	bcc.w loc_04757e

loc_0476d6:
	jsr loc_02ed00
	beq.w loc_04757e
	move.l #$2000e00,(4,a6)
	move.b #4,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

loc_047704:
	jsr loc_02ed00
	beq.w loc_04757e
	move.l #$2000e00,(4,a6)
	move.b #$16,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;==============================================================================
loc_047732:
	tst.b ($132,a6)
	bmi.w loc_047538
	jsr loc_02ed00
	beq.w loc_047538
	move.b #6,($aa,a6)
	move.b #0,($1f6,a6)
	bsr.w loc_048d3c
	bra.w loc_047894

;==============================================================================
loc_047758:
	tst.b ($132,a6)
	bmi.w loc_047546
	jsr loc_02ed00
	beq.w loc_047546
	move.b #6,($aa,a6)
	move.b #4,($1f6,a6)
	bsr.w loc_048d3c
	bra.w loc_047894

;==============================================================================
loc_04777e:
	tst.b ($132,a6)
	bne.w loc_04752a
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04752a
	jsr loc_02ecd8
	beq.w loc_04752a
	move.l #$2001000,(4,a6)
	move.b #8,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

;==============================================================================
loc_0477be:
	cmpi.b #1,($132,a6)
	beq.w loc_04751c
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04751c
	jsr loc_02ecd8
	beq.w loc_04751c
	move.l #$2001000,(4,a6)
	move.b #$a,($aa,a6)
	bsr.w loc_048d3c
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;==============================================================================
loc_047800:
	jsr loc_02edf8
	beq.w loc_04758c

;##############################################################################
;
;##############################################################################
loc_04780a:
	tst.b ($132,a6)
	beq.w loc_047844
	move.l #$2000e00,(4,a6)
	move.b #$e,($aa,a6)
	clr.b ($2c8,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #$16,($5f,a4)
	move.b #$1a,($25d,a6)
	bsr.w loc_048d3c
	moveq #$19,d0
	jmp loc_02a758

;##############################################################################
;
;##############################################################################
loc_047844:
	move.l #$2000e00,(4,a6)
	move.b #$12,($aa,a6)
	clr.b ($2c8,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #$1c,($5f,a4)
	move.b #$24,($25d,a6)
	bsr.w loc_048d3c
	moveq #$19,d0
	jmp loc_02a758
	tst.b ($31,a6)
	bne.b loc_047890
	cmpi.w #$200,(4,a6)
	bne.b loc_047890
	cmpi.b #$e,(6,a6)
	beq.b loc_047890
	moveq #1,d0
	rts

loc_047890:
	moveq #0,d0
	rts

;==============================================================================
loc_047894:
	move.l #$02000e00,(4,a6)
	clr.b ($82,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	moveq #0,d1
	andi.b #7,d0
	cmpi.b #7,d0
	beq.b loc_0478b6
	moveq #2,d1

loc_0478b6:
	add.b d1,($1f6,a6)
	rts

;==============================================================================
loc_0478bc:
	clr.b ($1f6,a6)
	tst.b ($211,a6)
	beq.b loc_0478ca
	addq.b #4,($1f6,a6)

loc_0478ca:
	tst.b ($81,a6)
	beq.b loc_0478d4
	addq.b #2,($1f6,a6)

loc_0478d4:
	rts

;##############################################################################
;Ai Special move Check
;##############################################################################
loc_0478d6:
	move.b ($aa,a6),d0
	move.w loc_0478e2(pc,d0.w),d1
	jmp loc_0478e2(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0478e2:
	dc.w loc_0478f8-loc_0478e2
	dc.w loc_0478f8-loc_0478e2
	dc.w loc_0478fc-loc_0478e2
	dc.w loc_047910-loc_0478e2
	dc.w loc_04791e-loc_0478e2
	dc.w loc_047948-loc_0478e2
	dc.w loc_0478f8-loc_0478e2
	dc.w loc_047974-loc_0478e2

	dc.w loc_047910-loc_0478e2
	dc.w loc_047974-loc_0478e2
	dc.w loc_0478f8-loc_0478e2

;==============================================================================
loc_0478f8:
	bra.w loc_04797c

;==============================================================================
loc_0478fc:
	tst.b ($132,a6)
	bmi.w loc_047980
	tst.b ($238,a6)
	bne.w loc_047980
	bra.w loc_04797c

;==============================================================================
loc_047910:
	tst.b ($132,a6)
	bmi.w loc_047980
	bsr.b loc_0478bc
	bra.w loc_04797c

;==============================================================================
loc_04791e:
	tst.b ($15d,a6)
	bne.b loc_04793a
	tst.b ($132,a6)
	bne.w loc_047980
	cmpi.w #$30,($11e,a6)
	bcs.w loc_047980
	bra.w loc_04797c

loc_04793a:
	cmpi.w #$90,($11e,a6)
	bcs.w loc_047980
	bra.w loc_04797c

;==============================================================================
loc_047948:
	tst.b ($15d,a6)
	bne.b loc_047966
	cmpi.b #1,($132,a6)
	beq.w loc_047980
	cmpi.w #$30,($11e,a6)
	bcs.w loc_047980
	bra.w loc_04797c

loc_047966:
	cmpi.w #$90,($11e,a6)
	bcs.w loc_047980
	bra.w loc_04797c

;==============================================================================
loc_047974:
	tst.b ($132,a6)
	bmi.w loc_047980

;------------------------------------------------------------------------------
loc_04797c:
	moveq #1,d0
	rts

;------------------------------------------------------------------------------
loc_047980:
	moveq #0,d0
	rts

;##############################################################################
;Special moves
;##############################################################################
loc_047984:
	move.b ($aa,a6),d0
	move.w loc_047990(pc,d0.w),d1
	jmp loc_047990(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047990:
	dc.w loc_0479cc-loc_047990
	dc.w loc_047aae-loc_047990
	dc.w loc_047e0e-loc_047990
	dc.w loc_047f9a-loc_047990
	dc.w loc_04807c-loc_047990
	dc.w loc_0483e0-loc_047990
	dc.w loc_0485cc-loc_047990
	dc.w loc_0487e8-loc_047990

	dc.w loc_048908-loc_047990
	dc.w loc_04882c-loc_047990
	dc.w loc_048954-loc_047990
	dc.w loc_0489d6-loc_047990

;##############################################################################
;
;##############################################################################
loc_0479a8:
	move.b ($aa,a6),d0
	move.w loc_0479b4(pc,d0.w),d1
	jmp loc_0479b4(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0479b4:
	dc.w loc_0479cc-loc_0479b4
	dc.w loc_047aca-loc_0479b4
	dc.w loc_047e0e-loc_0479b4
	dc.w loc_047f9a-loc_0479b4
	dc.w loc_04807c-loc_0479b4
	dc.w loc_0483e0-loc_0479b4
	dc.w loc_0485e2-loc_0479b4
	dc.w loc_0487e8-loc_0479b4

	dc.w loc_048908-loc_0479b4
	dc.w loc_04882c-loc_0479b4
	dc.w loc_048954-loc_0479b4
	dc.w loc_0489d6-loc_0479b4

;==============================================================================
;
;==============================================================================
loc_0479cc:
	move.b (7,a6),d0
	move.w loc_0479d8(pc,d0.w),d1
	jmp loc_0479d8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0479d8:
	dc.w loc_0479de-loc_0479d8
	dc.w loc_047a6a-loc_0479d8
	dc.w loc_047a9a-loc_0479d8

;------------------------------------------------------------------------------
loc_0479de:
	addq.b #2,(7,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #1,($31,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_047a3a(pc,d0.w),d1
	move.l loc_047a3a+4(pc,d0.w),($44,a6)
	move.l loc_047a3a+8(pc,d0.w),d2
	move.l loc_047a3a+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_047a22
	neg.l d1
	neg.l d2

loc_047a22:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #5,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047a3a:
	dc.l $00050000,$00020000,$ffffe000,$ffffd000
	dc.l $00070000,$00020000,$ffffe000,$ffffd000
	dc.l $00090000,$00020000,$ffffe000,$ffffd000

;------------------------------------------------------------------------------
loc_047a6a:
	tst.b ($35,a6)
	bne.b loc_047a94
	bsr.w loc_048d0e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_047a94
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	clr.b ($ce,a6)

loc_047a94:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_047a9a:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_047aae:
	move.b (7,a6),d0
	move.w loc_047aba(pc,d0.w),d1
	jmp loc_047aba(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047aba:
	dc.w loc_047ae6-loc_047aba
	dc.w loc_047b84-loc_047aba
	dc.w loc_047ba2-loc_047aba
	dc.w loc_047bd2-loc_047aba
	dc.w loc_047bf8-loc_047aba
	dc.w loc_047c60-loc_047aba
	dc.w loc_047cca-loc_047aba
	dc.w loc_047d0c-loc_047aba

;==============================================================================
;
;==============================================================================
loc_047aca:
	move.b (7,a6),d0
	move.w loc_047ad6(pc,d0.w),d1
	jmp loc_047ad6(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047ad6:
	dc.w loc_047ae6-loc_047ad6
	dc.w loc_047b84-loc_047ad6
	dc.w loc_047ba2-loc_047ad6
	dc.w loc_047bd2-loc_047ad6
	dc.w loc_047bf8-loc_047ad6
	dc.w loc_047c96-loc_047ad6
	dc.w loc_047cca-loc_047ad6
	dc.w loc_047d0c-loc_047ad6

;------------------------------------------------------------------------------
loc_047ae6:
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$c0000,d1
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	bpl.b loc_047b18
	neg.l d1

loc_047b18:
	add.l d1,d0
	asr.l #5,d0
	move.l d0,($40,a6)
	clr.l ($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff7000,($4c,a6)
	lea.l loc_048dc0(pc),a0
	tst.b ($31,a4)
	bne.b loc_047b4c
	lea.l ($40,a0),a0
	tst.b ($2c8,a4)
	bne.b loc_047b4c
	lea.l ($40,a0),a0

loc_047b4c:
	moveq #0,d0
	moveq #0,d1
	move.b ($102,a4),d0
	add.w d0,d0
	move.w (a0,d0.w),d1
	move.w d1,($1f0,a6)
	swap d1
	add.l ($14,a4),d1
	sub.l ($14,a6),d1
	cmpi.l #$900000,d1
	bls.b loc_047b76
	move.l #$900000,d1

loc_047b76:
	asr.l #5,d1
	add.l d1,($44,a6)
	moveq #$a,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047b84:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($5b,a6)
	moveq #$b,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047ba2:
	bsr.w loc_047d5e
	bcs.w loc_047dc8
	tst.w ($44,a6)
	bpl.w loc_048d36
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$e,d0
	jmp loc_02a758

;==============================================================================
loc_047bc6:
	addq.b #2,(7,a6)
	moveq #$c,d0
	jmp loc_02a758

;==============================================================================
;
;==============================================================================
loc_047bd2:
	bsr.w loc_047d5e
	bcs.w loc_047dc8
	tst.b ($5b,a6)
	beq.w loc_048d36
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #$10,($5f,a4)
	moveq #$c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047bf8:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #$2,(7,a6)
	move.l #$60000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	move.b ($83,a6),d1
	andi.w #3,d1
	beq.b loc_047c4a
	btst #1,d1
	beq.b loc_047c4a
	eori.b #1,($b,a6)
	move.l #$80000,($40,a6)
	move.l #$ffffb000,($48,a6)

loc_047c4a:
	tst.b ($b,a6)
	beq.b loc_047c58
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_047c58:
	moveq #$d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047c60:
	bsr.w loc_047de6
	bsr.w loc_047d5e
	bcs.w loc_047dc8
	tst.w ($44,a6)
	bpl.w loc_048d36
	move.w ($11a,a6),d1
	moveq #0,d0
	btst #8,d1
	bne.b loc_047c92
	moveq #1,d0
	btst #9,d1
	bne.b loc_047c92
	moveq #2,d0
	btst #$a,d1
	beq.w loc_048d36

loc_047c92:
	bra.w loc_047d92

;------------------------------------------------------------------------------
loc_047c96:
	bsr.w loc_047d5e
	bcs.w loc_047dc8
	tst.w ($44,a6)
	bpl.w loc_048d36
	jsr RNGFunction
	andi.w #$f,d0
	bne.w loc_048d36
	jsr RNGFunction
	andi.w #3,d0
	cmpi.w #3,d0
	beq.w loc_048d36
	bra.w loc_047d92

;------------------------------------------------------------------------------
loc_047cca:
	tst.b ($35,a6)
	bne.w loc_048d36
	bsr.w loc_047de6
	tst.b ($35,a6)
	bne.w loc_048d36
	bsr.w loc_047d20
	bcc.w loc_048d36
	addq.b #2,(7,a6)
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$30,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047d0c:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
loc_047d20:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	tst.l ($44,a6)
	bpl.b loc_047d5a
	move.w ($14,a6),d0
	tst.b ($132,a6)
	bpl.b loc_047d54
	addi.w #$18,d0

loc_047d54:
	cmp.w ($64,a6),d0
	rts

loc_047d5a:
	moveq #0,d0
	rts

;==============================================================================
loc_047d5e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	tst.l ($44,a6)
	bpl.b loc_047d8e
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	rts

loc_047d8e:
	moveq #0,d0
	rts

;==============================================================================
loc_047d92:
	addq.b #2,(7,a6)
	addi.w #$11,d0
	tst.b ($132,a6)
	bpl.b loc_047da4
	addi.w #$26,d0

loc_047da4:
	jsr loc_02a758
	move.l #$fffd8000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jmp loc_020674

;==============================================================================
loc_047dc8:
	move.b #$e,(7,a6)
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$30,d0
	jmp loc_02a758

;==============================================================================
loc_047de6:
	tst.b ($125,a6)
	bne.b loc_047e0c
	move.b ($83,a6),d1
	andi.b #3,d1
	beq.b loc_047e0c
	moveq #-3,d0
	btst #1,d1
	bne.b loc_047e00
	moveq #3,d0

loc_047e00:
	tst.b ($b,a6)
	beq.b loc_047e08
	neg.w d0

loc_047e08:
	add.w d0,($10,a6)

loc_047e0c:
	rts

;==============================================================================
;
;==============================================================================
loc_047e0e:
	move.b (7,a6),d0
	move.w loc_047e1a(pc,d0.w),d1
	jmp loc_047e1a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047e1a:
	dc.w loc_047e20-loc_047e1a
	dc.w loc_047e48-loc_047e1a
	dc.w loc_047f76-loc_047e1a

;------------------------------------------------------------------------------
loc_047e20:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #2,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047e48:
	tst.b ($35,a6)
	beq.w loc_047f4e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_01c1c8
	beq.w loc_047f4e
	addq.b #1,(a4)
	move.b #$a,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_047f54
	tst.b ($b9,a6)
	beq.w loc_047f4e
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_047f4e
	jsr loc_01c1c8
	beq.b loc_047f4e
	addq.b #1,(a4)
	move.b #$a,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_047f54

loc_047f4e:
	jmp loc_02a7ea

;==============================================================================
loc_047f54:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_047f70(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047f70:
	dc.w $000a,$000b,$000c

;------------------------------------------------------------------------------
loc_047f76:
	cmpi.b #1,($35,a6)
	bne.b loc_047f86
	clr.b ($35,a6)
	clr.b ($ce,a6)

loc_047f86:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_047f9a:
	move.b (7,a6),d0
	move.w loc_047fa6(pc,d0.w),d1
	jmp loc_047fa6(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_047fa6:
	dc.w loc_047fae-loc_047fa6
	dc.w loc_047fc4-loc_047fa6
	dc.w loc_047fec-loc_047fa6
	dc.w loc_04804a-loc_047fa6

;------------------------------------------------------------------------------
loc_047fae:
	addq.b #2,(7,a6)
	clr.b ($1fb,a6)
	jsr loc_020674
	moveq #8,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_047fc4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_047fda
	clr.b ($35,a6)
	move.b #$3e,($2a0,a6)

loc_047fda:
	tst.b ($33,a6)
	bpl.b loc_047fea
	addq.b #2,(7,a6)
	move.b #$c,($3a,a6)

loc_047fea:
	rts

;------------------------------------------------------------------------------
loc_047fec:
	subq.b #1,($3a,a6)
	bpl.b loc_048040
	addq.b #2,(7,a6)
	jsr loc_01bd68
	move.w ($10,a3),d2
	move.b ($1f6,a6),d0
	ext.w d0
	move.w loc_048042(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_048016
	addi.w #$180,d2
	neg.w d1

loc_048016:
	add.w d2,d1
	move.w d1,($10,a6)
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	beq.b loc_048038
	moveq #1,d0
	tst.b ($b,a4)
	bne.b loc_048030
	neg.w d0

loc_048030:
	add.w d0,($10,a4)
	clr.b ($ac,a4)

loc_048038:
	moveq #9,d0
	jmp loc_02a758

loc_048040:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048042:
	dc.w $0100,$0160,$0080,$0020

;------------------------------------------------------------------------------
loc_04804a:
	jsr loc_02a7ea
	cmpi.b #1,($34,a6)
	bne.b loc_048062
	clr.b ($34,a6)
	move.b ($2c9,a6),($b,a6)

loc_048062:
	tst.b ($35,a6)
	beq.b loc_048072
	clr.b ($35,a6)
	move.b #0,($2a0,a6)

loc_048072:
	tst.b ($33,a6)
	bmi.w loc_048d30
	rts

;==============================================================================
;
;==============================================================================
loc_04807c:
	tst.b ($15d,a6)
	bne.w loc_04821c
	move.b (7,a6),d0
	move.w loc_048090(pc,d0.w),d1
	jmp loc_048090(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048090:
	dc.w loc_048098-loc_048090
	dc.w loc_0480f8-loc_048090
	dc.w loc_048190-loc_048090
	dc.w loc_04820e-loc_048090

;------------------------------------------------------------------------------
loc_048098:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	move.b #2,($294,a6)
	st.b ($29e,a6)
	clr.b ($3c,a6)
	move.b ($82,a6),d0
	ext.w d0
	move.b loc_0480f2(pc,d0.w),($1fa,a6)
	move.b loc_0480f2+1(pc,d0.w),($3a,a6)
	move.b #1,($216,a6)
	clr.b ($1f8,a6)
	clr.b ($1f9,a6)
	clr.b ($ab,a6)
	jsr loc_08b33c
	move.b ($82,a6),d0
	ext.w d0
	lsr.b #1,d0
	addi.w #$26,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0480f2:
	dc.b $02,$10
	dc.b $03,$20
	dc.b $05,$60

;------------------------------------------------------------------------------
loc_0480f8:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bpl.b loc_048144
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.l #$90000,d0
	tst.b ($b,a6)
	bne.b loc_04812e
	neg.l d0

loc_04812e:
	move.l d0,($40,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsr.w #1,d0
	addi.w #$29,d0
	jmp loc_02a758

loc_048144:
	cmpi.b #2,d0
	bne.b loc_048168
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_048160
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_048160:
	move.b loc_04818c(pc,d0.w),($25d,a6)
	rts

loc_048168:
	cmpi.b #1,d0
	bne.b loc_04818a
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_048178
	moveq #1,d0

loc_048178:
	move.b d0,($ab,a6)
	clr.b ($35,a6)
	moveq #$2f,d0
	moveq #$41,d1
	jmp loc_082e36

loc_04818a:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_04818c:
	dc.b $04,$06,$08,00

;------------------------------------------------------------------------------
loc_048190:
	tst.b ($5b,a6)
	beq.b loc_0481ae
	clr.b ($5b,a6)
	tst.b ($1fa,a6)
	bmi.b loc_0481ae
	subq.b #1,($1fa,a6)
	bpl.b loc_0481ae
	moveq #$2c,d0
	jsr loc_02a758

loc_0481ae:
	subq.b #1,($3a,a6)
	bmi.b loc_0481e2
	move.b ($ac,a6),d0
	subq.b #1,d0
	cmp.b ($b,a6),d0
	beq.b loc_0481e2
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_02c0ac
	eori.b #1,($3c,a6)
	move.b ($3c,a6),d0
	add.b d0,($d,a6)
	jmp loc_02a7ea

loc_0481e2:
	addq.b #2,(7,a6)
	jsr loc_02c0ac
	moveq #0,d0
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsr.w #1,d0
	addi.w #$2d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_04820e:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_04821c:
	move.b (7,a6),d0
	move.w loc_048228(pc,d0.w),d1
	jmp loc_048228(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048228:
	dc.w loc_048230-loc_048228
	dc.w loc_0482a4-loc_048228
	dc.w loc_0483a4-loc_048228
	dc.w loc_04804a-loc_048228

;------------------------------------------------------------------------------
loc_048230:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	move.b #2,($294,a6)
	st.b ($29e,a6)
	move.b #1,($216,a6)
	move.b #1,($2af,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b d0,($1f8,a6)
	move.b d0,($1f9,a6)
	move.b d0,($ab,a6)
	jsr loc_0804da
	jsr loc_01bd68
	moveq #0,d0
	move.w ($10,a3),d0
	sub.w ($10,a6),d0
	tst.b ($b,a6)
	bne.b loc_048294
	addi.w #$1c0,d0

loc_048294:
	swap d0
	asr.l #4,d0
	move.l d0,($40,a6)
	moveq #$31,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0482a4:
	jsr loc_02a7ea
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($33,a6)
	bpl.w loc_048354
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.w #$60,($3a,a6)
	move.l #$90000,($40,a6)
	clr.b ($2af,a6)
	clr.b (1,a6)
	tst.b ($b,a6)
	bne.b loc_0482e4
	neg.l ($40,a6)

loc_0482e4:
	jsr loc_01c1c8
	beq.b loc_048352
	addq.b #1,(a4)
	move.w #$2300,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	addq.w #4,d0
	move.w d0,($50,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_048352:
	rts

loc_048354:
	cmpi.b #2,($35,a6)
	bne.b loc_04837a
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_048372
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_048372:
	move.b loc_0483a0(pc,d0.w),($25d,a6)
	rts

loc_04837a:
	cmpi.b #1,($35,a6)
	bne.b loc_04839e
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04838c
	moveq #1,d0

loc_04838c:
	move.b d0,($ab,a6)
	clr.b ($35,a6)
	moveq #$2f,d0
	moveq #$41,d1
	jmp loc_082e36

loc_04839e:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0483a0:
	dc.b $06,$08,$0a,$00

;------------------------------------------------------------------------------
loc_0483a4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	subq.w #1,($3a,a6)
	bpl.b loc_0483de
	addq.b #2,(7,a6)
	clr.b ($216,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(1,a6)
	clr.b ($31,a6)
	move.b #$3e,($2a0,a6)
	move.w ($64,a6),($14,a6)
	moveq #9,d0
	jmp loc_02a758

loc_0483de:
	rts

;==============================================================================
;
;==============================================================================
loc_0483e0:
	move.b (7,a6),d0
	move.w loc_0483ec(pc,d0.w),d1
	jmp loc_0483ec(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0483ec:
	dc.w loc_0483f8-loc_0483ec
	dc.w loc_04846c-loc_0483ec
	dc.w loc_048516-loc_0483ec
	dc.w loc_048560-loc_0483ec
	dc.w loc_04858e-loc_0483ec
	dc.w loc_0485be-loc_0483ec

;------------------------------------------------------------------------------
loc_0483f8:
	addq.b #2,(7,a6)
	move.b #1,($216,a6)
	jsr loc_02f53c
	jsr loc_02068c
	move.b #1,($31,a6)
	clr.b ($ab,a6)
	move.l #$80000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.l #$28000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_048446
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_048446:
	move.w #$ffe7,d0
	move.w #$44,d1
	jsr loc_082e36
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$1d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_04846c:
	jsr loc_02a7ea
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04847c
	moveq #1,d0

loc_04847c:
	move.b d0,($ab,a6)
	tst.b ($35,a6)
	bne.b loc_0484ec
	clr.b ($ab,a6)
	cmpi.b #1,($34,a6)
	beq.b loc_0484ea
	bsr.w loc_048d0e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0484ea
	addq.b #2,(7,a6)
	jsr loc_00369c
	move.l #$a0000,($40,a6)
	move.l #$fffff000,($48,a6)
	move.l #$28000,($44,a6)
	move.l #$ffffd000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_0484d8
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0484d8:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$20,d0
	jmp loc_02a758

loc_0484ea:
	rts

loc_0484ec:
	cmpi.b #2,($35,a6)
	bne.b loc_048510
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_04850a
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04850a:
	move.b loc_048512(pc,d0.w),($25d,a6)

loc_048510:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048512:
	dc.b $04,$08,$11,$00

;------------------------------------------------------------------------------
loc_048516:
	bsr.w loc_048d0e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_048d36
	move.b #$a,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$24,d0
	tst.b ($82,a6)
	beq.b loc_04855a
	moveq #$25,d0
	cmpi.b #4,($82,a6)
	bne.b loc_04855a
	move.b #6,(7,a6)
	moveq #$23,d0

loc_04855a:
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048560:
	tst.b ($35,a6)
	beq.b loc_048588
	addq.b #2,(7,a6)
	move.l #$e0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_048588
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_048588:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_04858e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.b loc_0485b8
	addq.b #2,(7,a6)
	clr.w ($12,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_0485b8:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0485be:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_0485cc:
	move.b (7,a6),d0
	move.w loc_0485d8(pc,d0.w),d1
	jmp loc_0485d8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0485d8:
	dc.w loc_0485f8-loc_0485d8
	dc.w loc_04867c-loc_0485d8
	dc.w loc_04869a-loc_0485d8
	dc.w loc_048710-loc_0485d8
	dc.w loc_048728-loc_0485d8

;==============================================================================
;
;==============================================================================
loc_0485e2:
	move.b (7,a6),d0
	move.w loc_0485ee(pc,d0.w),d1
	jmp loc_0485ee(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0485ee:
	dc.w loc_0485f8-loc_0485ee
	dc.w loc_04867c-loc_0485ee
	dc.w loc_0486d4-loc_0485ee
	dc.w loc_048710-loc_0485ee
	dc.w loc_048728-loc_0485ee

;------------------------------------------------------------------------------
loc_0485f8:
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	jsr loc_020674
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #5,d0
	move.l d0,($40,a6)
	clr.l ($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	lea.l loc_048dc0(pc),a0
	tst.b ($31,a4)
	bne.b loc_048644
	lea.l ($40,a0),a0
	tst.b ($2c8,a4)
	bne.b loc_048644
	lea.l ($40,a0),a0

loc_048644:
	moveq #0,d0
	moveq #0,d1
	move.b ($102,a4),d0
	add.w d0,d0
	move.w (a0,d0.w),d1
	move.w d1,($1f0,a6)
	swap d1
	add.l ($14,a4),d1
	sub.l ($14,a6),d1
	cmpi.l #$900000,d1
	bls.b loc_04866e
	move.l #$900000,d1

loc_04866e:
	asr.l #$5,d1
	add.l d1,($44,a6)
	moveq #$a,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_04867c:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($5b,a6)
	moveq #$b,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_04869a:
	bsr.w loc_047d5e
	bcs.w loc_048736
	move.w ($44,a6),d0
	bpl.b loc_0486aa
	neg.w d0

loc_0486aa:
	cmpi.w #5,d0
	bhi.w loc_048d36
	move.w ($378,a6),d1
	moveq #0,d0
	btst #8,d1
	bne.b loc_0486d0
	moveq #1,d0
	btst #9,d1
	bne.b loc_0486d0
	moveq #2,d0
	btst #$a,d1
	beq.w loc_048d36

loc_0486d0:
	bra.w loc_048754

;------------------------------------------------------------------------------
loc_0486d4:
	bsr.w loc_047d5e
	bcs.w loc_048736
	move.w ($44,a6),d0
	bpl.b loc_0486e4
	neg.w d0

loc_0486e4:
	cmpi.w #4,d0
	bhi.w loc_048d36
	jsr RNGFunction
	andi.w #$f,d0
	bne.w loc_048d36
	jsr RNGFunction
	andi.w #3,d0
	cmpi.w #3,d0
	beq.w loc_048d36
	bra.w loc_048754

;------------------------------------------------------------------------------
loc_048710:
	bsr.w loc_047d5e
	bcs.w loc_048736
	tst.b ($35,a6)
	bne.b loc_048722
	bsr.w loc_0487b8

loc_048722:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_048728:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;==============================================================================
loc_048736:
	move.b #8,(7,a6)
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$30,d0
	jmp loc_02a758

;==============================================================================
loc_048754:
	addq.b #2,(7,a6)
	addi.w #$14,d0
	jsr loc_02a758
	move.b #0,($b,a6)
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	cmp.w ($10,a6),d0
	blt.b loc_04877c
	move.b #1,($b,a6)

loc_04877c:
	move.l #$70000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.l #$38000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	beq.b loc_0487aa
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0487aa:
	moveq #6,d0
	jsr loc_02ef6c
	jmp loc_020674

;==============================================================================
loc_0487b8:
	tst.b ($125,a6)
	bne.b loc_0487e6
	move.b ($83,a6),d1
	andi.b #3,d1
	beq.b loc_0487e6
	move.l #$fffc0000,d0
	btst #1,d1
	bne.b loc_0487da
	move.l #$40000,d0

loc_0487da:
	tst.b ($b,a6)
	beq.b loc_0487e2
	neg.l d0

loc_0487e2:
	add.l d0,($10,a6)

loc_0487e6:
	rts

;==============================================================================
;
;==============================================================================
loc_0487e8:
	move.b (7,a6),d0
	move.w loc_0487f4(pc,d0.w),d1
	jmp loc_0487f4(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0487f4:
	dc.w loc_0487fa-loc_0487f4
	dc.w loc_048804-loc_0487f4
	dc.w loc_048818-loc_0487f4

;------------------------------------------------------------------------------
loc_0487fa:
	addq.b #2,(7,a6)
	jmp loc_080e8e

;------------------------------------------------------------------------------
loc_048804:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(7,a6)
	moveq #$1a,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048818:
	tst.b ($33,a6)
	bpl.w loc_048d36
	moveq #0,d0
	move.b d0,($a9,a6)
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_04882c:
	move.b (7,a6),d0
	move.w loc_048838(pc,d0.w),d1
	jmp loc_048838(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048838:
	dc.w loc_048840-loc_048838
	dc.w loc_04884a-loc_048838
	dc.w loc_0488ac-loc_048838
	dc.w loc_0488ea-loc_048838

;------------------------------------------------------------------------------
loc_048840:
	addq.b #2,(7,a6)
	jmp loc_080e8e

;------------------------------------------------------------------------------
loc_04884a:
	tst.b ($33,a6)
	bpl.w loc_048d36
	movea.w ($38,a6),a4
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	bpl.b loc_048862
	neg.w d0

loc_048862:
	cmpi.w #$a0,d0
	bgt.b loc_048892
	tst.b ($239,a6)
	bne.b loc_048892
	move.w ($14,a6),d0
	sub.w ($14,a4),d0
	bpl.b loc_04887a
	neg.w d0

loc_04887a:
	cmpi.w #$60,d0
	bgt.b loc_048892
	tst.b ($239,a6)
	bne.b loc_048892
	addq.b #2,(7,a6)
	moveq #$1b,d0
	jmp loc_02a758

loc_048892:
	move.b #6,(7,a6)
	move.b #$3e,($2a0,a6)
	move.b #8,($25d,a6)
	moveq #$1c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0488ac:
	tst.b ($35,a6)
	beq.b loc_0488bc
	clr.b ($35,a6)
	move.b #$3e,($2a0,a6)

loc_0488bc:
	tst.b ($33,a6)
	bpl.w loc_048d36
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.w ($10,a4),($10,a6)
	moveq #$70,d0
	move.b ($b,a4),($b,a6)
	bne.b loc_0488de
	neg.w d0

loc_0488de:
	sub.w d0,($10,a6)
	moveq #$1c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0488ea:
	tst.b ($35,a6)
	beq.b loc_0488fa
	clr.b ($35,a6)
	move.b #0,($2a0,a6)

loc_0488fa:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_048908:
	move.b (7,a6),d0
	move.w loc_048914(pc,d0.w),d1
	jmp loc_048914(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048914:
	dc.w loc_048918-loc_048914
	dc.w loc_048946-loc_048914

;------------------------------------------------------------------------------
loc_048918:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_04892c
	subq.b #1,($bc,a6)

loc_04892c:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	moveq #$17,d0
	btst.b #1,($83,a6)
	beq.b loc_048940
	addq.b #1,d0

loc_048940:
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048946:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;==============================================================================
;
;==============================================================================
loc_048954:
	move.b (7,a6),d0
	move.w loc_048960(pc,d0.w),d1
	jmp loc_048960(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048960:
	dc.w loc_048966-loc_048960
	dc.w loc_048986-loc_048960
	dc.w loc_0489ba-loc_048960

;------------------------------------------------------------------------------
loc_048966:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_048980
	moveq #$2f,d0

loc_048980:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_048986:
	tst.b ($34,a6)
	beq.b loc_0489b4
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #0,d0
	moveq #$59,d1
	tst.b ($31,a6)
	beq.b loc_0489aa
	moveq #-$1d,d0
	moveq #$56,d1

loc_0489aa:
	jsr loc_097cd6
	bsr.w loc_048d78

loc_0489b4:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0489ba:
	subq.b #1,($3a,a6)
	bne.w loc_048d36
	tst.b ($31,a6)
	beq.b loc_0489d0
	move.l #$2000602,(4,a6)

loc_0489d0:
	jmp loc_02f796

;==============================================================================
;
;==============================================================================
loc_0489d6:
	move.b (7,a6),d0
	move.w loc_0489e2(pc,d0.w),d1
	jmp loc_0489e2(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0489e2:
	dc.w loc_0489ea-loc_0489e2
	dc.w loc_048a3c-loc_0489e2
	dc.w loc_048a88-loc_0489e2
	dc.w loc_048afc-loc_0489e2

;------------------------------------------------------------------------------
loc_0489ea:
	addq.b #2,(7,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #2,($294,a6)
	st.b ($29e,a6)
	clr.b ($3c,a6)
	move.b ($82,a6),d0
	ext.w d0
	move.b loc_048a36(pc,d0.w),($1fa,a6)
	move.b loc_048a36+1(pc,d0.w),($3a,a6)
	move.b #1,($216,a6)
	clr.b ($1f8,a6)
	clr.b ($1f9,a6)
	clr.b ($ab,a6)
	moveq #$3a,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048a36:
	dc.b $02,$30
	dc.b $02,$48
	dc.b $02,$60

;------------------------------------------------------------------------------
loc_048a3c:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bpl.b loc_048a7a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_048a7c(pc,d0.w),d0
	tst.b ($b,a6)
	bne.b loc_048a76
	neg.l d0

loc_048a76:
	move.l d0,($40,a6)

loc_048a7a:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048a7c:
	dc.l $00030000
	dc.l $00060000
	dc.l $00090000

;------------------------------------------------------------------------------
loc_048a88:
	tst.b ($5b,a6)
	beq.b loc_048aa6
	clr.b ($5b,a6)
	tst.b ($1fa,a6)
	bmi.b loc_048aa6
	subq.b #1,($1fa,a6)
	bpl.b loc_048aa6
	moveq #$3b,d0
	jsr loc_02a758

loc_048aa6:
	subq.b #1,($3a,a6)
	bmi.b loc_048ada
	move.b ($ac,a6),d0
	subq.b #1,d0
	cmp.b ($b,a6),d0
	beq.b loc_048ada
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_02c0ac
	eori.b #1,($3c,a6)
	move.b ($3c,a6),d0
	add.b d0,($d,a6)
	jmp loc_02a7ea

loc_048ada:
	addq.b #2,(7,a6)
	jsr loc_02c0ac
	moveq #0,d0
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$3c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048afc:
	tst.b ($33,a6)
	bmi.w loc_048d30
	jmp loc_02a7ea

;##############################################################################
;Throws
;##############################################################################
loc_048b0a:
	tst.b ($80,a6)
	bne.w loc_048bde
	move.b (7,a6),d0
	move.w loc_048b24(pc,d0.w),d1
	jsr loc_048b24(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048b24:
	dc.w loc_048b2e-loc_048b24
	dc.w loc_048b42-loc_048b24
	dc.w loc_048ba6-loc_048b24
	dc.w loc_048bb4-loc_048b24
	dc.w loc_048bcc-loc_048b24

;------------------------------------------------------------------------------
loc_048b2e:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$33,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048b42:
	tst.b ($33,a6)
	bpl.w loc_048d36
	moveq #$4b,d0
	jsr loc_02e3fe
	beq.b loc_048b9a
	move.b #6,(7,a6)
	tst.b ($125,a6)
	beq.b loc_048b7a
	jsr loc_01bd68
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_048b8e
	bra.b loc_048b92

loc_048b7a:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_048b92
	clr.b ($b,a6)
	btst #1,d0
	beq.b loc_048b92

loc_048b8e:
	addq.b #1,($b,a6)

loc_048b92:
	moveq #0,d0
	jmp loc_02a758

loc_048b9a:
	addq.b #2,(7,a6)
	moveq #$34,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048ba6:
	tst.b ($33,a6)
	bpl.w loc_048d36
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_048bb4:
	tst.b ($35,a6)
	beq.b loc_048bc6
	addq.b #2,(7,a6)
	moveq #$4b,d0
	jsr loc_02e7f2

loc_048bc6:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_048bcc:
	tst.b ($33,a6)
	bpl.w loc_048d36
	eori.b #1,($b,a6)
	bra.w loc_048d30

;==============================================================================
;Air Throw
;==============================================================================
loc_048bde:
	move.b (7,a6),d0
	move.w loc_048bf0(pc,d0.w),d1
	jsr loc_048bf0(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048bf0:
	dc.w loc_048bfa-loc_048bf0
	dc.w loc_048c0e-loc_048bf0
	dc.w loc_048c9c-loc_048bf0
	dc.w loc_048caa-loc_048bf0
	dc.w loc_048cfe-loc_048bf0

;------------------------------------------------------------------------------
loc_048bfa:
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$35,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_048c0e:
	jsr loc_02aa08
	bcs.w loc_048c80
	tst.b ($33,a6)
	bpl.w loc_048d36
	moveq #$4c,d0
	jsr loc_02e636
	beq.b loc_048c74
	move.b #6,(7,a6)
	tst.b ($125,a6)
	beq.b loc_048c50
	jsr loc_01bd68
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_048c64
	bra.b loc_048c68

loc_048c50:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_048c68
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_048c68

loc_048c64:
	addq.b #1,($b,a6)

loc_048c68:
	clr.l ($44,a6)
	moveq #1,d0
	jmp loc_02a758

loc_048c74:
	addq.b #2,(7,a6)
	moveq #$34,d0
	jmp loc_02a758

loc_048c80:
	move.w ($64,a6),($14,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_048c9c:
	jsr loc_02aa08
	bcs.b loc_048c80
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_048caa:
	cmpi.b #2,($35,a6)
	beq.b loc_048cb6
	bsr.w loc_048d0e

loc_048cb6:
	cmpi.b #1,($35,a6)
	bne.b loc_048cf8
	addq.b #2,(7,a6)
	moveq #$4c,d0
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.b loc_048cd0
	moveq #$4d,d0

loc_048cd0:
	jsr loc_02e7f2
	clr.l ($44,a6)
	move.l #$ffff0000,($40,a6)
	move.l #$500,($48,a6)
	tst.b ($b,a6)
	bne.b loc_048cf8
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_048cf8:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_048cfe:
	jsr loc_02aa08
	bcs.w loc_048c80
	jmp loc_02a7ea

;==============================================================================
loc_048d0e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================================================
loc_048d30:
	jmp loc_02baf2

;==============================================================================
loc_048d36:
	jmp loc_02a7ea

;==============================================================================
loc_048d3c:
	moveq #0,d0
	move.l d0,($180,a6)
	move.l d0,($182,a6)
	move.l d0,($188,a6)
	move.l d0,($18a,a6)
	move.l d0,($1c0,a6)
	move.l d0,($1c2,a6)
	move.l d0,($190,a6)
	move.l d0,($192,a6)
	move.l d0,($1a8,a6)
	move.l d0,($1aa,a6)
	move.l d0,($1b0,a6)
	move.l d0,($1b2,a6)
	move.l d0,($1b8,a6)
	move.l d0,($1ba,a6)
	rts

;==============================================================================
loc_048d78:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($1b0,a6)
	movem.l d0-d1,($1b8,a6)
	movem.l d0-d1,($1c0,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_048dc0:
	dc.w $0039,$0038,$0030,$003c,$0038,$0041,$0049,$0038
	dc.w $0057,$0030,$004a,$0050,$0030,$0038,$0040,$0048
	dc.w $005c,$0036,$0000,$0036,$0000,$004b,$003c,$0000
	dc.w $0047,$004a,$003d,$004a,$0049,$003b,$003c,$003c
	dc.w $0032,$0030,$0034,$0034,$0038,$0032,$0040,$0038
	dc.w $0038,$0034,$0034,$0040,$0034,$002c,$0030,$003e
	dc.w $0040,$0028,$0000,$0028,$0000,$0034,$0032,$0000
	dc.w $0034,$002c,$002a,$0036,$0030,$002c,$0032,$0032
	dc.w $004c,$004a,$0052,$0054,$0048,$0052,$0054,$0051
	dc.w $0058,$0050,$004c,$005c,$0054,$004c,$0052,$0057
	dc.w $004e,$0048,$0000,$0048,$0000,$0052,$004c,$0000
	dc.w $0044,$0044,$0048,$0052,$0054,$0044,$004c,$004c

;##############################################################################
;
;##############################################################################
loc_048e80:
	dc.w loc_048efe-loc_048e80
	dc.w loc_048efe-loc_048e80
	dc.w loc_048e86-loc_048e80

loc_048e86:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$09,$0b,$09,$0b,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02

loc_048efe:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$06,$06,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $06,$06,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$08,$0a,$08,$0a,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
