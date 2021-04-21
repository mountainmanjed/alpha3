;##############################################
;
;##############################################
loc_051de2:
	tst.b ($13f,a5)
	bne.w loc_051e1c
	cmpi.w #$1e,(stageid,a5)
	bne.w loc_051e1c
	tst.w (-$7ec8,a6)
	bne.w loc_051e1c
	jsr loc_01c2c8
	beq.b loc_051e1c
	addq.b #1,(a4)
	move.b #$46,(2,a4)
	move.w a6,($36,a4)
	move.b ($101,a6),($5a,a4)
	move.b ($59,a6),($59,a4)

loc_051e1c:
	rts

;##############################################
;
;##############################################
loc_051e1e:
	move.b (6,a6),d0
	move.w loc_051e2a(pc,d0.w),d1
	jmp loc_051e2a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051e2a:
	dc.w loc_051e2e-loc_051e2a
	dc.w loc_051e70-loc_051e2a

;----------------------------------------------
loc_051e2e:
	addq.b #2,(6,a6)
	jsr loc_01c2c8
	beq.b loc_051e70
	addq.b #1,(a4)
	move.b #$21,($2,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b ($e,a6),($e,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.b #6,($9,a4)
	move.l ($18,a6),($18,a4)
	move.b ($b,a6),($b,a4)

;----------------------------------------------
loc_051e70:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;Normals
;##############################################
loc_051e88:
	move.b ($80,a6),d0
	move.w loc_051e94(pc,d0.w),d1
	jmp loc_051e94(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051e94:
	dc.w loc_051e9a-loc_051e94
	dc.w loc_052108-loc_051e94
	dc.w loc_052546-loc_051e94

;==============================================
loc_051e9a:
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_05205a
	move.b ($82,a6),d0
	move.w loc_051eb2(pc,d0.w),d1
	jmp loc_051eb2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051eb2:
	dc.w loc_051eb8-loc_051eb2
	dc.w loc_051fee-loc_051eb2
	dc.w loc_051fee-loc_051eb2

;----------------------------------------------
loc_051eb8:
	move.b (7,a6),d0
	move.w loc_051ec4(pc,d0.w),d1
	jmp loc_051ec4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051ec4:
	dc.w loc_051ece-loc_051ec4
	dc.w loc_051f96-loc_051ec4
	dc.w loc_051f9c-loc_051ec4
	dc.w loc_051fa0-loc_051ec4
	dc.w loc_051fd6-loc_051ec4

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_051ece:
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($125,a6)
	bne.w loc_051f54
	cmpi.b #$ff,($132,a6)
	beq.w loc_051f54
	addq.b #2,(7,a6)
	clr.b ($1f9,a6)
	btst.b #1,($83,a6)
	beq.b loc_051f18
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #0,d0
	add.b d1,d0
	bra.b loc_051f4e

loc_051f18:
	btst.b #0,($83,a6)
	beq.b loc_051f44
	btst.b #0,($370,a6)
	beq.b loc_051f44
	cmpi.b #1,($132,a6)
	beq.b loc_051f44
	move.b #6,(7,a6)
	move.b #$20,($1f7,a6)
	moveq #$37,d0
	jmp loc_02a710

loc_051f44:
	addq.b #2,(7,a6)
	st.b ($1f9,a6)
	moveq #$18,d0

loc_051f4e:
	jmp loc_02a710

loc_051f54
	move.b #4,(7,a6)
	st.b ($1f9,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.w d1,d0
	jsr loc_02ef6c
	moveq #$18,d0
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_051f90(pc,d3.w),d3
	cmp.w d2,d3
	bcc.b loc_051f88
	moveq #0,d0
	clr.b ($1f9,a6)

loc_051f88:
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051f90:
	dc.w $004d,$0042,$0047

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_051f96:
	jmp loc_02f5ac

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_051f9c:
	bra.w loc_053f38

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_051fa0:
	subq.b #1,($1f7,a6)
	bpl.b loc_051fbe
	addq.b #2,(7,a6)
	moveq #$38,d0
	jsr loc_02a710
	clr.b ($1fb,a6)
	clr.b ($35,a6)
	bra.w loc_052d7a

loc_051fbe:
	btst.b #0,($370,a6)
	bne.w loc_053dd8
	move.b #2,(7,a6)
	moveq #$18,d0
	jmp loc_02a710

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_051fd6:
	cmpi.b #1,($35,a6)
	beq.w loc_053f38
	move.b #4,(7,a6)
	move.b #0,($2a0,a6)
	rts

;----------------------------------------------
loc_051fee:
	move.b (7,a6),d0
	move.w loc_051ffa(pc,d0.w),d1
	jmp loc_051ffa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_051ffa:
	dc.w loc_052000-loc_051ffa
	dc.w loc_051f96-loc_051ffa
	dc.w loc_051f9c-loc_051ffa

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
loc_052000:
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($125,a6)
	bne.w loc_051f54
	cmpi.b #$ff,($132,a6)
	beq.w loc_051f54
	addq.b #2,(7,a6)
	clr.b ($1f9,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	btst.b #0,($83,a6)
	bne.b loc_052048
	moveq #0,d0
	bra.b loc_052052

loc_052048:
	addq.b #2,(7,a6)
	st.b ($1f9,a6)
	moveq #$18,d0

loc_052052:
	add.b d1,d0
	jmp loc_02a710

;==============================================
loc_05205a:
	move.b (7,a6),d0
	move.w loc_052066(pc,d0.w),d1
	jmp loc_052066(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052066:
	dc.w loc_05206c-loc_052066
	dc.w loc_051f96-loc_052066
	dc.w loc_051f9c-loc_052066

;----------------------------------------------
loc_05206c:
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($125,a6)
	bne.w loc_0520c6
	cmpi.b #$ff,($132,a6)
	beq.w loc_0520c6
	addq.b #2,(7,a6)
	clr.b ($1f9,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	btst.b #0,($83,a6)
	bne.b loc_0520b4
	moveq #3,d0
	bra.b loc_0520be

loc_0520b4:
	addq.b #2,(7,a6)
	st.b ($1f9,a6)
	moveq #$1b,d0

loc_0520be:
	add.b d1,d0
	jmp loc_02a710

loc_0520c6:
	move.b #4,(7,a6)
	st.b ($1f9,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.w d1,d0
	jsr loc_02ef6c
	moveq #$1b,d0
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_052102(pc,d3.w),d3
	cmp.w d2,d3
	bcc.b loc_0520fa
	moveq #3,d0
	clr.b ($1f9,a6)

loc_0520fa:
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052102:
	dc.w $0069,$0067,$0051

;==============================================
loc_052108:
	move.b #1,($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_0521c4
	move.b (7,a6),d0
	move.w loc_052122(pc,d0.w),d1
	jmp loc_052122(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052122:;336162
	dc.w loc_052128-loc_052122
	dc.w loc_051f96-loc_052122
	dc.w loc_051f9c-loc_052122

;----------------------------------------------
loc_052128:
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($125,a6)
	bne.w loc_052182
	cmpi.b #$ff,($132,a6)
	beq.w loc_052182
	addq.b #2,(7,a6)
	clr.b ($1f9,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	btst.b #0,($83,a6)
	bne.b loc_052170
	moveq #6,d0
	bra.b loc_05217a

loc_052170:
	addq.b #2,(7,a6)
	st.b ($1f9,a6)
	moveq #$1e,d0

loc_05217a:
	add.b d1,d0
	jmp loc_02a710

loc_052182:
	move.b #4,(7,a6)
	st.b ($1f9,a6)
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	move.w d1,d0
	jsr loc_02ef6c
	moveq #$1e,d0
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_0521be(pc,d3.w),d3
	cmp.w d2,d3
	bcc.b loc_0521b6
	moveq #6,d0
	clr.b ($1f9,a6)

loc_0521b6:
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0521be:
	dc.w $0056,$0056,$0056

;==============================================
loc_0521c4:
	move.b (7,a6),d0
	move.w loc_0521d0(pc,d0.w),d1
	jmp loc_0521d0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0521d0:
	dc.w loc_0521dc-loc_0521d0
	dc.w loc_051f9c-loc_0521d0
	dc.w loc_052282-loc_0521d0
	dc.w loc_0522c4-loc_0521d0
	dc.w loc_0522d4-loc_0521d0
	dc.w loc_052302-loc_0521d0

;----------------------------------------------
loc_0521dc:
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	tst.b ($125,a6)
	bne.w loc_05223a
	cmpi.b #$ff,($132,a6)
	beq.w loc_05223a
	addq.b #2,(7,a6)
	clr.b ($1f9,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #9,d0
	btst.b #0,($83,a6)
	beq.b loc_052228
	addi.b #$18,d0
	bra.b loc_052232

loc_052228:
	move.b #4,(7,a6)
	st.b ($1f9,a6)

loc_052232:
	add.b d1,d0
	jmp loc_02a710

loc_05223a:
	move.b #2,(7,a6)
	st.b ($1f9,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.w d0,d1
	jsr loc_02ef6c
	moveq #$21,d0
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_05227c(pc,d3.w),d3
	cmp.w d2,d3
	bcc.b loc_052274
	move.b #4,(7,a6)
	moveq #9,d0
	clr.b ($1f9,a6)

loc_052274:
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05227c:
	dc.w $0056,$0056,$0056

;----------------------------------------------
loc_052282:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	add.w d0,d0
	move.l loc_0522b8(pc,d0.w),d0
	move.l #$ffff0000,d1
	tst.b ($b,a6)
	bne.b loc_0522aa
	neg.l d0
	neg.l d1

loc_0522aa:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0522b8:
	dc.l $00080000,$000a0000,$000c0000

;----------------------------------------------
loc_0522c4:
	tst.b ($35,a6)
	beq.b loc_0522ce
	addq.b #2,(7,a6)

loc_0522ce:
	jmp loc_02a7ea

;----------------------------------------------
loc_0522d4:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$34,d0
	jmp loc_02a710

;----------------------------------------------
loc_052302:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02bb26

;##############################################
;Air Normals
;##############################################
loc_052310:
	move.b #6,(7,a6)
	move.b #1,($a9,a6)
	move.b #4,($80,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	tst.b ($81,a6)
	bne.w loc_052440
	tst.b ($125,a6)
	bne.w loc_0523c4
	cmpi.b #$ff,($132,a6)
	beq.w loc_0523c4
	moveq #$c,d0
	tst.b ($3c,a6)
	beq.b loc_05235a
	moveq #$12,d0

loc_05235a:
	btst.b #3,($83,a6)
	bne.b loc_0523a6
	btst.b #2,($83,a6)
	bne.b loc_052378
	btst.b #0,($83,a6)
	beq.b loc_0523a6
	addi.b #$18,d0
	bra.b loc_0523a6

loc_052378:
	cmpi.b #4,($82,a6)
	bne.b loc_0523a6
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bhi.b loc_0523a6
	move.l #$02000a00,(4,a6)
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$30,d0
	jmp loc_02a710

loc_0523a6:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr loc_02a710
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02ef6c

loc_0523c4:
	btst.b #2,($83,a6)
	beq.b loc_0523fa
	cmpi.b #4,($82,a6)
	bne.b loc_0523fa
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bhi.b loc_0523fa
	move.l #$02000a00,(4,a6)
	moveq #2,d0
	jsr loc_02ef6c
	moveq #$30,d0
	jmp loc_02a710

loc_0523fa:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.w d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	tst.b ($3c,a6)
	beq.b loc_052414
	moveq #$12,d0

loc_052414:
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_05243a(pc,d3.w),d3
	cmp.w d2,d3
	bcs.b loc_05242a
	addi.b #$18,d0

loc_05242a:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05243a:
	dc.w $0020,$0048,$0040

;----------------------------------------------
loc_052440:
	tst.b ($125,a6)
	bne.w loc_0524c8
	cmpi.b #$ff,($132,a6)
	beq.w loc_0524c8
	moveq #$f,d0
	tst.b ($3c,a6)
	beq.b loc_05245c
	moveq #$15,d0

loc_05245c:
	btst.b #3,($83,a6)
	bne.b loc_0524aa
	btst.b #2,($83,a6)
	bne.b loc_05247a
	btst.b #0,($83,a6)
	beq.b loc_0524aa
	addi.b #$18,d0
	bra.b loc_0524aa

loc_05247a:
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bhi.b loc_0524aa
	move.l #$02000a00,(4,a6)
	moveq #2,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$31,d0
	jmp loc_02a710

loc_0524aa:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jsr loc_02a710
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	jmp loc_02ef6c

loc_0524c8:
	btst.b #2,($83,a6)
	beq.b loc_052500
	move.w ($64,a6),d1
	addi.w #$30,d1
	cmp.w ($14,a6),d1
	bhi.b loc_052500
	move.l #$02000a00,(4,a6)
	moveq #2,d0
	jsr loc_02ef6c
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$31,d0
	jmp loc_02a710

loc_052500:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.w d0,d1
	jsr loc_02ef6c
	moveq #$f,d0
	tst.b ($3c,a6)
	beq.b loc_05251a
	moveq #$15,d0

loc_05251a:
	move.w ($21c,a6),d2
	moveq #0,d3
	move.b ($82,a6),d3
	move.w loc_052540(pc,d3.w),d3
	cmp.w d2,d3
	bcs.b loc_052530
	addi.b #$18,d0

loc_052530:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052540:
	dc.w $004c,$0050,$003c

;==============================================
;Drills
;==============================================
loc_052546:
	move.b (7,a6),d0
	move.w loc_052552(pc,d0.w),d1
	jmp loc_052552(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052552:
	dc.w loc_052558-loc_052552
	dc.w loc_05259a-loc_052552
	dc.w loc_0525da-loc_052552

;----------------------------------------------
loc_052558:
	addq.b #2,(7,a6)
	moveq #0,d2
	tst.b ($81,a6)
	beq.b loc_05256a
	move.b ($82,a6),d2
	lsl.w #2,d2

loc_05256a:
	move.l loc_052582(pc,d2.w),d0
	move.l loc_052582+4(pc,d2.w),($44,a6)
	tst.b ($b,a6)
	bne.b loc_05257c
	neg.l d0

loc_05257c:
	move.l d0,($40,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052582:
	dc.l $00054000,$fffe1000
	dc.l $00034000,$fffd2000
	dc.l $00014000,$fffc3000

;----------------------------------------------
loc_05259a:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_053dd8
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	jsr loc_00369c
	clr.b ($31,a6)
	clr.b ($a9,a6)
	move.b #8,($3b,a6)
	moveq #$10,d0
	jmp loc_02a708

;----------------------------------------------
loc_0525da:
	subq.b #1,($3b,a6)
	bne.w loc_053dd8
	jmp loc_02baf2

;##############################################
;Special Move Inputs
;##############################################
loc_0525e8:
	tst.b ($31,a6)
	bne.b loc_0525f2
	clr.b ($1f6,a6)

loc_0525f2:
	jsr loc_02e096
	bne.w loc_052744

loc_0525fc:
	lea.l ($1c0,a6),a4
	jsr loc_02d6d2
	bne.w loc_0527ec

loc_05260a:
	lea.l ($1b8,a6),a4
	jsr loc_02d69a
	bne.w loc_052832

loc_052618:
	lea.l ($1b0,a6),a4
	jsr loc_02d6ba
	bne.w loc_0527a8

loc_052626:
	lea.l ($1c8,a6),a4
	jsr loc_02d6c2
	bne.w loc_052868

loc_052634:
	lea.l ($180,a6),a4
	jsr loc_02d682
	bne.w loc_052932

loc_052642:
	lea.l ($188,a6),a4
	jsr loc_02d68a
	bne.w loc_052980

loc_052650:
	tst.b ($132,a6)
	bpl.b loc_052674
	lea.l ($1d0,a6),a4
	jsr loc_02d662
	bne.w loc_052a82

loc_052664:
	lea.l ($1d8,a6),a4
	jsr loc_02d66a
	bne.w loc_052ade

loc_052672:
	bra.b loc_052690

loc_052674:
	lea.l ($198,a6),a4
	jsr loc_02d672
	bne.w loc_052a40

loc_052682:
	lea.l ($1a0,a6),a4
	jsr loc_02d67a
	bne.w loc_052a9c

loc_052690:
	lea.l ($190,a6),a4
	jsr loc_02d5ea
	bne.w loc_0529f2

loc_05269e:
	lea.l ($1a8,a6),a4
	jsr loc_02d632
	bne.w loc_05271a

loc_0526ac:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_0528ac

loc_0526ba:
	jsr loc_02e0cc
	bne.w loc_0526c6

loc_0526c4:
	rts

;----------------------------------------------
;Move ID writes
loc_0526c6:
	tst.b ($b9,a6)
	bne.b loc_0526d2
	tst.b ($bc,a6)
	beq.b loc_0526c4

loc_0526d2:
	tst.b ($31,a6)
	bne.b loc_0526f6
	jsr loc_02ed00
	beq.b loc_0526c4
	move.l #$02000e00,(4,a6)
	move.b #$14,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

loc_0526f6:
	tst.w ($44,a6)
	blt.b loc_0526c4
	jsr loc_02ed28
	beq.b loc_0526c4
	move.l #$02000e00,(4,a6)
	move.b #$16,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;----------------------------------------------
loc_05271a:
	tst.b ($132,a6)
	bmi.b loc_0526ac
	tst.b ($258,a6)
	bne.b loc_0526ac
	jsr loc_02eea6
	beq.w loc_0526ac
	move.l #$02000e00,(4,a6)
	move.b #$c,($aa,a6)
	clr.b ($a9,a6)
	rts

;----------------------------------------------
loc_052744:
	tst.b ($28a,a6)
	bne.w loc_0525fc
	tst.b ($31,a6)
	bne.w loc_052782
	jsr loc_02ef54
	beq.w loc_0525fc
	jsr loc_02ecd8
	beq.w loc_0525fc
	move.l #$02001000,(4,a6)
	move.b #8,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_052782:
	tst.b ($b9,a6)
	bne.w loc_0525fc
	jsr loc_02ed28
	beq.w loc_0525fc
	move.l #$02001000,(4,a6)
	move.b #8,($aa,a6)
	jmp loc_02f980

;----------------------------------------------
loc_0527a8:
	tst.b ($132,a6)
	bne.w loc_052626
	tst.b ($238,a6)
	bne.w loc_052626
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052626
	jsr loc_02ecd8
	beq.w loc_052626
	move.l #$02001000,(4,a6)
	move.b #$e,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_0527ec:
	cmpi.b #$ff,($132,a6)
	bne.w loc_05260a
	tst.b ($238,a6)
	bne.w loc_05260a
	cmpi.w #$30,($11e,a6)
	bcs.w loc_05260a
	jsr loc_02ecd8
	beq.w loc_05260a
	move.l #$02001000,(4,a6)
	move.b #$18,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_052832:
	tst.b ($132,a6)
	bne.w loc_052618
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052618
	jsr loc_02ecd8
	beq.w loc_052618
	move.l #$02001000,(4,a6)
	move.b #$10,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f4dc

;----------------------------------------------
loc_052868:
	tst.b ($132,a6)
	bne.w loc_052634
	tst.b ($238,a6)
	bne.w loc_052634
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052634
	jsr loc_02ecd8
	beq.w loc_052634
	move.l #$02001000,(4,a6)
	move.b #$1a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jmp loc_02f4bc

;----------------------------------------------
loc_0528ac:
	jsr loc_02edf8
	beq.w loc_0526ba

;##############################################
;Alpha Counter
;##############################################
loc_0528b6:
	tst.b ($132,a6)
	bne.w loc_0528f8
	move.l #$02000e00,(4,a6)
	move.b #$a,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	clr.b ($2c8,a6)
	clr.b ($5f,a6)
	move.b #$19,($25d,a6)
	movea.w ($38,a6),a4
	move.b #$15,($5f,a4)
	moveq #$16,d0
	jmp loc_02a758

;##############################################
;Alpha Counter
;##############################################
loc_0528f8:
	move.l #$02000e00,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	clr.b ($2c8,a6)
	clr.b ($5f,a6)
	move.b #$1e,($25d,a6)
	movea.w ($38,a6),a4
	move.b #$1a,($5f,a4)
	moveq #$16,d0
	jmp loc_02a758

;----------------------------------------------
loc_052932:
	tst.b ($31,a6)
	beq.b loc_052956
	cmpi.b #$ff,($132,a6)
	beq.w loc_052642
	tst.b ($1f6,a6)
	bne.w loc_052642
	jsr loc_02ed28
	beq.w loc_052642
	bra.b loc_052960

loc_052956:
	jsr loc_02ed00
	beq.w loc_052642

loc_052960:
	move.l #$2000e00,(4,a6)
	clr.b ($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($1fa,a6)
	bra.w loc_0529d2

;----------------------------------------------
loc_052980:
	tst.b ($31,a6)
	beq.b loc_0529a4
	cmpi.b #$ff,($132,a6)
	beq.w loc_052650
	tst.b ($1f6,a6)
	bne.w loc_052650
	jsr loc_02ed28
	beq.w loc_052650
	bra.b loc_0529ae

loc_0529a4:
	jsr loc_02ed00
	beq.w loc_052650

loc_0529ae:
	move.l #$02000e00,(4,a6)
	clr.b ($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	eori.b #1,($3c,a6)
	move.b #4,($1fa,a6)

loc_0529d2:
	clr.b ($82,a6)
	clr.b ($a9,a6)
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.b #7,d0
	cmpi.b #7,d0
	beq.b loc_0529f0
	addq.b #2,($1fa,a6)

loc_0529f0:
	rts

;----------------------------------------------
loc_0529f2:
	tst.b ($b9,a6)
	bne.b loc_052a02
	tst.b ($238,a6)
	bne.w loc_05269e
	bra.b loc_052a0c

loc_052a02:
	cmpi.b #2,($238,a6)
	bcc.w loc_05269e

loc_052a0c:
	jsr loc_02ed00
	beq.w loc_05269e
	move.l #$02000e00,(4,a6)
	move.b #2,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($81,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;----------------------------------------------
loc_052a40:
	tst.b ($b9,a6)
	bne.b loc_052a4e
	tst.b ($238,a6)
	bne.w loc_052682

loc_052a4e:
	jsr loc_02ed00
	beq.w loc_052682

loc_052a58:
	move.l #$02000e00,(4,a6)
	move.b #4,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($81,a6)
	move.b #1,($a9,a6)
	jmp loc_02f728

;----------------------------------------------
loc_052a82:
	tst.b ($b9,a6)
	bne.b loc_052a90
	tst.b ($238,a6)
	bne.w loc_052664

loc_052a90:
	jsr loc_02ed00
	beq.w loc_052664
	bra.b loc_052a58

;----------------------------------------------
loc_052a9c:
	tst.b ($b9,a6)
	bne.b loc_052aaa
	tst.b ($238,a6)
	bne.w loc_052690

loc_052aaa:
	jsr loc_02ed00
	beq.w loc_052690

loc_052ab4:
	move.l #$02000e00,(4,a6)
	move.b #6,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($81,a6)
	move.b #1,($a9,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_052ade:
	tst.b ($b9,a6)
	bne.b loc_052aec
	tst.b ($238,a6)
	bne.w loc_052672

loc_052aec:
	jsr loc_02ed00
	beq.w loc_052672
	bra.b loc_052ab4

;##############################################
;Ai Move Checks
;##############################################
loc_052af8:
	move.b ($aa,a6),d0
	move.w loc_052b04(pc,d0.w),d1
	jmp loc_052b04(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_052b04:
	dc.w loc_052b20-loc_052b04
	dc.w loc_052b8c-loc_052b04
	dc.w loc_052b8c-loc_052b04
	dc.w loc_052b8c-loc_052b04
	dc.w loc_052b98-loc_052b04
	dc.w loc_052b9c-loc_052b04
	dc.w loc_052be2-loc_052b04
	dc.w loc_052b58-loc_052b04

	dc.w loc_052baa-loc_052b04
	dc.w loc_052bc0-loc_052b04
	dc.w loc_052bce-loc_052b04
	dc.w loc_052bce-loc_052b04
	dc.w loc_052b76-loc_052b04
	dc.w loc_052b58-loc_052b04

;----------------------------------------------
loc_052b20:
	tst.b ($31,a6)
	beq.b loc_052b2e
	tst.b ($132,a6)
	bmi.w loc_052c16

loc_052b2e:
	move.b ($2c9,a6),($b,a6)
	move.b ($b,a6),($3c,a6)
	clr.b ($1fa,a6)
	move.b ($211,a6),d0
	beq.b loc_052b4a
	move.b #4,($1fa,a6)

loc_052b4a:
	tst.b ($81,a6)
	beq.b loc_052b54
	addq.b #2,($1fa,a6)

loc_052b54:
	bra.w loc_052c12

;==============================================
loc_052b58:
	tst.b ($132,a6)
	bne.w loc_052c16
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052c16
	tst.b ($238,a6)
	bne.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052b76:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052c16
	tst.b ($238,a6)
	bne.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052b8c:
	tst.b ($238,a6)
	bne.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052b98:
	bra.w loc_052c12

;==============================================
loc_052b9c:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052baa:
	tst.b ($132,a6)
	bne.w loc_052c16
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052bc0:
	cmpi.w #$30,($11e,a6)
	bcs.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052bce:
	tst.b ($132,a6)
	bmi.w loc_052c16
	tst.b ($bc,a6)
	beq.w loc_052c16
	bra.w loc_052c12

;==============================================
loc_052be2:
	tst.b ($132,a6)
	bmi.w loc_052c16
	cmpi.l #$02020202,(4,a6)
	bne.w loc_052c16
	tst.b ($31,a6)
	bne.w loc_052c16
	tst.b ($2ce,a6)
	bne.w loc_052c16
	tst.w ($50,a6)
	bmi.w loc_052c16
	bra.w loc_052c12

;----------------------------------------------
loc_052c12:
	moveq #1,d0
	rts

;----------------------------------------------
loc_052c16:
	moveq #0,d0
	rts

;##############################################
;
;##############################################
loc_052c1a:
	move.b ($aa,a6),d0
	move.w loc_052c26(pc,d0.w),d1
	jmp loc_052c26(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052c26:
	dc.w loc_052c42-loc_052c26;00 Teleport
	dc.w loc_052da0-loc_052c26;02 Fire
	dc.w loc_052f3c-loc_052c26;04 Flame
	dc.w loc_053020-loc_052c26;06 Blast
	dc.w loc_053120-loc_052c26;08 V Ism Activate
	dc.w loc_0531a2-loc_052c26;0a Aism AC
	dc.w loc_0531ea-loc_052c26;0c Reversal Escape
	dc.w loc_0532fe-loc_052c26;0e Inferno

	dc.w loc_053466-loc_052c26;10 Strike
	dc.w loc_053766-loc_052c26;12 Vism AC
	dc.w loc_053812-loc_052c26;14 Taunt
	dc.w loc_053854-loc_052c26;16 Air Taunt
	dc.w loc_0538f0-loc_052c26;18 Tempest
	dc.w loc_053a2e-loc_052c26;1a Stream

;==============================================
;Teleport
;==============================================
loc_052c42:
	move.b (7,a6),d0
	move.w loc_052c4e(pc,d0.w),d1
	jmp loc_052c4e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052c4e:
	dc.w loc_052c58-loc_052c4e
	dc.w loc_052c80-loc_052c4e
	dc.w loc_052ca0-loc_052c4e
	dc.w loc_052cd0-loc_052c4e
	dc.w loc_052d04-loc_052c4e

;----------------------------------------------
loc_052c58:
	addq.b #2,(7,a6)
	move.b #1,($1f6,a6)
	move.b #1,($ce,a6)
	movea.w ($38,a6),a4
	move.l ($10,a4),($1fc,a6)
	move.b #$ff,($1fb,a6)
	moveq #7,d0
	jsr loc_02a758

;----------------------------------------------
loc_052c80:
	jsr loc_02a7ea
	bsr.w loc_052d7a
	tst.b ($33,a6)
	bpl.b loc_052c9e
	addq.b #2,(7,a6)
	move.b #$10,($3b,a6)
	bra.w loc_052d46

loc_052c9e:
	rts

;----------------------------------------------
loc_052ca0:
	subq.b #1,($3b,a6)
	bne.b loc_052cc6
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b ($3c,a6),d0
	btst d0,($ac,a6)
	beq.b loc_052cbe
	st.b ($29d,a6)

loc_052cbe:
	moveq #8,d0
	jmp loc_02a758

loc_052cc6:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;----------------------------------------------
loc_052cd0:
	jsr loc_02a7ea
	bsr.w loc_052d7a
	tst.b ($33,a6)
	bpl.b loc_052d02
	addq.b #2,(7,a6)
	move.b #1,($3b,a6)
	tst.b ($31,a6)
	bne.b loc_052d02
	move.b #6,($3b,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	jmp loc_02a708

loc_052d02:
	rts

;----------------------------------------------
loc_052d04:
	jsr loc_02a7ea
	subq.b #1,($3b,a6)
	bne.b loc_052d02
	tst.b ($31,a6)
	beq.b loc_052d40
	move.l #$02000602,(4,a6)
	clr.b ($ce,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$ffffd000,($4c,a6)
	moveq #$21,d0
	jmp loc_02a708

loc_052d40:
	jmp loc_02baf2

;----------------------------------------------
loc_052d46:
	moveq #0,d0
	move.b ($1fa,a6),d0
	clr.b ($1fa,a6)
	move.w loc_052d72(pc,d0.w),d0
	tst.b ($b,a6)
	beq.b loc_052d5c
	neg.w d0

loc_052d5c:
	add.w ($1fc,a6),d0
	sub.w ($10,a6),d0
	swap d0
	asr.l #4,d0
	move.l d0,($40,a6)
	clr.w ($12,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052d72:
	dc.w $ff90,$ff10,$0070,$00e0

;==============================================
loc_052d7a:
	moveq #0,d0
	move.b ($35,a6),d0
	cmp.b ($1fb,a6),d0
	beq.b loc_052d96
	move.b d0,($1fb,a6)
	bmi.b loc_052d98
	addi.b #$18,d0
	add.b d0,d0
	move.b d0,($2a0,a6)

loc_052d96:
	rts

loc_052d98:
	move.b #0,($2a0,a6)
	rts

;==============================================
;Fire
;==============================================
loc_052da0:
	move.b (7,a6),d0
	move.w loc_052dac(pc,d0.w),d1
	jmp loc_052dac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052dac:
	dc.w loc_052db2-loc_052dac
	dc.w loc_052dda-loc_052dac
	dc.w loc_052f18-loc_052dac

;----------------------------------------------
loc_052db2:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #4,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d1
	lsr.b #1,d1
	moveq #$b,d0
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_052dda:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_052f02
	addq.b #2,(7,a6)
	move.b #5,($3a,a6)
	jsr loc_01c1c8
	beq.w loc_052f02
	addq.b #1,(a4)
	move.w #$f00,(2,a4)
	tst.b ($132,a6)
	bpl.b loc_052e10
	move.w #$1c00,(2,a4)

loc_052e10:
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	bsr.w loc_052f04
	tst.b ($b9,a6)
	beq.w loc_052f02
	move.w ($e4,a6),d0
	cmp.w ($2a6,a6),d0
	bcs.w loc_052f02
	jsr loc_01c1c8
	beq.b loc_052f02
	addq.b #1,(a4)
	move.w #$f00,(2,a4)
	tst.b ($132,a6)
	bpl.b loc_052e9e
	move.w #$1c00,(2,a4)

loc_052e9e:
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #0,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b ($2a7,a6),($dc,a4)
	bsr.w loc_052f04

loc_052f02:
	rts

;==============================================
loc_052f04:
	move.b #$c,($cc,a4)
	move.b #2,($ee,a4)
	move.b #8,($ef,a4)
	rts

;----------------------------------------------
loc_052f18:
	tst.b ($33,a6)
	bmi.w loc_053dde
	tst.b ($3a,a6)
	beq.b loc_052f30
	subq.b #1,($3a,a6)
	bne.b loc_052f36
	clr.b ($ce,a6)

loc_052f30:
	jsr loc_02f6f8

loc_052f36:
	jmp loc_02a7ea

;==============================================
;Flame
;==============================================
loc_052f3c:
	move.b (7,a6),d0
	move.w loc_052f48(pc,d0.w),d1
	jmp loc_052f48(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_052f48:
	dc.w loc_052f50-loc_052f48
	dc.w loc_052f78-loc_052f48
	dc.w loc_052ff4-loc_052f48
	dc.w loc_05300c-loc_052f48

;----------------------------------------------
loc_052f50:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d1
	lsr.b #1,d1
	moveq #$e,d0
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_052f78:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_052ff2
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_052ff2
	addq.b #1,(a4)
	move.w #$1900,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_052ff2:
	rts

;----------------------------------------------
loc_052ff4:
	tst.w ($a4,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	clr.b ($ce,a6)
	moveq #$11,d0
	jmp loc_02a758

;----------------------------------------------
loc_05300c:
	tst.b ($33,a6)
	bmi.w loc_053dde
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
;Blast
;==============================================
loc_053020:
	move.b (7,a6),d0
	move.w loc_05302c(pc,d0.w),d1
	jmp loc_05302c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05302c:
	dc.w loc_053034-loc_05302c
	dc.w loc_05305c-loc_05302c
	dc.w loc_0530e8-loc_05302c
	dc.w loc_0530fc-loc_05302c

;----------------------------------------------
loc_053034:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #6,d0
	jsr loc_02ef6c
	jsr loc_020674
	move.b ($82,a6),d1
	lsr.b #1,d1
	moveq #$12,d0
	add.b d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_05305c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_0530e6
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_0530e6
	addq.b #1,(a4)
	move.w #$1902,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	addq.b #6,($72,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #0,($50,a4)
	move.w a6,($36,a4)
	move.b #1,($247,a6)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)
	move.b #3,($3a,a6)

loc_0530e6:
	rts

;----------------------------------------------
loc_0530e8:
	tst.w ($a4,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #$15,d0
	jmp loc_02a758

;----------------------------------------------
loc_0530fc:
	tst.b ($33,a6)
	bmi.w loc_053dde
	tst.b ($3a,a6)
	beq.b loc_053114
	subq.b #1,($3a,a6)
	beq.b loc_05311a
	clr.b ($ce,a6)

loc_053114:
	jsr loc_02f6f8

loc_05311a:
	jmp loc_02a7ea

;==============================================
;V Ism Activate
;==============================================
loc_053120:
	move.b (7,a6),d0
	move.w loc_05312c(pc,d0.w),d1
	jmp loc_05312c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05312c:
	dc.w loc_053132-loc_05312c
	dc.w loc_053152-loc_05312c
	dc.w loc_053186-loc_05312c

;----------------------------------------------
loc_053132:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_05314c
	moveq #$2f,d0

loc_05314c:
	jmp loc_02a708

;----------------------------------------------
loc_053152:
	tst.b ($34,a6)
	beq.b loc_053180
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #2,d0
	moveq #$55,d1
	tst.b ($31,a6)
	beq.b loc_053176
	moveq #0,d0
	moveq #$55,d1

loc_053176:
	jsr loc_097cd6
	bsr.w loc_053f04

loc_053180:
	jmp loc_02a7ea

;----------------------------------------------
loc_053186:
	subq.b #1,($3a,a6)
	bne.w loc_053dd8
	tst.b ($31,a6)
	beq.b loc_05319c
	move.l #$02000602,(4,a6)

loc_05319c:
	jmp loc_02f796

;==============================================
;Aism AC
;==============================================
loc_0531a2:
	move.b (7,a6),d0
	move.w loc_0531ae(pc,d0.w),d1
	jmp loc_0531ae(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0531ae:
	dc.w loc_0531b4-loc_0531ae
	dc.w loc_0531cc-loc_0531ae
	dc.w loc_0531de-loc_0531ae

;----------------------------------------------
loc_0531b4:
	tst.b ($35,a6)
	beq.w loc_0531c6
	addq.b #2,(7,a6)
	jsr loc_080e8e

loc_0531c6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0531cc:
	tst.b ($33,a6)
	bpl.b loc_0531c6
	addq.b #2,(7,a6)
	moveq #$17,d0
	jmp loc_02a758

;----------------------------------------------
loc_0531de:
	tst.b ($33,a6)
	bpl.b loc_0531c6
	jmp loc_02baf2

;==============================================
;Escape
;==============================================
loc_0531ea:
	move.b (7,a6),d0
	move.w loc_0531f6(pc,d0.w),d1
	jmp loc_0531f6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0531f6:
	dc.w loc_0531fe-loc_0531f6
	dc.w loc_053250-loc_0531f6
	dc.w loc_053280-loc_0531f6
	dc.w loc_0532b8-loc_0531f6

;----------------------------------------------
loc_0531fe:
	tst.w ($44,a6)
	bmi.b loc_053230
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_053230
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d1
	add.l d1,($40,a6)
	rts

loc_053230:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($251,a6)
	move.b d0,($250,a6)
	move.b d0,($252,a6)
	move.b #0,($2a0,a6)
	moveq #2,d0
	jmp loc_02a758

;----------------------------------------------
loc_053250:
	jsr loc_02a7ea
	bsr.w loc_052d7a
	tst.b ($34,a6)
	beq.b loc_053268
	addq.b #2,(7,a6)
	bra.w loc_0532d6

loc_053268:
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcc.b loc_05327e
	move.b #0,($2a0,a6)
	jmp loc_02aa08

loc_05327e:
	rts

;----------------------------------------------
loc_053280:
	jsr loc_02a7ea
	bsr.w loc_052d7a
	tst.b ($34,a6)
	bne.b loc_0532b6
	addq.b #2,(7,a6)
	move.l ($1fc,a6),($10,a6)
	move.w ($64,a6),($14,a6)
	move.b ($2c9,a6),($b,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($5e,a6)
	clr.b ($5d,a6)

loc_0532b6:
	rts

;----------------------------------------------
loc_0532b8:
	jsr loc_02a7ea
	bsr.w loc_052d7a
	tst.b ($33,a6)
	bpl.b loc_0532d4
	move.l #$02020400,(4,a6)
	clr.b ($31,a6)

loc_0532d4:
	rts
 
;==============================================
loc_0532d6:
	move.l ($10,a6),d0
	move.l ($40,a6),d1
	move.l ($14,a6),d2
	move.l ($44,a6),d3

loc_0532e6:
	add.l d1,d0
	add.l ($48,a6),d1
	add.l d3,d2
	add.l ($4c,a6),d3
	cmp.w ($64,a6),d2
	bge.b loc_0532e6
	move.l d0,($1fc,a6)
	rts

;==============================================
;Inferno
;==============================================
loc_0532fe:
	move.b (7,a6),d0
	move.w loc_05330a(pc,d0.w),d1
	jmp loc_05330a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05330a:
	dc.w loc_053316-loc_05330a
	dc.w loc_053340-loc_05330a
	dc.w loc_05336c-loc_05330a
	dc.w loc_0533b0-loc_05330a
	dc.w loc_053430-loc_05330a
	dc.w loc_053458-loc_05330a

;----------------------------------------------
loc_053316:
	addq.b #2,(7,a6)
	move.b #$32,($3a,a6)
	move.b #1,($274,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_053340:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_053366
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_053358
	moveq #1,d0

loc_053358:
	move.b d0,($ab,a6)
	moveq #-$e,d0
	moveq #$60,d1
	jsr loc_082e36

loc_053366:
	jmp loc_02a7ea

;----------------------------------------------
loc_05336c:
	subq.b #1,($3a,a6)
	bpl.w loc_053dd8
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_05338e
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_05338e:
	move.b loc_0533ac(pc,d0.w),($25d,a6)
	move.b #$16,($3c,a6)
	moveq #$1a,d0
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0533ac:
	dc.b $04,$08,$0c,$00

;----------------------------------------------
loc_0533b0:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05342e
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_05342e
	addq.b #1,(a4)
	move.w #$1b00,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($3f,a6),($3f,a4)
	move.b ($82,a6),($72,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$a,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w #$ff,($50,a4)
	move.w a6,($36,a4)
	move.b #$16,($3c,a4)

loc_05342e:
	rts

;----------------------------------------------
loc_053430:
	jsr loc_02a7ea
	tst.b ($33,a6)
	bpl.b loc_053456
	addq.b #2,(7,a6)
	clr.b ($274,a6)
	moveq #$27,d0
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.b #1,d1
	add.b d1,d0
	jmp loc_02a758

loc_053456:
	rts

;----------------------------------------------
loc_053458:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;==============================================
;Strike
;==============================================
loc_053466:
	move.b (7,a6),d0
	move.w loc_053472(pc,d0.w),d1
	jmp loc_053472(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053472:
	dc.w loc_05348c-loc_053472
	dc.w loc_0534b0-loc_053472
	dc.w loc_0534e0-loc_053472
	dc.w loc_053510-loc_053472
	dc.w loc_05354c-loc_053472
	dc.w loc_0535de-loc_053472
	dc.w loc_053610-loc_053472
	dc.w loc_05361e-loc_053472

	dc.w loc_053654-loc_053472
	dc.w loc_05368c-loc_053472
	dc.w loc_0536d6-loc_053472
	dc.w loc_05372a-loc_053472
	dc.w loc_053758-loc_053472

;----------------------------------------------
loc_05348c:
	addq.b #2,(7,a6)
	move.b #$32,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$1e,d0
	jmp loc_02a758

;----------------------------------------------
loc_0534b0:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_0534da
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_0534cc
	moveq #1,d0

loc_0534cc:
	move.b d0,($ab,a6)
	moveq #0,d0
	moveq #$61,d1
	jsr loc_082e36

loc_0534da:
	jmp loc_02a7ea

;----------------------------------------------
loc_0534e0:
	subq.b #1,($3a,a6)
	bpl.b loc_053506
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_053500
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_053500:
	move.b loc_05350c(pc,d0.w),($25d,a6)

loc_053506:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05350c:
	dc.b $06,$06,$06,$00

;----------------------------------------------
loc_053510:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_05354a
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	move.b #1,($31,a6)
	move.l #$fffdc000,($40,a6)
	move.l #$60000,($44,a6)
	move.l #$500,($48,a6)
	move.l #$ffffd000,($4c,a6)

loc_05354a:
	rts

;----------------------------------------------
loc_05354c:
	jsr loc_02a7ea
	tst.l ($44,a6)
	bmi.b loc_053588
	bsr.w loc_0535b4
	tst.b ($35,a6)
	bpl.b loc_053586
	moveq #5,d0
	jsr loc_02e636
	beq.b loc_053586
	move.b #$e,(7,a6)
	jsr loc_080668
	moveq #$20,d0
	jsr loc_02a758
	jmp loc_02fa36

loc_053586:
	rts

loc_053588:
	addq.b #2,(7,a6)
	move.l #$fffe6500,($40,a6)
	move.l #$ffffd000,($44,a6)
	move.l #$500,($48,a6)
	move.l #$ffffd000,($4c,a6)
	moveq #$1f,d0
	jmp loc_02a758

;==============================================
loc_0535b4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.l ($40,a6),d0
	tst.b ($b,a6)
	beq.b loc_0535d0
	neg.l d0

loc_0535d0:
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	rts

;----------------------------------------------
loc_0535de:
	jsr loc_02a7ea
	bsr.b loc_0535b4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_05360e
	addq.b #2,(7,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

loc_05360e:
	rts

;----------------------------------------------
loc_053610:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;----------------------------------------------
loc_05361e:
	tst.b ($33,a6)
	bpl.b loc_053648
	addq.b #2,(7,a6)
	move.l #0,($40,a6)
	move.l #$ffff0000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)

loc_053648:
	jsr loc_02a7ea
	jmp loc_02f9be

;----------------------------------------------
loc_053654:
	bsr.w loc_0535b4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_054028
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,($3b,a6)
	moveq #$21,d0
	jmp loc_02a758

;----------------------------------------------
loc_05368c:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.w loc_0536cc
	clr.b ($35,a6)
	subq.b #1,($3b,a6)
	bpl.b loc_0536b6
	addq.b #2,(7,a6)
	moveq #$22,d0
	jsr loc_02a758
	jmp loc_02f9be

loc_0536b6:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	add.b ($3b,a6),d0
	move.b loc_0536d2(pc,d0.w),d0
	jsr loc_02e970

loc_0536cc:
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0536d2:
	dc.b $00,$06,$08,$09

;----------------------------------------------
loc_0536d6:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	moveq #6,d0
	jsr loc_080b70
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_053724(pc,d0.w),d0
	jsr loc_02e720
	move.b #1,($31,a6)
	move.l #$24000,($40,a6)
	move.l #$60000,($44,a6)
	move.l #$fffffb00,($48,a6)
	move.l #$ffffd000,($4c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053724:
	dc.w $0005,$0007,$000a

;----------------------------------------------
loc_05372a:
	bsr.w loc_0535b4
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_053dd8
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w d0,($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	moveq #$11,d0
	jmp loc_02a708

;----------------------------------------------
loc_053758:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;==============================================
;Vism AC
;==============================================
loc_053766:
	move.b (7,a6),d0
	move.w loc_053772(pc,d0.w),d1
	jmp loc_053772(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053772:
	dc.w loc_05377c-loc_053772
	dc.w loc_053794-loc_053772
	dc.w loc_0537d0-loc_053772
	dc.w loc_0537e0-loc_053772
	dc.w loc_053804-loc_053772

;----------------------------------------------
loc_05377c:
	tst.b ($35,a6)
	beq.w loc_05378e
	addq.b #2,(7,a6)
	jsr loc_080e8e

loc_05378e:
	jmp loc_02a7ea

;----------------------------------------------
loc_053794:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.l #$c0000,d0
	move.l #$ffff0000,d1
	tst.b ($b,a6)
	bne.b loc_0537c0
	neg.l d0
	neg.l d1

loc_0537c0:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	moveq #$18,d0
	jmp loc_02a758

;----------------------------------------------
loc_0537d0:
	tst.b ($35,a6)
	beq.b loc_0537da
	addq.b #2,(7,a6)

loc_0537da:
	jmp loc_02a7ea

;----------------------------------------------
loc_0537e0:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #$36,d0
	jmp loc_02a710

;----------------------------------------------
loc_053804:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02bb26

;==============================================
;Taunt
;==============================================
loc_053812:
	move.b (7,a6),d0
	move.w loc_05381e(pc,d0.w),d1
	jmp loc_05381e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_05381e:
	dc.w loc_053822-loc_05381e
	dc.w loc_053846-loc_05381e

;----------------------------------------------
loc_053822:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_053836
	subq.b #1,($bc,a6)

loc_053836:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	moveq #9,d0
	jmp loc_02a758

;----------------------------------------------
loc_053846:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;==============================================
;Air Taunt
;==============================================
loc_053854:
	move.b (7,a6),d0
	move.w loc_053860(pc,d0.w),d1
	jmp loc_053860(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053860:
	dc.w loc_053864-loc_053860
	dc.w loc_0538a8-loc_053860

;----------------------------------------------
loc_053864:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	moveq #0,d0
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l #$fffffe00,($4c,a6)
	bsr.w loc_0538cc
	tst.b ($3e,a6)
	bne.b loc_053892
	subq.b #1,($bc,a6)

loc_053892:
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	move.b #$78,($3b,a6)
	moveq #$a,d0
	jmp loc_02a758

;----------------------------------------------
loc_0538a8:
	bsr.w loc_0538cc
	subq.b #1,($3b,a6)
	bne.w loc_053dd8
	move.l #$02000602,(4,a6)
	move.l #$ffffd000,($4c,a6)
	moveq #$21,d0
	jmp loc_02a708

;==============================================
loc_0538cc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_0538ee
	move.w d0,($14,a6)
	clr.w ($16,a6)

loc_0538ee:
	rts

;==============================================
;Tempest
;==============================================
loc_0538f0:
	move.b (7,a6),d0
	move.w loc_0538fc(pc,d0.w),d1
	jmp loc_0538fc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0538fc:
	dc.w loc_053908-loc_0538fc
	dc.w loc_05392c-loc_0538fc
	dc.w loc_053958-loc_0538fc
	dc.w loc_053988-loc_0538fc
	dc.w loc_053a0c-loc_0538fc
	dc.w loc_053a20-loc_0538fc

;----------------------------------------------
loc_053908:
	addq.b #2,(7,a6)
	move.b #$32,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$23,d0
	jmp loc_02a758

;----------------------------------------------
loc_05392c:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_053952
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_053944
	moveq #1,d0

loc_053944:
	move.b d0,($ab,a6)
	moveq #8,d0
	moveq #$4a,d1
	jsr loc_082e36

loc_053952:
	jmp loc_02a7ea

;----------------------------------------------
loc_053958:
	subq.b #1,($3a,a6)
	bpl.b loc_05397e
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_053978
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_053978:
	move.b loc_053984(pc,d0.w),($25d,a6)

loc_05397e:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053984:
	dc.b $0a,$0a,$0a,$00

;----------------------------------------------
loc_053988:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_053a0a
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_053a0a
	addq.b #1,(a4)
	move.w #$1e00,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	lsr.b #1,d0
	addq.b #2,d0
	move.w d0,($50,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_053a0a:
	rts

;----------------------------------------------
loc_053a0c:
	tst.w ($a4,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #$24,d0
	jmp loc_02a758

;----------------------------------------------
loc_053a20:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;==============================================
;Stream
;==============================================
loc_053a2e:
	move.b (7,a6),d0
	move.w loc_053a3a(pc,d0.w),d1
	jmp loc_053a3a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053a3a:
	dc.w loc_053a46-loc_053a3a
	dc.w loc_053a70-loc_053a3a
	dc.w loc_053a9c-loc_053a3a
	dc.w loc_053ac8-loc_053a3a
	dc.w loc_053b4c-loc_053a3a
	dc.w loc_053b60-loc_053a3a

;----------------------------------------------
loc_053a46:
	addq.b #2,(7,a6)
	move.b #1,($ed,a6)
	move.b #$32,($3a,a6)
	jsr loc_0804da
	jsr loc_02f53c
	jsr loc_02068c
	moveq #$25,d0
	jmp loc_02a758

;----------------------------------------------
loc_053a70:
	subq.b #1,($3a,a6)
	tst.b ($35,a6)
	beq.b loc_053a96
	addq.b #2,(7,a6)
	moveq #-1,d0
	tst.b ($3f,a6)
	beq.b loc_053a88
	moveq #1,d0

loc_053a88:
	move.b d0,($ab,a6)
	moveq #8,d0
	moveq #$4a,d1
	jsr loc_082e36

loc_053a96:
	jmp loc_02a7ea

;----------------------------------------------
loc_053a9c:
	subq.b #1,($3a,a6)
	bpl.b loc_053abe
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	moveq #3,d0
	tst.b ($3f,a6)
	bne.b loc_053ab8
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_053ab8:
	move.b loc_053ac4(pc,d0.w),($25d,a6)

loc_053abe:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053ac4:
	dc.b $03,$05,$07,$00

;----------------------------------------------
loc_053ac8:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_053b4a
	addq.b #2,(7,a6)
	jsr loc_01c1c8
	beq.b loc_053b4a
	addq.b #1,(a4)
	move.w #$1e01,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	moveq #0,d0
	move.b ($82,a6),d0
	move.b d0,($72,a4)
	lsr.b #1,d0
	addq.b #2,d0
	move.w d0,($50,a4)
	move.b ($3e,a6),($3e,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.b ($b,a6),($b,a4)
	move.w ($c,a6),($c,a4)
	move.w ($26,a6),($26,a4)
	move.w ($10,a6),($10,a4)
	move.w ($14,a6),($14,a4)
	move.w a6,($36,a4)
	move.w a4,($a4,a6)
	addq.b #1,($238,a6)

loc_053b4a:
	rts

;----------------------------------------------
loc_053b4c:
	tst.w ($a4,a6)
	bne.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #$26,d0
	jmp loc_02a758

;----------------------------------------------
loc_053b60:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;##############################################
;Throws
;##############################################
loc_053b6e:
	cmpi.b #4,($80,a6)
	beq.w loc_053d62
	tst.b ($81,a6)
	bne.w loc_053d12
	move.b (7,a6),d0
	move.w loc_053b92(pc,d0.w),d1
	jsr loc_053b92(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053b92:
	dc.w loc_053ba0-loc_053b92
	dc.w loc_053bb4-loc_053b92
	dc.w loc_053c38-loc_053b92
	dc.w loc_053c46-loc_053b92
	dc.w loc_053c54-loc_053b92
	dc.w loc_053cda-loc_053b92
	dc.w loc_053d04-loc_053b92

;----------------------------------------------
loc_053ba0:
	addq.b #2,(7,a6)
	moveq #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	jmp loc_02a758

;----------------------------------------------
loc_053bb4:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	moveq #1,d0
	tst.b ($82,a6)
	beq.b loc_053bc6
	moveq #4,d0

loc_053bc6:
	jsr loc_02e3fe
	beq.w loc_053c2c
	move.b #6,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	tst.b ($125,a6)
	beq.b loc_053bfe
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_053c12
	bra.b loc_053c16

loc_053bfe:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_053c16
	clr.b ($b,a6)
	btst #1,d0
	beq.b loc_053c16

loc_053c12:
	addq.b #1,($b,a6)

loc_053c16:
	moveq #6,d0
	tst.b ($81,a6)
	bne.b loc_053c26
	moveq #4,d0
	eori.b #1,($b,a6)

loc_053c26:
	jmp loc_02a758

loc_053c2c:
	addq.b #2,(7,a6)
	moveq #1,d0
	jmp loc_02a758

;----------------------------------------------
loc_053c38:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;----------------------------------------------
loc_053c46:
	addq.b #2,(7,a6)
	move.w #$b4,($ae,a6)
	clr.b ($1f8,a6)

;----------------------------------------------
loc_053c54:
	movea.w ($38,a6),a1
	tst.b ($35,a6)
	beq.b loc_053c88
	clr.b ($35,a6)
	moveq #3,d0
	tst.b ($3e,a6)
	bne.b loc_053c72
	tst.b ($1f8,a6)
	bne.b loc_053c76
	moveq #2,d0

loc_053c72:
	st.b ($1f8,a6)

loc_053c76:
	jsr loc_02e970
	beq.b loc_053c88
	moveq #1,d0
	jsr loc_02e7f2
	bra.b loc_053cce

loc_053c88:
	jsr loc_02ea06
	tst.b ($1f8,a6)
	beq.w loc_053dd8
	movea.w ($38,a6),a1
	tst.b ($2ca,a1)
	beq.b loc_053caa
	jsr loc_02ea7a
	beq.w loc_053dd8

loc_053caa:
	moveq #1,d0
	jsr loc_02e7f2
	cmpi.b #1,($132,a6)
	bne.b loc_053cce
	tst.b ($b9,a6)
	beq.b loc_053cce
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bmi.b loc_053cce
	clr.b ($2ca,a4)

loc_053cce:
	addq.b #2,(7,a6)
	moveq #5,d0
	jmp loc_02a758

;----------------------------------------------
loc_053cda:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_053d02
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bpl.b loc_053d02
	btst.b #3,($371,a6)
	beq.b loc_053d02
	jmp loc_02a98c

loc_053d02:
	rts

;----------------------------------------------
loc_053d04:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	jmp loc_02baf2

;==============================================
;Kick Throw
;==============================================
loc_053d12:
	move.b (7,a6),d0
	move.w loc_053d24(pc,d0.w),d1
	jsr loc_053d24(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053d24:
	dc.w loc_053ba0-loc_053d24
	dc.w loc_053bb4-loc_053d24
	dc.w loc_053c38-loc_053d24
	dc.w loc_053d30-loc_053d24
	dc.w loc_053d34-loc_053d24
	dc.w loc_053d4e-loc_053d24

;----------------------------------------------
loc_053d30:
	addq.b #2,(7,a6)

;----------------------------------------------
loc_053d34:
	tst.b ($35,a6)
	beq.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;----------------------------------------------
loc_053d4e:
	tst.b ($33,a6)
	bpl.w loc_053dd8
	eori.b #1,($b,a6)
	jmp loc_02baf2

;==============================================
;Air Throw
;==============================================
loc_053d62:
	move.b (7,a6),d0
	move.w loc_053d74(pc,d0.w),d1
	jsr loc_053d74(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053d74:
	dc.w loc_053d7c-loc_053d74
	dc.w loc_053da8-loc_053d74
	dc.w loc_053dbe-loc_053d74
	dc.w loc_053da8-loc_053d74

;----------------------------------------------
loc_053d7c:
	addq.b #2,(7,a6)
	moveq #3,d0
	jsr loc_02ef6c
	moveq #$5e,d0
	jsr loc_02e636
	beq.b loc_053da0
	move.b #4,(7,a6)
	moveq #6,d0
	jmp loc_02a758

loc_053da0:
	moveq #3,d0
	jmp loc_02a758

;----------------------------------------------
loc_053da8:
	jsr loc_02aa08
	bcc.w loc_053dd8
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_053dbe:
	tst.b ($35,a6)
	beq.w loc_053dd8
	addq.b #2,(7,a6)
	moveq #$5e,d0
	jsr loc_02e7f2
	jmp loc_02a7ea

;==============================================
loc_053dd8:
	jmp loc_02a7ea

;==============================================
loc_053dde:
	jmp loc_02baf2

;==============================================
loc_053de4:
	jmp loc_02bb26

;##############################################
;
;##############################################
loc_053dea:
	move.b (6,a6),d0
	move.w loc_053df6(pc,d0.w),d1
	jmp loc_053df6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053df6:
	dc.w loc_053e04-loc_053df6
	dc.w loc_053e16-loc_053df6
	dc.w loc_053e2c-loc_053df6
	dc.w loc_053e7e-loc_053df6
	dc.w loc_053eb4-loc_053df6
	dc.w loc_053edc-loc_053df6
	dc.w loc_053e9a-loc_053df6

;----------------------------------------------
loc_053e04:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;----------------------------------------------
loc_053e16:
	tst.b ($124,a5)
	bne.b loc_053e26
	tst.b ($11c,a5)
	bne.b loc_053e26
	addq.b #2,(6,a6)

loc_053e26:
	jmp loc_02a7ea

;----------------------------------------------
loc_053e2c:
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	bne.b loc_053e4c
	jsr RNGFunction
	andi.w #$f,d0
	move.b loc_053e62(pc,d0.w),d0

loc_053e4c:
	subq.b #1,d0
	move.b d0,($2c4,a6)
	move.b loc_053e78(pc,d0.w),(6,a6)
	move.b loc_053e72(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_053e62:
	dc.b $01,$05,$04,$03,$02,$01,$05,$04
	dc.b $03,$02,$01,$05,$05,$03,$02,$01

loc_053e72:
	dc.b $23,$24,$25,$26,$27,$27

loc_053e78:
	dc.b $06,$0c,$06,$06,$0c,$0c

;----------------------------------------------
loc_053e7e:
	cmpi.b #1,($35,a6)
	bne.b loc_053e9a
	addq.b #2,(6,a6)
	move.l #$18000,($44,a6)
	move.l #$ffffe000,($4c,a6)

;----------------------------------------------
loc_053e9a:
	tst.b ($3a,a6)
	beq.b loc_053eae
	subq.b #1,($3a,a6)
	bne.b loc_053eae
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_053eae:
	jmp loc_02a7ea

;----------------------------------------------
loc_053eb4:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bpl.b loc_053eda
	addq.b #2,(6,a6)
	move.l #$fffe8000,($44,a6)
	move.l #$2000,($4c,a6)

loc_053eda:
	bra.b loc_053e9a

;----------------------------------------------
loc_053edc:
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	bmi.b loc_053f02
	subq.b #2,(6,a6)
	move.l #$18000,($44,a6)
	move.l #$ffffe000,($4c,a6)

loc_053f02:
	bra.b loc_053e9a

;==============================================
loc_053f04:
	moveq #0,d0
	lea.l ($180,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	lea.l ($300,a6),a0
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	rts

;==============================================
loc_053f38:
	tst.b ($33,a6)
	bmi.b loc_053f62
	tst.b ($35,a6)
	bpl.b loc_053f4e
	jsr loc_02ec28
	bne.w loc_053f54

loc_053f4e:
	bsr.w loc_053f76
	beq.b loc_053f5c

loc_053f54:
	clr.b (7,a6)
	st.b ($257,a6)

loc_053f5c:
	jmp loc_02a7ea

loc_053f62:
	tst.b ($80,a6)
	bne.w loc_053f70
	jmp loc_02baf2

loc_053f70:
	jmp loc_02bb26

;==============================================
loc_053f76:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_053fd6
	jsr loc_02af7a
	bne.b loc_053fd6
	tst.b ($5b,a6)
	beq.b loc_053fd6
	move.b ($378,a6),d0
	andi.w #$77,d0
	beq.b loc_053fd6
	bsr.w loc_053fda
	jsr loc_02b216
	tst.b ($b9,a6)
	bne.b loc_053fae
	bsr.w loc_053ffe
	beq.b loc_053fd6

loc_053fae:
	move.b d1,($82,a6)
	move.b d2,($81,a6)
	clr.b ($80,a6)
	btst.b #2,($371,a6)
	beq.b loc_053fc6
	addq.b #2,($80,a6)

loc_053fc6:
	jsr loc_02070a
	jsr loc_02f770
	moveq #1,d0
	rts

loc_053fd6:
	moveq #0,d0
	rts

;==============================================
loc_053fda:
	movea.l #loc_0dca2a,a0
	moveq #0,d0
	tst.b ($80,a6)
	beq.b loc_053fec
	addi.b #$c,d0

loc_053fec:
	tst.b ($81,a6)
	beq.b loc_053ff4
	addq.b #6,d0

loc_053ff4:
	add.b ($82,a6),d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
loc_053ffe:
	btst.b #0,($371,a6)
	beq.b loc_054024
	move.w (a0),d0
	moveq #0,d3
	btst.b #2,($371,a6)
	beq.b loc_054014
	addq.b #6,d3

loc_054014:
	tst.b d2
	beq.b loc_05401a
	addq.b #3,d3

loc_05401a:
	move.b d1,d4
	lsr.b #1,d4
	add.b d4,d3
	btst.l d3,d0
	rts

loc_054024:
	moveq #0,d0
	rts

;==============================================
loc_054028:
	jsr loc_02a7ea
	jmp loc_02f9be

;##############################################
;
;##############################################
loc_054034:
	dc.w loc_0540ae-loc_054034
	dc.w loc_0540ae-loc_054034
	dc.w loc_05403a-loc_054034

loc_05403a:
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$09,$0b,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$09,$0b,$09,$0b,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$09,$0b

loc_0540ae:
	dc.b $08,$0a,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$08,$0a,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$06,$08,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$08,$0a,$08,$0a,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$08,$0a