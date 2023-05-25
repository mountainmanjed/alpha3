;##############################################
;Winposes
;##############################################
loc_067760:
	move.b (6,a6),d0
	move.w loc_06776c(pc,d0.w),d1
	jmp loc_06776c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06776c:
	dc.w loc_067774-loc_06776c
	dc.w loc_067786-loc_06776c;1a
	dc.w loc_06779c-loc_06776c;30
	dc.w loc_0677fc-loc_06776c;90

;----------------------------------------------
loc_067774:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_067786:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_067796
	tst.b ($11c,a5)
	bne.b loc_067796
	addq.b #2,(6,a6)

loc_067796:
	jmp loc_02a7ea

;----------------------------------------------
loc_06779c:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	subq.b #2,d0
	bpl.b loc_0677be
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_0677e0(pc,d0.w),d0
	add.w d0,d0

loc_0677be:
	move.b d0,($2c4,a6)
	move.b d0,($84,a6)
	lsr.b #1,d0
	ext.w d0
	tst.b ($6b,a6)
	bne.b loc_0677d6
	move.b loc_0677f6(pc,d0.w),d0
	bra.b loc_0677da

loc_0677d6:
	move.b loc_0677f0(pc,d0.w),d0

loc_0677da:
	jmp loc_02a708


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0677e0:
	dc.b $00,$04,$03,$02,$01,$00,$04,$03
	dc.b $02,$01,$00,$04,$03,$02,$01,$00

loc_0677f0:
	dc.b $23,$25,$25,$26,$27,$23

loc_0677f6:
	dc.b $23,$24,$24,$26,$27,$23

;----------------------------------------------
loc_0677fc:
	move.b ($84,a6),d0
	move.w loc_06780c(pc,d0.w),d1
	jsr loc_06780c(pc,d1.w)
	bra.w loc_0678be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06780c:
	dc.w loc_067848-loc_06780c
	dc.w loc_067818-loc_06780c
	dc.w loc_067848-loc_06780c
	dc.w loc_06784e-loc_06780c
	dc.w loc_067848-loc_06780c
	dc.w loc_067848-loc_06780c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_067818:
	addq.b #2,($84,a6)
	jsr loc_01c2c8
	beq.b loc_067848
	move.w #$101,(a4)
	move.b #$20,(2,a4)
	move.b ($102,a6),(3,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($36,a6)

loc_067848:
	jmp loc_02a7ea

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_06784e:
	move.b (7,a6),d0
	move.w loc_06785a(pc,d0.w),d1
	jmp loc_06785a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06785a:
	dc.w loc_067860-loc_06785a
	dc.w loc_067892-loc_06785a
	dc.w loc_067848-loc_06785a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_067860:
	tst.b ($35,a6)
	beq.b loc_06788c
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$61000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_06788c:
	jmp loc_02a7ea

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_067892:
	jsr loc_02aa08
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_0678aa
	tst.b ($35,a6)
	beq.b loc_0678b8
	rts

loc_0678aa:
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	move.b #1,($32,a6)

loc_0678b8:
	jmp loc_02a7ea

;----------------------------------------------
loc_0678be:
	tst.b ($3a,a6)
	beq.b loc_0678d2
	subq.b #1,($3a,a6)
	bne.b loc_0678d2
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_0678d2:
	rts

;##############################################
;Time Over
;##############################################
loc_0678d4:
	move.b (6,a6),d0
	move.w loc_0678e0(pc,d0.w),d1
	jmp loc_0678e0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0678e0:
	dc.w loc_0678e8-loc_0678e0
	dc.w loc_0678fa-loc_0678e0
	dc.w loc_06790a-loc_0678e0
	dc.w loc_06792c-loc_0678e0

;----------------------------------------------
loc_0678e8:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_0678fa:
	tst.b ($11c,a5)
	bne.b loc_067904
	addq.b #2,(6,a6)

loc_067904:
	jmp loc_02a7ea

;----------------------------------------------
loc_06790a:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($6b,a6)
	bne.b loc_06791e
	moveq #$31,d0

loc_06791e:
	tst.b ($15a,a5)
	beq.b loc_067926
	moveq #$29,d0

loc_067926:
	jmp loc_02a708

;----------------------------------------------
loc_06792c:
	tst.b ($3a,a6)
	beq.b loc_067940
	subq.b #1,($3a,a6)
	bne.b loc_067940
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_067940:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_067946:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_06795e:
	tst.b ($80,a6)
	bne.w loc_067b84
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_0679e2
	move.b (7,a6),d0
	move.w loc_06797e(pc,d0.w),d1
	jmp loc_06797e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06797e:
	dc.w loc_067982-loc_06797e
	dc.w loc_0679dc-loc_06797e

;----------------------------------------------
loc_067982:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_0679c2
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_0679c2
	btst #0,($83,a6)
	bne.b loc_0679d0
	bra.b loc_0679ce

loc_0679c2:
	move.w loc_0679d6(pc,d1.w),d1
	move.w (pl_dist_away,a6),d2
	cmp.w d2,d1
	bcc.b loc_0679d0

loc_0679ce:
	addq.b #1,d0

loc_0679d0:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0679d6:
	dc.w $0020,$0030,$0040

;----------------------------------------------
loc_0679dc
	jmp loc_02f5ac

;==============================================
;Kick Start
;==============================================
loc_0679e2:
	move.b ($82,a6),d0
	move.w loc_0679ee(pc,d0.w),d1
	jmp loc_0679ee(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0679ee:
	dc.w loc_0679f4-loc_0679ee
	dc.w loc_0679f4-loc_0679ee
	dc.w loc_067a50-loc_0679ee

;==============================================
;Other Kicks
;==============================================
loc_0679f4:
	move.b (7,a6),d0
	move.w loc_067a00(pc,d0.w),d1
	jmp loc_067a00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067a00:
	dc.w loc_067a04-loc_067a00
	dc.w loc_067a4a-loc_067a00

;----------------------------------------------
loc_067a04:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	move.b d0,d1
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b d1,d0
	cmpi.b #4,($82,a6)
	bne.b loc_067a44
	btst #1,($83,a6)
	beq.b loc_067a44
	moveq #$1e,d0
	move.b #8,(7,a6)

loc_067a44:
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_067a4a:
	jmp loc_02f5ac

;==============================================
;Heavy Kick
;==============================================
loc_067a50:
	move.b (7,a6),d0
	move.w loc_067a5c(pc,d0.w),d1
	jmp loc_067a5c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067a5c:
	dc.w loc_067a04-loc_067a5c
	dc.w loc_067a6a-loc_067a5c
	dc.w loc_067aa4-loc_067a5c
	dc.w loc_067adc-loc_067a5c
	dc.w loc_067aea-loc_067a5c
	dc.w loc_067b36-loc_067a5c
	dc.w loc_067b76-loc_067a5c

;----------------------------------------------
loc_067a6a:
	tst.b ($35,a6)
	beq.b loc_067a9e
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$20000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffff5800,($4c,a6)

loc_067a9e:
	jmp loc_02a7ea

;----------------------------------------------
loc_067aa4:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_067ace
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	addq.b #2,(7,a6)
	move.b #1,($32,a6)

loc_067ace:
	tst.b ($35,a6)
	bne.b loc_067ada
	jmp loc_02a7ea

loc_067ada:
	rts

;----------------------------------------------
loc_067adc:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	jmp loc_02a7ea

;----------------------------------------------
loc_067aea:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_067b34
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.w #$ffe8,d1
	tst.b (PL_Flip,a6)
	beq.b loc_067b0a
	neg.w d1

loc_067b0a:
	add.w d1,($10,a6)
	move.b #1,($31,a6)
	move.l #$50000,($40,a6)
	move.l #$fffff000,($48,a6)
	move.l #$2e000,($44,a6)
	move.l #$ffffac00,($4c,a6)

loc_067b34:
	rts

;----------------------------------------------
loc_067b36:
	bsr.w loc_0697f8
	tst.b ($35,a6)
	bne.b loc_067b46
	jsr loc_02a7ea

loc_067b46:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_067b74
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_067b74:
	rts

;----------------------------------------------
loc_067b76:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	jmp loc_02a7ea

;==============================================
;Crouching
;==============================================
loc_067b84:
	move.b #1,(pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_067bd6
	move.b (7,a6),d0
	move.w loc_067b9e(pc,d0.w),d1
	jmp loc_067b9e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067b9e:
	dc.w loc_067ba2-loc_067b9e
	dc.w loc_067bd0-loc_067b9e

;----------------------------------------------
loc_067ba2:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_067bd0:
	jmp loc_02f5ac

;==============================================
;Crouching Kicks
;==============================================
loc_067bd6:
	move.b (7,a6),d0
	move.w loc_067be2(pc,d0.w),d1
	jmp loc_067be2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_067be2:
	dc.w loc_067bec-loc_067be2
	dc.w loc_067c48-loc_067be2
	dc.w loc_067c4e-loc_067be2
	dc.w loc_067c5e-loc_067be2
	dc.w loc_067c72-loc_067be2

;----------------------------------------------
loc_067bec:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr loc_02aebc
	cmpi.b #4,($82,a6)
	bne.b loc_067c30
	move.b #4,(7,a6)
	move.l #$e0000,($40,a6)
	move.l #0,($44,a6)
	move.l #$ffff0000,($48,a6)
	move.l #0,($4c,a6)

loc_067c30:
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$f,d0
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_067c48:
	jmp loc_02f5ac

;----------------------------------------------
loc_067c4e:
	tst.b ($35,a6)
	beq.b loc_067c58
	addq.b #2,(7,a6)

loc_067c58:
	jmp loc_02f5ac

;----------------------------------------------
loc_067c5e:
	bsr.w loc_0697f8
	tst.l ($40,a6)
	bpl.b loc_067c6c
	addq.b #2,(7,a6)

loc_067c6c:
	jmp loc_02f5ac

;----------------------------------------------
loc_067c72:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;##############################################
;Air Normals
;##############################################
loc_067c80:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_067caa
	moveq #$18,d0

loc_067caa:
	tst.b ($81,a6)
	beq.b loc_067cb2
	addq.w #3,d0

loc_067cb2:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;Special Move Inputs
;##############################################
loc_067cc2:
	jsr SPButton_Vism_code
	bne.w loc_067f22

loc_067ccc:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpChrg_1318K_code
	bne.w loc_067dfc

loc_067cda:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpChrg_4646K_code
	bne.w loc_067d9c

loc_067ce8:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpChrg_4646P_code
	bne.w loc_067d5c

loc_067cf6:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpChrg_28K_code
	bne.w loc_067e96

loc_067d04:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpChrg_16K_code
	bne.w loc_067dc8

loc_067d12:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpChrg_46P_code
	bne.w loc_067e48

loc_067d20:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpChrg_28P_code
	bne.w loc_067e72

loc_067d2e:
	jsr SPButton_AllP_code
	bne.w loc_067f00

loc_067d38:
	jsr SPButton_AllK_code
	bne.w loc_067edc

loc_067d42:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_067f86

loc_067d50:
	jsr SPButton_Taunt_code
	bne.w loc_068012

loc_067d5a:
	rts

;----------------------------------------------
;Move ID Writes
;----------------------------------------------
loc_067d5c:
	tst.b (PL_ism_choice,a6)
	bne.b loc_067cf6
	cmpi.w #$90,(PL_meter,a6)
	bcs.b loc_067cf6
	tst.b ($6a,a6)
	beq.b loc_067cf6
	jsr loc_02ecd8
	beq.w loc_067cf6
	move.l #$02001000,(4,a6)
	move.b #$1c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

;----------------------------------------------
loc_067d9c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_067ce8
	jsr loc_02ecd8
	beq.w loc_067ce8
	move.l #$02001000,(4,a6)
	move.b #$1a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_067dc8:
	cmpi.b #1,(PL_ism_choice,a6)
	bne.w loc_067d12
	jsr loc_02ed00
	beq.w loc_067d12
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #$18,(pl_move_id,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_067dfc:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_067cda
	jsr loc_02ecd8
	beq.w loc_067cda
	clr.b ($1fe,a6)
	move.b #$12,(pl_move_id,a6)
	move.l #$02001000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jsr SPButton_AllK_code
	beq.b loc_067e42
	cmpi.w #$38,(Main_stageid,a5)
	bne.b loc_067e42
	move.b #$1e,(pl_move_id,a6)
	st.b ($1fe,a6)

loc_067e42:
	jmp loc_02f4dc

;----------------------------------------------
loc_067e48:
	jsr loc_02ed00
	beq.w loc_067d20
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,(pl_move_id,a6)
	jmp loc_02f728

;----------------------------------------------
loc_067e72:
	jsr loc_02ed00
	beq.w loc_067d2e
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #$a,(pl_move_id,a6)
	jmp loc_02f728

;----------------------------------------------
loc_067e96:
	jsr loc_02ed00
	beq.w loc_067d04
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($1fe,a6)
	jsr SPButton_AllK_code
	beq.b loc_067ed0
	cmpi.w #$38,(Main_stageid,a5)
	bne.b loc_067ed0
	move.b #$1e,(pl_move_id,a6)
	move.b #4,($82,a6)
	rts

loc_067ed0:
	move.b #6,(pl_move_id,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_067edc:
	jsr loc_02ed00
	beq.w loc_067d42
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_attk_active,a6)
	move.b #2,(pl_move_id,a6)
	rts

;----------------------------------------------
loc_067f00:
	jsr loc_02ed00
	beq.w loc_067d38
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_attk_active,a6)
	clr.b (pl_move_id,a6)
	rts

;----------------------------------------------
loc_067f22:
	tst.b ($28a,a6)
	bne.w loc_067ccc
	tst.b ($31,a6)
	bne.w loc_067f60
	jsr loc_02ef54
	beq.w loc_067ccc
	jsr loc_02ecd8
	beq.w loc_067ccc
	move.l #$02001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_067f60:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_067ccc
	jsr loc_02ed28
	beq.w loc_067ccc
	move.l #$02001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	jmp loc_02f980

;----------------------------------------------
loc_067f86:
	jsr loc_02edf8
	beq.w loc_067d50

;##############################################
;A-ism Alpha Counter Write
;##############################################
loc_067f90:
	tst.b (PL_ism_choice,a6)
	bne.w loc_067fd8
	move.l #$02000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$1a,($5f,a4)
	move.b #$1e,(pl_invinciblity_timer,a6)
	moveq #7,d0
	jmp loc_02a758

;##############################################
;V-ism Alpha Counter Write
;##############################################
loc_067fd8:
	move.l #$2000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	clr.b (pl_crouching,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_hitfreeze,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	move.b #$19,(pl_invinciblity_timer,a6)
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_068012:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_068020
	tst.b (pl_taunt_count,a6)
	beq.w loc_067d5a

loc_068020:
	jsr loc_02ed00
	beq.w loc_067d5a
	move.l #$02000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;##############################################
;Ai Move Checks
;##############################################
loc_068040:
	move.b (pl_move_id,a6),d0
	move.w loc_06804c(pc,d0.w),d1
	jmp loc_06804c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06804c:
	dc.w loc_06811c-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_06806c-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_06811c-loc_06804c

	dc.w loc_06811c-loc_06804c
	dc.w loc_0680c8-loc_06804c
	dc.w loc_068090-loc_06804c
	dc.w loc_06811c-loc_06804c
	dc.w loc_0680e0-loc_06804c
	dc.w loc_0680ec-loc_06804c
	dc.w loc_068102-loc_06804c
	dc.w loc_06811c-loc_06804c

;----------------------------------------------
loc_06806c:
	move.b ($127,a6),d0
	cmpi.b #$10,d0
	bcc.w loc_06811c
	cmpi.w #$38,(Main_stageid,a5)
	bne.w loc_06811c
	clr.b ($1fe,a6)
	move.b #$1e,(pl_move_id,a6)
	bra.w loc_06811c

;----------------------------------------------
loc_068090:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_068120
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_068120
	move.b ($127,a6),d0
	cmpi.b #$10,d0
	bcc.w loc_06811c
	cmpi.w #$38,(Main_stageid,a5)
	bne.w loc_06811c
	st.b ($1fe,a6)
	move.b #$1e,(pl_move_id,a6)
	bra.w loc_06811c

;----------------------------------------------
loc_0680c8:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_068120
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_068120
	bra.w loc_06811c

;----------------------------------------------
loc_0680e0:
	cmpi.b #1,(PL_ism_choice,a6)
	bne.w loc_068120
	bra.b loc_06811c

;----------------------------------------------
loc_0680ec:
	tst.b (PL_ism_choice,a6)
	bne.w loc_068120
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_068120
	bra.w loc_06811c

;----------------------------------------------
loc_068102:
	tst.b (PL_ism_choice,a6)
	bne.w loc_068120
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_068120
	tst.b ($6a,a6)
	beq.w loc_068120

;==============================================
loc_06811c:
	moveq #1,d0
	rts

;==============================================
loc_068120:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_068124:
	move.b (pl_move_id,a6),d0
	move.w loc_068130(pc,d0.w),d1
	jmp loc_068130(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068130:
	dc.w loc_068150-loc_068130;00 Backflip (long)
	dc.w loc_068294-loc_068130;02 Backflip (short)
	dc.w loc_06835e-loc_068130;04 Roll Crystal Flash
	dc.w loc_068438-loc_068130;06 Wall Dive
	dc.w loc_06862c-loc_068130;08 Izuna Drop
	dc.w loc_068788-loc_068130;0a Head Dive
	dc.w loc_06897c-loc_068130;0c Aism Alpha Counter
	dc.w loc_0689c2-loc_068130;0e Vism Alpha Counter

	dc.w loc_068a50-loc_068130;10 Vism Activate
	dc.w loc_068ad2-loc_068130;12 Flying Barcelona Special
	dc.w loc_068d30-loc_068130;14 Rolling Izuna Drop
	dc.w loc_068f9c-loc_068130;16 Taunt
	dc.w loc_069014-loc_068130;18 Scarlet Terror Forward Flip
	dc.w loc_06910e-loc_068130;1a Scarlet Mirage
	dc.w loc_0692aa-loc_068130;1c Red Impact
	dc.w loc_0693b6-loc_068130;1e Wall Climb

;==============================================
;Backflip (long)
;==============================================
loc_068150:
	move.b (7,a6),d0
	move.w loc_06815c(pc,d0.w),d1
	jmp loc_06815c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06815c:
	dc.w loc_06816a-loc_06815c
	dc.w loc_0681ba-loc_06815c
	dc.w loc_0681d2-loc_06815c
	dc.w loc_06820a-loc_06815c
	dc.w loc_068230-loc_06815c
	dc.w loc_068250-loc_06815c
	dc.w loc_068280-loc_06815c

;----------------------------------------------
loc_06816a:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_020674
	moveq #$d,d0
	jsr loc_0038e4
	move.l loc_0681aa(pc),($40,a6)
	move.l loc_0681aa+4(pc),($44,a6)
	move.l loc_0681aa+8(pc),($48,a6)
	move.l loc_0681aa+$c(pc),($4c,a6)
	moveq #$b,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0681aa:
	dc.l $fffd0000,$000a0000,$00000000,$ffff6000

;----------------------------------------------
loc_0681ba:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_0681d0
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_0681d0:
	rts

;----------------------------------------------
loc_0681d2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0681e2
	addq.b #2,(7,a6)

loc_0681e2:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068208
	move.b #6,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_00369c

loc_068208:
	rts

;----------------------------------------------
loc_06820a:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06822e
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_00369c

loc_06822e:
	rts

;----------------------------------------------
loc_068230:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_06824e
	addq.b #2,(7,a6)
	move.l #$50000,($44,a6)
	clr.b ($35,a6)

loc_06824e:
	rts

;----------------------------------------------
loc_068250:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068272
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_068272:
	tst.b ($35,a6)
	bne.b loc_06827e
	jmp loc_02a7ea

loc_06827e:
	rts

;----------------------------------------------
loc_068280:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Backflip (short)
;==============================================
loc_068294:
	move.b (7,a6),d0
	move.w loc_0682a0(pc,d0.w),d1
	jmp loc_0682a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0682a0:
	dc.w loc_0682a8-loc_0682a0
	dc.w loc_0682f8-loc_0682a0
	dc.w loc_06830e-loc_0682a0
	dc.w loc_06834a-loc_0682a0

;----------------------------------------------
loc_0682a8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	clr.b (pl_attk_active,a6)
	jsr loc_020674
	moveq #$e,d0
	jsr loc_0038e4
	move.l loc_0682e8(pc),($40,a6)
	move.l loc_0682e8+4(pc),($44,a6)
	move.l loc_0682e8+8(pc),($48,a6)
	move.l loc_0682e8+$c(pc),($4c,a6)
	moveq #$c,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0682e8:
	dc.l $fffe4000,$0008c000,$00000000,$ffff6000

;----------------------------------------------
loc_0682f8:
	tst.b ($35,a6)
	bne.b loc_068308
	addq.b #2,(7,a6)
	move.b #1,($31,a6)

loc_068308:
	jmp loc_02a7ea

;----------------------------------------------
loc_06830e:
	tst.b ($35,a6)
	bne.b loc_06831a
	jsr loc_02a7ea

loc_06831a:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068348
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.b #1,($32,a6)
	jmp loc_02a7ea

loc_068348:
	rts

;----------------------------------------------
loc_06834a:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Roll Crystal Flash
;==============================================
loc_06835e:
	move.b (7,a6),d0
	move.w loc_06836a(pc,d0.w),d1
	jmp loc_06836a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06836a:
	dc.w loc_068372-loc_06836a
	dc.w loc_0683a2-loc_06836a
	dc.w loc_0683e0-loc_06836a
	dc.w loc_068424-loc_06836a

;----------------------------------------------
loc_068372:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$e,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.b d1,($3b,a6)
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0683a2:
	tst.b ($35,a6)
	bne.b loc_0683ca
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l loc_0683d0(pc),($40,a6)
	move.l loc_0683d0+4(pc),($44,a6)
	move.l loc_0683d0+8(pc),($48,a6)
	move.l loc_0683d0+$c(pc),($4c,a6)

loc_0683ca:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0683d0:
	dc.l $00050000,$00080000,$00000000,$ffff0000

;----------------------------------------------
loc_0683e0:
	tst.b ($35,a6)
	bne.b loc_0683f4
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_06841e

loc_0683f4:
	move.b #2,(7,a6)
	subq.b #1,($3b,a6)
	bpl.b loc_06840a
	move.b #6,(7,a6)
	clr.b ($ce,a6)


loc_06840a:
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c

loc_06841e:
	jmp loc_02a7ea

;----------------------------------------------
loc_068424:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Wall Dive
;==============================================
loc_068438:
	move.b (7,a6),d0
	move.w loc_068444(pc,d0.w),d1
	jmp loc_068444(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068444:
	dc.w loc_0696ac-loc_068444
	dc.w loc_0696de-loc_068444
	dc.w loc_06977c-loc_068444
	dc.w loc_0697be-loc_068444
	dc.w loc_068456-loc_068444
	dc.w loc_0684c8-loc_068444
	dc.w loc_06857e-loc_068444
	dc.w loc_0685ec-loc_068444

	dc.w loc_0685fc-loc_068444

;----------------------------------------------
loc_068456:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	move.l d0,d1
	add.l d0,d0
	add.l d1,d0
	add.l d0,d0
	asr.l #8,d0
	move.l d0,($40,a6)
	move.l ($14,a4),d0
	sub.l ($14,a6),d0
	move.l d0,d1
	add.l d0,d0
	add.l d1,d0
	add.l d0,d0
	asr.l #8,d0
	move.l d0,($44,a6)
	addi.l #$8c000,($44,a6)
	clr.l ($48,a6)
	move.l #$ffff9000,($4c,a6)
	clr.b (PL_Flip,a6)
	addi.w #$13,($14,a6)
	moveq #-$39,d0
	tst.l ($40,a6)
	bmi.b loc_0684bc
	addq.b #$1,(PL_Flip,a6)
	neg.w d0

loc_0684bc:
	add.w d0,($10,a6)
	moveq #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_0684c8:
	tst.l ($44,a6)
	bpl.b loc_068538
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0684f6
	move.w ($64,a6),d0
	addi.w #$28,d0
	cmp.w ($14,a6),d0
	bcs.b loc_0684e8
	addq.b #2,(7,a6)
	bra.b loc_06850e

loc_0684e8:
	moveq #$2e,d0
	jsr loc_02e714
	bne.b loc_068564
	bra.w loc_068538

loc_0684f6:
	move.b ($378,a6),d1
	andi.b #7,d1
	beq.b loc_068538
	addq.b #2,(7,a6)
	move.b ($83,a6),d0
	andi.b #7,d0
	beq.b loc_068518

loc_06850e:
	moveq #$2e,d0
	jsr loc_02e714
	bne.b loc_068564

loc_068518:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$15,d0
	jsr loc_02a758
	moveq #7,d0
	jsr loc_02ef6c
	jmp loc_020674

loc_068538:
	bsr.w loc_069662
	bsr.w loc_0697d6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	bra.b loc_068596

loc_068564:
	move.l #$02000e00,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_attk_active,a6)
	move.b #8,(pl_move_id,a6)
	rts

;----------------------------------------------
loc_06857e:
	bsr.w loc_069662
	bsr.w loc_0697d6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6

loc_068596:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	clr.b (PL_Flip,a6)
	cmp.w ($10,a6),d0
	bcs.b loc_0685be
	addq.b #1,(PL_Flip,a6)

loc_0685be:
	move.l #$fffd0000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$fffe0000,($4c,a6)
	move.b #1,($31,a6)
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_0685ec:
	tst.b ($35,a6)
	bne.b loc_0685f6
	addq.b #2,(7,a6)

loc_0685f6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0685fc:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.w loc_0699c6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_02bd64

;==============================================
;Izuna Drop
;==============================================
loc_06862c:
	move.b (7,a6),d0
	move.w loc_06863c(pc,d0.w),d1
	jsr loc_06863c(pc,d1.w)
	bra.w loc_069822

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06863c:
	dc.w loc_06864a-loc_06863c
	dc.w loc_0686c8-loc_06863c
	dc.w loc_0686d4-loc_06863c
	dc.w loc_0686e8-loc_06863c
	dc.w loc_068716-loc_06863c
	dc.w loc_068758-loc_06863c
	dc.w loc_06877a-loc_06863c

;----------------------------------------------
loc_06864a:
	move.b #6,(7,a6)
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.b ($11b,a6),d0
	andi.b #3,d0
	bne.b loc_068678
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_068682
	addq.b #1,(PL_Flip,a6)
	bra.b loc_068682

loc_068678:
	btst #1,d0
	beq.b loc_068682
	addq.b #1,(PL_Flip,a6)

loc_068682:
	cmpi.w #$40,($14,a6)
	bcc.b loc_0686c0
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #2,(7,a6)
	move.l #$fffff000,($40,a6)
	move.l #0,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffff8000,($4c,a6)
	move.b #8,($3b,a6)

loc_0686c0:
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_0686c8:
	subq.b #1,($3b,a6)
	beq.b loc_0686d0
	rts

loc_0686d0:
	addq.b #2,(7,a6)

;----------------------------------------------
loc_0686d4:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.b loc_0686e2
	addq.b #2,(7,a6)

loc_0686e2:
	jmp loc_02a7ea

;----------------------------------------------
loc_0686e8:
	jsr loc_02a7ea
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffff8000,($4c,a6)
	tst.b ($35,a6)
	beq.b loc_068714
	addq.b #2,(7,a6)
	addi.w #$48,($14,a6)

loc_068714:
	rts

;----------------------------------------------
loc_068716:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068754
	addq.b #2,(7,a6)
	move.b #$1e,($123,a5)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$5c,d0
	jsr loc_02e970

loc_068754:
	bra.w loc_0697f8

;----------------------------------------------
loc_068758:
	tst.b ($35,a6)
	bne.b loc_068774
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$2e,d0
	jsr loc_02e7f2

loc_068774:
	jmp loc_02a7ea

;----------------------------------------------
loc_06877a:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;==============================================
;Head Dive
;==============================================
loc_068788:
	move.b (7,a6),d0
	move.w loc_068794(pc,d0.w),d1
	jmp loc_068794(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068794:
	dc.w loc_0696ac-loc_068794
	dc.w loc_0696de-loc_068794
	dc.w loc_06977c-loc_068794
	dc.w loc_0697be-loc_068794
	dc.w loc_0687a4-loc_068794
	dc.w loc_068844-loc_068794
	dc.w loc_068888-loc_068794
	dc.w loc_0688c2-loc_068794

;----------------------------------------------
loc_0687a4:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	eori.b #1,(PL_Flip,a6)
	move.w #$ffb0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_0687c0
	neg.w d1

loc_0687c0:
	add.w d1,($10,a6)
	clr.b ($6e,a6)
	clr.b ($5b,a6)
	move.b ($82,a6),d0
	move.w loc_06883e(pc,d0.w),($6c,a6)
	lsl.w #3,d0
	move.l loc_06880e(pc,d0.w),($40,a6)
	move.l loc_06880e+4(pc,d0.w),($44,a6)
	move.l loc_06880e+8(pc,d0.w),($48,a6)
	move.l loc_06880e+$c(pc,d0.w),($4c,a6)
	moveq #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$14,d0
	jsr loc_0038e4
	moveq #$1d,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06880e:
	dc.l $00100000,$fffe0000,$ffffa800,$00001000
	dc.l $00100000,$fffc0000,$ffffa800,$00001c00
	dc.l $00100000,$fffa0000,$ffffa800,$00003200

loc_06883e:
	dc.w $0060,$0040,$0030

;----------------------------------------------
loc_068844:
	move.w ($6c,a6),d0
	cmp.w ($14,a6),d0
	blt.b loc_068856
	clr.l ($44,a6)
	clr.l ($4c,a6)

loc_068856:
	bsr.w loc_06894a
	bsr.w loc_0697f8
	tst.b ($5b,a6)
	bne.w loc_0688f2
	tst.b ($298,a6)
	bne.w loc_0688d0
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.w loc_0688d0
	cmpi.l #$50000,($40,a6)
	blt.w loc_06891e
	rts

;----------------------------------------------
loc_068888:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.w loc_0699c6
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0699c6
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	moveq #$1e,d0
	jsr loc_02a758
	jmp loc_02bd64

;----------------------------------------------
loc_0688c2:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;==============================================
loc_0688d0:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$20,d0
	jmp loc_02a758

;==============================================
loc_0688f2:
	addq.b #2,(7,a6)
	move.l #$ffff0000,($40,a6)
	move.l #$60000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$1f,d0
	jmp loc_02a758

;==============================================
loc_06891e:
	addq.b #2,(7,a6)
	move.l #$30000,($40,a6)
	move.l #0,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$1f,d0
	jmp loc_02a758

;==============================================
loc_06894a:
	tst.b ($6e,a6)
	bne.w loc_0699c6
	tst.b (PL_cpucontrol,a6)
	bne.b loc_068966
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	beq.b loc_06897a

loc_068966:
	addq.b #1,($6e,a6)
	moveq #$1a,d0
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

loc_06897a:
	rts

;==============================================
;Aism Alpha Counter
;==============================================
loc_06897c:
	move.b (7,a6),d0
	move.w loc_068988(pc,d0.w),d1
	jmp loc_068988(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068988:
	dc.w loc_06898c-loc_068988
	dc.w loc_0689b4-loc_068988

;----------------------------------------------
loc_06898c:
	tst.b ($33,a6)
	bpl.b loc_06899e
	addq.b #2,(7,a6)
	moveq #8,d0
	jmp loc_02a758

loc_06899e:
	tst.b ($35,a6)
	beq.b loc_0689ae
	clr.b ($35,a6)
	jsr loc_080e8e

loc_0689ae:
	jmp loc_02a7ea

;----------------------------------------------
loc_0689b4:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	jmp loc_02baf2

;==============================================
;Vism Alpha Counter
;==============================================
loc_0689c2:
	move.b (7,a6),d0
	move.w loc_0689ce(pc,d0.w),d1
	jmp loc_0689ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0689ce:
	dc.w loc_0689d6-loc_0689ce
	dc.w loc_068a1e-loc_0689ce
	dc.w loc_068a2e-loc_0689ce
	dc.w loc_068a42-loc_0689ce

;----------------------------------------------
loc_0689d6:
	tst.b ($33,a6)
	bpl.b loc_068a08
	addq.b #2,(7,a6)
	move.l #$e0000,($40,a6)
	move.l #0,($44,a6)
	move.l #$ffff0000,($48,a6)
	move.l #0,($4c,a6)
	moveq #$a,d0
	jmp loc_02a758

loc_068a08:
	tst.b ($35,a6)
	beq.b loc_068a18
	clr.b ($35,a6)
	jsr loc_080e8e

loc_068a18:
	jmp loc_02a7ea

;----------------------------------------------
loc_068a1e:
	tst.b ($35,a6)
	beq.b loc_068a28
	addq.b #2,(7,a6)

loc_068a28:
	jmp loc_02f5ac

;----------------------------------------------
loc_068a2e:
	bsr.w loc_0697f8
	tst.l ($40,a6)
	bpl.b loc_068a3c
	addq.b #2,(7,a6)

loc_068a3c:
	jmp loc_02f5ac

;----------------------------------------------
loc_068a42:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
loc_068a50:
	move.b (7,a6),d0
	move.w loc_068a5c(pc,d0.w),d1
	jmp loc_068a5c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068a5c:
	dc.w loc_068a62-loc_068a5c
	dc.w loc_068a82-loc_068a5c
	dc.w loc_068ab6-loc_068a5c

;----------------------------------------------
loc_068a62:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_068a7c
	moveq #$2f,d0

loc_068a7c:
	jmp loc_02a708

;----------------------------------------------
loc_068a82:
	tst.b ($34,a6)
	beq.b loc_068ab0
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$13,d0
	moveq #$33,d1
	tst.b ($31,a6)
	beq.b loc_068aa6
	moveq #-3,d0
	moveq #$41,d1

loc_068aa6:
	jsr loc_097cd6
	bsr.w loc_069a60

loc_068ab0:
	jmp loc_02a7ea

;----------------------------------------------
loc_068ab6:
	subq.b #1,($3a,a6)
	bne.w loc_0699c6
	tst.b ($31,a6)
	beq.b loc_068acc
	move.l #$02000602,(4,a6)

loc_068acc:
	jmp loc_02f796

;==============================================
;Flying Barcelona Special
;==============================================
loc_068ad2:
	move.b ($7,a6),d0
	move.w loc_068ade(pc,d0.w),d1
	jmp loc_068ade(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068ade:
	dc.w loc_0696ac-loc_068ade
	dc.w loc_0696de-loc_068ade
	dc.w loc_068af4-loc_068ade
	dc.w loc_068b54-loc_068ade
	dc.w loc_068b84-loc_068ade
	dc.w loc_0697be-loc_068ade
	dc.w loc_068b9e-loc_068ade
	dc.w loc_068c0a-loc_068ade

	dc.w loc_068c86-loc_068ade
	dc.w loc_068cf0-loc_068ade
	dc.w loc_068d00-loc_068ade

;----------------------------------------------
loc_068af4:
	bsr.w loc_0697d6
	tst.l ($44,a6)
	bpl.b loc_068b1e
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.b loc_068b1e
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	bra.w loc_0699c0

loc_068b1e:
	cmpi.w #$40,($14,a6)
	bcs.w loc_0699c6
	tst.b ($ac,a6)
	beq.w loc_0699c6
	addq.b #2,(7,a6)
	move.b #1,($26f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$21,d0
	jmp loc_02a758

;----------------------------------------------
loc_068b54:
	tst.b ($35,a6)
	beq.b loc_068b7e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_068b68
	moveq #1,d0

loc_068b68:
	move.b d0,($ab,a6)
	moveq #$23,d0
	moveq #$60,d1
	tst.b (PL_ism_choice,a6)
	bpl.b loc_068b78
	moveq #$20,d0

loc_068b78:
	jsr loc_082e36

loc_068b7e:
	jmp loc_02a7ea

;----------------------------------------------
loc_068b84:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_068b9c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	clr.b ($26f,a6)

loc_068b9c:
	rts

;----------------------------------------------
loc_068b9e:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	move.l d0,d1
	add.l d0,d0
	add.l d1,d0
	add.l d0,d0
	asr.l #8,d0
	move.l d0,($40,a6)
	move.l ($14,a4),d0
	sub.l ($14,a6),d0
	move.l d0,d1
	add.l d0,d0
	add.l d1,d0
	add.l d0,d0
	asr.l #8,d0
	move.l d0,($44,a6)
	addi.l #$8c000,($44,a6)
	clr.l ($48,a6)
	move.l #$ffff9000,($4c,a6)
	clr.b (PL_Flip,a6)
	addi.w #$13,($14,a6)
	moveq #-$39,d0
	tst.l ($40,a6)
	bmi.b loc_068bfe
	addq.b #1,(PL_Flip,a6)
	neg.w d0

loc_068bfe:
	add.w d0,($10,a6)
	moveq #$12,d0
	jmp loc_02a758

;----------------------------------------------
loc_068c0a:
	move.b ($378,a6),d1
	andi.b #7,d1
	beq.b loc_068c3a
	addq.b #2,(7,a6)
	tst.b ($83,a6)
	beq.b loc_068c28
	moveq #$3f,d0
	jsr loc_02e714
	bne.b loc_068c66

loc_068c28:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$25,d0
	jmp loc_02a758

loc_068c3a:
	bsr.w loc_069662
	bsr.w loc_0697d6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	bra.b loc_068c9e

loc_068c66:
	move.l #$02001000,(4,a6)
	move.b #$16,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b (pl_attk_active,a6)
	move.b #$14,(pl_move_id,a6)
	rts

;----------------------------------------------
loc_068c86:
	bsr.w loc_069662
	bsr.w loc_0697d6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6

loc_068c9e:
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	clr.b (PL_Flip,a6)
	cmp.w ($10,a6),d0
	bcs.b loc_068cc2
	addq.b #1,(PL_Flip,a6)

loc_068cc2:
	move.l #$fffd0000,($40,a6)
	move.l #$80000,($44,a6)
	move.l #0,($48,a6)
	move.l #$fffe0000,($4c,a6)
	move.b #1,($31,a6)
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_068cf0:
	tst.b ($35,a6)
	bne.b loc_068cfa
	addq.b #2,(7,a6)

loc_068cfa:
	jmp loc_02a7ea

;----------------------------------------------
loc_068d00:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.w loc_0699c6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jmp loc_02bd64

;==============================================
;Rolling Izuna Drop
;==============================================
loc_068d30:
	move.b (7,a6),d0
	move.w loc_068d40(pc,d0.w),d1
	jsr loc_068d40(pc,d1.w)
	bra.w loc_069822

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068d40:
	dc.w loc_068dd0-loc_068d40
	dc.w loc_068e2a-loc_068d40
	dc.w loc_068e2e-loc_068d40
	dc.w loc_068e50-loc_068d40
	dc.w loc_068e62-loc_068d40
	dc.w loc_068eaa-loc_068d40
	dc.w loc_068e2e-loc_068d40
	dc.w loc_068f02-loc_068d40

	dc.w loc_068f1c-loc_068d40
	dc.w loc_068f6c-loc_068d40
	dc.w loc_068f8e-loc_068d40
	dc.w loc_068d5a-loc_068d40
	dc.w loc_068dbe-loc_068d40

;----------------------------------------------
loc_068d5a:
	addq.b #2,(7,a6)
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.b ($11b,a6),d0
	andi.b #3,d0
	bne.b loc_068d86
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_068d90
	addq.b #1,(PL_Flip,a6)
	bra.b loc_068d90

loc_068d86:
	btst #1,d0
	beq.b loc_068d90
	addq.b #1,(PL_Flip,a6)

loc_068d90:
	jsr loc_080668
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_068da0
	moveq #1,d0

loc_068da0:
	move.b d0,($ab,a6)
	moveq #-$24,d0
	moveq #$72,d1
	tst.b (PL_ism_choice,a6)
	bpl.b loc_068db0
	moveq #$21,d0

loc_068db0:
	jsr loc_082e36
	moveq #$22,d0
	jmp loc_02a758

;----------------------------------------------
loc_068dbe:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	clr.b (7,a6)
	clr.b ($ab,a6)
	rts

;----------------------------------------------
loc_068dd0:
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,($1ff,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$800,($48,a6)
	move.b #6,(7,a6)
	cmpi.w #$40,($14,a6)
	bcc.b loc_068e22
	move.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.l #$49800,($44,a6)
	move.l #$ffff7e00,($4c,a6)
	move.b #8,($3b,a6)

loc_068e22:
	moveq #$23,d0
	jmp loc_02a758

;----------------------------------------------
loc_068e2a:
	addq.b #2,(7,a6)

loc_068e2e:
	jsr loc_02a7ea
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.b loc_068e4e
	tst.b ($35,a6)
	beq.b loc_068e4e
	addq.b #2,(7,a6)
	addi.w #$48,($14,a6)

loc_068e4e:
	rts

;----------------------------------------------
loc_068e50:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_068e60
	addq.b #2,(7,a6)

loc_068e60:
	rts

;----------------------------------------------
loc_068e62:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068ea4
	addq.b #2,(7,a6)
	move.b #$1e,($123,a5)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_068ea6(pc,d0.w),d0
	jmp loc_02e970

loc_068ea4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068ea6:
	dc.b $3a,$3c,$3e,00

;----------------------------------------------
loc_068eaa:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	addq.b #2,(7,a6)
	move.l #$fffe0000,($40,a6)
	move.l #$800,($48,a6)
	move.l #$ffff7e00,($4c,a6)
	subq.b #1,($1ff,a6)
	bmi.b loc_068eea
	move.b #4,(7,a6)
	move.l #$49800,($44,a6)
	moveq #$23,d0
	jmp loc_02a758

loc_068eea:
	move.l #$93000,($44,a6)
	move.l #$ffffbf00,($4c,a6)
	moveq #$24,d0
	jmp loc_02a758

;----------------------------------------------
loc_068f02:
	bsr.w loc_0697f8
	tst.b ($35,a6)
	beq.w loc_0699c6
	addq.b #2,(7,a6)
	move.l #$fffefc00,($4c,a6)
	rts

;==============================================
loc_068f1c:
	bsr.w loc_0697f8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_068f66
	addq.b #2,(7,a6)
	move.b #$3c,($123,a5)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_068f68(pc,d0.w),d0
	jmp loc_02e970

loc_068f66:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068f68:
	dc.b $39,$3b,$3d,00

;===================================================================
loc_068f6c:
	tst.b ($35,a6)
	bne.b loc_068f88
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$3f,d0
	jsr loc_02e7f2

loc_068f88:
	jmp loc_02a7ea

;===========================================================================---
loc_068f8e:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;==============================================
;Taunt
;==============================================
loc_068f9c:
	move.b (7,a6),d0
	move.w loc_068fa8(pc,d0.w),d1
	jmp loc_068fa8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_068fa8:
	dc.w loc_068fac-loc_068fa8
	dc.w loc_069006-loc_068fa8

;----------------------------------------------
loc_068fac:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_068fc0
	subq.b #1,(pl_taunt_count,a6)

loc_068fc0:
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	moveq #$29,d0
	tst.b ($6b,a6)
	bne.b loc_069000
	jsr loc_01c2c8
	beq.b loc_069000
	move.w #$101,(a4)
	move.b #$20,(2,a4)
	move.b ($102,a6),(3,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($36,a6)
	moveq #$2a,d0

loc_069000:
	jmp loc_02a758

;----------------------------------------------
loc_069006:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	jmp loc_02a7ea

;==============================================
;Forward Flip
;==============================================
loc_069014:
	move.b (7,a6),d0
	move.w loc_069020(pc,d0.w),d1
	jmp loc_069020(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069020:
	dc.w loc_069028-loc_069020
	dc.w loc_069046-loc_069020
	dc.w loc_0690b2-loc_069020
	dc.w loc_0690fa-loc_069020

;----------------------------------------------
loc_069028:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b (pl_crouching,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2b,d0
	jmp loc_02a758

;----------------------------------------------
loc_069046:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_06907c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_069082(pc,d0.w),($40,a6)
	move.l loc_069082+4(pc,d0.w),($48,a6)
	move.l loc_069082+8(pc,d0.w),($44,a6)
	move.l loc_069082+$c(pc,d0.w),($4c,a6)

loc_06907c:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069082:
	dc.l $00020000,$fffff800,$00060000,$ffffa000
	dc.l $00030000,$fffff400,$00070000,$ffff9000
	dc.l $00040000,$ffffec00,$00080000,$ffff8000

;----------------------------------------------
loc_0690b2:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.b loc_0690f4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0690f4
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2e,d0
	jmp loc_02a758

loc_0690f4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0690fa:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Scarlet Mirage
;==============================================
loc_06910e:
	move.b (7,a6),d0
	move.w loc_06911a(pc,d0.w),d1
	jmp loc_06911a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06911a:
	dc.w loc_069126-loc_06911a
	dc.w loc_069154-loc_06911a
	dc.w loc_069182-loc_06911a
	dc.w loc_0691f0-loc_06911a
	dc.w loc_069254-loc_06911a
	dc.w loc_06929c-loc_06911a

;----------------------------------------------
loc_069126:
	addq.b #2,(7,a6)
	move.b #8,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$31,d0
	jmp loc_02a758

;----------------------------------------------
loc_069154:
	move.b #8,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_06917c
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06916e
	moveq #1,d0

loc_06916e:
	move.b d0,($ab,a6)
	moveq #9,d0
	moveq #$39,d1
	jsr loc_082e36

loc_06917c:
	jmp loc_02a7ea

;----------------------------------------------
loc_069182:
	tst.b ($35,a6)
	bne.b loc_0691ce
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	beq.b loc_0691a2
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0691a2:
	move.b loc_0691d4(pc,d0.w),(pl_invinciblity_timer,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0691d8(pc,d0.w),($40,a6)
	move.l loc_0691d8+4(pc,d0.w),($48,a6)
	move.l loc_0691d8+8(pc,d0.w),($44,a6)
	move.l loc_0691d8+$c(pc,d0.w),($4c,a6)

loc_0691ce:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0691d4:
	dc.b $04,$0d,$1b,00

loc_0691d8:
	dc.l $00020000,$fffff800,$00030000,$fffff400
	dc.l $00040000,$ffffec00

;----------------------------------------------
loc_0691f0:
	bsr.w loc_069808
	tst.b ($35,a6)
	beq.b loc_06921e
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_069224(pc,d0.w),($40,a6)
	move.l loc_069224+4(pc,d0.w),($48,a6)
	move.l loc_069224+8(pc,d0.w),($44,a6)
	move.l loc_069224+$c(pc,d0.w),($4c,a6)

loc_06921e:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069224:
	dc.l $00020000,$fffff800,$00060000,$ffffa000
	dc.l $00030000,$fffff400,$00070000,$ffff9000
	dc.l $00040000,$ffffec00,$00080000,$ffff8000

;----------------------------------------------
loc_069254:
	bsr.w loc_0697f8
	tst.l ($44,a6)
	bpl.b loc_069296
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_069296
	addq.b #2,(7,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($ce,a6)
	jsr loc_00369c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$34,d0
	jmp loc_02a758

loc_069296:
	jmp loc_02a7ea

;----------------------------------------------
loc_06929c:
	tst.b ($33,a6)
	bmi.w loc_0699c0
	jmp loc_02a7ea

;==============================================
;Red Impact
;==============================================
loc_0692aa:
	move.b (7,a6),d0
	move.w loc_0692b6(pc,d0.w),d1
	jmp loc_0692b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0692b6:
	dc.w loc_0692c2-loc_0692b6
	dc.w loc_0692e6-loc_0692b6
	dc.w loc_069314-loc_0692b6
	dc.w loc_06933a-loc_0692b6
	dc.w loc_06936a-loc_0692b6
	dc.w loc_06938c-loc_0692b6

;----------------------------------------------
loc_0692c2:
	addq.b #2,(7,a6)
	move.b #8,($23f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$37,d0
	jmp loc_02a758

;----------------------------------------------
loc_0692e6:
	move.b #8,($23f,a6)
	tst.b ($35,a6)
	beq.b loc_06930e
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_069300
	moveq #1,d0

loc_069300:
	move.b d0,($ab,a6)
	moveq #$c,d0
	moveq #$41,d1
	jsr loc_082e36

loc_06930e:
	jmp loc_02a7ea

;----------------------------------------------
loc_069314:
	tst.b ($35,a6)
	bne.b loc_069334
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #0,d0
	tst.b ($3f,a6)
	bne.b loc_06932c
	addq.b #5,d0

loc_06932c:
	move.b d0,(pl_invinciblity_timer,a6)
	clr.b ($5b,a6)

loc_069334:
	jmp loc_02a7ea

;----------------------------------------------
loc_06933a:
	tst.b ($33,a6)
	bmi.w loc_0699ba
	cmpi.b #1,($5b,a6)
	bne.w loc_0699c6
	moveq #$61,d0
	jsr loc_02e5d4
	beq.w loc_0699c6
	addq.b #2,(7,a6)
	jsr loc_0035f2
	moveq #$38,d0
	jmp loc_02a758

;----------------------------------------------
loc_06936a:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_069386
	clr.b ($35,a6)
	addq.b #2,(7,a6)
	moveq #$61,d0
	jmp loc_02e7f2

loc_069386:
	jmp loc_02f9be

;----------------------------------------------
loc_06938c:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_0699c0
	tst.b ($35,a6)
	beq.b loc_0693b4
	clr.b ($35,a6)
	moveq #$14,d0
	tst.b (PL_Flip,a6)
	beq.w loc_0693b0
	neg.w d0

loc_0693b0:
	add.w d0,($10,a6)

loc_0693b4:
	rts

;==============================================
;Wall Climb
;==============================================
loc_0693b6:
	move.b (7,a6),d0
	move.w loc_0693c2(pc,d0.w),d1
	jmp loc_0693c2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0693c2:
	dc.w loc_0693d2-loc_0693c2
	dc.w loc_0693e8-loc_0693c2
	dc.w loc_06942c-loc_0693c2
	dc.w loc_069454-loc_0693c2
	dc.w loc_069528-loc_0693c2
	dc.w loc_06954e-loc_0693c2
	dc.w loc_0695b2-loc_0693c2
	dc.w loc_0695c6-loc_0693c2

;----------------------------------------------
loc_0693d2:
	addq.b #2,(7,a6)
	clr.b (pl_attk_active,a6)
	move.b #1,($ce,a6)
	moveq #$39,d0
	jmp loc_02a758

;----------------------------------------------
loc_0693e8:
	tst.b ($35,a6)
	beq.b loc_069426
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$80000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	move.l #$38000,d0
	move.l #$fffff800,d1
	tst.b (PL_Flip,a6)
	bne.b loc_06941e
	neg.l d0
	neg.l d1

loc_06941e:
	move.l d0,($40,a6)
	move.l d1,($48,a6)

loc_069426:
	jmp loc_02a7ea

;----------------------------------------------
loc_06942c:
	tst.b ($33,a6)
	bpl.b loc_06944a
	addq.b #2,(7,a6)
	move.w #7,($26,a6)
	move.b #$3c,($3a,a6)
	moveq #$d,d0
	jmp loc_02a758

loc_06944a:
	bsr.w loc_0697d6
	jmp loc_02a7ea

;----------------------------------------------
loc_069454:
	bsr.w loc_06962c
	bne.w loc_06963a
	subq.b #1,($3a,a6)
	bne.b loc_0694d6
	addq.b #2,(7,a6)
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_0694d8(pc,d0.w),d0
	lsl.w #2,d0
	movea.w ($38,a6),a4
	move.w ($10,a4),d1
	move.w ($64,a4),d2
	add.w loc_0694f8(pc,d0.w),d1
	add.w loc_0694f8+2(pc,d0.w),d2
	sub.w ($10,a6),d1
	sub.w ($14,a6),d2
	move.w d1,d4
	bpl.b loc_069498
	neg.w d4

loc_069498:
	move.w #$80,d0
	moveq #1,d3
	cmpi.w #$80,d4
	bcc.b loc_0694b6
	move.w #$40,d0
	moveq #2,d3
	cmpi.w #$40,d4
	bcc.b loc_0694b6
	move.w #$20,d0
	moveq #3,d3

loc_0694b6:
	ext.l d1
	ext.l d2
	asl.w d3,d1
	asl.w d3,d2
	move.b d0,($3a,a6)
	asl.l #8,d1
	asl.l #8,d2
	move.l d1,($40,a6)
	move.l d2,($44,a6)
	clr.l ($48,a6)
	clr.l ($4c,a6)

loc_0694d6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0694d8:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07
	dc.b $08,$09,$0a,$0b,$00,$01,$02,$03
	dc.b $04,$05,$06,$07,$08,$09,$0a,$0b
	dc.b $00,$01,$02,$03,$04,$05,$06,$07

loc_0694f8:
	dc.w $ffb0,$0070,$ffb0,$0058
	dc.w $ffb0,$0040,$ffb0,$0028
	dc.w $0050,$0070,$0050,$0058
	dc.w $0050,$0040,$0050,$0028
	dc.w $0000,$0070,$0000,$0058
	dc.w $0000,$0040,$0000,$0028

;----------------------------------------------
loc_069528:
	bsr.w loc_06962c
	bne.w loc_06963a
	subq.b #1,($3a,a6)
	bne.b loc_069542
	addq.b #2,(7,a6)
	move.b #$14,($3a,a6)
	rts

loc_069542:
	jsr loc_0697d6(pc)
	nop
	jmp loc_02a7ea

;----------------------------------------------
loc_06954e:
	bsr.w loc_06962c
	bne.w loc_06963a
	subi.b #1,($3a,a6)
	beq.b loc_069560
	rts

loc_069560:
	tst.b ($1fe,a6)
	beq.w loc_0695e0
	addq.b #2,(7,a6)
	move.b #1,($26f,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_06958e
	moveq #1,d0

loc_06958e:
	move.b d0,($ab,a6)
	move.b #$32,($3a,a6)
	moveq #-$19,d0
	moveq #$65,d1
	tst.b (PL_ism_choice,a6)
	bpl.b loc_0695a4
	moveq #$20,d0

loc_0695a4:
	jsr loc_082e36
	moveq #$21,d0
	jmp loc_02a758

;----------------------------------------------
loc_0695b2:
	subq.b #1,($3a,a6)
	bne.b loc_0695c4
	clr.b ($ab,a6)
	clr.b ($26f,a6)
	bra.w loc_06960c

loc_0695c4:
	rts

;----------------------------------------------
loc_0695c6:
	bsr.w loc_0697d6
	move.w ($64,a6),d0
	subi.w #$20,d0
	cmp.w ($14,a6),d0
	blt.w loc_0699c6
	jmp loc_02baf2

;==============================================
loc_0695e0:
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #$f,d0
	jsr loc_0038e4
	move.b #6,(pl_move_id,a6)
	move.b #8,(7,a6)
	clr.w ($26,a6)
	moveq #3,d0
	jsr loc_02ef6c
	jmp loc_020674

;==============================================
loc_06960c:
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #$f,d0
	jsr loc_0038e4
	move.b #$12,(pl_move_id,a6)
	move.b #$c,(7,a6)
	clr.w ($26,a6)
	rts

;==============================================
loc_06962c:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	rts

;==============================================
loc_06963a:
	move.b #$e,(7,a6)
	moveq #0,d0
	move.w d0,($26,a6)
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l #$ffff5000,($4c,a6)
	moveq #$21,d0
	jmp loc_02a708

;==============================================
loc_069662:
	move.l #$40000,d0
	tst.b (PL_cpucontrol,a6)
	beq.b loc_06967e
	movea.w ($38,a6),a4
	move.w ($10,a4),d1
	cmp.w ($10,a6),d1
	bcs.b loc_069690
	bra.b loc_069692

loc_06967e:
	move.b ($11b,a6),d1
	andi.b #3,d1
	beq.b loc_069696
	btst #1,($11b,a6)
	beq.b loc_069692

loc_069690:
	neg.l d0

loc_069692:
	add.l d0,($10,a6)

loc_069696:
	rts

;==============================================
;Wall Grab Test
loc_069698:
	move.b (7,a6),d0
	move.w loc_0696a4(pc,d0.w),d1
	jmp loc_0696a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0696a4:
	dc.w loc_0696ac-loc_0696a4
	dc.w loc_0696de-loc_0696a4
	dc.w loc_06977c-loc_0696a4
	dc.w loc_0697be-loc_0696a4

;----------------------------------------------
loc_0696ac:
	addq.b #2,(7,a6)
	moveq #$f,d0
	cmpi.b #6,(pl_move_id,a6)
	beq.b loc_0696c6
	moveq #$10,d0
	cmpi.b #$a,(pl_move_id,a6)
	beq.b loc_0696c6
	moveq #$f,d0

loc_0696c6:
	jsr loc_0038e4
	moveq #$11,d0
	cmpi.b #6,(pl_move_id,a6)
	bne.b loc_0696d8
	moveq #$13,d0

loc_0696d8:
	jmp loc_02a758

;----------------------------------------------
loc_0696de:
	tst.b ($35,a6)
	bne.w loc_06974e
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	clr.l ($48,a6)
	move.l #$4e666,($44,a6)
	move.l #$ffffd000,($4c,a6)
	jsr loc_01bd5c
	tst.b (PL_cpucontrol,a6)
	bne.b loc_069726
	move.b ($11b,a6),d0
	andi.b #3,d0
	beq.b loc_069726
	move.w ($10,a3),d1
	btst #1,d0
	bne.b loc_069734
	bra.b loc_06973a

loc_069726:
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_06973a

loc_069734:
	bsr.w loc_069760
	bra.b loc_06973e

loc_06973a:
	bsr.w loc_069754

loc_06973e:
	clr.b (PL_Flip,a6)
	tst.l ($40,a6)
	bmi.b loc_06974e
	move.b #1,(PL_Flip,a6)

loc_06974e:
	jmp loc_02a7ea

;==============================================
loc_069754:
	move.l ($10,a3),d3
	addi.l #$1800000,d3
	bra.b loc_069764

;==============================================
loc_069760:
	move.l ($10,a3),d3

loc_069764:
	move.l ($10,a6),d2
	sub.l d2,d3
	move.l d3,d1
	asl.l #4,d3
	add.l d1,d1
	add.l d1,d1
	sub.l d1,d3
	asr.l #8,d3
	move.l d3,($40,a6)
	rts

;----------------------------------------------
loc_06977c:
	bsr.w loc_0697d6
	tst.l ($44,a6)
	bpl.b loc_0697a0
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0697a0
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	bra.w loc_0699c0

loc_0697a0:
	cmpi.w #$40,($14,a6)
	bcs.w loc_0699c6
	tst.b ($ac,a6)
	beq.w loc_0699c6
	addq.b #2,(7,a6)
	moveq #$14,d0
	jmp loc_02a758

;----------------------------------------------
loc_0697be:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_0697d4
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)

loc_0697d4:
	rts

;==============================================
loc_0697d6:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_0697f8:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)

loc_069808:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_069814
	neg.l d0

loc_069814:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_069822:
	tst.b ($34,a6)
	beq.b loc_06982e
	jmp loc_02fa36

loc_06982e:
	jmp loc_02f9be

;==============================================
loc_069834:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_069854
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_069868
	bra.b loc_06986c

loc_069854:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_06986c
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_06986c

loc_069868:
	addq.b #1,(PL_Flip,a6)

loc_06986c:
	rts

;##############################################
;Throws
;##############################################
loc_06986e:
	cmpi.b #4,($80,a6)
	beq.w loc_06992c
	move.b (7,a6),d0
	move.w loc_069886(pc,d0.w),d1
	jsr loc_069886(pc,d1.w)
	bra.b loc_069822

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_069886:
	dc.w loc_069890-loc_069886
	dc.w loc_0698aa-loc_069886
	dc.w loc_0698da-loc_069886
	dc.w loc_0698e8-loc_069886
	dc.w loc_06990c-loc_069886

;----------------------------------------------
loc_069890:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_0698aa:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	moveq #$2d,d0
	jsr loc_02e3fe
	beq.b loc_0698ce
	move.b #6,(7,a6)
	bsr.w loc_069834
	moveq #4,d0
	jmp loc_02a758

loc_0698ce:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0698da:
	tst.b ($33,a6)
	bpl.w loc_0699c6
	jmp loc_02baf2

;----------------------------------------------
loc_0698e8:
	tst.b ($35,a6)
	beq.b loc_069906
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #$5f,d0
	jsr loc_080b70
	moveq #$2d,d0
	jsr loc_02e7f2

loc_069906:
	jmp loc_02a7ea

;----------------------------------------------
loc_06990c:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_0699ba
	tst.b ($35,a6)
	beq.b loc_06992a
	clr.b ($35,a6)
	eori.b #1,(PL_Flip,a6)

loc_06992a:
	rts

;==============================================
;Air Throw
;==============================================
loc_06992c:
	move.b (7,a6),d0
	move.w loc_06993c(pc,d0.w),d1
	jsr loc_06993c(pc,d1.w)
	bra.w loc_069822

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_06993c:
	dc.w loc_069944-loc_06993c
	dc.w loc_069980-loc_06993c
	dc.w loc_069990-loc_06993c
	dc.w loc_0699b0-loc_06993c

;----------------------------------------------
loc_069944:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #$2f,d0
	tst.b ($81,a6)
	beq.b loc_06995a
	moveq #$40,d0

loc_06995a:
	jsr loc_02e636
	beq.b loc_069978
	move.b #4,(7,a6)
	moveq #6,d0
	tst.b ($81,a6)
	beq.b loc_069972
	moveq #5,d0

loc_069972:
	jmp loc_02a758

loc_069978:
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_069980:
	jsr loc_02aa08
	bcc.w loc_0699c6
	jmp loc_02baf2

;----------------------------------------------
loc_069990:
	tst.b ($35,a6)
	beq.b loc_0699aa
	addq.b #2,(7,a6)
	moveq #$2f,d0
	tst.b ($81,a6)
	beq.b loc_0699a4
	moveq #$40,d0

loc_0699a4:
	jsr loc_02e7f2

loc_0699aa:
	jmp loc_02a7ea

;----------------------------------------------
loc_0699b0:
	jsr loc_02aa08
	bcc.w loc_0699c6

;==============================================
loc_0699ba:
	jmp loc_02baf2

;==============================================
loc_0699c0:
	jmp loc_02bb26

;==============================================
loc_0699c6:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_0699cc:
	move.b #1,($6a,a6)
	move.b #1,($6b,a6)
	jsr loc_01c368
	beq.b loc_069a20
	addq.b #1,(a4)
	move.b #$13,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($28,a6)
	jsr loc_01c368
	beq.b loc_069a20
	addq.b #1,(a4)
	move.b #$14,(2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($2a,a6)

loc_069a20:
	tst.w (Dramatic_Mode_Type,a5)
	bne.b loc_069a5e
	tst.w ($102,a5)
	bne.b loc_069a5e
	tst.b ($159,a6)
	beq.b loc_069a5e
	jsr loc_01c2c8
	beq.b loc_069a5e
	move.w #$101,(a4)
	move.b #2,(2,a4)
	move.b ($102,a6),(3,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w a4,($36,a6)

loc_069a5e:
	rts

;==============================================
loc_069a60:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;##############################################
;
;##############################################
loc_069a7e:
	dc.w loc_069ac2-loc_069a7e
	dc.w loc_069ac2-loc_069a7e
	dc.w loc_069a84-loc_069a7e

loc_069a84:
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02
	dc.b $09,$0b,$02,$02,$02,$02,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02

loc_069ac2:
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02
	dc.b $08,$0a,$02,$02,$02,$02,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02
