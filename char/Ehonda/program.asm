;##############################################
;Winposes
;##############################################
loc_05ddb2:
	move.b (6,a6),d0
	move.w loc_05ddbe(pc,d0.w),d1
	jmp loc_05ddbe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ddbe:
	dc.w loc_05ddc6-loc_05ddbe
	dc.w loc_05ddd8-loc_05ddbe
	dc.w loc_05ddee-loc_05ddbe
	dc.w loc_05de32-loc_05ddbe

;----------------------------------------------
loc_05ddc6:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_05ddd8:
	tst.b ($124,a5)
	bne.b loc_05dde8
	tst.b ($11c,a5)
	bne.b loc_05dde8
	addq.b #2,(6,a6)

loc_05dde8:
	jmp loc_02a7ea

;----------------------------------------------
loc_05ddee:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	bne.b loc_05de0e
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_05de1c(pc,d0.w),d0

loc_05de0e:
	subq.b #1,d0
	ext.w d0
	move.b loc_05de2c(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05de1c:
	dc.b $01,$05,$04,$03,$02,$01,$05,$04
	dc.b $03,$02,$01,$05,$04,$03,$02,$01

loc_05de2c:
	dc.b $23,$24,$25,$26,$27,$23

;----------------------------------------------
loc_05de32:
	tst.b ($3a,a6)
	beq.b loc_05de46
	subq.b #1,($3a,a6)
	bne.b loc_05de46
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_05de46:
	jmp loc_02a7ea

;##############################################
;Normals
;##############################################
loc_05de4c:
	tst.b ($80,a6)
	bne.w loc_05e0be
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_05deea
	move.b (7,a6),d0
	move.w loc_05de6c(pc,d0.w),d1
	jmp loc_05de6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05de6c:
	dc.w loc_05de70-loc_05de6c
	dc.w loc_05dee4-loc_05de6c

;----------------------------------------------
loc_05de70:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d1
	moveq #0,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b ($125,a6)
	bne.b loc_05deb4
	cmpi.b #1,($132,a6)
	bne.b loc_05deb4
	btst.b #1,($83,a6)
	bne.b loc_05dec2
	bra.b loc_05dec0

loc_05deb4:
	move.w loc_05dede(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_05ded8

loc_05dec0:
	addq.b #1,d0

loc_05dec2:
	cmpi.b #5,d0
	bne.b loc_05ded8
	cmpi.b #$ff,($132,a6)
	bne.w loc_05ded8
	move.b #1,($ed,a6)

loc_05ded8:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05dede:
	dc.w $0020,$0030,$0030

;----------------------------------------------
loc_05dee4:
	jmp loc_02f5ac

;==============================================
;Kicks
;==============================================
loc_05deea:
	cmpi.b #$ff,($132,a6)
	beq.w loc_05df06
	move.b ($82,a6),d0
	move.w loc_05df00(pc,d0.w),d1
	jmp loc_05df00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05df00:
	dc.w loc_05df9a-loc_05df00
	dc.w loc_05dff0-loc_05df00
	dc.w loc_05e052-loc_05df00

;==============================================
;X-ISM Kicks
;==============================================
loc_05df06:
	move.b (7,a6),d0
	move.w loc_05df12(pc,d0.w),d1
	jmp loc_05df12(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05df12:
	dc.w loc_05df16-loc_05df12
	dc.w loc_05dfea-loc_05df12

;----------------------------------------------
loc_05df16
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($82,a6)
	beq.b loc_05df5e
	move.b ($83,a6),d1
	andi.b #3,d1
	beq.b loc_05df5e
	moveq #$1e,d0
	cmpi.b #2,($82,a6)
	beq.b loc_05df8e
	move.b #1,($ed,a6)
	moveq #$1f,d0
	bra.b loc_05df8e

loc_05df5e:
	moveq #0,d1
	moveq #6,d0
	move.b ($82,a6),d1
	add.b d1,d0
	tst.b ($125,a6)
	bne.b loc_05df80
	cmpi.b #1,($132,a6)
	bne.b loc_05df80
	btst.b #1,($83,a6)
	bne.b loc_05df8e
	bra.b loc_05df8c

loc_05df80:
	move.w loc_05df94(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_05df8e

loc_05df8c:
	addq.b #1,d0

loc_05df8e:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05df94:
	dc.w $001e,$001e,$0030

;----------------------------------------------
;AVlk
loc_05df9a:
	move.b (7,a6),d0
	move.w loc_05dfa6(pc,d0.w),d1
	jmp loc_05dfa6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05dfa6:
	dc.w loc_05dfaa-loc_05dfa6
	dc.w loc_05dfea-loc_05dfa6

;----------------------------------------------
loc_05dfaa:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #6,d0
	tst.b ($125,a6)
	bne.b loc_05dfda
	cmpi.b #1,($132,a6)
	bne.b loc_05dfda
	btst.b #1,($83,a6)
	bne.b loc_05dfe4
	bra.b loc_05dfe2

loc_05dfda:
	cmpi.w #$30,($21c,a6)
	bcs.b loc_05dfe4

loc_05dfe2:
	addq.b #1,d0

loc_05dfe4:
	jmp loc_02a710

;Normals End
loc_05dfea:
	jmp loc_02f5ac

;----------------------------------------------
;AVmk
loc_05dff0:
	move.b (7,a6),d0
	move.w loc_05dffc(pc,d0.w),d1
	jmp loc_05dffc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05dffc:
	dc.w loc_05e000-loc_05dffc
	dc.w loc_05dfea-loc_05dffc

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05e000:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	btst.b #1,($83,a6)
	bne.b loc_05e04c
	moveq #8,d0
	tst.b ($125,a6)
	bne.b loc_05e042
	cmpi.b #1,($132,a6)
	bne.b loc_05e042
	btst.b #1,($83,a6)
	bne.b loc_05e04c
	bra.b loc_05e04a

loc_05e042:
	cmpi.w #$30,($21c,a6)
	bcs.b loc_05e04c

loc_05e04a:
	addq.w #1,d0

loc_05e04c:
	jmp loc_02a710

;----------------------------------------------
;AVhk
loc_05e052:
	move.b (7,a6),d0
	move.w loc_05e05e(pc,d0.w),d1
	jmp loc_05e05e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e05e:
	dc.w loc_05e062-loc_05e05e
	dc.w loc_05dfea-loc_05e05e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05e062:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	moveq #2,d0
	jsr loc_02ef6c
	move.b #1,($ed,a6)
	moveq #$1f,d0
	btst.b #1,($83,a6)
	bne.b loc_05e0b8
	clr.b ($ed,a6)
	moveq #$a,d0
	tst.b ($125,a6)
	bne.b loc_05e0ae
	cmpi.b #1,($132,a6)
	bne.b loc_05e0ae
	btst.b #1,($83,a6)
	bne.b loc_05e0b8
	bra.b loc_05e0b6

loc_05e0ae:
	cmpi.w #$30,($21c,a6)
	bcs.b loc_05e0b8

loc_05e0b6:
	addq.w #1,d0

loc_05e0b8:
	jmp loc_02a710

;==============================================
;Crouching
;==============================================
loc_05e0be:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_05e0d0(pc,d0.w),d1
	jmp loc_05e0d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e0d0:
	dc.w loc_05e0d4-loc_05e0d0
	dc.w loc_05e10a-loc_05e0d0

;----------------------------------------------
loc_05e0d4:
	addq.b #2,($7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_05e100
	addq.b #3,d1

loc_05e100:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_05e10a:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_05e110:
	move.b #6,($7,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_05e13a
	moveq #$18,d0

loc_05e13a:
	tst.b ($81,a6)
	beq.b loc_05e142
	addq.w #3,d0

loc_05e142:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	cmpi.b #$ff,($132,a6)
	bne.b loc_05e164
	cmpi.w #$1c,d0
	bne.b loc_05e164
	btst.b #2,($83,a6)
	beq.b loc_05e164
	moveq #$20,d0

loc_05e164:
	jmp loc_02a710

;##############################################
;Special Move Inputs
;##############################################
loc_05e16a:
	jsr loc_02e096
	bne.w loc_05e1f0

loc_05e174:
	lea.l ($198,a6),a4
	jsr loc_02d762
	bne.w loc_05e250

loc_05e182:
	lea.l ($1b8,a6),a4
	jsr loc_02d722
	bne.w loc_05e2ca

loc_05e190:
	lea.l ($1a0,a6),a4
	jsr loc_02d70a
	bne.w loc_05e450

loc_05e19e:
	lea.l ($1a8,a6),a4
	jsr loc_02d76a
	bne.w loc_05e28e

loc_05e1ac:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_05e30e

loc_05e1ba:
	lea.l ($180,a6),a4
	jsr loc_02d72a
	bne.w loc_05e3a4

loc_05e1c8:
	lea.l ($188,a6),a4
	jsr loc_02d742
	bne.w loc_05e3ce

loc_05e1d6:
	lea.l ($190,a6),a4
	jsr loc_02d7d6
	bne.w loc_05e3f8

loc_05e1e4:
	jsr loc_02e0cc
	bne.w loc_05e422

loc_05e1ee:
	rts

;----------------------------------------------
;Move ID Writes
loc_05e1f0:
	tst.b ($28a,a6)
	bne.w loc_05e174
	tst.b ($31,a6)
	bne.w loc_05e22c
	jsr loc_02ef54
	beq.w loc_05e174
	jsr loc_02ecd8
	beq.w loc_05e174
	move.l #$02001000,(4,a6)
	clr.b ($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_05e22c:
	tst.b ($b9,a6)
	bne.w loc_05e174
	jsr loc_02ed28
	beq.w loc_05e174
	move.l #$02001000,(4,a6)
	clr.b ($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_05e250:
	cmpi.b #1,($132,a6)
	beq.w loc_05e182
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05e182
	jsr loc_02ecd8
	beq.w loc_05e182
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$02001000,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_05e28e:
	tst.b ($132,a6)
	bne.w loc_05e1ac
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05e1ac
	jsr loc_02ecd8
	beq.w loc_05e1ac
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$02001000,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_05e2ca:
	tst.b ($132,a6)
	bne.w loc_05e190
	cmpi.w #$90,($11e,a6)
	bne.w loc_05e190
	jsr loc_02ecd8
	beq.w loc_05e190
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$02001000,(4,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	move.b #4,($248,a6)
	rts

;----------------------------------------------
loc_05e30e:
	jsr loc_02edf8
	beq.w loc_05e1ba

;##############################################
;Aism Alpha Counter write
;##############################################
loc_05e318:
	tst.b ($132,a6)
	bne.w loc_05e364
	move.b #6,($aa,a6)
	move.l #$02000e00,(4,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #0,($81,a6)
	movea.w ($38,a6),a4
	move.b #$16,($5f,a4)
	move.b #$1a,($25d,a6)
	moveq #$b,d0
	jmp loc_02a758

;##############################################
;Vism Alpha Counter write
;##############################################
loc_05e364:
	move.b #$6,($aa,a6)
	move.l #$02000e00,(4,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #2,($81,a6)
	movea.w ($38,a6),a4
	move.b #$17,($5f,a4)
	move.b #$1b,($25d,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_05e3a4:
	jsr loc_02ed00
	beq.w loc_05e1c8
	move.b #$8,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$2000e00,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;----------------------------------------------
loc_05e3ce:
	jsr loc_02ed00
	beq.w loc_05e1d6
	move.b #$a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$2000e00,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_05e3f8:
	jsr loc_02ed00
	beq.w loc_05e1e4
	move.b #$c,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$02000e00,(4,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;----------------------------------------------
loc_05e422:
	tst.b ($b9,a6)
	bne.b loc_05e430
	tst.b ($bc,a6)
	beq.w loc_05e1ee

loc_05e430:
	jsr loc_02ed00
	beq.w loc_05e1ee
	move.b #$e,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.l #$02000e00,(4,a6)
	rts

;----------------------------------------------
loc_05e450:
	jsr loc_02ed00
	beq.w loc_05e19e
	move.b #$10,($aa,a6)
	move.l #$02000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;##############################################
;AI move checks
;##############################################
loc_05e47a:
	move.b ($aa,a6),d0
	move.w loc_05e486(pc,d0.w),d1
	jmp loc_05e486(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e486:
	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e4b6-loc_05e486
	dc.w loc_05e4ae-loc_05e486
	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e4c0-loc_05e486

	dc.w loc_05e4c0-loc_05e486
	dc.w loc_05e49a-loc_05e486

;==============================================
loc_05e49a:
	tst.b ($132,a6)
	bne.w loc_05e4c4
	cmpi.w #$90,($11e,a6)
	bne.w loc_05e4c4
	bra.b loc_05e4c0

;==============================================
loc_05e4ae:
	tst.b ($132,a6)
	bne.w loc_05e4c4

;==============================================
loc_05e4b6:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05e4c4

;----------------------------------------------
loc_05e4c0:
	moveq #1,d0
	rts

;----------------------------------------------
loc_05e4c4:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_05e4c8:
	move.b ($aa,a6),d0
	move.w loc_05e4d4(pc,d0.w),d1
	jmp loc_05e4d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e4d4:
	dc.w loc_05e4e8-loc_05e4d4;00 Vism Activate
	dc.w loc_05e56e-loc_05e4d4;02 Super Headbutt
	dc.w loc_05e816-loc_05e4d4;04 Table Flip Super
	dc.w loc_05ea96-loc_05e4d4;06 Alpha Counter
	dc.w loc_05eae4-loc_05e4d4;08 Headbutt
	dc.w loc_05ec2e-loc_05e4d4;0a Butt Drop
	dc.w loc_05ed68-loc_05e4d4;0c 100 Hand Slap
	dc.w loc_05ef22-loc_05e4d4;0e Taunt

	dc.w loc_05efb6-loc_05e4d4;10 Oicho Throw
	dc.w loc_05f1dc-loc_05e4d4;12 Super Oicho

;==============================================
;Vism Activate
;==============================================
loc_05e4e8:
	move.b (7,a6),d0
	move.w loc_05e4f4(pc,d0.w),d1
	jmp loc_05e4f4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e4f4:
	dc.w loc_05e4fa-loc_05e4f4
	dc.w loc_05e51e-loc_05e4f4
	dc.w loc_05e552-loc_05e4f4

;----------------------------------------------
loc_05e4fa:
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_05e518
	moveq #$2f,d0

loc_05e518:
	jmp loc_02a708

;----------------------------------------------
loc_05e51e:
	tst.b ($34,a6)
	beq.b loc_05e54c
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_05e542
	moveq #-5,d0
	moveq #$44,d1

loc_05e542:
	jsr loc_097cd6
	bsr.w loc_05f788

loc_05e54c:
	jmp loc_02a7ea

;----------------------------------------------
loc_05e552:
	subq.b #1,($3a,a6)
	bne.w loc_05f774
	tst.b ($31,a6)
	beq.b loc_05e568
	move.l #$02000602,(4,a6)

loc_05e568:
	jmp loc_02f796

;==============================================
;Super Headbutt
;==============================================
loc_05e56e:
	move.b (7,a6),d0
	move.w loc_05e57a(pc,d0.w),d1
	jmp loc_05e57a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e57a:
	dc.w loc_05e58e-loc_05e57a
	dc.w loc_05e5ea-loc_05e57a
	dc.w loc_05e612-loc_05e57a
	dc.w loc_05e644-loc_05e57a
	dc.w loc_05e6ba-loc_05e57a
	dc.w loc_05e6e6-loc_05e57a
	dc.w loc_05e750-loc_05e57a
	dc.w loc_05e768-loc_05e57a

	dc.w loc_05e790-loc_05e57a
	dc.w loc_05e7e6-loc_05e57a

;----------------------------------------------
loc_05e58e:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($5b,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	move.w d0,d1
	add.w d1,d1
	move.l loc_05e5de(pc,d1.w),($40,a6)
	lsr.b #1,d0
	addi.w #$21,d0
	jsr loc_02a758
	bra.w loc_05eb52

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e5de:
	dc.l $00080000,$000a0000,$000a0000

;----------------------------------------------
loc_05e5ea:
	tst.b ($35,a6)
	beq.b loc_05e60c
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05e5fe
	moveq #1,d0

loc_05e5fe:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$5c,d1
	jsr loc_082e36

loc_05e60c:
	jmp loc_02a7ea

;----------------------------------------------
loc_05e612:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05e63e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05e638
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05e638:
	move.b loc_05e640(pc,d0.w),($25d,a6)

loc_05e63e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e640:
	dc.b $04,$08,$0c,00

;----------------------------------------------
loc_05e644:
	tst.b ($35,a6)
	beq.b loc_05e6b0
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_05e6a4
	addq.b #1,(a4)
	move.b #5,(2,a4)
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

loc_05e6a4:
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_05e6b6(pc,d0.w),($3b,a6)

loc_05e6b0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e6b6:
	dc.b $14,$1e,$28,$32

;----------------------------------------------
loc_05e6ba:
	tst.b ($5b,a6)
	bne.b loc_05e6da
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.w loc_05e6da
	tst.b ($298,a6)
	bne.w loc_05e6da
	subq.b #1,($3b,a6)
	bne.b loc_05e6e2

loc_05e6da:
	addq.b #2,(7,a6)
	clr.b ($5b,a6)

loc_05e6e2:
	bra.w loc_05f4e6

;----------------------------------------------
loc_05e6e6:
	jsr loc_02a7ea
	cmpi.b #1,($35,a6)
	beq.b loc_05e740
	cmpi.b #2,($35,a6)
	bne.b loc_05e70e
	clr.b ($35,a6)
	moveq #$10,d0
	tst.b ($b,a6)
	bne.b loc_05e70a
	neg.w d0

loc_05e70a:
	add.w d0,($10,a6)

loc_05e70e:
	tst.b ($33,a6)
	bpl.w loc_05f774
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	move.w d0,d1
	add.w d1,d1
	move.l loc_05e744(pc,d1.w),($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$24,d0
	jmp loc_02a758

loc_05e740:
	bra.w loc_05f4e6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e744:
	dc.l $00080000,$000a0000,$000a0000

;----------------------------------------------
loc_05e750:
	tst.b ($35,a6)
	beq.w loc_05f774
	addq.b #2,(7,a6)
	move.b #$28,($3b,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05e768:
	tst.b ($5b,a6)
	bne.b loc_05e788
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.w loc_05e788
	tst.b ($298,a6)
	bne.w loc_05e788
	subq.b #1,($3b,a6)
	bne.b loc_05e78c

loc_05e788:
	addq.b #2,(7,a6)

loc_05e78c:
	bra.w loc_05f4e6

;----------------------------------------------
loc_05e790:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_05e7b0
	clr.b ($35,a6)
	moveq #$10,d0
	tst.b ($b,a6)
	bne.b loc_05e7ac
	neg.w d0

loc_05e7ac:
	add.w d0,($10,a6)

loc_05e7b0:
	tst.b ($33,a6)
	bpl.w loc_05e7e4
	cmpi.b #4,($82,a6)
	bne.w loc_05f780
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffff5000,($48,a6)
	moveq #$27,d0
	jmp loc_02a758

loc_05e7e4:
	rts

;----------------------------------------------
loc_05e7e6:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_05e7f2
	neg.l d0

loc_05e7f2:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_05e808
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_05e808:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02bb26

;==============================================
;Table Flip Super
;==============================================
loc_05e816:
	move.b (7,a6),d0
	move.w loc_05e822(pc,d0.w),d1
	jmp loc_05e822(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e822:
	dc.w loc_05e83a-loc_05e822
	dc.w loc_05e876-loc_05e822
	dc.w loc_05e89e-loc_05e822
	dc.w loc_05e922-loc_05e822
	dc.w loc_05e96e-loc_05e822
	dc.w loc_05e98c-loc_05e822
	dc.w loc_05e9e8-loc_05e822
	dc.w loc_05ea00-loc_05e822

	dc.w loc_05ea3a-loc_05e822
	dc.w loc_05ea4c-loc_05e822
	dc.w loc_05ea78-loc_05e822
	dc.w loc_05ea8c-loc_05e822

;----------------------------------------------
loc_05e83a:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b d0,($16,a6)
	move.b d0,($5b,a6)
	move.b d0,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_05e876:
	tst.b ($35,a6)
	beq.b loc_05e898
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05e88a
	moveq #1,d0

loc_05e88a:
	move.b d0,($ab,a6)
	moveq #-$26,d0
	moveq #$35,d1
	jsr loc_082e36

loc_05e898:
	jmp loc_02a7ea

;----------------------------------------------
loc_05e89e:
	tst.b ($35,a6)
	bne.b loc_05e8e4
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05e8de
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	move.b loc_05e8ee(pc,d1.w),d1
	move.l loc_05e8f2(pc,d1.w),($40,a6)
	move.l loc_05e8f2+4(pc,d1.w),($48,a6)
	move.l loc_05e8f2+8(pc,d1.w),($44,a6)
	move.l loc_05e8f2+$c(pc,d1.w),($4c,a6)

loc_05e8de:
	move.b loc_05e8ea(pc,d0.w),($25d,a6)

loc_05e8e4:
	jmp loc_02a7ea


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05e8ea:
	dc.b $05,$0a,$11,$00

loc_05e8ee:
	dc.b $00,$10,$20,$20

loc_05e8f2:
	dc.l $00030000,$00000000,$00060000,$ffff4000
	dc.l $00040000,$00000000,$00060000,$ffff4000
	dc.l $00050000,$00000000,$00060000,$ffff4000

;----------------------------------------------
loc_05e922:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05f774
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$18,d0
	tst.b ($b,a6)
	bne.b loc_05e960
	neg.w d0

loc_05e960:
	add.w d0,($10,a6)
	move.b #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_05e96e:
	tst.b ($33,a6)
	bpl.w loc_05f774
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2f,d0
	jmp loc_02a758

;----------------------------------------------
loc_05e98c:
	tst.b ($33,a6)
	bpl.w loc_05f774
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bmi.b loc_05e9da
	tst.b ($31,a4)
	bpl.b loc_05e9da
	addq.b #2,(7,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff4000,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$1000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$32,d0
	jmp loc_02a758

loc_05e9da:
	move.b #$16,(7,a6)
	move.b #$1e,($3a,a6)
	rts

;----------------------------------------------
loc_05e9e8:
	tst.b ($35,a6)
	bne.w loc_05f774
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05ea00:
	bsr.w loc_05f4e6
	tst.l ($40,a6)
	bpl.w loc_05ea30
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$fffc0000,($44,a6)
	move.l #$ffffc000,($4c,a6)
	jmp loc_02a7ea

loc_05ea30:
	tst.b ($35,a6)
	beq.w loc_05f774
	rts

;----------------------------------------------
loc_05ea3a:
	tst.b ($35,a6)
	bmi.w loc_05f774
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05ea4c:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05ea6e
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_05ea6e:
	tst.b ($35,a6)
	beq.w loc_05f774
	rts

;----------------------------------------------
loc_05ea78:
	tst.b ($33,a6)
	bmi.w loc_05f780
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_05ea8c:
	subq.b #1,($3a,a6)
	beq.w loc_05f77a
	rts

;==============================================
;Alpha Counter
;==============================================
loc_05ea96:
	move.b (7,a6),d0
	move.w loc_05eaa2(pc,d0.w),d1
	jmp loc_05eaa2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05eaa2:
	dc.w loc_05eaa6-loc_05eaa2
	dc.w loc_05ead6-loc_05eaa2

;----------------------------------------------
loc_05eaa6:
	tst.b ($33,a6)
	bpl.b loc_05eac0
	addq.b #2,(7,a6)
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_05eaba
	moveq #$d,d0

loc_05eaba:
	jmp loc_02a758

loc_05eac0:
	tst.b ($35,a6)
	beq.b loc_05ead0
	clr.b ($35,a6)
	jsr loc_080e8e

loc_05ead0:
	jmp loc_02a7ea

;----------------------------------------------
loc_05ead6:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02baf2

;==============================================
;Headbutt
;==============================================
loc_05eae4:
	move.b (7,a6),d0
	move.w loc_05eaf0(pc,d0.w),d1
	jmp loc_05eaf0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05eaf0:
	dc.w loc_05eafc-loc_05eaf0
	dc.w loc_05eb52-loc_05eaf0
	dc.w loc_05eb7a-loc_05eaf0
	dc.w loc_05eba8-loc_05eaf0
	dc.w loc_05ebd2-loc_05eaf0
	dc.w loc_05ebf2-loc_05eaf0

;----------------------------------------------
loc_05eafc:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($5b,a6)
	move.w d0,($16,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	move.w d0,d1
	add.w d1,d1
	move.l loc_05eb46(pc,d1.w),($40,a6)
	lsr.b #1,d0
	addi.w #8,d0
	jsr loc_02a758
	bra.b loc_05eb52

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05eb46:
	dc.l $00060000,$00080000,$000a0000

;----------------------------------------------
loc_05eb52:
	tst.b ($5b,a6)
	bne.w loc_05ec06
	tst.b ($35,a6)
	beq.b loc_05eb74
	addq.b #2,(7,a6)
	move.b #$a,($3b,a6)
	clr.l ($44,a6)
	move.b #1,($31,a6)

loc_05eb74:
	jmp loc_02a7ea

;----------------------------------------------
loc_05eb7a:
	tst.b ($5b,a6)
	beq.b loc_05eb86
	addq.b #2,(7,a6)
	rts

loc_05eb86:
	subq.b #1,($3b,a6)
	bne.b loc_05eba0
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_05eba4(pc,d0.w),($3b,a6)
	clr.b ($5b,a6)

loc_05eba0:
	bra.w loc_05f4e6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05eba4:
	dc.b $09,$0c,$28,00

;----------------------------------------------
loc_05eba8:
	tst.b ($5b,a6)
	bne.w loc_05ec06
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.w loc_05ebca
	tst.b ($298,a6)
	bne.w loc_05ec06
	subq.b #1,($3b,a6)
	bne.b loc_05ebce

loc_05ebca:
	addq.b #4,(7,a6)

loc_05ebce:
	bra.w loc_05f4e6

;----------------------------------------------
loc_05ebd2:
	bsr.w loc_05f4e6
	cmpi.b #2,($35,a6)
	bne.w loc_05f774
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	clr.b ($35,a6)
	rts

;----------------------------------------------
loc_05ebf2:
	tst.b ($33,a6)
	bmi.w loc_05f77a
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_05ec06:
	move.b #8,(7,a6)
	move.l #$fffc0000,($40,a6)
	move.l #0,($44,a6)
	move.l #$2000,($48,a6)
	move.l #0,($4c,a6)
	rts

;==============================================
;Butt Drop
;==============================================
loc_05ec2e:
	move.b (7,a6),d0
	move.w loc_05ec3a(pc,d0.w),d1
	jmp loc_05ec3a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ec3a:
	dc.w loc_05ec46-loc_05ec3a
	dc.w loc_05ecc0-loc_05ec3a
	dc.w loc_05ecd8-loc_05ec3a
	dc.w loc_05ed12-loc_05ec3a
	dc.w loc_05ed24-loc_05ec3a
	dc.w loc_05ed54-loc_05ec3a

;----------------------------------------------
loc_05ec46:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	move.b loc_05ec8c(pc,d1.w),d1
	move.l loc_05ec90(pc,d1.w),($40,a6)
	move.l loc_05ec90+4(pc,d1.w),($48,a6)
	move.l loc_05ec90+8(pc,d1.w),($44,a6)
	move.l loc_05ec90+$c(pc,d1.w),($4c,a6)
	addi.w #$29,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ec8c:
	dc.b $00,$10,$20,$20

loc_05ec90:
	dc.l $00080000,$ffff8000,$00040000,$00001000
	dc.l $000b8000,$ffff4800,$00050000,$00001000
	dc.l $000ec000,$ffff1400,$0005c000,$00001000

;----------------------------------------------
loc_05ecc0:
	tst.b ($35,a6)
	bne.w loc_05f774
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05ecd8:
	bsr.w loc_05f4e6
	tst.l ($40,a6)
	bpl.w loc_05ed08
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$fffc0000,($44,a6)
	move.l #$ffffb400,($4c,a6)
	jmp loc_02a7ea

loc_05ed08:
	tst.b ($35,a6)
	beq.w loc_05f774
	rts

;----------------------------------------------
loc_05ed12:
	tst.b ($35,a6)
	bmi.w loc_05f774
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_05ed24:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05ed4a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	clr.b ($31,a6)

loc_05ed4a:
	tst.b ($35,a6)
	beq.w loc_05f774
	rts

;----------------------------------------------
loc_05ed54:
	tst.b ($33,a6)
	bmi.w loc_05f780
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;100 hand slap
;==============================================
loc_05ed68:
	move.b (7,a6),d0
	move.w loc_05ed74(pc,d0.w),d1
	jmp loc_05ed74(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ed74:
	dc.w loc_05ed7c-loc_05ed74
	dc.w loc_05eda8-loc_05ed74
	dc.w loc_05ee22-loc_05ed74
	dc.w loc_05eef6-loc_05ed74

;----------------------------------------------
loc_05ed7c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b ($247,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$10,d0
	jmp loc_02a758

;----------------------------------------------
loc_05eda8:
	tst.b ($35,a6)
	beq.w loc_05f774
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($6b,a6)
	move.b d0,($6c,a6)
	move.b d0,($6d,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b #4,($3a,a6)
	move.b #2,($3b,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05edfa(pc,d0.w),($40,a6)
	move.l loc_05edfa+4(pc,d0.w),($48,a6)
	tst.b ($125,a6)
	beq.b loc_05edf8
	move.b ($81,a6),d0
	move.b loc_05ee12(pc,d0.w),($3a,a6)

loc_05edf8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05edfa:
	dc.l $00000000,$00000000
	dc.l $00084000,$ffff8000
	dc.l $000b0000,$ffff5000

loc_05ee12:
	dc.b $00,$02,$04,$06,$08,$0a,$0c,$0e
	dc.b $10,$12,$14,$16,$18,$1a,$1c,$1e

;----------------------------------------------
loc_05ee22:
	bsr.w loc_05ef04
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_05eede
	jsr loc_02af7a
	bne.w loc_05eede
	tst.b ($125,a6)
	bne.w loc_05ee76
	tst.b ($3a,a6)
	beq.b loc_05ee76
	subq.b #1,($3a,a6)
	move.b ($378,a6),d0
	andi.w #7,d0
	beq.b loc_05ee76
	addq.b #1,($6b,a6)
	move.b ($6b,a6),d1
	cmpi.b #5,d1
	bne.b loc_05ee70
	move.b #1,($6d,a6)

loc_05ee70:
	move.b #4,($3a,a6)

loc_05ee76:
	tst.b ($33,a6)
	bpl.w loc_05f774
	cmpi.b #1,($32,a6)
	bne.w loc_05f774
	subq.b #1,($3b,a6)
	bne.w loc_05f774
	addq.b #1,($6c,a6)
	cmpi.b #3,($6c,a6)
	bcc.b loc_05eede
	tst.b ($6d,a6)
	beq.b loc_05eede
	tst.b ($3a,a6)
	beq.b loc_05eede
	jsr loc_02f770
	jsr loc_020674
	move.b #1,($247,a6)
	clr.b ($6d,a6)
	clr.b ($6b,a6)
	move.b #4,($3a,a6)
	move.b #1,($3b,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$13,d0
	jmp loc_02a758

loc_05eede:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$16,d0
	jmp loc_02a758

;----------------------------------------------
loc_05eef6:
	tst.b ($33,a6)
	bmi.w loc_05f780
	jmp loc_02a7ea

;==============================================
loc_05ef04:
	move.l ($40,a6),d0
	beq.b loc_05ef20
	add.l ($48,a6),d0
	bmi.b loc_05ef18
	move.l d0,($40,a6)
	bra.w loc_05f4e6

loc_05ef18:
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_05ef20:
	rts

;==============================================
;Taunt used as an intro too
;==============================================
loc_05ef22:
	move.b (7,a6),d0
	move.w loc_05ef2e(pc,d0.w),d1
	jmp loc_05ef2e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05ef2e:
	dc.w loc_05ef34-loc_05ef2e
	dc.w loc_05ef5c-loc_05ef2e
	dc.w loc_05efa8-loc_05ef2e

;----------------------------------------------
loc_05ef34:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_05ef50
	cmpi.b #$e,(6,a6)
	bne.b loc_05ef50
	subq.b #1,($bc,a6)

loc_05ef50:
	clr.b ($2c8,a6)
	moveq #$e,d0
	jmp loc_02a758

;----------------------------------------------
loc_05ef5c:
	tst.b ($35,a6)
	beq.w loc_05efa2
	addq.b #2,(7,a6)
	jsr loc_01c2c8
	beq.w loc_05efa2
	addq.b #1,(a4)
	move.b #$3c,(2,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.l ($18,a6),($18,a4)
	move.w a6,($36,a4)

loc_05efa2:
	jmp loc_02a7ea

;----------------------------------------------
loc_05efa8:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02baf2

;==============================================
;Oicho
;==============================================
loc_05efb6:
	move.b (7,a6),d0
	move.w loc_05efc2(pc,d0.w),d1
	jmp loc_05efc2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05efc2:
	dc.w loc_05efd0-loc_05efc2
	dc.w loc_05efea-loc_05efc2
	dc.w loc_05f038-loc_05efc2
	dc.w loc_05f046-loc_05efc2
	dc.w loc_05f0bc-loc_05efc2
	dc.w loc_05f156-loc_05efc2
	dc.w loc_05f1b2-loc_05efc2

;----------------------------------------------
loc_05efd0:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_05efea:
	tst.b ($33,a6)
	bpl.w loc_05f774
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$55,d0
	jsr loc_02e3fe
	beq.w loc_05f02c
	move.b #6,(7,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	moveq #7,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_05f02c:
	addq.b #2,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f038:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02baf2

;----------------------------------------------
loc_05f046:
	tst.b ($35,a6)
	beq.b loc_05f08c
	bmi.w loc_05f07a
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.l #$20000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff8000,($4c,a6)
	rts

loc_05f07a:
	clr.b ($35,a6)
	moveq #$58,d0
	jsr loc_02e970
	move.b #$18,($123,a5)

loc_05f08c:
	movea.w ($38,a6),a4
	move.l #$40000,($40,a4)
	move.l #$ffffa000,($48,a4)
	move.l #$20000,($44,a4)
	move.l #$ffff4000,($4c,a4)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_05f0bc:
	bsr.w loc_05f510
	move.w #$27,d0
	cmp.w ($14,a4),d0
	blt.w loc_05f0ee
	move.l #0,($40,a4)
	move.l #0,($44,a4)
	move.l #0,($48,a4)
	move.l #0,($4c,a4)
	moveq #0,d0

loc_05f0ee:
	bsr.w loc_05f4e6
	move.w #$fff8,d0
	cmp.w ($14,a6),d0
	blt.w loc_05f774
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$61,d0
	jsr loc_02e970
	movea.w ($38,a6),a4
	moveq #4,d1
	moveq #$2e,d0
	jsr loc_02a838
	addq.b #2,(7,a6)
	move.b #$30,($123,a5)
	move.w #$fff8,d0
	addi.w #$10,d0
	move.w d0,($14,a6)
	moveq #$58,d0
	jsr loc_080b70
	moveq #$20,d0
	jsr loc_0038e4
	addi.w #$30,($14,a6)
	moveq #$2d,d0
	jsr loc_02a758
	jmp loc_02a7ea

;----------------------------------------------
loc_05f156:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05f1ac
	movea.w ($38,a6),a4
	move.b #1,($279,a4)
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$50,d0
	tst.b ($b,a6)
	bne.b loc_05f17e
	neg.w d0

loc_05f17e:
	add.w d0,($10,a6)
	move.l #$20000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$55,d0
	jsr loc_02e7f2

loc_05f1ac:
	jmp loc_02a8c6

;----------------------------------------------
loc_05f1b2:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05f774
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	jmp loc_02baf2

;==============================================
;Super Oicho
;==============================================
loc_05f1dc:
	move.b (7,a6),d0
	move.w loc_05f1e8(pc,d0.w),d1
	jmp loc_05f1e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f1e8:
	dc.w loc_05f1fe-loc_05f1e8
	dc.w loc_05f222-loc_05f1e8
	dc.w loc_05f24a-loc_05f1e8
	dc.w loc_05f280-loc_05f1e8
	dc.w loc_05f2ba-loc_05f1e8
	dc.w loc_05f2c8-loc_05f1e8
	dc.w loc_05f33e-loc_05f1e8
	dc.w loc_05f392-loc_05f1e8

	dc.w loc_05f404-loc_05f1e8
	dc.w loc_05f470-loc_05f1e8
	dc.w loc_05f4c2-loc_05f1e8

;----------------------------------------------
loc_05f1fe:
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$1d,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f222:
	tst.b ($35,a6)
	beq.b loc_05f244
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05f236
	moveq #1,d0

loc_05f236:
	move.b d0,($ab,a6)
	moveq #-$48,d0
	moveq #$42,d1
	jsr loc_082e36

loc_05f244:
	jmp loc_02a7ea

;----------------------------------------------
loc_05f24a:
	tst.b ($35,a6)
	bne.w loc_05f774
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05f26e
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05f26e:
	move.b loc_05f27c(pc,d0.w),($25d,a6)
	moveq #3,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f27c:
	dc.b $00,00,00,00

;----------------------------------------------
loc_05f280:
	tst.b ($33,a6)
	bpl.w loc_05f774
	moveq #$46,d0
	jsr loc_02e3fe
	beq.w loc_05f2ae
	move.b #$a,(7,a6)
	jsr loc_080668
	moveq #$1e,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_05f2ae:
	addq.b #2,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f2ba:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02baf2

;----------------------------------------------
loc_05f2c8:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bmi.w loc_05f326
	beq.w loc_05f76e
	addq.b #2,(7,a6)
	clr.b ($34,a6)
	move.b #1,($31,a6)
	clr.l ($48,a6)
	move.l #$10000,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05f30e(pc,d0.w),($44,a6)
	move.l loc_05f30e+4(pc,d0.w),($4c,a6)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f30e:
	dc.l $00060000,$ffff8000
	dc.l $00070000,$ffff8000
	dc.l $00080000,$ffff8000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05f326:
	clr.b ($34,a6)
	moveq #$47,d0
	jsr loc_02e970
	move.b #$18,($123,a5)
	jmp loc_02f9be

;----------------------------------------------
loc_05f33e:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05f36a
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

loc_05f36a:
	tst.b ($34,a6)
	bne.b loc_05f376
	jsr loc_02a7ea

loc_05f376:
	moveq #0,d0
	move.b ($35,a6),d0
	clr.b ($35,a6)
	tst.b ($b,a6)
	bne.b loc_05f388
	neg.w d0

loc_05f388:
	add.w d0,($10,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_05f392:
	tst.b ($35,a6)
	beq.b loc_05f3d4
	bmi.w loc_05f3c2
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.l ($48,a6)
	move.l #$20000,($40,a6)
	move.l #$c0000,($44,a6)
	move.l #$ffff4000,($4c,a6)
	rts

loc_05f3c2:
	clr.b ($35,a6)
	moveq #$47,d0
	jsr loc_02e970
	move.b #$18,($123,a5)

loc_05f3d4:
	movea.w ($38,a6),a4
	move.l #$40000,($40,a4)
	move.l #$ffffa000,($48,a4)
	move.l #$20000,($44,a4)
	move.l #$ffff4000,($4c,a4)
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_05f404:
	bsr.w loc_05f510
	cmpi.w #$28,($14,a4)
	bcc.w loc_05f42e
	move.w ($64,a4),($14,a4)
	moveq #0,d0
	move.l d0,($40,a4)
	move.l d0,($44,a4)
	move.l d0,($48,a4)
	move.l d0,($4c,a4)
	move.w d0,($16,a4)

loc_05f42e:
	bsr.w loc_05f4e6
	moveq #-8,d0
	cmp.w ($14,a6),d0
	blt.w loc_05f774
	addq.b #2,(7,a6)
	move.b #$30,($123,a5)
	moveq #$48,d0
	jsr loc_02e970
	movea.w ($38,a6),a4
	moveq #4,d1
	moveq #$2e,d0
	jsr loc_02a838
	move.w #$38,($14,a6)
	moveq #$2d,d0
	jsr loc_02a758
	jmp loc_02a7ea

;----------------------------------------------
loc_05f470:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05f4bc
	movea.w ($38,a6),a4
	move.b #1,($279,a4)
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$50,d0
	tst.b ($b,a6)
	bne.b loc_05f498
	neg.w d0

loc_05f498:
	add.w d0,($10,a6)
	move.l #$20000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$46,d0
	jsr loc_02e7f2

loc_05f4bc:
	jmp loc_02a8c6

;----------------------------------------------
loc_05f4c2:
	bsr.w loc_05f4e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05f774
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jmp loc_02baf2

;==============================================
loc_05f4e6:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_05f502
	neg.l d0

loc_05f502:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_05f510:
	move.l ($44,a4),d0
	add.l d0,($14,a4)
	move.l ($4c,a4),d0
	add.l d0,($44,a4)
	move.l ($40,a4),d0
	tst.b ($b,a4)
	bne.b loc_05f52c
	neg.l d0

loc_05f52c:
	add.l d0,($10,a4)
	move.l ($48,a4),d0
	add.l d0,($40,a4)
	rts

;##############################################
;Throws
;##############################################
loc_05f53a:
	cmpi.b #4,($80,a6)
	beq.w loc_05f6e4
	move.b (7,a6),d0
	move.w loc_05f550(pc,d0.w),d1
	jmp loc_05f550(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f550:
	dc.w loc_05f55e-loc_05f550
	dc.w loc_05f572-loc_05f550
	dc.w loc_05f602-loc_05f550
	dc.w loc_05f610-loc_05f550
	dc.w loc_05f62e-loc_05f550
	dc.w loc_05f650-loc_05f550
	dc.w loc_05f6d2-loc_05f550

;----------------------------------------------
loc_05f55e:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f572:
	tst.b ($33,a6)
	bpl.w loc_05f774
	moveq #$4c,d0
	tst.b ($81,a6)
	beq.b loc_05f584
	moveq #$4d,d0

loc_05f584:
	jsr loc_02e3fe
	beq.w loc_05f5f6
	tst.b ($125,a6)
	beq.b loc_05f5ae
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_05f5c2
	bra.b loc_05f5c6

loc_05f5ae:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_05f5c6
	clr.b ($b,a6)
	btst #1,d0
	beq.b loc_05f5c6

loc_05f5c2:
	addq.b #1,($b,a6)

loc_05f5c6:
	move.b #6,(7,a6)
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_05f5f0
	move.w #$b4,($ae,a6)
	clr.w ($3a,a6)
	clr.b ($6a,a6)
	eori.b #1,($b,a6)
	move.b #$a,(7,a6)
	moveq #1,d0

loc_05f5f0:
	jmp loc_02a758

loc_05f5f6:
	addq.b #2,(7,a6)
	moveq #4,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f602:
	tst.b ($33,a6)
	bpl.w loc_05f774
	jmp loc_02baf2

;----------------------------------------------
loc_05f610:
	tst.b ($35,a6)
	beq.b loc_05f622
	addq.b #2,(7,a6)
	moveq #$4c,d0
	jmp loc_02e7f2

loc_05f622:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_05f62e:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_05f77a
	cmpi.b #2,($35,a6)
	bne.b loc_05f64e
	clr.b ($35,a6)
	eori.b #1,($b,a6)

loc_05f64e:
	rts

;----------------------------------------------
loc_05f650:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_05f67a
	clr.b ($35,a6)
	moveq #$5e,d0
	tst.b ($3e,a6)
	bne.b loc_05f66e
	tst.b ($6a,a6)
	bne.b loc_05f672
	moveq #$59,d0

loc_05f66e:
	st.b ($6a,a6)

loc_05f672:
	jsr loc_02e970
	bne.b loc_05f69c

loc_05f67a:
	jsr loc_02ea06
	tst.b ($6a,a6)
	beq.w loc_05f768
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_05f69c
	jsr loc_02ea7a
	beq.w loc_05f768

loc_05f69c:
	addq.b #2,(7,a6)
	moveq #$4d,d0
	jsr loc_02e7f2
	move.b #1,($de,a6)
	cmpi.b #1,($132,a6)
	bne.b loc_05f6ca
	tst.b ($b9,a6)
	beq.b loc_05f6ca
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bmi.b loc_05f6ca
	clr.b ($2ca,a4)

loc_05f6ca:
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f6d2:
	tst.b ($33,a6)
	bpl.w loc_05f774
	clr.b ($de,a6)
	jmp loc_02baf2

;==============================================
;Air throw
;==============================================
loc_05f6e4:
	move.b (7,a6),d0
	move.w loc_05f6f6(pc,d0.w),d1
	jsr loc_05f6f6(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05f6f6:
	dc.w loc_05f6fc-loc_05f6f6
	dc.w loc_05f728-loc_05f6f6
	dc.w loc_05f74c-loc_05f6f6

;----------------------------------------------
loc_05f6fc:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$60,d0
	jsr loc_02e636
	beq.b loc_05f71c
	move.b #4,(7,a6)
	moveq #$2c,d0
	jmp loc_02a758

loc_05f71c:
	addq.b #2,(7,a6)
	moveq #6,d0
	jmp loc_02a758

;----------------------------------------------
loc_05f728:
	jsr loc_02aa08
	bcc.w loc_05f774
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_05f74c:
	tst.b ($35,a6)
	beq.w loc_05f774
	move.b #2,(7,a6)
	moveq #$60,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_05f768:
	jsr loc_02a7ea

;==============================================
loc_05f76e:
	jmp loc_02f9be

;==============================================
loc_05f774:
	jmp loc_02a7ea

;==============================================
loc_05f77a:
	jmp loc_02baf2

;==============================================
loc_05f780:
	jmp loc_02bb26

;##############################################
;
;##############################################
loc_05f786:
	rts

;==============================================
loc_05f788:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;##############################################
;
;##############################################
loc_05f7a0:
	dc.w loc_05f7e8-loc_05f7a0
	dc.w loc_05f7e8-loc_05f7a0
	dc.w loc_05f7a6-loc_05f7a0

loc_05f7a6:
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02


loc_05f7e8:
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02