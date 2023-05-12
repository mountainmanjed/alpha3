;##############################################
;Normals
;##############################################
loc_048f76:
	tst.b ($80,a6)
	bne.w loc_0490f6
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_049000
	move.b (7,a6),d0
	move.w loc_048f96(pc,d0.w),d1
	jmp loc_048f96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_048f96:
	dc.w loc_048f9a-loc_048f96
	dc.w loc_048ffa-loc_048f96

;----------------------------------------------
loc_048f9a:
	addq.b #2,($7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_048fda
	cmpi.b #1,($132,a6)
	bne.b loc_048fda
	btst.b #0,($83,a6)
	bne.b loc_048fee
	bra.b loc_048fec

loc_048fda:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_048ff4(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_048fee

loc_048fec:
	addq.b #1,d0

loc_048fee:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_048ff4:
	dc.w $0030,$0050,$0050

;----------------------------------------------
loc_048ffa:
	jmp loc_02f5ac

;==============================================
;Kicks
;==============================================
loc_049000:
	move.b ($82,a6),d0
	move.w loc_04900c(pc,d0.w),d1
	jmp loc_04900c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04900c:
	dc.w loc_049012-loc_04900c
	dc.w loc_049088-loc_04900c
	dc.w loc_049012-loc_04900c

;----------------------------------------------
loc_049012:
	move.b (7,a6),d0
	move.w loc_04901e(pc,d0.w),d1
	jmp loc_04901e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04901e:
	dc.w loc_049022-loc_04901e
	dc.w loc_049082-loc_04901e

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_049022:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_049062
	cmpi.b #1,($132,a6)
	bne.b loc_049062
	btst.b #0,($83,a6)
	bne.b loc_049076
	bra.b loc_049074

loc_049062:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_04907c(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_049076

loc_049074:
	addq.b #1,d0

loc_049076:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04907c:
	dc.w $0030,$0040,$0038

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_049082:
	jmp loc_02f5ac

;----------------------------------------------
;Special MK so it can have a feint
;----------------------------------------------
loc_049088:
	move.b (7,a6),d0
	move.w loc_049094(pc,d0.w),d1
	jmp loc_049094(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049094:
	dc.w loc_04909a-loc_049094
	dc.w loc_0490ba-loc_049094
	dc.w loc_0490f0-loc_049094

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_04909a:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #8,d0
	jmp loc_02a710

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_0490ba:
	tst.b ($35,a6)
	bne.b loc_0490ca
	addq.b #2,(7,a6)
	jmp loc_02f5ac

loc_0490ca:
	tst.b ($125,a6)
	bne.w loc_0490f0
	cmpi.b #$ff,($132,a6)
	beq.w loc_0490f0
	btst.b #5,($378,a6)
	beq.b loc_0490f0
	addq.b #2,(7,a6)
	moveq #$1f,d0
	jmp loc_02a758

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loc_0490f0:
	jmp loc_02f5ac

;==============================================
;Crouching Normals
;==============================================
loc_0490f6:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_049108(pc,d0.w),d1
	jmp loc_049108(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049108:
	dc.w loc_04910c-loc_049108
	dc.w loc_049142-loc_049108

;----------------------------------------------
loc_04910c:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_049138
	addq.b #3,d1

loc_049138:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_049142:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_049148:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_049178
	moveq #$18,d0

loc_049178:
	tst.b ($81,a6)
	beq.b loc_049180
	addq.w #3,d0

loc_049180:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################
;Special Move Inputs
;##############################################
loc_04918e:
	tst.b ($132,a6)
	beq.w loc_04919e
	bmi.w loc_04919e
	bra.w loc_04919e

;==============================================
loc_04919e:
	jsr loc_02e096
	bne.w loc_049518

loc_0491a8:
	lea.l ($1a8,a6),a4
	jsr loc_02d69a
	bne.w loc_049380

loc_0491b6:
	lea.l ($1b0,a6),a4
	jsr loc_02d6ba
	bne.w loc_0493be

loc_0491c4:
	lea.l ($198,a6),a4
	jsr loc_02d6b2
	bne.w loc_049344

loc_0491d2:
	lea.l ($1a0,a6),a4
	jsr loc_02d61a
	bne.b loc_049246

loc_0491de:
	tst.b ($132,a6)
	bmi.b loc_0491f4
	lea.l ($190,a6),a4
	jsr loc_02d622
	bne.w loc_04931a
	bra.b loc_049202

loc_0491f4:
	lea.l ($190,a6),a4
	jsr loc_02d65a
	bne.w loc_04931a

loc_049202:
	lea.l ($180,a6),a4
	jsr loc_02d5ea
	bne.w loc_049292

loc_049210:
	lea.l ($188,a6),a4
	jsr loc_02d5f2
	bne.w loc_0492d6

loc_04921e:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_049452

loc_04922c:
	lea.l ($1b8,a6),a4
	jsr loc_02d6ea
	bne.w loc_0494ae

loc_04923a:
	jsr loc_02e0cc
	bne.w loc_0494e4

loc_049244:
	rts

;----------------------------------------------
;Move ID Writes
;----------------------------------------------
loc_049246:
	jsr loc_02ed00
	beq.b loc_0491de
	tst.b ($132,a6)
	bmi.b loc_049272
	move.l #$2000e00,(4,a6)
	clr.b ($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

loc_049272:
	move.l #$02000e00,(4,a6)
	move.b #$18,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f728

;----------------------------------------------
loc_049292:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0492a2
	tst.b ($238,a6)
	bne.w loc_049210
	bra.b loc_0492ac

loc_0492a2:
	cmpi.b #2,($238,a6)
	bcc.w loc_049210

loc_0492ac:
	jsr loc_02ed00
	beq.w loc_049210
	move.l #$02000e00,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0492d6:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0492e6
	tst.b ($238,a6)
	bne.w loc_04921e
	bra.b loc_0492f0

loc_0492e6:
	cmpi.b #2,($238,a6)
	bcc.w loc_04921e

loc_0492f0:
	jsr loc_02ed00
	beq.w loc_04921e
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_04931a:
	jsr loc_02ed00
	beq.w loc_049202
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_049344:
	tst.b ($132,a6)
	bne.w loc_0491d2
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0491d2
	jsr loc_02ecd8
	beq.w loc_0491d2
	move.l #$02001000,(4,a6)
	move.b #8,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_049380:
	cmpi.b #1,($132,a6)
	beq.w loc_0491b6
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0491b6
	jsr loc_02ecd8
	beq.w loc_0491b6
	move.l #$02001000,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_0493be:
	tst.b ($132,a6)
	bne.w loc_0491c4
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0491c4
	tst.b ($238,a6)
	bne.w loc_0491c4
	jsr loc_02ecd8
	beq.w loc_0491c4
	move.l #$02001000,(4,a6)
	move.b #$c,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_hitfreeze,a6)
	jmp loc_02f4bc

;##############################################
;Alpha Counter Aism move write
;##############################################
loc_049406:
	move.l #$02000e00,(4,a6)
	move.b #$e,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$17,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$13,($5f,a4)
	jsr loc_080e8e
	moveq #$13,d0
	jmp loc_02a758

;----------------------------------------------
;Tiger Blow write
loc_049452:
	jsr loc_02edf8
	beq.w loc_04922c

;##############################################
;Alpha Counter Vism move write
;##############################################
loc_04945c:
	tst.b ($132,a6)
	beq.b loc_049406
	move.l #$02000e00,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$11,(pl_invinciblity_timer,a6)
	movea.w ($38,a6),a4
	move.b #$d,($5f,a4)
	jsr loc_080e8e
	moveq #$1a,d0
	jmp loc_02a758

;----------------------------------------------
loc_0494ae:
	tst.b ($132,a6)
	bne.w loc_04923a
	cmpi.w #$30,($11e,a6)
	bcs.w loc_04923a
	jsr loc_02ecd8
	beq.w loc_04923a
	move.l #$02001000,(4,a6)
	move.b #$16,($aa,a6)
	clr.b (pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_0494e4:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_0494f2
	tst.b (pl_taunt_count,a6)
	beq.w loc_049244

loc_0494f2:
	jsr loc_02ed00
	beq.w loc_049244
	move.l #$02000e00,(4,a6)
	move.b #$12,($aa,a6)
	move.b #1,(pl_attk_active,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_049518:
	tst.b ($28a,a6)
	bne.w loc_0491a8
	tst.b ($31,a6)
	bne.w loc_049556
	jsr loc_02ef54
	beq.w loc_0491a8
	jsr loc_02ecd8
	beq.w loc_0491a8
	move.l #$02001000,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_049556:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_0491a8
	jsr loc_02ed28
	beq.w loc_0491a8
	move.l #$02001000,(4,a6)
	move.b #$14,($aa,a6)
	jmp loc_02f980


;##############################################
;Special Move Programming
;##############################################
loc_04957c:
	move.b ($aa,a6),d0
	move.w loc_049588(pc,d0.w),d1
	jmp loc_049588(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049588:
	dc.w loc_0495a2-loc_049588;Tiger Blow
	dc.w loc_04987e-loc_049588;Tiger Shot High
	dc.w loc_049a2c-loc_049588;Tiger Shot Low
	dc.w loc_049bea-loc_049588;Tiger Crush
	dc.w loc_049d28-loc_049588;Tiger Genocide
	dc.w loc_049ea4-loc_049588;Tiger Cannon
	dc.w loc_04a134-loc_049588;Aism Alpha Counter
	dc.w loc_04a27a-loc_049588;Tiger Raid

	dc.w loc_04a292-loc_049588;Vism Alpha Counter
	dc.w loc_04a376-loc_049588;Taunt
	dc.w loc_04a3b8-loc_049588;Vism Activate
	dc.w loc_04a43a-loc_049588;Angry Scar
	dc.w loc_049706-loc_049588;Tiger Uppercut

;==============================================
;Tiger Blow
;==============================================
loc_0495a2:
	move.b (7,a6),d0
	move.w loc_0495ae(pc,d0.w),d1
	jmp loc_0495ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0495ae:
	dc.w loc_0495b8-loc_0495ae
	dc.w loc_04962a-loc_0495ae
	dc.w loc_049640-loc_0495ae
	dc.w loc_04967c-loc_0495ae
	dc.w loc_0496c4-loc_0495ae

;----------------------------------------------
loc_0495b8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_049612(pc,d0.w),($40,a6)
	move.l loc_049612+4(pc,d0.w),($44,a6)
	moveq #$e,d0
	tst.b ($1fe,a6)
	beq.b loc_049602
	clr.b ($1fe,a6)
	moveq #$2c,d0

loc_049602:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049612:
	dc.l $00040000,$00050000
	dc.l $00070000,$00070000
	dc.l $00098000,$00090000

;----------------------------------------------
loc_04962a:
	tst.b ($35,a6)
	bne.b loc_04963a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_04963a:
	jmp loc_02a7ea

;----------------------------------------------
loc_049640:
	tst.w ($40,a6)
	bmi.w loc_04966a
	bsr.w loc_0496e6
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_049658
	neg.l d0

loc_049658:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04966a:
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04967c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	bsr.w loc_0496e6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_049698
	jmp loc_02a7ea

loc_049698:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	clr.b ($ce,a6)
	moveq #$11,d0
	tst.b ($82,a6)
	beq.b loc_0496be
	moveq #$12,d0

loc_0496be:
	jmp loc_02a758

;----------------------------------------------
loc_0496c4:
	tst.b ($33,a6)
	bmi.b loc_0496d6
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_0496d6:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26


;==============================================
loc_0496e6
	tst.w ($44,a6)
	bpl.b loc_0496f4
	move.l #$ffffa000,($4c,a6)

loc_0496f4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
;
;==============================================
loc_049706:
	move.b (7,a6),d0
	move.w loc_049712(pc,d0.w),d1
	jmp loc_049712(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049712:
	dc.w loc_04971e-loc_049712
	dc.w loc_049784-loc_049712
	dc.w loc_0497ae-loc_049712
	dc.w loc_0497c4-loc_049712
	dc.w loc_049800-loc_049712
	dc.w loc_04983c-loc_049712

;----------------------------------------------
loc_04971e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$ffff8000,($48,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04976c(pc,d0.w),($40,a6)
	move.l loc_04976c+4(pc,d0.w),($44,a6)
	moveq #$2f,d0
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04976c:
	dc.l $00030000,$00050000
	dc.l $00060000,$00070000
	dc.l $00080000,$00090000

;----------------------------------------------
loc_049784:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0497ac
	addq.b #2,(7,a6)
	addi.w #$a,($10,a6)
	tst.b ($b,a6)
	bne.b loc_0497a6
	subi.w #$14,($10,a6)

loc_0497a6:
	move.b #1,($31,a6)

loc_0497ac:
	rts

;----------------------------------------------
loc_0497ae:
	tst.b ($35,a6)
	bne.b loc_0497be
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_0497be:
	jmp loc_02a7ea

;----------------------------------------------
loc_0497c4:
	tst.w ($40,a6)
	bmi.w loc_0497ee
	bsr.w loc_04985e
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_0497dc
	neg.l d0

loc_0497dc:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_0497ee:
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_049800:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	bsr.w loc_04985e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ac9a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	clr.b ($ce,a6)
	moveq #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_04983c:
	tst.b ($33,a6)
	bmi.b loc_04984e
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_04984e:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
loc_04985e:
	tst.w ($44,a6)
	bpl.b loc_04986c
	move.l #$ffffa000,($4c,a6)

loc_04986c:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
;High Tiger Shot
;==============================================
loc_04987e:
	move.b (7,a6),d0
	move.w loc_04988a(pc,d0.w),d1
	jmp loc_04988a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04988a:
	dc.w loc_049892-loc_04988a
	dc.w loc_0498ba-loc_04988a
	dc.w loc_0498ce-loc_04988a
	dc.w loc_049a0e-loc_04988a

;----------------------------------------------
loc_049892:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #2,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0498ba:
	cmpi.b #1,($35,a6)
	bne.w loc_04ac9a
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0498ce:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.w loc_0499ea
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_0499ea
	addq.b #1,(a4)
	move.b #$b,(2,a4)
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
	move.b #0,($6a,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_0499ec
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_0499ea
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.b loc_0499ea
	jsr loc_01c1c8
	beq.b loc_0499ea
	addq.b #1,(a4)
	move.b #$b,(2,a4)
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
	move.b #0,($6a,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_0499ec

loc_0499ea:
	rts

;==============================================
loc_0499ec:
	move.b #2,($ee,a4)
	move.b #8,($ee,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_049a08(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049a08:
	dc.w $0009,$000a,$000b

;----------------------------------------------
loc_049a0e:
	subq.b #1,($3a,a6)
	bpl.b loc_049a1e
	clr.b ($ce,a6)
	jsr loc_02f6f8

loc_049a1e:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	jmp loc_02baf2

;==============================================
;Tiger Shot Low
;==============================================
loc_049a2c:
	move.b (7,a6),d0
	move.w loc_049a38(pc,d0.w),d1
	jmp loc_049a38(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049a38:
	dc.w loc_049a40-loc_049a38
	dc.w loc_049a6c-loc_049a38
	dc.w loc_049a80-loc_049a38
	dc.w loc_049bcc-loc_049a38

;----------------------------------------------
loc_049a40:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	addq.b #1,(pl_crouching,a6)
	moveq #5,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_049a6c:
	cmpi.b #1,($35,a6)
	bne.w loc_04ac9a
	addq.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_049a80:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.w loc_049ba8
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_049ba8
	addq.b #1,(a4)
	move.b #$b,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	moveq #6,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b #4,($6a,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_049baa
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_049ba8
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_049ba8
	jsr loc_01c1c8
	beq.w loc_049ba8
	addq.b #1,(a4)
	move.b #$b,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	moveq #6,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b #4,($6a,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_049baa

loc_049ba8:
	rts

;==============================================
loc_049baa:
	move.b #2,($ee,a4)
	move.b #8,($ee,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_049bc6(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049bc6:
	dc.w $0009,$000a,$000b

;----------------------------------------------
loc_049bcc:
	subq.b #1,($3a,a6)
	bpl.b loc_049bdc
	clr.b ($ce,a6)
	jsr loc_02f6f8

loc_049bdc:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	jmp loc_02bb26

;==============================================
;
;==============================================
loc_049bea:
	move.b (7,a6),d0
	move.w loc_049bf6(pc,d0.w),d1
	jmp loc_049bf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049bf6:
	dc.w loc_049c00-loc_049bf6
	dc.w loc_049c6c-loc_049bf6
	dc.w loc_049c92-loc_049bf6
	dc.w loc_049cd4-loc_049bf6
	dc.w loc_049d06-loc_049bf6

;----------------------------------------------
loc_049c00:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.l ($48,a6)
	move.l #$fffe6000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_049c54(pc,d0.w),d1
	move.l loc_049c54+4(pc,d0.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_049c3e
	neg.l d1

loc_049c3e:
	move.l d1,($40,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #8,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049c54:
	dc.l $00060000,$000a0000
	dc.l $00080000,$000a0000
	dc.l $000a0000,$000a0000

;----------------------------------------------
loc_049c6c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_049c90
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #$28,d0
	tst.b ($b,a6)
	bne.b loc_049c8c
	neg.w d0

loc_049c8c:
	add.w d0,($10,a6)

loc_049c90:
	rts

;----------------------------------------------
loc_049c92:
	bsr.w loc_049e82
	tst.l ($44,a6)
	bpl.w loc_04ac9a
	addq.b #2,(7,a6)
	move.l #0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffff0000,($4c,a6)
	move.l #$10000,d0
	tst.b ($b,a6)
	bne.b loc_049cc8
	neg.l d0

loc_049cc8:
	move.l d0,($40,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_049cd4:
	bsr.w loc_049e82
	bcc.b loc_049ce4
	tst.b ($35,a6)
	beq.w loc_04ac9a
	rts

loc_049ce4:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	clr.w ($16,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	jmp loc_02a7ea

;----------------------------------------------
loc_049d06:
	tst.b ($33,a6)
	bmi.b loc_049d18
	jsr loc_02f6f8
	jmp loc_02a7ea

loc_049d18:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
;
;==============================================
loc_049d28:
	move.b (7,a6),d0
	move.w loc_049d34(pc,d0.w),d1
	jmp loc_049d34(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049d34:
	dc.w loc_049d42-loc_049d34
	dc.w loc_049d88-loc_049d34
	dc.w loc_049db0-loc_049d34
	dc.w loc_049de2-loc_049d34
	dc.w loc_049e18-loc_049d34
	dc.w loc_049e42-loc_049d34
	dc.w loc_049e6a-loc_049d34

;----------------------------------------------
loc_049d42:
	addq.b #2,(7,a6)
	clr.l ($48,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	move.l #$20000,d0
	tst.b ($b,a6)
	bne.b loc_049d60
	neg.l d0

loc_049d60:
	move.l d0,($40,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_049d88:
	tst.b ($34,a6)
	beq.b loc_049daa
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_049d9c
	moveq #1,d0

loc_049d9c:
	move.b d0,($ab,a6)
	moveq #-$28,d0
	moveq #$61,d1
	jsr loc_082e36

loc_049daa:
	jmp loc_02a7ea

;----------------------------------------------
loc_049db0:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_049ddc
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_049dd6
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_049dd6:
	move.b loc_049dde(pc,d0.w),(pl_invinciblity_timer,a6)

loc_049ddc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049dde:
	dc.b $04,$06,$10,$00

;----------------------------------------------
loc_049de2:
	jsr loc_02a7ea
	cmpi.b #3,($35,a6)
	bne.b loc_049e0e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$a0000,d0
	tst.b ($b,a6)
	bne.b loc_049e08
	neg.l d0

loc_049e08:
	move.l d0,($40,a6)
	rts

loc_049e0e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;----------------------------------------------
loc_049e18:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	cmpi.b #4,($35,a6)
	bne.b loc_049e2c
	clr.b ($35,a6)

loc_049e2c:
	cmpi.b #$16,($35,a6)
	bne.w loc_04ac9a
	addi.b #2,(7,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_049e42:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$36,d0
	jmp loc_02a758

;----------------------------------------------
loc_049e6a:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
loc_049e82:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	rts

;==============================================
;
;==============================================
loc_049ea4:
	move.b (7,a6),d0
	move.w loc_049eb0(pc,d0.w),d1
	jmp loc_049eb0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049eb0:
	dc.w loc_049ec4-loc_049eb0
	dc.w loc_049f12-loc_049eb0
	dc.w loc_049f3a-loc_049eb0
	dc.w loc_049f6c-loc_049eb0
	dc.w loc_049f94-loc_049eb0
	dc.w loc_049fc2-loc_049eb0
	dc.w loc_04a00a-loc_049eb0
	dc.w loc_04a086-loc_049eb0

	dc.w loc_04a0ce-loc_049eb0
	dc.w loc_04a11c-loc_049eb0

;----------------------------------------------
loc_049ec4:
	addq.b #2,(7,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffd000,($4c,a6)
	clr.l ($48,a6)
	move.l #$80000,d0
	tst.b ($b,a6)
	bne.b loc_049eea
	neg.l d0

loc_049eea:
	move.l d0,($40,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$20,d0
	jmp loc_02a758

;----------------------------------------------
loc_049f12:
	tst.b ($34,a6)
	beq.b loc_049f34
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_049f26
	moveq #1,d0

loc_049f26:
	move.b d0,($ab,a6)
	moveq #-$28,d0
	moveq #$62,d1
	jsr loc_082e36

loc_049f34:
	jmp loc_02a7ea

;----------------------------------------------
loc_049f3a:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_049f66
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_049f60
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_049f60:
	move.b loc_049f68(pc,d0.w),(pl_invinciblity_timer,a6)

loc_049f66:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_049f68:
	dc.b $05,$14,$1e,$00

;----------------------------------------------
loc_049f6c:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_049f92
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #-$28,d0
	tst.b ($b,a6)
	beq.b loc_049f8e
	neg.w d0

loc_049f8e:
	add.w d0,($10,a6)

loc_049f92:
	rts

;----------------------------------------------
loc_049f94:
	bsr.w loc_049e82
	tst.l ($44,a6)
	bpl.w loc_04ac9a
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	move.l #$ffff8000,($4c,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$23,d0
	jmp loc_02a758

;----------------------------------------------
loc_049fc2:
	bsr.w loc_049e82
	bcc.b loc_049fd4
	cmpi.b #4,($35,a6)
	beq.w loc_04ac9a
	rts

loc_049fd4:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($6a,a6)
	jsr loc_00369c
	moveq #$34,d0
	tst.b ($132,a6)
	bmi.b loc_04a004
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$26,d0

loc_04a004:
	jmp loc_02a758

;----------------------------------------------
loc_04a00a:
	cmpi.b #6,($35,a6)
	bne.b loc_04a040
	addq.b #2,(7,a6)
	move.b ($82,a6),d1
	add.b ($6a,a6),d1
	ext.w d1
	lsl.w #3,d1
	move.l loc_04a046(pc,d1.w),($40,a6)
	move.l loc_04a046+4(pc,d1.w),($44,a6)
	move.l loc_04a046+8(pc,d1.w),($48,a6)
	move.l loc_04a046+$c(pc,d1.w),($4c,a6)
	move.b #1,($31,a6)

loc_04a040:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a046:
	dc.l $00070000,$00070000,$ffff8000,$ffffa000
	dc.l $000c0000,$00090000,$ffff8000,$ffffa000
	dc.l $00050000,$00050000,$ffff8000,$ffff8000
	dc.l $000c0000,$00090000,$ffff8000,$ffffa000

;----------------------------------------------
loc_04a086:
	tst.w ($40,a6)
	bmi.w loc_04a0bc
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04a0aa
	neg.l d0

loc_04a0aa:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04a0bc:
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04a0ce:
	bsr.w loc_049e82
	bcs.w loc_04ac9a
	cmpi.b #4,($82,a6)
	bne.b loc_04a0e4
	tst.b ($6a,a6)
	beq.b loc_04a100

loc_04a0e4:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$12,d0
	jmp loc_02a758

loc_04a100:
	move.b #$c,(7,a6)
	addi.b #2,($6a,a6)
	moveq #$35,d0
	tst.b ($132,a6)
	bmi.b loc_04a116
	moveq #$29,d0

loc_04a116:
	jmp loc_02a758

;----------------------------------------------
loc_04a11c:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
;
;==============================================
loc_04a134:
	move.b (7,a6),d0
	move.w loc_04a140(pc,d0.w),d1
	jmp loc_04a140(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a140:
	dc.w loc_04a14a-loc_04a140
	dc.w loc_04a168-loc_04a140
	dc.w loc_04a190-loc_04a140
	dc.w loc_04a1be-loc_04a140
	dc.w loc_04a26c-loc_04a140

;----------------------------------------------
loc_04a14a:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$14,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a168:
	tst.b ($34,a6)
	beq.b loc_04a18a
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_04a17c
	moveq #1,d0

loc_04a17c:
	move.b d0,($ab,a6)
	moveq #$10,d0
	moveq #$47,d1
	jsr loc_082f74

loc_04a18a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04a190:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_04a1b8
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_04a1b2
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_04a1b2:
	move.b loc_04a1ba(pc,d0.w),(pl_invinciblity_timer,a6)

loc_04a1b8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a1ba:
	dc.b $02,$04,$06,00

;----------------------------------------------
loc_04a1be:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_04a248
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_04a248
	addq.b #1,(a4)
	move.b #$b,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3f,a6),($3f,a4)
	move.b #$c,d0
	add.b ($82,a6),d0
	move.b d0,($72,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b #0,($6a,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_04a24a

loc_04a248:
	rts

;==============================================
loc_04a24a
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_04a266(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a266:
	dc.w $0008,$000a,$000c

;----------------------------------------------
loc_04a26c:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04a27a:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04a292:
	move.b (7,a6),d0
	move.w loc_04a29e(pc,d0.w),d1
	jmp loc_04a29e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a29e:
	dc.w loc_04a2a8-loc_04a29e
	dc.w loc_04a2ce-loc_04a29e
	dc.w loc_04a2ee-loc_04a29e
	dc.w loc_04a336-loc_04a29e
	dc.w loc_04a35e-loc_04a29e

;----------------------------------------------
loc_04a2a8:
	addq.b #2,(7,a6)
	move.l #$98000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	rts

;----------------------------------------------
loc_04a2ce:
	tst.b ($34,a6)
	beq.b loc_04a2d8
	clr.b ($34,a6)

loc_04a2d8:
	tst.b ($35,a6)
	bne.b loc_04a2e8
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_04a2e8:
	jmp loc_02a7ea

;----------------------------------------------
loc_04a2ee:
	tst.w ($40,a6)
	bmi.w loc_04a324
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04a312
	neg.l d0

loc_04a312:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jmp loc_02a7ea

loc_04a324:
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_04a336:
	bsr.w loc_049e82
	bcs.w loc_04ac9a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a35e:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
;Taunt
;==============================================
loc_04a376:
	move.b (7,a6),d0
	move.w loc_04a382(pc,d0.w),d1
	jmp loc_04a382(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a382:
	dc.w loc_04a386-loc_04a382
	dc.w loc_04a3aa-loc_04a382

;----------------------------------------------
loc_04a386:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_04a39a
	subq.b #1,(pl_taunt_count,a6)

loc_04a39a:
	clr.b (pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a3aa:
	tst.b ($33,a6)
	bmi.w loc_04ac8e
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04a3b8:
	move.b (7,a6),d0
	move.w loc_04a3c4(pc,d0.w),d1
	jmp loc_04a3c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a3c4:
	dc.w loc_04a3ca-loc_04a3c4
	dc.w loc_04a3ea-loc_04a3c4
	dc.w loc_04a41e-loc_04a3c4

;----------------------------------------------
loc_04a3ca:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_04a3e4
	moveq #$2f,d0

loc_04a3e4:
	jmp loc_02a708

;----------------------------------------------
loc_04a3ea:
	tst.b ($34,a6)
	beq.b loc_04a418
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-$24,d0;dc
	moveq #$64,d1
	tst.b ($31,a6)
	beq.b loc_04a40e
	moveq #-$7,d0
	moveq #$5f,d1

loc_04a40e:
	jsr loc_097cd6
	bsr.w loc_04ac52

loc_04a418:
	jmp loc_02a7ea

;----------------------------------------------
loc_04a41e:
	subq.b #1,($3a,a6)
	bne.w loc_04ac9a
	tst.b ($31,a6)
	beq.b loc_04a434
	move.l #$02000602,(4,a6)

loc_04a434:
	jmp loc_02f796

;==============================================
;
;==============================================
loc_04a43a:
	move.b (7,a6),d0
	move.w loc_04a446(pc,d0.w),d1
	jmp loc_04a446(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a446:
	dc.w loc_04a44e-loc_04a446
	dc.w loc_04a480-loc_04a446
	dc.w loc_04a4a0-loc_04a446
	dc.w loc_04a4c6-loc_04a446

;----------------------------------------------
loc_04a44e:
	addq.b #2,(7,a6)
	jsr loc_0804da
	moveq #-$30,d0
	jsr loc_02ef6c
	jsr loc_02068c
	moveq #0,d0
	move.b d0,(pl_attk_active,a6)
	move.b d0,(pl_crouching,a6)
	move.b d0,($248,a6)
	move.b d0,($82,a6)
	moveq #$2a,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a480:
	tst.b ($35,a6)
	beq.b loc_04a49a
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	moveq #-$f,d0
	moveq #$62,d1
	jsr loc_082e36

loc_04a49a:
	jmp loc_02a7ea

;----------------------------------------------
loc_04a4a0:
	tst.b ($33,a6)
	bpl.b loc_04a49a
	addq.b #2,(7,a6)
	addq.b #1,($1fe,a6)
	clr.b ($ab,a6)
	move.b #$10,(pl_invinciblity_timer,a6)
	jsr loc_02fcd4
	moveq #$2b,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a4c6:
	tst.b ($33,a6)
	bmi.w loc_04ac8e
	jmp loc_02a7ea

;##############################################
;Throws
;##############################################
loc_04a4d4:
	cmpi.b #4,($80,a6)
	beq.w loc_04a654
	move.b (7,a6),d0
	move.w loc_04a4f0(pc,d0.w),d1
	jsr loc_04a4f0(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a4f0:
	dc.w loc_04a4fe-loc_04a4f0
	dc.w loc_04a512-loc_04a4f0
	dc.w loc_04a5a0-loc_04a4f0
	dc.w loc_04a5ae-loc_04a4f0
	dc.w loc_04a5bc-loc_04a4f0
	dc.w loc_04a614-loc_04a4f0
	dc.w loc_04a634-loc_04a4f0

;----------------------------------------------
loc_04a4fe:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1b,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a512:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	move.l #$87,d0
	tst.b ($81,a6)
	beq.b loc_04a52c
	move.l #$83,d0

loc_04a52c:
	jsr loc_02e3fe
	beq.w loc_04a594
	tst.b ($125,a6)
	beq.b loc_04a556
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_04a56a
	bra.b loc_04a56e

loc_04a556:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_04a56e
	clr.b ($b,a6)
	btst #1,d0
	bne.b loc_04a56e

loc_04a56a:
	addq.b #1,($b,a6)

loc_04a56e:
	move.w #$64,($ae,a6)
	clr.b ($1ff,a6)
	move.b #$c,(7,a6)
	moveq #$32,d0
	tst.b ($81,a6)
	beq.b loc_04a58e
	move.b #6,(7,a6)
	moveq #0,d0

loc_04a58e:
	jmp loc_02a758

loc_04a594:
	addq.b #2,(7,a6)
	moveq #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a5a0:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	jmp loc_02baf2

;----------------------------------------------
loc_04a5ae:
	cmpi.b #2,($35,a6)
	bne.w loc_04ac9a
	addq.b #2,(7,a6)

;----------------------------------------------
loc_04a5bc:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_04a5e4
	clr.b ($35,a6)
	move.w #$85,d0
	tst.b ($1ff,a6)
	bne.b loc_04a5dc
	addq.b #1,($1ff,a6)
	move.w #$84,d0

loc_04a5dc:
	jsr loc_02e970
	bne.b loc_04a606

loc_04a5e4:
	jsr loc_02ea06
	tst.b ($1ff,a6)
	beq.w loc_04ac9a
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_04a606
	jsr loc_02ea7a
	beq.w loc_04ac9a

loc_04a606:
	move.b #$a,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a614:
	cmpi.b #1,($35,a6)
	bne.w loc_04ac9a
	move.b #4,(7,a6)
	move.w #$83,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;----------------------------------------------
loc_04a634:
	tst.b ($35,a6)
	beq.w loc_04ac9a
	move.b #4,(7,a6)
	move.l #$87,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
;Air Throw
;==============================================
loc_04a654:
	move.b (7,a6),d0
	move.w loc_04a666(pc,d0.w),d1
	jsr loc_04a666(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a666:
	dc.w loc_04a66c-loc_04a666
	dc.w loc_04a69c-loc_04a666
	dc.w loc_04a6ba-loc_04a666

;----------------------------------------------
loc_04a66c:
	moveq #3,d0
	jsr loc_02ef6c
	move.l #$88,d0
	jsr loc_02e636
	beq.b loc_04a690
	move.b #4,(7,a6)
	moveq #$33,d0
	jmp loc_02a758

loc_04a690:
	addq.b #2,(7,a6)
	moveq #$1e,d0
	jmp loc_02a758

;----------------------------------------------
loc_04a69c:
	jsr loc_02aa08
	bcc.w loc_04ac9a
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_04a6ba:
	tst.b ($35,a6)
	beq.w loc_04ac9a
	move.b #2,(7,a6)
	move.l #$88,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_04a6da:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;##############################################
;Ai Move Checks
;##############################################
loc_04a6fc:
	move.b ($aa,a6),d0
	move.w loc_04a708(pc,d0.w),d1
	jmp loc_04a708(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a708:
	dc.w loc_04a71e-loc_04a708
	dc.w loc_04a760-loc_04a708
	dc.w loc_04a760-loc_04a708
	dc.w loc_04a766-loc_04a708
	dc.w loc_04a734-loc_04a708
	dc.w loc_04a746-loc_04a708
	dc.w loc_04a750-loc_04a708
	dc.w loc_04a766-loc_04a708

	dc.w loc_04a766-loc_04a708
	dc.w loc_04a72c-loc_04a708
	dc.w loc_04a766-loc_04a708

;==============================================
loc_04a71e:
	tst.b ($132,a6)
	bpl.b loc_04a766
	move.b #$18,($aa,a6)
	bra.b loc_04a766

;==============================================
loc_04a72c:
	tst.b (pl_taunt_count,a6)
	beq.b loc_04a76a
	bra.b loc_04a766

;==============================================
loc_04a734:
	tst.b ($132,a6)
	bne.w loc_04a76a
	cmpi.w #$30,($11e,a6)
	bcs.b loc_04a76a
	bra.b loc_04a766

;==============================================
loc_04a746:
	cmpi.w #$30,($11e,a6)
	bcs.b loc_04a76a
	bra.b loc_04a766

;==============================================
loc_04a750:
	tst.b ($132,a6)
	bne.w loc_04a76a
	cmpi.w #$30,($11e,a6)
	bcs.b loc_04a76a

;==============================================
loc_04a760:
	tst.b ($238,a6)
	bne.b loc_04a76a

;==============================================
loc_04a766:
	moveq #1,d0
	rts

;----------------------------------------------
loc_04a76a:
	moveq #0,d0
	rts

;##############################################
;
;##############################################
loc_04a76e:
	move.b (6,a6),d0
	move.w loc_04a77a(pc,d0.w),d1
	jmp loc_04a77a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a77a:
	dc.w loc_04a782-loc_04a77a
	dc.w loc_04a794-loc_04a77a
	dc.w loc_04a7aa-loc_04a77a
	dc.w loc_04a7fc-loc_04a77a

;==============================================
loc_04a782:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_04a794:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_04a7a4
	tst.b ($11c,a5)
	bne.b loc_04a7a4
	addq.b #2,(6,a6)

loc_04a7a4:
	jmp loc_02a7ea

;==============================================
loc_04a7aa:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	tst.b ($2c4,a6)
	bne.w loc_04a7d2
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_04a7e4(pc,d0.w),d0
	addq.b #1,d0
	add.b d0,d0
	move.b d0,($2c4,a6)

loc_04a7d2:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	ext.w d0
	move.b loc_04a7f4(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a7e4:
	dc.b $00,$01,$02,$01,$00,$01,$02,$01
	dc.b $00,$01,$02,$01,$00,$01,$02,$01

loc_04a7f4:
	dc.b $23,$23,$24,$25,$23,$24,$25,$24

;==============================================
loc_04a7fc:
	move.b ($2c4,a6),d0
	move.w loc_04a808(pc,d0.w),d1
	jmp loc_04a808(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a808:
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808
	dc.w loc_04a816-loc_04a808

;----------------------------------------------
loc_04a816:
	tst.b ($3a,a6)
	beq.b loc_04a82a
	subq.b #1,($3a,a6)
	bne.b loc_04a82a
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_04a82a:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_04a830:
	clr.b ($1fe,a6)
	jsr loc_01c368
	beq.b loc_04a852
	addq.b #1,(a4)
	move.w #$b00,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.b (PL_charid,a6),(3,a4)

loc_04a852:
	rts

;##############################################
;
;##############################################
loc_04a854:
	move.b (7,a6),d0
	move.w loc_04a860(pc,d0.w),d1
	jmp loc_04a860(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04a860:
	dc.w loc_04a894-loc_04a860
	dc.w loc_04a8c0-loc_04a860
	dc.w loc_04a8d8-loc_04a860
	dc.w loc_04a8f0-loc_04a860
	dc.w loc_04a946-loc_04a860
	dc.w loc_04a98a-loc_04a860
	dc.w loc_04a9c8-loc_04a860
	dc.w loc_04a9e6-loc_04a860

	dc.w loc_04aa02-loc_04a860
	dc.w loc_04aa1e-loc_04a860
	dc.w loc_04aa62-loc_04a860
	dc.w loc_04aa7a-loc_04a860
	dc.w loc_04aa1e-loc_04a860
	dc.w loc_04aa62-loc_04a860
	dc.w loc_04aa96-loc_04a860
	dc.w loc_04aa1e-loc_04a860

	dc.w loc_04aa62-loc_04a860
	dc.w loc_04aab2-loc_04a860
	dc.w loc_04aacc-loc_04a860
	dc.w loc_04ab00-loc_04a860
	dc.w loc_04ab26-loc_04a860
	dc.w loc_04ab58-loc_04a860
	dc.w loc_04ab92-loc_04a860
	dc.w loc_04abf6-loc_04a860

	dc.w loc_04ac34-loc_04a860
	dc.w loc_04ac44-loc_04a860

;----------------------------------------------
loc_04a894:
	tst.b ($125,a6)
	sne.b d0
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	sne.b d1
	cmpi.b #Ryu_id,(PL_charid,a4)
	bne.b loc_04a8b2
	tst.b d0
	bne.w loc_04a8f0

loc_04a8b2:
	cmpi.b #Adon_id,(PL_charid,a4)
	bne.b loc_04a8c0
	eor.b d0,d1
	bmi.w loc_04a9e6

;----------------------------------------------
loc_04a8c0:
	move.b #4,(7,a6)
	moveq #$32,d0
	cmpi.b #Ryu_id,(PL_charid,a4)
	beq.b loc_04a8d2
	moveq #$22,d0

loc_04a8d2:
	jmp loc_02a708

;----------------------------------------------
loc_04a8d8:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04a8f0:
	tst.b ($132,a6)
	bmi.w loc_04ab00
	beq.w loc_04ac44
	move.b #8,(7,a6)
	moveq #$50,d0
	tst.b ($101,a6)
	beq.b loc_04a90c
	neg.w d0

loc_04a90c:
	add.w d0,($10,a6)
	move.b #$2a,($2a0,a6)
	cmpi.b #2,($6eb9,a5)
	bcs.b loc_04a93e
	jsr loc_01c2c8
	move.l #$1001800,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$1001801,(a4)
	move.w a6,($36,a4)

loc_04a93e
	moveq #$30,d0
	jmp loc_02a708

;----------------------------------------------
loc_04a946:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	addq.b #2,(7,a6)
	move.l #$28000,d0
	tst.b ($b,a6)
	beq.b loc_04a960
	neg.l d0

loc_04a960:
	move.l d0,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #1,($31,a6)
	moveq #$14,d0
	jmp loc_02a708

;----------------------------------------------
loc_04a98a:
	bsr.w loc_049e82
	bcs.w loc_04ac9a
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.b ($31,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_04a9b2
	move.w #$120,d0

loc_04a9b2:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_04a9c8:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	move.l #$02000000,(4,a6)
	move.b #0,($2a0,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04a9e6:
	move.b #$10,(7,a6)
	moveq #$14,d0
	tst.b ($101,a6)
	beq.b loc_04a9f6
	neg.w d0

loc_04a9f6:
	add.w d0,($10,a6)
	moveq #$40,d0
	jmp loc_02a708

;----------------------------------------------
loc_04aa02:
	tst.b ($35,a6)
	ble.b loc_04aa18
	addq.b #2,(7,a6)
	move.w #$10,($3a,a6)
	move.w ($10,a6),($4e,a6)

loc_04aa18:
	jmp loc_02a7ea

;----------------------------------------------
loc_04aa1e:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w d0,($3a,a6)
	andi.w #6,d0
	move.w loc_04aa5a(pc,d0.w),d0
	add.w ($4e,a6),d0
	move.w d0,($10,a6)
	tst.w ($3a,a6)
	bne.b loc_04aa58
	addq.b #2,(7,a6)
	move.w ($4e,a6),($10,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$5c00,($48,a6)

loc_04aa58:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04aa5a:
	dc.w $0000,$0002,$0000,$fffe

;----------------------------------------------
loc_04aa62:
	bsr.w loc_04aca0
	bmi.b loc_04aa70
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_04aa70:
	tst.b ($35,a6)
	bpl.w loc_04ac9a
	rts

;----------------------------------------------
loc_04aa7a:
	tst.b ($35,a6)
	ble.b loc_04aa90
	addq.b #2,(7,a6)
	move.w #$20,($3a,a6)
	move.w ($10,a6),($4e,a6)

loc_04aa90:
	jmp loc_02a7ea

;----------------------------------------------
loc_04aa96:
	tst.b ($35,a6)
	ble.b loc_04aaac
	addq.b #2,(7,a6)
	move.w #$30,($3a,a6)
	move.w ($10,a6),($4e,a6)

loc_04aaac:
	jmp loc_02a7ea

;----------------------------------------------
loc_04aab2:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	addq.b #2,(7,a6)
	move.b #$45,($3a,a6)
	moveq #$23,d0
	jmp loc_02a708

;----------------------------------------------
loc_04aacc:
	subq.b #1,($3a,a6)
	bpl.w loc_04ac9a
	move.l #$02000000,(4,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_04aaee
	move.w #$120,d0

loc_04aaee:
	swap d0
	add.l ($10,a3),d0
	move.l d0,($10,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_04ab00:
	move.b #$28,(7,a6)
	move.b #$2a,($2a0,a6)
	jsr loc_01c2c8
	beq.b loc_04ab1e
	move.l #$01001803,(a4)
	move.w a6,($36,a4)

loc_04ab1e:
	moveq #$41,d0
	jmp loc_02a708

;----------------------------------------------
loc_04ab26:
	tst.b ($35,a6)
	beq.b loc_04ab52
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_04ab52
	move.l #$01001c0c,(a4)
	move.w a6,($36,a4)
	move.w #3,($44,a4)
	move.w #$7b,($4c,a4)

loc_04ab52:
	jmp loc_02a7ea

;----------------------------------------------
loc_04ab58:
	tst.b ($35,a6)
	bpl.b loc_04ab8c
	addq.b #2,(7,a6)
	jsr loc_00b69a
	move.w #$f000,d0
	jsr loc_00b710
	move.b #1,(1,a6)
	movea.w ($38,a6),a4
	clr.b (1,a4)
	move.w #$ffb8,d0
	moveq #$28,d1
	jsr loc_097cd6

loc_04ab8c:
	jmp loc_02a7ea

;----------------------------------------------
loc_04ab92:
	tst.b ($35,a6)
	bmi.b loc_04abf0
	addq.b #2,(7,a6)
	jsr loc_00b6d0
	movea.w ($38,a6),a4
	move.b #1,(1,a4)
	move.w ($38,a6),($40,a6)
	move.w a6,($38,a6)
	moveq #$14,d0
	jsr loc_080b70
	move.w ($40,a6),($38,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$70000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.b #1,($31,a6)
	move.w #$9280,(sub_palram,a5)

loc_04abf0:
	jmp loc_02a7ea

;----------------------------------------------
loc_04abf6:
	bsr.w loc_04aca0
	bpl.b loc_04ac06
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_04ac06:
	bsr.w loc_04acbc
	bpl.w loc_04ac9a
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_04ac9a
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_04ac34:
	tst.b ($33,a6)
	bpl.w loc_04ac9a
	move.b #8,(7,a6)
	bra.b loc_04ac4a

;----------------------------------------------
loc_04ac44:
	move.b #$c,(7,a6)

loc_04ac4a:
	moveq #$32,d0
	jmp loc_02a708

;==============================================
loc_04ac52:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($1b0,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	rts

;==============================================
loc_04ac8e:
	jmp loc_02baf2

;==============================================
loc_04ac94:
	jmp loc_02bb26

;==============================================
loc_04ac9a:
	jmp loc_02a7ea

;==============================================
loc_04aca0:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_04acac
	neg.l d0

loc_04acac:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_04acba:
	bsr.b loc_04aca0

loc_04acbc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;##############################################
;
;##############################################
loc_04acce:
	dc.w loc_04ad4c-loc_04acce
	dc.w loc_04ad10-loc_04acce
	dc.w loc_04acd4-loc_04acce

loc_04acd4:
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_04ad10:
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$07,$09,$07,$09,$02,$02,$02,$02
	dc.b $07,$07,$07,$07,$08,$0a,$08,$0a,$02,$02
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_04ad4c:
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$07,$09,$07,$09,$02,$02,$02,$02
	dc.b $07,$07,$07,$07,$08,$0a,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
