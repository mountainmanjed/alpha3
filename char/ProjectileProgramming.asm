	include "char/Ryu/projectiles.68k"
	include "char/Ken/projectiles.68k"
	include "char/Akuma/projectiles.68k"
	include "char/Charlie/projectiles.68k"
	include "char/Chun/projectiles.68k"

;##############################################
;05
;##############################################
loc_07530a:
	move.b (4,a6),d0
	move.w loc_075316(pc,d0.w),d1
	jmp loc_075316(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075316:
	dc.w loc_07531e-loc_075316
	dc.w loc_07535a-loc_075316
	dc.w loc_0753aa-loc_075316
	dc.w loc_0753aa-loc_075316

;==============================================
;
;==============================================
loc_07531e:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0753b8,($60,a6)
	move.l #loc_0753b0,($88,a6)
	jsr loc_03323a
	clr.b ($31,a6)
	clr.w ($50,a6)
	moveq #0,d0
	jsr loc_0331d0

;==============================================
;
;==============================================
loc_07535a:
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_07536e(pc,d0.w),d1
	jsr loc_07536e(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07536e:
	dc.w loc_075378-loc_07536e
	dc.w loc_0753a4-loc_07536e
	dc.w loc_0753a4-loc_07536e
	dc.w loc_0753a4-loc_07536e
	dc.w loc_0753a4-loc_07536e

;----------------------------------------------
loc_075378:
	movea.w ($36,a6),a4
	cmpi.b #$10,(6,a4)
	bne.b loc_07539e
	move.b #1,(a6)
	tst.b ($34,a4)
	bne.b loc_075390
	addq.b #1,(a6)

loc_075390:
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	rts

loc_07539e:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_0753a4:
	addq.b #2,(4,a6)
	rts

;==============================================
;
;==============================================
loc_0753aa:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0753b0:
	dc.w $0000,$0000,$0100,$0000

loc_0753b8:
	dc.w loc_0753c2-loc_0753b8
	dc.w loc_0753c2-loc_0753b8
	dc.w loc_0753c2-loc_0753b8
	dc.w loc_0753c2-loc_0753b8
	dc.w loc_0753d2-loc_0753b8

loc_0753c2:
	dc.l $00000000,$00000000,$ffcc003a,$00120018

loc_0753d2:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;06
;##############################################
loc_0753f2:
	move.b (4,a6),d0
	move.w loc_0753fe(pc,d0.w),d1
	jmp loc_0753fe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0753fe:
	dc.w loc_075412-loc_0753fe
	dc.w loc_0754e8-loc_0753fe
	dc.w loc_0755b6-loc_0753fe
	dc.w loc_075618-loc_0753fe

loc_075406:
	dc.l $00090000
	dc.l $00090000
	dc.l $00090000

;==============================================
;
;==============================================
loc_075412:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.w ($18,a4),($18,a6)
	move.w ($64,a4),($14,a6)
	moveq #$a,d0
	jsr loc_02fc88
	move.l #loc_0756da,($60,a6)
	move.l #loc_0756d2,($88,a6)
	jsr loc_03323a
	bsr.w loc_07562c
	moveq #0,d0
	move.b d0,($31,a6)
	move.b ($72,a6),d0
	add.w d0,d0
	move.l loc_075406(pc,d0.w),d0
	moveq #$59,d1
	tst.b ($b,a6)
	bne.b loc_07546c
	neg.l d0
	neg.l d1

loc_07546c:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	moveq #5,d0
	jsr loc_0331d0
	cmpi.b #2,($6eb9,a5)
	bcs.w loc_0754e2
	jsr loc_01c2c8
	movea.l a4,a3
	jsr loc_01c2c8
	cmpa.l a3,a4
	bcc.b loc_07549a
	exg.l a3,a4

loc_07549a:
	addq.b #1,(a4)
	move.w #$3909,(2,a4)
	move.w a6,($36,a4)
	move.l ($40,a6),($40,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$c,($3a,a4)
	addq.b #1,(a3)
	move.w #$3909,(2,a3)
	move.w a6,($36,a3)
	move.l ($40,a6),($40,a3)
	move.w ($10,a6),($10,a3)
	move.w ($14,a6),($14,a3)
	move.w #$18,($3a,a3)

loc_0754e2:
	moveq #0,d0
	bra.w loc_0754e8

;==============================================
;
;==============================================
loc_0754e8:
	move.b (5,a6),d0
	move.w loc_0754f4(pc,d0.w),d1
	jmp loc_0754f4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0754f4:
	dc.w loc_0754fe-loc_0754f4
	dc.w loc_07555c-loc_0754f4
	dc.w loc_07555c-loc_0754f4
	dc.w loc_07555c-loc_0754f4
	dc.w loc_07555c-loc_0754f4

;----------------------------------------------
loc_0754fe:
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	beq.b loc_075520
	move.b #2,(a6)
	move.l #$4000000,(4,a6)

loc_075520:
	movea.w ($36,a6),a4
	jsr loc_07bdb4
	bne.b loc_075556
	tst.b ($35,a6)
	bmi.b loc_07553a
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_07553a:
	jsr loc_033210
	movea.w ($36,a6),a4
	move.b ($d,a4),d0
	add.b ($34,a6),d0
	move.b d0,($d,a6)
	jsr loc_01b490

loc_075556:
	jmp loc_01b4d0

;----------------------------------------------
loc_07555c:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_075572
	move.b (6,a6),d0
	move.w loc_075578(pc,d0.w),d1
	jsr loc_075578(pc,d1.w)

loc_075572:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075578:
	dc.w loc_07557c-loc_075578
	dc.w loc_0755a2-loc_075578

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07557c:
	addq.b #2,(6,a6)
	bsr.w loc_07562c
	move.b #2,($3a,a6)
	jsr loc_033210
	movea.w ($36,a6),a4
	move.b ($d,a4),d0
	add.b ($34,a6),d0
	move.b d0,($d,a6)
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0755a2:
	subq.b #1,($3a,a6)
	bne.b loc_0755b4
	move.b #1,(a6)
	move.l #$2000000,(4,a6)

loc_0755b4:
	rts

;==============================================
;
;==============================================
loc_0755b6:
	move.b (5,a6),d0
	move.w loc_0755c8(pc,d0.w),d1
	jsr loc_0755c8(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0755c8:
	dc.w loc_0755cc-loc_0755c8
	dc.w loc_0755dc-loc_0755c8

;----------------------------------------------
loc_0755cc:
	addq.b #2,(5,a6)
	move.b #2,(a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)

;----------------------------------------------
loc_0755dc:
	movea.w ($36,a6),a4
	jsr loc_07bdb4
	bne.b loc_075612
	tst.b ($35,a6)
	bmi.b loc_0755f6
	move.l ($40,a6),d0
	add.l d0,($10,a6)

loc_0755f6:
	jsr loc_033210
	movea.w ($36,a6),a4
	move.b ($d,a4),d0
	add.b ($34,a6),d0
	move.b d0,($d,a6)
	jsr loc_01b490

loc_075612:
	jmp loc_01b4d0

;==============================================
;
;==============================================
loc_075618:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_075626
	clr.w ($a4,a4)

loc_075626:
	jmp loc_01c206

;==============================================
loc_07562c:
	lea.l loc_075714(pc),a0
	move.b ($72,a6),d0
	beq.b loc_075644
	lea.l loc_0757f8(pc),a0
	cmpi.b #2,d0
	beq.b loc_075644
	lea.l loc_075928(pc),a0

loc_075644:
	move.w ($50,a6),d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;##############################################
;Psycho Streak
;##############################################
loc_07565c:
	jsr loc_01c1c8
	beq.w loc_0756d0
	addq.b #1,(a4)
	move.w #$600,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	lsr.w #1,d0
	addq.w #2,d0
	move.w d0,($50,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	addq.b #3,($d,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_0756d0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0756d2:
	dc.w $0000,$0000,$0100,$0000

loc_0756da:
	dc.w loc_0756e4-loc_0756da
	dc.w loc_0756e4-loc_0756da
	dc.w loc_0756e4-loc_0756da
	dc.w loc_0756e4-loc_0756da
	dc.w loc_0756f4-loc_0756da

loc_0756e4:
	dc.l $00000000,$00000000,$ffe80042,$00280010

loc_0756f4:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075714:
	dc.w loc_07571a-loc_075714
	dc.w loc_075724-loc_075714
	dc.w loc_07572e-loc_075714

loc_07571a:
	dc.w loc_0756e4-loc_07571a
	dc.w loc_0756e4-loc_07571a
	dc.w loc_0756e4-loc_07571a
	dc.w loc_0756e4-loc_07571a
	dc.w loc_075738-loc_07571a

loc_075724:
	dc.w loc_0756e4-loc_075724
	dc.w loc_0756e4-loc_075724
	dc.w loc_0756e4-loc_075724
	dc.w loc_0756e4-loc_075724
	dc.w loc_075778-loc_075724

loc_07572e:
	dc.w loc_0756e4-loc_07572e
	dc.w loc_0756e4-loc_07572e
	dc.w loc_0756e4-loc_07572e
	dc.w loc_0756e4-loc_07572e
	dc.w loc_0757b8-loc_07572e

loc_075738:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040a09,$00250000,$00000000

loc_075778:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040a09,$00250000,$00000000

loc_0757b8:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040a09,$00250000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0757f8:
	dc.w loc_075800-loc_0757f8
	dc.w loc_07580a-loc_0757f8
	dc.w loc_075814-loc_0757f8
	dc.w loc_07581e-loc_0757f8

loc_075800:
	dc.w loc_0756e4-loc_075800
	dc.w loc_0756e4-loc_075800
	dc.w loc_0756e4-loc_075800
	dc.w loc_0756e4-loc_075800
	dc.w loc_075828-loc_075800

loc_07580a:
	dc.w loc_0756e4-loc_07580a
	dc.w loc_0756e4-loc_07580a
	dc.w loc_0756e4-loc_07580a
	dc.w loc_0756e4-loc_07580a
	dc.w loc_075868-loc_07580a

loc_075814:
	dc.w loc_0756e4-loc_075814
	dc.w loc_0756e4-loc_075814
	dc.w loc_0756e4-loc_075814
	dc.w loc_0756e4-loc_075814
	dc.w loc_0758a8-loc_075814

loc_07581e:
	dc.w loc_0756e4-loc_07581e
	dc.w loc_0756e4-loc_07581e
	dc.w loc_0756e4-loc_07581e
	dc.w loc_0756e4-loc_07581e
	dc.w loc_0758e8-loc_07581e

loc_075828:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040b09,$00260000,$00000000

loc_075868:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040b09,$00260000,$00000000

loc_0758a8:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040b09,$00260000,$00000000

loc_0758e8:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040b09,$00260000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075928:
	dc.w loc_075932-loc_075928
	dc.w loc_07593c-loc_075928
	dc.w loc_075946-loc_075928
	dc.w loc_075950-loc_075928
	dc.w loc_07595a-loc_075928

loc_075932:
	dc.w loc_0756e4-loc_075932
	dc.w loc_0756e4-loc_075932
	dc.w loc_0756e4-loc_075932
	dc.w loc_0756e4-loc_075932
	dc.w loc_075964-loc_075932

loc_07593c:
	dc.w loc_0756e4-loc_07593c
	dc.w loc_0756e4-loc_07593c
	dc.w loc_0756e4-loc_07593c
	dc.w loc_0756e4-loc_07593c
	dc.w loc_0759a4-loc_07593c

loc_075946:
	dc.w loc_0756e4-loc_075946
	dc.w loc_0756e4-loc_075946
	dc.w loc_0756e4-loc_075946
	dc.w loc_0756e4-loc_075946
	dc.w loc_0759e4-loc_075946

loc_075950:
	dc.w loc_0756e4-loc_075950
	dc.w loc_0756e4-loc_075950
	dc.w loc_0756e4-loc_075950
	dc.w loc_0756e4-loc_075950
	dc.w loc_075a24-loc_075950

loc_07595a:
	dc.w loc_0756e4-loc_07595a
	dc.w loc_0756e4-loc_07595a
	dc.w loc_0756e4-loc_07595a
	dc.w loc_0756e4-loc_07595a
	dc.w loc_075a64-loc_07595a

loc_075964:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040c09,$00270000,$00000000

loc_0759a4:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040c09,$00270000,$00000000

loc_0759e4:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040c09,$00270000,$00000000

loc_075a24:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040c09,$00270000,$00000000

loc_075a64:
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $ffe80042,$00280010,$0f031b00,$00180104
	dc.l $04000602,$0c040c09,$00270000,$00000000

;##############################################
;07
;##############################################
loc_075aa4:
	jmp loc_01c206

;##############################################
;08
;##############################################
loc_075aaa:
	jmp loc_01c206

;##############################################
;09 Soul Spark
;##############################################
loc_075ab0:
	move.b (4,a6),d0
	move.w loc_075abc(pc,d0.w),d1
	jmp loc_075abc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075abc:
	dc.w loc_075ac4-loc_075abc
	dc.w loc_075b5e-loc_075abc
	dc.w loc_075dac-loc_075abc
	dc.w loc_075de6-loc_075abc

;==============================================
;
;==============================================
loc_075ac4:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0760b2,($88,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.b d0,($3b,a6)
	move.b d0,(3,a6)
	move.b #5,($4c,a6)
	move.b #$b,($4e,a6)
	move.b d0,($4d,a6)
	move.b d0,($4f,a6)
	move.b ($72,a6),d0
	add.w d0,d0
	moveq #3,d1
	tst.b ($73,a6)
	beq.b loc_075b12
	moveq #$c,d0
	moveq #1,d1

loc_075b12:
	move.b d1,($70,a6)
	move.l loc_075b36(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_075b22
	neg.l d1

loc_075b22:
	move.l d1,($40,a6)
	moveq #2,d0
	jsr loc_0331d0
	bsr.w loc_075dfa
	bra.w loc_075e60

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075b36:
	dc.l $00038000
	dc.l $00040000
	dc.l $00050000
	dc.l $00048000

;==============================================
loc_075b46:
	moveq #0,d0
	tst.b ($73,a6)
	beq.b loc_075b58
	move.b ($72,a6),d0
	lsr.w #1,d0
	addi.b #5,d0

loc_075b58:
	jmp loc_0331d0

;==============================================
;
;==============================================
loc_075b5e:
	movea.w ($36,a6),a4
	subq.b #1,($4c,a6)
	bpl.b loc_075b84
	move.b #5,($4c,a6)
	move.w ($c,a4),($c,a6)
	eori.b #1,($4d,a6)
	beq.b loc_075b84
	st.b ($c,a6)
	addq.b #1,($d,a6)

loc_075b84:
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_075b92(pc,d0.w),d1
	jmp loc_075b92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075b92:
	dc.w loc_075b9c-loc_075b92
	dc.w loc_075c52-loc_075b92
	dc.w loc_075c9c-loc_075b92
	dc.w loc_075ca2-loc_075b92
	dc.w loc_075d2c-loc_075b92

;----------------------------------------------
loc_075b9c:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_075bb2
	move.b (6,a6),d0
	move.w loc_075bb8(pc,d0.w),d1
	jsr loc_075bb8(pc,d1.w)

loc_075bb2:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075bb8:
	dc.w loc_075bc2-loc_075bb8
	dc.w loc_075c32-loc_075bb8

loc_075bbc:
	dc.b $0a,$0e,$12,$0a,$12,$0e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075bc2:
	bsr.w loc_075e60
	moveq #6,d0
	tst.b ($73,a6)
	bne.b loc_075bd0
	moveq #0,d0

loc_075bd0:
	add.b ($72,a6),d0
	lsr.w #1,d0
	move.b loc_075bbc(pc,d0.w),d1
	addq.b #1,($3b,a6)
	cmp.b ($3b,a6),d1
	bhi.b loc_075bf0
	addq.b #2,(6,a6)
	bsr.w loc_075b46
	bra.w loc_075dfa

loc_075bf0:
	movea.w ($36,a6),a4
	tst.b ($23b,a4)
	beq.b loc_075c02
	move.l #$06000000,(4,a6)

loc_075c02:
	tst.b ($107,a5)
	beq.b loc_075c0c
	move.b #2,(a6)

loc_075c0c:
	subq.b #1,($4e,a6)
	bpl.b loc_075c1e
	move.b #1,($4e,a6)
	jsr loc_097982

loc_075c1e:
	jsr loc_033210
	tst.b ($5e,a6)
	bne.b loc_075c30
	jmp loc_025078

loc_075c30:
	rts

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075c32:
	bsr.w loc_075dfa
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_033210
	jmp loc_01b490

;----------------------------------------------
loc_075c52:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_075c68
	move.b (6,a6),d0
	move.w loc_075c6e(pc,d0.w),d1
	jsr loc_075c6e(pc,d1.w)

loc_075c68:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075c6e:
	dc.w loc_075c72-loc_075c6e
	dc.w loc_075c80-loc_075c6e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075c72:
	addq.b #2,(6,a6)
	move.b #2,($3a,a6)
	bra.w loc_075b46

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075c80:
	subq.b #1,($3a,a6)
	bne.b loc_075c96
	move.b #1,(a6)
	move.l #$02000200,(4,a6)
	bsr.w loc_075dfa

loc_075c96:
	jmp loc_033210

;----------------------------------------------
loc_075c9c:
	jmp loc_033074

;----------------------------------------------
loc_075ca2:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_075cb8
	move.b (6,a6),d0
	move.w loc_075cbe(pc,d0.w),d1
	jsr loc_075cbe(pc,d1.w)

loc_075cb8:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075cbe:
	dc.w loc_075cc2-loc_075cbe
	dc.w loc_075ce0-loc_075cbe

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075cc2:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	addq.b #1,($4f,a6)
	move.b #2,($3a,a6)
	bra.w loc_075b46

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075ce0:
	subq.b #1,($3a,a6)
	bne.b loc_075d26
	move.b #1,(a6)
	move.l #$02000200,(4,a6)
	neg.l ($40,a6)
	move.b ($4f,a6),d0
	btst #0,d0
	bne.b loc_075d26
	move.l ($40,a6),d1
	asr.l #1,d1
	add.l d1,($40,a6)
	tst.b ($73,a6)
	bne.b loc_075d26
	move.b ($74,a6),d0
	addq.b #1,d0
	cmpi.b #8,d0
	bcs.b loc_075d1e
	moveq #7,d0

loc_075d1e:
	move.b d0,($74,a6)
	bsr.w loc_075dfa

loc_075d26:
	jmp loc_033210

;----------------------------------------------
loc_075d2c:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_075d42
	move.b (6,a6),d0
	move.w loc_075d48(pc,d0.w),d1
	jsr loc_075d48(pc,d1.w)

loc_075d42:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075d48:
	dc.w loc_075d4c-loc_075d48
	dc.w loc_075d6c-loc_075d48

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075d4c:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	move.b ($70,a6),d0
	jmp loc_0331d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_075d6c:
	subq.b #1,($3a,a6)
	bpl.b loc_075d96
	move.b #1,(a6)
	move.l #$02000200,(4,a6)
	neg.l ($40,a6)
	moveq #$c,d0
	tst.b ($73,a6)
	bne.b loc_075d90
	move.b ($72,a6),d0
	add.w d0,d0

loc_075d90:
	move.l loc_075d9c(pc,d0.w),($44,a6)

loc_075d96:
	jmp loc_033210

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075d9c:
	dc.l $00018000
	dc.l $00020000
	dc.l $00028000
	dc.l $00028000

;==============================================
;
;==============================================
loc_075dac:
	move.b (5,a6),d0
	move.w loc_075dbe(pc,d0.w),d1
	jsr loc_075dbe(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075dbe:
	dc.w loc_075dc2-loc_075dbe
	dc.w loc_075dd2-loc_075dbe

;----------------------------------------------
loc_075dc2:
	addq.b #2,(5,a6)
	move.b #2,(a6)
	moveq #$b,d0
	jmp loc_0331d0

;----------------------------------------------
loc_075dd2:
	tst.b ($33,a6)
	bpl.b loc_075de0
	move.l #$06000000,(4,a6)

loc_075de0:
	jmp loc_033210

;==============================================
;
;==============================================
loc_075de6:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_075df4
	clr.w ($a4,a4)

loc_075df4:
	jmp loc_01c206

;==============================================
loc_075dfa:
	moveq #0,d0
	tst.b ($73,a6)
	bne.b loc_075e2a
	move.b ($74,a6),d0
	add.w d0,d0
	move.w loc_075e1a(pc,d0.w),d1
	lea.l loc_075e1a(pc,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075e1a:
	dc.w loc_0760ec-loc_075e1a
	dc.w loc_076156-loc_075e1a
	dc.w loc_0761c0-loc_075e1a
	dc.w loc_07622a-loc_075e1a
	dc.w loc_076294-loc_075e1a
	dc.w loc_0762fe-loc_075e1a
	dc.w loc_076368-loc_075e1a
	dc.w loc_0763d2-loc_075e1a


;----------------------------------------------
loc_075e2a:
	move.b ($72,a6),d0
	lsl.w #2,d0
	move.w ($50,a6),d1
	add.w d1,d1
	add.w d1,d0
	move.w loc_075e4a(pc,d0.w),d1
	lea.l loc_075e4a(pc,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075e4a:
	dc.w loc_07643c-loc_075e4a
	dc.w loc_076486-loc_075e4a
	dc.w loc_0764d0-loc_075e4a
	dc.w $0000

	dc.w loc_07651a-loc_075e4a
	dc.w loc_076564-loc_075e4a
	dc.w loc_0765ae-loc_075e4a
	dc.w $0000

	dc.w loc_0765f8-loc_075e4a
	dc.w loc_076642-loc_075e4a
	dc.w loc_07668c-loc_075e4a

;==============================================
loc_075e60:
	movea.w ($36,a6),a4
	tst.b ($5e,a6)
	beq.b loc_075e6e
	movea.w ($27c,a4),a4

loc_075e6e:
	move.b ($3b,a6),d0
	lsl.w #2,d0
	move.w loc_075e96(pc,d0.w),d1
	move.w loc_075e96+2(pc,d0.w),d2
	tst.b ($b,a6)
	bne.b loc_075e84
	neg.w d1

loc_075e84:
	add.w ($10,a4),d1
	add.w ($14,a4),d2
	move.w d1,($10,a6)
	move.w d2,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_075e96:
	dc.w $0000,$0042
	dc.w $000a,$0042
	dc.w $0015,$0042
	dc.w $001e,$0042
	dc.w $0027,$0042
	dc.w $0032,$0042
	dc.w $003c,$0042
	dc.w $0046,$0042
	dc.w $0051,$0042
	dc.w $005b,$0042
	dc.w $0065,$0042
	dc.w $0070,$0042
	dc.w $007a,$0042
	dc.w $0084,$0042
	dc.w $008f,$0042
	dc.w $0099,$0042
	dc.w $00a3,$0042
	dc.w $00ae,$0042
	dc.w $00b8,$0042
	dc.w $00c2,$0042
	dc.w $00cd,$0042
	dc.w $00d8,$0042

;##############################################
;Rose Special 00
;##############################################
loc_075eee:
	jsr loc_01c1c8
	beq.w loc_075ff6
	addq.b #1,(a4)
	move.w #$900,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b ($1e0,a6),($74,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w #0,($50,a4)
	move.l #$02000e00,($6a,a4)
	move.w a6,($36,a4)
	clr.b ($5e,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_075ff8
	tst.b (pl_cc_cancelflag,a6)
	beq.w loc_075ff6
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_075ff6
	jsr loc_01c1c8
	beq.w loc_075ff6
	addq.b #1,(a4)
	move.w #$900,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	move.b ($1e0,a6),($74,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w #0,($50,a4)
	move.l #$02000e00,($6a,a4)
	move.w a6,($36,a4)
	move.b #1,($5e,a4)
	move.b ($2a7,a6),($dc,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_075ff8

loc_075ff6:
	rts

;==============================================
loc_075ff8:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($1e0,a6),d0
	move.b loc_076012(pc,d0.w),($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076012:
	dc.b $09,$0a,$0b,$0c
	dc.b $0d,$0e,$0f,$10

;##############################################
;Light Reflect?
;##############################################
loc_07601a:
	jsr loc_01c1c8
	beq.b loc_07608e
	addq.b #1,(a4)
	move.w #$900,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($82,a6),($72,a4)
	clr.b ($74,a4)
	move.b #6,($bd,a4)
	move.b #1,($73,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w #2,($50,a4)
	move.l #$02001000,($6a,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_076090

loc_07608e:
	rts

;==============================================
loc_076090:
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_0760ac(pc,d0.w),d0
	move.b d0,($cc,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0760ac:
	dc.w $000a,$000a,$0014

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0760b2:
	dc.w $0000,$0000,$0100,$0000
	dc.w $0000,$0001,$0100,$0001

loc_0760c2:
	dc.w loc_0760cc-loc_0760c2
	dc.w loc_0760cc-loc_0760c2
	dc.w loc_0760cc-loc_0760c2
	dc.w loc_0760dc-loc_0760c2
	dc.w loc_0760f6-loc_0760c2

loc_0760cc:
	dc.l $00000000,$00000000,$00080000,$00100010

loc_0760dc:
	dc.l $00000000,$00000000,$0010fff0,$00180014

loc_0760ec:
	dc.w loc_0760cc-loc_0760ec
	dc.w loc_0760cc-loc_0760ec
	dc.w loc_0760cc-loc_0760ec
	dc.w loc_0760dc-loc_0760ec
	dc.w loc_0760f6-loc_0760ec

loc_0760f6:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$07020500,$02020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0a020500,$02020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076156:
	dc.w loc_0760cc-loc_076156
	dc.w loc_0760cc-loc_076156
	dc.w loc_0760cc-loc_076156
	dc.w loc_0760dc-loc_076156
	dc.w loc_076160-loc_076156

loc_076160:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$09020500,$04020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0b020500,$04020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0761c0:
	dc.w loc_0760cc-loc_0761c0
	dc.w loc_0760cc-loc_0761c0
	dc.w loc_0760cc-loc_0761c0
	dc.w loc_0760dc-loc_0761c0
	dc.w loc_0761ca-loc_0761c0

loc_0761ca:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0a020500,$06020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0c020500,$06020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07622a:
	dc.w loc_0760cc-loc_07622a
	dc.w loc_0760cc-loc_07622a
	dc.w loc_0760cc-loc_07622a
	dc.w loc_0760dc-loc_07622a
	dc.w loc_076234-loc_07622a

loc_076234:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0c020500,$08020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0e020500,$08020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076294:
	dc.w loc_0760cc-loc_076294
	dc.w loc_0760cc-loc_076294
	dc.w loc_0760cc-loc_076294
	dc.w loc_0760dc-loc_076294
	dc.w loc_07629e-loc_076294

loc_07629e:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$0e020500,$0a020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$10020500,$0a020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0762fe:
	dc.w loc_0760cc-loc_0762fe
	dc.w loc_0760cc-loc_0762fe
	dc.w loc_0760cc-loc_0762fe
	dc.w loc_0760dc-loc_0762fe
	dc.w loc_076308-loc_0762fe

loc_076308:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$10020500,$0c020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$12020500,$0c020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076368:
	dc.w loc_0760cc-loc_076368
	dc.w loc_0760cc-loc_076368
	dc.w loc_0760cc-loc_076368
	dc.w loc_0760dc-loc_076368
	dc.w loc_076372-loc_076368

loc_076372:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$16020500,$0e020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$18020500,$0e020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0763d2:
	dc.w loc_0760cc-loc_0763d2
	dc.w loc_0760cc-loc_0763d2
	dc.w loc_0760cc-loc_0763d2
	dc.w loc_0760dc-loc_0763d2
	dc.w loc_0763dc-loc_0763d2

loc_0763dc:
	dc.l $00000000,$00000000,$01020500,$00020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$1d020500,$10020104
	dc.l $08000601,$0a000200,$00000000,$00000000
	dc.l $00060000,$000e0009,$1f020500,$10020104
	dc.l $08000601,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07643c:
	dc.w loc_0760cc-loc_07643c
	dc.w loc_0760cc-loc_07643c
	dc.w loc_0760cc-loc_07643c
	dc.w loc_0760dc-loc_07643c
	dc.w loc_076446-loc_07643c

loc_076446:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000a06,$00000000,$00000000
	dc.l $00060000,$000e0009,$08030500,$00180104
	dc.l $04000602,$0c040a06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076486:
	dc.w loc_0760cc-loc_076486
	dc.w loc_0760cc-loc_076486
	dc.w loc_0760cc-loc_076486
	dc.w loc_0760dc-loc_076486
	dc.w loc_0764da-loc_076486

loc_076490:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000a06,$00000000,$00000000
	dc.l $00060000,$000e0009,$08030500,$00080104
	dc.l $04000602,$0c040a06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0764d0:
	dc.w loc_0760cc-loc_0764d0
	dc.w loc_0760cc-loc_0764d0
	dc.w loc_0760cc-loc_0764d0
	dc.w loc_0760dc-loc_0764d0
	dc.w loc_0764da-loc_0764d0

loc_0764da:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000a06,$00000000,$00000000
	dc.l $00060000,$000e0009,$0e030500,$00100104
	dc.l $04000602,$0c040a06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07651a:
	dc.w loc_0760cc-loc_07651a
	dc.w loc_0760cc-loc_07651a
	dc.w loc_0760cc-loc_07651a
	dc.w loc_0760dc-loc_07651a
	dc.w loc_076524-loc_07651a

loc_076524:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000b06,$00000000,$00000000
	dc.l $00060000,$000e0009,$04030500,$00180104
	dc.l $04000602,$0c040b06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076564:
	dc.w loc_0760cc-loc_076564
	dc.w loc_0760cc-loc_076564
	dc.w loc_0760cc-loc_076564
	dc.w loc_0760dc-loc_076564
	dc.w loc_07656e-loc_076564

loc_07656e:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000b06,$00000000,$00000000
	dc.l $00060000,$000e0009,$06030500,$00080104
	dc.l $04000602,$0c040b06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0765ae:
	dc.w loc_0760cc-loc_0765ae
	dc.w loc_0760cc-loc_0765ae
	dc.w loc_0760cc-loc_0765ae
	dc.w loc_0760dc-loc_0765ae
	dc.w loc_0765b8-loc_0765ae

loc_0765b8:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000b06,$00000000,$00000000
	dc.l $00060000,$000e0009,$08030500,$00100104
	dc.l $04000602,$0c040b06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0765f8:
	dc.w loc_0760cc-loc_0765f8
	dc.w loc_0760cc-loc_0765f8
	dc.w loc_0760cc-loc_0765f8
	dc.w loc_0760dc-loc_0765f8
	dc.w loc_076602-loc_0765f8

loc_076602:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000c06,$00000000,$00000000
	dc.l $00060000,$000e0009,$12030500,$00180104
	dc.l $04000602,$0c040c06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076642:
	dc.w loc_0760cc-loc_076642
	dc.w loc_0760cc-loc_076642
	dc.w loc_0760cc-loc_076642
	dc.w loc_0760dc-loc_076642
	dc.w loc_07664c-loc_076642

loc_07664c:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000c06,$00000000,$00000000
	dc.l $00060000,$000e0009,$14030500,$00080104
	dc.l $04000602,$0c040c06,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07668c:
	dc.w loc_0760cc-loc_07668c
	dc.w loc_0760cc-loc_07668c
	dc.w loc_0760cc-loc_07668c
	dc.w loc_0760dc-loc_07668c
	dc.w loc_076696-loc_07668c

loc_076696:
	dc.l $00000000,$00000000,$01030500,$00000104
	dc.l $04000602,$0c000c06,$00000000,$00000000
	dc.l $00060000,$000e0009,$16030500,$00100104
	dc.l $04000602,$0c040c06,$00000000,$00000000

;##############################################
;0a Psycho Shot
;##############################################
loc_0766d6:
	move.b (4,a6),d0
	move.w loc_0766e2(pc,d0.w),d1
	jmp loc_0766e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0766e2:
	dc.w loc_0766ea-loc_0766e2
	dc.w loc_07674e-loc_0766e2
	dc.w loc_076782-loc_0766e2
	dc.w loc_0767b0-loc_0766e2

;==============================================
;
;==============================================
loc_0766ea:
	addq.b #2,(4,a6)
	st.b ($70,a6)
	move.l #loc_076832,($60,a6)
	move.l #loc_07682a,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($31,a6)
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	moveq #-$30,d0
	tst.b ($b,a6)
	beq.b loc_07672e
	neg.w d0

loc_07672e:
	add.w d0,($10,a6)
	addi.w #$46,($14,a6)
	bsr.w loc_076800
	moveq #0,d0
	moveq #0,d1
	move.b ($72,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_0331d0

;==============================================
;
;==============================================
loc_07674e:
	move.b (5,a6),d0
	move.w loc_07675a(pc,d0.w),d1
	jmp loc_07675a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07675a:
	dc.w loc_076764-loc_07675a
	dc.w loc_07676a-loc_07675a
	dc.w loc_076770-loc_07675a
	dc.w loc_076776-loc_07675a
	dc.w loc_07677c-loc_07675a

;----------------------------------------------
loc_076764:
	jmp loc_033006

;----------------------------------------------
loc_07676a:
	jmp loc_033030

;----------------------------------------------
loc_076770:
	jmp loc_033074

;----------------------------------------------
loc_076776:
	jmp loc_0330c4

;----------------------------------------------
loc_07677c:
	jmp loc_033120

;==============================================
;
;==============================================
loc_076782:
	tst.b (7,a6)
	bne.b loc_07679a
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_0331d0
	jmp loc_01b4d0

loc_07679a:
	tst.b ($33,a6)
	bpl.b loc_0767a4
	addq.b #2,(4,a6)

loc_0767a4:
	jsr loc_033210
	jmp loc_01b4d0

;==============================================
;
;==============================================
loc_0767b0:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_0767be
	clr.w ($a4,a4)

loc_0767be:
	jmp loc_01c206

;==============================================
loc_0767c4:
	lsl.w #2,d0
	move.w loc_0767e8(pc,d0.w),d1
	move.w loc_0767e8+2(pc,d0.w),d2
	tst.b ($b,a6)
	beq.b loc_0767d6
	neg.w d1

loc_0767d6:
	add.w ($10,a4),d1
	add.w ($14,a4),d2
	move.w d1,($10,a6)
	move.w d2,($14,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0767e8:
	dc.w $0000,$0000
	dc.w $0000,$0000
	dc.w $0033,$0058
	dc.w $ffe6,$002f
	dc.w $ffbd,$003c
	dc.w $0000,$0000

;----------------------------------------------
loc_076800:
	move.b ($72,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_07681a(pc,d0.w),d0
	tst.b ($b,a6)
	bne.b loc_076814
	neg.l d0

loc_076814:
	move.l d0,($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07681a:
	dc.l $00038000
	dc.l $00040000
	dc.l $00048000
	dc.l $00060000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07682a:
	dc.w $0000,$0000,$0100,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076832:
	dc.w loc_07683c-loc_076832
	dc.w loc_07683c-loc_076832
	dc.w loc_07683c-loc_076832
	dc.w loc_07683c-loc_076832
	dc.w loc_07684c-loc_076832

loc_07683c:
	dc.l $00000000,$00000000,$00000000,$00100010

loc_07684c:
	dc.l $00000000,$00000000,$01000300,$00020104

	dc.l $08000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$0a020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$0b020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$0c020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$08020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$09020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $0000fffb,$000c0005,$0a020300,$00100104
	dc.l $0c000601,$06000200,$00000000,$00000000

;##############################################
;0b Tiger Shot
;##############################################
loc_07692c:
	move.b (4,a6),d0
	move.w loc_076938(pc,d0.w),d1
	jmp loc_076938(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076938:
	dc.w loc_076940-loc_076938
	dc.w loc_076a02-loc_076938
	dc.w loc_076b16-loc_076938
	dc.w loc_076b54-loc_076938

;==============================================
;
;==============================================
loc_076940:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_076bb0,($60,a6)
	move.l #loc_076b94,($88,a6)
	jsr loc_03323a
	cmpi.b #$c,($72,a6)
	bcs.b loc_076984
	moveq #0,d0
	move.b ($82,a4),d0
	move.w loc_0769d0(pc,d0.w),($50,a6)
	bsr.w loc_076b68

loc_076984:
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsl.b #1,d0
	move.l loc_0769d6(pc,d0.w),d0
	move.b ($6a,a6),d2
	ext.w d2
	move.w loc_0769fa(pc,d2.w),d1
	move.w loc_0769fa+2(pc,d2.w),d2
	tst.b ($b,a6)
	bne.b loc_0769b2
	neg.l d0
	neg.w d1

loc_0769b2:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	add.w d2,($14,a6)
	move.b ($72,a6),d0
	lsr.b #1,d0
	jsr loc_0331d0
	moveq #0,d0
	bra.w loc_076a02

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0769d0:
	dc.w $0003,$0004,$0005

loc_0769d6:
	dc.l $00030000,$00044000,$00052000
	dc.l $00030000,$00044000,$00052000
	dc.l $00048000,$00048000,$00048000

loc_0769fa:
	dc.w $0078,$0056,$006a,$0033

;==============================================
;
;==============================================
loc_076a02:
	move.b (5,a6),d0
	move.w loc_076a0e(pc,d0.w),d1
	jmp loc_076a0e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076a0e:
	dc.w loc_076a18-loc_076a0e
	dc.w loc_076a44-loc_076a0e
	dc.w loc_076a8c-loc_076a0e
	dc.w loc_076a92-loc_076a0e
	dc.w loc_076a98-loc_076a0e

;----------------------------------------------
loc_076a18:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_076a3e
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_033210
	jsr loc_01b490

loc_076a3e:
	jmp loc_01b4d0

;----------------------------------------------
loc_076a44:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_076a5a
	move.b (6,a6),d0
	move.w loc_076a60(pc,d0.w),d1
	jsr loc_076a60(pc,d1.w)

loc_076a5a:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076a60:
	dc.w loc_076a64-loc_076a60
	dc.w loc_076a78-loc_076a60

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_076a64:
	addq.b #2,(6,a6)
	bsr.w loc_076b68
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_076a78:
	subq.b #1,($3a,a6)
	bne.b loc_076a8a
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_076a8a:
	rts

;----------------------------------------------
loc_076a8c:
	jmp loc_033074

;----------------------------------------------
loc_076a92:
	jmp loc_0330c4

;----------------------------------------------
loc_076a98:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_076aae
	move.b (6,a6),d0
	move.w loc_076ab4(pc,d0.w),d1
	jsr loc_076ab4(pc,d1.w)

loc_076aae:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076ab4:
	dc.w loc_076ab8-loc_076ab4
	dc.w loc_076ad4-loc_076ab4

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_076ab8:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_076ad4:
	subq.b #1,($3a,a6)
	bpl.b loc_076af8
	move.b #1,(a6)
	move.l #$02000000,(4,a6)
	neg.l ($40,a6)
	move.b ($72,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_076afe(pc,d0.w),($44,a6)

loc_076af8:
	jmp loc_033210

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076afe:
	dc.l $00018000,$00020000,$00028000
	dc.l $00018000,$00020000,$00028000

;==============================================
;
;==============================================
loc_076b16:
	move.b (5,a6),d0
	move.w loc_076b28(pc,d0.w),d1
	jsr loc_076b28(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076b28:
	dc.w loc_076b2c-loc_076b28
	dc.w loc_076b40-loc_076b28

;----------------------------------------------
loc_076b2c:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #9,d0
	jmp loc_0331d0

;----------------------------------------------
loc_076b40:
	tst.b ($33,a6)
	bpl.b loc_076b4e
	move.l #$06000000,(4,a6)

loc_076b4e:
	jmp loc_033210

;==============================================
;
;==============================================
loc_076b54:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_076b62
	clr.w ($a4,a4)

loc_076b62:
	jmp loc_01c206

;==============================================
loc_076b68:
	moveq #0,d0
	move.b ($72,a6),d0
	subi.b #$c,d0
	lsl.w #1,d0
	lea.l loc_076ba4(pc),a0
	movea.l (a0,d0.w),a0
	move.w ($50,a6),d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076b94:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000
	dc.l $03000000

loc_076ba4:
	dc.l loc_076d7a,loc_076daa,loc_076de6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076bb0:
	dc.w loc_076bba-loc_076bb0
	dc.w loc_076bba-loc_076bb0
	dc.w loc_076bba-loc_076bb0
	dc.w loc_076bba-loc_076bb0
	dc.w loc_076bda-loc_076bb0

loc_076bba:
	dc.l $00000000,$00000000,$000e0000,$00180010

loc_076bca:
	dc.l $000e0000,$00180010,$000efffc,$00180014

loc_076bda:
	dc.l $00000000,$00000000,$01000300,$00000101

	dc.l $00000600,$00000100,$00000000,$00000000
	dc.l $0025fffe,$00300006,$09020300,$04100104
	dc.l $08050601,$06000200,$00000000,$00000000
	dc.l $0025fffe,$00300006,$0a020300,$04100104
	dc.l $08050601,$08000200,$00000000,$00000000
	dc.l $0025fffe,$00300006,$0b020300,$04100104
	dc.l $08050601,$0a000200,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$09020300,$04100104
	dc.l $08050601,$06000200,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0a020300,$04100104
	dc.l $08050601,$08000200,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0b020300,$04100104
	dc.l $08050601,$0a000200,$00000000,$00000000
	dc.l $0018fffd,$0023000c,$09020300,$04110104
	dc.l $08050601,$06000200,$00000000,$00000000
	dc.l $0018fffd,$0023000c,$0a020300,$04110104
	dc.l $08050601,$08000200,$00000000,$00000000
	dc.l $0018fffd,$0023000c,$0b020300,$04110104
	dc.l $08050601,$0a000200,$00000000,$00000000
	dc.l $0000fffd,$000b000c,$09020300,$04110104
	dc.l $08050601,$06000200,$00000000,$00000000
	dc.l $0000fffd,$000b000c,$0a020300,$04110104
	dc.l $08050601,$08000200,$00000000,$00000000
	dc.l $0000fffd,$000b000c,$0b020300,$04110104
	dc.l $08050600,$0a000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076d7a:
	dc.w loc_076d82-loc_076d7a
	dc.w loc_076d8c-loc_076d7a
	dc.w loc_076d96-loc_076d7a
	dc.w loc_076da0-loc_076d7a

loc_076d82:;486786
	dc.w loc_076bba-loc_076d82
	dc.w loc_076bba-loc_076d82
	dc.w loc_076bba-loc_076d82
	dc.w loc_076bba-loc_076d82
	dc.w loc_076e2e-loc_076d82

loc_076d8c:
	dc.w loc_076bba-loc_076d8c
	dc.w loc_076bba-loc_076d8c
	dc.w loc_076bba-loc_076d8c
	dc.w loc_076bba-loc_076d8c
	dc.w loc_076e8e-loc_076d8c

loc_076d96:
	dc.w loc_076bba-loc_076d96
	dc.w loc_076bba-loc_076d96
	dc.w loc_076bba-loc_076d96
	dc.w loc_076bba-loc_076d96
	dc.w loc_076eee-loc_076d96

loc_076da0:
	dc.w loc_076bba-loc_076da0
	dc.w loc_076bba-loc_076da0
	dc.w loc_076bba-loc_076da0
	dc.w loc_076bba-loc_076da0
	dc.w loc_076f4e-loc_076da0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076daa:
	dc.w loc_076db4-loc_076daa
	dc.w loc_076dbe-loc_076daa
	dc.w loc_076dc8-loc_076daa
	dc.w loc_076dd2-loc_076daa
	dc.w loc_076ddc-loc_076daa

loc_076db4:
	dc.w loc_076bba-loc_076db4
	dc.w loc_076bba-loc_076db4
	dc.w loc_076bba-loc_076db4
	dc.w loc_076bba-loc_076db4
	dc.w loc_076fae-loc_076db4

loc_076dbe:
	dc.w loc_076bba-loc_076dbe
	dc.w loc_076bba-loc_076dbe
	dc.w loc_076bba-loc_076dbe
	dc.w loc_076bba-loc_076dbe
	dc.w loc_07700e-loc_076dbe

loc_076dc8:
	dc.w loc_076bba-loc_076dc8
	dc.w loc_076bba-loc_076dc8
	dc.w loc_076bba-loc_076dc8
	dc.w loc_076bba-loc_076dc8
	dc.w loc_07706e-loc_076dc8

loc_076dd2:
	dc.w loc_076bba-loc_076dd2
	dc.w loc_076bba-loc_076dd2
	dc.w loc_076bba-loc_076dd2
	dc.w loc_076bba-loc_076dd2
	dc.w loc_0770ce-loc_076dd2

loc_076ddc:
	dc.w loc_076bba-loc_076ddc
	dc.w loc_076bba-loc_076ddc
	dc.w loc_076bba-loc_076ddc
	dc.w loc_076bba-loc_076ddc
	dc.w loc_07712e-loc_076ddc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076de6:
	dc.w loc_076df2-loc_076de6
	dc.w loc_076dfc-loc_076de6
	dc.w loc_076e06-loc_076de6
	dc.w loc_076e10-loc_076de6
	dc.w loc_076e1a-loc_076de6
	dc.w loc_076e24-loc_076de6

loc_076df2:
	dc.w loc_076bba-loc_076df2
	dc.w loc_076bba-loc_076df2
	dc.w loc_076bba-loc_076df2
	dc.w loc_076bba-loc_076df2
	dc.w loc_07718e-loc_076df2

loc_076dfc:
	dc.w loc_076bba-loc_076dfc
	dc.w loc_076bba-loc_076dfc
	dc.w loc_076bba-loc_076dfc
	dc.w loc_076bba-loc_076dfc
	dc.w loc_0771ee-loc_076dfc

loc_076e06:
	dc.w loc_076bba-loc_076e06
	dc.w loc_076bba-loc_076e06
	dc.w loc_076bba-loc_076e06
	dc.w loc_076bba-loc_076e06
	dc.w loc_07724e-loc_076e06

loc_076e10:
	dc.w loc_076bba-loc_076e10
	dc.w loc_076bba-loc_076e10
	dc.w loc_076bba-loc_076e10
	dc.w loc_076bba-loc_076e10
	dc.w loc_0772ae-loc_076e10

loc_076e1a:
	dc.w loc_076bba-loc_076e1a
	dc.w loc_076bba-loc_076e1a
	dc.w loc_076bba-loc_076e1a
	dc.w loc_076bba-loc_076e1a
	dc.w loc_07730e-loc_076e1a

loc_076e24:
	dc.w loc_076bba-loc_076e24
	dc.w loc_076bba-loc_076e24
	dc.w loc_076bba-loc_076e24
	dc.w loc_076bba-loc_076e24
	dc.w loc_07736e-loc_076e24

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_076e2e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$08020500,$00110104
	dc.l $02000602,$0c040a06,$00000000,$00000000
	dc.l $0000fffe,$00090006,$08020500,$00110104
	dc.l $02000602,$0c040a06,$00000000,$00000000

loc_076e8e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$08030500,$00100104
	dc.l $02000602,$0c040a06,$00000000,$00000000
	dc.l $0000fffe,$00090006,$08030500,$00100104
	dc.l $02000602,$0c040a06,$00000000,$00000000

loc_076eee:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$08030500,$00110104
	dc.l $02000602,$0c040a06,$00000000,$00000000
	dc.l $0000fffe,$00090006,$08030500,$00110104
	dc.l $02000602,$0c040a06,$00000000,$00000000

loc_076f4e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$09030500,$00100104
	dc.l $02000602,$0c040a06,$00000000,$00000000
	dc.l $0000fffe,$00090006,$09030500,$00100104
	dc.l $02000602,$0c040a06,$00000000,$00000000

loc_076fae:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0a020500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000
	dc.l $0000fffe,$000a0006,$0a020500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000

loc_07700e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0a030500,$00110104
	dc.l $02000602,$0c040b06,$00000000,$00000000
	dc.l $0000fffe,$000a0006,$0a030500,$00110104
	dc.l $02000602,$0c040b06,$00000000,$00000000

loc_07706e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0a030500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000
	dc.l $0000fffe,$000a0006,$0a030500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000

loc_0770ce:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0a030500,$00110104
	dc.l $02000602,$0c040b06,$00000000,$00000000
	dc.l $0000fffe,$000a0006,$0a030500,$00110104
	dc.l $02000602,$0c040b06,$00000000,$00000000

loc_07712e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000
	dc.l $0000fffe,$000a0006,$0c030500,$00100104
	dc.l $02000602,$0c040b06,$00000000,$00000000

loc_07718e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c020500,$00150104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c020500,$00150104
	dc.l $02000602,$0c040c06,$00000000,$00000000

loc_0771ee:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000

loc_07724e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00110104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c030500,$00110104
	dc.l $02000602,$0c040c06,$00000000,$00000000

loc_0772ae:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000

loc_07730e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c040106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00110104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c030500,$00110104
	dc.l $02000602,$0c040c06,$00000000,$00000000

loc_07736e:
	dc.l $00000000,$00000000,$01000500,$00000104
	dc.l $02000602,$0c000106,$00000000,$00000000
	dc.l $0028fffe,$00380006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000
	dc.l $0000fffe,$000b0006,$0c030500,$00100104
	dc.l $02000602,$0c040c06,$00000000,$00000000

;##############################################
;0c Dan Gadouken
;##############################################
loc_0773ce:
	move.b (4,a6),d0
	move.w loc_0773da(pc,d0.w),d1
	jmp loc_0773da(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0773da:
	dc.w loc_0773e2-loc_0773da
	dc.w loc_07747c-loc_0773da
	dc.w loc_077518-loc_0773da
	dc.w loc_077556-loc_0773da

;==============================================
;
;==============================================
loc_0773e2:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0775a6,($60,a6)
	move.l #loc_07759e,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	cmpi.b #2,(3,a6)
	bne.b loc_077420
	bsr.w loc_07756a

loc_077420:
	move.l #$30000,d0
	moveq #$5a,d1
	tst.b ($b,a6)
	bne.b loc_077432
	neg.l d0
	neg.l d1

loc_077432:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	addi.w #$44,($14,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	move.b loc_077460(pc,d0.w),($70,a6)
	move.b loc_077466(pc,d0.w),($3b,a6)
	jsr loc_0331d0
	moveq #0,d0
	bra.w loc_07747c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077460:
	dc.b $07,$08,$09,$0a,$0a,$0a

loc_077466:
	dc.b $04,$07,$0a,$10,$20,$30

;----------------------------------------------
loc_07746c:
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	move.b loc_077466(pc,d0.w),($3b,a6)
	rts

;==============================================
;
;==============================================
loc_07747c:
	move.b (5,a6),d0
	move.w loc_077488(pc,d0.w),d1
	jmp loc_077488(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077488:
	dc.w loc_077492-loc_077488
	dc.w loc_0774b2-loc_077488
	dc.w loc_0774fe-loc_077488
	dc.w loc_077504-loc_077488
	dc.w loc_07750e-loc_077488

;----------------------------------------------
loc_077492:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_0774ac
	subq.b #1,($3b,a6)
	bne.b loc_0774ac
	move.l #$04000000,(4,a6)
	bra.b loc_077518

loc_0774ac:
	jmp loc_033006

;----------------------------------------------
loc_0774b2:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_0774c8
	move.b (6,a6),d0
	move.w loc_0774ce(pc,d0.w),d1
	jsr loc_0774ce(pc,d1.w)

loc_0774c8:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0774ce:
	dc.w loc_0774d2-loc_0774ce
	dc.w loc_0774e6-loc_0774ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0774d2:
	addq.b #2,(6,a6)
	bsr.w loc_07756a
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0774e6:
	subq.b #1,($3a,a6)
	bne.b loc_0774f8
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_0774f8:
	jmp loc_033210

;----------------------------------------------
loc_0774fe:
	jmp loc_033074

;----------------------------------------------
loc_077504:
	bsr.w loc_07746c
	jmp loc_0330c4

;----------------------------------------------
loc_07750e:
	bsr.w loc_07746c
	jmp loc_033120

;==============================================
;
;==============================================
loc_077518:
	move.b (5,a6),d0
	move.w loc_07752a(pc,d0.w),d1
	jsr loc_07752a(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07752a:
	dc.w loc_07752e-loc_07752a
	dc.w loc_077542-loc_07752a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07752e:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #6,d0
	jmp loc_0331d0

loc_077542:
	tst.b ($33,a6)
	bpl.b loc_077550
	move.l #$06000000,(4,a6)

loc_077550:
	jmp loc_033210

;==============================================
;
;==============================================
loc_077556:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_077564
	clr.w ($a4,a4)

loc_077564:
	jmp loc_01c206

loc_07756a:
	move.w ($50,a6),d1
	add.w d1,d1
	move.b ($72,a6),d2
	lea.l loc_0776a0(pc),a0
	cmpi.b #6,d2
	beq.b loc_07758c
	lea.l loc_0777e4(pc),a0
	cmpi.b #8,d2
	beq.b loc_07758c
	lea.l loc_077994(pc),a0

loc_07758c:
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07759e:
	dc.l $00000000
	dc.l $01000000

loc_0775a6:
	dc.w loc_0775b0-loc_0775a6
	dc.w loc_0775b0-loc_0775a6
	dc.w loc_0775b0-loc_0775a6
	dc.w loc_0775b0-loc_0775a6
	dc.w loc_0775c0-loc_0775a6

loc_0775b0:
	dc.l $00000000,$00000000,$000e0000,$00180010

loc_0775c0:
	dc.l $00000000,$00000000,$0b020300,$01110104
	dc.l $02000602,$0c000c06,$00270000,$00000000
	dc.l $00080000,$000c000c,$0a020300,$01110104
	dc.l $02080601,$06000200,$00220000,$00000000
	dc.l $00080000,$000c000c,$0a020300,$01110104
	dc.l $02080601,$08000200,$00230000,$00000000
	dc.l $00080000,$000c000c,$0a020300,$01110104
	dc.l $02080601,$0a000200,$00240000,$00000000
	dc.l $00110000,$0016000c,$0a020300,$01110104
	dc.l $02080601,$06000200,$00220000,$00000000
	dc.l $00110000,$0016000c,$0a020300,$01110104
	dc.l $02080601,$08000200,$00230000,$00000000
	dc.l $00110000,$0016000c,$0a020300,$01110104
	dc.l $02080601,$0a000200,$00240000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0776a0:
	dc.w loc_0776aa-loc_0776a0
	dc.w loc_0776b0-loc_0776a0
	dc.w loc_0776ba-loc_0776a0

loc_0776aa:
	dc.w loc_0775b0-loc_0776aa
	dc.w loc_0775b0-loc_0776aa
	dc.w loc_0775b0-loc_0776aa
	dc.w loc_0775b0-loc_0776aa
	dc.w loc_0776c4-loc_0776aa

loc_0776b0:
	dc.w loc_0775b0-loc_0776b0
	dc.w loc_0775b0-loc_0776b0
	dc.w loc_0775b0-loc_0776b0
	dc.w loc_0775b0-loc_0776b0
	dc.w loc_077724-loc_0776b0

loc_0776ba:
	dc.w loc_0775b0-loc_0776ba
	dc.w loc_0775b0-loc_0776ba
	dc.w loc_0775b0-loc_0776ba
	dc.w loc_0775b0-loc_0776ba
	dc.w loc_077784-loc_0776ba

loc_0776c4:
	dc.l $00000000,$00000000,$0a030500,$00110104
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00110000,$0016000e,$0b030500,$000d0304
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00080000,$000f000e,$0b030500,$000d0304
	dc.l $02000602,$0c040a06,$00250000,$00000000

loc_077724:
	dc.l $00000000,$00000000,$0a030500,$00110104
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00110000,$0016000e,$0b030500,$00100204
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00080000,$000f000e,$0b030500,$00100204
	dc.l $02000602,$0c040a06,$00250000,$00000000

loc_077784:
	dc.l $00000000,$00000000,$0a030500,$00110104
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00110000,$0016000e,$0b030500,$00110104
	dc.l $02000602,$0c040a06,$00250000,$00000000
	dc.l $00080000,$000f000e,$0b030500,$00110104
	dc.l $02000602,$0c040a06,$00250000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0777e4:
	dc.w loc_0777ec-loc_0777e4
	dc.w loc_0777f6-loc_0777e4
	dc.w loc_077800-loc_0777e4
	dc.w loc_07780a-loc_0777e4

loc_0777ec:
	dc.w loc_0775b0-loc_0777ec
	dc.w loc_0775b0-loc_0777ec
	dc.w loc_0775b0-loc_0777ec
	dc.w loc_0775b0-loc_0777ec
	dc.w loc_077814-loc_0777ec

loc_0777f6:
	dc.w loc_0775b0-loc_0777f6
	dc.w loc_0775b0-loc_0777f6
	dc.w loc_0775b0-loc_0777f6
	dc.w loc_0775b0-loc_0777f6
	dc.w loc_077874-loc_0777f6

loc_077800:
	dc.w loc_0775b0-loc_077800
	dc.w loc_0775b0-loc_077800
	dc.w loc_0775b0-loc_077800
	dc.w loc_0775b0-loc_077800
	dc.w loc_0778d4-loc_077800

loc_07780a:
	dc.w loc_0775b0-loc_07780a
	dc.w loc_0775b0-loc_07780a
	dc.w loc_0775b0-loc_07780a
	dc.w loc_0775b0-loc_07780a
	dc.w loc_077934-loc_07780a

loc_077814:
	dc.l $00000000,$00000000,$0c030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00110000,$0016000e,$0c030500,$000d0404
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00080000,$000f000e,$0c030500,$000d0404
	dc.l $02000602,$0c040b06,$00260000,$00000000

loc_077874:
	dc.l $00000000,$00000000,$0c030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00110000,$0016000e,$0c030500,$00100304
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00080000,$000f000e,$0c030500,$00100304
	dc.l $02000602,$0c040b06,$00260000,$00000000

loc_0778d4:
	dc.l $00000000,$00000000,$0d030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00110000,$0016000e,$0d030500,$00110204
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00080000,$000f000e,$0d030500,$00110204
	dc.l $02000602,$0c040b06,$00260000,$00000000

loc_077934:
	dc.l $00000000,$00000000,$0d030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00110000,$0016000e,$0d030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000
	dc.l $00080000,$000f000e,$0d030500,$00110104
	dc.l $02000602,$0c040b06,$00260000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077994:
	dc.w loc_07799e-loc_077994
	dc.w loc_0779a8-loc_077994
	dc.w loc_0779b2-loc_077994
	dc.w loc_0779bc-loc_077994
	dc.w loc_0779c6-loc_077994

loc_07799e:
	dc.w loc_0775b0-loc_07799e
	dc.w loc_0775b0-loc_07799e
	dc.w loc_0775b0-loc_07799e
	dc.w loc_0775b0-loc_07799e
	dc.w loc_0779d0-loc_07799e

loc_0779a8:
	dc.w loc_0775b0-loc_0779a8
	dc.w loc_0775b0-loc_0779a8
	dc.w loc_0775b0-loc_0779a8
	dc.w loc_0775b0-loc_0779a8
	dc.w loc_077a30-loc_0779a8

loc_0779b2:
	dc.w loc_0775b0-loc_0779b2
	dc.w loc_0775b0-loc_0779b2
	dc.w loc_0775b0-loc_0779b2
	dc.w loc_0775b0-loc_0779b2
	dc.w loc_077a90-loc_0779b2

loc_0779bc:
	dc.w loc_0775b0-loc_0779bc
	dc.w loc_0775b0-loc_0779bc
	dc.w loc_0775b0-loc_0779bc
	dc.w loc_0775b0-loc_0779bc
	dc.w loc_077af0-loc_0779bc

loc_0779c6:
	dc.w loc_0775b0-loc_0779c6
	dc.w loc_0775b0-loc_0779c6
	dc.w loc_0775b0-loc_0779c6
	dc.w loc_0775b0-loc_0779c6
	dc.w loc_077b50-loc_0779c6

loc_0779d0:
	dc.l $00000000,$00000000,$0e030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00110000,$0016000e,$0e030500,$000d0504
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00080000,$000f000e,$0e030500,$000d0504
	dc.l $02000602,$0c040c06,$00270000,$00000000

loc_077a30:
	dc.l $00000000,$00000000,$0e030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00110000,$0016000e,$0e030500,$00100404
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00080000,$000f000e,$0e030500,$00100404
	dc.l $02000602,$0c040c06,$00270000,$00000000

loc_077a90:
	dc.l $00000000,$00000000,$0e030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00110000,$0016000e,$0e030500,$00110304
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00080000,$000f000e,$0e030500,$00110304
	dc.l $02000602,$0c040c06,$00270000,$00000000

loc_077af0:
	dc.l $00000000,$00000000,$0e030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00110000,$0016000e,$0e030500,$00100204
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00080000,$000f000e,$0e030500,$00100204
	dc.l $02000602,$0c040c06,$00270000,$00000000

loc_077b50:
	dc.l $00000000,$00000000,$10030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00110000,$0016000e,$10030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000
	dc.l $00080000,$000f000e,$10030500,$00110104
	dc.l $02000602,$0c040c06,$00270000,$00000000

;##############################################
;0d Sakura
;##############################################
loc_077bb0:
	move.b (4,a6),d0
	move.w loc_077bbc(pc,d0.w),d1
	jmp loc_077bbc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077bbc:
	dc.w loc_077bc4-loc_077bbc
	dc.w loc_077c76-loc_077bbc
	dc.w loc_077d1c-loc_077bbc
	dc.w loc_077d6e-loc_077bbc

;==============================================
;
;==============================================
loc_077bc4:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_077dca,($60,a6)
	move.l #loc_077db6,($88,a6)
	jsr loc_03323a
	tst.b (3,a6)
	beq.b loc_077bf6
	bsr.w loc_077d82

loc_077bf6:
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.b ($72,a6),d0
	add.w d0,d0
	move.l loc_077c48(pc,d0.w),d0
	moveq #$59,d1
	tst.b ($b,a6)
	bne.b loc_077c16
	neg.l d0
	neg.l d1

loc_077c16:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	addi.w #$36,($14,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.w #1,d0
	move.b loc_077c60(pc,d0.w),($3b,a6)
	move.b loc_077c42(pc,d0.w),($70,a6)
	jsr loc_0331d0
	moveq #0,d0
	bra.b loc_077c76

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077c42:
	dc.b $0c,$0d,$0e,$ff,$ff,$ff

loc_077c48:
	dc.l $00048000,$00038000,$00024000
	dc.l $00030000,$00030000,$00030000

loc_077c60:
	dc.b $2d,$1e,$14,$ff,$ff,$ff

;----------------------------------------------
loc_077c66:
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.w #1,d0
	move.b loc_077c60(pc,d0.w),($3b,a6)
	rts

;==============================================
;
;==============================================
loc_077c76:
	move.b (5,a6),d0
	move.w loc_077c82(pc,d0.w),d1
	jmp loc_077c82(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077c82:
	dc.w loc_077c8c-loc_077c82
	dc.w loc_077cba-loc_077c82
	dc.w loc_077d02-loc_077c82
	dc.w loc_077d08-loc_077c82
	dc.w loc_077d12-loc_077c82

;----------------------------------------------
loc_077c8c:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_077cb4
	tst.b (3,a6)
	beq.b loc_077ca4
	tst.b ($33,a6)
	bpl.b loc_077cb4
	bra.b loc_077caa

loc_077ca4:
	subq.b #1,($3b,a6)
	bne.b loc_077cb4

loc_077caa:
	move.l #$04000000,(4,a6)
	bra.b loc_077d1c

loc_077cb4:
	jmp loc_033006

;----------------------------------------------
loc_077cba:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_077cd0
	move.b (6,a6),d0
	move.w loc_077cd6(pc,d0.w),d1
	jsr loc_077cd6(pc,d1.w)

loc_077cd0:
	jmp loc_033030

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077cd6:
	dc.w loc_077cda-loc_077cd6
	dc.w loc_077cee-loc_077cd6

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_077cda:
	addq.b #2,(6,a6)
	bsr.w loc_077d82
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_077cee:
	subq.b #1,($3a,a6)
	bne.b loc_077d00
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_077d00:
	rts

;----------------------------------------------
loc_077d02:
	jmp loc_033074

;----------------------------------------------
loc_077d08:
	bsr.w loc_077c66
	jmp loc_0330c4

;----------------------------------------------
loc_077d12:
	bsr.w loc_077c66
	jmp loc_033120

;==============================================
;
;==============================================
loc_077d1c:
	move.b (5,a6),d0
	move.w loc_077d2e(pc,d0.w),d1
	jsr loc_077d2e(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077d2e:
	dc.w loc_077d32-loc_077d2e
	dc.w loc_077d5a-loc_077d2e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_077d32:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #0,d0
	tst.b (3,a6)
	beq.b loc_077d4c
	move.b ($35,a6),d0
	bra.b loc_077d52

loc_077d4c:
	move.b ($72,a6),d0
	lsr.b #1,d0

loc_077d52:
	addq.b #6,d0
	jmp loc_0331d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_077d5a:
	tst.b ($33,a6)
	bpl.b loc_077d68
	move.l #$06000000,(4,a6)

loc_077d68:
	jmp loc_033210

;==============================================
;
;==============================================
loc_077d6e:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_077d7c
	clr.w ($a4,a4)

loc_077d7c:
	jmp loc_01c206

;----------------------------------------------
loc_077d82:
	lea.l loc_077edc(pc),a0
	cmpi.b #6,($72,a6)
	beq.b loc_077d9e
	lea.l loc_078140(pc),a0
	cmpi.b #8,($72,a6)
	beq.b loc_077d9e
	lea.l loc_0783a6(pc),a0

loc_077d9e:
	move.w ($50,a6),d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077db6:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000
	dc.l $03000000
	dc.l $04000000

loc_077dca:
	dc.w loc_077dd4-loc_077dca
	dc.w loc_077dd4-loc_077dca
	dc.w loc_077dd4-loc_077dca
	dc.w loc_077dd4-loc_077dca
	dc.w loc_077dfc-loc_077dca

loc_077dd4:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$000c,$0006
	dc.w $0009,$0000,$001d,$0010
	dc.w $0009,$0000,$001d,$001a
	dc.w $000f,$0000,$0027,$0014

loc_077dfc:
	dc.l $00000000,$00000000,$01020300,$00100104
	dc.l $02000601,$06000200,$00220000,$00000000
	dc.l $000e0000,$001b0009,$0a020300,$04100104
	dc.l $0c040601,$06000200,$00220000,$00000000
	dc.l $fffa0000,$00070009,$0a020300,$04100104
	dc.l $0c040601,$06000200,$00220000,$00000000
	dc.l $000b0000,$001f0010,$0e020300,$06100104
	dc.l $0c070601,$08000200,$00230000,$00000000
	dc.l $00000000,$00140010,$0e020300,$06100104
	dc.l $0c070601,$08000200,$00230000,$00000000
	dc.l $000b0000,$00220018,$12020300,$08100104
	dc.l $0c0a0601,$0a000200,$00240000,$00000000
	dc.l $ffff0000,$00130018,$12020300,$08100104
	dc.l $0c0a0601,$0a000200,$00240000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_077edc:
	dc.w loc_077ee2-loc_077edc
	dc.w loc_077eec-loc_077edc
	dc.w loc_077ef6-loc_077edc

loc_077ee2:
	dc.w loc_077dd4-loc_077ee2
	dc.w loc_077dd4-loc_077ee2
	dc.w loc_077dd4-loc_077ee2
	dc.w loc_077dd4-loc_077ee2
	dc.w loc_077f00-loc_077ee2

loc_077eec:
	dc.w loc_077dd4-loc_077eec
	dc.w loc_077dd4-loc_077eec
	dc.w loc_077dd4-loc_077eec
	dc.w loc_077dd4-loc_077eec
	dc.w loc_077fc0-loc_077eec

loc_077ef6:
	dc.w loc_077dd4-loc_077ef6
	dc.w loc_077dd4-loc_077ef6
	dc.w loc_077dd4-loc_077ef6
	dc.w loc_077dd4-loc_077ef6
	dc.w loc_078080-loc_077ef6

loc_077f00:
	dc.l $00000000,$00000000,$01030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0023,$0b030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e001e,$0a030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $ffff0000,$00130018,$09030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $00000000,$00140010,$08030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $fffa0000,$00070009,$07030500,$000d0104
	dc.l $02000602,$0c040a01,$00250000,$00000000

loc_077fc0:
	dc.l $00000000,$00000000,$01030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0023,$0b030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e001e,$0a030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $ffff0000,$00130018,$09030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $00000000,$00140010,$08030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $fffa0000,$00070009,$07030500,$00100104
	dc.l $02000602,$0c040a01,$00250000,$00000000

loc_078080:
	dc.l $00000000,$00000000,$01030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0023,$0b030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e001e,$0a030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0018,$09030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0010,$08030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000
	dc.l $000c0000,$001e0008,$07030500,$00110104
	dc.l $02000602,$0c040a01,$00250000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078140:
	dc.w loc_078148-loc_078140
	dc.w loc_078152-loc_078140
	dc.w loc_07815c-loc_078140
	dc.w loc_078152-loc_078140

loc_078148:
	dc.w loc_077dd4-loc_078148
	dc.w loc_077dd4-loc_078148
	dc.w loc_077dd4-loc_078148
	dc.w loc_077dd4-loc_078148
	dc.w loc_078166-loc_078148

loc_078152:
	dc.w loc_077dd4-loc_078152
	dc.w loc_077dd4-loc_078152
	dc.w loc_077dd4-loc_078152
	dc.w loc_077dd4-loc_078152
	dc.w loc_0782e6-loc_078152

loc_07815c:
	dc.w loc_077dd4-loc_07815c
	dc.w loc_077dd4-loc_07815c
	dc.w loc_077dd4-loc_07815c
	dc.w loc_077dd4-loc_07815c
	dc.w loc_078226-loc_07815c

loc_078166:
	dc.l $00000000,$00000000,$01030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0023,$0d030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e001e,$0c030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0018,$0b030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0010,$0a030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0008,$09030500,$000d0104
	dc.l $02000602,$0c040b01,$00260000,$00000000

loc_078226:
	dc.l $00000000,$00000000,$01030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0023,$0d030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e001e,$0c030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0018,$0b030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0010,$0a030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0008,$09030500,$00100104
	dc.l $02000602,$0c040b01,$00260000,$00000000

loc_0782e6:
	dc.l $00000000,$00000000,$01030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0023,$0d030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e001e,$0c030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0018,$0b030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0010,$0a030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000
	dc.l $000c0000,$001e0008,$09030500,$00110104
	dc.l $02000602,$0c040b01,$00260000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0783a6:
	dc.w loc_0783b0-loc_0783a6
	dc.w loc_0783ba-loc_0783a6
	dc.w loc_0783c4-loc_0783a6
	dc.w loc_0783ba-loc_0783a6
	dc.w loc_0783c4-loc_0783a6

loc_0783b0:
	dc.w loc_077dd4-loc_0783b0
	dc.w loc_077dd4-loc_0783b0
	dc.w loc_077dd4-loc_0783b0
	dc.w loc_077dd4-loc_0783b0
	dc.w loc_0783ce-loc_0783b0

loc_0783ba:
	dc.w loc_077dd4-loc_0783ba
	dc.w loc_077dd4-loc_0783ba
	dc.w loc_077dd4-loc_0783ba
	dc.w loc_077dd4-loc_0783ba
	dc.w loc_07848e-loc_0783ba

loc_0783c4:
	dc.w loc_077dd4-loc_0783c4
	dc.w loc_077dd4-loc_0783c4
	dc.w loc_077dd4-loc_0783c4
	dc.w loc_077dd4-loc_0783c4
	dc.w loc_07854e-loc_0783c4

loc_0783ce:
	dc.l $00000000,$00000000,$01030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0023,$0b030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e001e,$0a030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0018,$09030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0010,$08030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0008,$07030500,$000d0104
	dc.l $02000602,$0c040c01,$00270000,$00000000

loc_07848e:
	dc.l $00000000,$00000000,$01030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0023,$0b030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e001e,$0a030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0018,$09030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0010,$08030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0008,$07030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000

loc_07854e:
	dc.l $00000000,$00000000,$01030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0023,$0f030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e001e,$0e030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0018,$0d030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0010,$0c030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000
	dc.l $000c0000,$001e0008,$0b030500,$00110104
	dc.l $02000602,$0c040c01,$00270000,$00000000

;##############################################
;0e Rolento Knife
;##############################################
loc_07860e:
	move.b (4,a6),d0
	move.w loc_07861a(pc,d0.w),d1
	jmp loc_07861a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07861a:
	dc.w loc_078622-loc_07861a
	dc.w loc_07877e-loc_07861a
	dc.w loc_078940-loc_07861a
	dc.w loc_078a04-loc_07861a

;==============================================
;
;==============================================
loc_078622:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.w ($64,a4),($64,a6)
	move.l ($e6,a4),($e6,a6)
	move.w ($40,a6),d0
	move.w ($44,a6),d1
	tst.b ($b,a6)
	beq.b loc_078650
	neg.w d0

loc_078650:
	movea.w ($38,a4),a1
	add.w ($10,a1),d0
	move.w d0,($6a,a6)
	move.w d1,($6c,a6)
	move.l #loc_078a20,($60,a6)
	move.l #loc_078a18,($88,a6)
	jsr loc_03323a
	moveq #0,d6
	move.b d6,($5b,a6)
	move.b d6,($31,a6)
	move.b (3,a6),d6
	add.w d6,d6
	move.w loc_0786ee(pc,d6.w),d3
	move.w loc_0786ee+2(pc,d6.w),d4
	move.b ($72,a6),d6
	tst.b ($73,a6)
	beq.b loc_07869a
	addq.w #6,d6

loc_07869a:
	add.w d6,d6
	move.b ($b5,a5),d0
	andi.w #2,d0
	add.w d6,d0
	move.b loc_078706(pc,d0.w),($70,a6)
	move.b loc_078706+1(pc,d0.w),d0
	jsr loc_0331d0
	lsl.w #2,d6
	move.l loc_07871e(pc,d6.w),($40,a6)
	move.l loc_07871e+4(pc,d6.w),($44,a6)
	move.l loc_07871e+8(pc,d6.w),($48,a6)
	move.l loc_07871e+$c(pc,d6.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_0786e0
	neg.w d3
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0786e0:
	add.w d3,($10,a6)
	add.w d4,($14,a6)
	moveq #0,d0
	bra.w loc_07877e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0786ee:
	dc.w $001e,$002d
	dc.w $002a,$0031
	dc.w $0034,$0038
	dc.w $006f,$00a7
	dc.w $006b,$00a4
	dc.w $0068,$00a1

loc_078706:
	dc.b $09,$00,$09,$00
	dc.b $0a,$01,$0a,$01
	dc.b $0b,$02,$0b,$02
	dc.b $17,$11,$17,$1a
	dc.b $18,$12,$18,$1b
	dc.b $19,$13,$19,$1c

loc_07871e:
	dc.l $0002e000,$fffb0000,$fffd2000,$00000000
	dc.l $00040000,$fffc0000,$fffc0000,$00000000
	dc.l $00050000,$fffd2000,$fffb0000,$00000000
	dc.l $00000000,$00080000,$fffd2000,$ffff9000
	dc.l $00000000,$00088000,$fffc0000,$ffff8900
	dc.l $00000000,$00090000,$fffb0000,$ffff8200

;==============================================
;
;==============================================
loc_07877e:
	move.b (5,a6),d0
	move.w loc_07878a(pc,d0.w),d1
	jmp loc_07878a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07878a:
	dc.w loc_078794-loc_07878a
	dc.w loc_07880c-loc_07878a
	dc.w loc_078812-loc_07878a
	dc.w loc_078818-loc_07878a
	dc.w loc_0788b2-loc_07878a

;----------------------------------------------
loc_078794:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.w loc_078806
	jsr loc_0251a8
	bne.w loc_0787b8
	cmpi.w #$28,($14,a6)
	bge.b loc_0787c0
	move.w #$28,($14,a6)

loc_0787b8:
	move.l #$04000000,(4,a6)

loc_0787c0:
	tst.b ($73,a6)
	beq.b loc_0787e2
	tst.b ($35,a6)
	beq.b loc_0787e2
	move.b #1,(a6)
	clr.b ($35,a6)
	move.w ($6a,a6),($10,a6)
	move.w ($6c,a6),d0
	add.w d0,($14,a6)

loc_0787e2:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	jsr loc_033210
	jsr loc_01b490

loc_078806:
	jmp loc_01b4d0

;----------------------------------------------
loc_07880c:
	jmp loc_033030

;----------------------------------------------
loc_078812:
	jmp loc_033074

;----------------------------------------------
loc_078818:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07882e
	move.b (6,a6),d0
	move.w loc_078834(pc,d0.w),d1
	jsr loc_078834(pc,d1.w)

loc_07882e:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078834:
	dc.w loc_078838-loc_078834
	dc.w loc_078872-loc_078834

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078838:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	move.b #2,($3a,a6)
	clr.b ($5b,a6)
	jsr loc_0979fa
	moveq #0,d0
	move.b ($72,a6),d0
	tst.b ($73,a6)
	beq.b loc_078860
	addq.w #6,d0

loc_078860:
	lsr.w #1,d0
	move.b loc_07886c(pc,d0.w),d0
	jmp loc_0331d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07886c:
	dc.b $06,$07,$08,$14,$15,$16

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078872:
	subq.b #1,($3a,a6)
	bne.b loc_0788ac
	move.b #1,(a6)
	move.l #$02000000,(4,a6)
	neg.l ($40,a6)
	tst.b ($73,a6)
	beq.b loc_0788a2
	move.l ($48,a6),($40,a6)
	movea.w ($36,a6),a4
	tst.b ($b,a4)
	beq.b loc_0788a2
	neg.l ($40,a6)

loc_0788a2:
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)

loc_0788ac:
	jmp loc_033210

;----------------------------------------------
loc_0788b2:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_0788c8
	move.b (6,a6),d0
	move.w loc_0788ce(pc,d0.w),d1
	jsr loc_0788ce(pc,d1.w)

loc_0788c8:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0788ce:
	dc.w loc_0788d2-loc_0788ce
	dc.w loc_0788fe-loc_0788ce

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0788d2:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	move.b #2,($3a,a6)
	clr.b ($5b,a6)
	jsr loc_0979fa
	move.b ($70,a6),d0
	bmi.b loc_0788f8
	jmp loc_0331d0

loc_0788f8:
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_0788fe:
	subq.b #1,($3a,a6)
	bpl.b loc_07893a
	move.b #1,(a6)
	move.l #$02000000,(4,a6)
	neg.l ($40,a6)
	tst.b ($73,a6)
	beq.b loc_07892e
	move.l ($48,a6),($40,a6)
	movea.w ($36,a6),a4
	tst.b ($b,a4)
	beq.b loc_07892e
	neg.l ($40,a6)

loc_07892e:
	move.l #$40000,($44,a6)
	clr.l ($4c,a6)

loc_07893a:
	jmp loc_033210

;==============================================
;
;==============================================
loc_078940:
	move.b (5,a6),d0
	move.w loc_07895c(pc,d0.w),d1
	jsr loc_07895c(pc,d1.w)
	btst #0,($b4,a5)
	beq.b loc_07895a
	jmp loc_01b4d0

loc_07895a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07895c:
	dc.w loc_078962-loc_07895c
	dc.w loc_07899e-loc_07895c
	dc.w loc_0789da-loc_07895c

;----------------------------------------------
loc_078962:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	tst.b ($5b,a6)
	beq.b loc_07897e
	move.l #$06000000,(4,a6)
	rts

loc_07897e:
	move.l #$a0000,($44,a6)
	move.l #$ffff0000,($4c,a6)
	moveq #3,d0
	jsr loc_0331d0
	moveq #$1e,d0
	jmp loc_0038e4

;----------------------------------------------
loc_07899e:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	cmpi.w #$28,($14,a6)
	bcc.b loc_0789d4
	addq.b #2,(5,a6)
	move.w #$28,($14,a6)
	clr.w ($16,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_0789d4:
	jmp loc_033210

;----------------------------------------------
loc_0789da:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	cmpi.w #$28,($14,a6)
	bcc.b loc_0789fe
	move.l #$06000000,(4,a6)
	clr.w ($16,a6)

loc_0789fe:
	jmp loc_033210
 
;----------------------------------------------
loc_078a04:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_078a12
	clr.w ($a4,a4)

loc_078a12:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078a18:
	dc.l $00000000
	dc.l $01000000

loc_078a20:
	dc.w loc_078a2a-loc_078a20
	dc.w loc_078a2a-loc_078a20
	dc.w loc_078a2a-loc_078a20
	dc.w loc_078a2a-loc_078a20
	dc.w loc_078a3a-loc_078a20

loc_078a2a:
	dc.l $00000000,$00000000,$000e0000,$00180010

loc_078a3a:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000
	dc.l $00000000,$000c000c,$0c000700,$0010010a
	dc.l $08000600,$08000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0c000700,$0010010a
	dc.l $08000600,$08000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0c000700,$0010010a
	dc.l $08000600,$08000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0a000700,$0010010a
	dc.l $06000602,$0c040a05,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000602,$0c040b05,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000602,$0c040c05,$00000000,$00000000
	dc.l $00000000,$000c000c,$0a000700,$0010010a
	dc.l $06000602,$0c000a06,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000602,$0c000b06,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000602,$0c000c06,$00000000,$00000000
	dc.l $00000000,$000c000c,$0a000700,$0010010a
	dc.l $06000002,$0c040a05,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000002,$0c040b05,$00000000,$00000000
	dc.l $00000000,$000c000c,$08000700,$0010010a
	dc.l $06000002,$0c040c05,$00000000,$00000000

;##############################################
;0f Yoga Fire
;##############################################
loc_078bda:
	move.b (4,a6),d0
	move.w loc_078be6(pc,d0.w),d1
	jmp loc_078be6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078be6:
	dc.w loc_078bee-loc_078be6
	dc.w loc_078c6e-loc_078be6
	dc.w loc_078dec-loc_078be6
	dc.w loc_078e2a-loc_078be6

;==============================================
;
;==============================================
loc_078bee:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_078e46,($60,a6)
	move.l #loc_078e3e,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.b ($72,a6),d0
	add.w d0,d0
	move.l loc_078c62(pc,d0.w),d0
	moveq #$53,d1
	tst.b ($b,a6)
	bne.b loc_078c36
	neg.l d0
	neg.l d1

loc_078c36:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	addi.w #$39,($14,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	move.b loc_078c5e(pc,d0.w),d0
	move.b d0,($70,a6)
	jsr loc_0331d0
	moveq #0,d0
	bra.b loc_078c6e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078c5e:
	dc.b $08,$09,$0a,$ff

loc_078c62:
	dc.l $00030000,$00038000,$00040000

;==============================================
;
;==============================================
loc_078c6e:
	move.b (5,a6),d0
	move.w loc_078c7a(pc,d0.w),d1
	jmp loc_078c7a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078c7a:
	dc.w loc_078c84-loc_078c7a
	dc.w loc_078ce2-loc_078c7a
	dc.w loc_078ce8-loc_078c7a
	dc.w loc_078cee-loc_078c7a
	dc.w loc_078d58-loc_078c7a

;----------------------------------------------
loc_078c84:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_078cdc
	jsr loc_033210
	tst.b ($35,a6)
	beq.b loc_078cb2
	clr.b ($35,a6)
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	asr.l #1,d0
	move.l d0,($44,a6)

loc_078cb2:
	tst.b ($33,a6)
	bpl.b loc_078cc6
	move.l #$04000000,(4,a6)
	moveq #0,d0
	bra.w loc_078dec

loc_078cc6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	jsr loc_01b490

loc_078cdc:
	jmp loc_01b4d0

;----------------------------------------------
loc_078ce2:
	jmp loc_033030

;----------------------------------------------
loc_078ce8:
	jmp loc_033074

;----------------------------------------------
loc_078cee:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_078d04
	move.b (6,a6),d0
	move.w loc_078d0a(pc,d0.w),d1
	jsr loc_078d0a(pc,d1.w)

loc_078d04:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078d0a:
	dc.w loc_078d0e-loc_078d0a
	dc.w loc_078d2a-loc_078d0a

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078d0e:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078d2a:
	subq.b #1,($3a,a6)
	bne.b loc_078d52
	move.b #1,(a6)
	move.l #$02000000,(4,a6)
	neg.l ($40,a6)
	neg.l ($48,a6)
	clr.l ($44,a6)
	move.b ($70,a6),d0
	jmp loc_0331d0

loc_078d52:
	jmp loc_033210

;----------------------------------------------
loc_078d58:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_078d6e
	move.b (6,a6),d0
	move.w loc_078d74(pc,d0.w),d1
	jsr loc_078d74(pc,d1.w)

loc_078d6e:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078d74:
	dc.w loc_078d78-loc_078d74
	dc.w loc_078d94-loc_078d74

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078d78:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_078d94:
	subq.b #1,($3a,a6)
	bpl.b loc_078dce
	move.b #1,(a6)
	move.l #$02000000,(4,a6)
	move.b ($72,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_078dd4(pc,d0.w),d1
	move.l loc_078de0(pc,d0.w),($44,a6)
	tst.w ($40,a6)
	bmi.b loc_078dc0
	neg.l d1

loc_078dc0:
	move.l d1,($40,a6)
	move.b ($70,a6),d0
	jmp loc_0331d0

loc_078dce:
	jmp loc_033210

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078dd4:
	dc.l $00030000,$00038000,$00040000

loc_078de0:
	dc.l $00018000,$0001c000,$00020000

;==============================================
;
;==============================================
loc_078dec:
	move.b (5,a6),d0
	move.w loc_078dfe(pc,d0.w),d1
	jsr loc_078dfe(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078dfe:
	dc.w loc_078e02-loc_078dfe
	dc.w loc_078e16-loc_078dfe

;----------------------------------------------
loc_078e02:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #$b,d0
	jmp loc_0331d0

;----------------------------------------------
loc_078e16:
	tst.b ($33,a6)
	bpl.b loc_078e24
	move.l #$06000000,(4,a6)

loc_078e24:
	jmp loc_033210

;==============================================
;
;==============================================
loc_078e2a:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_078e38
	clr.w ($a4,a4)

loc_078e38:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_078e3e:
	dc.l $00000000
	dc.l $01000000

loc_078e46:
	dc.w loc_078e50-loc_078e46
	dc.w loc_078e50-loc_078e46
	dc.w loc_078e50-loc_078e46
	dc.w loc_078e50-loc_078e46
	dc.w loc_078e60-loc_078e46

loc_078e50:
	dc.l $00000000,$00000000,$00020002,$000f000b

loc_078e60:
	dc.l $00000000,$00000000,$0b020300,$04140101
	dc.l $0e000601,$06000200,$00220000,$00000000
	dc.l $00060000,$00150008,$0c020300,$04140104
	dc.l $0e060601,$06000200,$00220000,$00000000
	dc.l $fffa0000,$00080008,$0b020300,$04140104
	dc.l $0e050601,$06000200,$00220000,$00000000
	dc.l $fffa0000,$00080008,$0a020300,$04140104
	dc.l $0e050601,$06000200,$00220000,$00000000
	dc.l $fffa0000,$00080008,$09020300,$04140104
	dc.l $0e040601,$06000200,$00220000,$00000000
	dc.l $00060000,$00150008,$0c020300,$04150104
	dc.l $0e060601,$08000200,$00230000,$00000000
	dc.l $fffa0000,$00080008,$0b020300,$04150104
	dc.l $0e050601,$08000200,$00230000,$00000000
	dc.l $fffa0000,$00080008,$0a020300,$04150104
	dc.l $0e050601,$08000200,$00230000,$00000000
	dc.l $fffa0000,$00080008,$09020300,$04150104
	dc.l $0e040601,$08000200,$00230000,$00000000
	dc.l $00060000,$00150008,$0c020300,$04150104
	dc.l $0e060601,$0a000200,$00240000,$00000000
	dc.l $fffa0000,$00080008,$0b020300,$04150104
	dc.l $0e050601,$0a000200,$00240000,$00000000
	dc.l $fffa0000,$00080008,$0a020300,$04150104
	dc.l $0e050601,$0a000200,$00240000,$00000000
	dc.l $fffa0000,$00080008,$09020300,$04150104
	dc.l $0e040601,$0a000200,$00240000,$00000000

;##############################################
;10 Zangief Green Hand
;##############################################
loc_079000:
	move.b (4,a6),d0
	move.w loc_07900c(pc,d0.w),d1
	jmp loc_07900c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07900c:
	dc.w loc_079014-loc_07900c
	dc.w loc_079056-loc_07900c
	dc.w loc_07908c-loc_07900c
	dc.w loc_07908c-loc_07900c

;==============================================
;
;==============================================
loc_079014:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0790a2,($60,a6)
	move.l #loc_079092,($88,a6)
	jsr loc_03323a
	clr.b ($31,a6)
	clr.w ($50,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	jsr loc_0331d0

;==============================================
;
;==============================================
loc_079056:
	move.b (5,a6),d0
	move.w loc_079068(pc,d0.w),d1
	jsr loc_079068(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079068:
	dc.w loc_079072-loc_079068
	dc.w loc_079086-loc_079068
	dc.w loc_079086-loc_079068
	dc.w loc_079086-loc_079068
	dc.w loc_079086-loc_079068

;----------------------------------------------
loc_079072:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	tst.b (9,a0)
	bne.b loc_079084
	addq.b #2,(4,a6)

loc_079084:
	rts

;----------------------------------------------
loc_079086:
	addq.b #2,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07908c:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079092:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000
	dc.l $03000000

loc_0790a2:
	dc.w loc_0790ac-loc_0790a2
	dc.w loc_0790ac-loc_0790a2
	dc.w loc_0790ac-loc_0790a2
	dc.w loc_0790ac-loc_0790a2
	dc.w loc_0790cc-loc_0790a2

loc_0790ac:
	dc.l $00000000,$00000000,$ffc40044,$001b0012
	dc.l $ffc00047,$001f000c,$ffc1004e,$00180012

loc_0790cc:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;11
;##############################################
loc_0790ec:
	jmp loc_01c206

;##############################################
;12
;##############################################
loc_0790f2:
	jmp loc_01c206

;##############################################
;13
;##############################################
loc_0790f8:
	jmp loc_01c206

;##############################################
;14
;##############################################
loc_0790fe:
	jmp loc_01c206

;##############################################
;15
;##############################################
loc_079104:
	move.b (4,a6),d0
	move.w loc_079110(pc,d0.w),d1
	jmp loc_079110(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079110:
	dc.w loc_079118-loc_079110
	dc.w loc_079158-loc_079110
	dc.w loc_07919c-loc_079110
	dc.w loc_07919c-loc_079110

;==============================================
;
;==============================================
loc_079118:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0791aa,($60,a6)
	move.l #loc_0791a2,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.w #$ff,($50,a6)
	moveq #0,d0
	jsr loc_0331d0

;==============================================
;
;==============================================
loc_079158:
	move.b (5,a6),d0
	move.w loc_07916a(pc,d0.w),d1
	jsr loc_07916a(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07916a:
	dc.w loc_079174-loc_07916a
	dc.w loc_079188-loc_07916a
	dc.w loc_079188-loc_07916a
	dc.w loc_079188-loc_07916a
	dc.w loc_079188-loc_07916a

;----------------------------------------------
loc_079174:
	movea.w ($36,a6),a4
	movea.l ($1c,a4),a0
	tst.b ($12,a0)
	bne.b loc_079186
	addq.b #2,(4,a6)

loc_079186:
	rts

;----------------------------------------------
loc_079188:
	move.l #$02000000,(4,a6)
	move.b #1,(a6)
	move.w #$ff,($50,a6)
	rts

;==============================================
;
;==============================================
loc_07919c:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0791a2:
	dc.l $00000000
	dc.l $01000000

loc_0791aa:
	dc.w loc_0791b4-loc_0791aa
	dc.w loc_0791b4-loc_0791aa
	dc.w loc_0791b4-loc_0791aa
	dc.w loc_0791b4-loc_0791aa
	dc.w loc_0791c4-loc_0791aa

loc_0791b4:
	dc.l $00000000,$00000000,$ffd00030,$00100030

loc_0791c4:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;16 Rose Reflect
;##############################################
loc_0791e4:
	move.b (4,a6),d0
	move.w loc_0791f0(pc,d0.w),d1
	jmp loc_0791f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0791f0:
	dc.w loc_0791f8-loc_0791f0
	dc.w loc_079258-loc_0791f0
	dc.w loc_079338-loc_0791f0
	dc.w loc_079338-loc_0791f0

;==============================================
;
;==============================================
loc_0791f8:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_079360,($60,a6)
	move.l #loc_079350,($88,a6)
	jsr loc_03323a
	clr.b ($31,a6)
	move.w #0,($50,a6)
	movea.w ($36,a6),a4
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.l ($e6,a4),($e6,a6)
	move.b ($72,a6),d0
	lsr.b #1,d0
	addi.b #8,d0
	jsr loc_0331d0
	moveq #0,d0

;==============================================
;
;==============================================
loc_079258:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_079294
	movea.w ($36,a6),a4
	move.l (4,a4),d1
	andi.l #$ffffff00,d1
	cmp.l ($6a,a6),d1
	bne.b loc_07929a
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b ($b,a4),($b,a6)
	move.b (5,a6),d0
	move.w loc_0792a0(pc,d0.w),d1
	jsr loc_0792a0(pc,d1.w)

loc_079294:
	jmp loc_01b4d0

loc_07929a:
	addq.b #2,(4,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0792a0:
	dc.w loc_0792aa-loc_0792a0
	dc.w loc_07930a-loc_0792a0
	dc.w loc_0792b2-loc_0792a0
	dc.w loc_079314-loc_0792a0
	dc.w loc_079326-loc_0792a0

;----------------------------------------------
loc_0792aa:
	tst.b ($35,a4)
	bpl.b loc_07929a
	rts

;----------------------------------------------
loc_0792b2:
	cmpi.b #7,($1e0,a4)
	beq.b loc_0792be
	addq.b #1,($1e0,a4)

loc_0792be:
	addq.b #2,(4,a6)
	moveq #$12,d0
	bsr.w loc_07933e
	movea.l a4,a2
	movea.w ($6e,a6),a3
	jsr loc_01c2c8
	beq.b loc_079302
	addq.b #1,(a4)
	move.w #$2906,(2,a4)
	move.l ($10,a3),($10,a4)
	move.l ($14,a3),($14,a4)
	move.b ($b,a2),($b,a4)
	move.b ($e,a2),($e,a4)
	move.l ($18,a2),($18,a4)
	move.w ($c,a2),($c,a4)

loc_079302:
	moveq #$18,d0
	jmp loc_0038e4

;----------------------------------------------
loc_07930a:
	addq.b #2,(4,a6)
	moveq #5,d0
	bra.w loc_07933e

;----------------------------------------------
loc_079314:
	addq.b #2,(4,a6)
	moveq #5,d0
	bsr.w loc_07933e
	moveq #$19,d0
	jmp loc_0038e4

;----------------------------------------------
loc_079326:
	addq.b #2,(4,a6)
	moveq #5,d0
	bsr.w loc_07933e
	moveq #$19,d0
	jmp loc_0038e4

;==============================================
;
;==============================================
loc_079338:
	jmp loc_01c206

;==============================================
loc_07933e:
	tst.b ($23c,a4)
	bne.b loc_07934e
	exg.l a4,a6
	jsr loc_02ef6c
	exg.l a4,a6

loc_07934e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079350:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000
	dc.l $03000000

loc_079360:
	dc.w loc_07936a-loc_079360
	dc.w loc_07936a-loc_079360
	dc.w loc_07936a-loc_079360
	dc.w loc_07936a-loc_079360
	dc.w loc_07938a-loc_079360

loc_07936a:
	dc.l $00000000,$00000000,$ffe80031,$00180030
	dc.l $ffc00031,$00010030,$ffcc0031,$00160030

loc_07938a:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;17 Rose Illusion
;##############################################
loc_0793aa:
	move.b (4,a6),d0
	move.w loc_0793b6(pc,d0.w),d1
	jmp loc_0793b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0793b6:
	dc.w loc_0793be-loc_0793b6
	dc.w loc_079426-loc_0793b6
	dc.w loc_07948e-loc_0793b6
	dc.w loc_0794c0-loc_0793b6

;==============================================
;
;==============================================
loc_0793be:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.w #$fff,($50,a6)
	move.b d0,($5b,a6)
	move.b d0,($54,a6)
	move.b d0,($6d,a6)
	move.b d0,(pl_hitfreeze,a6)
	move.b #$20,($6c,a6)
	move.b ($d,a6),($74,a6)
	move.w #$ff,($16,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	bsr.w loc_079536
	move.l #loc_116d72,($60,a6)
	move.l #loc_116d6e,($88,a6)
	jsr loc_03323a
	jsr loc_080434
	jmp loc_080470

;==============================================
;
;==============================================
loc_079426:
	movea.w ($36,a6),a4
	bsr.w loc_0794ce
	tst.b ($10d,a5)
	bne.b loc_079476
	tst.b ($107,a5)
	bne.b loc_079476
	tst.b ($b9,a4)
	bne.b loc_079476
	subq.w #1,($6a,a6)
	bmi.b loc_079476
	tst.b ($25c,a4)
	bne.b loc_07948c
	subq.b #1,($3a,a6)
	bpl.b loc_07948c
	clr.b ($3a,a6)
	jsr loc_080434
	jsr loc_080470
	bsr.w loc_079512
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_07948c
	jmp loc_01b4ec

loc_079476:
	move.b #2,(a6)
	move.l #$4000000,(4,a6)
	move.b ($74,a6),($d,a6)
	clr.b ($68,a6)

loc_07948c:
	rts

;==============================================
;
;==============================================
loc_07948e:
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_0794b6
	jsr loc_080434
	jsr loc_080470
	jmp loc_01b4ec

loc_0794b6:
	move.l #$06000000,(4,a6)
	rts

;==============================================
;
;==============================================
loc_0794c0:
	movea.w ($36,a6),a4
	subq.b #1,($23c,a4)
	jmp loc_01c206

;----------------------------------------------
loc_0794ce:
	move.b #2,(a6)
	move.b #1,($68,a6)
	movea.l ($1c,a6),a1
	move.b (9,a1),d6
	bne.b loc_0794ec
	st.b ($68,a6)
	clr.b ($54,a6)
	rts

loc_0794ec:
	movea.l ($a0,a6),a3
	move.b ($e,a3),d0
	cmp.b ($54,a6),d0
	beq.b loc_079510
	move.b #1,(a6)
	tst.b ($5b,a6)
	beq.b loc_079510
	move.b #2,(a6)
	clr.b ($5b,a6)
	move.b d0,($54,a6)

loc_079510:
	rts

;----------------------------------------------
loc_079512:
	move.b ($6d,a6),d0
	addq.b #1,d0
	andi.w #7,d0
	move.b d0,($6d,a6)
	move.b loc_07952e(pc,d0.w),d0
	add.b ($d,a4),d0
	move.b d0,($d,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07952e:
	dc.b $04,$00
	dc.b $04,$00
	dc.b $04,$00
	dc.b $04,$00

;----------------------------------------------
loc_079536:
	moveq #0,d0
	move.b ($72,a6),d0
	move.w loc_079546(pc,d0.w),d0
	add.w d0,($6a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079546:
	dc.w $012c,$01a4,$0258

;##############################################
;Rose
;##############################################
loc_07954c:
	move.b #2,($23c,a6)
	move.b ($101,a6),d0
	jsr loc_080452
	lea.l ($6eb6,a5),a0
	tst.b ($59,a6)
	beq.b loc_07956a
	lea.l ($6eb7,a5),a0

loc_07956a:
	cmpi.b #2,(a0)
	bcs.w loc_079646
	jsr loc_01c1c8
	movea.l a4,a3
	jsr loc_01c1c8
	cmpa.l a3,a4
	bcc.b loc_079586
	exg.l a3,a4

loc_079586:
	addq.b #1,(a4)
	move.w #$1700,(2,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($82,a6),($72,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3e,a6),($3e,a4)
	move.b ($3f,a6),($3f,a4)
	move.w d1,($40,a4)
	move.b #8,($3a,a4)
	move.b #0,($3b,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	addq.b #3,($d,a4)
	move.w #$10,($6a,a4)
	addq.b #1,(a3)
	move.w #$1701,(2,a3)
	move.b #$a,($bd,a3)
	move.b #1,($73,a3)
	move.b ($82,a6),($72,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.b ($5a,a6),($5a,a3)
	move.b ($59,a6),($59,a3)
	move.b ($3e,a6),($3e,a4)
	move.b ($3f,a6),($3f,a4)
	move.w d1,($40,a3)
	move.b #$10,($3a,a3)
	move.b #1,($3b,a3)
	move.w a6,($36,a3)
	move.w ($c,a6),($c,a3)
	addq.b #4,($d,a3)
	move.w #8,($6a,a3)

loc_079646:
	rts

;##############################################
;18
;##############################################
loc_079648:
	move.b (4,a6),d0
	move.w loc_079654(pc,d0.w),d1
	jmp loc_079654(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079654:
	dc.w loc_07965c-loc_079654
	dc.w loc_0796da-loc_079654
	dc.w loc_07978a-loc_079654
	dc.w loc_0797a0-loc_079654

;==============================================
;
;==============================================
loc_07965c:
	addq.b #2,(4,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_0798ac,($60,a6)
	move.l #loc_0798a4,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.b d0,(9,a6)
	move.w #$fff,($50,a6)
	move.l #$12000,($40,a6)
	move.l #0,($48,a6)
	move.l #$100000,($44,a6)
	move.l #$fffe8000,($4c,a6)
	moveq #0,d0
	tst.b ($b,a6)
	bne.b loc_0796c6
	neg.l d0
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0796c6:
	add.w d1,($10,a6)
	addi.w #1,($14,a6)
	moveq #4,d0
	jsr loc_0331d0
	moveq #0,d0

;==============================================
;
;==============================================
loc_0796da:
	move.b (5,a6),d0
	move.w loc_0796e6(pc,d0.w),d1
	jmp loc_0796e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0796e6:
	dc.w loc_0796f0-loc_0796e6
	dc.w loc_07977c-loc_0796e6
	dc.w loc_07977c-loc_0796e6
	dc.w loc_07977c-loc_0796e6
	dc.w loc_07977c-loc_0796e6

;----------------------------------------------
loc_0796f0:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07970c
	move.b (6,a6),d0
	move.w loc_079712(pc,d0.w),d1
	jsr loc_079712(pc,d1.w)
	jsr loc_01b490

loc_07970c:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079712:
	dc.w loc_079718-loc_079712
	dc.w loc_07974a-loc_079712
	dc.w loc_079776-loc_079712

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_079718:
	bsr.w loc_0797b6
	cmpi.w #$28,($14,a6)
	bge.b loc_079744
	addq.b #2,(6,a6)
	move.w #$28,($14,a6)
	moveq #0,d0
	move.w d0,($16,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	moveq #5,d0
	jmp loc_0331d0

loc_079744:
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07974a:
	bsr.w loc_0797b6
	tst.b ($33,a6)
	bpl.b loc_079744
	addq.b #2,(6,a6)
	bsr.w loc_0797d8
	bsr.w loc_079816
	bsr.w loc_079816
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.w #1,d0
	addi.w #$c,d0
	jmp loc_0331d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_079776:
	tst.b ($33,a6)
	bpl.b loc_079744

;----------------------------------------------
loc_07977c:
	move.b #2,(a6)
	move.l #$04000000,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07978a:
	move.l #$06000000,(4,a6)
	move.b #2,(a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	rts

;==============================================
;
;==============================================
loc_0797a0:
	movea.w ($36,a6),a4
	movea.w ($a4,a4),a3
	cmpa.w a6,a3
	bne.b loc_0797b0
	clr.w ($a4,a4)

loc_0797b0:
	jmp loc_01c206

;----------------------------------------------
loc_0797b6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	rts

;----------------------------------------------
loc_0797d8:
	jsr loc_01c2c8
	beq.b loc_079814
	move.l #$1003b01,(a4)
	move.b #6,(9,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	addi.w #$10,($14,a4)
	move.b #$51,($3c,a4)
	move.w a6,($36,a4)
	move.b #1,($30,a4)
	jmp loc_003840

loc_079814:
	rts

;----------------------------------------------
loc_079816:
	jsr loc_01c2c8
	beq.b loc_079862
	move.l #$01003b01,(a4)
	move.b #6,(9,a4)
	move.b #1,($30,a4)
	jsr RNGFunction
	andi.w #$3c,d0
	move.w loc_079864(pc,d0.w),d1
	move.w loc_079864+2(pc,d0.w),d2
	add.w ($10,a6),d1
	add.w ($14,a6),d2
	move.w d1,($10,a4)
	move.w d2,($14,a4)
	move.b #$52,($3c,a4)
	move.w a6,($36,a4)
	jmp loc_003840

loc_079862:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079864:
	dc.w $0010,$0020,$0020,$0030
	dc.w $fff0,$0040,$ffe0,$0050
	dc.w $ffdc,$0028,$ffcc,$0038
	dc.w $0024,$0048,$0034,$0058
	dc.w $0048,$0024,$0058,$0034
	dc.w $ffb8,$0044,$ffa8,$0054
	dc.w $ffc8,$0018,$ffb8,$0028
	dc.w $0018,$0038,$0018,$0048

loc_0798a4:
	dc.l $00000000
	dc.l $01000000

loc_0798ac:
	dc.w loc_0798b6-loc_0798ac
	dc.w loc_0798b6-loc_0798ac
	dc.w loc_0798b6-loc_0798ac
	dc.w loc_0798b6-loc_0798ac
	dc.w loc_0798c6-loc_0798ac

loc_0798b6:
	dc.l $00000000,$00000000,$000e0000,$00180010

loc_0798c6:
	dc.l $00000000,$00000000,$01000001,$00000104
	dc.l $00000000,$00040100,$00000000,$00000000
	dc.l $0000002d,$0012002d,$10021b01,$00150104
	dc.l $08000602,$0c040a06,$00000000,$00000000
	dc.l $0000002d,$0020002d,$12021b01,$00150104
	dc.l $08000602,$0c040b06,$00000000,$00000000
	dc.l $0000002d,$0020002d,$14021b01,$00150104
	dc.l $08000602,$0c040c06,$00000000,$00000000

;##############################################
;19 Yoga Flame
;##############################################
loc_079946:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_079956(pc,d0.w),d1
	jmp loc_079956(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079956:
	dc.w loc_07995e-loc_079956
	dc.w loc_07999e-loc_079956
	dc.w loc_079a12-loc_079956
	dc.w loc_079a4e-loc_079956

;==============================================
;
;==============================================
loc_07995e:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	move.l ($18,a4),($18,a6)
	move.l #loc_079ab0,($60,a6)
	move.l #loc_079a9c,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	bsr.w loc_079a62
	move.b #$ff,($70,a6)
	move.b ($72,a6),d0
	lsr.b #1,d0
	bsr.w loc_079a96
	moveq #0,d0

;==============================================
;
;==============================================
loc_07999e:
	move.b (5,a6),d0
	move.w loc_0799aa(pc,d0.w),d1
	jmp loc_0799aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0799aa:
	dc.w loc_0799b4-loc_0799aa
	dc.w loc_0799fa-loc_0799aa
	dc.w loc_079a00-loc_0799aa
	dc.w loc_079a06-loc_0799aa
	dc.w loc_079a0c-loc_0799aa

;----------------------------------------------
loc_0799b4:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_0799f4
	movea.w ($36,a6),a4
	cmpi.w #$200,(4,a4)
	bne.b loc_0799e2
	cmpi.b #$e,(6,a4)
	bne.b loc_0799e2
	jsr loc_033210
	bsr.w loc_079a62
	tst.b ($33,a6)
	bpl.b loc_0799ee

loc_0799e2
	move.l #$04000000,(4,a6)
	moveq #0,d0
	bra.b loc_079a12

loc_0799ee:
	jsr loc_01b490

loc_0799f4:
	jmp loc_01b4d0

;----------------------------------------------
loc_0799fa:
	jmp loc_033030

;----------------------------------------------
loc_079a00:
	jmp loc_033074

;----------------------------------------------
loc_079a06:
	jmp loc_0330c4

;----------------------------------------------
loc_079a0c:
	jmp loc_033120

;==============================================
;
;==============================================
loc_079a12:
	move.b (5,a6),d0
	move.w loc_079a24(pc,d0.w),d1
	jsr loc_079a24(pc,d1.w)
	jmp loc_01b4d0


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079a24:
	dc.w loc_079a28-loc_079a24
	dc.w loc_079a3a-loc_079a24

;----------------------------------------------
loc_079a28:
	addq.b #2,(5,a6)
	moveq #6,d0
	tst.b (3,a6)
	beq.b loc_079a36
	moveq #7,d0

loc_079a36:
	bra.w loc_079a96

;----------------------------------------------
loc_079a3a:
	tst.b ($33,a6)
	bpl.b loc_079a48
	move.l #$06000000,(4,a6)

loc_079a48:
	jmp loc_033210

;==============================================
;
;==============================================
loc_079a4e:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_079a5c
	clr.w ($a4,a4)

loc_079a5c:
	jmp loc_01c206

;----------------------------------------------
loc_079a62:
	move.l ($10,a4),($10,a6)
	move.l ($14,a4),($14,a6)
	move.w #$ff94,d0
	move.w #$40,d1
	tst.b (3,a6)
	beq.b loc_079a84
	move.w #$ffb5,d0
	move.w #$80,d1

loc_079a84:
	tst.b ($b,a6)
	beq.b loc_079a8c
	neg.w d0

loc_079a8c:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	rts

;----------------------------------------------
loc_079a96:
	jmp loc_0331d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079a9c:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000
	dc.l $03000000
	dc.l $04000000

loc_079ab0:
	dc.w loc_079aba-loc_079ab0
	dc.w loc_079aba-loc_079ab0
	dc.w loc_079aba-loc_079ab0
	dc.w loc_079aba-loc_079ab0
	dc.w loc_079ae2-loc_079ab0

loc_079aba:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$ffed,$0020,$0020
	dc.w $0011,$0001,$0010,$000d
	dc.w $0000,$0014,$0018,$0026
	dc.w $0013,$fff4,$0010,$000d

loc_079ae2:
	dc.l $00000000,$00000000,$10020500,$04150101
	dc.l $00000601,$06000200,$00240000,$00000000
	dc.l $0032fff1,$002d0009,$11020500,$04150104
	dc.l $00000601,$06000200,$00220000,$00000000
	dc.l $0000ffed,$00200020,$10020500,$04150104
	dc.l $00000601,$06000200,$00220000,$00000000
	dc.l $0032fff1,$002d0009,$11020500,$04150104
	dc.l $00000601,$08000200,$00230000,$00000000
	dc.l $0000ffed,$00200020,$10020500,$04150104
	dc.l $00000601,$08000200,$00230000,$00000000
	dc.l $0032fff1,$002d0009,$11020500,$04150104
	dc.l $00000601,$0a000200,$00240000,$00000000
	dc.l $0000ffed,$00200020,$10020500,$04150104
	dc.l $00000601,$0a000200,$00240000,$00000000
	dc.l $000ffff6,$0009000c,$12020500,$04150104
	dc.l $00000601,$06000200,$00220000,$00000000
	dc.l $fffd000e,$00180016,$11020500,$04150104
	dc.l $00000601,$06000200,$00220000,$00000000
	dc.l $000ffff6,$0009000c,$12020500,$04150104
	dc.l $00000601,$08000200,$00230000,$00000000
	dc.l $fffd000e,$00180016,$11020500,$04150104
	dc.l $00000601,$08000200,$00230000,$00000000
	dc.l $000ffff6,$0009000c,$12020500,$04150104
	dc.l $00000601,$0a000200,$00240000,$00000000
	dc.l $fffd000e,$00180016,$11020500,$04150104
	dc.l $00000601,$0a000200,$00240000,$00000000

;##############################################
;1a
;##############################################
loc_079c82:
	jmp loc_01c206

;##############################################
;1b
;##############################################
loc_079c88:
	movea.w ($36,a6),a3
	move.b (4,a6),d0
	move.w loc_079c98(pc,d0.w),d1
	jmp loc_079c98(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079c98:
	dc.w loc_079ca0-loc_079c98
	dc.w loc_079cee-loc_079c98
	dc.w loc_079d58-loc_079c98
	dc.w loc_079d58-loc_079c98


;==============================================
;
;==============================================
loc_079ca0:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	move.l ($18,a3),($18,a6)
	move.l #loc_079f24,($60,a6)
	move.l #loc_079f1c,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.w #$ff,($50,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	addi.b #$19,d0
	jsr loc_0331d0
	move.b #$16,($3c,a6)
	moveq #0,d0

;==============================================
;
;==============================================
loc_079cee:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_079d04
	move.b (5,a6),d0
	move.w loc_079d0a(pc,d0.w),d1
	jsr loc_079d0a(pc,d1.w)

loc_079d04:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079d0a:
	dc.w loc_079d14-loc_079d0a
	dc.w loc_079d2c-loc_079d0a
	dc.w loc_079d2c-loc_079d0a
	dc.w loc_079d2c-loc_079d0a
	dc.w loc_079d2c-loc_079d0a

;----------------------------------------------
loc_079d14:
	movea.l ($1c,a3),a0
	tst.b ($12,a0)
	bne.b loc_079d22
	addq.b #2,(4,a6)

loc_079d22:
	jsr loc_033210
	bra.w loc_079d5e

;----------------------------------------------
loc_079d2c:
	movea.l ($1c,a3),a0
	tst.b ($12,a0)
	bne.b loc_079d3c
	addq.b #2,(4,a6)
	bra.b loc_079d4e

loc_079d3c:
	move.l #$02000000,(4,a6)
	move.b #1,(a6)
	move.w #$ff,($50,a6)

loc_079d4e:
	jsr loc_033210
	bra.w loc_079d5e

;==============================================
;
;==============================================
loc_079d58:
	jmp loc_01c206

;----------------------------------------------
loc_079d5e:
	move.b ($81,a5),d0
	add.b ($101,a3),d0
	andi.b #3,d0
	bne.w loc_079e1a
	moveq #-3,d0
	tst.b ($35,a6)
	beq.w loc_079e1a
	bpl.b loc_079d7c
	neg.b d0

loc_079d7c:
	add.b d0,($3c,a6)
	andi.b #$3f,($3c,a6)
	jsr loc_01c2c8
	beq.w loc_079e1a
	addq.b #1,(a4)
	move.b #$25,(2,a4)
	move.w a3,($36,a4)
	move.w ($c,a3),($c,a4)
	move.b ($e,a3),($e,a4)
	move.w ($10,a3),($10,a4)
	move.w ($14,a3),($14,a4)
	addi.w #$3a,($14,a4)
	move.w #$28,d0
	tst.b ($b,a3)
	bne.b loc_079dc6
	neg.w d0

loc_079dc6:
	add.w d0,($10,a4)
	move.b #2,(9,a4)
	move.l ($18,a3),($18,a4)
	move.b ($b,a3),($b,a4)
	move.b ($3c,a6),d0
	andi.w #$1f,d0
	add.w d0,d0
	add.w d0,d0
	move.w loc_079e1c(pc,d0.w),d1
	move.w loc_079e1c+2(pc,d0.w),d2
	ext.l d1
	ext.l d2
	asl.l #8,d1
	asl.l #8,d2
	move.l d1,d3
	move.l d2,d4
	asl.l #3,d3
	asl.l #4,d4
	tst.b ($b,a3)
	bne.b loc_079e0a
	neg.l d1
	neg.l d3

loc_079e0a:
	move.l d1,($40,a4)
	move.l d2,($44,a4)
	add.l d3,($10,a4)
	add.l d4,($14,a4)

loc_079e1a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079e1c:
	dc.w $0000,$0180,$003e,$017e,$007c,$0178,$00b9,$016f
	dc.w $00f4,$0162,$012d,$0152,$0163,$013f,$0195,$0128
	dc.w $01c4,$010f,$01ee,$00f3,$0213,$00d5,$0233,$00b4
	dc.w $024e,$0092,$0263,$006f,$0273,$004a,$027c,$0025
	dc.w $0280,$0000,$027c,$ffdb,$0273,$ffb6,$0263,$ff91
	dc.w $024e,$ff6e,$0233,$ff4c,$0213,$ff2b,$01ee,$ff0d
	dc.w $01c4,$fef1,$0195,$fed8,$0163,$fec1,$012d,$feae
	dc.w $00f4,$fe9e,$00b9,$fe91,$007c,$fe88,$003e,$fe82
	dc.w $0000,$fe80,$ffc2,$fe82,$ff84,$fe88,$ff47,$fe91
	dc.w $ff0c,$fe9e,$fed3,$feae,$fe9d,$fec1,$fe6b,$fed8
	dc.w $fe3c,$fef1,$fe12,$ff0d,$fded,$ff2b,$fdcd,$ff4c
	dc.w $fdb2,$ff6e,$fd9d,$ff91,$fd8d,$ffb6,$fd84,$ffdb
	dc.w $fd80,$0000,$fd84,$0025,$fd8d,$004a,$fd9d,$006f
	dc.w $fdb2,$0092,$fdcd,$00b4,$fded,$00d5,$fe12,$00f3
	dc.w $fe3c,$010f,$fe6b,$0128,$fe9d,$013f,$fed3,$0152
	dc.w $ff0c,$0162,$ff47,$016f,$ff84,$0178,$ffc2,$017e

loc_079f1c:
	dc.l $00000000
	dc.l $01000000

loc_079f24:
	dc.w loc_079f2e-loc_079f24
	dc.w loc_079f2e-loc_079f24
	dc.w loc_079f2e-loc_079f24
	dc.w loc_079f2e-loc_079f24
	dc.w loc_079f3e-loc_079f24

loc_079f2e
	dc.l $00000000,$00000000,$ffb50032,$00080029

loc_079f3e
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;1c
;##############################################
loc_079f5e:
	move.b (4,a6),d0
	move.w loc_079f6a(pc,d0.w),d1
	jmp loc_079f6a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079f6a:
	dc.w loc_079f72-loc_079f6a
	dc.w loc_079fee-loc_079f6a
	dc.w loc_07a022-loc_079f6a
	dc.w loc_07a060-loc_079f6a

;==============================================
;
;==============================================
loc_079f72:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_07a07c,($60,a6)
	move.l #loc_07a074,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	move.b ($72,a6),d0
	add.w d0,d0
	move.l loc_079fe2(pc,d0.w),d0
	moveq #$53,d1
	tst.b ($b,a6)
	bne.b loc_079fba
	neg.l d0
	neg.l d1

loc_079fba:
	move.l d0,($40,a6)
	add.w d1,($10,a6)
	addi.w #$39,($14,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	lsr.b #1,d0
	addi.b #$12,d0
	move.b d0,($70,a6)
	jsr loc_0331d0
	moveq #0,d0
	bra.b loc_079fee

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079fe2:
	dc.l $00030000,$0003c000,$00048000

;==============================================
;
;==============================================
loc_079fee:
	move.b (5,a6),d0
	move.w loc_079ffa(pc,d0.w),d1
	jmp loc_079ffa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_079ffa:
	dc.w loc_07a004-loc_079ffa
	dc.w loc_07a00a-loc_079ffa
	dc.w loc_07a010-loc_079ffa
	dc.w loc_07a016-loc_079ffa
	dc.w loc_07a01c-loc_079ffa

;----------------------------------------------
loc_07a004:
	jmp loc_033006

;----------------------------------------------
loc_07a00a:
	jmp loc_033030

;----------------------------------------------
loc_07a010:
	jmp loc_033074

;----------------------------------------------
loc_07a016:
	jmp loc_0330c4

;----------------------------------------------
loc_07a01c:
	jmp loc_033120

;==============================================
;
;==============================================
loc_07a022:
	move.b (5,a6),d0
	move.w loc_07a034(pc,d0.w),d1
	jsr loc_07a034(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a034:
	dc.w loc_07a038-loc_07a034
	dc.w loc_07a04c-loc_07a034

;----------------------------------------------
loc_07a038:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #$b,d0
	jmp loc_0331d0

;----------------------------------------------
loc_07a04c:
	tst.b ($33,a6)
	bpl.b loc_07a05a
	move.l #$06000000,(4,a6)

loc_07a05a:
	jmp loc_033210

;==============================================
;
;==============================================
loc_07a060:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_07a06e
	clr.w ($a4,a4)

loc_07a06e:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a074:
	dc.l $00000000
	dc.l $01000000

loc_07a07c:
	dc.w loc_07a086-loc_07a07c
	dc.w loc_07a086-loc_07a07c
	dc.w loc_07a086-loc_07a07c
	dc.w loc_07a086-loc_07a07c
	dc.w loc_07a096-loc_07a07c

loc_07a086:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0002,$0002,$000f,$000b

loc_07a096:
	dc.l $00000000,$00000000,$0b020500,$04000104
	dc.l $02060601,$06000200,$00240000,$00000000
	dc.l $00060000,$00150008,$0b020500,$04150104
	dc.l $02060601,$06000200,$00220000,$00000000
	dc.l $fffa0000,$00080008,$0b020500,$04150104
	dc.l $02060601,$06000200,$00220000,$00000000
	dc.l $00060000,$00150008,$0b020500,$04150104
	dc.l $02060601,$08000200,$00230000,$00000000
	dc.l $fffa0000,$00080008,$0b020500,$04150104
	dc.l $02060601,$08000200,$00230000,$00000000
	dc.l $00060000,$00150008,$0b020500,$04150104
	dc.l $02060601,$0a000200,$00240000,$00000000
	dc.l $fffa0000,$00080008,$0b020500,$04150104
	dc.l $02060601,$0a000200,$00240000,$00000000

;##############################################
;1d
;##############################################
loc_07a176:
	move.b (4,a6),d0
	move.w loc_07a182(pc,d0.w),d1
	jmp loc_07a182(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a182:
	dc.w loc_07a18a-loc_07a182
	dc.w loc_07a1c6-loc_07a182
	dc.w loc_07a21c-loc_07a182
	dc.w loc_07a21c-loc_07a182

;==============================================
;
;==============================================
loc_07a18a:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_07a22e,($60,a6)
	move.l #loc_07a222,($88,a6)
	jsr loc_03323a
	clr.b ($31,a6)
	clr.w ($50,a6)
	moveq #0,d0
	jsr loc_0331d0

;==============================================
;
;==============================================
loc_07a1c6:
	move.b (5,a6),d0
	move.w loc_07a1d8(pc,d0.w),d1
	jsr loc_07a1d8(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a1d8:
	dc.w loc_07a1e2-loc_07a1d8
	dc.w loc_07a216-loc_07a1d8
	dc.w loc_07a216-loc_07a1d8
	dc.w loc_07a216-loc_07a1d8
	dc.w loc_07a216-loc_07a1d8

;----------------------------------------------
loc_07a1e2:
	movea.w ($36,a6),a4
	cmpi.b #$10,(6,a4)
	bne.b loc_07a210
	move.w ($10,a4),($10,a6)
	move.w ($14,a4),($14,a6)
	move.b #1,(a6)
	movea.l ($1c,a4),a0
	move.b ($12,a0),d0
	bne.b loc_07a20a
	addq.b #1,(a6)

loc_07a20a:
	jmp loc_0331d0

loc_07a210:
	addq.b #2,(4,a6)
	rts

;----------------------------------------------
loc_07a216:
	addq.b #2,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07a21c:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a222:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000

loc_07a22e:
	dc.w loc_07a238-loc_07a22e
	dc.w loc_07a238-loc_07a22e
	dc.w loc_07a238-loc_07a22e
	dc.w loc_07a238-loc_07a22e
	dc.w loc_07a250-loc_07a22e

loc_07a238:
	dc.w $0000,$0000,$0000,$0000
	dc.w $ffcd,$0038,$0016,$0024
	dc.w $ffa1,$0038,$0034,$0024

loc_07a250:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000

;##############################################
;1e
;##############################################
loc_07a270:
	movea.w ($36,a6),a4
	move.b (4,a6),d0
	move.w loc_07a280(pc,d0.w),d1
	jmp loc_07a280(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a280:
	dc.w loc_07a288-loc_07a280
	dc.w loc_07a2e2-loc_07a280
	dc.w loc_07a39a-loc_07a280
	dc.w loc_07a3d8-loc_07a280

;==============================================
;
;==============================================
loc_07a288:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	move.l ($18,a4),($18,a6)
	move.l ($e6,a4),($e6,a6)
	move.l #loc_07a462,($60,a6)
	move.l #loc_07a456,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	bsr.w loc_07a41c
	bsr.w loc_07a3e8
	move.b #$ff,($70,a6)
	move.b ($72,a6),d0
	lsr.b #1,d0
	addi.b #$15,d0
	tst.b (3,a6)
	beq.b loc_07a2da
	addi.b #7,d0

loc_07a2da:
	jsr loc_0331d0
	moveq #0,d0

;==============================================
;
;==============================================
loc_07a2e2:
	cmpi.w #$200,(4,a4)
	bne.b loc_07a322
	cmpi.b #$10,(6,a4)
	bne.b loc_07a322
	move.b (5,a6),d0
	move.w loc_07a2fe(pc,d0.w),d1
	jmp loc_07a2fe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a2fe:
	dc.w loc_07a308-loc_07a2fe
	dc.w loc_07a33a-loc_07a2fe
	dc.w loc_07a388-loc_07a2fe
	dc.w loc_07a38e-loc_07a2fe
	dc.w loc_07a394-loc_07a2fe

;----------------------------------------------
loc_07a308:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07a334
	jsr loc_033210
	bsr.w loc_07a3e8
	tst.b ($33,a6)
	bpl.b loc_07a32e

loc_07a322:
	move.l #$04000000,(4,a6)
	moveq #0,d0
	bra.b loc_07a39a

loc_07a32e:
	jsr loc_01b490

loc_07a334:
	jmp loc_01b4d0

;----------------------------------------------
loc_07a33a:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07a350
	move.b (6,a6),d0
	move.w loc_07a358(pc,d0.w),d1
	jsr loc_07a358(pc,d1.w)

loc_07a350:
	moveq #0,d0
	jmp loc_033030

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a358:
	dc.w loc_07a35c-loc_07a358
	dc.w loc_07a370-loc_07a358

;----------------------------------------------
loc_07a35c:
	addq.b #2,(6,a6)
	bsr.w loc_07a41c
	bsr.w loc_07a3e8
	move.b #$e,($3a,a6)
	jmp loc_033210

;----------------------------------------------
loc_07a370:
	subq.b #1,($3a,a6)
	bne.b loc_07a386
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_07a386:
	rts

;----------------------------------------------
loc_07a388:
	jmp loc_033074

;----------------------------------------------
loc_07a38e:
	jmp loc_0330c4

;----------------------------------------------
loc_07a394:
	jmp loc_033120

;==============================================
;
;==============================================
loc_07a39a:
	move.b (5,a6),d0
	move.w loc_07a3ac(pc,d0.w),d1
	jsr loc_07a3ac(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a3ac:
	dc.w loc_07a3b0-loc_07a3ac
	dc.w loc_07a3c4-loc_07a3ac

;----------------------------------------------
loc_07a3b0:
	addq.b #2,(5,a6)
	moveq #$18,d0
	tst.b (3,a6)
	beq.b loc_07a3be
	moveq #$1f,d0

loc_07a3be:
	jmp loc_0331d0


;----------------------------------------------
loc_07a3c4:
	tst.b ($33,a6)
	bpl.b loc_07a3d2
	move.l #$06000000,(4,a6)

loc_07a3d2:
	jmp loc_033210

;==============================================
;
;==============================================
loc_07a3d8:
	subq.b #1,($238,a4)
	bne.b loc_07a3e2
	clr.w ($a4,a4)

loc_07a3e2:
	jmp loc_01c206

;----------------------------------------------
loc_07a3e8:
	move.l ($10,a4),($10,a6)
	move.l ($14,a4),($14,a6)
	move.w #$ff94,d0
	move.w #$40,d1
	tst.b (3,a6)
	beq.b loc_07a40a
	move.w #$ffb5,d0
	move.w #0,d1

loc_07a40a:
	tst.b ($b,a6)
	beq.b loc_07a412
	neg.w d0

loc_07a412:
	add.w d0,($10,a6)
	add.w d1,($14,a6)
	rts

;----------------------------------------------
loc_07a41c:
	lea.l loc_07a524(pc),a0
	cmpi.b #0,($72,a6)
	beq.b loc_07a438
	lea.l loc_07a728(pc),a0
	cmpi.b #2,($72,a6)
	beq.b loc_07a438
	lea.l loc_07a9d8(pc),a0

loc_07a438:
	move.w ($50,a6),d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	moveq #$15,d0
	jsr loc_03323a
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a456:
	dc.l $00000000
	dc.l $01000000
	dc.l $02000000

loc_07a462:
	dc.w loc_07a46c-loc_07a462
	dc.w loc_07a46c-loc_07a462
	dc.w loc_07a46c-loc_07a462
	dc.w loc_07a46c-loc_07a462
	dc.w loc_07a484-loc_07a462

loc_07a46c:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0010,$0000,$0030,$0030
	dc.w $ffde,$0005,$0059,$0005

loc_07a484:
	dc.l $00000000,$00000000,$12002500,$00150104
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $001cfff4,$00240024,$12002500,$00150104
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a524:
	dc.w loc_07a52a-loc_07a524
	dc.w loc_07a534-loc_07a524
	dc.w loc_07a53e-loc_07a524

loc_07a52a:
	dc.w loc_07a46c-loc_07a52a
	dc.w loc_07a46c-loc_07a52a
	dc.w loc_07a46c-loc_07a52a
	dc.w loc_07a46c-loc_07a52a
	dc.w loc_07a548-loc_07a52a

loc_07a534:
	dc.w loc_07a46c-loc_07a534
	dc.w loc_07a46c-loc_07a534
	dc.w loc_07a46c-loc_07a534
	dc.w loc_07a46c-loc_07a534
	dc.w loc_07a5e8-loc_07a534

loc_07a53e:
	dc.w loc_07a46c-loc_07a53e
	dc.w loc_07a46c-loc_07a53e
	dc.w loc_07a46c-loc_07a53e
	dc.w loc_07a46c-loc_07a53e
	dc.w loc_07a688-loc_07a53e

loc_07a548:
	dc.l $00000000,$00000000,$0c002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $001cfff4,$00240024,$0c002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $ffde0005,$00590005,$0c002500,$00150104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $ffee0005,$00490005,$0c002500,$00150104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $fffe0005,$00390005,$0c002500,$00150104
	dc.l $0e000602,$0c050a01,$00250000,$00000000

loc_07a5e8:
	dc.l $00000000,$00000000,$0b002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $001cfff4,$00240024,$0b002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $ffde0005,$00590005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $ffee0005,$00490005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $fffe0005,$00390005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000

loc_07a688:
	dc.l $00000000,$00000000,$0b002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $001cfff4,$00240024,$0b002500,$00150104
	dc.l $0e000602,$0c040a01,$00250000,$00000000
	dc.l $ffde0005,$00590005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $ffee0005,$00490005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000
	dc.l $fffe0005,$00390005,$0b002500,$00140104
	dc.l $0e000602,$0c050a01,$00250000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a728:
	dc.w loc_07a730-loc_07a728
	dc.w loc_07a73a-loc_07a728
	dc.w loc_07a744-loc_07a728
	dc.w loc_07a74e-loc_07a728

loc_07a730:
	dc.w loc_07a46c-loc_07a730
	dc.w loc_07a46c-loc_07a730
	dc.w loc_07a46c-loc_07a730
	dc.w loc_07a46c-loc_07a730
	dc.w loc_07a758-loc_07a730

loc_07a73a:
	dc.w loc_07a46c-loc_07a73a
	dc.w loc_07a46c-loc_07a73a
	dc.w loc_07a46c-loc_07a73a
	dc.w loc_07a46c-loc_07a73a
	dc.w loc_07a7f8-loc_07a73a

loc_07a744:
	dc.w loc_07a46c-loc_07a744
	dc.w loc_07a46c-loc_07a744
	dc.w loc_07a46c-loc_07a744
	dc.w loc_07a46c-loc_07a744
	dc.w loc_07a898-loc_07a744

loc_07a74e:
	dc.w loc_07a46c-loc_07a74e
	dc.w loc_07a46c-loc_07a74e
	dc.w loc_07a46c-loc_07a74e
	dc.w loc_07a46c-loc_07a74e
	dc.w loc_07a938-loc_07a74e

loc_07a758:
	dc.l $00000000,$00000000,$0f002500,$00150404
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $0018fff8,$00280028,$0f002500,$00150404
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $ffde0005,$00590005,$0f002500,$00150404
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $ffee0005,$00490005,$0f002500,$00150404
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $fffe0005,$00390005,$0f002500,$00150404
	dc.l $0e000602,$0c050b01,$00260000,$00000000

loc_07a7f8:
	dc.l $00000000,$00000000,$0f002500,$00150304
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $0018fff8,$00280028,$0f002500,$00150304
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $ffde0005,$00590005,$0f002500,$00140304
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $ffee0005,$00490005,$0f002500,$00140304
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $fffe0005,$00390005,$0f002500,$00140304
	dc.l $0e000602,$0c050b01,$00260000,$00000000

loc_07a898:
	dc.l $00000000,$00000000,$0f002500,$00150204
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $0018fff8,$00280028,$0f002500,$00150204
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $ffde0005,$00590005,$0f002500,$00140204
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $ffee0005,$00490005,$0f002500,$00140204
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $fffe0005,$00390005,$0f002500,$00140204
	dc.l $0e000602,$0c050b01,$00260000,$00000000

loc_07a938:
	dc.l $00000000,$00000000,$0f002500,$00150104
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $0018fff8,$00280028,$0f002500,$00150104
	dc.l $0e000602,$0c040b01,$00260000,$00000000
	dc.l $ffde0005,$00590005,$0f002500,$00140104
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $ffee0005,$00490005,$0f002500,$00140104
	dc.l $0e000602,$0c050b01,$00260000,$00000000
	dc.l $fffe0005,$00390005,$0f002500,$00140104
	dc.l $0e000602,$0c050b01,$00260000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07a9d8:
	dc.w loc_07a9e2-loc_07a9d8
	dc.w loc_07a9ec-loc_07a9d8
	dc.w loc_07a9f6-loc_07a9d8
	dc.w loc_07aa00-loc_07a9d8
	dc.w loc_07aa0a-loc_07a9d8

loc_07a9e2:
	dc.w loc_07a46c-loc_07a9e2
	dc.w loc_07a46c-loc_07a9e2
	dc.w loc_07a46c-loc_07a9e2
	dc.w loc_07a46c-loc_07a9e2
	dc.w loc_07aa14-loc_07a9e2

loc_07a9ec:
	dc.w loc_07a46c-loc_07a9ec
	dc.w loc_07a46c-loc_07a9ec
	dc.w loc_07a46c-loc_07a9ec
	dc.w loc_07a46c-loc_07a9ec
	dc.w loc_07aab4-loc_07a9ec

loc_07a9f6:
	dc.w loc_07a46c-loc_07a9f6
	dc.w loc_07a46c-loc_07a9f6
	dc.w loc_07a46c-loc_07a9f6
	dc.w loc_07a46c-loc_07a9f6
	dc.w loc_07ab54-loc_07a9f6

loc_07aa00:
	dc.w loc_07a46c-loc_07aa00
	dc.w loc_07a46c-loc_07aa00
	dc.w loc_07a46c-loc_07aa00
	dc.w loc_07a46c-loc_07aa00
	dc.w loc_07abf4-loc_07aa00

loc_07aa0a:
	dc.w loc_07a46c-loc_07aa0a
	dc.w loc_07a46c-loc_07aa0a
	dc.w loc_07a46c-loc_07aa0a
	dc.w loc_07a46c-loc_07aa0a
	dc.w loc_07ac94-loc_07aa0a

loc_07aa14:
	dc.l $00000000,$00000000,$12002500,$00150504
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $0014fffc,$002c002c,$12002500,$00150504
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00150504
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00150504
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00150504
	dc.l $0e000602,$0c050c01,$00270000,$00000000

loc_07aab4:
	dc.l $00000000,$00000000,$12002500,$00150404
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $0014fffc,$002c002c,$12002500,$00150404
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00140404
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00140404
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00140404
	dc.l $0e000602,$0c050c01,$00270000,$00000000

loc_07ab54:
	dc.l $00000000,$00000000,$12002500,$00150304
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $0014fffc,$002c002c,$12002500,$00150304
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00140304
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00140304
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00140304
	dc.l $0e000602,$0c050c01,$00270000,$00000000

loc_07abf4:
	dc.l $00000000,$00000000,$12002500,$00150204
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $0014fffc,$002c002c,$12002500,$00150204
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00140204
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00140204
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00140204
	dc.l $0e000602,$0c050c01,$00270000,$00000000

loc_07ac94:
	dc.l $00000000,$00000000,$12002500,$00150104
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $0014fffc,$002c002c,$12002500,$00150104
	dc.l $0e000602,$0c040c01,$00270000,$00000000
	dc.l $ffde0005,$00590005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $ffee0005,$00490005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000
	dc.l $fffe0005,$00390005,$12002500,$00140104
	dc.l $0e000602,$0c050c01,$00270000,$00000000

;##############################################
;1f
;##############################################
loc_07ad34:
	move.b (4,a6),d0
	move.w loc_07ad40(pc,d0.w),d1
	jmp loc_07ad40(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ad40:
	dc.w loc_07ad48-loc_07ad40
	dc.w loc_07ad8a-loc_07ad40
	dc.w loc_07ade4-loc_07ad40
	dc.w loc_07adfa-loc_07ad40

;==============================================
;
;==============================================
loc_07ad48:
	addq.b #2,(4,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_07ae16,($60,a6)
	move.l #loc_07ae0e,($88,a6)
	jsr loc_03323a
	moveq #0,d0
	move.b d0,($31,a6)
	move.b d0,(9,a6)
	move.w #$fff,($50,a6)
	moveq #$10,d0
	jsr loc_0331d0
	moveq #0,d0

;==============================================
;
;==============================================
loc_07ad8a:
	move.b (5,a6),d0
	move.w loc_07ad96(pc,d0.w),d1
	jmp loc_07ad96(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ad96:
	dc.w loc_07ada0-loc_07ad96
	dc.w loc_07add6-loc_07ad96
	dc.w loc_07add6-loc_07ad96
	dc.w loc_07add6-loc_07ad96
	dc.w loc_07add6-loc_07ad96

;----------------------------------------------
loc_07ada0:
	movea.w ($40,a6),a0
	cmpi.b #6,(5,a0)
	bne.b loc_07add4
	move.w ($10,a0),($10,a6)
	move.w ($14,a0),($14,a6)
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07adce
	tst.b ($33,a6)
	bmi.b loc_07add6
	jsr loc_033210

loc_07adce:
	jmp loc_01b4d0

loc_07add4:
	rts

;----------------------------------------------
loc_07add6:
	move.b #2,(a6)
	move.l #$04000000,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07ade4:
	move.l #$06000000,(4,a6)
	move.b #2,(a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	rts

;==============================================
;
;==============================================
loc_07adfa:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_07ae08
	clr.w ($a4,a4)

loc_07ae08:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ae0e:
	dc.l $00000000
	dc.l $01000000

loc_07ae16:
	dc.w loc_07ae20-loc_07ae16
	dc.w loc_07ae20-loc_07ae16
	dc.w loc_07ae20-loc_07ae16
	dc.w loc_07ae20-loc_07ae16
	dc.w loc_07ae30-loc_07ae16

loc_07ae20:
	dc.w $0000,$0000,$0000,$0000
	dc.w $000e,$0000,$0018,$0010

loc_07ae30:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000
	dc.l $00000002,$00020002,$01020500,$00140104
	dc.l $0a000001,$0a000200,$00000000,$00000000

;##############################################
;20 Blanka Fruit
;##############################################
loc_07ae70:
	movea.w ($36,a6),a4
	move.b (3,a6),d0
	move.w loc_07ae80(pc,d0.w),d1
	jmp loc_07ae80(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ae80:
	dc.w loc_07ae84-loc_07ae80
	dc.w loc_07b022-loc_07ae80

;==============================================
;
;==============================================
loc_07ae84:
	move.b (4,a6),d0
	move.w loc_07ae90(pc,d0.w),d1
	jmp loc_07ae90(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07ae90:
	dc.w loc_07ae98-loc_07ae90
	dc.w loc_07af9a-loc_07ae90
	dc.w loc_07b48c-loc_07ae90
	dc.w loc_07b522-loc_07ae90

;----------------------------------------------
loc_07ae98:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	move.l ($18,a4),($18,a6)
	move.l #loc_07b56a,($60,a6)
	move.l #loc_07b562,($88,a6)
	jsr loc_03323a
	move.b ($5a,a4),($5a,a6)
	move.b ($59,a4),($59,a6)
	move.b #0,($73,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($26,a4),($26,a6)
	move.w #0,($50,a6)
	move.w ($10,a4),($10,a6)
	move.w ($64,a4),d0
	move.w d0,($64,a6)
	addi.w #$c8,d0
	move.w d0,($14,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffffb800,($4c,a6)
	moveq #0,d0
	move.b ($31,a6),d0
	lsl.w #2,d0
	move.w loc_07af6a(pc,d0.w),d1
	tst.b ($b,a6)
	bne.b loc_07af34
	neg.w d1

loc_07af34:
	add.w d1,($10,a6)
	move.w loc_07af6a+2(pc,d0.w),($3a,a6)
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_07af5a(pc,d0.w),d0
	move.b ($72,a6),d1
	asr.b #1,d1
	add.b d1,d0
	jmp loc_0331d0


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07af5a:
	dc.b $00,$06,$09,$0c,$0f,00
	dc.b $06,$09,$0c,$0f,00
	dc.b $06,$09,$0c,$0f,00

loc_07af6a:
	dc.w $0020,$0000,$0038,$0006
	dc.w $0050,$0000,$0068,$0006
	dc.w $0080,$0000,$0098,$0006
	dc.w $00b0,$0000,$00c8,$0006
	dc.w $00e0,$0000,$00f8,$0006
	dc.w $0110,$0000,$0128,$0006

;----------------------------------------------
loc_07af9a:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.w loc_07b528
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_07afba(pc,d0.w),d1
	jsr loc_07afba(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07afba:
	dc.w loc_07afc4-loc_07afba
	dc.w loc_07b018-loc_07afba
	dc.w loc_07b018-loc_07afba
	dc.w loc_07b018-loc_07afba
	dc.w loc_07b018-loc_07afba

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07afc4:
	move.b (6,a6),d0
	move.w loc_07afd0(pc,d0.w),d1
	jmp loc_07afd0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07afd0:
	dc.w loc_07afd4-loc_07afd0
	dc.w loc_07afe6-loc_07afd0

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07afd4:
	subq.w #1,($3a,a6)
	bpl.b loc_07afe4
	addq.b #2,(6,a6)
	move.b #2,($3a,a6)

loc_07afe4:
	rts

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_07afe6:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07b012
	move.l #$4000000,(4,a6)
	move.w d0,($14,a6)
	move.b #2,(pl_hitfreeze,a6)

loc_07b012:
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b018:
	move.l #$4000000,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07b022:
	move.b (4,a6),d0
	move.w loc_07b02e(pc,d0.w),d1
	jmp loc_07b02e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b02e:
	dc.w loc_07b036-loc_07b02e
	dc.w loc_07b10e-loc_07b02e
	dc.w loc_07b48c-loc_07b02e
	dc.w loc_07b522-loc_07b02e

;----------------------------------------------
loc_07b036:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	move.l ($18,a4),($18,a6)
	move.l #loc_07b56a,($60,a6)
	move.l #loc_07b562,($88,a6)
	jsr loc_03323a
	move.b ($5a,a4),($5a,a6)
	move.b ($59,a4),($59,a6)
	move.b #0,($73,a6)
	move.b ($e,a4),($e,a6)
	move.b ($b,a4),($b,a6)
	move.w ($c,a4),($c,a6)
	move.w ($26,a4),($26,a6)
	move.b #1,($31,a6)
	move.w #3,($50,a6)
	move.w a6,($38,a6)
	jsr loc_01bd5c
	jsr RNGFunction
	andi.w #$ff,d0
	add.w ($10,a3),d0
	addi.w #$40,d0
	move.w d0,($10,a6)
	move.w ($64,a4),d0
	addi.w #$10,d0
	move.w d0,($64,a6)
	addi.w #$c0,d0
	move.w d0,($14,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l #0,($44,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #$3c,($3a,a6)
	move.b #1,(a6)
	jsr loc_01c2c8
	beq.b loc_07b0fe
	move.l #$0100271e,(a4)
	move.w a6,($36,a4)

loc_07b0fe:
	moveq #3,d0
	move.b ($72,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_0331d0

;----------------------------------------------
loc_07b10e:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.w loc_07b528
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_07b128(pc,d0.w),d1
	jmp loc_07b128(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b128:
	dc.w loc_07b132-loc_07b128
	dc.w loc_07b37e-loc_07b128
	dc.w loc_07b37e-loc_07b128
	dc.w loc_07b37e-loc_07b128
	dc.w loc_07b37e-loc_07b128

;----------------------------------------------
loc_07b132:
	move.b (6,a6),d0
	move.w loc_07b13e(pc,d0.w),d1
	jmp loc_07b13e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b13e:
	dc.w loc_07b148-loc_07b13e
	dc.w loc_07b158-loc_07b13e
	dc.w loc_07b1be-loc_07b13e
	dc.w loc_07b2f4-loc_07b13e
	dc.w loc_07b35a-loc_07b13e

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b148:
	subq.b #1,($3a,a6)
	bpl.b loc_07b152
	addq.b #2,(6,a6)

loc_07b152:
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b158:
	bsr.w loc_07b550
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07b1b2
	addq.b #2,(6,a6)
	move.w d0,($14,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b d0,($31,a6)
	move.b #2,(a6)
	move.b #2,(pl_hitfreeze,a6)
	move.l #loc_07b574,($60,a6)
	move.l #loc_07b562,($88,a6)
	jsr loc_03323a
	move.b #$ff,($3a,a6)
	moveq #5,d0
	jsr loc_080b70


loc_07b1b2:
	jsr loc_033210
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b1be:
	bsr.w loc_07b388
	beq.b loc_07b220
	addq.b #2,(6,a6)
	move.b #1,(a6)
	move.b ($59,a4),($59,a6)
	move.w a4,($36,a6)
	move.b #1,($31,a6)
	move.w ($10,a6),d0
	sub.w ($10,a4),d0
	smi.b d0
	addq.b #1,d0
	move.b d0,($b,a6)
	move.b #$10,($3b,a6)
	move.b ($82,a4),d0
	andi.w #6,d0
	lsl.w #3,d0
	lea.l loc_07b234(pc),a0
	move.l (a0,d0.w),($40,a6)
	move.l (4,a0,d0.w),($48,a6)
	move.l (8,a0,d0.w),($44,a6)
	move.l ($c,a0,d0.w),($4c,a6)
	moveq #4,d0
	jsr loc_080b70

loc_07b220:
	subq.b #1,($3a,a6)
	bne.b loc_07b22e
	move.l #$04040000,(4,a6)

loc_07b22e:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b234:
	dc.l $00028000,$00000000,$00098000,$ffffb800
	dc.l $00040000,$00000000,$00068000,$ffffb800
	dc.l $00080000,$00000000,$00020000,$ffffe000
	dc.l $00080000,$00000000,$00020000,$ffffe000
	dc.l $00028000,$00000000,$00098000,$ffff9800
	dc.l $00040000,$00000000,$00068000,$ffff9800
	dc.l $00080000,$00000000,$00020000,$ffffc000
	dc.l $00080000,$00000000,$00020000,$ffffc000
	dc.l $00060000,$00000000,$00000000,$ffffa800
	dc.l $00070000,$00000000,$fffe0000,$ffff9800
	dc.l $00080000,$00000000,$fffc0000,$ffff8000
	dc.l $00080000,$00000000,$fffc0000,$ffff8000

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b2f4:
	tst.b ($3b,a6)
	beq.b loc_07b300
	subq.b #1,($3b,a6)
	bne.b loc_07b35a

loc_07b300:
	bsr.w loc_07b388
	beq.b loc_07b35a
	addq.b #2,(6,a6)
	move.b #1,(a6)
	move.b ($59,a4),($59,a6)
	move.w a4,($36,a6)
	move.b ($82,a4),d0
	andi.w #6,d0
	lsl.w #3,d0
	tst.b ($31,a4)
	beq.b loc_07b336
	addi.w #$40,d0
	tst.w ($44,a4)
	bpl.b loc_07b336
	addi.w #$40,d0

loc_07b336:
	lea.l loc_07b234(pc),a0
	move.l (a0,d0.w),($40,a6)
	move.l (4,a0,d0.w),($48,a6)
	move.l (8,a0,d0.w),($44,a6)
	move.l ($c,a0,d0.w),($4c,a6)
	moveq #4,d0
	jsr loc_080b70

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b35a:
	bsr.w loc_07b54e
	bpl.b loc_07b372
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07b372
	move.l #$04000000,(4,a6)

loc_07b372:
	jsr loc_033210
	jmp loc_01b4d0

;----------------------------------------------
loc_07b37e:
	move.l #$4000000,(4,a6)
	rts

;==============================================
loc_07b388:
	move.b (a6),d0
	subq.b #1,d0
	cmpi.b #1,d0
	bhi.b loc_07b3e8
	movea.w ($36,a6),a4
	bsr.b loc_07b3f0
	bne.b loc_07b3ec
	cmpi.b #1,(a6)
	beq.b loc_07b3e8
	lea.l (p1memory,a5),a4
	tst.b (a4)
	beq.b loc_07b3b2
	cmpa.w ($36,a6),a4
	beq.b loc_07b3b2
	bsr.b loc_07b3f0
	bne.b loc_07b3ec

loc_07b3b2:
	lea.l (p2memory,a5),a4
	tst.b (a4)
	beq.b loc_07b3c4
	cmpa.w ($36,a6),a4
	beq.b loc_07b3c4
	bsr.b loc_07b3f0
	bne.b loc_07b3ec

loc_07b3c4:
	lea.l (p3memory,a5),a4
	tst.b (a4)
	beq.b loc_07b3d6
	cmpa.w ($36,a6),a4
	beq.b loc_07b3d6
	bsr.b loc_07b3f0
	bne.b loc_07b3ec

loc_07b3d6:
	lea.l (p4memory,a5),a4
	tst.b (a4)
	beq.b loc_07b3e8
	cmpa.w ($36,a6),a4
	beq.b loc_07b3e8
	bsr.b loc_07b3f0
	bne.b loc_07b3ec

loc_07b3e8:
	moveq #0,d0
	rts

loc_07b3ec:
	moveq #1,d0
	rts

;==============================================
loc_07b3f0:
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b (8,a0),d0
	beq.w loc_07b488
	add.w d0,d0
	add.w d0,d0
	movea.l ($88,a6),a0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	move.b (a0),d0
	lsl.w #3,d0
	movea.l #loc_07b57e,a0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	movea.l ($1c,a4),a1
	move.b (9,a1),d0
	beq.w loc_07b488
	movea.l ($a0,a4),a1
	lsl.w #5,d0
	lea.l (a1,d0.w),a1
	move.w (2,a0),d0
	add.w ($14,a6),d0
	move.w (2,a1),d1
	add.w ($14,a4),d1
	sub.w d0,d1
	bpl.b loc_07b448
	neg.w d1

loc_07b448:
	move.w (6,a0),d0
	add.w (6,a1),d0
	sub.w d0,d1
	bpl.w loc_07b488
	move.w (a0),d0
	tst.b ($b,a6)
	beq.b loc_07b460
	neg.w d0

loc_07b460:
	add.w ($10,a6),d0
	move.w (a1),d1
	tst.b ($b,a4)
	beq.b loc_07b46e
	neg.w d1

loc_07b46e:
	add.w ($10,a4),d1
	sub.w d0,d1
	bpl.b loc_07b478
	neg.w d1

loc_07b478:
	move.w (4,a0),d0
	add.w (4,a1),d0
	sub.w d0,d1
	bgt.b loc_07b488
	moveq #1,d0
	rts

loc_07b488:
	moveq #0,d0
	rts

;----------------------------------------------
loc_07b48c:
	move.b (5,a6),d0
	move.w loc_07b498(pc,d0.w),d1
	jmp loc_07b498(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b498:
	dc.w loc_07b4a0-loc_07b498
	dc.w loc_07b4c8-loc_07b498
	dc.w loc_07b4f8-loc_07b498
	dc.w loc_07b502-loc_07b498

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b4a0:
	addq.b #2,(5,a6)
	move.l #0,($40,a6)
	move.l #0,($48,a6)
	move.l #$50000,($44,a6)
	move.l #$ffffb800,($4c,a6)
	move.b #2,(a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b4c8:
	bsr.w loc_07b54e
	bpl.b loc_07b4dc
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07b4dc
	addq.b #2,(4,a6)

loc_07b4dc:
	jsr loc_033210
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_07b532
	jmp loc_01b4d0

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b4f8:
	addq.b #2,(5,a6)
	move.b #$20,($3a,a6)

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07b502:
	subq.b #1,($3a,a6)
	bpl.b loc_07b50c
	addq.b #2,(4,a6)

loc_07b50c:
	move.b ($b4,a5),d0
	add.b ($b5,a5),d0
	andi.b #1,d0
	beq.w loc_07b532
	jmp loc_01b4d0

;----------------------------------------------
loc_07b522:
	jmp loc_01c206

;==============================================
loc_07b528:
	tst.b (a6)
	beq.b loc_07b532
	jmp loc_01b4d0

loc_07b532:
	rts

;==============================================
loc_07b534:
	move.l ($40,a6),d0
	tst.b ($b,a6)
	bne.b loc_07b540
	neg.l d0

loc_07b540:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;==============================================
loc_07b54e:
	bsr.b loc_07b534

loc_07b550:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b562:
	dc.l $00000000
	dc.l $01000000

loc_07b56a:
	dc.w loc_07b57e-loc_07b56a
	dc.w loc_07b57e-loc_07b56a
	dc.w loc_07b57e-loc_07b56a
	dc.w loc_07b57e-loc_07b56a
	dc.w loc_07b58e-loc_07b56a

loc_07b574:
	dc.w loc_07b57e-loc_07b574
	dc.w loc_07b57e-loc_07b574
	dc.w loc_07b57e-loc_07b574
	dc.w loc_07b57e-loc_07b574
	dc.w loc_07b64e-loc_07b574


loc_07b57e:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$000d,$000a

loc_07b58e:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000
	dc.l $00000000,$00060005,$01040501,$001e0504
	dc.l $02000002,$0c000a01,$00270000,$00000000
	dc.l $00000000,$00060005,$01040501,$001e0504
	dc.l $02000002,$0c000b01,$00270000,$00000000
	dc.l $00000000,$00060005,$01040501,$001e0504
	dc.l $02000002,$0c000c01,$00270000,$00000000
	dc.l $00000000,$00060005,$00020b00,$000d0101
	dc.l $04000002,$00000100,$00240000,$00000000
	dc.l $00000000,$00060005,$00020b00,$000d01ff
	dc.l $04000002,$16000100,$00240000,$00000000

loc_07b64e:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000
	dc.l $00000000,$00060005,$08020b00,$000d0505
	dc.l $04000002,$06000200,$00220000,$00000000
	dc.l $00000000,$00060005,$08020b00,$000d0506
	dc.l $04000002,$08000200,$00230000,$00000000
	dc.l $00000000,$00060005,$08020b00,$000d0507
	dc.l $04000002,$0a000200,$00240000,$00000000
	dc.l $00000000,$00060005,$00020b00,$000d0101
	dc.l $04000002,$00000100,$00240000,$00000000
	dc.l $00000000,$00060005,$00020b00,$000d01ff
	dc.l $04000002,$16000100,$00240000,$00000000

;##############################################
;21 Cody Rocks
;##############################################
loc_07b70e:
	move.b (4,a6),d0
	move.w loc_07b71a(pc,d0.w),d1
	jmp loc_07b71a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b71a:
	dc.w loc_07b722-loc_07b71a
	dc.w loc_07b832-loc_07b71a
	dc.w loc_07b8b4-loc_07b71a
	dc.w loc_07b970-loc_07b71a

;==============================================
;
;==============================================
loc_07b722:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.w ($64,a4),($64,a6)
	move.l ($e6,a4),($e6,a6)
	move.l #loc_07b9ae,($60,a6)
	move.l #loc_07b9a6,($88,a6)
	jsr loc_03323a
	moveq #$15,d0
	move.b ($a,a6),d1
	add.b d1,d1
	sub.b d1,d0
	move.b d0,($cc,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b d0,($31,a6)
	move.l d0,($44,a6)
	moveq #$4d,d3
	moveq #$5b,d4
	move.b ($72,a6),d0
	add.b (3,a6),d0
	lsl.w #3,d0
	move.l loc_07b7cc(pc,d0.w),d1
	move.l loc_07b7cc+4(pc,d0.w),d2
	move.l loc_07b7cc+8(pc,d0.w),($44,a6)
	move.l loc_07b7cc+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_07b7a0
	neg.l d1
	neg.l d2
	neg.l d3

loc_07b7a0:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	add.w d3,($10,a6)
	add.w d4,($14,a6)
	moveq #0,d0
	move.b ($72,a6),d0
	add.b (3,a6),d0
	lsr.b #1,d0
	move.b loc_07b82c(pc,d0.w),($70,a6)
	jsr loc_0331d0
	moveq #0,d0
	bra.b loc_07b832

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b7cc:
	dc.l $00060000,$00000000,$00000000,$ffffa800
	dc.l $00070000,$00000000,$00010000,$ffffa800
	dc.l $00080000,$00000000,$00020000,$ffffa800
	dc.l $00060000,$00000000,$00000000,$00000000
	dc.l $00080000,$00000000,$00000000,$00000000
	dc.l $000a0000,$00000000,$00000000,$00000000

loc_07b82c:
	dc.b $00,$01,$02
	dc.b $03,$03,$03

;==============================================
;
;==============================================
loc_07b832:
	move.b (5,a6),d0
	move.w loc_07b83e(pc,d0.w),d1
	jmp loc_07b83e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b83e:
	dc.w loc_07b848-loc_07b83e
	dc.w loc_07b89c-loc_07b83e
	dc.w loc_07b8a2-loc_07b83e
	dc.w loc_07b8a8-loc_07b83e
	dc.w loc_07b8ae-loc_07b83e

;----------------------------------------------
loc_07b848:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07b896
	jsr loc_0251a8
	bne.b loc_07b884
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	add.l ($48,a6),d0
	move.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	add.l ($4c,a6),d0
	move.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_07b88a

loc_07b884:
	move.b #4,(4,a6)

loc_07b88a:
	jsr loc_033210
	jsr loc_01b490

loc_07b896:
	jmp loc_01b4d0

;----------------------------------------------
loc_07b89c:
	jmp loc_033030

;----------------------------------------------
loc_07b8a2:
	jmp loc_033074

;----------------------------------------------
loc_07b8a8:
	jmp loc_0330c4

;----------------------------------------------
loc_07b8ae:
	jmp loc_033120

;==============================================
;
;==============================================
loc_07b8b4:
	tst.b (3,a6)
	beq.b loc_07b8c6
	move.b #6,(4,a6)
	move.b #2,(a6)
	bra.b loc_07b8dc

loc_07b8c6:
	move.b (5,a6),d0
	move.w loc_07b8e2(pc,d0.w),d1
	jsr loc_07b8e2(pc,d1.w)
	btst.b #0,($b4,a5)
	beq.b loc_07b8dc
	rts

loc_07b8dc:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b8e2:
	dc.w loc_07b8e8-loc_07b8e2
	dc.w loc_07b90a-loc_07b8e2
	dc.w loc_07b946-loc_07b8e2

;----------------------------------------------
loc_07b8e8:
	addq.b #2,(5,a6)
	move.b #2,(a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	move.l #$70000,($44,a6)
	move.l #$ffff0000,($4c,a6)
	rts

;----------------------------------------------
loc_07b90a:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	cmpi.w #$28,($14,a6)
	bcc.b loc_07b940
	addq.b #2,(5,a6)
	move.w #$28,($14,a6)
	clr.w ($16,a6)
	move.l #$20000,($44,a6)
	move.l #$ffffc000,($4c,a6)

loc_07b940:
	jmp loc_033210

;----------------------------------------------
loc_07b946:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	cmpi.w #$28,($14,a6)
	bcc.b loc_07b96a
	move.l #$6000000,(4,a6)
	clr.w ($16,a6)

loc_07b96a:
	jmp loc_033210

;==============================================
;
;==============================================
loc_07b970:
	movea.w ($36,a6),a4
	tst.b (3,a6)
	beq.b loc_07b992
	clr.b ($1e4,a4)
	move.w ($10,a6),($1e0,a4)
	move.w ($14,a6),($1e2,a4)
	moveq #$22,d0
	jsr loc_0038e4

loc_07b992:
	subq.b #1,($238,a4)
	bne.b loc_07b9a0
	clr.w ($a4,a4)
	clr.b ($cc,a6)

loc_07b9a0:
	jmp loc_01c206

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07b9a6:
	dc.l $00000000
	dc.l $01000000

loc_07b9ae:
	dc.w loc_07b9b8-loc_07b9ae
	dc.w loc_07b9b8-loc_07b9ae
	dc.w loc_07b9b8-loc_07b9ae
	dc.w loc_07b9b8-loc_07b9ae
	dc.w loc_07b9c8-loc_07b9ae

loc_07b9b8:
	dc.w $0000,$0000,$0000,$0000
	dc.w $000e,$0000,$0018,$0010

loc_07b9c8:
	dc.l $00000000,$00000000,$01000000,$00000101
	dc.l $00000000,$00000100,$00000000,$00000000
	dc.l $00000000,$000c000c,$0d020300,$07100102
	dc.l $0c050601,$06000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0d020300,$07100102
	dc.l $0c050601,$08000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0d020300,$07100102
	dc.l $0c050601,$0a000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0e020500,$08120109
	dc.l $0c000601,$06000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0e020500,$0812010a
	dc.l $0c000601,$08000200,$00000000,$00000000
	dc.l $00000000,$000c000c,$0e020500,$0812010b
	dc.l $0c000601,$0a000200,$00000000,$00000000

;##############################################
;22 Vism Shadow
;##############################################
loc_07baa8:
	move.b (4,a6),d0
	move.w loc_07bab4(pc,d0.w),d1
	jmp loc_07bab4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bab4:
	dc.w loc_07babc-loc_07bab4
	dc.w loc_07bb0c-loc_07bab4
	dc.w loc_07bb58-loc_07bab4
	dc.w loc_07bb8a-loc_07bab4

;==============================================
;
;==============================================
loc_07babc:
	addq.b #2,(4,a6)
	moveq #0,d0
	move.b #2,(9,a6)
	move.w #$fff,($50,a6)
	move.b d0,($5b,a6)
	move.b d0,($54,a6)
	move.b d0,(pl_hitfreeze,a6)
	st.b ($70,a6)
	move.b #1,($3e,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l ($60,a4),($60,a6)
	move.l ($88,a4),($88,a6)
	jsr loc_03323a
	jsr loc_080434
	jmp loc_080470

;==============================================
;
;==============================================
loc_07bb0c:
	movea.w ($36,a6),a4
	bsr.w loc_07bb90
	tst.b ($b9,a4)
	beq.b loc_07bb46
	tst.b ($25c,a4)
	bne.b loc_07bb56
	subq.b #1,($3a,a6)
	bpl.b loc_07bb40
	clr.b ($3a,a6)
	jsr loc_080434
	jsr loc_080470
	movea.w ($36,a6),a4
	tst.b (1,a4)
	beq.b loc_07bb56

loc_07bb40:
	jmp loc_01b4ec

loc_07bb46:
	move.b #2,(a6)
	move.l #$04000000,(4,a6)
	clr.b ($68,a6)

loc_07bb56:
	rts

;==============================================
;
;==============================================
loc_07bb58:
	movea.w ($36,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$02001000,d0
	bne.b loc_07bb80
	jsr loc_080434
	jsr loc_080470
	jmp loc_01b4ec

loc_07bb80:
	move.l #$06000000,(4,a6)
	rts

;==============================================
;
;==============================================
loc_07bb8a:
	jmp loc_01c206

;----------------------------------------------
loc_07bb90:
	move.b #2,(a6)
	move.b #1,($68,a6)
	movea.l ($1c,a6),a1
	move.b (9,a1),d6
	bne.b loc_07bbae
	st.b ($68,a6)
	clr.b ($54,a6)
	rts

loc_07bbae:
	movea.l ($a0,a6),a3
	move.b ($e,a3),d0
	cmp.b ($54,a6),d0
	beq.b loc_07bbd2
	move.b #1,(a6)
	tst.b ($5b,a6)
	beq.b loc_07bbd2
	move.b #2,(a6)
	clr.b ($5b,a6)
	move.b d0,($54,a6)

loc_07bbd2:
	rts

;##############################################
;23
;##############################################
loc_07bbd4:
	move.b (4,a6),d0
	move.w loc_07bbe0(pc,d0.w),d1
	jmp loc_07bbe0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bbe0:
	dc.w loc_07bc00-loc_07bbe0
	dc.w loc_07bc86-loc_07bbe0
	dc.w loc_07bd12-loc_07bbe0
	dc.w loc_07bd5c-loc_07bbe0

loc_07bbe8:
	dc.l $00200000
	dc.l $00200000
	dc.l $00200000

loc_07bbf4:
	dc.l $00001000
	dc.l $00001000
	dc.l $00001000

;==============================================
;
;==============================================
loc_07bc00:
	addq.b #2,(4,a6)
	move.b #2,(9,a6)
	st.b ($70,a6)
	move.w #$110,($6a,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_07be48,($60,a6)
	move.l #loc_07be40,($88,a6)
	jsr loc_03323a
	bsr.w loc_07bd92
	jsr loc_01bd5c
	moveq #0,d6
	move.b d6,($31,a6)
	move.b ($72,a6),d6
	add.w d6,d6
	move.l loc_07bbe8(pc,d6.w),d0
	move.l loc_07bbf4(pc,d6.w),d1
	moveq #-$40,d2
	tst.b ($b,a6)
	bne.b loc_07bc62
	neg.l d0
	neg.l d1
	move.w #$1c0,d2

loc_07bc62:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	add.w ($10,a3),d2
	move.w d2,($10,a6)
	move.w #$100,($14,a6)
	moveq #4,d0
	jsr loc_0331d0
	moveq #0,d0
	bra.w loc_07bc86

;==============================================
;
;==============================================
loc_07bc86:
	move.b (5,a6),d0
	move.w loc_07bc92(pc,d0.w),d1
	jmp loc_07bc92(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bc92:
	dc.w loc_07bc9c-loc_07bc92
	dc.w loc_07bcc6-loc_07bc92
	dc.w loc_07bcc6-loc_07bc92
	dc.w loc_07bcc6-loc_07bc92
	dc.w loc_07bcc6-loc_07bc92

;----------------------------------------------
loc_07bc9c:
	movea.w ($36,a6),a4
	bsr.w loc_07bdb4
	bne.b loc_07bcc0
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jsr loc_033210
	bsr.w loc_07bd70

loc_07bcc0:
	jmp loc_01b4ec

;----------------------------------------------
loc_07bcc6:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07bcdc
	move.b (6,a6),d0
	move.w loc_07bce2(pc,d0.w),d1
	jsr loc_07bce2(pc,d1.w)

loc_07bcdc:
	jmp loc_01b4ec


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bce2:
	dc.w loc_07bce6-loc_07bce2
	dc.w loc_07bcfa-loc_07bce2

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07bce6:
	addq.b #2,(6,a6)
	bsr.w loc_07bd92
	move.b #3,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07bcfa:
	subq.b #1,($3a,a6)
	bne.b loc_07bd0c
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_07bd0c:
	jmp loc_033210

;==============================================
;
;==============================================
loc_07bd12:
	move.b (5,a6),d0
	move.w loc_07bd1e(pc,d0.w),d1
	jmp loc_07bd1e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bd1e:
	dc.w loc_07bd22-loc_07bd1e
	dc.w loc_07bd32-loc_07bd1e

;----------------------------------------------
loc_07bd22:
	addq.b #2,(5,a6)
	move.b #2,(a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)

;----------------------------------------------
loc_07bd32:
	movea.w ($36,a6),a4
	bsr.w loc_07bdb4
	bne.b loc_07bd56
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	jsr loc_033210
	bsr.w loc_07bd70

loc_07bd56:
	jmp loc_01b4ec

;==============================================
;
;==============================================
loc_07bd5c:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_07bd6a
	clr.w ($a4,a4)

loc_07bd6a:
	jmp loc_01c206

;==============================================
loc_07bd70:
	jsr loc_01bd5c
	move.w ($10,a6),d0
	sub.w ($10,a3),d0
	addi.w #$840,d0
	cmpi.w #$1200,d0
	bls.b loc_07bd90
	move.l #$06000000,(4,a6)

loc_07bd90:
	rts

;----------------------------------------------
loc_07bd92:
	lea.l loc_07be82(pc),a0
	move.b ($72,a6),d0
	beq.b loc_07bdaa
	lea.l loc_07becc(pc),a0
	cmpi.b #2,d0
	beq.b loc_07bdaa
	lea.l loc_07bf16(pc),a0

loc_07bdaa:
	move.l a0,($60,a6)
	jmp loc_03323a

;#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
;
;#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
loc_07bdb4:
	moveq #0,d0
	move.b ($101,a4),d0
	add.w d0,d0
	move.w loc_07bdc4(pc,d0.w),d1
	jmp loc_07bdc4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bdc4:
	dc.w loc_07bdcc-loc_07bdc4
	dc.w loc_07bdec-loc_07bdc4
	dc.w loc_07be08-loc_07bdc4
	dc.w loc_07be24-loc_07bdc4

;==============================================
loc_07bdcc:
	move.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	or.b (pause_check,a5),d0
	beq.b loc_07bde6
	tst.b ($4ab,a5)
	bne.b loc_07bde8
	moveq #1,d0

loc_07bde6:
	rts

loc_07bde8:
	moveq #0,d0
	rts

;==============================================
loc_07bdec:
	move.b ($4ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	or.b (pause_check,a5),d0
	beq.b loc_07be06
	tst.b ($8ab,a5)
	bne.b loc_07bde8
	moveq #1,d0

loc_07be06:
	rts

;==============================================
loc_07be08:
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($10ab,a5),d0
	or.b (pause_check,a5),d0
	beq.b loc_07be22
	tst.b ($cab,a5)
	bne.b loc_07bde8
	moveq #1,d0

loc_07be22:
	rts

;==============================================
loc_07be24:
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b (pause_check,a5),d0
	beq.b loc_07be3e
	tst.b ($10ab,a5)
	bne.b loc_07bde8
	moveq #1,d0

loc_07be3e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07be40:
	dc.l $00000000
	dc.l $01000000

loc_07be48:
	dc.w loc_07be52-loc_07be48
	dc.w loc_07be52-loc_07be48
	dc.w loc_07be52-loc_07be48
	dc.w loc_07be52-loc_07be48
	dc.w loc_07be62-loc_07be48

loc_07be52:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0028,$ff90,$0028,$0070

loc_07be62:
	dc.l $00000000,$00000000,$10020b00,$00180104
	dc.l $01000602,$0c040c09,$00070028,$00000000

loc_07be82:
	dc.w loc_07be52-loc_07be82
	dc.w loc_07be52-loc_07be82
	dc.w loc_07be52-loc_07be82
	dc.w loc_07be52-loc_07be82
	dc.w loc_07be8c-loc_07be82

loc_07be8c:
	dc.l $00000000,$00000000,$10020b00,$00180104
	dc.l $01000602,$0c040a09,$00070028,$00000000
	dc.l $0028ff90,$00280070,$10020b00,$00180104
	dc.l $01000602,$0c040a09,$00070028,$00000000

loc_07becc:
	dc.w loc_07be52-loc_07becc
	dc.w loc_07be52-loc_07becc
	dc.w loc_07be52-loc_07becc
	dc.w loc_07be52-loc_07becc
	dc.w loc_07bed6-loc_07becc

loc_07bed6:
	dc.l $00000000,$00000000,$10020b00,$00180104
	dc.l $01000602,$0c040b09,$00070028,$00000000
	dc.l $0028ff90,$00280070,$10020b00,$00180104
	dc.l $01000602,$0c040b09,$00070028,$00000000

loc_07bf16:
	dc.w loc_07be52-loc_07bf16
	dc.w loc_07be52-loc_07bf16
	dc.w loc_07be52-loc_07bf16
	dc.w loc_07be52-loc_07bf16
	dc.w loc_07bf20-loc_07bf16

loc_07bf20:
	dc.l $00000000,$00000000,$10020b00,$00180104
	dc.l $01000602,$0c040c09,$00070028,$00000000
	dc.l $0028ff90,$00280070,$10020b00,$00180104
	dc.l $01000602,$0c040c09,$00070028,$00000000

;##############################################
;24 Cody Tornado
;##############################################
loc_07bf60:
	move.b (4,a6),d0
	move.w loc_07bf6c(pc,d0.w),d1
	jmp loc_07bf6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bf6c:
	dc.w loc_07bf74-loc_07bf6c
	dc.w loc_07bfdc-loc_07bf6c
	dc.w loc_07c06e-loc_07bf6c
	dc.w loc_07c0ac-loc_07bf6c

;==============================================
;
;==============================================
loc_07bf74:
	addq.b #2,(4,a6)
	clr.b (9,a6)
	st.b ($70,a6)
	movea.w ($36,a6),a4
	move.l ($18,a4),($18,a6)
	move.l #loc_07c0f8,($60,a6)
	move.l #loc_07c0f0,($88,a6)
	jsr loc_03323a
	bsr.w loc_07c0c0
	moveq #0,d0
	move.b d0,($31,a6)
	move.l d0,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	move.b ($72,a6),d0
	lsr.b #1,d0
	move.b d0,($3c,a6)
	moveq #-$3c,d0
	tst.b ($b,a6)
	beq.b loc_07bfce
	neg.w d0

loc_07bfce:
	add.w d0,($10,a6)
	moveq #6,d0
	jsr loc_0331d0
	moveq #0,d0

;==============================================
;
;==============================================
loc_07bfdc:
	move.b (5,a6),d0
	move.w loc_07bfe8(pc,d0.w),d1
	jmp loc_07bfe8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07bfe8:
	dc.w loc_07bff2-loc_07bfe8
	dc.w loc_07c026-loc_07bfe8
	dc.w loc_07c026-loc_07bfe8
	dc.w loc_07c026-loc_07bfe8
	dc.w loc_07c026-loc_07bfe8

;----------------------------------------------
loc_07bff2:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07c020
	movea.w ($36,a6),a4
	tst.b ($23b,a4)
	bne.b loc_07c012
	tst.b ($33,a6)
	bpl.b loc_07c01a
	subq.b #1,($3c,a6)
	bpl.b loc_07c01a

loc_07c012:
	addq.b #2,(4,a6)
	move.b #2,(a6)

loc_07c01a:
	jsr loc_033210

loc_07c020:
	jmp loc_01b4d0

;----------------------------------------------
loc_07c026:
	move.b ($125,a5),d0
	or.b (pause_check,a5),d0
	bne.b loc_07c03c
	move.b (6,a6),d0
	move.w loc_07c042(pc,d0.w),d1
	jsr loc_07c042(pc,d1.w)

loc_07c03c:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c042:
	dc.w loc_07c046-loc_07c042
	dc.w loc_07c05a-loc_07c042

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c046:
	addq.b #2,(6,a6)
	bsr.w loc_07c0c0
	move.b #2,($3a,a6)
	jmp loc_033210

;+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
loc_07c05a:
	subq.b #1,($3a,a6)
	bne.b loc_07c06c
	move.b #1,(a6)
	move.l #$02000000,(4,a6)

loc_07c06c:
	rts

;==============================================
;
;==============================================
loc_07c06e:
	move.b (5,a6),d0
	move.w loc_07c080(pc,d0.w),d1
	jsr loc_07c080(pc,d1.w)
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c080:
	dc.w loc_07c084-loc_07c080
	dc.w loc_07c098-loc_07c080

;----------------------------------------------
loc_07c084:
	addq.b #2,(5,a6)
	movea.w ($36,a6),a4
	clr.w ($a4,a4)
	moveq #7,d0
	jmp loc_0331d0

;----------------------------------------------
loc_07c098:
	tst.b ($33,a6)
	bpl.b loc_07c0a6
	move.l #$06000000,(4,a6)

loc_07c0a6:
	jmp loc_033210

;==============================================
;
;==============================================
loc_07c0ac:
	movea.w ($36,a6),a4
	subq.b #1,($238,a4)
	bne.b loc_07c0ba
	clr.w ($a4,a4)

loc_07c0ba:
	jmp loc_01c206

;----------------------------------------------
loc_07c0c0:
	lea.l loc_07c132(pc),a0
	move.b ($72,a6),d0
	beq.b loc_07c0d8
	lea.l loc_07c216(pc),a0
	cmpi.b #2,d0
	beq.b loc_07c0d8
	lea.l loc_07c346(pc),a0

loc_07c0d8:
	move.w ($50,a6),d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	move.l a0,($60,a6)
	jmp loc_03323a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c0f0:
	dc.l $00000000
	dc.l $01000000

loc_07c0f8:
	dc.w loc_07c102-loc_07c0f8
	dc.w loc_07c102-loc_07c0f8
	dc.w loc_07c102-loc_07c0f8
	dc.w loc_07c102-loc_07c0f8
	dc.w loc_07c112-loc_07c0f8

loc_07c102:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0030,$0014,$0030

loc_07c112:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000200,$0e000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c132:
	dc.w loc_07c138-loc_07c132
	dc.w loc_07c142-loc_07c132
	dc.w loc_07c14c-loc_07c132

loc_07c138:
	dc.w loc_07c102-loc_07c138
	dc.w loc_07c102-loc_07c138
	dc.w loc_07c102-loc_07c138
	dc.w loc_07c102-loc_07c138
	dc.w loc_07c156-loc_07c138

loc_07c142:
	dc.w loc_07c102-loc_07c142
	dc.w loc_07c102-loc_07c142
	dc.w loc_07c102-loc_07c142
	dc.w loc_07c102-loc_07c142
	dc.w loc_07c196-loc_07c142

loc_07c14c:
	dc.w loc_07c102-loc_07c14c
	dc.w loc_07c102-loc_07c14c
	dc.w loc_07c102-loc_07c14c
	dc.w loc_07c102-loc_07c14c
	dc.w loc_07c1d6-loc_07c14c

loc_07c156:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$02031100,$000d0104
	dc.l $0c020001,$06000200,$00000000,$00000000

loc_07c196:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$02031100,$00100104
	dc.l $0c010001,$06000200,$00000000,$00000000

loc_07c1d6:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000200,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$02031100,$00110104
	dc.l $0c010601,$06000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c216:
	dc.w loc_07c21e-loc_07c216
	dc.w loc_07c228-loc_07c216
	dc.w loc_07c232-loc_07c216
	dc.w loc_07c23c-loc_07c216

loc_07c21e:
	dc.w loc_07c102-loc_07c21e
	dc.w loc_07c102-loc_07c21e
	dc.w loc_07c102-loc_07c21e
	dc.w loc_07c102-loc_07c21e
	dc.w loc_07c246-loc_07c21e

loc_07c228:
	dc.w loc_07c102-loc_07c228
	dc.w loc_07c102-loc_07c228
	dc.w loc_07c102-loc_07c228
	dc.w loc_07c102-loc_07c228
	dc.w loc_07c286-loc_07c228

loc_07c232:
	dc.w loc_07c102-loc_07c232
	dc.w loc_07c102-loc_07c232
	dc.w loc_07c102-loc_07c232
	dc.w loc_07c102-loc_07c232
	dc.w loc_07c2c6-loc_07c232

loc_07c23c:
	dc.w loc_07c102-loc_07c23c
	dc.w loc_07c102-loc_07c23c
	dc.w loc_07c102-loc_07c23c
	dc.w loc_07c102-loc_07c23c
	dc.w loc_07c306-loc_07c23c

loc_07c246:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c020001,$08000200,$00000000,$00000000

loc_07c286:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c010001,$08000200,$00000000,$00000000

loc_07c2c6:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c010001,$08000200,$00000000,$00000000

loc_07c306:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000200,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03001100,$000d0104
	dc.l $0c010601,$08000200,$00000000,$00000000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_07c346:
	dc.w loc_07c350-loc_07c346
	dc.w loc_07c35a-loc_07c346
	dc.w loc_07c364-loc_07c346
	dc.w loc_07c36e-loc_07c346
	dc.w loc_07c378-loc_07c346

loc_07c350:
	dc.w loc_07c102-loc_07c350
	dc.w loc_07c102-loc_07c350
	dc.w loc_07c102-loc_07c350
	dc.w loc_07c102-loc_07c350
	dc.w loc_07c382-loc_07c350

loc_07c35a:
	dc.w loc_07c102-loc_07c35a
	dc.w loc_07c102-loc_07c35a
	dc.w loc_07c102-loc_07c35a
	dc.w loc_07c102-loc_07c35a
	dc.w loc_07c3c2-loc_07c35a

loc_07c364:
	dc.w loc_07c102-loc_07c364
	dc.w loc_07c102-loc_07c364
	dc.w loc_07c102-loc_07c364
	dc.w loc_07c102-loc_07c364
	dc.w loc_07c402-loc_07c364

loc_07c36e:
	dc.w loc_07c102-loc_07c36e
	dc.w loc_07c102-loc_07c36e
	dc.w loc_07c102-loc_07c36e
	dc.w loc_07c102-loc_07c36e
	dc.w loc_07c442-loc_07c36e

loc_07c378:
	dc.w loc_07c102-loc_07c378
	dc.w loc_07c102-loc_07c378
	dc.w loc_07c102-loc_07c378
	dc.w loc_07c102-loc_07c378
	dc.w loc_07c482-loc_07c378

loc_07c382:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c000001,$0a000200,$00000000,$00000000

loc_07c3c2:
	dc.l $00000000,$00000000,$01030000,$00000104
	dc.l $0c000001,$0a000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c000000,$0e000200,$00000000,$00000000

loc_07c402:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c000001,$0a000200,$00000000,$00000000

loc_07c442:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $0c000000,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c000001,$0a000200,$00000000,$00000000

loc_07c482:
	dc.l $00000000,$00000000,$01000000,$00000104
	dc.l $01000200,$0e000200,$00000000,$00000000
	dc.l $00000038,$00140018,$03031100,$000d0104
	dc.l $0c000601,$0a000200,$00000000,$00000000
