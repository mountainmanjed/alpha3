;Ken Programming

;##############################################################################
;Opening table_dcf16
;##############################################################################
loc_035a74:
	move.b ($6,a6),d0
	move.w loc_035a80(pc,d0.w),d1
	jmp loc_035a80(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035a80:
	dc.w loc_035a86-loc_035a80
	dc.w loc_035ad2-loc_035a80
	dc.w loc_035aea-loc_035a80

;------------------------------------------------------------------------------
loc_035a86:
	addq.b #2,(6,a6)
	moveq #$22,d0
	movea.w ($38,a6),a4
	cmpi.b #0,($102,a4)
	bne.b loc_035acc
	move.b #4,(6,a6)
	move.w ($10,a6),($40,a6)
	st.b ($3c,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	moveq #1,d1
	tst.b ($101,a6)
	bne.b loc_035abe
	move.w #$120,d0
	moveq #0,d1

loc_035abe:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	move.b d1,($b,a6)
	moveq #$30,d0

loc_035acc:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_035ad2:
	tst.b ($33,a6)
	bpl.w loc_037508
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_035aea:
	tst.b ($3c,a6)
	bne.b loc_035afe
	move.b #2,(6,a6)
	moveq #$22,d0
	jmp loc_02a708

loc_035afe:
	rts

;##############################################################################
;Winposes
;##############################################################################
loc_035b00:
	move.b (6,a6),d0
	move.w loc_035b0c(pc,d0.w),d1
	jmp loc_035b0c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035b0c:
	dc.w loc_035b14-loc_035b0c
	dc.w loc_035b26-loc_035b0c
	dc.w loc_035b3c-loc_035b0c
	dc.w loc_035c3c-loc_035b0c

;==============================================================================
loc_035b14:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================================================
loc_035b26:
	tst.b ($124,a5)
	bne.b loc_035b36
	tst.b ($11c,a5)
	bne.b loc_035b36
	addq.b #2,(6,a6)

loc_035b36:
	jmp loc_02a7ea

;==============================================================================
loc_035b3c:
	addq.b #2,(6,a6)
	movea.w ($38,a6),a4
	move.b #$3c,($3a,a6)
	cmpi.b #8,($2c4,a6)
	beq.w loc_035b64
	tst.b ($2c4,a6)
	bne.w loc_035c12
	tst.b ($125,a4)
	beq.w loc_035bfc

loc_035b64:
	tst.b ($10d,a5)
	bne.w loc_035bfc
	tst.b ($102,a4)
	bne.w loc_035bfc
	tst.b ($143,a5)
	beq.w loc_035bfc
	moveq #0,d0
	move.b ($b,a6),d0
	move.b ($b,a4),d1
	cmp.b d0,d1
	beq.w loc_035bfc
	move.w ($10,a6),d0
	move.w ($10,a4),d1
	sub.w d0,d1
	addi.w #$70,d1
	move.w #$e0,d0
	cmp.w d1,d0
	bcc.w loc_035bfc
	move.w ($10,a6),d0
	move.w ($10,a4),d1
	sub.w d0,d1
	addi.w #$100,d1
	move.w #$200,d0
	cmp.w d1,d0
	bcs.w loc_035bfc
	move.b #$e,($2c4,a6)
	moveq #0,d0
	move.b d0,($b,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.l #$fffd0000,d0
	move.w ($10,a6),d1
	move.w ($10,a4),d2
	cmp.w d1,d2
	bcs.w loc_035bf0
	move.b #1,($b,a6)
	neg.l d0

loc_035bf0:
	move.l d0,($40,a6)
	moveq #2,d0
	jmp loc_02a708

loc_035bfc:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_035c24(pc,d0.w),d0
	addq.b #1,d0
	add.w d0,d0
	move.b d0,($2c4,a6)

loc_035c12:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	ext.w d0
	move.b loc_035c34(pc,d0.w),d0
	jmp loc_02a708

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035c24:
	dc.b $00,$01,$02,$00
	dc.b $01,$02,$00,$01
	dc.b $02,$00,$01,$02
	dc.b $00,$01,$02,$00

loc_035c34:
	dc.b $23,$23,$24,$25
	dc.b $23,$24,$25,$23

;==============================================================================
loc_035c3c:
	move.b ($2c4,a6),d0
	move.w loc_035c48(pc,d0.w),d1
	jmp loc_035c48(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035c48:
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c58-loc_035c48
	dc.w loc_035c72-loc_035c48

;------------------------------------------------------------------------------
loc_035c58:
	tst.b ($3a,a6)
	beq.b loc_035c6c
	subq.b #1,($3a,a6)
	bne.b loc_035c6c
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_035c6c:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_035c72:
	move.b ($7,a6),d0
	move.w loc_035c7e(pc,d0.w),d1
	jmp loc_035c7e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035c7e:
	dc.w loc_035c82-loc_035c7e
	dc.w loc_035cd8-loc_035c7e

;------------------------------------------------------------------------------
loc_035c82:
	movea.w ($38,a6),a4
	move.w ($10,a6),d0
	move.w ($10,a4),d1
	sub.w d0,d1
	addi.w #$50,d1
	move.w #$a0,d0
	cmp.w d1,d0
	bcs.w loc_035cca
	move.w ($10,a4),d0
	addi.w #$50,d0
	tst.b ($b,a6)
	beq.b loc_035cb0
	subi.w #$a0,d0

loc_035cb0:
	move.w d0,($10,a6)
	addq.b #2,(7,a6)
	moveq #$31,d0
	jsr loc_02a708
	moveq #0,d1
	moveq #$32,d0
	jmp loc_02a838

loc_035cca:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_035cd8:
	tst.b ($3a,a6)
	beq.b loc_035cec
	subq.b #1,($3a,a6)
	bne.b loc_035cec
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_035cec:
	jsr loc_02a7ea
	jmp loc_02a8c6


;==============================================================================
;Normals Programming
;==============================================================================
loc_035cf8:
	tst.b ($80,a6)
	bne.w loc_035eb6
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_035d94
	move.b ($82,a6),d0
	move.w loc_035d18(pc,d0.w),d1
	jmp loc_035d18(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035d18:
	dc.w loc_035d1e-loc_035d18
	dc.w loc_035d1e-loc_035d18
	dc.w loc_035d1e-loc_035d18

;==============================================================================
loc_035d1e:
	move.b (7,a6),d0
	move.w loc_035d2a(pc,d0.w),d1
	jmp loc_035d2a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035d2a:
	dc.w loc_035d2e-loc_035d2a
	dc.w loc_035d8e-loc_035d2a

;------------------------------------------------------------------------------
loc_035d2e:
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
	bne.b loc_035d6e
	cmpi.b #1,($132,a6)
	bne.b loc_035d6e
	btst.b #0,($83,a6)
	bne.b loc_035d82
	bra.b loc_035d80

loc_035d6e:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_035d88(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_035d82

loc_035d80:
	addq.b #1,d0

loc_035d82:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035d88:
	dc.w $0030,$0020,$0038

;------------------------------------------------------------------------------
loc_035d8e:
	jmp loc_02f5ac

;==============================================================================
loc_035d94:
	move.b (7,a6),d0
	move.w loc_035da0(pc,d0.w),d1
	jmp loc_035da0(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035da0:
	dc.w loc_035da8-loc_035da0
	dc.w loc_035e64-loc_035da0
	dc.w loc_035e6a-loc_035da0
	dc.w loc_035e90-loc_035da0

;------------------------------------------------------------------------------
loc_035da8:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b d1,d0
	tst.b ($82,a6)
	beq.w loc_035e58
	cmpi.b #4,($82,a6)
	beq.b loc_035df4
	btst.b #1,($83,a6)
	beq.b loc_035e18
	move.b #4,(7,a6)
	moveq #$1e,d0
	bra.w loc_035e58

loc_035df4:
	btst.b #1,($83,a6)
	beq.b loc_035e18
	move.b #6,(7,a6)
	moveq #$10,d1
	tst.b ($b,a6)
	bne.b loc_035e0c
	neg.w d1

loc_035e0c:
	add.w d1,($10,a6)
	moveq #$1f,d0
	jmp loc_02a710

loc_035e18:
	tst.b ($125,a6)
	bne.b loc_035e30
	cmpi.b #1,($132,a6)
	bne.b loc_035e30
	btst.b #0,($83,a6)
	bne.b loc_035e44
	bra.b loc_035e42

loc_035e30:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_035e5e(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_035e58

loc_035e42:
	addq.b #1,d0

loc_035e44:
	cmpi.b #$b,d0
	bne.b loc_035e58
	moveq #$10,d1
	tst.b ($b,a6)
	bne.b loc_035e54
	neg.w d1

loc_035e54:
	add.w d1,($10,a6)

loc_035e58:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035e5e:
	dc.w $0030,$0020,$0018

;------------------------------------------------------------------------------
loc_035e64:
	jmp loc_02f5ac

;------------------------------------------------------------------------------
loc_035e6a:
	tst.b ($33,a6)
	bmi.w loc_0374fc
	tst.b ($35,a6)
	beq.b loc_035e8a
	move.l #$20000,d0
	tst.b ($b,a6)
	bne.b loc_035e86
	neg.l d0

loc_035e86:
	add.l d0,($10,a6)

loc_035e8a:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_035e90:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_0374fc
	moveq #0,d0
	move.b ($35,a6),d0
	clr.b ($35,a6)
	tst.b ($b,a6)
	bne.b loc_035eb0
	neg.w d0

loc_035eb0:
	add.w d0,($10,a6)
	rts

;==============================================================================
loc_035eb6:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_035ec8(pc,d0.w),d1
	jmp loc_035ec8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_035ec8:
	dc.w loc_035ecc-loc_035ec8
	dc.w loc_035f02-loc_035ec8

;------------------------------------------------------------------------------
loc_035ecc:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_035ef8
	addq.b #3,d1

loc_035ef8:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_035f02:
	jmp loc_02f5ac

;==============================================================================
;
;==============================================================================
loc_035f08:
	tst.b ($125,a6)
	beq.b loc_035f18
	btst.b #3,($20a,a6)
	bne.w loc_035f60

loc_035f18:
	move.b #6,(7,a6)
	move.b #1,($a9,a6)
	move.b #4,($80,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_035f48
	moveq #$18,d0

loc_035f48:
	tst.b ($81,a6)
	beq.b loc_035f50
	addq.w #3,d0

loc_035f50:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

loc_035f60:
	move.l #$2000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b #1,($a9,a6)
	bra.w loc_0363ae

;==============================================================================
;Specials
;==============================================================================
loc_035f78:
	tst.b ($132,a6)
	beq.w loc_035f88
	bmi.w loc_035f88
	bra.w loc_035f88

loc_035f88:
	jsr loc_02e096
	bne.w loc_03601c

;Special input checks
loc_035f92:
	lea.l ($1a0,a6),a4
	jsr loc_02d692
	bne.w loc_036244

loc_035fa0:
	lea.l ($198,a6),a4
	jsr loc_02d69a
	bne.w loc_03619a

loc_035fae:
	lea.l ($1b8,a6),a4
	jsr loc_02d6b2
	bne.w loc_036282

loc_035fbc:
	lea.l ($188,a6),a4
	jsr loc_02d61a
	bne.w loc_0361d6

loc_035fca:
	lea.l ($180,a6),a4
	jsr loc_02d5ea
	bne.w loc_0361fe

loc_035fd8:
	lea.l ($1a8,a6),a4
	jsr loc_02d60a
	bne.w loc_0360ac

loc_035fe6:
	lea.l ($190,a6),a4
	jsr loc_02d612
	bne.w loc_0362c6

loc_035ff4:
	lea.l ($1b0,a6),a4
	jsr loc_02d6ea
	bne.w loc_0360e6

loc_036002:
	jsr loc_02e0cc
	bne.w loc_036080

loc_03600c:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_036110

loc_03601a:
	rts

loc_03601c:
	tst.b ($28a,a6)
	bne.w loc_035f92
	tst.b ($31,a6)
	bne.w loc_03605a
	jsr loc_02ef54
	beq.w loc_035f92
	jsr loc_02ecd8
	beq.w loc_035f92
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_03605a:
	tst.b ($b9,a6)
	bne.w loc_035f92
	jsr loc_02ed28
	beq.w loc_035f92
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	jmp loc_02f980

;==============================================================================
loc_036080:
	tst.b ($b9,a6)
	bne.b loc_03608c
	tst.b ($bc,a6)
	beq.b loc_03600c

loc_03608c:
	jsr loc_02ed00
	beq.w loc_03600c
	move.l #$2000e00,(4,a6)
	move.b #$e,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

loc_0360ac:
	tst.b ($132,a6)
	bmi.w loc_035fe6
	tst.b ($b9,a6)
	bne.b loc_0360c2
	tst.b ($23e,a6)
	bne.w loc_035fe6

loc_0360c2:
	jsr loc_02ed00
	beq.w loc_035fe6
	move.l #$2000e00,(4,a6)
	move.b #$c,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

loc_0360e6:
	cmpi.b #-1,($132,a6)
	beq.w loc_036002
	jsr loc_02ed00
	beq.w loc_036002
	move.l #$2000e00,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

loc_036110:
	jsr loc_02edf8
	beq.w loc_03601a

loc_03611a:
	tst.b ($132,a6)
	bne.w loc_036160
	move.l #$2000e0a,(4,a6)
	clr.b ($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #3,d0
	jmp loc_02a758

loc_036160:
	move.l #$2000e00,(4,a6)
	move.b #$10,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$19,($5f,a4)
	move.b #$1d,($25d,a6)
	moveq #$28,d0
	jmp loc_02a758

;==============================================================================
loc_03619a:
	tst.b ($132,a6)
	bne.w loc_035fae
	cmpi.w #$30,($11e,a6)
	bcs.w loc_035fae
	jsr loc_02ecd8
	beq.w loc_035fae
	move.l #$2001000,(4,a6)
	move.b #8,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;==============================================================================
loc_0361d6:
	jsr loc_02ed00
	beq.w loc_035fca
	move.l #$2000e00,(4,a6)
	clr.b ($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;==============================================================================
loc_0361fe:
	tst.b ($b9,a6)
	bne.b loc_036210
	tst.b ($238,a6)
	bne.w loc_035fd8
	bra.w loc_03621a

loc_036210:
	cmpi.b #2,($238,a6)
	bcc.w loc_035fd8

loc_03621a:
	jsr loc_02ed00
	beq.w loc_035fd8
	move.l #$2000e00,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;==============================================================================
loc_036244:
	cmpi.b #1,($132,a6)
	beq.w loc_035fa0
	cmpi.w #$30,($11e,a6)
	bcs.w loc_035fa0
	jsr loc_02ecd8
	beq.w loc_035fa0
	move.l #$2001000,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;==============================================================================
loc_036282:
	tst.b ($132,a6)
	bne.w loc_035fbc
	cmpi.w #$90,($11e,a6)
	bcs.w loc_035fbc
	jsr loc_02ecd8
	beq.w loc_035fbc
	move.l #$2001000,(4,a6)
	move.b #$16,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	move.b #4,($248,a6)
	rts

;==============================================================================
loc_0362c6:
	tst.b ($31,a6)
	beq.b loc_0362de
	jsr loc_02ed28
	beq.w loc_035ff4
	move.b #6,($aa,a6)
	bra.b loc_0362f4

loc_0362de:
	jsr loc_02ed00
	beq.w loc_035ff4
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)

loc_0362f4:
	move.l #$2000e00,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;==============================================================================
loc_036308:
	move.b ($aa,a6),d0
	move.w loc_036314(pc,d0.w),d1
	jmp loc_036314(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036314:
	dc.w loc_03632c-loc_036314;00
	dc.w loc_036354-loc_036314;02
	dc.w loc_03632c-loc_036314;04
	dc.w loc_036360-loc_036314;06
	dc.w loc_03636c-loc_036314;08
	dc.w loc_036398-loc_036314;0a
	dc.w loc_036338-loc_036314;0c
	dc.w loc_036330-loc_036314;0e

	dc.w loc_03632c-loc_036314;10
	dc.w loc_03632c-loc_036314;12
	dc.w loc_036338-loc_036314;14
	dc.w loc_036382-loc_036314;16

;------------------------------------------------------------------------------
loc_03632c:
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_036330:
	tst.b ($bc,a6)
	beq.w loc_0363aa

;------------------------------------------------------------------------------
loc_036338:
	cmpi.b #-1,($132,a6)
	beq.w loc_0363aa
	tst.b ($b9,a6)
	bne.b loc_036350
	tst.b ($23e,a6)
	bne.w loc_0363aa

loc_036350:
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_036354:
	tst.w ($a4,a6)
	bne.w loc_0363aa
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_036360:
	tst.b ($31,a6)
	beq.w loc_0363aa
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_03636c:
	tst.b ($132,a6)
	bne.w loc_0363aa
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0363aa
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_036382:
	tst.b ($132,a6)
	bne.w loc_0363aa
	cmpi.w #$90,($11e,a6)
	bcs.w loc_0363aa
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_036398:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0363aa
	bra.w loc_0363a6

;------------------------------------------------------------------------------
loc_0363a6:
	moveq #1,d0
	rts

;------------------------------------------------------------------------------
loc_0363aa
	moveq #0,d0
	rts

;==============================================================================
loc_0363ae:
	move.b ($aa,a6),d0
	move.w loc_0363ba(pc,d0.w),d1
	jmp loc_0363ba(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0363ba:
	dc.w loc_0363d2-loc_0363ba;00 DP
	dc.w loc_036596-loc_0363ba;02 Hadouken
	dc.w loc_03671c-loc_0363ba;04 Tatsu
	dc.w loc_036836-loc_0363ba;06 Air Tatsu
	dc.w loc_0369ac-loc_0363ba;08 Shin Ryuken
	dc.w loc_036b58-loc_0363ba;0a Shoryu Reppa
	dc.w loc_036d52-loc_0363ba;0c Roll
	dc.w loc_036dd0-loc_0363ba;0e Taunt

	dc.w loc_036e26-loc_0363ba;10 AC Kick
	dc.w loc_036e7a-loc_0363ba;12 Vism Activate
	dc.w loc_036efc-loc_0363ba;14 Roll Feint
	dc.w loc_037000-loc_0363ba;16 Jinrai Kyaku

;==============================================================================
;Shoryuken
;==============================================================================
loc_0363d2:
	move.b (7,a6),d0
	move.w loc_0363de(pc,d0.w),d1
	jmp loc_0363de(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0363de:
	dc.w loc_0363ea-loc_0363de
	dc.w loc_03647c-loc_0363de
	dc.w loc_036492-loc_0363de
	dc.w loc_0364ca-loc_0363de
	dc.w loc_03651e-loc_0363de
	dc.w loc_03653a-loc_0363de

;------------------------------------------------------------------------------
loc_0363ea:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	move.b ($82,a6),d1
	ext.w d1
	lsl.w #2,d1
	tst.b ($132,a6)
	bpl.b loc_03642e
	move.l loc_03644c(pc,d1.w),($40,a6)
	move.l loc_03644c+4(pc,d1.w),($44,a6)
	bra.b loc_03643a

loc_03642e:
	move.l loc_036464(pc,d1.w),($40,a6)
	move.l loc_036464+4(pc,d1.w),($44,a6)

loc_03643a:
	moveq #5,d0
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03644c:
	dc.l $00050000,$00060000
	dc.l $00090000,$00080000
	dc.l $000c0000,$000a0000

loc_036464:
	dc.l $00040000,$00059000
	dc.l $00080000,$00080000
	dc.l $000b0000,$000a0000

;------------------------------------------------------------------------------
loc_03647c:
	tst.b ($35,a6)
	bne.b loc_03648c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_03648c:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036492:
	bsr.w loc_036584
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0364a2
	neg.l d0

loc_0364a2:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0364b4
	addq.b #2,(7,a6)

loc_0364b4:
	cmpi.b #4,($82,a6)
	bne.b loc_0364c4
	moveq #7,d2
	jsr loc_097e88

loc_0364c4:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0364ca:
	cmpi.b #4,($82,a6)
	bne.b loc_0364e2
	moveq #7,d2
	tst.w ($44,a6)
	bpl.b loc_0364dc
	moveq #8,d2

loc_0364dc:
	jsr loc_097e88

loc_0364e2:
	bsr.w loc_036584
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_0364fe
	tst.b ($35,a6)
	bne.b loc_0364fc
	jmp loc_02a7ea

loc_0364fc:
	rts

loc_0364fe:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b ($a9,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03651e:
	tst.b ($33,a6)
	bpl.b loc_03652e
	jsr loc_02e35a
	bra.w loc_0374fc

loc_03652e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03653a:
	tst.b ($33,a6)
	bpl.b loc_03656e
	move.b #2,(7,a6)
	move.l #$b0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$18,d0
	jmp loc_02a758

loc_03656e:
	tst.b ($35,a6)
	beq.b loc_03657e
	clr.b ($35,a6)
	jsr loc_080e8e

loc_03657e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036584:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================================================
;Hadouken
;==============================================================================
loc_036596:
	move.b ($7,a6),d0
	move.w loc_0365a2(pc,d0.w),d1
	jmp loc_0365a2(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0365a2:
	dc.w loc_0365a8-loc_0365a2
	dc.w loc_0365d0-loc_0365a2
	dc.w loc_0366f8-loc_0365a2

;------------------------------------------------------------------------------
loc_0365a8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$14,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0365d0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_0366e2
	addq.b #2,(7,a6)
	move.b #3,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_0366e2
	addq.b #1,(a4)
	move.w #$100,(2,a4)
	move.b ($59,a6),($59,a4)
	move.b ($5a,a6),($5a,a4)
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
	bsr.w loc_0366e4
	tst.b ($b9,a6)
	beq.w loc_0366e2
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_0366e2
	jsr loc_01c1c8
	beq.w loc_0366e2
	addq.b #1,(a4)
	move.w #$100,(2,a4)
	move.b ($59,a6),($59,a4)
	move.b ($5a,a6),($5a,a4)
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
	move.b ($2a7,a6),($dc,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0366e4

loc_0366e2:
	rts

;------------------------------------------------------------------------------
loc_0366e4:
	move.b #$b,($cc,a4)
	move.b #2,($ee,a4)
	move.b #$8,($ef,a4)
	rts

;------------------------------------------------------------------------------
loc_0366f8:
	tst.b ($33,a6)
	bmi.w loc_0374fc
	tst.b ($3a,a6)
	beq.b loc_036710
	subq.b #1,($3a,a6)
	bne.b loc_036716
	clr.b ($ce,a6)

loc_036710:
	jsr loc_02f6f8

loc_036716:
	jmp loc_02a7ea

;==============================================================================
;Tatsu
;==============================================================================
loc_03671c:
	move.b (7,a6),d0
	move.w loc_036728(pc,d0.w),d1
	jmp loc_036728(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036728:
	dc.w loc_036732-loc_036728
	dc.w loc_03679a-loc_036728
	dc.w loc_0367d4-loc_036728
	dc.w loc_0367fa-loc_036728
	dc.w loc_036822-loc_036728

;------------------------------------------------------------------------------
loc_036732:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.w ($16,a6)
	move.l #$40000,($44,a6)
	move.b #1,($31,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_03678e(pc,d0.w),d0
	tst.b ($b,a6)
	bne.b loc_036778
	neg.l d0

loc_036778:
	move.l d0,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.w #$19,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03678e:
	dc.l $00028000,$00032000,$0003c000

;------------------------------------------------------------------------------
loc_03679a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.w loc_037508
	addq.b #2,(7,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.w #1,d1
	move.b d1,($1f0,a6)
	addq.b #1,($1f0,a6)
	moveq #$a,d0
	add.b d1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0367d4:
	tst.b ($33,a6)
	bpl.b loc_0367ec
	subq.b #1,($1f0,a6)
	bpl.b loc_0367ec
	addq.b #2,(7,a6)
	moveq #9,d0
	jmp loc_02a758

loc_0367ec:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0367fa:
	bsr.w loc_03698a
	bcs.w loc_037508
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	addq.b #2,(7,a6)
	moveq #$11,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_036822:
	tst.b ($33,a6)
	bpl.w loc_037508
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================================================
;Air Tatsu
;==============================================================================
loc_036836:
	move.b (7,a6),d0
	move.w loc_036862(pc,d0.w),d1
	jsr loc_036862(pc,d1.w)
	tst.b ($1f1,a6)
	beq.b loc_036860
	tst.w ($44,a6)
	bpl.b loc_036860
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$20,d0
	bcc.b loc_036860
	clr.b ($1f1,a6)

loc_036860:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036862:
	dc.w loc_03686c-loc_036862
	dc.w loc_03690a-loc_036862
	dc.w loc_03692e-loc_036862
	dc.w loc_03694a-loc_036862
	dc.w loc_036976-loc_036862

;------------------------------------------------------------------------------
loc_03686c:
	addq.b #2,(7,a6)
	clr.b ($1f1,a6)
	move.b #1,($ce,a6)
	tst.w ($44,a6)
	bpl.b loc_036894
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$30,d0
	bcs.b loc_03689c
	move.b #1,($1f1,a6)

loc_036894:
	moveq #9,d0
	jsr loc_0038e4

loc_03689c:
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0368d8(pc,d0.w),d1
	move.l loc_0368d8+4(pc,d0.w),($4c,a6)
	tst.b ($3c,a6)
	bpl.b loc_0368cc
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)

loc_0368cc:
	tst.l ($40,a6)
	beq.b loc_0368f0
	bpl.b loc_0368f8
	neg.l d1
	bra.b loc_0368f8

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0368d8:
	dc.l $00010000,$ffffb000
	dc.l $00018000,$ffffc000
	dc.l $00020000,$ffffd000

;------------------------------------------------------------------------------
loc_0368f0:
	tst.b ($b,a6)
	bne.b loc_0368f8
	neg.l d1

loc_0368f8:
	add.l d1,($40,a6)
	move.b #3,($1f0,a6)
	moveq #$e,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03690a:
	bsr.w loc_03698a
	bcc.w loc_036952
	tst.b ($33,a6)
	bpl.w loc_037508
	subq.b #1,($1f0,a6)
	bne.w loc_037508
	addq.b #2,(7,a6)
	moveq #9,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03692e:
	bsr.w loc_03698a
	bcc.w loc_036952
	tst.b ($33,a6)
	bpl.w loc_037508
	addq.b #2,(7,a6)
	moveq #$21,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_03694a:
	bsr.w loc_03698a
	bcs.w loc_037508

loc_036952:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_036976:
	tst.b ($33,a6)
	bpl.w loc_037508
	jsr loc_02e35a
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_03698a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	rts

;==============================================================================
;Shin Ryuken
;==============================================================================
loc_0369ac:
	move.b (7,a6),d0
	move.w loc_0369b8(pc,d0.w),d1
	jmp loc_0369b8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0369b8:
	dc.w loc_0369c4-loc_0369b8
	dc.w loc_036a0c-loc_0369b8
	dc.w loc_036a30-loc_0369b8
	dc.w loc_036aba-loc_0369b8
	dc.w loc_036b0a-loc_0369b8
	dc.w loc_036b48-loc_0369b8

;------------------------------------------------------------------------------
loc_0369c4:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_036a00(pc,d0.w),($44,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1f,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036a00:
	dc.l $00070000
	dc.l $00080000
	dc.l $00090000

;------------------------------------------------------------------------------
loc_036a0c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_036a2e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_036a26
	moveq #1,d0

loc_036a26:
	move.b d0,($ab,a6)
	bra.w loc_036a58

loc_036a2e:
	rts

;------------------------------------------------------------------------------
loc_036a30:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_036a58
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$22,d0
	jmp loc_02a758

loc_036a58:
	move.w ($34,a6),d0
	andi.w #$e,d0
	move.w loc_036aae(pc,d0.w),d0
	move.w ($64,a6),($14,a6)
	add.w d0,($14,a6)
	cmpi.b #2,($34,a6)
	bne.b loc_036a96
	clr.b ($34,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_036a90
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_036a90:
	move.b loc_036ab6(pc,d0.w),($25d,a6)

loc_036a96:
	cmpi.b #1,($34,a6)
	bne.b loc_036aac
	clr.b ($34,a6)
	moveq #-$18,d0;e8
	moveq #$1c,d1
	jmp loc_082e36

loc_036aac:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036aae:
	dc.w $0000,$ffeb,$ffd2,$ffdd

loc_036ab6:
	dc.b $04,$0c,$10,$00

;------------------------------------------------------------------------------
loc_036aba:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bmi.b loc_036af6
	tst.b ($125,a6)
	beq.b loc_036ae0
	lea.l loc_037570(pc),a1
	jsr loc_030a66
	beq.b loc_036af0
	bra.b loc_036aea

loc_036ae0:
	move.w ($378,a6),d0
	andi.w #$770f,d0
	beq.b loc_036af0

loc_036aea:
	move.b #1,($32,a6)

loc_036af0:
	jmp loc_02a7ea

loc_036af6:
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$34,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_036b0a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_036b2c
	tst.b ($35,a6)
	beq.b loc_036b42
	rts

loc_036b2c:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b ($a9,a6)
	jsr loc_00369c

loc_036b42:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036b48:
	tst.b ($33,a6)
	bpl.b loc_036b42
	jsr loc_02e35a
	bra.w loc_0374fc

;==============================================================================
;Shoryu Reppa
;==============================================================================
loc_036b58:
	move.b (7,a6),d0
	move.w loc_036b64(pc,d0.w),d1
	jmp loc_036b64(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036b64:
	dc.w loc_036b72-loc_036b64
	dc.w loc_036baa-loc_036b64
	dc.w loc_036bd2-loc_036b64
	dc.w loc_036c98-loc_036b64
	dc.w loc_036ce8-loc_036b64
	dc.w loc_036d04-loc_036b64
	dc.w loc_036d42-loc_036b64

;------------------------------------------------------------------------------
loc_036b72:
	addq.b #2,(7,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$10,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_036baa:
	tst.b ($35,a6)
	beq.b loc_036bcc
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_036bbe
	moveq #1,d0

loc_036bbe:
	move.b d0,($ab,a6)
	moveq #-$18,d0;e8
	moveq #$1c,d1
	jsr loc_082e36

loc_036bcc:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036bd2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_036c26
	addq.b #2,(7,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	move.b #2,($23f,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_036c0e(pc,d0.w),($40,a6)
	move.l loc_036c0e+4(pc,d0.w),($44,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036c0e:
	dc.l $00080000,$00080000
	dc.l $000c0000,$000a0000
	dc.l $000c0000,$000a0000

;------------------------------------------------------------------------------
loc_036c26
	cmpi.b #2,($35,a6)
	bne.b loc_036c42
	clr.b ($35,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)

loc_036c42:
	tst.b ($35,a6)
	bne.b loc_036c8c
	tst.b ($ab,a6)
	beq.b loc_036c6a
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_036c64
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_036c64:
	move.b loc_036c94(pc,d0.w),($25d,a6)

loc_036c6a:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_036c76
	neg.l d0

loc_036c76:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_036c8c
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_036c8c:
	move.b #2,($23f,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036c94:
	dc.b $05,$0c,$1f,$00

;------------------------------------------------------------------------------
loc_036c98:
	move.b #2,($23f,a6)
	tst.w ($40,a6)
	bmi.b loc_036cde
	tst.b ($35,a6)
	bne.b loc_036cc0
	move.b #1,($31,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)

loc_036cc0:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_036ccc
	neg.l d0

loc_036ccc:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_036cde:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036ce8:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_036cfe
	addq.b #2,(7,a6)

loc_036cfe:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036d04:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_036d26
	tst.b ($35,a6)
	beq.b loc_036d3c
	rts

loc_036d26:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.b ($a9,a6)
	jsr loc_00369c
 
 loc_036d3c:
 	jmp loc_02a7ea
 
;------------------------------------------------------------------------------
loc_036d42:
	tst.b ($33,a6)
	bpl.b loc_036d3c
	jsr loc_02e35a
	bra.w loc_0374fc

;==============================================================================
;Roll
;==============================================================================
loc_036d52:
	move.b (7,a6),d0
	move.w loc_036d5e(pc,d0.w),d1
	jmp loc_036d5e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036d5e:
	dc.w loc_036d62-loc_036d5e
	dc.w loc_036dac-loc_036d5e

;------------------------------------------------------------------------------
loc_036d62:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	move.b #2,($23f,a6)
	clr.b ($a9,a6)
	move.b #1,($31,a6)
	jsr loc_020674
	move.l #$40000,d1
	tst.b ($b,a6)
	bne.b loc_036d96
	neg.l d1

loc_036d96:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_036dac:
	tst.b ($33,a6)
	bpl.b loc_036dbc
	jsr loc_02e35a
	bra.w loc_037502

loc_036dbc:
	tst.b ($35,a6)
	bne.b loc_036dca
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_036dca:
	jmp loc_02a7ea

;==============================================================================
;Taunt
;==============================================================================
loc_036dd0:
	move.b (7,a6),d0
	move.w loc_036ddc(pc,d0.w),d1
	jmp loc_036ddc(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036ddc:
	dc.w loc_036de0-loc_036ddc
	dc.w loc_036e0e-loc_036ddc

;------------------------------------------------------------------------------
loc_036de0:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_036df4
	subq.b #1,($bc,a6)

loc_036df4:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	moveq #$25,d0
	btst.b #1,($83,a6)
	beq.b loc_036e08
	addq.b #1,d0

loc_036e08:
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_036e0e:
	tst.b ($33,a6)
	bmi.w loc_0374fc
	tst.b ($35,a6)
	beq.b loc_036e20
	clr.b ($35,a6)

loc_036e20:
	jmp loc_02a7ea

;==============================================================================
;AC Kick
;==============================================================================
loc_036e26:
	move.b (7,a6),d0
	move.w loc_036e32(pc,d0.w),d1
	jmp loc_036e32(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036e32:
	dc.w loc_036e36-loc_036e32
	dc.w loc_036e6c-loc_036e32

;------------------------------------------------------------------------------
loc_036e36:
	tst.b ($33,a6)
	bpl.b loc_036e56
	addq.b #2,(7,a6)
	moveq #$18,d1
	tst.b ($b,a6)
	bne.b loc_036e4a
	neg.w d1

loc_036e4a:
	add.w d0,($10,a6)
	moveq #$8,d0
	jmp loc_02a758

loc_036e56:
	tst.b ($35,a6)
	beq.b loc_036e66
	clr.b ($35,a6)
	jsr loc_080e8e

loc_036e66:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036e6c:
	tst.b ($33,a6)
	bpl.w loc_037508
	jmp loc_02baf2

;==============================================================================
;Vism Activate
;==============================================================================
loc_036e7a:
	move.b ($7,a6),d0
	move.w loc_036e86(pc,d0.w),d1
	jmp loc_036e86(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036e86
	dc.w loc_036e8c-loc_036e86
	dc.w loc_036eac-loc_036e86
	dc.w loc_036ee0-loc_036e86

;------------------------------------------------------------------------------
loc_036e8c:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_036ea6
	moveq #$2f,d0

loc_036ea6:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_036eac:
	tst.b ($34,a6)
	beq.b loc_036eda
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-$24,d0
	moveq #$55,d1
	tst.b ($31,a6)
	beq.b loc_036ed0
	moveq #-5,d0
	moveq #$45,d1

loc_036ed0:
	jsr loc_097cd6
	bsr.w loc_037534

loc_036eda:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_036ee0:
	subq.b #1,($3a,a6)
	bne.w loc_037508
	tst.b ($31,a6)
	beq.b loc_036ef6
	move.l #$2000602,(4,a6)

loc_036ef6:
	jmp loc_02f796

;==============================================================================
;Roll Fient
;==============================================================================
loc_036efc:
	move.b (7,a6),d0
	move.w loc_036f08(pc,d0.w),d1
	jmp loc_036f08(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_036f08:
	dc.w loc_036f12-loc_036f08
	dc.w loc_036f46-loc_036f08
	dc.w loc_036f7a-loc_036f08
	dc.w loc_036fae-loc_036f08
	dc.w loc_036ff2-loc_036f08

;------------------------------------------------------------------------------
loc_036f12:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	clr.w ($16,a6)
	move.b #1,($31,a6)
	move.l #$40000,d0
	tst.b ($b,a6)
	bne.b loc_036f3a
	neg.l d0

loc_036f3a:
	move.l d0,($40,a6)
	moveq #$2d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_036f46:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_036f70
	addq.b #2,(7,a6)
	moveq #$14,d0
	tst.b ($b,a6)
	bne.b loc_036f60
	neg.l d0

loc_036f60:
	add.w d0,($10,a6)
	jsr loc_02b0c4
	jsr loc_00365c

loc_036f70:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;------------------------------------------------------------------------------
loc_036f7a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_036fac
	addq.b #2,($7,a6)
	move.l #$30000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #$38000,d0
	tst.b ($b,a6)
	beq.b loc_036fa8
	neg.l d0

loc_036fa8:
	move.l d0,($40,a6)

loc_036fac:
	rts

;------------------------------------------------------------------------------
loc_036fae:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_037508
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_036ff2:
	tst.b ($33,a6)
	bmi.w loc_0374fc
	jmp loc_02a7ea

;==============================================================================
;Jinrai
;==============================================================================
loc_037000:
	move.b (7,a6),d0
	move.w loc_03700c(pc,d0.w),d1
	jmp loc_03700c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_03700c:
	dc.w loc_03701e-loc_03700c
	dc.w loc_03703c-loc_03700c
	dc.w loc_037064-loc_03700c
	dc.w loc_03708a-loc_03700c
	dc.w loc_0370a6-loc_03700c
	dc.w loc_0370de-loc_03700c
	dc.w loc_037100-loc_03700c
	dc.w loc_03712e-loc_03700c

	dc.w loc_037156-loc_03700c

;------------------------------------------------------------------------------
loc_03701e:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$30,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03703c:
	tst.b ($35,a6)
	beq.b loc_03705e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_037050
	moveq #1,d0

loc_037050:
	move.b d0,($ab,a6)
	moveq #$1a,d0
	moveq #$1a,d1
	jsr loc_082e36

loc_03705e:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_037064:
	tst.b ($35,a6)
	bne.b loc_037084
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_037084
	move.b #$c,($25d,a6)

loc_037084:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03708a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0370a4
	bpl.b loc_03709c
	addq.b #2,(7,a6)

loc_03709c:
	clr.b ($35,a6)
	bsr.w loc_03716a

loc_0370a4:
	rts

;------------------------------------------------------------------------------
loc_0370a6:
	addq.b #2,(7,a6)
	clr.w ($16,a6)
	move.b #1,($31,a6)
	move.l #$60000,($40,a6)
	move.l #$ffffb000,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffffd000,($4c,a6)
	move.w #$31,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0370de:
	bsr.w loc_03716a
	tst.b ($33,a6)
	bpl.w loc_037508
	bsr.w loc_03717e
	addq.b #2,(7,a6)
	move.b #4,($1f0,a6)
	moveq #$32,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_037100:
	bsr.w loc_03717e
	tst.l ($40,a6)
	bpl.b loc_037128
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$ffffc800,($4c,a6)
	moveq #$33,d0
	jmp loc_02a758

loc_037128:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03712e:
	bsr.w loc_03698a
	bcs.w loc_037508
	jsr loc_00369c
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	addq.b #2,(7,a6)
	moveq #$13,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_037156:
	tst.b ($33,a6)
	bpl.w loc_037508
	jsr loc_02e35a
	jmp loc_02baf2

;==============================================================================
;
;==============================================================================
loc_03716a:
	moveq #0,d0
	move.b ($34,a6),d0
	tst.b ($b,a6)
	bne.b loc_037178
	neg.l d0

loc_037178:
	add.w d0,($10,a6)
	rts

;==============================================================================
loc_03717e:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_03719a
	neg.l d0

loc_03719a:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================================================
;Throw PRG Start
;==============================================================================
loc_0371a8:
	cmpi.b #4,($80,a6)
	beq.w loc_0373dc
	move.b ($81,a6),d0
	move.w loc_0371be(pc,d0.w),d1
	jmp loc_0371be(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0371be:
	dc.w loc_0371c2-loc_0371be
	dc.w loc_0372de-loc_0371be

;==============================================================================
;Throw Roll up
;==============================================================================
loc_0371c2:
	move.b ($7,a6),d0
	move.w loc_0371d4(pc,d0.w),d1
	jsr loc_0371d4(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0371d4:
	dc.w loc_0371de-loc_0371d4
	dc.w loc_0371f2-loc_0371d4
	dc.w loc_037270-loc_0371d4
	dc.w loc_037286-loc_0371d4
	dc.w loc_0372ca-loc_0371d4

;------------------------------------------------------------------------------
loc_0371de:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$29,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0371f2:
	tst.b ($33,a6)
	bpl.w loc_037508
	addq.b #2,(7,a6)
	moveq #$6a,d0
	jsr loc_02e3fe
	bne.w loc_037218
	move.b #8,(7,a6)
	moveq #$2a,d0
	jmp loc_02a758

loc_037218:
	tst.b ($125,a6)
	beq.b loc_037238
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_037240
	bra.b loc_037246

loc_037238:
	btst.b #1,($371,a6)
	beq.b loc_037246

loc_037240:
	eori.b #1,($b,a6)

loc_037246:
	move.l #$48000,d0
	tst.b ($b,a6)
	beq.b loc_037254
	neg.l d0

loc_037254:
	move.l d0,($40,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffe000,($4c,a6)
	moveq #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_037270:
	tst.b ($35,a6)
	bne.b loc_037280
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_037280:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_037286:
	bsr.w loc_0374e2
	bpl.b loc_0372ac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0372ac
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b d0,($31,a6)

loc_0372ac:
	tst.b ($35,a6)
	beq.b loc_0372c4
	addq.b #2,(7,a6)
	move.b #$18,($123,a5)
	moveq #$6a,d0
	jsr loc_02e7f2

loc_0372c4:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0372ca:
	tst.b ($33,a6)
	bpl.w loc_037508
	eori.b #1,($b,a6)
	jmp loc_02baf2

;==============================================================================
;Knee Bash Throw
;==============================================================================
loc_0372de:
	move.b ($7,a6),d0
	move.w loc_0372f0(pc,d0.w),d1
	jsr loc_0372f0(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0372f0:
	dc.w loc_0372f8-loc_0372f0
	dc.w loc_03730c-loc_0372f0
	dc.w loc_037370-loc_0372f0
	dc.w loc_0373ce-loc_0372f0

;------------------------------------------------------------------------------
loc_0372f8:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$29,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03730c:
	tst.b ($33,a6)
	bpl.w loc_037508
	addq.b #2,(7,a6)
	moveq #$6b,d0
	jsr loc_02e3fe
	bne.w loc_037330
	addq.b #2,(7,a6)
	moveq #$2a,d0
	jmp loc_02a758

loc_037330:
	tst.b ($125,a6)
	beq.b loc_037350
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bhi.b loc_037358
	bra.b loc_03735e

loc_037350:
	btst.b #0,($371,a6)
	beq.b loc_03735e

loc_037358
	eori.b #1,($b,a6)

loc_03735e
	move.w #$b4,($ae,a6)
	clr.w ($3a,a6)
	moveq #0,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_037370:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_03738e
	clr.b ($35,a6)
	move.w #$80,d0
	jsr loc_02e970
	bne.b loc_0373ba
	addq.b #1,($3a,a6)

loc_03738e:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_037508
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_0373ba
	jsr loc_02ea7a
	beq.w loc_037508
	move.w #$81,d0
	jsr loc_080b70

loc_0373ba:
	addq.b #2,(7,a6)
	moveq #$6d,d0
	jsr loc_02e7f2
	moveq #$17,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_0373ce:
	tst.b ($33,a6)
	bpl.w loc_037508
	jmp loc_02baf2

;==============================================================================
;Air Roll throw
;==============================================================================
loc_0373dc:
	move.b (7,a6),d0
	move.w loc_0373ee(pc,d0.w),d1
	jsr loc_0373ee(pc,d1.w)
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0373ee:
	dc.w loc_0373fc-loc_0373ee
	dc.w loc_037434-loc_0373ee
	dc.w loc_037444-loc_0373ee
	dc.w loc_03746e-loc_0373ee
	dc.w loc_03747e-loc_0373ee
	dc.w loc_0374b2-loc_0373ee
	dc.w loc_0374d2-loc_0373ee

;------------------------------------------------------------------------------
loc_0373fc:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$6c,d0
	jsr loc_02e636
	beq.b loc_037428
	tst.b ($125,a6)
	beq.b loc_03741a
	jsr loc_01bd5c

loc_03741a:
	move.b #4,(7,a6)
	move.b #$c,($3a,a6)
	rts

loc_037428:
	addq.b #2,(7,a6)
	moveq #$2c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_037434:
	jsr loc_02aa08
	bcc.w loc_037508
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_037444:
	addq.b #2,(7,a6)
	move.b #$a,($3a,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.w ($40,a6)
	beq.b loc_037466
	bpl.b loc_037462
	moveq #1,d0

loc_037462:
	move.b d0,($b,a6)

loc_037466:
	moveq #2,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_03746e:
	subq.b #1,($3a,a6)
	bne.b loc_037478
	addq.b #2,(7,a6)

loc_037478:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_03747e:
	bsr.w loc_0374e2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_037478
	move.w d0,($14,a6)
	move.b #$18,($123,a5)
	addq.b #2,(7,a6)
	move.l #$60000,d0
	tst.b ($b,a6)
	beq.b loc_0374a8
	neg.l d0

loc_0374a8:
	move.l d0,($40,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0374b2:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.b loc_0374cc
	addq.b #2,(7,a6)
	moveq #$6c,d0
	jsr loc_02e7f2

loc_0374cc:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_0374d2:
	tst.b ($33,a6)
	bpl.b loc_0374cc
	eori.b #1,($b,a6)
	bra.w loc_0374fc

;==============================================================================
loc_0374e2:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================================================
loc_0374fc:
	jmp loc_02baf2

;==============================================================================
loc_037502:
	jmp loc_02bb26

;==============================================================================
loc_037508:
	jmp loc_02a7ea

;==============================================================================
loc_03750e:
	jsr loc_01c368
	beq.b loc_037532
	addq.b #1,(a4)
	move.b #1,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)

loc_037532:
	rts

;==============================================================================
loc_037534:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1b8,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_037570:
	dc.l $00000001,$00000001
	dc.l $00000003,$00000003
	dc.l $00000007,$00000007
	dc.l $0000000f,$0000000f
	dc.l $0000001f,$0000001f
	dc.l $0000003f,$0000003f
	dc.l $0000007f,$0000007f
	dc.l $000000ff,$000000ff
	dc.l $000001ff,$000001ff
	dc.l $000003ff,$000003ff
	dc.l $000007ff,$000007ff
	dc.l $00000fff,$00000fff
	dc.l $00001fff,$00001fff
	dc.l $00003fff,$00003fff
	dc.l $00007fff,$00007fff
	dc.l $0000ffff,$0000ffff

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0375f0:
	dc.w loc_037636-loc_0375f0
	dc.w loc_037636-loc_0375f0
	dc.w loc_0375f6-loc_0375f0

loc_0375f6:
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $09,$0b,$02,$02,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02

loc_037636:
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $07,$09,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$02,$02,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$07,$09,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
