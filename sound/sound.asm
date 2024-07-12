;==============================================
;Transfer to Z80 Ram
Sound_Transfer:
	moveq #0,d0
	tst.b (Dip_Sound_Mode,a5)
	beq.b loc_0030ce
	moveq #-1,d0

loc_0030ce:
	move.b d0,S68_Set_Mono
	move.w ($6e82,a5),d0
	cmp.w ($6e80,a5),d0
	beq.w loc_003166
	cmpi.b #$ff,S68_Play
	bne.b loc_003166
	lea (Sound_Buffer_Start,a5),a4
	move.w ($6e82,a5),d0
	move.b (a4,d0.w),$618007
	move.b (1,a4,d0.w),$618009
	move.b (2,a4,d0.w),S68_ID_Top
	move.b (3,a4,d0.w),S68_ID_Bottom
	move.b (4,a4,d0.w),$618005
	move.b (5,a4,d0.w),$61800d
	move.b (6,a4,d0.w),$61800f
	move.b (7,a4,d0.w),S68_Distance
	move.b (8,a4,d0.w),S68_Speed2_Top
	move.b (9,a4,d0.w),S68_Speed2_Bottom
	move.b ($a,a4,d0.w),S68_Speed1_Top
	move.b ($b,a4,d0.w),S68_Speed1_Bottom
	move.b #0,S68_Play
	addi.w #$10,d0
	andi.w #$ff0,d0
	move.w d0,($6e82,a5)

loc_003166:
	rts

;==============================================
Write_to_Sound_Buffer:
	tst.b (Dip_Demo_Sound,a5)
	bne.b loc_003174
	tst.b ($83,a5)
	bne.b loc_00319c

loc_003174:
	lea (Sound_Buffer_Start,a5),a4
	move.w ($6e80,a5),d0
	move.l d1,(a4,d0.w)
	move.l d2,(4,a4,d0.w)
	move.l d3,(8,a4,d0.w)
	move.b $ff8080,($c,a4,d0.w)
	addi.w #$10,d0
	andi.w #$ff0,d0
	move.w d0,($6e80,a5)

loc_00319c:
	rts

;==============================================
loc_00319e:
	move.w #$ff,d6
	lea (Sound_Buffer_Start,a5),a0
	moveq #0,d0

loc_0031a8:
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	dbra d6,loc_0031a8
	move.l d0,($6e80,a5)
	rts

;==============================================
loc_0031ba:
	bsr.w loc_0032a4
	move.l #$ff00,d1
	bra.w loc_003294

loc_0031c8:
	bsr.w loc_0032a4
	move.l #$ff01,d1
	bra.w loc_003294

loc_0031d6:
	bsr.w loc_0032a4
	move.b d0,d1
	andi.w #$f,d1
	swap d1
	move.w #$ff02,d1
	bra.w loc_003294

loc_0031ea:
	bsr.w loc_0032a4
	move.l #$ff03,d1
	bra.w loc_003294

loc_0031f8:
	bsr.w loc_0032a4
	move.b d0,d1
	andi.w #3,d1
	swap d1
	move.w #$ff04,d1
	bra.w loc_003294

loc_00320c:
	bsr.w loc_0032a4
	move.l #$ff05,d1
	bra.w loc_003294

loc_00321a:
	bsr.w loc_0032a4
	moveq #0,d2
	move.b d0,d2
	ror.l #8,d2
	move.l d0,d1
	move.w #$ff06,d1
	bra.w loc_003296

loc_00322e:
	bsr.w loc_0032a4
	moveq #0,d2
	move.b d0,d2
	ror.l #8,d2
	move.l d0,d1
	move.w #$ff07,d1
	bra.w loc_003296

loc_003242:
	bsr.w loc_0032a4
	move.w d0,d1
	swap d1
	move.w #$ff08,d1
	bra.w loc_003294

loc_003252:
	bsr.w loc_0032a4
	move.w d0,d1
	swap d1
	move.w #$ff09,d1
	bra.w loc_003294

loc_003262:
	bsr.w loc_0032a4
	move.l #$ff0a,d1
	bra.b loc_003294

loc_00326e:
	bsr.w loc_0032a4
	move.l #$ff0b,d1
	bra.b loc_003294

loc_00327a:
	bsr.w loc_0032a4
	move.w d0,d1
	swap d1
	move.w #$ff0c,d1
	bra.b loc_003294

loc_003288:
	bsr.w loc_0032a4
	move.w d0,d1
	swap d1
	move.w #$ff0d,d1

loc_003294:
	moveq #0,d2

loc_003296:
	moveq #0,d3
	bsr.w loc_003174

loc_00329c:
	movem.l (-$71a6,a5),d0-d3/a3-a4
	rts

;==============================================
loc_0032a4:
	movem.l d0-d3/a3-a4,(-$71a6,a5)
	rts

;==============================================
loc_0032ac:
	jsr loc_01bd5c
	move.w ($10,a6),d0
	bra.b loc_0032c6

loc_0032b8:
	exg.l a4,a6
	jsr loc_01bd5c
	dc.w $cd4c	;exg.l a6,a4
	move.w ($10,a4),d0

loc_0032c6:
	sub.w ($10,a3),d0
	bge.b loc_0032d0
	moveq #0,d0
	bra.b loc_0032da

loc_0032d0:
	cmpi.w #$17f,d0
	bls.b loc_0032da
	move.w #$17f,d0

loc_0032da:
	move.b loc_0032f0(pc,d0.w),d0
	lsl.w #8,d0
	andi.l #$00ff00,d0
	andi.l #$ff00ff,d2
	or.l d0,d2
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0032f0:
	dc.b $09,$09,$09,$09,$09,$09,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a
	dc.b $0a,$0a,$0a,$0a,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b
	dc.b $0b,$0b,$0b,$0b,$0b,$0b,$0b,$0b,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d
	dc.b $0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d
	dc.b $0d,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e
	dc.b $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e
	dc.b $0e,$0e,$0e,$0e,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
	dc.b $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
	dc.b $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$10,$10,$10,$10,$10
	dc.b $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	dc.b $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	dc.b $10,$10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11
	dc.b $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11
	dc.b $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12
	dc.b $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12
	dc.b $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$13
	dc.b $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13
	dc.b $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$14,$14
	dc.b $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14
	dc.b $14,$14,$14,$14,$14,$14,$14,$14,$15,$15,$15,$15,$15,$15,$15,$15
	dc.b $15,$15,$15,$15,$15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16
	dc.b $16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$17,$17,$17,$17,$17,$17

;==============================================
loc_003470:
	jsr loc_0032a4
	move.l #$80,d1
	move.l #$1000,d2
	moveq #0,d3
	jsr loc_003174
	jmp loc_00329c

;==============================================
loc_003490:
	jsr loc_0032a4
	move.l #$81,d1
	move.l #$1000,d2
	moveq #0,d3
	jsr loc_003174
	jmp loc_00329c

;==============================================
loc_0034b0:
	jsr loc_0032a4
	move.l #$c0,d1
	moveq #0,d2
	moveq #0,d3
	tst.b ($59,a6)
	beq.b loc_0034ca
	addi.w #$10,d1

loc_0034ca:
	jsr loc_0032ac
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_0034dc:
	jsr loc_0032a4
	move.l #$c1,d1
	moveq #0,d2
	moveq #0,d3
	tst.b ($59,a6)
	beq.b loc_0034f6
	addi.w #$10,d1

loc_0034f6:
	jsr loc_0032ac
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_003508:
	rts

;==============================================
loc_00350a:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_0038d8

loc_00351a:
	rts

;==============================================
loc_00351c:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_0038d8

loc_00352c:
	rts

;==============================================
loc_00352e:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_0038d8

;==============================================
loc_00353e:
	jsr loc_0032a4
	move.l #$e0,d1
	move.l #$1000,d2
	moveq #0,d3
	bra.w loc_0038d8

;==============================================
loc_003556:
	jsr loc_0032a4
	move.l #$ffff0000,d0
	jsr loc_00322e
	moveq #0,d1
	move.b ($12b,a5),d1
	move.b loc_003582(pc,d1.w),d1
	move.l #$71010,d2
	move.l #$c0,d3
	bra.w loc_0038d8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003582:
	dc.b $e1,$e1,$e1,$e1
	dc.b $e1,$e1,$e1,$e2
	dc.b $e1,$e1,$e1,$e1
	dc.b $00,$00

;==============================================
loc_003590:
	jsr loc_0032a4
	move.l #$e3,d1
	move.l #$1000,d2
	moveq #0,d3
	bra.w loc_0038d8

;==============================================
loc_0035a8:
	jsr loc_0032a4
	move.l #$e4,d1
	move.b ($59,a6),d2
	andi.l #1,d2
	ror.w #4,d2
	addi.w #$800,d2
	moveq #0,d3
	bra.w loc_0038d8

;==============================================
loc_0035ca:
	jsr loc_0032a4
	move.l #$23c,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_0035de:
	jsr loc_0032a4
	move.l #$23b,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_0035f2:
	rts

;==============================================
loc_0035f4:
	jsr loc_0032a4
	move.l #$23d,d1
	moveq #$0,d2
	moveq #$0,d3
	bra.w loc_003938

;==============================================
loc_003608:
	jsr loc_0032a4
	move.l #$23e,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_00361c:
	jsr loc_0032a4
	move.l #$23f,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_003630:
	jsr loc_0032a4
	move.l #$232,d1
	move.l #$3210d40,d0
	move.b ($102,a6),d2
	btst.l d2,d0
	beq.b loc_00364c
	addq.w #1,d1

loc_00364c:
	tst.w ($50,a6)
	bpl.b loc_003654
	addq.w #3,d1

loc_003654:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================:
loc_00365c:
	jsr loc_0032a4
	move.l #$233,d1
	move.l #$3210d40,d0
	move.b ($102,a6),d2
	btst.l d2,d0
	beq.b loc_003678
	addq.w #1,d1

loc_003678:
	tst.w ($50,a6)
	bpl.b loc_003680
	addq.w #3,d1

loc_003680:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_003688:
	jsr loc_0032a4
	move.l #$242,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_00369c:
	jsr loc_0032a4
	move.l #$230,d1
	move.l #$3210d40,d0
	move.b ($102,a6),d2
	btst.l d2,d0
	beq.b loc_0036b8
	addq.w #1,d1

loc_0036b8:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_0036c0:
	jsr loc_0032a4
	move.l #$22e,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_0036d4:
	jsr loc_0032a4
	move.l #$20c,d1
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bpl.b loc_0036ee
	addi.w #$10,d1

loc_0036ee:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_0036f6:
	jsr loc_0032a4
	move.l #$20d,d1
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bpl.b loc_003710
	addi.w #$10,d1

loc_003710:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

;==============================================
loc_003718:
	jsr loc_0032a4
	move.l #$20e,d1
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bpl.b loc_003732
	addi.w #$10,d1

loc_003732:
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_00373a:
	jsr loc_0032a4
	move.l #$240,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_00374e:
	jsr loc_0032a4
	move.l #$241,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003762:
	jsr loc_0032a4
	movea.w ($38,a6),a4
	move.l #$241,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003956

;==============================================
loc_00377a:
	jsr loc_0032a4
	move.l #$241,d1
	moveq #0,d2
	moveq #0,d3
	jsr Write_to_Sound_Buffer
	move.l #$741,d1
	moveq #0,d2
	moveq #0,d3
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

loc_0037a6:
	rts

;==============================================
loc_0037a8:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_0037b8:
	rts

loc_0037ba:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_0037ca:
	rts

loc_0037cc:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_0037dc:
	rts

loc_0037de:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_0037ee:
	rts

loc_0037f0:
	jsr loc_0032a4
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003800:
	jsr loc_0032a4
	move.l #$24c,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003814:
	jsr loc_0032a4
	move.l #$24e,d1
	add.b (PL_ism_choice,a6),d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_00382c:
	jsr loc_0032a4
	move.l #$258,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003840:
	jsr loc_0032a4
	move.l #$264,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003854:
	jsr loc_0032a4
	move.l #$274,d1
	add.b ($290,a6),d1
	eori.b #1,($290,a6)
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003872:
	jsr loc_0032a4
	move.l #$203,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003974

loc_003886:
	jsr loc_0032a4
	move.l #$244,d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_00389a:
	jsr loc_0032a4
	jsr loc_00320c
	move.l #$a0,d1
	moveq #0,d2
	moveq #0,d3
	jsr loc_003174
	jmp loc_00329c

loc_0038bc:
	jsr loc_0032a4
	move.l #$a1,d1
	moveq #0,d2
	moveq #0,d3
	jsr loc_003174
	jmp loc_00329c

loc_0038d8:
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_0038e4:
	jsr loc_0032a4
	moveq #0,d1
	movea.l ($e6,a6),a3
	lsl.w #3,d0
	tst.b ($bc,a5)
	beq.b loc_0038fa
	addq.w #2,d0

loc_0038fa:
	move.w (a3,d0.w),d1
	beq.b loc_003908
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003908:
	jmp loc_00329c

;==============================================
loc_00390e:
	jsr loc_0032a4
	moveq #0,d1
	movea.l ($e6,a4),a3
	lsl.w #3,d0
	tst.b ($bc,a5)
	beq.b loc_003924
	addq.w #2,d0

loc_003924:
	move.w (a3,d0.w),d1
	beq.b loc_003932
	moveq #0,d2
	moveq #0,d3
	bra.w loc_003938

loc_003932:
	jmp loc_00329c

loc_003938:
	btst.b #0,($59,a6)
	beq.b loc_003944
	addi.w #$500,d1

loc_003944:
	jsr loc_0032ac
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_003956:
	btst.b #0,($59,a4)
	beq.b loc_003962
	addi.w #$500,d1

loc_003962:
	jsr loc_0032b8
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_003974:
	btst.b #0,($59,a4)
	beq.b loc_003980
	addi.w #$500,d1

loc_003980:
	jsr loc_0032ac
	jsr Write_to_Sound_Buffer
	jmp loc_00329c


;==============================================
loc_003992:
	btst.b #0,($59,a6)
	beq.b loc_00399e
	addi.w #$500,d1

loc_00399e:
	jsr loc_0032b8
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_0039b0:
	btst.b #0,($59,a6)
	beq.b loc_0039bc
	addi.w #$500,d1

loc_0039bc:
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_0039c8:
	btst.b #0,($59,a4)
	beq.b loc_0039d4
	addi.w #$500,d1

loc_0039d4:
	jsr Write_to_Sound_Buffer
	jmp loc_00329c

;==============================================
loc_0039e0:
	cmpi.w #$16,d0
	beq.b loc_0039ec

;Music off check
	tst.b (Dip_BGM,a5)
	bne.b loc_003a0e

loc_0039ec:
	jsr loc_0032a4
	move.w d0,(-$718e,a5)
	move.l #$ffff0000,d0
	jsr loc_00322e
	move.w (-$718e,a5),d0
	move.w loc_003a10(pc,d0.w),d1
	jmp loc_003a10(pc,d1.w)

loc_003a0e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003a10:
	dc.w Set_Stage_BGM-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10

	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10

	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003b16-loc_003a10

	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10
	dc.w loc_003ae0-loc_003a10


;==============================================
Set_Stage_BGM:
	lea (p3memory,a5),a4
	tst.w (Dramatic_Mode_Type,a5)
	bne.b loc_003a48
	lea (p1memory,a5),a4
	tst.b ($130,a5)
	bne.b loc_003a48
	lea (p2memory,a5),a4

loc_003a48:
	moveq #0,d0
	move.b (PL_charid,a4),d0
	cmpi.b #Sodom_id,d0
	bne.b loc_003a5e
	tst.b (PL_ism_choice,a4)
	bpl.b loc_003a5e
	moveq #$20,d0
	bra.b loc_003aac

loc_003a5e:
	tst.b ($141,a5)
	bne.b loc_003aac
	tst.b ($15d,a4)
	beq.b loc_003a6e
	moveq #$21,d0
	bra.b loc_003aac

loc_003a6e:
	tst.b ($15d,a5)
	bne.b loc_003aac
	cmpi.w #9,(Arcade_Match_Var,a5)
	bne.b loc_003a86
	cmpi.b #0,d0
	bne.b loc_003a86
	moveq #$22,d0;Set Evil Ryu Song
	bra.b loc_003aac

loc_003a86:
	cmpi.w #8,(Arcade_Match_Var,a5)
	bne.b loc_003a9a
	cmpi.w #Boss_Stage,(Main_stageid,a5)
	bne.b loc_003a9a
	moveq #$23,d0;Set Final Round Song
	bra.b loc_003aac

loc_003a9a:
	cmpi.w #8,(Arcade_Match_Var,a5)
	bne.b loc_003aac
	cmpi.w #Akm_Stage,(Main_stageid,a5)
	bne.b loc_003aac
	moveq #$24,d0;Set Shin Akuma Song

loc_003aac:
	moveq #0,d1
	move.b Stage_Songids(pc,d0.w),d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_0038d8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
Stage_Songids:
	dc.b $09;Ryu
	dc.b $0a;Ken
	dc.b $0b;Akuma
	dc.b $0c;Nash
	dc.b $0d;Chun
	dc.b $0e;Adon
	dc.b $0f;Sodom
	dc.b $10;Guy

	dc.b $11;Birdie
	dc.b $12;Rose
	dc.b $13;Dic
	dc.b $14;Sagat
	dc.b $15;Dan
	dc.b $16;Sakura
	dc.b $17;Rolento
	dc.b $18;Dhalsim

	dc.b $19;Zangief
	dc.b $1a;Gen
	dc.b $00;0x12
	dc.b $00;GenC
	dc.b $00;0x14
	dc.b $1e;Boxer
	dc.b $1f;Cammy
	dc.b $00;0x17

	dc.b $21;E.Honda
	dc.b $22;Blanka
	dc.b $23;R.Mika
	dc.b $24;Cody
	dc.b $25;Claw
	dc.b $26;Karin
	dc.b $27;Juli
	dc.b $27;Juni

	dc.b $1d;
	dc.b $20;Boss
	dc.b $28;Evil Ryu
	dc.b $29;Final Round
	dc.b $1b;Shin Akuma
	dc.b $00;

;==============================================
loc_003ae0:
	subq.w #2,d0
	bcs.b loc_003af2
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	move.w loc_003af8(pc,d0.w),d1
	bra.w loc_0038d8

loc_003af2:
	jmp loc_00329c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003af8:
	dc.w $002d;00 Credits
	dc.w $002f;02 Qsound
	dc.w $0008;04 
	dc.w $0002;06 Character Select
	dc.w $0004;08 
	dc.w $0004;0a Battle End
	dc.w $0005;0c Continue
	dc.w $0003;0e Here Comes a Challenger
	dc.w $0006;10 Game Over
	dc.w $0007;12 Initial Entry
	dc.w $0001;14 Attract Demo
	dc.w $0008;16 Char Intro
	dc.w $002b;18 Rival Battle
	dc.w $002c;1a Boss Text
	dc.w $0029;1c Final Round

;==============================================
loc_003b16:
	moveq #1,d1
	moveq #0,d2
	move.l #$7fff,d3

;All Music off check
	tst.b (Dip_BGM,a5)
	bne.b loc_003b34

;Demo Sound
	tst.b (Dip_Demo_Sound,a5)
	bne.b loc_003b32

;
	tst.b ($83,a5)
	bne.b loc_003b34

loc_003b32:
	moveq #0,d3

loc_003b34:
	jsr loc_003174
	jmp loc_00329c

;==============================================
loc_003b40:
	jsr loc_0032a4
	move.l #$110,d1
	tst.b ($143,a5)
	bne.b loc_003b5e
	move.b ($80,a5),d1
	andi.w #7,d1
	addi.w #$104,d1

loc_003b5e:
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003b6c:
	jsr loc_0032a4
	moveq #0,d1
	move.b ($80,a5),d1
	andi.b #3,d1
	addi.w #$10c,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003b8e:
	jsr loc_0032a4
	move.l #$111,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003ba8:
	jsr loc_0032a4
	move.l #$112,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003bc2:
	jsr loc_0032a4
	move.l #$113,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003bdc:
	jsr loc_0032a4
	move.l #$114,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003bf6:
	jsr loc_0032a4
	move.l #$115,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c10:
	jsr loc_0032a4
	move.l #$116,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c2a:
	jsr loc_0032a4
	move.l #$117,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c44:
	jsr loc_0032a4
	move.l #$118,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c5e:
	jsr loc_0032a4
	move.l #$130,d1
	add.b d0,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c7a:
	jsr loc_0032a4
	move.l #$11d,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003c94:
	jsr loc_0032a4
	move.l #$11e,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003cae:
	jsr loc_0032a4
	move.l #$11f,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
;random fight praise
;loc 0x3cc8
;==============================================
Play_Fight_Praise:
	jsr loc_0032a4
	jsr RNGFunction
	andi.w #$f,d0
	cmp.b (-$718c,a5),d0
	bne.b loc_003ce4
	addq.w #8,d0
	andi.w #$f,d0

loc_003ce4:
	move.w d0,(-$718c,a5)
	move.l #$120,d1;start of praise sounds
	add.w d0,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
;Play "This is Street Fighter" on splash
;loc 0x3cfe
;==============================================
Set_Splash_SFXID:
	jsr loc_0032a4
	move.l #$102,d1;This is Street Fighter
	add.b (Dip_SFAlpha,a5),d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
;Play Street Fighter title name
;loc 0x3d1c
;==============================================
Set_TitleScrn_SFXID:
	jsr loc_0032a4
	move.l #$100,d1
	add.b (Dip_SFAlpha,a5),d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003d3a:
	jsr loc_0032a4
	jsr RNGFunction
	andi.w #1,d0
	bsr.w loc_003e6c
	addq.w #1,d1
	add.w d0,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003d5c:
	jsr loc_0032a4
	bsr.w loc_003e6c
	addq.w #3,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003d72:
	rts

;==============================================
loc_003d74:
	jsr loc_0032a4
	bsr.w loc_003e6c
	addq.w #4,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003d8a:
	jsr loc_0032a4
	bsr.w loc_003e6c
	tst.b ($107,a5)
	bne.b loc_003d9c
	addq.w #4,d1

loc_003d9c:
	tst.b ($bc,a5)
	beq.b loc_003dae
	cmpi.b #Sodom_id,(PL_charid,a6)
	bne.b loc_003dae
	move.w #$3d5,d1

loc_003dae:
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003db8:
	jsr loc_0032a4
	tst.b ($bc,a5)
	bne.b loc_003dd4
	bsr.w loc_003e6c
	addq.w #5,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

loc_003dd4:
	moveq #0,d1
	move.b (PL_charid,a6),d1
	add.w d1,d1
	move.w loc_003dea(pc,d1.w),d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003dea:
	dc.w $0305;Ryu
	dc.w $0328;Ken
	dc.w $0345;Akuma
	dc.w $0365;Nash
	dc.w $0385;Chun
	dc.w $03a5;Adon
	dc.w $03c5;Sodom
	dc.w $03e5;Guy
	dc.w $0405;Birdie
	dc.w $0425;Rose
	dc.w $0445;Dic
	dc.w $0465;Sagat
	dc.w $0485;Dan
	dc.w $04a5;Sakura
	dc.w $04c5;Rolento
	dc.w $04e5;Sim
	dc.w $0505;Gief
	dc.w $0525;Gen
	dc.w $0000;0x12
	dc.w $0525;Genc
	dc.w $0000;0x14
	dc.w $05a5;Boxer
	dc.w $05c5;Cammy
	dc.w $0000;0x17
	dc.w $0603;Ehonda
	dc.w $0625;Blanka
	dc.w $0645;RMika
	dc.w $0665;Cody
	dc.w $0685;Claw
	dc.w $06a2;Karin
	dc.w $05c5;Juli
	dc.w $05c5;Juni

;==============================================
loc_003e2a:
	jsr loc_0032a4
	bsr.w loc_003e6c
	addq.w #6,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003e40: 
	jsr loc_0032a4
	bsr.w loc_003e6c
	addq.w #7,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003e56:
	jsr loc_0032a4
	bsr.w loc_003e6c
	addq.w #8,d1
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

;==============================================
loc_003e6c:
	moveq #0,d1
	move.b (PL_charid,a6),d1
	add.w d1,d1
	move.w loc_003e7a(pc,d1.w),d1
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003e7a:
	dc.w $0300;Ryu
	dc.w $0320;Ken
	dc.w $0340;Akuma
	dc.w $0360;Nash
	dc.w $0380;Chun
	dc.w $03a0;Adon
	dc.w $03c0;Sodom
	dc.w $03e0;Guy
	dc.w $0400;Birdie
	dc.w $0420;Rose
	dc.w $0440;Dic
	dc.w $0460;Sagat
	dc.w $0480;Dan
	dc.w $04a0;Sakura
	dc.w $04c0;Rolento
	dc.w $04e0;Sim
	dc.w $0500;Gief
	dc.w $0520;Gen
	dc.w $0000;0x12
	dc.w $0520;Genc
	dc.w $0000;0x14
	dc.w $05a0;Boxer
	dc.w $05c0;Cammy
	dc.w $0000;0x17
	dc.w $0600;Ehonda
	dc.w $0620;Blanka
	dc.w $0640;RMika
	dc.w $0660;Cody
	dc.w $0680;Claw
	dc.w $06a0;Karin
	dc.w $05c0;Juli
	dc.w $05c0;Juni