;##############################################
;
;##############################################
loc_044c92:
	moveq #0,d0
	move.l d0,($1e0,a6)
	move.b d0,($1e6,a6)
	jsr loc_01c368
	beq.b loc_044cd8
	addq.b #1,(a4)
	move.b #9,(2,a4)
	move.w a6,($36,a4)
	move.w a4,($2a,a6)
	move.l ($10,a6),($10,a4)
	move.l ($14,a6),($14,a4)
	move.b ($b,a6),($b,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.b ($102,a6),(3,a4)

loc_044cd8:
	rts

;##############################################
;
;##############################################
loc_044cda:
	move.b (6,a6),d0
	move.w loc_044ce6(pc,d0.w),d1
	jmp loc_044ce6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044ce6:
	dc.w loc_044cee-loc_044ce6
	dc.w loc_044d46-loc_044ce6
	dc.w loc_044d6c-loc_044ce6
	dc.w loc_044d88-loc_044ce6

;==============================================
loc_044cee:
	movea.w ($38,a6),a4
	cmpi.b #$a,($102,a4)
	bne.b loc_044d2e
	tst.b ($125,a4)
	beq.b loc_044d2e
	move.b #4,(6,a6)
	move.b #$3f,($3a,a6)
	moveq #$40,d0
	move.l #$ffff0000,($40,a6)
	tst.b ($b,a6)
	bne.b loc_044d22
	neg.w d0
	neg.l ($40,a6)

loc_044d22:
	add.w d0,($10,a6)
	moveq #$34,d0
	jmp loc_02a708

loc_044d2e:
	addq.b #2,(6,a6)
	move.b #1,($31,a6)
	jsr loc_09784c
	moveq #$22,d0
	jmp loc_02a708

;==============================================
loc_044d46:
	tst.b ($33,a6)
	bpl.w loc_046d26
	move.l #$2000000,(4,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_044d6c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	subq.b #1,($3a,a6)
	bpl.w loc_046d26
	addq.b #2,(6,a6)
	moveq #$35,d0
	jmp loc_02a708

;==============================================
loc_044d88:
	tst.b ($35,a6)
	beq.b loc_044da0
	clr.b ($35,a6)
	jsr loc_097afe
	moveq #$44,d0
	jsr loc_080b70

loc_044da0:
	tst.b ($33,a6)
	bpl.w loc_046d26
	move.l #$2000000,(4,a6)
	moveq #0,d0
	jmp loc_02a708

;##############################################
;
;##############################################
loc_044db8:
	move.b (6,a6),d0
	move.w loc_044dc4(pc,d0.w),d1
	jmp loc_044dc4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044dc4:
	dc.w loc_044dca-loc_044dc4
	dc.w loc_044ddc-loc_044dc4
	dc.w loc_044e56-loc_044dc4

;==============================================
loc_044dca:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_044ddc:
	tst.b ($124,a5)
	bne.b loc_044e48
	tst.b ($11c,a5)
	bne.b loc_044e48
	addq.b #2,(6,a6)
	move.b #$3c,($3a,a6)
	moveq #6,d0
	tst.b ($14a,a5)
	bne.b loc_044e3a
	move.b ($2c4,a6),d0
	lsr.b #1,d0
	subq.b #1,d0
	bpl.w loc_044e3a
	moveq #0,d0
	cmpi.w #$1c,($50,a6)
	bcs.b loc_044e3a
	moveq #1,d0
	cmpi.w #$38,($50,a6)
	bcs.b loc_044e3a
	moveq #2,d0
	cmpi.w #$54,($50,a6)
	bcs.b loc_044e3a
	moveq #3,d0
	cmpi.w #$70,($50,a6)
	bcs.b loc_044e3a
	moveq #5,d0
	cmpi.w #$90,($50,a6)
	bne.b loc_044e3a
	moveq #4,d0

loc_044e3a:
	move.b d0,($3c,a6)
	move.b loc_044e4e(pc,d0.w),d0
	jmp loc_02a708

loc_044e48:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044e4e:
	dc.b $23,$24,$25,$26
	dc.b $27,$33,$36,$23

;==============================================
loc_044e56:
	tst.b ($3a,a6)
	beq.b loc_044e6a
	subq.b #1,($3a,a6)
	bne.b loc_044e6a
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_044e6a:
	move.b ($3c,a6),d0
	add.w d0,d0
	move.w loc_044e78(pc,d0.w),d1
	jmp loc_044e78(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044e78:
	dc.w loc_044e86-loc_044e78
	dc.w loc_044e8c-loc_044e78
	dc.w loc_044ea4-loc_044e78
	dc.w loc_044ebc-loc_044e78
	dc.w loc_044ee8-loc_044e78
	dc.w loc_044f22-loc_044e78
	dc.w loc_044ee8-loc_044e78

;----------------------------------------------
loc_044e86:
	jmp loc_02a7ea

;----------------------------------------------
loc_044e8c:
	cmpi.b #2,($35,a6)
	bne.b loc_044e9e
	clr.b ($35,a6)
	jsr loc_0978f0

loc_044e9e:
	jmp loc_02a7ea

;----------------------------------------------
loc_044ea4:
	cmpi.b #2,($35,a6)
	bne.b loc_044eb6
	clr.b ($35,a6)
	jsr loc_0b267e

loc_044eb6:
	jmp loc_02a7ea

;----------------------------------------------
loc_044ebc:
	cmpi.b #2,($35,a6)
	bne.b loc_044ece
	clr.b ($35,a6)
	jsr loc_0b2710

loc_044ece:
	cmpi.b #3,($35,a6)
	bne.b loc_044ee2
	clr.b ($35,a6)
	moveq #$32,d0
	jmp loc_02a708

loc_044ee2:
	jmp loc_02a7ea

;----------------------------------------------
loc_044ee8:
	jsr loc_02a7ea
	cmpi.b #2,($35,a6)
	bne.b loc_044f06
	move.b #$20,($2a0,a6)
	clr.b ($35,a6)
	jsr loc_097abe

loc_044f06:
	cmpi.b #3,($35,a6)
	bne.b loc_044f20
	clr.b ($35,a6)
	moveq #8,d0
	tst.b ($b,a6)
	bne.b loc_044f1c
	moveq #-8,d0

loc_044f1c:
	add.w d0,($10,a6)

loc_044f20:
	rts

;----------------------------------------------
loc_044f22:
	cmpi.b #2,($35,a6)
	bne.b loc_044f34
	clr.b ($35,a6)
	jsr loc_097a7e

loc_044f34:
	jmp loc_02a7ea

;##############################################
;Normals
;##############################################
loc_044f3a:
	tst.b ($80,a6)
	bne.w loc_045092
	clr.b ($2c8,a6)
	tst.b ($81,a6)
	bne.w loc_044fc4
	move.b (7,a6),d0
	move.w loc_044f5a(pc,d0.w),d1
	jmp loc_044f5a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044f5a:
	dc.w loc_044f5e-loc_044f5a
	dc.w loc_044fbe-loc_044f5a

;----------------------------------------------
loc_044f5e:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #0,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_044f9e
	cmpi.b #1,($132,a6)
	bne.b loc_044f9e
	btst.b #0,($83,a6)
	bne.b loc_044fb2
	bra.b loc_044fb0

loc_044f9e:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_044fb8(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_044fb2

loc_044fb0:
	addq.b #1,d0

loc_044fb2:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044fb8:
	dc.w $0030,$0038,$0028

;----------------------------------------------
loc_044fbe:
	jmp loc_02f5ac

;==============================================
;
;==============================================
loc_044fc4:
	move.b (7,a6),d0
	move.w loc_044fd0(pc,d0.w),d1
	jmp loc_044fd0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_044fd0:
	dc.w loc_044fd6-loc_044fd0
	dc.w loc_04506e-loc_044fd0
	dc.w loc_045074-loc_044fd0

;----------------------------------------------
loc_044fd6:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	jsr loc_02ef6c
	moveq #6,d0
	add.b ($82,a6),d0
	tst.b ($125,a6)
	bne.b loc_045016
	cmpi.b #1,($132,a6)
	bne.b loc_045016
	btst.b #0,($83,a6)
	bne.b loc_04502a
	bra.b loc_045028

loc_045016:
	moveq #0,d1
	move.b ($82,a6),d1
	move.w loc_045068(pc,d1.w),d1
	move.w ($21c,a6),d2
	cmp.w d2,d1
	bcc.b loc_04502a

loc_045028:
	addq.b #1,d0

loc_04502a:
	cmpi.b #4,($82,a6)
	bne.b loc_045062
	btst.b #1,($83,a6)
	beq.b loc_045062
	cmpi.b #$ff,($132,a6)
	beq.b loc_045062
	move.b #4,(7,a6)
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_045060
	clr.b ($216,a6)
	moveq #1,d0
	jsr loc_02ef6c

loc_045060:
	moveq #$1f,d0

loc_045062:
	jmp loc_02a710

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045068:
	dc.w $0030,$0038,$0028

;----------------------------------------------
loc_04506e:
	jmp loc_02f5ac

;----------------------------------------------
loc_045074:
	move.b ($35,a6),d0
	beq.b loc_04508c
	ext.w d0
	clr.b ($35,a6)
	tst.b ($b,a6)
	bne.b loc_045088
	neg.w d0

loc_045088:
	add.w d0,($10,a6)

loc_04508c:
	jmp loc_02f5ac

;==============================================
;
;==============================================
loc_045092:
	move.b #1,($2c8,a6)
	move.b (7,a6),d0
	move.w loc_0450a4(pc,d0.w),d1
	jmp loc_0450a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0450a4:
	dc.w loc_0450ae-loc_0450a4
	dc.w loc_04511a-loc_0450a4
	dc.w loc_045120-loc_0450a4
	dc.w loc_04514e-loc_0450a4
	dc.w loc_045186-loc_0450a4

;----------------------------------------------
loc_0450ae:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($a9,a6)
	jsr loc_02aebc
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b d0,d1
	jsr loc_02ef6c
	moveq #$c,d0
	tst.b ($81,a6)
	beq.b loc_045112
	moveq #$f,d0
	cmpi.b #2,($82,a6)
	bne.b loc_045112
	btst.b #1,($83,a6)
	beq.b loc_045112
	move.b #4,(7,a6)
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_04510a
	clr.b ($216,a6)
	moveq #1,d0
	jsr loc_02ef6c

loc_04510a:
	moveq #$1e,d0
	jmp loc_02a710

loc_045112:
	add.b d1,d0
	jmp loc_02a710

;----------------------------------------------
loc_04511a:
	jmp loc_02f5ac

;----------------------------------------------
loc_045120:
	tst.b ($35,a6)
	beq.b loc_045148
	addq.b #2,(7,a6)
	move.l #$d0000,($40,a6)
	move.l #$ffff3000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_045148
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_045148:
	jmp loc_02a7ea

;----------------------------------------------
loc_04514e:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	tst.l ($40,a6)
	bne.b loc_04516c
	addq.b #2,(7,a6)
	clr.w ($12,a6)

loc_04516c:
	move.b ($b4,a5),d0
	andi.b #3,d0
	bne.b loc_045180
	moveq #-$30,d3
	moveq #0,d4
	jsr loc_080e52

loc_045180:
	jmp loc_02a7ea

;----------------------------------------------
loc_045186:
	tst.b ($33,a6)
	bmi.b loc_045192
	jmp loc_02a7ea

loc_045192:
	jmp loc_02bb26

;##############################################
;
;##############################################
loc_045198:
	move.b #6,(7,a6)
	move.b #4,($80,a6)
	move.b #1,($a9,a6)
	jsr loc_02b1fc
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_0451ce
	clr.b ($216,a6)
	jsr loc_02ef6c

loc_0451ce:
	moveq #$12,d0
	tst.b ($3c,a6)
	beq.b loc_0451d8
	moveq #$18,d0

loc_0451d8:
	tst.b ($81,a6)
	beq.b loc_0451e0
	addq.w #3,d0

loc_0451e0:
	moveq #0,d1
	move.b ($82,a6),d1
	lsr.w #1,d1
	add.w d1,d0
	jmp loc_02a710

;##############################################
;Special inputs
;##############################################
loc_0451f0:
	jsr loc_02e096
	bne.w loc_0454cc

loc_0451fa:
	lea.l ($1a8,a6),a4
	jsr loc_02d69a
	bne.w loc_045450

loc_045208:
	lea.l ($198,a6),a4
	jsr loc_02d692
	bne.w loc_0453c6

loc_045216:
	lea.l ($1a0,a6),a4
	jsr loc_02d6c2
	bne.w loc_045408

loc_045224:
	lea.l ($188,a6),a4
	jsr loc_02d662
	bne.w loc_045276

loc_045232:
	lea.l ($180,a6),a4
	jsr loc_02d60a
	bne.w loc_0452ba

loc_045240:
	lea.l ($190,a6),a4
	jsr loc_02d61a
	bne.w loc_0452e8

loc_04524e:
	lea.l ($1b0,a6),a4
	jsr loc_02d5f2
	bne.w loc_045316

loc_04525c:
	lea.l ($300,a6),a4
	jsr loc_02e0d6
	bne.w loc_045344

loc_04526a:
	jsr loc_02e0cc
	bne.w loc_045496

loc_045274:
	rts

;----------------------------------------------
;Move ID writes
loc_045276:
	tst.b ($b9,a6)
	bne.b loc_045286
	tst.b ($238,a6)
	bne.b loc_045232
	bra.w loc_04528e

loc_045286:
	cmpi.b #2,($238,a6)
	bcc.b loc_045232

loc_04528e:
	jsr loc_02ed00
	beq.b loc_045232
	move.b #0,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0452ba:
	jsr loc_02ed00
	beq.w loc_045240
	move.b #2,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f728

;----------------------------------------------
loc_0452e8:
	jsr loc_02ed00
	beq.w loc_04524e
	move.b #4,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f728

;----------------------------------------------
loc_045316:
	jsr loc_02ed00
	beq.w loc_04525c
	move.b #$14,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f74c

;----------------------------------------------
loc_045344:
	jsr loc_02edf8
	beq.w loc_04526a

;##############################################
;
;##############################################
loc_04534e:
	tst.b ($132,a6)
	bne.w loc_04538e
	move.l #$2000e00,(4,a6)
	move.b #6,($aa,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #8,($5f,a4)
	move.b #$c,($25d,a6)
	move.b ($2c9,a6),($b,a6)
	clr.b ($82,a6)
	clr.l ($84,a6)
	move.b #1,($a9,a6)
	rts

;##############################################
;
;##############################################
loc_04538e:
	move.l #$2000e00,(4,a6)
	move.b #$10,($aa,a6)
	clr.b ($5f,a6)
	movea.w ($38,a6),a4
	move.b #$11,($5f,a4)
	move.b #$15,($25d,a6)
	move.b ($2c9,a6),($b,a6)
	clr.b ($82,a6)
	move.b #1,($a9,a6)
	clr.l ($84,a6)
	rts

;==============================================
loc_0453c6:
	cmpi.b #1,($132,a6)
	beq.w loc_045216
	cmpi.w #$30,($11e,a6)
	bcs.w loc_045216
	jsr loc_02ecd8
	beq.w loc_045216
	move.b #8,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f4bc

;==============================================
loc_045408:
	tst.b ($132,a6)
	bne.w loc_045224
	cmpi.w #$30,($11e,a6)
	bcs.w loc_045224
	tst.b ($238,a6)
	bne.w loc_045224
	jsr loc_02ecd8
	beq.w loc_045224
	move.b #$a,($aa,a6)
	move.b #1,($a9,a6)
	move.l #$2001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f4bc

;==============================================
loc_045450:
	tst.b ($132,a6)
	bne.w loc_045208
	cmpi.w #$30,($11e,a6)
	bcs.w loc_045208
	tst.b ($23c,a6)
	bne.w loc_045208
	jsr loc_02ecd8
	beq.w loc_045208
	move.b #$c,($aa,a6)
	clr.b ($a9,a6)
	move.l #$2001000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	jmp loc_02f4dc

;==============================================
loc_045496:
	tst.b ($b9,a6)
	bne.b loc_0454a4
	tst.b (pl_taunt_count,a6)
	beq.w loc_045274

loc_0454a4:
	jsr loc_02ed00
	beq.w loc_045274
	move.b #$e,($aa,a6)
	clr.b ($a9,a6)
	move.l #$2000e00,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.l ($84,a6)
	rts

;==============================================
loc_0454cc:
	tst.b ($28a,a6)
	bne.w loc_0451fa
	tst.b ($31,a6)
	bne.w loc_04550a
	jsr loc_02ef54
	beq.w loc_0451fa
	jsr loc_02ecd8
	beq.w loc_0451fa
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	move.b ($2c9,a6),($b,a6)
	jmp loc_02f980

loc_04550a
	tst.b ($b9,a6)
	bne.w loc_0451fa
	jsr loc_02ed28
	beq.w loc_0451fa
	move.l #$2001000,(4,a6)
	move.b #$12,($aa,a6)
	jmp loc_02f980

;##############################################
;Ai Move Checks
;##############################################
loc_045530:
	move.b ($aa,a6),d0
	move.w loc_04553c(pc,d0.w),d1
	jmp loc_04553c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04553c:
	dc.w loc_045552-loc_04553c
	dc.w loc_04555e-loc_04553c
	dc.w loc_045562-loc_04553c
	dc.w loc_045566-loc_04553c
	dc.w loc_045572-loc_04553c
	dc.w loc_04558a-loc_04553c
	dc.w loc_0455a8-loc_04553c
	dc.w loc_0455c4-loc_04553c

	dc.w loc_045566-loc_04553c
	dc.w loc_0455d8-loc_04553c
	dc.w loc_0455d8-loc_04553c

;==============================================
loc_045552:
	tst.b ($238,a6)
	bne.w loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_04555e:
	bra.w loc_0455d8

;==============================================
loc_045562:
	bra.w loc_0455d8

;==============================================
loc_045566:
	tst.b ($132,a6)
	bmi.w loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_045572:
	cmpi.b #1,($132,a6)
	beq.w loc_0455e0
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_04558a:
	tst.b ($132,a6)
	bne.w loc_0455e0
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0455e0
	tst.b ($238,a6)
	bne.w loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_0455a8:
	tst.b ($132,a6)
	bne.w loc_0455e0
	cmpi.w #$30,($11e,a6)
	bcs.w loc_0455e0
	tst.b ($23c,a6)
	bne.b loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_0455c4:
	tst.b ($b9,a6)
	bne.w loc_0455d8
	tst.b (pl_taunt_count,a6)
	beq.w loc_0455e0
	bra.w loc_0455d8

;==============================================
loc_0455d8:
	clr.l ($84,a6)
	moveq #1,d0
	rts

;----------------------------------------------
loc_0455e0:
	moveq #0,d0
	rts

;##############################################
;Special Move Programming
;##############################################
loc_0455e4:
	move.b ($aa,a6),d0
	move.w loc_0455f0(pc,d0.w),d1
	jmp loc_0455f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0455f0:
	dc.w loc_045606-loc_0455f0
	dc.w loc_0456a6-loc_0455f0
	dc.w loc_045772-loc_0455f0
	dc.w loc_045a82-loc_0455f0
	dc.w loc_045c42-loc_0455f0
	dc.w loc_046320-loc_0455f0
	dc.w loc_0465e4-loc_0455f0
	dc.w loc_046656-loc_0455f0

	dc.w loc_0466aa-loc_0455f0
	dc.w loc_0466de-loc_0455f0
	dc.w loc_046760-loc_0455f0

;==============================================
;
;==============================================
loc_045606:
	move.b (7,a6),d0
	move.w loc_045612(pc,d0.w),d1
	jmp loc_045612(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045612:
	dc.w loc_045618-loc_045612
	dc.w loc_045652-loc_045612
	dc.w loc_045682-loc_045612

;----------------------------------------------
loc_045618:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_04563a
	clr.b ($216,a6)
	moveq #4,d0
	jsr loc_02ef6c

loc_04563a:
	jsr loc_020674
	moveq #$d,d1
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	add.w d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_045652:
	tst.b ($35,a6)
	beq.b loc_045678
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	jsr loc_075eee
	clr.b ($1e0,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	move.b loc_04567e(pc,d0.w),($3a,a6)

loc_045678:
	jmp loc_02a7ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04567e:
	dc.b $0d,$11,$15,$00

;----------------------------------------------
loc_045682:
	tst.b ($33,a6)
	bmi.w loc_046d2c
	tst.b ($3a,a6)
	beq.b loc_04569a
	subq.b #1,($3a,a6)
	bne.b loc_0456a0
	clr.b ($ce,a6)

loc_04569a:
	jsr loc_02f6f8

loc_0456a0:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_0456a6:
	move.b (7,a6),d0
	move.w loc_0456b2(pc,d0.w),d1
	jmp loc_0456b2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0456b2:
	dc.w loc_0456b8-loc_0456b2
	dc.w loc_0456f2-loc_0456b2
	dc.w loc_04574c-loc_0456b2

;----------------------------------------------
loc_0456b8:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_0456da
	clr.b ($216,a6)
	moveq #4,d0
	jsr loc_02ef6c

loc_0456da:
	jsr loc_020674
	moveq #4,d1
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	add.w d1,d0
	jmp loc_02a758

;----------------------------------------------
loc_0456f2:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04574a
	jsr loc_01c1c8
	beq.w loc_04574a
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b ($82,a6),($72,a4)
	move.b #4,($bd,a4)
	move.b #0,($73,a4)
	move.b ($e,a6),($e,a4)
	move.w ($26,a6),($26,a4)
	move.l #$2000e00,($6a,a4)
	move.w a6,($36,a4)
	addq.b #2,(7,a6)

loc_04574a:
	rts

;----------------------------------------------
loc_04574c:
	tst.b ($33,a6)
	bmi.w loc_046d2c
	move.b ($35,a6),d0
	andi.b #1,d0
	cmpi.b #1,d0
	bne.b loc_04576c
	clr.b ($ce,a6)
	jsr loc_02f6f8

loc_04576c:
	jmp loc_02a7ea

;==============================================
;
;==============================================
loc_045772:
	move.b (7,a6),d0
	move.w loc_045784(pc,d0.w),d1
	jsr loc_045784(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045784:
	dc.w loc_045796-loc_045784
	dc.w loc_0457c6-loc_045784
	dc.w loc_045838-loc_045784
	dc.w loc_04589a-loc_045784
	dc.w loc_0458da-loc_045784
	dc.w loc_0458fe-loc_045784
	dc.w loc_045998-loc_045784
	dc.w loc_0459d0-loc_045784

	dc.w loc_045a26-loc_045784

;----------------------------------------------
loc_045796:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	clr.b ($1e6,a6)
	move.b #1,($31,a6)
	tst.b ($23c,a6)
	bne.b loc_0457b8
	moveq #5,d0
	jsr loc_02ef6c

loc_0457b8:
	jsr loc_020674
	moveq #7,d0
	jmp loc_02a758

;----------------------------------------------
loc_0457c6:
	tst.b ($33,a6)
	bpl.w loc_046d26
	addq.b #2,(7,a6)
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_045808(pc,d0.w),d1
	move.l loc_045808+4(pc,d0.w),($44,a6)
	move.l loc_045808+8(pc,d0.w),d2
	move.l loc_045808+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_0457f8
	neg.l d1
	neg.l d2

loc_0457f8:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	moveq #8,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045808:
	dc.l $00080000,$00080000,$ffff8000,$ffffa000
	dc.l $000c0000,$00088000,$ffff8000,$ffffa000
	dc.l $000e0000,$00090000,$ffff8000,$ffffa000

;----------------------------------------------
loc_045838:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.w ($44,a6)
	bmi.b loc_045884
	beq.w loc_046d26
	tst.b ($35,a6)
	bne.w loc_046d26
	moveq #$37,d0
	jsr loc_02e636
	beq.w loc_046d26
	addq.b #2,(7,a6)
	st.b ($1e6,a6)
	move.b #4,($3a,a6)
	tst.b ($23c,a6)
	bne.b loc_04587c
	moveq #7,d0
	jsr loc_02ef6c

loc_04587c:
	moveq #9,d0
	jmp loc_02a758

loc_045884:
	move.b #$e,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_04589a:
	jsr loc_09723c
	subq.b #1,($3a,a6)
	bpl.b loc_0458d8
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	move.l ($48,a6),d0
	asr.l #1,d0
	move.l d0,($48,a6)
	move.l ($44,a6),d0
	asr.l #1,d0
	move.l d0,($44,a6)
	move.l ($4c,a6),d0
	asr.l #1,d0
	move.l d0,($4c,a6)
	addq.b #2,(7,a6)
	jmp loc_02a7ea

loc_0458d8:
	rts

;----------------------------------------------
loc_0458da:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.w ($44,a6)
	bmi.b loc_0458f2
	tst.b ($33,a6)
	bpl.w loc_046d26

loc_0458f2:
	addq.b #2,(7,a6)
	moveq #$a,d0
	jmp loc_02a758

;----------------------------------------------
loc_0458fe:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.b ($35,a6)
	beq.w loc_046d26
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$37,d0
	jsr loc_02e7f2
	move.b ($82,a6),d0
	ext.w d0
	lsl.w #3,d0
	move.l loc_045968(pc,d0.w),d1
	move.l loc_045968+4(pc,d0.w),($44,a6)
	move.l loc_045968+8(pc,d0.w),d2
	move.l loc_045968+$c(pc,d0.w),($4c,a6)
	tst.b ($b,a6)
	bne.b loc_04595e
	neg.l d1
	neg.l d2

loc_04595e:
	move.l d1,($40,a6)
	move.l d2,($48,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045968:
	dc.l $00020000,$00040000,$00000000,$ffffc000
	dc.l $00020000,$00040000,$00000000,$ffffc000
	dc.l $00020000,$00040000,$00000000,$ffffc000

;----------------------------------------------
loc_045998:
	tst.b ($1e6,a6)
	beq.b loc_0459b2
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_0459b2
	clr.b ($1e6,a6)
	move.b #$18,($123,a5)

loc_0459b2:
	bsr.w loc_045a60
	tst.w ($44,a6)
	bpl.w loc_046d26
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_0459d0:
	tst.b ($1e6,a6)
	beq.b loc_0459ea
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_0459ea
	clr.b ($1e6,a6)
	move.b #$18,($123,a5)

loc_0459ea:
	bsr.w loc_045a60
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_046d26
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($ce,a6)
	jsr loc_02f6f8
	jsr loc_00369c
	moveq #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_045a26:
	tst.b ($33,a6)
	bpl.b loc_045a32
	jmp loc_02bb26

loc_045a32:
	clr.b ($ce,a6)
	jsr loc_02f6f8
	jmp loc_02a7ea

;==============================================
loc_045a42:
	tst.w ($40,a6)
	bmi.b loc_045a50
	tst.b ($b,a6)
	beq.b loc_045a58
	bra.b loc_045a60

loc_045a50:
	tst.b ($b,a6)
	bne.b loc_045a58
	bra.b loc_045a60

loc_045a58:
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_045a60:
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
;Punch Alpha Counter
;==============================================
loc_045a82:
	move.b (7,a6),d0
	move.w loc_045a94(pc,d0.w),d1
	jsr loc_045a94(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045a94:
	dc.w loc_045aa2-loc_045a94
	dc.w loc_045ab8-loc_045a94
	dc.w loc_045b16-loc_045a94
	dc.w loc_045b74-loc_045a94
	dc.w loc_045bb6-loc_045a94
	dc.w loc_045bfa-loc_045a94
	dc.w loc_045c1c-loc_045a94

;----------------------------------------------
loc_045aa2:
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)
	jsr loc_080e8e
	moveq #$17,d0
	jmp loc_02a758

;----------------------------------------------
loc_045ab8:
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_045afc
	tst.b ($239,a6)
	bne.b loc_045afe
	addq.b #2,(7,a6)
	move.b #8,($3a,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.l #$98000,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l d0,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_045afc
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_045afc:
	rts

loc_045afe:
	move.b #$c,(7,a6)
	moveq #0,d0
	movea.w ($38,a6),a4
	move.b d0,($5f,a4)
	moveq #$19,d0
	jmp loc_02a758

;----------------------------------------------
loc_045b16:
	subq.b #1,($3a,a6)
	bmi.b loc_045afe
	movea.w ($38,a6),a4
	move.b #8,($5f,a4)
	moveq #$3a,d0
	jsr loc_02e714
	beq.b loc_045b70
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$20000,($40,a6)
	move.l #$60000,($44,a6)
	move.l #0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_045b68
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_045b68:
	moveq #$18,d0
	jmp loc_02a758

loc_045b70:
	bra.w loc_045a60

;----------------------------------------------
loc_045b74:
	bsr.w loc_045c28
	bsr.w loc_045a60
	tst.b ($35,a6)
	beq.w loc_046d26
	addq.b #2,(7,a6)
	moveq #$3a,d0
	jsr loc_02e7f2
	addi.l #$3c000,($44,a6)
	move.l ($40,a6),d0
	add.l d0,($40,a6)
	movea.w ($38,a6),a4
	move.w ($64,a4),($14,a4)
	clr.b ($5f,a4)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_045bb6:
	bsr.w loc_045c28
	bsr.w loc_045a60
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bge.w loc_046d26
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($31,a6)
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	jsr RNGFunction
	btst #0,d0
	beq.b loc_045bf2
	moveq #$1a,d0
	jmp loc_02a758

loc_045bf2:
	moveq #$1b,d0
	jmp loc_02a758

;----------------------------------------------
loc_045bfa:
	tst.b ($33,a6)
	bpl.w loc_046d26
	movea.w ($38,a6),a4
	move.b #0,($2a0,a4)

loc_045c0c:
	moveq #0,d0
	move.b d0,($a9,a6)
	move.b d0,(7,a6)
	jmp loc_02baf2

;----------------------------------------------
loc_045c1c:
	tst.b ($33,a6)
	bmi.b loc_045c0c
	jmp loc_02a7ea

;==============================================
loc_045c28:
	movea.w ($38,a6),a4
	move.b #0,($2a0,a4)
	btst.b #1,($b4,a5)
	beq.b loc_045c40
	move.b #$16,($2a0,a4)

loc_045c40:
	rts

;==============================================
;
;==============================================
loc_045c42:
	move.b ($84,a6),d0
	move.w loc_045c54(pc,d0.w),d1
	jsr loc_045c54(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045c54
	dc.w loc_045c58-loc_045c54
	dc.w loc_045c94-loc_045c54

;----------------------------------------------
loc_045c58:
	addq.b #2,($84,a6)
	moveq #0,d0
	move.b d0,($5b,a6)
	move.b d0,($1e6,a6)
	move.b d0,($1e7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	tst.b ($23c,a6)
	bne.b loc_045c82
	jsr loc_0804da

loc_045c82:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$20,d0
	jmp loc_02a758

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
loc_045c94:
	move.b ($82,a6),d0
	move.w loc_045ca0(pc,d0.w),d1
	jmp loc_045ca0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045ca0:
	dc.w loc_045ca6-loc_045ca0
	dc.w loc_045ddc-loc_045ca0
	dc.w loc_045f66-loc_045ca0

;==============================================
;LP
;==============================================
loc_045ca6:
	move.b (7,a6),d0
	move.w loc_045cb2(pc,d0.w),d1
	jmp loc_045cb2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045cb2:
	dc.w loc_045cc4-loc_045cb2
	dc.w loc_045d56-loc_045cb2
	dc.w loc_045d64-loc_045cb2
	dc.w loc_046198-loc_045cb2
	dc.w loc_0461da-loc_045cb2
	dc.w loc_046208-loc_045cb2
	dc.w loc_04627e-loc_045cb2
	dc.w loc_0462b6-loc_045cb2

	dc.w loc_046304-loc_045cb2

;----------------------------------------------
loc_045cc4:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_045d2c
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.b #0,($25d,a6)
	jsr loc_02fcd4
	tst.b ($ab,a6)
	bpl.b loc_045cf2
	move.b #4,($25d,a6)

loc_045cf2:
	clr.b ($ab,a6)
	move.l #$80000,($40,a6)
	move.l #$ffff8000,($48,a6)
	move.l #$80000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_045d24
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_045d24:
	moveq #$23,d0
	jmp loc_02a758

loc_045d2c:
	cmpi.b #2,d0
	beq.b loc_045d54
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_045d4a
	move.b #1,($ab,a6)

loc_045d4a:
	moveq #-$1f,d0
	moveq #$2e,d1
	jmp loc_082e36

loc_045d54:
	rts

;----------------------------------------------
loc_045d56:
	addq.b #2,(7,a6)
	bsr.w loc_045a42
	jmp loc_02a7ea

;----------------------------------------------
loc_045d64:
	bsr.w loc_045a42
	jsr loc_09723c
	movea.w ($38,a6),a4
	tst.w ($44,a6)
	bmi.b loc_045dc0
	beq.w loc_045dd6
	tst.b ($2ce,a4)
	bne.w loc_045dd6
	tst.b ($31,a4)
	beq.w loc_045dd6
	moveq #$3b,d0
	jsr loc_02e5d4
	beq.w loc_045dd6
	addq.b #2,(7,a6)
	st.b ($1e6,a6)
	move.b #4,($3a,a6)
	move.l #$80000,d0
	tst.w ($40,a6)
	bpl.b loc_045db4
	neg.l d0
	
loc_045db4:
	move.l d0,($40,a6)
	moveq #9,d0
	jmp loc_02a758

loc_045dc0:
	move.b #$e,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

loc_045dd6:
	jmp loc_02a7ea

;==============================================
;MP
;==============================================
loc_045ddc:
	move.b (7,a6),d0
	move.w loc_045de8(pc,d0.w),d1
	jmp loc_045de8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045de8:
	dc.w loc_045dfa-loc_045de8
	dc.w loc_045e52-loc_045de8
	dc.w loc_045eda-loc_045de8
	dc.w loc_046198-loc_045de8
	dc.w loc_0461da-loc_045de8
	dc.w loc_046208-loc_045de8
	dc.w loc_04627e-loc_045de8
	dc.w loc_0462b6-loc_045de8

	dc.w loc_046304-loc_045de8

;----------------------------------------------
loc_045dfa:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_045e28
	addq.b #2,(7,a6)
	move.b #0,($25d,a6)
	jsr loc_02fcd4
	tst.b ($ab,a6)
	bpl.b loc_045e22
	move.b #8,($25d,a6)

loc_045e22:
	clr.b ($ab,a6)
	rts

loc_045e28:
	cmpi.b #2,d0
	beq.b loc_045e50
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_045e46
	move.b #1,($ab,a6)

loc_045e46:
	moveq #-$19,d0
	moveq #$31,d1
	jmp loc_082e36

loc_045e50:
	rts

;----------------------------------------------
loc_045e52:
	tst.b ($33,a6)
	bpl.b loc_045ebe
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$88000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($1e7,a6)
	bne.b loc_045e98
	move.l #$c0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_045eb6
	neg.l ($40,a6)
	neg.l ($48,a6)
	bra.b loc_045eb6

loc_045e98:
	moveq #0,d0
	movea.w ($38,a6),a4
	move.w ($10,a4),d1
	sub.w ($10,a6),d1
	asr.w #4,d1
	swap d1
	move.l d1,($40,a6)
	move.l #0,($48,a6)

loc_045eb6:
	moveq #$23,d0
	jmp loc_02a758

loc_045ebe:
	tst.b ($5b,a6)
	beq.b loc_045ed4
	movea.w ($38,a6),a4
	cmpi.b #$ff,($55,a4)
	beq.b loc_045ed4
	st.b ($1e7,a6)

loc_045ed4:
	jmp loc_02a7ea

;----------------------------------------------
loc_045eda:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.w ($44,a6)
	bmi.w loc_045f50
	beq.b loc_045ed4
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	beq.b loc_045ed4
	tst.b ($1e7,a6)
	bne.b loc_045f18
	movea.l ($1c,a6),a4
	tst.b (8,a4)
	beq.b loc_045ed4
	moveq #$3c,d0
	jsr loc_02e636
	bne.b loc_045f28
	jmp loc_02a7ea

loc_045f18:
	moveq #$3c,d0
	jsr loc_02e5f0
	bne.b loc_045f28
	jmp loc_02a7ea

loc_045f28:
	addq.b #2,(7,a6)
	st.b ($1e6,a6)
	move.b #4,($3a,a6)
	move.l #$80000,d0
	tst.w ($40,a6)
	bpl.b loc_045f44
	neg.l d0

loc_045f44:
	move.l d0,($40,a6)
	moveq #9,d0
	jmp loc_02a758

loc_045f50:
	move.b #$e,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

;==============================================
;HP
;==============================================
loc_045f66:
	move.b (7,a6),d0
	move.w loc_045f72(pc,d0.w),d1
	jmp loc_045f72(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_045f72:
	dc.w loc_045f88-loc_045f72
	dc.w loc_045fb2-loc_045f72
	dc.w loc_046010-loc_045f72
	dc.w loc_04605e-loc_045f72
	dc.w loc_04610c-loc_045f72
	dc.w loc_046198-loc_045f72
	dc.w loc_0461da-loc_045f72
	dc.w loc_046208-loc_045f72

	dc.w loc_04627e-loc_045f72
	dc.w loc_0462b6-loc_045f72
	dc.w loc_046304-loc_045f72

;----------------------------------------------
loc_045f88:
	addq.b #2,(7,a6)
	move.l #$40000,($40,a6)
	move.l #$a000,($48,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	tst.b ($b,a6)
	bne.b loc_045fb2
	neg.l ($40,a6)
	neg.l ($48,a6)

;----------------------------------------------
loc_045fb2:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_045fe6
	addq.b #2,(7,a6)
	move.b #0,($25d,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_045fe4
	move.b #$c,($25d,a6)

loc_045fe4:
	rts

loc_045fe6:
	cmpi.b #2,d0
	beq.b loc_04600e
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_046004
	move.b #1,($ab,a6)

loc_046004:
	moveq #-$2c,d0
	moveq #$40,d1
	jmp loc_082e36

loc_04600e:
	rts

;----------------------------------------------
loc_046010:
	bsr.w loc_045a60
	jsr loc_02a7ea
	tst.b ($35,a6)
	beq.b loc_04603e
	addq.b #2,(7,a6)
	tst.b ($5b,a6)
	beq.b loc_046054
	movea.w ($38,a6),a4
	cmpi.b #$ff,($55,a4)
	beq.b loc_046054
	st.b ($1e7,a6)
	clr.b ($5b,a6)

loc_04603e:
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$24,d0
	cmpi.w #$48,d0
	bhi.b loc_04605c

loc_046054:
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_04605c:
	rts

;----------------------------------------------
loc_04605e:
	bsr.w loc_045a60
	tst.b ($33,a6)
	bpl.b loc_0460ce
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	move.l #$90000,($44,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($1e7,a6)
	bne.b loc_0460a8
	move.l #$e0000,($40,a6)
	move.l #$ffff8000,($48,a6)
	tst.b ($b,a6)
	bne.b loc_0460c6
	neg.l ($40,a6)
	neg.l ($48,a6)
	bra.b loc_0460c6

loc_0460a8:
	moveq #0,d0
	movea.w ($38,a6),a4
	move.w ($10,a4),d1
	sub.w ($10,a6),d1
	asr.w #4,d1
	swap d1
	move.l d1,($40,a6)
	move.l #0,($48,a6)

loc_0460c6:
	moveq #$23,d0
	jmp loc_02a758

loc_0460ce:
	tst.b ($5b,a6)
	beq.b loc_0460e8
	movea.w ($38,a6),a4
	cmpi.b #$ff,($55,a4)
	beq.b loc_0460e8
	st.b ($1e7,a6)
	clr.b ($5b,a6)

loc_0460e8:
	movea.w ($38,a6),a4
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$24,d0
	cmpi.w #$48,d0
	bhi.b loc_046106
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_046106:
	jmp loc_02a7ea

;----------------------------------------------
loc_04610c:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.w ($44,a6)
	bmi.w loc_046182
	beq.b loc_046106
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	beq.b loc_046106
	tst.b ($1e7,a6)
	bne.b loc_04614a
	movea.l ($1c,a6),a4
	tst.b (8,a4)
	beq.b loc_046106
	moveq #$3d,d0
	jsr loc_02e636
	bne.b loc_04615a
	jmp loc_02a7ea

loc_04614a:
	moveq #$3d,d0
	jsr loc_02e5f0
	bne.b loc_04615a
	jmp loc_02a7ea

loc_04615a:
	addq.b #2,(7,a6)
	st.b ($1e6,a6)
	move.b #4,($3a,a6)
	move.l #$80000,d0
	tst.w ($40,a6)
	bpl.b loc_046176
	neg.l d0

loc_046176:
	move.l d0,($40,a6)
	moveq #9,d0
	jmp loc_02a758

loc_046182:
	move.b #$12,(7,a6)
	clr.l ($40,a6)
	clr.l ($48,a6)
	moveq #$b,d0
	jmp loc_02a758

;----------------------------------------------
loc_046198:
	jsr loc_09723c
	subq.b #1,($3a,a6)
	bpl.w loc_0461d8
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	move.l ($48,a6),d0
	asr.l #1,d0
	move.l d0,($48,a6)
	move.l ($44,a6),d0
	asr.l #1,d0
	move.l d0,($44,a6)
	move.l ($4c,a6),d0
	asr.l #1,d0
	move.l d0,($4c,a6)
	addq.b #2,(7,a6)

loc_0461d2:
	jmp loc_02a7ea

loc_0461d8:
	rts

;----------------------------------------------
loc_0461da:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.w ($44,a6)
	bmi.b loc_0461f0
	tst.b ($33,a6)
	bpl.b loc_0461d2

loc_0461f0:
	addq.b #2,(7,a6)
	moveq #$a,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0461fc:
	dc.w $001f,$001b,$001f,$0000,$0000,$0000

;----------------------------------------------
loc_046208:
	bsr.w loc_045a42
	jsr loc_09723c
	tst.b ($35,a6)
	beq.b loc_0461d2
	addq.b #2,(7,a6)
	clr.b ($35,a6)
	clr.b ($3c,a6)
	movea.w ($38,a6),a4
	move.b #1,($2ca,a4)
	move.b #1,($258,a4)
	tst.w ($50,a4)
	bpl.b loc_04623e
	st.b ($3c,a6)

loc_04623e:
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$3b,d0
	jsr loc_02e7f2
	move.l #$20000,($40,a6)
	move.l #$40000,($44,a6)
	move.l #$0,($48,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_04627c
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_04627c:
	rts

;----------------------------------------------
loc_04627e:
	tst.b ($1e6,a6)
	beq.b loc_046298
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_046298
	clr.b ($1e6,a6)
	move.b #$18,($123,a5)

loc_046298:
	bsr.w loc_045a60
	tst.w ($44,a6)
	bpl.b loc_0462b4
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	moveq #$b,d0
	jmp loc_02a758

loc_0462b4:
	rts

;----------------------------------------------
loc_0462b6:
	tst.b ($1e6,a6)
	beq.b loc_0462d0
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_0462d0
	clr.b ($1e6,a6)
	move.b #$18,($123,a5)

loc_0462d0:
	bsr.w loc_045a60
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	blt.b loc_0462e4
	jmp loc_02a7ea

loc_0462e4:
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jsr loc_00369c
	moveq #$c,d0
	jmp loc_02a758

;----------------------------------------------
loc_046304:
	tst.b ($33,a6)
	bpl.w loc_0461d2
	moveq #0,d0
	move.b d0,($a9,a6)
	move.b d0,(7,a6)
	move.b d0,($1e6,a6)
	jmp loc_02bb26

;==============================================
;
;==============================================
loc_046320:
	move.b ($84,a6),d0
	move.w loc_04632c(pc,d0.w),d1
	jmp loc_04632c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04632c:
	dc.w loc_046330-loc_04632c
	dc.w loc_046362-loc_04632c

;----------------------------------------------
loc_046330:
	addq.b #2,($84,a6)
	clr.b ($5b,a6)
	jsr loc_02f53c
	jsr loc_02068c
	tst.b ($23c,a6)
	bne.b loc_046350
	jsr loc_0804da

loc_046350:
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.b #1,d0
	addi.b #$1d,d0
	jmp loc_02a758

;----------------------------------------------
loc_046362:
	move.b ($82,a6),d0
	move.w loc_04636e(pc,d0.w),d1
	jmp loc_04636e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04636e:
	dc.w loc_046374-loc_04636e
	dc.w loc_0463f6-loc_04636e
	dc.w loc_0464d6-loc_04636e

;==============================================
;Light
;==============================================
loc_046374:
	move.b (7,a6),d0
	move.w loc_046380(pc,d0.w),d1
	jmp loc_046380(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_046380:
	dc.w loc_046384-loc_046380
	dc.w loc_0463e0-loc_046380

;----------------------------------------------
loc_046384:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_0463b6
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	move.b #0,($25d,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_0463b0
	move.b #4,($25d,a6)

loc_0463b0:
	jmp loc_07601a

loc_0463b6:
	cmpi.b #2,d0
	beq.b loc_0463de
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_0463d4
	move.b #1,($ab,a6)

loc_0463d4:
	moveq #0,d0
	moveq #$54,d1
	jmp loc_082e36

loc_0463de:
	rts

;----------------------------------------------
loc_0463e0:
	tst.b ($33,a6)
	bpl.b loc_0463f0
	clr.b ($1e0,a6)
	jmp loc_02baf2

loc_0463f0:
	jmp loc_02a7ea

;==============================================
;Medium
;==============================================
loc_0463f6:
	move.b (7,a6),d0
	move.w loc_046402(pc,d0.w),d1
	jmp loc_046402(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_046402:
	dc.w loc_04640c-loc_046402
	dc.w loc_046436-loc_046402
	dc.w loc_046494-loc_046402
	dc.w loc_0464ac-loc_046402
	dc.w loc_0464c6-loc_046402

;----------------------------------------------
loc_04640c:
	addq.b #2,(7,a6)
	move.l #$30000,($40,a6)
	move.l #$2000,($48,a6)
	clr.l ($44,a6)
	clr.l ($4c,a6)
	tst.b ($b,a6)
	bne.b loc_046436
	neg.l ($40,a6)
	neg.l ($48,a6)

;----------------------------------------------
loc_046436:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_04646a
	addq.b #2,(7,a6)
	move.b #0,($25d,a6)
	moveq #0,d0
	move.b d0,($35,a6)
	move.b d0,($ab,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_046468
	move.b #8,($25d,a6)

loc_046468:
	rts

loc_04646a:
	cmpi.b #2,d0
	beq.b loc_046492
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_046488
	move.b #1,($ab,a6)

loc_046488:
	moveq #-$c,d0
	moveq #$3f,d1
	jmp loc_082e36

loc_046492:
	rts

;----------------------------------------------
loc_046494:
	bsr.w loc_045a60
	tst.b ($35,a6)
	beq.b loc_0464a6
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_0464a6:
	jmp loc_02a7ea

;----------------------------------------------
loc_0464ac:
	bsr.w loc_045a60
	tst.b ($35,a6)
	beq.b loc_0464c0
	addq.b #2,(7,a6)
	jsr loc_07601a

loc_0464c0:
	jmp loc_02a7ea

;----------------------------------------------
loc_0464c6:
	tst.b ($33,a6)
	bpl.b loc_0464c0
	clr.b ($1e0,a6)
	jmp loc_02baf2

;==============================================
;Heavy
;==============================================
loc_0464d6:
	move.b (7,a6),d0
	move.w loc_0464e2(pc,d0.w),d1
	jmp loc_0464e2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0464e2:
	dc.w loc_0464ea-loc_0464e2
	dc.w loc_04658e-loc_0464e2
	dc.w loc_0465ba-loc_0464e2
	dc.w loc_0465d4-loc_0464e2

;----------------------------------------------
loc_0464ea:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bpl.b loc_046564
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	move.b #0,($25d,a6)
	jsr loc_02fcd4
	tst.b ($3f,a6)
	bne.b loc_046516
	move.b #$e,($25d,a6)

loc_046516:
	jsr loc_01c1c8
	beq.w loc_04655e
	addq.b #1,(a4)
	move.b #$16,(2,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b #2,($72,a4)
	move.b #8,($bd,a4)
	move.b #1,($73,a4)
	move.b ($e,a6),($e,a4)
	move.w ($26,a6),($26,a4)
	move.l #$2001000,($6a,a4)
	move.w a6,($36,a4)

loc_04655e:
	jmp loc_097a3e

loc_046564:
	cmpi.b #2,d0
	beq.b loc_04658c
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_046582
	move.b #1,($ab,a6)

loc_046582:
	moveq #0,d0
	moveq #$54,d1
	jmp loc_082e36

loc_04658c:
	rts

;----------------------------------------------
loc_04658e:
	tst.b ($5b,a6)
	beq.b loc_0465a2
	clr.b ($5b,a6)
	movea.w ($38,a6),a4
	move.b #4,($5f,a4)

loc_0465a2:
	move.b ($35,a6),d0
	andi.b #$f,d0
	beq.b loc_0465b4
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_0465b4:
	jmp loc_02a7ea

;----------------------------------------------
loc_0465ba:
	move.b ($35,a6),d0
	andi.b #$f,d0
	beq.b loc_0465ce
	addq.b #2,(7,a6)
	jsr loc_07601a

loc_0465ce:
	jmp loc_02a7ea

;----------------------------------------------
loc_0465d4:
	tst.b ($33,a6)
	bpl.b loc_0465ce
	clr.b ($1e0,a6)
	jmp loc_02baf2

;==============================================
;
;==============================================
loc_0465e4:
	move.b (7,a6),d0
	move.w loc_0465f0(pc,d0.w),d1
	jmp loc_0465f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0465f0:
	dc.w loc_0465f4-loc_0465f0
	dc.w loc_046612-loc_0465f0

;----------------------------------------------
loc_0465f4:
	addq.b #2,(7,a6)
	jsr loc_02f53c
	jsr loc_02068c
	jsr loc_07954c
	moveq #$24,d0
	jmp loc_02a758

;----------------------------------------------
loc_046612:
	jsr loc_02a7ea
	move.b ($35,a6),d0
	bne.b loc_04662c
	addq.b #2,(7,a6)
	clr.b ($ab,a6)
	jmp loc_02baf2

loc_04662c:
	cmpi.b #2,d0
	beq.b loc_046654
	move.b #2,($35,a6)
	move.b #$ff,($ab,a6)
	tst.b ($3f,a6)
	beq.b loc_04664a
	move.b #1,($ab,a6)

loc_04664a:
	moveq #$e,d0
	moveq #$50,d1
	jmp loc_082e36

loc_046654:
	rts

;==============================================
;Taunt
;==============================================
loc_046656:
	move.b (7,a6),d0
	move.w loc_046662(pc,d0.w),d1
	jmp loc_046662(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_046662:
	dc.w loc_046666-loc_046662
	dc.w loc_046698-loc_046662

;----------------------------------------------
loc_046666:
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)
	move.b #1,($ce,a6)
	tst.b ($3e,a6)
	bne.b loc_04667e
	subq.b #1,(pl_taunt_count,a6)

loc_04667e:
	moveq #$13,d0
	btst.b #0,($80,a5)
	beq.b loc_04668a
	moveq #$1c,d0

loc_04668a:
	jsr loc_0038e4
	moveq #$16,d0
	jmp loc_02a758

;----------------------------------------------
loc_046698:
	tst.b ($33,a6)
	bpl.w loc_046d26
	clr.b ($ce,a6)
	jmp loc_02baf2

;==============================================
;Kick AC
;==============================================
loc_0466aa:
	move.b (7,a6),d0
	move.w loc_0466b6(pc,d0.w),d1
	jmp loc_0466b6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0466b6:
	dc.w loc_0466ba-loc_0466b6
	dc.w loc_0466d0-loc_0466b6

;----------------------------------------------
loc_0466ba:
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)
	jsr loc_080e8e
	moveq #$1c,d0
	jmp loc_02a758

;----------------------------------------------
loc_0466d0:
	tst.b ($33,a6)
	bpl.w loc_046d26
	jmp loc_02bb26

;==============================================
;Vism Activate
;==============================================
loc_0466de:
	move.b (7,a6),d0
	move.w loc_0466ea(pc,d0.w),d1
	jmp loc_0466ea(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0466ea:
	dc.w loc_0466f0-loc_0466ea
	dc.w loc_046710-loc_0466ea
	dc.w loc_046744-loc_0466ea

;----------------------------------------------
loc_0466f0:
	addq.b #2,(7,a6)
	jsr VShadowPalWrite
	jsr loc_02068c
	moveq #$2b,d0
	tst.b ($31,a6)
	beq.b loc_04670a
	moveq #$2f,d0

loc_04670a:
	jmp loc_02a708

;----------------------------------------------
loc_046710:
	tst.b ($34,a6)
	beq.b loc_04673e
	addq.b #2,(7,a6)
	move.b #$ff,($ab,a6)
	move.b #$1e,($3a,a6)
	moveq #$a,d0
	moveq #$50,d1
	tst.b ($31,a6)
	beq.b loc_046734
	moveq #-7,d0
	moveq #$50,d1

loc_046734:
	jsr loc_097cd6
	bsr.w loc_046d32

loc_04673e:
	jmp loc_02a7ea

;----------------------------------------------
loc_046744:
	subq.b #1,($3a,a6)
	bne.w loc_046d26
	tst.b ($31,a6)
	beq.b loc_04675a
	move.l #$2000602,(4,a6)

loc_04675a:
	jmp loc_02f796

;==============================================
;Soul Sprial
;==============================================
loc_046760:
	move.b (7,a6),d0
	move.w loc_04676c(pc,d0.w),d1
	jmp loc_04676c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_04676c:
	dc.w loc_046774-loc_04676c
	dc.w loc_0467fa-loc_04676c
	dc.w loc_046830-loc_04676c
	dc.w loc_04687c-loc_04676c

;----------------------------------------------
loc_046774:
	addq.b #2,(7,a6)
	move.b #1,($ce,a6)
	move.b #1,($216,a6)
	tst.b ($23c,a6)
	bne.b loc_046796
	clr.b ($216,a6)
	moveq #6,d0
	jsr loc_02ef6c

loc_046796:
	jsr loc_020674
	moveq #0,d0
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	move.b ($82,a6),d0
	lsl.w #2,d0
	move.l loc_0467e2(pc,d0.w),($40,a6)
	move.l loc_0467e2+4(pc,d0.w),($48,a6)
	tst.b ($b,a6)
	beq.b loc_0467c6
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_0467c6:
	moveq #$10,d1
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	move.b loc_0467de(pc,d0.w),($3a,a6)
	add.w d1,d0
	jmp loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0467de:
	dc.b $1e,$28,$32,$00

loc_0467e2:
	dc.l $fffe0000,$00002000
	dc.l $fffd0000,$00003000
	dc.l $fffb0000,$00005000

;----------------------------------------------
loc_0467fa:
	subq.b #1,($3a,a6)
	jsr loc_02a7ea
	jsr loc_0972ac
	move.b ($35,a6),d0
	bpl.b loc_046818
	addq.b #2,(7,a6)
	clr.b ($35,a6)

loc_046818:
	andi.w #$7f,d0
	beq.b loc_04682e
	tst.b ($b,a6)
	bne.b loc_046826
	neg.w d0

loc_046826:
	add.w d0,($10,a6)
	clr.b ($35,a6)

loc_04682e:
	rts

;----------------------------------------------
loc_046830:
	subq.b #1,($3a,a6)
	bpl.b loc_04684c
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($82,a6),d0
	lsr.w #1,d0
	moveq #$13,d1
	add.w d1,d0
	jmp loc_02a758

loc_04684c:
	bsr.w loc_045a60
	tst.w ($40,a6)
	bne.b loc_04685e
	clr.l ($40,a6)
	clr.l ($48,a6)

loc_04685e:
	tst.b ($35,a6)
	beq.b loc_046870
	clr.b ($ce,a6)
	jsr loc_02f6f8
	bra.b loc_046876

loc_046870:
	jsr loc_0972ac

loc_046876:
	jmp loc_02a7ea

;----------------------------------------------
loc_04687c:
	tst.b ($33,a6)
	bpl.b loc_04685e
	clr.w ($12,a6)
	jmp loc_02baf2

;##############################################
;
;##############################################
loc_04688c:
	cmpi.b #4,($80,a6)
	beq.w loc_046ae0
	move.b (7,a6),d0
	move.w loc_0468a8(pc,d0.w),d1
	jsr loc_0468a8(pc,d1.w)
	jmp loc_02fa36

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0468a8:
	dc.w loc_0468b6-loc_0468a8
	dc.w loc_0468d0-loc_0468a8
	dc.w loc_04693a-loc_0468a8
	dc.w loc_046948-loc_0468a8
	dc.w loc_04699e-loc_0468a8
	dc.w loc_046aa2-loc_0468a8
	dc.w loc_046ac8-loc_0468a8

;==============================================
loc_0468b6:
	addq.b #2,(7,a6)
	tst.b ($23c,a6)
	bne.b loc_0468c8
	moveq #3,d0
	jsr loc_02ef6c

loc_0468c8:
	moveq #$25,d0
	jmp loc_02a758

;==============================================
loc_0468d0:
	tst.b ($33,a6)
	bpl.w loc_046d26
	moveq #$34,d0
	jsr loc_02e3fe
	beq.b loc_04692e
	move.b #6,(7,a6)
	tst.b ($125,a6)
	beq.b loc_046908
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_04691c
	bra.b loc_046920

loc_046908:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_046920
	clr.b ($b,a6)
	btst #1,d0
	beq.b loc_046920

loc_04691c:
	addq.b #1,($b,a6)

loc_046920:
	jsr loc_00361c
	moveq #0,d0
	jmp loc_02a758

loc_04692e:
	addq.b #2,(7,a6)
	moveq #$26,d0
	jmp loc_02a758

;==============================================
loc_04693a:
	tst.b ($33,a6)
	bpl.w loc_046d26
	jmp loc_02baf2

;==============================================
loc_046948:
	tst.b ($33,a6)
	bpl.w loc_046d26
	jsr loc_01c2c8
	beq.w loc_046d26
	addq.b #1,(a4)
	move.w #$290c,(2,a4)
	move.b ($e,a6),($e,a4)
	move.w ($c,a6),($c,a4)
	move.l ($18,a6),($18,a4)
	move.w ($26,a6),($26,a4)
	move.w a6,($36,a4)
	move.w a4,($1e4,a6)
	addq.b #2,(7,a6)
	clr.w ($3a,a6)
	move.w #$3c,($ae,a6)
	jsr loc_003608
	moveq #1,d0
	jmp loc_02a758

;==============================================
loc_04699e:
	movea.w ($38,a6),a4
	movea.w ($1e4,a6),a3
	btst.b #1,($35,a3)
	beq.b loc_0469e4
	bclr.b #1,($35,a3)
	addq.b #1,($3a,a6)
	tst.b ($2ca,a4)
	beq.b loc_0469ce
	cmpi.b #1,($3a,a6)
	bne.b loc_0469ce
	moveq #$1b,d0
	jsr loc_0038e4

loc_0469ce:
	moveq #$36,d0
	jsr loc_02e970
	beq.b loc_0469e4
	moveq #$34,d0
	jsr loc_02e7f2
	bra.w loc_046a4e

loc_0469e4:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.b loc_046a1a
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_046a0e
	jsr loc_02ea7a
	beq.b loc_046a1a
	moveq #$34,d0
	jsr loc_02e7f2
	bra.w loc_046a4e

loc_046a0e:
	moveq #$35,d0
	jsr loc_02e7f2
	bra.w loc_046a4e

loc_046a1a:
	movea.w ($38,a6),a4
	move.b #0,($2a0,a4)
	movea.w ($1e4,a6),a3
	tst.b ($35,a3)
	beq.b loc_046a34
	move.b #$16,($2a0,a4)

loc_046a34:
	addq.w #1,($14,a4)
	addq.b #1,($3b,a6)
	btst.b #0,($3b,a6)
	beq.b loc_046a48
	subq.w #2,($14,a4)

loc_046a48:
	jmp loc_02a7ea

;----------------------------------------------
loc_046a4e:
	addq.b #2,(7,a6)
	move.b #1,($31,a6)
	movea.w ($1e4,a6),a3
	move.l #$4000000,(4,a3)
	move.w ($64,a4),($14,a4)
	move.b #0,($2a0,a4)
	moveq #0,d0
	move.l #$40000,($40,a6)
	move.l d0,($44,a6)
	move.l d0,($48,a6)
	move.l #$ffffa000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_046a94
	neg.l ($40,a6)

loc_046a94:
	eori.b #1,($b,a4)
	moveq #2,d0
	jmp loc_02a758

;==============================================
loc_046aa2:
	bsr.w loc_045a60
	move.w ($14,a6),d0
	cmp.w ($64,a6),d0
	bcc.w loc_046d26
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	moveq #3,d0
	jmp loc_02a758

;==============================================
loc_046ac8:
	tst.b ($33,a6)
	bpl.w loc_046d26
	eori.b #1,($b,a6)
	clr.b ($67,a6)
	jmp loc_02baf2

;==============================================
;Air Throws
;==============================================
loc_046ae0:
	move.b (7,a6),d0
	move.w loc_046af2(pc,d0.w),d1
	jsr loc_046af2(pc,d1.w)
	jmp loc_02f9be

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_046af2:
	dc.w loc_046b04-loc_046af2
	dc.w loc_046b1e-loc_046af2
	dc.w loc_046ba2-loc_046af2
	dc.w loc_046bb8-loc_046af2
	dc.w loc_046c5e-loc_046af2
	dc.w loc_046c98-loc_046af2
	dc.w loc_046cb6-loc_046af2
	dc.w loc_046d0a-loc_046af2

	dc.w loc_046ba2-loc_046af2

;----------------------------------------------
loc_046b04:
	addq.b #2,(7,a6)
	tst.b ($23c,a6)
	bne.b loc_046b16
	moveq #3,d0
	jsr loc_02ef6c

loc_046b16:
	moveq #$27,d0
	jmp loc_02a758

;----------------------------------------------
loc_046b1e:
	jsr loc_02aa08
	bcs.w loc_046d2c
	tst.b ($33,a6)
	bpl.w loc_046d26
	moveq #$3f,d0
	jsr loc_02e636
	beq.b loc_046b96
	move.b #6,(7,a6)
	tst.b ($125,a6)
	beq.b loc_046b60
	jsr loc_01bd5c
	clr.b ($b,a6)
	move.w ($10,a3),d0
	addi.w #$c0,d0
	cmp.w ($10,a6),d0
	bcs.b loc_046b74
	bra.b loc_046b78

loc_046b60:
	move.b ($11b,a6),d0
	andi.w #3,d0
	beq.b loc_046b78
	clr.b ($b,a6)
	btst #1,d0
	beq.b loc_046b78

loc_046b74:
	addq.b #1,($b,a6)

loc_046b78:
	move.b #2,($1e2,a6)
	clr.b ($3a,a6)
	move.b #$e,($3b,a6)
	move.w #$3c,($ae,a6)
	moveq #$29,d0
	jmp loc_02a758

loc_046b96:
	addq.b #2,(7,a6)
	moveq #$28,d0
	jmp loc_02a758

;----------------------------------------------
loc_046ba2:
	jsr loc_02aa08
	bcc.w loc_046d26
	jsr loc_00369c
	jmp loc_02baf2

;----------------------------------------------
loc_046bb8:
	movea.w ($38,a6),a4
	subq.b #1,($3b,a6)
	bpl.b loc_046bee
	move.b #$e,($3b,a6)
	addq.b #1,($3a,a6)
	tst.b ($2ca,a4)
	beq.b loc_046be2
	cmpi.b #1,($3a,a6)
	bne.b loc_046be2
	moveq #$1b,d0
	jsr loc_0038e4

loc_046be2:
	moveq #$41,d0
	jsr loc_02e970
	bne.w loc_046c42

loc_046bee:
	jsr loc_02ea06
	tst.b ($3a,a6)
	beq.b loc_046c10
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.w loc_046c42
	jsr loc_02ea7a
	bne.w loc_046c42

loc_046c10:
	movea.w ($38,a6),a4
	move.b #0,($2a0,a4)
	subq.b #1,($1e2,a6)
	bpl.b loc_046c2c
	move.b #2,($1e2,a6)
	move.b #$16,($2a0,a4)

loc_046c2c:
	addq.w #1,($14,a4)
	btst.b #0,($b4,a5)
	beq.b loc_046c3c
	subq.w #2,($14,a4)

loc_046c3c:
	jmp loc_02a7ea

loc_046c42:
	addq.b #2,(7,a6)
	movea.w ($38,a6),a4
	move.b #0,($2a0,a4)
	move.b #4,($3a,a6)
	moveq #$2a,d0
	jmp loc_02a758

;----------------------------------------------
loc_046c5e:
	subq.b #1,($3a,a6)
	bpl.b loc_046c96
	addq.b #2,(7,a6)
	move.l ($40,a6),d0
	asr.l #1,d0
	move.l d0,($40,a6)
	move.l ($48,a6),d0
	asr.l #1,d0
	move.l d0,($48,a6)
	move.l ($44,a6),d0
	asr.l #1,d0
	move.l d0,($44,a6)
	move.l ($4c,a6),d0
	asr.l #1,d0
	move.l d0,($4c,a6)
	jmp loc_02a7ea

loc_046c96:
	rts

;----------------------------------------------
loc_046c98:
	bsr.w loc_045a42
	tst.w ($44,a6)
	bmi.b loc_046caa
	tst.b ($33,a6)
	bpl.w loc_046d26

loc_046caa:
	addq.b #2,(7,a6)
	moveq #$a,d0
	jmp loc_02a758

;----------------------------------------------
loc_046cb6:
	bsr.w loc_045a42
	tst.b ($33,a6)
	bpl.w loc_046d26
	addq.b #2,(7,a6)
	moveq #$3f,d0
	movea.w ($38,a6),a4
	tst.b ($2ca,a4)
	beq.b loc_046cd4
	moveq #$40,d0

loc_046cd4:
	jsr loc_02e7f2
	move.l #$20000,($40,a6)
	move.l #$40000,($44,a6)
	move.l #$0,($48,a6)
	move.l #$ffffc000,($4c,a6)
	tst.b ($b,a6)
	bne.b loc_046d08
	neg.l ($40,a6)
	neg.l ($48,a6)

loc_046d08:
	rts

;----------------------------------------------
loc_046d0a:
	bsr.w loc_045a42
	tst.w ($44,a6)
	bpl.b loc_046d26
	addq.b #2,(7,a6)
	eori.b #1,($b,a6)
	moveq #$b,d0
	jmp loc_02a758

;==============================================
loc_046d26:
	jmp loc_02a7ea

;==============================================
loc_046d2c:
	jmp loc_02baf2

;==============================================
loc_046d32:
	moveq #0,d0
	moveq #0,d1
	movem.l d0-d1,($180,a6)
	movem.l d0-d1,($188,a6)
	movem.l d0-d1,($190,a6)
	movem.l d0-d1,($198,a6)
	movem.l d0-d1,($1a0,a6)
	movem.l d0-d1,($1a8,a6)
	movem.l d0-d1,($300,a6)
	movem.l d0-d1,($308,a6)
	movem.l d0-d1,($310,a6)
	movem.l d0-d1,($1b0,a6)
	rts

;##############################################
;
;##############################################
loc_046d74:
	dc.w loc_046dba-loc_046d74
	dc.w loc_046dba-loc_046d74
	dc.w loc_046d7a-loc_046d74

loc_046d7a:
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$09,$0b,$09,$0b
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $09,$0b,$09,$0b,$09,$0b,$09,$0b
	dc.b $09,$0b,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02

loc_046dba:
	dc.b $08,$0a,$08,$0a,$08,$0a,$08,$0a
	dc.b $08,$0a,$02,$02,$08,$0a,$08,$0a
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $08,$0a,$08,$0a,$07,$09,$08,$0a
	dc.b $07,$09,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$02,$02
