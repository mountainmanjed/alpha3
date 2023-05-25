;##############################################
;
;##############################################
loc_03bdac:
	jsr loc_01c368
	beq.b loc_03bde8
	addq.b #1,(a4)
	move.w #$400,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)
	move.b ($102,a6),(7,a4)
	jsr loc_01c368
	beq.b loc_03bde8
	addq.b #1,(a4)
	move.w #$401,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.b ($102,a6),(7,a4)

loc_03bde8:
	rts

;##############################################
;
;##############################################
loc_03bdea:
	move.b (7,a6),d0
	move.w loc_03bdf6(pc,d0.w),d1
	jmp loc_03bdf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bdf6:
	dc.w loc_03bdfc-loc_03bdf6
	dc.w loc_03be56-loc_03bdf6
	dc.w loc_03be64-loc_03bdf6

;----------------------------------------------
loc_03bdfc:
	addq.b #2,(7,a6)
	tst.b ($bf,a5)
	bne.b loc_03be50
	tst.b ($15d,a5)
	bne.b loc_03be50
	tst.b ($159,a6)
	bpl.b loc_03be50
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03be50
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	beq.b loc_03be50
	cmpi.b #$a,($102,a4)
	bne.b loc_03be50
	jsr loc_01c2c8
	beq.b loc_03be44
	addq.b #1,(a4)
	move.w #$1902,(2,a4)
	move.w a6,($36,a4)
	move.b #$40,($2a0,a6)


loc_03be44:
	clr.b ($124,a6)
	moveq #$31,d0
	jmp loc_02a708

loc_03be50:
	addq.b #2,(7,a6)
	bra.b loc_03be64

;----------------------------------------------
loc_03be56:
	cmpi.w #4,($c,a5)
	bne.b loc_03be62
	addq.b #2,(7,a6)

loc_03be62:
	rts

;----------------------------------------------
loc_03be64:
	tst.b ($33,a6)
	bpl.b loc_03be7a
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

loc_03be7a:
	jmp loc_02a7ea

;##############################################
;Win Poses
;##############################################
loc_03be80:
	move.b (6,a6),d0
	move.w loc_03be8c(pc,d0.w),d1
	jmp loc_03be8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03be8c:
	dc.w loc_03be94-loc_03be8c
	dc.w loc_03bea6-loc_03be8c
	dc.w loc_03bebc-loc_03be8c
	dc.w loc_03bf02-loc_03be8c

;----------------------------------------------
loc_03be94:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_03bea6:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_03beb6
	tst.b ($11c,a5)
	bne.b loc_03beb6
	addq.b #2,(6,a6)

loc_03beb6:
	jmp loc_02a7ea

;----------------------------------------------
loc_03bebc:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	moveq #0,d0
	cmpi.w #$90,($50,a6)
	beq.b loc_03bee8
	move.b ($2c4,a6),d0
	beq.b loc_03bedc
	lsr.b #1,d0
	subq.b #1,d0
	bra.b loc_03bee4

loc_03bedc:
	move.b ($81,a5),d0
	andi.w #$f,d0

loc_03bee4:
	move.b loc_03bef2(pc,d0.w),d0

loc_03bee8:
	addi.b #$23,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bef2:
	dc.b $01,$02,$03,$01,$02,$03,$01,$02
	dc.b $03,$01,$02,$03,$01,$02,$03,$01

;----------------------------------------------
loc_03bf02:
	tst.b ($3a,a6)
	beq.b loc_03bf16
	subq.b #1,($3a,a6)
	bne.b loc_03bf16
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_03bf16:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_03bf1c:
	move.b ($80,a6),d0
	move.w loc_03bf28(pc,d0.w),d1
	jmp loc_03bf28(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bf28:
	dc.w loc_03bf2e-loc_03bf28
	dc.w loc_03bfae-loc_03bf28
	dc.w loc_03c176-loc_03bf28

;==============================================
loc_03bf2e:
	clr.b (pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_03bf3e(pc,d0.w),d1
	jmp loc_03bf3e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bf3e:
	dc.w loc_03bf42-loc_03bf3e
	dc.w loc_03bfa8-loc_03bf3e

;----------------------------------------------
loc_03bf42:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_03bf6e
	moveq #6,d0

loc_03bf6e:
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_03bf8a
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_03bf8a
	btst.b #0,($83,a6)
	bne.b loc_03bf96
	bra.b loc_03bf94

loc_03bf8a:
	move.w loc_03bf9c(pc,d0.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_03bf96

loc_03bf94:
	addq.b #1,d0

loc_03bf96:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV/
loc_03bf9c:
	dc.w $0030,$0030,$0028
	dc.w $0030,$0030,$0038

;----------------------------------------------
loc_03bfa8:
	jmp loc_02f5ac

;==============================================
loc_03bfae:
	move.b #1,(pl_crouching,a6)
	tst.b ($81,a6)
	bne.b loc_03c004
	move.b (7,a6),d0
	move.w loc_03bfc6(pc,d0.w),d1
	jmp loc_03bfc6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03bfc6:
	dc.w loc_03bfca-loc_03bfc6
	dc.w loc_03bffe-loc_03bfc6

;----------------------------------------------
loc_03bfca:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$c,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03bffe:
	jmp loc_02f5ac

;==============================================
loc_03c004:
	move.b (7,a6),d0
	move.w loc_03c010(pc,d0.w),d1
	jmp loc_03c010(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c010:
	dc.w loc_03c01a-loc_03c010
	dc.w loc_03c0c6-loc_03c010
	dc.w loc_03c0cc-loc_03c010
	dc.w loc_03c11c-loc_03c010
	dc.w loc_03c162-loc_03c010

;----------------------------------------------
loc_03c01a:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	tst.b ($82,a6)
	beq.b loc_03c0a8
	btst.b #1,($83,a6)
	beq.b loc_03c0a8
	addq.b #2,(7,a6)
	cmpi.b #4,($82,a6)
	beq.b loc_03c05e
	clr.b (pl_crouching,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_03c05e:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	moveq #2,d0
	jsr loc_02ef6c
	move.l #$18000,d0
	clr.l ($48,a6)
	move.l #$78000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_03c096
	neg.l d0

loc_03c096:
	move.l d0,($40,a6)
	addi.w #$10,($14,a6)
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

loc_03c0a8:
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$f,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_03c0c6:
	jmp loc_02f5ac

;----------------------------------------------
loc_03c0cc:
	clr.b (pl_crouching,a6)
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_03c11a
	beq.b loc_03c0e6
	move.b #1,($31,a6)
	bra.b loc_03c11a

loc_03c0e6:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.b (pl_crouching,a6)
	move.l #$18000,d0
	clr.l ($48,a6)
	move.l #$78000,($44,a6)
	move.l #$ffff9800,($4c,a6)
	tst.b (PL_Flip,a6)
	beq.b loc_03c116
	neg.l d0

loc_03c116:
	move.l d0,($40,a6)

loc_03c11a:
	rts

;----------------------------------------------
loc_03c11c:
	clr.b (pl_crouching,a6)
	bsr.w loc_03d916
	bpl.b loc_03c15c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03c15c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	cmpi.b #4,($82,a6)
	bne.b loc_03c14e
	eori.b #1,(PL_Flip,a6)

loc_03c14e:
	jsr loc_00369c
	moveq #$22,d0
	jmp Set_Spec_Cancel_Timers

loc_03c15c:
	jmp loc_02a7ea

;----------------------------------------------
loc_03c162:
	tst.b ($33,a6)
	bmi.w loc_03d9c0
	jsr loc_02e35a
	jmp loc_02a7ea

;==============================================
loc_03c176:
	move.b ($87,a6),d0
	move.w loc_03c182(pc,d0.w),d1
	jmp loc_03c182(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c182:
	dc.w loc_03c186-loc_03c182
	dc.w loc_03c24a-loc_03c182

;----------------------------------------------
loc_03c186:
	tst.b ($5b,a6)
	beq.b loc_03c18e
	bra.b loc_03c1a8

loc_03c18e:
	bsr.w loc_03d916
	bpl.b loc_03c1a2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03c1a2
	bra.w loc_03d9c6

loc_03c1a2:
	jmp loc_02a7ea

loc_03c1a8:
	move.l #$2000602,(4,a6)
	clr.b (pl_attk_active,a6)
	moveq #$10,d0
	jsr loc_0038e4
	move.l #$40000,d1
	move.l #$fffffb00,d2
	move.l #$60000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	move.l #$fffe8000,d3
	btst.b #1,($83,a6)
	bne.b loc_03c1f2
	neg.l d3
	btst.b #0,($83,a6)
	bne.b loc_03c1f2
	moveq #0,d3

loc_03c1f2:
	tst.b (PL_Flip,a6)
	beq.b loc_03c1fa
	neg.l d3

loc_03c1fa:
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	cmpi.w #$60,d0
	blt.b loc_03c226
	cmpi.w #$120,d0
	bgt.b loc_03c222
	tst.l ($40,a6)
	bgt.b loc_03c226
	blt.b loc_03c222
	tst.b (PL_Flip,a6)
	bne.b loc_03c226

loc_03c222:
	neg.l d1
	neg.l d2

loc_03c226:
	add.l d3,d1
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	move.b (PL_Flip,a6),d0
	move.b ($40,a6),d1
	rol.b #1,d1
	eor.b d1,d0
	andi.b #1,d0
	bne.b loc_03c244
	moveq #-1,d0

loc_03c244:
	move.b d0,($3c,a6)
	rts

;----------------------------------------------
loc_03c24a:
	rts

;##############################################
;
;##############################################
loc_03c24c:
	move.b #4,($80,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03c268
	tst.b (PL_ism_choice,a6)
	bpl.b loc_03c268
	btst.b #3,($20a,a6)
	bne.w loc_03c2f4

loc_03c268:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	tst.b ($81,a6)
	beq.b loc_03c296
	cmpi.b #2,($82,a6)
	bne.b loc_03c296
	move.b ($83,a6),d0
	andi.b #$f,d0
	cmpi.b #4,d0
	beq.b loc_03c2cc

loc_03c296:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_03c2c6(pc,d0.w),d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_03c2b0
	moveq #$18,d0

loc_03c2b0:
	tst.b ($81,a6)
	beq.b loc_03c2b8
	addq.b #3,d0

loc_03c2b8:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c2c6:
	dc.w $0000,$0001,$0002

;==============================================
loc_03c2cc:
	move.l #$2000a00,(4,a6)
	moveq #1,d0
	jsr loc_02ef6c
	clr.b ($87,a6)
	clr.b ($5b,a6)
	moveq #$20,d0
	tst.b ($3c,a6)
	beq.b loc_03c2ee
	moveq #$21,d0

loc_03c2ee:
	jmp Set_Spec_Cancel_Timers

;==============================================
loc_03c2f4:
	move.l #$2000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_03c79e

;##############################################
;Special Moves Inputs
;##############################################
loc_03c30c:
	jsr SPButton_Vism_code
	bne.w loc_03c684

loc_03c316:
	lea.l (pl_inp_slot_8,a6),a4
	jsr SpInp_236236P_code
	bne.w loc_03c57c

loc_03c324:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpChrg_1318K_code
	bne.w loc_03c546

loc_03c332:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpChrg_4646K_code
	bne.w loc_03c514

loc_03c340:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpChrg_46P_code
	bne.w loc_03c456

loc_03c34e:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpChrg_46K_code
	bne.w loc_03c408

loc_03c35c:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpChrg_28K_code
	bne.w loc_03c4d4

loc_03c36a:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_1236P_Code
	bne.w loc_03c488

loc_03c378:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_63214K_Code
	bne.w loc_03c3d6

loc_03c386:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpMash_K_code
	bne.w loc_03c3ae

loc_03c394:
	jsr SPButton_Taunt_code
	bne.w loc_03c5ae

loc_03c39e:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_03c5e2

loc_03c3ac:
	rts

;==============================================
loc_03c3ae:
	jsr loc_02ed00
	beq.b loc_03c394
	move.l #$2000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
loc_03c3d6:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_03c386
	jsr loc_02ed00
	beq.b loc_03c386
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b ($5b,a6)
	jmp loc_02f74c

;==============================================
loc_03c408:
	tst.b (PL_ism_choice,a6)
	bpl.w loc_03c35c
	tst.b ($31,a6)
	beq.b loc_03c428
	jsr loc_02ed28
	beq.w loc_03c35c
	move.b #4,($80,a6)
	bra.b loc_03c43c

loc_03c428:
	jsr loc_02ed00
	beq.w loc_03c35c
	clr.b ($80,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_03c43c:
	move.l #$2000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
loc_03c456:
	tst.b (PL_ism_choice,a6)
	bpl.w loc_03c34e
	jsr loc_02ed00
	beq.w loc_03c34e
	move.l #$2000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
loc_03c488:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_03c378
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03c4a0
	tst.b ($238,a6)
	bne.w loc_03c378
	bra.b loc_03c4aa

loc_03c4a0:
	cmpi.b #2,($238,a6)
	bcc.w loc_03c378

loc_03c4aa:
	jsr loc_02ed00
	beq.w loc_03c378
	move.l #$2000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;==============================================
loc_03c4d4:
	tst.b (PL_ism_choice,a6)
	bpl.b loc_03c4e6
	jsr ReversalCheck
	beq.w loc_03c36a
	bra.b loc_03c4f0

loc_03c4e6:
	jsr loc_02ed00
	beq.w loc_03c36a

loc_03c4f0:
	bsr.w loc_03c6e8
	move.l #$2000e00,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;==============================================
loc_03c514:
	tst.b (PL_ism_choice,a6)
	bgt.w loc_03c340
	jsr loc_02ecd8
	beq.w loc_03c340
	move.l #$2001000,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
loc_03c546:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03c332
	jsr loc_02ecd8
	beq.w loc_03c332
	bsr.w loc_03c6e8
	move.l #$2001000,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;==============================================
loc_03c57c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03c324
	jsr loc_02ecd8
	beq.w loc_03c324
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;==============================================
loc_03c5ae:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03c5bc
	tst.b (pl_taunt_count,a6)
	beq.w loc_03c39e

loc_03c5bc:
	jsr loc_02ed00
	beq.w loc_03c39e
	move.l #$2000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	rts

;==============================================
loc_03c5e2:
	jsr loc_02edf8
	beq.w loc_03c3ac

;##############################################
;
;##############################################
loc_03c5ec:
	tst.b (PL_ism_choice,a6)
	bne.w loc_03c63c
	movea.w ($38,a6),a4
	move.l #$2000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #0,(pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #2,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$14,($5f,a4)
	move.b #$18,(pl_invinciblity_timer,a6)
	jsr loc_080e8e
	moveq #7,d0
	jmp loc_02a758

;##############################################
;
;##############################################
loc_03c63c:
	movea.w ($38,a6),a4
	move.l #$2000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #0,(pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b #$14,($5f,a4)
	move.b #$18,(pl_invinciblity_timer,a6)
	jsr loc_080e8e
	moveq #6,d0
	jmp loc_02a758

;==============================================
loc_03c684:
	tst.b ($28a,a6)
	bne.w loc_03c316
	tst.b ($31,a6)
	bne.w loc_03c6c2
	jsr loc_02ef54
	beq.w loc_03c316
	jsr loc_02ecd8
	beq.w loc_03c316
	move.l #$2001000,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_03c6c2:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_03c316
	jsr loc_02ed28
	beq.w loc_03c316
	move.l #$2001000,(4,a6)
	move.b #$18,(pl_move_id,a6)
	jmp loc_02f980

;==============================================
loc_03c6e8:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_6,a6)
	cmpi.b #4,($102,a6)
	beq.b loc_03c700
	movem.l d0-d1,(pl_inp_slot_1,a6)

loc_03c700:
	rts

;##############################################
;Special Move AI Checks
;##############################################
loc_03c702:
	moveq #0,d0
	move.b (pl_move_id,a6),d0
	move.w loc_03c710(pc,d0.w),d1
	jmp loc_03c710(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c710:
	dc.w loc_03c724-loc_03c710
	dc.w loc_03c72c-loc_03c710
	dc.w loc_03c734-loc_03c710
	dc.w loc_03c734-loc_03c710
	dc.w loc_03c740-loc_03c710
	dc.w loc_03c74e-loc_03c710
	dc.w loc_03c760-loc_03c710
	dc.w loc_03c770-loc_03c710

	dc.w loc_03c780-loc_03c710
	dc.w loc_03c790-loc_03c710

;==============================================
loc_03c724:
	move.b ($83,a6),($81,a6)
	bra.b loc_03c796

;==============================================
loc_03c72c:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c734:
	tst.b (PL_ism_choice,a6)
	bpl.b loc_03c79a
	clr.b ($80,a6)
	bra.b loc_03c796

;==============================================
loc_03c740:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_03c79a
	tst.b ($238,a6)
	bne.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c74e:
	tst.b (PL_ism_choice,a6)
	bpl.b loc_03c796
	cmpi.l #$2020400,(4,a6)
	bne.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c760:
	tst.b (PL_ism_choice,a6)
	bgt.b loc_03c79a
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c770:
	tst.b (PL_ism_choice,a6)
	bne.b loc_03c79a
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c780:
	tst.b (PL_ism_choice,a6)
	bne.b loc_03c79a
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_03c79a
	bra.b loc_03c796

;==============================================
loc_03c790:
	tst.b (pl_taunt_count,a6)
	beq.b loc_03c79a

;----------------------------------------------
loc_03c796:
	moveq #1,d0
	rts

;----------------------------------------------
loc_03c79a:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_03c79e:
	move.b (pl_move_id,a6),d0
	move.w loc_03c7aa(pc,d0.w),d1
	jmp loc_03c7aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c7aa:
	dc.w loc_03c7c4-loc_03c7aa;Lighting Legs
	dc.w loc_03c9b0-loc_03c7aa;Over Head
	dc.w loc_03cabe-loc_03c7aa;Xism Spinning Bird Kick
	dc.w loc_03ce66-loc_03c7aa;Xism Charge Punch
	dc.w loc_03cee2-loc_03c7aa;Fireball
	dc.w loc_03d070-loc_03c7aa;Upkick
	dc.w loc_03d1b2-loc_03c7aa;Kick Super
	dc.w loc_03d2e2-loc_03c7aa;Aism Upkick Super

	dc.w loc_03d44e-loc_03c7aa;Aism Fire Ball Super
	dc.w loc_03d62c-loc_03c7aa;Taunt
	dc.w loc_03d666-loc_03c7aa;Aism Alpha Counter
	dc.w loc_03d666-loc_03c7aa;Vism Alpha Counter
	dc.w loc_03d67c-loc_03c7aa;Vism Activate

;==============================================
;
;==============================================
loc_03c7c4:
	move.b (7,a6),d0
	move.w loc_03c7d0(pc,d0.w),d1
	jmp loc_03c7d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c7d0:
	dc.w loc_03c7d8-loc_03c7d0
	dc.w loc_03c806-loc_03c7d0
	dc.w loc_03c834-loc_03c7d0
	dc.w loc_03c994-loc_03c7d0

;----------------------------------------------
loc_03c7d8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b ($247,a6)
	moveq #9,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_03c806:
	tst.b ($35,a6)
	beq.b loc_03c82a
	addq.b #2,(7,a6)
	move.b #$f,($3a,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03c834
	move.b ($81,a6),d0
	move.b loc_03c830(pc,d0.w),($3a,a6)
	bra.w loc_03c90e

loc_03c82a:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c830:
	dc.b $00,$02,$03,$04

;----------------------------------------------
loc_03c834:
	tst.b (PL_cpucontrol,a6)
	bne.w loc_03c90e
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_03c8f4
	jsr loc_02af7a
	bne.w loc_03c8f4
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_03c86a
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_03c86a:
	tst.b ($34,a6)
	beq.b loc_03c892
	cmpi.b #1,($32,a6)
	bne.b loc_03c892
	clr.b ($34,a6)
	jsr loc_02f770
	jsr loc_020674
	tst.b ($247,a6)
	bne.b loc_03c892
	st.b ($247,a6)

loc_03c892:
	move.b ($378,a6),d1
	andi.w #$70,d1
	beq.b loc_03c8e8
	moveq #0,d0
	btst #4,d1
	bne.b loc_03c8ae
	moveq #2,d0
	btst #5,d1
	bne.b loc_03c8ae
	moveq #4,d0

loc_03c8ae:
	move.w loc_03c908(pc,d0.w),d2
	cmp.b ($3a,a6),d2
	bcc.b loc_03c8e8
	move.b #$f,($3a,a6)
	cmp.b ($82,a6),d0
	beq.b loc_03c8ee
	move.b d0,($82,a6)
	move.b ($35,a6),d2
	andi.w #$ff,d2
	addi.w #9,d0
	jsr loc_02a758
	movea.l ($1c,a6),a0
	lea.l (a0,d2.w),a0
	jmp loc_02a770

loc_03c8e8
	subq.b #1,($3a,a6)
	beq.b loc_03c8f4

loc_03c8ee:
	jmp loc_02a7ea

loc_03c8f4:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$a,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c908:
	dc.w $0000,$0003,$0006

;----------------------------------------------
loc_03c90e:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_03c980
	jsr loc_02af7a
	bne.b loc_03c980
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_03c938
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_03c938:
	tst.b ($34,a6)
	beq.b loc_03c97a
	cmpi.b #1,($32,a6)
	bne.b loc_03c97a
	clr.b ($34,a6)
	jsr loc_02f770
	jsr loc_020674
	tst.b ($247,a6)
	bne.b loc_03c960
	st.b ($247,a6)

loc_03c960:
	tst.b ($81,a6)
	beq.b loc_03c96e
	subq.b #1,($3a,a6)
	beq.b loc_03c980
	bra.b loc_03c97a

loc_03c96e:
	lea.l loc_03d9cc(pc),a1
	jsr loc_030a66
	bne.b loc_03c980

loc_03c97a:
	jmp loc_02a7ea

loc_03c980:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$a,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_03c994:
	tst.b ($33,a6)
	bpl.b loc_03c9a4
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03c9a4:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03c9b0:
	move.b (7,a6),d0
	move.w loc_03c9bc(pc,d0.w),d1
	jmp loc_03c9bc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03c9bc:
	dc.w loc_03c9c6-loc_03c9bc
	dc.w loc_03ca46-loc_03c9bc
	dc.w loc_03ca86-loc_03c9bc
	dc.w loc_03ca46-loc_03c9bc
	dc.w loc_03caa8-loc_03c9bc

;----------------------------------------------
loc_03c9c6:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_03ca16(pc,d0.w),($40,a6)
	move.l loc_03ca16+4(pc,d0.w),($48,a6)
	move.l loc_03ca16+8(pc,d0.w),($44,a6)
	move.l loc_03ca16+$c(pc,d0.w),($4c,a6)
	move.b #1,($31,a6)
	moveq #$29,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ca16:
	dc.l $00000000,$00000000,$00040000,$ffffe000
	dc.l $00060000,$ffffc000,$00048000,$ffffe000
	dc.l $00060000,$ffffc000,$00080000,$00000000

;----------------------------------------------
loc_03ca46:
	tst.b ($35,a6)
	beq.b loc_03ca5c
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	bra.b loc_03ca80

loc_03ca5c:
	move.l ($40,a6),d0
	bpl.b loc_03ca6c
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_03ca6c:
	tst.b (PL_Flip,a6)
	bne.b loc_03ca74
	neg.l d0

loc_03ca74:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)

loc_03ca80:
	jmp loc_02a7ea

;----------------------------------------------
loc_03ca86:
	tst.b ($35,a6)
	bne.b loc_03caa2
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l ($44,a6),($40,a6)
	move.l ($4c,a6),($48,a6)

loc_03caa2:
	jmp loc_02a7ea

;----------------------------------------------
loc_03caa8:
	tst.b ($33,a6)
	bpl.b loc_03cab8
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03cab8:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03cabe:
	move.b (7,a6),d0
	move.w loc_03caca(pc,d0.w),d1
	jmp loc_03caca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03caca:
	dc.w loc_03cade-loc_03caca
	dc.w loc_03cb66-loc_03caca
	dc.w loc_03cbe4-loc_03caca
	dc.w loc_03cc28-loc_03caca
	dc.w loc_03cc56-loc_03caca
	dc.w loc_03cccc-loc_03caca
	dc.w loc_03ccf6-loc_03caca
	dc.w loc_03cd5c-loc_03caca

	dc.w loc_03cdbc-loc_03caca
	dc.w loc_03cdf6-loc_03caca

;----------------------------------------------
loc_03cade:
	tst.b ($80,a6)
	bne.b loc_03cb20
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	move.w d0,d1
	lsr.w #1,d1
	add.w d1,d0
	move.b d0,($3c,a6)
	addi.w #$1c,d0
	jmp loc_02a758

loc_03cb20:
	move.b #$c,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$20000,d1
	cmpi.l #$60000,($44,a6)
	ble.b loc_03cb56
	move.l #$8000,d1

loc_03cb56:
	add.l d1,($44,a6)
	moveq #$25,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_03cb66:
	tst.b ($33,a6)
	bpl.b loc_03cbc6
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b d0,($1f1,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.w loc_03cbcc(pc,d0.w),d1
	move.w loc_03cbcc+2(pc,d0.w),($1f4,a6)
	move.w loc_03cbcc+4(pc,d0.w),($1f8,a6)
	move.w d1,($1f6,a6)
	move.w d1,($1f2,a6)
	move.l #$38000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	bne.b loc_03cbaa
	neg.l d0

loc_03cbaa:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	bra.w loc_03ce0c

loc_03cbc6:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03cbcc:
	dc.w $0400,$00a0,$0004
	dc.w $0000,$0480,$0070
	dc.w $0008,$0000,$0500
	dc.w $006c,$0020,$0000

;----------------------------------------------
loc_03cbe4:
	bsr.w loc_03ce3e
	bsr.w loc_03d916
	bpl.b loc_03cbf8
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)

loc_03cbf8:
	subq.b #1,($1f0,a6)
	bne.b loc_03cc26
	addq.b #1,($1f1,a6)
	andi.b #7,($1f1,a6)
	move.w ($1f4,a6),d0
	sub.w d0,($1f2,a6)
	cmpi.w #$100,($1f2,a6)
	bhi.b loc_03cc22
	addq.b #2,(7,a6)
	move.w #$100,($1f2,a6)

loc_03cc22:
	bra.w loc_03ce0c

loc_03cc26:
	rts

;----------------------------------------------
loc_03cc28:
	bsr.w loc_03ce3e
	bsr.w loc_03d916
	subq.w #1,($1f8,a6)
	bne.b loc_03cc40
	addq.b #2,(7,a6)
	move.b #$c,($3a,a6)

loc_03cc40:
	subq.b #1,($1f0,a6)
	bne.b loc_03cc54
	addq.b #1,($1f1,a6)
	andi.b #7,($1f1,a6)
	bra.w loc_03ce0c

loc_03cc54:
	rts

;----------------------------------------------
loc_03cc56:
	bsr.w loc_03ce3e
	bsr.w loc_03d916
	subq.b #1,($3a,a6)
	bpl.b loc_03cca0
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03cc90
	addq.b #2,(7,a6)
	jsr loc_00369c
	move.w d0,($14,a6)
	clr.w ($16,a6)
	moveq #0,d0
	move.b ($3c,a6),d0
	addi.w #$1e,d0
	jmp loc_02a758

loc_03cc90:
	move.l #$fffc0000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_03cca0:
	subq.b #1,($1f0,a6)
	bne.b loc_03ccca
	addq.b #1,($1f1,a6)
	andi.b #7,($1f1,a6)
	move.w ($1f4,a6),d0
	add.w d0,($1f2,a6)
	move.w ($1f6,a6),d0
	cmp.w ($1f2,a6),d0
	bhi.b loc_03ccc6
	move.w d0,($1f2,a6)

loc_03ccc6:
	bra.w loc_03ce0c

loc_03ccca:
	rts

;----------------------------------------------
loc_03cccc:
	tst.b ($35,a6)
	beq.b loc_03cce0
	clr.b ($31,a6)
	clr.b ($35,a6)
	jsr loc_00369c

loc_03cce0:
	tst.b ($33,a6)
	bpl.b loc_03ccf0
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03ccf0:
	jmp loc_02a7ea

;----------------------------------------------
loc_03ccf6:
	tst.b ($33,a6)
	bpl.b loc_03cd3e
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b loc_03cd56+1(pc,d0.w),($1f0,a6)
	move.l #$38000,d0
	tst.w ($40,a6)
	beq.b loc_03cd1c
	bmi.b loc_03cd28
	bra.b loc_03cd2a

loc_03cd1c:
	move.l #$18000,d0
	tst.b (PL_Flip,a6)
	bne.b loc_03cd2a

loc_03cd28:
	neg.l d0

loc_03cd2a:
	move.l d0,($40,a6)
	clr.l ($48,a6)
	moveq #$26,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03cd3e:
	jsr loc_03d916(pc)
	nop
	bpl.b loc_03cd50
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_03cd6c

loc_03cd50:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03cd56:
	dc.b $00,$01,$00,$01,$00,$02

;----------------------------------------------
loc_03cd5c:
	bsr.w loc_03d916
	bpl.b loc_03cd92
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03cd92

loc_03cd6c:
	move.b #$12,(7,a6)
	eori.b #1,(PL_Flip,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$2c,d0
	jmp loc_02a758

loc_03cd92:
	tst.b ($33,a6)
	bpl.b loc_03cdb6
	subq.b #1,($1f0,a6)
	bne.b loc_03cdaa
	addq.b #2,(7,a6)
	moveq #$2b,d0
	jmp loc_02a758

loc_03cdaa:
	moveq #$26,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03cdb6:
	jmp loc_02a7ea

;----------------------------------------------
loc_03cdbc:
	bsr.w loc_03d916
	bpl.b loc_03cdf0
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03cdf0
	addq.b #2,(7,a6)
	jsr loc_00369c
	eori.b #1,(PL_Flip,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	moveq #$2d,d0
	jmp loc_02a758

loc_03cdf0:
	jmp loc_02a7ea

;----------------------------------------------
loc_03cdf6:
	tst.b ($33,a6)
	bpl.b loc_03ce06
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03ce06:
	jmp loc_02a7ea

;----------------------------------------------
loc_03ce0c:
	move.b ($1f2,a6),($1f0,a6)
	moveq #0,d0
	move.b ($3c,a6),d0
	addi.w #$1d,d0
	jsr loc_02a758
	moveq #0,d0
	move.b ($1f1,a6),d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d0,d1
	lsl.w #2,d1
	movea.l ($1c,a6),a0
	lea.l (a0,d1.w),a0
	jmp loc_02a770

loc_03ce3e:
	tst.b ($a8,a6)
	beq.b loc_03ce48
	subq.b #1,($a8,a6)

loc_03ce48:
	tst.b ($5b,a6)
	ble.b loc_03ce5e
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	move.b loc_03ce60+1(pc,d0.w),($a8,a6)

loc_03ce5e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ce60:
	dc.b $00,$0a,$00,$0e,$00,$0c

;==============================================
;
;==============================================
loc_03ce66:
	move.b (7,a6),d0
	move.w loc_03ce72(pc,d0.w),d1
	jmp loc_03ce72(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ce72:
	dc.w loc_03ce76-loc_03ce72
	dc.w loc_03cec6-loc_03ce72

;----------------------------------------------
loc_03ce76:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	move.w d0,d1
	add.w d1,d1
	move.l loc_03ceba(pc,d1.w),d1
	tst.b (PL_Flip,a6)
	bne.b loc_03ce94
	neg.l d1

loc_03ce94:
	move.l d1,($40,a6)
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.b #$30,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ceba:
	dc.l $00010000
	dc.l $00020000
	dc.l $00030000

;----------------------------------------------
loc_03cec6:
	tst.b ($33,a6)
	bmi.w loc_03d9ba
	tst.b ($35,a6)
	beq.b loc_03cedc
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_03cedc:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03cee2:
	move.b (7,a6),d0
	move.w loc_03ceee(pc,d0.w),d1
	jmp loc_03ceee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03ceee:
	dc.w loc_03cef4-loc_03ceee
	dc.w loc_03cf24-loc_03ceee
	dc.w loc_03d044-loc_03ceee

;----------------------------------------------
loc_03cef4:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.b #$10,d0
	jmp loc_02a758

;----------------------------------------------
loc_03cf24:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_03d042
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_03d042
	addq.b #1,(a4)
	move.b #4,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_03d030
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_03d042
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_03d042
	jsr loc_01c1c8
	beq.b loc_03d042
	addq.b #1,(a4)
	move.b #4,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)

loc_03d030:
	move.b #$a,($cc,a4)
	move.b #2,($ee,a4)
	move.b #2,($ef,a4)

loc_03d042:
	rts

;----------------------------------------------
loc_03d044:
	tst.b ($3a,a6)
	beq.b loc_03d054
	subq.b #1,($3a,a6)
	bne.b loc_03d054
	clr.b ($ce,a6)

loc_03d054:
	tst.b ($33,a6)
	bpl.b loc_03d064
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d064:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d070:
	move.b (7,a6),d0
	move.w loc_03d07c(pc,d0.w),d1
	jmp loc_03d07c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d07c:
	dc.w loc_03d084-loc_03d07c
	dc.w loc_03d11a-loc_03d07c
	dc.w loc_03d132-loc_03d07c
	dc.w loc_03d17e-loc_03d07c

;----------------------------------------------
loc_03d084:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #-$18,d1
	tst.b (PL_Flip,a6)
	beq.b loc_03d0ac
	neg.w d1

loc_03d0ac:
	add.w d1,($10,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b ($82,a6),d0
	move.b d0,d1
	lsl.w #3,d0
	move.l loc_03d0ea(pc,d0.w),($40,a6)
	move.l loc_03d0ea+4(pc,d0.w),($48,a6)
	move.l loc_03d0ea+8(pc,d0.w),($44,a6)
	move.l loc_03d0ea+$c(pc,d0.w),($4c,a6)
	lsr.b #1,d1
	addq.b #1,d1
	move.b d1,($3a,a6)
	moveq #$13,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d0ea:
	dc.l $00060000,$ffffc000,$00040000,$ffffe000
	dc.l $00060000,$ffffc000,$00048000,$ffffe000
	dc.l $00060000,$ffffc000,$00050000,$ffffd600

;----------------------------------------------
loc_03d11a:
	tst.b ($35,a6)
	bne.b loc_03d12a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_03d12a:
	bsr.b loc_03d19a
	jmp loc_02a7ea

;----------------------------------------------
loc_03d132:
	bsr.w loc_03d938
	bpl.b loc_03d176
	move.l #$ffffb800,($4c,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03d176
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$14,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03d176:
	bsr.b loc_03d19a
	jmp loc_02a7ea

;----------------------------------------------
loc_03d17e:
	tst.b ($33,a6)
	bpl.b loc_03d18e
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d18e:
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_03d19a:
	tst.b ($5b,a6)
	beq.b loc_03d1b0
	clr.b ($5b,a6)
	subq.b #1,($3a,a6)
	bne.b loc_03d1b0
	move.b #1,($a8,a6)

loc_03d1b0:
	rts

;==============================================
;
;==============================================
loc_03d1b2:
	move.b (7,a6),d0
	move.w loc_03d1be(pc,d0.w),d1
	jmp loc_03d1be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d1be:
	dc.w loc_03d1c6-loc_03d1be
	dc.w loc_03d240-loc_03d1be
	dc.w loc_03d26a-loc_03d1be
	dc.w loc_03d296-loc_03d1be

;----------------------------------------------
loc_03d1c6:
	addq.b #2,(7,a6)
	move.b #4,($3a,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	move.w d0,d1
	lsl.w #3,d1
	move.l loc_03d210(pc,d1.w),($40,a6)
	move.l loc_03d210+4(pc,d1.w),($48,a6)
	move.l loc_03d210+8(pc,d1.w),($44,a6)
	move.l loc_03d210+$c(pc,d1.w),($4c,a6)
	lsr.w #1,d0
	addi.w #$19,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d210:
	dc.l $00050000,$00005000,$000a0000,$00006000
	dc.l $00050000,$00005000,$000a0000,$00006000
	dc.l $00050000,$00005000,$000a0000,$00006000

;----------------------------------------------
loc_03d240:
	subq.b #1,($3a,a6)
	bne.b loc_03d268
	addq.b #2,(7,a6)
	move.b #$35,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03d25a
	moveq #1,d0

loc_03d25a:
	move.b d0,($ab,a6)
	moveq #-6,d0
	moveq #$4a,d1
	jmp loc_082e36

loc_03d268:
	rts

;----------------------------------------------
loc_03d26a:
	subq.b #1,($3a,a6)
	bne.b loc_03d268
	addq.b #2,(7,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03d286
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_03d286:
	move.b loc_03d292(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($ab,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d292:
	dc.b $09,$0d,$16,$00

;----------------------------------------------
loc_03d296:
	move.l ($40,a6),d0
	beq.b loc_03d2b6
	tst.b (PL_Flip,a6)
	bne.b loc_03d2a4
	neg.l d0

loc_03d2a4:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	sub.l d0,($40,a6)
	bpl.b loc_03d2b6
	clr.l ($40,a6)

loc_03d2b6:
	tst.b ($35,a6)
	beq.b loc_03d2cc
	clr.b ($35,a6)
	move.l ($44,a6),($40,a6)
	move.l ($4c,a6),($48,a6)

loc_03d2cc:
	tst.b ($33,a6)
	bpl.b loc_03d2dc
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d2dc:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d2e2:
	move.b (7,a6),d0
	move.w loc_03d2ee(pc,d0.w),d1
	jmp loc_03d2ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d2ee:
	dc.w loc_03d2fa-loc_03d2ee
	dc.w loc_03d32a-loc_03d2ee
	dc.w loc_03d354-loc_03d2ee
	dc.w loc_03d386-loc_03d2ee
	dc.w loc_03d3ec-loc_03d2ee
	dc.w loc_03d438-loc_03d2ee

;----------------------------------------------
loc_03d2fa:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$18,d1
	tst.b (PL_Flip,a6)
	bne.b loc_03d31a
	moveq #-$18,d1

loc_03d31a:
	add.w d1,($10,a6)
	moveq #$1c,d0
	add.b ($82,a6),d0
	jmp loc_02a758

;----------------------------------------------
loc_03d32a:
	jsr loc_02a7ea
	tst.b ($34,a6)
	beq.b loc_03d352
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03d344
	moveq #1,d0

loc_03d344:
	move.b d0,($ab,a6)
	moveq #$32,d0
	moveq #$2f,d1
	jmp loc_082e36

loc_03d352:
	rts

;----------------------------------------------
loc_03d354:
	jsr loc_02a7ea
	tst.b ($34,a6)
	bne.b loc_03d352
	addq.b #2,(7,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03d376
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_03d376:
	move.b loc_03d382(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($ab,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d382:
	dc.b $05,$09,$0e,$00

;----------------------------------------------
loc_03d386:
	tst.b ($35,a6)
	bne.b loc_03d3b6
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_03d3bc(pc,d0.w),($40,a6)
	move.l loc_03d3bc+4(pc,d0.w),($48,a6)
	move.l loc_03d3bc+8(pc,d0.w),($44,a6)
	move.l loc_03d3bc+$c(pc,d0.w),($4c,a6)

loc_03d3b6:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d3bc:
	dc.l $00060000,$ffffc000,$00050000,$ffffe000
	dc.l $00060000,$ffffc000,$00058000,$ffffe000
	dc.l $00060000,$ffffc000,$00060000,$ffffe000

;----------------------------------------------
loc_03d3ec:
	bsr.w loc_03d938
	bpl.b loc_03d432
	tst.b ($33,a6)
	bpl.b loc_03d432
	move.l #$ffffa000,($4c,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03d432
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,(pl_attk_active,a6)
	jsr loc_00369c
	moveq #$1d,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03d432:
	jmp loc_02a7ea

;----------------------------------------------
loc_03d438:
	tst.b ($33,a6)
	bpl.b loc_03d448
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d448:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d44e:
	move.b (7,a6),d0
	move.w loc_03d45a(pc,d0.w),d1
	jmp loc_03d45a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d45a:
	dc.w loc_03d466-loc_03d45a
	dc.w loc_03d484-loc_03d45a
	dc.w loc_03d4ae-loc_03d45a
	dc.w loc_03d4e0-loc_03d45a
	dc.w loc_03d552-loc_03d45a
	dc.w loc_03d616-loc_03d45a

;----------------------------------------------
loc_03d466:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$22,d0
	jmp loc_02a758

;----------------------------------------------
loc_03d484:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_03d4ac
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_03d49e
	moveq #1,d0

loc_03d49e:
	move.b d0,($ab,a6)
	moveq #-$1a,d0
	moveq #$33,d1
	jmp loc_082e36

loc_03d4ac:
	rts

;----------------------------------------------
loc_03d4ae:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_03d4ac
	addq.b #2,(7,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_03d4d0
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_03d4d0:
	move.b loc_03d4dc(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($ab,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d4dc:
	dc.b $08,$0c,$10,00

;----------------------------------------------
loc_03d4e0:
	tst.b ($33,a6)
	bpl.b loc_03d54c
	jsr loc_01c1c8
	beq.b loc_03d540
	addq.b #2,(7,a6)
	addq.b #1,(a4)
	move.b #$15,(2,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.w ($26,a6),($26,a4)
	move.w ($c,a6),($c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.w a6,($36,a4)

loc_03d540:
	moveq #$23,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03d54c:
	jmp loc_02a7ea

;----------------------------------------------
loc_03d552:
	movea.w ($28,a6),a4
	tst.b ($33,a4)
	bpl.w loc_03d614
	tst.b ($33,a6)
	bpl.b loc_03d574
	addq.b #2,(7,a6)
	moveq #$24,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03d574:
	tst.b ($35,a6)
	beq.w loc_03d60e
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.w loc_03d60e
	addq.b #1,(a4)
	move.w #$1901,(2,a4)
	move.b #2,($9,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($26,a6),($26,a4)
	move.w ($c,a6),($c,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.l ($18,a6),($18,a4)
	jsr loc_01c2c8
	beq.b loc_03d60e
	addq.b #1,(a4)
	move.w #$1900,(2,a4)
	move.b #0,($9,a4)
	move.b ($e,a6),($e,a4)
	move.b (PL_Flip,a6),($b,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w ($64,a6),($64,a4)
	move.w ($18,a6),($18,a4)
	move.w #$6000,($1a,a4)

loc_03d60e:
	jmp loc_02a7f0

loc_03d614:
	rts

;----------------------------------------------
loc_03d616:
	tst.b ($33,a6)
	bpl.b loc_03d626
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d626:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d62c:
	move.b (7,a6),d0
	move.w loc_03d638(pc,d0.w),d1
	jmp loc_03d638(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d638:
	dc.w loc_03d63c-loc_03d638
	dc.w loc_03d658-loc_03d638

;----------------------------------------------
loc_03d63c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_03d650
	subq.b #1,(pl_taunt_count,a6)

loc_03d650:
	moveq #8,d0
	jmp loc_02a758

;----------------------------------------------
loc_03d658:
	tst.b ($33,a6)
	bmi.w loc_03d9ba
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d666:
	tst.b ($33,a6)
	bpl.b loc_03d676
	jsr loc_02e35a
	bra.w loc_03d9ba

loc_03d676:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d67c:
	move.b (7,a6),d0
	move.w loc_03d688(pc,d0.w),d1
	jmp loc_03d688(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d688:
	dc.w loc_03d68e-loc_03d688
	dc.w loc_03d6ae-loc_03d688
	dc.w loc_03d6e2-loc_03d688

;----------------------------------------------
loc_03d68e:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2f,d0
	tst.b ($31,a6)
	bne.b loc_03d6a8
	moveq #$2b,d0

loc_03d6a8:
	jmp loc_02a708

;----------------------------------------------
loc_03d6ae:
	tst.b ($34,a6)
	beq.b loc_03d6dc
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-7,d0
	moveq #$47,d1
	tst.b ($31,a6)
	beq.b loc_03d6d2
	moveq #-3,d0
	moveq #$50,d1

loc_03d6d2:
	jsr loc_097cd6
	bsr.w loc_03d6fc

loc_03d6dc:
	jmp loc_02a7ea

;----------------------------------------------
loc_03d6e2:
	subq.b #1,($3a,a6)
	bne.b loc_03d6dc
	tst.b ($31,a6)
	beq.b loc_03d6f6
	move.l #$2000602,(4,a6)

loc_03d6f6:
	jmp loc_02f796

;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;==============================================
loc_03d6fc:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_5,a6)
	movem.l d0-d1,(pl_inp_slot_6,a6)
	movem.l d0-d1,(pl_inp_slot_7,a6)
	movem.l d0-d1,(pl_inp_slot_8,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;##############################################
;
;##############################################
loc_03d73e:
	cmpi.b #4,($80,a6)
	beq.w loc_03d7f6
	move.b (7,a6),d0
	move.w loc_03d75a(pc,d0.w),d1
	jsr loc_03d75a(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d75a:
	dc.w loc_03d762-loc_03d75a
	dc.w loc_03d776-loc_03d75a
	dc.w loc_03d7ce-loc_03d75a
	dc.w loc_03d7e8-loc_03d75a

;----------------------------------------------
loc_03d762:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_03d776:
	tst.b ($33,a6)
	bpl.b loc_03d7e2
	addq.b #2,(7,a6)
	move.w #$91,d0
	jsr loc_02e3fe
	bne.b loc_03d798
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

loc_03d798:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03d7b8
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bhi.b loc_03d7c0
	bra.b loc_03d7c6

loc_03d7b8:
	btst.b #0,($371,a6)
	beq.b loc_03d7c6

loc_03d7c0:
	eori.b #1,(PL_Flip,a6)

loc_03d7c6:
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_03d7ce:
	tst.b ($35,a6)
	beq.b loc_03d7e2
	addq.b #2,(7,a6)
	move.w #$91,d0
	jsr loc_02e7f2

loc_03d7e2:
	jmp loc_02a7ea

;----------------------------------------------
loc_03d7e8:
	tst.b ($33,a6)
	bmi.w loc_03d9ba
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_03d7f6:
	move.b (7,a6),d0
	move.w loc_03d808(pc,d0.w),d1
	jsr loc_03d808(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d808:
	dc.w loc_03d814-loc_03d808
	dc.w loc_03d886-loc_03d808
	dc.w loc_03d892-loc_03d808
	dc.w loc_03d8dc-loc_03d808
	dc.w loc_03d8f4-loc_03d808
	dc.w loc_03d908-loc_03d808

;-----------------------------------------------------------------------------
loc_03d814:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.w #$92,d0
	jsr loc_02e636
	bne.b loc_03d84a
	bsr.w loc_03d916
	bpl.b loc_03d83e
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_03d9c6

loc_03d83e:
	addq.b #4,(7,a6)
	moveq #2,d0
	jmp loc_02a758

loc_03d84a:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_03d86a
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bhi.b loc_03d872
	bra.b loc_03d878

loc_03d86a:
	btst.b #0,($371,a6)
	beq.b loc_03d878

loc_03d872:
	eori.b #1,(PL_Flip,a6)

loc_03d878:
	move.b #$c,($3a,a6)
	moveq #4,d0
	jmp loc_02a758

;-----------------------------------------------------------------------------
loc_03d886:
	subq.b #1,($3a,a6)
	bne.b loc_03d890
	addq.b #2,(7,a6)

loc_03d890:
	rts

;-----------------------------------------------------------------------------
loc_03d892:
	bsr.w loc_03d916
	bpl.b loc_03d8c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_03d8c2
	addq.b #4,(7,a6)
	jsr loc_00369c
	moveq #0,d1
	move.w d0,($14,a6)
	move.w d1,($16,a6)
	move.b d1,($31,a6)
	moveq #5,d0
	jmp loc_02a758

loc_03d8c2:
	tst.b ($35,a6)
	beq.b loc_03d8d6
	addq.b #2,(7,a6)
	move.w #$92,d0
	jsr loc_02e7f2

loc_03d8d6:
	jmp loc_02a7ea

;-----------------------------------------------------------------------------
loc_03d8dc:
	bsr.w loc_03d916
	bpl.b loc_03d8ee
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_03d9c6

loc_03d8ee:
	jmp loc_02a7ea

;-----------------------------------------------------------------------------
loc_03d8f4:
	addq.b #2,(7,a6)
	move.w #$93,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;-----------------------------------------------------------------------------
loc_03d908:
	tst.b ($33,a6)
	bmi.w loc_03d9ba
	jmp loc_02a7ea

;==============================================
loc_03d916:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_03d938:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_03d944
	neg.l d0

loc_03d944
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_03d95c
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_03d95c:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_03d96e:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_03d9b8
	move.l (4,a6),d0
	andi.l #$fffff00,d0
	cmpi.l #$2000e00,d0
	bne.b loc_03d9b8
	cmpi.b #2,(pl_move_id,a6)
	bne.b loc_03d9b8
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_03d9b8
	tst.b ($5b,a6)
	beq.b loc_03d9b8
	blt.b loc_03d9a8
	clr.b ($5b,a6)
	moveq #$2f,d0
	jmp loc_02a758

loc_03d9a8:
	clr.b ($5b,a6)
	moveq #$2a,d0
	add.b ($82,a6),d0
	jmp loc_02a758

loc_03d9b8:
	rts

;==============================================
loc_03d9ba:
	jmp loc_02baf2

;==============================================
loc_03d9c0:
	jmp loc_02bb26

;==============================================
loc_03d9c6:
	jmp loc_02bd64

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03d9cc:
	dc.l $00000fff,$00003fff,$0000ffff,$0001ffff
	dc.l $0003ffff,$0007ffff,$0007ffff,$000fffff
	dc.l $000fffff,$001fffff,$001fffff,$001fffff
	dc.l $003fffff,$003fffff,$003fffff,$003fffff
	dc.l $007fffff,$007fffff,$007fffff,$007fffff
	dc.l $007fffff,$00ffffff,$00ffffff,$00ffffff
	dc.l $00ffffff,$01ffffff,$01ffffff,$01ffffff
	dc.l $03ffffff,$03ffffff,$07ffffff,$0fffffff

;##############################################
;
;##############################################
loc_03da4c:
	dc.w loc_03da94-loc_03da4c
	dc.w loc_03da94-loc_03da4c
	dc.w loc_03da52-loc_03da4c

loc_03da52:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02

loc_03da94:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02