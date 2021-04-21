
;##############################################
;Winposes
;##############################################
loc_061aa4:
	move.b ($2c4,a6),d0
	move.w loc_061ab0(pc,d0.w),d1
	jmp loc_061ab0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061ab0:
	dc.w loc_061abe-loc_061ab0
	dc.w loc_061ae0-loc_061ab0
	dc.w loc_061b40-loc_061ab0
	dc.w loc_061ba6-loc_061ab0
	dc.w loc_061c28-loc_061ab0
	dc.w loc_061b40-loc_061ab0
	dc.w loc_061b40-loc_061ab0

;==============================================
loc_061abe:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_061ad0(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061ad0:
	dc.b $02,$04,$06,$08
	dc.b $02,$04,$06,$08
	dc.b $02,$04,$06,$08
	dc.b $02,$04,$06,$08

;==============================================
loc_061ae0:
	move.b (7,a6),d0
	move.w loc_061aec(pc,d0.w),d1
	jmp loc_061aec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061aec:
	dc.w loc_061af2-loc_061aec
	dc.w loc_061b0a-loc_061aec
	dc.w loc_061b26-loc_061aec

;----------------------------------------------
loc_061af2:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_061b0a:
	tst.b ($124,a5)
	bne.w loc_064980
	tst.b ($11c,a5)
	bne.w loc_064980
	addq.b #2,(7,a6)
	moveq #$24,d0
	jmp loc_02a708

;----------------------------------------------
loc_061b26:
	tst.b ($3a,a6)
	beq.b loc_061b3a
	subq.b #1,($3a,a6)
	bne.b loc_061b3a
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061b3a:
	jmp loc_02a7ea

;==============================================
loc_061b40:
	move.b ($7,a6),d0
	move.w loc_061b4c(pc,d0.w),d1
	jmp loc_061b4c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061b4c:
	dc.w loc_061b52-loc_061b4c
	dc.w loc_061b6a-loc_061b4c
	dc.w loc_061b8c-loc_061b4c

;----------------------------------------------
loc_061b52:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_061b6a:
	tst.b ($124,a5)
	bne.w loc_064980
	tst.b ($11c,a5)
	bne.w loc_064980
	addq.b #2,(7,a6)
	moveq #0,d6
	bsr.w loc_064b06
	moveq #$25,d0
	jmp loc_02a708

;----------------------------------------------
loc_061b8c:
	tst.b ($3a,a6)
	beq.b loc_061ba0
	subq.b #1,($3a,a6)
	bne.b loc_061ba0
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061ba0:
	jmp loc_02a7ea

;==============================================
loc_061ba6:
	move.b (7,a6),d0
	move.w loc_061bb2(pc,d0.w),d1
	jmp loc_061bb2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061bb2:
	dc.w loc_061bb8-loc_061bb2
	dc.w loc_061bec-loc_061bb2
	dc.w loc_061c0e-loc_061bb2

;----------------------------------------------
loc_061bb8:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.w ($10,a6),d1
	sub.w ($10,a3),d1
	cmpi.w #$c0,d1
	bcc.b loc_061be0
	moveq #1,d0

loc_061be0:
	move.b d0,($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_061bec:
	tst.b ($124,a5)
	bne.w loc_064980
	tst.b ($11c,a5)
	bne.w loc_064980
	addq.b #2,(7,a6)
	moveq #1,d6
	bsr.w loc_064b06
	moveq #$26,d0
	jmp loc_02a708

;----------------------------------------------
loc_061c0e:
	tst.b ($3a,a6)
	beq.b loc_061c22
	subq.b #1,($3a,a6)
	bne.b loc_061c22
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061c22:
	jmp loc_02a7ea

;==============================================
loc_061c28:
	move.b (7,a6),d0
	move.w loc_061c34(pc,d0.w),d1
	jmp loc_061c34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061c34:
	dc.w loc_061c40-loc_061c34
	dc.w loc_061c74-loc_061c34
	dc.w loc_061c94-loc_061c34
	dc.w loc_061c9a-loc_061c34
	dc.w loc_061cbe-loc_061c34
	dc.w loc_061cf4-loc_061c34

;----------------------------------------------
loc_061c40:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #$3c,($3a,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.w ($10,a6),d1
	sub.w ($10,a3),d1
	cmpi.w #$c0,d1
	bcc.b loc_061c68
	moveq #1,d0

loc_061c68:
	move.b d0,($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_061c74:
	tst.b ($124,a5)
	bne.w loc_064980
	tst.b ($11c,a5)
	bne.w loc_064980
	addq.b #2,(7,a6)
	bsr.w loc_064bb6
	moveq #$27,d0
	jmp loc_02a708

;----------------------------------------------
loc_061c94:
	jmp loc_02a7ea

;----------------------------------------------
loc_061c9a:
	addq.b #2,(7,a6)
	move.b #1,($26f,a6)
	move.l #$30000,d0
	tst.b ($b,a6)
	beq.b loc_061cb2
	neg.l d0

loc_061cb2:
	move.l d0,($40,a6)
	moveq #$40,d0
	jmp loc_02a708

;----------------------------------------------
loc_061cbe:
	tst.b ($3a,a6)
	beq.b loc_061cd2
	subq.b #1,($3a,a6)
	bne.b loc_061cd2
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061cd2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_061cf2
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_061cf2:
	rts

;----------------------------------------------
loc_061cf4:
	tst.b ($3a,a6)
	beq.b loc_061d08
	subq.b #1,($3a,a6)
	bne.b loc_061d08
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061d08:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$100,d0
	cmpi.w #$380,d0
	bcs.w loc_064980
	clr.l ($40,a6)
	jmp loc_02a7ea

;??????????????????????????????????????????????????????????????????????????????
;Reluctant to train winpose (unused)
;??????????????????????????????????????????????????????????????????????????????
loc_061d34:
	move.b (7,a6),d0
	move.w loc_061d40(pc,d0.w),d1
	jmp loc_061d40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061d40:
	dc.w loc_061d4c-loc_061d40
	dc.w loc_061d80-loc_061d40
	dc.w loc_061d98-loc_061d40
	dc.w loc_061d9e-loc_061d40
	dc.w loc_061dc2-loc_061d40
	dc.w loc_061df8-loc_061d40

;----------------------------------------------
loc_061d4c:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #$3c,($3a,a6)
	jsr loc_01bd5c
	moveq #0,d0
	move.w ($10,a6),d1
	sub.w ($10,a3),d1
	cmpi.w #$c0,d1
	bcc.b loc_061d74
	moveq #1,d0

loc_061d74:
	move.b d0,($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_061d80:
	tst.b ($124,a5)
	bne.w loc_064980
	tst.b ($11c,a5)
	bne.w loc_064980
	addq.b #2,(7,a6)
	bra.w loc_064bb6

;----------------------------------------------
loc_061d98:
	jmp loc_02a7ea

;----------------------------------------------
loc_061d9e:
	addq.b #2,(7,a6)
	move.b #1,($26f,a6)
	move.l #$30000,d0
	tst.b ($b,a6)
	beq.b loc_061db6
	neg.l d0

loc_061db6:
	move.l d0,($40,a6)
	moveq #$28,d0
	jmp loc_02a708

;----------------------------------------------
loc_061dc2:
	tst.b ($3a,a6)
	beq.b loc_061dd6
	subq.b #1,($3a,a6)
	bne.b loc_061dd6
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061dd6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_061df6
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_061df6:
	rts

;----------------------------------------------
loc_061df8:
	tst.b ($3a,a6)
	beq.b loc_061e0c
	subq.b #1,($3a,a6)
	bne.b loc_061e0c
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_061e0c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$100,d0
	cmpi.w #$380,d0
	bcs.w loc_064980
	clr.l ($40,a6)
	jmp loc_02a7ea

;##############################################
;Intro
;##############################################
loc_061e38:
	move.b (7,a6),d0
	move.w loc_061e44(pc,d0.w),d1
	jmp loc_061e44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061e44:
	dc.w loc_061e4c-loc_061e44
	dc.w loc_061e84-loc_061e44
	dc.w loc_061e90-loc_061e44
	dc.w loc_061ef2-loc_061e44

;----------------------------------------------
loc_061e4c:
	addq.b #2,(7,a6)
	bsr.w loc_064a5e
	move.b #$12,($3a,a6)
	jsr loc_01bd5c
	move.w #$1e0,d1
	tst.b ($101,a6)
	bne.b loc_061e6e
	move.w #$ffa0,d1

loc_061e6e:
	move.w ($10,a3),($10,a6)
	add.w d1,($10,a6)
	addi.w #$26,($14,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_061e84:
	subq.b #1,($3a,a6)
	bne.b loc_061e8e
	addq.b #2,(7,a6)

loc_061e8e:
	rts

;----------------------------------------------
loc_061e90:
	tst.b ($35,a6)
	beq.b loc_061ea4
	clr.b ($35,a6)
	movea.w ($36,a6),a4
	move.b #4,(9,a4)

loc_061ea4:
	tst.b ($33,a6)
	bpl.w loc_064980
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	addi.w #$30,($14,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.l #$8000,d0
	moveq #$16,d1
	tst.b ($b,a6)
	bne.b loc_061ee2
	neg.l d0
	neg.w d1

loc_061ee2:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	moveq #$13,d0
	jmp loc_02a708

;----------------------------------------------
loc_061ef2:
	jsr loc_02aa08
	bcc.w loc_064980
	move.l #$02000000,(4,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_061f20:
	tst.b ($80,a6)
	bne.w loc_062134
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_062006
	move.b (7,a6),d0
	move.w loc_061f40(pc,d0.w),d1
	jmp loc_061f40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061f40:
	dc.w loc_061f46-loc_061f40
	dc.w loc_061fc0-loc_061f40
	dc.w loc_061fc6-loc_061f40

;----------------------------------------------
loc_061f46:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	cmpi.b #4,($82,a6)
	bne.b loc_061f84
	move.b #4,(7,a6)
	moveq #$c,d1
	tst.b ($b,a6)
	bne.b loc_061f80
	neg.w d1

loc_061f80:
	add.w d1,($10,a6)

loc_061f84:
	moveq #0,d1
	moveq #0,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b ($125,a6)
	bne.b loc_061fa6
	cmpi.b #1,($132,a6)
	bne.b loc_061fa6
	btst #0,($83,a6)
	bne.b loc_061fb4
	bra.b loc_061fb2

loc_061fa6:
	move.w loc_061fba(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_061fb4

loc_061fb2:
	addq.b #1,d0

loc_061fb4:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061fba:
	dc.w $0020,$0020,$0020

;----------------------------------------------
loc_061fc0:
	jmp loc_02f5ac

;----------------------------------------------
loc_061fc6:
	tst.b ($33,a6)
	bmi.w loc_064974
	jsr loc_02a7ea
	move.b ($34,a6),d0
	andi.w #7,d0
	beq.b loc_061ff4
	clr.b ($34,a6)
	add.b d0,d0
	move.w loc_061ff6(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_061ff0
	neg.w d1

loc_061ff0:
	add.w d1,($10,a6)

loc_061ff4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_061ff6:
	dc.w $0000,$000a,$0008,$0018
	dc.w $0000,$0002,$000a,$0004

;==============================================
;Kicks
;==============================================
loc_062006:
	move.b (7,a6),d0
	move.w loc_062012(pc,d0.w),d1
	jmp loc_062012(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062012:
	dc.w loc_06201c-loc_062012
	dc.w loc_0620c4-loc_062012
	dc.w loc_0620ca-loc_062012
	dc.w loc_0620f2-loc_062012
	dc.w loc_06210c-loc_062012

;----------------------------------------------
loc_06201c:
	move.b ($82,a6),(7,a6)
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	moveq #6,d0
	move.b ($82,a6),d1
	add.b d1,d0
	cmpi.b #2,($82,a6)
	bne.b loc_062092
	move.l #0,($40,a6)
	move.b ($83,a6),d2
	andi.b #3,d2
	beq.b loc_062092
	move.l #$20000,($40,a6)
	btst #1,d2
	bne.b loc_06208e
	move.l #0,($40,a6)
	cmpi.b #$ff,($132,a6)
	bne.b loc_062092
	move.l #$ffff0000,($40,a6)

loc_06208e:
	moveq #$22,d0
	bra.b loc_0620b8

loc_062092:
	tst.b ($125,a6)
	bne.b loc_0620aa
	cmpi.b #1,($132,a6)
	bne.b loc_0620aa
	btst #0,($83,a6)
	bne.b loc_0620b8
	bra.b loc_0620b6

loc_0620aa:
	move.w loc_0620be(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_0620b8

loc_0620b6:
	addq.b #1,d0

loc_0620b8:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0620be:
	dc.w $0020,$0020,$0020

;----------------------------------------------
loc_0620c4:
	jmp loc_02f5ac

;----------------------------------------------
loc_0620ca:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($34,a6)
	bne.w loc_0620f0
	move.l ($40,a6),d1
	tst.b ($b,a6)
	bne.b loc_0620ec
	neg.l d1

loc_0620ec:
	add.l d1,($10,a6)

loc_0620f0:
	rts

;----------------------------------------------
loc_0620f2:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($5b,a6)
	beq.w loc_064980
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06210c:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($34,a6)
	bne.w loc_064980
	move.l #$30000,d1
	tst.b ($b,a6)
	beq.b loc_06212a
	neg.l d1

loc_06212a:
	add.l d1,($10,a6)
	jmp loc_02a7ea

;==============================================
;Crouching
;==============================================
loc_062134:
	move.b #1,($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_06230c
	move.b (7,a6),d0
	move.w loc_06214e(pc,d0.w),d1
	jmp loc_06214e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06214e:
	dc.w loc_06215c-loc_06214e
	dc.w loc_06220a-loc_06214e
	dc.w loc_062210-loc_06214e
	dc.w loc_06225c-loc_06214e
	dc.w loc_06226a-loc_06214e
	dc.w loc_0622dc-loc_06214e
	dc.w loc_0622ea-loc_06214e

;----------------------------------------------
loc_06215c:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	tst.b ($82,a6)
	beq.b loc_0621f2
	cmpi.b #2,($82,a6)
	bne.b loc_0621ba
	move.b #4,(7,a6)
	move.l #$40000,d0
	cmpi.b #$ff,($132,a6)
	bne.b loc_06219a
	move.l #$50000,d0

loc_06219a:
	move.l d0,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.l #$40000,d0
	tst.b ($b,a6)
	bne.b loc_0621b4
	neg.l d0

loc_0621b4:
	move.l d0,($40,a6)
	bra.b loc_0621f2

loc_0621ba:
	move.b #8,(7,a6)
	clr.b ($5b,a6)
	move.l #$30000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.l #$60000,d0
	move.l #$ffffa000,d2
	tst.b ($b,a6)
	bne.b loc_0621ea
	neg.l d0
	neg.l d2

loc_0621ea:
	move.l d0,($40,a6)
	move.l d2,($48,a6)

loc_0621f2:
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_06220a:
	jmp loc_02f5ac

;----------------------------------------------
loc_062210:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #1,($31,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$1e,d0
	jmp loc_02a710

;----------------------------------------------
loc_06225c:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;----------------------------------------------
loc_06226a:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #1,($31,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	tst.b ($5b,a6)
	bne.b loc_0622c0
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bcc.w loc_0622be
	move.b #$c,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)

loc_0622be:
	rts

loc_0622c0:
	move.b #$a,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$1f,d0
	jmp loc_02a710

;----------------------------------------------
loc_0622dc:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;----------------------------------------------
loc_0622ea:
	tst.b ($35,a6)
	bne.b loc_0622f8
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_0622f8:
	tst.b ($5b,a6)
	bne.b loc_0622c0
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;==============================================
;Crouching Kicks
;==============================================
loc_06230c:
	move.b (7,a6),d0
	move.w loc_062318(pc,d0.w),d1
	jmp loc_062318(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062318:
	dc.w loc_062320-loc_062318
	dc.w loc_062378-loc_062318
	dc.w loc_06237e-loc_062318
	dc.w loc_0623a8-loc_062318

;----------------------------------------------
loc_062320:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	cmpi.b #4,($82,a6)
	bne.b loc_062360
	move.b #4,(7,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff8000,($48,a6)

loc_062360:
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	moveq #$f,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_062378:
	jmp loc_02f5ac

;----------------------------------------------
loc_06237e:
	tst.b ($35,a6)
	bne.w loc_064980
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062392
	neg.l d0

loc_062392:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.w loc_064980
	addq.b #2,(7,a6)
	rts

;----------------------------------------------
loc_0623a8:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;##############################################
;Air Normals
;##############################################
loc_0623b6:
	move.b #6,(7,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($3c,a6)
	beq.b loc_062410
	tst.b ($81,a6)
	bne.b loc_0623fa
	cmpi.b #4,($82,a6)
	bne.b loc_062410
	btst #2,($83,a6)
	beq.b loc_062410
	moveq #$20,d0
	jmp loc_02a710

loc_0623fa:
	tst.b ($82,a6)
	bne.b loc_062410
	btst #2,($83,a6)
	beq.b loc_062410
	moveq #$21,d0
	jmp loc_02a710

loc_062410:
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_06241a
	moveq #$18,d0

loc_06241a:
	tst.b ($81,a6)
	beq.b loc_062422
	addq.w #3,d0

loc_062422:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################
;Special Inputs
;##############################################
loc_062432:
	jsr loc_02e096
	bne.w loc_0624c6

loc_06243c:
	lea ($1b8,a6),a4
	jsr loc_02d722
	bne.w loc_0626fc

loc_06244a:
	lea ($1a8,a6),a4
	jsr loc_02d70a
	bne.w loc_0626a4

loc_062458:
	lea ($190,a6),a4
	jsr loc_02d712
	bne.w loc_06272c

loc_062466:
	lea ($1b0,a6),a4
	jsr loc_02d692
	bne.w loc_0626cc

loc_062474:
	lea ($180,a6),a4
	jsr loc_02d69a
	bne.w loc_062612

loc_062482:
	lea ($188,a6),a4
	jsr loc_02d60a
	bne.w loc_06252a

loc_062490:
	lea ($1a0,a6),a4
	jsr loc_02d612
	bne.w loc_06267c

loc_06249e:
	lea ($198,a6),a4
	jsr loc_02d67a
	bne.w loc_062644

loc_0624ac:
	lea ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_062580

loc_0624ba:
	jsr loc_02e0cc
	bne.w loc_062552

loc_0624c4:
	rts

;----------------------------------------------
;Move ID Writes
loc_0624c6:
	tst.b ($28a,a6)
	bne.w loc_06243c
	tst.b ($31,a6)
	bne.w loc_062504
	jsr loc_02ef54
	beq.w loc_06243c
	jsr loc_02ecd8
	beq.w loc_06243c
	move.l #$02001000,(4,a6)
	move.b #0,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_062504:
	tst.b ($b9,a6)
	bne.w loc_06243c
	jsr loc_02ed28
	beq.w loc_06243c
	move.l #$02001000,(4,a6)
	move.b #0,($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_06252a:
	jsr loc_02ed00
	beq.w loc_062490
	move.l #$02000e00,(4,a6)
	move.b #2,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;----------------------------------------------
loc_062552:
	tst.b ($b9,a6)
	bne.b loc_062560
	tst.b ($bc,a6)
	beq.w loc_0624c4

loc_062560:
	jsr loc_02ed00
	beq.w loc_0624c4
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_062580:
	jsr loc_02edf8
	beq.w loc_0624ba

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_06258a:
	tst.b ($132,a6)
	bne.w loc_0625d2
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$1c,($5f,a4)
	move.b #$20,($25d,a6)
	move.b #0,($81,a6)
	moveq #$1e,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_0625d2:
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$18,($5f,a4)
	move.b #$1c,($25d,a6)
	move.b #$2,($81,a6)
	moveq #$1e,d0
	jmp loc_02a758

;----------------------------------------------
loc_062612:
	cmpi.b #1,($132,a6)
	beq.w loc_062482
	jsr loc_02ecd8
	beq.w loc_062482
	move.l #$2001000,(4,a6)
	move.b #8,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_062644:
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$20,d0
	bcs.w loc_0624ac
	jsr loc_02ed28
	beq.w loc_0624ac
	move.l #$02000e00,(4,a6)
	move.b #$14,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06267c:
	jsr loc_02ed00
	beq.w loc_06249e
	move.l #$02000e00,(4,a6)
	move.b #$18,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_0626a4:
	jsr loc_02ed00
	beq.w loc_062458
	move.l #$02000e00,(4,a6)
	move.b #$1a,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0626cc:
	tst.b ($132,a6)
	bne.w loc_062474
	jsr loc_02ecd8
	beq.w loc_062474
	move.l #$02001000,(4,a6)
	move.b #$1c,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_0626fc:
	tst.b ($132,a6)
	bne.w loc_06244a
	jsr loc_02ecd8
	beq.w loc_06244a
	move.l #$02001000,(4,a6)
	move.b #$1e,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_06272c:
	jsr loc_02ed00
	beq.w loc_062466
	move.l #$02000e00,(4,a6)
	move.b #$20,($aa,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;##############################################
;Ai Move Checks
;##############################################
loc_062754:
	move.b ($aa,a6),d0
	move.w loc_062760(pc,d0.w),d1
	jmp loc_062760(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062760:
	dc.w loc_0627a2-loc_062760;00 Vism Activate
	dc.w loc_0627a2-loc_062760;02 Flying Peach
	dc.w loc_0627a2-loc_062760;04 Taunt
	dc.w loc_0627a2-loc_062760;06 Alpha Counter
	dc.w loc_062782-loc_062760;08 Sardine Beach Special
	dc.w loc_0627a2-loc_062760;0a Ocean Drop Kick ;sbs
	dc.w loc_0627a2-loc_062760;0c Mika Sliding ;sbs
	dc.w loc_0627a2-loc_062760;0e Mika Lariat ;sbs

	dc.w loc_0627a2-loc_062760;10 Moonsault Press ;sbs
	dc.w loc_0627a2-loc_062760;12 Tobikoshi ;sbs
	dc.w loc_0627a2-loc_062760;14 Wingless Airplane
	dc.w loc_0627a2-loc_062760;16 ???
	dc.w loc_0627a2-loc_062760;18 Shooting Peach
	dc.w loc_0627a2-loc_062760;1a Paradise Hold
	dc.w loc_062790-loc_062760;1c Rainbow Hip Rush
	dc.w loc_062790-loc_062760;1e Heavenly Dynamite

	dc.w loc_0627a2-loc_062760;20 Daydream Headlock

;----------------------------------------------
loc_062782:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0627a6
	bra.w loc_0627a2

;----------------------------------------------
loc_062790:
	tst.b ($132,a6)
	bne.w loc_0627a6
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0627a6

;==============================================
loc_0627a2:
	moveq #1,d0
	rts

;==============================================
loc_0627a6:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_0627aa:
	move.b ($aa,a6),d0
	move.w loc_0627b6(pc,d0.w),d1
	jmp loc_0627b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0627b6:
	dc.w loc_0627d8-loc_0627b6;00 Vism Activate
	dc.w loc_06285a-loc_0627b6;02 Flying Peach
	dc.w loc_0629bc-loc_0627b6;04 Taunt
	dc.w loc_0629fe-loc_0627b6;06 Alpha Counter
	dc.w loc_062aa4-loc_0627b6;08 Sardine Beach Special
	dc.w loc_062d3c-loc_0627b6;0a Ocean Drop Kick ;sbs
	dc.w loc_062db6-loc_0627b6;0c Mika Sliding ;sbs
	dc.w loc_062e2a-loc_0627b6;0e Mika Lariat ;sbs

	dc.w loc_062eb2-loc_0627b6;10 Moonsault Press ;sbs
	dc.w loc_0632c6-loc_0627b6;12 Tobikoshi ;sbs
	dc.w loc_063766-loc_0627b6;14 Wingless Airplane
	dc.w loc_06385c-loc_0627b6;16 ???
	dc.w loc_063a86-loc_0627b6;18 Shooting Peach
	dc.w loc_063b86-loc_0627b6;1a Paradise Hold
	dc.w loc_063dc6-loc_0627b6;1c Rainbow Hip Rush
	dc.w loc_063f5e-loc_0627b6;1e Heavenly Dynamite

	dc.w loc_064298-loc_0627b6;20 Daydream Headlock

;==============================================
;V-ism Activate
;==============================================
loc_0627d8:
	move.b (7,a6),d0
	move.w loc_0627e4(pc,d0.w),d1
	jmp loc_0627e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0627e4:
	dc.w loc_0627ea-loc_0627e4
	dc.w loc_06280a-loc_0627e4
	dc.w loc_06283e-loc_0627e4

;----------------------------------------------
loc_0627ea:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_062804
	moveq #$2f,d0

loc_062804:
	jmp loc_02a708

;----------------------------------------------
loc_06280a:
	tst.b ($34,a6)
	beq.b loc_062838
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b ($31,a6)
	beq.b loc_06282e
	moveq #-3,d0
	moveq #$41,d1

loc_06282e:
	jsr loc_097cd6
	bsr.w loc_064dca

loc_062838:
	jmp loc_02a7ea

;----------------------------------------------
loc_06283e:
	subq.b #1,($3a,a6)
	bne.w loc_064980
	tst.b ($31,a6)
	beq.b loc_062854
	move.l #$02000602,(4,a6)

loc_062854:
	jmp loc_02f796

;==============================================
;Flying Peach
;==============================================
loc_06285a:
	move.b (7,a6),d0
	move.w loc_062866(pc,d0.w),d1
	jmp loc_062866(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062866:
	dc.w loc_06286e-loc_062866
	dc.w loc_0628f4-loc_062866
	dc.w loc_062962-loc_062866
	dc.w loc_0629a8-loc_062866

;----------------------------------------------
loc_06286e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($a9,a6)
	tst.b ($b9,a6)
	beq.b loc_06288a
	move.b #1,($2d9,a6)

loc_06288a:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,($4c,a6)
	clr.l ($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0628dc(pc,d0.w),d1
	move.l loc_0628dc+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_0628c6
	neg.l d1

loc_0628c6:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$d,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0628dc:
	dc.l $00010000,$00030000
	dc.l $00018000,$00038000
	dc.l $00020000,$00040000

;----------------------------------------------
loc_0628f4:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #1,($31,a6)
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06294a(pc,d0.w),d1
	move.l loc_06294a+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_062934
	neg.l d1

loc_062934:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$10,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06294a:
	dc.l $00030000,$00040000
	dc.l $00040000,$00050000
	dc.l $00050000,$00060000

;----------------------------------------------
loc_062962:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #1,($31,a6)
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	jsr loc_00369c
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$13,d0
	jmp loc_02a758

;----------------------------------------------
loc_0629a8:
	tst.b ($33,a6)
	bmi.w loc_06497a
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Taunt
;==============================================
loc_0629bc:
	move.b (7,a6),d0
	move.w loc_0629c8(pc,d0.w),d1
	jmp loc_0629c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0629c8:
	dc.w loc_0629cc-loc_0629c8
	dc.w loc_0629f0-loc_0629c8

;----------------------------------------------
loc_0629cc:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_0629e0
	subq.b #1,($bc,a6)

loc_0629e0:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	moveq #$1f,d0
	jmp loc_02a758

;----------------------------------------------
loc_0629f0:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;==============================================
;Alpha Counter
;==============================================
loc_0629fe:
	move.b (7,a6),d0
	move.w loc_062a0a(pc,d0.w),d1
	jmp loc_062a0a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062a0a:
	dc.w loc_062a12-loc_062a0a
	dc.w loc_062a5e-loc_062a0a
	dc.w loc_062a6c-loc_062a0a
	dc.w loc_062a96-loc_062a0a

;----------------------------------------------
loc_062a12:
	tst.b ($33,a6)
	bpl.b loc_062a48
	addq.b #2,(7,a6)
	moveq #$49,d0
	move.b #2,d1
	tst.b ($81,a6)
	beq.b loc_062a3e
	moveq #$4a,d0
	move.b #4,d1
	move.l #$90000,($40,a6)
	move.l #$ffff8000,($48,a6)

loc_062a3e:
	move.b d1,(7,a6)
	jmp loc_02a758

loc_062a48:
	tst.b ($35,a6)
	beq.b loc_062a58
	clr.b ($35,a6)
	jsr loc_080e8e

loc_062a58:
	jmp loc_02a7ea

;----------------------------------------------
loc_062a5e:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_062a6c:
	tst.b ($35,a6)
	bne.w loc_064980
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062a80
	neg.l d0

loc_062a80:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.w loc_064980
	addq.b #2,(7,a6)
	rts

;----------------------------------------------
loc_062a96:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;==============================================
;Sardine Beach Special
;==============================================
loc_062aa4:
	move.b (7,a6),d0
	move.w loc_062ab0(pc,d0.w),d1
	jmp loc_062ab0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062ab0:
	dc.w loc_062ac2-loc_062ab0
	dc.w loc_062b08-loc_062ab0
	dc.w loc_062b30-loc_062ab0
	dc.w loc_062b62-loc_062ab0
	dc.w loc_062cd6-loc_062ab0
	dc.w loc_062cf2-loc_062ab0
	dc.w loc_062d22-loc_062ab0
	dc.w loc_062d22-loc_062ab0

	dc.w loc_062d22-loc_062ab0

;----------------------------------------------
loc_062ac2:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.l #$60000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.b #1,($de,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062b02(pc,d0.w),($3a,a6)
	moveq #$20,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062b02:
	dc.w $005a,$00b4,$012c

;----------------------------------------------
loc_062b08:
	tst.b ($35,a6)
	beq.b loc_062b2a
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_062b1c
	moveq #1,d0

loc_062b1c:
	move.b d0,($ab,a6)
	moveq #-$1a,d0
	moveq #$48,d1
	jsr loc_082e36

loc_062b2a:
	jmp loc_02a7ea

;----------------------------------------------
loc_062b30:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_062b5c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_062b56
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_062b56:
	move.b loc_062b5e(pc,d0.w),($25d,a6)

loc_062b5c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062b5e:
	dc.b $08,$0c,$10,00

;----------------------------------------------
loc_062b62:
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	bne.w loc_062be4
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bmi.w loc_062be4
	tst.w ($3a,a6)
	beq.b loc_062be4
	subq.w #1,($3a,a6)
	beq.b loc_062be4
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.w loc_062bcc
	bsr.w loc_062c58
	bne.w loc_062bf2
	bsr.w loc_062cc2
	bne.w loc_062c0e
	tst.b ($298,a6)
	bne.w loc_062c0e
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062bb6
	neg.l d0

loc_062bb6:
	add.l d0,($10,a6)
	tst.b ($125,a6)
	bne.w loc_064980
	btst #0,($371,a6)
	beq.w loc_064980

loc_062bcc:
	move.b #8,(7,a6)
	subq.w #8,($3a,a6)
	bpl.b loc_062bdc
	clr.w ($3a,a6)

loc_062bdc:
	moveq #4,d0
	jmp loc_02a758

loc_062be4:
	move.b #$a,(7,a6)
	moveq #3,d0
	jmp loc_02a758

loc_062bf2:
	clr.b (7,a6)
	move.b d2,($aa,a6)
	move.b #1,($a9,a6)
	subi.w #$1e,($3a,a6)
	bpl.b loc_062c0c
	clr.w ($3a,a6)

loc_062c0c:
	rts

loc_062c0e:
	move.b #$12,($aa,a6)
	clr.b (7,a6)
	subi.w #$1e,($3a,a6)
	bpl.b loc_062c24
	clr.w ($3a,a6)

loc_062c24:
	move.b #1,($31,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.l #$10000,d0
	tst.b ($b,a6)
	bne.b loc_062c4c
	neg.l d0

loc_062c4c:
	move.l d0,($40,a6)
	moveq #5,d0
	jmp loc_02a758

loc_062c58:
	tst.b ($125,a6)
	bne.b loc_062c88
	move.b ($378,a6),d1
	andi.w #7,d1
	beq.b loc_062c84
	moveq #$a,d2
	btst #0,d1
	bne.b loc_062c80
	moveq #$c,d2
	btst #1,d1
	bne.b loc_062c80
	move.b #1,($de,a6)
	moveq #$e,d2

loc_062c80:
	moveq #1,d1
	rts

loc_062c84:
	moveq #0,d1
	rts

loc_062c88:
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_062c84
	cmpi.w #$70,($21c,a6)
	bcc.b loc_062c84
	tst.b ($2c8,a4)
	beq.b loc_062cac
	cmpi.w #$50,($21c,a6)
	bcc.b loc_062c84
	moveq #$c,d2
	bra.b loc_062c80

loc_062cac:
	moveq #$a,d2
	move.w ($21c,a6),d0
	andi.w #1,d0
	beq.b loc_062c80
	move.b #1,($de,a6)
	moveq #$e,d2
	bra.b loc_062c80

loc_062cc2:
	tst.b ($125,a6)
	bne.b loc_062c84
	move.b ($378,a6),d1
	andi.w #$70,d1
	beq.b loc_062c84
	moveq #1,d1
	rts

;----------------------------------------------
loc_062cd6:
	tst.b ($33,a6)
	bpl.w loc_064980
	move.b #6,(7,a6)
	eori.b #1,($b,a6)
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_062cf2:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062cfe
	neg.l d0

loc_062cfe:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_062d14
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_062d14:
	tst.b ($33,a6)
	bmi.w loc_064974
	jmp loc_02a7ea

;----------------------------------------------
loc_062d22:
	tst.b ($33,a6)
	bpl.w loc_064980
	move.b #6,(7,a6)
	clr.b ($de,a6)
	moveq #2,d0
	jmp loc_02a758

;==============================================
;Ocean Drop Kick
;==============================================
loc_062d3c:
	move.b (7,a6),d0
	move.w loc_062d48(pc,d0.w),d1
	jmp loc_062d48(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062d48:
	dc.w loc_062d4c-loc_062d48
	dc.w loc_062d7c-loc_062d48

;----------------------------------------------
loc_062d4c:
	addq.b #2,(7,a6)
	move.l #$30000,($40,a6)
	clr.b ($5b,a6)
	clr.w ($36,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062d76(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$21,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062d76:
	dc.w $0014,$001a,$0020

;----------------------------------------------
loc_062d7c:
	jsr loc_02a7ea
	tst.b ($5b,a6)
	beq.b loc_062d94
	clr.b ($5b,a6)
	clr.b ($cc,a6)
	bsr.w loc_0649e4

loc_062d94:
	tst.b ($33,a6)
	bmi.w loc_064482
	tst.b ($35,a6)
	bne.w loc_062db4
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062db0
	neg.l d0

loc_062db0:
	add.l d0,($10,a6)

loc_062db4:
	rts

;==============================================
;Mika Sliding
;==============================================
loc_062db6:
	move.b (7,a6),d0
	move.w loc_062dc2(pc,d0.w),d1
	jmp loc_062dc2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062dc2:
	dc.w loc_062dc6-loc_062dc2
	dc.w loc_062df6-loc_062dc2

;----------------------------------------------
loc_062dc6:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	clr.b ($5b,a6)
	clr.w ($36,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062df0(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$22,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062df0:
	dc.w $0014,$001a,$0020

;----------------------------------------------
loc_062df6:
	jsr loc_02a7ea
	tst.b ($5b,a6)
	beq.b loc_062e0a
	clr.b ($5b,a6)
	bsr.w loc_0649e4

loc_062e0a:
	tst.b ($33,a6)
	bmi.w loc_064482
	tst.b ($35,a6)
	bne.b loc_062e28
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062e24
	neg.l d0

loc_062e24:
	add.l d0,($10,a6)

loc_062e28:
	rts

;==============================================
;Mika Lariat
;==============================================
loc_062e2a:
	move.b (7,a6),d0
	move.w loc_062e36(pc,d0.w),d1
	jmp loc_062e36(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062e36:
	dc.w loc_062e3a-loc_062e36
	dc.w loc_062e72-loc_062e36

;----------------------------------------------
loc_062e3a:
	addq.b #2,(7,a6)
	move.l #$60000,($40,a6)
	move.l #$ffffe000,($48,a6)
	clr.b ($5b,a6)
	clr.w ($36,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062e6c(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$23,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062e6c:
	dc.w $0014,$001c,$0024

;----------------------------------------------
loc_062e72:
	jsr loc_02a7ea
	tst.b ($5b,a6)
	beq.b loc_062e86
	clr.b ($5b,a6)
	bsr.w loc_0649e4

loc_062e86:
	tst.b ($33,a6)
	bmi.w loc_064482
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_062e9a
	neg.l d0

loc_062e9a:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_062eb0
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_062eb0:
	rts

;==============================================
;Moonsault Press
;==============================================
loc_062eb2:
	move.b (7,a6),d0
	move.w loc_062ebe(pc,d0.w),d1
	jmp loc_062ebe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062ebe:
	dc.w loc_062ed6-loc_062ebe
	dc.w loc_062f24-loc_062ebe
	dc.w loc_063038-loc_062ebe
	dc.w loc_0630d6-loc_062ebe
	dc.w loc_0630f2-loc_062ebe
	dc.w loc_063156-loc_062ebe
	dc.w loc_063164-loc_062ebe
	dc.w loc_0631a8-loc_062ebe

	dc.w loc_0631fc-loc_062ebe
	dc.w loc_063256-loc_062ebe
	dc.w loc_06326e-loc_062ebe
	dc.w loc_06329a-loc_062ebe

;----------------------------------------------
loc_062ed6:
	jsr loc_02aa08
	addi.l #$2f000,($14,a6)
	bsr.w loc_0632a8
	subq.w #1,($3a,a6)
	bne.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($5b,a6)
	movea.w ($36,a6),a4
	moveq #$2e,d0
	tst.b ($b,a6)
	beq.b loc_062f06
	neg.w d0

loc_062f06:
	move.w ($10,a4),($10,a6)
	add.w d0,($10,a6)
	move.w ($14,a4),($14,a6)
	addi.w #$5e,($14,a6)
	moveq #$29,d0
	jmp loc_02a758

;----------------------------------------------
loc_062f24:
	movea.w ($36,a6),a4
	tst.b ($34,a6)
	beq.w loc_062ff4
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #$14,($3a,a4)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.b #$ff,($dd,a6)
	clr.b ($5b,a6)
	tst.b ($125,a6)
	bne.b loc_062f74
	move.b ($371,a6),d0
	andi.w #3,d0
	bne.b loc_062f74
	tst.b ($81,a6)
	bne.b loc_062fa8

loc_062f74:
	moveq #0,d0
	moveq #0,d1
	movea.w ($38,a6),a3
	move.w ($10,a3),d0
	move.w ($10,a6),d1
	sub.w d1,d0
	swap d0
	asr.l #5,d0
	move.l d0,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062fa2(pc,d0.w),d1
	move.b d1,($cc,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062fa2:
	dc.w $000c,$001c,$002c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_062fa8:
	move.b #$c,(7,a6)
	clr.b ($dd,a6)
	moveq #0,d0
	moveq #0,d1
	movea.w ($38,a6),a3
	move.w ($10,a3),d0
	move.w ($10,a6),d1
	moveq #$50,d2
	tst.b ($b,a6)
	bne.b loc_062fcc
	neg.w d2

loc_062fcc:
	sub.w d2,d1
	sub.w d1,d0
	swap d0
	asr.l #5,d0
	move.l d0,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_062fee(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$24,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_062fee:
	dc.w $0008,$0018,$0028

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_062ff4:
	bsr.w loc_0632a8
	jsr loc_02a7ea
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #0,d0
	move.b ($35,a6),d0
	lsl.w #2,d0
	move.w loc_06302c(pc,d0.w),d1
	move.w loc_06302c+2(pc,d0.w),d2
	tst.b ($b,a6)
	bne.b loc_063022
	neg.w d1

loc_063022:
	add.w d1,($10,a6)
	add.w d2,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06302c:
	dc.w $ffd2,$005e
	dc.w $ffd2,$005e
	dc.w $ffb1,$0080

;----------------------------------------------
loc_063038:
	jsr loc_02aa08
	bcc.w loc_063080
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	tst.b ($5b,a6)
	bne.w loc_06497a
	move.b #$14,(7,a6)
	move.l #$40000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	clr.b ($de,a6)
	move.b #1,($31,a6)
	moveq #$47,d0
	jmp loc_02a758

loc_063080:
	tst.b ($5b,a6)
	bne.w loc_064980
	tst.b ($125,a6)
	bne.w loc_06309c
	move.b ($371,a6),d0
	andi.w #3,d0
	beq.w loc_064980

loc_06309c:
	movea.w ($38,a6),a4
	tst.b ($279,a4)
	bne.w loc_064980
	moveq #$2c,d0
	jsr loc_02e6ec
	beq.w loc_064980
	move.b #6,d1
	moveq #$b,d0
	tst.b ($81,a6)
	bne.b loc_0630c6
	move.b #$e,d1
	moveq #$c,d0

loc_0630c6:
	move.b d1,(7,a6)
	jsr loc_02a758
	jmp loc_02fa36

;----------------------------------------------
loc_0630d6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_064992
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jmp loc_02fa36

;----------------------------------------------
loc_0630f2:
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_06311a
	clr.b ($34,a6)
	moveq #$20,d0
	tst.b ($b,a6)
	bne.b loc_063116
	neg.w d0

loc_063116:
	add.w d0,($10,a6)

loc_06311a:
	jsr loc_02f9be
	tst.b ($35,a6)
	beq.b loc_06314e
	addq.b #2,(7,a6)
	moveq #$37,d0
	jsr loc_080b70
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_063150(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$2c,d0
	jsr loc_02e7f2
	move.b #$28,($123,a5)

loc_06314e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063150:
	dc.w $0018,$0028,$0038

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063156:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_063164:
	subi.l #$2f000,($14,a6)
	jsr loc_02aa08
	bcc.b loc_06318e
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	jmp loc_02baf2

loc_06318e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_0631a6
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_0631a6:
	rts

;----------------------------------------------
loc_0631a8:
	tst.b ($35,a6)
	bne.w loc_0631bc
	jsr loc_02a7ea
	jmp loc_02fa36

loc_0631bc:
	addq.b #2,(7,a6)
	move.b #2,($3a,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	move.b #$1e,($123,a5)
	moveq #$37,d0
	jsr loc_080b70
	move.l #$40000,d0
	tst.b ($b,a6)
	bne.b loc_0631ec
	neg.l d0

loc_0631ec:
	move.l d0,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0631fc:
	tst.b ($35,a6)
	beq.w loc_06323c
	clr.b ($35,a6)
	subq.b #1,($3a,a6)
	bne.b loc_06323c
	addq.b #2,(7,a6)
	move.b #$10,($3a,a6)
	move.b #$2d,($123,a5)
	moveq #$37,d0
	jsr loc_080b70
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_063250(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$2d,d0
	jsr loc_02e7f2

loc_06323c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063250:
	dc.w $0014,$0024,$0034

;----------------------------------------------
loc_063256:
	subq.b #1,($3a,a6)
	bne.w loc_06326c
	move.b #$a,(7,a6)
	moveq #$1d,d0
	jmp loc_02a758

loc_06326c:
	rts

;----------------------------------------------
loc_06326e:
	tst.b ($35,a6)
	bne.w loc_064980
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$48,d0
	jmp loc_02a758

;----------------------------------------------
loc_06329a:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;==============================================
loc_0632a8:
	tst.b ($125,a6)
	bne.w loc_0632c4
	move.b ($378,a6),d0
	beq.b loc_0632c4
	moveq #0,d1
	andi.w #$70,d0
	beq.b loc_0632c0
	moveq #2,d1

loc_0632c0:
	move.b d1,($81,a6)

loc_0632c4:
	rts

;==============================================
;Tobikoshi
;==============================================
loc_0632c6:
	move.b (7,a6),d0
	move.w loc_0632d2(pc,d0.w),d1
	jmp loc_0632d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0632d2:
	dc.w loc_0632f4-loc_0632d2
	dc.w loc_063356-loc_0632d2
	dc.w loc_063394-loc_0632d2
	dc.w loc_0633b6-loc_0632d2
	dc.w loc_06341a-loc_0632d2
	dc.w loc_063426-loc_0632d2
	dc.w loc_06346e-loc_0632d2
	dc.w loc_063492-loc_0632d2

	dc.w loc_0634b2-loc_0632d2
	dc.w loc_0635b8-loc_0632d2
	dc.w loc_0635ea-loc_0632d2
	dc.w loc_063616-loc_0632d2
	dc.w loc_063624-loc_0632d2
	dc.w loc_063674-loc_0632d2
	dc.w loc_0636a6-loc_0632d2
	dc.w loc_0636f2-loc_0632d2

	dc.w loc_06372a-loc_0632d2

;----------------------------------------------
loc_0632f4:
	jsr loc_02aa08
	tst.b ($35,a6)
	beq.w loc_064980
	tst.w ($44,a6)
	bmi.w loc_063348
	moveq #$2e,d0
	jsr loc_02e3fe
	beq.b loc_063346
	move.b #6,(7,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	moveq #1,d0
	tst.b ($b,a6)
	beq.b loc_06332c
	neg.w d0

loc_06332c:
	add.w d0,($10,a4)
	bsr.w loc_064d86
	moveq #0,d0
	tst.b ($2c8,a4)
	beq.b loc_06333e
	moveq #1,d0

loc_06333e:
	moveq #0,d1
	jsr loc_02a838

loc_063346:
	rts

loc_063348:
	move.b #4,(7,a6)
	moveq #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_063356:
	tst.b ($35,a6)
	beq.w loc_064980
	addq.b #2,(7,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.b #1,($31,a6)
	move.l #$30000,d0
	tst.b ($b,a6)
	bne.b loc_06338a
	neg.l d0

loc_06338a:
	move.l d0,($40,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_063394:
	jsr loc_02aa08
	bcc.w loc_064980
	move.b #8,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #6,d0
	jmp loc_02a758

;----------------------------------------------
loc_0633b6:
	tst.b ($35,a6)
	beq.w loc_0633fc
	jsr loc_02e7a4
	move.b #4,(7,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.b #1,($31,a6)
	move.l #$30000,d0
	tst.b ($b,a6)
	bne.b loc_0633f2
	neg.l d0

loc_0633f2:
	move.l d0,($40,a6)
	jmp loc_02a7ea

loc_0633fc:
	tst.b ($125,a6)
	bne.w loc_064980
	tst.b ($378,a6)
	beq.w loc_064980
	move.b #$a,(7,a6)
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_06341a:
	tst.b ($33,a6)
	bpl.w loc_064980
	bra.w loc_06445e

;----------------------------------------------
loc_063426:
	tst.b ($35,a6)
	beq.w loc_064980
	jsr loc_02e7cc
	addq.b #2,(7,a6)
	clr.b ($de,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	clr.l ($48,a6)
	move.b #1,($31,a6)
	move.l #$20000,d0
	tst.b ($b,a6)
	bne.b loc_063464
	neg.l d0

loc_063464:
	move.l d0,($40,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06346e:
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_063492:
	tst.b ($33,a6)
	bpl.w loc_064980
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	move.b #$1e,($3a,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_0634b2:
	subq.b #1,($3a,a6)
	beq.w loc_064974
	tst.b ($125,a6)
	bne.w loc_063562
	move.b ($378,a6),d2
	andi.w #$77,d2
	beq.w loc_064980
	move.b ($371,a6),d3
	andi.b #3,d3
	bne.b loc_0634e0
	andi.w #7,d2
	beq.b loc_063522
	bra.b loc_0634ea

loc_0634e0:
	andi.w #7,d2
	beq.w loc_063586
	bra.b loc_063562

loc_0634ea:
	move.b #$12,(7,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.b #1,($de,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06351c(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$25,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06351c:
	dc.w $0012,$0022,$0032

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063522:
	move.b #$14,(7,a6)
	move.b #1,($31,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($48,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06355c(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$26,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06355c:
	dc.w $0012,$0022,$0032

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063562:
	moveq #$2f,d0
	jsr loc_02e3fe
	beq.b loc_0635aa
	move.b #$18,(7,a6)
	eori.b #1,($b,a6)
	moveq #$27,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_063586
	moveq #$30,d0
	jsr loc_02e3fe
	beq.b loc_0635aa
	move.b #$1a,(7,a6)
	eori.b #1,($b,a6)
	moveq #$19,d0
	jsr loc_02a758
	jmp loc_02f9be
	

loc_0635aa:
	move.b #$16,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0635b8:
	tst.b ($33,a6)
	bmi.w loc_064974
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0635cc
	neg.l d0

loc_0635cc:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.w loc_064980
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0635ea:
	jsr loc_02aa08
	bcc.w loc_06360c
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c

loc_06360c:
	tst.b ($35,a6)
	beq.w loc_064980
	rts

;----------------------------------------------
loc_063616:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_063624:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($35,a6)
	beq.w loc_063662
	bpl.b loc_063648
	clr.b ($35,a6)
	move.b #$1e,($123,a5)
	moveq #$35,d0
	jmp loc_080b70

loc_063648:
	clr.b ($35,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06366e(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$2f,d0
	jsr loc_02e7f2

loc_063662:
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06366e:
	dc.w $0014,$0024,$0034

;-----------------------------------------------
loc_063674:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$40000,d1
	tst.b ($b,a6)
	beq.b loc_063696
	neg.l d1

loc_063696:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0636a6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$70000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.l #$30000,d1
	tst.b ($b,a6)
	beq.b loc_0636e2
	neg.l d1

loc_0636e2:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0636f2:
	jsr loc_02aa08
	bcc.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #$1e,($123,a5)
	moveq #$5b,d0
	jsr loc_080b70
	moveq #$1a,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_06372a:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	clr.b ($35,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_063760(pc,d0.w),d1
	move.b d1,($cc,a6)
	moveq #$30,d0
	jsr loc_02e7f2
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063760:
	dc.w $0014,$0024,$0034

;==============================================
;Wingless Airplane
;==============================================
loc_063766:
	move.b (7,a6),d0
	move.w loc_063772(pc,d0.w),d1
	jmp loc_063772(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063772:
	dc.w loc_06377c-loc_063772
	dc.w loc_0637b4-loc_063772
	dc.w loc_0637c4-loc_063772
	dc.w loc_0637fa-loc_063772
	dc.w loc_063822-loc_063772

;----------------------------------------------
loc_06377c:
	moveq #3,d0
	jsr loc_02ef6c
	move.b #1,($ce,a6)
	moveq #$2a,d0
	jsr loc_02e636
	beq.b loc_0637a8
	move.b #4,(7,a6)
	moveq #$2a,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_0637a8:
	addq.b #2,(7,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_0637b4:
	jsr loc_02aa08
	bcc.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_0637c4:
	tst.b ($34,a6)
	beq.b loc_0637ee
	addq.b #2,(7,a6)
	move.l #$ffff0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.l #0,($40,a6)
	move.l #0,($48,a6)

loc_0637ee:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0637fa:
	jsr loc_02aa08
	bcc.w loc_064998
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_063822:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($35,a6)
	beq.w loc_064986
	bmi.b loc_063846
	clr.b ($35,a6)
	moveq #$2a,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

loc_063846:
	clr.b ($35,a6)
	move.b #$1e,($123,a5)
	moveq #$34,d0
	jsr loc_02e970
	bra.w loc_064986

;==============================================
;unknown
;==============================================
loc_06385c:
	move.b (7,a6),d0
	move.w loc_063868(pc,d0.w),d1
	jmp loc_063868(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063868:
	dc.w loc_06387a-loc_063868
	dc.w loc_063894-loc_063868
	dc.w loc_0638c6-loc_063868
	dc.w loc_063928-loc_063868
	dc.w loc_06396a-loc_063868
	dc.w loc_0639cc-loc_063868
	dc.w loc_0639e6-loc_063868
	dc.w loc_063a2c-loc_063868

	dc.w loc_063a60-loc_063868

;----------------------------------------------
loc_06387a:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	moveq #$19,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_063894:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$40000,d1
	tst.b ($b,a6)
	beq.b loc_0638b6
	neg.l d1

loc_0638b6:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0638c6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	jsr loc_01bd5c
	moveq #-$60,d0
	tst.b ($b,a6)
	bne.b loc_0638f6
	move.w #$1e0,d0

loc_0638f6:
	add.w ($10,a3),d0
	swap d0
	sub.l ($10,a6),d0
	asr.l #5,d0
	move.l d0,($40,a6)
	move.w #$20,($3a,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_063928:
	subq.w #1,($3a,a6)
	bne.b loc_063956
	addq.b #2,($7,a6)
	move.b #$3c,($3a,a6)
	clr.b ($3b,a6)
	eori.b #1,($b,a6)
	jsr loc_064ab0(pc)
	nop
	moveq #$2e,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_063956:
	addi.l #$20000,($14,a6)
	jsr loc_02aa08
	jmp loc_02f9be

;----------------------------------------------
loc_06396a:
	subq.b #1,($3a,a6)
	beq.b loc_0639bc
	tst.b ($125,a6)
	bne.b loc_063990
	tst.b ($379,a6)
	beq.b loc_063990
	addq.b #1,($3b,a6)
	moveq #1,d0
	btst #0,($3b,a6)
	bne.b loc_06398c
	neg.w d0

loc_06398c:
	move.w d0,($d4,a6)

loc_063990:
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	bne.b loc_0639b6
	tst.b ($379,a4)
	beq.b loc_0639b6
	subq.b #1,($3a,a6)
	beq.b loc_0639bc
	moveq #1,d0
	btst #0,($3a,a6)
	beq.b loc_0639b2
	neg.w d0

loc_0639b2:
	move.w d0,($d4,a4)

loc_0639b6:
	jmp loc_02f9be

loc_0639bc:
	addq.b #2,(7,a6)
	move.b ($3b,a6),($3a,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_0639cc:
	tst.b ($3a,a6)
	beq.b loc_0639dc
	subq.b #1,($3a,a6)
	jmp loc_02f9be

loc_0639dc:
	addq.b #2,(7,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_0639e6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_064998
	addq.b #2,(7,a6)
	move.l #$7c000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	clr.l ($48,a6)
	moveq #$24,d2
	move.l #$3c000,d1
	tst.b ($b,a6)
	beq.b loc_063a1e
	neg.l d1
	neg.w d2

loc_063a1e:
	move.l d1,($40,a6)
	add.w d2,($10,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_063a2c:
	jsr loc_02aa08
	bcc.w loc_064986
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #$2d,($123,a5)
	moveq #$33,d0
	jsr loc_080b70
	moveq #$2f,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_063a60:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($35,a6)
	beq.b loc_063a7a
	clr.b ($35,a6)
	moveq #$32,d0
	jsr loc_02e7f2

loc_063a7a:
	jsr loc_02a7ea
	jmp loc_02f9be

;==============================================
;Shooting Peach
;==============================================
loc_063a86:
	move.b (7,a6),d0
	move.w loc_063a92(pc,d0.w),d1
	jmp loc_063a92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063a92:
	dc.w loc_063a98-loc_063a92
	dc.w loc_063b1e-loc_063a92
	dc.w loc_063b72-loc_063a92

;----------------------------------------------
loc_063a98:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($a9,a6)
	tst.b ($b9,a6)
	beq.b loc_063ab4
	move.b #1,($2d9,a6)

loc_063ab4:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,($4c,a6)
	clr.l ($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_063b06(pc,d0.w),d1
	move.l loc_063b06+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_063af0
	neg.l d1

loc_063af0:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$30,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063b06:
	dc.l $00030000,$00040000
	dc.l $00040000,$00050000
	dc.l $00050000,$00060000

;----------------------------------------------
loc_063b1e:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #1,($31,a6)
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$33,d0
	jsr loc_02a758
	move.b ($82,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	add.b d0,($32,a6)
	rts

;----------------------------------------------
loc_063b72:
	tst.b ($33,a6)
	bmi.w loc_06497a
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Paradise Hold
;==============================================
loc_063b86:
	move.b (7,a6),d0
	move.w loc_063b92(pc,d0.w),d1
	jmp loc_063b92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063b92:
	dc.w loc_063ba4-loc_063b92
	dc.w loc_063c04-loc_063b92
	dc.w loc_063ca0-loc_063b92
	dc.w loc_063cc4-loc_063b92
	dc.w loc_063cd2-loc_063b92
	dc.w loc_063d12-loc_063b92
	dc.w loc_063d2e-loc_063b92
	dc.w loc_063d8e-loc_063b92

	dc.w loc_063dac-loc_063b92

;----------------------------------------------
loc_063ba4:
	move.b #$10,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($a9,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$38000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	clr.l ($48,a6)
	move.b ($82,a6),d0
	lsl.w #1,d0
	move.l loc_063bf8(pc,d0.w),d0
	tst.b ($b,a6)
	bne.w loc_063bec
	neg.l d0

loc_063bec:
	move.l d0,($40,a6)
	moveq #$36,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063bf8:
	dc.l $00020000
	dc.l $00030000
	dc.l $00040000

;----------------------------------------------
loc_063c04:
	tst.b ($31,a6)
	beq.b loc_063c1e
	jsr loc_02aa08
	bcc.w loc_063c96
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)

loc_063c1e:
	tst.b ($35,a6)
	bmi.w loc_064980
	beq.w loc_064980
	clr.b ($35,a6)
	moveq #$38,d0
	jsr loc_02e3fe
	bne.b loc_063c84
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.l #0,($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #1,d0
	move.l loc_063c78(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_063c6e
	neg.l d1

loc_063c6e:
	move.l d1,($40,a6)
	jmp loc_064980(pc)
	nop

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063c78:
	dc.l $00020000
	dc.l $00030000
	dc.l $00040000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063c84:
	move.b #8,(7,a6)
	jsr loc_02a7ea
	jmp loc_02fa36

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063c96:
	tst.b ($35,a6)
	bpl.w loc_064980
	rts

;----------------------------------------------
loc_063ca0:
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$37,d0
	jmp loc_02a758

;----------------------------------------------
loc_063cc4:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_063cd2:
	tst.b ($33,a6)
	bpl.w loc_064986
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	moveq #$30,d0
	tst.b ($b,a6)
	bne.b loc_063cf2
	neg.w d0

loc_063cf2:
	add.w d0,($10,a6)
	moveq #$37,d0
	jsr loc_080b70
	move.b #$1e,($123,a5)
	moveq #$38,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_063d12:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	subq.b #4,d0
	add.b d0,($32,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_063d2e:
	tst.b ($35,a6)
	beq.b loc_063d5e
	bpl.b loc_063d66
	addq.b #2,(7,a6)
	neg.l ($40,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_063d58(pc,d0.w),d0
	jmp loc_02e7f2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063d58:
	dc.w $0051,$0052,$0053

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063d5e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_063d66:
	cmpi.b #1,($35,a6)
	bne.b loc_063d82
	move.b #2,($35,a6)
	move.b #$1e,($123,a5)
	moveq #$37,d0
	jsr loc_080b70

loc_063d82:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_063d8e:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	bne.w loc_064980
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_063dac:
	tst.b ($35,a6)
	bne.w loc_064980
	move.b #2,(7,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;==============================================
;Rainbow Hip Rush
;==============================================
loc_063dc6:
	move.b (7,a6),d0
	move.w loc_063dd2(pc,d0.w),d1
	jmp loc_063dd2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063dd2:
	dc.w loc_063de0-loc_063dd2
	dc.w loc_063e08-loc_063dd2
	dc.w loc_063e32-loc_063dd2
	dc.w loc_063e64-loc_063dd2
	dc.w loc_063eba-loc_063dd2
	dc.w loc_063f2c-loc_063dd2
	dc.w loc_063f50-loc_063dd2

;----------------------------------------------
loc_063de0:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$39,d0
	jmp loc_02a758

;----------------------------------------------
loc_063e08:
	tst.b ($35,a6)
	beq.w loc_064980
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_063e1e
	moveq #1,d0

loc_063e1e:
	move.b d0,($ab,a6)
	moveq #$20,d0
	moveq #$54,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_063e32:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_063e5e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_063e58
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_063e58:
	move.b loc_063e60(pc,d0.w),($25d,a6)

loc_063e5e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063e60:
	dc.b $0b,$13,$1f,00

;----------------------------------------------
loc_063e64:
	tst.b ($33,a6)
	bmi.w loc_063ea4
	jsr loc_02a7ea
	move.b ($34,a6),d0
	andi.w #7,d0
	beq.b loc_063e92
	clr.b ($34,a6)
	add.b d0,d0
	move.w loc_063e94(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_063e8e
	neg.w d1

loc_063e8e:
	add.w d1,($10,a6)

loc_063e92:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063e94:
	dc.w $0000,$0000,$0000,$0014
	dc.w $0000,$000a,$0000,$0004

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_063ea4:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3c,d0
	jmp loc_02a758

;----------------------------------------------
loc_063eba:
	tst.b ($35,a6)
	bmi.w loc_063ede
	bne.w loc_064980
	move.l #$30000,d0
	tst.b ($b,a6)
	bne.b loc_063ed4
	neg.l d0

loc_063ed4:
	add.l d0,($10,a6)
	jmp loc_02a7ea

loc_063ede:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$ffff8000,($4c,a6)
	clr.l ($48,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_063f14(pc,d0.w),d1
	move.l loc_063f14+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_063f0e
	neg.l d1

loc_063f0e:
	move.l d1,($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063f14:
	dc.l $00040000,$00038000
	dc.l $00050000,$00040000
	dc.l $00060000,$00048000

;----------------------------------------------
loc_063f2c:
	jsr loc_02aa08
	bcc.w loc_064980
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$3f,d0
	jmp loc_02a758

;----------------------------------------------
loc_063f50:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02bb26

;==============================================
;Heavenly Dynamite
;==============================================
loc_063f5e:
	move.b (7,a6),d0
	move.w loc_063f6a(pc,d0.w),d1
	jmp loc_063f6a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_063f6a:
	dc.w loc_063f84-loc_063f6a
	dc.w loc_063fa2-loc_063f6a
	dc.w loc_063fcc-loc_063f6a
	dc.w loc_064010-loc_063f6a
	dc.w loc_06401e-loc_063f6a
	dc.w loc_064080-loc_063f6a
	dc.w loc_06409e-loc_063f6a
	dc.w loc_0640e0-loc_063f6a

	dc.w loc_064198-loc_063f6a
	dc.w loc_0641ca-loc_063f6a
	dc.w loc_06421c-loc_063f6a
	dc.w loc_064254-loc_063f6a
	dc.w loc_06427c-loc_063f6a

;----------------------------------------------
loc_063f84:
	addq.b #2,(7,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$40,d0
	jmp loc_02a758

;----------------------------------------------
loc_063fa2:
	tst.b ($35,a6)
	beq.w loc_064980
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_063fb8
	moveq #1,d0

loc_063fb8:
	move.b d0,($ab,a6)
	moveq #-$24,d0
	moveq #$3e,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_063fcc:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_064008
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #$54,d0
	jsr loc_02e3fe
	beq.b loc_064008
	move.b #8,(7,a6)
	clr.w ($3a,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06400a(pc,d0.w),($ae,a6)
	moveq #$41,d0
	jmp loc_02a758

loc_064008:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06400a:
	dc.w $006e,$0084,$009a

;----------------------------------------------
loc_064010:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_06401e:
	jsr loc_02a7ea
	jsr loc_02ea06
	tst.b ($35,a6)
	beq.b loc_064040
	clr.b ($35,a6)
	addq.w #1,($3a,a6)
	moveq #$55,d0
	jsr loc_02e970

loc_064040:
	jsr loc_02ea7a
	beq.b loc_06407a
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #3,d0
	cmp.w ($3a,a6),d0
	bcc.b loc_06406e
	move.b #$c,(7,a6)
	moveq #$43,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_06406e:
	addq.b #2,(7,a6)
	moveq #$42,d0
	jsr loc_02a758

loc_06407a:
	jmp loc_02f9be

;----------------------------------------------
loc_064080:
	tst.b ($35,a6)
	beq.w loc_064986
	move.b #6,(7,a6)
	moveq #$56,d0
	jsr loc_080b70
	moveq #$54,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_06409e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_064998
	addq.b #2,(7,a6)
	moveq #$56,d0
	jsr loc_080b70
	movea.w ($38,a6),a4
	move.w ($14,a6),($14,a4)
	move.w ($10,a6),($10,a4)
	moveq #$60,d0
	tst.b ($b,a6)
	bne.b loc_0640d2
	neg.w d0

loc_0640d2:
	add.w d0,($10,a4)
	moveq #3,d0
	moveq #4,d1
	jmp loc_02a838

;----------------------------------------------
loc_0640e0:
	tst.b ($35,a6)
	beq.b loc_0640ee
	clr.b ($35,a6)
	bsr.w loc_064cd4

loc_0640ee:
	tst.b ($33,a6)
	bpl.w loc_064176
	movea.w ($38,a6),a4
	clr.b ($2ce,a4)
	movea.w a6,a0
	movea.w a4,a6
	jsr loc_00374e
	movea.w a0,a6
	cmpi.b #2,($82,a6)
	bhi.b loc_064148
	bcs.b loc_064128
	move.b #$18,(7,a6)
	moveq #$44,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_064128:
	move.b #$10,(7,a6)
	moveq #$45,d0
	jsr loc_02a758
	jsr loc_02fa36
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	rts

loc_064148:
	move.b #$16,($aa,a6)
	clr.b (7,a6)
	move.b #1,($26f,a6)
	move.b #1,($2af,a6)
	movea.w ($38,a6),a4
	move.b #1,($2af,a4)
	moveq #$18,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_064176:
	jsr loc_02a8c6
	movea.w ($38,a6),a4
	tst.b ($33,a4)
	bpl.w loc_064980
	moveq #$1a,d0
	moveq #4,d1
	jsr loc_02a838
	jmp loc_02a7ea

;----------------------------------------------
loc_064198:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$40000,d1
	tst.b ($b,a6)
	beq.b loc_0641ba
	neg.l d1

loc_0641ba:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0641ca:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	move.b #$16,($32,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$50000,d1
	tst.b ($b,a6)
	beq.b loc_0641fc
	neg.l d1

loc_0641fc:
	move.l d1,($40,a6)
	move.l #$a8000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06421c:
	jsr loc_02aa08
	bcc.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #$1e,($123,a5)
	moveq #$37,d0
	jsr loc_080b70
	moveq #$46,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_064254:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	clr.b ($35,a6)
	moveq #$57,d0
	jsr loc_02e7f2
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06427c:
	tst.b ($35,a6)
	beq.w loc_064986
	move.b #6,(7,a6)
	moveq #$58,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
;Daydream Headlock
;==============================================
loc_064298:
	move.b (7,a6),d0
	move.w loc_0642a4(pc,d0.w),d1
	jmp loc_0642a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0642a4:
	dc.w loc_0642b4-loc_0642a4
	dc.w loc_0642ce-loc_0642a4
	dc.w loc_064312-loc_0642a4
	dc.w loc_064320-loc_0642a4
	dc.w loc_064356-loc_0642a4
	dc.w loc_064388-loc_0642a4
	dc.w loc_0643fe-loc_0642a4
	dc.w loc_064436-loc_0642a4

;----------------------------------------------
loc_0642b4:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_0642ce:
	tst.b ($33,a6)
	bpl.w loc_064980
	moveq #$29,d0
	jsr loc_02e3fe
	bne.b loc_0642ec
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_0642ec:
	move.b #6,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_06430c(pc,d0.w),($ae,a6)
	moveq #$18,d0
	jsr loc_02a758
	jmp loc_02fa36

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06430c:
	dc.w $006e,$0090,$00b2

;----------------------------------------------
loc_064312:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_064320:
	jsr loc_02ea06
	tst.b ($35,a6)
	beq.w loc_06433a
	clr.b ($35,a6)
	moveq #$59,d0
	jsr loc_02e970

loc_06433a:
	jsr loc_02ea7a
	beq.w loc_064986
	addq.b #2,(7,a6)
	moveq #$19,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_064356:
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$40000,d1
	tst.b ($b,a6)
	beq.b loc_064378
	neg.l d1

loc_064378:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_064388:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($35,a6)
	beq.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_0643e0(pc,d0.w),d1
	move.b d1,($32,a6)
	lsl.w #2,d0
	move.l loc_0643e6(pc,d0.w),d1
	move.l loc_0643e6+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	beq.b loc_0643d0
	neg.l d1

loc_0643d0:
	move.l d1,($40,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0643e0:
	dc.w $000e,$0010,$0012

loc_0643e6:
	dc.l $00030000,$00070000
	dc.l $00040000,$00080000
	dc.l $00050000,$00090000

;----------------------------------------------
loc_0643fe:
	jsr loc_02aa08
	bcc.w loc_064986
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #$2d,($123,a5)
	moveq #$5b,d0
	jsr loc_02e970
	moveq #$1a,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_064436:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	clr.b ($35,a6)
	moveq #$29,d0
	jsr loc_02e7f2
	jsr loc_02a7ea
	jmp loc_02f9be

loc_06445e:
	move.b #8,($aa,a6)
	move.b #6,(7,a6)
	move.l #$60000,($40,a6)
	move.l #$ffff8000,($48,a6)
	moveq #2,d0
	jmp loc_02a758

;==============================================
loc_064482:
	move.w ($36,a6),d0
	beq.b loc_06445e
	movea.w d0,a4
	movea.w ($38,a6),a3
	tst.w ($50,a3)
	bmi.w loc_064974
	tst.b ($10d,a5)
	bne.w loc_064974
	move.b #$10,($aa,a6)
	clr.b (7,a6)
	clr.b ($81,a6)
	jsr loc_01bd5c
	moveq #$2c,d0
	tst.b ($b,a4)
	bne.b loc_0644be
	move.w #$154,d0

loc_0644be:
	add.w ($10,a3),d0
	swap d0
	sub.l ($10,a6),d0
	asr.l #5,d0
	move.l d0,($40,a6)
	move.w #$20,($3a,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	clr.l ($48,a6)
	move.b #1,($31,a6)
	move.b ($b,a4),($b,a6)
	eori.b #1,($b,a6)
	moveq #$13,d0
	jmp loc_02a708

;##############################################
;Throws
;##############################################
loc_064502:
	move.b ($80,a6),d0
	move.w loc_06450e(pc,d0.w),d1
	jmp loc_06450e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06450e:
	dc.w loc_064514-loc_06450e
	dc.w loc_064658-loc_06450e
	dc.w loc_0647a4-loc_06450e

;==============================================
;Ground
;==============================================
loc_064514:
	tst.b ($81,a6)
	bne.w loc_0645ba
	move.b (7,a6),d0
	move.w loc_064528(pc,d0.w),d1
	jmp loc_064528(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064528:
	dc.w loc_064530-loc_064528
	dc.w loc_064544-loc_064528
	dc.w loc_064576-loc_064528
	dc.w loc_064584-loc_064528

;----------------------------------------------
loc_064530:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_064544:
	tst.b ($33,a6)
	bpl.w loc_064980
	moveq #$24,d0
	jsr loc_02e3fe
	bne.b loc_064562
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_064562:
	move.b #6,(7,a6)
	move.b #3,($3a,a6)
	moveq #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_064576:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_064584:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	bpl.b loc_0645a8
	clr.b ($35,a6)
	move.b #$1e,($123,a5)
	moveq #$35,d0
	jmp loc_080b70

loc_0645a8:
	clr.b ($35,a6)
	moveq #$24,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
;Ground Kick Throw
;==============================================
loc_0645ba:
	move.b (7,a6),d0
	move.w loc_0645cc(pc,d0.w),d1
	jsr loc_0645cc(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0645cc:
	dc.w loc_0645d4-loc_0645cc
	dc.w loc_0645e8-loc_0645cc
	dc.w loc_06461a-loc_0645cc
	dc.w loc_064628-loc_0645cc

;----------------------------------------------
loc_0645d4:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_0645e8:
	tst.b ($33,a6)
	bpl.w loc_064980
	moveq #$25,d0
	jsr loc_02e3fe
	bne.b loc_064606
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_064606:
	move.b #6,(7,a6)
	move.b #3,($3a,a6)
	moveq #$1b,d0
	jmp loc_02a758

;----------------------------------------------
loc_06461a:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_064628:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064980
	clr.b ($35,a6)
	moveq #$33,d0
	jsr loc_080b70
	moveq #$25,d0
	jsr loc_02e7f2
	move.b #$1e,($123,a5)
	jmp loc_02a7ea

;==============================================
;Crouching Grab
;==============================================
loc_064658:
	move.b (7,a6),d0
	move.w loc_06466a(pc,d0.w),d1
	jsr loc_06466a(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06466a:
	dc.w loc_064678-loc_06466a
	dc.w loc_06468c-loc_06466a
	dc.w loc_0646c2-loc_06466a
	dc.w loc_0646d0-loc_06466a
	dc.w loc_06471c-loc_06466a
	dc.w loc_06475e-loc_06466a
	dc.w loc_06478e-loc_06466a

;----------------------------------------------
loc_064678:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_06468c:
	tst.b ($33,a6)
	bpl.w loc_064980
	moveq #$26,d0
	jsr loc_02e3fe
	beq.b loc_0646b6
	move.b #6,(7,a6)
	move.w #$78,($ae,a6)
	clr.w ($3a,a6)
	moveq #$16,d0
	jmp loc_02a758

loc_0646b6:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0646c2:
	tst.b ($33,a6)
	bpl.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_0646d0:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.w loc_0646f6
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	moveq #$27,d0
	jsr loc_02e970
	bne.b loc_064708
	tst.b ($2ca,a1)
	beq.w loc_064708

loc_0646f6:
	jsr loc_02ea06
	jsr loc_02ea7a
	jmp loc_02a7ea

loc_064708:
	move.b #4,(7,a6)
	moveq #$26,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;----------------------------------------------
loc_06471c:
	movea.w ($38,a6),a1
	tst.b ($33,a6)
	bpl.b loc_064738
	tst.w ($ae,a6)
	bne.b loc_064738
	addq.b #2,(7,a6)
	moveq #$17,d0
	jmp loc_02a758

loc_064738:
	tst.b ($35,a6)
	beq.b loc_06474c
	clr.b ($35,a6)
	moveq #$28,d0
	jsr loc_02e970
	bne.b loc_064708

loc_06474c:
	jsr loc_02ea06
	jsr loc_02ea7a
	jmp loc_02a7ea

;----------------------------------------------
loc_06475e:
	tst.b ($33,a6)
	bmi.w loc_064974
	tst.b ($35,a6)
	beq.w loc_064980
	clr.b ($35,a6)
	moveq #$5a,d0
	jsr loc_080b70
	moveq #$26,d0
	jsr loc_02e7f2
	move.b #$c,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06478e:
	tst.b ($33,a6)
	bpl.w loc_064980
	move.b #4,(7,a6)
	moveq #$1d,d0
	jmp loc_02a758

;==============================================
;Air Grabs
;==============================================
loc_0647a4:
	tst.b ($81,a6)
	bne.w loc_064896
	move.b (7,a6),d0
	move.w loc_0647b8(pc,d0.w),d1
	jmp loc_0647b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0647b8:
	dc.w loc_0647c2-loc_0647b8
	dc.w loc_064804-loc_0647b8
	dc.w loc_064814-loc_0647b8
	dc.w loc_06483a-loc_0647b8
	dc.w loc_064874-loc_0647b8

;----------------------------------------------
loc_0647c2:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2a,d0
	jsr loc_02e636
	beq.b loc_0647f8
	move.b #4,(7,a6)
	moveq #0,d1
	tst.w ($40,a6)
	beq.b loc_0647ea
	bmi.b loc_0647e6
	moveq #1,d1

loc_0647e6:
	move.b d1,($b,a6)

loc_0647ea:
	moveq #$2d,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_0647f8:
	addq.b #2,(7,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_064804:
	jsr loc_02aa08
	bcc.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_064814:
	tst.b ($34,a6)
	beq.b loc_06482e
	addq.b #2,(7,a6)
	move.l #0,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_06482e:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06483a:
	jsr loc_02aa08
	bcc.b loc_064862
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b #$1e,($123,a5)
	moveq #$36,d0
	jsr loc_02e970

loc_064862:
	tst.b ($35,a6)
	bne.b loc_06486e
	jsr loc_02a7ea

loc_06486e:
	jmp loc_02f9be

;----------------------------------------------
loc_064874:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	clr.b ($35,a6)
	moveq #$2a,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
;Kick Air Grab
;==============================================
loc_064896:
	move.b (7,a6),d0
	move.w loc_0648a2(pc,d0.w),d1
	jmp loc_0648a2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0648a2:
	dc.w loc_0648aa-loc_0648a2
	dc.w loc_0648fc-loc_0648a2
	dc.w loc_06490c-loc_0648a2
	dc.w loc_06494c-loc_0648a2

;----------------------------------------------
loc_0648aa:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2b,d0
	jsr loc_02e636
	beq.b loc_0648f0
	move.b #4,(7,a6)
	move.l #$ffff0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #0,d1
	tst.w ($40,a6)
	beq.b loc_0648e2
	bpl.b loc_0648de
	moveq #1,d1

loc_0648de:
	move.b d1,($b,a6)

loc_0648e2:
	moveq #$2b,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_0648f0:
	addq.b #2,(7,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_0648fc:
	jsr loc_02aa08
	bcc.w loc_064980
	jmp loc_02baf2

;----------------------------------------------
loc_06490c:
	tst.b ($33,a6)
	bpl.w loc_064986
	jsr loc_02aa08
	bcc.w loc_064986
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b #$1e,($123,a5)
	moveq #$5b,d0
	jsr loc_080b70
	moveq #$1a,d0
	jsr loc_02a758
	jmp loc_02f9be

;----------------------------------------------
loc_06494c:
	tst.b ($33,a6)
	bmi.w loc_06497a
	tst.b ($35,a6)
	beq.w loc_064986
	clr.b ($35,a6)
	moveq #$2b,d0
	jsr loc_02e7f2
	jsr loc_02a7ea
	jmp loc_02f9be

;==============================================
loc_064974:
	jmp loc_02baf2

;==============================================
loc_06497a:
	jmp loc_02bb26

;==============================================
loc_064980:
	jmp loc_02a7ea

;==============================================
loc_064986:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_064998

;==============================================
loc_064992:
	jmp loc_02fa36

;==============================================
loc_064998:
	jmp loc_02f9be

;##############################################
;
;##############################################
loc_06499e:
	jsr loc_01c2c8
	beq.b loc_0649e2
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #0,($31,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)

loc_0649e2:
	rts

;==============================================
loc_0649e4:
	movea.w ($38,a6),a4
	cmpi.b #$d,($55,a4)
	bne.b loc_064a5c
	tst.w ($50,a4)
	bmi.b loc_064a5c
	move.b #1,($258,a4)
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	bne.w loc_064a5c
	move.b #1,($26f,a6)
	jsr loc_01c2c8
	beq.b loc_064a5c
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #2,($31,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)
	move.w ($64,a6),($14,a4)
	move.w a4,($36,a6)

loc_064a5c:
	rts

;==============================================
loc_064a5e:
	jsr loc_01c2c8
	beq.w loc_064aae
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #4,($31,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)
	move.w ($64,a6),($14,a4)
	move.w a4,($36,a6)

loc_064aae:
	rts

;==============================================
loc_064ab0:
	move.b #1,($26f,a6)
	jsr loc_01c2c8
	beq.b loc_064b04
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #$a,($31,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)
	move.w ($64,a6),($14,a4)
	move.w a4,($36,a6)

loc_064b04:
	rts

;==============================================
loc_064b06:
	cmpi.b #2,($6eb9,a5)
	bcs.w loc_064bb4
	jsr loc_01c2c8
	movea.w a4,a3
	jsr loc_01c2c8
	cmpa.w a4,a3
	bcs.b loc_064b24
	exg.l a3,a4

loc_064b24:
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #6,($31,a4)
	move.w a6,($36,a4)
	move.w a3,($38,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)
	move.w ($64,a6),($14,a4)
	move.b d6,($3c,a4)
	addq.b #1,(a3)
	move.b #$16,(2,a3)
	move.b ($102,a6),(3,a3)
	move.b #8,($31,a3)
	move.w a6,($36,a3)
	move.w a4,($38,a3)
	move.w ($c,a6),($c,a3)
	move.b ($e,a6),($e,a3)
	move.l ($18,a6),($18,a3)
	move.b #1,($30,a3)
	move.w ($26,a6),($26,a3)
	move.b ($f,a6),($f,a3)
	move.w ($64,a6),($14,a3)

loc_064bb4:
	rts

;==============================================
loc_064bb6:
	cmpi.b #3,($6eb9,a5)
	bcs.w loc_064cd2
	jsr loc_01c2c8
	movea.w a4,a3
	jsr loc_01c2c8
	movea.w a4,a2
	jsr loc_01c2c8
	cmpa.w a2,a3
	bcs.b loc_064bdc
	exg.l a2,a3

loc_064bdc:
	cmpa.w a2,a4
	bcs.b loc_064be2
	exg.l a2,a4

loc_064be2:
	cmpa.w a3,a4
	bcs.b loc_064be8
	exg.l a3,a4

loc_064be8:
	addq.b #1,(a3)
	move.b #$16,(2,a3)
	move.b ($102,a6),(3,a3)
	move.b #6,($31,a3)
	move.w a6,($36,a3)
	move.w a4,($38,a3)
	move.w ($c,a6),($c,a3)
	move.b ($e,a6),($e,a3)
	move.l ($18,a6),($18,a3)
	move.b #1,($30,a3)
	move.w ($26,a6),($26,a3)
	move.b ($f,a6),($f,a3)
	move.w ($64,a6),($14,a3)
	move.w ($64,a6),($64,a3)
	move.b #2,($3c,a3)
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($102,a6),(3,a4)
	move.b #8,($31,a4)
	move.w a6,($36,a4)
	move.w a3,($38,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.l ($18,a6),($18,a4)
	move.b #1,($30,a4)
	move.w ($26,a6),($26,a4)
	move.b ($f,a6),($f,a4)
	move.w ($64,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	addq.b #1,(a2)
	move.b #$16,(2,a2)
	move.b ($102,a6),(3,a2)
	move.b #$c,($31,a2)
	move.w a6,($36,a2)
	move.w a3,($38,a2)
	move.w ($c,a6),($c,a2)
	move.b ($e,a6),($e,a2)
	move.l ($18,a6),($18,a2)
	move.b #1,($30,a2)
	move.w ($26,a6),($26,a2)
	move.b ($f,a6),($f,a2)
	move.w ($64,a6),($14,a2)
	move.w ($64,a6),($64,a2)

loc_064cd2:
	rts

;==============================================
loc_064cd4:
	moveq #2,d6
	movea.w ($38,a6),a1
	jsr loc_01c2c8
	beq.w loc_064d84
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a1),($e,a4)
	move.b ($102,a1),($3a,a4)
	move.w a1,($36,a4)
	move.b #$10,($3c,a4)
	move.b #2,($31,a4)
	jsr loc_01c2c8
	beq.b loc_064d84
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a1),($e,a4)
	move.b ($102,a1),($3a,a4)
	move.w a1,($36,a4)
	move.b #$24,($3c,a4)
	move.b #1,($31,a4)
	jsr loc_01c2c8
	beq.b loc_064d84
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.b d6,(3,a4)
	move.b ($e,a1),($e,a4)
	move.b ($102,a1),($3a,a4)
	move.w a1,($36,a4)
	move.b #$34,($3c,a4)
	move.b #2,($31,a4)
	move.b #1,($2ce,a1)
	move.b #1,($2cf,a1)
	movea.w a6,a0
	movea.w a1,a6
	jsr loc_00373a
	movea.w a0,a6

loc_064d84:
	rts

;==============================================
loc_064d86:
	movea.w ($38,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #2,d0
	move.b ($102,a4),d0
	lsl.w #2,d0
	movea.l #loc_064e6a,a0
	tst.b ($2c8,a4)
	beq.b loc_064db0
	movea.l #loc_064eea,a0

loc_064db0:
	move.w (a0,d0.w),d1
	move.w (2,a0,d0.w),d2
	add.w d2,($14,a6)
	tst.b ($b,a6)
	bne.b loc_064dc4
	neg.w d1

loc_064dc4:
	add.w d1,($10,a6)
	rts

;==============================================
loc_064dca:
	moveq #2,d0
	moveq #2,d1
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;##############################################
;
;##############################################
loc_064ddc:
	dc.w loc_064e26-loc_064ddc
	dc.w loc_064e26-loc_064ddc
	dc.w loc_064de2-loc_064ddc

loc_064de2:
	dc.b $09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02

loc_064e26:
	dc.b $08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02
	dc.b $02,$02,$02,$02

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064e6a:
	dc.w $fffd,$0057,$fff9,$0057
	dc.w $fffe,$0057,$fffe,$005a
	dc.w $0001,$004b,$0008,$0059
	dc.w $fffd,$0060,$000b,$0057
	dc.w $ffe2,$0058,$0000,$005d
	dc.w $fff9,$0053,$fffd,$006e
	dc.w $0000,$0057,$0003,$0051
	dc.w $ffe9,$0059,$fff2,$0057
	dc.w $ffe1,$0061,$ffff,$0051
	dc.w $0001,$004b,$fff8,$0059
	dc.w $fffd,$0060,$fff2,$0063
	dc.w $0007,$0051,$fffd,$0057
	dc.w $fffa,$0052,$ffea,$0052
	dc.w $fff9,$0054,$fffa,$0060
	dc.w $0000,$0061,$0005,$004f
	dc.w $0007,$0051,$0007,$0051

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_064eea:
	dc.w $fffe,$003a,$fffd,$003a
	dc.w $fffe,$003c,$fffd,$003a
	dc.w $fffd,$003d,$0004,$003a
	dc.w $fffd,$0041,$000a,$0038
	dc.w $ffe2,$003d,$fffc,$0037
	dc.w $fff5,$0032,$fffa,$0048
	dc.w $0000,$003a,$fff7,$0030
	dc.w $ffe9,$0031,$fff4,$003f
	dc.w $ffe7,$0047,$fffa,$0032
	dc.w $fffd,$003d,$0005,$003c
	dc.w $fffd,$0041,$0004,$0041
	dc.w $fff3,$0030,$fffe,$003a
	dc.w $ffea,$003b,$ffe5,$0037
	dc.w $fff4,$0034,$fff8,$0041
	dc.w $0001,$003a,$0001,$0037
	dc.w $fff3,$0030,$fff3,$0030