;AI
loc_03071c:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($10e,a5),d0
	bne.w loc_030754
	jsr loc_02af7a
	bne.w loc_030754
	tst.b ($212,a6)
	beq.b loc_030754
	tst.b ($5b,a6)
	beq.b loc_030754
	movea.l (PL_Anim_Pnt,a6),a0
	tst.b (9,a0)
	beq.b loc_030754
	clr.b ($212,a6)
	moveq #1,d0
	rts

loc_030754:
	moveq #0,d0
	rts

;==============================================
loc_030758:
	tst.b ($2c0,a6)
	beq.b loc_03076c
	move.w (PL_Y,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$20,d0
	bcs.b loc_0307cc

loc_03076c:
	moveq #0,d0
	move.b ($20d,a6),d0
	andi.w #$fe,d0
	beq.b loc_0307cc
	move.w loc_030780(pc,d0.w),d1
	jmp loc_030780(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030780:
	dc.w loc_030788-loc_030780
	dc.w loc_030788-loc_030780
	dc.w loc_030794-loc_030780
	dc.w loc_0307a2-loc_030780

;----------------------------------------------
loc_030788:
	move.w ($20e,a6),d1
	cmp.w ($21c,a6),d1
	bcc.b loc_0307c8
	bra.b loc_0307cc

;----------------------------------------------
loc_030794:
	tst.w ($21a,a6)
	beq.w loc_0307c8
	subq.w #1,($21a,a6)
	bra.b loc_0307cc

;----------------------------------------------
loc_0307a2:
	moveq #0,d0
	move.b ($20e,a6),d0
	cmp.w ($21c,a6),d0
	bcs.b loc_0307cc
	move.b ($20f,a6),d0
	ext.w d0
	movea.w ($38,a6),a4
	move.w (PL_Y,a6),d1
	sub.w (PL_Y,a4),d1
	add.w d0,d1
	add.w d0,d0
	cmp.w d0,d1
	bhi.b loc_0307cc

loc_0307c8:
	moveq #1,d0
	rts

loc_0307cc:
	moveq #0,d0
	rts

;==============================================
loc_0307d0:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_030924
	tst.b ($24e,a6)
	bne.w loc_030924
	move.w (Dramatic_Mode_Type,a5),d0
	move.w loc_0307ec(pc,d0.w),d1
	jmp loc_0307ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0307ec:
	dc.w loc_0307f4-loc_0307ec
	dc.w loc_03086c-loc_0307ec
	dc.w loc_03086c-loc_0307ec
	dc.w loc_03086c-loc_0307ec

;----------------------------------------------
loc_0307f4:
	moveq #$b,d6
	lea.l ($1400,a5),a4

loc_0307fa:
	cmpi.b #1,(a4)
	bne.b loc_030824
	tst.b ($68,a4)
	bmi.b loc_030824
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_030824
	move.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.w loc_030920

loc_030824:
	lea.l ($100,a4),a4
	dbra d6,loc_0307fa
	moveq #$b,d6
	lea.l ($2000,a5),a4

loc_030832:
	cmpi.b #1,(a4)
	bne.b loc_03085c
	tst.b ($68,a4)
	bmi.b loc_03085c
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_03085c
	move.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.w loc_030920

loc_03085c:
	lea.l ($100,a4),a4
	dbra d6,loc_030832
	movea.w ($38,a6),a4
	bra.w loc_0308e6

;----------------------------------------------
loc_03086c:
	moveq #$b,d6
	lea.l ($1400,a5),a4

loc_030872:
	cmpi.b #1,(a4)
	bne.b loc_03089c
	tst.b ($68,a4)
	bmi.b loc_03089c
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_03089c
	move.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.w loc_030920

loc_03089c:
	lea.l ($100,a4),a4
	dbra d6,loc_030872
	moveq #$b,d6
	lea.l ($2000,a5),a4

loc_0308aa:
	cmpi.b #1,(a4)
	bne.b loc_0308d2
	tst.b ($68,a4)
	bmi.b loc_0308d2
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_0308d2
	move.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.b loc_030920

loc_0308d2:
	lea.l ($100,a4),a4
	dbra d6,loc_0308aa
	lea.l (p1memory,a5),a4
	bsr.w loc_0308e6
	lea.l (p2memory,a5),a4

loc_0308e6:
	tst.b ($31,a6)
	beq.b loc_0308f2
	tst.b ($31,a4)
	beq.b loc_030924

loc_0308f2:
	tst.b ($216,a4)
	bne.b loc_030920
	tst.b ($c7,a4)
	bmi.b loc_030924
	tst.b ($a9,a4)
	bne.w loc_030928
	bra.b loc_030924

loc_030908:
	move.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$80,d0
	cmpi.w #$100,d0
	bhi.b loc_030924

loc_03091a:
	tst.b ($247,a4)
	bne.b loc_030924

loc_030920:
	moveq #1,d0
	rts

loc_030924:
	moveq #0,d0
	rts

;==============================================
loc_030928:
	movea.w ($38,a6),a4
	movea.l (PL_Anim_Pnt,a4),a2
	movea.l ($a0,a4),a1

loc_030934:
	move.b (9,a2),d0
	beq.b loc_030960
	ext.w d0
	lsl.w #5,d0
	lea.l (a1,d0.w),a1
	move.w (a1),d0
	tst.b (PL_Flip,a4)
	beq.b loc_03094c
	neg.w d0

loc_03094c:
	add.w (PL_X,a4),d0
	sub.w (PL_X,a6),d0
	addi.w #$60,d0
	cmpi.w #$c0,d0
	bhi.b loc_030908
	bra.b loc_03091a

loc_030960:
	move.b (1,a2),d0
	andi.b #$c0,d0
	bne.b loc_030908
	lea.l (PL_Y,a2),a2
	bra.b loc_030934

;==============================================
loc_030970:
	moveq #0,d2
	move.l #$2000c00,d1
	moveq #$15,d0
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_03099a
	tst.b ($ed,a4)
	bne.b loc_030990
	tst.b ($2c8,a4)
	beq.b loc_03099a

loc_030990:
	moveq #1,d2
	move.l #$2000c04,d1
	moveq #$18,d0

loc_03099a:
	move.b d2,(pl_crouching,a6)
	move.l d1,(pl_overall_state,a6)
	move.l #$2020c00,($200,a6)
	jmp loc_02a708

;==============================================
loc_0309b0:
	moveq #0,d0
	move.b (PL_charid,a6),d0
	lsl.w #5,d0
	movea.l #loc_0def92,a0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	move.b ($127,a6),d0
	move.b (a0,d0.w),($24a,a6)
	rts

;==============================================
loc_0309d0:
	btst.b #0,($210,a6)
	beq.w loc_030a26
	cmpi.b #4,(PL_charid,a6)
	beq.b loc_0309f2
	cmpi.b #$7,(PL_charid,a6)
	bne.b loc_030a26
	cmpi.b #$1c,(PL_charid,a6)
	bne.b loc_030a26

loc_0309f2:
	move.w ($64,a6),d0
	addi.w #$20,d0
	cmp.w (PL_Y,a6),d0
	bcc.b loc_030a26
	move.b ($3c,a6),d1
	beq.b loc_030a26
	move.b ($ac,a6),d0
	beq.b loc_030a26
	tst.w (pl_x_velocity,a6)
	beq.b loc_030a26
	bmi.b loc_030a1c
	cmpi.b #2,d0
	bne.b loc_030a26
	bra.b loc_030a22

loc_030a1c:
	cmpi.b #1,d0
	bne.b loc_030a26

loc_030a22:
	moveq #1,d0
	rts

loc_030a26:
	moveq #0,d0
	rts

;==============================================
loc_030a2a:
	tst.b ($217,a6)
	bne.w loc_030a62
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_030a62
	jsr RNGFunction
	andi.w #$1f,d0
	movea.l #loc_0c955a,a1
	bsr.w loc_030a66
	beq.w loc_030a62
	jsr loc_0307d0(pc)
	beq.w loc_030a62
	move.b #1,($217,a6)
	rts

loc_030a62:
	moveq #0,d0
	rts

;==============================================
loc_030a66:
	jsr RNGFunction
	andi.w #$1f,d0
	move.b ($127,a6),d1
	ext.w d1
	lsl.w #2,d1
	move.l (a1,d1.w),d1
	btst.l d0,d1
	rts

;==============================================
loc_030a80:
	tst.b ($10e,a5)
	bne.w loc_030aa2
	cmpi.w #$100,($21a,a6)
	bcs.b loc_030a96
	move.w #$ff,($21a,a6)

loc_030a96:
	move.b ($204,a6),d0
	move.w loc_030aa4(pc,d0.w),d1
	jmp loc_030aa4(pc,d1.w)

loc_030aa2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030aa4:
	dc.w loc_030aac-loc_030aa4
	dc.w loc_030ae6-loc_030aa4
	dc.w loc_030b20-loc_030aa4
	dc.w loc_030b5a-loc_030aa4

;==============================================
loc_030aac:
	move.b ($200,a6),d0
	move.w loc_030ab8(pc,d0.w),d1
	jmp loc_030ab8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030ab8
	dc.w loc_030abc-loc_030ab8
	dc.w loc_030ac4-loc_030ab8

;----------------------------------------------
loc_030abc:
	addq.b #2,($200,a6)
	bsr.w loc_03271a

;----------------------------------------------
loc_030ac4:
	move.b ($201,a6),d0
	move.w loc_030ad0(pc,d0.w),d1
	jmp loc_030ad0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030ad0
	dc.w loc_030ad4-loc_030ad0
	dc.w loc_030ae2-loc_030ad0

;----------------------------------------------
loc_030ad4:
	addq.b #2,($201,a6)
	move.l ($220,a6),($230,a6)
	bsr.w loc_030b94

;----------------------------------------------
loc_030ae2:
	bra.w loc_032292

;==============================================
loc_030ae6:
	move.b ($200,a6),d0
	move.w loc_030af2(pc,d0.w),d1
	jmp loc_030af2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030af2:
	dc.w loc_030af6-loc_030af2
	dc.w loc_030afe-loc_030af2

;----------------------------------------------
loc_030af6:
	addq.b #2,($200,a6)
	bsr.w loc_032756

loc_030afe:
	move.b ($201,a6),d0
	move.w loc_030b0a(pc,d0.w),d1
	jmp loc_030b0a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030b0a:
	dc.w loc_030b0e-loc_030b0a
	dc.w loc_030b1c-loc_030b0a

;----------------------------------------------
loc_030b0e
	addq.b #2,($201,a6)
	move.l ($224,a6),($230,a6)
	bsr.w loc_030b94

;----------------------------------------------
loc_030b1c:
	bra.w loc_032292

;==============================================
loc_030b20:
	move.b ($200,a6),d0
	move.w loc_030b2c(pc,d0.w),d1
	jmp loc_030b2c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030b2c:
	dc.w loc_030b30-loc_030b2c
	dc.w loc_030b38-loc_030b2c

;----------------------------------------------
loc_030b30:
	addq.b #2,($200,a6)
	bsr.w loc_0327b0

loc_030b38:
	move.b ($201,a6),d0
	move.w loc_030b44(pc,d0.w),d1
	jmp loc_030b44(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030b44:
	dc.w loc_030b48-loc_030b44
	dc.w loc_030b56-loc_030b44

;----------------------------------------------
loc_030b48:
	addq.b #2,($201,a6)
	move.l ($228,a6),($230,a6)
	bsr.w loc_030b94

;----------------------------------------------
loc_030b56:
	bra.w loc_032292

;==============================================
loc_030b5a:
	move.b ($200,a6),d0
	move.w loc_030b66(pc,d0.w),d1
	jmp loc_030b66(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030b66:
	dc.w loc_030b6a-loc_030b66
	dc.w loc_030b72-loc_030b66

;----------------------------------------------
loc_030b6a:
	addq.b #2,($200,a6)
	bsr.w loc_032812

loc_030b72:
	move.b ($201,a6),d0
	move.w loc_030b7e(pc,d0.w),d1
	jmp loc_030b7e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030b7e:
	dc.w loc_030b82-loc_030b7e
	dc.w loc_030b90-loc_030b7e

;----------------------------------------------
loc_030b82:
	addq.b #2,($201,a6)
	move.l ($22c,a6),($230,a6)
	bsr.w loc_030b94

;----------------------------------------------
loc_030b90:
	bra.w loc_032292

;==============================================
loc_030b94:
	movea.l ($230,a6),a0
	move.w (a0)+,($208,a6)
	cmpi.b #$ff,($208,a6)
	bne.b loc_030ba8
	bsr.w loc_0321c8
 
 loc_030ba8:
	bsr.w loc_030bc8
	moveq #0,d0
	move.l a0,($230,a6)
	move.b ($204,a6),d0
	move.w loc_030bc0(pc,d0.w),d1
	move.l a0,(a6,d1.w)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030bc0:
	dc.w $0220,$0224,$0228,$022c

;==============================================
loc_030bc8:
	move.b ($208,a6),d0
	move.w loc_030bd4(pc,d0.w),d1
	jmp loc_030bd4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030bd4:
	dc.w loc_030bec-loc_030bd4
	dc.w loc_030e84-loc_030bd4
	dc.w loc_031018-loc_030bd4
	dc.w loc_0311e0-loc_030bd4
	dc.w loc_031266-loc_030bd4
	dc.w loc_0312ce-loc_030bd4
	dc.w loc_031400-loc_030bd4
	dc.w loc_031a4c-loc_030bd4

	dc.w loc_031a86-loc_030bd4
	dc.w loc_031ad2-loc_030bd4
	dc.w loc_031b1e-loc_030bd4
	dc.w loc_03216e-loc_030bd4

;==============================================
loc_030bec:
	move.b ($209,a6),d0
	move.w loc_030bf8(pc,d0.w),d1
	jmp loc_030bf8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030bf8:
	dc.w loc_030c1e-loc_030bf8
	dc.w loc_030c32-loc_030bf8
	dc.w loc_030c4a-loc_030bf8
	dc.w loc_030c62-loc_030bf8
	dc.w loc_030c80-loc_030bf8
	dc.w loc_030cb8-loc_030bf8
	dc.w loc_030ce2-loc_030bf8
	dc.w loc_030d1c-loc_030bf8

	dc.w loc_030d62-loc_030bf8
	dc.w loc_030d7e-loc_030bf8
	dc.w loc_030d98-loc_030bf8
	dc.w loc_030daa-loc_030bf8
	dc.w loc_030dc0-loc_030bf8
	dc.w loc_030dd0-loc_030bf8
	dc.w loc_030dde-loc_030bf8
	dc.w loc_030e00-loc_030bf8

	dc.w loc_030e22-loc_030bf8
	dc.w loc_030e34-loc_030bf8
	dc.w loc_030e5e-loc_030bf8

;----------------------------------------------
loc_030c1e:
	move.w #0,($202,a6)
	move.w (a0)+,($21a,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030c32:
	tst.b (pl_crouching,a6)
	bne.w loc_0321ac
	move.w #2,($202,a6)
	move.l #$2000200,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030c4a:
	tst.b (pl_crouching,a6)
	beq.w loc_0321ac
	move.w #4,($202,a6)
	move.l #$2000204,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030c62:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_0321ac
	move.w #6,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030c80:
	movea.w ($38,a6),a4
	move.w (a0)+,d0
	move.w d0,($20a,a6)
	cmpi.b #1,($31,a4)
	bne.w loc_0321ac
	add.w ($64,a4),d0
	cmp.w (PL_Y,a4),d0
	bcs.w loc_030ca8
	tst.w (pl_y_velocity,a4)
	bmi.w loc_0321ac

loc_030ca8:
	move.w #8,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030cb8:
	jsr loc_02f256
	beq.w loc_0321ac
	move.w #$600,($202,a6)
	move.l #$2000a00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	clr.b ($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_030ce2:
	move.w #$c,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	move.w (a0)+,($21a,a6)
	jsr loc_02f256
	beq.b loc_030d1a
	move.w #$600,($202,a6)
	move.l #$2000a00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	clr.b ($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_030d1a:
	rts

;----------------------------------------------
loc_030d1c:
	movea.w ($38,a6),a4
	move.w (a0)+,($20a,a6)
	tst.b ($238,a4)
	beq.w loc_0321ac
	move.w ($a4,a4),d1
	beq.w loc_0321ac
	movea.w d1,a4
	cmpi.b #2,(4,a4)
	bne.w loc_0321ac
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20a,a6),d0
	cmp.w d0,d1
	bls.w loc_0321ac
	move.w #$e,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030d62:
	tst.w ($204,a6)
	beq.b loc_030daa
	bsr.w loc_03284e
	tst.w ($21a,a6)
	beq.w loc_0321ac
	move.w #$10,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030d7e:
	tst.b ($238,a6)
	beq.w loc_0321ac
	tst.w ($a4,a6)
	beq.w loc_0321ac
	move.w #$12,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030d98:
	bsr.w loc_032c5c
	bne.w loc_0321ac
	move.w #$14,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030daa:
	bsr.w loc_03284e
	tst.w ($21a,a6)
	beq.w loc_0321ac
	move.w #0,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030dc0:
	move.w #1,($21a,a6)
	move.w #$10,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030dd0:
	move.w (a0)+,($21a,a6)
	move.w #$10,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030dde:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	move.w (a0)+,($21a,a6)
	sub.w ($21c,a6),d1
	bpl.w loc_0321ac
	move.w #$16,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030e00:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	move.w (a0)+,($21a,a6)
	sub.w ($21c,a6),d1
	bmi.w loc_0321ac
	move.w #$18,($202,a6)
	move.l #$2000000,(pl_overall_state,a6)
	rts

;----------------------------------------------
loc_030e22:
	bsr.w loc_032c50
	bne.w loc_0321ac
	move.w #$1a,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_030e34:
	jsr loc_02f0d6
	beq.w loc_0321ac
	move.w #$600,($202,a6)
	move.l #$2000a00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	clr.b ($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	rts

;----------------------------------------------
loc_030e5e:
	clr.b ($5b,a6)
	move.w #$a,($202,a6)

loc_030e68:
	move.l (pl_overall_state,a6),d1
	andi.l #$ffffff00,d1
	cmpi.l #$2000000,d1
	beq.b loc_030e82
	move.l #$2000000,(pl_overall_state,a6)

loc_030e82:
	rts

;==============================================
loc_030e84:
	move.b ($209,a6),d0
	move.w loc_030e90(pc,d0.w),d1
	jmp loc_030e90(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_030e90:
	dc.w loc_030ea0-loc_030e90
	dc.w loc_030eca-loc_030e90
	dc.w loc_030ef4-loc_030e90
	dc.w loc_030f34-loc_030e90
	dc.w loc_030f56-loc_030e90
	dc.w loc_030f78-loc_030e90
	dc.w loc_030fa6-loc_030e90
	dc.w loc_030fd4-loc_030e90

;----------------------------------------------
loc_030ea0:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	bpl.w loc_0321ac
	move.w #$200,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #0,($3c,a6)
	move.b #0,($211,a6)
	rts

;----------------------------------------------
loc_030eca:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	bmi.w loc_0321ac
	move.w #$202,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #1,($3c,a6)
	move.b #1,($211,a6)
	rts

;----------------------------------------------
loc_030ef4:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	addi.w #3,d1
	cmpi.w #6,d1
	bcs.w loc_0321ac
	move.w #$204,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	clr.b ($3c,a6)
	clr.b ($211,a6)
	move.w ($20a,a6),d1
	cmp.w ($21c,a6),d1
	bcs.b loc_030f32
	addq.b #1,($3c,a6)
	addq.b #1,($211,a6)

loc_030f32:
	rts

;----------------------------------------------
loc_030f34:
	move.w (a0)+,d1
	move.w d1,($21a,a6)
	move.w #$206,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #0,($3c,a6)
	move.b #0,($211,a6)
	rts

;----------------------------------------------
loc_030f56:
	move.w (a0)+,d1
	move.w d1,($21a,a6)
	move.w #$208,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #1,($3c,a6)
	move.b #1,($211,a6)
	rts

;----------------------------------------------
loc_030f78:
	move.w (a0)+,d1
	move.w (a0)+,($21a,a6)
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	bpl.w loc_0321ac
	move.w #$20a,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #0,($3c,a6)
	move.b #0,($211,a6)
	rts

;----------------------------------------------
loc_030fa6:
	move.w (a0)+,d1
	move.w (a0)+,($21a,a6)
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	bmi.w loc_0321ac
	move.w #$20c,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	move.b #1,($3c,a6)
	move.b #1,($211,a6)
	rts

;----------------------------------------------
loc_030fd4:
	move.w (a0)+,d1
	move.w (a0)+,($21a,a6)
	move.w d1,($20a,a6)
	sub.w ($21c,a6),d1
	addi.w #3,d1
	cmpi.w #6,d1
	bcs.w loc_0321ac
	move.w #$20e,($202,a6)
	move.l #$2000400,(pl_overall_state,a6)
	clr.b ($3c,a6)
	clr.b ($211,a6)
	move.w ($20a,a6),d1
	cmp.w ($21c,a6),d1
	bcs.b loc_031016
	addq.b #1,($3c,a6)
	addq.b #1,($211,a6)

loc_031016:
	rts

;==============================================
loc_031018:
	move.b ($209,a6),d0
	move.w loc_031024(pc,d0.w),d1
	jmp loc_031024(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031024:
	dc.w loc_03102c-loc_031024
	dc.w loc_03107e-loc_031024
	dc.w loc_03110e-loc_031024
	dc.w loc_031184-loc_031024

;----------------------------------------------
loc_03102c:
	move.w #$400,($202,a6)
	move.l #$200060e,(pl_overall_state,a6)
	move.w (a0)+,($20a,a6)
	move.w (a0)+,($20c,a6)
	move.w (a0)+,($20e,a6)

loc_031046:
	move.w ($20a,a6),d1
	bsr.w loc_0328b0
	move.b ($20c,a6),($211,a6)
	move.b ($20d,a6),($210,a6)
	move.b ($20d,a6),d0
	andi.w #$fe,d0
	move.w loc_03106a(pc,d0.w),d1
	jmp loc_03106a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03106a:
	dc.w loc_031072-loc_03106a
	dc.w loc_031072-loc_03106a
	dc.w loc_031074-loc_03106a
	dc.w loc_03107c-loc_03106a

;----------------------------------------------
loc_031072:
	rts

loc_031074:
	move.w ($20e,a6),($21a,a6)
	rts

loc_03107c:
	rts

;----------------------------------------------
loc_03107e:
	move.w (a0)+,($20a,a6)
	move.w (a0)+,($20c,a6)
	move.w (a0)+,($20e,a6)
	move.w ($20a,a6),d1
	bsr.w loc_0328b0
	move.b #6,($aa,a6)
	bsr.w loc_03289c
	beq.w loc_0321ac
	cmpi.l #$2020400,(pl_overall_state,a6)
	bne.b loc_0310be
	move.l a0,(-$4b08,a5)
	jsr loc_02e8c0
	move.b #2,($114,a0)
	movea.l (-$4b08,a5),a0

loc_0310be:
	move.w #$400,($202,a6)
	move.l #$2000e00,(pl_overall_state,a6)
	clr.b ($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	clr.b (pl_crouching,a6)
	move.b ($20c,a6),($211,a6)
	move.b ($20d,a6),($210,a6)
	move.b ($20d,a6),d0
	andi.w #$fe,d0
	move.w loc_0310fa(pc,d0.w),d1
	jmp loc_0310fa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0310fa:
	dc.w loc_031102-loc_0310fa
	dc.w loc_031102-loc_0310fa
	dc.w loc_031104-loc_0310fa
	dc.w loc_03110c-loc_0310fa

;----------------------------------------------
loc_031102:
	rts

loc_031104:
	move.w ($20e,a6),($21a,a6)
	rts

loc_03110c:
	rts

;----------------------------------------------
loc_03110e:
	move.w #$404,($202,a6)
	move.l #$200060e,(pl_overall_state,a6)
	move.w (a0)+,($20a,a6)
	move.w (a0)+,($20c,a6)
	move.w (a0)+,($20e,a6)
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_031166
	cmpi.w #$48,(PL_meter,a6)
	bcs.w loc_031166
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	bne.w loc_031166
	move.b #1,($2c5,a6)
	move.b ($20c,a6),($211,a6)
	move.b ($20d,a6),($210,a6)
	move.b ($20d,a6),d0
	andi.w #$fe,d0
	move.w loc_031170(pc,d0.w),d1
	jmp loc_031170(pc,d1.w)

loc_031166:
	clr.b ($2c5,a6)
	clr.b ($20d,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031170:
	dc.w loc_031178-loc_031170
	dc.w loc_031178-loc_031170
	dc.w loc_03117a-loc_031170
	dc.w loc_031182-loc_031170

;----------------------------------------------
loc_031178:
	rts

loc_03117a:
	move.w ($20e,a6),($21a,a6)
	rts

loc_031182:
	rts

;----------------------------------------------
loc_031184:
	move.w #$400,($202,a6)
	move.l #$200060e,(pl_overall_state,a6)
	move.b #1,($2c0,a6)
	move.w (a0)+,($20a,a6)
	move.w (a0)+,($20c,a6)
	move.w (a0)+,($20e,a6)
	move.b ($20a,a6),(PL_Attacktype,a6)
	move.b ($20b,a6),($80,a6)
	move.b ($20c,a6),($211,a6)
	move.b ($20d,a6),($210,a6)
	move.b ($20d,a6),d0
	andi.w #$fe,d0
	move.w loc_0311cc(pc,d0.w),d1
	jmp loc_0311cc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0311cc:
	dc.w loc_0311d4-loc_0311cc
	dc.w loc_0311d4-loc_0311cc
	dc.w loc_0311d6-loc_0311cc
	dc.w loc_0311de-loc_0311cc

;----------------------------------------------
loc_0311d4:
	rts

loc_0311d6:
	move.w ($20e,a6),($21a,a6)
	rts

loc_0311de:
	rts

;==============================================
loc_0311e0:
	move.b ($209,a6),d0
	move.w loc_0311ec(pc,d0.w),d1
	jmp loc_0311ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0311ec:
	dc.w loc_0311f0-loc_0311ec
	dc.w loc_03121c-loc_0311ec

;----------------------------------------------
loc_0311f0:
	move.w #$600,($202,a6)
	move.l #$2000a00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	clr.b ($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	bra.w loc_0328b0

;----------------------------------------------
loc_03121c:
	move.w #$602,($202,a6)
	move.l #$2000a00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	move.b #1,($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	cmpi.b #Xism_Val,(PL_ism_choice,a6)
	bne.b loc_03125c
	cmpi.b #$11,(PL_charid,a6)
	beq.b loc_031258
	cmpi.b #$13,(PL_charid,a6)
	beq.b loc_03125c

loc_031258:
	clr.b ($212,a6)

loc_03125c:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	bra.w loc_0328b0

;==============================================
loc_031266:
	move.b ($209,a6),d0
	move.w loc_031272(pc,d0.w),d1
	jmp loc_031272(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031272:
	dc.w loc_031274-loc_031272

;----------------------------------------------
loc_031274:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	bsr.w loc_0328b0
	bsr.w loc_03289c
	beq.w loc_0321ac
	cmpi.l #$2020400,(pl_overall_state,a6)
	bne.b loc_0312a4
	move.l a0,(-$4b08,a5)
	jsr loc_02e8c0
	move.b #2,($114,a0)
	movea.l (-$4b08,a5),a0

loc_0312a4:
	move.w #$800,($202,a6)
	move.l #$2000e00,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	move.b #1,($ce,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	clr.b (pl_crouching,a6)
	rts


;==============================================
loc_0312ce:
	move.b ($209,a6),d0
	move.w loc_0312da(pc,d0.w),d1
	jmp loc_0312da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0312da:
	dc.w loc_0312de-loc_0312da
	dc.w loc_031372-loc_0312da

;----------------------------------------------
loc_0312de:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	bsr.w loc_0328b0
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	beq.w loc_031362
	tst.b ($123,a6)
	bne.b loc_031308
	cmpi.w #$30,(PL_meter,a6)
	bcs.w loc_0321ac
	tst.b (PL_ism_choice,a6)
	beq.b loc_031318

loc_031308:
	cmpi.w #$90,(PL_meter,a6)
	bne.w loc_0321ac
	move.b #4,(PL_ButtonStrength,a6)

loc_031318:
	bsr.w loc_03289c
	beq.w loc_0321ac
	cmpi.l #$2020400,(pl_overall_state,a6)
	bne.b loc_03133e
	move.l a0,(-$4b08,a5)
	jsr loc_02e8c0
	move.b #2,($114,a0)
	movea.l (-$4b08,a5),a0

loc_03133e:
	move.w #$a00,($202,a6)
	move.l #$2001000,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	clr.b (pl_crouching,a6)
	rts

loc_031362:
	move.w #1,($21a,a6)
	move.w #$10,($202,a6)
	bra.w loc_030e68

;----------------------------------------------
loc_031372:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	bne.w loc_0321ac
	cmpi.w #$48,(PL_meter,a6)
	bcs.w loc_0321ac
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_0321ac
	bsr.w loc_03289c
	beq.w loc_0321ac

loc_03139c:
	move.w #$a02,($202,a6)
	move.l #$2001000,(pl_overall_state,a6)
	move.b #1,($a9,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	clr.b (pl_crouching,a6)
	clr.b ($2c5,a6)
	move.b ($20b,a6),($aa,a6)
	clr.b ($20d,a6)
	moveq #0,d1
	moveq #$f,d2
	moveq #5,d3
	tst.b ($20a,a6)
	beq.b loc_0313ec
	moveq #0,d1
	moveq #$30,d2
	moveq #$10,d3
	cmpi.b #2,($20a,a6)
	beq.b loc_0313ec
	moveq #4,d1
	moveq #$51,d2
	moveq #$1b,d3

loc_0313ec:
	move.b d1,($244,a6)
	move.w d2,($2a6,a6)
	move.w d3,($2a8,a6)
	move.b #1,($d6,a6)
	rts

;==============================================
loc_031400:
	move.b ($209,a6),d0
	move.w loc_03140c(pc,d0.w),d1
	jmp loc_03140c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03140c:
	dc.w loc_031412-loc_03140c
	dc.w loc_031a38-loc_03140c
	dc.w loc_031a44-loc_03140c

;==============================================
loc_031412:
	addq.b #1,($215,a6)
	move.w (a0)+,d0
	move.w d0,($20a,a6)
	move.w loc_031424(pc,d0.w),d1
	jmp loc_031424(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031424:
	dc.w loc_031472-loc_031424
	dc.w loc_031486-loc_031424
	dc.w loc_03149a-loc_031424
	dc.w loc_0314ac-loc_031424
	dc.w loc_0314d6-loc_031424
	dc.w loc_0314e8-loc_031424
	dc.w loc_0314f8-loc_031424
	dc.w loc_031508-loc_031424

	dc.w loc_03152c-loc_031424
	dc.w loc_031560-loc_031424
	dc.w loc_031598-loc_031424
	dc.w loc_0315a6-loc_031424
	dc.w loc_0315c0-loc_031424
	dc.w loc_0315d8-loc_031424
	dc.w loc_0315f2-loc_031424
	dc.w loc_0315fe-loc_031424

	dc.w loc_03161c-loc_031424
	dc.w loc_03163a-loc_031424
	dc.w loc_03164e-loc_031424
	dc.w loc_031660-loc_031424
	dc.w loc_031674-loc_031424
	dc.w loc_03168e-loc_031424
	dc.w loc_0316a8-loc_031424
	dc.w loc_0316be-loc_031424

	dc.w loc_0316d4-loc_031424
	dc.w loc_031712-loc_031424
	dc.w loc_03174e-loc_031424
	dc.w loc_03175c-loc_031424
	dc.w loc_03176e-loc_031424
	dc.w loc_031780-loc_031424
	dc.w loc_03178e-loc_031424
	dc.w loc_03179a-loc_031424

	dc.w loc_0317a6-loc_031424
	dc.w loc_0317b2-loc_031424
	dc.w loc_0317c0-loc_031424
	dc.w loc_0317ce-loc_031424
	dc.w loc_0317dc-loc_031424
	dc.w loc_0317ea-loc_031424
	dc.w loc_0317f8-loc_031424

;----------------------------------------------
loc_031472:
	move.w (a0)+,($20c,a6)
	move.w ($21c,a6),d1
	cmp.w ($20c,a6),d1
	bls.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031486:
	move.w (a0)+,($20c,a6)
	move.w ($21c,a6),d1
	cmp.w ($20c,a6),d1
	bcc.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03149a:
	jsr RNGFunction
	andi.w #1,d0
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0314ac:
	move.w (a0)+,d1
	tst.b ($123,a6)
	bne.w loc_0314c8
	tst.b (PL_ism_choice,a6)
	bne.b loc_0314c8
	cmp.w (PL_meter,a6),d1
	bls.w loc_0321ac
	bra.w loc_031a38

loc_0314c8:
	cmpi.w #$90,(PL_meter,a6)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0314d6:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0314e8:
	movea.w ($38,a6),a4
	tst.b ($2c8,a4)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0314f8:
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031508:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_031a38
	move.w ($a4,a4),d0
	beq.w loc_031a38
	movea.w d0,a4
	cmpi.b #2,(4,a4)
	bne.w loc_031a38
	bra.w loc_0321ac

;----------------------------------------------
loc_03152c:
	move.w (a0)+,($20c,a6)
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_03155c
	move.w ($a4,a4),d0
	beq.b loc_03155c
	movea.w d0,a4
	tst.b (4,a4)
	beq.b loc_03155c
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20c,a6),d0
	cmp.w d0,d1
	bls.w loc_0321ac

loc_03155c:
	bra.w loc_031a38

;----------------------------------------------
loc_031560:
	move.w (a0)+,($20c,a6)
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_0321ac
	move.w ($a4,a4),d0
	beq.w loc_0321ac
	movea.w d0,a4
	tst.b (4,a4)
	beq.w loc_0321ac
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20c,a6),d0
	cmp.w d0,d1
	bcc.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031598:
	jsr loc_0307d0
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0315a6:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_0315bc
	cmpi.b #1,($3c,a4)
	beq.w loc_0321ac

loc_0315bc:
	bra.w loc_031a38

;----------------------------------------------
loc_0315c0:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_0315d4
	tst.b ($3c,a4)
	beq.w loc_0321ac

loc_0315d4:
	bra.w loc_031a38

;----------------------------------------------
loc_0315d8:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_0315ee
	cmpi.b #$ff,($3c,a4)
	beq.w loc_0321ac

loc_0315ee:
	bra.w loc_031a38

;----------------------------------------------
loc_0315f2:
	bsr.w loc_032c5c
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0315fe:
	move.w (a0)+,($20c,a6)
	moveq #0,d0
	moveq #0,d1
	move.b ($127,a6),d0
	move.w ($20c,a6),d1
	andi.w #$1f,d1
	cmp.b d1,d0
	bls.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03161c:
	move.w (a0)+,($20c,a6)
	moveq #0,d0
	moveq #0,d1
	move.b ($127,a6),d0
	move.w ($20c,a6),d1
	andi.w #$1f,d1
	cmp.b d1,d0
	bcc.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03163a:
	tst.b ($238,a6)
	bne.b loc_03164a
	tst.w ($a4,a6)
	bne.b loc_03164a
	bra.w loc_0321ac

loc_03164a:
	bra.w loc_031a38

;----------------------------------------------
loc_03164e:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	cmp.w (PL_HP,a4),d1
	bhi.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031660:
	move.w (PL_HP,a6),d1
	movea.w ($38,a6),a4
	cmp.w (PL_HP,a4),d1
	bhi.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031674:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_031a38
	tst.l (pl_y_velocity,a4)
	bmi.w loc_031a38
	bra.w loc_0321ac

;----------------------------------------------
loc_03168e:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_0321ac
	tst.l (pl_y_velocity,a4)
	bpl.w loc_031a38
	bra.w loc_0321ac

;----------------------------------------------
loc_0316a8:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	add.w ($64,a4),d1
	cmp.w (PL_Y,a4),d1
	bcc.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0316be:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	add.w ($64,a4),d1
	cmp.w (PL_Y,a4),d1
	bls.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0316d4:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_03170a
	move.w ($a4,a4),d0
	beq.b loc_03170a
	movea.w d0,a4
	moveq #0,d0
	move.b (2,a4),d0
	lsl.w #4,d0
	lea.l loc_031804(pc),a1
	lea.l (a1,d0.w),a1
	moveq #0,d0
	move.b ($72,a4),d0
	lsr.b #1,d0
	move.b (a1,d0.w),d0
	beq.b loc_03170a
	cmpi.b #4,d0
	bne.b loc_03170e

loc_03170a:
	bra.w loc_0321ac

loc_03170e:
	bra.w loc_031a38

;----------------------------------------------
loc_031712:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_03174a
	move.w ($a4,a4),d0
	beq.b loc_03174a
	movea.w d0,a4
	moveq #0,d0
	move.b (2,a4),d0
	lsl.w #4,d0
	lea.l loc_031804(pc),a1
	lea.l (a1,d0.w),a1
	moveq #0,d0
	move.b ($72,a4),d0
	lsr.b #1,d0
	move.b (a1,d0.w),d0
	cmpi.b #2,d0
	bls.b loc_03174a
	bra.w loc_0321ac

loc_03174a:
	bra.w loc_031a38

;----------------------------------------------
loc_03174e:
	move.w (a0)+,d1
	cmp.w (PL_HP,a6),d1
	bhi.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03175c:
	jsr RNGFunction
	andi.w #3,d0
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03176e:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	cmp.b (PL_charid,a4),d1
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_031780:
	move.w (a0)+,d1
	cmp.b (PL_charid,a6),d1
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03178e:
	tst.b ($5b,a6)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_03179a:
	tst.b (PL_ism_choice,a6)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317a6:
	tst.b (PL_ism_choice,a6)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317b2:
	cmpi.b #Xism_Val,(PL_ism_choice,a6)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317c0:
	cmpi.b #Xism_Val,(PL_ism_choice,a6)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317ce:
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317dc:
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	bne.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317ea:
	cmpi.b #1,($5b,a6)
	beq.w loc_0321ac
	bra.w loc_031a38

;----------------------------------------------
loc_0317f8:
	tst.b (pl_cc_cancelflag,a6)
	bne.w loc_0321ac
	bra.w loc_031a38

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031804:
	dc.l $00000004,$04040000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000002,$02020000,$00040404,$06060600
	dc.l $00000004,$04040404,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $02020200,$00000000,$00000000,$00000000
	dc.l $02020200,$00000606,$06000000,$00000000
	dc.l $02020206,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $02020200,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000002,$02020000,$00040404,$06060600
	dc.l $06060600,$00000000,$00000000,$00000000
	dc.l $02020200,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $04040400,$00000000,$00000000,$00000000
	dc.l $00000002,$02020000,$00000000,$00000000
	dc.l $02020200,$00000000,$00000000,$00000000
	dc.l $04040400,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000004,$04040000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000

;==============================================
loc_031a04:
	moveq #0,d0
	move.b (9,a1),d0
	lsl.w #5,d0
	movea.l ($a0,a4),a1
	lea.l (a1,d0.w),a1
	move.w ($4,a1),d1
	neg.w d1
	move.w (a1),d0
	tst.b (PL_Flip,a4)
	beq.b loc_031a26
	neg.w d0
	neg.w d1

loc_031a26:
	add.w d1,d0
	add.w (PL_X,a4),d0
	move.w (PL_X,a6),d1
	sub.w d0,d1
	bpl.b loc_031a36
	neg.w d1

loc_031a36:
	rts

;==============================================
loc_031a38:
	move.b ($215,a6),d6
	bsr.w loc_032aee
	bra.w loc_0321ac

;==============================================
loc_031a44:
	subq.b #1,($215,a6)
	bra.w loc_0321ac

;==============================================
loc_031a4c:
	move.b ($209,a6),d0
	move.w loc_031a58(pc,d0.w),d1
	jmp loc_031a58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031a58:
	dc.w loc_031a5c-loc_031a58
	dc.w loc_031a74-loc_031a58

;----------------------------------------------
loc_031a5c:
	move.w ($206,a6),($218,a6)
	move.b #2,($204,a6)
	move.l a0,($220,a6)
	bsr.w loc_032756
	bra.w loc_0321ac

;----------------------------------------------
loc_031a74:
	movea.l #loc_0c965a,a1
	jsr loc_030a66
	beq.w loc_0321ac
	bra.b loc_031a5c

;==============================================
loc_031a86:
	jsr loc_0307d0
	beq.w loc_0321ac
	move.w #$c00,($202,a6)
	move.l #$2000c08,(pl_overall_state,a6)
	move.b ($209,a6),($214,a6)
	beq.b loc_031ad0
	tst.b ($213,a6)
	beq.b loc_031acc
	tst.b ($24a,a6)
	beq.b loc_031acc
	movea.l #loc_0c845a,a1
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #7,d0
	lea.l (a1,d0.w),a1
	jsr loc_030a66
	bne.b loc_031ad0

loc_031acc:
	clr.b ($214,a6)

loc_031ad0:
	rts

;==============================================
loc_031ad2:
	move.b ($209,a6),d0
	move.w loc_031ade(pc,d0.w),d1
	jmp loc_031ade(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031ade:
	dc.w loc_031ae6-loc_031ade
	dc.w loc_031af8-loc_031ade
	dc.w loc_031b0e-loc_031ade
	dc.w loc_031b16-loc_031ade

;----------------------------------------------
loc_031ae6:
	move.w (a0)+,d1
	move.w (a0)+,d2
	cmp.b ($127,a6),d1
	bcc.b loc_031af4
	or.w d2,($240,a6)

loc_031af4:
	bra.w loc_0321ac

;----------------------------------------------
loc_031af8:
	move.w (a0)+,d1
	move.w (a0)+,d2
	eori.w #$ffff,d2
	cmp.b ($127,a6),d1
	bcc.b loc_031b0a
	and.w d2,($240,a6)

loc_031b0a:
	bra.w loc_0321ac

;----------------------------------------------
loc_031b0e:
	clr.b ($246,a6)
	bra.w loc_0321ac

;----------------------------------------------
loc_031b16:
	addq.b #1,($246,a6)
	bra.w loc_0321ac

;==============================================
loc_031b1e:
	move.b ($209,a6),d0
	move.w loc_031b2a(pc,d0.w),d1
	jmp loc_031b2a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031b2a:
	dc.w loc_031b34-loc_031b2a
	dc.w loc_031b38-loc_031b2a
	dc.w loc_031e8a-loc_031b2a
	dc.w loc_031e8e-loc_031b2a
	dc.w loc_031e92-loc_031b2a


;==============================================
loc_031b34:
	addq.b #1,(PL_byte255,a6)

loc_031b38:
	move.w (a0)+,d0
	move.w loc_031b42(pc,d0.w),d1
	jmp loc_031b42(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031b42:
	dc.w loc_031b80-loc_031b42
	dc.w loc_031b94-loc_031b42
	dc.w loc_031ba8-loc_031b42
	dc.w loc_031bba-loc_031b42
	dc.w loc_031bc8-loc_031b42
	dc.w loc_031bda-loc_031b42
	dc.w loc_031bea-loc_031b42
	dc.w loc_031bfa-loc_031b42

	dc.w loc_031c1e-loc_031b42
	dc.w loc_031c50-loc_031b42
	dc.w loc_031c88-loc_031b42
	dc.w loc_031c96-loc_031b42
	dc.w loc_031cb0-loc_031b42
	dc.w loc_031cc8-loc_031b42
	dc.w loc_031ce2-loc_031b42
	dc.w loc_031cee-loc_031b42

	dc.w loc_031d0c-loc_031b42
	dc.w loc_031d2a-loc_031b42
	dc.w loc_031d3e-loc_031b42
	dc.w loc_031d50-loc_031b42
	dc.w loc_031d64-loc_031b42
	dc.w loc_031d7e-loc_031b42
	dc.w loc_031d98-loc_031b42
	dc.w loc_031dae-loc_031b42

	dc.w loc_031dc4-loc_031b42
	dc.w loc_031e02-loc_031b42
	dc.w loc_031e3e-loc_031b42
	dc.w loc_031e4c-loc_031b42
	dc.w loc_031e5e-loc_031b42
	dc.w loc_031e70-loc_031b42
	dc.w loc_031e7e-loc_031b42

;----------------------------------------------
loc_031b80:
	move.w (a0)+,($20c,a6)
	move.w ($21c,a6),d1
	cmp.w ($20c,a6),d1
	bls.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031b94:
	move.w (a0)+,($20c,a6)
	move.w ($21c,a6),d1
	cmp.w ($20c,a6),d1
	bcc.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031ba8:
	jsr RNGFunction
	andi.w #1,d0
	beq.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031bba:
	move.w (a0)+,d1
	cmp.w (PL_meter,a6),d1
	bls.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031bc8:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	beq.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031bda:
	movea.w ($38,a6),a4
	tst.b ($2c8,a4)
	bne.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031bea:
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	bne.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031bfa:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_031e9a
	move.w ($a4,a4),d0
	beq.w loc_031e9a
	movea.w d0,a4
	cmpi.b #2,(4,a4)
	bne.w loc_031e9a
	bra.w loc_0321ac

;----------------------------------------------
loc_031c1e:
	move.w (a0)+,($20c,a6)
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_031c4c
	move.w ($a4,a4),d0
	beq.b loc_031c4c
	movea.w d0,a4
	tst.b (4,a4)
	beq.b loc_031c4c
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20c,a6),d0
	cmp.w d0,d1
	bls.w loc_0321ac

loc_031c4c:
	bra.w loc_031e9a

;----------------------------------------------
loc_031c50:
	move.w (a0)+,($20c,a6)
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_0321ac
	move.w ($a4,a4),d0
	beq.w loc_0321ac
	movea.w d0,a4
	tst.b (4,a4)
	beq.w loc_0321ac
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20c,a6),d0
	cmp.w d0,d1
	bcc.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031c88:
	jsr loc_0307d0
	bne.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031c96:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_031cac
	cmpi.b #1,($3c,a4)
	beq.w loc_0321ac

loc_031cac:
	bra.w loc_031e9a

;----------------------------------------------
loc_031cb0:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_031cc4
	tst.b ($3c,a4)
	beq.w loc_0321ac

loc_031cc4:
	bra.w loc_031e9a

;----------------------------------------------
loc_031cc8:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.b loc_031cde
	cmpi.b #$ff,($3c,a4)
	beq.w loc_0321ac

loc_031cde:
	bra.w loc_031e9a

;----------------------------------------------
loc_031ce2:
	bsr.w loc_032c5c
	bne.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031cee:
	move.w (a0)+,($20c,a6)
	moveq #0,d0
	moveq #0,d1
	move.b ($127,a6),d0
	move.w ($20c,a6),d1
	andi.w #$1f,d1
	cmp.b d1,d0
	bls.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031d0c:
	move.w (a0)+,($20c,a6)
	moveq #0,d0
	moveq #0,d1
	move.b ($127,a6),d0
	move.w ($20c,a6),d1
	andi.w #$1f,d1
	cmp.b d1,d0
	bcc.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031d2a:
	tst.b ($238,a6)
	bne.b loc_031d3a
	tst.w ($a4,a6)
	bne.b loc_031d3a
	bra.w loc_0321ac

loc_031d3a:
	bra.w loc_031e9a

;----------------------------------------------
loc_031d3e:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	cmp.w (PL_HP,a4),d1
	bhi.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031d50:
	move.w (PL_HP,a6),d1
	movea.w ($38,a6),a4
	cmp.w (PL_HP,a4),d1
	bhi.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031d64:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_031e9a
	tst.l (pl_y_velocity,a4)
	bmi.w loc_031e9a
	bra.w loc_0321ac

;----------------------------------------------
loc_031d7e:
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_0321ac
	tst.l (pl_y_velocity,a4)
	bpl.w loc_031e9a
	bra.w loc_0321ac

;----------------------------------------------
loc_031d98:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	add.w ($64,a4),d1
	cmp.w (PL_Y,a4),d1
	bcc.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031dae:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	add.w ($64,a4),d1
	cmp.w (PL_Y,a4),d1
	bls.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031dc4:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_031dfa
	move.w ($a4,a4),d0
	beq.b loc_031dfa
	movea.w d0,a4
	moveq #0,d0
	move.b (2,a4),d0
	lsl.w #4,d0
	lea.l loc_031804(pc),a1
	lea.l (a1,d0.w),a1
	moveq #0,d0
	move.b ($72,a4),d0
	lsr.b #1,d0
	move.b (a1,d0.w),d0
	beq.b loc_031dfa
	cmpi.b #4,d0
	bne.b loc_031dfe

loc_031dfa:
	bra.w loc_0321ac

loc_031dfe:
	bra.w loc_031e9a

;----------------------------------------------
loc_031e02:
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.b loc_031e3a
	move.w ($a4,a4),d0
	beq.b loc_031e3a
	movea.w d0,a4
	moveq #0,d0
	move.b (2,a4),d0
	lsl.w #4,d0
	lea.l loc_031804(pc),a1
	lea.l (a1,d0.w),a1
	moveq #0,d0
	move.b ($72,a4),d0
	lsr.b #1,d0
	move.b (a1,d0.w),d0
	cmpi.b #2,d0
	bls.b loc_031e3a
	bra.w loc_0321ac

loc_031e3a:
	bra.w loc_031e9a

;----------------------------------------------
loc_031e3e:
	move.w (a0)+,d1
	cmp.w (PL_HP,a6),d1
	bhi.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031e4c:
	jsr RNGFunction
	andi.w #3,d0
	beq.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031e5e:
	move.w (a0)+,d1
	movea.w ($38,a6),a4
	cmp.b (PL_charid,a4),d1
	beq.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031e70:
	move.w (a0)+,d1
	cmp.b (PL_charid,a6),d1
	beq.w loc_0321ac
	bra.w loc_031e9a

;----------------------------------------------
loc_031e7e:
	tst.b ($5b,a6)
	bne.w loc_0321ac
	bra.w loc_031e9a

;==============================================
loc_031e8a:
	bra.w loc_0321ac

;==============================================
loc_031e8e:
	bra.w loc_031ea6

;==============================================
loc_031e92:
	subq.b #1,(PL_byte255,a6)
	bra.w loc_0321ac

;==============================================
loc_031e9a:
	move.b (PL_byte255,a6),d6
	bsr.w loc_031eb2
	bra.w loc_0321ac

;==============================================
loc_031ea6:
	move.b (PL_byte255,a6),d6
	bsr.w loc_032040
	bra.w loc_0321ac

;==============================================
loc_031eb2:
	moveq #0,d0
	move.b (a0)+,d0
	bmi.w loc_032afe
	move.w loc_031ec2(pc,d0.w),d1
	jmp loc_031ec2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031ec2:
	dc.w loc_031ed8-loc_031ec2
	dc.w loc_031f0a-loc_031ec2
	dc.w loc_031f26-loc_031ec2
	dc.w loc_031f2e-loc_031ec2
	dc.w loc_031f2e-loc_031ec2
	dc.w loc_031f2e-loc_031ec2
	dc.w loc_031f3e-loc_031ec2
	dc.w loc_031f38-loc_031ec2

	dc.w loc_031f38-loc_031ec2
	dc.w loc_031f9a-loc_031ec2
	dc.w loc_031fb0-loc_031ec2

;----------------------------------------------
loc_031ed8:
	move.b (a0)+,d0
	move.w loc_031ee4(pc,d0.w),d1
	jsr loc_031ee4(pc,d1.w)
	bra.b loc_031eb2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031ee4:
	dc.w loc_032c4a-loc_031ee4;0d66
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4a-loc_031ee4;0d66
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4a-loc_031ee4;0d66
	dc.w loc_032c4a-loc_031ee4;0d66
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4a-loc_031ee4;0d66
	dc.w loc_032c44-loc_031ee4;0d60
	dc.w loc_032c44-loc_031ee4;0d60
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a
	dc.w loc_032c4e-loc_031ee4;0d6a

;----------------------------------------------
loc_031f0a:
	move.b (a0)+,d0
	move.w loc_031f16(pc,d0.w),d1
	jsr loc_031f16(pc,d1.w)
	bra.b loc_031eb2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031f16:
	dc.w loc_032c4a-loc_031f16;0d34
	dc.w loc_032c4a-loc_031f16;0d34
	dc.w loc_032c4a-loc_031f16;0d34
	dc.w loc_032c4a-loc_031f16;0d34
	dc.w loc_032c4a-loc_031f16;0d34
	dc.w loc_032c44-loc_031f16;0d2e
	dc.w loc_032c44-loc_031f16;0d2e
	dc.w loc_032c44-loc_031f16;0d2e

;----------------------------------------------
loc_031f26:
	move.b (a0)+,d0
	bsr.w loc_032c3e
	bra.b loc_031eb2

;----------------------------------------------
loc_031f2e:
	move.b (a0)+,d0
	bsr.w loc_032c4a
	bra.w loc_031eb2

;----------------------------------------------
loc_031f38:
	move.b (a0)+,d0
	bra.w loc_031eb2

;----------------------------------------------
loc_031f3e:
	move.b (a0)+,d0
	move.w loc_031f48(pc,d0.w),d1
	jmp loc_031f48(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031f48:
	dc.w loc_031f4e-loc_031f48
	dc.w loc_031f58-loc_031f48
	dc.w loc_031f58-loc_031f48

;-----------------------------------------------
loc_031f4e:
	move.w (a0)+,d0
	move.w loc_031f5c(pc,d0.w),d1
	jsr loc_031f5c(pc,d1.w)

loc_031f58:
	bra.w loc_031eb2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031f5c:
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4a-loc_031f5c;0cee
	dc.w loc_032c4e-loc_031f5c;0cf2

;-----------------------------------------------
loc_031f9a:
	move.b (a0)+,d0
	move.w loc_031fa8(pc,d0.w),d1
	jsr loc_031fa8(pc,d1.w)
	bra.w loc_031eb2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031fa8:
	dc.w loc_032c44-loc_031fa8;0c9c
	dc.w loc_032c44-loc_031fa8;0c9c
	dc.w loc_032c4e-loc_031fa8;0ca6
	dc.w loc_032c4e-loc_031fa8;0ca6

;-----------------------------------------------
loc_031fb0:
	move.b (a0)+,d0
	move.w loc_031fba(pc,d0.w),d1
	jmp loc_031fba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031fba:
	dc.w loc_031fc4-loc_031fba
	dc.w loc_032014-loc_031fba
	dc.w loc_03201c-loc_031fba
	dc.w loc_032028-loc_031fba
	dc.w loc_03202c-loc_031fba

;----------------------------------------------
loc_031fc4:
	addq.b #1,(PL_byte255,a6)

loc_031fc8:
	move.w (a0)+,d0
	move.w loc_031fd6(pc,d0.w),d1
	jsr loc_031fd6(pc,d1.w)
	bra.w loc_031eb2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_031fd6:
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4a-loc_031fd6;0c74
	dc.w loc_032c4e-loc_031fd6;0c78

;----------------------------------------------
loc_032014:
	cmp.b (PL_byte255,a6),d6
	beq.b loc_032024
	bra.b loc_031fc8

loc_03201c:
	cmp.b (PL_byte255,a6),d6
	bne.w loc_031eb2

loc_032024:
	move.w -(a0),d0
	rts

loc_032028:
	bra.w loc_031eb2

loc_03202c:
	subq.b #1,(PL_byte255,a6)
	move.b d6,d5
	sub.b (PL_byte255,a6),d5
	cmpi.b #1,d5
	bne.w loc_031eb2
	rts

;==============================================
loc_032040:
	moveq #0,d0
	move.b (a0)+,d0
	bmi.w loc_032afe
	move.w loc_032050(pc,d0.w),d1
	jmp loc_032050(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032050:
	dc.w loc_032066-loc_032050
	dc.w loc_032098-loc_032050
	dc.w loc_0320b4-loc_032050
	dc.w loc_0320bc-loc_032050
	dc.w loc_0320bc-loc_032050
	dc.w loc_0320bc-loc_032050
	dc.w loc_0320cc-loc_032050
	dc.w loc_0320c6-loc_032050

	dc.w loc_0320c6-loc_032050
	dc.w loc_03212c-loc_032050
	dc.w loc_032142-loc_032050

;----------------------------------------------
loc_032066:
	move.b (a0)+,d0
	move.w loc_032072(pc,d0.w),d1
	jsr loc_032072(pc,d1.w)
	bra.b loc_032040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032072:
	dc.w loc_032c4a-loc_032072;0bd8
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4a-loc_032072;0bd8
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4a-loc_032072;0bd8
	dc.w loc_032c4a-loc_032072;0bd8
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4a-loc_032072;0bd8
	dc.w loc_032c44-loc_032072;0bd2
	dc.w loc_032c44-loc_032072;0bd2
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc
	dc.w loc_032c4e-loc_032072;0bdc

;----------------------------------------------
loc_032098:
	move.b (a0)+,d0
	move.w loc_0320a4(pc,d0.w),d1
	jsr loc_0320a4(pc,d1.w)
	bra.b loc_032040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0320a4:
	dc.w loc_032c4a-loc_0320a4;0ba6
	dc.w loc_032c4a-loc_0320a4;0ba6
	dc.w loc_032c4a-loc_0320a4;0ba6
	dc.w loc_032c4a-loc_0320a4;0ba6
	dc.w loc_032c4a-loc_0320a4;0ba6
	dc.w loc_032c44-loc_0320a4;0ba0
	dc.w loc_032c44-loc_0320a4;0ba0
	dc.w loc_032c44-loc_0320a4;0ba0

;----------------------------------------------
loc_0320b4:
	move.b (a0)+,d0
	bsr.w loc_032c3e
	bra.b loc_032040

;----------------------------------------------
loc_0320bc:
	move.b (a0)+,d0
	bsr.w loc_032c4a
	bra.w loc_032040

;----------------------------------------------
loc_0320c6:
	move.b (a0)+,d0
	bra.w loc_032040

;----------------------------------------------
loc_0320cc:
	move.b (a0)+,d0
	move.w loc_0320d6(pc,d0.w),d1
	jmp loc_0320d6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0320d6:
	dc.w loc_0320e0-loc_0320d6
	dc.w loc_0320ea-loc_0320d6
	dc.w loc_0320ea-loc_0320d6

;----------------------------------------------
loc_0320dc:
	addq.b #1,(PL_byte255,a6)

loc_0320e0:
	move.w (a0)+,d0
	move.w loc_0320ee(pc,d0.w),d1
	jsr loc_0320ee(pc,d1.w)

loc_0320ea:
	bra.w loc_032040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0320ee:
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4a-loc_0320ee;0b5c
	dc.w loc_032c4e-loc_0320ee;0b60

;----------------------------------------------
loc_03212c:
	move.b (a0)+,d0
	move.w loc_03213a(pc,d0.w),d1
	jsr loc_03213a(pc,d1.w)
	bra.w loc_032040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03213a:
	dc.w loc_032c44-loc_03213a;b0a
	dc.w loc_032c44-loc_03213a;b0a
	dc.w loc_032c4e-loc_03213a;b14
	dc.w loc_032c4e-loc_03213a;b14

;----------------------------------------------
loc_032142:
	move.b (a0)+,d0
	move.w loc_03214c(pc,d0.w),d1
	jmp loc_03214c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03214c:
	dc.w loc_0320dc-loc_03214c
	dc.w loc_0320e0-loc_03214c
	dc.w loc_032156-loc_03214c
	dc.w loc_032156-loc_03214c
	dc.w loc_03215a-loc_03214c

;----------------------------------------------
loc_032156:
	bra.w loc_032040

loc_03215a:
	subq.b #1,(PL_byte255,a6)
	move.b d6,d5
	sub.b (PL_byte255,a6),d5
	cmpi.b #1,d5
	bne.w loc_032040
	rts

;==============================================
loc_03216e:
	move.b ($209,a6),d0
	move.w loc_03217a(pc,d0.w),d1
	jmp loc_03217a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03217a:
	dc.w loc_03217c-loc_03217a

;----------------------------------------------
loc_03217c:
	move.w (a0)+,d1
	move.w d1,($20a,a6)
	move.w #$e00,($202,a6)
	move.l #$2040000,(4,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	clr.b ($5b,a6)
	clr.b (pl_crouching,a6)
	move.b ($20a,a6),(PL_Attacktype,a6)
	move.b ($20b,a6),($80,a6)
	rts

;==============================================
loc_0321ac:
	moveq #0,d0
	move.w (a0)+,($208,a6)
	move.l a0,($230,a6)
	cmpi.b #$ff,($208,a6)
	bne.w loc_030bc8
	bsr.w loc_0321c8
	bra.w loc_030bc8

;==============================================
loc_0321c8:
	move.b ($209,a6),d0
	move.w loc_0321d4(pc,d0.w),d1
	jmp loc_0321d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0321d4:
	dc.w loc_0321da-loc_0321d4
	dc.w loc_0321fc-loc_0321d4
	dc.w loc_032248-loc_0321d4

;----------------------------------------------
loc_0321da:
	tst.b ($204,a6)
	bne.b loc_0321e4
	bsr.w loc_03271a

loc_0321e4:
	move.b #2,($204,a6)
	bsr.w loc_032756
	movea.l ($224,a6),a0
	move.l a0,($230,a6)
	move.w (a0)+,($208,a6)
	rts

;----------------------------------------------
loc_0321fc:
	tst.b ($204,a6)
	bne.b loc_032220
	clr.b ($204,a6)
	bsr.w loc_03271a
	movea.l ($220,a6),a0
	move.l a0,($230,a6)
	move.w (a0)+,($208,a6)
	cmpi.b #$ff,($208,a6)
	beq.b loc_0321c8
	rts

loc_032220:
	clr.b ($204,a6)
	move.w ($218,a6),($206,a6)
	movea.l ($220,a6),a0
	move.l a0,($230,a6)
	move.w (a0)+,($208,a6)
	cmpi.b #$ff,($208,a6)
	bne.w loc_032246
	bsr.w loc_03271a
	bra.b loc_0321c8

loc_032246:
	rts

;----------------------------------------------
loc_032248:
	movea.l #loc_0c835a,a1
	jsr loc_030a66
	beq.b loc_0321da
	bra.b loc_0321fc

;==============================================
loc_032258:
	move.w ($206,a6),d0
	move.w loc_032264(pc,d0.w),d1
	jmp loc_032264(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032264:
	dc.w loc_03226a-loc_032264
	dc.w loc_03226e-loc_032264
	dc.w loc_032282-loc_032264

;----------------------------------------------
loc_03226a:
	bra.w loc_032710

;----------------------------------------------
loc_03226e:
	clr.b ($204,a6)
	clr.b ($215,a6)
	clr.b (PL_byte255,a6)
	move.w ($218,a6),($206,a6)
	bra.b loc_032220

;----------------------------------------------
loc_032282:
	movea.l #loc_0c83da,a1
	jsr loc_030a66
	beq.b loc_03226e
	bra.b loc_03226a

;==============================================
loc_032292:
	move.b ($202,a6),d0
	move.w loc_03229e(pc,d0.w),d1
	jmp loc_03229e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03229e:
	dc.w loc_0322ae-loc_03229e
	dc.w loc_032486-loc_03229e
	dc.w loc_032622-loc_03229e
	dc.w loc_032648-loc_03229e
	dc.w loc_0326a2-loc_03229e
	dc.w loc_0326c2-loc_03229e
	dc.w loc_0326e6-loc_03229e
	dc.w loc_0326f8-loc_03229e

;==============================================
loc_0322ae:
	move.b ($203,a6),d0
	move.w loc_0322ba(pc,d0.w),d1
	jmp loc_0322ba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0322ba:
	dc.w loc_0322d6-loc_0322ba
	dc.w loc_0322f0-loc_0322ba
	dc.w loc_03230a-loc_0322ba
	dc.w loc_032324-loc_0322ba
	dc.w loc_03233c-loc_0322ba
	dc.w loc_03236c-loc_0322ba
	dc.w loc_032370-loc_0322ba
	dc.w loc_0323b0-loc_0322ba

	dc.w loc_0323ea-loc_0322ba
	dc.w loc_0323fc-loc_0322ba
	dc.w loc_032416-loc_0322ba
	dc.w loc_032428-loc_0322ba
	dc.w loc_03244e-loc_0322ba
	dc.w loc_032474-loc_0322ba

;----------------------------------------------
loc_0322d6:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	beq.w loc_032710
	rts

;----------------------------------------------
loc_0322f0:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.b (pl_crouching,a6)
	bne.w loc_032710
	rts

;----------------------------------------------
loc_03230a:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.b (pl_crouching,a6)
	beq.w loc_032710
	rts
 
;----------------------------------------------
loc_032324:
	bsr.w loc_032926
	bne.w loc_03299c
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_032710
	rts

;----------------------------------------------
loc_03233c:
	bsr.w loc_032926
	bne.w loc_03299c
	movea.w ($38,a6),a4
	cmpi.b #1,($31,a4)
	bne.w loc_032710
	move.w ($20a,a6),d0
	add.w ($64,a4),d0
	cmp.w (PL_Y,a4),d0
	bcs.w loc_03236a
	tst.w (pl_y_velocity,a4)
	bmi.w loc_032710

loc_03236a:
	rts

;----------------------------------------------
loc_03236c:
	bra.w loc_032710

;----------------------------------------------
loc_032370:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	beq.w loc_032710
	jsr loc_02f256
	beq.b loc_0323ae
	move.w #$600,($202,a6)
	move.l #$2000a00,(4,a6)
	move.b #1,($a9,a6)
	clr.b ($212,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)

loc_0323ae:
	rts

;----------------------------------------------
loc_0323b0:
	bsr.w loc_032926
	bne.w loc_03299c
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	beq.w loc_032710
	move.w ($a4,a4),d1
	beq.w loc_032710
	movea.w d1,a4
	tst.b (4,a4)
	beq.w loc_032710
	movea.l (PL_Anim_Pnt,a4),a1
	bsr.w loc_031a04
	move.w ($20a,a6),d0
	cmp.w d0,d1
	bls.w loc_032710
	rts

;----------------------------------------------
loc_0323ea:
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	beq.w loc_032710
	rts

;----------------------------------------------
loc_0323fc:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b ($238,a6)
	beq.w loc_032710
	tst.w ($a4,a6)
	beq.w loc_032710
	rts

;----------------------------------------------
loc_032416:
	bsr.w loc_032926
	bne.w loc_03299c
	bsr.w loc_032c5c
	bne.w loc_032710
	rts

;----------------------------------------------
loc_032428:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	beq.w loc_032710
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcc.w loc_032710
	rts

;----------------------------------------------
loc_03244e:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	beq.w loc_032710
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcs.w loc_032710
	rts

;----------------------------------------------
loc_032474:
	bsr.w loc_032926
	bne.w loc_03299c
	bsr.w loc_032c50
	bne.w loc_032710
	rts

;==============================================
loc_032486:
	move.b ($203,a6),d0
	move.w loc_032492(pc,d0.w),d1
	jmp loc_032492(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032492:
	dc.w loc_0324a2-loc_032492
	dc.w loc_0324ce-loc_032492
	dc.w loc_0324fa-loc_032492
	dc.w loc_03253a-loc_032492
	dc.w loc_03253a-loc_032492
	dc.w loc_032566-loc_032492
	dc.w loc_03259e-loc_032492
	dc.w loc_0325d6-loc_032492

;----------------------------------------------
loc_0324a2:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcc.w loc_032710
	tst.b ($3c,a6)
	beq.b loc_0324cc
	tst.b ($ac,a6)
	bne.w loc_032710

loc_0324cc:
	rts

;----------------------------------------------
loc_0324ce:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b ($6,a6)
	beq.w loc_032710
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcs.w loc_032710
	tst.b ($3c,a6)
	beq.b loc_0324f8
	tst.b ($ac,a6)
	bne.w loc_032710

loc_0324f8:
	rts

;----------------------------------------------
loc_0324fa:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.b ($ac,a6)
	bne.w loc_032710
	move.w ($20a,a6),d1
	sub.w ($21c,a6),d1
	addi.w #3,d1
	cmpi.w #6,d1
	bcs.w loc_032710
	clr.b ($211,a6)
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcs.b loc_032538
	addq.b #1,($211,a6)

loc_032538:
	rts

;----------------------------------------------
loc_03253a:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	tst.b ($3c,a6)
	beq.b loc_032564
	tst.b ($ac,a6)
	bne.w loc_032710

loc_032564:
	rts

;----------------------------------------------
loc_032566:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcc.w loc_032710
	tst.b ($3c,a6)
	beq.b loc_03259c
	tst.b ($ac,a6)
	bne.w loc_032710

loc_03259c:
	rts

;----------------------------------------------
loc_03259e:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcs.w loc_032710
	tst.b ($3c,a6)
	beq.b loc_0325d4
	tst.b ($ac,a6)
	bne.w loc_032710

loc_0325d4:
	rts

;----------------------------------------------
loc_0325d6:
	bsr.w loc_032926
	bne.w loc_03299c
	tst.b (6,a6)
	beq.w loc_032710
	tst.w ($21a,a6)
	beq.w loc_032710
	subq.w #1,($21a,a6)
	tst.b ($ac,a6)
	bne.w loc_032710
	move.w ($20a,a6),d1
	sub.w ($21c,a6),d1
	addi.w #3,d1
	cmpi.w #6,d1
	bcs.w loc_032710
	clr.b ($211,a6)
	move.w ($20a,a6),d0
	cmp.w ($21c,a6),d0
	bcs.b loc_032620
	addq.b #1,($211,a6)

loc_032620:
	rts

;==============================================
loc_032622:
	move.b ($203,a6),d0
	move.w loc_03262e(pc,d0.w),d1
	jmp loc_03262e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03262e:
	dc.w loc_032634-loc_03262e
	dc.w loc_03263e-loc_03262e
	dc.w loc_032634-loc_03262e

;----------------------------------------------
loc_032634:
	tst.b ($6,a6)
	beq.w loc_032710
	rts

loc_03263e:
	tst.b (6,a6)
	beq.w loc_032710
	rts

;==============================================
loc_032648:
	move.b ($203,a6),d0
	move.w loc_032654(pc,d0.w),d1
	jmp loc_032654(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032654:
	dc.w loc_032658-loc_032654
	dc.w loc_032670-loc_032654

;----------------------------------------------
loc_032658:
	tst.b (6,a6)
	beq.w loc_032710
	tst.b ($5b,a6)
	beq.b loc_03266e
	bsr.w loc_032cd6
	bne.w loc_032710

loc_03266e:
	rts

;----------------------------------------------
loc_032670:
	tst.b (6,a6)
	beq.w loc_032710
	tst.b ($5b,a6)
	beq.b loc_0326a0
	bsr.w loc_032cd6
	bne.w loc_032710
	tst.b ($23e,a6)
	beq.b loc_0326a0
	tst.b ($212,a6)
	beq.w loc_0326a0
	clr.b ($212,a6)
	bsr.w loc_032d08
	bne.w loc_032710

loc_0326a0:
	rts

;==============================================
loc_0326a2:
	move.b ($203,a6),d0
	move.w loc_0326ae(pc,d0.w),d1
	jmp loc_0326ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0326ae:
	dc.w loc_0326b0-loc_0326ae

;----------------------------------------------
loc_0326b0:
	tst.b (6,a6)
	beq.w loc_032710
	bsr.w loc_032cd6
	bne.w loc_032710
	rts

;==============================================
loc_0326c2:
	move.b ($203,a6),d0
	move.w loc_0326ce(pc,d0.w),d1
	jmp loc_0326ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0326ce:
	dc.w loc_0326d2-loc_0326ce
	dc.w loc_0326dc-loc_0326ce

;----------------------------------------------
loc_0326d2:
	tst.b (6,a6)
	beq.w loc_032710
	rts

;----------------------------------------------
loc_0326dc:
	tst.b (6,a6)
	beq.w loc_032710
	rts

;==============================================
loc_0326e6:
	cmpi.w #$200,(4,a6)
	bne.b loc_0326f6
	tst.b (6,a6)
	beq.w loc_032710

loc_0326f6:
	rts

;==============================================
loc_0326f8:
	move.b ($203,a6),d0
	move.w loc_032704(pc,d0.w),d1
	jmp loc_032704(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032704:
	dc.w loc_032706-loc_032704

;----------------------------------------------
loc_032706:
	tst.b (6,a6)
	beq.w loc_032710
	rts

;==============================================
loc_032710:
	clr.b ($201,a6)
	clr.w ($202,a6)
	rts

;==============================================
loc_03271a:
	clr.b ($21f,a6)
	clr.b ($246,a6)
	movea.l #Char_AI_Scripts,a0
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	move.b ($205,a6),d0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,($206,a6)
	move.l a0,($220,a6)
	move.l a0,($234,a6)
	clr.b ($215,a6)
	clr.b (PL_byte255,a6)
	rts

;==============================================
loc_032756:
	clr.b ($246,a6)
	movea.l #loc_0df512,a0
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	move.b ($205,a6),d0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jsr RNGFunction
	andi.w #$1f,d0
	add.b ($213,a6),d0
	move.b (a0,d0.w),d1
	move.b d1,($21f,a6)
	ext.w d1
	add.w d1,d1
	addi.w #$60,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,($206,a6)
	move.l a0,($224,a6)
	clr.b ($215,a6)
	clr.b (PL_byte255,a6)
	rts

;==============================================
loc_0327b0:
	clr.b ($246,a6)
	movea.l #loc_0df592,a0
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	movea.w ($38,a6),a4
	move.b ($c7,a4),d0
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	jsr RNGFunction
	andi.w #$1f,d0
	add.b ($213,a6),d0
	move.b (a0,d0.w),d1
	move.b d1,($21f,a6)
	ext.w d1
	add.w d1,d1
	addi.w #$60,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,($206,a6)
	move.l a0,($228,a6)
	clr.b ($215,a6)
	clr.b (PL_byte255,a6)
	rts

;==============================================
loc_032812:
	clr.b ($246,a6)
	movea.l #loc_0df612,a0
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l (a0,d0.w),a0
	moveq #0,d0
	move.b ($21e,a6),d0
	move.b d0,($21f,a6)
	add.w d0,d0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.w (a0)+,($206,a6)
	move.l a0,($22c,a6)
	clr.b ($215,a6)
	clr.b (PL_byte255,a6)
	rts

;==============================================
loc_03284e:
	tst.w (Dramatic_Mode_Type,a5)
	bne.b loc_032896
	moveq #0,d0
	lea.l loc_032d9c(pc),a1
	move.b ($127,a6),d0
	add.b d0,d0
	move.w (a1,d0.w),($21a,a6)
	moveq #0,d0
	move.b (PL_charid,a6),d0
	add.w d0,d0
	lea.l loc_032ddc(pc),a1
	move.w (a1,d0.w),d0
	add.w d0,($21a,a6)
	jsr RNGFunction
	andi.w #$3e,d0
	lea.l loc_032d5c(pc),a1
	move.w (a1,d0.w),d0
	add.w d0,($21a,a6)
	tst.w ($21a,a6)
	bpl.b loc_03289a

loc_032896:
	clr.w ($21a,a6)

loc_03289a:
	rts

;==============================================
loc_03289c:
	moveq #0,d0
	move.b (PL_charid,a6),d0
	lsl.b #2,d0
	movea.l #loc_0df412,a1
	movea.l (a1,d0.w),a1
	jmp (a1)

;==============================================
loc_0328b0:
	clr.b ($211,a6)
	btst #0,d1
	beq.b loc_0328be
	addq.b #1,($211,a6)

loc_0328be:
	move.b d1,(PL_Directioninput,a6)
	andi.b #$f,(PL_Directioninput,a6)
	btst #$b,d1
	bne.w loc_032900
	move.b d1,($2c0,a6)
	andi.b #$f0,($2c0,a6)
	lsr.w #7,d1
	move.b d1,($80,a6)
	andi.b #6,($80,a6)
	lsr.w #2,d1
	move.b d1,(PL_Attacktype,a6)
	andi.b #2,(PL_Attacktype,a6)
	lsr.w #3,d1
	move.b d1,(PL_ButtonStrength,a6)
	andi.b #$e,(PL_ButtonStrength,a6)
	rts

loc_032900:
	lsr.w #3,d1
	move.b d1,($aa,a6)
	andi.b #$7e,($aa,a6)
	lsr.w #6,d1
	move.b d1,(PL_Attacktype,a6)
	andi.b #2,(PL_Attacktype,a6)
	lsr.w #3,d1
	move.b d1,(PL_ButtonStrength,a6)
	andi.b #$e,(PL_ButtonStrength,a6)
	rts

;==============================================
loc_032926:
	tst.b ($246,a6)
	bne.w loc_032998
	tst.b ($214,a6)
	bne.w loc_032998
	movea.w ($38,a6),a4
	tst.b ($238,a4)
	bne.w loc_03294a
	tst.b ($a9,a4)
	beq.w loc_032998

loc_03294a:
	tst.b ($c7,a4)
	bmi.b loc_032998
	cmpi.w #$200,(4,a6)
	bne.b loc_032998
	cmpi.b #$a,(6,a6)
	beq.b loc_032998
	cmpi.b #$e,(6,a6)
	beq.b loc_032998
	cmpi.b #$10,($6,a6)
	beq.b loc_032998
	cmpi.b #$12,(6,a6)
	beq.b loc_032998
	movea.l #loc_0c845a,a1
	move.b (PL_charid,a6),d0
	ext.w d0
	lsl.w #7,d0
	lea.l (a1,d0.w),a1
	jsr loc_030a66
	beq.w loc_032998
	moveq #1,d0
	rts

loc_032998:
	moveq #0,d0
	rts

;==============================================
loc_03299c:
	move.b #4,($204,a6)
	clr.l ($200,a6)
	bra.w loc_030a80

;==============================================
loc_0329aa:
	move.w ($240,a6),d5
	beq.w loc_032a48
	cmpi.b #6,($204,a6)
	beq.w loc_032a48
	moveq #0,d6
	btst.l d6,d5
	beq.b loc_0329ca
	bsr.w loc_032a54
	bne.w loc_032a4c

loc_0329ca:
	moveq #1,d6
	btst.l d6,d5
	beq.b loc_032a10
	cmpi.l #$2020400,(pl_overall_state,a6)
	bne.b loc_032a10
	cmpi.w #$40,($21c,a6)
	bcc.b loc_032a10
	movea.w ($38,a6),a4
	movea.l (PL_Anim_Pnt,a4),a4
	move.l ($8,a4),d0
	beq.b loc_032a10
	clr.b ($5d,a6)
	clr.b ($5e,a6)
	clr.l ($b0,a6)
	clr.b ($d6,a6)
	move.b #5,($23f,a6)
	move.b (pl_sidecheck,a6),(PL_Flip,a6)
	bra.w loc_032a4c

loc_032a10:
	moveq #2,d6
	btst.l d6,d5
	beq.b loc_032a26
	cmpi.w #$60,($21c,a6)
	bcc.b loc_032a26
	bsr.w loc_032abc
	bne.w loc_032a4c

loc_032a26:
	moveq #3,d6
	btst.l d6,d5
	beq.b loc_032a48
	bsr.w loc_032a90
	beq.b loc_032a48
	movea.w ($38,a6),a4
	cmpi.w #$202,(4,a4)
	bne.b loc_032a48
	cmpi.b #$c,($54,a4)
	beq.w loc_032a4c

loc_032a48:
	moveq #0,d0
	rts

loc_032a4c:
	move.b d6,($21e,a6)
	moveq #1,d0
	rts

;==============================================
loc_032a54:
	bsr.w loc_032a90
	beq.b loc_032a88
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_032a88
	cmpi.w #$30,($21c,a6)
	bcc.b loc_032a88
	tst.b ($a9,a4)
	beq.b loc_032a88
	cmpi.w #$200,(4,a4)
	bne.b loc_032a88
	movea.w ($38,a6),a4
	movea.l (PL_Anim_Pnt,a4),a4
	move.l (8,a4),d0
	bne.b loc_032a8c

loc_032a88:
	moveq #0,d0
	rts

loc_032a8c:
	moveq #1,d0
	rts

;==============================================
loc_032a90:
	cmpi.w #$200,(4,a6)
	bne.b loc_032a88
	cmpi.b #6,(6,a6)
	beq.b loc_032a88
	cmpi.b #$a,(6,a6)
	beq.b loc_032a88
	cmpi.b #$e,(6,a6)
	beq.b loc_032a88
	cmpi.b #$10,(6,a6)
	beq.b loc_032a88
	moveq #1,d0
	rts

;==============================================
loc_032abc:
	bsr.b loc_032a90
	beq.b loc_032a88
	movea.w ($38,a6),a4
	cmpi.l #$2020202,(pl_overall_state,a4)
	bne.b loc_032a88
	cmpi.b #4,($54,a4)
	bne.b loc_032a88
	tst.b ($2ca,a4)
	beq.b loc_032a88
	moveq #1,d0
	rts

;==============================================
loc_032ae0:
	move.b #6,($204,a6)
	clr.l ($200,a6)
	bra.w loc_030a80

;==============================================
loc_032aee:
	moveq #0,d0
	move.b (a0)+,d0
	bmi.w loc_032afe
	move.w loc_032b02(pc,d0.w),d1
	jmp loc_032b02(pc,d1.w)

loc_032afe:
	addq.l #1,1.w

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032b02:
	dc.w loc_032b1a-loc_032b02
	dc.w loc_032b4c-loc_032b02
	dc.w loc_032b68-loc_032b02
	dc.w loc_032b72-loc_032b02
	dc.w loc_032b72-loc_032b02
	dc.w loc_032b72-loc_032b02
	dc.w loc_032b82-loc_032b02
	dc.w loc_032b7c-loc_032b02

	dc.w loc_032b7c-loc_032b02
	dc.w loc_032c10-loc_032b02
	dc.w loc_032c26-loc_032b02
	dc.w loc_032b72-loc_032b02

;----------------------------------------------
loc_032b1a:
	move.b (a0)+,d0
	move.w loc_032b26(pc,d0.w),d1
	jsr loc_032b26(pc,d1.w)
	bra.b loc_032aee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032b26:
	dc.w loc_032c4a-loc_032b26;0124
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4a-loc_032b26;0124
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4a-loc_032b26;0124
	dc.w loc_032c4a-loc_032b26;0124
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4a-loc_032b26;0124
	dc.w loc_032c44-loc_032b26;011e
	dc.w loc_032c44-loc_032b26;011e
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128
	dc.w loc_032c4e-loc_032b26;0128

;----------------------------------------------
loc_032b4c:
	move.b (a0)+,d0
	move.w loc_032b58(pc,d0.w),d1
	jsr loc_032b58(pc,d1.w)
	bra.b loc_032aee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032b58:
	dc.w loc_032c4a-loc_032b58;00f2
	dc.w loc_032c4a-loc_032b58;00f2
	dc.w loc_032c4a-loc_032b58;00f2
	dc.w loc_032c4a-loc_032b58;00f2
	dc.w loc_032c4a-loc_032b58;00f2
	dc.w loc_032c44-loc_032b58;00ec
	dc.w loc_032c44-loc_032b58;00ec
	dc.w loc_032c44-loc_032b58;00ec

;----------------------------------------------
loc_032b68:
	move.b (a0)+,d0
	bsr.w loc_032c3e
	bra.w loc_032aee

;----------------------------------------------
loc_032b72:
	move.b (a0)+,d0
	bsr.w loc_032c4a
	bra.w loc_032aee

;----------------------------------------------
loc_032b7c:
	move.b (a0)+,d0
	bra.w loc_032aee

;----------------------------------------------
loc_032b82:
	move.b (a0)+,d0
	move.w loc_032b8c(pc,d0.w),d1
	jmp loc_032b8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032b8c:
	dc.w loc_032b92-loc_032b8c
	dc.w loc_032bf2-loc_032b8c
	dc.w loc_032bfc-loc_032b8c

;----------------------------------------------
loc_032b92:
	addq.b #1,($215,a6)

loc_032b96:
	move.w (a0)+,d0
	move.w loc_032ba4(pc,d0.w),d1
	jsr loc_032ba4(pc,d1.w)
	bra.w loc_032aee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032ba4:
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4a-loc_032ba4;00a6
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa
	dc.w loc_032c4e-loc_032ba4;00aa

;----------------------------------------------
loc_032bf2:
	cmp.b ($215,a6),d6
	bne.w loc_032aee
	rts

;----------------------------------------------
loc_032bfc:
	subq.b #1,($215,a6)
	move.b d6,d5
	sub.b ($215,a6),d5
	cmpi.b #1,d5
	bne.w loc_032aee
	rts

;----------------------------------------------
loc_032c10:
	move.b (a0)+,d0
	move.w loc_032c1e(pc,d0.w),d1
	jsr loc_032c1e(pc,d1.w)
	bra.w loc_032aee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032c1e:
	dc.w loc_032c44-loc_032c1e;26
	dc.w loc_032c44-loc_032c1e;26
	dc.w loc_032c4e-loc_032c1e;30
	dc.w loc_032c4e-loc_032c1e;30

;----------------------------------------------
loc_032c26:
	move.b (a0)+,d0
	move.w loc_032c30(pc,d0.w),d1
	jmp loc_032c30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032c30:
	dc.w loc_032b96-loc_032c30
	dc.w loc_032b96-loc_032c30
	dc.w loc_032c3a-loc_032c30
	dc.w loc_032c3a-loc_032c30
	dc.w loc_032c3a-loc_032c30

;==============================================
loc_032c3a:
	bra.w loc_032aee

;==============================================
loc_032c3e:
	lea.l (6,a0),a0
	rts

;==============================================
loc_032c44:
	lea.l (4,a0),a0
	rts

;==============================================
loc_032c4a:
	lea.l (2,a0),a0

loc_032c4e:
	rts

;==============================================
loc_032c50:
	movea.w ($38,a6),a4
	tst.b ($23f,a4)
	bne.b loc_032c96
	bra.b loc_032c60

;==============================================
loc_032c5c:
	movea.w ($38,a6),a4

loc_032c60:
	cmpi.w #$202,(4,a4)
	bne.b loc_032c72
	cmpi.b #$c,($54,a4)
	bne.b loc_032c96
	bra.b loc_032c92

loc_032c72:
	cmpi.w #$200,(4,a4)
	bne.b loc_032c96
	tst.b ($31,a4)
	bne.b loc_032c96
	tst.b ($25d,a4)
	bne.b loc_032c96
	movea.l (PL_Anim_Pnt,a4),a1
	move.l (8,a1),d2
	beq.w loc_032c96

loc_032c92:
	moveq #1,d0
	rts

loc_032c96:
	moveq #0,d0
	rts

;==============================================
loc_032c9a:
	move.l #$2020400,($200,a6)
	moveq #0,d0
	move.b (PL_charid,a6),d0
	add.w d0,d0
	lea.l loc_032e1c(pc),a1
	move.w (a1,d0.w),d1
	lea.l (a1,d1.w),a1
	jsr RNGFunction
	andi.w #$1f,d0
	move.b (a1,d0.w),d0
	lsl.w #3,d0
	lea.l ($20,a1,d0.w),a1
	move.l (a1)+,($208,a6)
	move.l (a1)+,($20c,a6)
	bra.w loc_031046

;==============================================
loc_032cd6:
	tst.b (pl_cc_cancelflag,a6)
	beq.b loc_032d00
	tst.b ($ce,a6)
	bne.b loc_032d00
	movea.w ($38,a6),a4
	tst.w (PL_HP,a4)
	bmi.w loc_032d00
	movea.l ($230,a6),a0
	move.b (a0),d0
	cmpi.b #6,d0
	beq.b loc_032d04
	cmpi.b #8,d0
	beq.b loc_032d04

loc_032d00:
	moveq #0,d0
	rts

loc_032d04:
	moveq #1,d0
	rts

;==============================================
loc_032d08:
	movea.w ($38,a6),a4
	tst.w (PL_HP,a4)
	bmi.w loc_032d4a
	movea.l ($230,a6),a0
	move.b (a0),d0
	cmpi.b #6,d0
	beq.b loc_032d46
	cmpi.b #8,d0
	beq.b loc_032d4e
	cmpi.b #Vism_Val,(PL_ism_choice,a6)
	beq.b loc_032d4a
	cmpi.b #$a,d0
	bne.b loc_032d4a
	moveq #$30,d0
	tst.b (PL_ism_choice,a6)
	beq.b loc_032d40
	move.w #$90,d0

loc_032d40:
	cmp.w (PL_meter,a6),d0
	bcs.b loc_032d4a

loc_032d46:
	moveq #1,d0
	rts

loc_032d4a:
	moveq #0,d0
	rts

loc_032d4e:
	tst.b ($238,a6)
	bne.b loc_032d4a
	tst.w ($a4,a6)
	bne.b loc_032d4a
	bra.b loc_032d46

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032d5c:
	dc.w $fffc,$fffd,$fffd,$fffd
	dc.w $fffe,$fffe,$fffe,$fffe
	dc.w $ffff,$ffff,$ffff,$ffff
	dc.w $ffff,$ffff,$ffff,$ffff
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0001,$0001,$0001,$0002
	dc.w $0002,$0003,$0003,$0004

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032d9c:
	dc.w $0012,$0011,$0010,$000f
	dc.w $000e,$000d,$000c,$000b
	dc.w $000a,$0009,$0008,$0007
	dc.w $0006,$0005,$0004,$0003
	dc.w $0002,$0002,$0002,$0002
	dc.w $0001,$0001,$0001,$0001
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032ddc:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032e1c:
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c

	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c

	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c

	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c
	dc.w loc_032e5c-loc_032e1c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032e5c:
	dc.w $0000,$0101,$0202,$0303,$0000,$0101,$0202,$0303
	dc.w $0000,$0101,$0202,$0303,$0000,$0101,$0202,$0303
	dc.w $0400,$0000,$0000,$0000,$0400,$4600,$ff02,$0048
	dc.w $0400,$4200,$ff04,$0008,$0400,$0600,$ff04,$0004