;##############################################
;
;##############################################
loc_041270:
	jsr loc_01c368
	beq.b loc_04128c
	move.l #$1000700,(a4)
	move.w a6,($36,a4)
	move.w a4,($28,a6)
	move.b ($102,a6),(3,a4)

loc_04128c:
	rts

;##############################################
;
;##############################################
loc_04128e:
	move.b (7,a6),d0
	move.w loc_04129a(pc,d0.w),d1
	jmp loc_04129a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04129a:
	dc.w loc_0412b8-loc_04129a
	dc.w loc_0412e4-loc_04129a
	dc.w loc_041338-loc_04129a
	dc.w loc_041382-loc_04129a
	dc.w loc_041390-loc_04129a
	dc.w loc_0413d6-loc_04129a
	dc.w loc_04141c-loc_04129a
	dc.w loc_04142e-loc_04129a

	dc.w loc_041474-loc_04129a
	dc.w loc_041488-loc_04129a
	dc.w loc_0414ba-loc_04129a
	dc.w loc_0414e8-loc_04129a
	dc.w loc_041514-loc_04129a
	dc.w loc_041544-loc_04129a
	dc.w loc_041572-loc_04129a

;==============================================
loc_0412b8:
	movea.w ($38,a6),a4
	cmpi.b #Cody_id,(PL_charid,a4)
	bne.b loc_0412d6
	tst.b (PL_cpucontrol,a6)
	sne.b d0
	tst.b (PL_cpucontrol,a4)
	sne.b d1
	eor.b d0,d1
	bmi.w loc_04142e

loc_0412d6:
	jsr RNGFunction
	andi.w #1,d0
	bne.w loc_041390

;==============================================
loc_0412e4:
	move.b #4,(7,a6)
	move.b #1,($31,a6)
	move.w #$ff70,d0
	tst.b ($101,a6)
	beq.b loc_0412fc
	neg.w d0

loc_0412fc:
	add.w d0,($10,a6)
	addi.w #$38,($14,a6)
	move.l #$40000,($40,a6)
	move.l #0,($48,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffd600,($4c,a6)
	bsr.w loc_042fc4
	jsr loc_00382c
	moveq #$38,d0
	jmp loc_02a708

;==============================================
loc_041338:
	bsr.w loc_042f04
	bpl.b loc_041378
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_041378
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_01bd5c
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_041370
	move.w #$120,d0

loc_041370:
	add.w ($10,a3),d0
	move.w d0,($10,a6)

loc_041378:
	tst.b ($35,a6)
	beq.w loc_042f54
	rts

;==============================================
loc_041382:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jmp loc_02baf2

;==============================================
loc_041390:
	move.b #$a,(7,a6)
	clr.b (1,a6)
	move.w #$ff70,d0
	tst.b ($101,a6)
	beq.b loc_0413a6
	neg.w d0

loc_0413a6:
	add.w d0,($10,a6)
	move.l #$80000,($40,a6)
	move.l #0,($48,a6)
	jsr loc_01bd5c
	move.w ($10,a3),($4e,a6)
	st.b ($3a,a6)
	bsr.w loc_042fa2
	moveq #$39,d0
	jmp loc_02a708

;==============================================
loc_0413d6:
	bsr.w loc_042eea
	move.w ($10,a6),d0
	sub.w ($4e,a6),d0
	subi.w #$60,d0
	cmpi.w #$c0,d0
	bhi.w loc_042f54
	addq.b #2,(7,a6)
	move.b #1,(1,a6)
	moveq #$60,d0
	tst.b ($101,a6)
	beq.b loc_041404
	move.w #$120,d0

loc_041404:
	add.w ($4e,a6),d0
	move.w d0,($10,a6)
	moveq #$8,d0
	jsr loc_0038e4
	moveq #$3a,d0
	jmp loc_02a708

;==============================================
loc_04141c:
	tst.b ($33,a6)
	bpl.w loc_042f54
	clr.w ($4e,a6)
	jmp loc_02baf2

;==============================================
loc_04142e:
	move.b #$10,(7,a6)
	move.w ($10,a6),($1d6,a6)
	move.w #$ffe0,d0
	tst.b ($101,a6)
	beq.b loc_041446
	neg.w d0

loc_041446:
	add.w d0,($10,a6)
	bsr.w loc_042fe2
	moveq #0,d0
	move.l d0,($44,a6)
	move.b d0,($a,a6)
	move.b #$78,($3a,a6)
	moveq #$24,d0
	jsr loc_02a708
	movea.l ($1c,a6),a0
	adda.w #$28,a0
	move.l a0,($1c,a6)
	rts

;==============================================
loc_041474:
	subq.b #1,($3a,a6)
	bpl.w loc_04128c
	addq.b #2,(7,a6)
	moveq #$13,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_041488:
	jsr loc_02a7ea
	movea.l ($1c,a6),a0
	tst.b (9,a0)
	beq.w loc_0414b8
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$20000,($44,a6)
	move.l #$fffff000,($4c,a6)
	clr.b ($3b,a6)

loc_0414b8:
	rts

;==============================================
loc_0414ba:
	bsr.w loc_042f6a
	bsr.w loc_042f06
	bpl.b loc_0414d8
	addq.b #2,(7,a6)
	st.b ($a,a6)
	move.b #$18,($3b,a6)
	jsr loc_00382c

loc_0414d8:
	addq.b #1,($3a,a6)
	andi.b #1,($3a,a6)
	bne.w loc_042f54
	rts

;==============================================
loc_0414e8:
	subq.b #1,($3b,a6)
	bpl.w loc_042f54
	tst.b ($35,a6)
	beq.w loc_042f54
	addq.b #2,(7,a6)
	move.l #0,($44,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #$16,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_041514:
	bsr.w loc_042f06
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #$18,($3a,a6)
	moveq #$19,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_041544:
	tst.b ($33,a6)
	bpl.w loc_042f54
	subq.b #1,($3a,a6)
	bpl.w loc_042f54
	addq.b #2,(7,a6)
	move.l #$28000,d0
	tst.b ($101,a6)
	beq.b loc_041566
	neg.l d0

loc_041566:
	move.l d0,($40,a6)
	moveq #2,d0
	jmp loc_02a708

;==============================================
loc_041572:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($1d6,a6),d1
	sub.w ($10,a6),d1
	eor.w d0,d1
	bpl.w loc_042f54
	move.l #$2000000,(4,a6)
	move.w #$90,($50,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_04159e:
	move.b ($2c4,a6),d0
	move.w loc_0415aa(pc,d0.w),d1
	jmp loc_0415aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0415aa:
	dc.w loc_0415b8-loc_0415aa
	dc.w loc_0415da-loc_0415aa
	dc.w loc_0415da-loc_0415aa
	dc.w loc_0415da-loc_0415aa
	dc.w loc_0415da-loc_0415aa
	dc.w loc_0415da-loc_0415aa
	dc.w loc_0415da-loc_0415aa

;==============================================
loc_0415b8:
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_0415ca(pc,d0.w),($2c4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0415ca:
	dc.b $02,$04,$02,$04,$02,$04,$02,$04
	dc.b $02,$04,$02,$04,$02,$04,$02,$04

;==============================================
loc_0415da:
	move.b (7,a6),d0
	move.w loc_0415e6(pc,d0.w),d1
	jmp loc_0415e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0415e6:
	dc.w loc_0415ee-loc_0415e6
	dc.w loc_041606-loc_0415e6
	dc.w loc_04163a-loc_0415e6
	dc.w loc_04164c-loc_0415e6


;----------------------------------------------
loc_0415ee:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_041606:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_042f54
	tst.b ($11c,a5)
	bne.w loc_042f54
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($2c4,a6),d0
	move.w loc_04162a(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04162a:
	dc.w $0023,$0023,$0024,$0025
	dc.w $0026,$0027,$0025,$0023

;----------------------------------------------
loc_04163a:
	subq.b #1,($3a,a6)
	bpl.b loc_04164c
	addq.b #2,(7,a6)
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

;----------------------------------------------
loc_04164c:
	jmp loc_02a7ea

;##############################################
;
;##############################################
loc_041652:
	tst.b ($80,a6)
	bne.w loc_041964
	clr.b (pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_04189c
	move.b (7,a6),d0
	move.w loc_041672(pc,d0.w),d1
	jmp loc_041672(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041672:
	dc.w loc_04167c-loc_041672
	dc.w loc_041770-loc_041672
	dc.w loc_041840-loc_041672
	dc.w loc_041866-loc_041672
	dc.w loc_041884-loc_041672

;==============================================
loc_04167c:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b d0,($5b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($82,a6)
	beq.b loc_041708
	tst.b ($257,a6)
	bne.b loc_0416cc
	cmpi.b #2,($82,a6)
	bne.b loc_0416dc
	btst.b #1,($83,a6)
	beq.b loc_0416dc
	move.b #4,(7,a6)
	moveq #$1e,d0
	jmp Set_Spec_Cancel_Timers

loc_0416cc:
	cmpi.b #2,($82,a6)
	bne.b loc_0416dc
	moveq #3,d0
	jmp Set_Spec_Cancel_Timers

loc_0416dc:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0416ec
	btst.b #1,($83,a6)
	bne.b loc_041700
	bra.b loc_04170e

loc_0416ec:
	cmpi.b #4,($82,a6)
	bne.w loc_04170e
	cmpi.b #7,($1d0,a6)
	bne.w loc_04170e

loc_041700:
	moveq #$22,d0
	jmp Set_Spec_Cancel_Timers

loc_041708:
	move.b #1,($1d0,a6)

loc_04170e:
	moveq #1,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_041728
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_041728
	btst.b #0,($83,a6)
	bne.b loc_041738
	bra.b loc_04173a

loc_041728:
	move.b ($82,a6),d1
	ext.w d1
	move.w loc_041744(pc,d1.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcs.b loc_04173a

loc_041738:
	moveq #0,d0

loc_04173a:
	add.b ($82,a6),d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041744:
	dc.w $0030,$0018,$0040

;----------------------------------------------
loc_04174a:
	jsr loc_03071c
	beq.b loc_04176a
	tst.b ($82,a6)
	beq.b loc_041766
	moveq #-$18,d0
	tst.b (PL_Flip,a6)
	beq.b loc_041762
	neg.w d0

loc_041762:
	add.w d0,($10,a6)

loc_041766:
	clr.b (7,a6)

loc_04176a:
	jmp loc_02a7ea

;==============================================
loc_041770:
	tst.b ($33,a6)
	bmi.w loc_041836
	tst.b (PL_cpucontrol,a6)
	bne.b loc_04174a
	tst.b ($35,a6)
	bpl.b loc_04178e
	jsr loc_02ec28
	bne.w loc_041828

loc_04178e:
	cmpi.b #7,($1d0,a6)
	bne.b loc_041800
	cmpi.b #4,($82,a6)
	bne.b loc_041800
	btst.b #6,($378,a6)
	beq.b loc_041800
	tst.b ($5b,a6)
	beq.b loc_041800
	btst.b #2,($83,a6)
	beq.b loc_0417d2
	tst.b (PL_ism_choice,a6)
	bpl.b loc_041800
	moveq #$67,d0
	jsr loc_02e3e0
	beq.b loc_0417d2
	move.b #6,(7,a6)
	moveq #$31,d0
	jmp Set_Char_Special_Ani

loc_0417d2:
	move.b #4,(7,a6)
	move.b #2,($81,a6)

loc_0417de:
	jsr loc_02f770
	moveq #-$20,d0
	tst.b (PL_Flip,a6)
	beq.b loc_0417ee
	neg.w d0

loc_0417ee:
	add.w d0,($10,a6)
	jsr loc_02aebc
	moveq #$23,d0
	jmp Set_Spec_Cancel_Timers

loc_041800:
	jsr loc_02eb06
	beq.b loc_041830
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	bset.b d0,($1d0,a6)
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_041828
	moveq #-$18,d0
	tst.b (PL_Flip,a6)
	beq.b loc_041824
	neg.w d0

loc_041824:
	add.w d0,($10,a6)

loc_041828:
	st.b ($257,a6)
	clr.b (7,a6)

loc_041830:
	jmp loc_02a7ea

loc_041836:
	clr.b ($1d0,a6)
	jmp loc_02baf2

;==============================================
loc_041840:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.b loc_041836
	moveq #0,d1
	move.b ($35,a6),d1
	beq.b loc_041864
	tst.b (PL_Flip,a6)
	bne.b loc_04185c
	neg.w d1

loc_04185c:
	add.w d1,($10,a6)
	clr.b ($35,a6)

loc_041864:
	rts

;==============================================
loc_041866:
	tst.b ($35,a6)
	beq.b loc_041878
	addq.b #2,(7,a6)
	moveq #$67,d0
	jsr loc_02e7f2

loc_041878:
	jsr loc_02a7ea
	jmp loc_02f9be

;==============================================
loc_041884:
	tst.b ($33,a6)
	bpl.w loc_042f54
	eori.b #1,(PL_Flip,a6)
	clr.b ($1d0,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_04189c
	move.b (7,a6),d0
	move.w loc_0418a8(pc,d0.w),d1
	jmp loc_0418a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0418a8:
	dc.w loc_0418ae-loc_0418a8
	dc.w loc_041932-loc_0418a8
	dc.w loc_041938-loc_0418a8

;----------------------------------------------
loc_0418ae:
	addq.b #2,(7,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b d0,($1d0,a6)
	move.b d0,($5b,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	cmpi.b #4,($82,a6)
	bne.b loc_0418f6
	move.b #4,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_0418f6
	btst.b #1,($83,a6)
	bne.w loc_0417de

loc_0418f6:
	moveq #6,d0
	tst.b (PL_cpucontrol,a6)
	bne.b loc_041910
	cmpi.b #1,(PL_ism_choice,a6)
	bne.b loc_041910
	btst.b #0,($83,a6)
	bne.b loc_041922
	bra.b loc_041920

loc_041910:
	move.b ($82,a6),d1
	ext.w d1
	move.w loc_04192c(pc,d1.w),d1
	cmp.w (pl_dist_away,a6),d1
	bcc.b loc_041922

loc_041920:
	moveq #7,d0

loc_041922:
	add.b ($82,a6),d0
	jmp Set_Spec_Cancel_Timers

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04192c:
	dc.w $0030,$0020,$0040

;----------------------------------------------
loc_041932:
	jmp loc_02f5ac

;----------------------------------------------
loc_041938:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_041952
	moveq #-$1c,d0
	tst.b (PL_Flip,a6)
	beq.b loc_04194e
	neg.w d0

loc_04194e:
	add.w d0,($10,a6)

loc_041952:
	tst.b ($33,a6)
	bpl.w loc_04128c
	clr.b ($1d0,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_041964:
	move.b #1,(pl_crouching,a6)
	tst.b ($81,a6)
	bne.w loc_0419bc
	move.b (7,a6),d0
	move.w loc_04197e(pc,d0.w),d1
	jmp loc_04197e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04197e:
	dc.w loc_041982-loc_04197e
	dc.w loc_0419b6-loc_04197e

;----------------------------------------------
loc_041982:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b d0,($1d0,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #$18,d0
	add.b ($82,a6),d0
	lsr.w #1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_0419b6:
	jmp loc_02f5ac

;==============================================
;
;==============================================
loc_0419bc:
	move.b (7,a6),d0
	move.w loc_0419c8(pc,d0.w),d1
	jmp loc_0419c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0419c8:
	dc.w loc_0419d2-loc_0419c8
	dc.w loc_041a4e-loc_0419c8
	dc.w loc_041a54-loc_0419c8
	dc.w loc_041a7a-loc_0419c8
	dc.w loc_041aa8-loc_0419c8

;----------------------------------------------
loc_0419d2:
	addq.b #2,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b d0,($1d0,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	cmpi.b #4,($82,a6)
	bne.b loc_041a40
	tst.b ($257,a6)
	bne.b loc_041a40
	btst.b #1,($83,a6)
	bne.b loc_041a2c
	move.b #4,(7,a6)
	move.l #$90000,($40,a6)
	move.l #$ffff8000,($48,a6)
	moveq #$11,d0
	jmp Set_Spec_Cancel_Timers

loc_041a2c:
	move.b #6,(7,a6)
	move.b #1,($31,a6)
	moveq #$1f,d0
	jmp Set_Spec_Cancel_Timers

loc_041a40:
	moveq #$1e,d0
	add.b ($82,a6),d0
	lsr.w #1,d0
	jmp Set_Spec_Cancel_Timers

;----------------------------------------------
loc_041a4e:
	jmp loc_02f5ac

;----------------------------------------------
loc_041a54:
	tst.b ($33,a6)
	bmi.w loc_042f4e
	tst.b ($35,a6)
	beq.b loc_041a74
	bsr.w loc_042eea
	bpl.b loc_041a74
	move.b #1,($32,a6)
	jsr loc_02a7ea

loc_041a74:
	jmp loc_02a7ea

;----------------------------------------------
loc_041a7a:
	tst.b ($35,a6)
	beq.b loc_041aa2
	addq.b #2,(7,a6)
	move.l #$fffd8000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$58000,($44,a6)
	move.l #$ffffb000,($4c,a6)

loc_041aa2:
	jmp loc_02a7ea

;----------------------------------------------
loc_041aa8:
	bsr.w loc_042f04
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	move.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	moveq #$20,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;
;##############################################
loc_041ad8:
	move.b #6,(7,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #4,($80,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	bne.b loc_041b16
	cmpi.b #2,($82,a6)
	bne.b loc_041b16
	move.b ($83,a6),d0
	andi.w #4,d0
	bne.b loc_041b34

loc_041b16:
	moveq #$24,d0
	tst.b ($3c,a6)
	beq.b loc_041b20
	moveq #$30,d0

loc_041b20:
	tst.b ($81,a6)
	beq.b loc_041b28
	addq.b #6,d0

loc_041b28:
	add.b ($82,a6),d0
	lsr.b #1,d0
	jmp Set_Spec_Cancel_Timers

loc_041b34:
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	moveq #$21,d0
	jmp Set_Spec_Cancel_Timers

;##############################################
;AI Special Move Checks
;##############################################
loc_041b46:
	move.b (pl_move_id,a6),d0
	move.w loc_041b52(pc,d0.w),d1
	jmp loc_041b52(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041b52:
	dc.w loc_041b68-loc_041b52
	dc.w loc_041b68-loc_041b52
	dc.w loc_041b6c-loc_041b52
	dc.w loc_041b68-loc_041b52
	dc.w loc_041b68-loc_041b52
	dc.w loc_041b82-loc_041b52
	dc.w loc_041b68-loc_041b52
	dc.w loc_041bb0-loc_041b52

	dc.w loc_041b68-loc_041b52
	dc.w loc_041b68-loc_041b52
	dc.w loc_041b98-loc_041b52

;==============================================
loc_041b68:
	bra.w loc_041bbc

;==============================================
loc_041b6c:
	tst.b (PL_ism_choice,a6)
	bne.w loc_041bc0
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_041bc0
	bra.w loc_041bbc

;==============================================
loc_041b82:
	tst.b (PL_ism_choice,a6)
	bne.w loc_041bc0
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_041bc0
	bra.w loc_041bbc

;==============================================
loc_041b98:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_041bc0
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_041bc0
	bra.w loc_041bbc

;==============================================
loc_041bb0:
	tst.b (pl_taunt_count,a6)
	beq.w loc_041bc0
	bra.w loc_041bbc

;----------------------------------------------
loc_041bbc:
	moveq #1,d0
	rts

;----------------------------------------------
loc_041bc0:
	moveq #0,d0
	rts

;##############################################
;Special Move Inputs
;##############################################
loc_041bc4:
	jsr SPButton_Vism_code
	bne.w loc_041c4a

loc_041bce:
	lea.l (pl_inp_slot_6,a6),a4
	jsr SpInp_632143214P_Code
	bne.w loc_041cae

loc_041bdc:
	lea.l (pl_inp_slot_0,a6),a4
	jsr SpInp_214K_code
	bne.w loc_041d1c

loc_041bea:
	lea.l (pl_inp_slot_1,a6),a4
	jsr SpInp_23623P_Code
	bne.w loc_041d82

loc_041bf8:
	lea.l (pl_inp_slot_2,a6),a4
	jsr SpInp_23623K_code
	bne.w loc_041d46

loc_041c06:
	lea.l (pl_inp_slot_3,a6),a4
	jsr SpInp_236P_code
	bne.w loc_041dc4

loc_041c14:
	lea.l (pl_inp_slot_4,a6),a4
	jsr SpInp_236K_code
	bne.w loc_041de8

loc_041c22:
	lea.l (pl_inp_slot_5,a6),a4
	jsr SpInp_214P_code
	bne.w loc_041e12

loc_041c30:
	lea.l (pl_inp_slot_a,a6),a4
	jsr SPButton_AlphaCounter_code
	bne.w loc_041e76

loc_041c3e:
	jsr SPButton_Taunt_code
	bne.w loc_041cee

loc_041c48:
	rts

;Move ID Writes
loc_041c4a:
	tst.b ($28a,a6)
	bne.w loc_041bce
	tst.b ($31,a6)
	bne.w loc_041c88
	jsr loc_02ef54
	beq.w loc_041bce
	jsr loc_02ecd8
	beq.w loc_041bce
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f980

loc_041c88:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_041bce
	jsr loc_02ed28
	beq.w loc_041bce
	move.l #$2001000,(4,a6)
	move.b #$10,(pl_move_id,a6)
	jmp loc_02f980

loc_041cae:
	cmpi.b #1,(PL_ism_choice,a6)
	beq.w loc_041bdc
	cmpi.w #$90,(PL_meter,a6)
	bcs.w loc_041bdc
	jsr loc_02ecd8
	beq.w loc_041bdc
	move.l #$2001000,(4,a6)
	move.b #$14,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #4,($248,a6)
	move.b #4,($82,a6)
	rts

loc_041cee:
	tst.b (pl_cc_cancelflag,a6)
	bne.b loc_041cfc
	tst.b (pl_taunt_count,a6)
	beq.w loc_041c48

loc_041cfc:
	jsr loc_02ed00
	beq.w loc_041c48
	move.l #$2000e00,(4,a6)
	move.b #$e,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

loc_041d1c:
	jsr loc_02ed00
	beq.w loc_041bea
	move.l #$2000e00,(4,a6)
	move.b #6,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_041d46:
	tst.b (PL_ism_choice,a6)
	bne.w loc_041c06
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_041c06
	jsr loc_02ecd8
	beq.w loc_041c06
	move.l #$2001000,(4,a6)
	move.b #4,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f4dc

loc_041d82:
	tst.b (PL_ism_choice,a6)
	bne.w loc_041bf8
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_041bf8
	jsr loc_02ecd8
	beq.w loc_041bf8
	move.l #$2001000,(4,a6)
	move.b #$a,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b ($3f,a6),($1d3,a6)
	jmp loc_02f4bc

loc_041dc4:
	jsr loc_02ed00
	beq.w loc_041c14
	move.l #$2000e00,(4,a6)
	move.b #0,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

loc_041de8:
	jsr loc_02ed00
	beq.w loc_041c22
	move.l #$2000e00,(4,a6)
	move.b #2,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f74c

loc_041e12:
	jsr loc_02ed00
	beq.w loc_041c30
	move.l #$2000e00,(4,a6)
	move.b #$12,(pl_move_id,a6)
	move.b #1,(pl_attk_active,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	jmp loc_02f728

;##############################################
;
;##############################################
loc_041e3c:
	move.l #$2000e00,(4,a6)
	move.b #8,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	clr.b (pl_crouching,a6)
	movea.w ($38,a6),a4
	clr.b (pl_hitfreeze,a6)
	move.b #$11,($5f,a4)
	move.b #$15,(pl_invinciblity_timer,a6)
	moveq #6,d0
	jmp Set_Char_Special_Ani

loc_041e76:
	jsr loc_02edf8
	beq.w loc_041c3e

;##############################################
;
;##############################################
loc_041e80:
	tst.b (PL_ism_choice,a6)
	bne.b loc_041e3c
	move.l #$2000e00,(4,a6)
	move.b #$c,(pl_move_id,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	move.b #1,(pl_attk_active,a6)
	move.b #0,(pl_crouching,a6)
	movea.w ($38,a6),a4
	clr.b (pl_hitfreeze,a6)
	move.b #$12,($5f,a4)
	move.b #$16,(pl_invinciblity_timer,a6)
	moveq #5,d0
	jmp Set_Char_Special_Ani

;##############################################
;
;##############################################
loc_041ec2:
	move.b (pl_move_id,a6),d0
	move.w loc_041ece(pc,d0.w),d1
	jmp loc_041ece(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041ece:
	dc.w loc_041ee4-loc_041ece
	dc.w loc_042174-loc_041ece
	dc.w loc_04238a-loc_041ece
	dc.w loc_042516-loc_041ece
	dc.w loc_04263e-loc_041ece
	dc.w loc_042666-loc_041ece
	dc.w loc_04263e-loc_041ece
	dc.w loc_042814-loc_041ece

	dc.w loc_042858-loc_041ece
	dc.w loc_0428dc-loc_041ece
	dc.w loc_0429ea-loc_041ece


;==============================================
;
;==============================================
loc_041ee4:
	move.b (7,a6),d0
	move.w loc_041ef0(pc,d0.w),d1
	jmp loc_041ef0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041ef0:
	dc.w loc_041f00-loc_041ef0
	dc.w loc_041f7c-loc_041ef0
	dc.w loc_041f98-loc_041ef0
	dc.w loc_04206a-loc_041ef0
	dc.w loc_0420c0-loc_041ef0
	dc.w loc_0420ee-loc_041ef0
	dc.w loc_042102-loc_041ef0
	dc.w loc_042136-loc_041ef0

;----------------------------------------------
loc_041f00:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	tst.b ($3e,a6)
	beq.b loc_041f24
	move.b #1,($216,a6)

loc_041f24:
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_041f4c(pc,d0.w),($40,a6)
	move.l loc_041f4c+4(pc,d0.w),($48,a6)
	move.l loc_041f4c+8(pc,d0.w),($44,a6)
	move.l loc_041f4c+$c(pc,d0.w),($4c,a6)
	moveq #7,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_041f4c:
	dc.l $00040000,$00000000,$00080000,$ffffa800
	dc.l $00058000,$00000000,$00070000,$ffffa800
	dc.l $00070000,$00000000,$00068000,$ffffa800

;----------------------------------------------
loc_041f7c:
	tst.b ($35,a6)
	bne.b loc_041f92
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #$a,($3a,a6)

loc_041f92:
	jmp loc_02a7ea

;----------------------------------------------
loc_041f98:
	bsr.w loc_042f04
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_041fd0
	move.b #$e,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$b,d0
	jmp Set_Char_Special_Ani

loc_041fd0:
	tst.b (PL_cpucontrol,a6)
	beq.b loc_042000
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.b loc_041ff2
	tst.b ($2c8,a4)
	bne.b loc_041ff2
	moveq #$62,d0
	jsr loc_02e6ec
	bne.w loc_042030

loc_041ff2:
	subq.b #1,($3a,a6)
	beq.w loc_04214a
	jmp loc_02a7ea

loc_042000:
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	beq.w loc_042f54
	movea.w ($38,a6),a4
	tst.b ($ac,a4)
	bne.w loc_04214a
	tst.b ($2c8,a4)
	bne.w loc_04214a
	moveq #$62,d0
	jsr loc_02e6ec
	beq.w loc_04214a

loc_042030:
	addq.b #2,(7,a6)
	move.l #$20000,($40,a6)
	move.l #0,($48,a6)
	move.l #$40000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	moveq #7,d0
	jsr loc_02ef6c
	moveq #8,d0
	jsr Set_Char_Special_Ani
	jmp loc_02fa36

;----------------------------------------------
loc_04206a:
	tst.b ($35,a6)
	bne.w loc_0420b4
	bsr.w loc_042f04
	bpl.w loc_0420b4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_0420b4
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #$40,($123,a5)
	moveq #$64,d0
	jsr loc_02e970
	moveq #9,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_0420b4:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0420c0:
	tst.b ($35,a6)
	beq.w loc_0420e2
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #$62,d0
	jsr loc_02e7f2
	clr.b ($ce,a6)

loc_0420e2:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_0420ee:
	tst.b ($33,a6)
	bmi.w loc_042f48
	jsr loc_02f6f8
	jmp loc_02a7ea

;----------------------------------------------
loc_042102:
	bsr.w loc_042f06
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$b,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042136:
	tst.b ($33,a6)
	bmi.w loc_042f4e
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_04214a:
	move.b #$c,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffa800,($4c,a6)
	move.b #1,(pl_attk_active,a6)
	moveq #$a,d0
	jmp Set_Char_Special_Ani

;==============================================
;
;==============================================
loc_042174:
	move.b (7,a6),d0
	move.w loc_042180(pc,d0.w),d1
	jmp loc_042180(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042180
	dc.w loc_04218e-loc_042180
	dc.w loc_0421da-loc_042180
	dc.w loc_04221c-loc_042180
	dc.w loc_042232-loc_042180
	dc.w loc_04225a-loc_042180
	dc.w loc_042290-loc_042180
	dc.w loc_0422e0-loc_042180

;----------------------------------------------
loc_04218e:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #5,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.l #$80000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.w #$1e,($3a,a6)
	move.l #$ffff8000,(pl_inp_slot_9,a6)
	moveq #$c,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_0421d4
	moveq #$32,d0

loc_0421d4:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0421da:
	tst.b (PL_cpucontrol,a6)
	bne.b loc_0421ee
	move.b ($378,a6),d0
	andi.w #$70,d0
	bne.w loc_042322
	bra.b loc_042200

loc_0421ee:
	moveq #$30,d0
	tst.b ($82,a6)
	beq.b loc_0421f8
	moveq #$60,d0

loc_0421f8:
	cmp.w (pl_dist_away,a6),d0
	bcc.w loc_042322

loc_042200:
	bsr.w loc_042504
	subq.w #1,($3a,a6)
	beq.w loc_0422f4
	cmpi.w #$20,(pl_dist_away,a6)
	bcs.w loc_0422f4
	jmp loc_02a7ea

;----------------------------------------------
loc_04221c:
	tst.w ($3a,a6)
	beq.b loc_042232
	subq.w #1,($3a,a6)
	move.b ($378,a6),d0
	andi.w #$70,d0
	bne.w loc_042322

;----------------------------------------------
loc_042232:
	tst.b ($33,a6)
	bpl.b loc_042244
	jsr loc_02e35a
	jmp loc_02baf2

loc_042244:
	tst.b ($35,a6)
	bne.b loc_042254
	bsr.w loc_042504
	jmp loc_02a7ea

loc_042254:
	jmp loc_02a7ea

;----------------------------------------------
loc_04225a:
	tst.b ($35,a6)
	bne.b loc_04228a
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$70000,($40,a6)
	move.l #$fffff000,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffff8000,($4c,a6)

loc_04228a:
	jmp loc_02a7ea

;----------------------------------------------
loc_042290:
	bsr.w loc_042504
	bsr.w loc_042f06
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	move.w #$18,d0
	tst.b (PL_Flip,a6)
	bne.b loc_0422cc
	neg.w d0

loc_0422cc:
	add.w d0,($10,a6)
	moveq #$10,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_0422da
	moveq #$36,d0

loc_0422da:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0422e0:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jsr loc_02e35a
	jmp loc_02bb26

;==============================================
loc_0422f4:
	move.b #4,(7,a6)
	tst.b (PL_cpucontrol,a6)
	beq.b loc_042306
	move.b #6,(7,a6)

loc_042306:
	move.l (pl_inp_slot_9,a6),($48,a6)
	move.w #8,($3a,a6)
	moveq #$d,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_04231c
	moveq #$33,d0

loc_04231c:
	jmp Set_Char_Special_Ani

;==============================================
loc_042322:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_042330(pc,d0.w),d1
	jmp loc_042330(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042330:
	dc.w loc_042336-loc_042330
	dc.w loc_042358-loc_042330
	dc.w loc_042374-loc_042330

;----------------------------------------------
loc_042336:
	move.b #6,(7,a6)
	move.l (pl_inp_slot_9,a6),($48,a6)
	move.w #8,($3a,a6)
	moveq #$d,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_042352
	moveq #$33,d0

loc_042352:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042358:
	move.b #6,(7,a6)
	move.b #1,(pl_crouching,a6)
	moveq #$e,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_04236e
	moveq #$34,d0

loc_04236e:
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042374:
	move.b #8,(7,a6)
	moveq #$f,d0
	tst.b (PL_ism_choice,a6)
	bpl.b loc_042384
	moveq #$35,d0

loc_042384:
	jmp Set_Char_Special_Ani

;==============================================
;
;==============================================
loc_04238a:
	move.b (7,a6),d0
	move.w loc_042396(pc,d0.w),d1
	jmp loc_042396(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042396:
	dc.w loc_0423a4-loc_042396
	dc.w loc_0423cc-loc_042396
	dc.w loc_0423f6-loc_042396
	dc.w loc_04242e-loc_042396
	dc.w loc_04248e-loc_042396
	dc.w loc_0424c2-loc_042396
	dc.w loc_0424e8-loc_042396

;----------------------------------------------
loc_0423a4:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_0804da
	move.b #4,($3a,a6)
	moveq #$1b,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0423cc:
	subq.b #1,($3a,a6)
	bne.w loc_04128c
	addq.b #2,(7,a6)
	move.b #$38,($3a,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0423e8
	moveq #1,d0

loc_0423e8:
	move.b d0,($ab,a6)
	moveq #-$28,d0
	moveq #$3c,d1
	jmp loc_082e36

;----------------------------------------------
loc_0423f6:
	subq.b #1,($3a,a6)
	bne.w loc_04128c
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($ab,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_042422
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_042422:
	move.b loc_04242a(pc,d0.w),(pl_invinciblity_timer,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04242a:
	dc.b $04,$08,$0f,00

;----------------------------------------------
loc_04242e:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bmi.w loc_0424b0
	cmpi.w #$3ff,($34,a6)
	beq.b loc_042464
	tst.b ($35,a6)
	beq.w loc_042504
	clr.b ($35,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	bra.w loc_042504

loc_042464:
	addq.b #2,(7,a6)
	move.l #$fffc8000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffff0000,($4c,a6)
	move.b #1,($31,a6)
	rts

;----------------------------------------------
loc_04248e:
	bsr.w loc_042f04
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)

loc_0424b0:
	move.b #$a,(7,a6)
	moveq #$1c,d0
	add.b ($82,a6),d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0424c2:
	tst.b ($35,a6)
	beq.b loc_0424e2
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$e0000,($40,a6)
	move.l #$ffffa000,($48,a6)

loc_0424e2:
	jmp loc_02a7ea

;----------------------------------------------
loc_0424e8:
	bsr.w loc_042504
	tst.b ($33,a6)
	bpl.w loc_042f54
	clr.b ($31,a6)
	jsr loc_02e35a
	jmp loc_02baf2

loc_042504:
	bsr.w loc_042eea
	bpl.b loc_042514
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_042514:
	rts

;==============================================
;
;==============================================
loc_042516:
	move.b (7,a6),d0
	move.w loc_042522(pc,d0.w),d1
	jmp loc_042522(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042522:
	dc.w loc_04252c-loc_042522
	dc.w loc_042552-loc_042522
	dc.w loc_0425ba-loc_042522
	dc.w loc_0425e6-loc_042522
	dc.w loc_042620-loc_042522

;----------------------------------------------
loc_04252c:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #9,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #$22,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042552:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bmi.b loc_042588
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #3,d0
	move.l loc_04258a(pc,d0.w),($40,a6)
	move.l loc_04258a+4(pc,d0.w),($48,a6)
	move.l loc_04258a+8(pc,d0.w),($44,a6)
	move.l loc_04258a+$c(pc,d0.w),($4c,a6)

loc_042588:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04258a:
	dc.l $00040000,$ffffe000,$00048000,$ffffc000
	dc.l $00050000,$ffffd000,$00050000,$ffffc000
	dc.l $00060000,$ffffd000,$00060000,$ffffc000

;----------------------------------------------
loc_0425ba:
	bsr.w loc_042f04
	bpl.w loc_042f54
	tst.b ($35,a6)
	beq.w loc_042f54
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	moveq #$28,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0425e6:
	bsr.w loc_042f06
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($ce,a6)
	jsr loc_00369c
	moveq #$2e,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042620:
	tst.b ($33,a6)
	bpl.b loc_042632
	jsr loc_02e35a
	jmp loc_02baf2

loc_042632:
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_04263e:
	move.b (7,a6),d0
	move.w loc_04264a(pc,d0.w),d1
	jmp loc_04264a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04264a:
	dc.w loc_04264e-loc_04264a
	dc.w loc_042658-loc_04264a

;----------------------------------------------
loc_04264e:
	addq.b #2,(7,a6)
	jsr loc_080e8e

;----------------------------------------------
loc_042658:
	tst.b ($33,a6)
	bmi.w loc_042f48
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_042666:
	move.b (7,a6),d0
	move.w loc_042672(pc,d0.w),d1
	jmp loc_042672(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042672:
	dc.w loc_042680-loc_042672
	dc.w loc_0426a6-loc_042672
	dc.w loc_0426ce-loc_042672
	dc.w loc_04273a-loc_042672
	dc.w loc_042778-loc_042672
	dc.w loc_0427a6-loc_042672
	dc.w loc_0427dc-loc_042672

;----------------------------------------------
loc_042680:
	addq.b #2,(7,a6)
	move.b d0,($1d1,a6)
	move.b d0,($1d2,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$24,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0426a6:
	tst.b ($35,a6)
	beq.b loc_0426c8
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0426ba
	moveq #1,d0

loc_0426ba:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$5c,d1
	jsr loc_082e36

loc_0426c8:
	jmp loc_02a7ea

;----------------------------------------------
loc_0426ce:
	jsr loc_02a7ea
	tst.b ($35,a6)
	bne.w loc_04128c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$a0000,($40,a6)
	move.l #$ffffa000,($48,a6)
	move.l #$90000,($44,a6)
	move.l #$ffff6000,($4c,a6)
	moveq #0,d0
	move.b d0,($ab,a6)
	move.b d0,($5b,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_042722
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_042722:
	move.b loc_042736(pc,d0.w),(pl_invinciblity_timer,a6)
	moveq #$4a,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042736:
	dc.b $04,$06,$08,00

;----------------------------------------------
loc_04273a:
	bsr.w loc_042504
	bsr.w loc_042f06
	tst.b ($35,a6)
	beq.b loc_042772
	tst.b ($5b,a6)
	beq.w loc_0427f0
	addq.b #2,(7,a6)
	move.l #$10000,($40,a6)
	move.l #$10000,($44,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b d0,($5b,a6)

loc_042772:
	jmp loc_02a7ea

;----------------------------------------------
loc_042778:
	tst.b ($33,a6)
	bmi.w loc_0427f0
	tst.b ($35,a6)
	bne.b loc_042794
	bsr.w loc_042504
	bsr.w loc_042f06
	jmp loc_02a7ea

loc_042794:
	tst.b ($5b,a6)
	beq.w loc_0427f0
	clr.b ($5b,a6)
	jmp loc_02a7ea

;----------------------------------------------
loc_0427a6:
	bsr.w loc_042f06
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	jsr loc_00369c
	moveq #$6e,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_0427dc:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jsr loc_02e35a
	jmp loc_02bb26

loc_0427f0:
	move.b #$a,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffaa00,($4c,a6)
	moveq #$21,d0
	jmp loc_02a708

;==============================================
;
;==============================================
loc_042814:
	move.b (7,a6),d0
	move.w loc_042820(pc,d0.w),d1
	jmp loc_042820(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042820:
	dc.w loc_042824-loc_042820
	dc.w loc_04284a-loc_042820

;----------------------------------------------
loc_042824:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_042838
	subq.b #1,(pl_taunt_count,a6)

loc_042838:
	moveq #0,d0
	move.b d0,(pl_attk_active,a6)
	move.b d0,(pl_crouching,a6)
	moveq #$1a,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_04284a:
	tst.b ($33,a6)
	bmi.w loc_042f48
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_042858:
	move.b (7,a6),d0
	move.w loc_042864(pc,d0.w),d1
	jmp loc_042864(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042864:
	dc.w loc_04286a-loc_042864
	dc.w loc_04288a-loc_042864
	dc.w loc_0428c0-loc_042864

;----------------------------------------------
loc_04286a:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_042884
	moveq #$2f,d0

loc_042884:
	jmp loc_02a708

;----------------------------------------------
loc_04288a:
	tst.b ($34,a6)
	beq.w loc_042f54
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #-$1b,d0;e5
	moveq #$69,d1
	tst.b ($31,a6)
	beq.b loc_0428b0
	moveq #-2,d0
	moveq #$4a,d1

loc_0428b0:
	jsr loc_097cd6
	bsr.w loc_042f18
	jmp loc_02a7ea

;----------------------------------------------
loc_0428c0:
	subq.b #1,($3a,a6)
	bne.w loc_042f54
	tst.b ($31,a6)
	beq.b loc_0428d6
	move.l #$2000602,(4,a6)

loc_0428d6:
	jmp loc_02f796

;==============================================
;
;==============================================
loc_0428dc:
	move.b (7,a6),d0
	move.w loc_0428e8(pc,d0.w),d1
	jmp loc_0428e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0428e8:
	dc.w loc_0428ee-loc_0428e8
	dc.w loc_04294c-loc_0428e8
	dc.w loc_042994-loc_0428e8

;----------------------------------------------
loc_0428ee:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #2,d0
	jsr loc_02ef6c
	jsr loc_020674
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_042934(pc,d0.w),($40,a6)
	move.l loc_042934+4(pc,d0.w),($48,a6)
	move.b (PL_Flip,a6),($3c,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #$42,d0
	add.b ($82,a6),d0
	asr.w #1,d0
	jmp Set_Char_Special_Ani

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042934:
	dc.l $00040000,$ffff8000
	dc.l $00080000,$ffff0000
	dc.l $000c0000,$ffff0000

;----------------------------------------------
loc_04294c:
	jsr loc_02a7ea
	bsr.w loc_0429c2
	tst.b ($35,a6)
	bne.b loc_04297a
	addq.b #2,(7,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_04297c(pc,d0.w),($40,a6)
	move.l loc_04297c+4(pc,d0.w),($48,a6)

loc_04297a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04297c:
	dc.l $00040000,$ffff8000
	dc.l $00080000,$ffff0000
	dc.l $00080000,$ffff0000

;----------------------------------------------
loc_042994:
	bsr.w loc_0429c2
	tst.b ($33,a6)
	bpl.b loc_0429aa
	jsr loc_02e35a
	jmp loc_02baf2

loc_0429aa:
	jsr loc_02f6f8
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0429c0
	clr.b ($ce,a6)

loc_0429c0:
	rts

;==============================================
loc_0429c2:
	move.l ($40,a6),d0
	tst.b ($3c,a6)
	bne.b loc_0429ce
	neg.l d0

loc_0429ce:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	bpl.w loc_04128c
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	rts

;==============================================
;
;==============================================
loc_0429ea:
	move.b (7,a6),d0
	move.w loc_0429f6(pc,d0.w),d1
	jmp loc_0429f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0429f6:
	dc.w loc_042a06-loc_0429f6
	dc.w loc_042a34-loc_0429f6
	dc.w loc_042a54-loc_0429f6
	dc.w loc_042a68-loc_0429f6
	dc.w loc_042a94-loc_0429f6
	dc.w loc_042ac2-loc_0429f6
	dc.w loc_042b5c-loc_0429f6
	dc.w loc_042b9c-loc_0429f6

;----------------------------------------------
loc_042a06:
	addq.b #2,(7,a6)
	move.b (PL_Flip,a6),($3c,a6)
	move.b d0,(pl_attk_active,a6)
	jsr loc_0805c0
	move.l #$ffffff70,d0
	jsr loc_02ef6c
	jsr loc_02068c
	moveq #$29,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042a34:
	tst.b ($35,a6)
	beq.b loc_042a4e
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	moveq #$a,d0
	moveq #$58,d1
	jsr loc_082e36

loc_042a4e:
	jmp loc_02a7ea

;----------------------------------------------
loc_042a54:
	tst.b ($35,a6)
	bne.b loc_042a62
	addq.b #2,(7,a6)
	clr.b ($ab,a6)

loc_042a62:
	jmp loc_02a7ea

;----------------------------------------------
loc_042a68:
	tst.b ($35,a6)
	beq.w loc_042f54
	moveq #$63,d0
	jsr loc_02e3fe
	beq.b loc_042a8c
	addq.b #2,(7,a6)
	moveq #$2a,d0
	jsr Set_Char_Special_Ani
	jmp loc_02f9be

loc_042a8c:
	move.b #$e,(7,a6)
	rts

;----------------------------------------------
loc_042a94:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_042f5a
	addq.b #2,(7,a6)
	clr.w ($3a,a6)
	move.b #$18,($2a0,a6)
	movea.w ($38,a6),a4
	move.b #$18,($2a0,a4)
	jsr loc_00b69a
	bra.b loc_042ac8

;----------------------------------------------
loc_042ac2:
	jsr loc_02a7ea

loc_042ac8:
	tst.b ($35,a6)
	bmi.b loc_042af6
	beq.b loc_042ae6
	move.b ($34,a6),d0
	beq.b loc_042ae6
	jsr loc_02e970
	clr.b ($34,a6)
	move.w #$a,($3a,a6)

loc_042ae6:
	move.b ($35,a6),(1,a6)
	bsr.w loc_042baa
	jmp loc_02f9be

loc_042af6:
	addq.b #2,(7,a6)
	move.w #$ffff,d0
	jsr loc_00b710
	jsr loc_00b6d0
	move.b #0,($2a0,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	move.b #0,($2a0,a4)
	moveq #$69,d0
	jsr loc_02e970
	moveq #$63,d0
	jsr loc_02e7f2
	move.l #$fffd8000,($40,a6)
	moveq #0,d0
	move.l d0,($48,a6)
	move.l #$58000,($44,a6)
	move.l #$ffffb000,($4c,a6)
	move.b #1,($31,a6)
	rts

;----------------------------------------------
loc_042b5c:
	bsr.w loc_042f04
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	movea.w ($38,a6),a4
	tst.b ($50,a4)
	bmi.w loc_042f48
	jsr loc_00369c
	moveq #$2c,d0
	jmp Set_Char_Special_Ani

;----------------------------------------------
loc_042b9c:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jmp loc_02baf2

;==============================================
loc_042baa:
	move.w ($3a,a6),d0
	beq.b loc_042bb6
	subq.w #2,d0
	move.w d0,($3a,a6)

loc_042bb6:
	move.w loc_042bc0(pc,d0.w),d0
	jmp loc_00b710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042bc0:
	dc.w $f000,$ff00,$ffff,$ffff,$ffff

;##############################################
;Throws
;##############################################
loc_042bca:
	cmpi.b #4,($80,a6)
	beq.w loc_042dc4
	move.b (7,a6),d0
	move.w loc_042be6(pc,d0.w),d1
	jsr loc_042be6(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042be6:
	dc.w loc_042bf8-loc_042be6
	dc.w loc_042c0c-loc_042be6
	dc.w loc_042c98-loc_042be6
	dc.w loc_042ca6-loc_042be6
	dc.w loc_042cc0-loc_042be6
	dc.w loc_042cd4-loc_042be6
	dc.w loc_042d88-loc_042be6
	dc.w loc_042da4-loc_042be6

	dc.w loc_042db6-loc_042be6

;==============================================
loc_042bf8:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$2d,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_042c0c:
	tst.b ($33,a6)
	bpl.w loc_042f54
	moveq #$5e,d0
	tst.b ($81,a6)
	beq.b loc_042c1e
	moveq #$5f,d0

loc_042c1e:
	jsr loc_02e3fe
	beq.b loc_042c8c
	tst.b (PL_cpucontrol,a6)
	beq.b loc_042c46
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_042c5a
	bra.b loc_042c5e

loc_042c46:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_042c5e
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_042c5e

loc_042c5a:
	addq.b #1,(PL_Flip,a6)

loc_042c5e:
	move.b #6,(7,a6)
	moveq #0,d0
	tst.b ($81,a6)
	beq.b loc_042c86
	move.w #$78,($ae,a6)
	moveq #0,d0
	move.w d0,(pl_inp_slot_8,a6)
	move.b #$a,(7,a6)
	eori.b #1,(PL_Flip,a6)
	moveq #1,d0

loc_042c86:
	jmp Set_Char_Special_Ani

loc_042c8c:
	addq.b #2,(7,a6)
	moveq #$2e,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_042c98:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jmp loc_02baf2

;==============================================
loc_042ca6:
	tst.b ($35,a6)
	beq.w loc_042f54
	addq.b #2,(7,a6)
	moveq #$5e,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_042cc0:
	tst.b ($33,a6)
	bpl.w loc_042f54
	eori.b #1,(PL_Flip,a6)
	jmp loc_02baf2

;==============================================
loc_042cd4:
	tst.b (PL_cpucontrol,a6)
	bne.w loc_042d4c
	move.b (pl_inp_slot_8,a6),d0
	move.w loc_042ce8(pc,d0.w),d1
	jmp loc_042ce8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042ce8:
	dc.w loc_042cf0-loc_042ce8
	dc.w loc_042d04-loc_042ce8
	dc.w loc_042d18-loc_042ce8
	dc.w loc_042d2c-loc_042ce8

;----------------------------------------------
loc_042cf0:
	cmpi.b #2,($83,a6)
	bne.b loc_042d4c
	addq.b #2,(pl_inp_slot_8,a6)
	move.b #4,($1c1,a6)
	bra.b loc_042d4c

;----------------------------------------------
loc_042d04:
	cmpi.b #8,($83,a6)
	bne.b loc_042d42
	addq.b #2,(pl_inp_slot_8,a6)
	move.b #4,($1c1,a6)
	bra.b loc_042d4c

;----------------------------------------------
loc_042d18:
	cmpi.b #1,($83,a6)
	bne.b loc_042d42
	addq.b #2,(pl_inp_slot_8,a6)
	move.b #4,($1c1,a6)
	bra.b loc_042d4c

;----------------------------------------------
loc_042d2c:
	move.b ($378,a6),d0
	andi.w #6,d0
	beq.b loc_042d42
	addq.b #2,(7,a6)
	moveq #0,d0
	jmp Set_Char_Special_Ani

loc_042d42:
	subq.b #1,($1c1,a6)
	bpl.b loc_042d4c
	clr.b (pl_inp_slot_8,a6)

;----------------------------------------------
loc_042d4c:
	tst.b ($35,a6)
	beq.b loc_042d60
	clr.b ($35,a6)
	moveq #$60,d0
	jsr loc_02e970
	bne.b loc_042d7a

loc_042d60:
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_042d7a
	jsr loc_02ea06
	jsr loc_02ea7a
	beq.w loc_042f54
 
loc_042d7a:
	move.b #$e,(7,a6)
	moveq #2,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_042d88:
	tst.b ($35,a6)
	beq.w loc_042f54
	move.b #8,(7,a6)
	moveq #$5f,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_042da4:
	addq.b #2,(7,a6)
	moveq #$60,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_042db6:
	tst.b ($33,a6)
	bpl.w loc_042f54
	jmp loc_02baf2

;==============================================
;Air Throws
;==============================================
loc_042dc4:
	move.b (7,a6),d0
	move.w loc_042dd6(pc,d0.w),d1
	jsr loc_042dd6(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_042dd6:
	dc.w loc_042de2-loc_042dd6
	dc.w loc_042e4c-loc_042dd6
	dc.w loc_042e5c-loc_042dd6
	dc.w loc_042e72-loc_042dd6
	dc.w loc_042eb4-loc_042dd6
	dc.w loc_042ed0-loc_042dd6

;==============================================
loc_042de2:
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$61,d0
	jsr loc_02e636
	beq.b loc_042e40
	tst.b (PL_cpucontrol,a6)
	beq.b loc_042e14
	jsr loc_01bd5c
	clr.b (PL_Flip,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_042e28
	bra.b loc_042e2c

loc_042e14:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_042e2c
	clr.b (PL_Flip,a6)
	btst #1,d0
	beq.b loc_042e2c

loc_042e28:
	addq.b #1,(PL_Flip,a6)

loc_042e2c:
	move.b #4,(7,a6)
	move.b #$c,($3a,a6)
	moveq #3,d0
	jmp Set_Char_Special_Ani

loc_042e40:
	addq.b #2,(7,a6)
	moveq #$30,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_042e4c:
	jsr loc_02aa08
	bcc.w loc_042f54
	jmp loc_02baf2

;==============================================
loc_042e5c:
	subq.b #1,($3a,a6)
	bne.b loc_042e70
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)

loc_042e70:
	rts

;==============================================
loc_042e72:
	bsr.w loc_042f06
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b #$40,($123,a5)
	moveq #$61,d0
	jsr loc_02e970
	beq.b loc_042eaa
	bra.b loc_042eac

loc_042eaa:
	nop

loc_042eac:
	moveq #4,d0
	jmp Set_Char_Special_Ani

;==============================================
loc_042eb4:
	tst.b ($35,a6)
	beq.w loc_042f54
	addq.b #2,(7,a6)
	moveq #$65,d0
	jsr loc_02e7f2
	move.l #$40000,($44,a6)

;==============================================
loc_042ed0:
	bsr.w loc_042f06
	bpl.w loc_042f54
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_042f54
	jmp loc_02bd64

;##############################################
;Throw End
;##############################################

;==============================================
loc_042eea:
	move.l ($40,a6),d0
	tst.b (PL_Flip,a6)
	bne.b loc_042ef6
	neg.l d0

loc_042ef6:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_042f04:
	bsr.b loc_042eea

;==============================================
loc_042f06:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;==============================================
loc_042f18:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,(pl_inp_slot_0,a6)
	movem.l d0-d1,(pl_inp_slot_1,a6)
	movem.l d0-d1,(pl_inp_slot_2,a6)
	movem.l d0-d1,(pl_inp_slot_3,a6)
	movem.l d0-d1,(pl_inp_slot_4,a6)
	movem.l d0-d1,(pl_inp_slot_a,a6)
	movem.l d0-d1,(pl_inp_slot_b,a6)
	rts
 
;==============================================
loc_042f48:
	jmp loc_02baf2

;==============================================
loc_042f4e:
	jmp loc_02bb26

;==============================================
loc_042f54:
	jmp loc_02a7ea

;==============================================
loc_042f5a:
	jmp loc_02f9be

;==============================================
loc_042f60:
	move.l #$2040000,(4,a6)
	rts

;==============================================
loc_042f6a:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_042fa0
	cmp.b ($3b,a6),d0
	beq.b loc_042fa0
	move.b d0,($3b,a6)
	addq.b #1,($a,a6)
	subi.w #$10,($50,a6)
	move.w ($38,a6),($1d8,a6)
	beq.b loc_042fa0
	move.w a6,($38,a6)
	jsr loc_080b70
	move.w ($1d8,a6),($38,a6)

loc_042fa0:
	rts

;==============================================
loc_042fa2:
	moveq #$10,d7
	moveq #3,d6

loc_042fa6:
	jsr loc_01c2c8
	beq.b loc_042fc2
	move.l #$1001503,(a4)
	move.w a6,($36,a4)
	move.b d7,($3a,a4)
	subq.b #4,d7
	dbra d6,loc_042fa6

loc_042fc2:
	rts

;==============================================
loc_042fc4:
	moveq #2,d6

loc_042fc6:
	jsr loc_01c2c8
	beq.b loc_042fe0
	move.l #$1001500,(a4)
	move.b d6,(3,a4)
	move.w a6,($36,a4)
	dbra d6,loc_042fc6

loc_042fe0:
	rts

;==============================================
loc_042fe2:
	cmpi.b #7,($6eb9,a5)
	bcs.w loc_043100
	jsr loc_01c2c8
	movea.w a4,a1
	jsr loc_01c2c8
	movea.w a4,a2
	jsr loc_01c2c8
	movea.w a4,a3
	jsr loc_01c2c8
	bsr.w loc_043102
	move.l #$1001508,(a1)
	move.b #2,(9,a1)
	move.b #3,($a,a1)
	st.b ($3c,a1)
	move.b #1,($b,a1)
	move.w a6,($36,a1)
	move.l #$1001509,(a2)
	move.b #2,($9,a2)
	move.b #4,($a,a2)
	st.b ($3c,a2)
	move.b #0,($b,a2)
	move.w a6,($36,a2)
	move.l #$1001504,(a3)
	move.b #2,($9,a3)
	move.b #2,($a,a3)
	st.b ($3c,a3)
	move.b #1,($b,a3)
	move.w a6,($36,a3)
	move.l #$1001505,(a4)
	move.b #2,($9,a4)
	move.b #1,($a,a4)
	st.b ($3c,a4)
	move.b #1,($b,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$1001506,(a4)
	move.b #4,($9,a4)
	move.b #2,($a,a4)
	st.b ($3c,a4)
	move.b #0,($b,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$1001507,(a4)
	move.b #4,($9,a4)
	move.b #3,($a,a4)
	st.b ($3c,a4)
	move.b #0,($b,a4)
	move.w a6,($36,a4)
	jsr loc_01c2c8
	move.l #$100150a,(a4)
	move.b #4,($9,a4)
	move.b #5,($a,a4)
	st.b ($3c,a4)
	move.b #0,($b,a4)
	move.w a6,($36,a4)

loc_043100:
	rts

;==============================================
loc_043102:
	cmpa.w a1,a2
	bcs.b loc_043108
	exg.l a1,a2

loc_043108:
	cmpa.w a2,a3
	bcs.b loc_04310e
	exg.l a2,a3

loc_04310e:
	cmpa.w a3,a4
	bcs.b loc_043114
	exg.l a3,a4

loc_043114:
	cmpa.w a1,a2
	bcs.b loc_04311a
	exg.l a1,a2

loc_04311a:
	cmpa.w a2,a3
	bcs.b loc_043120
	exg.l a2,a3

loc_043120:
	cmpa.w a1,a2
	bcs.b loc_043126
	exg.l a1,a2

loc_043126:
	rts

;##############################################
;
;##############################################
loc_043128:
	dc.w loc_043176-loc_043128
	dc.w loc_043176-loc_043128
	dc.w loc_04312e-loc_043128

loc_04312e:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$02,$02,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

loc_043176:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$02,$02,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02