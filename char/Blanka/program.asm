;##############################################
;Winposes
;##############################################
loc_05f82a:
	tst.b (6,a6)
	bne.b loc_05f840
	st.b (6,a6)
	tst.b ($10d,a5)
	beq.b loc_05f840
	move.b #$e,($2c4,a6)

loc_05f840:
	move.b ($2c4,a6),d0
	move.w loc_05f84c(pc,d0.w),d1
	jmp loc_05f84c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f84c:
	dc.w loc_05f85c-loc_05f84c
	dc.w loc_05f87e-loc_05f84c
	dc.w loc_05f87e-loc_05f84c
	dc.w loc_05f87e-loc_05f84c
	dc.w loc_05f87e-loc_05f84c
	dc.w loc_05f87e-loc_05f84c
	dc.w loc_05f8f6-loc_05f84c
	dc.w loc_05f87e-loc_05f84c

;==============================================
loc_05f85c:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_05f86e(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f86e:
	dc.b $02,$0a,$06,$02,$04,$0c,$08,$04
	dc.b $06,$02,$0a,$06,$08,$04,$0c,$08

;==============================================
loc_05f87e:
	move.b (7,a6),d0
	move.w loc_05f88a(pc,d0.w),d1
	jmp loc_05f88a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f88a:
	dc.w loc_05f892-loc_05f88a
	dc.w loc_05f8aa-loc_05f88a
	dc.w loc_05f8de-loc_05f88a
	dc.w loc_05f8f0-loc_05f88a

;----------------------------------------------
loc_05f892:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_05f8aa:
	tst.b ($124,a5)
	bne.w loc_0617c2
	tst.b ($11c,a5)
	bne.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	move.w loc_05f8ce(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f8ce:
	dc.w $0023,$0024,$0025,$0027
	dc.w $0023,$0023,$0023,$0024

;----------------------------------------------
loc_05f8de:
	subq.b #1,($3a,a6)
	bpl.b loc_05f8f0
	addq.b #2,(7,a6)
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

;----------------------------------------------
loc_05f8f0:
	jmp loc_02a7ea

;==============================================
loc_05f8f6:
	move.b (7,a6),d0
	move.w loc_05f902(pc,d0.w),d1
	jmp loc_05f902(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f902:
	dc.w loc_05f90a-loc_05f902
	dc.w loc_05f922-loc_05f902
	dc.w loc_05f93e-loc_05f902
	dc.w loc_05f998-loc_05f902

;----------------------------------------------
loc_05f90a:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_05f922:
	tst.b ($124,a5)
	bne.w loc_0617c2
	tst.b ($11c,a5)
	bne.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #$26,d0
	jmp loc_02a708

;----------------------------------------------
loc_05f93e:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	jsr loc_01c368
	beq.b loc_05f968
	addq.b #1,(a4)
	move.b #$19,(2,a4)
	move.w a6,($36,a4)
	move.b #2,($3a,a4)
	move.w a4,($2a,a6)

loc_05f968:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_05f988(pc,d0.w),d0
	move.b d0,($3b,a6)
	clr.b ($3a,a6)
	addi.w #$31,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f988:
	dc.b $00,$01,$02,$03,$04,$05,$00,$01
	dc.b $00,$01,$02,$03,$04,$05,$03,$04

;----------------------------------------------
loc_05f998:
	bsr.w loc_0617d4
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05f9d4
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_05f9d4
	move.l #$1002700,(a4)
	moveq #4,d0
	add.b ($3b,a6),d0
	add.w d0,d0
	move.b d0,(3,a4)
	move.w ($3a,a6),($3a,a4)
	move.w a6,($36,a4)
	addq.b #2,($3a,a6)

loc_05f9d4:
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)
	rts

;##############################################
;Intro
;##############################################
loc_05f9de:
	move.b (7,a6),d0
	move.w loc_05f9ea(pc,d0.w),d1
	jmp loc_05f9ea(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f9ea:
	dc.w loc_05fa16-loc_05f9ea
	dc.w loc_05fa4e-loc_05f9ea
	dc.w loc_05fa96-loc_05f9ea
	dc.w loc_05faf8-loc_05f9ea
	dc.w loc_05fb44-loc_05f9ea
	dc.w loc_05fb6e-loc_05f9ea
	dc.w loc_05fb94-loc_05f9ea
	dc.w loc_05fc18-loc_05f9ea

	dc.w loc_05fc3c-loc_05f9ea
	dc.w loc_05fc76-loc_05f9ea
	dc.w loc_05fc9e-loc_05f9ea
	dc.w loc_05fcd6-loc_05f9ea
	dc.w loc_05fd20-loc_05f9ea
	dc.w loc_05fd76-loc_05f9ea
	dc.w loc_05fdc0-loc_05f9ea
	dc.w loc_05fdd4-loc_05f9ea

	dc.w loc_05fdf2-loc_05f9ea
	dc.w loc_05fe00-loc_05f9ea
	dc.w loc_05fe18-loc_05f9ea
	dc.w loc_05fe58-loc_05f9ea
	dc.w loc_05feb4-loc_05f9ea
	dc.w loc_05ff00-loc_05f9ea

;==============================================
loc_05fa16:
	movea.w ($38,a6),a4
	cmpi.b #$c,($102,a4)
	bne.b loc_05fa34
	tst.b ($125,a6)
	sne.b d0
	tst.b ($125,a4)
	sne.b d1
	eor.b d0,d1
	bmi.w loc_05fe18

loc_05fa34:
	jsr RNGFunction
	andi.w #6,d0
	move.w loc_05fa46(pc,d0.w),d1
	jmp loc_05fa46(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05fa46:
	dc.w loc_05fa4e-loc_05fa46
	dc.w loc_05fb94-loc_05fa46
	dc.w loc_05fcd6-loc_05fa46
	dc.w loc_05fdf2-loc_05fa46

;==============================================
loc_05fa4e:
	move.b #4,(7,a6)
	move.b #1,($31,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($b,a6),d0
	add.w d0,d0
	move.w loc_05fa92(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	addi.w #$40,($14,a6)
	move.b #$3c,($2a0,a6)
	moveq #$17,d0
	jsr loc_0038e4
	move.b #$18,($3a,a6)
	bra.w loc_061842

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05fa92:
	dc.w $01c0,$ffc0

;==============================================
loc_05fa96:
	tst.b ($1f0,a6)
	bne.b loc_05faac
	subq.b #1,($3a,a6)
	bne.w loc_0617c0
	moveq #$17,d0
	jmp loc_0038e4

loc_05faac:
	addq.b #2,(7,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	tst.b ($b,a6)
	bne.b loc_05fac4
	addi.w #$180,d0

loc_05fac4:
	move.w d0,($10,a6)
	move.l #$30000,($40,a6)
	move.l #0,($48,a6)
	move.l #$ffffe000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	moveq #$18,d0
	jsr loc_0038e4
	moveq #$22,d0
	jmp loc_02a708

;==============================================
loc_05faf8:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_05fb40(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	moveq #$37,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05fb40:
	dc.w $0060,$0120

;==============================================
loc_05fb44:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	move.b #2,($3b,a6)
	move.b ($132,a6),d0
	ext.w d0
	addq.w #1,d0
	add.w d0,d0
	add.b ($128,a6),d0
	addi.w #$38,d0
	jmp loc_02a708

;==============================================
loc_05fb6e:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	subq.b #1,($3b,a6)
	bpl.w loc_0617c2
	move.l #$2000000,(4,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_05fb94:
	move.b #$e,(7,a6)
	move.b #1,($31,a6)
	move.b #$3c,($2a0,a6)
	move.l ($10,a6),($48,a6)
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_05fbf8(pc,d0.w),d0
	add.w d0,($10,a6)
	move.w ($64,a6),d0
	addi.w #$d8,d0
	move.w d0,($14,a6)
	move.b #$28,($3a,a6)
	bsr.w loc_061820
	move.b #$20,($123,a5)
	move.w ($48,a6),d1
	sub.w ($10,a6),d1
	tst.b ($b,a6)
	bne.b loc_05fbea
	neg.w d1

loc_05fbea:
	moveq #$41,d0
	tst.w d1
	bpl.b loc_05fbf2
	addq.w #1,d0

loc_05fbf2:
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05fbf8:
	dc.w $ffb8,$ffc8,$ffd8,$ffe8
	dc.w $fff8,$0008,$0018,$0028
	dc.w $0038,$0048,$ffb8,$ffd8
	dc.w $fff8,$0018,$0038,$0048

;==============================================
loc_05fc18:
	subq.b #1,($3a,a6)
	bpl.b loc_05fc3a
	addq.b #2,(7,a6)
	move.l #0,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$18,d0
	jmp loc_0038e4

loc_05fc3a:
	rts

;==============================================
loc_05fc3c:
	bsr.w loc_06190a
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05fc70
	addq.b #2,(7,a6)
	move.l ($48,a6),d0
	sub.l ($10,a6),d0
	asr.l #4,d0
	move.l d0,($40,a6)
	move.l #$40000,($44,a6)
	bsr.w loc_06187c
	moveq #$1f,d0
	jsr loc_0038e4

loc_05fc70:
	jmp loc_02a7ea

;==============================================
loc_05fc76:
	bsr.w loc_06190a
	bpl.b loc_05fc98
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05fc98
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_05fc98:
	jmp loc_02a7ea

;==============================================
loc_05fc9e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.w ($48,a6),d1
	sub.w ($10,a6),d1
	swap d0
	eor.w d1,d0
	bpl.w loc_0617c2
	move.l ($48,a6),($10,a6)
	clr.w ($16,a6)
	move.l #$2000000,(4,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_05fcd6:
	move.b #$18,(7,a6)
	move.b #1,($31,a6)
	move.w #$78,d0
	tst.b ($101,a6)
	bne.b loc_05fcee
	neg.w d0

loc_05fcee:
	add.w d0,($10,a6)
	addi.w #$a8,($14,a6)
	move.l #$a8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$fff58000,($44,a6)
	move.l #0,($4c,a6)
	moveq #$40,d0
	jmp loc_02a708

;==============================================
loc_05fd20:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	move.l #$fffed44b,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #$20,($123,a5)
	bsr.w loc_061820
	bsr.w loc_06187c
	moveq #$1e,d0
	jsr loc_0038e4
	moveq #$1f,d0
	jmp loc_02a708

;==============================================
loc_05fd76:
	bsr.w loc_061908
	bpl.w loc_0617c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_05fdae
	move.w #$120,d0

loc_05fdae:
	add.w ($10,a3),d0
	swap d0
	move.l d0,($10,a6)
	moveq #4,d0
	jmp loc_02a708

;==============================================
loc_05fdc0:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #$23,d0
	jmp loc_02a708

;==============================================
loc_05fdd4:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	move.l #$2000000,(4,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_05fdf2:
	move.b #$22,(7,a6)
	moveq #$32,d0
	jmp loc_02a758

;==============================================
loc_05fe00:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_05fe18:
	move.b #$26,(7,a6)
	eori.b #1,($b,a6)
	move.b #1,($31,a6)
	move.w #$160,d0
	tst.b ($b,a6)
	beq.b loc_05fe36
	neg.w d0

loc_05fe36:
	add.w d0,($10,a6)
	addi.w #$40,($14,a6)
	move.b #$48,($3a,a6)
	move.b #$3c,($2a0,a6)
	moveq #$17,d0
	jsr loc_0038e4
	bra.w loc_061842

;==============================================
loc_05fe58:
	tst.b ($1f0,a6)
	beq.w loc_0617c0
	subq.b #1,($3a,a6)
	bpl.w loc_0617c0
	addq.b #2,(7,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	tst.b ($b,a6)
	bne.b loc_05fe80
	addi.w #$180,d0

loc_05fe80:
	move.w d0,($10,a6)
	move.l #$60000,($40,a6)
	move.l #0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffffd800,($4c,a6)
	moveq #$18,d0
	jsr loc_0038e4
	moveq #$22,d0
	jmp loc_02a708

;==============================================
loc_05feb4:
	bsr.w loc_061908
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	tst.b ($b,a6)
	seq.b d1
	ext.w d1
	eor.w d0,d1
	bpl.b loc_05fefa
	addq.b #2,(7,a6)
	moveq #$39,d0
	jsr loc_080b70
	move.l #$2a000,($40,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffd000,($4c,a6)
	move.w #$9280,($48,a5)

loc_05fefa:
	jmp loc_02a7ea

;==============================================
loc_05ff00:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	move.b #8,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	eori.b #1,($b,a6)
	jsr loc_01bd5c
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_05ff4e(pc,d0.w),d0
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	moveq #$37,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ff4e:
	dc.w $0060,$0120

;##############################################
;Normals
;##############################################
loc_05ff52:
	tst.b ($80,a6)
	bne.w loc_060068
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_05fff4
	move.b (7,a6),d0
	move.w loc_05ff72(pc,d0.w),d1
	jmp loc_05ff72(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ff72:
	dc.w loc_05ff76-loc_05ff72
	dc.w loc_05ffee-loc_05ff72

;----------------------------------------------
loc_05ff76:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #1,d0
	tst.b ($125,a6)
	bne.b loc_05ffb2
	cmpi.b #1,($132,a6)
	bne.b loc_05ffb2
	btst #0,($83,a6)
	bne.b loc_05ffc2
	bra.b loc_05ffe4

loc_05ffb2:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_05ffde(pc,d1.w),d1
	cmp.w ($21c,a6),d1
	bcs.b loc_05ffe4

loc_05ffc2:
	moveq #0,d0
	cmpi.b #2,($82,a6)
	bne.b loc_05ffe4
	move.b ($83,a6),d1
	andi.w #3,d1
	beq.b loc_05ffe4
	moveq #$1f,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ffde:
	dc.w $0050,$0050,$0050

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05ffe4:
	add.b ($82,a6),d0
	jmp loc_02a710

;----------------------------------------------
loc_05ffee:
	jmp loc_02f5ac

;==============================================
;Kicks
;==============================================
loc_05fff4:
	move.b (7,a6),d0
	move.w loc_060000(pc,d0.w),d1
	jmp loc_060000(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060000:
	dc.w loc_060004-loc_060000
	dc.w loc_060062-loc_060000

;----------------------------------------------
loc_060004:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #7,d0
	tst.b ($125,a6)
	bne.b loc_060040
	cmpi.b #1,($132,a6)
	bne.b loc_060040
	btst #0,($83,a6)
	bne.b loc_060050
	bra.b loc_060052

loc_060040:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_06005c(pc,d1.w),d1
	cmp.w ($21c,a6),d1
	bcs.b loc_060052

loc_060050:
	moveq #6,d0

loc_060052:
	add.b ($82,a6),d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06005c:
	dc.w $0040,$0030,$0040

;----------------------------------------------
loc_060062:
	jmp loc_02f5ac

;==============================================
;Crouch
;==============================================
loc_060068:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_06007a(pc,d0.w),d1
	jmp loc_06007a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06007a:
	dc.w loc_060080-loc_06007a
	dc.w loc_0600ec-loc_06007a
	dc.w loc_0600f2-loc_06007a

;----------------------------------------------
loc_060080:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	bne.b loc_0600d6
	cmpi.b #4,($82,a6)
	bne.b loc_0600d6
	btst #1,($83,a6)
	beq.b loc_0600d6
	move.b #4,(7,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff7000,($48,a6)
	moveq #$1e,d0
	jmp loc_02a710

loc_0600d6:
	moveq #$18,d0
	tst.b ($81,a6)
	beq.b loc_0600e0
	addq.b #6,d0

loc_0600e0:
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a710

;----------------------------------------------
loc_0600ec:
	jmp loc_02f5ac

;----------------------------------------------
loc_0600f2:
	tst.b ($33,a6)
	bmi.w loc_0617ce
	tst.b ($35,a6)
	beq.b loc_060104
	bsr.w loc_0618ee

loc_060104:
	jmp loc_02a7ea

;##############################################
;Air Normals
;##############################################
loc_06010a:
	move.b #6,(7,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_060134
	moveq #$18,d0

loc_060134:
	tst.b ($81,a6)
	beq.b loc_06013c
	addq.w #3,d0

loc_06013c:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################
;Special Move Inputs
;##############################################
loc_06014a:
	jsr loc_02e096
	bne.w loc_060364

loc_060154:
	lea.l ($1a8,a6),a4
	jsr loc_02d762
	bne.w loc_060284

loc_060162:
	lea.l ($1a0,a6),a4
	jsr loc_02d782
	bne.w loc_060248

loc_060170:
	lea.l ($188,a6),a4
	jsr loc_02d7d6
	bne.w loc_0602e4

loc_06017e:
	lea.l ($180,a6),a4
	jsr loc_02d72a
	bne.w loc_0601d0

loc_06018c:
	lea.l ($190,a6),a4
	jsr loc_02d732
	bne.w loc_0601f8

loc_06019a:
	lea.l ($198,a6),a4
	jsr loc_02d742
	bne.w loc_060220

loc_0601a8:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_0603c8

loc_0601b6:
	lea.l ($1b0,a6),a4
	jsr loc_02e01e
	bne.w loc_06030e

loc_0601c4:
	jsr loc_02e0cc
	bne.w loc_060454

loc_0601ce:
	rts

;----------------------------------------------
;Move ID Writes
loc_0601d0:
	jsr loc_02ed00
	beq.b loc_06018c
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #8,($aa,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0601f8:
	jsr loc_02ed00
	beq.b loc_06019a
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #$c,($aa,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_060220:
	jsr loc_02ed00
	beq.b loc_0601a8
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #$e,($aa,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_060248:
	tst.b ($132,a6)
	bne.w loc_060170
	cmpi.w #$30,($11e,a6)
	bcs.w loc_060170
	jsr loc_02ecd8
	beq.w loc_060170
	move.l #$2001000,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_060284:
	cmpi.b #1,($132,a6)
	beq.w loc_060162
	cmpi.w #$30,($11e,a6)
	bcs.w loc_060162
	jsr loc_02ecd8
	beq.w loc_060162
	move.l #$02001000,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	moveq #4,d1
	btst #2,d0
	bne.b loc_0602da
	moveq #2,d1
	btst #1,d0
	bne.b loc_0602da
	moveq #1,d1

loc_0602da:
	move.b d1,($1f0,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_0602e4:
	jsr loc_02ed00
	beq.w loc_06017e
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #6,($aa,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06030e:
	btst #0,($371,a6)
	bne.b loc_060336
	jsr loc_02ed00
	beq.w loc_0601c4
	move.l #$02000e00,(4,a6)
	move.b #0,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

loc_060336:
	tst.b ($b9,a6)
	bne.b loc_060344
	tst.b ($23e,a6)
	bne.w loc_0601c4

loc_060344:
	jsr loc_02ed00
	beq.w loc_0601c4
	move.l #$02000e00,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_060364:
	tst.b ($28a,a6)
	bne.w loc_060154
	tst.b ($31,a6)
	bne.w loc_0603a2
	jsr loc_02ef54
	beq.w loc_060154
	jsr loc_02ecd8
	beq.w loc_060154
	move.l #$02001000,(4,a6)
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_0603a2:
	tst.b ($b9,a6)
	bne.w loc_060154
	jsr loc_02ed28
	beq.w loc_060154
	move.l #$02001000,(4,a6)
	move.b #4,($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_0603c8:
	jsr loc_02edf8
	beq.w loc_0601b6

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_0603d2:
	tst.b ($132,a6)
	bne.w loc_06041a
	move.l #$2000e00,(4,a6)
	move.b #$16,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #$31,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_06041a:
	move.l #$02000e00,(4,a6)
	move.b #$14,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$16,($5f,a4)
	move.b #$1a,($25d,a6)
	moveq #$31,d0
	jmp loc_02a758

;----------------------------------------------
loc_060454:
	tst.b ($b9,a6)
	bne.b loc_060462
	tst.b (pl_taunt_count,a6)
	beq.w loc_0601ce

loc_060462:
	jsr loc_02ed00
	beq.w loc_0601ce
	move.l #$02000e00,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;##############################################
;AI Move Checks
;##############################################
loc_060482:
	move.b ($aa,a6),d0
	move.w loc_06048e(pc,d0.w),d1
	jmp loc_06048e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06048e:
	dc.w loc_0604a6-loc_06048e
	dc.w loc_0604a6-loc_06048e
	dc.w loc_0604b8-loc_06048e
	dc.w loc_0604b8-loc_06048e
	dc.w loc_0604b8-loc_06048e
	dc.w loc_0604bc-loc_06048e
	dc.w loc_0604b8-loc_06048e
	dc.w loc_0604b8-loc_06048e

	dc.w loc_0604ca-loc_06048e
	dc.w loc_0604e0-loc_06048e
	dc.w loc_0604b8-loc_06048e
	dc.w loc_0604b8-loc_06048e

;----------------------------------------------
loc_0604a6:
	tst.b ($b9,a6)
	bne.b loc_0604b4
	tst.b ($23e,a6)
	bne.w loc_0604ec

loc_0604b4:
	bra.w loc_0604e8

;----------------------------------------------
loc_0604b8:
	bra.w loc_0604e8

;----------------------------------------------
loc_0604bc:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0604ec
	bra.w loc_0604e8

;----------------------------------------------
loc_0604ca:
	tst.b ($132,a6)
	bne.w loc_0604ec
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0604ec
	bra.w loc_0604e8

;----------------------------------------------
loc_0604e0:
	tst.b (pl_taunt_count,a6)
	beq.w loc_0604ec

;==============================================
loc_0604e8:
	moveq #1,d0
	rts

;==============================================
loc_0604ec:
	moveq #0,d0
	rts

;##############################################
;Special Moves Programming
;##############################################
loc_0604f0:
	move.b ($aa,a6),d0
	move.w loc_0604fc(pc,d0.w),d1
	jmp loc_0604fc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0604fc:
	dc.w loc_060514-loc_0604fc;00 Forward Hop
	dc.w loc_0605ec-loc_0604fc;02 Back Hop
	dc.w loc_0606ea-loc_0604fc;04 Vism Activate
	dc.w loc_06076c-loc_0604fc;06 Electric
	dc.w loc_0608fc-loc_0604fc;08 Ball
	dc.w loc_060a2c-loc_0604fc;0a Super Ball
	dc.w loc_060d32-loc_0604fc;0c Rainbow Ball
	dc.w loc_060fae-loc_0604fc;0e Up Ball

	dc.w loc_061162-loc_0604fc;10 Tropical Hazard
	dc.w loc_061470-loc_0604fc;12 Taunt
	dc.w loc_0614c4-loc_0604fc;14 Vism AC
	dc.w loc_060f36-loc_0604fc;16 Aism AC

;==============================================
;Forward Hop
;==============================================
loc_060514:
	move.b (7,a6),d0
	move.w loc_060520(pc,d0.w),d1
	jmp loc_060520(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060520
	dc.w loc_06052a-loc_060520
	dc.w loc_060550-loc_060520
	dc.w loc_060588-loc_060520
	dc.w loc_06059c-loc_060520
	dc.w loc_0605ca-loc_060520

;----------------------------------------------
loc_06052a:
	addq.b #2,(7,a6)
	move.b #3,($294,a6)
	move.b #1,($ce,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a9,a6)
	jsr loc_020674
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_060550:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_060586
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$70000,($40,a6)
	move.l #$fffff000,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff9000,($4c,a6)

loc_060586:
	rts

;----------------------------------------------
loc_060588:
	bsr.w loc_061908
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_06059c:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c0
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0605ca:
	tst.b ($33,a6)
	bpl.b loc_0605e0
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

loc_0605e0:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Back Hop
;==============================================
loc_0605ec:
	move.b (7,a6),d0
	move.w loc_0605f8(pc,d0.w),d1
	jmp loc_0605f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0605f8:
	dc.w loc_060602-loc_0605f8
	dc.w loc_06062e-loc_0605f8
	dc.w loc_060666-loc_0605f8
	dc.w loc_06068a-loc_0605f8
	dc.w loc_0606c8-loc_0605f8

;----------------------------------------------
loc_060602:
	addq.b #2,(7,a6)
	move.b #3,($294,a6)
	move.b #1,($ce,a6)
	move.b #8,($23f,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a9,a6)
	jsr loc_020674
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_06062e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_060664
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$fff70000,($40,a6)
	move.l #$2000,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff9000,($4c,a6)

loc_060664:
	rts

;----------------------------------------------
loc_060666:
	bsr.w loc_061908
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	move.l #$ffff0000,($40,a6)
	move.l #$1000,($48,a6)
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_06068a:
	tst.b ($34,a6)
	bne.b loc_060696
	jsr loc_02a7ea

loc_060696:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c0
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0606c8:
	tst.b ($33,a6)
	bpl.b loc_0606de
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

loc_0606de:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
loc_0606ea:
	move.b (7,a6),d0
	move.w loc_0606f6(pc,d0.w),d1
	jmp loc_0606f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0606f6:
	dc.w loc_0606fc-loc_0606f6
	dc.w loc_06071c-loc_0606f6
	dc.w loc_060750-loc_0606f6

;----------------------------------------------
loc_0606fc:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_060716
	moveq #$2f,d0

loc_060716:
	jmp loc_02a708

;----------------------------------------------
loc_06071c:
	tst.b ($34,a6)
	beq.b loc_06074a
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_060740
	moveq #-5,d0
	moveq #$44,d1

loc_060740:
	jsr loc_097cd6
	bsr.w loc_061968

loc_06074a:
	jmp loc_02a7ea

;----------------------------------------------
loc_060750:
	subq.b #1,($3a,a6)
	bne.w loc_0617c2
	tst.b ($31,a6)
	beq.b loc_060766
	move.l #$02000602,(4,a6)

loc_060766:
	jmp loc_02f796

;==============================================
;Electric
;==============================================
loc_06076c:
	move.b (7,a6),d0
	move.w loc_060778(pc,d0.w),d1
	jmp loc_060778(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060778:
	dc.w loc_060780-loc_060778
	dc.w loc_0607ae-loc_060778
	dc.w loc_0607ea-loc_060778
	dc.w loc_0608ba-loc_060778

;----------------------------------------------
loc_060780:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($247,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_0607ae:
	tst.b ($35,a6)
	beq.w loc_0617c2
	addq.b #2,(7,a6)
	move.b #$f,($3a,a6)
	move.b #$3a,($2a0,a6)
	tst.b ($125,a6)
	beq.b loc_0607d8
	move.b ($81,a6),d0
	ext.w d0
	move.b loc_0607da(pc,d0.w),($3a,a6)

loc_0607d8:
	bra.b loc_0607ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0607da:
	dc.b $00,$02,$03,$04,$05,$06,$07,$08
	dc.b $09,$0a,$0b,$0c,$0d,$0e,$0f,$10

;----------------------------------------------
loc_0607ea:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_0608da
	jsr loc_02af7a
	bne.w loc_0608da
	tst.b ($125,a6)
	bne.w loc_06087e
	move.b ($378,a6),d1
	andi.w #7,d1
	beq.b loc_06085c
	moveq #0,d0
	btst #0,d1
	bne.b loc_060828
	moveq #2,d0
	btst #1,d1
	bne.b loc_060828
	moveq #4,d0

loc_060828:
	move.w loc_060878(pc,d0.w),d2
	cmp.b ($3a,a6),d2
	bcc.b loc_06085c
	move.b #$f,($3a,a6)
	cmp.b ($82,a6),d0
	beq.b loc_060862
	move.b d0,($82,a6)
	lsr.b #1,d0
	addi.b #$f,d0
	movea.l ($2b4,a6),a0
	add.w d0,d0
	adda.w (a0,d0.w),a0
	adda.w ($34,a6),a0
	jmp loc_02a770

loc_06085c:
	subq.b #1,($3a,a6)
	beq.b loc_0608da

loc_060862:
	jsr loc_02f770
	jsr loc_020674
	st.b ($247,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060878:
	dc.w $0000,$0003,$0006

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06087e:
	tst.b ($33,a6)
	beq.b loc_0608b4
	jsr loc_02f770
	jsr loc_020674
	tst.b ($247,a6)
	bne.b loc_06089a
	st.b ($247,a6)

loc_06089a:
	move.b ($81,a6),d0
	beq.b loc_0608a8
	subq.b #1,($3a,a6)
	beq.b loc_0608da
	bra.b loc_0608b4

loc_0608a8:
	lea.l loc_06199e(pc),a1
	jsr loc_030a66
	bne.b loc_0608da

loc_0608b4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0608ba:
	tst.b ($33,a6)
	bpl.b loc_0608ce
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_0617c8

loc_0608ce:
	jsr loc_02f6f8
	jmp loc_02a7ea


;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0608da:
	move.b #6,(7,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	move.b d0,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$12,d0
	jmp loc_02a758

;==============================================
;Ball
;==============================================
loc_0608fc:
	move.b (7,a6),d0
	move.w loc_060908(pc,d0.w),d1
	jmp loc_060908(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060908:
	dc.w loc_060912-loc_060908
	dc.w loc_06097a-loc_060908
	dc.w loc_060998-loc_060908
	dc.w loc_0609e2-loc_060908
	dc.w loc_060a14-loc_060908

;----------------------------------------------
loc_060912:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($247,a6)
	move.b d0,($5b,a6)
	move.w d0,($16,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_06096a(pc,d0.w),($40,a6)
	lsr.b #2,d0
	move.b loc_060976(pc,d0.w),($3b,a6)
	moveq #6,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06096a:
	dc.l $00060000,$00080000,$000a0000

loc_060976:
	dc.b $19,$19,$3c,00

;----------------------------------------------
loc_06097a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_0617c0
	addq.b #2,(7,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_060998:
	tst.b ($5b,a6)
	bne.w loc_060a22
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.b loc_0609c0
	tst.b ($298,a6)
	bne.b loc_0609c0
	subq.b #1,($3b,a6)
	beq.b loc_0609c0
	bsr.w loc_0618ee
	jmp loc_02a7ea

loc_0609c0:
	move.b #8,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #7,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_0609e2:
	bsr.w loc_061908
	bpl.w loc_0617c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #7,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_060a14:
	tst.b ($33,a6)
	bmi.w loc_0617ce
	jmp loc_02a7ea

loc_060a22:
	move.b #6,(7,a6)
	bra.w loc_06191c

;==============================================
;Super Ball
;==============================================
loc_060a2c:
	move.b (7,a6),d0
	move.w loc_060a38(pc,d0.w),d1
	jmp loc_060a38(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060a38:
	dc.w loc_060a4a-loc_060a38
	dc.w loc_060a7a-loc_060a38
	dc.w loc_060aaa-loc_060a38
	dc.w loc_060ae4-loc_060a38
	dc.w loc_060b4c-loc_060a38
	dc.w loc_060b80-loc_060a38
	dc.w loc_060c8a-loc_060a38
	dc.w loc_060cce-loc_060a38

	dc.w loc_060d00-loc_060a38

;----------------------------------------------
loc_060a4a:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$33,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_060a7a:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_060a96
	moveq #1,d0

loc_060a96:
	move.b d0,($ab,a6)
	moveq #-$2a,d0
	moveq #$2b,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_060aaa:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.w loc_0617c0
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_060ad8
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_060ad8:
	move.b loc_060ae0(pc,d0.w),($25d,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060ae0:
	dc.b $04,$10,$23,00

;----------------------------------------------
loc_060ae4:
	tst.b ($34,a6)
	bne.w loc_0617c2
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_060b1c(pc,d0.w),($40,a6)
	move.l loc_060b1c+4(pc,d0.w),($48,a6)
	move.l loc_060b1c+8(pc,d0.w),($44,a6)
	move.l loc_060b1c+$c(pc,d0.w),($4c,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060b1c:
	dc.l $00000000,$00000000,$00060000,$ffff5800
	dc.l $00008000,$00000000,$00080000,$ffff5800
	dc.l $00010000,$00000000,$000a0000,$ffff5800

;----------------------------------------------
loc_060b4c:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #$5a,($3a,a6)
	jsr loc_00369c
	jmp loc_02a7ea

;----------------------------------------------
loc_060b80:
	jsr loc_02a7ea
	tst.b ($107,a5)
	bne.b loc_060bb8
	tst.b ($298,a6)
	bne.b loc_060bb8
	tst.b ($125,a6)
	bne.b loc_060bb8
	move.b (PL_Buttons,a6),d0
	and.b ($1f0,a6),d0
	beq.b loc_060bb8
	subq.b #1,($3a,a6)
	beq.b loc_060bb8
	move.b ($3a,a6),d0
	andi.w #$f,d0
	bne.w loc_0617c0
	bra.w loc_061868

loc_060bb8:
	addq.b #2,(7,a6)
	tst.b ($132,a6)
	bpl.b loc_060bc8
	move.b ($2c9,a6),($b,a6)

loc_060bc8:
	moveq #0,d0
	move.b d0,($5b,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($32,a6),($1f2,a6)
	moveq #$34,d0
	add.b ($82,a6),d0
	movea.l ($2b4,a6),a0
	add.w d0,d0
	adda.w (a0,d0.w),a0
	adda.w ($34,a6),a0
	jsr loc_02a770
	move.b ($1f2,a6),($32,a6)
	moveq #0,d1
	move.b ($3a,a6),d2
	cmpi.b #$3c,d2
	bcc.b loc_060c12
	moveq #$18,d1
	cmpi.b #$1e,d2
	bcc.b loc_060c12
	moveq #$30,d1

loc_060c12:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	move.b loc_060c3e(pc,d0.w),($3b,a6)
	lsl.w #3,d0
	add.w d1,d0
	move.l loc_060c42(pc,d0.w),($40,a6)
	move.l loc_060c42+4(pc,d0.w),($48,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	jmp loc_0038e4

;/\/\/\/\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//\/\/\/\/\/\/\/\
loc_060c3e:
	dc.b 01,02,03,00

loc_060c42:
	dc.l $00070000,$fffff000
	dc.l $00090000,$fffff000
	dc.l $000c0000,$fffff000
	dc.l $00080000,$fffff000
	dc.l $000a0000,$fffff000
	dc.l $000d0000,$fffff000
	dc.l $00090000,$fffff000
	dc.l $000b0000,$fffff000
	dc.l $000e0000,$fffff000

;----------------------------------------------
loc_060c8a:
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.b loc_060cb6
	subq.b #1,($3a,a6)
	bmi.b loc_060cb6
	tst.b ($5b,a6)
	beq.b loc_060cac
	clr.b ($5b,a6)
	subq.b #1,($3b,a6)
	bmi.w loc_060d16

loc_060cac:
	bsr.w loc_0618ee
	jmp loc_02a7ea

loc_060cb6:
	move.b #$10,(7,a6)
	move.b #$e,($3a,a6)
	moveq #7,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_060cce:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($3a,a6)
	moveq #7,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_060d00:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	subq.b #1,($3a,a6)
	bpl.w loc_0617c2
	jmp loc_02bb26

loc_060d16:
	move.b #$e,(7,a6)
	move.b #1,($31,a6)
	move.b #1,($a8,a6)
	bsr.w loc_06191c
	jmp loc_02a7ea

;==============================================
;Rainbow Ball
;==============================================
loc_060d32:
	move.b (7,a6),d0
	move.w loc_060d3e(pc,d0.w),d1
	jmp loc_060d3e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060d3e:
	dc.w loc_060d4c-loc_060d3e
	dc.w loc_060dcc-loc_060d3e
	dc.w loc_060de8-loc_060d3e
	dc.w loc_060e26-loc_060d3e
	dc.w loc_060e98-loc_060d3e
	dc.w loc_060e9e-loc_060d3e
	dc.w loc_060f20-loc_060d3e

;----------------------------------------------
loc_060d4c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($247,a6)
	move.b d0,($5b,a6)
	move.w d0,($16,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_060d9c(pc,d0.w),($40,a6)
	move.l loc_060d9c+4(pc,d0.w),($48,a6)
	move.l loc_060d9c+8(pc,d0.w),($44,a6)
	move.l loc_060d9c+$c(pc,d0.w),($4c,a6)
	moveq #$15,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060d9c:
	dc.l $fffb0000,$00003000,$00030000,$ffff9000
	dc.l $fffb0000,$00003000,$00030000,$ffff9000
	dc.l $fffb0000,$00003000,$00030000,$ffff9000

;----------------------------------------------
loc_060dcc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_060de6
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b ($35,a6)

loc_060de6:
	rts

;----------------------------------------------
loc_060de8:
	tst.b ($35,a6)
	bne.b loc_060df4
	jsr loc_02a7ea

loc_060df4:
	bsr.w loc_061908
	bpl.w loc_0617c0
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c0
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jmp loc_00369c

;----------------------------------------------
loc_060e26:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_060e66
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	addi.w #$28,($14,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_060e68(pc,d0.w),($40,a6)
	move.l loc_060e68+4(pc,d0.w),($48,a6)
	move.l loc_060e68+8(pc,d0.w),($44,a6)
	move.l loc_060e68+$c(pc,d0.w),($4c,a6)

loc_060e66:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060e68:
	dc.l $00058000,$ffffe400,$00060000,$ffff9800
	dc.l $00080000,$ffffd400,$00090000,$ffff7000
	dc.l $00090000,$ffffd000,$000a0000,$ffff6c00

;----------------------------------------------
loc_060e98:
	tst.b ($5b,a6)
	bne.b loc_060eee

;----------------------------------------------
loc_060e9e:
	jsr loc_02a7ea
	bsr.w loc_061908
	bpl.w loc_0617c0
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c0
	move.b #$c,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	move.b ($82,a6),d0
	move.w loc_060ee8(pc,d0.w),($3a,a6)
	moveq #$16,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060ee8:
	dc.w $0001,$0002,$0003

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_060eee:
	move.b #$a,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$400,($48,a6)
	move.l #$48000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	rts

;----------------------------------------------
loc_060f20:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	subq.w #1,($3a,a6)
	bpl.w loc_0617c2
	jmp loc_02baf2

;==============================================
;Aism Alpha Counter
;==============================================
loc_060f36:
	move.b (7,a6),d0
	move.w loc_060f42(pc,d0.w),d1
	jmp loc_060f42(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060f42:
	dc.w loc_060f4a-loc_060f42
	dc.w loc_061082-loc_060f42
	dc.w loc_061100-loc_060f42
	dc.w loc_06114a-loc_060f42

;----------------------------------------------
loc_060f4a:
	tst.b ($33,a6)
	bpl.b loc_060f98
	move.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($247,a6)
	move.b d0,($5b,a6)
	move.w d0,($16,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff9000,($48,a6)
	move.l #$e0000,($44,a6)
	move.l #$ffff4000,($4c,a6)
	moveq #$3c,d0
	jmp loc_02a758

loc_060f98:
	tst.b ($35,a6)
	beq.b loc_060fa8
	clr.b ($35,a6)
	jsr loc_080e8e

loc_060fa8:
	jmp loc_02a7ea

;==============================================
;Up Ball
;==============================================
loc_060fae:
	move.b (7,a6),d0
	move.w loc_060fba(pc,d0.w),d1
	jmp loc_060fba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_060fba:
	dc.w loc_060fc2-loc_060fba
	dc.w loc_061082-loc_060fba
	dc.w loc_061100-loc_060fba
	dc.w loc_06114a-loc_060fba

;----------------------------------------------
loc_060fc2:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($247,a6)
	move.b d0,($5b,a6)
	move.w d0,($16,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	tst.b ($132,a6)
	bpl.b loc_060ffe
	addi.w #$30,d0

loc_060ffe:
	move.l loc_061022(pc,d0.w),($40,a6)
	move.l loc_061022+4(pc,d0.w),($48,a6)
	move.l loc_061022+8(pc,d0.w),($44,a6)
	move.l loc_061022+$c(pc,d0.w),($4c,a6)
	moveq #$1b,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061022:
	dc.l $00090000,$ffff9000,$00088000,$ffffa000
	dc.l $000a0000,$ffff9000,$00098000,$ffffa000
	dc.l $00160000,$fffe2000,$000e0000,$ffffa000
	dc.l $00040000,$ffffc000,$00088000,$ffff8000
	dc.l $000a0000,$ffff9000,$00098000,$ffff6800
	dc.l $00140000,$ffff0000,$000e0000,$ffff1800

;----------------------------------------------
loc_061082:
	tst.b ($132,a6)
	bpl.b loc_0610be
	tst.b ($5b,a6)
	bne.w loc_061158
	bsr.w loc_061908
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffff9000,($4c,a6)
	moveq #$1c,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_0610be:
	tst.b ($5b,a6)
	bne.w loc_061158
	bsr.w loc_061908
	tst.w ($40,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l #$fffc8000,($40,a6)
	move.l #$1800,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffff9000,($4c,a6)
	moveq #$1c,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_061100:
	tst.b ($35,a6)
	beq.w loc_0617c2
	bsr.w loc_061908
	tst.w ($40,a6)
	ble.b loc_06111c
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_06111c:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$21,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06114a:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	jmp loc_02bb26

loc_061158:
	move.b #4,(7,a6)
	bra.w loc_06191c

;==============================================
;Tropical Hazard
;==============================================
loc_061162:
	move.b (7,a6),d0
	move.w loc_06116e(pc,d0.w),d1
	jmp loc_06116e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06116e:
	dc.w loc_061182-loc_06116e
	dc.w loc_06118e-loc_06116e
	dc.w loc_0611c6-loc_06116e
	dc.w loc_0611e6-loc_06116e
	dc.w loc_061220-loc_06116e
	dc.w loc_061270-loc_06116e
	dc.w loc_061344-loc_06116e
	dc.w loc_0613d8-loc_06116e

	dc.w loc_061422-loc_06116e
	dc.w loc_061450-loc_06116e

;----------------------------------------------
loc_061182:
	addq.b #2,(7,a6)
	moveq #$24,d0
	jmp loc_02a758

;----------------------------------------------
loc_06118e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_0611c4
	addq.b #2,(7,a6)
	addi.w #$40,($14,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$88000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_0611c4:
	rts

;----------------------------------------------
loc_0611c6:
	bsr.w loc_061908
	move.w ($64,a6),d0
	addi.w #$80,d0
	cmp.w ($14,a6),d0
	bge.w loc_0617c0
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)

;----------------------------------------------
loc_0611e6:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.b #$3c,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06120c
	moveq #1,d0

loc_06120c:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$28,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_061220:
	subq.b #1,($3a,a6)
	bpl.b loc_06125a
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_061240
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_061240:
	clr.b ($25d,a6)
	move.b loc_061268(pc,d0.w),($3a,a6)
	move.b loc_06126c(pc,d0.w),($3b,a6)
	clr.b ($1f1,a6)
	move.b #1,($32,a6)

loc_06125a:
	tst.b ($35,a6)
	bpl.w loc_0617c2
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;padding
	dc.w $0000,$0000

loc_061268:
	dc.b $02,$04,$06,$00

loc_06126c:
	dc.b $02,$00,$00,$00

;----------------------------------------------
loc_061270:
	bsr.w loc_06130a
	tst.b ($33,a6)
	bpl.w loc_0617c2
	move.b #$18,($123,a5)
	moveq #1,d5

loc_061284:
	jsr loc_01c1c8
	beq.b loc_0612bc
	move.l #$01002000,(a4)
	move.b ($82,a6),($72,a4)
	move.b ($1f1,a6),($31,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.w a6,($36,a4)
	addq.b #1,($1f1,a6)
	dbra d5,loc_061284
	move.b #2,(3,a4)

loc_0612bc:
	tst.b ($107,a5)
	bne.b loc_0612fe
	bsr.w loc_061320
	beq.b loc_0612fe
	subq.b #1,($3a,a6)
	beq.b loc_0612fe
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	add.b ($3a,a6),d0
	move.b loc_0612e6(pc,d0.w),($3b,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0612e6:
	dc.b $7f,$7f,$7f,$7f,$7f,$7f
	dc.b $7f,$7f,$7f,$7f,$05,$02
	dc.b $7f,$7f,$7f,$7f,$7f,$7f
	dc.b $08,$05,$02,$00,$7f,$7f

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_0612fe:
	addq.b #2,(7,a6)
	moveq #$25,d0
	jmp loc_02a758

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06130a:
	tst.b ($125,a6)
	bne.b loc_06131e
	move.w ($378,a6),d0
	andi.w #$770f,d0
	beq.b loc_06131e
	subq.b #1,($3b,a6)

loc_06131e:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_061320:
	tst.b ($125,a6)
	bne.b loc_061334
	tst.b ($3b,a6)
	bpl.b loc_061330
	moveq #1,d0
	rts

loc_061330:
	moveq #0,d0
	rts

loc_061334:
	lea.l loc_06199e(pc),a1
	jmp loc_030a66

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06133e:
	dc.w $0002,$0003,$0004

;----------------------------------------------
loc_061344:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06133e(pc,d0.w),($3a,a6)
	addi.w #$30,($14,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	move.w ($64,a6),d0
	swap d0
	addi.l #$100000,d0
	sub.l ($14,a6),d0
	asr.l #6,d0
	move.l d0,d1
	add.l d1,d1
	add.l d1,d0
	move.l d0,($44,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	bpl.b loc_061396
	neg.l d0

loc_061396:
	move.l d0,d1
	asr.l #6,d0
	move.l d0,d2
	add.l d2,d2
	add.l d2,d0
	move.l d0,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b d0,($5b,a6)
	st.b ($dd,a6)
	swap d1
	cmpi.w #$20,d1
	ble.b loc_0613c8
	moveq #$6,d0
	cmpi.w #$b0,d1
	ble.b loc_0613c8
	moveq #$c,d0

loc_0613c8:
	add.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$26,d0
	jmp loc_02a758

;----------------------------------------------
loc_0613d8:
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.w loc_06145e
	tst.b ($5b,a6)
	beq.b loc_0613fc
	clr.b ($5b,a6)
	subq.w #1,($3a,a6)
	bmi.w loc_06145e
	jmp loc_02a7ea

loc_0613fc:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	move.w ($64,a6),($14,a6)
	move.b #$10,($123,a5)
	jsr loc_080e70
	bra.w loc_06145e

;----------------------------------------------
loc_061422:
	bsr.w loc_061908
	bpl.w loc_0617c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$30,d0
	jmp loc_02a758

;----------------------------------------------
loc_061450:
	tst.b ($33,a6)
	bmi.w loc_0617ce
	jmp loc_02a7ea

loc_06145e:
	move.b #$10,(7,a6)
	bsr.w loc_06191c
	moveq #$2f,d0
	jmp loc_02a758

;==============================================
;Taunt
;==============================================
loc_061470:
	move.b (7,a6),d0
	move.w loc_06147c(pc,d0.w),d1
	jmp loc_06147c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06147c:
	dc.w loc_061480-loc_06147c
	dc.w loc_0614ac-loc_06147c

;----------------------------------------------
loc_061480:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_061494
	subq.b #1,(pl_taunt_count,a6)

loc_061494:
	moveq #0,d0
	move.b d0,($a9,a6)
	move.b d0,($2c8,a6)
	move.w #2,($3a,a6)
	moveq #$32,d0
	jmp loc_02a758

;----------------------------------------------
loc_0614ac:
	tst.b ($35,a6)
	beq.b loc_0614be
	clr.b ($35,a6)
	subq.w #1,($3a,a6)
	bmi.w loc_0617c8

loc_0614be:
	jmp loc_02a7ea

;==============================================
;Vism Alpha Counter
;==============================================
loc_0614c4:
	move.b (7,a6),d0
	move.w loc_0614d0(pc,d0.w),d1
	jmp loc_0614d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0614d0:
	dc.w loc_0614d4-loc_0614d0
	dc.w loc_0614fc-loc_0614d0

;----------------------------------------------
loc_0614d4:
	tst.b ($33,a6)
	bpl.b loc_0614e6
	addq.b #2,(7,a6)
	moveq #$3d,d0
	jmp loc_02a758

loc_0614e6:
	tst.b ($35,a6)
	beq.b loc_0614f6
	clr.b ($35,a6)
	jsr loc_080e8e

loc_0614f6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0614fc:
	tst.b ($33,a6)
	bmi.w loc_0617c8
	jmp loc_02a7ea

;##############################################
;Throws
;##############################################
loc_06150a:
	cmpi.b #4,($80,a6)
	beq.w loc_061684
	move.b (7,a6),d0
	move.w loc_061526(pc,d0.w),d1
	jsr loc_061526(pc,d1.w)
	jmp loc_02fa36

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061526:
	dc.w loc_061534-loc_061526
	dc.w loc_061548-loc_061526
	dc.w loc_0615ba-loc_061526
	dc.w loc_0615c8-loc_061526
	dc.w loc_061602-loc_061526
	dc.w loc_061646-loc_061526
	dc.w loc_061676-loc_061526

;----------------------------------------------
loc_061534:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$39,d0
	jmp loc_02a758

;----------------------------------------------
loc_061548:
	tst.b ($35,a6)
	beq.w loc_0617c2
	moveq #$27,d0
	jsr loc_02e3fe
	beq.b loc_0615b0
	tst.b ($125,a6)
	beq.b loc_06157a
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06158e
	bra.b loc_061592

loc_06157a:
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_061592
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_061592

loc_06158e:
	addq.b #1,($b,a6)

loc_061592:
	move.b #1,($31,a6)
	move.w #$78,($ae,a6)
	clr.w ($3a,a6)
	move.b #6,(7,a6)
	moveq #0,d0
	jmp loc_02a758

loc_0615b0:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0615ba:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	jmp loc_02baf2

;----------------------------------------------
loc_0615c8:
	tst.b ($35,a6)
	beq.b loc_0615dc
	clr.b ($35,a6)
	moveq #$53,d0
	jsr loc_02e970
	bne.b loc_0615f6

loc_0615dc:
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_0615f6
	jsr loc_02ea06
	jsr loc_02ea7a
	beq.w loc_0617c2

loc_0615f6:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_061602:
	tst.b ($35,a6)
	beq.b loc_061640
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$54,d0
	jsr loc_02e970
	moveq #$27,d0
	jsr loc_02e7f2
	move.l #$fffe8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffff6000,($4c,a6)

loc_061640:
	jmp loc_02a7ea

;----------------------------------------------
loc_061646:
	bsr.w loc_061908
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06166c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c

loc_06166c:
	tst.b ($35,a6)
	beq.w loc_0617c2
	rts

;----------------------------------------------
loc_061676:
	tst.b ($33,a6)
	bpl.w loc_0617c2
	jmp loc_02baf2

;==============================================
;Air Throw
;==============================================
loc_061684:
	move.b (7,a6),d0
	move.w loc_061696(pc,d0.w),d1
	jsr loc_061696(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061696:
	dc.w loc_0616a2-loc_061696
	dc.w loc_061718-loc_061696
	dc.w loc_06172e-loc_061696
	dc.w loc_061768-loc_061696
	dc.w loc_061790-loc_061696
	dc.w loc_061768-loc_061696

;----------------------------------------------
loc_0616a2:
	moveq #$46,d0
	tst.b ($81,a6)
	beq.b loc_0616ac
	moveq #$3b,d0

loc_0616ac:
	jsr loc_02e636
	beq.b loc_06170c
	tst.b ($125,a6)
	beq.b loc_0616d4
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_0616e8
	bra.b loc_0616ec

loc_0616d4:
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_0616ec
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_0616ec

loc_0616e8:
	addq.b #1,($b,a6)

loc_0616ec:
	move.b #4,(7,a6)
	moveq #$3b,d0
	tst.b ($81,a6)
	bne.b loc_061706
	bsr.w loc_0618d2
	move.b #8,(7,a6)
	moveq #$3e,d0

loc_061706:
	jmp loc_02a758

loc_06170c:
	addq.b #2,(7,a6)
	moveq #$3a,d0
	jmp loc_02a758

;----------------------------------------------
loc_061718:
	jsr loc_02aa08
	bcc.w loc_0617c2
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_06172e:
	tst.b ($35,a6)
	beq.b loc_061762
	bmi.b loc_061762
	addq.b #2,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	moveq #$56,d0
	jsr loc_080b70
	moveq #$3b,d0
	jsr loc_02e7f2

loc_061762:
	jmp loc_02a7ea

;----------------------------------------------
loc_061768:
	bsr.w loc_061908
	bpl.w loc_0617c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0617c2
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_02bd64

;----------------------------------------------
loc_061790:
	tst.b ($35,a6)
	bpl.b loc_0617ba
	addq.b #2,(7,a6)
	move.l #$ffff0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$58000,($44,a6)
	moveq #$46,d0
	jsr loc_02e7f2

loc_0617ba:
	jmp loc_02a7ea

;==============================================
loc_0617c0:
	rts

;==============================================
loc_0617c2:
	jmp loc_02a7ea

;==============================================
loc_0617c8:
	jmp loc_02baf2

;==============================================
loc_0617ce:
	jmp loc_02bb26

;==============================================
loc_0617d4:
	tst.b ($125,a6)
	bne.b loc_0617e6
	tst.w ($378,a6)
	beq.b loc_0617e6
	move.b #1,($32,a6)

loc_0617e6:
	rts

;==============================================
loc_0617e8:
	moveq #0,d2
	move.b ($132,a6),d2
	addq.w #1,d2
	add.w d2,d2
	add.b ($128,a6),d2
	moveq #5,d1

loc_0617f8:
	jsr loc_01c2c8
	beq.b loc_06181e
	addq.b #1,(a4)
	move.b #$27,(2,a4)
	move.b #$14,(3,a4)
	move.b d1,($3a,a4)
	move.b d2,($3b,a4)
	move.w a6,($36,a4)
	dbra d1,loc_0617f8

loc_06181e:
	rts

;==============================================
loc_061820:
	moveq #5,d1

loc_061822:
	jsr loc_01c2c8
	beq.b loc_061840
	addq.b #1,(a4)
	move.b #$27,(2,a4)
	move.b #$1a,(3,a4)
	move.w a6,($36,a4)
	dbra d1,loc_061822

loc_061840:
	rts

;==============================================
loc_061842:
	move.b #1,($1f0,a6)
	jsr loc_01c2c8
	beq.b loc_061866
	addq.b #1,(a4)
	move.b #$27,(2,a4)
	move.b #0,(3,a4)
	move.w a6,($36,a4)
	clr.b ($1f0,a6)

loc_061866:
	rts

;==============================================
loc_061868:
	jsr loc_01c2c8
	beq.b loc_06187a
	move.l #$01002718,(a4)
	move.w a6,($36,a4)

loc_06187a:
	rts

;==============================================
loc_06187c:
	jsr loc_01c2c8
	beq.b loc_0618d0
	move.l #$100271c,(a4)
	move.b #2,(9,a4)
	move.b #$1e,($3c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_0618d0
	move.l #$0100271c,(a4)
	move.b #4,(9,a4)
	move.b #$1f,($3c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	move.w a6,($36,a4)

loc_0618d0:
	rts

;==============================================
loc_0618d2:
	jsr loc_01c2c8
	beq.b loc_0618ec
	addq.b #1,(a4)
	move.b #$27,(2,a4)
	move.b #$16,(3,a4)
	move.w a6,($36,a4)

loc_0618ec:
	rts

;==============================================
loc_0618ee:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0618fa
	neg.l d0

loc_0618fa:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_061908:
	bsr.b loc_0618ee

;==============================================
loc_06190a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_06191c:
	move.b #1,($2d9,a6)
	move.l #$fffe0000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	rts

;##############################################
;
;##############################################
loc_06194a:
	jsr loc_01c368
	beq.b loc_061966
	addq.b #1,(a4)
	move.b #$19,(2,a4)
	move.w a6,($36,a4)
	clr.b ($3a,a4)
	move.w a4,($28,a6)

loc_061966:
	rts

;==============================================
loc_061968:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	movem.l d0-d1,($1b0,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06199e:
	dc.l $003fffff,$003fffff,$007fffff,$007fffff
	dc.l $007fffff,$00ffffff,$00ffffff,$00ffffff
	dc.l $01ffffff,$01ffffff,$01ffffff,$03ffffff
	dc.l $03ffffff,$03ffffff,$07ffffff,$07ffffff
	dc.l $07ffffff,$0fffffff,$0fffffff,$0fffffff
	dc.l $1fffffff,$1fffffff,$1fffffff,$3fffffff
	dc.l $3fffffff,$3fffffff,$7fffffff,$7fffffff
	dc.l $7fffffff,$ffffffff,$ffffffff,$ffffffff

;##############################################
;
;##############################################
loc_061a1e:
	dc.w loc_061a64-loc_061a1e
	dc.w loc_061a64-loc_061a1e
	dc.w loc_061a24-loc_061a1e

loc_061a24:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$02,$02,$02,$02,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$09,$0b

loc_061a64:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$02,$02,$02,$02,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$08,$0a