;Cps1/16x16 Layer Programming
loc_017c4e:
	lea.l (Camera_Data,a5),a6
	move.w (stageid,a5),d0
	move.w loc_017c6c(pc,d0.w),d1
	jsr loc_017c6c(pc,d1.w)
	move.w ($20,a6),($28,a6)
	move.w ($24,a6),($2c,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017c6c:
	dc.w loc_017cac-loc_017c6c;Ryu
	dc.w loc_017cac-loc_017c6c;Ken
	dc.w loc_017cac-loc_017c6c;Akm
	dc.w loc_017cac-loc_017c6c;Nsh
	dc.w loc_017cc6-loc_017c6c;Chn
	dc.w loc_017cac-loc_017c6c;Adn
	dc.w loc_017cac-loc_017c6c;Sdm
	dc.w loc_017cac-loc_017c6c;Guy

	dc.w loc_017cac-loc_017c6c;Brd
	dc.w loc_017cac-loc_017c6c;Rse
	dc.w loc_017cac-loc_017c6c;Dic
	dc.w loc_017cac-loc_017c6c;Sgt
	dc.w loc_017cac-loc_017c6c;Dan
	dc.w loc_017cac-loc_017c6c;Sak
	dc.w loc_017cac-loc_017c6c;Rol
	dc.w loc_017cac-loc_017c6c;Sim

	dc.w loc_017cac-loc_017c6c;Zan
	dc.w loc_017cc6-loc_017c6c;Gen
	dc.w loc_017cc6-loc_017c6c;0x12
	dc.w loc_017cc6-loc_017c6c;Genc
	dc.w loc_017cac-loc_017c6c;0x14
	dc.w loc_017cac-loc_017c6c;Boxer
	dc.w loc_017ce0-loc_017c6c;Cammy
	dc.w loc_017cac-loc_017c6c;0x17

	dc.w loc_017cac-loc_017c6c;EHonda
	dc.w loc_017cac-loc_017c6c;Blanka
	dc.w loc_017cc6-loc_017c6c;Rmika
	dc.w loc_017cac-loc_017c6c;Cody
	dc.w loc_017cac-loc_017c6c;Claw
	dc.w loc_017cac-loc_017c6c;Karin
	dc.w loc_017cac-loc_017c6c;Juli
	dc.w loc_017cac-loc_017c6c;Juni

;==============================================
loc_017cac:
	move.b (4,a6),d0
	move.w loc_017cc2(pc,d0.w),d1
	jsr loc_017cc2(pc,d1.w)
	bsr.w loc_017f6a
	jmp loc_019b22

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017cc2:
	dc.w loc_017dc2-loc_017cc2
	dc.w loc_017dda-loc_017cc2

;==============================================
loc_017cc6:
	move.b (4,a6),d0
	move.w loc_017cdc(pc,d0.w),d1
	jsr loc_017cdc(pc,d1.w)
	bsr.w loc_017f6a
	jmp loc_019b22

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017cdc:
	dc.w loc_017d9c-loc_017cdc
	dc.w loc_017dda-loc_017cdc

;==============================================
;Cammy Stage Programming
loc_017ce0:
	move.b (4,a6),d0
	move.w loc_017cf6(pc,d0.w),d1
	jsr loc_017cf6(pc,d1.w)
	bsr.w loc_017f6a
	jmp loc_019b22

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017cf6:
	dc.w loc_017cfa-loc_017cf6
	dc.w loc_017d24-loc_017cf6

;==============================================
loc_017cfa:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.w loc_017df0
	moveq #$10,d0
	jsr loc_018df6
	tst.b (1,a6)
	beq.b loc_017d22
	moveq #0,d0
	addq.b #2,(4,a6)
	move.b d0,(1,a6)
	move.w d0,($60,a6)
	bra.b loc_017d44

loc_017d22:
	rts

;==============================================
loc_017d24:
	move.b ($125,a5),d0
	or.b ($134,a5),d0
	bne.b loc_017d40
	subq.w #1,($3c,a6)
	bne.b loc_017d40
	addq.w #8,($60,a6)
	andi.w #$38,($60,a6)
	bsr.b loc_017d44

loc_017d40:
	bra.w loc_017dda

;==============================================
loc_017d44:
	move.w ($60,a6),d0
	move.w loc_017d5c(pc,d0.w),(gfxram16x16,a5)
	move.w loc_017d5c+2(pc,d0.w),($3c,a6)
	move.w loc_017d5c+6(pc,d0.w),($5a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_017d5c:
	dc.w $9040,$000c,$0000,$0000
	dc.w $9040,$000c,$0000,$0100
	dc.w $9040,$000c,$0000,$0200
	dc.w $9040,$000c,$0000,$0300
	dc.w $9140,$000c,$0000,$0000
	dc.w $9140,$000c,$0000,$0100
	dc.w $9140,$000c,$0000,$0200
	dc.w $9140,$000c,$0000,$0300

;==============================================
loc_017d9c:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.b loc_017df0
	tst.b (1,a6)
	beq.b loc_017dd8
	addq.b #2,(4,a6)
	clr.b (1,a6)
	cmpi.w #Asia_Region,(Region,a5)
	bne.b loc_017dc0
	move.w #$100,($5a,a6)

loc_017dc0:
	rts

;==============================================
loc_017dc2:
	move.w #$1c0,d0
	moveq #0,d1
	bsr.b loc_017df0
	tst.b (1,a6)
	beq.b loc_017dd8
	addq.b #2,(4,a6)
	clr.b (1,a6)

loc_017dd8:
	rts

;==============================================
loc_017dda:
	tst.b (a6)
	beq.b loc_017dd8
	move.b (-$7af5,a5),d0
	or.b (-$76f5,a5),d0
	bne.b loc_017dd8
	bsr.w loc_017e7e
	bra.w loc_017efc

;==============================================
loc_017df0:
	moveq #0,d2
	move.l d2,($50,a6)
	move.l d2,($54,a6)
	move.w d2,($58,a6)
	move.w d2,($5a,a6)
	move.w d2,($12,a6)
	move.w d2,($16,a6)
	move.w d2,($a,a6)
	move.w d2,($e,a6)
	move.w d2,($22,a6)
	move.w d2,($26,a6)
	move.w d0,d2
	move.w d2,(8,a6)
	add.w ($50,a6),d2
	move.w d2,($20,a6)
	move.w d2,($10,a6)
	andi.w #$3ff,d2
	move.w d2,($26,a5)
	subi.w #$100,d2
	move.w d2,($4e,a5)
	not.w d0
	andi.w #$10,d0
	move.b d0,($38,a6)
	move.w #$300,d2
	move.w d1,($c,a6)
	add.w ($54,a6),d1
	move.w d1,($24,a6)
	move.w d1,($14,a6)
	andi.w #$3ff,d1
	move.w d1,($28,a5)
	sub.w d1,d2
	move.w d2,($50,a5)
	not.w d1
	andi.w #$10,d1
	move.b d1,($39,a6)
	jsr Set_Stage_Bounds
	jmp loc_018da4

;==============================================
loc_017e7e:
	tst.b (-$5eb6,a5)
	bne.b loc_017eaa
	bsr.w loc_018654
	move.w d1,d2
	sub.w d0,d2
	cmpi.w #$c0,d2
	bcc.b loc_017eb2
	move.w d1,d2
	sub.w ($20,a6),d2
	subi.w #$120,d2
	bge.b loc_017ec2
	move.w d0,d2
	sub.w ($20,a6),d2
	subi.w #$60,d2
	ble.b loc_017ede

loc_017eaa:
	move.w ($20,a6),d0
	bra.w loc_017f56

loc_017eb2:
	move.w d1,d2
	add.w d0,d2
	lsr.w #1,d2
	sub.w ($20,a6),d2
	subi.w #$c0,d2
	blt.b loc_017ede

loc_017ec2:
	cmpi.w #5,d2
	bls.b loc_017eca
	moveq #5,d2

loc_017eca:
	add.w d2,($20,a6)
	move.w ($46,a6),d0
	cmp.w ($20,a6),d0
	ble.b loc_017f56
	move.w ($20,a6),d0
	bra.b loc_017f56

loc_017ede:
	neg.w d2
	cmpi.w #5,d2
	bls.b loc_017ee8
	moveq #5,d2

loc_017ee8:
	sub.w d2,($20,a6)
	move.w ($44,a6),d0
	cmp.w ($20,a6),d0
	bge.b loc_017f56
	move.w ($20,a6),d0
	bra.b loc_017f56

loc_017efc:
	tst.b (-$5eb6,a5)
	bne.b loc_017f14
	bsr.w loc_01877c
	move.w d1,d2
	sub.w ($24,a6),d2
	subi.w #$60,d2
	bgt.b loc_017f1c
	blt.b loc_017f38

loc_017f14:
	move.w ($24,a6),d0
	bra.w loc_017f60

loc_017f1c:
	cmpi.w #1,d2
	bls.b loc_017f24
	moveq #1,d2

loc_017f24:
	add.w d2,($24,a6)
	move.w ($40,a6),d0
	cmp.w ($24,a6),d0
	ble.b loc_017f60
	move.w ($24,a6),d0
	bra.b loc_017f60

loc_017f38:
	neg.w d2
	cmpi.w #1,d2
	bls.b loc_017f42
	moveq #1,d2

loc_017f42:
	sub.w d2,($24,a6)
	move.w ($42,a6),d0
	cmp.w ($24,a6),d0
	bge.b loc_017f60
	move.w ($24,a6),d0
	bra.b loc_017f60

loc_017f56:
	add.w ($50,a6),d0
	move.w d0,($20,a6)
	rts

loc_017f60:
	add.w ($54,a6),d0
	move.w d0,($24,a6)
	rts

;==============================================
loc_017f6a:
	move.w ($20,a6),d0
	move.w ($24,a6),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	add.w ($58,a6),d0
	andi.w #$3ff,d0
	move.w d0,($26,a5)
	sub.w ($14e,a5),d1
	add.w ($5a,a6),d1
	andi.w #$3ff,d1
	move.w d1,($28,a5)
	rts

