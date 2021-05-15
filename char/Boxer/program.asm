;##############################################
;
;##############################################
loc_05990e:
	tst.b ($125,a6)
	bne.b loc_05993a
	cmpi.w #6,($138,a5)
	beq.b loc_05993a
	cmpi.w #$1400,($11a,a6)
	bne.b loc_05993a
	jsr loc_01c368
	beq.b loc_05993a
	move.l #$01001500,(a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)

loc_05993a:
	rts

;##############################################
;
;##############################################
loc_05993c:
	move.b (6,a6),d0
	move.w loc_059948(pc,d0.w),d1
	jmp loc_059948(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059948:
	dc.w loc_05994e-loc_059948
	dc.w loc_059966-loc_059948
	dc.w loc_059a6a-loc_059948

;==============================================
loc_05994e:
	move.b #2,(6,a6)
	tst.b ($125,a6)
	bne.w loc_059966
	move.b #4,(6,a6)
	bra.w loc_059a6a

;==============================================
loc_059966:
	move.b (7,a6),d0
	move.w loc_059972(pc,d0.w),d1
	jmp loc_059972(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059972:
	dc.w loc_05997c-loc_059972
	dc.w loc_0599c6-loc_059972
	dc.w loc_0599e8-loc_059972
	dc.w loc_059a10-loc_059972
	dc.w loc_059a52-loc_059972

;----------------------------------------------
loc_05997c:
	addq.b #2,(7,a6)
	move.w #$ff60,d0
	tst.b ($101,a6)
	beq.b loc_05998c
	neg.w d0

loc_05998c:
	add.w d0,($10,a6)
	move.l #$01002404,d1
	bsr.w loc_05ac70
	move.l #$01002406,d1
	bsr.w loc_05ac70
	move.b #$20,($3b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),($4e,a6)
	moveq #$11,d0
	jsr loc_0038e4
	moveq #$40,d0
	jmp loc_02a708

;----------------------------------------------
loc_0599c6:
	subq.b #1,($3b,a6)
	bpl.b loc_0599e6
	addq.b #2,(7,a6)
	move.b #$ff,($3a,a6)
	move.l #$a0000,($40,a6)
	move.l #0,($48,a6)

loc_0599e6:
	rts

;----------------------------------------------
loc_0599e8:
	bsr.w loc_05ac52
	bsr.w loc_05ac24
	move.w ($10,a6),d0
	sub.w ($4e,a6),d0
	subi.w #$30,d0
	cmpi.w #$120,d0
	bhi.b loc_059a0e
	addq.b #2,(7,a6)
	move.l #$ffff6000,($48,a6)

loc_059a0e:
	rts

;----------------------------------------------
loc_059a10:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bpl.b loc_059a36
	clr.b ($34,a6)
	moveq #$40,d0
	jsr loc_080b70
	moveq #$41,d0
	jsr loc_080b70
	move.w #$9280,($48,a5)

loc_059a36:
	bsr.w loc_05ac24
	move.w ($10,a6),d0
	sub.w ($4e,a6),d0
	subi.w #$60,d0
	cmpi.w #$c0,d0
	bhi.b loc_059a50
	addq.b #2,(7,a6)

loc_059a50:
	rts

;----------------------------------------------
loc_059a52:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_059a6a:
	move.b (7,a6),d0
	move.w loc_059a76(pc,d0.w),d1
	jmp loc_059a76(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059a76:
	dc.w loc_059a7a-loc_059a76
	dc.w loc_059a86-loc_059a76

;----------------------------------------------
loc_059a7a:
	addq.b #2,(7,a6)
	moveq #$32,d0
	jmp loc_02a758

;----------------------------------------------
loc_059a86:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_059a9e:
	move.b ($2c4,a6),d0
	move.w loc_059aaa(pc,d0.w),d1
	jmp loc_059aaa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059aaa:
	dc.w loc_059ab8-loc_059aaa
	dc.w loc_059ada-loc_059aaa
	dc.w loc_059ada-loc_059aaa
	dc.w loc_059ada-loc_059aaa
	dc.w loc_059ada-loc_059aaa
	dc.w loc_059ada-loc_059aaa
	dc.w loc_059ada-loc_059aaa

;==============================================
loc_059ab8:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_059aca(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059aca:
	dc.b $02,$04,$02,$04,$02,$04,$02,$04
	dc.b $02,$04,$02,$04,$02,$04,$02,$04

;==============================================
loc_059ada:
	move.b ($7,a6),d0
	move.w loc_059ae6(pc,d0.w),d1
	jmp loc_059ae6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059ae6:
	dc.w loc_059af0-loc_059ae6
	dc.w loc_059b08-loc_059ae6
	dc.w loc_059b3c-loc_059ae6
	dc.w loc_059b68-loc_059ae6
	dc.w loc_059b76-loc_059ae6

;----------------------------------------------
loc_059af0:
	addq.b #2,($7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_059b08:
	tst.b ($124,a5)
	bne.w loc_05ac1e
	tst.b ($11c,a5)
	bne.w loc_05ac1e
	addq.b #2,($7,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	move.w loc_059b2c(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059b2c:
	dc.w $0024,$0024,$0024,$0024
	dc.w $0024,$0024,$0023,$0024

;----------------------------------------------
loc_059b3c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_059b64
	addq.b #2,($7,a6)
	clr.b ($35,a6)
	move.l #$01002400,d1
	bsr.w loc_05ac70
	move.l #$01002402,d1
	bsr.w loc_05ac70

loc_059b64:
	bra.w loc_059b7c

;----------------------------------------------
loc_059b68:
	tst.b ($35,a6)
	bpl.b loc_059b72
	bsr.w loc_05ac80

loc_059b72:
	bsr.w loc_059b7c

;----------------------------------------------
loc_059b76:
	jmp loc_02a7ea

;==============================================
loc_059b7c:
	subq.b #1,($3a,a6)
	bpl.b loc_059b8a
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_059b8a:
	rts

;##############################################
;Normals
;##############################################
loc_059b8c:
	move.b ($80,a6),d0
	move.w loc_059b98(pc,d0.w),d1
	jmp loc_059b98(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059b98:
	dc.w loc_059b9e-loc_059b98
	dc.w loc_059bf0-loc_059b98
	dc.w loc_059c46-loc_059b98

;==============================================
;
;==============================================
loc_059b9e:
	clr.b ($2c8,a6)
	move.b ($7,a6),d0
	move.w loc_059bae(pc,d0.w),d1
	jmp loc_059bae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059bae:
	dc.w loc_059bb2-loc_059bae
	dc.w loc_059bea-loc_059bae

;----------------------------------------------
loc_059bb2:
	addq.b #2,($7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_059be0
	addq.b #6,d0

loc_059be0:
	add.b ($82,a6),d0
	jmp loc_02a710

;----------------------------------------------
loc_059bea:
	jmp loc_02f5ac

;==============================================
;
;==============================================
loc_059bf0:
	move.b #1,($2c8,a6)
	move.b ($7,a6),d0
	move.w loc_059c02(pc,d0.w),d1
	jmp loc_059c02(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059c02:
	dc.w loc_059c06-loc_059c02
	dc.w loc_059c40-loc_059c02

;----------------------------------------------
loc_059c06:
	addq.b #2,($7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$18,d0
	add.b ($82,a6),d0
	lsr.w #1,d0
	tst.b ($81,a6)
	beq.b loc_059c3a
	addq.b #3,d0

loc_059c3a:
	jmp loc_02a710

;----------------------------------------------
loc_059c40:
	jmp loc_02f5ac

;==============================================
;
;==============================================
loc_059c46:
	tst.b ($125,a6)
	bne.b loc_059c6e
	move.l ($40,a6),d0
	btst.b #1,($371,a6)
	bne.b loc_059c62
	btst.b #0,($371,a6)
	beq.b loc_059c6e
	neg.l d0

loc_059c62:
	tst.b ($b,a6)
	bne.b loc_059c6a
	neg.l d0

loc_059c6a:
	add.l d0,($10,a6)

loc_059c6e:
	bsr.w loc_05ac40
	bpl.w loc_05ac1e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05ac1e
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_02bd64

;##############################################
;Air Normals
;##############################################
loc_059c96:
	move.b #6,($7,a6)
	move.b #4,($80,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_059cc6
	moveq #$18,d0

loc_059cc6:
	tst.b ($81,a6)
	beq.b loc_059cce
	addq.w #3,d0

loc_059cce:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr loc_02a710
	tst.b ($3c,a6)
	bne.b loc_059d08
	tst.b (PL_ism_choice,a6)
	bpl.b loc_059d08
	tst.b ($81,a6)
	bne.b loc_059d08
	cmpi.b #4,($82,a6)
	bne.b loc_059d08
	move.l #$02000a00,(4,a6)
	move.l #$18000,($40,a6)

loc_059d08:
	rts

;##############################################
;Special Move Inputs
;##############################################
loc_059d0a:
	jsr loc_02e096
	bne.w loc_059dba

loc_059d14:
	lea.l ($1b8,a6),a4
	jsr loc_02d772
	bne.w loc_05a02e

loc_059d22:
	lea.l ($1c0,a6),a4
	jsr loc_02d76a
	bne.w loc_05a080

loc_059d30:
	lea.l ($1c8,a6),a4
	jsr loc_02d762
	bne.w loc_05a0c4

loc_059d3e:
	lea.l ($1a0,a6),a4
	jsr loc_02d73a
	bne.w loc_059f9c

loc_059d4c:
	lea.l ($180,a6),a4
	jsr loc_02d72a
	bne.w loc_059ee6

loc_059d5a:
	lea.l ($188,a6),a4
	jsr loc_02d732
	bne.w loc_059f0e

loc_059d68:
	lea.l ($190,a6),a4
	jsr loc_02d74a
	bne.w loc_059f38

loc_059d76:
	lea.l ($198,a6),a4
	jsr loc_02d752
	bne.w loc_059f6a

loc_059d84:
	lea.l ($1a8,a6),a4
	jsr loc_02d7a2
	bne.w loc_059fce

loc_059d92:
	lea.l ($1b0,a6),a4
	jsr loc_02d7c2
	bne.w loc_059ffe

loc_059da0:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_059e54

loc_059dae:
	jsr loc_02e0cc
	bne.w loc_059e28

loc_059db8:
	rts

;----------------------------------------------
;Move ID Writes
;----------------------------------------------
loc_059dba:
	tst.b ($28a,a6)
	bne.w loc_059d14
	cmpi.w #$48,($11e,a6)
	bcs.w loc_059d14
	tst.b ($31,a6)
	bne.w loc_059e02
	jsr loc_02ef54
	beq.w loc_059d14
	jsr loc_02ecd8
	beq.w loc_059d14
	move.l #$02001000,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_059e02:
	tst.b ($b9,a6)
	bne.w loc_059d14
	jsr loc_02ed28
	beq.w loc_059d14
	move.l #$02001000,(4,a6)
	move.b #$10,($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_059e28:
	tst.b ($b9,a6)
	bne.b loc_059e34
	tst.b (pl_taunt_count,a6)
	beq.b loc_059db8

loc_059e34:
	jsr loc_02ed00
	beq.w loc_059db8
	move.l #$02000e00,(4,a6)
	move.b #$c,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_059e54:
	jsr loc_02edf8
	beq.w loc_059dae

;##############################################
;Aism Alpha Counter Write
;##############################################
loc_059e5e:
	tst.b (PL_ism_choice,a6)
	bne.w loc_059eac
	move.l #$02000e0a,(4,a6)
	move.b #8,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	jsr loc_080e8e
	moveq #3,d0
	jmp loc_02a758

;##############################################
;Vism Alpha Counter Write
;##############################################
loc_059eac:
	move.l #$02000e00,(4,a6)
	move.b #$e,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_059ee6:
	jsr loc_02ed00
	beq.w loc_059d5a
	move.l #$02000e00,(4,a6)
	clr.b ($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;----------------------------------------------
loc_059f0e:
	jsr loc_02ed00
	beq.w loc_059d68
	move.l #$02000e00,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_059f38:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_059d76
	jsr loc_02ed00
	beq.w loc_059d76
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;----------------------------------------------
loc_059f6a:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_059d84
	jsr loc_02ed00
	beq.w loc_059d84
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_059f9c:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_059d4c
	jsr ReversalCheck
	beq.w loc_059d4c
	move.l #$02000e00,(4,a6)
	move.b #$8,(pl_move_id,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;----------------------------------------------
loc_059fce:
	move.b d1,($37f,a6)
	jsr loc_02ed00
	beq.w loc_059d92
	move.l #$02000e00,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($37f,a6),($82,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	rts

;----------------------------------------------
loc_059ffe:
	move.b d1,($37f,a6)
	jsr loc_02ed00
	beq.w loc_059da0
	move.l #$02000e00,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($37f,a6),($82,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	rts

;----------------------------------------------
loc_05a02e:
	tst.b (PL_ism_choice,a6)
	bpl.w loc_059d22
	cmpi.w #$30,($11e,a6)
	bcs.w loc_059d22
	jsr loc_02ecd8
	beq.w loc_059d22
	move.l #$02001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b ($378,a6),d0
	andi.b #$70,d0
	bne.b loc_05a074
	move.b #$12,($aa,a6)
	jmp loc_02f4bc

loc_05a074:
	move.b #$16,($aa,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_05a080:
	tst.b (PL_ism_choice,a6)
	bne.w loc_059d30
	cmpi.w #$90,($11e,a6)
	bcs.w loc_059d30
	jsr loc_02ecd8
	beq.w loc_059d30
	move.l #$02001000,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;----------------------------------------------
loc_05a0c4:
	tst.b (PL_ism_choice,a6)
	bne.w loc_059d3e
	cmpi.w #$30,($11e,a6)
	bcs.w loc_059d3e
	jsr loc_02ecd8
	beq.w loc_059d3e
	move.l #$02001000,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;##############################################
;AI Special Move Check
;##############################################
loc_05a100:
	move.b ($aa,a6),d0
	move.w loc_05a10c(pc,d0.w),d1
	jmp loc_05a10c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a10c:
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a14c-loc_05a10c
	dc.w loc_05a124-loc_05a10c

	dc.w loc_05a124-loc_05a10c
	dc.w loc_05a13e-loc_05a10c
	dc.w loc_05a128-loc_05a10c
	dc.w loc_05a13e-loc_05a10c

;----------------------------------------------
loc_05a124:
	bra.w loc_05a158

;----------------------------------------------
loc_05a128:
	tst.b (PL_ism_choice,a6)
	bne.w loc_05a15c
	cmpi.w #$90,($11e,a6)
	bcs.w loc_05a15c
	bra.w loc_05a158

;----------------------------------------------
loc_05a13e:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05a15c
	bra.w loc_05a158

;----------------------------------------------
loc_05a14c:
	tst.b (pl_taunt_count,a6)
	beq.w loc_05a15c
	bra.w loc_05a158

;==============================================
loc_05a158:
	moveq #1,d0
	rts

;==============================================
loc_05a15c
	moveq #0,d0
	rts

;##############################################
;Special Programming
;##############################################
loc_05a160:
	move.b ($aa,a6),d0
	move.w loc_05a16c(pc,d0.w),d1
	jmp loc_05a16c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a16c:
	dc.w loc_05a184-loc_05a16c;Dashes
	dc.w loc_05a184-loc_05a16c;Dashes
	dc.w loc_05a184-loc_05a16c;Dashes
	dc.w loc_05a184-loc_05a16c;Dashes
	dc.w loc_05a2b8-loc_05a16c;Headbutt
	dc.w loc_05a3ea-loc_05a16c;TAP
	dc.w loc_05a508-loc_05a16c;Taunt
	dc.w loc_05a5fa-loc_05a16c;Vism Alpha Counter

	dc.w loc_05a622-loc_05a16c;Vism Activate
	dc.w loc_05a6a4-loc_05a16c;Rush Super
	dc.w loc_05a8b2-loc_05a16c;Tap Super
	dc.w loc_05a6a4-loc_05a16c

;==============================================
;Dashes
;==============================================
loc_05a184:
	move.b (7,a6),d0
	move.w loc_05a190(pc,d0.w),d1
	jmp loc_05a190(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a190:
	dc.w loc_05a198-loc_05a190
	dc.w loc_05a216-loc_05a190
	dc.w loc_05a276-loc_05a190
	dc.w loc_05a286-loc_05a190

;----------------------------------------------
loc_05a198:
	addq.b #2,(7,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	move.w loc_05a1fe(pc,d0.w),($46,a6)
	move.w loc_05a204(pc,d0.w),($4e,a6)
	add.w d0,d0
	move.l loc_05a20a(pc,d0.w),($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.b #$ff,($3a,a6)
	move.b ($aa,a6),d0
	move.b loc_05a1ee(pc,d0.w),($2c8,a6)
	move.w loc_05a1f6(pc,d0.w),d0
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a1ee:
	dc.b $00,$00,$00,$00,$01,$00,$01,$00

loc_05a1f6:
	dc.w $0016,$001c,$0022,$0028

loc_05a1fe:
	dc.w $0040,$0080,$00c0

loc_05a204:
	dc.w $0040,$0040,$0040

loc_05a20a:
	dc.l $00080000,$00080000,$00080000

;----------------------------------------------
loc_05a216:
	move.w ($40,a6),d0
	sub.w d0,($46,a6)
	bmi.b loc_05a24c
	tst.b ($298,a6)
	bne.b loc_05a24c
	bsr.w loc_05a29e
	bcs.b loc_05a24c
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.b loc_05a24c
	bsr.w loc_05ac52
	bsr.w loc_05ac24
	tst.b ($35,a6)
	bne.w loc_05ac1c
	jmp loc_02a7ea

loc_05a24c:
	addq.b #2,(7,a6)
	move.b #1,($32,a6)
	move.b ($82,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_05a26a(pc,d0.w),($48,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a26a:
	dc.l $ffff6000,$ffff6000,$ffff6000

;----------------------------------------------
loc_05a276:
	bsr.w loc_05ac24
	bpl.b loc_05a280
	addq.b #2,(7,a6)

loc_05a280:
	jmp loc_02a7ea

;----------------------------------------------
loc_05a286:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	cmpi.b #4,($aa,a6)
	bcc.w loc_05ac16
	jmp loc_02baf2

;==============================================
loc_05a29e:
	movea.w ($38,a6),a4
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	tst.b ($b,a6)
	beq.b loc_05a2b2
	neg.w d0

loc_05a2b2:
	cmp.w ($4e,a6),d0
	rts

;==============================================
;Headbutt
;==============================================
loc_05a2b8:
	move.b (7,a6),d0
	move.w loc_05a2c4(pc,d0.w),d1
	jmp loc_05a2c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a2c4:
	dc.w loc_05a2d0-loc_05a2c4
	dc.w loc_05a336-loc_05a2c4
	dc.w loc_05a34e-loc_05a2c4
	dc.w loc_05a378-loc_05a2c4
	dc.w loc_05a3a6-loc_05a2c4
	dc.w loc_05a3b4-loc_05a2c4

;----------------------------------------------
loc_05a2d0:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05a306(pc,d0.w),($40,a6)
	move.l loc_05a306+4(pc,d0.w),($44,a6)
	move.l loc_05a306+8(pc,d0.w),($48,a6)
	move.l loc_05a306+$c(pc,d0.w),($4c,a6)
	moveq #$44,d0
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a306:
	dc.l $00068000,$000c0000,$ffffa800,$fffee000
	dc.l $00080000,$000c0000,$00000000,$fffea800
	dc.l $000a8000,$000c0000,$00000000,$fffee000

;----------------------------------------------
loc_05a336:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05a34c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_05a34c:
	rts

;----------------------------------------------
loc_05a34e:
	bsr.w loc_05ac3e
	bpl.b loc_05a36e
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffff9000,($4c,a6)

loc_05a36e:
	tst.b ($35,a6)
	beq.w loc_05ac1e
	rts

;----------------------------------------------
loc_05a378:
	bsr.w loc_05ac3e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05a39c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)

loc_05a39c:
	tst.b ($35,a6)
	beq.w loc_05ac1e
	rts

;----------------------------------------------
loc_05a3a6:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02bb26

;----------------------------------------------
loc_05a3b4:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	move.b #2,(7,a6)
	move.l #$a8000,($40,a6)
	move.l #$c0000,($44,a6)
	move.l #0,($48,a6)
	move.l #$fffee000,($4c,a6)
	moveq #6,d0
	jmp loc_02a758

;==============================================
;TAP
;==============================================
loc_05a3ea:
	move.b (7,a6),d0
	move.w loc_05a3f6(pc,d0.w),d1
	jmp loc_05a3f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a3f6:
	dc.w loc_05a3fe-loc_05a3f6
	dc.w loc_05a450-loc_05a3f6
	dc.w loc_05a4c6-loc_05a3f6
	dc.w loc_05a4fa-loc_05a3f6

;----------------------------------------------
loc_05a3fe:
	addq.b #2,(7,a6)
	move.b d0,($5b,a6)
	move.b d0,($a,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_05a446(pc,d0.w),($cc,a6)
	addq.b #7,d0
	jsr loc_0038e4
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b #1,($ce,a6)
	move.b #$18,($3a,a6)
	moveq #$2e,d0
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a446:
	dc.b $0f,$12,$15,$1b,$22
	dc.b $2a,$34,$40,$4e,$60

;----------------------------------------------
loc_05a450:
	tst.b ($35,a6)
	bne.b loc_05a470
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	add.w d0,d0
	move.l loc_05a476(pc,d0.w),($40,a6)
	move.l loc_05a476+4(pc,d0.w),($48,a6)

loc_05a470:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a476:
	dc.l $00070000,$ffffa000
	dc.l $00080000,$ffffa000
	dc.l $00090000,$ffffa000
	dc.l $000a0000,$ffffa000
	dc.l $000b0000,$ffffa000
	dc.l $000c0000,$ffffa000
	dc.l $000d0000,$ffffa000
	dc.l $000e0000,$ffffa000
	dc.l $000f0000,$ffffa000
	dc.l $00100000,$ffffa000

;----------------------------------------------
loc_05a4c6:
	tst.b ($5b,a6)
	beq.b loc_05a4d4
	bmi.b loc_05a4d4
	jsr loc_02fcf8

loc_05a4d4:
	bsr.w loc_05ac52
	bsr.w loc_05ac24
	bpl.b loc_05a4ec
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($cc,a6)
	move.b d0,($ce,a6)

loc_05a4ec:
	tst.b ($35,a6)
	bne.w loc_05ac1c
	jmp loc_02a7ea

;----------------------------------------------
loc_05a4fa:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;==============================================
;Taunt
;==============================================
loc_05a508:
	move.b (7,a6),d0
	move.w loc_05a514(pc,d0.w),d1
	jmp loc_05a514(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a514:
	dc.w loc_05a51c-loc_05a514
	dc.w loc_05a54a-loc_05a514
	dc.w loc_05a58e-loc_05a514
	dc.w loc_05a5ec-loc_05a514

;----------------------------------------------
loc_05a51c:
	addq.b #2,(7,a6)
	move.b d0,($a9,a6)
	move.b d0,($2c8,a6)
	move.b #1,($ce,a6)
	move.b #$1f,($3a,a6)
	tst.b ($3e,a6)
	bne.b loc_05a53e
	subq.b #1,(pl_taunt_count,a6)

loc_05a53e:
	moveq #$32,d0
	clr.w ($4c,a6)
	jmp loc_02a758

;----------------------------------------------
loc_05a54a:
	move.b ($10d,a5),d0
	or.b ($107,a5),d0
	or.b ($10e,a5),d0
	bne.b loc_05a580
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	tst.b ($125,a6)
	bne.b loc_05a580
	btst.b #7,($11a,a6)
	beq.b loc_05a580
	addq.b #2,(7,a6)
	moveq #$33,d0
	move.w #1,($4c,a6)
	jmp loc_02a758

loc_05a580:
	move.b #6,(7,a6)
	moveq #$37,d0
	jmp loc_02a758

;----------------------------------------------
loc_05a58e:
	move.b ($10d,a5),d0
	or.b ($107,a5),d0
	or.b ($10e,a5),d0
	bne.b loc_05a580
	tst.b ($125,a6)
	bne.b loc_05a5ac
	tst.w ($378,a6)
	beq.b loc_05a5ac
	subq.b #1,($3a,a6)

loc_05a5ac:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	tst.b ($125,a6)
	bne.b loc_05a580
	btst.b #7,($11a,a6)
	beq.b loc_05a580
	tst.b ($3a,a6)
	bpl.w loc_05ac1e
	move.b #$1f,($3a,a6)
	move.w ($4c,a6),d0
	move.b loc_05a5e6(pc,d0.w),d0
	move.w d0,($4c,a6)
	addi.w #$32,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a5e6:
	dc.b $01,$02,$03,$04,$04,$04

;----------------------------------------------
loc_05a5ec:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;==============================================
;Vism Alpha Counter
;==============================================
loc_05a5fa:
	move.b (7,a6),d0
	move.w loc_05a606(pc,d0.w),d1
	jmp loc_05a606(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a606:
	dc.w loc_05a60a-loc_05a606
	dc.w loc_05a614-loc_05a606

;----------------------------------------------
loc_05a60a:
	addq.b #2,(7,a6)
	jsr loc_080e8e

loc_05a614:
	tst.b ($33,a6)
	bmi.w loc_05ac10
	jmp loc_02a7ea


;==============================================
;Vism Activate
;==============================================
loc_05a622:
	move.b (7,a6),d0
	move.w loc_05a62e(pc,d0.w),d1
	jmp loc_05a62e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a62e:
	dc.w loc_05a634-loc_05a62e
	dc.w loc_05a654-loc_05a62e
	dc.w loc_05a688-loc_05a62e

;----------------------------------------------
loc_05a634:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_05a64e
	moveq #$2f,d0

loc_05a64e:
	jmp loc_02a708

;----------------------------------------------
loc_05a654:
	tst.b ($34,a6)
	beq.b loc_05a682
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b ($31,a6)
	beq.b loc_05a678
	moveq #-3,d0
	moveq #$41,d1

loc_05a678:
	jsr loc_097cd6
	bsr.w loc_05ac9a

loc_05a682:
	jmp loc_02a7ea

;----------------------------------------------
loc_05a688:
	subq.b #1,($3a,a6)
	bne.w loc_05ac1e
	tst.b ($31,a6)
	beq.b loc_05a69e
	move.l #$02000602,(4,a6)

loc_05a69e:
	jmp loc_02f796

;==============================================
;Rush Super
;==============================================
loc_05a6a4:
	move.b (7,a6),d0
	move.w loc_05a6b0(pc,d0.w),d1
	jmp loc_05a6b0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a6b0:
	dc.w loc_05a6be-loc_05a6b0
	dc.w loc_05a6fe-loc_05a6b0
	dc.w loc_05a72e-loc_05a6b0
	dc.w loc_05a7ce-loc_05a6b0
	dc.w loc_05a846-loc_05a6b0
	dc.w loc_05a858-loc_05a6b0
	dc.w loc_05a876-loc_05a6b0

;----------------------------------------------
loc_05a6be:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b #2,($23f,a6)
	move.b #$c,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	move.b ($82,a6),d0
	ext.w d0
	lsr.b #1,d0
	move.b d0,($46,a6)
	addq.b #1,($46,a6)
	addi.b #$25,d0
	jmp loc_02a758

;----------------------------------------------
loc_05a6fe:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.w loc_05ac1e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05a71a
	moveq #0,d0

loc_05a71a:
	move.b d0,($ab,a6)
	moveq #-$15,d0
	moveq #$58,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_05a72e:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.w loc_05ac1c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05a75c
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05a75c:
	move.b loc_05a7ac(pc,d0.w),($25d,a6)
	move.b ($82,a6),d0
	ext.w d0
	move.w loc_05a7b0(pc,d0.w),($4e,a6)
	lsl.w #2,d0
	move.l loc_05a7b6(pc,d0.w),($40,a6)
	move.l loc_05a7b6+4(pc,d0.w),($48,a6)
	move.b #$c,($3a,a6)
	tst.b (PL_ism_choice,a6)
	bmi.b loc_05a794
	moveq #$56,d0
	bsr.w loc_05a884
	bne.b loc_05a7a0
	moveq #$50,d0
	bra.b loc_05a7a0

loc_05a794:
	moveq #$56,d0
	cmpi.b #$16,($aa,a6)
	beq.b loc_05a7a0
	moveq #$50,d0

loc_05a7a0:
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a7ac:
	dc.b $04,$06,$08,$00

loc_05a7b0:
	dc.w $0040,$0040,$0040

loc_05a7b6:
	dc.l $00080000,$ffff6000
	dc.l $00080000,$ffff6000
	dc.l $00080000,$ffff6000

;----------------------------------------------
loc_05a7ce:
	tst.b ($35,a6)
	bne.w loc_05ac1e
	tst.w ($40,a6)
	beq.b loc_05a7ea
	bsr.w loc_05ac52
	bsr.w loc_05ac24
	bpl.b loc_05a7ea
	clr.l ($40,a6)

loc_05a7ea:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #2,d0
	move.l loc_05a82e(pc,d0.w),($40,a6)
	move.l loc_05a82e+4(pc,d0.w),($48,a6)
	move.b #$c,($3a,a6)
	moveq #$50,d0
	bsr.w loc_05a884
	beq.b loc_05a816
	moveq #$56,d0

loc_05a816:
	subq.b #1,($46,a6)
	bpl.b loc_05a822
	addq.b #2,(7,a6)
	moveq #$5c,d0

loc_05a822:
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a82e:
	dc.l $00080000,$ffff6000
	dc.l $00080000,$ffff6000
	dc.l $00080000,$ffff6000

;----------------------------------------------
loc_05a846:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05a856
	addq.b #2,(7,a6)

loc_05a856:
	rts

;----------------------------------------------
loc_05a858:
	bsr.w loc_05ac52
	bsr.w loc_05ac24
	bmi.b loc_05a86c
	tst.b ($35,a6)
	beq.w loc_05ac1e
	rts

loc_05a86c:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05a876:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;==============================================
loc_05a884:
	tst.b ($125,a6)
	bne.b loc_05a8a4
	move.b ($370,a6),d1
	move.b d1,d2
	andi.b #7,d1
	bne.b loc_05a8a0
	andi.b #$70,d2
	beq.b loc_05a8a0
	moveq #1,d1
	rts

loc_05a8a0:
	moveq #0,d1
	rts

loc_05a8a4:
	clr.b ($47,a6)
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	rts

;==============================================
;Tap Super
;==============================================
loc_05a8b2:
	move.b (7,a6),d0
	move.w loc_05a8be(pc,d0.w),d1
	jmp loc_05a8be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a8be:
	dc.w loc_05a8ca-loc_05a8be
	dc.w loc_05a912-loc_05a8be
	dc.w loc_05a942-loc_05a8be
	dc.w loc_05a974-loc_05a8be
	dc.w loc_05aa10-loc_05a8be
	dc.w loc_05aa28-loc_05a8be

;----------------------------------------------
loc_05a8ca:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b #2,($23f,a6)
	move.b #$ff,($3a,a6)
	jsr loc_0804da
	move.l #$ffffff70,d0
	jsr loc_02ef6c
	jsr loc_02068c
	move.l #$0100240a,d1
	bsr.w loc_05ac70
	move.l #$0100240c,d1
	bsr.w loc_05ac70
	moveq #$31,d0
	jmp loc_02a758

;----------------------------------------------
loc_05a912:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.w loc_05ac1e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05a92e
	moveq #0,d0

loc_05a92e:
	move.b d0,($ab,a6)
	moveq #$23,d0
	moveq #$44,d1
	jsr loc_082e36
	jmp loc_02a7ea

;----------------------------------------------
loc_05a942:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_05a96e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	tst.b ($3f,a6)
	bne.b loc_05a968
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05a968:
	move.b loc_05a970(pc,d0.w),($25d,a6)

loc_05a96e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a970:
	dc.b $00,$00,$09,$00

;----------------------------------------------
loc_05a974:
	tst.b ($35,a6)
	bne.b loc_05a9f2
	addq.b #2,(7,a6)
	move.l #$0100240e,d1
	bsr.w loc_05ac70
	jsr loc_01c1c8
	beq.b loc_05a9dc
	move.l #$01001d00,(a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)

loc_05a9dc:
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	add.w d0,d0
	move.l loc_05a9f8(pc,d0.w),($40,a6)
	move.l loc_05a9f8+4(pc,d0.w),($48,a6)

loc_05a9f2:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05a9f8:
	dc.l $000d0000,$ffffa000
	dc.l $000e0000,$ffffa000
	dc.l $000f0000,$ffffa000

;----------------------------------------------
loc_05aa10:
	bsr.w loc_05ac24
	bpl.b loc_05aa1a
	addq.b #2,(7,a6)

loc_05aa1a:
	tst.b ($35,a6)
	bne.w loc_05ac1c
	jmp loc_02a7ea

;----------------------------------------------
loc_05aa28:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;##############################################
;Throw Programming
;##############################################
loc_05aa36:
	cmpi.b #4,($80,a6)
	beq.w loc_05ab50
	move.b (7,a6),d0
	move.w loc_05aa52(pc,d0.w),d1
	jsr loc_05aa52(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05aa52:
	dc.w loc_05aa5e-loc_05aa52
	dc.w loc_05aa72-loc_05aa52
	dc.w loc_05aada-loc_05aa52
	dc.w loc_05aae8-loc_05aa52
	dc.w loc_05ab22-loc_05aa52
	dc.w loc_05ab42-loc_05aa52

;----------------------------------------------
loc_05aa5e:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_05aa72:
	tst.b ($35,a6)
	beq.w loc_05ac1e
	moveq #$29,d0
	jsr loc_02e3fe
	beq.b loc_05aad0
	tst.b ($125,a6)
	beq.b loc_05aaa4
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_05aab8
	bra.b loc_05aabc

loc_05aaa4:
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_05aabc
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_05aabc

loc_05aab8:
	addq.b #1,($b,a6)

loc_05aabc:
	move.w #$3c,($ae,a6)
	move.b #6,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_05aad0:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05aada:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;----------------------------------------------
loc_05aae8:
	tst.b ($35,a6)
	beq.b loc_05aafc
	clr.b ($35,a6)
	moveq #$2a,d0
	jsr loc_02e970
	bne.b loc_05ab16

loc_05aafc:
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_05ab16
	jsr loc_02ea06
	jsr loc_02ea7a
	beq.w loc_05ac1e

loc_05ab16:
	addq.b #2,(7,a6)
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_05ab22:
	tst.b ($35,a6)
	beq.b loc_05ab3c
	addq.b #2,(7,a6)
	moveq #$2a,d0
	jsr loc_02e970
	moveq #$29,d0
	jsr loc_02e7f2

loc_05ab3c:
	jmp loc_02a7ea

;----------------------------------------------
loc_05ab42:
	tst.b ($33,a6)
	bpl.w loc_05ac1e
	jmp loc_02baf2

;==============================================
;Air Throw
;==============================================
loc_05ab50:
	move.b (7,a6),d0
	move.w loc_05ab62(pc,d0.w),d1
	jsr loc_05ab62(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ab62:
	dc.w loc_05ab6c-loc_05ab62
	dc.w loc_05abc8-loc_05ab62
	dc.w loc_05abde-loc_05ab62
	dc.w loc_05abf6-loc_05ab62
	dc.w loc_05abc8-loc_05ab62

;----------------------------------------------
loc_05ab6c:
	moveq #$2b,d0
	jsr loc_02e636
	beq.b loc_05abbc
	tst.b ($125,a6)
	beq.b loc_05ab96
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_05abaa
	bra.b loc_05abae

loc_05ab96:
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_05abae
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_05abae

loc_05abaa:
	addq.b #1,($b,a6)

loc_05abae:
	move.b #4,(7,a6)
	moveq #2,d0
	jmp loc_02a758

loc_05abbc:
	addq.b #2,(7,a6)
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_05abc8:
	jsr loc_02aa08
	bcc.w loc_05ac1e
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_05abde:
	tst.b ($35,a6)
	bpl.b loc_05abf0
	addq.b #2,(7,a6)
	moveq #$2c,d0
	jsr loc_02e970

loc_05abf0:
	jmp loc_02a7ea

;----------------------------------------------
loc_05abf6:
	tst.b ($35,a6)
	beq.b loc_05ac0a
	bmi.b loc_05ac0a
	addq.b #2,(7,a6)
	moveq #$2b,d0
	jsr loc_02e7f2

loc_05ac0a:
	jmp loc_02a7ea

;==============================================
loc_05ac10:
	jmp loc_02baf2

;==============================================
loc_05ac16:
	jmp loc_02bb26

;==============================================
loc_05ac1c:
	rts

;==============================================
loc_05ac1e:
	jmp loc_02a7ea

;==============================================
loc_05ac24:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_05ac30
	neg.l d0

loc_05ac30:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts


;==============================================
loc_05ac3e:
	bsr.b loc_05ac24

;==============================================
loc_05ac40:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_05ac52:
	move.b ($3a,a6),d0
	beq.b loc_05ac6e
	subq.b #1,d0
	move.b d0,($3a,a6)
	andi.b #3,d0
	bne.b loc_05ac6e
	move.l #$01002408,d1
	bsr.w loc_05ac70

loc_05ac6e:
	rts

;==============================================
loc_05ac70:
	jsr loc_01c2c8
	beq.b loc_05ac7e
	move.l d1,(a4)
	move.w a6,($36,a4)

loc_05ac7e:
	rts

;==============================================
loc_05ac80:
	tst.b ($125,a6)
	bne.b loc_05ac98
	tst.w ($378,a6)
	beq.b loc_05ac98
	jsr loc_02a7ea
	jsr loc_02a7ea

loc_05ac98:
	rts

;==============================================
loc_05ac9a:
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

;##############################################
;
;##############################################
loc_05ace2:
	dc.w loc_05ad24-loc_05ace2
	dc.w loc_05ad24-loc_05ace2
	dc.w loc_05ace8-loc_05ace2

loc_05ace8:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$09,$0b,$09
	dc.b $0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_05ad24:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$08
	dc.b $0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$08,$0a,$06,$06
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

