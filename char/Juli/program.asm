;##############################################
;
;##############################################
loc_06b760:
	move.w ($138,a5),d0
	move.w loc_06b76c(pc,d0.w),d1
	jmp loc_06b76c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b76c:
	dc.w loc_06b774-loc_06b76c
	dc.w loc_06b77a-loc_06b76c
	dc.w loc_06b79e-loc_06b76c
	dc.w loc_06b7c4-loc_06b76c

;----------------------------------------------
loc_06b774:
	clr.w ($276,a6)
	rts

;----------------------------------------------
loc_06b77a:
	tst.b ($101,a6)
	beq.b loc_06b774
	lea.l (p3memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06b790
	lea.l (p4memory,a5),a4

loc_06b790:
	cmpi.b #$1f,($102,a4)
	bne.b loc_06b774
	move.w a4,($276,a6)
	rts

;----------------------------------------------
loc_06b79e:
	cmpi.b #1,($101,a6)
	beq.b loc_06b774
	lea.l (p3memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06b7b6
	lea.l (p4memory,a5),a4

loc_06b7b6:
	cmpi.b #$1f,($102,a4)
	bne.b loc_06b774
	move.w a4,($276,a6)
	rts

;----------------------------------------------
loc_06b7c4:
	cmpi.b #2,($101,a6)
	beq.b loc_06b774
	lea.l (p1memory,a5),a4
	btst #0,($101,a6)
	bne.b loc_06b7dc
	lea.l (p2memory,a5),a4

loc_06b7dc:
	cmpi.b #$1f,($102,a4)
	bne.b loc_06b774
	move.w a4,($276,a6)
	rts

;##############################################
;Intro
;##############################################
loc_06b7ea:
	move.b (6,a6),d0
	move.w loc_06b7f6(pc,d0.w),d1
	jmp loc_06b7f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b7f6:
	dc.w loc_06b7fe-loc_06b7f6
	dc.w loc_06b81e-loc_06b7f6
	dc.w loc_06b838-loc_06b7f6
	dc.w loc_06b864-loc_06b7f6

;----------------------------------------------
loc_06b7fe:
	move.b #6,(6,a6)
	moveq #$22,d0
	tst.w ($276,a6)
	beq.b loc_06b818
	move.b #2,(6,a6)
	clr.b (1,a6)
	moveq #$33,d0

loc_06b818:
	jmp loc_02a708

;----------------------------------------------
loc_06b81e:
	cmpi.w #4,($c,a5)
	bne.b loc_06b836
	addq.b #2,(6,a6)
	move.b #1,(1,a6)
	move.b #$c,($2a0,a6)

loc_06b836:
	rts

;----------------------------------------------
loc_06b838:
	movea.w ($276,a6),a4
	cmpi.b #2,($35,a4)
	bne.b loc_06b862
	addq.b #2,(6,a6)
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	moveq #-$20,d0
	tst.b (PL_Flip,a6)
	beq.b loc_06b85e
	neg.w d0

loc_06b85e:
	add.w d0,($10,a6)

loc_06b862:
	rts

;----------------------------------------------
loc_06b864:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_06b87c:
	tst.b ($80,a6)
	bne.w JuliCrouchAttacks
	clr.b ($2c8,a6)
	tst.b (PL_Attacktype,a6)
	bne.w JuliKicks
	move.b (PL_Move_state,a6),d0
	move.w loc_06b89c(pc,d0.w),d1
	jmp loc_06b89c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b89c:
	dc.w loc_06b8a0-loc_06b89c
	dc.w loc_06b8e6-loc_06b89c

;----------------------------------------------
loc_06b8a0:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #1,d0
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	move.w JuliPunchDist(pc,d1.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcs.b loc_06b8d6
	moveq #0,d0

loc_06b8d6:
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
JuliPunchDist:
	dc.w $0030,$0038,$0028

;----------------------------------------------
loc_06b8e6:
	jmp loc_02f5ac

;==============================================
;Kicks
;==============================================
JuliKicks:
	move.b (PL_Move_state,a6),d0
	move.w loc_06b8f8(pc,d0.w),d1
	jmp loc_06b8f8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b8f8:
	dc.w loc_06b8fe-loc_06b8f8
	dc.w loc_06b96c-loc_06b8f8
	dc.w loc_06b972-loc_06b8f8

;----------------------------------------------
loc_06b8fe:
	addq.b #2,(PL_Move_state,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,($a9,a6)
	cmpi.b #2,(PL_ButtonStrength,a6)
	bne.b loc_06b934
	btst #1,(PL_Directioninput,a6)
	beq.b loc_06b934
	move.b #4,(PL_Move_state,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp loc_02a710

loc_06b934:
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b (PL_ButtonStrength,a6),d0
	moveq #0,d1
	move.b (PL_ButtonStrength,a6),d1
	move.w JuliKickDist(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_06b960
	addq.b #1,d0

loc_06b960:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
JuliKickDist:
	dc.w $0030,$0040,$0038

;----------------------------------------------
loc_06b96c:
	jmp loc_02f5ac

;----------------------------------------------
loc_06b972:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_06efe6
	moveq #0,d0
	move.b ($34,a6),d0
	beq.b loc_06b998
	clr.b ($34,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b994
	neg.w d0

loc_06b994:
	add.w d0,($10,a6)

loc_06b998:
	rts

;==============================================
;Crouching
;==============================================
JuliCrouchAttacks:
	move.b #1,($2c8,a6)
	move.b (PL_Move_state,a6),d0
	move.w loc_06b9ac(pc,d0.w),d1
	jmp loc_06b9ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b9ac:
	dc.w loc_06b9b0-loc_06b9ac
	dc.w loc_06b9e6-loc_06b9ac

;----------------------------------------------
loc_06b9b0:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b (PL_Attacktype,a6)
	beq.b loc_06b9dc
	addq.b #3,d1

loc_06b9dc:
	moveq #$c,d0
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_06b9e6:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_06b9ec:
	move.b #6,(PL_Move_state,a6)
	move.b #4,($80,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_06ba1c
	moveq #$18,d0

loc_06ba1c:
	tst.b (PL_Attacktype,a6)
	beq.b loc_06ba24
	addq.w #3,d0

loc_06ba24:
	move.b (PL_ButtonStrength,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;##############################################
;Special Move Inputs
;##############################################
loc_06ba32:
	jsr loc_02e096
	bne.w loc_06baf2

loc_06ba3c:
	lea.l ($1d0,a6),a4
	jsr loc_02d6e2
	bne.w loc_06bde6

loc_06ba4a:
	lea.l ($1d8,a6),a4
	jsr loc_02d6b2
	bne.w loc_06be2c

loc_06ba58:
	lea.l ($1a0,a6),a4
	jsr loc_02d69a
	bne.w loc_06bdaa

loc_06ba66:
	lea.l ($1e8,a6),a4
	jsr loc_02d692
	bne.w loc_06bea6

loc_06ba74:
	lea.l (pl_inp_slot_0,a6),a4
	jsr loc_02d622
	bne.w loc_06bb8a

loc_06ba82:
	lea.l (pl_inp_slot_2,a6),a4
	jsr loc_02d672
	bne.w loc_06bc66

loc_06ba90:
	lea.l (pl_inp_slot_8,a6),a4
	jsr loc_02d5f2
	bne.w loc_06bd80

loc_06ba9e:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_06bf58

loc_06baac:
	jsr loc_02e004
	bne.w loc_06bb56

loc_06bab6:
	jsr loc_02e0cc
	bne.w loc_06bac4

loc_06bac0:
	moveq #0,d0
	rts

;----------------------------------------------
;Move ID writes
;----------------------------------------------
loc_06bac4:
	tst.b ($b9,a6)
	bne.b loc_06bad0
	tst.b (pl_taunt_count,a6)
	beq.b loc_06bac0

loc_06bad0:
	jsr loc_02ed00
	beq.b loc_06bac0
	move.l #$02000e00,(4,a6)
	move.b #$2a,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06baf2:
	tst.b ($28a,a6)
	bne.w loc_06ba3c
	tst.b ($31,a6)
	bne.w loc_06bb30
	jsr loc_02ef54
	beq.w loc_06ba3c
	jsr loc_02ecd8
	beq.w loc_06ba3c
	move.l #$02001000,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_06bb30:
	tst.b ($b9,a6)
	bne.w loc_06ba3c
	jsr loc_02ed28
	beq.w loc_06ba3c
	move.l #$02001000,(4,a6)
	move.b #2,(pl_move_id,a6)
	jmp loc_02f980


;----------------------------------------------
loc_06bb56:
	tst.w ($276,a6)
	beq.w loc_06bab6
	tst.b ($b9,a6)
	bne.w loc_06bab6
	jsr loc_02ed00
	beq.w loc_06bab6
	move.l #$02000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06bb8a:
	jsr loc_02ed00
	beq.w loc_06ba82
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06bbb4:
	tst.b ($31,a6)
	beq.w loc_06ba9e
	tst.b ($3c,a6)
	ble.w loc_06ba9e
	moveq #$40,d0
	tst.w (pl_y_velocity,a6)
	bpl.b loc_06bbce
	moveq #$58,d0

loc_06bbce:
	add.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_06ba9e
	jsr loc_02ed28
	beq.w loc_06ba9e
	move.l #$02000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06bc06:
	tst.b ($31,a6)
	bne.b loc_06bc34
	jsr loc_02ed00
	beq.w loc_06ba82
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_06bc34:
	tst.w (pl_y_velocity,a6)
	bmi.w loc_06ba82
	jsr loc_02ed28
	beq.w loc_06ba82
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06bc66:
	jsr loc_02ed00
	beq.w loc_06ba90
	move.l #$02000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06bc90:
	jsr loc_02ed00
	beq.w loc_06ba82
	move.l #$02000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06bcba:
	bsr.w loc_06f088
	beq.w loc_06baac
	jsr loc_02ed00
	beq.w loc_06baac
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)

loc_06bce8:
	movea.w ($276,a6),a4
	move.l #$02000e06,(4,a4)
	move.b #$e,($aa,a4)
	clr.b ($a9,a4)
	move.b ($2c9,a4),($b,a4)
	move.w #$800,d0
	bra.w loc_06f040

;----------------------------------------------
loc_06bd0c:
	jsr loc_02ed00
	beq.w loc_06ba9e
	move.l #$02000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_06bd30:
	jsr loc_02ed00
	beq.w loc_06ba9e
	move.l #$02000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06bd58:
	jsr loc_02ed00
	beq.w loc_06ba9e
	move.l #$02000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06bd80:
	jsr loc_02ed00
	beq.w loc_06ba9e
	move.l #$02000e00,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06bdaa:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06ba66
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06ba66
	jsr loc_02ecd8
	beq.w loc_06ba66
	move.l #$02001000,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06bde6:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06ba4a
	tst.w ($276,a6)
	beq.w loc_06ba4a
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_06ba4a
	jsr loc_02eee0
	beq.w loc_06ba4a
	move.l #$02001000,(4,a6)
	move.b #$1c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($248,a6)
	move.b #4,(PL_ButtonStrength,a6)
	rts

;----------------------------------------------
loc_06be2c:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_06ba58
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06ba58
	jsr loc_02ecd8
	beq.w loc_06ba58
	move.l #$02001000,(4,a6)
	move.b #$1e,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06be6a:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06ba4a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06ba4a
	jsr loc_02ecd8
	beq.w loc_06ba4a
	move.l #$02001000,(4,a6)
	move.b #$20,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06bea6:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06ba74
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06ba74
	bsr.w loc_06f088
	beq.w loc_06ba74
	jsr loc_02ecd8
	beq.w loc_06ba74
	move.l #$02001000,(4,a6)
	move.b #$22,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.l ($84,a6)
	jsr loc_02f4bc

loc_06beee:
	movea.w ($276,a6),a4
	move.l #$0200100e,(4,a4)
	move.b #$22,($aa,a4)
	move.b #1,($a9,a4)
	move.b ($2c9,a4),($b,a4)
	clr.l ($84,a4)
	st.b ($85,a4)
	move.w #$a00,d0
	bra.w loc_06f040

;----------------------------------------------
loc_06bf1c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06ba4a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06ba4a
	jsr loc_02ecd8
	beq.w loc_06ba4a
	move.l #$02001000,(4,a6)
	move.b #$26,(pl_move_id,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_06bf58:
	jsr loc_02edf8
	beq.w loc_06baac

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_06bf62:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06bfaa
	move.l #$02000e06,(4,a6)
	move.b #$10,(pl_move_id,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,(PL_ButtonStrength,a6)
	clr.b ($5f,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$14,($5f,a4)
	move.b #$18,($25d,a6)
	moveq #$28,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_06bfaa:
	move.l #$02000e0c,(4,a6)
	move.b #4,(pl_move_id,a6)
	clr.b ($2c8,a6)
	move.b #1,($a9,a6)
	move.b #4,(PL_ButtonStrength,a6)
	clr.b ($5f,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,($25d,a6)
	moveq #$28,d0
	jmp loc_02a758

;##############################################
;AI Move Checks
;##############################################
loc_06bfea:
	move.b (pl_move_id,a6),d0
	move.w loc_06bff6(pc,d0.w),d1
	jmp loc_06bff6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06bff6:
	dc.w loc_06c02e-loc_06bff6
	dc.w loc_06c02e-loc_06bff6
	dc.w loc_06c032-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c032-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c076-loc_06bff6
	dc.w loc_06c036-loc_06bff6

	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c032-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c058-loc_06bff6
	dc.w loc_06c08a-loc_06bff6

	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0a0-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c0d4-loc_06bff6
	dc.w loc_06c022-loc_06bff6

;----------------------------------------------
loc_06c022:
	tst.b (pl_taunt_count,a6)
	beq.w loc_06c0d4
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c02e:
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c032:
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c036:
	bsr.w loc_06f088
	beq.w loc_06c0d4
	cmpi.w #6,($138,a5)
	beq.w loc_06c0d4
	move.l a4,($70,a6)
	bsr.w loc_06bce8
	movea.l ($70,a6),a4
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c058:
	tst.w ($276,a6)
	beq.w loc_06c0d4
	tst.b (PL_ism_choice,a6)
	bne.w loc_06c0d4
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_06c0d4
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c076:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06c0d4
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_06c0d4
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c08a:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_06c0d4
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_06c0d4
	bra.w loc_06c0d0

;----------------------------------------------
loc_06c0a0:
	tst.w ($276,a6)
	beq.w loc_06c0d4
	tst.b (PL_ism_choice,a6)
	bne.w loc_06c0d4
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_06c0d4
	bsr.w loc_06f088
	beq.w loc_06c0d4
	move.l a4,($70,a6)
	bsr.w loc_06beee
	movea.l ($70,a6),a4
	bra.w loc_06c0d0
	
;==============================================
loc_06c0d0:
	moveq #1,d0
	rts

;==============================================
loc_06c0d4:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_06c0d8:
	move.b (pl_move_id,a6),d0
	move.w loc_06c0e4(pc,d0.w),d1
	jmp loc_06c0e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c0e4:
	dc.w JuliMeterCharge-loc_06c0e4;00 Meter Charge
	dc.w JuliVismActivate-loc_06c0e4;02 Vism Activate
	dc.w loc_06c274-loc_06c0e4;04 Cannon Spike
	dc.w loc_06c482-loc_06c0e4;06 Cannon Drill
	dc.w loc_06c6d4-loc_06c0e4;08 Spin Knuckle
	dc.w loc_06c7f4-loc_06c0e4;0a Hooligan Comboination
	dc.w loc_06cc90-loc_06c0e4;0c Spin Drive Smasher
	dc.w loc_06cfe4-loc_06c0e4;0e Dramatic mode move?

	dc.w loc_06d1c0-loc_06c0e4;10 Mach Slide
	dc.w loc_06d2d6-loc_06c0e4;12 Cannon Strike
	dc.w loc_06d444-loc_06c0e4;14 Run
	dc.w loc_06d514-loc_06c0e4;16 Earth Direct
	dc.w loc_06d71e-loc_06c0e4;18 Sniping Arrow
	dc.w loc_06d83e-loc_06c0e4;1a ??? Disappears
	dc.w loc_06d868-loc_06c0e4;1c Death Cross Dancing
	dc.w loc_06dc9a-loc_06c0e4;1e Reverse Shaft Breaker

	dc.w loc_06de5e-loc_06c0e4;20 Killer Bee Cannon Drill
	dc.w loc_06e2fa-loc_06c0e4;22 Fast Jump Back
	dc.w loc_06e648-loc_06c0e4;24 Dramatic Mode Super 2?
	dc.w loc_06e6fa-loc_06c0e4;26 Psycho Streak
	dc.w loc_06cc90-loc_06c0e4;28 Spin Drive Smasher
	dc.w loc_06e7b6-loc_06c0e4;2a Taunt

;==============================================
;Meter Charge
;==============================================
JuliMeterCharge:
	move.b (PL_Move_state,a6),d0
	move.w loc_06c11c(pc,d0.w),d1
	jmp loc_06c11c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c11c:
	dc.w loc_06c120-loc_06c11c
	dc.w loc_06c172-loc_06c11c

;----------------------------------------------
loc_06c120:
	addq.b #2,(PL_Move_state,a6)
	move.b #2,($40,a6)
	move.b #$48,($41,a6)
	move.b #$7f,($3a,a6)
	move.b #2,($3b,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	jsr loc_01c2c8
	beq.b loc_06c16a
	move.l #$01003902,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_06c16a
	move.l #$01003903,(a4)
	move.w a6,($36,a4)

loc_06c16a:
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c172:
	tst.b ($35,a6)
	bne.w loc_06c1de
	tst.b ($3e,a6)
	bne.b loc_06c194
	subq.b #1,($3b,a6)
	bpl.b loc_06c194
	move.b #2,($3b,a6)
	moveq #1,d0
	jsr loc_02ef6c

loc_06c194:
	subq.b #1,($40,a6)
	bpl.b loc_06c1b8
	move.b #2,($40,a6)
	move.b ($41,a6),($2a0,a6)
	addq.b #2,($41,a6)
	cmpi.b #$4e,($41,a6)
	blt.b loc_06c1b8
	move.b #$48,($41,a6)

loc_06c1b8:
	subq.b #1,($3a,a6)
	bmi.b loc_06c1e4
	cmpi.b #$5f,($3a,a6)
	bge.b loc_06c1de
	clr.b ($ce,a6)
	tst.b ($125,a6)
	bne.b loc_06c1de
	move.b ($370,a6),d0
	andi.b #$77,d0
	cmpi.b #7,d0
	bne.b loc_06c1e4

loc_06c1de:
	jmp loc_02a7ea

loc_06c1e4:
	moveq #$1c,d0
	jsr loc_0038e4
	jmp loc_02baf2

;==============================================
;Vism Activate
;==============================================
JuliVismActivate:
	move.b (PL_Move_state,a6),d0
	move.w JuliVismActtbl(pc,d0.w),d1
	jmp JuliVismActtbl(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
JuliVismActtbl:
	dc.w JuliVismStep0-JuliVismActtbl
	dc.w JuliVismStep1-JuliVismActtbl
	dc.w JuliVismStep2-JuliVismActtbl

;----------------------------------------------
JuliVismStep0:
	addq.b #2,(PL_Move_state,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_06c21e
	moveq #$2f,d0

loc_06c21e:
	jmp loc_02a708

;----------------------------------------------
JuliVismStep1:
	tst.b ($34,a6)
	beq.b loc_06c252
	addq.b #2,(PL_Move_state,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #1,d0
	moveq #$49,d1
	tst.b ($31,a6)
	beq.b loc_06c248
	moveq #-5,d0
	moveq #$44,d1

loc_06c248:
	jsr loc_097cd6
	bsr.w loc_06ef7a

loc_06c252:
	jmp loc_02a7ea

;----------------------------------------------
JuliVismStep2:
	subq.b #1,($3a,a6)
	bne.w loc_06eff2
	tst.b ($31,a6)
	beq.b loc_06c26e
	move.l #$02000602,(4,a6)

loc_06c26e:
	jmp loc_02f796

;==============================================
;Cannon Spike
;==============================================
loc_06c274:
	move.b (PL_Move_state,a6),d0
	move.w loc_06c280(pc,d0.w),d1
	jmp loc_06c280(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c280:
	dc.w loc_06c28e-loc_06c280
	dc.w loc_06c2c4-loc_06c280
	dc.w loc_06c314-loc_06c280
	dc.w loc_06c35c-loc_06c280
	dc.w loc_06c3be-loc_06c280
	dc.w loc_06c3f0-loc_06c280
	dc.w loc_06c412-loc_06c280

;----------------------------------------------
loc_06c28e:
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addq.b #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #6,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c2c4:
	tst.b ($35,a6)
	beq.b loc_06c2f6
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b #7,($3b,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_06c2fc(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06c2fc+4(pc,d0.w),(pl_x_drag,a6)
	moveq #$14,d0
	jsr loc_0038e4

loc_06c2f6:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c2fc:
	dc.l $00050000,$ffffd000
	dc.l $00060000,$ffffd000
	dc.l $00070000,$ffffd000

;----------------------------------------------
loc_06c314:
	tst.b ($5b,a6)
	bne.w loc_06c440
	bsr.w loc_06f05a
	subq.b #1,($3b,a6)
	bne.b loc_06c33e
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_06c344(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06c344+4(pc,d0.w),(pl_y_drag,a6)

loc_06c33e:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c344:
	dc.l $00060000,$ffffa000
	dc.l $00080000,$ffffa000
	dc.l $000a0000,$ffffa000

;----------------------------------------------
loc_06c35c:
	tst.b ($5b,a6)
	bne.w loc_06c440
	bsr.w loc_06f074
	bpl.b loc_06c374
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)

loc_06c374:
	tst.w (pl_y_velocity,a6)
	bpl.b loc_06c3a0
	addq.b #2,(PL_Move_state,a6)
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	lsl.w #2,d0
	move.l loc_06c3a6(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06c3a6+4(pc,d0.w),(pl_x_drag,a6)
	moveq #$c,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jsr loc_02a758

loc_06c3a0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c3a6:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;----------------------------------------------
loc_06c3be:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b d0,($ce,a6)
	moveq #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c3f0:
	tst.b ($33,a6)
	bpl.b loc_06c406
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_06c406:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_06c412:
	tst.b ($33,a6)
	bpl.b loc_06c42a
	move.b #2,(PL_Move_state,a6)
	clr.b ($5b,a6)
	moveq #2,d0
	jmp loc_02a758

loc_06c42a:
	tst.b ($35,a6)
	beq.b loc_06c43a
	clr.b ($35,a6)
	jsr loc_080e8e

loc_06c43a:
	jmp loc_02a7ea

;==============================================
loc_06c440:
	move.b #8,(PL_Move_state,a6)
	cmpi.b #4,(pl_move_id,a6)
	beq.b loc_06c454
	move.b #$10,(PL_Move_state,a6)

loc_06c454:
	move.l #$ffff4000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$a0000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	moveq #$12,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================
;Cannon Drill
;==============================================
loc_06c482:
	move.b (PL_Move_state,a6),d0
	move.w loc_06c48e(pc,d0.w),d1
	jmp loc_06c48e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c48e:
	dc.w loc_06c49c-loc_06c48e
	dc.w loc_06c4e4-loc_06c48e
	dc.w loc_06c566-loc_06c48e
	dc.w loc_06c5d4-loc_06c48e
	dc.w loc_06c5f2-loc_06c48e
	dc.w loc_06c610-loc_06c48e
	dc.w loc_06c640-loc_06c48e

;----------------------------------------------
loc_06c49c:
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a,a6)
	move.b d0,($5b,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$13,d0
	jsr loc_0038e4
	moveq #$1a,d0
	tst.b ($31,a6)
	beq.b loc_06c4d8
	moveq #$62,d0
	move.b #1,($a,a6)

loc_06c4d8:
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c4e4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06c52e
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	move.b loc_06c530(pc,d0.w),($3a,a6)
	lsl.w #3,d0
	move.l Juli_Cannon_Drill_MV(pc,d0.w),(pl_x_velocity,a6)
	move.l Juli_Cannon_Drill_MV+4(pc,d0.w),(pl_y_velocity,a6)
	move.l Juli_Cannon_Drill_MV+8(pc,d0.w),(pl_x_drag,a6)
	move.l Juli_Cannon_Drill_MV+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06c52e
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06c52e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c530:
	dc.b $0c,00,$10,00,$14,00

Juli_Cannon_Drill_MV:
	dc.l $00068000,$00000000,$fffff000,$ffffe800
	dc.l $00078000,$00000000,$fffff000,$ffffe800
	dc.l $00088000,$00000000,$fffff000,$ffffe800

;----------------------------------------------
loc_06c566:
	tst.b ($a,a6)
	beq.b loc_06c57c
	tst.b ($5b,a6)
	bmi.w loc_06c6a0
	subq.b #1,($3a,a6)
	bmi.w loc_06c678

loc_06c57c:
	jsr loc_02aa08
	bcc.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l d0,(pl_y_drag,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_06c5bc(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06c5bc+4(pc,d0.w),(pl_x_drag,a6)
	moveq #$10,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c5bc:
	dc.l $00030000,$ffffc000
	dc.l $00030000,$ffffc800
	dc.l $00030000,$ffffd000

;----------------------------------------------
loc_06c5d4:
	bsr.w loc_06f05a
	tst.w (pl_x_velocity,a6)
	bpl.b loc_06c5f0
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	move.b d0,($ce,a6)

loc_06c5f0:
	rts

;----------------------------------------------
loc_06c5f2:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_06c610:
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	move.b #6,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c640:
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	move.b #6,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l #$ffffc000,(pl_x_drag,a6)
	moveq #$35,d0
	jmp loc_02a758

;==============================================
loc_06c678:
	move.b #$c,(PL_Move_state,a6)
	move.l #$20000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #$34,d0
	jmp loc_02a758

;==============================================
loc_06c6a0:
	move.b #$a,(PL_Move_state,a6)
	move.l #$ffff8000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	moveq #$12,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================
;Spin Knuckle
;==============================================
loc_06c6d4:
	move.b (PL_Move_state,a6),d0
	move.w loc_06c6e0(pc,d0.w),d1
	jmp loc_06c6e0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c6e0:
	dc.w loc_06c6e8-loc_06c6e0
	dc.w loc_06c712-loc_06c6e0
	dc.w loc_06c778-loc_06c6e0
	dc.w loc_06c7d6-loc_06c6e0

;----------------------------------------------
loc_06c6e8:
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($2c8,a6)
	move.b #1,($ce,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$28,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06c712:
	tst.b ($35,a6)
	bne.b loc_06c742
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_06c748(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06c748+4(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06c748+8(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06c748+$c(pc,d0.w),(pl_y_drag,a6)

loc_06c742:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c748:
	dc.l $00040000,$00040000,$ffffee00,$ffff9000
	dc.l $00058000,$00044000,$ffffe400,$ffff8800
	dc.l $00060000,$0005c000,$ffffe000,$ffff7000

;----------------------------------------------
loc_06c778:
	tst.b ($35,a6)
	bne.b loc_06c784
	jsr loc_02a7ea

loc_06c784:
	bsr.w loc_06f074
	bpl.w loc_06eff8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	move.l d0,(pl_y_drag,a6)
	move.w #$18,d0
	tst.b (PL_Flip,a6)
	bne.b loc_06c7c6
	neg.w d0

loc_06c7c6:
	add.w d0,($10,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06c7d6:
	tst.b ($33,a6)
	bmi.w loc_06efe6
	tst.b ($35,a6)
	bpl.b loc_06c7e8
	clr.b ($ce,a6)

loc_06c7e8:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Hooligan Comboination
;==============================================
loc_06c7f4:
	move.b (PL_Move_state,a6),d0
	move.w loc_06c800(pc,d0.w),d1
	jmp loc_06c800(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c800:
	dc.w loc_06c80e-loc_06c800
	dc.w loc_06c898-loc_06c800
	dc.w loc_06c900-loc_06c800
	dc.w loc_06c918-loc_06c800
	dc.w loc_06c9be-loc_06c800
	dc.w loc_06ca8a-loc_06c800
	dc.w loc_06cbd8-loc_06c800

;----------------------------------------------
loc_06c80e:
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.l d0,($84,a6)
	move.b d0,($2c8,a6)
	move.b d0,($a9,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	beq.b loc_06c832
	move.b #1,($216,a6)

loc_06c832:
	movea.w ($38,a6),a4
	move.b ($102,a4),d0
	add.b d0,d0
	move.w loc_06c858(pc,d0.w),($6a,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$17,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c858:
	dc.w $0035,$0035,$0035,$003e,$0033,$003e,$0040,$003b
	dc.w $003e,$003c,$0036,$0041,$0035,$0037,$003b,$003c
	dc.w $003e,$0032,$0033,$003c,$0035,$003e,$003c,$0035
	dc.w $0036,$0041,$0035,$0035,$0033,$0037,$0036,$0000

;----------------------------------------------
loc_06c898:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06c8ce
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b (PL_ButtonStrength,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_06c8d0(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06c8d0+4(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06c8d0+8(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06c8d0+$c(pc,d0.w),(pl_y_drag,a6)

loc_06c8ce:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c8d0:
	dc.l $00020000,$00070000,$00000000,$ffffa800
	dc.l $00050000,$00070000,$fffff000,$ffff9000
	dc.l $00058000,$00058000,$00000000,$ffffa800

;----------------------------------------------
loc_06c900:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06c916
	addq.b #2,(PL_Move_state,a6)
	addi.w #$28,($14,a6)

loc_06c916:
	rts

;----------------------------------------------
loc_06c918:
	bsr.w loc_06f074
	bpl.b loc_06c94c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06c94c
	move.b #$c,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$1a,d0
	jmp loc_02a758

loc_06c94c:
	bsr.w loc_06c9a2
	beq.w loc_06eff2
	tst.b ($125,a6)
	bne.w loc_06c96e
	move.b ($378,a6),d0
	andi.w #$70,d0
	bne.w loc_06c96e
	jmp loc_02a7ea

loc_06c96e:
	movea.w ($38,a6),a4
	move.w ($14,a6),d1
	sub.w ($14,a4),d1
	move.b #8,(PL_Move_state,a6)
	moveq #$18,d0
	tst.b ($31,a4)
	bne.b loc_06c994
	tst.b ($2c8,a4)
	bne.b loc_06c99c
	cmp.w ($6a,a6),d1
	bcc.b loc_06c99c

loc_06c994:
	move.b #$a,(PL_Move_state,a6)
	moveq #$19,d0

loc_06c99c:
	jmp loc_02a758

;==============================================
loc_06c9a2:
	tst.w (pl_y_velocity,a6)
	bpl.b loc_06c9ba
	move.w ($64,a6),d0
	addi.w #$10,d0
	cmp.w ($14,a6),d0
	bcc.b loc_06c9ba
	moveq #1,d0
	rts

loc_06c9ba:
	moveq #0,d0
	rts

;----------------------------------------------
loc_06c9be:
	move.b ($84,a6),d0
	move.w loc_06c9ca(pc,d0.w),d1
	jmp loc_06c9ca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06c9ca:
	dc.w loc_06c9d0-loc_06c9ca
	dc.w loc_06ca3a-loc_06c9ca
	dc.w loc_06ca6c-loc_06c9ca

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06c9d0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06ca08
	addq.b #2,($84,a6)
	moveq #7,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06ca0a(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06ca0a+4(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06ca0a+8(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06ca0a+$c(pc,d0.w),(pl_y_drag,a6)

loc_06ca08:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ca0a:
	dc.l $00040000,$00040000,$fffff000,$ffff9000
	dc.l $00050000,$00050000,$fffff000,$ffff9000
	dc.l $00060000,$00060000,$fffff000,$ffff9000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06ca3a:
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	addq.b #2,($84,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp loc_02a758

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06ca6c:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_06ca8a:
	move.b ($84,a6),d0
	move.w loc_06ca96(pc,d0.w),d1
	jmp loc_06ca96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ca96:
	dc.w loc_06caa0-loc_06ca96
	dc.w loc_06cb16-loc_06ca96
	dc.w loc_06cb86-loc_06ca96
	dc.w loc_06cb9c-loc_06ca96
	dc.w loc_06cbba-loc_06ca96

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06caa0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06cade
	addq.b #2,($84,a6)
	moveq #5,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	move.b loc_06cae0(pc,d0.w),($3a,a6)
	lsl.w #3,d0
	move.l loc_06cae6(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06cae6+4(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06cae6+8(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06cae6+$c(pc,d0.w),(pl_y_drag,a6)

loc_06cade:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cae0:
	dc.b $0c,00,$10,00,$14,00

loc_06cae6:
	dc.l $00068000,$00000000,$fffff000,$ffffe800
	dc.l $00078000,$00000000,$fffff000,$ffffe800
	dc.l $00088000,$00000000,$fffff000,$ffffe800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cb16:
	subq.b #1,($3a,a6)
	bmi.w loc_06cb60
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2

loc_06cb32:
	move.b #6,($84,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l d0,(pl_y_drag,a6)
	move.l #$ffffc000,(pl_x_drag,a6)
	moveq #$35,d0
	jmp loc_02a758

loc_06cb60:
	addq.b #2,($84,a6)
	move.l #$20000,(pl_x_velocity,a6)
	moveq #0,d0
	move.l d0,(pl_x_drag,a6)
	move.l d0,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	moveq #$34,d0
	jmp loc_02a758

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cb86:
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	bra.b loc_06cb32

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cb9c:
	bsr.w loc_06f05a
	tst.w (pl_x_velocity,a6)
	bpl.b loc_06cbb8
	addq.b #2,($84,a6)
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)
	move.b d0,($ce,a6)

loc_06cbb8:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cbba:
	jsr loc_02f6f8
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_06cbd8:
	move.b ($84,a6),d0
	move.w loc_06cbe4(pc,d0.w),d1
	jmp loc_06cbe4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cbe4:
	dc.w loc_06cbea-loc_06cbe4
	dc.w loc_06cc24-loc_06cbe4
	dc.w loc_06cc48-loc_06cbe4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cbea:
	addq.b #2,($84,a6)
	move.b #1,($2c8,a6)
	move.b #1,($a9,a6)
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	move.l loc_06cc18(pc,d0.w),(pl_x_drag,a6)
	moveq #0,d0
	move.l d0,(pl_y_velocity,a6)
	move.l d0,(pl_y_drag,a6)
	moveq #3,d0
	jmp loc_02ef6c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cc18:
	dc.l $ffffc800,$ffffb800,$ffffa800

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cc24:
	bsr.w loc_06cc6a
	bne.b loc_06cc3a
	addq.b #2,($84,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_06cc3a:
	tst.b ($35,a6)
	bne.w loc_06eff8
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06cc48:
	tst.b ($33,a6)
	bpl.b loc_06cc5e
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_06cc5e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_06cc6a:
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_06cc76
	neg.l d0

loc_06cc76:
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	bpl.b loc_06cc8e
	moveq #0,d0
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)

loc_06cc8e:
	rts

;==============================================
;Spin Drive Smasher
;==============================================
loc_06cc90:
	move.b (PL_Move_state,a6),d0
	move.w loc_06cc9c(pc,d0.w),d1
	jmp loc_06cc9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cc9c:
	dc.w loc_06ccb0-loc_06cc9c
	dc.w loc_06ccde-loc_06cc9c
	dc.w loc_06cd0c-loc_06cc9c
	dc.w loc_06cd9a-loc_06cc9c
	dc.w loc_06ce12-loc_06cc9c
	dc.w loc_06ce40-loc_06cc9c
	dc.w loc_06ceb0-loc_06cc9c
	dc.w loc_06cf26-loc_06cc9c

	dc.w loc_06cf98-loc_06cc9c
	dc.w loc_06cfd6-loc_06cc9c

;----------------------------------------------
loc_06ccb0:
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($2c8,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$42,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ccde:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_06cd06
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06ccf8
	moveq #1,d0

loc_06ccf8:
	move.b d0,($ab,a6)
	moveq #-6,d0
	moveq #$16,d1
	jsr loc_082e36

loc_06cd06:
	jmp loc_02a7ea

;----------------------------------------------
loc_06cd0c:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_06cd64
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06cd38
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06cd38:
	move.b loc_06cd66(pc,d0.w),($25d,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06cd6a(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06cd6a+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06cd6a+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06cd6a+$c(pc,d0.w),(pl_y_drag,a6)

loc_06cd64:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cd66:
	dc.b $04,$0a,$21,00

loc_06cd6a:
	dc.l $00048000,$ffffe000,$00020000,$ffffd000
	dc.l $00058000,$ffffe000,$00020000,$ffffd000
	dc.l $00068000,$ffffe000,$00020000,$ffffd000

;----------------------------------------------
loc_06cd9a:
	bsr.w loc_06f074
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06cde2(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06cde2+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06cde2+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06cde2+$c(pc,d0.w),(pl_y_drag,a6)
	moveq #$24,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cde2:
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000
	dc.l $00030000,$ffff8800,$00000000,$00000000

;----------------------------------------------
loc_06ce12:
	bsr.w loc_06f074
	tst.b ($31,a6)
	beq.b loc_06ce26
	tst.b ($35,a6)
	beq.b loc_06ce26
	clr.b ($31,a6)

loc_06ce26:
	tst.w (pl_x_velocity,a6)
	bpl.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	moveq #$4a,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ce40:
	tst.b ($35,a6)
	bne.b loc_06ce7a
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b #5,($3b,a6)
	clr.b ($5b,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06ce80(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06ce80+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06ce80+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06ce80+$c(pc,d0.w),(pl_y_drag,a6)

loc_06ce7a:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ce80:
	dc.l $00050000,$00000000,$00000000,$00000000
	dc.l $00068000,$00000000,$00000000,$00000000
	dc.l $00080000,$00000000,$00000000,$00000000

;----------------------------------------------
loc_06ceb0:
	bsr.w loc_06f074
	tst.b ($35,a6)
	beq.b loc_06cec2
	tst.b ($5b,a6)
	bne.w loc_06c440

loc_06cec2:
	clr.b ($5b,a6)
	subq.b #1,($3b,a6)
	bne.b loc_06cef0
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06cef6(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06cef6+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06cef6+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06cef6+$c(pc,d0.w),(pl_y_drag,a6)

loc_06cef0:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cef6:
	dc.l $00050000,$ffffd000,$00080000,$ffffa000
	dc.l $0005c000,$ffffd000,$00080000,$ffffa000
	dc.l $00068000,$ffffd000,$00080000,$ffffa000

;----------------------------------------------
loc_06cf26:
	tst.b ($35,a6)
	beq.b loc_06cf34
	tst.b ($5b,a6)
	bne.w loc_06c440

loc_06cf34:
	moveq #0,d0
	move.b d0,($5b,a6)
	tst.w (pl_x_velocity,a6)
	bpl.b loc_06cf48
	move.l d0,(pl_x_velocity,a6)
	move.l d0,(pl_x_drag,a6)

loc_06cf48:
	tst.w (pl_y_velocity,a6)
	bpl.b loc_06cf76
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($35,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_06cf80(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06cf80+4(pc,d0.w),(pl_x_drag,a6)
	moveq #$c,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jsr loc_02a758

loc_06cf76:
	bsr.w loc_06f074
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cf80:
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000
	dc.l $00008000,$00000000

;----------------------------------------------
loc_06cf98:
	tst.b ($35,a6)
	bne.b loc_06cfa4
	jsr loc_02a7ea

loc_06cfa4:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.w #$94,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06cfd6:
	tst.b ($33,a6)
	bmi.w loc_06efe6
	jmp loc_02a7ea

;==============================================
;crash
;==============================================
loc_06cfe4:
	move.b (PL_Move_state,a6),d0
	move.w loc_06cff4(pc,d0.w),d1
	jsr loc_06cff4(pc,d1.w)
	bra.w loc_06d0d6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06cff4:
	dc.w loc_06cffa-loc_06cff4
	dc.w loc_06d044-loc_06cff4
	dc.w loc_06d0c8-loc_06cff4

;----------------------------------------------
loc_06cffa:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($2c8,a6)
	move.l d0,($84,a6)
	move.b #$46,($2a0,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b ($3c,a6)
	move.b #$50,($3a,a6)
	move.b #5,($3b,a6)
	clr.b (pl_x_velocity,a6)
	move.b #1,($41,a6)
	moveq #$51,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d044:
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000e00,d0
	bne.b loc_06d0b2
	tst.b ($3c,a6)
	beq.w loc_06eff2
	tst.b ($35,a6)
	bne.b loc_06d0aa
	move.b ($34,a6),($2a0,a6)
	subq.b #1,($41,a6)
	bpl.b loc_06d082
	move.b #1,($41,a6)
	moveq #1,d0
	jsr loc_02f0ae

loc_06d082:
	subq.b #1,($3b,a6)
	bpl.b loc_06d0aa
	move.b #5,($3b,a6)
	jsr loc_01c2c8
	beq.b loc_06d0aa
	move.l #$01003904,(a4)
	move.b (pl_x_velocity,a6),($3c,a4)
	move.w a6,($36,a4)
	addq.b #2,(pl_x_velocity,a6)

loc_06d0aa:
	subq.b #1,($3a,a6)
	bpl.w loc_06eff2

loc_06d0b2:
	addq.b #2,(PL_Move_state,a6)
	st.b ($3c,a6)
	move.b #0,($2a0,a6)
	moveq #$52,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d0c8:
	tst.b ($33,a6)
	bmi.w loc_06efe6
	jmp loc_02a7ea

;==============================================
loc_06d0d6:
	movea.w ($276,a6),a4
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_06d0e8(pc,d0.w),d1
	jmp loc_06d0e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d0e8:
	dc.w loc_06d0f4-loc_06d0e8
	dc.w loc_06d11e-loc_06d0e8
	dc.w loc_06d15a-loc_06d0e8
	dc.w loc_06d188-loc_06d0e8
	dc.w loc_06d1a4-loc_06d0e8
	dc.w loc_06d1ba-loc_06d0e8

;----------------------------------------------
loc_06d0f4:
	addq.b #2,($84,a6)
	move.b #1,($ce,a4)
	clr.b ($2c8,a4)
	move.b #$46,($2a0,a4)
	move.b #$7f,($25d,a4)
	move.b #1,($263,a4)
	moveq #$58,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06d11e:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	move.b #$1a,($25d,a4)
	clr.b ($263,a4)
	move.w #$30,d0
	move.b (PL_Flip,a6),($b,a4)
	beq.b loc_06d142
	neg.w d0

loc_06d142:
	add.w ($10,a6),d0
	move.w d0,($10,a4)
	move.w ($64,a4),($14,a4)
	moveq #$59,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06d15a:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	jsr loc_01c2c8
	beq.b loc_06d17a
	move.l #$01003905,(a4)
	move.w ($276,a6),($36,a4)

loc_06d17a:
	movea.w ($276,a6),a4
	moveq #$65,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06d188:
	tst.b ($35,a4)
	bne.b loc_06d19e
	addq.b #2,($84,a6)
	move.b #1,($3c,a6)
	move.b #1,($32,a6)

loc_06d19e:
	jmp loc_02a8ca

;----------------------------------------------
loc_06d1a4:
	tst.b ($3c,a6)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	moveq #$66,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06d1ba:
	jmp loc_02a8ca

;==============================================
;Mach Slide
;==============================================
loc_06d1c0:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d1cc(pc,d0.w),d1
	jmp loc_06d1cc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d1cc:
	dc.w loc_06d1d4-loc_06d1cc
	dc.w loc_06d246-loc_06d1cc
	dc.w loc_06d28e-loc_06d1cc
	dc.w loc_06d2a6-loc_06d1cc

;----------------------------------------------
loc_06d1d4:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #$13,d0
	jsr loc_0038e4
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674

loc_06d1f8:
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	move.w loc_06d228(pc,d0.w),($3a,a6)
	lsl.w #2,d0
	move.l loc_06d22e(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06d22e+4(pc,d0.w),(pl_x_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d220
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d220:
	moveq #$58,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d228:
	dc.w $000c,$0017,$0027

loc_06d22e:
	dc.l $00070000,$fffff400
	dc.l $00070000,$fffff400
	dc.l $00070000,$fffff400

;----------------------------------------------
loc_06d246:
	tst.b ($35,a6)
	bne.b loc_06d250
	bsr.w loc_06d502

loc_06d250:
	move.b ($ac,a6),d0
	subq.b #1,d0
	cmp.b (PL_Flip,a6),d0
	beq.b loc_06d264
	subq.w #1,($3a,a6)
	bpl.w loc_06eff2

loc_06d264:
	addq.b #2,(PL_Move_state,a6)
	move.l #$30000,(pl_x_velocity,a6)
	move.l #$3000,(pl_x_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d286
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d286:
	moveq #$59,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d28e:
	tst.b ($35,a6)
	beq.b loc_06d298
	bsr.w loc_06d502

loc_06d298:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2

;----------------------------------------------
loc_06d2a6:
	tst.b ($33,a6)
	bpl.b loc_06d2c0
	move.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	bra.w loc_06d1f8

loc_06d2c0:
	tst.b ($35,a6)
	beq.b loc_06d2d0
	clr.b ($35,a6)
	jsr loc_080e8e

loc_06d2d0:
	jmp loc_02a7ea

;==============================================
;Cannon Strike
;==============================================
loc_06d2d6:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d2e2(pc,d0.w),d1
	jmp loc_06d2e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d2e2:
	dc.w loc_06d2ec-loc_06d2e2
	dc.w loc_06d36c-loc_06d2e2
	dc.w loc_06d38c-loc_06d2e2
	dc.w loc_06d3c0-loc_06d2e2
	dc.w loc_06d3f0-loc_06d2e2

;----------------------------------------------
loc_06d2ec:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06d33c(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06d33c+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06d33c+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06d33c+$c(pc,d0.w),(pl_y_drag,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$52,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d33c:
	dc.l $00040000,$fffff000,$fffc0000,$ffff8000
	dc.l $00060000,$ffffe800,$fffc0000,$ffff8000
	dc.l $00080000,$ffffe000,$fffc0000,$ffff8000

;----------------------------------------------
loc_06d36c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06d38a
	addq.b #2,(PL_Move_state,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d38a
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d38a:
	rts

;----------------------------------------------
loc_06d38c:
	tst.b ($5b,a6)
	bmi.w loc_06d3fe
	jsr loc_02aa08
	bcc.w loc_06eff2
	move.b #8,(PL_Move_state,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d3c0:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	move.b #8,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	moveq #$2c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d3f0:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02bb26

loc_06d3fe:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06d410
	move.w d0,($14,a6)
	clr.w ($16,a6)

loc_06d410:
	move.b #6,(PL_Move_state,a6)
	move.l #$ffff8000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	moveq #$12,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;==============================================
;Run
;==============================================
loc_06d444:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d450(pc,d0.w),d1
	jmp loc_06d450(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d450:
	dc.w loc_06d456-loc_06d450
	dc.w loc_06d496-loc_06d450
	dc.w loc_06d4ea-loc_06d450

;----------------------------------------------
loc_06d456:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	move.b #5,($3a,a6)
	move.b #$27,($3b,a6)
	move.l #$70000,(pl_x_velocity,a6)
	move.l #$fffff400,(pl_x_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d48e
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d48e:
	moveq #$4e,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d496:
	bsr.w loc_06d502
	tst.b ($ac,a6)
	bne.b loc_06d4c0
	subq.b #1,($3b,a6)
	bmi.b loc_06d4c0
	subq.b #1,($3a,a6)
	bpl.w loc_06eff2
	tst.b ($125,a6)
	bne.w loc_06eff2
	btst #0,(PL_Directioninput,a6)
	beq.w loc_06eff2

loc_06d4c0:
	addq.b #2,(PL_Move_state,a6)
	move.l #$30000,(pl_x_velocity,a6)
	move.l #$3000,(pl_x_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d4e2
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d4e2:
	moveq #$4f,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d4ea:
	tst.b ($35,a6)
	beq.b loc_06d4f4
	bsr.w loc_06d502

loc_06d4f4:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2

;==============================================
loc_06d502:
	move.l (pl_x_velocity,a6),d0
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	rts

;==============================================
;Earth Direct
;==============================================
loc_06d514:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d520(pc,d0.w),d1
	jmp loc_06d520(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d520:
	dc.w loc_06d52e-loc_06d520
	dc.w loc_06d552-loc_06d520
	dc.w loc_06d60e-loc_06d520
	dc.w loc_06d61c-loc_06d520
	dc.w loc_06d67c-loc_06d520
	dc.w loc_06d6e2-loc_06d520
	dc.w loc_06d710-loc_06d520

;----------------------------------------------
loc_06d52e:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$2d,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d552:
	tst.b ($35,a6)
	beq.w loc_06eff2
	move.w #$bb,d0
	add.b (PL_ButtonStrength,a6),d0
	jsr loc_02e3fe
	beq.w loc_06d604
	move.b #6,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.l #$fffe0000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$90000,(pl_y_velocity,a6)
	move.l #$ffffa800,(pl_y_drag,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06d5d4(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06d5d4+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06d5d4+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06d5d4+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d5c6
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d5c6:
	moveq #$55,d0
	jsr loc_02a758
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d5d4:
	dc.l $fffe0000,$00000000,$00080000,$ffffb000
	dc.l $fffdc000,$00000000,$000b0000,$ffff9800
	dc.l $fffd8000,$00000000,$000e0000,$ffff8000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06d604:
	addq.b #2,(PL_Move_state,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06d60e:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2

;----------------------------------------------
loc_06d61c:
	tst.b ($35,a6)
	bne.b loc_06d670
	jsr loc_02aa08
	bcc.b loc_06d670
	addq.b #2,(PL_Move_state,a6)
	move.b #$18,($3a,a6)
	move.b #$30,($123,a5)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.w #$bc,d0
	add.b (PL_ButtonStrength,a6),d0
	jsr loc_02e970
	moveq #$56,d0
	jsr loc_02a758
	jsr loc_02faae
	moveq #$2e,d0
	moveq #4,d1
	jmp loc_02a838

loc_06d670:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06d67c:
	subq.b #1,($3a,a6)
	bpl.b loc_06d6d6
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	move.b #1,($de,a6)
	move.w #$bb,d0
	add.b (PL_ButtonStrength,a6),d0
	jsr loc_02e7f2
	move.l #$fffe0000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$60000,(pl_y_velocity,a6)
	move.l #$ffffa800,(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d6ce
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d6ce:
	moveq #$14,d0
	jmp loc_02a708

loc_06d6d6:
	jsr loc_02a7ea
	jmp loc_02a8c6

;----------------------------------------------
loc_06d6e2:
	jsr loc_02aa08
	bcc.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	move.b d0,($de,a6)
	moveq #$57,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d710:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2

;==============================================
;Sniping Arrow
;==============================================
loc_06d71e:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d72a(pc,d0.w),d1
	jmp loc_06d72a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d72a:
	dc.w loc_06d732-loc_06d72a
	dc.w loc_06d7bc-loc_06d72a
	dc.w loc_06d7ea-loc_06d72a
	dc.w loc_06d81c-loc_06d72a

;----------------------------------------------
loc_06d732:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	clr.b ($2c8,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06d78c(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06d78c+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06d78c+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06d78c+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d77c
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d77c:
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$5a,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d78c:
	dc.l $00050000,$00001000,$00040000,$ffffa000
	dc.l $00060000,$00001000,$00040000,$ffffa000
	dc.l $00070000,$00001000,$00040000,$ffffa000

;----------------------------------------------
loc_06d7bc:
	jsr loc_02a7ea
	move.b ($34,a6),d0
	beq.b loc_06d7d8
	tst.b (PL_Flip,a6)
	bne.b loc_06d7d0
	neg.w d0

loc_06d7d0:
	add.w d0,($10,a6)
	clr.b ($34,a6)

loc_06d7d8:
	tst.b ($35,a6)
	bne.b loc_06d7e8
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)

loc_06d7e8:
	rts

;----------------------------------------------
loc_06d7ea:
	jsr loc_02aa08
	bcc.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$5d,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d81c:
	tst.b ($33,a6)
	bpl.b loc_06d832
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

loc_06d832:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;??? Disappears
;==============================================
loc_06d83e:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d84a(pc,d0.w),d1
	jmp loc_06d84a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d84a:
	dc.w loc_06d84e-loc_06d84a
	dc.w loc_06d862-loc_06d84a

;----------------------------------------------
loc_06d84e:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	moveq #$50,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d862:
	jmp loc_02a7ea

;==============================================
;Death Cross Dancing
;==============================================
loc_06d868:
	move.b (PL_Move_state,a6),d0
	move.w loc_06d874(pc,d0.w),d1
	jmp loc_06d874(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d874:
	dc.w loc_06d886-loc_06d874
	dc.w loc_06d8b8-loc_06d874
	dc.w loc_06d8ec-loc_06d874
	dc.w loc_06d94a-loc_06d874
	dc.w loc_06d9ca-loc_06d874
	dc.w loc_06d9e4-loc_06d874
	dc.w loc_06da4a-loc_06d874
	dc.w loc_06daae-loc_06d874

	dc.w loc_06dac0-loc_06d874

;----------------------------------------------
loc_06d886:
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b d0,($2c8,a6)
	move.b d0,($3c,a6)
	move.b d0,($5b,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$61,d0
	jmp loc_02a758

;----------------------------------------------
loc_06d8b8:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_06d8e6
	addq.b #2,(PL_Move_state,a6)
	move.b #$31,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06d8d8
	moveq #1,d0

loc_06d8d8:
	move.b d0,($ab,a6)
	moveq #$b,d0
	moveq #$58,d1
	jsr loc_082e36

loc_06d8e6:
	jmp loc_02a7ea

;----------------------------------------------
loc_06d8ec:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	subq.b #1,($3a,a6)
	bpl.b loc_06d944
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06d918
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06d918:
	move.b loc_06d946(pc,d0.w),($25d,a6)
	move.l #$90000,(pl_x_velocity,a6)
	move.l #$ffff8000,(pl_x_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06d93c
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06d93c:
	moveq #$62,d0
	jmp loc_02a758

loc_06d944:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06d946:
	dc.b $12,$12,$12,00

;----------------------------------------------
loc_06d94a:
	tst.b ($35,a6)
	beq.b loc_06d954
	bsr.w loc_06d502

loc_06d954:
	tst.b ($33,a6)
	bmi.w loc_06efe6
	cmpi.b #1,($5b,a6)
	bne.w loc_06eff2
	bsr.w loc_06f088
	beq.w loc_06d9c0
	move.w #$9f,d0
	jsr loc_02e3e0
	beq.w loc_06d9c0
	addq.b #2,(PL_Move_state,a6)
	clr.l ($84,a6)
	movea.w ($276,a6),a4
	move.l #$02001010,(4,a4)
	move.b #$1c,($aa,a4)
	move.b #4,($248,a4)
	move.b #4,($82,a4)
	clr.l ($84,a4)
	move.w #$a00,d0
	bsr.w loc_06f040
	moveq #$63,d0
	jsr loc_02a758
	jsr loc_02f9be
	bra.w loc_06daf6

loc_06d9c0:
	clr.b ($5b,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06d9ca:
	tst.b ($3c,a6)
	beq.w loc_06daf6
	addq.b #2,(PL_Move_state,a6)
	clr.b ($3c,a6)
	move.w #$9f,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_06d9e4:
	tst.b ($33,a6)
	bpl.b loc_06da40
	bset.b #0,($3c,a6)
	cmpi.b #3,($3c,a6)
	bne.b loc_06da40
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	st.b ($3c,a6)
	move.l #$70000,(pl_x_velocity,a6)
	move.l #$1000,(pl_x_drag,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06da34
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06da34:
	moveq #$64,d0
	jsr loc_02a758
	bra.w loc_06daf6

loc_06da40:
	jsr loc_02a7ea
	bra.w loc_06daf6

;----------------------------------------------
loc_06da4a:
	jsr loc_02a7ea
	bsr.w loc_06daf6
	tst.b ($34,a6)
	beq.b loc_06da7e
	jsr loc_02aa08
	bcc.b loc_06da7e
	addq.b #2,(PL_Move_state,a6)
	move.b #$f,($3a,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	moveq #$5d,d0
	jmp loc_02a758

loc_06da7e:
	tst.b ($35,a6)
	beq.b loc_06daac
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_06daac
	move.l #$01003906,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_06daac
	move.l #$01003907,(a4)
	move.w a6,($36,a4)

loc_06daac:
	rts

;----------------------------------------------
loc_06daae:
	tst.b ($33,a6)
	bpl.b loc_06da40
	subq.b #1,($3a,a6)
	bpl.b loc_06da40
	jmp loc_02bb26

;----------------------------------------------
loc_06dac0:
	st.b ($85,a6)
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_06dadc
	rts

loc_06dadc:
	moveq #0,d0
	move.b d0,($25d,a6)
	move.b d0,($263,a6)
	move.b d0,($31,a6)
	move.w ($64,a6),($14,a6)
	jmp loc_02bb26

;==============================================
loc_06daf6:
	movea.w ($276,a6),a4
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_06db08(pc,d0.w),d1
	jmp loc_06db08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06db08:
	dc.w loc_06db14-loc_06db08
	dc.w loc_06db38-loc_06db08
	dc.w loc_06dbae-loc_06db08
	dc.w loc_06dbce-loc_06db08
	dc.w loc_06dc2a-loc_06db08
	dc.w loc_06dc56-loc_06db08

;----------------------------------------------
loc_06db14:
	addq.b #2,($84,a6)
	move.b #1,($ce,a4)
	clr.b ($2c8,a4)
	move.b #$7f,($25d,a4)
	move.b #1,($263,a4)
	moveq #$58,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06db38:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	move.b #$1a,($25d,a4)
	clr.b ($263,a4)
	move.w ($64,a4),($14,a4)
	move.b (PL_Flip,a6),d0
	eori.b #1,d0
	move.b d0,($b,a4)
	movea.w ($38,a6),a1
	move.w ($10,a1),d0
	sub.w ($10,a6),d0
	add.w ($10,a1),d0
	move.w d0,($10,a4)
	jsr loc_01bd5c
	move.w ($a6,a6),d2
	move.w ($10,a4),d0
	sub.w d2,d0
	sub.w ($10,a3),d0
	bhi.b loc_06db90
	sub.w d0,($10,a6)
	bra.b loc_06db9e

loc_06db90:
	add.w d2,d2
	add.w d2,d0
	subi.w #$180,d0
	bmi.b loc_06db9e
	sub.w d0,($10,a6)

loc_06db9e:
	moveq #$59,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_02f9be

;----------------------------------------------
loc_06dbae:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	st.b ($3c,a6)
	moveq #$63,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_080744

;----------------------------------------------
loc_06dbce:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	bset.b #1,($3c,a6)
	tst.b ($3c,a6)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	movea.w ($276,a6),a4
	move.b #1,($31,a4)
	move.l #$70000,($40,a4)
	move.l #$1000,($48,a4)
	move.l #$40000,($44,a4)
	move.l #$ffffa000,($4c,a4)
	tst.b ($b,a4)
	bne.b loc_06dc20
	neg.l ($40,a4)
	neg.l ($48,a4)

loc_06dc20:
	moveq #$64,d0
	moveq #2,d1
	jmp loc_02a83c

;----------------------------------------------
loc_06dc2a:
	jsr loc_02a8ca
	tst.b ($34,a4)
	beq.b loc_06dc54
	bsr.w loc_06dc5c
	bcc.b loc_06dc54
	addq.b #2,($84,a6)
	clr.b ($31,a4)
	move.w ($64,a4),($14,a4)
	moveq #$5d,d0
	moveq #2,d1
	jmp loc_02a83c

loc_06dc54:
	rts

;----------------------------------------------
loc_06dc56:
	jmp loc_02a8ca

;==============================================
loc_06dc5c:
	move.l ($40,a4),d0
	add.l d0,($10,a4)
	move.l ($48,a4),d0
	add.l d0,($40,a4)
	move.l ($44,a4),d0
	add.l d0,($14,a4)
	move.l ($4c,a4),d0
	add.l d0,($44,a4)
	moveq #0,d0
	movea.l ($1c,a4),a0
	move.b ($b,a0),d0
	add.w ($14,a4),d0
	addi.w #$100,d0
	move.w ($64,a4),d1
	addi.w #$100,d1
	cmp.w d1,d0
	rts

;==============================================
;Reverse Shaft Breaker
;==============================================
loc_06dc9a:
	move.b (PL_Move_state,a6),d0
	move.w loc_06dca6(pc,d0.w),d1
	jmp loc_06dca6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06dca6:
	dc.w loc_06dcb6-loc_06dca6
	dc.w loc_06dce4-loc_06dca6
	dc.w loc_06dd0e-loc_06dca6
	dc.w loc_06dd40-loc_06dca6
	dc.w loc_06dd84-loc_06dca6
	dc.w loc_06ddd8-loc_06dca6
	dc.w loc_06de06-loc_06dca6
	dc.w loc_06de46-loc_06dca6

;----------------------------------------------
loc_06dcb6:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($2c8,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$36,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_06dce4:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_06dd0c
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06dcfe
	moveq #1,d0

loc_06dcfe:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_06dd0c:
	rts

;----------------------------------------------
loc_06dd0e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_06dd3a
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06dd34
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06dd34:
	move.b loc_06dd3c(pc,d0.w),($25d,a6)

loc_06dd3a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06dd3c:
	dc.b $04,$08,$0c,00

;----------------------------------------------
loc_06dd40:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06dd6a
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #2,d0
	move.l loc_06dd6c(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06dd6c+4(pc,d0.w),(pl_y_drag,a6)

loc_06dd6a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06dd6c:
	dc.l $00070000,$ffffa800
	dc.l $00080000,$ffffa800
	dc.l $00090000,$ffffa800

;----------------------------------------------
loc_06dd84:
	bsr.w loc_06f076
	cmpi.w #1,(pl_y_velocity,a6)
	bcs.b loc_06ddbc
	tst.b ($125,a6)
	beq.b loc_06dda6
	movea.l #loc_05dcb4,a1
	jsr loc_030a66
	beq.b loc_06ddb6
	bra.b loc_06ddb0

loc_06dda6:
	move.w ($378,a6),d0
	andi.w #$770f,d0
	beq.b loc_06ddb6

loc_06ddb0:
	move.b #1,($32,a6)

loc_06ddb6:
	jmp loc_02a7ea

loc_06ddbc:
	addq.b #2,(PL_Move_state,a6)
	move.l #$fffff800,(pl_y_drag,a6)
	move.b #1,($a8,a6)
	clr.w ($3a,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06ddd8:
	bsr.w loc_06f076
	bpl.b loc_06ddf6
	addq.b #2,(PL_Move_state,a6)
	move.l #$ffffa800,(pl_y_drag,a6)
	moveq #$37,d0
	add.b (PL_ButtonStrength,a6),d0
	jmp loc_02a758

loc_06ddf6:
	addq.w #1,($3a,a6)
	andi.w #1,($3a,a6)
	beq.w loc_06eff2
	rts

;----------------------------------------------
loc_06de06:
	bsr.w loc_06f076
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06de40
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	jsr loc_00369c
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0
	addi.b #$75,d0
	jmp loc_02a758

loc_06de40:
	jmp loc_02a7ea

;----------------------------------------------
loc_06de46:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Killer Bee Cannon Drill
;==============================================
loc_06de5e:
	move.b (PL_Move_state,a6),d0
	move.w loc_06de6a(pc,d0.w),d1
	jmp loc_06de6a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06de6a:
	dc.w loc_06de8e-loc_06de6a
	dc.w loc_06dea6-loc_06de6a
	dc.w loc_06df24-loc_06de6a
	dc.w loc_06df3c-loc_06de6a
	dc.w loc_06df86-loc_06de6a
	dc.w loc_06dfb0-loc_06de6a
	dc.w loc_06dfe2-loc_06de6a
	dc.w loc_06e044-loc_06de6a

	dc.w loc_06e088-loc_06de6a
	dc.w loc_06e126-loc_06de6a
	dc.w loc_06e188-loc_06de6a
	dc.w loc_06e198-loc_06de6a
	dc.w loc_06e1ec-loc_06de6a
	dc.w loc_06e23e-loc_06de6a
	dc.w loc_06e24e-loc_06de6a
	dc.w loc_06e276-loc_06de6a

	dc.w loc_06e2b6-loc_06de6a
	dc.w loc_06e2e2-loc_06de6a

;----------------------------------------------
loc_06de8e:
	addq.b #2,(PL_Move_state,a6)
	move.b d0,($2c8,a6)
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	addi.w #$3c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06dea6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06def2
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06def4(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06def4+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06def4+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06def4+$c(pc,d0.w),(pl_y_drag,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	bpl.b loc_06deec
	neg.l d0

loc_06deec:
	asr.l #5,d0
	move.l d0,(pl_x_velocity,a6)

loc_06def2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06def4:
	dc.l $00020000,$fffff000,$000b0000,$ffffa800
	dc.l $00040000,$ffffe800,$000b0000,$ffffa800
	dc.l $00060000,$ffffe000,$000b0000,$ffffa800

;----------------------------------------------
loc_06df24:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06df3a
	addq.b #2,(PL_Move_state,a6)
	addi.w #$28,($14,a6)

loc_06df3a:
	rts

;----------------------------------------------
loc_06df3c:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	addi.w #$b8,d0
	cmp.w ($14,a6),d0
	bcc.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.b #2,($23f,a6)
	addi.w #$ffcc,d0
	move.w d0,($14,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	addi.w #$3d,d0
	jmp loc_02a758

;----------------------------------------------
loc_06df86:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_06dfae
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06dfa0
	moveq #1,d0

loc_06dfa0:
	move.b d0,($ab,a6)
	moveq #9,d0
	moveq #$4c,d1
	jsr loc_082e36

loc_06dfae:
	rts

;----------------------------------------------
loc_06dfb0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_06dfdc
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06dfd6
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06dfd6:
	move.b loc_06dfde(pc,d0.w),($25d,a6)

loc_06dfdc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06dfde:
	dc.b $00,$00,$00,00

;----------------------------------------------
loc_06dfe2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06e012
	addq.b #2,(PL_Move_state,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06e014(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06e014+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06e014+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06e014+$c(pc,d0.w),(pl_y_drag,a6)

loc_06e012:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e014:
	dc.l $00080000,$fffff000,$fff98000,$ffff8000
	dc.l $00090000,$ffffe800,$fff90000,$ffff8000
	dc.l $000a0000,$ffffe000,$fff88000,$ffff8000

;----------------------------------------------
loc_06e044:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	addi.w #$3e,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e088:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06e0e4
	addq.b #2,(PL_Move_state,a6)
	tst.b ($5b,a6)
	beq.b loc_06e0a4
	bmi.b loc_06e0a4
	st.b ($dd,a6)

loc_06e0a4:
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b #1,($2c8,a6)
	move.b (PL_ButtonStrength,a6),d0
	move.b d0,($3a,a6)
	addq.b #2,($3a,a6)
	lsl.w #3,d0
	move.l loc_06e0f6(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06e0f6+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06e0f6+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06e0f6+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06e0f4
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06e0e4:
	tst.b ($34,a6)
	beq.b loc_06e0f4
	clr.b ($34,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_06e0f4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e0f6:
	dc.l $000a0000,$00000000,$00000000,$ffffe800
	dc.l $000c0000,$00000000,$00000000,$ffffe800
	dc.l $000e0000,$00000000,$00000000,$ffffe800

;----------------------------------------------
loc_06e126:
	tst.b ($5b,a6)
	beq.b loc_06e13c
	clr.b ($5b,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_06e13c
	move.b #1,($a8,a6)

loc_06e13c:
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.b loc_06e154
	jsr loc_02aa08
	bcs.b loc_06e154
	jmp loc_02a7ea

loc_06e154:
	addq.b #2,(PL_Move_state,a6)
	move.l #$40000,(pl_x_velocity,a6)
	move.l #$ffffc000,(pl_x_drag,a6)
	move.w ($64,a6),($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($5b,a6)
	move.b (PL_ButtonStrength,a6),d0
	add.w d0,d0
	addi.w #$3f,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e188:
	bsr.w loc_06f05a
	bpl.b loc_06e192
	addq.b #2,(PL_Move_state,a6)

loc_06e192:
	jmp loc_02a7ea

;----------------------------------------------
loc_06e198:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	bra.w loc_06e1dc

;==============================================
loc_06e1a4:
	tst.b ($107,a5)
	bne.b loc_06e1dc
	tst.b ($5b,a6)
	beq.b loc_06e1dc
	bmi.b loc_06e1dc
	cmpi.b #4,(PL_ButtonStrength,a6)
	bcs.b loc_06e1dc
	tst.b ($125,a6)
	bne.b loc_06e1d0
	btst #3,($11b,a6)
	beq.b loc_06e1dc
	btst #6,(PL_Buttons,a6)
	beq.b loc_06e1dc

loc_06e1d0:
	addq.b #2,(PL_Move_state,a6)
	moveq #$48,d0
	jmp loc_02a758

loc_06e1dc:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;----------------------------------------------
loc_06e1ec:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06e23c
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #4,d0
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	bne.b loc_06e21a
	neg.l d0

loc_06e21a:
	move.l d0,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	move.b #$10,($3a,a6)

loc_06e23c:
	rts

;----------------------------------------------
loc_06e23e:
	bsr.w loc_06f074
	subq.b #1,($3a,a6)
	bpl.b loc_06e24c
	addq.b #2,(PL_Move_state,a6)

loc_06e24c:
	rts

;----------------------------------------------
loc_06e24e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_06e274
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($dd,a6)
	move.l #$fffc0000,(pl_y_velocity,a6)
	move.l #$ffffc000,(pl_y_drag,a6)

loc_06e274:
	rts

;----------------------------------------------
loc_06e276:
	bsr.w loc_06f076
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	move.l #$fffc0000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	moveq #$49,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e2b6:
	bsr.w loc_06f074
	bpl.b loc_06e2d8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06e2d8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_06e2d8:
	tst.b ($35,a6)
	beq.w loc_06eff2
	rts

;----------------------------------------------
loc_06e2e2:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02bb26

;==============================================
;Jump Back
;==============================================
loc_06e2fa:
	move.b (PL_Move_state,a6),d0
	move.w loc_06e30a(pc,d0.w),d1
	jsr loc_06e30a(pc,d1.w)
	bra.w loc_06e574

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e30a:
	dc.w loc_06e31a-loc_06e30a
	dc.w loc_06e352-loc_06e30a
	dc.w loc_06e382-loc_06e30a
	dc.w loc_06e3f6-loc_06e30a
	dc.w loc_06e490-loc_06e30a
	dc.w loc_06e50a-loc_06e30a
	dc.w loc_06e520-loc_06e30a
	dc.w loc_06e538-loc_06e30a

;----------------------------------------------
loc_06e31a:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($2c8,a6)
	move.b #2,($23f,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b d0,($3c,a6)
	move.l d0,($84,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$67,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e352:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_06e380
	addq.b #2,(PL_Move_state,a6)
	move.b #$31,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06e372
	moveq #1,d0

loc_06e372:
	move.b d0,($ab,a6)
	moveq #-2,d0
	moveq #$1e,d1
	jsr loc_082e36

loc_06e380:
	rts

;----------------------------------------------
loc_06e382:
	subq.b #1,($3a,a6)
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.w loc_06e3f4
	bpl.b loc_06e3b2
	move.b #1,($34,a6)
	addi.w #$28,($14,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #$ffffa000,(pl_y_drag,a6)

loc_06e3b2:
	move.l (pl_y_velocity,a6),d0
	add.l d0,($14,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06e3f4
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	clr.l (pl_y_velocity,a6)
	clr.l (pl_y_drag,a6)
	move.w ($64,a6),($14,a6)
	move.w #$d0,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

loc_06e3f4:
	rts

;----------------------------------------------
loc_06e3f6:
	subq.b #1,($3a,a6)
	bpl.b loc_06e456
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($31,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06e41c
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06e41c:
	move.b loc_06e458(pc,d0.w),($25d,a6)
	move.b loc_06e45c(pc,d0.w),($3a,a6)
	moveq #0,d0
	move.b (PL_ButtonStrength,a6),d0
	lsl.w #3,d0
	move.l loc_06e460(pc,d0.w),(pl_x_velocity,a6)
	move.l loc_06e460+4(pc,d0.w),(pl_x_drag,a6)
	move.l loc_06e460+8(pc,d0.w),(pl_y_velocity,a6)
	move.l loc_06e460+$c(pc,d0.w),(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06e456
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06e456:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e458:
	dc.b $04,$08,$0c,00

loc_06e45c:
	dc.b $03,$06,$0a,$03

loc_06e460:
	dc.l $00050000,$00000000,$00030000,$ffffa000
	dc.l $00060000,$00000000,$00048000,$ffffa000
	dc.l $00070000,$00000000,$0006a000,$ffffa000

;----------------------------------------------
loc_06e490:
	jsr loc_02aa08
	bcs.b loc_06e4c4
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_06e4c4
	tst.b ($5b,a6)
	beq.b loc_06e4be
	clr.b ($5b,a6)
	subq.b #1,($3a,a6)
	beq.b loc_06e4c4

loc_06e4be:
	jmp loc_02a7ea

loc_06e4c4:
	move.b #$a,(PL_Move_state,a6)
	st.b ($3c,a6)
	move.l #$ffff0000,(pl_x_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$a0000,(pl_y_velocity,a6)
	move.l #$ffff8000,(pl_y_drag,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06e4fc
	neg.l (pl_x_velocity,a6)
	neg.l (pl_x_drag,a6)

loc_06e4fc:
	moveq #$12,d0
	add.b (PL_ButtonStrength,a6),d0
	asr.w #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e50a:
	jsr loc_02aa08
	bcc.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	moveq #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e520:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;----------------------------------------------
loc_06e538:
	st.b ($85,a6)
	movea.w ($276,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_06e55a
	tst.b ($3c,a4)
	bne.b loc_06e55a
	rts

loc_06e55a:
	moveq #0,d0
	move.b d0,($25d,a6)
	move.b d0,($263,a6)
	bsr.w loc_06e4c4
	move.l (pl_x_velocity,a6),d0
	add.l d0,d0
	move.l d0,(pl_x_velocity,a6)
	rts

;==============================================
loc_06e574:
	tst.b ($85,a6)
	bne.b loc_06e58c
	movea.w ($276,a6),a4
	moveq #0,d0
	move.b ($84,a6),d0
	move.w loc_06e58e(pc,d0.w),d1
	jmp loc_06e58e(pc,d1.w)

loc_06e58c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e58e:
	dc.w loc_06e598-loc_06e58e
	dc.w loc_06e5bc-loc_06e58e
	dc.w loc_06e5f4-loc_06e58e
	dc.w loc_06e60e-loc_06e58e
	dc.w loc_06e620-loc_06e58e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06e598:
	addq.b #2,($84,a6)
	move.b #1,($ce,a4)
	clr.b ($2c8,a4)
	move.b #$7f,($25d,a4)
	move.b #1,($263,a4)
	moveq #$58,d0
	moveq #2,d1
	jmp loc_02a83c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06e5bc:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	move.b #$1a,($25d,a4)
	clr.b ($263,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($10,a6),($10,a4)
	move.w ($64,a6),($14,a4)
	moveq #$6b,d0
	moveq #2,d1
	jsr loc_02a83c
	jmp loc_080744

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06e5f4:
	tst.b ($33,a4)
	bpl.w loc_06f0d4
	addq.b #2,($84,a6)
	movea.w ($276,a6),a4
	moveq #$6c,d0
	moveq #2,d1
	jmp loc_02a83c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06e60e:
	tst.b ($ab,a6)
	bne.b loc_06e61e
	addq.b #2,($84,a6)
	move.b #1,($31,a4)

loc_06e61e:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06e620:
	tst.b ($3c,a6)
	bne.b loc_06e646
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	movea.w ($276,a6),a4
	moveq #$6c,d0
	move.b ($35,a6),d1
	add.b d1,d0
	moveq #2,d1
	jmp loc_02a83c

loc_06e646:
	rts

;==============================================
;Dramatic Mode Super 2?
;==============================================
loc_06e648:
	move.b (PL_Move_state,a6),d0
	move.w loc_06e654(pc,d0.w),d1
	jmp loc_06e654(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e654:
	dc.w loc_06e65c-loc_06e654
	dc.w loc_06e686-loc_06e654
	dc.w loc_06e6b0-loc_06e654
	dc.w loc_06e6e2-loc_06e654

;----------------------------------------------
loc_06e65c:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($2c8,a6)
	move.b #2,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$65,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e686:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.b loc_06e6ae
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06e6a0
	moveq #1,d0

loc_06e6a0:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$3c,d1
	jsr loc_082e36

loc_06e6ae:
	rts

;----------------------------------------------
loc_06e6b0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_06e6dc
	addq.b #2,(PL_Move_state,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06e6d6
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06e6d6:
	move.b loc_06e6de(pc,d0.w),($25d,a6)

loc_06e6dc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e6de:
	dc.b $08,$0c,$10,00

;----------------------------------------------
loc_06e6e2:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	jmp loc_02baf2

;==============================================
;Psycho Streak
;==============================================
loc_06e6fa:
	move.b (PL_Move_state,a6),d0
	move.w loc_06e706(pc,d0.w),d1
	jmp loc_06e706(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e706:
	dc.w loc_06e70e-loc_06e706
	dc.w loc_06e736-loc_06e706
	dc.w loc_06e76a-loc_06e706
	dc.w loc_06e7a8-loc_06e706

;----------------------------------------------
loc_06e70e:
	addq.b #2,(PL_Move_state,a6)
	move.b #2,($23f,a6)
	clr.b ($2c8,a6)
	move.b #$44,($2a0,a6)
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$30,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e736:
	move.b #2,($23f,a6)
	tst.b ($35,a6)
	bpl.b loc_06e764
	addq.b #2,(PL_Move_state,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06e750
	moveq #1,d0

loc_06e750:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$5b,d1
	jsr loc_082e36
	jsr loc_07565c

loc_06e764:
	jmp loc_02a7ea

;----------------------------------------------
loc_06e76a:
	move.b #2,($23f,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_06e7a2
	addq.b #2,(PL_Move_state,a6)
	move.b #$5a,($3b,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_06e79c
	move.b (PL_ButtonStrength,a6),d0
	lsr.b #1,d0

loc_06e79c:
	move.b loc_06e7a4(pc,d0.w),($25d,a6)

loc_06e7a2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e7a4:
	dc.b $02,$04,$06,00

;----------------------------------------------
loc_06e7a8:
	subq.b #1,($3b,a6)
	beq.w loc_06efe6
	jmp loc_02a7ea

;==============================================
;Taunt
;==============================================
loc_06e7b6:
	move.b (PL_Move_state,a6),d0
	move.w loc_06e7c2(pc,d0.w),d1
	jmp loc_06e7c2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e7c2:
	dc.w loc_06e7c6-loc_06e7c2
	dc.w loc_06e7e6-loc_06e7c2

;----------------------------------------------
loc_06e7c6:
	addq.b #2,(PL_Move_state,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_06e7da
	subq.b #1,(pl_taunt_count,a6)

loc_06e7da:
	clr.b ($2c8,a6)
	moveq #$4d,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e7e6:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2


;##############################################
;Throws
;##############################################
loc_06e7f4:
	cmpi.b #4,($80,a6)
	beq.w loc_06ea60
	move.b (PL_Move_state,a6),d0
	move.w loc_06e80a(pc,d0.w),d1
	jmp loc_06e80a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06e80a:
	dc.w loc_06e824-loc_06e80a
	dc.w loc_06e838-loc_06e80a
	dc.w loc_06e8b8-loc_06e80a
	dc.w loc_06e8c6-loc_06e80a
	dc.w loc_06e8e2-loc_06e80a
	dc.w loc_06e906-loc_06e80a
	dc.w loc_06e930-loc_06e80a
	dc.w loc_06e93e-loc_06e80a

	dc.w loc_06e976-loc_06e80a
	dc.w loc_06e9b2-loc_06e80a
	dc.w loc_06e9ca-loc_06e80a
	dc.w loc_06ea0e-loc_06e80a
	dc.w loc_06ea52-loc_06e80a

;----------------------------------------------
loc_06e824:
	addq.b #2,(PL_Move_state,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2d,d0
	jmp loc_02a758

;----------------------------------------------
loc_06e838:
	tst.b ($35,a6)
	beq.w loc_06eff2
	moveq #$55,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_06e84a
	moveq #$56,d0

loc_06e84a:
	jsr loc_02e3fe
	beq.b loc_06e8ae
	tst.b ($125,a6)
	beq.b loc_06e878
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06e886
	move.b #1,(PL_Flip,a6)
	bra.b loc_06e886

loc_06e878:
	btst.b #0,($371,a6)
	beq.b loc_06e886
	eori.b #1,(PL_Flip,a6)

loc_06e886:
	move.b #6,(PL_Move_state,a6)
	moveq #$1e,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_06e8a2
	move.b #$e,(PL_Move_state,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$1d,d0

loc_06e8a2:
	jsr loc_02a758
	jmp loc_02fa36

loc_06e8ae:
	addq.b #2,(PL_Move_state,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06e8b8:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	jmp loc_02baf2

;----------------------------------------------
loc_06e8c6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_06eff8
	bmi.w loc_06f000
	addq.b #2,(PL_Move_state,a6)
	clr.b ($35,a6)
	rts

;----------------------------------------------
loc_06e8e2:
	tst.b ($35,a6)
	beq.b loc_06e8fa
	addq.b #2,(PL_Move_state,a6)
	move.b #$30,($123,a5)
	moveq #$5c,d0
	jsr loc_02e970

loc_06e8fa:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06e906:
	tst.b ($35,a6)
	bpl.b loc_06e924
	addq.b #2,(PL_Move_state,a6)
	jsr loc_02a7ea
	jsr loc_02f9be
	moveq #$55,d0
	jmp loc_02e7f2

loc_06e924:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_06e930:
	tst.b ($33,a6)
	bmi.w loc_06efec
	jmp loc_02a7ea

;----------------------------------------------
loc_06e93e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_06f000
	addq.b #2,(PL_Move_state,a6)
	move.l #$ffff0000,(pl_x_velocity,a6)
	move.l #$40000,(pl_y_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$ffff9000,(pl_y_drag,a6)
	jmp loc_02f9be

;----------------------------------------------
loc_06e976:
	cmpi.b #2,($35,a6)
	beq.b loc_06e984
	jsr loc_02a7ea

loc_06e984:
	bsr.w loc_06f074
	bpl.b loc_06e9ac
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06e9ac
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_06e9ac:
	jmp loc_02f9be

;----------------------------------------------
loc_06e9b2:
	addq.b #2,(PL_Move_state,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5d,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_06e9ca:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_06effa
	addq.b #2,(PL_Move_state,a6)
	clr.b ($35,a6)
	move.l #$13000,(pl_x_velocity,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$ffff5000,(pl_y_drag,a6)
	jsr loc_02f9be
	moveq #$56,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_06ea0e:
	tst.b ($35,a6)
	bne.b loc_06ea20
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_06ea20:
	bsr.w loc_06f074
	bpl.w loc_06eff8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06ea52:
	tst.b ($33,a6)
	bmi.w loc_06efe6
	jmp loc_02a7ea

;==============================================
;Air Throw
;==============================================
loc_06ea60:
	move.b (PL_Move_state,a6),d0
	move.w loc_06ea6c(pc,d0.w),d1
	jmp loc_06ea6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ea6c:
	dc.w loc_06ea84-loc_06ea6c
	dc.w loc_06eb40-loc_06ea6c
	dc.w loc_06eb56-loc_06ea6c
	dc.w loc_06eb90-loc_06ea6c
	dc.w loc_06ebde-loc_06ea6c
	dc.w loc_06ec0a-loc_06ea6c
	dc.w loc_06ec34-loc_06ea6c
	dc.w loc_06ec54-loc_06ea6c

	dc.w loc_06ec6a-loc_06ea6c
	dc.w loc_06ecce-loc_06ea6c
	dc.w loc_06ecec-loc_06ea6c
	dc.w loc_06ed24-loc_06ea6c

;----------------------------------------------
loc_06ea84:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$71,d0
	tst.b (PL_Attacktype,a6)
	beq.b loc_06ea96
	moveq #$72,d0

loc_06ea96:
	jsr loc_02e636
	beq.w loc_06eb34
	tst.b ($125,a6)
	beq.b loc_06eac6
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06ead4
	move.b #1,(PL_Flip,a6)
	bra.b loc_06ead4

loc_06eac6:
	btst.b #0,($371,a6)
	beq.b loc_06ead4
	eori.b #1,(PL_Flip,a6)

loc_06ead4:
	tst.b (PL_Attacktype,a6)
	bne.b loc_06eaf4
	move.b #4,(PL_Move_state,a6)
	move.b #$c,($3b,a6)
	moveq #$20,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_06eaf4:
	move.b #$e,(PL_Move_state,a6)
	eori.b #1,(PL_Flip,a6)
	move.l #0,(pl_x_velocity,a6)
	move.l #0,(pl_y_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$ffffc000,(pl_y_drag,a6)
	move.b #$c,($3b,a6)
	moveq #$1f,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_06eb34:
	addq.b #2,(PL_Move_state,a6)
	moveq #$2e,d0
	jmp loc_02a758

;----------------------------------------------
loc_06eb40:
	jsr loc_02aa08
	bcc.w loc_06eff2
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_06eb56:
	subq.b #1,($3b,a6)
	bpl.w loc_06effa
	addq.b #2,(PL_Move_state,a6)
	clr.b ($3b,a6)
	jmp loc_02f9be

;==============================================
loc_06eb6c:
	move.l (pl_x_velocity,a6),d0
	beq.b loc_06eb7e
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)

loc_06eb7e:
	move.l (pl_y_velocity,a6),d0
	add.l d0,($14,a6)
	move.l (pl_y_drag,a6),d0
	add.l d0,(pl_y_velocity,a6)
	rts

;----------------------------------------------
loc_06eb90:
	bsr.b loc_06eb6c
	bpl.b loc_06eba2
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	bcc.b loc_06ebc0

loc_06eba2:
	tst.b ($35,a6)
	bne.b loc_06ebb4
	jsr loc_02a7ea
	jmp loc_02f9be

loc_06ebb4:
	addq.b #2,(PL_Move_state,a6)
	moveq #$57,d0
	jmp loc_02e7f2

loc_06ebc0:
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b #$a,(PL_Move_state,a6)
	jsr loc_00369c
	moveq #$2f,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ebde:
	bsr.b loc_06eb6c
	bpl.w loc_06eff2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff2
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_06ec0a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.w loc_06eff8
	addq.b #2,(PL_Move_state,a6)
	move.w ($64,a6),d0
	subi.w #8,d0
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #$57,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_06ec34:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06ec46
	move.w ($64,a6),($14,a6)

loc_06ec46:
	tst.b ($33,a6)
	bpl.w loc_06eff8
	jmp loc_02bb26

;----------------------------------------------
loc_06ec54:
	subq.b #1,($3b,a6)
	bpl.w loc_06f000
	addq.b #2,(PL_Move_state,a6)
	clr.b ($3b,a6)
	jmp loc_02fa36

;----------------------------------------------
loc_06ec6a:
	tst.b ($35,a6)
	bne.b loc_06ec76
	jsr loc_02a7ea

loc_06ec76:
	bsr.w loc_06f074
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06effa
	move.w d0,($14,a6)
	clr.w ($16,a6)
	tst.b ($35,a6)
	beq.w loc_06effa
	addq.b #2,(PL_Move_state,a6)
	move.l #$20000,(pl_x_velocity,a6)
	move.l #$80000,(pl_y_velocity,a6)
	move.l #0,(pl_x_drag,a6)
	move.l #$ffffa000,(pl_y_drag,a6)
	move.b #$30,(-$7edd,a6)
	moveq #$5e,d0
	jsr loc_02e970
	jmp loc_02f9be

;----------------------------------------------
loc_06ecce:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bpl.w loc_06effa
	addq.b #2,(PL_Move_state,a6)
	clr.b ($35,a6)
	moveq #$58,d0
	jmp loc_02e7f2

;----------------------------------------------
loc_06ecec:
	tst.b ($35,a6)
	bne.b loc_06ecf8
	jsr loc_02a7ea

loc_06ecf8:
	bsr.w loc_06f074
	bpl.w loc_06eff8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06eff8
	addq.b #2,(PL_Move_state,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jmp loc_00369c

;----------------------------------------------
loc_06ed24:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_06efec
	rts

;##############################################
;Winposes
;##############################################
loc_06ed34:
	move.b (6,a6),d0
	move.w loc_06ed40(pc,d0.w),d1
	jmp loc_06ed40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ed40:
	dc.w loc_06ed4a-loc_06ed40
	dc.w loc_06ed60-loc_06ed40
	dc.w loc_06ed72-loc_06ed40
	dc.w loc_06eddc-loc_06ed40
	dc.w loc_06ee20-loc_06ed40

;----------------------------------------------
loc_06ed4a:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.w ($84,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_06ed60:
	tst.b ($11c,a5)
	bne.w loc_06eff2
	addq.b #2,(6,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_06ed72:
	move.b #8,(6,a6)
	moveq #0,d6
	move.b #$3c,($3a,a6)
	st.b ($85,a6)
	move.w #$258,(pl_x_velocity,a6)
	tst.w ($276,a6)
	beq.b loc_06ed98
	move.b #6,(6,a6)
	moveq #$10,d6

loc_06ed98:
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.b loc_06edac
	jsr RNGFunction
	andi.w #$f,d0

loc_06edac:
	add.b d6,d0
	move.b loc_06edbc(pc,d0.w),d0
	move.b d0,($84,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06edbc:
	dc.b $00,$01,$02,$03,$00,$01,$02,$03
	dc.b $00,$01,$02,$03,$00,$01,$02,$03
	dc.b $04,$05,$06,$04,$05,$06,$04,$05
	dc.b $06,$04,$05,$06,$04,$05,$06,$04

;----------------------------------------------
loc_06eddc:
	subq.w #1,(pl_x_velocity,a6)
	bmi.w loc_06ee12
	movea.w ($276,a6),a4
	tst.w ($50,a4)
	bmi.b loc_06ee08
	cmpi.w #$208,(4,a4)
	bne.b loc_06ee0c
	tst.b ($85,a4)
	beq.b loc_06ee0c
	move.b ($84,a6),($84,a4)
	move.b #8,(6,a4)

loc_06ee08:
	addq.b #2,(6,a6)

loc_06ee0c:
	jmp loc_02a7ea

loc_06ee12:
	addq.b #2,(6,a6)
	clr.b ($84,a6)
	jmp loc_02a7ea

;----------------------------------------------
;Winpose programming jump
loc_06ee20:
	move.b ($84,a6),d0
	add.w d0,d0
	move.w loc_06ee2e(pc,d0.w),d1
	jmp loc_06ee2e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ee2e:
	dc.w loc_06ee3c-loc_06ee2e
	dc.w loc_06ee3c-loc_06ee2e
	dc.w loc_06ee3c-loc_06ee2e
	dc.w loc_06ee90-loc_06ee2e
	dc.w loc_06eeba-loc_06ee2e
	dc.w loc_06eef4-loc_06ee2e
	dc.w loc_06eef4-loc_06ee2e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06ee3c:
	move.b (PL_Move_state,a6),d0
	move.w loc_06ee48(pc,d0.w),d1
	jmp loc_06ee48(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ee48:
	dc.w loc_06ee4c-loc_06ee48
	dc.w loc_06ee5e-loc_06ee48

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ee4c:
	addq.b #2,(PL_Move_state,a6)
	move.b ($84,a6),d0
	addi.b #$23,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ee5e:
	cmpi.b #1,($35,a6)
	bne.w loc_06ee86
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	beq.w loc_06ee86
	move.b #$44,($2a0,a6)
	jsr loc_0a3f9e

loc_06ee86:
	bsr.w loc_06ef68
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06ee90:
	move.b (PL_Move_state,a6),d0
	move.w loc_06ee9c(pc,d0.w),d1
	jmp loc_06ee9c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ee9c:
	dc.w loc_06eea0-loc_06ee9c
	dc.w loc_06eeb0-loc_06ee9c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06eea0:
	addq.b #2,(PL_Move_state,a6)
	clr.b (PL_Flip,a6)
	moveq #$25,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06eeb0:
	bsr.w loc_06ef68
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06eeba:
	movea.w ($276,a6),a4
	move.b (PL_Move_state,a6),d0
	move.w loc_06eeca(pc,d0.w),d1
	jmp loc_06eeca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06eeca:
	dc.w loc_06eece-loc_06eeca
	dc.w loc_06eeea-loc_06eeca

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06eece:
	addq.b #2,(PL_Move_state,a6)
	clr.b (PL_Flip,a6)
	moveq #$25,d0
	move.w ($10,a6),d1
	cmp.w ($10,a4),d1
	bcc.b loc_06eee4
	moveq #$26,d0

loc_06eee4:
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06eeea:
	bsr.w loc_06ef68
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06eef4:
	movea.w ($276,a6),a4
	move.b (PL_Move_state,a6),d0
	move.w loc_06ef04(pc,d0.w),d1
	jmp loc_06ef04(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ef04:
	dc.w loc_06ef0c-loc_06ef04
	dc.w loc_06ef18-loc_06ef04
	dc.w loc_06ef4a-loc_06ef04
	dc.w loc_06ef5e-loc_06ef04

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ef0c:
	addq.b #2,(PL_Move_state,a6)
	moveq #$58,d0
	jmp loc_02a758

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ef18:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	move.w #$a0,d0
	cmpi.b #5,($84,a6)
	beq.b loc_06ef34
	move.w #$e8,d0

loc_06ef34:
	add.w ($290,a5),d0
	move.w d0,($10,a6)
	move.b #0,(PL_Flip,a6)
	moveq #$59,d0
	jmp loc_02a758

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ef4a:
	tst.b ($33,a6)
	bpl.w loc_06eff2
	addq.b #2,(PL_Move_state,a6)
	moveq #$27,d0
	jmp loc_02a708

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_06ef5e:
	bsr.w loc_06ef68
	jmp loc_02a7ea

;==============================================
loc_06ef68:
	subq.b #1,($3a,a6)
	bpl.w loc_06eff8
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)
	rts

;==============================================
loc_06ef7a:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_5,a6)
	movem.l d0-d1,(pl_inp_slot_6,a6)
	movem.l d0-d1,(pl_inp_slot_7,a6)
	movem.l d0-d1,(pl_inp_slot_8,a6)
	movem.l d0-d1,(pl_inp_slot_9,a6)
	movem.l d0-d1,($1d0,a6)
	movem.l d0-d1,($1d8,a6)
	movem.l d0-d1,($1e0,a6)
	movem.l d0-d1,($1e8,a6)
	movem.l d0-d1,($380,a6)
	movem.l d0-d1,($388,a6)
	movem.l d0-d1,($390,a6)
	rts

;==============================================
loc_06efe6:
	jmp loc_02baf2


;==============================================
loc_06efec:
	jmp loc_02bb26

;==============================================
loc_06eff2:
	jmp loc_02a7ea

;==============================================
loc_06eff8:
	rts

;==============================================
loc_06effa:
	jmp loc_02f9be

;==============================================
loc_06f000:
	jmp loc_02fa36

;==============================================
loc_06f006:
	jsr loc_02bb5a
	move.l #$02000e00,(4,a6)
	move.b #$1a,(pl_move_id,a6)
	move.b #$7f,($25d,a6)
	move.b #1,($263,a6)
	moveq #$58,d0
	jmp loc_02a758

;==============================================
loc_06f02e:
	move.b #$1a,($25d,a6)
	clr.b ($263,a6)
	moveq #$59,d0
	jmp loc_02a758

;==============================================
loc_06f040:
	move.w ($276,a6),d1
	beq.b loc_06f058
	movea.w d1,a4
	tst.b ($125,a4)
	beq.b loc_06f058
	move.w #$202,($200,a4)
	move.w d0,($202,a4)

loc_06f058:
	rts

;==============================================
loc_06f05a:
	move.l (pl_x_velocity,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_06f066
	neg.l d0

loc_06f066:
	add.l d0,($10,a6)
	move.l (pl_x_drag,a6),d0
	add.l d0,(pl_x_velocity,a6)
	rts

;==============================================
loc_06f074:
	bsr.b loc_06f05a

;==============================================
loc_06f076:
	move.l (pl_y_velocity,a6),d0
	add.l d0,($14,a6)
	add.l (pl_y_drag,a6),d0
	move.l d0,(pl_y_velocity,a6)
	rts

;==============================================
loc_06f088:
	move.l a0,($6c,a6)
	move.l a4,($70,a6)
	move.w ($276,a6),d0
	beq.b loc_06f0b6
	movea.w d0,a4
	cmpi.b #$1f,($102,a4)
	bne.b loc_06f0b6
	tst.w ($50,a4)
	bmi.b loc_06f0b6
	tst.b ($b9,a4)
	bne.b loc_06f0b6
	movea.l ($1c,a4),a0
	tst.b ($13,a0)
	bne.b loc_06f0c2

loc_06f0b6:
	movea.l ($6c,a6),a0
	movea.l ($70,a6),a4
	moveq #0,d0
	rts

loc_06f0c2:
	movea.l ($6c,a6),a0
	movea.l ($70,a6),a4
	moveq #1,d0
	rts

;==============================================
loc_06f0ce:
	jmp loc_02baf2

;==============================================
loc_06f0d4:
	jmp loc_02a8ca

;##############################################
;
;##############################################
loc_06f0da:
	dc.w loc_06f11e-loc_06f0da
	dc.w loc_06f11e-loc_06f0da
	dc.w loc_06f0e0-loc_06f0da

loc_06f0e0:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$06,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02

loc_06f11e:
	dc.b $08,$0a,$08,$0a,$06,$06,$06,$06
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02
