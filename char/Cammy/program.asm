;##############################################################################
;
;##############################################################################
loc_05ad60:
	rts

;##############################################################################
;
;##############################################################################
loc_05ad62:
	move.b (6,a6),d0
	move.w loc_05ad6e(pc,d0.w),d1
	jmp loc_05ad6e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ad6e:
	dc.w loc_05ad76-loc_05ad6e
	dc.w loc_05adb8-loc_05ad6e
	dc.w loc_05adf2-loc_05ad6e
	dc.w loc_05ae26-loc_05ad6e

;==============================================================================
loc_05ad76:
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	bne.b loc_05ad98
	move.b #2,(6,a6)
	tst.b ($125,a4)
	bne.b loc_05adb8
	move.b #6,(6,a6)
	bra.w loc_05ae26

loc_05ad98:
	jsr RNGFunction
	andi.w #1,d0
	beq.b loc_05adae
	move.b #2,(6,a6)
	bra.w loc_05adb8

loc_05adae:
	move.b #4,(6,a6)
	bra.w loc_05adf2

;==============================================================================
loc_05adb8:
	move.b (7,a6),d0
	move.w loc_05adc4(pc,d0.w),d1
	jmp loc_05adc4(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05adc4:
	dc.w loc_05adc8-loc_05adc4
	dc.w loc_05adda-loc_05adc4

;------------------------------------------------------------------------------
loc_05adc8:
	addq.b #2,(7,a6)
	jsr loc_0a3f88
	moveq #$22,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_05adda:
	tst.b ($33,a6)
	bpl.w loc_05daac
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================================================
loc_05adf2:
	move.b (7,a6),d0
	move.w loc_05adfe(pc,d0.w),d1
	jmp loc_05adfe(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05adfe:
	dc.w loc_05ae02-loc_05adfe
	dc.w loc_05ae0e-loc_05adfe

;------------------------------------------------------------------------------
loc_05ae02:
	addq.b #2,(7,a6)
	moveq #0,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05ae0e:
	tst.b ($33,a6)
	bpl.w loc_05daac
	move.l #$2000000,(4,a6)
	moveq #$0,d0
	jmp loc_02a708

;==============================================================================
loc_05ae26:
	move.b (7,a6),d0
	move.w loc_05ae32(pc,d0.w),d1
	jmp loc_05ae32(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ae32:
	dc.w loc_05ae36-loc_05ae32
	dc.w loc_05ae42-loc_05ae32

;------------------------------------------------------------------------------
loc_05ae36:
	addq.b #2,(7,a6)
	moveq #$32,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_05ae42:
	tst.b ($33,a6)
	bpl.w loc_05daac
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################################################
;Normals
;##############################################################################
loc_05ae5a:
	tst.b ($80,a6)
	bne.w loc_05af58
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_05aee2
	move.b (7,a6),d0
	move.w loc_05ae7a(pc,d0.w),d1
	jmp loc_05ae7a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ae7a:
	dc.w loc_05ae7e-loc_05ae7a
	dc.w loc_05aedc-loc_05ae7a

;------------------------------------------------------------------------------
loc_05ae7e:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #1,d0
	tst.b ($125,a6)
	bne.b loc_05aeba
	cmpi.b #1,($132,a6)
	bne.b loc_05aeba
	btst.b #0,($83,a6)
	bne.b loc_05aeca
	bra.b loc_05aecc

loc_05aeba:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_05aed6(pc,d1.w),d1
	cmp.w ($21c,a6),d1
	bcs.b loc_05aecc

loc_05aeca:
	moveq #0,d0

loc_05aecc:
	add.b ($82,a6),d0
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05aed6:
	dc.w $0030,$002c,$0028

;------------------------------------------------------------------------------
loc_05aedc:
	jmp loc_02f5ac

;==============================================================================
;Kicks
;==============================================================================
loc_05aee2:
	move.b (7,a6),d0
	move.w loc_05aeee(pc,d0.w),d1
	jmp loc_05aeee(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05aeee:
	dc.w loc_05aef2-loc_05aeee
	dc.w loc_05af52-loc_05aeee

;------------------------------------------------------------------------------
loc_05aef2:
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
	bne.b loc_05af32
	cmpi.b #1,($132,a6)
	bne.b loc_05af32
	btst.b #0,($83,a6)
	bne.b loc_05af46
	bra.b loc_05af44

loc_05af32:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_05af4c(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_05af46

loc_05af44:
	addq.b #1,d0

loc_05af46:
	jmp loc_02a710

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05af4c:
	dc.w $0030,$0040,$0038

;------------------------------------------------------------------------------
loc_05af52:
	jmp loc_02f5ac

;==============================================================================
;Crouching
;==============================================================================
loc_05af58:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_05af6a(pc,d0.w),d1
	jmp loc_05af6a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05af6a:
	dc.w loc_05af6e-loc_05af6a
	dc.w loc_05afa4-loc_05af6a

;------------------------------------------------------------------------------
loc_05af6e:
	addq.b #2,(7,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_05af9a
	addq.b #3,d1

loc_05af9a:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;------------------------------------------------------------------------------
loc_05afa4:
	jmp loc_02f5ac

;##############################################################################
;Air Normals
;##############################################################################
loc_05afaa:
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
	beq.b loc_05afda
	moveq #$18,d0

loc_05afda:
	tst.b ($81,a6)
	beq.b loc_05afe2
	addq.w #3,d0

loc_05afe2:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################################################
;Special Move Inputs
;##############################################################################
loc_05aff0:
	jsr loc_02e096
	bne.w loc_05b0c4

loc_05affa:
	lea.l ($1b8,a6),a4
	jsr loc_02d782
	bne.w loc_05b32c

loc_05b008:
	lea.l ($1b0,a6),a4
	jsr loc_02d6b2
	bne.w loc_05b2f0

loc_05b016:
	lea.l ($1a0,a6),a4
	jsr loc_02d69a
	bne.w loc_05b2b2

loc_05b024:
	lea.l ($1c0,a6),a4
	jsr loc_02d60a
	bne.w loc_05b26a

loc_05b032:
	lea.l ($180,a6),a4
	jsr loc_02d622
	bne.w loc_05b128

loc_05b040:
	lea.l ($188,a6),a4
	jsr loc_02d5f2
	bne.w loc_05b1a6

loc_05b04e:
	lea.l ($198,a6),a4
	jsr loc_02d64a
	bne.w loc_05b240

loc_05b05c:
	lea.l ($190,a6),a4
	jsr loc_02d672
	bne.w loc_05b20c

loc_05b06a:
	lea.l ($1a8,a6),a4
	jsr loc_02d612
	bne.w loc_05b152

loc_05b078:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_05b370

loc_05b086:
	jsr loc_02e0cc
	bne.w loc_05b094

loc_05b090:
	moveq #0,d0
	rts

;------------------------------------------------------------------------------
;Move ID writes
;------------------------------------------------------------------------------
loc_05b094:
	tst.b ($b9,a6)
	bne.b loc_05b0a0
	tst.b ($bc,a6)
	beq.b loc_05b090

loc_05b0a0:
	jsr loc_02ed00
	beq.b loc_05b090
	move.l #$02000e00,(4,a6)
	move.b #0,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	rts

;------------------------------------------------------------------------------
loc_05b0c4:
	tst.b ($28a,a6)
	bne.w loc_05affa
	tst.b ($31,a6)
	bne.w loc_05b102
	jsr loc_02ef54
	beq.w loc_05affa
	jsr loc_02ecd8
	beq.w loc_05affa
	move.l #$02001000,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_05b102:
	tst.b ($b9,a6)
	bne.w loc_05affa
	jsr loc_02ed28
	beq.w loc_05affa
	move.l #$02001000,(4,a6)
	move.b #2,($aa,a6)
	jmp loc_02f980

;------------------------------------------------------------------------------
loc_05b128:
	jsr loc_02ed00
	beq.w loc_05b040
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;------------------------------------------------------------------------------
loc_05b152:
	cmpi.b #1,($132,a6)
	bne.w loc_05b078
	tst.b ($31,a6)
	beq.w loc_05b078
	tst.b ($3c,a6)
	ble.w loc_05b078
	moveq #$40,d0
	tst.w ($44,a6)
	bpl.b loc_05b176
	moveq #$58,d0

loc_05b176:
	add.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_05b078
	jsr loc_02ed28
	beq.w loc_05b078
	move.l #$02000e00,(4,a6)
	move.b #$12,($aa,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;------------------------------------------------------------------------------
loc_05b1a6:
	jsr loc_02ed00
	beq.w loc_05b04e
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

loc_05b1d0:
	cmpi.b #1,($132,a6)
	bne.w loc_05b04e
	tst.w ($44,a6)
	bmi.w loc_05b04e
	jsr loc_02ed28
	beq.w loc_05b04e
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f74c

;------------------------------------------------------------------------------
loc_05b20c:
	cmpi.b #1,($132,a6)
	beq.w loc_05b06a
	jsr loc_02ed00
	beq.w loc_05b06a
	move.l #$02000e00,(4,a6)
	move.b #8,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;------------------------------------------------------------------------------
loc_05b240:
	jsr loc_02ed00
	beq.w loc_05b05c
	move.l #$02000e00,(4,a6)
	move.b #$a,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;------------------------------------------------------------------------------
loc_05b26a:
	cmpi.b #1,($132,a6)
	bne.w loc_05b032
	jsr loc_02ed00
	beq.w loc_05b032
	move.l #$02000e00,(4,a6)
	move.b #$18,($aa,a6)
	clr.b ($a9,a1)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;==============================================================================
loc_05b29c:
	move.l #$02000e06,(4,a1)
	move.b #$18,($aa,a1)
	move.b #1,($a9,a6)
	rts

;------------------------------------------------------------------------------
loc_05b2b2:
	cmpi.b #1,($132,a6)
	beq.w loc_05b024
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05b024
	jsr loc_02ecd8
	beq.w loc_05b024
	move.l #$02001000,(4,a6)
	move.b #$c,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;------------------------------------------------------------------------------
loc_05b2f0:
	tst.b ($132,a6)
	bne.w loc_05b016
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05b016
	jsr loc_02ecd8
	beq.w loc_05b016
	move.l #$2001000,(4,a6)
	move.b #$10,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;------------------------------------------------------------------------------
loc_05b32c:
	tst.b ($132,a6)
	bne.w loc_05b008
	cmpi.w #$90,($11e,a6)
	bcs.w loc_05b008
	jsr loc_02ecd8
	beq.w loc_05b008
	move.l #$02001000,(4,a6)
	move.b #$14,($aa,a6)
	move.b #1,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;------------------------------------------------------------------------------
loc_05b370:
	jsr loc_02edf8
	beq.w loc_05b086

;##############################################################################
;Aism Alpha Counter write
;##############################################################################
loc_05b37a:
	tst.b ($132,a6)
	bne.w loc_05b3c2
	move.l #$02000e00,(4,a6)
	move.b #$e,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$14,($5f,a4)
	move.b #$18,($25d,a6)
	moveq #$28,d0
	jmp loc_02a758

;##############################################################################
;Vism Alpha Counter write
;##############################################################################
loc_05b3c2:
	move.l #$02000e0c,(4,a6)
	move.b #4,($aa,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,($82,a6)
	clr.b ($5f,a6)
	move.b ($2c9,a6),($b,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #$28,d0
	jmp loc_02a758

;##############################################################################
;AI Move Checks
;##############################################################################
loc_05b402:
	move.b ($aa,a6),d0
	move.w loc_05b40e(pc,d0.w),d1
	jmp loc_05b40e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b40e:
	dc.w loc_05b428-loc_05b40e
	dc.w loc_05b43c-loc_05b40e
	dc.w loc_05b43c-loc_05b40e
	dc.w loc_05b454-loc_05b40e
	dc.w loc_05b43c-loc_05b40e
	dc.w loc_05b43c-loc_05b40e
	dc.w loc_05b448-loc_05b40e
	dc.w loc_05b43c-loc_05b40e

	dc.w loc_05b440-loc_05b40e
	dc.w loc_05b468-loc_05b40e
	dc.w loc_05b440-loc_05b40e
	dc.w loc_05b440-loc_05b40e
	dc.w loc_05b492-loc_05b40e

;==============================================================================
loc_05b428:
	tst.b ($b9,a6)
	bne.w loc_05b4a0
	tst.b ($bc,a6)
	beq.w loc_05b4a4
	bra.w loc_05b4a0

;==============================================================================
loc_05b43c:
	bra.w loc_05b4a0

;==============================================================================
loc_05b440:
	tst.b ($132,a6)
	bne.w loc_05b4a4

;==============================================================================
loc_05b448:
	cmpi.w #$30,($11e,a6)
	bcs.b loc_05b4a4
	bra.w loc_05b4a0

;==============================================================================
loc_05b454:
	tst.b ($31,a6)
	beq.w loc_05b4a0
	tst.w ($44,a6)
	bmi.w loc_05b4a4
	bra.w loc_05b4a0

;==============================================================================
loc_05b468:
	tst.b ($31,a6)
	beq.w loc_05b4a4
	tst.b ($3c,a6)
	ble.w loc_05b4a4
	moveq #$40,d0
	tst.w ($44,a6)
	bpl.b loc_05b482
	moveq #$58,d0

loc_05b482:
	add.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_05b4a4
	bra.w loc_05b4a0

;==============================================================================
loc_05b492:
	cmpi.b #1,($132,a6)
	bne.w loc_05b4a4
	bra.w loc_05b4a0

;------------------------------------------------------------------------------
loc_05b4a0:
	moveq #1,d0
	rts

;------------------------------------------------------------------------------
loc_05b4a4:
	moveq #0,d0
	rts

;##############################################################################
;Player Special Moves
;##############################################################################
loc_05b4a8:
	move.b ($aa,a6),d0
	move.w loc_05b4b4(pc,d0.w),d1
	jmp loc_05b4b4(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b4b4:
	dc.w loc_05b4f4-loc_05b4b4;00 Taunt
	dc.w loc_05b532-loc_05b4b4;02 Vism Activate
	dc.w loc_05b5b4-loc_05b4b4;04 Cannon Spike
	dc.w loc_05b7de-loc_05b4b4;06 Spiral Arrow
	dc.w loc_05ba28-loc_05b4b4;08 Spin Knuckle
	dc.w loc_05bb4e-loc_05b4b4;0a Holligan Throw
	dc.w loc_05c0f0-loc_05b4b4;0c Spin Drive Smasher
	dc.w loc_05c444-loc_05b4b4;0e Aism AC

	dc.w loc_05c490-loc_05b4b4;10 Reverse Shaft Breaker
	dc.w loc_05c652-loc_05b4b4;12 Cannon Strike
	dc.w loc_05cc48-loc_05b4b4;14 Killer Bee Assualt
	dc.w loc_05c7be-loc_05b4b4;16 Killer Bee Spiral Arrow
	dc.w loc_05d29e-loc_05b4b4;18 Cannon Revenge


;##############################################################################
;AI Special Moves
;##############################################################################
loc_05b4ce:
	move.b ($aa,a6),d0
	move.w loc_05b4da(pc,d0.w),d1
	jmp loc_05b4da(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b4da:
	dc.w loc_05b4f4-loc_05b4da;00 Taunt
	dc.w loc_05b532-loc_05b4da;02 Vism Activate
	dc.w loc_05b5b4-loc_05b4da;04 Cannon Spike
	dc.w loc_05b7de-loc_05b4da;06 Spiral Arrow
	dc.w loc_05ba28-loc_05b4da;08 Spin Knuckle
	dc.w loc_05bb4e-loc_05b4da;0a Holligan Throw
	dc.w loc_05c0f0-loc_05b4da;0c Spin Drive Smasher
	dc.w loc_05c444-loc_05b4da;0e Aism AC

	dc.w loc_05c490-loc_05b4da;10 Reverse Shaft Breaker
	dc.w loc_05c652-loc_05b4da;12 Cannon Strike
	dc.w loc_05cc48-loc_05b4da;14 Killer Bee Assualt
	dc.w loc_05c7be-loc_05b4da;16 Killer Bee Spiral Arrow
	dc.w loc_05d29e-loc_05b4da;18 Cannon Revenge

;==============================================================================
;Taunt
;==============================================================================
loc_05b4f4:
	move.b (7,a6),d0
	move.w loc_05b500(pc,d0.w),d1
	jmp loc_05b500(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b500:
	dc.w loc_05b504-loc_05b500
	dc.w loc_05b524-loc_05b500

;------------------------------------------------------------------------------
loc_05b504:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_05b518
	subq.b #1,($bc,a6)

loc_05b518:
	clr.b ($2c8,a6)
	moveq #0,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05b524:
	tst.b ($33,a6)
	bpl.w loc_05daac
	jmp loc_02baf2

;==============================================================================
;Vism Activate
;==============================================================================
loc_05b532:
	move.b (7,a6),d0
	move.w loc_05b53e(pc,d0.w),d1
	jmp loc_05b53e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b53e:
	dc.w loc_05b544-loc_05b53e
	dc.w loc_05b564-loc_05b53e
	dc.w loc_05b598-loc_05b53e

;------------------------------------------------------------------------------
loc_05b544:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_05b55e
	moveq #$2f,d0

loc_05b55e:
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_05b564:
	tst.b ($34,a6)
	beq.b loc_05b592
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_05b588
	moveq #-5,d0
	moveq #$44,d1

loc_05b588:
	jsr loc_097cd6
	bsr.w loc_05da64

loc_05b592:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05b598:
	subq.b #1,($3a,a6)
	bne.w loc_05daac
	tst.b ($31,a6)
	beq.b loc_05b5ae
	move.l #$02000602,(4,a6)

loc_05b5ae:
	jmp loc_02f796

;==============================================================================
;Cannon Spike
;==============================================================================
loc_05b5b4:
	move.b (7,a6),d0
	move.w loc_05b5c0(pc,d0.w),d1
	jmp loc_05b5c0(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b5c0:
	dc.w loc_05b5ce-loc_05b5c0
	dc.w loc_05b604-loc_05b5c0
	dc.w loc_05b64c-loc_05b5c0
	dc.w loc_05b694-loc_05b5c0
	dc.w loc_05b6f6-loc_05b5c0
	dc.w loc_05b73e-loc_05b5c0
	dc.w loc_05b760-loc_05b5c0

;------------------------------------------------------------------------------
loc_05b5ce:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #6,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05b604:
	tst.b ($35,a6)
	beq.b loc_05b62e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #7,($3b,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05b634(pc,d0.w),($40,a6)
	move.l loc_05b634+4(pc,d0.w),($48,a6)

loc_05b62e:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b634:
	dc.l $00050000,$ffffd000
	dc.l $00060000,$ffffd000
	dc.l $00070000,$ffffd000

;------------------------------------------------------------------------------
loc_05b64c:
	tst.b ($5b,a6)
	bne.w loc_05b78e
	bsr.w loc_05dac0
	subq.b #1,($3b,a6)
	bne.b loc_05b676
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05b67c(pc,d0.w),($44,a6)
	move.l loc_05b67c+4(pc,d0.w),($4c,a6)

loc_05b676:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b67c:
	dc.l $00060000,$ffffa000
	dc.l $00080000,$ffffa000
	dc.l $000a0000,$ffffa000

;------------------------------------------------------------------------------
loc_05b694:
	tst.b ($5b,a6)
	bne.w loc_05b78e
	bsr.w loc_05dada
	bpl.b loc_05b6ac
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_05b6ac:
	tst.w ($44,a6)
	bpl.b loc_05b6d8
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #2,d0
	move.l loc_05b6de(pc,d0.w),($40,a6)
	move.l loc_05b6de+4(pc,d0.w),($48,a6)
	moveq #$c,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jsr loc_02a758

loc_05b6d8:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\:
loc_05b6de:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;------------------------------------------------------------------------------
loc_05b6f6:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b d0,($ce,a6)
	moveq #$c,d0
	jsr loc_02a758
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_05b73a(pc,d0.w),d0
	add.b d0,($32,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b73a:
	dc.b $01,$03,$05,00

;------------------------------------------------------------------------------
loc_05b73e:
	tst.b ($33,a6)
	bpl.b loc_05b754
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_05b754:
	jsr loc_02f6f8
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05b760:
	tst.b ($33,a6)
	bpl.b loc_05b778
	move.b #2,(7,a6)
	clr.b ($5b,a6)
	moveq #2,d0
	jmp loc_02a758

loc_05b778:
	tst.b ($35,a6)
	beq.b loc_05b788
	clr.b ($35,a6)
	jsr loc_080e8e

loc_05b788:
	jmp loc_02a7ea

;==============================================================================
loc_05b78e:
	move.b #8,(7,a6)
	cmpi.b #4,($aa,a6)
	beq.b loc_05b7b0
	move.b #$e,(7,a6)
	cmpi.b #$18,($aa,a6)
	beq.b loc_05b7b0
	move.b #$10,(7,a6)

loc_05b7b0:
	move.l #$ffff4000,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================================================
;Spiral Arrow
;==============================================================================
loc_05b7de:
	move.b (7,a6),d0
	move.w loc_05b7ea(pc,d0.w),d1
	jmp loc_05b7ea(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b7ea:
	dc.w loc_05b7f8-loc_05b7ea
	dc.w loc_05b838-loc_05b7ea
	dc.w loc_05b8ba-loc_05b7ea
	dc.w loc_05b928-loc_05b7ea
	dc.w loc_05b946-loc_05b7ea
	dc.w loc_05b964-loc_05b7ea
	dc.w loc_05b994-loc_05b7ea

;------------------------------------------------------------------------------
loc_05b7f8:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$1a,d0
	tst.b ($31,a6)
	beq.b loc_05b82c
	moveq #$62,d0
	move.b #1,($a,a6)

loc_05b82c:
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05b838:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05b882
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	move.b loc_05b884(pc,d0.w),($3a,a6)
	lsl.w #3,d0
	move.l loc_05b88a(pc,d0.w),($40,a6)
	move.l loc_05b88a+4(pc,d0.w),($44,a6)
	move.l loc_05b88a+8(pc,d0.w),($48,a6)
	move.l loc_05b88a+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_05b882
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_05b882:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b884:
	dc.b $0c,$00,$10,$00,$14,$00

loc_05b88a:
	dc.l $00068000,$00000000,$fffff000,$ffffe800
	dc.l $00078000,$00000000,$fffff000,$ffffe800
	dc.l $00088000,$00000000,$fffff000,$ffffe800

;------------------------------------------------------------------------------
loc_05b8ba:
	tst.b ($a,a6)
	beq.b loc_05b8d0
	tst.b ($5b,a6)
	bmi.w loc_05b9f4
	subq.b #1,($3a,a6)
	bmi.w loc_05b9cc

loc_05b8d0:
	jsr loc_02aa08
	bcc.w loc_05daac
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05b910(pc,d0.w),($40,a6)
	move.l loc_05b910+4(pc,d0.w),($48,a6)
	moveq #$10,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05b910:
	dc.l $00030000,$ffffc000
	dc.l $00030000,$ffffc800
	dc.l $00030000,$ffffd000

;------------------------------------------------------------------------------
loc_05b928:
	bsr.w loc_05dac0
	tst.w ($40,a6)
	bpl.b loc_05b944
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b d0,($ce,a6)

loc_05b944:
	rts

;------------------------------------------------------------------------------
loc_05b946:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_05daac
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;------------------------------------------------------------------------------
loc_05b964:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	move.b #6,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$2c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05b994:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	move.b #6,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l #$ffffc000,($48,a6)
	moveq #$35,d0
	jmp loc_02a758

;==============================================================================
loc_05b9cc:
	move.b #$c,(7,a6)
	move.l #$20000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$34,d0
	jmp loc_02a758

;==============================================================================
loc_05b9f4:
	move.b #$a,(7,a6)
	move.l #$ffff8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================================================
;Spin Knuckle
;==============================================================================
loc_05ba28:
	move.b (7,a6),d0
	move.w loc_05ba34(pc,d0.w),d1
	jmp loc_05ba34(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ba34:
	dc.w loc_05ba3c-loc_05ba34
	dc.w loc_05ba66-loc_05ba34
	dc.w loc_05bacc-loc_05ba34
	dc.w loc_05bb30-loc_05ba34

;------------------------------------------------------------------------------
loc_05ba3c:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$28,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05ba66:
	tst.b ($35,a6)
	bne.b loc_05ba96
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_05ba9c(pc,d0.w),($40,a6)
	move.l loc_05ba9c+4(pc,d0.w),($44,a6)
	move.l loc_05ba9c+8(pc,d0.w),($48,a6)
	move.l loc_05ba9c+$c(pc,d0.w),($4c,a6)

loc_05ba96:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ba9c:
	dc.l $00040000,$00040000,$ffffee00,$ffff9000
	dc.l $00058000,$00044000,$ffffe400,$ffff8800
	dc.l $00060000,$0005c000,$ffffe000,$ffff7000

;------------------------------------------------------------------------------
loc_05bacc:
	tst.b ($35,a6)
	bne.b loc_05bad8
	jsr loc_02a7ea

loc_05bad8:
	bsr.w loc_05dada
	bpl.w loc_05dab2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.w #$18,d0
	tst.b ($b,a6)
	bne.b loc_05bb1a
	neg.w d0

loc_05bb1a:
	add.w d0,($10,a6)
	jsr loc_00369c
	move.b #1,($32,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05bb30:
	tst.b ($33,a6)
	bmi.w loc_05daa0
	tst.b ($35,a6)
	bpl.b loc_05bb42
	clr.b ($ce,a6)

loc_05bb42:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
;Holligan Throw
;==============================================================================
loc_05bb4e:
	move.b (7,a6),d0
	move.w loc_05bb5a(pc,d0.w),d1
	jmp loc_05bb5a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bb5a:
	dc.w loc_05bb6a-loc_05bb5a
	dc.w loc_05bbf2-loc_05bb5a
	dc.w loc_05bc5a-loc_05bb5a
	dc.w loc_05bc72-loc_05bb5a
	dc.w loc_05bd4e-loc_05bb5a
	dc.w loc_05be8c-loc_05bb5a
	dc.w loc_05bfdc-loc_05bb5a
	dc.w loc_05c06e-loc_05bb5a

;------------------------------------------------------------------------------
loc_05bb6a:
	addq.b #2,(7,a6)
	move.l d0,($84,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a9,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	beq.b loc_05bb8c
	move.b #1,($216,a6)

loc_05bb8c:
	movea.w ($38,a6),a4
	move.b ($102,a4),d0
	add.b d0,d0
	move.w loc_05bbb2(pc,d0.w),($6a,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$17,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bbb2:
	dc.w $0036,$0036,$003a,$003c
	dc.w $002b,$003c,$0044,$0039
	dc.w $004c,$003b,$0033,$004f
	dc.w $0039,$0031,$0039,$003a
	dc.w $0043,$0031,$002b,$0031
	dc.w $0044,$003d,$0036,$0036
	dc.w $0030,$0034,$0031,$0040
	dc.w $0042,$002e,$0036,$0036

;------------------------------------------------------------------------------
loc_05bbf2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05bc28
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_05bc2a(pc,d0.w),($40,a6)
	move.l loc_05bc2a+4(pc,d0.w),($44,a6)
	move.l loc_05bc2a+8(pc,d0.w),($48,a6)
	move.l loc_05bc2a+$c(pc,d0.w),($4c,a6)

loc_05bc28:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bc2a:
	dc.l $00020000,$00070000,$00000000,$ffffa800
	dc.l $00050000,$00070000,$fffff000,$ffff9000
	dc.l $00058000,$00058000,$00000000,$ffffa800

;------------------------------------------------------------------------------
loc_05bc5a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05bc70
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)

loc_05bc70:
	rts

;------------------------------------------------------------------------------
loc_05bc72:
	bsr.w loc_05dada
	bpl.b loc_05bca6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05bca6
	move.b #$c,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1a,d0
	jmp loc_02a758

loc_05bca6:
	bsr.w loc_05bd32
	beq.w loc_05daac
	tst.b ($125,a6)
	beq.b loc_05bcc4
	moveq #$59,d0
	jsr loc_02e714
	beq.w loc_05daac
	bra.w loc_05bcfe

loc_05bcc4:
	move.b ($378,a6),d0
	andi.w #$70,d0
	beq.w loc_05daac
	move.b ($371,a6),d0
	andi.b #3,d0
	beq.b loc_05bce8
	moveq #$59,d0
	jsr loc_02e714
	beq.b loc_05bce8
	bra.w loc_05bcfe

loc_05bce8:
	move.b #$e,(7,a6)
	moveq #4,d0
	jsr loc_02ef6c
	moveq #$1b,d0
	jmp loc_02a758

;==============================================================================
loc_05bcfe:
	movea.w ($38,a6),a4
	move.w ($14,a6),d1
	sub.w ($14,a4),d1
	move.b #8,(7,a6)
	moveq #$18,d0
	tst.b ($31,a4)
	bne.b loc_05bd24
	tst.b ($2c8,a4)
	bne.b loc_05bd2c
	cmp.w ($6a,a6),d1
	bcc.b loc_05bd2c

loc_05bd24:
	move.b #$a,(7,a6)
	moveq #$19,d0

loc_05bd2c:
	jmp loc_02a758

;==============================================================================
loc_05bd32:
	tst.w ($44,a6)
	bpl.b loc_05bd4a
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcc.b loc_05bd4a
	moveq #1,d0
	rts

loc_05bd4a:
	moveq #0,d0
	rts

;------------------------------------------------------------------------------
loc_05bd4e:
	move.b ($84,a6),d0
	move.w loc_05bd5a(pc,d0.w),d1
	jmp loc_05bd5a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bd5a:
	dc.w loc_05bd66-loc_05bd5a
	dc.w loc_05bd86-loc_05bd5a
	dc.w loc_05bdc4-loc_05bd5a
	dc.w loc_05be08-loc_05bd5a
	dc.w loc_05be48-loc_05bd5a
	dc.w loc_05be7e-loc_05bd5a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bd66:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.w loc_05daba
	addq.b #2,($84,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bd86:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05bdae
	addq.b #2,($84,a6)
	move.l loc_05bdb4(pc),($40,a6)
	move.l loc_05bdb4+4(pc),($44,a6)
	move.l loc_05bdb4+8(pc),($48,a6)
	move.l loc_05bdb4+$c(pc),($4c,a6)

loc_05bdae:
	jmp loc_02f9be

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bdb4:
	dc.l $00010000,$00040000,$00000000,$ffff9000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bdc4:
	cmpi.b #2,($35,a6)
	beq.b loc_05bdd2
	jsr loc_02a7ea

loc_05bdd2:
	bsr.w loc_05dada
	bpl.b loc_05be02
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05be02
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$5b,d0
	jsr loc_02e970
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05be02:
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05be08:
	addq.b #2,($84,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$60,d0
	jsr loc_02e7f2
	move.l loc_05be38(pc),($40,a6)
	move.l loc_05be38+4(pc),($44,a6)
	move.l loc_05be38+8(pc),($48,a6)
	move.l loc_05be38+$c(pc),($4c,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05be38:
	dc.l $00013000,$00080000,$00000000,$ffff5000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05be48:
	tst.b ($35,a6)
	bne.b loc_05be5a
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05be5a:
	bsr.w loc_05dada
	bpl.w loc_05dab2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab2
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05be7e:
	tst.b ($33,a6)
	bpl.w loc_05daac
	jmp loc_02bb26

;------------------------------------------------------------------------------
loc_05be8c:
	move.b ($84,a6),d0
	move.w loc_05be98(pc,d0.w),d1
	jmp loc_05be98(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05be98:
	dc.w loc_05bea2-loc_05be98
	dc.w loc_05befa-loc_05be98
	dc.w loc_05bf44-loc_05be98
	dc.w loc_05bf68-loc_05be98
	dc.w loc_05bfb0-loc_05be98

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bea2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05bede
	addq.b #2,($84,a6)
	move.b #1,($31,a6)
	move.l loc_05beea(pc),($40,a6)
	move.l loc_05beea+4(pc),($44,a6)
	move.l loc_05beea+8(pc),($48,a6)
	move.l loc_05beea+$c(pc),($4c,a6)
	moveq #$5,d0
	jsr loc_02ef6c
	jmp loc_02f9be

loc_05bede:
	jsr loc_02a7ea
	jmp loc_02fa36

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05beea:
	dc.l $00040000,$00048000,$fffff800,$ffffc800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05befa:
	tst.w ($44,a6)
	bpl.b loc_05bf2e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05bf2e
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea
	jmp loc_02f9be

loc_05bf2e:
	bsr.w loc_05dada
	tst.b ($35,a6)
	bne.b loc_05bf3e
	jsr loc_02a7ea

loc_05bf3e:
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bf44:
	addq.b #2,($84,a6)
	move.b #$16,($123,a5)
	move.b #$10,($3b,a6)
	move.b #1,($2ca,a6)
	moveq #$5a,d0
	jsr loc_02e970
	jmp loc_02f9be

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bf68:
	subq.b #1,($3b,a6)
	bne.w loc_05dab4
	addq.b #2,($84,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$61,d0
	jsr loc_02e7f2
	move.l loc_05bfa0(pc),($40,a6)
	move.l loc_05bfa0+4(pc),($44,a6)
	move.l loc_05bfa0+8(pc),($48,a6)
	move.l loc_05bfa0+$c(pc),($4c,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bfa0:
	dc.l $fffe0000,$00050000,$00000000,$ffffc400

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bfb0:
	tst.b ($35,a6)
	beq.b loc_05bfc2
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05bfc2:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	jmp loc_02bb26

;------------------------------------------------------------------------------
loc_05bfdc:
	move.b ($84,a6),d0
	move.w loc_05bfe8(pc,d0.w),d1
	jmp loc_05bfe8(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05bfe8:
	dc.w loc_05bfee-loc_05bfe8
	dc.w loc_05c028-loc_05bfe8
	dc.w loc_05c04c-loc_05bfe8

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05bfee:
	addq.b #2,($84,a6)
	move.b #1,($2c8,a6)
	move.b #1,($a9,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_05c01c(pc,d0.w),($48,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #3,d0
	jmp loc_02ef6c

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c01c:
	dc.l $ffffc800,$ffffb800,$ffffa800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05c028:
	bsr.w loc_05c0ca
	bne.b loc_05c03e
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_05c03e:
	tst.b ($35,a6)
	bne.w loc_05dab2
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05c04c:
	tst.b ($33,a6)
	bpl.b loc_05c062
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_05c062:
	jsr loc_02f6f8
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05c06e:
	move.b ($84,a6),d0
	move.w loc_05c07a(pc,d0.w),d1
	jmp loc_05c07a(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c07a:
	dc.w loc_05c07e-loc_05c07a
	dc.w loc_05c0a8-loc_05c07a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05c07e:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$1c,d0
	jmp loc_02a758

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_05c0a8:
	tst.b ($33,a6)
	bpl.b loc_05c0be
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

loc_05c0be:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================================================
loc_05c0ca:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_05c0d6
	neg.l d0

loc_05c0d6:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_05c0ee
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_05c0ee:
	rts

;==============================================================================
;Spin Drive Smasher
;==============================================================================
loc_05c0f0:
	move.b (7,a6),d0
	move.w loc_05c0fc(pc,d0.w),d1
	jmp loc_05c0fc(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c0fc:
	dc.w loc_05c110-loc_05c0fc
	dc.w loc_05c13e-loc_05c0fc
	dc.w loc_05c16c-loc_05c0fc
	dc.w loc_05c1fa-loc_05c0fc
	dc.w loc_05c272-loc_05c0fc
	dc.w loc_05c2a0-loc_05c0fc
	dc.w loc_05c310-loc_05c0fc
	dc.w loc_05c386-loc_05c0fc

	dc.w loc_05c3f8-loc_05c0fc
	dc.w loc_05c436-loc_05c0fc

;------------------------------------------------------------------------------
loc_05c110:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$42,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c13e:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_05c166
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05c158
	moveq #1,d0

loc_05c158:
	move.b d0,($ab,a6)
	moveq #-6,d0
	moveq #$16,d1
	jsr loc_082e36

loc_05c166:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05c16c:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_05c1c4
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05c198
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05c198:
	move.b loc_05c1c6(pc,d0.w),($25d,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c1ca(pc,d0.w),($40,a6)
	move.l loc_05c1ca+4(pc,d0.w),($48,a6)
	move.l loc_05c1ca+8(pc,d0.w),($44,a6)
	move.l loc_05c1ca+$c(pc,d0.w),($4c,a6)

loc_05c1c4:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c1c6:
	dc.b $05,$0a,$21,$00

loc_05c1ca:
	dc.l $00048000,$ffffe000,$00020000,$ffffd000
	dc.l $00058000,$ffffe000,$00020000,$ffffd000
	dc.l $00068000,$ffffe000,$00020000,$ffffd000

;------------------------------------------------------------------------------
loc_05c1fa:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c242(pc,d0.w),($40,a6)
	move.l loc_05c242+4(pc,d0.w),($48,a6)
	move.l loc_05c242+8(pc,d0.w),($44,a6)
	move.l loc_05c242+$c(pc,d0.w),($4c,a6)
	moveq #$24,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c242:
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000

;------------------------------------------------------------------------------
loc_05c272:
	bsr.w loc_05dada
	tst.b ($31,a6)
	beq.b loc_05c286
	tst.b ($35,a6)
	beq.b loc_05c286
	clr.b ($31,a6)

loc_05c286:
	tst.w ($40,a6)
	bpl.w loc_05daac
	addq.b #2,(7,a6)
	moveq #$4a,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c2a0:
	tst.b ($35,a6)
	bne.b loc_05c2da
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #5,($3b,a6)
	clr.b ($5b,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c2e0(pc,d0.w),($40,a6)
	move.l loc_05c2e0+4(pc,d0.w),($48,a6)
	move.l loc_05c2e0+8(pc,d0.w),($44,a6)
	move.l loc_05c2e0+$c(pc,d0.w),($4c,a6)

loc_05c2da:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c2e0:
	dc.l $00050000,$00000000,$00000000,$00000000
	dc.l $00068000,$00000000,$00000000,$00000000
	dc.l $00080000,$00000000,$00000000,$00000000

;------------------------------------------------------------------------------
loc_05c310:
	bsr.w loc_05dada
	tst.b ($35,a6)
	beq.b loc_05c322
	tst.b ($5b,a6)
	bne.w loc_05b78e

loc_05c322:
	clr.b ($5b,a6)
	subq.b #1,($3b,a6)
	bne.b loc_05c350
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c356(pc,d0.w),($40,a6)
	move.l loc_05c356+4(pc,d0.w),($48,a6)
	move.l loc_05c356+8(pc,d0.w),($44,a6)
	move.l loc_05c356+$c(pc,d0.w),($4c,a6)

loc_05c350:
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c356:
	dc.l $00050000,$ffffd000,$00080000,$ffffa000
	dc.l $0005c000,$ffffd000,$00080000,$ffffa000
	dc.l $00068000,$ffffd000,$00080000,$ffffa000

;------------------------------------------------------------------------------
loc_05c386:
	tst.b ($35,a6)
	beq.b loc_05c394
	tst.b ($5b,a6)
	bne.w loc_05b78e

loc_05c394:
	moveq #0,d0
	move.b d0,($5b,a6)
	tst.w ($40,a6)
	bpl.b loc_05c3a8
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_05c3a8:
	tst.w ($44,a6)
	bpl.b loc_05c3d6
	addq.b #2,(7,a6)
	move.b d0,($35,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05c3e0(pc,d0.w),($40,a6)
	move.l loc_05c3e0+4(pc,d0.w),($48,a6)
	moveq #$c,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jsr loc_02a758

loc_05c3d6:
	bsr.w loc_05dada
	jmp loc_02a7ea

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c3e0:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;------------------------------------------------------------------------------
loc_05c3f8:
	tst.b ($35,a6)
	bne.b loc_05c404
	jsr loc_02a7ea

loc_05c404:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.w #$94,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c436:
	tst.b ($33,a6)
	bmi.w loc_05daa0
	jmp loc_02a7ea

;==============================================================================
;Aism AC
;==============================================================================
loc_05c444:
	move.b (7,a6),d0
	move.w loc_05c450(pc,d0.w),d1
	jmp loc_05c450(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c450:
	dc.w loc_05c454-loc_05c450
	dc.w loc_05c482-loc_05c450

;------------------------------------------------------------------------------
loc_05c454:
	tst.b ($33,a6)
	bpl.b loc_05c46a
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)
	moveq #1,d0
	jmp loc_02a758

loc_05c46a:
	tst.b ($35,a6)
	beq.w loc_05daac
	clr.b ($35,a6)
	jsr loc_080e8e
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05c482:
	tst.b ($33,a6)
	bmi.w loc_05daa0
	jmp loc_02a7ea

;==============================================================================
;Reverse Shaft Breaker
;==============================================================================
loc_05c490:
	move.b (7,a6),d0
	move.w loc_05c49c(pc,d0.w),d1
	jmp loc_05c49c(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c49c:
	dc.w loc_05c4ac-loc_05c49c
	dc.w loc_05c4da-loc_05c49c
	dc.w loc_05c504-loc_05c49c
	dc.w loc_05c536-loc_05c49c
	dc.w loc_05c57a-loc_05c49c
	dc.w loc_05c5cc-loc_05c49c
	dc.w loc_05c5fa-loc_05c49c
	dc.w loc_05c63a-loc_05c49c

;------------------------------------------------------------------------------
loc_05c4ac:
	addq.b #2,(7,a6)
	move.b #1,($2c8,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$36,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c4da:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_05c502
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05c4f4
	moveq #1,d0

loc_05c4f4:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_05c502:
	rts

;------------------------------------------------------------------------------
loc_05c504:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_05c530
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05c52a
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05c52a:
	move.b loc_05c532(pc,d0.w),($25d,a6)

loc_05c530:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c532:
	dc.b $04,$08,$0c,$00

;------------------------------------------------------------------------------
loc_05c536:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05c560
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05c562(pc,d0.w),($44,a6)
	move.l loc_05c562+4(pc,d0.w),($4c,a6)

loc_05c560:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c562:
	dc.l $00070000,$ffffa800
	dc.l $00080000,$ffffa800
	dc.l $00090000,$ffffa800

;------------------------------------------------------------------------------
loc_05c57a:
	bsr.w loc_05dadc
	cmpi.w #1,($44,a6)
	bcs.b loc_05c5b0
	tst.b ($125,a6)
	beq.b loc_05c59a
	lea.l loc_05dcb4(pc),a1
	jsr loc_030a66
	beq.b loc_05c5aa
	bra.b loc_05c5a4

loc_05c59a:
	move.w ($378,a6),d0
	andi.w #$770f,d0
	beq.b loc_05c5aa

loc_05c5a4:
	move.b #1,($32,a6)

loc_05c5aa:
	jmp loc_02a7ea

loc_05c5b0:
	addq.b #2,(7,a6)
	move.l #$fffff800,($4c,a6)
	move.b #1,($a8,a6)
	clr.w ($3a,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05c5cc:
	bsr.w loc_05dadc
	bpl.b loc_05c5ea
	addq.b #2,(7,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #$37,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_05c5ea:
	addq.w #1,($3a,a6)
	andi.w #1,($3a,a6)
	beq.w loc_05daac
	rts

;------------------------------------------------------------------------------
loc_05c5fa:
	bsr.w loc_05dadc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05c634
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	jsr loc_00369c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$63,d0
	jmp loc_02a758

loc_05c634:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05c63a:
	tst.b ($33,a6)
	bpl.w loc_05daac
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================================================
;Cannon Strike
;==============================================================================
loc_05c652:
	move.b (7,a6),d0
	move.w loc_05c65e(pc,d0.w),d1
	jmp loc_05c65e(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c65e:
	dc.w loc_05c668-loc_05c65e
	dc.w loc_05c6e6-loc_05c65e
	dc.w loc_05c706-loc_05c65e
	dc.w loc_05c73a-loc_05c65e
	dc.w loc_05c76a-loc_05c65e

;------------------------------------------------------------------------------
loc_05c668:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #1,($ce,a6)
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c6b6(pc,d0.w),($40,a6)
	move.l loc_05c6b6+4(pc,d0.w),($48,a6)
	move.l loc_05c6b6+8(pc,d0.w),($44,a6)
	move.l loc_05c6b6+$c(pc,d0.w),($4c,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$52,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c6b6:
	dc.l $00040000,$fffff000,$fffc0000,$ffff8000
	dc.l $00060000,$ffffe800,$fffc0000,$ffff8000
	dc.l $00080000,$ffffe000,$fffc0000,$ffff8000

;------------------------------------------------------------------------------
loc_05c6e6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05c704
	addq.b #2,(7,a6)
	tst.b ($b,a6)
	bne.b loc_05c704
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_05c704:
	rts

;------------------------------------------------------------------------------
loc_05c706:
	tst.b ($5b,a6)
	bmi.w loc_05c778
	jsr loc_02aa08
	bcc.w loc_05daac
	move.b #8,(7,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c73a:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	move.b #8,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c76a:
	tst.b ($33,a6)
	bpl.w loc_05daac
	jmp loc_02bb26

loc_05c778:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05c78a
	move.w d0,($14,a6)
	clr.w ($16,a6)

loc_05c78a:
	move.b #6,(7,a6)
	move.l #$ffff8000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================================================
;Killer Bee Assualt
;==============================================================================
loc_05c7be:
	move.b (7,a6),d0
	move.w loc_05c7ca(pc,d0.w),d1
	jmp loc_05c7ca(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c7ca:
	dc.w loc_05c7ee-loc_05c7ca
	dc.w loc_05c806-loc_05c7ca
	dc.w loc_05c884-loc_05c7ca
	dc.w loc_05c89c-loc_05c7ca
	dc.w loc_05c8e6-loc_05c7ca
	dc.w loc_05c910-loc_05c7ca
	dc.w loc_05c942-loc_05c7ca
	dc.w loc_05c9a4-loc_05c7ca

	dc.w loc_05c9e8-loc_05c7ca
	dc.w loc_05ca8a-loc_05c7ca
	dc.w loc_05cad6-loc_05c7ca
	dc.w loc_05cae6-loc_05c7ca
	dc.w loc_05cb3a-loc_05c7ca
	dc.w loc_05cb8c-loc_05c7ca
	dc.w loc_05cb9c-loc_05c7ca
	dc.w loc_05cbc4-loc_05c7ca

	dc.w loc_05cc04-loc_05c7ca
	dc.w loc_05cc30-loc_05c7ca

;------------------------------------------------------------------------------
loc_05c7ee:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c806:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05c852
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c854(pc,d0.w),($40,a6)
	move.l loc_05c854+4(pc,d0.w),($48,a6)
	move.l loc_05c854+8(pc,d0.w),($44,a6)
	move.l loc_05c854+$c(pc,d0.w),($4c,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	bpl.b loc_05c84c
	neg.l d0

loc_05c84c:
	asr.l #5,d0
	move.l d0,($40,a6)

loc_05c852:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c854:
	dc.l $00020000,$fffff000,$000b0000,$ffffa800
	dc.l $00040000,$ffffe800,$000b0000,$ffffa800
	dc.l $00060000,$ffffe000,$000b0000,$ffffa800

;------------------------------------------------------------------------------
loc_05c884:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05c89a
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)

loc_05c89a:
	rts

;------------------------------------------------------------------------------
loc_05c89c:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	addi.w #$b8,d0
	cmp.w ($14,a6),d0
	bcc.w loc_05daac
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	addi.w #$ffcc,d0
	move.w d0,($14,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c8e6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_05c90e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05c900
	moveq #1,d0

loc_05c900:
	move.b d0,($ab,a6)
	moveq #9,d0
	moveq #$4c,d1
	jsr loc_082e36

loc_05c90e:
	rts

;------------------------------------------------------------------------------
loc_05c910:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_05c93c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05c936
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05c936:
	move.b loc_05c93e(pc,d0.w),($25d,a6)

loc_05c93c:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c93e:
	dc.b $00,$00,$00,$00

;------------------------------------------------------------------------------
loc_05c942:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05c972
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05c974(pc,d0.w),($40,a6)
	move.l loc_05c974+4(pc,d0.w),($48,a6)
	move.l loc_05c974+8(pc,d0.w),($44,a6)
	move.l loc_05c974+$c(pc,d0.w),($4c,a6)

loc_05c972:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05c974:
	dc.l $00080000,$fffff000,$fff98000,$ffff8000
	dc.l $00090000,$ffffe800,$fff90000,$ffff8000
	dc.l $000a0000,$ffffe000,$fff88000,$ffff8000

;------------------------------------------------------------------------------
loc_05c9a4:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3e,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05c9e8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05ca48
	addq.b #2,(7,a6)
	tst.b ($5b,a6)
	beq.b loc_05ca04
	bmi.b loc_05ca04
	st.b ($dd,a6)

loc_05ca04:
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b #1,($2c8,a6)
	move.b #6,($3a,a6)
	move.b #$10,($3b,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05ca5a(pc,d0.w),($40,a6)
	move.l loc_05ca5a+4(pc,d0.w),($48,a6)
	move.l loc_05ca5a+8(pc,d0.w),($44,a6)
	move.l loc_05ca5a+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_05ca58
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_05ca48:
	tst.b ($34,a6)
	beq.b loc_05ca58
	clr.b ($34,a6)
	move.b ($2c9,a6),($b,a6)

loc_05ca58:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ca5a:
	dc.l $000a0000,$00000000,$00000000,$ffffe800
	dc.l $000c0000,$00000000,$00000000,$ffffe800
	dc.l $000e0000,$00000000,$00000000,$ffffe800

;------------------------------------------------------------------------------
loc_05ca8a:
	move.b ($b,a6),d0
	btst d0,($ac,a6)
	bne.b loc_05caa2
	jsr loc_02aa08
	bcs.b loc_05caa2
	jmp loc_02a7ea
 
loc_05caa2:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	move.l #$ffffc000,($48,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3f,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05cad6:
	bsr.w loc_05dac0
	bpl.b loc_05cae0
	addq.b #2,(7,a6)

loc_05cae0:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05cae6:
	tst.b ($33,a6)
	bpl.w loc_05daac
	bra.w loc_05cb2a

;==============================================================================
loc_05caf2:
	tst.b ($107,a5)
	bne.b loc_05cb2a
	tst.b ($5b,a6)
	beq.b loc_05cb2a
	bmi.b loc_05cb2a
	cmpi.b #4,($82,a6)
	bcs.b loc_05cb2a
	tst.b ($125,a6)
	bne.b loc_05cb1e
	btst.b #3,($11b,a6)
	beq.b loc_05cb2a
	btst.b #6,($11a,a6)
	beq.b loc_05cb2a

loc_05cb1e:
	addq.b #2,(7,a6)
	moveq #$48,d0
	jmp loc_02a758

loc_05cb2a:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;------------------------------------------------------------------------------
loc_05cb3a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05cb8a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #4,d0
	move.b ($2c9,a6),($b,a6)
	bne.b loc_05cb68
	neg.l d0

loc_05cb68:
	move.l d0,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #$10,($3a,a6)

loc_05cb8a:
	rts

;------------------------------------------------------------------------------
loc_05cb8c:
	bsr.w loc_05dada
	subq.b #1,($3a,a6)
	bpl.b loc_05cb9a
	addq.b #2,(7,a6)

loc_05cb9a:
	rts

;------------------------------------------------------------------------------
loc_05cb9c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_05cbc2
	addq.b #2,(7,a6)
	move.b #1,($dd,a6)
	move.l #$fffc0000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_05cbc2:
	rts

;------------------------------------------------------------------------------
loc_05cbc4:
	bsr.w loc_05dadc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	move.l #$fffc0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #$49,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05cc04:
	bsr.w loc_05dada
	bpl.b loc_05cc26
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05cc26
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_05cc26:
	tst.b ($35,a6)
	beq.w loc_05daac
	rts

;------------------------------------------------------------------------------
loc_05cc30:
	tst.b ($33,a6)
	bpl.w loc_05daac
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================================================
;Killer Bee Spiral Arrow
;==============================================================================
loc_05cc48:
	move.b (7,a6),d0
	move.w loc_05cc54(pc,d0.w),d1
	jmp loc_05cc54(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05cc54:
	dc.w loc_05cc7a-loc_05cc54
	dc.w loc_05ccaa-loc_05cc54
	dc.w loc_05cd38-loc_05cc54
	dc.w loc_05cd50-loc_05cc54
	dc.w loc_05cd9c-loc_05cc54
	dc.w loc_05cdd4-loc_05cc54
	dc.w loc_05ce1c-loc_05cc54
	dc.w loc_05ce42-loc_05cc54

	dc.w loc_05cebe-loc_05cc54
	dc.w loc_05cebe-loc_05cc54
	dc.w loc_05cebe-loc_05cc54
	dc.w loc_05ceda-loc_05cc54
	dc.w loc_05cf0a-loc_05cc54
	dc.w loc_05cf20-loc_05cc54
	dc.w loc_05cf5c-loc_05cc54
	dc.w loc_05cf80-loc_05cc54

	dc.w loc_05cfb6-loc_05cc54
	dc.w loc_05cfdc-loc_05cc54
	dc.w loc_05d022-loc_05cc54

;------------------------------------------------------------------------------
loc_05cc7a:
	addq.b #2,(7,a6)
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	move.b d0,($1f2,a6)
	move.b d0,($1f3,a6)
	move.b ($82,a6),d0
	move.b loc_05cca4(pc,d0.w),($3b,a6)
	add.w d0,d0
	addi.w #$3c,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05cca4:
	dc.b $01,$00,$02,$00,$03,$00

;------------------------------------------------------------------------------
loc_05ccaa:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05cd06
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	jsr loc_01bd5c
	moveq #0,d1
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_05cce8
	move.l ($10,a3),d1
	andi.w #1,d0
	beq.b loc_05cce2
	addi.l #$1800000,d1

loc_05cce2:
	sub.l ($10,a6),d1
	asr.l #5,d1

loc_05cce8:
	move.l d1,($40,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsl.w #3,d1
	move.l loc_05cd08+4(pc,d1.w),($48,a6)
	move.l loc_05cd08+8(pc,d1.w),($44,a6)
	move.l loc_05cd08+$c(pc,d1.w),($4c,a6)

loc_05cd06:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05cd08:
	dc.l $00020000,$00000000,$000b0000,$ffffa800
	dc.l $00040000,$00000000,$000b0000,$ffffa800
	dc.l $00060000,$00000000,$000b0000,$ffffa800

;------------------------------------------------------------------------------
loc_05cd38:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05cd4e
	addq.b #2,(7,a6)
	addi.w #$28,($14,a6)

loc_05cd4e:
	rts

;------------------------------------------------------------------------------
loc_05cd50:
	jsr loc_02aa08
	move.w ($64,a6),d0
	addi.w #$b8,d0
	cmp.w ($14,a6),d0
	bcc.w loc_05daac
	addq.b #2,(7,a6)
	move.b #2,($23f,a6)
	addi.w #$ffcc,d0
	move.w d0,($14,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	add.w d0,d0
	addi.w #$3d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05cd9c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_05dab2
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05cdb8
	moveq #1,d0

loc_05cdb8:
	move.b d0,($ab,a6)
	moveq #9,d0
	moveq #$4c,d1
	jsr loc_082e36
	move.b #$38,($3a,a6)
	moveq #$5b,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05cdd4:
	jsr loc_02a7ea
	subq.b #1,($3a,a6)
	bpl.w loc_05dab2
	move.b #$12,(7,a6)
	clr.b ($ab,a6)
	move.b #1,($2af,a6)
	tst.b ($3f,a6)
	bne.b loc_05cdfe
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05cdfe:
	move.b loc_05ce18(pc,d0.w),($25d,a6)
	move.b ($2c9,a6),($b,a6)
	addi.w #$20,($14,a6)
	moveq #$4f,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05ce18:
	dc.b $00,$00,$00,$00

;------------------------------------------------------------------------------
loc_05ce1c:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_05ce36
	move.b ($34,a6),d0
	ext.w d0
	add.w d0,($14,a6)
	clr.b ($34,a6)

loc_05ce36:
	tst.b ($35,a6)
	beq.b loc_05ce40
	addq.b #2,(7,a6)

loc_05ce40:
	rts

;------------------------------------------------------------------------------
loc_05ce42:
	jsr loc_02a7ea
	tst.b ($5b,a6)
	bmi.w loc_05d04e
	beq.b loc_05ce82
	st.b ($26f,a6)
	st.b ($1f2,a6)
	move.b #2,($1f3,a6)
	clr.b ($5b,a6)
	movea.w ($38,a6),a4
	move.w ($14,a4),d0
	sub.w ($64,a4),d0
	asr.w #4,d0
	addi.w #$10,d0
	add.b d0,($5f,a4)
	subq.b #1,($3b,a6)
	bmi.w loc_05d0ac

loc_05ce82:
	tst.b ($1f2,a6)
	bne.b loc_05ceaa
	subq.b #1,($1f0,a6)
	bne.b loc_05ceaa
	bsr.w loc_05d24c
	cmp.b ($3c,a6),d6
	beq.b loc_05ceaa
	smi.b d6
	add.b d6,d6
	addq.b #1,d6
	add.b d6,($3c,a6)
	move.b ($3c,a6),d6
	bsr.w loc_05d266
 
loc_05ceaa:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	bra.w loc_05d0f0

;------------------------------------------------------------------------------
loc_05cebe:
	tst.b ($33,a6)
	bpl.w loc_05daac
	move.b #$c,(7,a6)
	move.b #7,($1f0,a6)
	clr.b ($1f2,a6)
	bra.w loc_05d218

;------------------------------------------------------------------------------
loc_05ceda:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.b #$10,($3a,a6)
	moveq #$11,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_05cf0a:
	tst.b ($33,a6)
	bpl.w loc_05daac
	subq.b #1,($3a,a6)
	bpl.w loc_05daac
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_05cf20:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_05cf56
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$40000,($40,a6)
	move.l #$fffff800,($48,a6)
	move.l #$88000,($44,a6)
	move.l #$ffffa800,($4c,a6)

loc_05cf56:
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05cf5c:
	bsr.w loc_05dada
	bpl.b loc_05cf74
	addq.b #2,(7,a6)
	moveq #$4e,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_05cf74:
	jsr loc_02a7ea
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05cf80:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05cfa4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($35,a6)

loc_05cfa4:
	tst.b ($35,a6)
	bne.b loc_05cfb0
	jsr loc_02a7ea

loc_05cfb0:
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05cfb6:
	addq.b #2,(7,a6)
	move.b #$16,($123,a5)
	move.b #$10,($3b,a6)
	move.b #1,($2ca,a6)
	move.w #$8e,d0
	jsr loc_02e970
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05cfdc:
	subq.b #1,($3b,a6)
	bne.w loc_05dab4
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	clr.b ($5f,a4)
	move.w #$8d,d0
	jsr loc_02e7f2
	move.l #$fffe0000,($40,a6)
	move.l #0,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffc400,($4c,a6)
	rts

;------------------------------------------------------------------------------
loc_05d022:
	tst.b ($35,a6)
	beq.b loc_05d034
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05d034:
	bsr.w loc_05dada
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	jmp loc_02baf2

;==============================================================================
loc_05d04e:
	move.b #$16,(7,a6)
	moveq #0,d0
	move.l #$ffff4000,($40,a6)
	move.l d0,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.b d0,($26f,a6)
	moveq #$12,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================================================
loc_05d084:
	move.b #$16,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffa800,($4c,a6)
	move.b d0,($26f,a6)
	moveq #$21,d0
	jmp loc_02a708

;==============================================================================
loc_05d0ac:
	move.w #$8d,d0
	jsr loc_02e614
	beq.b loc_05d084
	move.b #$1a,(7,a6)
	clr.b ($26f,a6)
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	cmpi.w #$c0,d0
	sgt.b d0
	addq.b #1,d0
	move.b d0,($b,a6)
	jsr loc_080668
	moveq #$4d,d0
	jsr loc_02a758
	jmp loc_02fa36

;==============================================================================
loc_05d0f0:
	move.b ($3c,a6),d0
	andi.w #$30,d0
	asr.w #3,d0
	move.w loc_05d102(pc,d0.w),d0
	jmp loc_05d102(pc,d0.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d102:
	dc.w loc_05d10a-loc_05d102
	dc.w loc_05d12e-loc_05d102
	dc.w loc_05d140-loc_05d102
	dc.w loc_05d11c-loc_05d102

;------------------------------------------------------------------------------
loc_05d10a:
	bsr.w loc_05d152
	blt.w loc_05d192
	bsr.w loc_05d16a
	bgt.w loc_05d1b8
	rts

;------------------------------------------------------------------------------
loc_05d11c:
	bsr.w loc_05d152
	blt.w loc_05d192
	bsr.w loc_05d180
	blt.w loc_05d1b8
	rts

;------------------------------------------------------------------------------
loc_05d12e:
	bsr.w loc_05d160
	bgt.w loc_05d1f2
	bsr.w loc_05d16a
	bgt.w loc_05d1b8
	rts

;------------------------------------------------------------------------------
loc_05d140:
	bsr.w loc_05d160
	bgt.w loc_05d1f2
	bsr.w loc_05d180
	blt.w loc_05d1b8
	rts

;==============================================================================
loc_05d152:
	move.w ($64,a6),d0
	addi.w #$c8,d0
	cmp.w ($14,a6),d0
	rts

;==============================================================================
loc_05d160:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	rts

;==============================================================================
loc_05d16a:
	jsr loc_01bd5c
	move.w #$180,d1
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	cmp.w d1,d0
	rts

;==============================================================================
loc_05d180:
	jsr loc_01bd5c
	moveq #0,d1
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	rts

;==============================================================================
loc_05d192:
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	beq.w loc_05d084
	subq.b #1,($1f3,a6)
	bmi.w loc_05d084
	move.b #$12,(7,a6)
	move.w d0,($14,a6)
	moveq #$4f,d0
	jmp loc_02a758

;==============================================================================
loc_05d1b8:
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	beq.w loc_05d04e
	subq.b #1,($1f3,a6)
	bmi.w loc_05d04e
	move.b #$14,(7,a6)
	tst.w d1
	sne.b d0
	addq.b #1,d0
	move.b d0,($b,a6)
	jsr loc_01bd5c
	add.w ($10,a3),d1
	move.w d1,($10,a6)
	moveq #$50,d0
	jmp loc_02a758

;==============================================================================
loc_05d1f2:
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	beq.w loc_05d04e
	subq.b #1,($1f3,a6)
	bmi.w loc_05d04e
	move.b #$10,(7,a6)
	move.w d0,($14,a6)
	moveq #$51,d0
	jmp loc_02a758

;==============================================================================
loc_05d218:
	bsr.w loc_05d24c
	move.b ($3c,a6),d0
	eori.b #$20,d0
	cmp.w d0,d6
	bne.b loc_05d236
	andi.w #$20,d0
	sne.b d0
	add.b d0,d0
	addq.b #1,d0
	add.b d0,d0
	add.b d0,d6

loc_05d236:
	move.b d6,($3c,a6)
	bsr.w loc_05d266
	tst.w ($40,a6)
	smi.b d0
	addq.b #1,d0
	move.b d0,($b,a6)
	rts

;==============================================================================
loc_05d24c:
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	move.w ($14,a4),d1
	addi.w #$16,d1
	bsr.w loc_05daee
	addq.b #2,d6
	lsr.b #2,d6
	rts

;==============================================================================
loc_05d266:
	add.w d6,d6
	add.w d6,d6
	lea.l loc_05dbb4(pc),a0
	lea.l (a0,d6.w),a0
	move.w (a0)+,d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($40,a6)
	move.w (a0)+,d0
	ext.l d0
	asl.l #8,d0
	move.l d0,($44,a6)
	moveq #0,d0
	move.b ($3c,a6),d0
	lea.l loc_05db74(pc),a0
	move.b (a0,d0.w),d0
	addi.b #$52,d0
	jmp loc_02a758

;==============================================================================
;Cannon Revenge
;==============================================================================
loc_05d29e:
	move.b (7,a6),d0
	move.w loc_05d2aa(pc,d0.w),d1
	jmp loc_05d2aa(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d2aa:
	dc.w loc_05d2bc-loc_05d2aa
	dc.w loc_05d2e4-loc_05d2aa
	dc.w loc_05d30a-loc_05d2aa
	dc.w loc_05d32c-loc_05d2aa
	dc.w loc_05d3d0-loc_05d2aa
	dc.w loc_05d3f2-loc_05d2aa
	dc.w loc_05d408-loc_05d2aa
	dc.w loc_05d444-loc_05d2aa

	dc.w loc_05d476-loc_05d2aa

;------------------------------------------------------------------------------
loc_05d2bc:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_05d2de(pc,d0.w),($3a,a6)
	moveq #$5c,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d2de:
	dc.w $0020,$0028,$0030

;------------------------------------------------------------------------------
loc_05d2e4:
	subq.w #1,($3a,a6)
	bpl.w loc_05daac
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_05d304(pc,d0.w),($3a,a6)
	moveq #$62,d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d304:
	dc.w $0030,$0034,$0038

;------------------------------------------------------------------------------
loc_05d30a:
	subq.w #1,($3a,a6)
	bpl.b loc_05d320
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_05d320:
	jsr loc_02f6f8
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05d32c:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_05d39c(pc,d0.w),(7,a6)
	moveq #$e,d0
	movea.w ($38,a6),a4
	move.b d0,($5f,a6)
	tst.b ($31,a4)
	beq.b loc_05d34c
	addq.b #7,d0

loc_05d34c:
	move.b d0,($5f,a4)
	moveq #0,d0
	move.b ($34,a6),d0
	jsr loc_080b70
	moveq #0,d0
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	move.b #1,($a9,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_05d3a0(pc,d0.w),($40,a6)
	move.l loc_05d3a0+4(pc,d0.w),($48,a6)
	move.l loc_05d3a0+8(pc,d0.w),($44,a6)
	move.l loc_05d3a0+$c(pc,d0.w),($4c,a6)
	moveq #$5d,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d39c:
	dc.b $0a,$08,$08,00

loc_05d3a0:
	dc.l $00050000,$ffffd000,$00060000,$ffffa000
	dc.l $00180000,$00000000,$00000000,$00000000
	dc.l $00260000,$00000000,$00000000,$00000000

;------------------------------------------------------------------------------
loc_05d3d0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05d3e4
	clr.b ($35,a6)
	bsr.w loc_05dac0

loc_05d3e4:
	tst.b ($33,a6)
	bpl.w loc_05dab2
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_05d3f2:
	tst.b ($35,a6)
	bne.b loc_05d402
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_05d402:
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05d408:
	tst.b ($5b,a6)
	bne.w loc_05b78e
	bsr.w loc_05dada
	bpl.b loc_05d420
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_05d420:
	tst.w ($44,a6)
	bpl.w loc_05daac
	addq.b #2,(7,a6)
	move.l #$8000,($40,a6)
	move.l #0,($48,a6)
	moveq #6,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05d444:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b d0,($ce,a6)
	moveq #$c,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05d476:
	tst.b ($33,a6)
	bpl.b loc_05d48c
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_05d48c:
	jsr loc_02f6f8
	jmp loc_02a7ea

;##############################################################################
;Throws
;##############################################################################
loc_05d498:
	cmpi.b #4,($80,a6)
	beq.w loc_05d704
	move.b (7,a6),d0
	move.w loc_05d4ae(pc,d0.w),d1
	jmp loc_05d4ae(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d4ae:
	dc.w loc_05d4c8-loc_05d4ae
	dc.w loc_05d4dc-loc_05d4ae
	dc.w loc_05d55c-loc_05d4ae
	dc.w loc_05d56a-loc_05d4ae
	dc.w loc_05d586-loc_05d4ae
	dc.w loc_05d5aa-loc_05d4ae
	dc.w loc_05d5d4-loc_05d4ae
	dc.w loc_05d5e2-loc_05d4ae

	dc.w loc_05d61a-loc_05d4ae
	dc.w loc_05d656-loc_05d4ae
	dc.w loc_05d66e-loc_05d4ae
	dc.w loc_05d6b2-loc_05d4ae
	dc.w loc_05d6f6-loc_05d4ae

;------------------------------------------------------------------------------
loc_05d4c8:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2d,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05d4dc:
	tst.b ($35,a6)
	beq.w loc_05daac
	moveq #$55,d0
	tst.b ($81,a6)
	beq.b loc_05d4ee
	moveq #$56,d0

loc_05d4ee:
	jsr loc_02e3fe
	beq.b loc_05d552
	tst.b ($125,a6)
	beq.b loc_05d51c
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_05d52a
	move.b #1,($b,a6)
	bra.b loc_05d52a

loc_05d51c:
	btst.b #0,($371,a6)
	beq.b loc_05d52a
	eori.b #1,($b,a6)

loc_05d52a:
	move.b #6,(7,a6)
	moveq #$1e,d0
	tst.b ($81,a6)
	beq.b loc_05d546
	move.b #$e,(7,a6)
	eori.b #1,($b,a6)
	moveq #$1d,d0

loc_05d546:
	jsr loc_02a758
	jmp loc_02fa36

loc_05d552:
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05d55c:
	tst.b ($33,a6)
	bpl.w loc_05daac
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_05d56a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_05dab2
	bmi.w loc_05daba
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	rts

;------------------------------------------------------------------------------
loc_05d586:
	tst.b ($35,a6)
	beq.b loc_05d59e
	addq.b #2,(7,a6)
	move.b #$30,($123,a5)
	moveq #$5c,d0
	jsr loc_02e970

loc_05d59e:
	jsr loc_02a7ea
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d5aa:
	tst.b ($35,a6)
	bpl.b loc_05d5c8
	addq.b #2,(7,a6)
	jsr loc_02a7ea
	jsr loc_02f9be
	moveq #$55,d0
	jmp loc_02e7f2

loc_05d5c8:
	jsr loc_02a7ea
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d5d4:
	tst.b ($33,a6)
	bmi.w loc_05daa6
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05d5e2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_05daba
	addq.b #2,(7,a6)
	move.l #$ffff0000,($40,a6)
	move.l #$40000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff9000,($4c,a6)
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d61a:
	cmpi.b #2,($35,a6)
	beq.b loc_05d628
	jsr loc_02a7ea

loc_05d628:
	bsr.w loc_05dada
	bpl.b loc_05d650
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05d650
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05d650:
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d656:
	addq.b #2,(7,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5d,d0
	jsr loc_02e970
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d66e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_05dab4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.l #$13000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff5000,($4c,a6)
	jsr loc_02f9be
	moveq #$56,d0
	jmp loc_02e7f2

;------------------------------------------------------------------------------
loc_05d6b2:
	tst.b ($35,a6)
	bne.b loc_05d6c4
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_05d6c4:
	bsr.w loc_05dada
	bpl.w loc_05dab2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;------------------------------------------------------------------------------
loc_05d6f6:
	tst.b ($33,a6)
	bmi.w loc_05daa0
	jmp loc_02a7ea

;==============================================================================
;Air
;==============================================================================
loc_05d704:
	move.b (7,a6),d0
	move.w loc_05d710(pc,d0.w),d1
	jmp loc_05d710(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d710:
	dc.w loc_05d728-loc_05d710
	dc.w loc_05d7e8-loc_05d710
	dc.w loc_05d7f8-loc_05d710
	dc.w loc_05d80c-loc_05d710
	dc.w loc_05d82a-loc_05d710
	dc.w loc_05d82a-loc_05d710
	dc.w loc_05d82a-loc_05d710
	dc.w loc_05d852-loc_05d710

	dc.w loc_05d866-loc_05d710
	dc.w loc_05d8d0-loc_05d710
	dc.w loc_05d8f4-loc_05d710
	dc.w loc_05d928-loc_05d710

;------------------------------------------------------------------------------
loc_05d728:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$71,d0
	tst.b ($81,a6)
	beq.b loc_05d73a
	moveq #$72,d0

loc_05d73a:
	jsr loc_02e636
	beq.w loc_05d7dc
	tst.b ($125,a6)
	beq.b loc_05d76a
	clr.b ($b,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_05d778
	move.b #1,($b,a6)
	bra.b loc_05d778

loc_05d76a:
	btst.b #0,($371,a6)
	beq.b loc_05d778
	eori.b #1,($b,a6)

loc_05d778:
	tst.b ($81,a6)
	bne.b loc_05d79c
	move.b #4,(7,a6)
	move.b #$c,($3b,a6)
	clr.l ($44,a6)
	moveq #$20,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_05d79c:
	move.b #$e,(7,a6)
	eori.b #1,($b,a6)
	move.l #0,($40,a6)
	move.l #0,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffc000,($4c,a6)
	move.b #$c,($3b,a6)
	moveq #$1f,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_05d7dc:
	addq.b #2,(7,a6)
	moveq #$2e,d0
	jmp loc_02a758

;------------------------------------------------------------------------------
loc_05d7e8:
	jsr loc_02aa08
	bcc.w loc_05daac
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_05d7f8:
	subq.b #1,($3b,a6)
	bpl.b loc_05d806
	addq.b #2,(7,a6)
	clr.b ($3b,a6)

loc_05d806:
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d80c:
	tst.b ($35,a6)
	beq.b loc_05d81e
	addq.b #2,(7,a6)
	moveq #$57,d0
	jsr loc_02e7f2

loc_05d81e:
	jsr loc_02a7ea
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d82a:
	bsr.w loc_05dadc
	bpl.w loc_05daac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05daac
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_02baf2

;------------------------------------------------------------------------------
loc_05d852:
	subq.b #1,($3b,a6)
	bpl.b loc_05d860
	addq.b #2,(7,a6)
	clr.b ($3b,a6)

loc_05d860:
	jmp loc_02fa36

;------------------------------------------------------------------------------
loc_05d866:
	tst.b ($35,a6)
	bne.b loc_05d872
	jsr loc_02a7ea

loc_05d872:
	bsr.w loc_05dada
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab4
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	tst.b ($35,a6)
	beq.w loc_05dab4
	addq.b #2,(7,a6)
	move.l #$20000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5e,d0
	jsr loc_02e970
	jmp loc_02f9be

;------------------------------------------------------------------------------
loc_05d8d0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_05dab4
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	moveq #$58,d0
	jmp loc_02e7f2

;------------------------------------------------------------------------------
loc_05d8f4:
	tst.b ($35,a6)
	bne.b loc_05d900
	jsr loc_02a7ea

loc_05d900:
	bsr.w loc_05dada
	bpl.w loc_05dab2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_05dab2
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	rts

;------------------------------------------------------------------------------
loc_05d928:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_05daa6
	rts

;##############################################################################
;Winpose
;##############################################################################
loc_05d938:
	move.b ($2c4,a6),d0
	move.w loc_05d944(pc,d0.w),d1
	jmp loc_05d944(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d944:
	dc.w loc_05d952-loc_05d944
	dc.w loc_05d9ae-loc_05d944
	dc.w loc_05d9ae-loc_05d944
	dc.w loc_05d9ae-loc_05d944
	dc.w loc_05d9ae-loc_05d944
	dc.w loc_05d9ae-loc_05d944
	dc.w loc_05d9ae-loc_05d944

;------------------------------------------------------------------------------
loc_05d952:
	jsr RNGFunction
	andi.w #$f,d0
	cmpi.w #6,($138,a5)
	bne.b loc_05d96a
	addi.w #$20,d0
	bra.b loc_05d976

loc_05d96a:
	cmpi.w #$80,($50,a6)
	bcc.b loc_05d976
	addi.w #$10,d0

loc_05d976:
	move.b loc_05d97e(pc,d0.w),($2c4,a6)
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d97e:
	dc.b $02,$06,$08,$02,$06,$08,$02,$06
	dc.b $08,$02,$06,$08,$02,$06,$08,$02
	dc.b $02,$04,$0a,$02,$04,$0a,$02,$04
	dc.b $0a,$02,$04,$0a,$02,$04,$0a,$02
	dc.b $02,$08,$0a,$02,$08,$0a,$02,$08
	dc.b $0a,$02,$08,$0a,$02,$08,$0a,$02

;------------------------------------------------------------------------------
loc_05d9ae:
	move.b (7,a6),d0
	move.w loc_05d9ba(pc,d0.w),d1
	jmp loc_05d9ba(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05d9ba:
	dc.w loc_05d9c2-loc_05d9ba
	dc.w loc_05d9f6-loc_05d9ba
	dc.w loc_05da2a-loc_05d9ba
	dc.w loc_05da3c-loc_05d9ba

;------------------------------------------------------------------------------
loc_05d9c2:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c9,a6),($b,a6)
	cmpi.w #6,($138,a5)
	bne.b loc_05d9ee
	cmpi.b #4,($2c4,a6)
	beq.b loc_05d9ea
	cmpi.b #6,($2c4,a6)
	bne.b loc_05d9ee

loc_05d9ea:
	addq.b #4,($2c4,a6)

loc_05d9ee:
	moveq #0,d0
	jmp loc_02a708

;------------------------------------------------------------------------------
loc_05d9f6:
	tst.b ($124,a5)
	bne.w loc_05daac
	tst.b ($11c,a5)
	bne.w loc_05daac
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	move.w loc_05da1a(pc,d0.w),d0
	jmp loc_02a708

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05da1a:
	dc.w $0023,$0023,$0024,$0025
	dc.w $0026,$0027,$0023,$0023

;------------------------------------------------------------------------------
loc_05da2a:
	subq.b #1,($3a,a6)
	bpl.b loc_05da3c
	addq.b #2,(7,a6)
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

;------------------------------------------------------------------------------
loc_05da3c:
	tst.b ($35,a6)
	beq.b loc_05da5e
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	beq.b loc_05da5e
	move.b #$44,($2a0,a6)
	jsr loc_0a3f9e

loc_05da5e:
	jmp loc_02a7ea

;==============================================================================
loc_05da64:
	moveq #0,d0
	lea.l ($180,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	lea.l ($300,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	rts

;==============================================================================
loc_05daa0:
	jmp loc_02baf2

;==============================================================================
loc_05daa6:
	jmp loc_02bb26

;==============================================================================
loc_05daac:
	jmp loc_02a7ea

;==============================================================================
loc_05dab2:
	rts

;==============================================================================
loc_05dab4:
	jmp loc_02f9be

;==============================================================================
loc_05daba:
	jmp loc_02fa36

;==============================================================================
loc_05dac0:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_05dacc
	neg.l d0

loc_05dacc:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================================================
loc_05dada:
	bsr.b loc_05dac0

;==============================================================================
loc_05dadc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================================================
loc_05daee:
	moveq #0,d2
	moveq #0,d3
	moveq #0,d6
	move.w ($14,a6),d4
	addi.w #$1000,d1
	addi.w #$1000,d4
	move.w d1,d3
	sub.w d4,d3
	beq.b loc_05db5c
	roxr.b #1,d6
	bpl.b loc_05db0c
	neg.w d3

loc_05db0c:
	move.w ($10,a6),d4
	addi.w #$1000,d0
	addi.w #$1000,d4
	move.w d0,d2
	sub.w d4,d2
	beq.b loc_05db66
	roxr.b #1,d6
	bpl.b loc_05db24
	neg.w d2

loc_05db24:
	move.w d3,d1
	sub.w d2,d1
	beq.b loc_05db68
	bcs.b loc_05db2e
	exg.l d2,d3

loc_05db2e:
	roxr.b #1,d6
	swap d3
	jsr loc_01bbbe
	lsl.l #5,d3
	swap d3
	andi.w #$1f,d3
	rol.b #3,d6
	move.b loc_05db54(pc,d6.w),d6
	bclr #0,d6
	bne.b loc_05db50
	add.b d3,d6
	rts

loc_05db50:
	sub.b d3,d6
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05db54:
	dc.b $00,$81,$01,$80,$41,$40,$c0,$c1

;------------------------------------------------------------------------------
loc_05db5c:
	move.b #$80,d6
	sub.w ($10,a6),d0
	roxr.b #1,d6

loc_05db66:
	rts

loc_05db68:
	rol.b #2,d6
	move.b loc_05db70(pc,d6.w),d6
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05db70:
	dc.b $20,$60,$e0,$a0

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05db74:
	dc.b $00,$00,$01,$01,$01,$01,$02,$02
	dc.b $02,$02,$03,$03,$03,$03,$04,$04
	dc.b $04,$04,$05,$05,$05,$05,$06,$06
	dc.b $06,$06,$07,$07,$07,$07,$08,$08
	dc.b $08,$08,$08,$07,$07,$07,$07,$06
	dc.b $06,$06,$06,$05,$05,$05,$05,$04
	dc.b $04,$04,$04,$03,$03,$03,$03,$02
	dc.b $02,$02,$02,$01,$01,$01,$01,$00

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05dbb4:
	dc.w $0000,$1000,$0191,$0feb,$031e,$0fae,$04a3,$0f4b
	dc.w $061c,$0ec4,$0789,$0e18,$08e1,$0d4b,$0a24,$0c5e
	dc.w $0b4f,$0b4f,$0c5e,$0a24,$0d4b,$08e1,$0e18,$0789
	dc.w $0ec4,$061c,$0f4b,$04a3,$0fae,$031e,$0feb,$0191
	dc.w $1000,$0000,$0feb,$fe6f,$0fae,$fce2,$0f4b,$fb5d
	dc.w $0ec4,$f9e4,$0e18,$f877,$0d4b,$f71f,$0c5e,$f5dc
	dc.w $0b4f,$f4b1,$0a24,$f3a2,$08e1,$f2b5,$0789,$f1e8
	dc.w $061c,$f13c,$04a3,$f0b5,$031e,$f052,$0191,$f015
	dc.w $0000,$f000,$fe6f,$f015,$fce2,$f052,$fb5d,$f0b5
	dc.w $f9e4,$f13c,$f877,$f1e8,$f71f,$f2b5,$f5dc,$f3a2
	dc.w $f4b1,$f4b1,$f3a2,$f5dc,$f2b5,$f71f,$f1e8,$f877
	dc.w $f13c,$f9e4,$f0b5,$fb5d,$f052,$fce2,$f015,$fe6f
	dc.w $f000,$0000,$f015,$0191,$f052,$031e,$f0b5,$04a3
	dc.w $f13c,$061c,$f1e8,$0789,$f2b5,$08e1,$f3a2,$0a24
	dc.w $f4b1,$0b4f,$f5dc,$0c5e,$f71f,$0d4b,$f877,$0e18
	dc.w $f9e4,$0ec4,$fb5d,$0f4b,$fce2,$0fae,$fe6f,$0feb

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_05dcb4:
	dc.l $00000001,$00000001,$00000003,$00000003
	dc.l $00000007,$00000007,$0000000f,$0000000f
	dc.l $0000001f,$0000001f,$0000003f,$0000003f
	dc.l $0000007f,$0000007f,$000000ff,$000000ff
	dc.l $000001ff,$000001ff,$000003ff,$000003ff
	dc.l $000007ff,$000007ff,$00000fff,$00000fff
	dc.l $00001fff,$00001fff,$00003fff,$00003fff
	dc.l $00007fff,$00007fff,$0000ffff,$0000ffff

;##############################################################################
;
;##############################################################################
loc_05dd34:
	dc.w loc_05dd76-loc_05dd34
	dc.w loc_05dd76-loc_05dd34
	dc.w loc_05dd3a-loc_05dd34

loc_05dd3a:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_05dd76:
	dc.b $08,$0a,$08,$0a,$05,$07,$08,$0a,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02