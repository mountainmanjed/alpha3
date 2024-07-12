
;##############################################
;
;##############################################
loc_07c4c2:
	move.b (3,a6),d0
	move.w loc_07c4ce(pc,d0.w),d1
	jmp loc_07c4ce(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c4ce:
	dc.w loc_07c4d6-loc_07c4ce
	dc.w loc_07c610-loc_07c4ce
	dc.w loc_07c7c4-loc_07c4ce
	dc.w loc_07c922-loc_07c4ce

;==============================================
loc_07c4d6:
	move.b (4,a6),d0
	move.w loc_07c4ec(pc,d0.w),d1
	jsr loc_07c4ec(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07cb62
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c4ec:
	dc.w loc_07c4f4-loc_07c4ec
	dc.w loc_07c552-loc_07c4ec
	dc.w loc_07cb5c-loc_07c4ec
	dc.w loc_07cb5c-loc_07c4ec

;----------------------------------------------
loc_07c4f4:
	addq.b #2,(4,a6)
	bsr.w loc_07cb72
	move.b #2,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	move.w #$c0,($10,a6)
	move.w #$ffc2,($14,a6)
	move.b #0,($b,a6)
	move.b #$1e,(7,a6)
	move.b #0,($3d,a6)
	moveq #2,d0
	tst.b ($143,a5)
	beq.b loc_07c540
	moveq #$1a,d0

loc_07c540:
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;----------------------------------------------
loc_07c552:
	move.b (5,a6),d0
	move.w loc_07c56e(pc,d0.w),d1
	jsr loc_07c56e(pc,d1.w)
	jsr loc_01b6b6
	bsr.w loc_07cd92
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c56e:
	dc.w loc_07c578-loc_07c56e
	dc.w loc_07c588-loc_07c56e
	dc.w loc_07c5b8-loc_07c56e
	dc.w loc_07c5ca-loc_07c56e
	dc.w loc_07c5f4-loc_07c56e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c578:
	addq.b #2,(5,a6)
	move.w #$14,($44,a6)
	move.w #$ffff,($4c,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c588:
	move.w ($44,a6),d0
	add.w ($4c,a6),d0
	add.w d0,($14,a6)
	move.w d0,($44,a6)
	cmpi.w #$80,($14,a6)
	blt.b loc_07c5b6
	addq.b #2,(5,a6)
	move.w #$80,($14,a6)
	move.b #1,($12c,a5)
	move.w #$20,($3a,a6)

loc_07c5b6:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c5b8:
	subq.w #1,($3a,a6)
	bpl.b loc_07c5c8
	addq.b #2,(5,a6)
	move.w #$3b,($12,a5)

loc_07c5c8:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c5ca:
	subq.b #1,($13,a5)
	bpl.b loc_07c5f2
	move.b #$3b,($13,a5)
	subq.b #1,($12,a5)
	bpl.b loc_07c5f2
	addq.b #2,(5,a6)
	move.b #2,($12c,a5)
	moveq #0,d0
	move.w d0,($12,a5)
	move.w #$18,($44,a6)

loc_07c5f2:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c5f4:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	cmpi.w #$120,($14,a6)
	bcs.b loc_07c60e
	move.b #3,($12c,a5)
	bra.w loc_07cb62

loc_07c60e:
	rts

;==============================================
loc_07c610:
	move.b (4,a6),d0
	move.w loc_07c626(pc,d0.w),d1
	jsr loc_07c626(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07cb62
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c626:
	dc.w loc_07c62e-loc_07c626
	dc.w loc_07c690-loc_07c626
	dc.w loc_07cb5c-loc_07c626
	dc.w loc_07cb5c-loc_07c626

;----------------------------------------------
loc_07c62e:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b #$e,(7,a6)
	move.b #1,($3d,a6)
	move.w #$c0,($10,a6)
	move.w #$110,($14,a6)
	move.w #$ffe0,($44,a6)
	move.w #2,($4c,a6)
	move.w #3,($3a,a6)
	moveq #$a,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;----------------------------------------------
loc_07c690:
	move.b (5,a6),d0
	move.w loc_07c6a0(pc,d0.w),d1
	jsr loc_07c6a0(pc,d1.w)
	bra.w loc_07cd92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c6a0:
	dc.w loc_07c6b0-loc_07c6a0
	dc.w loc_07c6bc-loc_07c6a0
	dc.w loc_07c6f6-loc_07c6a0
	dc.w loc_07c744-loc_07c6a0
	dc.w loc_07c774-loc_07c6a0
	dc.w loc_07c77e-loc_07c6a0
	dc.w loc_07c7a8-loc_07c6a0
	dc.w loc_07c7c0-loc_07c6a0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c6b0:
	subq.w #1,($3a,a6)
	bpl.b loc_07c6ba
	addq.b #2,(5,a6)

loc_07c6ba:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c6bc:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	add.w ($4c,a6),d0
	move.w d0,($44,a6)
	cmpi.w #$80,($14,a6)
	bhi.b loc_07c6ea
	addq.b #2,(5,a6)
	move.w #$80,($14,a6)
	move.b #4,($12c,a5)
	move.w #$20,($3a,a6)

loc_07c6ea:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c6f6:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w loc_07c724(pc,d0.w),($14,a6)
	move.w d0,($3a,a6)
	bne.b loc_07c718
	addq.b #2,(5,a6)
	move.w #$10,($3a,a6)
	move.w #$80,($14,a6)

loc_07c718:
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c724:
	dc.w $0080,$007c,$0084,$0078
	dc.w $0088,$0074,$008c,$0070
	dc.w $0090,$006c,$0094,$0068
	dc.w $0098,$0064,$009c,$0060

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c744:
	subq.w #1,($3a,a6)
	bpl.b loc_07c768
	addq.b #2,(5,a6)
	move.b #5,($12c,a5)
	moveq #0,d0
	movea.l #loc_07cdd2,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

loc_07c768:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c774:
	addq.b #2,(5,a6)
	move.b #6,($12c,a5)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c77e:
	tst.b ($33,a6)
	beq.b loc_07c79c
	addq.b #2,(5,a6)
	moveq #$b,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

loc_07c79c:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c7a8:
	tst.b ($33,a6)
	bpl.b loc_07c7b4
	addq.b #2,(5,a6)
	rts

loc_07c7b4:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c7c0:
	bra.w loc_07cb62

;==============================================
loc_07c7c4:
	move.b (4,a6),d0
	move.w loc_07c7d0(pc,d0.w),d1
	jmp loc_07c7d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c7d0:
	dc.w loc_07c7d8-loc_07c7d0
	dc.w loc_07c838-loc_07c7d0
	dc.w loc_07cb5c-loc_07c7d0
	dc.w loc_07cb5c-loc_07c7d0

;----------------------------------------------
loc_07c7d8:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.b d0,($31,a6)
	move.b #$f,(7,a6)
	move.b #3,($3d,a6)
	move.w #$1e4,($10,a6)
	move.w #$98,($14,a6)
	move.w #$fff0,($40,a6)
	move.w #$12c,($3a,a6)
	moveq #$17,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;----------------------------------------------
loc_07c838:
	cmpi.b #5,($12c,a5)
	bne.b loc_07c85c
	tst.b ($31,a6)
	bne.b loc_07c85c
	st.b ($31,a6)
	move.w #$70,($10,a6)
	move.w #$10,($3a,a6)
	move.b #2,(5,a6)

loc_07c85c:
	move.b (5,a6),d0
	move.w loc_07c86c(pc,d0.w),d1
	jsr loc_07c86c(pc,d1.w)
	bra.w loc_07cd92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c86c:
	dc.w loc_07c876-loc_07c86c
	dc.w loc_07c89c-loc_07c86c
	dc.w loc_07c8cc-loc_07c86c
	dc.w loc_07c8e8-loc_07c86c
	dc.w loc_07c910-loc_07c86c

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c876:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$70,($10,a6)
	bcc.b loc_07c896
	addq.b #2,(5,a6)
	move.w #$12c,($3a,a6)
	move.w #$70,($10,a6)

loc_07c896:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c89c:
	subq.w #1,($3a,a6)
	bmi.b loc_07c8ae
	jsr loc_01b6b6
	jmp loc_01b4ec

loc_07c8ae:
	addq.b #2,(5,a6)
	move.b #6,($12c,a5)
	moveq #2,d0
	movea.l #loc_07cdd2,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c8cc:
	tst.b ($33,a6)
	bpl.b loc_07c8dc
	addq.b #2,(5,a6)
	move.w #$ffff,($48,a6)

loc_07c8dc:
	jsr loc_01b6b6
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c8e8:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	add.w ($48,a6),d0
	move.w d0,($40,a6)
	cmpi.w #$ff98,($10,a6)
	bgt.b loc_07c90a
	addq.b #2,(5,a6)
	move.w #$a,($3a,a6)

loc_07c90a:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c910:
	subq.w #1,($3a,a6)
	bpl.w loc_07cb70
	move.b #7,($12c,a5)
	bra.w loc_07cb62

;==============================================
loc_07c922:
	move.b (4,a6),d0
	move.w loc_07c92e(pc,d0.w),d1
	jmp loc_07c92e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c92e:
	dc.w loc_07c936-loc_07c92e
	dc.w loc_07c9e8-loc_07c92e
	dc.w loc_07cb5c-loc_07c92e
	dc.w loc_07cb5c-loc_07c92e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c936:
	addq.b #2,(4,a6)
	bsr.w loc_07cb96
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	clr.w ($c,a6)
	move.b #0,($b,a6)
	clr.b ($12c,a5)
	move.w #$c0,($10,a6)
	move.w #$80,($14,a6)
	move.b #4,(5,a6)
	move.b #$8,(9,a6)
	move.w #$b4,($3a,a6)
	moveq #$13,d0
	move.b #$1e,(7,a6)
	move.b #$8,($3d,a6)
	tst.b ($10d,a5)
	bne.b loc_07c9d6
	move.b #2,(5,a6)
	move.b #8,(9,a6)
	move.w #$b4,($3a,a6)
	moveq #$12,d0
	move.b #$1e,(7,a6)
	move.b #7,($3d,a6)
	tst.b ($15a,a5)
	bne.b loc_07c9d6
	move.b #0,(5,a6)
	move.b #$e,(9,a6)
	move.w #$78,($3a,a6)
	moveq #$d,d0
	move.b #$f,(7,a6)
	move.b #2,($3d,a6)

loc_07c9d6:
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c9e8:
	move.b (5,a6),d0
	move.w loc_07c9f8(pc,d0.w),d1
	jsr loc_07c9f8(pc,d1.w)
	bra.w loc_07cd92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c9f8:
	dc.w loc_07c9fe-loc_07c9f8
	dc.w loc_07cad8-loc_07c9f8
	dc.w loc_07caf4-loc_07c9f8

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07c9fe:
	move.b (6,a6),d0
	move.w loc_07ca10(pc,d0.w),d1
	jsr loc_07ca10(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ca10:
	dc.w loc_07ca1a-loc_07ca10
	dc.w loc_07ca48-loc_07ca10
	dc.w loc_07ca7c-loc_07ca10
	dc.w loc_07ca8e-loc_07ca10
	dc.w loc_07cab0-loc_07ca10

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07ca1a:
	tst.b ($33,a6)
	bpl.w loc_07cb6a
	addq.b #2,(6,a6)
	move.w #$78,($3a,a6)
	move.w #$ffa0,($10,a6)
	move.l #$18000,($40,a6)
	moveq #1,d0
	movea.l #loc_07cdd2,a0
	jmp loc_01b6e0

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07ca48:
	subq.w #1,($3a,a6)
	bpl.b loc_07ca7a
	addq.b #2,(6,a6)
	clr.w ($3a,a6)
	move.b #2,($12c,a5)
	tst.b ($161,a5)
	beq.b loc_07ca74
	move.b #$f,(7,a6)
	move.b #5,($3d,a6)
	move.w #$3c,($3a,a6)

loc_07ca74:
	addi.w #$3c,($3a,a6)

loc_07ca7a:
	rts

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07ca7c:
	subq.w #1,($3a,a6)
	bpl.b loc_07ca8c
	addq.b #2,(6,a6)
	move.b #4,($12c,a5)

loc_07ca8c:
	bra.b loc_07cabe

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07ca8e:
	cmpi.b #6,($12c,a5)
	bne.w loc_07cabe
	addq.b #2,(6,a6)
	move.w #$c0,($10,a6)
	moveq #$1e,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07cab0:
	tst.b ($33,a6)
	bmi.w loc_07cb62
	jmp loc_01b6b6

;----------------------------------------------
loc_07cabe:
	tst.b (pause_check,a5)
	bne.b loc_07cad6
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	blt.b loc_07cad6
	move.w ($34,a6),d0
	sub.w d0,($10,a6)

loc_07cad6:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07cad8:
	subq.w #1,($3a,a6)
	bpl.b loc_07cae8
	move.b #4,($12c,a5)
	bra.w loc_07cb62

loc_07cae8:
	jsr loc_01b6b6
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07caf4:
	move.b (6,a6),d0
	move.w loc_07cb00(pc,d0.w),d1
	jmp loc_07cb00(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cb00:
	dc.w loc_07cb04-loc_07cb00
	dc.w loc_07cb4a-loc_07cb00

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07cb04:
	subq.w #1,($3a,a6)
	bpl.b loc_07cb3e
	addq.b #2,(6,a6)
	move.b #2,($12c,a5)
	tst.b ($15a,a5)
	bne.b loc_07cb34
	tst.b ($161,a5)
	beq.b loc_07cb34
	move.w #$3c,($3a,a6)
	move.b #$f,(7,a6)
	move.b #5,($3d,a6)
	rts

loc_07cb34:
	move.b #4,($12c,a5)
	bra.w loc_07cb62

loc_07cb3e:
	jsr loc_01b6b6
	jmp loc_01b4ec

;x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x-x
loc_07cb4a:
	subq.w #1,($3a,a6)
	bpl.w loc_07cb6a
	move.b #4,($12c,a5)
	bra.w loc_07cb62

;----------------------------------------------
loc_07cb5c:
	jmp loc_01c28e

;----------------------------------------------
loc_07cb62:
	move.b #4,(4,a6)
	rts

;----------------------------------------------
loc_07cb6a:
	jmp loc_01b6b6

;----------------------------------------------
loc_07cb70:
	rts

;==============================================
loc_07cb72:;Round Start Palette load
	movea.l #loc_35f114,a0
	move.w (Main_stageid,a5),d0
	adda.w loc_07cbac(pc,d0.w),a0
	movea.l #$90c3c0,a1
	bra.b loc_07cbec

;==============================================
loc_07cb88:
	movea.l #loc_35f9b4,a0
	movea.l #$90c3c0,a1
	bra.b loc_07cbec

;==============================================
loc_07cb96:;Round End Palette load
	movea.l #loc_35f414,a0
	move.w (Main_stageid,a5),d0
	adda.w loc_07cbac(pc,d0.w),a0
	movea.l #$90c3c0,a1
	bra.b loc_07cbec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;offsets
loc_07cbac:
	dc.w $0000,$0020,$0040,$0060,$0080,$00a0,$00c0,$00e0
	dc.w $0100,$0120,$0140,$0160,$0180,$01a0,$01c0,$01e0
	dc.w $0200,$0220,$0080,$0220,$0040,$0000,$0240,$0000
	dc.w $0260,$0280,$02a0,$02c0,$02e0,$01a0,$0240,$0240

;==============================================
loc_07cbec:
	move.l (a1),d4
	andi.l #$f000f000,d4
	movem.l (a0)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a0)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a1)
	rts

;##############################################
;
;##############################################
loc_07cc1a:
	andi.w #6,d0
	move.w loc_07cc26(pc,d0.w),d1
	jmp loc_07cc26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cc26:
	dc.w loc_07cc2e-loc_07cc26
	dc.w loc_07cc7a-loc_07cc26
	dc.w loc_07ccd8-loc_07cc26
	dc.w loc_07cd36-loc_07cc26

;==============================================
loc_07cc2e:
	cmpi.b #5,($6eb8,a5)
	bcs.b loc_07cc78
	jsr loc_01c278
	move.l #$01000000,(a4)
	jsr loc_01c278
	move.l #$01000100,(a4)
	jsr loc_01c278
	move.l #$01000102,(a4)
	jsr loc_01c278
	move.l #$01000104,(a4)
	move.w #$100,($12,a5)
	jsr loc_01c278
	move.l #$0100011a,(a4)

loc_07cc78:
	rts

;==============================================
loc_07cc7a:
	cmpi.b #3,($6eb8,a5)
	bcs.b loc_07ccd6
	jsr loc_01c278
	move.l #$01000002,(a4)
	jsr loc_01c278
	move.l #$01000108,(a4)
	move.b #2,(9,a4)
	move.w #$fe80,($10,a4)
	move.w #$9a,($14,a4)
	move.w #$28,($40,a4)
	jsr loc_01c278
	move.l #$01000108,(a4)
	move.b #4,(9,a4)
	move.w #$180,($10,a4)
	move.w #$67,($14,a4)
	move.w #$ffd8,($40,a4)

loc_07ccd6:
	rts

;==============================================
loc_07ccd8:
	jsr loc_01c278
	beq.b loc_07cd34
	move.l #$01000004,(a4)
	tst.b ($110,a5)
	beq.b loc_07ccf2
	tst.b ($105,a5)
	beq.b loc_07cd34

loc_07ccf2:
	cmpi.b #2,($6eb8,a5)
	bcs.w loc_07cb70
	tst.b ($15d,a5)
	bne.b loc_07cd1c
	jsr loc_01c278
	move.l #$01000112,(a4)
	jsr loc_01c278
	move.l #$0100011e,(a4)
	bra.b loc_07cd34

loc_07cd1c:
	jsr loc_01c278
	move.l #$01000110,(a4)
	jsr loc_01c278
	move.l #$0100010e,(a4)

loc_07cd34:
	rts

;==============================================
loc_07cd36:
	jsr loc_01c278
	beq.w loc_07cb70
	move.l #$01000006,(a4)
	tst.b ($10d,a5)
	bne.b loc_07cd76
	tst.b ($15a,a5)
	bne.w loc_07cb70
	cmpi.b #2,($6eb8,a5)
	bcs.w loc_07cb70
	jsr loc_01c278
	move.l #$01000114,(a4)
	jsr loc_01c278
	move.l #$01000116,(a4)

loc_07cd76:
	tst.b ($15a,a5)
	bne.b loc_07cd90
	tst.b ($161,a5)
	beq.b loc_07cd90
	jsr loc_01c278
	beq.b loc_07cd90
	move.l #$01000118,(a4)

loc_07cd90:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07cd92:
	tst.b ($7,a6)
	beq.b loc_07cdac
	subq.b #1,($7,a6)
	bne.b loc_07cdac
	moveq #0,d0
	move.b ($3d,a6),d0
	lsl.w #2,d0
	movea.l loc_07cdae(pc,d0.w),a0
	jmp (a0)

loc_07cdac:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cdae:
	dc.l loc_003b40,loc_003b6c,loc_003b8e,loc_003ba8
	dc.l loc_003bc2,loc_003bdc,loc_003bf6,loc_003c10
	dc.l loc_003c2a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cdd2:
	dc.w loc_07cdda-loc_07cdd2
	dc.w loc_07ce02-loc_07cdd2
	dc.w loc_07ce0a-loc_07cdd2
	dc.w $0000

loc_07cdda:
	dc.w $0100,$0000
	dc.l loc_07ce1a
	dc.w $0100,$0000
	dc.l loc_07ce4a

	dc.w $0100,$0000
	dc.l loc_07ce78
	dc.w $0100,$0000
	dc.l loc_07ce9e

	dc.w $0140,$0000
	dc.l loc_07cebc

loc_07ce02:
	dc.w $ff40,$0060
	dc.l loc_07ceca

loc_07ce0a:
	dc.w $0100,$0000
	dc.l loc_07cf00
	dc.w $0140,$0000
	dc.l loc_07cf26

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ce1a:
	dc.w $000e,$0048
	dc.w $0005,$231e
	dc.w $0007,$ce32
	dc.w $2400,$2400,$2400,$2400,$2400,$2400
	dc.w $ff40,$ffe8,$ff80,$ffe8,$ffc0,$ffe8
	dc.w $0000,$ffe8,$0040,$ffe8,$0080,$ffe8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ce4a:
	dc.w $0008,$0039,$0004
	dc.w $2400,$231e,$ff68,$ffe8
	dc.w $2400,$231e,$ffa8,$ffe8
	dc.w $2400,$221e,$ffe8,$ffe8
	dc.w $2400,$231e,$0018,$ffe8
	dc.w $2400,$231e,$0058,$ffe8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ce78:
	dc.w $0008,$002a,$0003
	dc.w $2400,$231e,$ff90,$ffe8
	dc.w $2400,$221e,$ffd0,$ffe8
	dc.w $2400,$221e,$0000,$ffe8
	dc.w $2400,$231e,$0030,$ffe8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ce9e:
	dc.w $0008,$001b,$0002
	dc.w $2400,$221e,$ffb8,$ffe8
	dc.w $2400,$221e,$ffe8,$ffe8
	dc.w $2400,$221e,$0018,$ffe8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cebc:
	dc.w $0008,$000c,$0000
	dc.w $2400,$231e,$ffe0,$ffe8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ceca:
	dc.w $0008,$001f,$0005
	dc.w $061f,$001e,$fff0,$fff8
	dc.w $061a,$051e,$0000,$fff8
	dc.w $061a,$051e,$0060,$fff8
	dc.w $061a,$051e,$00c0,$fff8
	dc.w $061a,$051e,$0120,$fff8
	dc.w $061a,$051e,$0180,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cf00:
	dc.w $0008,$000d,$0003
	dc.w $2400,$031e,$ff98,$0000
	dc.w $2400,$031e,$ffd8,$0000
	dc.w $2400,$031e,$0018,$0000
	dc.w $2400,$001e,$0058,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cf26:
	dc.w $0008,$000d,$0001
	dc.w $2ad2,$061e,$ff98,$0000
	dc.w $2ad2,$051e,$0008,$0000

;##############################################
;Intro State 2
loc_07cf3c:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_07cf4c(pc,d0.w),d1
	jmp loc_07cf4c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cf4c:
	dc.w loc_07cf6c-loc_07cf4c
	dc.w loc_07d09c-loc_07cf4c
	dc.w loc_07d17e-loc_07cf4c
	dc.w loc_07d272-loc_07cf4c
	dc.w loc_07d274-loc_07cf4c
	dc.w loc_07d30e-loc_07cf4c
	dc.w loc_07d310-loc_07cf4c
	dc.w loc_07d312-loc_07cf4c

	dc.w loc_07d43a-loc_07cf4c
	dc.w loc_07d51a-loc_07cf4c
	dc.w loc_07d6b2-loc_07cf4c
	dc.w loc_07d7d8-loc_07cf4c
	dc.w loc_07d8a2-loc_07cf4c
	dc.w loc_07da82-loc_07cf4c
	dc.w loc_07dcb4-loc_07cf4c
	dc.w loc_07dcb6-loc_07cf4c

;==============================================
loc_07cf6c:
	move.b (4,a6),d0
	move.w loc_07cf82(pc,d0.w),d1
	jsr loc_07cf82(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07df24
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07cf82:
	dc.w loc_07cf8a-loc_07cf82
	dc.w loc_07cffa-loc_07cf82
	dc.w loc_07df1e-loc_07cf82
	dc.w loc_07df1e-loc_07cf82

;----------------------------------------------
loc_07cf8a:
	addq.b #2,(4,a6)
	move.b #0,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$80,($14,a6)
	moveq #9,d0
	move.w #$1b3,($10,a6)
	move.w #$ffd8,($40,a6)
	move.w #2,($48,a6)
	move.w #$38,($4e,a6)
	tst.b ($143,a5)
	bne.b loc_07cfee
	move.w ($102,a5),d0
	addq.w #4,d0
	move.w #$ffcd,($10,a6)
	neg.w ($40,a6)
	neg.w ($48,a6)
	move.w #$148,($4e,a6)

loc_07cfee:
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07cffa:
	move.b (5,a6),d0
	move.w loc_07d012(pc,d0.w),d1
	jsr loc_07d012(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d012:
	dc.w loc_07d01a-loc_07d012
	dc.w loc_07d03c-loc_07d012
	dc.w loc_07d066-loc_07d012
	dc.w loc_07d082-loc_07d012

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d01a:
	move.w ($40,a6),d0
	add.w ($48,a6),d0
	add.w d0,($10,a6)
	move.w d0,($40,a6)
	move.w ($10,a6),d1
	subi.w #$c0,d1
	eor.w d0,d1
	bmi.b loc_07d03a
	addq.b #2,(5,a6)

loc_07d03a:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d03c:
	move.w ($40,a6),d0
	add.w ($48,a6),d0
	add.w d0,($10,a6)
	move.w d0,($40,a6)
	move.w ($10,a6),d0
	subi.w #$38,d0
	cmpi.w #$110,d0
	bcs.b loc_07d064
	addq.b #2,(5,a6)
	move.w ($4e,a6),($10,a6)

loc_07d064:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d066:
	cmpi.b #2,($12c,a5)
	bne.b loc_07d080
	addq.b #2,(5,a6)
	moveq #$30,d0
	tst.b ($143,a5)
	beq.b loc_07d07c
	neg.w d0

loc_07d07c:
	move.w d0,($40,a6)

loc_07d080:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d082:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d0
	subi.w #$ffd8,d0
	cmpi.w #$1e0,d0
	bhi.w loc_07df24
	rts

;==============================================
loc_07d09c:
	move.b (4,a6),d0
	move.w loc_07d0b2(pc,d0.w),d1
	jsr loc_07d0b2(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07df24
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d0b2:
	dc.w loc_07d0ba-loc_07d0b2
	dc.w loc_07d128-loc_07d0b2
	dc.w loc_07df1e-loc_07d0b2
	dc.w loc_07df1e-loc_07d0b2

;----------------------------------------------
loc_07d0ba:
	addq.b #2,(4,a6)
	move.b #4,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$98,($14,a6)
	move.w #$ff10,($10,a6)
	move.w #$20,($40,a6)
	move.w #$90,($4e,a6)
	tst.b ($143,a5)
	beq.b loc_07d10c
	move.w #$260,($10,a6)
	neg.w ($40,a6)
	move.w #$e0,($4e,a6)

loc_07d10c:
	jsr RNGFunction
	moveq #0,d0
	andi.w #1,d1
	beq.b loc_07d11c
	moveq #$e,d0

loc_07d11c:
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d128:
	move.b (5,a6),d0
	move.w loc_07d134(pc,d0.w),d1
	jmp loc_07d134(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d134:
	dc.w loc_07d13a-loc_07d134
	dc.w loc_07d148-loc_07d134
	dc.w loc_07d16e-loc_07d134

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d13a:
	cmpi.b #1,($12c,a5)
	bne.b loc_07d146
	addq.b #2,(5,a6)

loc_07d146:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d148:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d0
	subi.w #$90,d0
	cmpi.w #$50,d0
	bhi.b loc_07d168
	addq.b #2,(5,a6)
	move.w ($4e,a6),($10,a6)

loc_07d168:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d16e:
	cmpi.b #2,($12c,a5)
	bcc.w loc_07df24
	jmp loc_01b4ec

;==============================================
loc_07d17e:
	move.b (4,a6),d0
	move.w loc_07d194(pc,d0.w),d1
	jsr loc_07d194(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07df24
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d194:
	dc.w loc_07d19c-loc_07d194
	dc.w loc_07d1fc-loc_07d194
	dc.w loc_07df1e-loc_07d194
	dc.w loc_07df1e-loc_07d194

;----------------------------------------------
loc_07d19c:
	addq.b #2,(4,a6)
	move.b #6,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$69,($14,a6)
	move.w #$ff28,($10,a6)
	move.w #$20,($40,a6)
	move.w #$a8,($4e,a6)
	tst.b ($143,a5)
	bne.b loc_07d1ee
	move.w #$1d8,($10,a6)
	neg.w ($40,a6)
	move.w #$58,($4e,a6)

loc_07d1ee:
	moveq #1,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d1fc:
	move.b (5,a6),d0
	move.w loc_07d208(pc,d0.w),d1
	jmp loc_07d208(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d208:
	dc.w loc_07d210-loc_07d208
	dc.w loc_07d21e-loc_07d208
	dc.w loc_07d23c-loc_07d208
	dc.w loc_07d262-loc_07d208

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d210:
	cmpi.b #1,($12c,a5)
	bne.b loc_07d21c
	addq.b #2,(5,a6)

loc_07d21c:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d21e:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d1
	subi.w #$80,d1
	eor.w d0,d1
	bmi.b loc_07d236
	addq.b #2,(5,a6)

loc_07d236:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d23c:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d0
	subi.w #$58,d0
	cmpi.w #$50,d0
	bcs.b loc_07d25c
	addq.b #2,(5,a6)
	move.w ($4e,a6),($10,a6)

loc_07d25c:
	jmp loc_01b4ec

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d262:
	cmpi.b #2,($12c,a5)
	bcc.w loc_07df24
	jmp loc_01b4ec

;==============================================
loc_07d272:
	rts

;==============================================
loc_07d274:
	move.b (4,a6),d0
	move.w loc_07d28a(pc,d0.w),d1
	jsr loc_07d28a(pc,d1.w)
	tst.b ($8a,a5)
	bne.w loc_07df24
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d28a:
	dc.w loc_07d292-loc_07d28a
	dc.w loc_07d2be-loc_07d28a
	dc.w loc_07df1e-loc_07d28a
	dc.w loc_07df1e-loc_07d28a

;----------------------------------------------
loc_07d292:
	addq.b #2,(4,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	moveq #0,d0
	movea.l #loc_07e0e6,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d2be:
	move.b (5,a6),d0
	move.w loc_07d2d0(pc,d0.w),d1
	jsr loc_07d2d0(pc,d1.w)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d2d0:
	dc.w loc_07d2d6-loc_07d2d0
	dc.w loc_07d2f0-loc_07d2d0
	dc.w loc_07d304-loc_07d2d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d2d6:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d1
	eor.w d0,d1
	bmi.b loc_07d2ee
	addq.b #2,(5,a6)
	clr.w ($10,a6)

loc_07d2ee:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d2f0:
	cmpi.b #5,($12c,a5)
	bne.b loc_07d302
	addq.b #2,(5,a6)
	move.b #1,($3a,a6)

loc_07d302:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07d304:
	subq.b #1,($3a,a6)
	bmi.w loc_07df24
	rts

;==============================================
loc_07d30e:
	rts

;==============================================
loc_07d310:
	rts

;==============================================
;Score Tally
loc_07d312:
	move.b (4,a6),d0
	move.w loc_07d31e(pc,d0.w),d1
	jmp loc_07d31e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d31e:
	dc.w loc_07d326-loc_07d31e
	dc.w loc_07dee4-loc_07d31e
	dc.w loc_07df1e-loc_07d31e
	dc.w loc_07df1e-loc_07d31e

;----------------------------------------------
loc_07d326:
	addq.b #2,($4,a6)
	move.b #8,($9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$17,($3a,a6)
	move.w #$f0,($10,a6)
	move.w #$78,($14,a6)
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-$4,a0)
	move.l #$e000a,(a0)+
	move.l #$9001e,(a0)+
	move.l #loc_07e424,(a0)+
	bsr.w loc_07d394
	bsr.w loc_07d39e
	bsr.w loc_07d3a8
	bra.w loc_07d3b2

;----------------------------------------------
loc_07d394:
	moveq #0,d0
	move.b (-$7084,a5),d0
	bra.w loc_07d3e0

;----------------------------------------------
loc_07d39e:
	moveq #0,d0
	move.b (-$7083,a5),d0
	bra.w loc_07d3e0

;----------------------------------------------
loc_07d3a8:
	moveq #0,d0
	move.b (-$7081,a5),d0
	bra.w loc_07d3e0

;----------------------------------------------
loc_07d3b2:
	moveq #0,d0
	moveq #0,d2
	moveq #3,d7
	move.w (-$7080,a5),d0

loc_07d3bc:
	rol.w #4,d0
	move.w d0,d1
	andi.w #$f,d1
	add.w d1,d1
	beq.b loc_07d3ca
	st.b d2

loc_07d3ca:
	tst.b d2
	bne.b loc_07d3d6
	tst.b d7
	beq.b loc_07d3d6
	addi.w #$20,d1

loc_07d3d6:
	move.w loc_07d3fa(pc,d1.w),(a0)+
	dbra d7,loc_07d3bc
	rts

loc_07d3e0:
	move.w d0,d1
	andi.w #$f0,d0
	andi.w #$f,d1
	lsr.w #4,d0
	add.w d0,d0
	add.w d1,d1
	move.w loc_07d41a(pc,d0.w),(a0)+
	move.w loc_07d3fa(pc,d1.w),(a0)+
	rts

;##############################################
loc_07d3fa:
	dc.w $0340,$0341,$0342,$0343,$0344,$0345,$0346,$0347
	dc.w $0348,$0349,$0349,$0349,$0349,$0349,$0349,$0349

loc_07d41a:
	dc.w $0020,$0341,$0342,$0343,$0344,$0345,$0346,$0347
	dc.w $0348,$0349,$0349,$0349,$0349,$0349,$0349,$0349

;==============================================
loc_07d43a:
	move.b (4,a6),d0
	move.w loc_07d446(pc,d0.w),d1
	jmp loc_07d446(pc,d1.w)

;##############################################
loc_07d446:
	dc.w loc_07d44e-loc_07d446
	dc.w loc_07d5ee-loc_07d446
	dc.w loc_07df1e-loc_07d446
	dc.w loc_07df1e-loc_07d446

;----------------------------------------------
loc_07d44e:
	addq.b #2,($4,a6)
	move.b #$a,($9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$ff70,($10,a6)
	move.w #$78,($14,a6)
	move.w #$10,($40,a6)
	move.w #0,($3a,a6)
	lea.l ($44,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	movea.l #loc_07e460,a1
	movem.l (a1)+,d0-d7
	movem.l d0-d7,(a0)
	lea.l ($20,a0),a0
	movem.l (a1)+,d0-d3
	movem.l d0-d3,(a0)
	lea.l ($10,a0),a0
	move.w (a1)+,(a0)+
	move.b #9,($31,a6)
	moveq #0,d0
	move.b (-$7082,a5),d0
	andi.w #$f,d0
	lsl.w #2,d0
	move.l loc_07d4da(pc,d0.w),($6a,a6)
	rts

;##############################################
loc_07d4da:
	dc.l $0020001d,$26530015,$26520015,$26500018
	dc.l $0020001d,$00200000,$00200000,$00200016
	dc.l $26570016,$26580016,$26540016,$26550016
	dc.l $26560016,$00200000,$00200000,$00200000

;==============================================
loc_07d51a:
	move.b (4,a6),d0
	move.w loc_07d526(pc,d0.w),d1
	jmp loc_07d526(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d526:
	dc.w loc_07d52e-loc_07d526
	dc.w loc_07d5ee-loc_07d526
	dc.w loc_07df1e-loc_07d526
	dc.w loc_07df1e-loc_07d526

;----------------------------------------------
loc_07d52e:
	addq.b #2,(4,a6)
	move.b #$a,($9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$ff70,($10,a6)
	move.w #$78,($14,a6)
	move.w #$10,($40,a6)
	move.w #0,($3a,a6)
	lea.l ($44,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.w #8,(a0)+
	move.l #$120001,d7
	moveq #0,d0
	move.b #4,($31,a6)
	tst.b ($110,a5)
	bne.b loc_07d5ce
	move.l #$1b0002,d7
	moveq #4,d0
	move.b #8,($31,a6)
	tst.b ($105,a5)
	beq.b loc_07d5ce
	move.l #$2d0004,d7
	moveq #$a,d0
	move.b #$a,($31,a6)
	tst.b ($120,a5)
	bne.b loc_07d5ce
	move.l #$240003,d7
	moveq #$c,d0
	move.b #9,($31,a6)

loc_07d5ce:
	move.l d7,(a0)+
	lea.l loc_07e44c(pc),a1
	lea.l (a1,d0.w),a1
	move.w #$81e,d1
	moveq #0,d2

loc_07d5de:
	move.w (a1)+,(a0)+
	move.w d1,(a0)+
	move.l d2,(a0)+
	addi.w #$10,d2
	dbra d7,loc_07d5de
	rts

;----------------------------------------------
loc_07d5ee:
	cmpi.b #5,($12c,a5)
	bne.b loc_07d602
	move.b #6,(5,a6)
	move.w #$f0,($10,a6)

loc_07d602:
	move.b (5,a6),d0
	move.w loc_07d60e(pc,d0.w),d1
	jmp loc_07d60e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d60e:
	dc.w loc_07d618-loc_07d60e
	dc.w loc_07d624-loc_07d60e
	dc.w loc_07d644-loc_07d60e
	dc.w loc_07d654-loc_07d60e
	dc.w loc_07d688-loc_07d60e

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d618:
	subq.w #1,($3a,a6)
	bmi.b loc_07d620
	rts

loc_07d620:
	addq.b #2,(5,a6)

loc_07d624:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	cmpi.w #$f0,($10,a6)
	blt.b loc_07d63e
	addq.b #2,(5,a6)
	move.b #3,($32,a6)

loc_07d63e:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d644:
	subq.b #1,($32,a6)
	bpl.b loc_07d64e
	addq.b #2,(5,a6)

loc_07d64e:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d654:
	cmpi.b #6,($12c,a5)
	bne.b loc_07d682
	addq.b #2,(5,a6)
	move.w #4,($3a,a6)
	move.w #$10,($40,a6)
	move.w #1,($42,a6)
	move.b ($31,a6),d0
	movea.l #loc_07e0e6,a0
	jsr loc_01b6e0

loc_07d682:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d688:
	cmpi.b #7,($12c,a5)
	bcc.w loc_07df24
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	add.w ($42,a6),d0
	move.w d0,($40,a6)
	cmpi.w #$180,($10,a6)
	bcc.w loc_07df24
	jmp loc_01b4ec

;==============================================
loc_07d6b2:
	move.b (4,a6),d0
	move.w loc_07d6be(pc,d0.w),d1
	jmp loc_07d6be(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d6be:
	dc.w loc_07d6c6-loc_07d6be
	dc.w loc_07d71c-loc_07d6be
	dc.w loc_07df1e-loc_07d6be
	dc.w loc_07df1e-loc_07d6be

;----------------------------------------------
loc_07d6c6:
	addq.b #2,($4,a6)
	move.b #8,($9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$10,($3a,a6)
	move.w #$9a,($10,a6)
	move.w #$160,($14,a6)
	move.w #$8c,($4a,a6)
	move.w #$fff0,($40,a6)
	move.w #$fff0,($44,a6)
	moveq #$f,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d71c:
	move.b (5,a6),d0
	move.w loc_07d734(pc,d0.w),d1
	jsr loc_07d734(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d734:
	dc.w loc_07d73e-loc_07d734
	dc.w loc_07d74a-loc_07d734
	dc.w loc_07d772-loc_07d734
	dc.w loc_07d7b0-loc_07d734
	dc.w loc_07d7be-loc_07d734

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d73e:
	subq.w #1,($3a,a6)
	bpl.b loc_07d748
	addq.b #2,(5,a6)

loc_07d748:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d74a:
	move.w ($44,a6),d0
	add.w d0,($14,a6)
	move.w ($14,a6),d0
	subi.w #$74,d0
	cmpi.w #$18,d0
	bhi.b loc_07d770
	addq.b #2,(5,a6)
	move.w ($4a,a6),($14,a6)
	move.w #$20,($3a,a6)

loc_07d770:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d772:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w loc_07d790(pc,d0.w),($14,a6)
	move.w d0,($3a,a6)
	bne.b loc_07d78e
	addq.b #2,(5,a6)
	move.w ($4a,a6),($14,a6)

loc_07d78e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d790:
	dc.w $008c,$008d,$008b,$008d
	dc.w $008b,$008e,$008a,$008e
	dc.w $008a,$008f,$0089,$008f
	dc.w $0089,$0090,$0088,$0090

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d7b0:
	cmpi.b #2,($12c,a5)
	bcs.b loc_07d7bc
	addq.b #2,(5,a6)

loc_07d7bc:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d7be:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d0
	subi.w #$ffe0,d0
	cmpi.w #$1c0,d0
	bhi.w loc_07df24
	rts

;==============================================
loc_07d7d8:
	move.b (4,a6),d0
	move.w loc_07d7e4(pc,d0.w),d1
	jmp loc_07d7e4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d7e4:
	dc.w loc_07d7ec-loc_07d7e4
	dc.w loc_07d842-loc_07d7e4
	dc.w loc_07df1e-loc_07d7e4
	dc.w loc_07df1e-loc_07d7e4

;----------------------------------------------
loc_07d7ec:
	addq.b #2,($4,a6)
	move.b #$a,($9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$10,($3a,a6)
	move.w #$e6,($10,a6)
	move.w #$ffa0,($14,a6)
	move.w #$74,($4a,a6)
	move.w #$10,($40,a6)
	move.w #$10,($44,a6)
	moveq #$10,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d842:
	move.b (5,a6),d0
	move.w loc_07d85a(pc,d0.w),d1
	jsr loc_07d85a(pc,d1.w)
	jsr loc_01b6b6
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d85a:
	dc.w loc_07d73e-loc_07d85a
	dc.w loc_07d74a-loc_07d85a
	dc.w loc_07d864-loc_07d85a
	dc.w loc_07d7b0-loc_07d85a
	dc.w loc_07d7be-loc_07d85a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d864:
	move.w ($3a,a6),d0
	subq.w #2,d0
	move.w loc_07d882(pc,d0.w),($14,a6)
	move.w d0,($3a,a6)
	bne.b loc_07d880
	addq.b #2,(5,a6)
	move.w ($4a,a6),($14,a6)

loc_07d880:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d882:
	dc.w $0074,$0073,$0075,$0073
	dc.w $0075,$0072,$0076,$0072
	dc.w $0076,$0071,$0077,$0071
	dc.w $0077,$0070,$0078,$0070

;==============================================
loc_07d8a2:
	move.b (4,a6),d0
	move.w loc_07d8ae(pc,d0.w),d1
	jmp loc_07d8ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d8ae:
	dc.w loc_07d8b6-loc_07d8ae
	dc.w loc_07d8fc-loc_07d8ae
	dc.w loc_07df1e-loc_07d8ae
	dc.w loc_07df1e-loc_07d8ae

;----------------------------------------------
loc_07d8b6:
	addq.b #2,(4,a6)
	move.b #$c,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$6000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w d0,($3a,a6)
	move.b d0,($31,a6)
	move.w #$c0,($10,a6)
	move.w #$80,($14,a6)
	moveq #$c,d0
	movea.l #loc_2f3b20,a0
	jmp loc_01b6e0

;----------------------------------------------
loc_07d8fc:
	cmpi.b #5,($12c,a5)
	bne.b loc_07d930
	tst.b ($31,a6)
	bne.b loc_07d930
	move.b #$e,(5,a6)
	st.b ($31,a6)
	move.w #$70,($10,a6)
	move.w #$b1,($14,a6)
	moveq #$11,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	moveq #0,d0

loc_07d930:
	move.b (5,a6),d0
	move.w loc_07d93c(pc,d0.w),d1
	jmp loc_07d93c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07d93c:
	dc.w loc_07d950-loc_07d93c
	dc.w loc_07d95e-loc_07d93c
	dc.w loc_07d97e-loc_07d93c
	dc.w loc_07d99e-loc_07d93c
	dc.w loc_07d9d8-loc_07d93c
	dc.w loc_07d95e-loc_07d93c
	dc.w loc_07d97e-loc_07d93c
	dc.w loc_07da0c-loc_07d93c

	dc.w loc_07da38-loc_07d93c
	dc.w loc_07da58-loc_07d93c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d950:
	cmpi.b #2,($12c,a5)
	bne.b loc_07d95c
	addq.b #2,(5,a6)

loc_07d95c:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d95e:
	tst.b ($33,a6)
	bpl.w loc_07df30
	addq.b #2,(5,a6)
	moveq #1,d0
	movea.l #loc_07e0e6,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d97e:
	tst.b ($33,a6)
	bpl.w loc_07df30
	addq.b #2,(5,a6)
	moveq #$11,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d99e:
	cmpi.b #4,($12c,a5)
	bcs.w loc_07df30
	move.b #$e,(5,a6)
	bsr.w loc_07df3c
	tst.b ($125,a4)
	bne.b loc_07d9d2
	move.b #8,(5,a6)
	move.b #$c,($3a,a6)
	moveq #$b,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0

loc_07d9d2:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07d9d8:
	tst.b ($33,a6)
	bpl.w loc_07df30
	subq.b #1,($3a,a6)
	bpl.w loc_07df28
	addq.b #2,(5,a6)
	move.w #$70,($10,a6)
	move.w #$b1,($14,a6)
	moveq #$c,d0
	movea.l #loc_2f3b20,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07da0c:
	cmpi.b #6,($12c,a5)
	bne.w loc_07df30
	addq.b #2,(5,a6)
	move.w #$fff0,($40,a6)
	move.w #$ffff,($48,a6)
	moveq #5,d0
	lea.l loc_07e0e6(pc),a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07da38:
	cmpi.b #7,($12c,a5)
	bcc.w loc_07df24
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_07da52
	addq.b #2,(5,a6)

loc_07da52:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07da58:
	cmpi.b #7,($12c,a5)
	bcc.w loc_07df24
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	add.w ($48,a6),d0
	move.w d0,($40,a6)
	cmpi.w #$ff90,($10,a6)
	ble.w loc_07df24
	jmp loc_01b4ec

;==============================================
loc_07da82:
	move.b (4,a6),d0
	move.w loc_07da8e(pc,d0.w),d1
	jmp loc_07da8e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07da8e:
	dc.w loc_07da96-loc_07da8e
	dc.w loc_07dc36-loc_07da8e
	dc.w loc_07df1e-loc_07da8e
	dc.w loc_07df1e-loc_07da8e

;----------------------------------------------
loc_07da96:
	addq.b #2,(4,a6)
	move.b #$a,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$66,($14,a6)
	move.w #$1b8,($10,a6)
	move.w #$ffe0,($40,a6)
	move.w #$38,($4e,a6)
	tst.b ($143,a5)
	beq.b loc_07dae8
	move.w #$ff08,($10,a6)
	neg.w ($40,a6)
	move.w #$88,($4e,a6)

loc_07dae8:
	lea.l ($50,a6),a0
	move.l a0,($1c,a6)
	move.l #$1400000,(a0)
	lea.l (8,a0),a0
	move.l a0,(-4,a0)
	move.l #$e0005,(a0)+
	move.l #$4001e,(a0)+
	move.l #loc_07dc22,(a0)+
	move.w #$60a,(a0)+

loc_07db14:
	move.b ($12,a5),d0
	ext.w d0
	addi.l #$6000600,d0
	move.b ($13,a5),d1
	ext.w d1
	lsl.w #2,d1
	move.l loc_07db32(pc,d1.w),d1
	movem.l d0-d1,(a0)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07db32:
	dc.l $06100610,$06100612,$06100613,$06100615
	dc.l $06100617,$06100618,$06110610,$06110612
	dc.l $06110613,$06110615,$06110617,$06110618
	dc.l $06120610,$06120612,$06120613,$06120615
	dc.l $06120617,$06120618,$06130610,$06130612
	dc.l $06130613,$06130615,$06130617,$06130618
	dc.l $06140610,$06140612,$06140613,$06140615
	dc.l $06140617,$06140618,$06150610,$06150612
	dc.l $06150613,$06150615,$06150617,$06150618
	dc.l $06160610,$06160612,$06160613,$06160615
	dc.l $06160617,$06160618,$06170610,$06170612
	dc.l $06170613,$06170615,$06170617,$06170618
	dc.l $06180610,$06180612,$06180613,$06180615
	dc.l $06180617,$06180618,$06190610,$06190612
	dc.l $06190613,$06190615,$06190617,$06190618

loc_07dc22:
	dc.w $0010,$fffc
	dc.w $0000,$fffc
	dc.w $000d,$fffc
	dc.w $001e,$fffc
	dc.w $0027,$fffc

;----------------------------------------------
loc_07dc36:
	move.b (5,a6),d0
	move.w loc_07dc42(pc,d0.w),d1
	jmp loc_07dc42(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07dc42:
	dc.w loc_07dc4a-loc_07dc42
	dc.w loc_07dc58-loc_07dc42
	dc.w loc_07dc76-loc_07dc42
	dc.w loc_07dc9c-loc_07dc42

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dc4a:
	cmpi.b #1,($12c,a5)
	bne.b loc_07dc56
	addq.b #2,(5,a6)

loc_07dc56:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dc58:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d1
	subi.w #$60,d1
	eor.w d0,d1
	bmi.b loc_07dc70
	addq.b #2,(5,a6)

loc_07dc70:
	jmp loc_01b4d0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dc76:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($10,a6),d0
	subi.w #$38,d0
	cmpi.w #$50,d0
	bcs.b loc_07dc96
	addq.b #2,(5,a6)
	move.w ($4e,a6),($10,a6)

loc_07dc96:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dc9c:
	cmpi.b #2,($12c,a5)
	bcc.w loc_07df24
	lea.l ($66,a6),a0
	bsr.w loc_07db14
	jmp loc_01b4ec

;==============================================
loc_07dcb4:
	rts

;==============================================
loc_07dcb6:
	move.b (4,a6),d0
	move.w loc_07dcc2(pc,d0.w),d1
	jmp loc_07dcc2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07dcc2:
	dc.w loc_07dcca-loc_07dcc2
	dc.w loc_07dee4-loc_07dcc2
	dc.w loc_07df1e-loc_07dcc2
	dc.w loc_07df1e-loc_07dcc2

;----------------------------------------------
loc_07dcca:
	addq.b #2,(4,a6)
	move.b #8,(9,a6)
	move.b #0,($e,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$17,($3a,a6)
	move.w #$f0,($10,a6)
	move.w #$78,($14,a6)
	lea.l ($50,a6),a1
	move.l a1,($1c,a6)
	move.l #$1400000,(a1)+
	movea.l #$ff3554,a0
	move.l a0,(a1)
	move.b #0,($31,a6)
	tst.b ($110,a5)
	bne.b loc_07dd40
	move.b #1,($31,a6)
	tst.b ($105,a5)
	beq.b loc_07dd40
	move.b #2,($31,a6)
	tst.b ($120,a5)
	bne.b loc_07dd40
	move.b #3,($31,a6)

loc_07dd40:
	bsr.w loc_07df3c
	moveq #0,d0
	move.b ($31,a6),d0
	add.w d0,d0
	move.w loc_07dd54(pc,d0.w),d1
	jmp loc_07dd54(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07dd54:
	dc.w loc_07dd5c-loc_07dd54
	dc.w loc_07dd76-loc_07dd54
	dc.w loc_07dd94-loc_07dd54
	dc.w loc_07ddba-loc_07dd54

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dd5c:
	move.l #$e0004,(a0)+
	move.l #$3001e,(a0)+
	move.l #loc_07e344,(a0)+
	bsr.w loc_07dddc
	bra.w loc_07dde6

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dd76:
	move.l #$e000e,(a0)+
	move.l #$d001e,(a0)+
	move.l #loc_07e354,(a0)+
	bsr.w loc_07de10
	bsr.w loc_07ddf0
	bra.w loc_07de90

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dd94:
	move.l #$e0016,(a0)+
	move.l #$15001e,(a0)+
	move.l #loc_07e38c,(a0)+
	bsr.w loc_07de64
	bsr.w loc_07dddc
	bsr.w loc_07de10
	bsr.w loc_07ddf0
	bra.w loc_07de90

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07ddba:
	move.l #$e0010,(a0)+
	move.l #$f001e,(a0)+
	move.l #loc_07e3e4,(a0)+
	bsr.w loc_07dddc
	bsr.w loc_07de10
	bsr.w loc_07ddf0
	bra.w loc_07de90

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dddc:
	moveq #0,d0
	move.b (-$7086,a5),d0
	bra.w loc_07ded0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07dde6:
	moveq #0,d0
	move.b ($130,a4),d0
	bra.w loc_07ded0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07ddf0:
	move.w (-$7088,a5),d0
	move.w d0,d1
	lsr.w #4,d1
	bne.b loc_07ddfe
	move.w #$fce0,d1

loc_07ddfe:
	addi.w #$340,d1
	andi.w #$f,d0
	addi.w #$340,d0
	move.w d1,(a0)+
	move.w d0,(a0)+
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07de10:
	move.w #$340,d1
	move.w (-$708a,a5),d0
	beq.b loc_07de56
	moveq #0,d4
	move.w d0,d2
	move.w d0,d3
	lsr.w #8,d0
	lsr.w #4,d2
	andi.w #$f,d0
	bne.b loc_07de30
	move.w #$fce0,d0
	st.b d4

loc_07de30:
	andi.w #$f,d2
	bne.b loc_07de3e
	tst.b d4
	beq.b loc_07de3e
	move.w #$fce0,d2

loc_07de3e:
	andi.w #$f,d3
	add.w d1,d0
	add.w d1,d2
	add.w d1,d3
	movem.w d0/d2-d3,(a0)
	lea.l (6,a0),a0
	move.w d1,(a0)+
	move.w d1,(a0)+
	rts

loc_07de56:
	move.l #$200020,d0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.w d1,(a0)+
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07de64:
	moveq #0,d0
	move.b (-$708c,a5),d0
	move.w d0,d1
	lsr.w #4,d0
	bne.b loc_07de74
	move.w #$fce0,d0

loc_07de74:
	andi.w #$f,d1
	addi.w #$340,d0
	addi.w #$340,d1
	move.w d0,(a0)+
	move.w d1,(a0)+
	move.l #$3400340,d0
	move.l d0,(a0)+
	move.l d0,(a0)+
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07de90:
	move.l ($138,a4),d0
	rol.l #8,d0
	moveq #0,d2
	move.w #$340,d3
	moveq #$f,d4
	moveq #5,d6

loc_07dea0:
	move.w d0,d1
	tst.b d2
	beq.b loc_07deb4
	and.w d4,d1
	add.w d3,d1
	move.w d1,(a0)+
	rol.l #4,d0
	dbra d6,loc_07dea0
	bra.b loc_07dec8

loc_07deb4:
	and.w d4,d1
	sne.b d2
	bne.b loc_07debe
	move.w #$fce0,d1

loc_07debe:
	add.w d3,d1
	move.w d1,(a0)+
	rol.l #4,d0
	dbra d6,loc_07dea0

loc_07dec8:
	and.w d4,d0
	add.w d3,d0
	move.w d0,(a0)+
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07ded0:
	add.w d0,d0
	lea.l loc_07e01e(pc),a1
	move.w (a1,d0.w),(a0)+
	lea.l loc_07df56(pc),a1
	move.w (a1,d0.w),(a0)+
	rts

;----------------------------------------------
loc_07dee4:
	cmpi.b #5,($12c,a5)
	bne.b loc_07def2
	move.b #2,(5,a6)

loc_07def2:
	move.b (5,a6),d0
	move.w loc_07defe(pc,d0.w),d1
	jmp loc_07defe(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07defe:
	dc.w loc_07df02-loc_07defe
	dc.w loc_07df0e-loc_07defe

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07df02
	subq.w #1,($3a,a6)
	bmi.b loc_07df0a
	rts

loc_07df0a:
	addq.b #2,(5,a6)

loc_07df0e:
	cmpi.b #6,($12c,a5)
	beq.w loc_07df24
	jmp loc_01b4ec

;----------------------------------------------
loc_07df1e:
	jmp loc_01c28e

;----------------------------------------------
loc_07df24:
	addq.b #2,(4,a6)

loc_07df28:
	rts

;----------------------------------------------
loc_07df2a:
	jmp loc_01b6b6

;----------------------------------------------
loc_07df30:
	jsr loc_01b6b6
	jmp loc_01b4ec

;----------------------------------------------
loc_07df3c:
	movea.w ($13a,a5),a4
	cmpi.w #6,(Dramatic_Mode_Type,a5)
	bne.b loc_07df54
	btst.b #0,(Active_Player_01,a5)
	bne.b loc_07df54
	lea.l (p2memory,a5),a4

loc_07df54:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07df56:
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349
	dc.w $0340,$0341,$0342,$0343,$0344
	dc.w $0345,$0346,$0347,$0348,$0349

loc_07e01e:
	dc.w $0020,$0020,$0020,$0020,$0020
	dc.w $0020,$0020,$0020,$0020,$0020
	dc.w $0341,$0341,$0341,$0341,$0341
	dc.w $0341,$0341,$0341,$0341,$0341
	dc.w $0342,$0342,$0342,$0342,$0342
	dc.w $0342,$0342,$0342,$0342,$0342
	dc.w $0343,$0343,$0343,$0343,$0343
	dc.w $0343,$0343,$0343,$0343,$0343
	dc.w $0344,$0344,$0344,$0344,$0344
	dc.w $0344,$0344,$0344,$0344,$0344
	dc.w $0345,$0345,$0345,$0345,$0345
	dc.w $0345,$0345,$0345,$0345,$0345
	dc.w $0346,$0346,$0346,$0346,$0346
	dc.w $0346,$0346,$0346,$0346,$0346
	dc.w $0347,$0347,$0347,$0347,$0347
	dc.w $0347,$0347,$0347,$0347,$0347
	dc.w $0348,$0348,$0348,$0348,$0348
	dc.w $0348,$0348,$0348,$0348,$0348
	dc.w $0349,$0349,$0349,$0349,$0349
	dc.w $0349,$0349,$0349,$0349,$0349

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e0e6:
	dc.w loc_07e0fe-loc_07e0e6
	dc.w loc_07e106-loc_07e0e6
	dc.w loc_07e0fe-loc_07e0e6
	dc.w loc_07e0fe-loc_07e0e6
	dc.w loc_07e126-loc_07e0e6
	dc.w loc_07e12e-loc_07e0e6
	dc.w loc_07e0fe-loc_07e0e6
	dc.w loc_07e0fe-loc_07e0e6

	dc.w loc_07e146-loc_07e0e6
	dc.w loc_07e14e-loc_07e0e6
	dc.w loc_07e156-loc_07e0e6
	dc.w $0000

loc_07e0fe:
	dc.w $ff40,$0000
	dc.l loc_07e15e

loc_07e106:
	dc.w $0100,$0000
	dc.l loc_07e19a

	dc.w $0100,$0000
	dc.l loc_07e1a8

	dc.w $0100,$0000
	dc.l loc_07e1b6

	dc.w $0140,$0000
	dc.l loc_07e1d4

loc_07e126:
	dc.w $ff40,$0000
	dc.l loc_07e1fa

loc_07e12e:
	dc.w $0100,$0000
	dc.l loc_07e2f2

	dc.w $0100,$0000
	dc.l loc_07e318

	dc.w $0140,$0000
	dc.l loc_07e32e

loc_07e146:
	dc.w $ff40,$0000
	dc.l loc_07e220

loc_07e14e:
	dc.w $ff40,$0000
	dc.l loc_07e256

loc_07e156:
	dc.w $ff40,$0000
	dc.l loc_07e29c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e15e:
	dc.w $000e,$0018,$0007,$021e
	dc.l loc_07e17a

	dc.b $06,$0b,$06,$0b
	dc.b $06,$0b,$06,$0b
	dc.b $06,$0b,$06,$0b
	dc.b $06,$0b,$06,$0b

loc_07e17a:
	dc.w $0000,$fff8
	dc.w $0030,$fff8
	dc.w $0060,$fff8
	dc.w $0090,$fff8
	dc.w $00c0,$fff8
	dc.w $00f0,$fff8
	dc.w $0120,$fff8
	dc.w $0150,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e19a:
	dc.w $0008,$0001,$0000
	dc.w $2400,$001e,$fff8,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e1a8:
	dc.w $0008,$0004,$0000
	dc.w $2400,$031e,$ffe0,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e1b6:
	dc.w $0008,$0009,$0002
	dc.w $2400,$021e,$ffb8,$fff8
	dc.w $2400,$021e,$ffe8,$fff8
	dc.w $2400,$021e,$0018,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e1d4:
	dc.w $0008,$000e,$0003
	dc.w $2400,$031e,$ff90,$fff8
	dc.w $2400,$021e,$ffd0,$fff8
	dc.w $2400,$021e,$0000,$fff8
	dc.w $2400,$031e,$0030,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e1fa:
	dc.w $0008,$0012,$0003
	dc.w $2ad2,$071e,$0000,$fffe
	dc.w $2ad2,$001e,$0080,$fffe
	dc.w $2ad2,$071e,$0000,$000e
	dc.w $2ad2,$001e,$0080,$000e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e220:
	dc.w $0008,$001b,$0005
	dc.w $2ad2,$071e,$0000,$fffe
	dc.w $2ad2,$001e,$0080,$fffe
	dc.w $2ad2,$071e,$0000,$000e
	dc.w $2ad2,$001e,$0080,$000e
	dc.w $2ad2,$071e,$0000,$001e
	dc.w $2ad2,$001e,$0080,$001e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e256:
	dc.w $0008,$0024,$0007
	dc.w $2ad2,$071e,$0000,$fffe
	dc.w $2ad2,$001e,$0080,$fffe
	dc.w $2ad2,$071e,$0000,$000e
	dc.w $2ad2,$001e,$0080,$000e
	dc.w $2ad2,$071e,$0000,$001e
	dc.w $2ad2,$001e,$0080,$001e
	dc.w $2ad2,$071e,$0000,$002e
	dc.w $2ad2,$001e,$0080,$002e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e29c:
	dc.w $0008,$002d,$0009
	dc.w $2ad2,$071e,$0000,$fffe
	dc.w $2ad2,$001e,$0080,$fffe
	dc.w $2ad2,$071e,$0000,$000e
	dc.w $2ad2,$001e,$0080,$000e
	dc.w $2ad2,$071e,$0000,$001e
	dc.w $2ad2,$001e,$0080,$001e
	dc.w $2ad2,$071e,$0000,$002e
	dc.w $2ad2,$001e,$0080,$002e
	dc.w $2ad2,$071e,$0000,$003e
	dc.w $2ad2,$001e,$0080,$003e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e2f2:
	dc.w $0008,$000e,$0003
	dc.w $2400,$031e,$ff90,$0000
	dc.w $2400,$021e,$ffd0,$0000
	dc.w $2400,$021e,$0000,$0000
	dc.w $2400,$031e,$0030,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e318:
	dc.w $0008,$000e,$0001
	dc.w $2ad2,$061e,$ff90,$0000
	dc.w $2ad2,$061e,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e32e:
	dc.w $0008,$000f,$0001
	dc.w $2ad2,$071e,$ff80,$0000
	dc.w $2ad2,$061e,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e344:
	dc.w $0070,$0000,$0078,$0000
	dc.w $0070,$0010,$0078,$0010

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e354:
	dc.w $0058,$0000,$0060,$0000
	dc.w $0068,$0000,$0070,$0000
	dc.w $0078,$0000,$0070,$0010
	dc.w $0078,$0010,$0048,$0020
	dc.w $0050,$0020,$0058,$0020
	dc.w $0060,$0020,$0068,$0020
	dc.w $0070,$0020,$0078,$0020

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e38c:
	dc.w $0050,$0000,$0058,$0000
	dc.w $0060,$0000,$0068,$0000
	dc.w $0070,$0000,$0078,$0000
	dc.w $0070,$0010,$0078,$0010
	dc.w $0058,$0020,$0060,$0020
	dc.w $0068,$0020,$0070,$0020
	dc.w $0078,$0020,$0070,$0030
	dc.w $0078,$0030,$0048,$0040
	dc.w $0050,$0040,$0058,$0040
	dc.w $0060,$0040,$0068,$0040
	dc.w $0070,$0040,$0078,$0040

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e3e4:
	dc.w $0070,$0000,$0078,$0000
	dc.w $0058,$0010,$0060,$0010
	dc.w $0068,$0010,$0070,$0010
	dc.w $0078,$0010,$0070,$0020
	dc.w $0078,$0020,$0048,$0030
	dc.w $0050,$0030,$0058,$0030
	dc.w $0060,$0030,$0068,$0030
	dc.w $0070,$0030,$0078,$0030

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e424:
	dc.w $0070,$0000,$0078,$0000
	dc.w $0070,$0010,$0078,$0010
	dc.w $0070,$0020,$0078,$0020
	dc.w $0060,$0030,$0068,$0030
	dc.w $0070,$0030,$0078,$0030

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e44c:
	dc.w $0630,$0720
	dc.w $0640,$0700
	dc.w $0710,$0620
	dc.w $0630,$0640
	dc.w $0700,$0710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e460:
	dc.w $000c,$0025,$0007
	dc.l loc_07e48a

	dc.b $07,$00,$01,$1e
	dc.b $07,$13,$05,$1e
	dc.b $06,$28,$00,$1e
	dc.b $07,$14,$04,$1e
	dc.b $07,$14,$03,$1e
	dc.b $00,$20,$00,$1e
	dc.b $06,$30,$08,$1e
	dc.b $06,$40,$08,$1e

loc_07e48a:
	dc.w $0000,$0000,$0020,$0000
	dc.w $0080,$0000,$0000,$0010
	dc.w $0050,$0010,$0010,$0010
	dc.w $0000,$0020,$0000,$0030

;##############################################
loc_07e4aa:
	movea.w (left_hud_pointer,a5),a1
	movea.w (right_hud_pointer,a5),a2
	jsr loc_01c278
	beq.b loc_07e504
	move.l #$1000200,(a4)
	move.w a1,($36,a4)
	move.w #$40,($10,a4)
	move.w #$10,($40,a4)
	move.b #0,(9,a4)
	clr.b (3,a4)
	jsr loc_01c278
	beq.b loc_07e504
	move.l #$1000200,(a4)
	move.w a2,($36,a4)
	move.w #$140,($10,a4)
	move.w #$fff0,($40,a4)
	move.b #2,(9,a4)
	move.b #1,(3,a4)

loc_07e504:
	rts

;##############################################
loc_07e506:
	tst.b (Set_GC_Flash_BG,a5)
	bne.w loc_07ea18
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_07e51e(pc,d0.w),d1
	jmp loc_07e51e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e51e:
	dc.w loc_07e526-loc_07e51e
	dc.w loc_07e586-loc_07e51e
	dc.w loc_07ea0e-loc_07e51e
	dc.w loc_07ea0e-loc_07e51e

;==============================================
loc_07e526:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b d0,($e,a6)
	move.b d0,($b,a6)
	move.w d0,($c,a6)
	move.l d0,($44,a6)
	move.b d0,($a,a6)
	move.w #$e000,($18,a6)
	move.w #$2000,($1a,a6)
	move.w #$b7,($14,a6)
	move.l #$1400000,($48,a6)
	lea.l ($50,a6),a0
	move.l a0,($4c,a6)
	move.w #$c,(a0)+
	move.l #$40002,(a0)+
	move.l #loc_07ed54,(a0)+
	move.l #$acd0117,($62,a6)
	movea.l #loc_07eb98,a0
	jmp loc_01b6e0

;==============================================
loc_07e586:
	tst.b ($5e00,a5)
	bne.w loc_07ea14
	moveq #$0,d1
	move.b ($114,a4),d0
	beq.b loc_07e5a4
	move.b d0,(6,a6)
	move.b d1,($114,a4)
	move.b d1,(7,a6)
	bra.b loc_07e5c6

loc_07e5a4:
	move.b ($329,a4),d0
	cmp.b ($44,a6),d0
	beq.b loc_07e5c6
	move.b d0,($44,a6)
	lea.l loc_07ecec(pc),a0
	ext.w d0
	move.b (a0,d0.w),d0
	beq.b loc_07e5c6
	move.b d0,(6,a6)
	move.b d1,(7,a6)

loc_07e5c6:
	tst.b ($b4,a4)
	bpl.b loc_07e5f0
	move.b ($b4,a4),d0
	andi.w #$f,d0
	move.b loc_07e5fe(pc,d0.w),d0
	bmi.b loc_07e5e6
	cmpi.b #$e,(6,a6)
	bcc.b loc_07e5e6
	move.b d0,(6,a6)

loc_07e5e6:
	andi.b #$7f,($b4,a4)
	bsr.w loc_07eb16

loc_07e5f0:
	moveq #0,d0
	move.b (6,a6),d0
	move.w loc_07e60e(pc,d0.w),d1
	jmp loc_07e60e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e5fe:
	dc.w $ffff,$ffff,$ffff,$ff00
	dc.w $ff00,$0000,$00ff,$ffff

loc_07e60e:
	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e630-loc_07e60e
	dc.w loc_07e62e-loc_07e60e

	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e62e-loc_07e60e
	dc.w loc_07e6fa-loc_07e60e
	dc.w loc_07e85c-loc_07e60e
	dc.w loc_07e8c0-loc_07e60e

;----------------------------------------------
loc_07e62e:
	rts

;----------------------------------------------
loc_07e630:
	move.b (7,a6),d0
	move.w loc_07e63c(pc,d0.w),d1
	jmp loc_07e63c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e63c:
	dc.w loc_07e646-loc_07e63c
	dc.w loc_07e67e-loc_07e63c
	dc.w loc_07e696-loc_07e63c
	dc.w loc_07e6e8-loc_07e63c
	dc.w loc_07e6f8-loc_07e63c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e646:
	addq.b #2,(7,a6)
	move.b #7,($3a,a6)
	bsr.w loc_07ea1a
	move.w #$ffc0,d0
	tst.b (3,a6)
	beq.b loc_07e662
	move.w #$1c0,d0

loc_07e662:
	move.w d0,($10,a6)
	moveq #$10,d0
	add.b (3,a6),d0
	movea.l #loc_07eb98,a0
	jsr loc_01b6e0
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e67e:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.b loc_07e690
	addq.b #2,(7,a6)

loc_07e690:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e696:
	jsr loc_01b6b6
	tst.b ($33,a6)
	bpl.b loc_07e6c2
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #0,d0
	move.b (6,a6),d0
	move.w loc_07e6c8(pc,d0.w),d0
	movea.l #loc_07eb98,a0
	jsr loc_01b6e0

loc_07e6c2:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e6c8:
	dc.w $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e6e8:
	subq.b #1,($3a,a6)
	bpl.b loc_07e6f2
	addq.b #2,(7,a6)

loc_07e6f2:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e6f8:
	rts

;----------------------------------------------
loc_07e6fa:
	movea.w ($36,a6),a4
	move.b (7,a6),d0
	move.w loc_07e70a(pc,d0.w),d1
	jmp loc_07e70a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e70a:
	dc.w loc_07e714-loc_07e70a
	dc.w loc_07e774-loc_07e70a
	dc.w loc_07e808-loc_07e70a
	dc.w loc_07e82c-loc_07e70a
	dc.w loc_07e85a-loc_07e70a

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e714:
	addq.b #2,(7,a6)
	move.b #$40,($3a,a6)
	move.b #3,($3b,a6)
	move.b (3,a6),d0
	add.b d0,d0
	add.b ($107,a5),d0
	add.b d0,d0
	move.w loc_07e76c(pc,d0.w),($10,a6)
	lea.l ($48,a6),a0
	move.l a0,($1c,a6)
	lea.l ($56,a6),a0
	move.l #loc_07ed54,(a0)+
	lea.l loc_07ecd8(pc),a1
	moveq #0,d0
	move.b ($329,a4),d0
	move.b d0,($45,a6)
	add.w d0,d0
	move.w (a1,d0.w),d0
	moveq #$15,d1
	moveq #$20,d2
	moveq #$15,d3
	movem.w d0-d3,(a0)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e76c:
	dc.w $0040,$0020,$0150,$0120

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e774:
	move.b ($3a,a6),d0
	beq.b loc_07e788
	subq.b #4,d0
	move.b d0,($3a,a6)
	ext.w d0
	move.l loc_07e7c8(pc,d0.w),($56,a6)

loc_07e788:
	tst.b ($107,a5)
	bne.b loc_07e7b0
	tst.b ($329,a4)
	bne.b loc_07e7aa
	bsr.w loc_07ea4c
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.l #loc_07ed54,($56,a6)

loc_07e7aa:
	jmp loc_01b4ec

loc_07e7b0:
	move.b #6,(7,a6)
	move.w #$15,d1
	move.w d1,($5c,a6)
	move.w d1,($60,a6)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e7c8:
	dc.l loc_07ed54,loc_07ed60,loc_07ed78,loc_07ed60
	dc.l loc_07ed78,loc_07ed60,loc_07ed78,loc_07ed60
	dc.l loc_07ed84,loc_07ed6c,loc_07ed84,loc_07ed6c
	dc.l loc_07ed84,loc_07ed6c,loc_07ed84,loc_07ed6c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e808:
	tst.b ($329,a4)
	bne.b loc_07e814
	subq.b #1,($3a,a6)
	bpl.b loc_07e826

loc_07e814:
	move.b #8,(7,a6)
	move.w #$15,d1
	move.w d1,($5c,a6)
	move.w d1,($60,a6)

loc_07e826:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e82c:
	moveq #$20,d0
	tst.b (3,a6)
	beq.b loc_07e838
	move.w #$120,d0

loc_07e838:
	move.w d0,($10,a6)
	cmpi.b #4,($12c,a5)
	bcs.b loc_07e854
	addq.b #2,(7,a6)
	move.w #$15,d1
	move.w d1,($5c,a6)
	move.w d1,($60,a6)

loc_07e854:
	jmp loc_01b4ec

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e85a:
	rts

;----------------------------------------------
loc_07e85c:
	movea.w ($36,a6),a4
	move.b (7,a6),d0
	move.w loc_07e86c(pc,d0.w),d1
	jmp loc_07e86c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e86c:
	dc.w loc_07e714-loc_07e86c
	dc.w loc_07e876-loc_07e86c
	dc.w loc_07e808-loc_07e86c
	dc.w loc_07e82c-loc_07e86c
	dc.w loc_07e85a-loc_07e86c

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e876:
	subq.b #1,($3b,a6)
	bpl.b loc_07e888
	move.b #3,($3b,a6)
	eori.w #3,($5c,a6)

loc_07e888:
	tst.b ($107,a5)
	bne.b loc_07e8ae
	tst.b ($329,a4)
	bne.b loc_07e8a8
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.w #$15,($5c,a6)
	bsr.w loc_07ea4c

loc_07e8a8:
	jmp loc_01b4ec

loc_07e8ae:
	move.b #6,(7,a6)
	move.w #$15,($5c,a6)
	jmp loc_01b4ec

;----------------------------------------------
loc_07e8c0:
	movea.w ($36,a6),a4
	move.b (7,a6),d0
	move.w loc_07e8d0(pc,d0.w),d1
	jmp loc_07e8d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e8d0:
	dc.w loc_07e8da-loc_07e8d0
	dc.w loc_07e9b4-loc_07e8d0
	dc.w loc_07e808-loc_07e8d0
	dc.w loc_07e82c-loc_07e8d0
	dc.w loc_07e85a-loc_07e8d0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e8da:
	addq.b #2,(7,a6)
	move.b #$10,($3a,a6)
	move.b #3,($3b,a6)
	move.b (3,a6),d0
	add.b d0,d0
	add.b ($107,a5),d0
	add.b d0,d0
	move.w loc_07e948(pc,d0.w),($10,a6)
	lea.l ($48,a6),a0
	move.l a0,($1c,a6)
	moveq #0,d0
	move.b ($329,a4),d0
	move.b d0,($45,a6)
	lea.l loc_07e950(pc),a0
	move.b (a0,d0.w),d0
	move.b d0,d2
	moveq #$f,d3
	lea.l ($56,a6),a0
	move.l #loc_07ed90,(a0)+
	lea.l loc_07ecd8(pc),a1
	and.w d3,d0
	add.w d0,d0
	move.w (a1,d0.w),d0
	moveq #$15,d1
	lsr.w #4,d2
	and.w d3,d2
	add.w d2,d2
	move.w (a1,d2.w),d2
	moveq #$15,d3
	movem.w d0-d3,(a0)
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07e948:
	dc.w $0040,$0020,$0150,$0120

loc_07e950:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
	dc.b $10,$11,$12,$13,$14,$15,$16,$17,$18,$19
	dc.b $20,$21,$22,$23,$24,$25,$26,$27,$28,$29
	dc.b $30,$31,$32,$33,$34,$35,$36,$37,$38,$39
	dc.b $40,$41,$42,$43,$44,$45,$46,$47,$48,$49
	dc.b $50,$51,$52,$53,$54,$55,$56,$57,$58,$59
	dc.b $60,$61,$62,$63,$64,$65,$66,$67,$68,$69
	dc.b $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
	dc.b $80,$81,$82,$83,$84,$85,$86,$87,$88,$89
	dc.b $90,$91,$92,$93,$94,$95,$96,$97,$98,$99

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07e9b4:
	subq.b #1,($3b,a6)
	bpl.b loc_07e9ca
	move.b #3,($3b,a6)
	moveq #3,d1
	eor.w d1,($5c,a6)
	eor.w d1,($60,a6)

loc_07e9ca:
	tst.b ($107,a5)
	bne.b loc_07e9f6
	tst.b ($329,a4)
	bne.b loc_07e9f0
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	move.w #$15,d1
	move.w d1,($5c,a6)
	move.w d1,($60,a6)
	bsr.w loc_07ea4c

loc_07e9f0:
	jmp loc_01b4ec

loc_07e9f6:
	move.b #6,(7,a6)
	move.w #$15,d1
	move.w d1,($5c,a6)
	move.w d1,($60,a6)
	jmp loc_01b4ec

;==============================================
loc_07ea0e:
	jmp loc_01c28e

;==============================================
loc_07ea14:
	addq.b #2,(4,a6)

loc_07ea18:
	rts

loc_07ea1a:
	tst.b ($110,a5)
	bne.b loc_07ea18
	tst.b ($141,a5)
	bne.b loc_07ea18
	tst.b ($125,a4)
	bne.b loc_07ea18
	lea.l loc_07ee1c(pc),a0
	moveq #0,d2
	move.b (6,a6),d2
	add.w d2,d2
	lea.l (4,a0,d2.w),a0
	tst.l (-4,a0)
	beq.b loc_07ea18
	lea.l ($114,a4),a1
	jmp loc_01bb28

;==============================================
loc_07ea4c:
	moveq #0,d0
	move.b ($45,a6),d0
	cmpi.b #$e,d0
	bcs.b loc_07ea5a
	moveq #$e,d0

loc_07ea5a:
	move.b loc_07ea94(pc,d0.w),d0
	bmi.b loc_07ea92
	jsr loc_01c278
	beq.b loc_07ea92
	move.l #$1000300,(a4)
	move.b d0,(3,a4)
	move.b (3,a6),($3c,a4)
	move.b (9,a6),(9,a4)
	addq.b #4,(9,a4)
	move.w ($40,a6),($40,a4)
	move.w a6,($36,a4)
	move.w ($36,a6),($38,a4)

loc_07ea92:
	bra.b loc_07eaa4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ea94:
	dc.b $ff,$ff,$00,$01
	dc.b $02,$03,$04,$05
	dc.b $06,$07,$08,$09
	dc.b $0a,$0b,$0c,$0c

;----------------------------------------------
loc_07eaa4:
	moveq #0,d0
	moveq #0,d1
	move.b ($45,a6),d1
	cmpi.b #$10,d1
	bcs.b loc_07eac6
	move.w d1,d0
	subi.w #$f,d0
	lea.l loc_07e950(pc),a0
	move.b (a0,d0.w),d0
	swap d0
	asr.l #4,d0
	moveq #$f,d1

loc_07eac6:
	lsl.w #2,d1
	add.l loc_07ead6(pc,d1.w),d0
	movea.w ($36,a6),a0
	jmp loc_01bb44

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ead6:
	dc.l $00000000,$00000000,$00000300,$00000500
	dc.l $00001000,$00001200,$00001500,$00002000
	dc.l $00002300,$00002600,$00003000,$00003300
	dc.l $00003600,$00004000,$00004500,$00005000

;##############################################
loc_07eb16:
	jsr loc_01c278
	beq.b loc_07eb4c
	move.l #$1000400,(a4)
	move.b (9,a6),(9,a4)
	addq.b #4,(9,a4)
	move.b (3,a6),($3c,a4)
	move.w ($40,a6),($40,a4)
	move.w a6,($36,a4)
	movea.w ($36,a6),a0
	move.w a0,($38,a4)
	move.b ($b4,a0),(3,a4)

loc_07eb4c:
	tst.b ($110,a5)
	bne.w loc_07ea18
	tst.b ($141,a5)
	bne.w loc_07ea18
	movea.w ($36,a6),a4
	tst.b ($125,a4)
	bne.w loc_07ea18
	lea.l loc_07ed9c(pc),a0
	move.b ($b4,a4),d0
	andi.w #$f,d0
	btst.b #5,($b4,a4)
	beq.b loc_07eb80
	addi.w #$10,d0

loc_07eb80:
	lsl.w #2,d0
	lea.l (4,a0,d0.w),a0
	tst.l (-4,a0)
	beq.w loc_07ea18
	lea.l ($114,a4),a1
	jmp loc_01bb28

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07eb98:
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebc4-loc_07eb98
	dc.w loc_07ebcc-loc_07eb98
	dc.w loc_07ebd4-loc_07eb98
	dc.w loc_07ebdc-loc_07eb98
	dc.w loc_07ebe4-loc_07eb98
	dc.w loc_07ebec-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98

	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98
	dc.w loc_07ebbc-loc_07eb98

	dc.w loc_07ebf4-loc_07eb98
	dc.w loc_07ec0c-loc_07eb98

loc_07ebbc:
	dc.w $ff40,$0000
	dc.l loc_07ec24

loc_07ebc4:
	dc.w $ff40,$0000
	dc.l loc_07ec26

loc_07ebcc:
	dc.w $ff40,$0000
	dc.l loc_07ec34

loc_07ebd4:
	dc.w $ff40,$0000
	dc.l loc_07ec42

loc_07ebdc:
	dc.w $ff40,$0000
	dc.l loc_07ec50

loc_07ebe4:
	dc.w $ff40,$0000
	dc.l loc_07ec5e

loc_07ebec:
	dc.w $ff40,$0000
	dc.l loc_07ec6c


loc_07ebf4:
	dc.w $0100,$0000
	dc.l loc_07ec82

	dc.w $0100,$0000
	dc.l loc_07ec90

	dc.w $0140,$0000
	dc.l loc_07eca6


loc_07ec0c:
	dc.w $0100,$0000
	dc.l loc_07ecb4
	dc.w $0100,$0000
	dc.l loc_07ecc2
	dc.w $0140,$0000
	dc.l loc_07eca6

loc_07ec24:
	dc.w $0012

loc_07ec26:
	dc.w $0008,$0005,$0000
	dc.w $0ab0,$0416,$ffd8,$fff8

loc_07ec34:
	dc.w $0008,$0006,$0000
	dc.w $0ac0,$0516,$ffd0,$fff8

loc_07ec42:
	dc.w $0008,$0006,$0000
	dc.w $0aa9,$0516,$ffd0,$fff8

loc_07ec50:
	dc.w $0008,$0005,$0000
	dc.w $0ab5,$0516,$ffd0,$fff8

loc_07ec5e:
	dc.w $0008,$0005,$0000
	dc.w $0ac6,$0616,$ffd8,$fff8

loc_07ec6c:
	dc.w $0008,$0006,$0001
	dc.w $0a70,$0316,$ffd8,$fff8
	dc.w $0a08,$0116,$0018,$fff8

loc_07ec82:
	dc.w $0008,$0007,$0000
	dc.w $0b88,$0616,$ffc0,$fff8

loc_07ec90:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0016,$ffc8,$fff8
	dc.w $0b88,$0516,$ffd0,$fff8

loc_07eca6:
	dc.w $0008,$0006,$0000
	dc.w $0b88,$0516,$ffd0,$fff8

loc_07ecb4:
	dc.w $0008,$0007,$0000
	dc.w $0b88,$0616,$ffd0,$fff8

loc_07ecc2:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0516,$ffd0,$fff8
	dc.w $0b88,$0016,$0028,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ecd8:
	dc.w $0350,$0351,$0352,$0353,$0354
	dc.w $0355,$0356,$0357,$0358,$0359

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ecec:
	dc.b $00,$00,$1a,$1a,$1a,$1a,$1a,$1a
	dc.b $1c,$1c,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e
	dc.b $1e,$1e,$1e,$1e,$1e,$1e,$1e,$1e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ed54:
	dc.w $ffe8,$fff8,$ffd8
	dc.w $fff8,$fff8,$fff8

loc_07ed60:
	dc.w $ffe7,$fff8,$ffd7
	dc.w $fff8,$fff8,$fff8

loc_07ed6c:
	dc.w $ffe6,$fff8,$ffd6
	dc.w $fff8,$fff8,$fff8

loc_07ed78:
	dc.w $ffe9,$fff8,$ffd9
	dc.w $fff8,$fff8,$fff8

loc_07ed84:
	dc.w $ffea,$fff8,$ffda
	dc.w $fff8,$fff8,$fff8

loc_07ed90:
	dc.w $fff0,$fff8,$ffe0
	dc.w $fff8,$0000,$fff8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ed9c:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0003,$0000,$0003,$0000
	dc.w $0001,$0000,$0002,$0000
	dc.w $0003,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$3000,$0000,$3000
	dc.w $0000,$3000,$0000,$3000
	dc.w $0000,$3000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ee1c:
	dc.w $0000,$0000,$0000,$1000
	dc.w $0000,$1000,$0000,$0500
	dc.w $0000,$1500,$0000,$1000
	dc.w $0000,$0100,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000

;##############################################
loc_07ee5c:
	move.b (4,a6),d0
	move.w loc_07ee68(pc,d0.w),d1
	jmp loc_07ee68(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ee68:
	dc.w loc_07ee70-loc_07ee68
	dc.w loc_07ef06-loc_07ee68
	dc.w loc_07f140-loc_07ee68
	dc.w loc_07f140-loc_07ee68

;==============================================
loc_07ee70:
	addq.b #2,(4,a6)
	move.b d0,($e,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$2000,($1a,a6)
	move.w #$e000,($18,a6)
	move.w #$12,($3a,a6)
	move.w #$b6,($14,a6)
	moveq #0,d0
	move.b (3,a6),d0
	add.w d0,d0
	tst.b ($3c,a6)
	beq.b loc_07eeaa
	addi.w #$20,d0

loc_07eeaa:
	move.w loc_07eec6(pc,d0.w),($10,a6)
	moveq #0,d0
	move.b (3,a6),d0
	movea.l #loc_07f14e,a0
	jsr loc_01b6e0
	moveq #0,d0
	bra.b loc_07ef06

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07eec6:
	dc.w $ffa0,$ffa0,$ffa0,$ffa0
	dc.w $ffa0,$ffa0,$ffa0,$ffa0
	dc.w $ffa0,$ffa0,$ffa0,$ffa0
	dc.w $ffa0,$ffa0,$ffa0,$ffa0
	dc.w $01f0,$01f0,$01e0,$01e0
	dc.w $01d0,$01d0,$01c0,$01c0
	dc.w $01c0,$01c0,$01c0,$01c0
	dc.w $01c0,$01c0,$01c0,$01c0

;==============================================
loc_07ef06:
	tst.b ($5e00,a5)
	bne.w loc_07f146
	movea.w ($38,a6),a3
	tst.b ($329,a3)
	bne.w loc_07f146
	move.b (5,a6),d0
	move.w loc_07ef26(pc,d0.w),d1
	jmp loc_07ef26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ef26:
	dc.w loc_07ef2a-loc_07ef26
	dc.w loc_07f132-loc_07ef26

;----------------------------------------------
loc_07ef2a
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	move.w ($3a,a6),d0
	tst.b ($3c,a6)
	beq.b loc_07ef4a
	addi.w #$20,d0
	move.b (3,a6),d1
	ext.w d1
	lsl.w #5,d1
	add.w d1,d0

loc_07ef4a:
	move.w loc_07ef72(pc,d0.w),d1
	movea.w ($36,a6),a4
	add.w d1,($10,a4)
	subq.w #2,($3a,a6)
	bpl.b loc_07ef6c
	addq.b #2,(5,a6)
	move.w #$33,($3a,a6)
	jsr loc_01b6b6

loc_07ef6c:
	jmp loc_01b4ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ef72:
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $fffc,$fffc,$fffc,$fffc
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fffa,$fffa,$fffa,$fffa
	dc.w $fffa,$fffa,$fffa,$fffa
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fffa,$fffa,$fffa,$fffa
	dc.w $fffa,$fffa,$fffa,$fffa
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff8,$fff8,$fff8,$fff8
	dc.w $fff8,$fff8,$fff8,$fff8
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff8,$fff8,$fff8,$fff8
	dc.w $fff8,$fff8,$fff8,$fff8
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $fff6,$fff6,$fff6,$fff6
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000

;==============================================
loc_07f132:
	subq.w #1,($3a,a6)
	bmi.w loc_07f146
	jmp loc_01b4ec

;==============================================
loc_07f140:
	jmp loc_01c28e

;==============================================
loc_07f146:
	move.b #6,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f14e:
	dc.w loc_07f16a-loc_07f14e
	dc.w loc_07f17a-loc_07f14e
	dc.w loc_07f18a-loc_07f14e
	dc.w loc_07f19a-loc_07f14e
	dc.w loc_07f1aa-loc_07f14e
	dc.w loc_07f1ba-loc_07f14e
	dc.w loc_07f1ca-loc_07f14e
	dc.w loc_07f1da-loc_07f14e

	dc.w loc_07f1ea-loc_07f14e
	dc.w loc_07f1fa-loc_07f14e
	dc.w loc_07f20a-loc_07f14e
	dc.w loc_07f21a-loc_07f14e
	dc.w loc_07f22a-loc_07f14e
	dc.w $0000

loc_07f16a:
	dc.w $0100,$0000
	dc.l loc_07f260
	dc.w $ff40,$0000
	dc.l loc_07f23a

loc_07f17a:
	dc.w $0100,$0000
	dc.l loc_07f260
	dc.w $ff40,$0000
	dc.l loc_07f276

loc_07f18a:
	dc.w $0100,$0000
	dc.l loc_07f2c2
	dc.w $ff40,$0000
	dc.l loc_07f29c

loc_07f19a:
	dc.w $0100,$0000
	dc.l loc_07f2c2
	dc.w $ff40,$0000
	dc.l loc_07f2d8

loc_07f1aa:
	dc.w $0100,$0000
	dc.l loc_07f324
	dc.w $ff40,$0000
	dc.l loc_07f2fe

loc_07f1ba:
	dc.w $0100,$0000
	dc.l loc_07f324
	dc.w $ff40,$0000
	dc.l loc_07f33a

loc_07f1ca:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f360

loc_07f1da:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f39c

loc_07f1ea:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f3c2

loc_07f1fa:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f3e8

loc_07f20a:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f40e

loc_07f21a:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f434

loc_07f22a:
	dc.w $0100,$0000
	dc.l loc_07f386
	dc.w $ff40,$0000
	dc.l loc_07f45a

loc_07f23a:
	dc.w $0008,$000d,$0003
	dc.w $0ad2,$0117,$0000,$fff8
	dc.w $0b28,$0017,$0020,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0217,$0000,$fffa

loc_07f260:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0217,$0000,$fffa

loc_07f276:
	dc.w $0008,$000d,$0003
	dc.w $0ad2,$0117,$0000,$fff8
	dc.w $0aaf,$0017,$0020,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0217,$0000,$fffa

loc_07f29c:
	dc.w $0008,$000e,$0003
	dc.w $0ad9,$0217,$0000,$fff8
	dc.w $0b28,$0017,$0030,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0317,$0000,$fffa

loc_07f2c2:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0317,$0000,$fffa

loc_07f2d8:
	dc.w $0008,$000e,$0003
	dc.w $0ad9,$0217,$0000,$fff8
	dc.w $0aaf,$0017,$0030,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0317,$0000,$fffa

loc_07f2fe:
	dc.w $0008,$000f,$0003
	dc.w $0ad0,$0317,$0000,$fff8
	dc.w $0b28,$0017,$0040,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0417,$0000,$fffa

loc_07f324:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0417,$0000,$fffa

loc_07f33a:
	dc.w $0008,$000f,$0003
	dc.w $0ad0,$0317,$0000,$fff8
	dc.w $0aaf,$0017,$0040,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0417,$0000,$fffa

loc_07f360:
	dc.w $0008,$0010,$0003
	dc.w $0ad4,$0417,$0000,$fff8
	dc.w $0b28,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f386:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f39c:
	dc.w $0008,$0010,$0003
	dc.w $0ad4,$0417,$0000,$fff8
	dc.w $0aaf,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f3c2:
	dc.w $0008,$0010,$0003
	dc.w $0ae0,$0417,$0000,$fff8
	dc.w $0b28,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f3e8:
	dc.w $0008,$0010,$0003
	dc.w $0ae0,$0417,$0000,$fff8
	dc.w $0aaf,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f40e:
	dc.w $0008,$0010,$0003
	dc.w $0ae5,$0417,$0000,$fff8
	dc.w $0b28,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f434:
	dc.w $0008,$0010,$0003
	dc.w $0ae5,$0417,$0000,$fff8
	dc.w $0aaf,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

loc_07f45a:
	dc.w $0008,$0010,$0003
	dc.w $0ae5,$0417,$0000,$fff8
	dc.w $0acf,$0017,$0050,$fff8
	dc.w $0b88,$0317,$ffc0,$fffa
	dc.w $0b88,$0517,$0000,$fffa

;##############################################
loc_07f480:
	move.b (4,a6),d0
	move.w loc_07f48c(pc,d0.w),d1
	jmp loc_07f48c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f48c:
	dc.w loc_07f494-loc_07f48c
	dc.w loc_07f4fe-loc_07f48c
	dc.w loc_07f54a-loc_07f48c
	dc.w loc_07f54a-loc_07f48c

;==============================================
loc_07f494:
	addq.b #2,(4,a6)
	move.b d0,($e,a6)
	move.w d0,($c,a6)
	move.b d0,($b,a6)
	move.w #$2000,($1a,a6)
	move.w #$e000,($18,a6)
	move.w #9,($3a,a6)
	move.w #$a8,($14,a6)
	move.w #$ff60,d1
	move.b ($3c,a6),d0
	beq.b loc_07f4ca
	move.w #$180,d1

loc_07f4ca:
	move.w d1,($10,a6)
	ext.w d0
	lsl.w #4,d0
	add.b (3,a6),d0
	andi.b #$1f,d0
	btst.b #5,(3,a6)
	beq.b loc_07f4e6
	addi.w #$40,d0

loc_07f4e6:
	tst.w (Region,a5)
	beq.b loc_07f4f0
	addi.w #$20,d0

loc_07f4f0:
	movea.l #loc_07f558,a0
	jsr loc_01b6e0
	moveq #0,d0

loc_07f4fe:
	tst.b ($5e00,a5)
	bne.w loc_07f550
	move.b (5,a6),d0
	move.w loc_07f512(pc,d0.w),d1
	jmp loc_07f512(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f512:
	dc.w loc_07f516-loc_07f512
	dc.w loc_07f534-loc_07f512

;----------------------------------------------
loc_07f516:
	move.w ($40,a6),d0
	add.w d0,($10,a6)
	subq.w #1,($3a,a6)
	bpl.b loc_07f52e
	addq.b #2,(5,a6)
	jsr loc_01b6b6

loc_07f52e:
	jmp loc_01b4ec

;----------------------------------------------
loc_07f534:
	cmpi.b #4,($12c,a5)
	bcc.w loc_07f550
	jsr loc_01b6b6
	jmp loc_01b4ec

;==============================================
loc_07f54a:
	jmp loc_01c28e

loc_07f550:
	move.b #6,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f558:
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f66a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f67a-loc_07f558
	dc.w loc_07f69a-loc_07f558
	dc.w loc_07f6aa-loc_07f558
	dc.w loc_07f6ba-loc_07f558
	dc.w loc_07f6ca-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6ea-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6fa-loc_07f558
	dc.w loc_07f71a-loc_07f558
	dc.w loc_07f72a-loc_07f558
	dc.w loc_07f73a-loc_07f558
	dc.w loc_07f74a-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f66a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f68a-loc_07f558
	dc.w loc_07f69a-loc_07f558
	dc.w loc_07f6aa-loc_07f558
	dc.w loc_07f6ba-loc_07f558
	dc.w loc_07f6ca-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f65a-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6ea-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f70a-loc_07f558
	dc.w loc_07f71a-loc_07f558
	dc.w loc_07f72a-loc_07f558
	dc.w loc_07f73a-loc_07f558
	dc.w loc_07f74a-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f6da-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f776-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f792-loc_07f558
	dc.w loc_07f7ca-loc_07f558
	dc.w loc_07f7e6-loc_07f558
	dc.w loc_07f802-loc_07f558
	dc.w loc_07f81e-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f856-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f872-loc_07f558
	dc.w loc_07f8aa-loc_07f558
	dc.w loc_07f8c6-loc_07f558
	dc.w loc_07f8e2-loc_07f558
	dc.w loc_07f8fe-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f776-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f7ae-loc_07f558
	dc.w loc_07f7ca-loc_07f558
	dc.w loc_07f7e6-loc_07f558
	dc.w loc_07f802-loc_07f558
	dc.w loc_07f81e-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f75a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f856-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f88e-loc_07f558
	dc.w loc_07f8aa-loc_07f558
	dc.w loc_07f8c6-loc_07f558
	dc.w loc_07f8e2-loc_07f558
	dc.w loc_07f8fe-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w loc_07f83a-loc_07f558
	dc.w $0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f65a:
	dc.w $0100,$0000
	dc.l loc_07f930
	dc.w $ff40,$0000
	dc.l loc_07f91a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f66a:
	dc.w $0100,$0000
	dc.l loc_07f964
	dc.w $ff40,$0000
	dc.l loc_07f93e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f67a:
	dc.w $0100,$0000
	dc.l loc_07f9a8
	dc.w $ff40,$0000
	dc.l loc_07f97a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f68a:
	dc.w $0100,$0000
	dc.l loc_07f9a8
	dc.w $ff40,$0000
	dc.l loc_07f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f69a:
	dc.w $0100,$0000
	dc.l loc_07fa0a
	dc.w $ff40,$0000
	dc.l loc_07f9ec

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6aa:
	dc.w $0100,$0000
	dc.l loc_07fa4e
	dc.w $ff40,$0000
	dc.l loc_07fa20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6ba:
	dc.w $0100,$0000
	dc.l loc_07fa4e
	dc.w $ff40,$0000
	dc.l loc_07fa64

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6ca:
	dc.w $0100,$0000
	dc.l loc_07fa4e
	dc.w $ff40,$0000
	dc.l loc_07fa92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6da:
	dc.w $0100,$0000
	dc.l loc_07fad6
	dc.w $ff40,$0000
	dc.l loc_07fac0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6ea:
	dc.w $0100,$0000
	dc.l loc_07fb0a
	dc.w $ff40,$0000
	dc.l loc_07fae4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f6fa:
	dc.w $0100,$0000
	dc.l loc_07fb46
	dc.w $ff40,$0000
	dc.l loc_07fb20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f70a:
	dc.w $0100,$0000
	dc.l loc_07fb46
	dc.w $ff40,$0000
	dc.l loc_07fb54

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f71a:
	dc.w $0100,$0000
	dc.l loc_07fb98
	dc.w $ff40,$0000
	dc.l loc_07fb7a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f72a:
	dc.w $0100,$0000
	dc.l loc_07fbdc
	dc.w $ff40,$0000
	dc.l loc_07fbae

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f73a:
	dc.w $0100,$0000
	dc.l loc_07fbdc
	dc.w $ff40,$0000
	dc.l loc_07fbf2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f74a:
	dc.w $0100,$0000
	dc.l loc_07fbdc
	dc.w $ff40,$0000
	dc.l loc_07fc20

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f75a:
	dc.w $0100,$0000
	dc.l loc_07f930

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f762:
	dc.w $0c00,$0000
	dc.l loc_07f91a
	dc.w $0c80,$0000
	dc.l loc_07fc4e
	dc.l loc_07f762

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f776:
	dc.w $0100,$0000
	dc.l loc_07f964

loc_07f77e:
	dc.w $0c00,$0000
	dc.l loc_07f93e

	dc.w $0c80,$0000
	dc.l loc_07fc74
	dc.l loc_07f77e


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f792:
	dc.w $0100,$0000
	dc.l loc_07f9a8

loc_07f79a:
	dc.w $0c00,$0000
	dc.l loc_07f97a
	dc.w $0c80,$0000
	dc.l loc_07fcaa
	dc.l loc_07f79a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f7ae:
	dc.w $0100,$0000
	dc.l loc_07f9a8

loc_07f7b6:
	dc.w $0c00,$0000
	dc.l loc_07f9be
	dc.w $0c80,$0000
	dc.l loc_07fce8
	dc.l loc_07f7b6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f7ca:
	dc.w $0100,$0000
	dc.l loc_07fa0a

loc_07f7d2:
	dc.w $0c00,$0000
	dc.l loc_07f9ec
	dc.w $0c80,$0000
	dc.l loc_07fd26
	dc.l loc_07f7d2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f7e6:
	dc.w $0100,$0000
	dc.l loc_07fa4e

loc_07f7ee:
	dc.w $0c00,$0000
	dc.l loc_07fa20
	dc.w $0c80,$0000
	dc.l loc_07fd54
	dc.l loc_07f7ee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f802:
	dc.w $0100,$0000
	dc.l loc_07fa4e

loc_07f80a:
	dc.w $0c00,$0000
	dc.l loc_07fa64
	dc.w $0c80,$0000
	dc.l loc_07fd92
	dc.l loc_07f80a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f81e:
	dc.w $0100,$0000
	dc.l loc_07fa4e

loc_07f826:
	dc.w $0c00,$0000
	dc.l loc_07fa92
	dc.w $0c80,$0000
	dc.l loc_07fdd0
	dc.l loc_07f826

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f83a:
	dc.w $0100,$0000
	dc.l loc_07fad6

loc_07f842:
	dc.w $0c00,$0000
	dc.l loc_07fac0
	dc.w $0c80,$0000
	dc.l loc_07fe0e
	dc.l loc_07f842

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f856:
	dc.w $0100,$0000
	dc.l loc_07fb0a

loc_07f85e:
	dc.w $0c00,$0000
	dc.l loc_07fae4
	dc.w $0c80,$0000
	dc.l loc_07fe34
	dc.l loc_07f85e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f872:
	dc.w $0100,$0000
	dc.l loc_07fb46

loc_07f87a:
	dc.w $0c00,$0000
	dc.l loc_07fb20
	dc.w $0c80,$0000
	dc.l loc_07fe6a
	dc.l loc_07f87a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f88e:
	dc.w $0100,$0000
	dc.l loc_07fb46

loc_07f896:
	dc.w $0c00,$0000
	dc.l loc_07fb54
	dc.w $0c80,$0000
	dc.l loc_07fea0
	dc.l loc_07f896

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f8aa:
	dc.w $0100,$0000
	dc.l loc_07fb98

loc_07f8b2:
	dc.w $0c00,$0000
	dc.l loc_07fb7a
	dc.w $0c80,$0000
	dc.l loc_07fed6
	dc.l loc_07f8b2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f8c6:
	dc.w $0100,$0000
	dc.l loc_07fbdc

loc_07f8ce:
	dc.w $0c00,$0000
	dc.l loc_07fbae
	dc.w $0c80,$0000
	dc.l loc_07ff04
	dc.l loc_07f8ce

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f8e2:
	dc.w $0100,$0000
	dc.l loc_07fbdc

loc_07f8ea:
	dc.w $0c00,$0000
	dc.l loc_07fbf2
	dc.w $0c80,$0000
	dc.l loc_07ff42
	dc.l loc_07f8ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f8fe:
	dc.w $0100,$0000
	dc.l loc_07fbdc
 
 loc_07f906:
	dc.w $0c00,$0000
	dc.l loc_07fc20
	dc.w $0c80,$0000
	dc.l loc_07ff80
	dc.l loc_07f906

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f91a:
	dc.w $0008,$0007,$0001
	dc.w $0aa6,$0217,$0030,$fff8
	dc.w $0b88,$0517,$0000,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f930:
	dc.w $0008,$0004,$0000
	dc.w $0b88,$0517,$0000,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f93e:
	dc.w $0008,$000d,$0003
	dc.w $0ba0,$0317,$0010,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f964:
	dc.w $0008,$0008,$0001
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f97a:
	dc.w $0008,$0012,$0004
	dc.w $0ba4,$0317,$0040,$ffe8
	dc.w $0a88,$0217,$0020,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f9a8:
	dc.w $0008,$0008,$0001
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f9be:
	dc.w $0008,$0012,$0004
	dc.w $0ba8,$0317,$0040,$ffe8
	dc.w $0a88,$0217,$0020,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07f9ec:
	dc.w $0008,$0012,$0002
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fa0a:
	dc.w $0008,$0009,$0001
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fa20:
	dc.w $0008,$0015,$0004
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abd,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fa4e:
	dc.w $0008,$0009,$0001
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fa64:
	dc.w $0008,$0015,$0004
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abe,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fa92:
	dc.w $0008,$0015,$0004
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abf,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fac0:
	dc.w $0008,$0008,$0001
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0417,$0050,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fad6:
	dc.w $0008,$0005,$0000
	dc.w $0b88,$0417,$0050,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fae4:
	dc.w $0008,$000e,$0003
	dc.w $0ba0,$0317,$0020,$fff8
	dc.w $0aa6,$0217,$0060,$fff8
	dc.w $0b88,$0017,$0020,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb0a:
	dc.w $0008,$0007,$0001
	dc.w $0b88,$0017,$0020,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb20:
	dc.w $0008,$0010,$0003
	dc.w $0ba4,$0317,$0060,$ffe8
	dc.w $0a88,$0217,$0040,$fff8
	dc.w $0aa6,$0217,$0070,$fff8
	dc.w $0b88,$0517,$0040,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb46:
	dc.w $0008,$000b,$0000
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb54:
	dc.w $0008,$0010,$0003
	dc.w $0ba8,$0317,$0060,$ffe8
	dc.w $0a88,$0217,$0040,$fff8
	dc.w $0aa6,$0217,$0070,$fff8
	dc.w $0b88,$0517,$0040,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb7a:
	dc.w $0008,$0013,$0002
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fb98:
	dc.w $0008,$000a,$0001
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fbae:
	dc.w $0008,$0016,$0004
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abd,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fbdc:
	dc.w $0008,$000a,$0001
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fbf2:
	dc.w $0008,$0016,$0004
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abe,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fc20:
	dc.w $0008,$0016,$0004
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abf,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fc4e:
	dc.w $0008,$000d,$0003
	dc.w $0aa6,$0217,$0030,$fff8
	dc.w $0b88,$0517,$0000,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fc74:
	dc.w $0008,$0013,$0005
	dc.w $0ba0,$0317,$0010,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fcaa:
	dc.w $0008,$0016,$0006
	dc.w $0ba4,$0317,$0040,$ffe8
	dc.w $0a88,$0217,$0020,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fce8:
	dc.w $0008,$0016,$0006
	dc.w $0ba8,$0317,$0040,$ffe8
	dc.w $0a88,$0217,$0020,$fff8
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0017,$0000,$fffa
	dc.w $0b88,$0617,$0010,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fd26:
	dc.w $0008,$0016,$0004
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fd54:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abd,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fd92:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abe,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fdd0:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0040,$ffe8
	dc.w $0abf,$0017,$0060,$ffe8
	dc.w $0aa0,$0817,$0000,$fff8
	dc.w $0b88,$0117,$0000,$fffa
	dc.w $0b88,$0617,$0020,$fffa
	dc.w $0b36,$0215,$0040,$0008
	dc.w $0aaf,$0015,$0070,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fe0e:
	dc.w $0008,$000c,$0003
	dc.w $0aa6,$0217,$0050,$fff8
	dc.w $0b88,$0417,$0050,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fe34:
	dc.w $0008,$0013,$0005
	dc.w $0ba0,$0317,$0020,$fff8
	dc.w $0aa6,$0217,$0060,$fff8
	dc.w $0b88,$0017,$0020,$fffa
	dc.w $0b88,$0617,$0030,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fe6a:
	dc.w $0008,$0014,$0005
	dc.w $0ba4,$0317,$0060,$ffe8
	dc.w $0a88,$0217,$0040,$fff8
	dc.w $0aa6,$0217,$0070,$fff8
	dc.w $0b88,$0517,$0040,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fea0:
	dc.w $0008,$0014,$0005
	dc.w $0ba8,$0317,$0060,$ffe8
	dc.w $0a88,$0217,$0040,$fff8
	dc.w $0aa6,$0217,$0070,$fff8
	dc.w $0b88,$0517,$0040,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07fed6:
	dc.w $0008,$0016,$0004
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ff04:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abd,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ff42:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abe,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ff80:
	dc.w $0008,$0019,$0006
	dc.w $0abb,$0117,$0060,$ffe8
	dc.w $0abf,$0017,$0080,$ffe8
	dc.w $0aa0,$0817,$0010,$fff8
	dc.w $0b88,$0117,$0010,$fffa
	dc.w $0b88,$0617,$0030,$fffa
	dc.w $0b36,$0215,$0060,$0008
	dc.w $0aaf,$0015,$0090,$0008
