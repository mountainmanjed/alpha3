;##############################################
;Winposes
;##############################################
loc_069b00:
	move.b (6,a6),d0
	move.w loc_069b0c(pc,d0.w),d1
	jmp loc_069b0c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069b0c:
	dc.w loc_069b14-loc_069b0c
	dc.w loc_069b26-loc_069b0c
	dc.w loc_069b3c-loc_069b0c
	dc.w loc_069b86-loc_069b0c

;==============================================
loc_069b14:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_069b26:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_069b36
	tst.b ($11c,a5)
	bne.b loc_069b36
	addq.b #2,(6,a6)

loc_069b36:
	jmp loc_02a7ea

;==============================================
loc_069b3c:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	subq.b #2,d0
	bpl.b loc_069b5e
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_069b70(pc,d0.w),d0
	add.w d0,d0

loc_069b5e:
	move.b d0,($2c4,a6)
	lsr.b #1,d0
	ext.w d0
	move.b loc_069b80(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069b70:
	dc.b $00,$00,$00,$04,$01,$01,$01,$04
	dc.b $02,$02,$02,$04,$03,$03,$03,$04

loc_069b80:
	dc.b $23,$24,$25,$25,$25,$25

;==============================================
loc_069b86:
	move.b ($2c4,a6),d0
	move.w loc_069b92(pc,d0.w),d1
	jmp loc_069b92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069b92:
	dc.w loc_069b9e-loc_069b92
	dc.w loc_069b9e-loc_069b92
	dc.w loc_069ba8-loc_069b92
	dc.w loc_069ba8-loc_069b92
	dc.w loc_069ba8-loc_069b92
	dc.w loc_069b9e-loc_069b92

;----------------------------------------------
loc_069b9e:
	bsr.w loc_069bd4
	jmp loc_02a7ea

;----------------------------------------------
loc_069ba8:
	tst.b (7,a6)
	bne.b loc_069bca
	addq.b #2,(7,a6)
	jsr loc_01c2c8
	beq.b loc_069bca
	move.l #$1003e00,(a4)
	move.b ($2c4,a6),(3,a4)
	move.w a6,($36,a4)

loc_069bca:
	bsr.w loc_069bd4
	jmp loc_02a7ea

;==============================================
loc_069bd4:
	tst.b ($3a,a6)
	beq.b loc_069be8
	subq.b #1,($3a,a6)
	bne.b loc_069be8
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_069be8:
	rts

;##############################################
;Intro
;##############################################
loc_069bea:
	move.b (7,a6),d0
	move.w loc_069bf6(pc,d0.w),d1
	jmp loc_069bf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069bf6:
	dc.w loc_069c10-loc_069bf6
	dc.w loc_069c46-loc_069bf6
	dc.w loc_069c66-loc_069bf6
	dc.w loc_069cc4-loc_069bf6
	dc.w loc_069d10-loc_069bf6
	dc.w loc_069d24-loc_069bf6
	dc.w loc_069d3c-loc_069bf6
	dc.w loc_069d56-loc_069bf6

	dc.w loc_069d24-loc_069bf6
	dc.w loc_069d76-loc_069bf6
	dc.w loc_069db2-loc_069bf6
	dc.w loc_069e0a-loc_069bf6
	dc.w loc_069d24-loc_069bf6

;==============================================
loc_069c10:
	movea.w ($38,a6),a4
	tst.b (PL_cpucontrol,a6)
	beq.b loc_069c34
	tst.b ($125,a4)
	bne.b loc_069c34
	cmpi.b #$d,($102,a4)
	beq.w loc_069c46
	cmpi.b #7,($102,a4)
	beq.w loc_069c46

loc_069c34:
	jsr RNGFunction
	andi.b #1,d0
	beq.w loc_069d76
	bra.w loc_069d3c

;==============================================
loc_069c46:
	jsr loc_093e5e
	beq.b loc_069c64
	move.b #4,(7,a6)
	clr.b ($a,a6)
	clr.b (1,a6)
	moveq #$40,d0
	jmp loc_02a708

loc_069c64:
	rts

;==============================================
loc_069c66:
	tst.b ($a,a6)
	beq.b loc_069cc2
	addq.b #2,(7,a6)
	move.b #1,(1,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d1
	moveq #$24,d0
	tst.b ($101,a6)
	beq.b loc_069c8c
	move.w #$15c,d0

loc_069c8c:
	add.w d1,d0
	move.w d0,($10,a6)
	move.w ($64,a6),d0
	addi.w #$58,d0
	move.w d0,($14,a6)
	move.l #$18000,($40,a6)
	move.l #$30000,($44,a6)
	move.l #$ffffbbbb,($4c,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

loc_069cc2:
	rts

;==============================================
loc_069cc4:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_069cd0
	neg.l d0

loc_069cd0:
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06b644
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$41,d0
	jmp loc_02a708

;==============================================
loc_069d10:
	tst.b ($a,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #$42,d0
	jmp loc_02a708

;==============================================
loc_069d24:
	tst.b ($33,a6)
	bpl.w loc_06b644
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_069d3c:
	move.b #$e,(7,a6)
	move.w ($64,a6),($14,a6)
	move.b #6,($3b,a6)
	moveq #$22,d0
	jmp loc_02a708

;==============================================
loc_069d56:
	tst.b ($35,a6)
	beq.w loc_06b644
	clr.b ($35,a6)
	subq.b #1,($3b,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #$29,d0
	jmp loc_02a758

;==============================================
loc_069d76:
	move.b #$14,(7,a6)
	clr.b (1,a6)
	move.w #$80,($3a,a6)
	jsr loc_01c2c8
	beq.b loc_069daa
	move.l #$01003e00,(a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	beq.b loc_069daa
	move.l #$01003e02,(a4)
	move.w a6,($36,a4)

loc_069daa:
	moveq #$13,d0
	jmp loc_02a708

;==============================================
loc_069db2:
	subq.w #1,($3a,a6)
	bpl.b loc_069e08
	addq.b #2,(7,a6)
	move.b #1,(1,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d1
	moveq #-$18,d0
	tst.b ($101,a6)
	beq.b loc_069dd8
	move.w #$198,d0

loc_069dd8:
	add.w d1,d0
	move.w d0,($10,a6)
	move.w ($64,a6),d0
	addi.w #$58,d0
	move.w d0,($14,a6)
	move.l #$30000,($40,a6)
	move.l #$30000,($44,a6)
	move.l #$ffffbbbb,($4c,a6)
	move.b #1,($31,a6)

loc_069e08:
	rts

;==============================================
loc_069e0a:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_069e16
	neg.l d0

loc_069e16:
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06b644
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_069e56:
	tst.b ($80,a6)
	bne.w loc_069fa4
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_069eda
	move.b ($82,a6),d0
	move.w loc_069e76(pc,d0.w),d1
	jmp loc_069e76(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069e76:
	dc.w loc_069e7c-loc_069e76
	dc.w loc_069e7c-loc_069e76
	dc.w loc_069e7c-loc_069e76

;==============================================
;Punches
;==============================================
loc_069e7c:
	move.b (7,a6),d0
	move.w loc_069e8c(pc,d0.w),d1
	jsr loc_069e8c(pc,d1.w)
	bra.w loc_069f88

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069e8c:
	dc.w loc_069e90-loc_069e8c
	dc.w loc_069ed4-loc_069e8c

;----------------------------------------------
loc_069e90:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	moveq #0,d1
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	move.w loc_069ece(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_069ec8
	addq.b #1,d0

loc_069ec8:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069ece:
	dc.w $0020,$0020,$0058

;----------------------------------------------
loc_069ed4:
	jmp loc_02f5ac

;==============================================
;Kick Strength
;==============================================
loc_069eda:
	move.b ($82,a6),d0
	move.w loc_069eea(pc,d0.w),d1
	jsr loc_069eea(pc,d1.w)
	bra.w loc_069f88

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069eea:
	dc.w loc_069ef0-loc_069eea
	dc.w loc_069ef0-loc_069eea
	dc.w loc_069ef0-loc_069eea

;==============================================
;Kicks
;==============================================
loc_069ef0:
	move.b (7,a6),d0
	move.w loc_069efc(pc,d0.w),d1
	jmp loc_069efc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069efc:
	dc.w loc_069f04-loc_069efc
	dc.w loc_069f60-loc_069efc
	dc.w loc_069f66-loc_069efc
	dc.w loc_069f7a-loc_069efc

;----------------------------------------------
loc_069f04:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	moveq #0,d1
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b d1,d0
	move.w loc_069f5a(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_069f3c
	addq.b #1,d0

loc_069f3c:
	cmpi.b #2,($82,a6)
	bne.b loc_069f54
	btst #1,($83,a6)
	beq.b loc_069f54
	move.b #4,(7,a6)
	moveq #$1e,d0

loc_069f54:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069f5a:
	dc.w $0020,$0040,$0058

;----------------------------------------------
loc_069f60:
	jmp loc_02f5ac

;----------------------------------------------
loc_069f66:
	clr.b ($31,a6)
	tst.b ($35,a6)
	bpl.b loc_069f74
	addq.b #2,(7,a6)

loc_069f74:
	jmp loc_02a7ea

;----------------------------------------------
loc_069f7a:
	tst.b ($33,a6)
	bmi.w loc_06b638
	jmp loc_02a7ea

;==============================================
loc_069f88:
	moveq #0,d0
	move.b ($34,a6),d0
	beq.b loc_069fa2
	clr.b ($34,a6)
	ext.w d0
	tst.b (PL_Flip,a6)
	bne.b loc_069f9e
	neg.w d0

loc_069f9e:
	add.w d0,($10,a6)

loc_069fa2:
	rts

;==============================================
;Crouching
;==============================================
loc_069fa4:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_069fb6(pc,d0.w),d1
	jmp loc_069fb6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069fb6:
	dc.w loc_069fba-loc_069fb6
	dc.w loc_069ff0-loc_069fb6

;----------------------------------------------
loc_069fba:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	beq.b loc_069fe6
	addq.b #3,d1

loc_069fe6:
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_069ff0:
	jmp loc_02f5ac

;##############################################
;Air Normals
;##############################################
loc_069ff6:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_06a020
	moveq #$18,d0

loc_06a020:
	tst.b ($81,a6)
	beq.b loc_06a028
	addq.w #3,d0

loc_06a028:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Move Inputs
;##############################################
loc_06a038:
	jsr SPButton_Vism_code
	bne.w loc_06a318

loc_06a042:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_06a178

loc_06a050:
	lea.l (pl_inp_slot_8,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_06a142

loc_06a05e:
	lea.l (pl_inp_slot_3,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_623P_code
	bne.w loc_06a25e

loc_06a072:
	lea.l (pl_inp_slot_9,a6),a4
	jsr SpInp_360RotK_code
	bne.w loc_06a2ee

loc_06a080:
	lea.l (pl_inp_slot_2,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_2369P_Code
	bne.w loc_06a28c

loc_06a094:
	lea.l (pl_inp_slot_0,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_236P_code
	bne.w loc_06a2ba

loc_06a0a8:
	lea.l (pl_inp_slot_1,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_623K_code
	bne.w loc_06a230

loc_06a0bc:
	lea.l (pl_inp_slot_7,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_421P_code
	bne.w loc_06a112

loc_06a0d0:
	lea.l (pl_inp_slot_4,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_214P_code
	bne.w loc_06a1b0

loc_06a0e4:
	lea.l (pl_inp_slot_4,a6),a4
	move.b #1,(7,a4)
	jsr SpInp_214K_code
	bne.w loc_06a1e2

loc_06a0f8:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_06a37c

loc_06a106:
	jsr SPButton_Taunt_code
	bne.w loc_06a414

loc_06a110:
	rts

;----------------------------------------------
loc_06a112:
	jsr loc_02ed00
	beq.b loc_06a0d0
	move.l #$02000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	clr.b ($1fe,a6)
	bsr.w loc_06b0de
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06a142:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06a05e
	jsr loc_02ecd8
	beq.w loc_06a05e
	move.l #$02001000,(4,a6)
	move.b #$12,(pl_move_id,a6)
	clr.b ($1fe,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_06a178:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_06a050
	jsr loc_02ecd8
	beq.w loc_06a050
	move.l #$02001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	clr.b ($1fe,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_06a1b0:
	jsr loc_02ed00
	beq.w loc_06a0e4
	move.l #$02000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	clr.b ($1fe,a6)
	clr.b ($81,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06a1e2:
	jsr loc_02ed00
	beq.w loc_06a0f8
	move.l #$02000e02,(4,a6)
	move.b #$a,(pl_move_id,a6)
	clr.b ($1fe,a6)
	move.b #2,($81,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
;Game Mechanic loc_0234de and loc_023510
loc_06a216:
	move.l #$02000e06,(4,a1)
	move.b #$a,($aa,a1)
	clr.b ($1fe,a1)
	move.b #1,($a9,a1)
	rts

;----------------------------------------------
loc_06a230:
	jsr loc_02ed00
	beq.w loc_06a0bc
	move.l #$02000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	clr.b ($1fe,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06a25e:
	jsr loc_02ed00
	beq.w loc_06a072
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	clr.b ($1fe,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06a28c:
	jsr loc_02ed00
	beq.w loc_06a094
	clr.b ($1fe,a6)
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06a2ba:
	jsr loc_02ed00
	beq.w loc_06a0a8
	move.b #1,($1fe,a6)
	move.l #$02000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	bsr.w loc_06b0de
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;----------------------------------------------
loc_06a2ee:
	jsr loc_02ed00
	beq.w loc_06a080
	move.l #$02000e00,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_06a318:
	tst.b ($28a,a6)
	bne.w loc_06a042
	tst.b ($31,a6)
	bne.w loc_06a356
	jsr loc_02ef54
	beq.w loc_06a042
	jsr loc_02ecd8
	beq.w loc_06a042
	move.l #$02001000,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_06a356:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_06a042
	jsr loc_02ed28
	beq.w loc_06a042
	move.l #$02001000,(4,a6)
	move.b #0,(pl_move_id,a6)
	jmp loc_02f980

;----------------------------------------------
loc_06a37c:
	jsr loc_02edf8
	beq.w loc_06a106

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_06a386:
	tst.b (PL_ism_choice,a6)
	bne.w loc_06a3d2
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$18,($5f,a4)
	move.b #$1c,(pl_invinciblity_timer,a6)
	clr.b ($81,a6)
	moveq #$c,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_06a3d2:
	move.l #$02000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b #1,(pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$17,($5f,a4)
	move.b #$1b,(pl_invinciblity_timer,a6)
	move.b #2,($81,a6)
	moveq #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a414:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_06a422
	tst.b (pl_taunt_count,a6)
	beq.w loc_06a110

loc_06a422:
	jsr loc_02ed00
	beq.w loc_06a110
	move.l #$02000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;==============================================
loc_06a442:
	clr.b ($1fb,a6)
	tst.b ($34,a6)
	beq.b loc_06a452
	move.b #1,($1fb,a6)

loc_06a452:
	rts

;##############################################
;AI Move Checks
;##############################################
loc_06a454:
	move.b (pl_move_id,a6),d0
	move.w loc_06a460(pc,d0.w),d1
	jmp loc_06a460(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a460:
	dc.w loc_06a492-loc_06a460
	dc.w loc_06a48a-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a47a-loc_06a460
	dc.w loc_06a49c-loc_06a460

	dc.w loc_06a492-loc_06a460
	dc.w loc_06a492-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a49c-loc_06a460
	dc.w loc_06a49c-loc_06a460

;----------------------------------------------
loc_06a47a:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_06a4a0
	tst.b (pl_taunt_count,a6)
	beq.w loc_06a4a4

;----------------------------------------------
loc_06a48a:
	move.b #1,($1fe,a6)
	bra.b loc_06a4a0

;----------------------------------------------
loc_06a492:
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_06a4a4

;----------------------------------------------
loc_06a49c:
	clr.b ($1fe,a6)

;==============================================
loc_06a4a0:
	moveq #1,d0
	rts

;==============================================
loc_06a4a4:
	moveq #0,d0
	rts


;##############################################
;Special Move Programming
;##############################################
loc_06a4a8:
	move.b (pl_move_id,a6),d0
	move.w loc_06a4b4(pc,d0.w),d1
	jmp loc_06a4b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a4b4:
	dc.w loc_06a4ce-loc_06a4b4;00 Vism Activate
	dc.w loc_06a550-loc_06a4b4;02 Guren Ken
	dc.w loc_06a828-loc_06a4b4;04 Ressen Ha
	dc.w loc_06a954-loc_06a4b4;06 Hou Shou
	dc.w loc_06a9c2-loc_06a4b4;08 Mujin Kick
	dc.w loc_06aa56-loc_06a4b4;0a Yasha Gaeshi
	dc.w loc_06ab62-loc_06a4b4;0c Taunt
	dc.w loc_06abce-loc_06a4b4;0e Alpha Counter

	dc.w loc_06ac24-loc_06a4b4;10 Kanzuki-ryuu Shinpikaibyaku
	dc.w loc_06ad04-loc_06a4b4;12 Kanzuki-ryuu Kou'ou Ken
	dc.w loc_06ae6e-loc_06a4b4;14 Chuu
	dc.w loc_06af8e-loc_06a4b4;16 Daisoku Barai
	dc.w loc_06aff2-loc_06a4b4;18 Arakuma Inashi

;==============================================
;Vism Activate
;==============================================
loc_06a4ce:
	move.b (7,a6),d0
	move.w loc_06a4da(pc,d0.w),d1
	jmp loc_06a4da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a4da:
	dc.w loc_06a4e0-loc_06a4da
	dc.w loc_06a500-loc_06a4da
	dc.w loc_06a534-loc_06a4da

;----------------------------------------------
loc_06a4e0:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_06a4fa
	moveq #$2f,d0

loc_06a4fa:
	jmp loc_02a708

;----------------------------------------------
loc_06a500:
	tst.b ($34,a6)
	beq.b loc_06a52e
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b ($31,a6)
	beq.b loc_06a524
	moveq #-3,d0
	moveq #$41,d1

loc_06a524:
	jsr loc_097cd6
	bsr.w loc_06b64c

loc_06a52e:
	jmp loc_02a7ea

;----------------------------------------------
loc_06a534:
	subq.b #1,($3a,a6)
	bne.w loc_06b644
	tst.b ($31,a6)
	beq.b loc_06a54a
	move.l #$02000602,(4,a6)

loc_06a54a:
	jmp loc_02f796

;==============================================
;Guren Ken
;==============================================
loc_06a550:
	move.b (7,a6),d0
	move.w loc_06a55c(pc,d0.w),d1
	jmp loc_06a55c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a55c:
	dc.w loc_06a564-loc_06a55c
	dc.w loc_06a59a-loc_06a55c
	dc.w loc_06a59a-loc_06a55c
	dc.w loc_06a5bc-loc_06a55c

;----------------------------------------------
loc_06a564:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($1ff,a6)
	moveq #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	bsr.w loc_06b0ce
	bsr.w loc_06b112
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a59a:
	bsr.w loc_06a5ee
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_06b638
	tst.b ($35,a6)
	beq.w loc_06a5b8
	bsr.w loc_06a6c4

loc_06a5b8:
	bra.w loc_06a7ea

;----------------------------------------------
loc_06a5bc:
	tst.b ($33,a6)
	bmi.w loc_06b638
	jsr loc_02a7ea
	bra.w loc_06a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a5ce:
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $04,$04,$04,$06,$06,$06,$02,$10
	dc.b $08,$08,$08,$0a,$0a,$0a,$02,$10
	dc.b $0c,$0c,$0c,$0e,$0e,$0e,$02,$10

;==============================================
loc_06a5ee:
	tst.b ($1ff,a6)
	bne.w loc_06a6c2
	tst.b (PL_cpucontrol,a6)
	beq.w loc_06a630
	subq.b #1,($3a,a6)
	bne.w loc_06a6c2
	bsr.w loc_06b0ce
	lea.l loc_06b65e(pc),a1
	jsr loc_030a66
	beq.w loc_06a6c2
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_06a5ce(pc,d0.w),($1ff,a6)
	bsr.w loc_06af78
	bra.w loc_06a442

loc_06a630:
	move.b ($378,a6),d0
	andi.b #$77,d0
	beq.w loc_06a6c2
	move.b ($83,a6),d1
	andi.b #7,d0
	beq.b loc_06a686
	cmpi.b #1,d1
	bne.w loc_06a656
	move.b #8,($1ff,a6)
	bra.b loc_06a67c

loc_06a656:
	cmpi.b #6,d1
	bne.w loc_06a666
	move.b #$c,($1ff,a6)
	bra.b loc_06a67c

loc_06a666:
	cmpi.b #2,d1
	bne.w loc_06a676
	move.b #4,($1ff,a6)
	bra.b loc_06a67c

loc_06a676:
	move.b #2,($1ff,a6)

loc_06a67c:
	bsr.w loc_06a442
	jmp loc_02f728

loc_06a686:
	cmpi.b #1,d1
	bne.w loc_06a696
	move.b #$a,($1ff,a6)
	bra.b loc_06a6bc

loc_06a696:
	btst #3,d1
	beq.w loc_06a6a6
	move.b #$e,($1ff,a6)
	bra.b loc_06a6bc

loc_06a6a6:
	btst #2,d1
	beq.w loc_06a6b6
	move.b #$10,($1ff,a6)
	bra.b loc_06a6bc

loc_06a6b6:
	move.b #6,($1ff,a6)

loc_06a6bc:
	jmp loc_02f74c

loc_06a6c2:
	rts

;==============================================
loc_06a6c4:
	tst.b ($1fb,a6)
	bne.b loc_06a6d0
	tst.b ($35,a6)
	bmi.b loc_06a6f4

loc_06a6d0:
	moveq #0,d0
	move.b ($1ff,a6),d0
	clr.b ($1ff,a6)
	move.w loc_06a6e2(pc,d0.w),d1
	jmp loc_06a6e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a6e2:
	dc.w loc_06a6f4-loc_06a6e2
	dc.w loc_06a6f6-loc_06a6e2
	dc.w loc_06a742-loc_06a6e2
	dc.w loc_06a72c-loc_06a6e2
	dc.w loc_06a7a4-loc_06a6e2
	dc.w loc_06a7b0-loc_06a6e2
	dc.w loc_06a762-loc_06a6e2
	dc.w loc_06a778-loc_06a6e2

	dc.w loc_06a78e-loc_06a6e2

;----------------------------------------------
loc_06a6f4:
	rts

;----------------------------------------------
loc_06a6f6:
	cmpi.b #4,(7,a6)
	beq.b loc_06a742
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	bsr.w loc_06b112
	move.b #1,($1fe,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a72c:
	move.l #$02000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_06a742:
	move.b #1,($1fe,a6)
	bsr.w loc_06b14e
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_06a762:
	move.l #$02000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_06a778:
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_06a78e:
	move.l #$2000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;----------------------------------------------
loc_06a7a4:
	move.l #$02000e00,(4,a6)
	moveq #$f,d2
	bra.b loc_06a7ba

;----------------------------------------------
loc_06a7b0:
	move.l #$02000e02,(4,a6)
	moveq #$10,d2

loc_06a7ba:
	move.b #1,($1fe,a6)
	clr.b (pl_attk_active,a6)
	bsr.w loc_06b112
	move.l ($40,a6),d0
	move.l ($48,a6),d1
	asr.l #2,d0
	asr.l #2,d1
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.b #$a,(pl_move_id,a6)
	move.l d2,d0
	jmp loc_02a758

;==============================================
loc_06a7ea:
	tst.b ($1fe,a6)
	beq.b loc_06a826

loc_06a7f0:
	move.l ($40,a6),d0
	beq.b loc_06a810
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	add.l d1,d0
	move.l d0,($40,a6)
	eor.l d0,d1
	bmi.b loc_06a810
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_06a810:
	tst.l ($40,a6)
	beq.b loc_06a826
	move.b ($b4,a5),d0
	andi.b #$7,d0
	bne.b loc_06a826
	jmp loc_085a7e

loc_06a826:
	rts

;==============================================
;Ressen Ha
;==============================================
loc_06a828:
	move.b (7,a6),d0
	move.w loc_06a834(pc,d0.w),d1
	jmp loc_06a834(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a834:
	dc.w loc_06a83e-loc_06a834
	dc.w loc_06a86e-loc_06a834
	dc.w loc_06a8e4-loc_06a834
	dc.w loc_06a908-loc_06a834
	dc.w loc_06a946-loc_06a834

;----------------------------------------------
loc_06a83e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06a852
	moveq #1,d0

loc_06a852:
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1e,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a86e:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06a8b2
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_06a8b4(pc,d0.w),($40,a6)
	move.l loc_06a8b4+4(pc,d0.w),($48,a6)
	move.l loc_06a8b4+8(pc,d0.w),($44,a6)
	move.l loc_06a8b4+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06a8b2
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06a8b2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a8b4:
	dc.l $00050000,$fffff000,$00050000,$ffffa800
	dc.l $00060000,$ffffe800,$00060000,$ffff9800
	dc.l $00080000,$ffffe000,$00070000,$ffff8800

;----------------------------------------------
loc_06a8e4:
	jsr loc_02aa08
	tst.l ($44,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$21,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a908:
	jsr loc_02aa08
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06b644
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	clr.b ($31,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$24,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a946:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;==============================================
;Hou Shou
;==============================================
loc_06a954:
	move.b (7,a6),d0
	move.w loc_06a960(pc,d0.w),d1
	jmp loc_06a960(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a960:
	dc.w loc_06a964-loc_06a960
	dc.w loc_06a9a6-loc_06a960

;----------------------------------------------
loc_06a964:
	bsr.w loc_06a7ea
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06a97c
	moveq #1,d0

loc_06a97c:
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$48,d1
	tst.b ($1fe,a6)
	bne.b loc_06a992
	moveq #$18,d1

loc_06a992:
	moveq #0,d0
	move.b d0,($1ff,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06a9a6:
	tst.b ($35,a6)
	beq.b loc_06a9b0
	clr.b ($ce,a6)

loc_06a9b0:
	bsr.w loc_06a7ea
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;==============================================
;Mujin Kick
;==============================================
loc_06a9c2:
	move.b (7,a6),d0
	move.w loc_06a9ce(pc,d0.w),d1
	jmp loc_06a9ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06a9ce:
	dc.w loc_06a9d2-loc_06a9ce
	dc.w loc_06aa12-loc_06a9ce

;----------------------------------------------
loc_06a9d2:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($31,a6)
	bsr.w loc_06b18a
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06a9f0
	moveq #1,d0

loc_06a9f0:
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($1ff,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1b,d0
	jmp loc_02a758

;----------------------------------------------
loc_06aa12:
	bsr.w loc_06a7f0
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_06aa22
	neg.l d0

loc_06aa22:
	tst.l d0
	bpl.b loc_06aa34
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b d0,($ce,a6)

loc_06aa34:
	tst.b ($34,a6)
	beq.b loc_06aa3e
	clr.b ($31,a6)

loc_06aa3e:
	tst.b ($35,a6)
	beq.b loc_06aa48
	clr.b ($ce,a6)

loc_06aa48:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;==============================================
;Yasha Gaeshi
;==============================================
loc_06aa56:
	move.b (7,a6),d0
	move.w loc_06aa62(pc,d0.w),d1
	jmp loc_06aa62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06aa62:
	dc.w loc_06aa6c-loc_06aa62
	dc.w loc_06aaa2-loc_06aa62
	dc.w loc_06aacc-loc_06aa62
	dc.w loc_06aade-loc_06aa62
	dc.w loc_06ab10-loc_06aa62

;----------------------------------------------
loc_06aa6c:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_06aa78
	tst.b ($81,a6)
	bne.b loc_06aaa2

loc_06aa78:
	move.b #4,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06aa8e
	moveq #1,d0

loc_06aa8e:
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$f,d0
	jmp loc_02a758

;----------------------------------------------
loc_06aaa2:
	move.b #4,(7,a6)
	move.b #1,($ce,a6)
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06aab8
	moveq #1,d0

loc_06aab8:
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$10,d0
	jmp loc_02a758

;----------------------------------------------
loc_06aacc:
	bsr.w loc_06a7ea
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06aade:
	addq.b #2,(7,a6)
	clr.b ($1fd,a6)
	moveq #$e,d0
	movea.w ($38,a6),a4
	move.b #$e,(pl_hitfreeze,a6)
	move.b #$1a,($5f,a4)
	moveq #$68,d0
	jsr loc_080b70
	moveq #$3f,d0
	tst.b ($81,a6)
	beq.b loc_06ab0a
	addq.b #1,d0

loc_06ab0a:
	jmp loc_02a758

;----------------------------------------------
loc_06ab10:
	tst.b ($35,a6)
	beq.b loc_06ab2e
	clr.b ($ce,a6)
	tst.b ($1fd,a6)
	beq.b loc_06ab2e
	cmpi.b #2,($1fd,a6)
	beq.w loc_06a742
	bra.w loc_06a72c

loc_06ab2e:
	tst.b ($34,a6)
	beq.b loc_06ab4c
	clr.b ($34,a6)
	jsr RNGFunction
	andi.w #6,d0
	move.w loc_06ab5a(pc,d0.w),d0
	jsr loc_0038e4

loc_06ab4c:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ab5a:
	dc.w $0010,$0011,$0012,$0014

;==============================================
;Taunt
;==============================================
loc_06ab62:
	move.b (7,a6),d0
	move.w loc_06ab6e(pc,d0.w),d1
	jmp loc_06ab6e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ab6e:
	dc.w loc_06ab74-loc_06ab6e
	dc.w loc_06aba0-loc_06ab6e
	dc.w loc_06abc0-loc_06ab6e

;----------------------------------------------
loc_06ab74:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_06ab88
	subq.b #1,(pl_taunt_count,a6)

loc_06ab88:
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	move.b #8,($3b,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_06aba0:
	tst.b ($35,a6)
	beq.w loc_06b644
	clr.b ($35,a6)
	subq.b #1,($3b,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #$29,d0
	jmp loc_02a758

;----------------------------------------------
loc_06abc0:
	tst.b ($33,a6)
	bmi.w loc_06b638
	jmp loc_02a7ea

;==============================================
;Alpha Counter
;==============================================
loc_06abce:
	move.b (7,a6),d0
	move.w loc_06abde(pc,d0.w),d1
	jsr loc_06abde(pc,d1.w)
	bra.w loc_069f88

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06abde:
	dc.w loc_06abe4-loc_06abde
	dc.w loc_06abfa-loc_06abde
	dc.w loc_06ac16-loc_06abde

;----------------------------------------------
loc_06abe4:
	tst.b ($35,a6)
	beq.w loc_06b644
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jmp loc_080e8e

;----------------------------------------------
loc_06abfa:
	tst.b ($33,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #$d,d0
	tst.b ($81,a6)
	beq.b loc_06ac10
	moveq #$e,d0

loc_06ac10:
	jmp loc_02a758

;----------------------------------------------
loc_06ac16:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_06b638(pc)
	nop

;==============================================
;Kanzuki-ryuu Shinpikaibyaku
;==============================================
loc_06ac24:
	move.b (7,a6),d0
	move.w loc_06ac30(pc,d0.w),d1
	jmp loc_06ac30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ac30:
	dc.w loc_06ac38-loc_06ac30
	dc.w loc_06ac6a-loc_06ac30
	dc.w loc_06ac98-loc_06ac30
	dc.w loc_06acc8-loc_06ac30

;----------------------------------------------
loc_06ac38:
	addq.b #2,(7,a6)
	move.b #8,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	bsr.w loc_06ace4
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$30,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ac6a:
	move.b #8,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_06ac92
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06ac84
	moveq #1,d0

loc_06ac84:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$38,d1
	jsr loc_082e36

loc_06ac92:
	jmp loc_02a7ea

;----------------------------------------------
loc_06ac98:
	tst.b ($35,a6)
	bne.b loc_06acbe
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	beq.b loc_06acb8
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_06acb8:
	move.b loc_06acc4(pc,d0.w),(pl_invinciblity_timer,a6)

loc_06acbe:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06acc4:
	dc.b $05,$10,$1c,00

;----------------------------------------------
loc_06acc8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_06acd8
	bsr.w loc_06ace4

loc_06acd8:
	tst.b ($33,a6)
	bmi.w loc_06b638
	bra.w loc_06a7f0

;==============================================
loc_06ace4:
	move.l #$38000,d0
	move.l #$ffffe800,d1
	tst.b (PL_Flip,a6)
	bne.b loc_06acfa
	neg.l d0
	neg.l d1

loc_06acfa:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	rts

;==============================================
;Kanzuki-ryuu Kou'ou Ken
;==============================================
loc_06ad04:
	move.b (7,a6),d0
	move.w loc_06ad10(pc,d0.w),d1
	jmp loc_06ad10(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ad10:
	dc.w loc_06ad1c-loc_06ad10
	dc.w loc_06ad4a-loc_06ad10
	dc.w loc_06ad78-loc_06ad10
	dc.w loc_06ae0c-loc_06ad10
	dc.w loc_06ae28-loc_06ad10
	dc.w loc_06ae60-loc_06ad10

;----------------------------------------------
loc_06ad1c:
	addq.b #2,(7,a6)
	move.b #8,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$36,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ad4a:
	move.b #8,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_06ad72
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06ad64
	moveq #1,d0

loc_06ad64:
	move.b d0,($ab,a6)
	moveq #-$26,d0
	moveq #$39,d1
	jsr loc_082e36

loc_06ad72:
	jmp loc_02a7ea

;----------------------------------------------
loc_06ad78:
	tst.b ($35,a6)
	bne.b loc_06add2
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	beq.b loc_06ad98
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_06ad98:
	move.b loc_06add8(pc,d0.w),(pl_invinciblity_timer,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_06addc(pc,d0.w),($40,a6)
	move.l loc_06addc+4(pc,d0.w),($48,a6)
	move.l loc_06addc+8(pc,d0.w),($44,a6)
	move.l loc_06addc+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06add2
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06add2:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06add8:
	dc.b $04,$08,$0c,00

loc_06addc:
	dc.l $00030000,$fffff800,$00070000,$ffffb800
	dc.l $00040000,$fffff000,$00070000,$ffffb800
	dc.l $00050000,$ffffe000,$00070000,$ffffb800

;----------------------------------------------
loc_06ae0c:
	jsr loc_02aa08
	tst.l ($44,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	rts

;----------------------------------------------
loc_06ae28:
	jsr loc_02aa08
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_06b644
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$39,d0
	jmp loc_02a758

;----------------------------------------------
loc_06ae60:
	tst.b ($33,a6)
	bmi.w loc_06b638
	jmp loc_02a7ea

;==============================================
;Chuu
;==============================================
loc_06ae6e:
	move.b (7,a6),d0
	move.w loc_06ae7a(pc,d0.w),d1
	jmp loc_06ae7a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06ae7a:
	dc.w loc_06ae80-loc_06ae7a
	dc.w loc_06aebe-loc_06ae7a
	dc.w loc_06af0c-loc_06ae7a

;----------------------------------------------
loc_06ae80:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	bsr.w loc_06b0ce
	bsr.w loc_06b1c6
	moveq #3,d0
	tst.b ($1fe,a6)
	beq.b loc_06ae9c
	moveq #1,d0

loc_06ae9c:
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($1fc,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2a,d0
	jmp loc_02a758

;----------------------------------------------
loc_06aebe:
	bsr.w loc_06af28
	bsr.w loc_06a7f0
	tst.b ($1fc,a6)
	beq.b loc_06aefe
	tst.b ($35,a6)
	beq.b loc_06aefe
	bpl.b loc_06aeda
	tst.b ($1fb,a6)
	beq.b loc_06aefe

loc_06aeda:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	bsr.w loc_06b1c6
	moveq #0,d0
	move.b d0,($1fc,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2d,d0
	jmp loc_02a758

loc_06aefe:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06af0c:
	tst.b ($35,a6)
	beq.b loc_06af16
	clr.b ($ce,a6)

loc_06af16:
	bsr.w loc_06a7f0
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;==============================================
loc_06af28:
	tst.b ($1fc,a6)
	bne.w loc_06af76
	tst.b (PL_cpucontrol,a6)
	beq.b loc_06af5a
	subq.b #1,($3a,a6)
	bne.b loc_06af76
	bsr.w loc_06b0ce
	lea.l loc_06b65e(pc),a1
	jsr loc_030a66
	beq.b loc_06af76
	move.b #2,($1fc,a6)
	bsr.w loc_06af78
	bra.w loc_06a442

loc_06af5a:
	move.b ($378,a6),d0
	andi.b #7,d0
	beq.w loc_06af76
	move.b #2,($1fc,a6)
	bsr.w loc_06a442
	jmp loc_02f728
 
loc_06af76:
	rts

;==============================================
loc_06af78:
	jsr RNGFunction
	andi.w #3,d0
	move.b loc_06af8a(pc,d0.w),($82,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06af8a:
	dc.b $00,$02,$04,$04

;==============================================
;Daisoku Barai
;==============================================
loc_06af8e:
	move.b (7,a6),d0
	move.w loc_06af9a(pc,d0.w),d1
	jmp loc_06af9a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06af9a:
	dc.w loc_06af9e-loc_06af9a
	dc.w loc_06afd6-loc_06af9a

;----------------------------------------------
loc_06af9e:
	bsr.w loc_06b202
	addq.b #2,(7,a6)
	move.b #1,(pl_crouching,a6)
	move.b #1,($ce,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($1ff,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3c,d0
	jmp loc_02a758

;----------------------------------------------
loc_06afd6:
	tst.b ($35,a6)
	beq.b loc_06afe0
	clr.b ($ce,a6)

loc_06afe0:
	bsr.w loc_06a7ea
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02bb26

;==============================================
;Arakuma Inashi
;==============================================
loc_06aff2:
	move.b (7,a6),d0
	move.w loc_06b002(pc,d0.w),d1
	jsr loc_06b002(pc,d1.w)
	bra.w loc_06b23e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b002:
	dc.w loc_06b00c-loc_06b002
	dc.w loc_06b02c-loc_06b002
	dc.w loc_06b068-loc_06b002
	dc.w loc_06b076-loc_06b002
	dc.w loc_06b0aa-loc_06b002

;----------------------------------------------
loc_06b00c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #1,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b02c:
	tst.b ($33,a6)
	bpl.w loc_06b644
	moveq #$65,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr loc_02e3fe
	bne.w loc_06b054
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_06b054:
	move.b #6,(7,a6)
	move.b #2,($3a,a6)
	moveq #$27,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b068:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06b076:
	tst.b ($35,a6)
	beq.w loc_06b644
	bmi.b loc_06b096
	clr.b ($35,a6)
	subq.b #1,($3a,a6)
	moveq #$64,d0
	jsr loc_02e970
	jmp loc_02a7ea

loc_06b096:
	tst.b ($3a,a6)
	bne.w loc_06b644
	addq.b #2,(7,a6)
	moveq #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b0aa:
	tst.b ($35,a6)
	beq.w loc_06b644
	move.b #4,(7,a6)
	moveq #$65,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr loc_02e7f2
	clr.b ($ce,a6)
	rts

;==============================================
loc_06b0ce:
	jsr RNGFunction
	andi.b #$f,d0
	move.b d0,($3a,a6)
	rts

;==============================================
loc_06b0de:
	moveq #0,d0
	move.l d0,(pl_inp_slot_0,a6)
	move.l d0,($184,a6)
	move.l d0,(pl_inp_slot_3,a6)
	move.l d0,($19c,a6)
	move.l d0,(pl_inp_slot_1,a6)
	move.l d0,($18c,a6)
	move.l d0,(pl_inp_slot_4,a6)
	move.l d0,($1a4,a6)
	move.l d0,(pl_inp_slot_5,a6)
	move.l d0,($1ac,a6)
	move.l d0,(pl_inp_slot_7,a6)
	move.l d0,($1bc,a6)
	rts

;==============================================
loc_06b112:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06b136(pc,d0.w),($40,a6)
	move.l loc_06b136+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b134
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06b134:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b136:
	dc.l $00030000,$fffff000
	dc.l $00040000,$ffffe800
	dc.l $00050000,$ffffe000

;==============================================
loc_06b14e:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06b172(pc,d0.w),($40,a6)
	move.l loc_06b172+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b170
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06b170:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b172:
	dc.l $00030000,$fffff000
	dc.l $00040000,$ffffe800
	dc.l $00050000,$ffffe000

;==============================================
loc_06b18a:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06b1ae(pc,d0.w),($40,a6)
	move.l loc_06b1ae+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b1ac
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06b1ac:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b1ae:
	dc.l $00030000,$fffff000
	dc.l $00040000,$ffffe800
	dc.l $00050000,$ffffe000

;==============================================
loc_06b1c6:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06b1ea(pc,d0.w),($40,a6)
	move.l loc_06b1ea+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b1e8
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06b1e8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b1ea:
	dc.l $00030000,$fffff000
	dc.l $00040000,$ffffe800
	dc.l $00050000,$ffffe000

;==============================================
loc_06b202:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_06b226(pc,d0.w),($40,a6)
	move.l loc_06b226+4(pc,d0.w),($48,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_06b224
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_06b224:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b226:
	dc.l $00030000,$fffff000
	dc.l $00040000,$ffffe800
	dc.l $00050000,$ffffe000

;==============================================
loc_06b23e:
	tst.b ($34,a6)
	beq.b loc_06b24a
	jmp loc_02fa36

loc_06b24a:
	jmp loc_02f9be

;==============================================
loc_06b250:
	tst.b (PL_cpucontrol,a6)
	beq.w loc_06b272
	jsr loc_01bd5c
	move.b (PL_Flip,a6),d1
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06b28c
	bra.b loc_06b288

loc_06b272:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_06b28c
	move.b (PL_Flip,a6),d1
	btst.b #0,($83,a6)
	beq.b loc_06b28c

loc_06b288:
	eori.b #1,d1

loc_06b28c:
	clr.b ($1fa,a6)
	cmp.b (PL_Flip,a6),d1
	beq.b loc_06b29a
	addq.b #2,($1fa,a6)

loc_06b29a:
	rts

;##############################################
;Throws
;##############################################
loc_06b29c:
	cmpi.b #4,($80,a6)
	beq.w loc_06b526
	cmpi.b #2,($81,a6)
	beq.w loc_06b3c6
	move.b (7,a6),d0
	move.w loc_06b2be(pc,d0.w),d1
	jsr loc_06b2be(pc,d1.w)
	bra.b loc_06b23e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b2be:
	dc.w loc_06b2cc-loc_06b2be
	dc.w loc_06b2e6-loc_06b2be
	dc.w loc_06b31e-loc_06b2be
	dc.w loc_06b32c-loc_06b2be
	dc.w loc_06b348-loc_06b2be
	dc.w loc_06b37a-loc_06b2be
	dc.w loc_06b3ae-loc_06b2be

;----------------------------------------------
loc_06b2cc:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b2e6:
	tst.b ($33,a6)
	bpl.w loc_06b644
	bsr.w loc_06b250
	moveq #1,d0
	tst.b ($1fa,a6)
	beq.b loc_06b2fc
	moveq #$1b,d0

loc_06b2fc:
	jsr loc_02e3fe
	beq.b loc_06b312
	move.b #6,(7,a6)
	moveq #3,d0
	jmp loc_02a758

loc_06b312:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b31e:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06b32c:
	tst.b ($33,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #5,d0
	tst.b ($1fa,a6)
	beq.b loc_06b342
	moveq #8,d0

loc_06b342:
	jmp loc_02a758

;----------------------------------------------
loc_06b348:
	tst.b ($33,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	move.b #$1e,($123,a5)
	moveq #2,d0
	tst.b ($1fa,a6)
	beq.b loc_06b364
	moveq #$1c,d0

loc_06b364:
	jsr loc_02e970
	moveq #7,d0
	tst.b ($1fa,a6)
	beq.b loc_06b374
	moveq #$a,d0

loc_06b374:
	jmp loc_02a758

;----------------------------------------------
loc_06b37a:
	tst.b ($35,a6)
	beq.b loc_06b3a8
	addq.b #2,(7,a6)
	moveq #1,d0
	tst.b ($1fa,a6)
	beq.b loc_06b38e
	moveq #$1b,d0

loc_06b38e:
	movea.w ($38,a6),a0
	tst.b ($2ca,a0)
	bne.b loc_06b3a2
	moveq #$6b,d0
	tst.b ($1fa,a6)
	beq.b loc_06b3a2
	moveq #$6c,d0

loc_06b3a2:
	jsr loc_02e7f2

loc_06b3a8:
	jmp loc_02a7ea

;----------------------------------------------
loc_06b3ae:
	tst.b ($33,a6)
	bpl.w loc_06b644
	tst.b ($1fa,a6)
	beq.b loc_06b3c2
	eori.b #1,(PL_Flip,a6)

loc_06b3c2:
	bra.w loc_06b638

;==============================================
;Kick Throw
;==============================================
loc_06b3c6:
	move.b (7,a6),d0
	move.w loc_06b3d6(pc,d0.w),d1
	jsr loc_06b3d6(pc,d1.w)
	bra.w loc_06b23e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b3d6:
	dc.w loc_06b3e2-loc_06b3d6
	dc.w loc_06b3fc-loc_06b3d6
	dc.w loc_06b432-loc_06b3d6
	dc.w loc_06b440-loc_06b3d6
	dc.w loc_06b4aa-loc_06b3d6
	dc.w loc_06b518-loc_06b3d6

;----------------------------------------------
loc_06b3e2:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b3fc:
	tst.b ($33,a6)
	bpl.w loc_06b644
	moveq #$69,d0
	jsr loc_02e3fe
	beq.b loc_06b426
	move.b #6,(7,a6)
	move.w #$b4,($ae,a6)
	clr.w ($3a,a6)
	moveq #$11,d0
	jmp loc_02a758

loc_06b426:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b432:
	tst.b ($33,a6)
	bpl.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06b440:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_06b46a
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	moveq #$6a,d0
	jsr loc_02e970
	beq.b loc_06b466
	moveq #$69,d0
	jsr loc_02e7f2
	bra.b loc_06b49c

loc_06b466:
	addq.b #1,($3a,a6)

loc_06b46a:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_06b644
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_06b48c
	jsr loc_02ea7a
	beq.w loc_06b644

loc_06b48c:
	moveq #$6a,d0
	jsr loc_080b70
	moveq #$69,d0
	jsr loc_02e7f2

loc_06b49c:
	move.b #$a,(7,a6)
	moveq #$47,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b4aa:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_06b4d8
	clr.b ($35,a6)
	moveq #$6a,d0
	jsr loc_02e970
	beq.b loc_06b4d4
	moveq #$6a,d0
	jsr loc_080b70
	moveq #$69,d0
	jsr loc_02e7f2
	bra.b loc_06b50a

loc_06b4d4:
	addq.b #1,($3a,a6)

loc_06b4d8:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.w loc_06b644
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_06b4fa
	jsr loc_02ea7a
	beq.w loc_06b644

loc_06b4fa:
	moveq #$6a,d0
	jsr loc_080b70
	moveq #$69,d0
	jsr loc_02e7f2

loc_06b50a:
	move.b #$a,(7,a6)
	moveq #$47,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b518:
	tst.b ($33,a6)
	bmi.w loc_06b638
	jmp loc_02a7ea

;==============================================
;Air Throw
;==============================================
loc_06b526:
	move.b (7,a6),d0
	move.w loc_06b536(pc,d0.w),d1
	jsr loc_06b536(pc,d1.w)
	bra.w loc_06b23e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b536:
	dc.w loc_06b542-loc_06b536
	dc.w loc_06b576-loc_06b536
	dc.w loc_06b586-loc_06b536
	dc.w loc_06b5be-loc_06b536
	dc.w loc_06b600-loc_06b536
	dc.w loc_06b620-loc_06b536

;----------------------------------------------
loc_06b542:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1d,d0
	tst.b ($81,a6)
	beq.b loc_06b558
	moveq #$1f,d0

loc_06b558:
	jsr loc_02e636
	beq.b loc_06b56e
	move.b #4,(7,a6)
	moveq #4,d0
	jmp loc_02a758

loc_06b56e:
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_06b576:
	jsr loc_02aa08
	bcc.w loc_06b644
	jmp loc_02baf2

;----------------------------------------------
loc_06b586:
	tst.b ($33,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #5,d0
	tst.b ($81,a6)
	beq.b loc_06b59c
	moveq #8,d0

loc_06b59c:
	jmp loc_02a758


;==============================================
loc_06b5a2:
	tst.b ($33,a6)
	bpl.w loc_06b644
	addq.b #2,(7,a6)
	moveq #6,d0
	tst.b ($81,a6)
	beq.b loc_06b5b8
	moveq #9,d0

loc_06b5b8:
	jmp loc_02a758

;----------------------------------------------
loc_06b5be:
	jsr loc_02aa08
	bcc.w loc_06b644
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b #$1e,($123,a5)
	moveq #$1e,d0
	tst.b ($81,a6)
	beq.b loc_06b5ea
	moveq #$20,d0

loc_06b5ea:
	jsr loc_02e970
	moveq #7,d0
	tst.b ($81,a6)
	beq.b loc_06b5fa
	moveq #$a,d0

loc_06b5fa:
	jmp loc_02a758

;----------------------------------------------
loc_06b600:
	tst.b ($35,a6)
	beq.b loc_06b61a
	addq.b #2,(7,a6)
	moveq #$1d,d0
	tst.b ($81,a6)
	beq.b loc_06b614
	moveq #$1f,d0

loc_06b614:
	jsr loc_02e7f2

loc_06b61a:
	jmp loc_02a7ea

;----------------------------------------------
loc_06b620:
	tst.b ($33,a6)
	bpl.w loc_06b644
	tst.b ($81,a6)
	beq.b loc_06b634
	eori.b #1,(PL_Flip,a6)

loc_06b634:
	bra.w loc_06b638

;==============================================
loc_06b638:
	jmp loc_02baf2

;==============================================
loc_06b63e:
	jmp loc_02bb26

;==============================================
loc_06b644:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_06b64a:
	rts

;==============================================
loc_06b64c:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06b65e:
	dc.l $000001ff,$000001ff,$000003ff,$000003ff
	dc.l $000007ff,$000007ff,$00000fff,$00000fff
	dc.l $00001fff,$00001fff,$00003fff,$00003fff
	dc.l $00007fff,$00007fff,$0000ffff,$0000ffff
	dc.l $0001ffff,$0001ffff,$0003ffff,$0003ffff
	dc.l $0007ffff,$0007ffff,$000fffff,$000fffff
	dc.l $001fffff,$001fffff,$003fffff,$003fffff
	dc.l $007fffff,$007fffff,$00ffffff,$00ffffff

;##############################################
;
;##############################################
loc_06b6de:
	dc.w loc_06b722-loc_06b6de
	dc.w loc_06b722-loc_06b6de
	dc.w loc_06b6f4-loc_06b6de

loc_06b6f4:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

loc_06b722:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02