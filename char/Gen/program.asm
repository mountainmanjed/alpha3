;##############################################
;
;##############################################
loc_056a2c:
	jsr loc_01c368
	beq.b loc_056a4a
	addq.b #1,(a4)
	move.b #$11,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.b ($102,a6),(3,a4)

loc_056a4a:
	clr.w ($36,a6)
	rts

;##############################################
;
;##############################################
loc_056a50:
	move.b (7,a6),d0
	move.w loc_056a5c(pc,d0.w),d1
	jmp loc_056a5c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056a5c:
	dc.w loc_056a72-loc_056a5c
	dc.w loc_056a94-loc_056a5c
	dc.w loc_056aac-loc_056a5c
	dc.w loc_056ada-loc_056a5c
	dc.w loc_056b16-loc_056a5c
	dc.w loc_056b38-loc_056a5c
	dc.w loc_056bc0-loc_056a5c
	dc.w loc_056bf2-loc_056a5c

	dc.w loc_056c20-loc_056a5c
	dc.w loc_056c54-loc_056a5c
	dc.w loc_056c72-loc_056a5c

;----------------------------------------------
loc_056a72:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	cmpi.b #2,($102,a4)
	bne.b loc_056a94
	move.b ($125,a4),d0
	move.b (PL_cpucontrol,a6),d1
	eor.b d1,d0
	beq.b loc_056a94
	addq.b #2,(7,a6)
	bra.b loc_056aac

;----------------------------------------------
loc_056a94:
	tst.b ($33,a6)
	bpl.w loc_05955c
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_056aac:
	addq.b #2,(7,a6)
	move.l ($10,a6),($4c,a6)
	jsr loc_01bd5c
	moveq #$30,d0
	move.b ($101,a6),(PL_Flip,a6)
	bne.b loc_056aca
	move.w #$150,d0

loc_056aca:
	add.w ($10,a3),d0
	move.w d0,($10,a6)
	moveq #$29,d0
	jmp loc_02a708

;----------------------------------------------
loc_056ada:
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$60,d0
	cmpi.w #$c0,d0
	bhi.w loc_05955c
	addq.b #2,(7,a6)
	move.b #$13,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	move.w #$1c,($3a,a6)
	moveq #$15,d0
	jmp loc_02a708

;----------------------------------------------
loc_056b16:
	subq.w #1,($3a,a6)
	bpl.b loc_056b32
	addq.b #2,(7,a6)
	move.w #$100,($3a,a6)
	move.w ($10,a6),($44,a6)
	move.w ($14,a6),($46,a6)

loc_056b32:
	jmp loc_02a7ea

;----------------------------------------------
loc_056b38:
	move.w ($3a,a6),d0
	subq.w #4,d0
	move.w d0,($3a,a6)
	andi.w #$1f,d0
	move.w loc_056ba0+2(pc,d0.w),d1
	move.w loc_056ba0(pc,d0.w),d0
	add.w ($44,a6),d0
	add.w ($46,a6),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	tst.w ($3a,a6)
	bne.w loc_05955c
	addq.b #2,(7,a6)
	move.w ($44,a6),($10,a6)
	move.w ($46,a6),($14,a6)
	move.b #$11,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	clr.b ($a,a6)
	lea.l ($a,a6),a0
	move.l a0,d4
	jsr loc_083e72
	moveq #$31,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056ba0:
	dc.w $0000,$0000
	dc.w $0002,$0002
	dc.w $0000,$0000
	dc.w $fffe,$fffe
	dc.w $0000,$0000
	dc.w $0002,$fffe
	dc.w $0000,$0000
	dc.w $fffe,$0002

;----------------------------------------------
loc_056bc0:
	tst.b ($33,a6)
	bpl.w loc_05955c
	addq.b #2,(7,a6)
	move.l #$200000,($40,a6)
	move.l #$fffdc000,($48,a6)
	moveq #$54,d0
	jsr loc_080b70
	move.w #$9280,(sub_palram,a5)
	moveq #$4d,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_056bf2:
	bsr.w loc_059562
	move.w ($4c,a6),d0
	sub.w ($10,a6),d0
	tst.b (PL_Flip,a6)
	seq.b d1
	ext.w d1
	eor.w d0,d1
	bpl.b loc_056c1e
	addq.b #2,(7,a6)
	move.l ($4c,a6),($10,a6)
	move.b #$28,($3a,a6)
	clr.b ($3b,a6)

loc_056c1e:
	rts

;----------------------------------------------
loc_056c20:
	tst.b ($35,a6)
	bmi.b loc_056c2c
	jsr loc_02a7ea

loc_056c2c:
	addq.b #1,($3b,a6)
	andi.b #7,($3b,a6)
	bne.b loc_056c48
	move.w #$dd,d0
	jsr loc_080b70
	move.w #$9280,(sub_palram,a5)

loc_056c48:
	subq.b #1,($3a,a6)
	bpl.b loc_056c52
	addq.b #2,(7,a6)

loc_056c52:
	rts

;----------------------------------------------
loc_056c54:
	tst.b ($33,a6)
	bpl.w loc_05955c
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	st.b ($a,a6)
	moveq #$a,d0
	jmp loc_02a708

;----------------------------------------------
loc_056c72:
	tst.b ($33,a6)
	beq.w loc_05955c
	move.l #$02000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_056c8a:
	move.b (6,a6),d0
	move.w loc_056c96(pc,d0.w),d1
	jmp loc_056c96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056c96:
	dc.w loc_056c9e-loc_056c96
	dc.w loc_056cb0-loc_056c96
	dc.w loc_056cc6-loc_056c96
	dc.w loc_056d02-loc_056c96

;----------------------------------------------
loc_056c9e:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_056cb0:
	tst.b (Set_GC_Flash_BG,a5)
	bne.b loc_056cc0
	tst.b ($11c,a5)
	bne.b loc_056cc0
	addq.b #2,(6,a6)

loc_056cc0:
	jmp loc_02a7ea

;----------------------------------------------
loc_056cc6:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	beq.b loc_056cdc
	lsr.b #1,d0
	subq.b #1,d0
	bra.b loc_056ce4

loc_056cdc:
	move.b ($81,a5),d0
	andi.w #$f,d0

loc_056ce4:
	move.b loc_056cf2(pc,d0.w),d0
	addi.b #$23,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056cf2:
	dc.b $00,$01,$00,$01
	dc.b $00,$01,$00,$01
	dc.b $00,$01,$00,$01
	dc.b $00,$01,$00,$01

;----------------------------------------------
loc_056d02:
	tst.b ($3a,a6)
	beq.b loc_056d16
	subq.b #1,($3a,a6)
	bne.b loc_056d16
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_056d16:
	jmp loc_02a7ea

;##############################################
;Timer Over
;##############################################
loc_056d1c:
	move.b (6,a6),d0
	move.w loc_056d28(pc,d0.w),d1
	jmp loc_056d28(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056d28:
	dc.w loc_056d30-loc_056d28
	dc.w loc_056d42-loc_056d28
	dc.w loc_056d52-loc_056d28
	dc.w loc_056d6c-loc_056d28

;----------------------------------------------
loc_056d30:
	addq.b #2,(6,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_056d42:
	tst.b ($11c,a5)
	bne.b loc_056d4c
	addq.b #2,(6,a6)

loc_056d4c:
	jmp loc_02a7ea

;----------------------------------------------
loc_056d52:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_056d66
	moveq #$29,d0

loc_056d66:
	jmp loc_02a708

;----------------------------------------------
loc_056d6c:
	tst.b ($3a,a6)
	beq.b loc_056d80
	subq.b #1,($3a,a6)
	bne.b loc_056d80
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_056d80:
	jmp loc_02a7ea

;##############################################
;Normals
;##############################################
loc_056d86:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.w loc_056e94
	tst.b (PL_cpucontrol,a6)
	beq.b loc_056db4
	btst #4,($20a,a6)
	beq.b loc_056db4
	move.b #$13,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	bra.w loc_056f34

loc_056db4:
	tst.b ($80,a6)
	bne.w loc_056e3c
	clr.b (pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_056dcc(pc,d0.w),d1
	jmp loc_056dcc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056dcc:
	dc.w loc_056dd0-loc_056dcc
	dc.w loc_056e36-loc_056dcc

;----------------------------------------------
loc_056dd0:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_056dfc
	moveq #6,d0

loc_056dfc:
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_056e18
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_056e18
	btst #0,($83,a6)
	bne.b loc_056e24
	bra.b loc_056e22

loc_056e18:
	move.w loc_056e2a(pc,d0.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_056e24

loc_056e22:
	addq.b #1,d0

loc_056e24:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056e2a:
	dc.w $0030,$0058,$0030,$0030,$0030,$0030

;----------------------------------------------
loc_056e36:
	jmp loc_02f5ac

;==============================================
;Crouch
;==============================================
loc_056e3c:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_056e4e(pc,d0.w),d1
	jmp loc_056e4e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056e4e:
	dc.w loc_056e52-loc_056e4e
	dc.w loc_056e8e-loc_056e4e

;----------------------------------------------
loc_056e52:
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
	tst.b ($81,a6)
	beq.b loc_056e84
	addq.b #3,d0

loc_056e84:
	addi.b #$c,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_056e8e:
	jmp loc_02f5ac

;==============================================
loc_056e94:
	tst.b ($80,a6)
	bne.b loc_056e3c
	clr.b (pl_crouching,a6)
	moveq #0,d0
	move.b (7,a6),d0
	move.w loc_056ec4(pc,d0.w),d1
	jsr loc_056ec4(pc,d1.w)
	move.b ($34,a6),d0
	beq.b loc_056ec2
	tst.b (PL_Flip,a6)
	bne.b loc_056eba
	neg.w d0

loc_056eba:
	add.w d0,($10,a6)
	clr.b ($34,a6)

loc_056ec2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056ec4:
	dc.w loc_056ec8-loc_056ec4
	dc.w loc_056f2e-loc_056ec4

;----------------------------------------------
loc_056ec8:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_056ef4
	moveq #$6,d0

loc_056ef4:
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_056f10
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_056f10
	btst #0,($83,a6)
	bne.b loc_056f1c
	bra.b loc_056f1a

loc_056f10:
	move.w loc_056f22(pc,d0.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_056f1c

loc_056f1a:
	addq.b #1,d0

loc_056f1c:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056f22:
	dc.w $0030,$0030,$0030,$0030,$0030,$0030

;----------------------------------------------
loc_056f2e:
	jmp loc_02f5ac

;##############################################
;Normals Stance 2
;##############################################
loc_056f34:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_056f58
	btst #4,($20a,a6)
	bne.b loc_056f58
	move.b #$11,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	bra.w loc_056d86

loc_056f58:
	move.b ($80,a6),d0
	move.w loc_056f84(pc,d0.w),d1
	jsr loc_056f84(pc,d1.w)
	cmpi.b #4,($80,a6)
	beq.b loc_056f82
	move.b ($34,a6),d0
	beq.b loc_056f82
	tst.b (PL_Flip,a6)
	bne.b loc_056f7a
	neg.w d0

loc_056f7a:
	add.w d0,($10,a6)
	clr.b ($34,a6)

loc_056f82:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056f84:
	dc.w loc_056f8a-loc_056f84
	dc.w loc_05700a-loc_056f84
	dc.w loc_057076-loc_056f84

;----------------------------------------------
loc_056f8a:
	clr.b (pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_056f9a(pc,d0.w),d1
	jmp loc_056f9a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056f9a:
	dc.w loc_056f9e-loc_056f9a
	dc.w loc_057004-loc_056f9a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_056f9e:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_056fca
	moveq #6,d0

loc_056fca:
	add.b ($82,a6),d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_056fe6
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_056fe6
	btst #0,($83,a6)
	bne.b loc_056ff2
	bra.b loc_056ff0

loc_056fe6:
	move.w loc_056ff8(pc,d0.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_056ff2

loc_056ff0:
	addq.b #1,d0

loc_056ff2:
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_056ff8:
	dc.w $0030,$0030,$0030,$0030,$0030,$0030

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_057004:
	jmp loc_02f5ac

;----------------------------------------------
loc_05700a:
	move.b #1,(pl_crouching,a6)
	move.b (7,a6),d0
	move.w loc_05701c(pc,d0.w),d1
	jmp loc_05701c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05701c:
	dc.w loc_057020-loc_05701c
	dc.w loc_057070-loc_05701c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_057020:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	bne.b loc_057056
	cmpi.b #4,($82,a6)
	bne.b loc_057056
	move.b #1,($294,a6)

loc_057056:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	tst.b ($81,a6)
	beq.b loc_057066
	addq.b #3,d0

loc_057066:
	addi.b #$c,d0
	jmp Set_Spec_Cancel_Timers

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_057070:
	jmp loc_02f5ac

;----------------------------------------------
loc_057076:
	tst.b ($5b,a6)
	beq.b loc_0570aa
	tst.b ($34,a6)
	beq.b loc_0570aa
	tst.b (PL_cpucontrol,a6)
	beq.b loc_057092
	btst #1,($83,a6)
	beq.b loc_0570aa
	bra.b loc_05709a

loc_057092:
	btst #6,($378,a6)
	beq.b loc_0570aa

loc_05709a:
	moveq #$1e,d0
	tst.b ($3c,a6)
	beq.b loc_0570a4
	moveq #$1f,d0

loc_0570a4:
	jmp Set_Spec_Cancel_Timers

loc_0570aa:
	jsr loc_02aa08
	bhi.b loc_0570b8
	jmp loc_02bd64

loc_0570b8:
	jmp loc_02a7ea

;##############################################
;Air Normals
;##############################################
loc_0570be:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_0570f6
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0570f6
	btst #4,($20a,a6)
	beq.b loc_0570e8
	move.b #$13,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	bra.b loc_057144

loc_0570e8:
	btst #3,($20a,a6)
	beq.b loc_0570f6
	move.b #2,($81,a6)

loc_0570f6:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_05713e(pc,d0.w),d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_057128
	moveq #$18,d0

loc_057128:
	tst.b ($81,a6)
	beq.b loc_057130
	addq.b #3,d0

loc_057130:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05713e:
	dc.w $0000,$0001,$0002

;##############################################
;Air Normals Stance 2
;##############################################
loc_057144:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0571be
	btst #4,($20a,a6)
	bne.b loc_057168
	move.b #$11,($102,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	bra.w loc_0570be

loc_057168:
	btst #3,($20a,a6)
	beq.b loc_0571be
	move.b #2,($81,a6)
	cmpi.b #$13,($102,a6)
	bne.b loc_0571be
	tst.b (PL_ism_choice,a6)
	bne.b loc_0571be
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_0571be
	tst.b ($31,a6)
	beq.b loc_0571be
	move.w ($64,a6),d0
	addi.w #$18,d0
	cmp.w ($14,a6),d0
	bgt.b loc_0571be
	move.l #$02001000,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	bra.w loc_057778

loc_0571be:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,(pl_attk_active,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_057222(pc,d0.w),d0
	jsr loc_02ef6c
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_0571f0
	moveq #$18,d0

loc_0571f0:
	tst.b ($81,a6)
	beq.b loc_0571f8
	addq.b #3,d0

loc_0571f8:
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr Set_Spec_Cancel_Timers
	tst.b ($81,a6)
	beq.b loc_057220
	cmpi.b #4,($82,a6)
	bne.b loc_057220
	move.l #$2000a00,(4,a6)
	clr.b ($5b,a6)

loc_057220:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057222:
	dc.w $0000,$0001,$0002

;##############################################
;Special Inputs
;##############################################
loc_057228:
	jsr SPButton_Vism_code
	bne.w loc_0575f6

loc_057232:
	lea.l (pl_inp_slot_7,a6),a4
	jsr SpInp_21421K_code
	bne.w loc_05746c

loc_057240:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_057426

loc_05724e:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_23623P_Code
	bne.w loc_0573e0

loc_05725c:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_21421P_code
	bne.w loc_05739a

loc_05726a:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpChrg_28K_code
	bne.w loc_057366

loc_057278:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpChrg_46P_code
	bne.w loc_05732c

loc_057286:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_623K_code
	bne.w loc_0572fc

loc_057294:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpMash_P_code
	bne.w loc_0572cc

loc_0572a2:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_0572b2
	bsr.w loc_05951a
	bne.w loc_0574ca

loc_0572b2:
	jsr SPButton_Taunt_code
	bne.w loc_057502

loc_0572bc:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_057530

loc_0572ca:
	rts

;----------------------------------------------
;Move ID Write
;----------------------------------------------
loc_0572cc:
	cmpi.b #$11,($102,a6)
	bne.b loc_0572a2
	jsr loc_02ed00
	beq.b loc_0572a2
	move.l #$02000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0572fc:
	cmpi.b #$11,($102,a6)
	bne.b loc_057294
	jsr loc_02ed00
	beq.b loc_057294
	move.l #$02000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_05732c:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_05733c
	cmpi.b #$13,($102,a6)
	bne.w loc_057286

loc_05733c:
	jsr loc_02ed00
	beq.w loc_057286
	move.l #$02000e00,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f728

;----------------------------------------------
loc_057366:
	cmpi.b #$13,($102,a6)
	bne.w loc_057278
	jsr loc_02ed00
	beq.w loc_057278
	move.l #$02000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_05739a:
	cmpi.b #$11,($102,a6)
	bne.w loc_05726a
	tst.b (PL_ism_choice,a6)
	bne.w loc_05726a
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_05726a
	jsr loc_02ecd8
	beq.w loc_05726a
	move.l #$02001000,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_0573e0:
	cmpi.b #$11,($102,a6)
	bne.w loc_05725c
	tst.b (PL_ism_choice,a6)
	bgt.w loc_05725c
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_05725c
	jsr loc_02ecd8
	beq.w loc_05725c
	move.l #$02001000,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_057426:
	cmpi.b #$13,($102,a6)
	bne.w loc_05724e
	tst.b (PL_ism_choice,a6)
	bgt.w loc_05724e
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_05724e
	jsr loc_02ecd8
	beq.w loc_05724e
	move.l #$02001000,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_05746c:
	cmpi.b #$13,($102,a6)
	bne.w loc_057240
	tst.b (PL_ism_choice,a6)
	bne.w loc_057240
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_057240
	tst.b ($31,a6)
	beq.w loc_057240
	move.w ($64,a6),d0
	addi.w #$18,d0
	cmp.w ($14,a6),d0
	bgt.w loc_057240
	jsr loc_02ed1c
	beq.w loc_057240
	move.b ($254,a6),($3f,a6)
	move.l #$02001000,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_0574ca:
	cmpi.w #$200,(4,a6)
	bne.b loc_0574da
	cmpi.b #$a,(6,a6)
	beq.b loc_0574fa

loc_0574da:
	jsr loc_02ed00
	beq.w loc_0574fa
	move.l #$02000e00,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

loc_0574fa:
	addq.b #1,($283,a6)
	bra.w loc_0572b2

;----------------------------------------------
loc_057502:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_057510
	tst.b (pl_taunt_count,a6)
	beq.w loc_0572bc

loc_057510:
	jsr loc_02ed00
	beq.w loc_0572bc
	move.l #$02000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_057530:
	jsr loc_02edf8
	beq.w loc_0572ca

;##############################################
;Vism AC Write
;##############################################
loc_05753a:
	tst.b (PL_ism_choice,a6)
	beq.w loc_05759c
	movea.w ($38,a6),a4
	move.l #$02000e00,(4,a6)
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #0,(pl_crouching,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	jsr loc_080e8e
	movea.w ($38,a6),a4
	moveq #7,d0
	moveq #$10,d1
	moveq #$14,d2
	cmpi.b #$11,($102,a6)
	beq.b loc_05758e
	moveq #9,d0
	moveq #$13,d1
	moveq #$17,d2

loc_05758e:
	move.b d1,($5f,a4)
	move.b d2,(pl_invinciblity_timer,a6)
	jmp Set_Char_Special_Ani

;##############################################
;Aism AC Write
;##############################################
loc_05759c:
	movea.w ($38,a6),a4
	move.l #$02000e00,(4,a6)
	move.b #$16,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #0,(pl_crouching,a6)
	move.b #4,($82,a6)
	clr.b (pl_hitfreeze,a6)
	jsr loc_080e8e
	movea.w ($38,a6),a4
	moveq #8,d0
	moveq #$13,d1
	moveq #$17,d2
	cmpi.b #$11,($102,a6)
	beq.b loc_0575e8
	moveq #$a,d0
	moveq #$18,d1
	moveq #$1c,d2

loc_0575e8:
	move.b d1,($5f,a4)
	move.b d2,(pl_invinciblity_timer,a6)
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0575f6:
	tst.b ($28a,a6)
	bne.w loc_057232
	tst.b ($31,a6)
	bne.b loc_057632
	jsr loc_02ef54
	beq.w loc_057232
	jsr loc_02ecd8
	beq.w loc_057232
	move.l #$2001000,(4,a6)
	move.b #$18,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_057632:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_057232
	jsr loc_02ed28
	beq.w loc_057232
	move.l #$2001000,(4,a6)
	move.b #$18,(pl_move_id,a6)
	jmp loc_02f980

;##############################################
;Ai Special Move Checks
;##############################################
loc_057658:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_057692
	cmpi.b #$10,(pl_move_id,a6)
	bcc.b loc_057692
	moveq #$11,d0
	btst #4,($20a,a6)
	beq.b loc_057674
	moveq #$13,d0

loc_057674:
	cmp.b ($102,a6),d0
	beq.b loc_057692
	move.b d0,($102,a6)
	move.l a0,($1fc,a6)
	jsr loc_02fc4a
	jsr loc_02f15c
	movea.l ($1fc,a6),a0

loc_057692:
	move.b (pl_move_id,a6),d0
	move.w loc_05769e(pc,d0.w),d1
	jmp loc_05769e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05769e:
	dc.w loc_0576b8-loc_05769e
	dc.w loc_0576cc-loc_05769e
	dc.w loc_0576da-loc_05769e
	dc.w loc_0576f0-loc_05769e
	dc.w loc_057702-loc_05769e
	dc.w loc_05771a-loc_05769e
	dc.w loc_057732-loc_05769e
	dc.w loc_05774a-loc_05769e

	dc.w loc_057762-loc_05769e
	dc.w loc_05776a-loc_05769e
	dc.w loc_057768-loc_05769e
	dc.w loc_057768-loc_05769e
	dc.w loc_057768-loc_05769e

;==============================================
loc_0576b8:
	cmpi.b #$11,($102,a6)
	bne.w loc_057774
	move.b ($83,a6),($81,a6)
	bra.w loc_057770

;==============================================
loc_0576cc:
	cmpi.b #$11,($102,a6)
	bne.w loc_057774
	bra.w loc_057770

;==============================================
loc_0576da:
	tst.b (PL_ism_choice,a6)
	beq.w loc_057770
	cmpi.b #$13,($102,a6)
	bne.w loc_057774
	bra.w loc_057770

;==============================================
loc_0576f0:
	tst.b (PL_ism_choice,a6)
	bmi.w loc_057774
	cmpi.b #$13,($102,a6)
	bne.b loc_057774
	bra.b loc_057770

;==============================================
loc_057702:
	tst.b (PL_ism_choice,a6)
	bne.b loc_057774
	cmpi.b #$11,($102,a6)
	bne.b loc_057774
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_057774
	bra.b loc_057770

;==============================================
loc_05771a:
	tst.b (PL_ism_choice,a6)
	bgt.b loc_057774
	cmpi.b #$11,($102,a6)
	bne.b loc_057774
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_057774
	bra.b loc_057770

;==============================================
loc_057732:
	tst.b (PL_ism_choice,a6)
	bgt.b loc_057774
	cmpi.b #$13,($102,a6)
	bne.b loc_057774
	cmpi.w #$30,(PL_meter,a6)
	bcs.b loc_057774
	bra.b loc_057770

;==============================================
loc_05774a:
	tst.b (PL_ism_choice,a6)
	bne.b loc_057774
	cmpi.b #$13,($102,a6)
	bne.b loc_057774
	cmpi.w #5,(PL_meter,a6)
	bcs.b loc_057774
	bra.b loc_057770

;==============================================
loc_057762:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_057774

;==============================================
loc_057768:
	bra.b loc_057770

;==============================================
loc_05776a:
	tst.b (pl_taunt_count,a6)
	beq.b loc_057774

;----------------------------------------------
loc_057770:
	moveq #1,d0
	rts

;----------------------------------------------
loc_057774:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_057778:
	move.b (pl_move_id,a6),d0
	move.w loc_057784(pc,d0.w),d1
	jmp loc_057784(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057784:
	dc.w loc_05779e-loc_057784;00 Hyakurenkou
	dc.w loc_05798e-loc_057784;02 Gekirou
	dc.w loc_057bf4-loc_057784;04 Jasen
	dc.w loc_057d12-loc_057784;06 Ouga
	dc.w loc_0581ce-loc_057784;08 Shitenshuu
	dc.w loc_05833c-loc_057784;0a Zan'ei
	dc.w loc_058612-loc_057784;0c Jakouha
	dc.w loc_058886-loc_057784;0e Kouga

	dc.w loc_058f50-loc_057784;10 Stance Change
	dc.w loc_058f56-loc_057784;12 Taunt
	dc.w loc_058f9c-loc_057784;14 Vism AC
	dc.w loc_05902e-loc_057784;16 Aism AC
	dc.w loc_0590ea-loc_057784;18 Vism Activate

;==============================================
;Hyakurenkou
;==============================================
loc_05779e:
	move.b (7,a6),d0
	move.w loc_0577aa(pc,d0.w),d1
	jmp loc_0577aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0577aa:
	dc.w loc_0577b2-loc_0577aa
	dc.w loc_0577e0-loc_0577aa
	dc.w loc_05780e-loc_0577aa
	dc.w loc_05796e-loc_0577aa

;----------------------------------------------
loc_0577b2:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #3,d0
	jsr loc_02ef6c
	jsr loc_020674
	clr.b ($247,a6)
	moveq #$10,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0577e0:
	tst.b ($35,a6)
	beq.b loc_057804
	addq.b #2,(7,a6)
	move.b #$f,($3a,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_05780e
	move.b ($81,a6),d0
	move.b loc_05780a(pc,d0.w),($3a,a6)
	bra.w loc_0578e8

loc_057804:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05780a:
	dc.b $00,$01,$02,$03

;----------------------------------------------
loc_05780e:
	tst.b (PL_cpucontrol,a6)
	bne.w loc_0578e8
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_0578ce
	jsr loc_02af7a
	bne.w loc_0578ce
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_057844
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_057844:
	move.b ($34,a6),d0
	beq.b loc_05786c
	cmpi.b #1,($32,a6)
	bne.b loc_05786c
	clr.b ($34,a6)
	jsr loc_02f770
	jsr loc_020674
	tst.b ($247,a6)
	bne.b loc_05786c
	st.b ($247,a6)

loc_05786c:
	move.b ($378,a6),d1
	andi.w #7,d1
	beq.b loc_0578c2
	moveq #0,d0
	btst #0,d1
	bne.b loc_057888
	moveq #2,d0
	btst #1,d1
	bne.b loc_057888
	moveq #4,d0

loc_057888:
	move.w loc_0578e2(pc,d0.w),d2
	cmp.b ($3a,a6),d2
	bcc.b loc_0578c2
	move.b #$f,($3a,a6)
	cmp.b ($82,a6),d0
	beq.b loc_0578c8
	move.b d0,($82,a6)
	move.b ($35,a6),d2
	andi.w #$ff,d2
	addi.w #$10,d0
	jsr Set_Char_Special_Ani
	movea.l ($1c,a6),a0
	lea.l (a0,d2.w),a0
	jmp loc_02a770

loc_0578c2:
	subq.b #1,($3a,a6)
	beq.b loc_0578ce

loc_0578c8:
	jmp loc_02a7ea

loc_0578ce:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$11,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0578e2:
	dc.w $0000,$0003,$0006

;----------------------------------------------
loc_0578e8:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_05795a
	jsr loc_02af7a
	bne.b loc_05795a
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_057912
	move.b #1,($d6,a4)
	clr.b ($270,a4)
 
loc_057912:
	tst.b ($34,a6)
	beq.b loc_057954
	cmpi.b #1,($32,a6)
	bne.b loc_057954
	clr.b ($34,a6)
	jsr loc_02f770
	jsr loc_020674
	tst.b ($247,a6)
	bne.b loc_05793a
	st.b ($247,a6)

loc_05793a:
	tst.b ($81,a6)
	beq.b loc_057948
	subq.b #1,($3a,a6)
	beq.b loc_05795a
	bra.b loc_057954

loc_057948:
	lea.l loc_059590(pc),a1
	jsr loc_030a66
	bne.b loc_05795a

loc_057954:
	jmp loc_02a7ea

loc_05795a:
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$11,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05796e:
	tst.b ($33,a6)
	bpl.b loc_057982
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_057982:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Gekirou
;==============================================
loc_05798e:
	move.b (7,a6),d0
	move.w loc_05799a(pc,d0.w),d1
	jmp loc_05799a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05799a:
	dc.w loc_0579a8-loc_05799a
	dc.w loc_057a30-loc_05799a
	dc.w loc_057a58-loc_05799a
	dc.w loc_057aa8-loc_05799a
	dc.w loc_057b60-loc_05799a
	dc.w loc_057b78-loc_05799a
	dc.w loc_057bb8-loc_05799a

;----------------------------------------------
loc_0579a8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #7,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b d0,($87,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_057a00(pc,d0.w),($40,a6)
	move.l loc_057a00+4(pc,d0.w),($48,a6)
	move.l loc_057a00+8(pc,d0.w),($44,a6)
	move.l loc_057a00+$c(pc,d0.w),($4c,a6)
	moveq #$10,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0579f8
	neg.w d0

loc_0579f8:
	add.w d0,($10,a6)
	bra.w loc_057bda

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057a00:
	dc.l $00040000,$ffff8000,$00030000,$ffffc000
	dc.l $00040000,$ffff8000,$00038000,$ffffc000
	dc.l $00040000,$ffff8000,$00040000,$ffffc000

;----------------------------------------------
loc_057a30:
	tst.b ($35,a6)
	bne.b loc_057a4c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b loc_057a52+1(pc,d0.w),($86,a6)

loc_057a4c:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057a52:
	dc.b $00,$05,$00,$06,$00,$07

;----------------------------------------------
loc_057a58:
	tst.b ($5b,a6)
	beq.b loc_057a86
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l #$c000,($40,a6)
	move.l #$19000,($44,a6)
	move.l d0,($48,a6)
	move.l #$fffff000,($4c,a6)
	move.w #$3001,($3a,a6)

loc_057a86:
	bsr.w loc_0594e4
	bpl.b loc_057aa2

loc_057a8c:
	move.b #$a,(7,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$2e,d0
	jmp Set_Char_Special_Ani

loc_057aa2:
	jmp loc_02a7ea

;----------------------------------------------
loc_057aa8:
	bsr.w loc_0594e4
	tst.b ($3a,a6)
	beq.b loc_057a8c
	subq.b #1,($3a,a6)
	addq.b #1,($3b,a6)
	tst.b ($5b,a6)
	beq.w loc_057b5a
	tst.b (PL_cpucontrol,a6)
	beq.b loc_057af2
	cmpi.b #5,($3a,a6)
	bhi.w loc_057b5a
	movea.w ($38,a6),a4
	move.w ($14,a4),d0
	sub.w ($14,a6),d0
	cmpi.w #$10,d0
	bge.b loc_057b5a
	lea.l loc_059610(pc),a1
	jsr loc_030a66
	beq.b loc_057b5a
	bra.b loc_057b06

loc_057af2:
	move.b ($378,a6),d0
	andi.b #$70,d0
	lsr.w #4,d0
	move.b ($82,a6),d1
	lsr.w #1,d1
	btst d1,d0
	beq.b loc_057b5a

loc_057b06:
	addq.b #1,($87,a6)
	move.b ($3b,a6),d0
	beq.b loc_057b12
	subq.b #1,d0

loc_057b12:
	move.b d0,($3a,a6)
	moveq #$b,d0
	jsr loc_0038e4
	moveq #0,d0
	move.b d0,($3b,a6)
	move.b d0,($5b,a6)
	move.b ($86,a6),d0
	cmp.b ($87,a6),d0
	bne.b loc_057b46
	addq.b #2,(7,a6)
	move.l #$ffffe000,($48,a6)
	move.l #$ffffb000,($4c,a6)

loc_057b46:
	move.l #$c000,($40,a6)
	move.l #$19000,($44,a6)
	bra.w loc_057bda

loc_057b5a:
	jmp loc_02a7ea

;----------------------------------------------
loc_057b60:
	bsr.w loc_0594e4
	bpl.b loc_057b72
	addq.b #2,(7,a6)
	move.l #$ffff9000,($4c,a6)

loc_057b72:
	jmp loc_02a7ea

;----------------------------------------------
loc_057b78:
	bsr.w loc_0594e4
	move.w ($64,a6),d1
	cmp.w ($14,a6),d1
	bcs.b loc_057bb2
	addq.b #2,(7,a6)
	moveq #0,d0
	move.w d1,($14,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$2b,d0
	jmp Set_Char_Special_Ani

loc_057bb2:
	jmp loc_02a7ea

;----------------------------------------------
loc_057bb8:
	tst.b ($33,a6)
	bpl.w loc_057bce
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_057bce:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_057bda:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_057bee(pc,d0.w),d0
	add.b ($87,a6),d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057bee:
	dc.w $0016,$001c,$0023

;==============================================
;Jasen
;==============================================
loc_057bf4:
	move.b (7,a6),d0
	move.w loc_057c00(pc,d0.w),d1
	jmp loc_057c00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057c00:
	dc.w loc_057c08-loc_057c00
	dc.w loc_057c44-loc_057c00
	dc.w loc_057c6c-loc_057c00
	dc.w loc_057c9e-loc_057c00

;----------------------------------------------
loc_057c08:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #2,($294,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$30,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_057c44:
	tst.b ($35,a6)
	beq.b loc_057c5a
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_057c60(pc,d0.w),($40,a6)

loc_057c5a:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057c60:
	dc.l $00058000,$00058000,$00058000

;----------------------------------------------
loc_057c6c:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_057c78
	neg.l d0

loc_057c78:
	add.l d0,($10,a6)
	tst.b ($35,a6)
	bne.b loc_057c98
	addq.b #2,(7,a6)
	move.l #$ffff4000,($48,a6)
	move.b #3,($3a,a6)
	clr.b ($294,a6)

loc_057c98:
	jmp loc_02a7ea

;----------------------------------------------
loc_057c9e:
	tst.b ($3a,a6)
	beq.b loc_057cb6
	subq.b #1,($3a,a6)
	bne.b loc_057cb6
	move.b #3,($3a,a6)
	jsr loc_085a74

loc_057cb6:
	tst.b ($33,a6)
	bpl.b loc_057cce
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	clr.b ($ce,a6)
	bra.w loc_05954a

loc_057cce:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_057cda
	neg.l d0

loc_057cda:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_057cf6
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.b d0,($3a,a6)

loc_057cf6:
	tst.b ($35,a6)
	beq.b loc_057d06
	moveq #0,d0
	move.b d0,($35,a6)
	move.b d0,($ce,a6)

loc_057d06:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Ouga
;==============================================
loc_057d12:
	move.b (7,a6),d0
	move.w loc_057d1e(pc,d0.w),d1
	jmp loc_057d1e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057d1e:
	dc.w loc_057d30-loc_057d1e
	dc.w loc_057d56-loc_057d1e
	dc.w loc_057de0-loc_057d1e
	dc.w loc_057e52-loc_057d1e
	dc.w loc_057ff2-loc_057d1e
	dc.w loc_05801c-loc_057d1e
	dc.w loc_058110-loc_057d1e
	dc.w loc_058176-loc_057d1e

	dc.w loc_0581ae-loc_057d1e

;----------------------------------------------
loc_057d30:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addq.b #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$33,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_057d56:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_057dd8
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($3c,a6)
	move.b d0,($5b,a6)
	move.b #1,($31,a6)
	move.b ($371,a6),d0
	tst.b (PL_cpucontrol,a6)
	beq.b loc_057d86
	jsr RNGFunction

loc_057d86:
	btst #1,d0
	beq.b loc_057d92
	eori.b #1,(PL_Flip,a6)

loc_057d92:
	jsr loc_01bd5c
	move.l ($10,a3),d3
	tst.b (PL_Flip,a6)
	bne.b loc_057da8
	addi.l #$1800000,d3

loc_057da8:
	sub.l ($10,a6),d3
	moveq #0,d2
	move.b ($82,a6),d2
	move.w loc_057dda(pc,d2.w),d2
	jsr loc_01bb9c
	move.l d3,($40,a6)
	move.l #0,($48,a6)
	move.l #$a5000,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_057dd8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057dda:
	dc.w $0018,$0014,$0010

;----------------------------------------------
loc_057de0:
	bsr.w loc_0594c2
	bpl.b loc_057e14
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_057e14
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	move.b #$10,(7,a6)
	clr.b ($ce,a6)
	moveq #$46,d0
	jmp Set_Char_Special_Ani

loc_057e14:
	move.w ($64,a6),d0
	addi.w #$48,d0
	cmp.w ($14,a6),d0
	bcc.b loc_057e4c
	move.b (PL_Flip,a6),d0
	eori.b #1,d0
	btst d0,($ac,a6)
	beq.b loc_057e4c
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	jsr loc_00369c
	moveq #$34,d0
	jmp Set_Char_Special_Ani

loc_057e4c:
	jmp loc_02a7ea

;----------------------------------------------
loc_057e52:
	bsr.w loc_0594c2
	tst.b ($33,a6)
	bpl.w loc_057f8c
	tst.b (PL_cpucontrol,a6)
	beq.b loc_057e80
	lea.l loc_059690(pc),a1
	jsr loc_030a66
	beq.b loc_057ed8
	jsr RNGFunction
	andi.b #1,d0
	beq.b loc_057e8e
	bra.w loc_057f0c

loc_057e80:
	move.b ($371,a6),d1
	andi.b #$f,d1
	btst #3,d1
	beq.b loc_057ed2

loc_057e8e:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d0
	sub.l ($10,a6),d0
	asr.l #4,d0
	move.l d0,($40,a6)
	moveq #0,d0
	move.w ($64,a6),d0
	addi.w #$8a,d0
	swap d0
	sub.l ($14,a6),d0
	asr.l #4,d0
	addi.l #$4000,d0
	move.l d0,($44,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	moveq #$3b,d0
	jmp Set_Char_Special_Ani

loc_057ed2:
	btst #0,d1
	beq.b loc_057f0c

loc_057ed8:
	move.b #$e,(7,a6)
	move.l #$18000,d1
	tst.b (PL_Flip,a6)
	bne.b loc_057eec
	neg.l d1

loc_057eec:
	move.l d1,($40,a6)
	clr.l ($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$43,d0
	jmp Set_Char_Special_Ani

loc_057f0c:
	move.b #$c,(7,a6)
	clr.b ($3c,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_057f44
	jsr loc_01bd5c
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a3),d0
	move.w #2,d1
	cmpi.w #$c0,d0
	bcs.b loc_057f3a
	moveq #0,d1

loc_057f3a:
	tst.b (PL_Flip,a6)
	beq.b loc_057f44
	eori.w #2,d1

loc_057f44:
	moveq #0,d5
	move.b ($82,a6),d5
	lsl.w #3,d5
	moveq #$35,d0
	btst #1,d1
	beq.b loc_057f5a
	addq.w #1,d0
	addi.w #$30,d5

loc_057f5a:
	move.l loc_057f92(pc,d5.w),d2
	move.l loc_057f92+4(pc,d5.w),d3
	move.l loc_057f92+8(pc,d5.w),d4
	move.l loc_057f92+$c(pc,d5.w),d5
	tst.b (PL_Flip,a6)
	bne.b loc_057f72
	neg.l d2

loc_057f72:
	move.l d2,($40,a6)
	move.l d3,($48,a6)
	move.l d4,($44,a6)
	move.l d5,($4c,a6)
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

loc_057f8c:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_057f92:
	dc.l $00050000,$00000000,$00010000,$ffffb000
	dc.l $00054000,$00000000,$00010000,$ffffb000
	dc.l $00058000,$00000000,$00010000,$ffffb000
	dc.l $00078000,$00000000,$00000000,$ffffc000
	dc.l $0007c000,$00000000,$00000000,$ffffc000
	dc.l $00080000,$00000000,$00000000,$ffffc000

;----------------------------------------------
loc_057ff2:
	bsr.w loc_0594c2
	move.w ($64,a6),d0
	addi.w #$8a,d0
	cmp.w ($14,a6),d0
	bhi.b loc_058016
	addq.b #2,(7,a6)
	jsr loc_00369c
	moveq #$3c,d0
	jmp Set_Char_Special_Ani

loc_058016:
	jmp loc_02a7ea

;----------------------------------------------
loc_05801c:
	tst.b ($33,a6)
	bpl.w loc_05810a
	tst.b (PL_cpucontrol,a6)
	beq.b loc_058038
	lea.l loc_059690(pc),a1
	jsr loc_030a66
	beq.b loc_058042
	bra.b loc_05806e

loc_058038:
	move.b ($371,a6),d1
	btst #3,d1
	beq.b loc_05806e

loc_058042:
	move.b #$e,(7,a6)
	move.l ($40,a6),d0
	asr.l #2,d0
	move.l d0,($40,a6)
	clr.l ($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$43,d0
	jmp Set_Char_Special_Ani

loc_05806e:
	addq.b #2,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0580a4
	move.w #2,d1
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	bcs.b loc_05808e
	move.w #1,d1

loc_05808e:
	tst.b (PL_Flip,a6)
	beq.b loc_058098
	eori.w #3,d1

loc_058098:
	addi.w #$10,d0
	cmpi.w #$20,d0
	bhi.b loc_0580a4
	moveq #0,d1

loc_0580a4:
	moveq #1,d0
	moveq #0,d2
	moveq #0,d3
	move.l #$ffff8000,d4
	move.l #$ffff8000,d5
	andi.w #3,d1
	beq.b loc_0580e8
	moveq #0,d0
	move.l #$28000,d2
	moveq #0,d3
	move.l #$ffff8000,d4
	move.l #$ffffa000,d5
	move.b (PL_Flip,a6),d6
	btst d6,d1
	bne.b loc_0580dc
	neg.l d2

loc_0580dc:
	btst #0,d1
	beq.b loc_0580e8
	eori.b #1,(PL_Flip,a6)

loc_0580e8:
	move.b d0,($3c,a6)
	addi.b #$3d,d0
	move.l d2,($40,a6)
	move.l d3,($48,a6)
	move.l d4,($44,a6)
	move.l d5,($4c,a6)
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

loc_05810a:
	jmp loc_02a7ea

;----------------------------------------------
loc_058110:
	bsr.w loc_0594c2
	bpl.b loc_058154
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058154
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	move.b #$10,(7,a6)
	clr.b ($ce,a6)
	moveq #$46,d0
	move.b ($3c,a6),d1
	bmi.b loc_05814e
	andi.w #$7f,d1
	moveq #$47,d0
	add.w d1,d0

loc_05814e:
	jmp Set_Char_Special_Ani

loc_058154:
	tst.b ($5b,a6)
	beq.b loc_058170
	clr.b ($5b,a6)
	moveq #$44,d0
	add.b ($3c,a6),d0
	ori.b #$80,($3c,a6)
	jmp Set_Char_Special_Ani

loc_058170:
	jmp loc_02a7ea

;----------------------------------------------
loc_058176:
	bsr.w loc_0594c2
	bpl.b loc_0581a8
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0581a8
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$46,d0
	jmp Set_Char_Special_Ani

loc_0581a8:
	jmp loc_02a7ea

;----------------------------------------------
loc_0581ae:
	tst.b ($33,a6)
	bpl.b loc_0581c2
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05954a

loc_0581c2:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Shitenshuu
;==============================================
loc_0581ce:
	move.b (7,a6),d0
	move.w loc_0581da(pc,d0.w),d1
	jmp loc_0581da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0581da:
	dc.w loc_0581e2-loc_0581da
	dc.w loc_058208-loc_0581da
	dc.w loc_058234-loc_0581da
	dc.w loc_058286-loc_0581da

;----------------------------------------------
loc_0581e2:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$49,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_058208:
	jsr loc_02a7ea
	btst #0,($35,a6)
	beq.b loc_058232
	moveq #0,d0
	addq.b #2,(7,a6)
	move.b d0,($5b,a6)
	move.b d0,($87,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_05822e
	moveq #1,d0

loc_05822e:
	move.b d0,($ab,a6)

loc_058232:
	rts

;----------------------------------------------
loc_058234:
	jsr loc_02a7ea
	btst #0,($35,a6)
	bne.b loc_058268
	addq.b #2,(7,a6)
	bclr.b #0,($35,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05825e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05825e:
	move.b loc_058282(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($ab,a6)

loc_058268:
	btst #1,($35,a6)
	beq.b loc_058280
	bclr.b #1,($35,a6)
	moveq #-6,d0
	moveq #$4f,d1
	jmp loc_082e36

loc_058280:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058282:
	dc.b $04,$08,$0c,$00

;----------------------------------------------
loc_058286:
	tst.b ($35,a6)
	bne.b loc_058290
	clr.b ($5b,a6)

loc_058290:
	tst.b ($5b,a6)
	beq.b loc_0582b0
	clr.b ($5b,a6)
	movea.w ($38,a6),a4
	cmpi.b #$ff,($55,a4)
	beq.b loc_0582b0
	tst.w ($50,a4)
	bmi.b loc_0582b0
	bsr.w loc_0582ca

loc_0582b0:
	tst.b ($33,a6)
	bpl.b loc_0582c4
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_0582c4:
	jmp loc_02a7ea

;==============================================
loc_0582ca:
	moveq #$f,d0
	jsr loc_0038e4
	moveq #0,d0
	move.w d0,($288,a4)
	move.b ($82,a6),d0
	move.b loc_058336(pc,d0.w),($286,a4)
	move.b loc_058336+1(pc,d0.w),($289,a4)
	tst.w ($36,a6)
	bne.b loc_058320
	move.b #9,($284,a4)
	move.b #$3c,($285,a4)
	move.b #$3c,($28f,a4)
	jsr loc_01c2c8
	beq.b loc_058334
	addq.b #1,(a4)
	move.b #$17,(2,a4)
	move.w ($38,a6),($38,a4)
	move.w a6,($36,a4)
	move.w a4,($36,a6)
	rts

loc_058320:
	subi.b #$a,($28f,a4)
	cmpi.b #9,($28f,a4)
	bge.b loc_058334
	move.b #9,($28f,a4)

loc_058334:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058336:
	dc.b $0a,$03,$0b,$05,$0c,$07

;==============================================
;Zan'ei
;==============================================
loc_05833c:
	move.b (7,a6),d0
	move.w loc_058348(pc,d0.w),d1
	jmp loc_058348(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058348:
	dc.w loc_058354-loc_058348
	dc.w loc_058376-loc_058348
	dc.w loc_0583a8-loc_058348
	dc.w loc_05845e-loc_058348
	dc.w loc_05854e-loc_058348
	dc.w loc_0585d4-loc_058348

;----------------------------------------------
loc_058354:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$4c,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_058376:
	jsr loc_02a7ea
	btst #0,($35,a6)
	beq.b loc_0583a6
	moveq #0,d0
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.w d0,($12,a6)
	move.b d0,($5b,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0583a2
	moveq #1,d0

loc_0583a2:
	move.b d0,($ab,a6)

loc_0583a6:
	rts

;----------------------------------------------
loc_0583a8:
	jsr loc_02a7ea
	btst #0,($35,a6)
	bne.b loc_0583d8
	tst.b ($ab,a6)
	beq.b loc_0583d8
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_0583ce
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0583ce:
	move.b loc_05843a(pc,d0.w),(pl_invinciblity_timer,a6)
	clr.b ($ab,a6)

loc_0583d8:
	btst #1,($35,a6)
	beq.b loc_0583f0
	bclr.b #1,($35,a6)
	moveq #$28,d0
	moveq #$66,d1
	jsr loc_082e36

loc_0583f0:
	btst #2,($35,a6)
	beq.b loc_058410
	bclr.b #2,($35,a6)
	moveq #0,d0
	move.b ($34,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_05840c
	neg.w d0

loc_05840c:
	add.w d0,($10,a6)

loc_058410:
	btst #3,($35,a6)
	beq.b loc_058438
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_05843e(pc,d0.w),($40,a6)
	move.l loc_05843e+4(pc,d0.w),($48,a6)
	move.w ($10,a6),($4a,a6)
	bra.b loc_05845e

loc_058438:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05843a:
	dc.b $04,$06,$08,$00

loc_05843e:
	dc.l $00100000,$00500000
	dc.l $00140000,$00c00000
	dc.l $00150000,$01200000
	dc.l $00100000,$00500000

;----------------------------------------------
loc_05845e:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_05846a
	neg.l d0

loc_05846a:
	add.l d0,($10,a6)
	tst.b ($5b,a6)
	ble.b loc_0584e4
	movea.w ($38,a6),a4
	move.b ($2ce,a4),d0
	or.b ($67,a4),d0
	bne.b loc_0584e4
	cmpi.w #$202,(4,a4)
	bne.b loc_0584e4
	cmpi.b #$ff,($55,a4)
	beq.b loc_0584e4
	move.w ($64,a4),d0
	addi.w #$20,d0
	cmp.w ($14,a4),d0
	blt.b loc_0584e4
	jsr loc_02e52e
	beq.w loc_0584e4
	addq.b #2,(7,a6)
	move.l #$c0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	clr.b ($263,a4)
	move.w ($10,a6),($44,a6)
	move.w ($14,a6),($14,a4)
	clr.b ($31,a4)
	moveq #$4d,d0
	add.b ($82,a6),d0
	jsr Set_Char_Special_Ani
	jmp loc_02fb96

loc_0584e4:
	move.w ($10,a6),d0
	sub.w ($4a,a6),d0
	move.w ($48,a6),d2
	add.w d2,d0
	add.w d2,d2
	cmp.w d2,d0
	bhi.b loc_058508
	move.b (PL_Flip,a6),d0
	btst d0,($ac,a6)
	bne.b loc_058508
	jmp loc_02a7ea

loc_058508:
	addq.b #4,(7,a6)
	movea.w ($38,a6),a4
	move.w ($10,a6),d0
	move.w ($10,a4),d1
	moveq #-1,d2
	move.b (PL_Flip,a6),d3
	bne.b loc_058524
	dc.w $c340 ;exg.l d1,d0
	neg.w d2

loc_058524:
	cmp.w d1,d0
	blt.b loc_058536
	btst d3,($ac,a4)
	beq.b loc_058536
	add.w d2,($10,a4)
	clr.b ($ac,a4)

loc_058536:
	move.l #$80000,($40,a6)
	move.l #$ffff0000,($48,a6)
	moveq #$52,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05854e:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_05855a
	neg.l d0

loc_05855a:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_058572
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_058572:
	moveq #0,d0
	move.b ($35,a6),d0
	bmi.w loc_058590
	beq.w loc_0585c8
	clr.b ($35,a6)
	addi.w #$c5,d0
	jsr loc_02e970
	bra.b loc_0585c8

loc_058590:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.w #$c5,d0
	jsr loc_080b70
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$c6,d0
	jsr loc_02e7f2
	move.w a6,(-$5cd2,a5)
	movea.w ($38,a6),a1
	jsr loc_024500

loc_0585c8:
	jsr loc_02a7ea
	jmp loc_02fb96

;----------------------------------------------
loc_0585d4:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_0585e0
	neg.l d0

loc_0585e0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_0585f8
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_0585f8:
	tst.b ($33,a6)
	bpl.b loc_05860c
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_05860c:
	jmp loc_02a7ea

;==============================================
;Jakouha
;==============================================
loc_058612:
	move.b (7,a6),d0
	move.w loc_05861e(pc,d0.w),d1
	jmp loc_05861e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05861e:
	dc.w loc_05862e-loc_05861e
	dc.w loc_05864c-loc_05861e
	dc.w loc_058682-loc_05861e
	dc.w loc_058708-loc_05861e
	dc.w loc_058760-loc_05861e
	dc.w loc_0587b0-loc_05861e
	dc.w loc_05882a-loc_05861e
	dc.w loc_05886c-loc_05861e

;----------------------------------------------
loc_05862e:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #$53,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05864c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_058680
	moveq #0,d0
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.w d0,($12,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_058672
	moveq #1,d0

loc_058672:
	move.b d0,($ab,a6)
	moveq #$c,d0
	moveq #$4d,d1
	jmp loc_082e36

loc_058680:
	rts

;----------------------------------------------
loc_058682:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_0586d2
	addq.b #2,(7,a6)
	jsr loc_02fcd4
	clr.b ($ab,a6)
	tst.b ($3f,a6)
	bne.b loc_0586a8
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_0586a8:
	move.b loc_0586d4(pc,d0.w),(pl_invinciblity_timer,a6)
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_0586d8(pc,d0.w),($40,a6)
	move.l loc_0586d8+4(pc,d0.w),($48,a6)
	move.l loc_0586d8+8(pc,d0.w),($44,a6)
	move.l loc_0586d8+$c(pc,d0.w),($4c,a6)
	move.b #1,($31,a6)

loc_0586d2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0586d4:
	dc.b $00,$00,$00,$00

loc_0586d8:
	dc.l $00080000,$ffff8000,$00080000,$ffffa000
	dc.l $000c0000,$ffff8000,$00088000,$ffffa000
	dc.l $000e0000,$ffff8000,$00090000,$ffffa000

;----------------------------------------------
loc_058708:
	bsr.w loc_0594e4
	bpl.b loc_058720
	move.b #$c,(7,a6)
	st.b ($3c,a6)
	moveq #$54,d0
	jmp Set_Char_Special_Ani

loc_058720:
	movea.w ($38,a6),a4
	tst.b ($2ce,a4)
	bne.b loc_05875a
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.w #$d2,d0
	jsr loc_02e614
	beq.b loc_05875a
	addq.b #2,(7,a6)
	jsr loc_080668
	moveq #$56,d0
	add.b ($82,a6),d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

loc_05875a:
	jmp loc_02a7ea

;----------------------------------------------
loc_058760:
	tst.b ($34,a6)
	bne.b loc_0587a4
	bsr.w loc_0594e4
	bpl.b loc_0587a4
	move.l #$ffffc800,($4c,a6)
	move.w ($64,a6),d0
	addq.w #8,d0
	cmp.w ($14,a6),d0
	bcs.b loc_0587a4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$57,d0
	add.b ($82,a6),d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_0587a4:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0587b0:
	move.b ($35,a6),d0
	beq.b loc_0587ca
	clr.b ($35,a6)
	move.b #$20,($123,a5)
	addi.w #$d2,d0
	jsr loc_02e970

loc_0587ca:
	tst.b ($34,a6)
	beq.b loc_05881e
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	addi.w #$d2,d0
	jsr loc_02e7f2
	move.l #$40000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_058800
	neg.l d0

loc_058800:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	move.b d1,($3c,a6)
	rts

loc_05881e:
	jsr loc_02a7ea
	jmp loc_02fa36

;----------------------------------------------
loc_05882a:
	tst.b ($3c,a6)
	bne.b loc_058838
	bsr.w loc_0594c2
	bpl.b loc_058866
	bra.b loc_05883e

loc_058838:
	bsr.w loc_0594e4
	bpl.b loc_058866

loc_05883e:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058866
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$55,d0
	jmp Set_Char_Special_Ani

loc_058866:
	jmp loc_02a7ea

;----------------------------------------------
loc_05886c:
	tst.b ($33,a6)
	bpl.b loc_058880
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_058880:
	jmp loc_02a7ea

;==============================================
;Kouga
;==============================================
loc_058886:
	move.b (7,a6),d0
	move.w loc_058892(pc,d0.w),d1
	jmp loc_058892(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058892:
	dc.w loc_0588a8-loc_058892
	dc.w loc_0588d6-loc_058892
	dc.w loc_058900-loc_058892
	dc.w loc_0589ae-loc_058892
	dc.w loc_058a08-loc_058892
	dc.w loc_058ad6-loc_058892
	dc.w loc_058b4a-loc_058892
	dc.w loc_058cce-loc_058892

	dc.w loc_058d22-loc_058892
	dc.w loc_058e7e-loc_058892
	dc.w loc_058ee4-loc_058892

;----------------------------------------------
loc_0588a8:
	addq.b #2,(7,a6)
	move.b #1,($216,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.w #$5c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0588d6:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0588fe
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0588f0
	moveq #1,d0

loc_0588f0:
	move.b d0,($ab,a6)
	moveq #-$35,d0
	moveq #$37,d1
	jmp loc_082e36

loc_0588fe:
	rts

;----------------------------------------------
loc_058900:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.b loc_058964
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($86,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	add.b d0,d0
	tst.b ($3f,a6)
	bne.b loc_05892c
	move.b ($82,a6),d0

loc_05892c:
	move.b loc_058966(pc,d0.w),($87,a6)
	move.b loc_058966+1(pc,d0.w),(pl_invinciblity_timer,a6)
	lsl.w #3,d0
	move.l loc_05896e(pc,d0.w),d1
	move.l loc_05896e+4(pc,d0.w),d2
	move.l loc_05896e+8(pc,d0.w),($44,a6)
	move.l loc_05896e+$c(pc,d0.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_058958
	neg.l d1
	neg.l d2

loc_058958:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	clr.b ($85,a6)

loc_058964:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058966:
	dc.b $01,$04
	dc.b $02,$06
	dc.b $03,$08
	dc.b $01,$00

loc_05896e:
	dc.l $000a0000,$00000000,$fffb0000,$ffffa000
	dc.l $000b0000,$00000000,$fffa0000,$ffffa000
	dc.l $000c0000,$00000000,$fff90000,$ffffa000
	dc.l $000a0000,$00000000,$fffb0000,$ffffa000

;----------------------------------------------
loc_0589ae:
	bsr.w loc_058efe
	bsr.w loc_0594c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058a02
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_0589f4
	jsr loc_02af7a
	bne.b loc_0589f4
	addq.b #2,(7,a6)
	moveq #$5f,d0
	jmp Set_Char_Special_Ani

loc_0589f4:
	addq.b #2,(7,a6)
	move.w #$82,d0
	jmp Set_Char_Special_Ani

loc_058a02:
	jmp loc_02a7ea

;----------------------------------------------
loc_058a08:
	bsr.w loc_058efe
	tst.b ($33,a6)
	bpl.w loc_058ad0
	move.b #1,($31,a6)
	eori.b #1,(PL_Flip,a6)
	move.b ($85,a6),d1
	tst.b (PL_cpucontrol,a6)
	beq.b loc_058a2e
	bsr.w loc_058f30

loc_058a2e:
	tst.b d1
	beq.b loc_058a96
	move.b #1,(PL_Flip,a6)
	btst #4,d1
	bne.b loc_058a96
	clr.b (PL_Flip,a6)
	btst #6,d1
	bne.b loc_058a96
	addq.b #6,(7,a6)
	clr.b ($85,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),d3
	sub.l ($10,a6),d3
	moveq #$1a,d2
	jsr loc_01bb9c
	move.l d3,($40,a6)
	move.l #0,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #0,d0
	tst.b ($40,a6)
	bmi.b loc_058a8a
	moveq #1,d0

loc_058a8a:
	move.b d0,(PL_Flip,a6)
	moveq #$62,d0
	jmp Set_Char_Special_Ani

loc_058a96:
	addq.b #2,(7,a6)
	clr.b ($85,a6)
	move.l #$90000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_058ab0
	neg.l d0
	neg.l d1

loc_058ab0:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$a0000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	moveq #$60,d0
	jmp Set_Char_Special_Ani

loc_058ad0:
	jmp loc_02a7ea

;----------------------------------------------
loc_058ad6:
	bsr.w loc_058efe
	bsr.w loc_0594c2
	bpl.b loc_058b0c
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058b0c
	move.b #$14,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	move.w #$82,d0
	jmp Set_Char_Special_Ani

loc_058b0c:
	move.w ($64,a6),d0
	addi.w #$48,d0
	cmp.w ($14,a6),d0
	bcc.b loc_058b44
	move.b (PL_Flip,a6),d0
	eori.b #1,d0
	btst d0,($ac,a6)
	beq.b loc_058b44
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	jsr loc_00369c
	moveq #$61,d0
	jmp Set_Char_Special_Ani

loc_058b44:
	jmp loc_02a7ea

;----------------------------------------------
loc_058b4a:
	bsr.w loc_058efe
	tst.b ($33,a6)
	bpl.w loc_058c08
	addq.b #6,(7,a6)
	moveq #0,d1
	move.b ($85,a6),d1
	tst.b (PL_cpucontrol,a6)
	beq.b loc_058ba2
	lea.l loc_059710(pc),a1
	jsr loc_030a66
	beq.b loc_058b9e
	jsr loc_01bd5c
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a3),d0
	move.w #$40,d1
	cmpi.w #$100,d0
	bcc.b loc_058ba2
	move.w #$20,d1
	cmpi.w #$80,d0
	bcc.b loc_058ba2
	move.w #$10,d1
	bra.b loc_058ba2

loc_058b9e:
	bsr.w loc_058f30

loc_058ba2:
	bsr.w loc_058f1a
	moveq #0,d0
	btst #6,d1
	bne.b loc_058bb8
	moveq #2,d0
	btst #4,d1
	bne.b loc_058bb8
	moveq #1,d0

loc_058bb8:
	move.w d0,d1
	lsl.w #4,d1
	moveq #0,d2
	move.b ($82,a6),d2
	lsl.w #5,d2
	add.w d2,d1
	moveq #0,d3
	move.b ($86,a6),d3
	lsl.w #2,d3
	add.w d3,d2
	addq.b #1,($86,a6)
	move.l loc_058c0e(pc,d1.w),d3
	move.l loc_058c0e+4(pc,d1.w),d4
	move.l loc_058c0e+8(pc,d1.w),($44,a6)
	move.l loc_058c0e+$c(pc,d1.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_058bf2
	neg.l d3
	neg.l d4

loc_058bf2:
	clr.b ($85,a6)
	move.l d3,($40,a6)
	move.l d4,($48,a6)
	add.w loc_058c3e+2(pc,d2.w),d0
	jmp Set_Char_Special_Ani

loc_058c08:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058c0e:
	dc.l $00048000,$00000000,$fffdc000,$ffffc000
	dc.l $000a0000,$00000000,$fffe0000,$ffffb000
	dc.l $000c8000,$00000000,$fffe8000,$ffffde00

loc_058c3e:
	dc.w $0000,$0064,$0000,$005c,$0000,$005c,$0000,$005c

loc_058c4e:
	dc.l $00048000,$00000000,$fffdc000,$ffffc000
	dc.l $000a0000,$00000000,$fffe0000,$ffffb000
	dc.l $000c8000,$00000000,$fffe8000,$ffffde00

loc_058c7e:
	dc.w $0000,$0069,$0000,$006e,$0000,$005c,$0000,$005c

loc_058c8e:
	dc.l $00048000,$00000000,$fffdc000,$ffffc000
	dc.l $000a0000,$00000000,$fffe0000,$ffffb000
	dc.l $000c8000,$00000000,$fffe8000,$ffffde00

loc_058cbe:
	dc.w $0000,$0073,$0000,$0078,$0000,$007d,$0000,$005c

;----------------------------------------------
loc_058cce:
	bsr.w loc_058efe
	bsr.w loc_0594c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058d00
	move.b #8,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$5f,d0
	jmp Set_Char_Special_Ani

loc_058d00:
	addi.w #$8a,d0
	cmp.w ($14,a6),d0
	bhi.b loc_058d1c
	addq.b #2,(7,a6)
	jsr loc_00369c
	moveq #$63,d0
	jmp Set_Char_Special_Ani

loc_058d1c:
	jmp loc_02a7ea

;----------------------------------------------
loc_058d22:
	bsr.w loc_058efe
	tst.b ($33,a6)
	bpl.w loc_058de8
	addq.b #2,(7,a6)
	move.b ($85,a6),d1
	tst.b (PL_cpucontrol,a6)
	beq.b loc_058d72
	lea.l loc_059710(pc),a1
	jsr loc_030a66
	beq.b loc_058d6e
	move.w #$10,d1
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	bcs.b loc_058d5e
	move.w #$40,d1

loc_058d5e:
	addi.w #$10,d0
	cmpi.w #$20,d0
	bhi.b loc_058d72
	move.w #$20,d1
	bra.b loc_058d72

loc_058d6e:
	bsr.w loc_058f30

loc_058d72:
	moveq #1,d0
	andi.w #$70,d1
	beq.b loc_058d92
	btst #5,d1
	bne.b loc_058d92
	moveq #0,d0
	move.b d0,(PL_Flip,a6)
	btst #4,d1
	bne.b loc_058d92
	move.b #1,(PL_Flip,a6)

loc_058d92:
	clr.b ($85,a6)
	move.w d0,d1
	lsl.w #4,d1
	moveq #0,d2
	move.b ($82,a6),d2
	move.w d2,d3
	lsl.w #3,d3
	lsl.w #4,d2
	add.w d3,d2
	add.w d2,d1
	moveq #0,d3
	move.b ($86,a6),d3
	lsl.w #2,d3
	add.w d3,d2
	addq.b #1,($86,a6)
	move.l loc_058dee(pc,d1.w),d3
	move.l loc_058dee+4(pc,d1.w),d4
	move.l loc_058dee+8(pc,d1.w),($44,a6)
	move.l loc_058dee+$c(pc,d1.w),($4c,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_058dd6
	neg.l d3
	neg.l d4

loc_058dd6:
	move.l d3,($40,a6)
	move.l d4,($48,a6)
	add.w loc_058e0e+2(pc,d2.w),d0
	jmp Set_Char_Special_Ani

loc_058de8:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058dee:
	dc.l $00028000,$00000000,$ffff8000,$ffffa000
	dc.l $00000000,$00000000,$ffff8000,$ffffa000

loc_058e0e:
	dc.w $0000,$0067,$0000,$005c,$0000,$005c,$0000,$005c

loc_058e1e:
	dc.l $00028000,$00000000,$ffff8000,$ffffa000
	dc.l $00000000,$00000000,$ffff8000,$ffffa000

loc_058e3e:
	dc.w $0000,$006c,$0000,$0071,$0000,$005c,$0000,$005c

loc_058e4e:
	dc.l $00028000,$00000000,$ffff8000,$ffffa000
	dc.l $00000000,$00000000,$ffff8000,$ffffa000

loc_058e6e:
	dc.w $0000,$0076,$0000,$007b,$0000,$0080,$0000,$005c

;----------------------------------------------
loc_058e7e:
	bsr.w loc_058efe
	bsr.w loc_0594c2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_058ede
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	move.b ($87,a6),d0
	cmp.b ($86,a6),d0
	bls.b loc_058ed0
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_058ed0
	jsr loc_02af7a
	bne.b loc_058ed0
	move.b #8,(7,a6)
	moveq #$5f,d0
	jmp Set_Char_Special_Ani

loc_058ed0:
	addq.b #2,(7,a6)
	move.w #$82,d0
	jmp Set_Char_Special_Ani

loc_058ede:
	jmp loc_02a7ea

;----------------------------------------------
loc_058ee4:
	tst.b ($33,a6)
	bpl.b loc_058ef8
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_058ef8:
	jmp loc_02a7ea

;==============================================
loc_058efe:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_058f18
	tst.b ($85,a6)
	bne.b loc_058f18
	move.b ($378,a6),d0
	beq.b loc_058f18
	andi.w #$70,d0
	move.b d0,($85,a6)

loc_058f18:
	rts

;==============================================
loc_058f1a
	tst.b (PL_Flip,a6)
	beq.b loc_058f26
	lsr.b #4,d1
	move.b loc_058f28(pc,d1.w),d1

loc_058f26:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058f28:
	dc.b $00,$40,$20,$60,$10,$50,$30,$70

;==============================================
loc_058f30:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_058f40(pc,d0.w),d1
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058f40:
	dc.b $10,$10,$10,$10,$20,$20,$20,$20
	dc.b $40,$40,$40,$40,$10,$20,$20,$40

;==============================================
;Stance Change
;==============================================
loc_058f50:
	jmp loc_02b7b8

;==============================================
;Taunt
;==============================================
loc_058f56:
	move.b (7,a6),d0
	move.w loc_058f62(pc,d0.w),d1
	jmp loc_058f62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058f62:
	dc.w loc_058f66-loc_058f62
	dc.w loc_058f8c-loc_058f62

;----------------------------------------------
loc_058f66:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_058f7a
	subq.b #1,(pl_taunt_count,a6)

loc_058f7a:
	moveq #$d,d0
	cmpi.b #$11,($102,a6)
	beq.b loc_058f86
	addq.w #1,d0

loc_058f86:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_058f8c:
	tst.b ($33,a6)
	bpl.b loc_058f96
	bra.w loc_05953e

loc_058f96:
	jmp loc_02a7ea

;==============================================
;Vism AC
;==============================================
loc_058f9c:
	cmpi.b #$13,($102,a6)
	beq.b loc_058fbe
	tst.b ($33,a6)
	bpl.b loc_058fb8
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_058fb8:
	jmp loc_02a7ea

loc_058fbe:
	move.b (7,a6),d0
	move.w loc_058fca(pc,d0.w),d1
	jmp loc_058fca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_058fca:
	dc.w loc_058fce-loc_058fca
	dc.w loc_058fec-loc_058fca

;----------------------------------------------
loc_058fce:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l #$50000,($40,a6)
	move.l #$ffffd000,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)

;----------------------------------------------
loc_058fec:
	tst.b ($33,a6)
	bpl.b loc_059000
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_059000:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_059010
	bsr.w loc_0594e4

loc_059010:
	move.b ($35,a6),d0
	andi.w #$7f,d0
	beq.b loc_05902c
	andi.b #$80,($35,a6)
	tst.b (PL_Flip,a6)
	bne.b loc_059028
	neg.w d0

loc_059028:
	add.w d0,($10,a6)

loc_05902c:
	rts

;==============================================
;Aism AC
;==============================================
loc_05902e:
	move.b (7,a6),d0
	move.w loc_05903a(pc,d0.w),d1
	jmp loc_05903a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05903a:
	dc.w loc_059040-loc_05903a
	dc.w loc_059094-loc_05903a
	dc.w loc_0590d0-loc_05903a

;----------------------------------------------
loc_059040:
	addq.b #2,(7,a6)
	moveq #0,d0
	cmpi.b #$11,($102,a6)
	beq.b loc_059050
	moveq #$10,d0

loc_059050:
	move.l loc_059074(pc,d0.w),($40,a6)
	move.l loc_059074+4(pc,d0.w),($48,a6)
	move.l loc_059074+8(pc,d0.w),($44,a6)
	move.l loc_059074+$c(pc,d0.w),($4c,a6)
	move.b #1,($31,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059074:
	dc.l $00040000,$ffff8000,$00060000,$ffffc000
	dc.l $00040000,$00000000,$00030000,$ffffc000

;----------------------------------------------
loc_059094:
	tst.b ($35,a6)
	bne.b loc_0590ca
	bsr.w loc_0594e4
	bpl.b loc_0590ca
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0590ca
	addq.b #2,(7,a6)
	moveq #0,d1
	move.w d0,($14,a6)
	move.w d1,($16,a6)
	move.b d1,($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

loc_0590ca:
	jmp loc_02a7ea

;----------------------------------------------
loc_0590d0:
	tst.b ($33,a6)
	bpl.b loc_0590e4
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	bra.w loc_05953e

loc_0590e4:
	jmp loc_02a7ea

;==============================================
;Vism Activate
;==============================================
loc_0590ea:
	move.b (7,a6),d0
	move.w loc_0590f6(pc,d0.w),d1
	jmp loc_0590f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0590f6:
	dc.w loc_0590fc-loc_0590f6
	dc.w loc_05911c-loc_0590f6
	dc.w loc_059140-loc_0590f6

;----------------------------------------------
loc_0590fc:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2f,d0
	tst.b ($31,a6)
	bne.b loc_059116
	moveq #$2b,d0

loc_059116:
	jmp loc_02a708

;----------------------------------------------
loc_05911c:
	tst.b ($34,a6)
	beq.b loc_05913a
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	bsr.w loc_05915a
	bsr.w loc_05918a

loc_05913a:
	jmp loc_02a7ea

;----------------------------------------------
loc_059140:
	subq.b #1,($3a,a6)
	bne.b loc_05913a
	tst.b ($31,a6)
	beq.b loc_059154
	move.l #$02000602,(4,a6)

loc_059154:
	jmp loc_02f796

;==============================================
loc_05915a:
	cmpi.b #$13,($102,a6)
	beq.b loc_059176
	moveq #-3,d0
	moveq #$4f,d1
	tst.b ($31,a6)
	beq.b loc_059170
	moveq #-$d,d0
	moveq #$44,d1

loc_059170:
	jmp loc_097cd6

loc_059176:
	moveq #8,d0
	moveq #$47,d1
	tst.b ($31,a6)
	beq.b loc_059184
	moveq #-$e,d0
	moveq #$47,d1

loc_059184:
	jmp loc_097cd6

;==============================================
loc_05918a:
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
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts

;##############################################
;Throws
;##############################################
loc_0591cc:
	cmpi.b #4,($80,a6)
	beq.w loc_05937c
	move.b ($81,a6),d0
	move.w loc_0591e2(pc,d0.w),d1
	jmp loc_0591e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0591e2:
	dc.w loc_0591e6-loc_0591e2
	dc.w loc_0592b8-loc_0591e2

;==============================================
;Punch Throw
;==============================================
loc_0591e6:
	move.b ($7,a6),d0
	move.w loc_0591f8(pc,d0.w),d1
	jsr loc_0591f8(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0591f8:
	dc.w loc_059200-loc_0591f8
	dc.w loc_059214-loc_0591f8
	dc.w loc_05926e-loc_0591f8
	dc.w loc_0592aa-loc_0591f8

;----------------------------------------------
loc_059200:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_059214:
	tst.b ($33,a6)
	bpl.w loc_0592a4
	addq.b #2,(7,a6)
	move.w #$c0,d0
	jsr loc_02e3fe
	bne.b loc_059238
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp Set_Char_Special_Ani

loc_059238:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_059258
	clr.b (PL_Flip,a6)
	jsr loc_01bd5c
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bhi.b loc_059260
	bra.b loc_059266

loc_059258:
	btst.b #0,($371,a6)
	beq.b loc_059266

loc_059260:
	eori.b #1,(PL_Flip,a6)

loc_059266:
	moveq #3,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_05926e:
	tst.b ($34,a6)
	bne.b loc_059296
	moveq #0,d0
	move.b ($35,a6),d0
	beq.b loc_0592a4
	clr.b ($35,a6)
	addi.w #$c0,d0
	jsr loc_02e970
	bne.b loc_059296
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.b loc_0592a4

loc_059296:
	addq.b #2,(7,a6)
	move.w #$c0,d0
	jsr loc_02e7f2

loc_0592a4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0592aa:
	tst.b ($33,a6)
	bmi.w loc_05953e
	jmp loc_02a7ea

;==============================================
;Kick Throw
;==============================================
loc_0592b8:
	move.b (7,a6),d0
	move.w loc_0592c4(pc,d0.w),d1
	jmp loc_0592c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0592c4:
	dc.w loc_0592cc-loc_0592c4
	dc.w loc_0592e0-loc_0592c4
	dc.w loc_05932c-loc_0592c4
	dc.w loc_05936e-loc_0592c4

;----------------------------------------------
loc_0592cc:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0592e0:
	tst.b ($33,a6)
	bpl.w loc_059352
	addq.b #2,(7,a6)
	move.w #$c3,d0
	jsr loc_02e3fe
	bne.b loc_059304
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp Set_Char_Special_Ani
 
loc_059304:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_059318
	btst.b #1,($371,a6)
	beq.b loc_059318
	eori.b #1,(PL_Flip,a6)

loc_059318:
	eori.b #1,(PL_Flip,a6)
	moveq #4,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

;----------------------------------------------
loc_05932c:
	tst.b ($34,a6)
	beq.b loc_059352
	bmi.b loc_059344
	addq.b #2,(7,a6)
	move.w #$c3,d0
	jsr loc_02e7f2
	bra.b loc_059352

loc_059344:
	clr.b ($34,a6)
	move.w #$c4,d0
	jsr loc_080b70

loc_059352:
	jsr loc_02a7ea
	moveq #0,d0
	move.b ($35,a6),d0
	lsl.w #2,d0
	movea.l loc_059366(pc,d0.w),a0
	jmp (a0)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059366:
	dc.l loc_02f9be,loc_02fa36

;----------------------------------------------
loc_05936e:
	tst.b ($33,a6)
	bmi.w loc_05953e
	jmp loc_02a7ea

;==============================================
;Air Throw
;==============================================
loc_05937c:
	move.b (7,a6),d0
	move.w loc_059388(pc,d0.w),d1
	jmp loc_059388(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059388:
	dc.w loc_059390-loc_059388
	dc.w loc_059404-loc_059388
	dc.w loc_059448-loc_059388
	dc.w loc_0594aa-loc_059388

;----------------------------------------------
loc_059390:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	move.w #$db,d0
	jsr loc_02e636
	bne.b loc_0593c6
	bsr.w loc_0594c2
	bpl.b loc_0593ba
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_059556

loc_0593ba:
	addq.b #4,(7,a6)
	moveq #2,d0
	jmp Set_Char_Special_Ani

loc_0593c6:
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #$ffffb800,($4c,a6)
	tst.l ($44,a6)
	bmi.b loc_0593e2
	move.l d0,($44,a6)

loc_0593e2:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_0593f6
	btst.b #1,($371,a6)
	beq.b loc_0593f6
	eori.b #1,(PL_Flip,a6)

loc_0593f6:
	moveq #5,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

;----------------------------------------------
loc_059404:
	tst.b ($34,a6)
	bne.b loc_05943c
	bsr.w loc_0594c2
	bpl.b loc_05943c
	move.w ($64,a6),d0
	addq.w #8,d0
	cmp.w ($14,a6),d0
	bcs.b loc_05943c
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #6,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_05943c:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_059448:
	move.b ($35,a6),d0
	beq.b loc_059462
	clr.b ($35,a6)
	move.b #$18,($123,a5)
	addi.w #$db,d0
	jsr loc_02e970

loc_059462:
	tst.b ($34,a6)
	beq.b loc_05949e
	addq.b #2,(7,a6)
	move.w #$db,d0
	jsr loc_02e7f2
	move.l #$40000,d0
	moveq #0,d1
	tst.b (PL_Flip,a6)
	beq.b loc_059486
	neg.l d0

loc_059486:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l #$60000,($44,a6)
	move.l #$ffffa000,($4c,a6)

loc_05949e:
	jsr loc_02a7ea
	jmp loc_02fa36

;----------------------------------------------
loc_0594aa:
	bsr.w loc_0594c2
	bpl.b loc_0594bc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.w loc_059556

loc_0594bc:
	jmp loc_02a7ea

;==============================================
loc_0594c2:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_0594e4:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_0594f0
	neg.l d0

loc_0594f0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.b loc_059508
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_059508:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;==============================================
loc_05951a:
	cmpi.b #$11,($102,a6)
	bne.b loc_059530
	btst.b #0,($283,a6)
	bne.b loc_059538

loc_05952a:
	jmp SPButton_AllK_code

loc_059530:
	btst.b #0,($283,a6)
	bne.b loc_05952a

loc_059538:
	jmp SPButton_AllP_code

;==============================================
loc_05953e:
	tst.b (pl_crouching,a6)
	bne.b loc_05954a
	jmp loc_02baf2

;==============================================
loc_05954a:
	tst.b (pl_crouching,a6)
	beq.b loc_05953e
	jmp loc_02bb26

;==============================================
loc_059556:
	jmp loc_02bd64

;==============================================
loc_05955c:
	jmp loc_02a7ea

;==============================================
loc_059562:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_05956e
	neg.l d0

loc_05956e:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_05957c:
	bsr.b loc_059562
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059590:
	dc.l $003fffff,$003fffff,$007fffff,$007fffff
	dc.l $007fffff,$00ffffff,$00ffffff,$00ffffff
	dc.l $01ffffff,$01ffffff,$01ffffff,$03ffffff
	dc.l $03ffffff,$03ffffff,$07ffffff,$07ffffff
	dc.l $07ffffff,$0fffffff,$0fffffff,$0fffffff
	dc.l $1fffffff,$1fffffff,$1fffffff,$3fffffff
	dc.l $3fffffff,$3fffffff,$7fffffff,$7fffffff
	dc.l $7fffffff,$ffffffff,$ffffffff,$ffffffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059610:
	dc.l $000003ff,$000003ff,$000003ff,$000003ff
	dc.l $000003ff,$000007ff,$000007ff,$000007ff
	dc.l $000007ff,$00000fff,$00000fff,$00000fff
	dc.l $00000fff,$00001fff,$00001fff,$00001fff
	dc.l $00003fff,$00003fff,$00003fff,$00007fff
	dc.l $00007fff,$0000ffff,$0000ffff,$0001ffff
	dc.l $0001ffff,$0003ffff,$0007ffff,$000fffff
	dc.l $003fffff,$00ffffff,$07ffffff,$3fffffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059690:
	dc.l $00000000,$0000000f,$000000ff,$00000fff
	dc.l $00007fff,$0003ffff,$000fffff,$003fffff
	dc.l $007fffff,$00ffffff,$01ffffff,$01ffffff
	dc.l $03ffffff,$03ffffff,$07ffffff,$07ffffff
	dc.l $07ffffff,$0fffffff,$0fffffff,$0fffffff
	dc.l $1fffffff,$1fffffff,$1fffffff,$1fffffff
	dc.l $3fffffff,$3fffffff,$3fffffff,$3fffffff
	dc.l $7fffffff,$7fffffff,$7fffffff,$7fffffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_059710:
	dc.l $ffffffff,$3fffffff,$0fffffff,$03ffffff
	dc.l $01ffffff,$007fffff,$003fffff,$001fffff
	dc.l $000fffff,$000fffff,$0007ffff,$0007ffff
	dc.l $0003ffff,$0003ffff,$0001ffff,$0001ffff
	dc.l $0001ffff,$0001ffff,$0000ffff,$0000ffff
	dc.l $0000ffff,$00007fff,$00007fff,$00007fff
	dc.l $00003fff,$00003fff,$00001fff,$00001fff
	dc.l $00000fff,$000007ff,$000003ff,$000001ff

;##############################################
;
;##############################################
loc_059790:
	dc.w loc_05980e-loc_059790
	dc.w loc_0597d2-loc_059790
	dc.w loc_059796-loc_059790

loc_059796:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02

loc_0597d2:
	dc.b $08,$0a,$08,$0a,$06,$06,$06,$06,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02

loc_05980e:
	dc.b $08,$0a,$08,$0a,$06,$06,$02,$02,$08,$0a,$02,$02,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02

;##############################################
;
;##############################################
loc_05984a:
	dc.w loc_0598d0-loc_05984a
	dc.w loc_059890-loc_05984a
	dc.w loc_059850-loc_05984a

loc_059850:
	dc.b $09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$09,$0b,$09,$0b,$02,$02,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_059890:
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_0598d0:
	dc.b $08,$0a,$08,$0a,$06,$06,$02,$02,$08,$0a,$02,$02,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$02,$02,$02,$02,$08,$0a,$08,$0a,$02,$02,$08,$0a
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02